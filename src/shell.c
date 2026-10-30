#include <errno.h>
#include <stdarg.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "shell.h"

#define NO_JOYSTICK 0x00000008
#define FILELOAD_IFPRESENT 0x00000001

typedef struct
{
    uint16 old_sel;
    uint32 old_off;
    uint16 old_real_seg;
    uint16 old_real_off;
    sint16 installed;
    uint16 number;
    void **data;
    uint8 *real_code;
    void (*init)(void);
    void (*handler)(void);
    uint16 handler_sel;
    uint16 data_size;
    uint8 *real_code_end;
} INTERRUPT;

typedef struct
{
    uint32 signature;
    uint16 version;
    uint32 oem;
    uint32 capabilities;
    uint32 modes;
} VESAINFO;

typedef struct
{
    int mode;
    int width;
    int height;
    int depth;
    int aspect;
    int available;
} VIDEOMODE;

extern void (*int_func)(void);
extern SETUP *gamedata;
extern uint32 shell_flags;
extern uint8 old_video_mode;
extern uint8 old_text_rows;
extern void *dos_buffer;
extern int joy_found;
extern int joy_failed;
extern uint32 joy_mask;
extern char txt_col;
extern uint32 timer_handle;
extern INTERRUPT interrupts[3];
typedef struct
{
    uint32 old_pmoff;
    uint16 old_pmseg;
    uint32 clock;
    uint16 vbl_count;
    uint16 timer;
    uint16 vbl_overflow;
    uint16 vbl_max;
    uint8 palette[256 * 3];
    uint8 temp_pal[256 * 3];
    void *pal_ptr;
    uint32 fade_cnt;
    uint32 fade_dec;
    uint8 fade_flag;
    uint8 pal_flag;
} TODSTUFF;

extern volatile TODSTUFF toddata;
extern VESAINFO vesa_info;
extern uint8 vesa_mode_info[256];
extern VIDEOMODE video_modes[24];
extern int video_depth;
extern int video_aspect;
extern uint16 bank_cnt;
extern uint8 *txt_screen;
extern int txt_width;
extern int txt_pitch;
extern sint16 mbuttons;

void FadeTick(void);
uint8 VgaGetMode(void);
uint8 VgaGetRows(void);
void VgaGetFont(uint8 *font);
#pragma aux VgaGetFont parm [edi] modify exact [];
void VgaSetFont(uint8 *font);
#pragma aux VgaSetFont parm [esi] modify exact [];
void ScreenWaitVbl(void);
uint32 sosTIMERInitSystem(uint32 rate, uint32 debug);
uint32 sosTIMERRegisterEvent(uint32 rate, void (*event)(void), uint32 *handle);
void SoundInit(uint32 flags);
void CDInit(void);
void *MemAllocReal(uint32 size);
void VesaDetectModes(void);
void InterruptSet(int on, int which);
int JoyReadAxes(uint32 mask);
void JoyDetect(void);
void JoySetCentre(void);
int VesaBiosGetInfo(VESAINFO *info);
#pragma aux VesaBiosGetInfo parm [edi] modify [eax edi];
void VesaBiosGetModeInfo(uint8 *info, int mode);
#pragma aux VesaBiosGetModeInfo parm [edi] [ecx] modify [eax ecx edi];
int VesaBiosSetMode(int mode);
uint16 MouseInit(void);
void MouseRead(void);
void SoundExit(void);
uint32 sosTIMERRemoveEvent(uint32 handle);
uint32 sosTIMERUninitSystem(uint32 debug);
void CDFree(void);
void MemFreeReal(void *mem);
void VgaSetMode(uint8 mode);
void VgaSetRows(uint8 rows);
void TimeRestore(void);
void ShellExitRealMemErr(void);
#pragma aux ShellExitRealMemErr aborts;
void ShellExitErrno(char *szFormat, ...);
#pragma aux ShellExitErrno aborts;
void ShellExitMemErr(void);
#pragma aux ShellExitMemErr aborts;

void TimerTick(void)
{
    ++clock_ticks;
    FadeTick();
    if (int_func)
        int_func();
}

void ShellInit(SETUP *pSetup, uint32 dwFlags)
{
    uint8 *font;
    uint8 *p;
    int i;

    gamedata = pSetup;
    shell_flags = dwFlags;
    pSetup->scrn_ptr = NULL;
    old_video_mode = VgaGetMode();
    if (old_video_mode == 3)
        old_text_rows = VgaGetRows();
    sosTIMERInitSystem(0xff00, 0);
    SoundInit(dwFlags);
    if (dwFlags & CD_ON)
        CDInit();
    if (old_video_mode == 3)
    {
        font = malloc(0x1000);
        VgaGetFont(font);
        for (i = 0; i < 8; i++)
        {
            for (p = font; p < font + 0x1000;)
            {
                *p++ <<= 1;
                *p++ >>= 1;
            }
            ScreenWaitVbl();
            ScreenWaitVbl();
            ScreenWaitVbl();
            VgaSetFont(font);
        }
        free(font);
    }
    dos_buffer = MemAllocReal(0x100);
    VesaDetectModes();
    SwitchVideoMode(pSetup);
    InterruptSet(1, 0);
    InterruptSet(1, 1);
    InterruptSet(1, 2);
    if (!(dwFlags & NO_JOYSTICK))
    {
        JoyDetect();
        JoySetCentre();
    }
    else
        joy_found = 0;
    txt_col = 1;
    old_clock_ticks = 0;
    clock_ticks = 0;
    int_func = NULL;
    sosTIMERRegisterEvent(60, TimerTick, &timer_handle);
}

void ShellCleanup(void)
{
    uint16 flags;

    if (interrupts[2].installed)
    {
        flags = *(uint16 *)0x417 & 0x8f0;
        if (rawkey(K_RSHIFT))
            flags |= 0x1;
        if (rawkey(K_LSHIFT))
            flags |= 0x2;
        if (rawkey(K_LCTRL) || rawkey(K_RCTRL))
            flags |= 0x4;
        if (rawkey(K_LALT) || rawkey(K_RALT))
            flags |= 0x8;
        if (rawkey(K_LCTRL))
            flags |= 0x100;
        if (rawkey(K_LALT))
            flags |= 0x200;
        if (rawkey(K_SYSREQ))
            flags |= 0x400;
        if (rawkey(K_SCRLOCK))
            flags |= 0x1000;
        if (rawkey(K_NUMLOCK))
            flags |= 0x2000;
        if (rawkey(K_CAPS))
            flags |= 0x4000;
        if (rawkey(K_INSERT))
            flags |= 0x8000;
        *(uint16 *)0x417 = flags;
    }
    SoundExit();
    if (timer_handle != -1)
        sosTIMERRemoveEvent(timer_handle);
    sosTIMERUninitSystem(0);
    CDFree();
    InterruptSet(0, 0);
    InterruptSet(0, 1);
    InterruptSet(0, 2);
    if (dos_buffer)
        MemFreeReal(dos_buffer);
    if (old_video_mode == 3)
        VgaSetRows(old_text_rows);
    else
        VgaSetMode(old_video_mode);
    TimeRestore();
}

void ShellExitRealMemErr(void)
{
    ShellExit("Cannot allocate Real Mode buffer");
}

void ShellExit(char *szFormat, ...)
{
    va_list args;

    ShellCleanup();
    fflush(stdout);
    va_start(args, szFormat);
    vfprintf(stderr, szFormat, args);
    va_end(args);
    fputc('\n', stderr);
    exit(0);
}

uint8 *FileLoad(char *name, void *where, uint32 flags)
{
    FILE *fp;
    int len;

    fp = fopen(name, "rb");
    if (fp == NULL)
    {
        if (flags & FILELOAD_IFPRESENT)
            return NULL;
        ShellExitErrno("Cannot find file '%s'", name);
    }
    if (fseek(fp, 0, SEEK_END) || (len = ftell(fp)) == -1 || fseek(fp, 0, SEEK_SET))
        ShellExitErrno("File '%s'", name);
    if (where == NULL)
    {
        where = malloc(len);
        if (where == NULL)
            ShellExitMemErr();
    }
    if (fread(where, len, 1, fp) != 1 || fclose(fp))
        ShellExitErrno("File '%s'", name);
    file_len = len;
    return where;
}

void FileSave(char *name, void *where, uint32 bytes)
{
    FILE *fp;

    if (where == NULL)
        return;
    TimeRestore();
    fp = fopen(name, "wb");
    if (fp == NULL || fwrite(where, bytes, 1, fp) != 1 || fclose(fp))
        ShellExitErrno("File '%s':", name);
}

uint32 FileSize(char *name)
{
    FILE *fp;
    uint32 size;

    fp = fopen(name, "rb");
    if (fp == NULL || fseek(fp, 0, SEEK_END))
        return -1;
    size = ftell(fp);
    fclose(fp);
    return size;
}

void FadeToPal(uint32 count, uint8 *pal)
{
    if (!toddata.pal_flag)
        memcpy((void *)toddata.palette, (void *)toddata.temp_pal, sizeof(toddata.temp_pal));
    toddata.pal_ptr = pal;
    toddata.fade_dec = 0x3f00 / count;
    toddata.fade_cnt = 0x3f00;
    toddata.fade_flag = 1;
}

void FadeWait(void)
{
    while (toddata.fade_flag)
        ;
}

int VesaHasMode(uint16 mode)
{
    uint16 *p;

    p = (uint16 *)(((vesa_info.modes >> 12) & 0xffff0) + (vesa_info.modes & 0xffff));
    while (*p != 0xffff)
    {
        if (*p++ == mode)
            return 1;
    }
    return 0;
}

int VesaSetMode(uint16 mode)
{
    if (VesaBiosGetInfo(&vesa_info) != 0x4f || vesa_info.signature != 0x41534556 || !VesaHasMode(mode))
        return 0;
    VesaBiosGetModeInfo(vesa_mode_info, mode);
    return VesaBiosSetMode(mode);
}

void VesaDetectModes(void)
{
    uint16 *p;
    uint16 mode;
    int i;

    if (VesaBiosGetInfo(&vesa_info) != 0x4f || vesa_info.signature != 0x41534556 || !vesa_info.modes)
        return;
    p = (uint16 *)(((vesa_info.modes >> 12) & 0xffff0) + (vesa_info.modes & 0xffff));
    while (*p != 0xffff)
    {
        mode = *p++;
        for (i = 0; i < 24; i++)
        {
            if (video_modes[i].mode == mode)
            {
                video_modes[i].available = 1;
                break;
            }
        }
    }
}

int SwitchVideoMode(SETUP *pSetup)
{
    uint16 mode;
    int failed;
    int i;

    video_depth = 1;
    video_aspect = 0x4169;
    failed = 0;
    mode = 0x13;
    if (pSetup->sc_width <= 320)
        VgaSetMode(mode);
    else
    {
        failed = 1;
        i = pSetup->col_mode * 6;
        if (i <= 18)
        {
            for (;; i++)
            {
                if (!video_modes[i].width)
                    break;
                if (pSetup->sc_width == video_modes[i].width && pSetup->sc_height == video_modes[i].height && video_modes[i].available)
                {
                    mode = video_modes[i].mode;
                    failed = 0;
                    break;
                }
            }
        }
        if (mode == 0x13)
        {
            VgaSetMode(mode);
            pSetup->sc_width = 320;
            pSetup->sc_height = 200;
            pSetup->col_mode = 0;
        }
        else if (!VesaSetMode(mode))
        {
            mode = 0x13;
            VgaSetMode(mode);
            pSetup->sc_width = 320;
            pSetup->sc_height = 200;
            failed = 1;
            pSetup->col_mode = 0;
        }
        else
        {
            video_depth = video_modes[i].depth;
            video_aspect = video_modes[i].aspect;
            bank_cnt = 64 / *(uint16 *)(vesa_mode_info + 4);
        }
    }
    if (pSetup->scrn_ptr == NULL)
        pSetup->scrn_ptr = malloc(640 * 480);
    ScreenClear();
    if (mode != 0x13)
        pSetup->col_mode++;
    txt_screen = pSetup->scrn_ptr;
    txt_width = pSetup->sc_width;
    txt_pitch = txt_width * 8;
    if (shell_flags & NO_MOUSE)
        mbuttons = 0;
    else
    {
        mbuttons = MouseInit();
        MouseRead();
    }
    pSetup->dump_y = 0;
    pSetup->dump_x = pSetup->dump_y;
    pSetup->dump_width = pSetup->sc_width;
    pSetup->dump_height = pSetup->sc_height;
    return failed;
}

void JoyDetect(void)
{
    uint32 i;

    for (i = 1; i != 16; i <<= 1)
    {
        if (JoyReadAxes(i))
            joy_mask |= i;
    }
    joy_found = (joy_mask & 3) == 3;
    joy_failed = 0;
}

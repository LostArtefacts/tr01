#include <errno.h>
#include <i86.h>
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
    void (__far *handler)(void);  /* 16:32, the loader fills in the selector */
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
    uint16 memory;
    uint8 reserved[244];
} VESAINFO;

typedef struct
{
    uint8 ctrl_break;
} BRKSTUFF;

typedef struct
{
    uint8 crit_err;
} CRITSTUFF;

typedef struct
{
    int mode;
    int width;
    int height;
    int depth;
    int aspect;
    int available;
} VIDEOMODE;

typedef struct
{
    uint16 selector;
    uint16 segment;
    uint32 size;
} REALBLOCK;

extern void (*int_func)(void);
extern SETUP *gamedata;
extern uint32 shell_flags;
extern uint8 old_video_mode;
extern uint8 old_text_rows;
extern void *dos_buffer;
extern int joy_found;
extern int joy_failed;
extern char txt_col;
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

extern int video_depth;
extern int video_aspect;
extern uint16 bank_cnt;
extern uint8 *txt_screen;
extern int txt_width;
extern int txt_pitch;
extern sint16 mbuttons;
extern volatile sint16 joy_x_raw;
extern volatile sint16 joy_y_raw;
extern volatile sint16 joy_z_raw;
extern volatile sint16 joy_r_raw;
extern int joy_x;
extern int joy_y;
extern int joy_z;
extern volatile BRKSTUFF *brkdata;
extern volatile CRITSTUFF *critdata;
extern uint8 key_real_code[];
extern uint8 key_real_code_end[];

void KeyHandler(void);
void BreakHandler(void);
void CritHandler(void);

int file_len = 0;
volatile TODSTUFF toddata = {0};
int joy1_x = 0;
int joy1_y = 0;
int joy_hat = 4;
int joy_throttle = 0;
uint32 joy_x_min = 1024;
uint32 joy_x_max = 0;
uint32 joy_x_centre = 0;
uint32 joy_y_min = 1024;
uint32 joy_y_max = 0;
uint32 joy_y_centre = 0;
int joy_x_old = 0;
int joy_y_old = 0;
uint32 joy_z_min = 1024;
uint32 joy_z_max = 0;
uint32 joy_z_centre = 0;
uint32 joy_r_min = 1024;
uint32 joy_r_max = 0;
uint32 joy_r_centre = 0;
int joy_z_old = 0;
uint32 joy_mask = 0;
uint32 timer_handle = -1;
VIDEOMODE video_modes[24] = {
    {0x100, 640, 400, 1, 0x4169, 0},
    {0x101, 640, 480, 1, 0x4ce6, 0},
    {0x103, 800, 600, 1, 0x525e, 0},
    {0x105, 1024, 768, 1, 0x3559, 0},
    {0x107, 1280, 1024, 1, 0x3559, 0},
    {0, 0, 0, 0, 0, 0},
    {0x10d, 320, 200, 2, 0x4c82, 0},
    {0x110, 640, 480, 2, 0x4ce6, 0},
    {0x113, 800, 600, 2, 0x525e, 0},
    {0x116, 1024, 768, 2, 0x3559, 0},
    {0x119, 1280, 1024, 2, 0x3559, 0},
    {0, 0, 0, 0, 0, 0},
    {0x10e, 320, 200, 2, 0x4c82, 0},
    {0x111, 640, 480, 2, 0x4ce6, 0},
    {0x114, 800, 600, 2, 0x525e, 0},
    {0x117, 1024, 768, 2, 0x3559, 0},
    {0x11a, 1280, 1024, 2, 0x3559, 0},
    {0, 0, 0, 0, 0, 0},
    {0x10f, 320, 200, 3, 0x4c82, 0},
    {0x112, 640, 480, 3, 0x4ce6, 0},
    {0x115, 800, 600, 3, 0x525e, 0},
    {0x118, 1024, 768, 3, 0x3559, 0},
    {0x11b, 1280, 1024, 3, 0x3559, 0},
    {0, 0, 0, 0, 0, 0}
};
VESAINFO vesa_info = {0};
uint8 vesa_mode_info[248] = {0};
REALBLOCK real_blocks[32] = {0};
INTERRUPT interrupts[3] = {
    {0, 0, 0, 0, 0, 0x23, (void **)&brkdata, NULL, NULL, (void (__far *)(void))BreakHandler, 16, NULL},
    {0, 0, 0, 0, 0, 0x24, (void **)&critdata, NULL, NULL, (void (__far *)(void))CritHandler, 16, NULL},
    {0, 0, 0, 0, 0, 9, (void **)&keydata, key_real_code, NULL, (void (__far *)(void))KeyHandler, 336, key_real_code_end}
};

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
void InterruptSet(int on, uint32 which);
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

void ShellExitErrno(char *szFormat, ...)
{
    va_list args;
    int err;

    err = errno;
    ShellCleanup();
    fflush(stdout);
    va_start(args, szFormat);
    vfprintf(stderr, szFormat, args);
    va_end(args);
    fprintf(stderr, ":%s\n", strerror(err));
    exit(0);
}

void ShellExitMemErr(void)
{
    ShellExit("Out of memory.");
}

void ShellExitRealMemErr(void)
{
    ShellExit("Cannot allocate Real Mode buffer");
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

void KeyClearBuffer(void)
{
    keydata->bufchars = keydata->bufin = keydata->bufout = 0;
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

void JoySetCentre(void)
{
    int r;
    int x;
    int y;
    int z;
    int i;

    if (!joy_found)
        joy_x_centre = joy_y_centre = joy_z_centre = joy_r_centre = 0;
    else
    {
        x = y = z = r = 0;
        for (i = 0; i < 256; i++)
        {
            JoyReadAxes(joy_mask);
            x += joy_x_raw;
            y += joy_y_raw;
            z += joy_z_raw;
            r += joy_r_raw;
        }
        joy_x_centre = x >> 8;
        joy_y_centre = y >> 8;
        joy_z_centre = z >> 8;
        joy_r_centre = r >> 8;
    }
}

void JoyRead(void)
{
    int range;
    int delta;

    joy_throttle = 0;
    joy_fire = 0;
    joy1_y = 0;
    joy1_x = 0;
    joy_hat = 4;
    if (!joy_mask)
        return;
    if (!JoyReadAxes(joy_mask))
        joy_failed = 1;
    if (joy_mask & 1)
    {
        if (joy_x_raw < joy_x_min)
            joy_x_min = joy_x_raw;
        if (joy_x_raw > joy_x_max)
            joy_x_max = joy_x_raw;
        if (joy_x_raw > joy_x_centre)
            range = joy_x_max - joy_x_centre;
        else
            range = joy_x_centre - joy_x_min;
        delta = joy_x_raw - joy_x_centre;
        range >>= 5;
        if (range)
            joy_x = delta / range;
        joy1_x = (joy_x + joy_x_old) / 2;
        joy_x_old = joy_x;
    }
    if (joy_mask & 2)
    {
        if (joy_y_raw < joy_y_min)
            joy_y_min = joy_y_raw;
        if (joy_y_raw > joy_y_max)
            joy_y_max = joy_y_raw;
        if (joy_y_raw > joy_y_centre)
            range = joy_y_max - joy_y_centre;
        else
            range = joy_y_centre - joy_y_min;
        delta = joy_y_raw - joy_y_centre;
        range >>= 5;
        if (range)
            joy_y = delta / range;
        joy1_y = (joy_y + joy_y_old) / 2;
        joy_y_old = joy_y;
    }
    if (joy_mask & 4)
    {
        if (joy_z_raw < joy_z_min)
            joy_z_min = joy_z_raw;
        if (joy_z_raw > joy_z_max)
            joy_z_max = joy_z_raw;
        if (joy_z_raw > joy_z_centre)
            range = joy_z_max - joy_z_centre;
        else
            range = joy_z_centre - joy_z_min;
        delta = joy_z_raw - joy_z_centre;
        range >>= 5;
        if (range)
            joy_z = delta / range;
        joy_throttle = (joy_z + joy_z_old) / 2;
        joy_z_old = joy_z;
    }
    if (joy_mask & 8)
    {
        if (joy_r_raw < joy_r_min)
            joy_r_min = joy_r_raw;
        if (joy_r_raw > joy_r_max)
            joy_r_max = joy_r_raw;
        if (joy_r_max - joy_r_min)
        {
            joy_hat = ((joy_r_raw - joy_r_min) * 8 / (joy_r_max - joy_r_min) + 1) >> 1;
            if (joy_hat < 0 || joy_hat > 4)
                joy_hat = 4;
        }
    }
}

void *MemAllocReal(uint32 size)
{
    union REGS regs;
    int i;

    regs.x.eax = 0x100;
    regs.x.ebx = (size + 15) >> 4;
    int386(0x31, &regs, &regs);
    if (regs.x.cflag)
        ShellExitRealMemErr();
    for (i = 0; i < 32; i++)
    {
        if (!real_blocks[i].selector)
            break;
    }
    if (i >= 32)
        ShellExitRealMemErr();
    real_blocks[i].selector = regs.x.edx;
    real_blocks[i].segment = regs.x.eax;
    real_blocks[i].size = size;
    return (void *)((regs.x.eax & 0xffff) << 4);
}

void MemFreeReal(void *mem)
{
    union REGS regs;
    uint16 segment;
    int i;

    segment = (uint32)mem >> 4;
    for (i = 0; i < 32; i++)
    {
        if (real_blocks[i].segment == segment)
            break;
    }
    if (i < 32)
    {
        regs.x.eax = 0x101;
        regs.x.edx = real_blocks[i].selector;
        int386(0x31, &regs, &regs);
        if (!regs.x.cflag)
        {
            real_blocks[i].segment = 0;
            real_blocks[i].selector = 0;
            real_blocks[i].size = 0;
        }
    }
}

void InterruptSet(int on, uint32 which)
{
    union REGS regs;
    struct SREGS sregs;
    uint8 *mem;
    uint16 size;
    INTERRUPT *e;

    e = (INTERRUPT *)(which * sizeof(INTERRUPT) + (uint32)&interrupts);
    if (on == 1)
    {
        if (e->installed)
            return;
        memset(&regs, 0, sizeof(regs));
        memset(&sregs, 0, sizeof(sregs));
        regs.x.eax = e->number + 0x3500;
        int386x(0x21, &regs, &regs, &sregs);
        e->old_sel = sregs.es;
        e->old_off = regs.x.ebx;
        if (e->real_code)
        {
            memset(&regs, 0, sizeof(regs));
            memset(&sregs, 0, sizeof(sregs));
            regs.x.eax = 0x200;
            regs.h.bl = e->number;
            int386(0x31, &regs, &regs);
            e->old_real_seg = regs.x.ecx;
            e->old_real_off = regs.x.edx;
            size = e->real_code_end - e->real_code;
            mem = MemAllocReal(size);
            if (mem == NULL)
                ShellExitRealMemErr();
            memcpy(mem, e->real_code, size);
        }
        else
            mem = malloc(e->data_size);
        *e->data = mem;
        memset(mem, 0, e->data_size);
        if (e->init)
            e->init();
        memset(&regs, 0, sizeof(regs));
        memset(&sregs, 0, sizeof(sregs));
        regs.x.eax = e->number + 0x2500;
        sregs.ds = FP_SEG(e->handler);
        regs.x.edx = FP_OFF(e->handler);
        int386x(0x21, &regs, &regs, &sregs);
        if (e->real_code)
        {
            memset(&regs, 0, sizeof(regs));
            memset(&sregs, 0, sizeof(sregs));
            regs.x.eax = 0x201;
            regs.h.bl = e->number;
            regs.x.ecx = (uint16)((int)(mem + e->data_size) >> 4);
            regs.x.edx = (int)(mem + e->data_size) & 0xf;
            int386x(0x31, &regs, &regs, &sregs);
        }
        e->installed = 1;
    }
    else if (on == 0 && e->installed)
    {
        e->installed = 0;
        memset(&regs, 0, sizeof(regs));
        memset(&sregs, 0, sizeof(sregs));
        regs.x.eax = e->number + 0x2500;
        regs.x.edx = e->old_off;
        sregs.ds = e->old_sel;
        int386x(0x21, &regs, &regs, &sregs);
        if (e->real_code)
        {
            memset(&regs, 0, sizeof(regs));
            memset(&sregs, 0, sizeof(sregs));
            regs.x.eax = 0x201;
            regs.h.bl = e->number;
            regs.x.ecx = e->old_real_seg;
            regs.x.edx = e->old_real_off;
            int386(0x31, &regs, &regs);
            MemFreeReal(*e->data);
        }
        else
            free(*e->data);
    }
}

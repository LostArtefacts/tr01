#include <stdlib.h>
#include "shell.h"

#define NO_JOYSTICK 0x00000008

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

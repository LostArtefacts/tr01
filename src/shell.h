#ifndef SHELL_H
#define SHELL_H

#include "types.h"

typedef struct
{
    short sc_width, sc_height;
    short mx_sense, my_sense, ms_dthresh;
    void *scrn_ptr;
    short col_mode;
    short dump_x, dump_y, dump_width, dump_height;
} SETUP;

extern SETUP game_setup;

#define NO_MIDI 0x00000001
#define NO_DIGI 0x00000002
#define NO_SOS (NO_MIDI | NO_DIGI)
#define CD_ON 0x00000004
#define NO_MOUSE 0x00000010

#define SIZE_KEYMAP 256
#define SIZE_KEYBUF 64

typedef struct
{
    uint8 keymap[SIZE_KEYMAP];
    uint8 keybuf[SIZE_KEYBUF];
    uint8 bufin;
    uint8 bufout;
    uint8 bufchars;
    uint8 extended;
    uint8 last_key;
    uint8 keys_held;
} KEYSTUFF;

extern KEYSTUFF *keydata;
extern uint8 joy_fire;
extern int joy1_x;
extern int joy1_y;

enum key_codes
{
    K_ESC = 0x01,
    K_RET = 0x1c,
    K_LCTRL = 0x1d,
    K_LSHIFT = 0x2a,
    K_RSHIFT = 0x36,
    K_LALT = 0x38,
    K_SPACE = 0x39,
    K_CAPS = 0x3a,
    K_F1 = 0x3b,
    K_F2 = 0x3c,
    K_F3 = 0x3d,
    K_F4 = 0x3e,
    K_F5 = 0x3f,
    K_F6 = 0x40,
    K_NUMLOCK = 0x45,
    K_SCRLOCK = 0x46,
    K_NUMHOME = 0x47,
    K_NUMUP = 0x48,
    K_NUMPGUP = 0x49,
    K_NUMLEFT = 0x4b,
    K_NUM5 = 0x4c,
    K_NUMRIGHT = 0x4d,
    K_NUMPLUS = 0x4e,
    K_NUMEND = 0x4f,
    K_NUMDOWN = 0x50,
    K_NUMPGDN = 0x51,
    K_NUM0 = 0x52,
    K_NUMDEL = 0x53,
    K_SYSREQ = 0x54,
    K_NUMENTER = 0x9c,
    K_RCTRL = 0x9d,
    K_RALT = 0xb8,
    K_UP = 0xc8,
    K_LEFT = 0xcb,
    K_RIGHT = 0xcd,
    K_END = 0xcf,
    K_DOWN = 0xd0,
    K_PGDN = 0xd1,
    K_INSERT = 0xd2,
    K_DELETE = 0xd3
};
#define rawkey(k) (keydata->keymap[k])
extern int file_len;

extern volatile sint32 clock_ticks;
extern sint32 old_clock_ticks;

sint32 Sync(void);
#pragma aux Sync = \
    "mov eax, clock_ticks" \
    "mov ebx, old_clock_ticks" \
    "mov old_clock_ticks, eax" \
    "sub eax, ebx" \
    value [eax] \
    modify [ebx];

void CDLoop(void);
uint8 *FileLoad(char *name, void *where, uint32 flags);
int SwitchVideoMode(SETUP *pSetup);
void ScreenClear(void);
void ScreenDump(void);
void ScreenPartialDump(void);
void TempVideoRemove(void);
void FadeToPal(uint32 count, uint8 *pal);
void FadeWait(void);
void JoyRead(void);
void ShellInit(SETUP *pSetup, uint32 dwFlags);
void ShellExit(char *szFormat, ...);
#pragma aux ShellExit aborts;
uint32 SoundGetSOSHandle(void);
uint32 SoundGetSOSDriver(void);

#endif

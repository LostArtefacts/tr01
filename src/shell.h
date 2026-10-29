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
extern int file_len;

extern sint32 clock_ticks;
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
void ScreenClear(void);
void ScreenPartialDump(void);
void TempVideoRemove(void);
void FadeToPal(int count, uint8 *pal);

#endif

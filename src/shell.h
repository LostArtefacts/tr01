#ifndef SHELL_H
#define SHELL_H

#include "types.h"

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

void ScreenClear(void);
void ScreenPartialDump(void);
void TempVideoRemove(void);
void FadeToPal(int count, uint8 *pal);

#endif

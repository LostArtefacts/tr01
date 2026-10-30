#include "shell.h"

extern void (*int_func)(void);

void FadeTick(void);

void TimerTick(void)
{
    ++clock_ticks;
    FadeTick();
    if (int_func)
        int_func();
}

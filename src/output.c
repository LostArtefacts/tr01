#include "game.h"
#include "shell.h"
#include "3dglodef.h"

extern uint8 game_palette[256 * 3];

void S_InitialisePolyList(void)
{
    phd_InitPolyList();
}

sint32 S_DumpScreen(void)
{
    sint32 nframes;

    nframes = Sync();
    while (nframes < 2)
    {
        while (!Sync())
            ;
        nframes++;
    }
    ScreenPartialDump();
    return nframes;
}

void S_ClearScreen(void)
{
    ScreenClear();
}

void S_InitialiseScreen(void)
{
    if (CurrentLevel != TITLE)
        TempVideoRemove();
    FadeToPal(60, game_palette);
}

void S_OutputPolyList(void)
{
    phd_SortPolyList();
    phd_PrintPolyList();
}

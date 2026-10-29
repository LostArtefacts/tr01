#include <stdlib.h>
#include "game.h"

int game_hires = 0;
double screen_sizer = 1.0, game_sizer = 1.0;
char *bckscrn = NULL;
static int bckscrnsize = 0;
static int fade_value = 16 << 16;
static int fade_limit = 16 << 16;
static int fade_adder = 32768;
int mode_lock = 0;

void IncreaseScreenSize(void)
{
    screen_sizer += 0.08;
    if (screen_sizer > 1.0)
        screen_sizer = 1.0;

    game_sizer = screen_sizer;

    setup_screen_size();
    ScreenClear();
    ScreenDump();
}

void DecreaseScreenSize(void)
{
    screen_sizer -= 0.08;
    if (screen_sizer < 0.44)
        screen_sizer = 0.44;

    game_sizer = screen_sizer;

    setup_screen_size();
    ScreenClear();
    ScreenDump();
}

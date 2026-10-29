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

void setup_screen_size(void)
{
    int xoff, yoff;
    int wwidth, wheight;

    wwidth = (int)(game_setup.sc_width * screen_sizer);
    wheight = (int)(game_setup.sc_height * screen_sizer);
    xoff = (game_setup.sc_width - wwidth) / 2;
    yoff = (game_setup.sc_height - wheight) / 2;

    phd_InitWindow(xoff, yoff, wwidth, wheight, 10, DPQ_END, GAME_FOV, game_setup.sc_width, game_setup.sc_height, (uint8 *)game_setup.scrn_ptr);

    game_setup.dump_x = (short)xoff;
    game_setup.dump_y = (short)yoff;
    game_setup.dump_width = (short)wwidth;
    game_setup.dump_height = (short)wheight;

    if (!bckscrnsize)
    {
        bckscrnsize = 640 * 480;
        bckscrn = (char *)malloc(640 * 480);
        if (!bckscrn)
            S_ExitSystem("ERROR: Could not allocate enough memory to run (0)");
    }
}

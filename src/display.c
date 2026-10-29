#include <string.h>
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

void switch_resolution(void)
{
    if (hires_flag)
    {
        hires_flag = 0;
        game_setup.sc_width = 320;
        game_setup.sc_height = 200;
    }
    else
    {
        hires_flag = 1;
        game_setup.sc_width = 640;
        game_setup.sc_height = 480;
    }
    game_setup.col_mode = 0;
    SwitchVideoMode(&game_setup);
    setup_screen_size();

    if (wet)
        FadeToPal(1, water_palette);
    else
        FadeToPal(1, game_palette);
}

void TempVideoAdjust(int hires, double sizer)
{
    mode_lock = 1;

    if (hires == hires_flag && sizer == screen_sizer)
        return;

    screen_sizer = sizer;

    if (hires_flag < 0)
        hires_flag = !hires;

    if (hires != hires_flag)
        switch_resolution();
    else
        setup_screen_size();
}

void TempVideoRemove(void)
{
    mode_lock = 0;

    if (hires_flag == game_hires && game_sizer == screen_sizer)
        return;

    screen_sizer = game_sizer;

    if (hires_flag < 0)
        hires_flag = !game_hires;

    if (game_hires != hires_flag)
        switch_resolution();
    else
        setup_screen_size();
}

void S_CopyScreenToBuffer(void)
{
    int i;
    char *src, *dest;
    int size;

    if (bckscrn == NULL || bckscrnsize == 0)
        return;
    src = (char *)game_setup.scrn_ptr;
    dest = bckscrn;
    size = (int)game_setup.sc_width * game_setup.sc_height;
    for (i = size; i > 0; i--)
        *(dest++) = *(src++);
}

void S_CopyBufferToScreen(void)
{
    int depth;
    char *src, *dest;
    int size;

    if (fade_value != fade_limit)
        fade_value += fade_adder;
    depth = fade_value >> 16;
    dest = (char *)game_setup.scrn_ptr;
    size = (int)game_setup.sc_height * game_setup.sc_width;
    if ((src = bckscrn) != NULL)
    {
        if (depth != 16)
        {
            for (; size > 0; size--)
                *(dest++) = depthq_table[depth][*(src++)];
        }
        else
            memcpy(dest, src, size);
    }
    else
    {
        for (; size > 0; size--)
            *(dest++) = 0;
    }
}

void S_NoFade(void)
{
    fade_limit = fade_value = 16 << 16;
}

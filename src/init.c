#include "game.h"

SETUP game_setup = {320, 200, 25, 25, 50, 0, 0};

char *malloc_buffer = NULL;
int malloc_size;

void S_InitialiseSystem(void)
{
    S_SeedRandom();
    FindCdDrive();

    if (hires_flag)
    {
        game_setup.sc_width = 640;
        game_setup.sc_height = 480;
    }
    else
    {
        game_setup.sc_width = 320;
        game_setup.sc_height = 200;
    }
    game_setup.dump_x = 0;
    game_setup.dump_y = 0;
    game_setup.dump_width = game_setup.sc_width;
    game_setup.dump_height = game_setup.sc_height;

    if (sound_active)
        ShellInit(&game_setup, CD_ON | NO_MIDI);
    else
        ShellInit(&game_setup, NO_SOS | CD_ON);

    if (SoundGetSOSDriver() == -1)
        sound_active = 0;

    CalculateWibbleTable();

    malloc_size = MALLOC_SIZE;
}

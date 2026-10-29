#include "game.h"

SAVEGAME_INFO savegame;

int SGcount;
char *SGpoint;

int number_cameras = 0;

#define SAVE_CREATURE (1 << 7)

int LoadSaveGameInfo(void)
{
    return 1;
}

void InitialiseStartInfo(void)
{
    int i;

    if (savegame.bonus_flag == 0)
    {
        for (i = 0; i < NUMBER_OF_LEVELS; i++)
        {
            ModifyStartInfo(i);
            savegame.start[i].available = 0;
        }

        savegame.start[GYM].available = 1;
        savegame.start[LEVEL1].available = 1;
    }
}

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

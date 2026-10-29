#include "game.h"

char *levelnames[NUMBER_OF_LEVELS] = {
    "data\\gym.phd",
    "data\\level1.phd",
    "data\\level2.phd",
    "data\\level3a.phd",
    "data\\level3b.phd",
    "data\\level4.phd",
    "data\\level5.phd",
    "data\\level6.phd",
    "data\\level7a.phd",
    "data\\level7b.phd",
    "data\\level8a.phd",
    "data\\level8b.phd",
    "data\\level8c.phd",
    "data\\level10a.phd",
    "data\\level10b.phd",
    "data\\level10c.phd",
    "data\\cut1.phd",
    "data\\cut2.phd",
    "data\\cut3.phd",
    "data\\cut4.phd",
    "data\\title.phd",
    "data\\current.phd"
};

int S_LoadTitle(void)
{
    return LoadLevel(levelnames[TITLE], TITLE);
}

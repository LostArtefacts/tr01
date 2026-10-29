#include <stdio.h>
#include "game.h"

int LoadTexturePages(FILE *file);
int LoadRooms(FILE *file);
int LoadObjects(FILE *file);
int LoadSprites(FILE *file);
int LoadItems(FILE *file);
int LoadDepthQ(FILE *file);
int LoadPalette(FILE *file);
int LoadCameras(FILE *file);
int LoadSoundEffects(FILE *file);
int LoadBoxes(FILE *file);
int LoadAnimatedTextures(FILE *file);
int LoadCinematic(FILE *file);
int LoadDemo(FILE *file);
int LoadSamples(FILE *file);

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

int S_LoadLevel(int level_number)
{
    return LoadLevel(levelnames[level_number], level_number);
}

int LoadLevel(char *filename, int req_level)
{
    FILE *file;
    int version, level;

    filename = GetFullPath(filename);

    init_game_malloc();

    file = fopen(filename, "rb");
    if (file == NULL)
    {
        sprintf(exit_message, "S_LoadLevel(): Could not open %s", filename);
        S_ExitSystem(exit_message);
    }

    fread(&version, sizeof(int), 1, file);
    if (version != OBJECT_VERSION)
    {
        sprintf(exit_message, "Level %d (%s) is version %d (this game code is version %d)", req_level, filename, version, OBJECT_VERSION);
        S_ExitSystem(exit_message);
    }

    if (!LoadTexturePages(file))
        return 0;

    fread(&level, sizeof(int), 1, file);

    if (!LoadRooms(file))
        return 0;

    if (!LoadObjects(file))
        return 0;

    if (!LoadSprites(file))
        return 0;

    if (!LoadCameras(file))
        return 0;

    if (!LoadSoundEffects(file))
        return 0;

    if (!LoadBoxes(file))
        return 0;

    if (!LoadAnimatedTextures(file))
        return 0;

    if (!LoadItems(file))
        return 0;

    if (!LoadDepthQ(file))
        return 0;

    if (!LoadPalette(file))
        return 0;

    if (!LoadCinematic(file))
        return 0;

    if (!LoadDemo(file))
        return 0;

    if (!LoadSamples(file))
        return 0;

    fclose(file);
    return 1;
}

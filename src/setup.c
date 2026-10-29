#include "game.h"

void InitialiseGameFlags(void);
void InitialiseLara(void);
void InitialiseFXArray(void);
void InitialiseLOTarray(void);
void InitColours(void);
void ExtractSaveGameInfo(void);

sint16 level_music[NUMBER_OF_LEVELS] = {
    0,
    57,
    57,
    57,
    57,
    59,
    59,
    59,
    58,
    58,
    59,
    59,
    59,
    58,
    60,
    60,
    0, 0, 0, 0,
    2,
    0
};

int InitialiseLevel(int level_number)
{
    if (level_number == CURRENT)
        CurrentLevel = savegame.current_level;
    else
        CurrentLevel = level_number;

    S_LoadingScreen(CurrentLevel);
    InitialiseGameFlags();
    lara.item_number = NO_ITEM;
    if (!S_LoadLevel(CurrentLevel))
        return 0;

    if (lara.item_number != NO_ITEM)
        InitialiseLara();

    effects = (FX_INFO *)game_malloc(NUM_EFFECTS * sizeof(FX_INFO), EFFECTS_ARRAY);
    InitialiseFXArray();
    InitialiseLOTarray();
    InitColours();
    T_InitPrint();
    InitialisePickUpDisplay();
    S_InitialiseScreen();

    health_bar_timer = 100;
    mn_reset_sound_effects();

    if (level_number == CURRENT)
        ExtractSaveGameInfo();

    if (level_music[CurrentLevel])
        S_CDPlay(level_music[CurrentLevel]);
    camera.underwater = 0;

    return 1;
}

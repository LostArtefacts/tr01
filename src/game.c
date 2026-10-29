#include "game.h"

uint32 StartLevel = LEVEL1;
int CurrentLevel = LEVEL1;
int level_complete = 0, save_counter = 0;

sint16 number_saved = 0;
sint16 saved_levels[NUMBER_OF_LEVELS] = {-1};

sint16 number_valid = 0;
sint16 valid_levels[] = {
    GYM,
    LEVEL1,
    LEVEL2,
    LEVEL3A,
    LEVEL3B,
    LEVEL4,
    LEVEL5,
    LEVEL6,
    LEVEL7A,
    LEVEL7B,
    LEVEL8A,
    LEVEL8B,
    LEVEL8C,
    LEVEL10A,
    LEVEL10B,
    LEVEL10C,
    CUTSCENE1,
    CUTSCENE2,
    CUTSCENE3,
    CUTSCENE4,
    TITLE,
    CURRENT,
    -1
};

sint32 StartGame(int level_number)
{
    switch (level_number)
    {
    case GYM:
        S_PlayFMV(FMV_GYM, 1);
        break;
    case LEVEL1:
        S_PlayFMV(FMV_SNOW, 1);
        break;
    case LEVEL2:
    case LEVEL3A:
    case LEVEL3B:
        break;
    case LEVEL4:
        S_PlayFMV(FMV_LIFT, 1);
        break;
    case LEVEL5:
    case LEVEL6:
    case LEVEL7A:
    case LEVEL7B:
        break;
    case LEVEL8A:
        S_PlayFMV(FMV_VISION, 1);
        break;
    case LEVEL8B:
    case LEVEL8C:
        break;
    case LEVEL10A:
        S_PlayFMV(FMV_CANYON, 1);
        break;
    case LEVEL10B:
        S_PlayFMV(FMV_PYRAMID, 1);
        break;
    case LEVEL10C:
        break;
    default:
        break;
    }

    CurrentLevel = level_number;
    title_loaded = 0;

    if (level_number != CURRENT)
        InitialiseLevelFlags();
    if (!InitialiseLevel(level_number))
    {
        CurrentLevel = 0;
        return EXIT_TO_TITLE;
    }

    if (GameLoop(0) == EXIT_TO_TITLE)
        return EXIT_TO_TITLE;

    if (level_complete)
    {
        if (CurrentLevel == GYM)
        {
            S_FadeToBlack();
            return EXIT_TO_TITLE;
        }
        S_FadeInInventory(1);
        return LEVELCOMPLETE | CurrentLevel;
    }

    S_FadeToBlack();
    if (Inventory_Chosen)
    {
        if (Inventory_ExtraData[0] == 0)
        {
            S_LoadGame(&savegame, sizeof(SAVEGAME_INFO), Inventory_ExtraData[1]);
            return STARTGAME | CURRENT;
        }
        else if (Inventory_ExtraData[0] == 1)
            return STARTGAME | LEVEL1;
    }
    return EXIT_TO_TITLE;
}

sint32 GameLoop(int demo_mode)
{
    sint32 nframes = 1, game_over;

    overlay_flag = 1;
    InitialiseCamera();
    game_over = ControlPhase(nframes, demo_mode);
    while (!game_over)
    {
        nframes = DrawPhaseGame();
        game_over = ControlPhase(nframes, demo_mode);
    }

    S_SoundStopAllSamples();
    S_CDStop();
    if (Option_Music_Volume)
        S_CDVolume(Option_Music_Volume * 25 + 5);

    return game_over;
}

#include <stdio.h>
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

void DisplayCredits(void);

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

sint32 LevelCompleteSequence(int level_number)
{
    switch (level_number)
    {
    case GYM:
        return EXIT_TO_OPTION;

    case LEVEL1:
        LevelStats(LEVEL1);
        return STARTGAME | LEVEL2;

    case LEVEL2:
        LevelStats(LEVEL2);
        return STARTGAME | LEVEL3A;

    case LEVEL3A:
        LevelStats(LEVEL3A);
        return STARTGAME | LEVEL3B;

    case LEVEL3B:
        return STARTCINE | CUTSCENE1;

    case CUTSCENE1:
        LevelStats(LEVEL3B);
        return STARTGAME | LEVEL4;

    case LEVEL4:
        LevelStats(LEVEL4);
        return STARTGAME | LEVEL5;

    case LEVEL5:
        LevelStats(LEVEL5);
        return STARTGAME | LEVEL6;

    case LEVEL6:
        LevelStats(LEVEL6);
        return STARTGAME | LEVEL7A;

    case LEVEL7A:
        LevelStats(LEVEL7A);
        return STARTGAME | LEVEL7B;

    case LEVEL7B:
        return STARTCINE | CUTSCENE2;

    case CUTSCENE2:
        LevelStats(LEVEL7B);
        return STARTGAME | LEVEL8A;

    case LEVEL8A:
        LevelStats(LEVEL8A);
        return STARTGAME | LEVEL8B;

    case LEVEL8B:
        LevelStats(LEVEL8B);
        return STARTGAME | LEVEL8C;

    case LEVEL8C:
        LevelStats(LEVEL8C);
        return STARTGAME | LEVEL10A;

    case LEVEL10A:
        LevelStats(LEVEL10A);
        return STARTCINE | CUTSCENE3;

    case CUTSCENE3:
        return STARTGAME | LEVEL10B;

    case LEVEL10B:
        S_PlayFMV(FMV_PRISON, 1);
        return STARTCINE | CUTSCENE4;

    case CUTSCENE4:
        LevelStats(LEVEL10B);
        return STARTGAME | LEVEL10C;

    case LEVEL10C:
        LevelStats(LEVEL10C);
        DisplayCredits();
        return EXIT_TO_TITLE;
    }
    return EXIT_TO_TITLE;
}

char secret_totals[] = {
    0,
    3,
    3,
    5,
    3,
    4,
    3,
    3,
    3,
    2,
    3,
    3,
    1,
    3,
    3,
    3
};

void LevelStats(int level_number)
{
    int n, numsecrets;
    int hours, minutes, seconds;
    TEXTSTRING *heading, *time, *kills, *secrets, *pickups;
    char string[100];

    TempVideoAdjust(hires_flag, 1.0);
    FadeToPal(60, game_palette);
    T_InitPrint();

    sprintf(string, "%s", Level_Strings[level_number]);
    heading = T_Print(0, -50, 0, string);
    T_CentreH(heading, 1);
    T_CentreV(heading, 1);

    seconds = savegame.timer / 30;
    hours = seconds / 3600;
    minutes = (seconds / 60) % 60;
    seconds = seconds % 60;

    if (hours)
        sprintf(string, "%s %d:%d%d:%d%d", str_timetaken, hours, minutes / 10, minutes % 10, seconds / 10, seconds % 10);
    else
        sprintf(string, "%s %d:%d%d", str_timetaken, minutes, seconds / 10, seconds % 10);
    time = T_Print(0, 70, 0, string);
    T_CentreH(time, 1);
    T_CentreV(time, 1);

    numsecrets = 0;
    for (n = 0; n < MAX_SECRETS; n++)
    {
        if (savegame.secrets & 1)
            numsecrets++;
        savegame.secrets >>= 1;
    }
    sprintf(string, "%s %d %s %d", str_secrets, numsecrets, str_of, (int)secret_totals[level_number]);
    secrets = T_Print(0, 40, 0, string);
    T_CentreH(secrets, 1);
    T_CentreV(secrets, 1);

    sprintf(string, "%s %d", str_pickups, savegame.pickups);
    pickups = T_Print(0, 10, 0, string);
    T_CentreH(pickups, 1);
    T_CentreV(pickups, 1);

    sprintf(string, "%s %d", str_kills, (int)savegame.kills);
    kills = T_Print(0, -20, 0, string);
    T_CentreH(kills, 1);
    T_CentreV(kills, 1);

    while (input & IN_SELECT)
        S_UpdateInput();

    for (;;)
    {
        S_InitialisePolyList();
        S_CopyBufferToScreen();

        S_UpdateInput();

        T_DrawText();
        S_OutputPolyList();
        S_DumpScreen();

        if (input & IN_SELECT || reset_flag)
            break;
    }

    if (level_number != LEVEL10C)
    {
        CreateStartInfo(level_number + 1);
        ModifyStartInfo(level_number + 1);

        savegame.current_level = level_number + 1;
    }
    else
    {
        savegame.bonus_flag = 1;
        for (n = LEVEL1; n <= LEVEL10C; n++)
            ModifyStartInfo(n);
        savegame.current_level = LEVEL1;
    }

    savegame.start[CURRENT].available = 0;

    S_FadeToBlack();
    TempVideoRemove();
}

static sint32 rand_1 = 0xd371f947;

sint32 GetRandomControl(void)
{
    rand_1 = rand_1 * 0x41c64e6d + 0x3039;
    return (rand_1 >> 10) & 0x7fff;
}

void SeedRandomControl(sint32 seed)
{
    rand_1 = seed;
}

static sint32 rand_2 = 0xd371f947;

sint32 GetRandomDraw(void)
{
    rand_2 = rand_2 * 0x41c64e6d + 0x3039;
    return (rand_2 >> 10) & 0x7fff;
}

void SeedRandomDraw(sint32 seed)
{
    rand_2 = seed;
}

int LevelIsValid(sint16 level_number)
{
    int n;
    sint16 *valids;

    number_valid = 0;
    valids = valid_levels;
    for (;;)
    {
        if (*(valids++) < 0)
            break;
        number_valid++;
    }
    for (n = 0; n < number_valid; n++)
    {
        if (valid_levels[n] == level_number)
            return 1;
    }
    return 0;
}

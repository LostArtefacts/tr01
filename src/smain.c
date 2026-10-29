#include <stdio.h>
#include <stdlib.h>
#include "game.h"

extern int demo_level;

int EscapeFMV(int sequence, int mode);
int LevelIsValid(sint16 level_number);
int S_FrontEndCheck(void *data, int size);
void InitialiseStartInfo(void);
void S_LoadSettings(void);
sint32 TitleSequence(void);

char exit_message[128] = "TombRaider";
int title_loaded = 0;

int cheat_mode = 0, cheat_turn;
sint16 as, cheat_angle;

void main(int argc, char **argv, char **envp)
{
    sint32 option, level_number;

    demo_level = LEVEL2 - 1;
    sound_active = 1;
    game_hires = hires_flag = 0;
    game_sizer = screen_sizer = 1.0;

    S_InitialiseSystem();
    InitialiseStartInfo();
    S_FrontEndCheck(&savegame, sizeof(SAVEGAME_INFO));
    S_LoadSettings();

    hires_flag = 0;
    TempVideoAdjust(1, 1.0);
    S_DisplayPicture("data\\eidospc");
    ScreenDump();
    FadeToPal(60, game_palette);
    FadeWait();

    if (EscapeFMV(FMV_CORE, 1))
        EscapeFMV(FMV_ESCAPE, 1);
    EscapeFMV(FMV_INTRO, 1);

    hires_flag = -1;
    malloc_buffer = (char *)malloc(MALLOC_SIZE);
    if (!malloc_buffer)
        S_ExitSystem("ERROR: Could not allocate enough memory");

    title_loaded = 0;
    option = TitleSequence();

    for (;;)
    {
        level_number = option & 0x3f;
        option &= ~0x3f;

        switch (option)
        {
        case EXIT_TO_OPTION:
        case EXIT_TO_TITLE:
            option = TitleSequence();
            break;
        case STARTGAME:
            while (!LevelIsValid(level_number))
            {
                level_number++;
                if (level_number > LEVEL10C)
                {
                    option = EXIT_TO_TITLE;
                    break;
                }
            }

            if (level_number != TITLE)
                option = StartGame(level_number);
            else
                S_ExitSystem("MAIN: play title");
            break;
        case STARTCINE:
            option = StartCinematic(level_number);
            break;
        case STARTDEMO:
            option = StartDemo();
            break;
        case LEVELCOMPLETE:
            option = LevelCompleteSequence(level_number);
            break;
        case EXITGAME:
            S_SaveSettings();
            S_ExitSystem("");
            break;
        default:
            sprintf(exit_message, "MAIN: Unknown request %x %d", option, level_number);
            S_ExitSystem(exit_message);
        }
    }
}

sint32 TitleSequence(void)
{
    T_InitPrint();
    TempVideoAdjust(1, 1.0);
    S_DisplayPicture("data\\titleh");

    noinput_count = 0;
    if (!title_loaded)
    {
        if (!InitialiseLevel(TITLE))
            return EXITGAME;
        title_loaded = 1;
    }
    else
        S_CDPlay(2);

    Display_Inventory(INV_TITLE_MODE);

    S_FadeToBlack();
    S_CDStop();

    if (reset_flag)
    {
        reset_flag = 0;
        return STARTDEMO;
    }

    if (Inventory_Chosen == PHOTO_OPTION)
        return STARTGAME | GYM;

    if (Inventory_Chosen == PASSPORT_OPTION)
    {
        if (Inventory_ExtraData[0] == 0)
        {
            S_LoadGame(&savegame, sizeof(SAVEGAME_INFO), Inventory_ExtraData[1]);
            return STARTGAME | CURRENT;
        }
        else if (Inventory_ExtraData[0] == 1)
        {
            InitialiseStartInfo();
            return STARTGAME | LEVEL1;
        }
    }
    return EXITGAME;
}

void CheckCheatMode(void)
{
    if (CurrentLevel == GYM)
        return;

    as = lara_item->current_anim_state;
    switch (cheat_mode)
    {
    case 0:
        if (as == AS_WALK)
            cheat_mode = 1;
        break;
    case 1:
        if (as != AS_WALK)
            cheat_mode = (as == AS_STOP) ? 2 : 0;
        break;
    case 2:
        if (as != AS_STOP)
            cheat_mode = (as == AS_BACK) ? 3 : 0;
        break;
    case 3:
        if (as != AS_BACK)
            cheat_mode = (as == AS_STOP) ? 4 : 0;
        break;
    case 4:
        if (as != AS_STOP)
        {
            cheat_angle = lara_item->pos.y_rot;
            cheat_turn = 0;
            if (as == AS_TURN_L)
                cheat_mode = 5;
            else if (as == AS_TURN_R)
                cheat_mode = 6;
            else
                cheat_mode = 0;
        }
        break;
    case 5:
        if (as != AS_TURN_L && as != AS_FASTTURN)
            cheat_mode = (cheat_turn < -0x17000) ? 7 : 0;
        else
        {
            cheat_turn += (sint16)(lara_item->pos.y_rot - cheat_angle);
            cheat_angle = lara_item->pos.y_rot;
        }
        break;
    case 6:
        if (as != AS_TURN_R && as != AS_FASTTURN)
            cheat_mode = (cheat_turn > 0x17000) ? 7 : 0;
        else
        {
            cheat_turn += (sint16)(lara_item->pos.y_rot - cheat_angle);
            cheat_angle = lara_item->pos.y_rot;
        }
        break;
    case 7:
        if (as != AS_STOP)
        {
            if (as == AS_COMPRESS)
                cheat_mode = 8;
            else
                cheat_mode = 0;
        }
        break;
    case 8:
        if (lara_item->fallspeed > 0)
        {
            if (as == AS_FORWARDJUMP)
                level_complete = 1;
            else if (as == AS_BACKJUMP)
            {
                Inv_AddItem(SHOTGUN_ITEM);
                Inv_AddItem(MAGNUM_ITEM);
                Inv_AddItem(UZI_ITEM);
                lara.shotgun.ammo = 500;
                lara.magnums.ammo = 500;
                lara.uzis.ammo = 5000;
                SoundEffect(7, NULL, SFX_ALWAYS);
            }
            cheat_mode = 0;
        }
        break;
    default:
        cheat_mode = 0;
    }
}

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

#include "game.h"

ITEM_INFO *items;

#define DEATH_WAIT (10 * 30)
#define MAX_FRAMES 10

sint16 *trigger_index;

int flipmap[MAX_FLIPMAPS], flip_status;

sint16 cd_flags[MAX_CD_TRACKS], cdtrack = -1;

int chunky_flag = 0;

int height_type = WALL;

int noinput_count = 0;

int reset_flag = 0;

int animation_rate = 32768;

int flipeffect = -1, fliptimer = 0;

sint32 ControlPhase(sint32 nframes, int demo_mode)
{
    uint32 return_val;
    sint16 item_num, nex;
    static int framecount = 0;

    if (nframes > MAX_FRAMES)
        nframes = MAX_FRAMES;

    framecount += nframes * animation_rate;
    for (; framecount >= 0; framecount -= 65536)
    {
        if (cdtrack > 0)
            CDLoop();

        CheckCheatMode();

        if (level_complete)
            return 1;

        S_UpdateInput();

        if (reset_flag)
            return EXIT_TO_TITLE;

        if (demo_mode)
        {
            if (keydata->keys_held)
                return 1;
            GetDemoInput();
            if (input == -1)
                return 1;
        }

        if (lara.death_count > DEATH_WAIT || (lara.death_count > 2 * 30 && input) || overlay_flag == 2)
        {
            if (demo_mode)
                return 1;
            else
            {
                if (overlay_flag == 2)
                {
                    overlay_flag = 1;
                    return_val = Display_Inventory(INV_DEATH_MODE);
                    if (return_val)
                        return return_val;
                }
                else
                    overlay_flag = 2;
            }
        }

        if ((input & IN_OPTION || input & IN_LOAD || input & IN_SAVE || overlay_flag <= 0) && !lara.death_count)
        {
            if (overlay_flag <= 0)
            {
                if (overlay_flag == -1)
                    return_val = Display_Inventory(INV_LOAD_MODE);
                else if (overlay_flag == -2)
                    return_val = Display_Inventory(INV_SAVE_MODE);
                else
                    return_val = Display_Inventory(INV_GAME_MODE);
                overlay_flag = 1;
                if (return_val)
                {
                    if (Inventory_ExtraData[0] == 1)
                    {
                        if (CurrentLevel == GYM)
                            return STARTGAME | LEVEL1;

                        CreateSaveGameInfo();
                        S_SaveGame(&savegame, sizeof(SAVEGAME_INFO), Inventory_ExtraData[1]);
                        S_SaveSettings();
                    }
                    else
                        return return_val;
                }
            }
            else
            {
                if (input & IN_LOAD)
                    overlay_flag = -1;
                else if (input & IN_SAVE)
                    overlay_flag = -2;
                else
                    overlay_flag = 0;
            }
        }

        item_num = next_item_active;
        while (item_num != NO_ITEM)
        {
            nex = items[item_num].next_active;
            if (objects[items[item_num].object_number].control)
                (*objects[items[item_num].object_number].control)(item_num);
            item_num = nex;
        }

        item_num = next_fx_active;
        while (item_num != NO_ITEM)
        {
            nex = effects[item_num].next_active;
            if (objects[effects[item_num].object_number].control)
                (*objects[effects[item_num].object_number].control)(item_num);
            item_num = nex;
        }

        LaraControl(0);

        CalculateCamera();

        SoundEffects();

        savegame.timer++;
        health_bar_timer--;
    }

    return 0;
}

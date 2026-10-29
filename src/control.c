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

void AnimateItem(ITEM_INFO *item)
{
    int i;
    ANIM_STRUCT *anim;
    sint16 *command;
    sint32 speed;

    item->touch_bits = 0;
    item->hit_status = 0;

    anim = &anims[item->anim_number];

    item->frame_number++;

    if (anim->number_changes > 0)
    {
        if (GetChange(item, anim))
        {
            anim = &anims[item->anim_number];
            item->current_anim_state = anim->current_anim_state;

            if (item->required_anim_state == item->current_anim_state)
                item->required_anim_state = 0;
        }
    }

    if (item->frame_number > anim->frame_end)
    {
        if (anim->number_commands > 0)
        {
            command = &commands[anim->command_index];
            for (i = anim->number_commands; i > 0; i--)
            {
                switch (*(command++))
                {
                case COMMAND_MOVE_ORIGIN:
                    TranslateItem(item, (sint32)*(command), (sint32)*(command + 1), (sint32)*(command + 2));
                    command += 3;
                    break;

                case COMMAND_JUMP_VELOCITY:
                    item->fallspeed = *(command++);
                    item->speed = *(command++);
                    item->gravity_status = 1;
                    break;

                case COMMAND_ATTACK_READY:
                    break;

                case COMMAND_DEACTIVATE:
                    item->status = DEACTIVATED;
                    break;

                case COMMAND_SOUND_FX:
                case COMMAND_EFFECT:
                    command += 2;
                    break;
                }
            }
        }

        item->anim_number = anim->jump_anim_num;
        item->frame_number = anim->jump_frame_num;

        anim = &anims[item->anim_number];
        item->current_anim_state = anim->current_anim_state;

        item->goal_anim_state = item->current_anim_state;

        if (item->required_anim_state == item->current_anim_state)
            item->required_anim_state = 0;
    }

    if (anim->number_commands > 0)
    {
        command = &commands[anim->command_index];
        for (i = anim->number_commands; i > 0; i--)
        {
            switch (*(command++))
            {
            case COMMAND_MOVE_ORIGIN:
                command += 3;
                break;

            case COMMAND_JUMP_VELOCITY:
                command += 2;
                break;

            case COMMAND_ATTACK_READY:
                break;

            case COMMAND_DEACTIVATE:
                break;

            case COMMAND_SOUND_FX:
                if (item->frame_number == *(command))
                    SoundEffect((int)*(command + 1), &item->pos, room[item->room_number].flags);
                command += 2;
                break;

            case COMMAND_EFFECT:
                if (item->frame_number == *(command))
                    (*effect_routines[(int)*(command + 1)])(item);
                command += 2;
                break;
            }
        }
    }

    if (!item->gravity_status)
    {
        speed = anim->velocity;
        if (anim->acceleration != 0)
            speed += anim->acceleration * (item->frame_number - anim->frame_base);
        item->speed = (sint16)(speed >> 16);
    }
    else
    {
        item->fallspeed += (item->fallspeed < FASTFALL_SPEED) ? GRAVITY : 1;
        item->pos.y_pos += item->fallspeed;
    }
    item->pos.x_pos += (phd_sin(item->pos.y_rot) * item->speed) >> W2V_SHIFT;
    item->pos.z_pos += (phd_cos(item->pos.y_rot) * item->speed) >> W2V_SHIFT;
}

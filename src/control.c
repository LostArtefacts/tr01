#include "game.h"

ITEM_INFO *items;

#define DEATH_WAIT (10 * 30)
#define MAX_FRAMES 10

#define RETURN_TARGET {target->x = x; target->y = y; target->z = z; target->room_number = last_room; return 0;}
#define RETURN_TARGET2 {target->x = x; target->y = y; target->z = z; target->room_number = room_number; return -1;}

#define TRIG_BITS(T) ((T & 0x3fff) >> 10)

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

int GetChange(ITEM_INFO *item, ANIM_STRUCT *anim)
{
    int i, j;
    CHANGE_STRUCT *change;
    RANGE_STRUCT *range;

    if (item->current_anim_state == item->goal_anim_state)
        return 0;

    change = &changes[anim->change_index];
    for (i = 0; i < anim->number_changes; i++, change++)
    {
        if (change->goal_anim_state == item->goal_anim_state)
        {
            range = &ranges[change->range_index];
            for (j = 0; j < change->number_ranges; j++, range++)
            {
                if (item->frame_number >= range->start_frame && item->frame_number <= range->end_frame)
                {
                    item->anim_number = range->link_anim_num;
                    item->frame_number = range->link_frame_num;

                    return 1;
                }
            }
        }
    }

    return 0;
}

void TranslateItem(ITEM_INFO *item, sint32 x, sint32 y, sint32 z)
{
    sint32 cosy, siny;

    cosy = phd_cos(item->pos.y_rot);
    siny = phd_sin(item->pos.y_rot);

    item->pos.x_pos += (cosy * x + siny * z) >> W2V_SHIFT;
    item->pos.y_pos += y;
    item->pos.z_pos += (-siny * x + cosy * z) >> W2V_SHIFT;
}

FLOOR_INFO *GetFloor(sint32 x, sint32 y, sint32 z, sint16 *room_number)
{
    sint32 x_floor, y_floor;
    ROOM_INFO *r;
    FLOOR_INFO *floor;
    sint16 data;

    r = &room[*room_number];
    do
    {
        x_floor = (z - r->z) >> WALL_SHIFT;
        y_floor = (x - r->x) >> WALL_SHIFT;

        if (x_floor <= 0)
        {
            x_floor = 0;
            if (y_floor < 1)
                y_floor = 1;
            else if (y_floor > r->y_size - 2)
                y_floor = r->y_size - 2;
        }
        else if (x_floor >= r->x_size - 1)
        {
            x_floor = r->x_size - 1;
            if (y_floor < 1)
                y_floor = 1;
            else if (y_floor > r->y_size - 2)
                y_floor = r->y_size - 2;
        }
        else if (y_floor < 0)
            y_floor = 0;
        else if (y_floor >= r->y_size)
            y_floor = r->y_size - 1;

        floor = &r->floor[x_floor + y_floor * r->x_size];
        data = GetDoor(floor);
        if (data != NO_ROOM)
        {
            *room_number = data;
            r = &room[data];
        }
    } while (data != NO_ROOM);

    if (y >= ((sint32)floor->floor << 8))
    {
        do
        {
            if (floor->pit_room == NO_ROOM)
                return floor;

            *room_number = floor->pit_room;
            r = &room[floor->pit_room];
            floor = &r->floor[((z - r->z) >> WALL_SHIFT) + ((x - r->x) >> WALL_SHIFT) * r->x_size];
        } while (y >= ((sint32)floor->floor << 8));
    }
    else if (y < ((sint32)floor->ceiling << 8))
    {
        do
        {
            if (floor->sky_room == NO_ROOM)
                return floor;

            *room_number = floor->sky_room;
            r = &room[floor->sky_room];
            floor = &r->floor[((z - r->z) >> WALL_SHIFT) + ((x - r->x) >> WALL_SHIFT) * r->x_size];
        } while (y < ((sint32)floor->ceiling << 8));
    }

    return floor;
}

sint16 GetWaterHeight(sint32 x, sint32 y, sint32 z, sint16 room_number)
{
    ROOM_INFO *r;
    FLOOR_INFO *floor;

    r = &room[room_number];
    floor = &r->floor[((z - r->z) >> WALL_SHIFT) + ((x - r->x) >> WALL_SHIFT) * r->x_size];

    if (r->flags & UNDERWATER)
    {
        while (floor->sky_room != NO_ROOM)
        {
            r = &room[floor->sky_room];
            if (!(r->flags & UNDERWATER))
                return floor->ceiling << 8;
            floor = &r->floor[((z - r->z) >> WALL_SHIFT) + ((x - r->x) >> WALL_SHIFT) * r->x_size];
        }
        return floor->ceiling << 8;
    }
    else
    {
        while (floor->pit_room != NO_ROOM)
        {
            r = &room[floor->pit_room];
            if (r->flags & UNDERWATER)
                return floor->floor << 8;
            floor = &r->floor[((z - r->z) >> WALL_SHIFT) + ((x - r->x) >> WALL_SHIFT) * r->x_size];
        }
    }
    return NO_HEIGHT;
}

sint16 GetHeight(FLOOR_INFO *floor, sint32 x, sint32 y, sint32 z)
{
    sint32 xoff, yoff;
    ROOM_INFO *r;
    sint16 height;
    ITEM_INFO *item;
    sint16 *data, type, trigger;

    height_type = WALL;
    while (floor->pit_room != NO_ROOM)
    {
        r = &room[floor->pit_room];
        floor = &r->floor[((z - r->z) >> WALL_SHIFT) + ((x - r->x) >> WALL_SHIFT) * r->x_size];
    }

    height = floor->floor << 8;

    trigger_index = NULL;

    if (!floor->index)
        return height;

    data = &floor_data[floor->index];
    do
    {
        type = *(data++);

        switch (type & DATA_TYPE)
        {
        case TILT_TYPE:
            xoff = (*data) >> 8;
            yoff = (signed char)(*data);

            if (!chunky_flag || (ABS(xoff) <= 2 && ABS(yoff) <= 2))
            {
                if (ABS(xoff) > 2 || ABS(yoff) > 2)
                    height_type = BIG_SLOPE;
                else
                    height_type = SMALL_SLOPE;
                if (xoff < 0)
                    height -= (z & (WALL_L - 1)) * xoff >> 2;
                else
                    height += ((WALL_L - 1 - z) & (WALL_L - 1)) * xoff >> 2;

                if (yoff < 0)
                    height -= (x & (WALL_L - 1)) * yoff >> 2;
                else
                    height += ((WALL_L - 1 - x) & (WALL_L - 1)) * yoff >> 2;
            }

            data++;
            break;

        case ROOF_TYPE:
        case DOOR_TYPE:
            data++;
            break;

        case LAVA_TYPE:
            trigger_index = data - 1;
            break;

        case TRIGGER_TYPE:
            if (!trigger_index)
                trigger_index = data - 1;

            data++;
            do
            {
                trigger = *(data++);
                if (TRIG_BITS(trigger) != TO_OBJECT)
                {
                    if (TRIG_BITS(trigger) == TO_CAMERA)
                        trigger = *(data++);
                    continue;
                }

                item = &items[trigger & VALUE_BITS];
                if (objects[item->object_number].floor)
                    (*objects[item->object_number].floor)(item, x, y, z, &height);
            } while (!(trigger & END_BIT));
            break;

        default:
            S_ExitSystem("GetHeight(): Unknown type");
        }
    } while (!(type & END_BIT));

    return height;
}

void RefreshCamera(sint16 type, sint16 *data)
{
    sint16 trigger, value, target_ok;

    target_ok = 2;
    do
    {
        trigger = *(data++);
        value = trigger & VALUE_BITS;

        switch (TRIG_BITS(trigger))
        {
        case TO_CAMERA:
            data++;

            if (value == camera.last)
            {
                camera.number = value;

                if (camera.timer < 0 || camera.type == LOOK_CAMERA || camera.type == COMBAT_CAMERA)
                {
                    camera.timer = -1;
                    target_ok = 0;
                    break;
                }
                camera.type = FIXED_CAMERA;
                target_ok = 1;
            }
            else
                target_ok = 0;
            break;

        case TO_TARGET:
            if (camera.type == LOOK_CAMERA || camera.type == COMBAT_CAMERA)
                break;

            camera.item = &items[value];
            break;
        }
    } while (!(trigger & END_BIT));

    if (!target_ok || (target_ok == 2 && camera.item->looked_at && camera.item != camera.last_item))
        camera.item = NULL;
}

void TestTriggers(sint16 *data, int heavy)
{
    ITEM_INFO *item, *camera_item;
    OBJECT_VECTOR *obvector;
    sint16 type, trigger, value, timer, flags;
    sint16 camera_flags, camera_timer;
    int switch_off = 0, flip = 0, neweffect = -1;

    if (data == NULL)
        return;

    if ((*data & DATA_TYPE) == LAVA_TYPE)
    {
        if (!heavy && lara_item->pos.y_pos == lara_item->floor)
            LavaBurn(lara_item);

        if (*data & END_BIT)
            return;

        data++;
    }

    type = (*(data++) >> 8) & 0x3f;

    flags = *(data++);
    timer = flags & 0xff;

    if (camera.type != HEAVY_CAMERA)
        RefreshCamera(type, data);

    if (heavy)
    {
        if (type != HEAVY)
            return;
    }
    else
    {
        switch (type)
        {
        case SWITCH:
            value = *(data++) & VALUE_BITS;
            if (!SwitchTrigger(value, timer))
                return;
            switch_off = (items[value].current_anim_state == 1);
            break;

        case PAD:
        case ANTIPAD:
            if (lara_item->pos.y_pos != lara_item->floor)
                return;
            break;

        case KEY:
            value = *(data++) & VALUE_BITS;
            if (!KeyTrigger(value))
                return;
            break;

        case PICKUP:
            value = *(data++) & VALUE_BITS;
            if (!PickupTrigger(value))
                return;
            break;

        case HEAVY:
            return;

        case COMBAT:
            if (lara.gun_status != LG_READY)
                return;
            break;

        case DUMMY:
            return;
        }
    }

    camera_item = NULL;
    do
    {
        trigger = *(data++);
        value = trigger & VALUE_BITS;

        switch (TRIG_BITS(trigger))
        {
        case TO_OBJECT:
            item = &items[value];

            if (item->flags & ONESHOT)
                break;

            item->timer = timer;
            if (timer != 1)
                item->timer *= 30;

            if (type == SWITCH)
                item->flags ^= (flags & CODE_BITS);
            else if (type == ANTIPAD)
                item->flags &= (0xffffffff - (flags & CODE_BITS));
            else if (flags & CODE_BITS)
                item->flags |= (flags & CODE_BITS);

            if ((item->flags & CODE_BITS) != CODE_BITS)
                break;

            if (flags & ONESHOT)
                item->flags |= ONESHOT;

            if (!item->active)
            {
                if (objects[item->object_number].intelligent)
                {
                    if (item->status == NOT_ACTIVE)
                    {
                        item->touch_bits = 0;
                        item->status = ACTIVE;
                        AddActiveItem(value);
                        EnableBaddieAI(value, 1);
                    }
                    else if (item->status == INVISIBLE)
                    {
                        item->touch_bits = 0;
                        if (EnableBaddieAI(value, 0))
                            item->status = ACTIVE;
                        else
                            item->status = INVISIBLE;
                        AddActiveItem(value);
                    }
                }
                else
                {
                    item->touch_bits = 0;
                    item->status = ACTIVE;
                    AddActiveItem(value);
                }
            }
            break;

        case TO_CAMERA:
            trigger = *(data++);
            camera_flags = trigger;
            camera_timer = trigger & 0xff;

            if (camera.fixed[value].flags & ONESHOT)
                break;

            camera.number = value;

            if (camera.type == LOOK_CAMERA || camera.type == COMBAT_CAMERA)
                break;

            if (type == COMBAT)
                break;

            if (type == SWITCH && timer && switch_off)
                break;

            if (camera.number != camera.last || type == SWITCH)
            {
                if (camera_timer == 1)
                    camera.timer = 1;
                else
                    camera.timer = camera_timer * 30;

                if (camera_flags & ONESHOT)
                    camera.fixed[camera.number].flags |= ONESHOT;

                camera.speed = ((camera_flags & CODE_BITS) >> 6) + 1;
                camera.type = (heavy) ? HEAVY_CAMERA : FIXED_CAMERA;
            }
            break;

        case TO_TARGET:
            camera_item = &items[value];
            break;

        case TO_SINK:
            obvector = &camera.fixed[value];

            if (lara.LOT.required_box != obvector->flags)
            {
                lara.LOT.target.x = obvector->x;
                lara.LOT.target.y = obvector->y;
                lara.LOT.target.z = obvector->z;
                lara.LOT.required_box = obvector->flags;
            }

            lara.current_active = obvector->data * 6;
            break;

        case TO_FLIPMAP:
            if (flipmap[value] & ONESHOT)
                break;

            if (type == SWITCH)
                flipmap[value] ^= (flags & CODE_BITS);
            else if (flags & CODE_BITS)
                flipmap[value] |= (flags & CODE_BITS);

            if ((flipmap[value] & CODE_BITS) == CODE_BITS)
            {
                if (flags & ONESHOT)
                    flipmap[value] |= ONESHOT;
                if (!flip_status)
                    flip = 1;
            }
            else if (flip_status)
                flip = 1;
            break;

        case TO_FLIPON:
            if ((flipmap[value] & CODE_BITS) == CODE_BITS && !flip_status)
                flip = 1;
            break;

        case TO_FLIPOFF:
            if ((flipmap[value] & CODE_BITS) == CODE_BITS && flip_status)
                flip = 1;
            break;

        case TO_FLIPEFFECT:
            neweffect = value;
            break;

        case TO_FINISH:
            level_complete = 1;
            break;

        case TO_CD:
            TriggerCDTrack(value, flags, type);
            break;

        case TO_SECRET:
            if (!(savegame.secrets & (1 << value)))
            {
                savegame.secrets |= (1 << value);
                S_CDPlay(13);
            }
            break;
        }
    } while (!(trigger & END_BIT));

    if (camera_item && (camera.type == FIXED_CAMERA || camera.type == HEAVY_CAMERA))
        camera.item = camera_item;

    if (flip)
    {
        FlipMap();
        if (neweffect != -1)
        {
            flipeffect = neweffect;
            fliptimer = 0;
        }
    }
}

int TriggerActive(ITEM_INFO *item)
{
    int ok;

    ok = (item->flags & REVERSE) ? 0 : 1;

    if ((item->flags & CODE_BITS) != CODE_BITS)
        return !ok;

    if (!item->timer)
        return ok;

    if (item->timer == -1)
        return !ok;

    item->timer--;

    if (!item->timer)
        item->timer = -1;

    return ok;
}

sint16 GetCeiling(FLOOR_INFO *floor, sint32 x, sint32 y, sint32 z)
{
    sint32 xoff, yoff;
    sint16 height;
    ROOM_INFO *r;
    ITEM_INFO *item;
    FLOOR_INFO *f;
    sint16 *data, type, trigger;

    f = floor;
    while (f->sky_room != NO_ROOM)
    {
        r = &room[f->sky_room];
        f = &r->floor[((z - r->z) >> WALL_SHIFT) + ((x - r->x) >> WALL_SHIFT) * r->x_size];
    }

    height = f->ceiling << 8;

    if (f->index)
    {
        data = &floor_data[f->index];
        type = *(data++) & DATA_TYPE;
        if (type == TILT_TYPE)
        {
            data++;
            type = *(data++) & DATA_TYPE;
        }

        if (type == ROOF_TYPE)
        {
            xoff = (*data) >> 8;
            yoff = (signed char)(*data);

            if (!chunky_flag || (xoff >= -2 && xoff <= 2 && yoff >= -2 && yoff <= 2))
            {
                if (xoff < 0)
                    height += (z & (WALL_L - 1)) * xoff >> 2;
                else
                    height -= ((WALL_L - 1 - z) & (WALL_L - 1)) * xoff >> 2;

                if (yoff >= 0)
                    height -= (x & (WALL_L - 1)) * yoff >> 2;
                else
                    height += ((WALL_L - 1 - x) & (WALL_L - 1)) * yoff >> 2;
            }
        }
    }

    while (floor->pit_room != NO_ROOM)
    {
        r = &room[floor->pit_room];
        floor = &r->floor[((z - r->z) >> WALL_SHIFT) + ((x - r->x) >> WALL_SHIFT) * r->x_size];
    }

    if (!floor->index)
        return height;

    data = &floor_data[floor->index];

    do
    {
        type = *(data++);

        switch (type & DATA_TYPE)
        {
        case DOOR_TYPE:
        case TILT_TYPE:
        case ROOF_TYPE:
            data++;
            break;

        case LAVA_TYPE:
            break;

        case TRIGGER_TYPE:
            data++;
            do
            {
                trigger = *(data++);
                if (TRIG_BITS(trigger) != TO_OBJECT)
                {
                    if (TRIG_BITS(trigger) == TO_CAMERA)
                        trigger = *(data++);
                    continue;
                }

                item = &items[trigger & VALUE_BITS];
                if (objects[item->object_number].ceiling)
                    (*objects[item->object_number].ceiling)(item, x, y, z, &height);
            } while (!(trigger & END_BIT));
            break;

        default:
            S_ExitSystem("GetCeiling(): Unknown type");
        }
    } while (!(type & END_BIT));

    return height;
}


sint16 GetDoor(FLOOR_INFO *floor)
{
    sint16 *data, type;

    if (!floor->index)
        return NO_ROOM;

    data = &floor_data[floor->index];
    type = *(data++);

    if (type == TILT_TYPE)
    {
        data++;
        type = *(data++);
    }

    if (type == ROOF_TYPE)
    {
        data++;
        type = *(data++);
    }

    if ((type & DATA_TYPE) == DOOR_TYPE)
        return *data;

    return NO_ROOM;
}

int LOS(GAME_VECTOR *start, GAME_VECTOR *target)
{
    int los1, los2;
    FLOOR_INFO *floor;

    if (ABS(target->z - start->z) > ABS(target->x - start->x))
    {
        los1 = xLOS(start, target);
        los2 = zLOS(start, target);
    }
    else
    {
        los1 = zLOS(start, target);
        los2 = xLOS(start, target);
    }

    if (!los2)
        return 0;

    floor = GetFloor(target->x, target->y, target->z, &target->room_number);

    if (!ClipTarget(start, target, floor) || los1 != 1 || los2 != 1)
        return 0;
    else
        return 1;
}

int zLOS(GAME_VECTOR *start, GAME_VECTOR *target)
{
    sint32 x, y, z;
    sint32 dx, dy, dz;
    sint16 room_number, last_room;
    FLOOR_INFO *floor;

    dz = target->z - start->z;
    if (dz == 0)
        return 1;

    dx = ((target->x - start->x) << WALL_SHIFT)/dz;
    dy = ((target->y - start->y) << WALL_SHIFT)/dz;

    room_number = start->room_number;

    if (dz < 0)
    {
        z = start->z & ~(WALL_L-1);
        x = start->x + (dx * (z - start->z) >> WALL_SHIFT);
        y = start->y + (dy * (z - start->z) >> WALL_SHIFT);

        while (z > target->z)
        {
            floor = GetFloor(x, y, z, &room_number);
            if (y > GetHeight(floor, x, y, z) || y < GetCeiling(floor, x, y, z))
                RETURN_TARGET2;

            last_room = room_number;

            floor = GetFloor(x, y, z-1, &room_number);
            if (y > GetHeight(floor, x, y, z-1) || y < GetCeiling(floor, x, y, z-1))
                RETURN_TARGET;

            z -= WALL_L;
            x -= dx;
            y -= dy;
        }
    }
    else
    {
        z = start->z | (WALL_L-1);
        x = start->x + (dx * (z - start->z) >> WALL_SHIFT);
        y = start->y + (dy * (z - start->z) >> WALL_SHIFT);

        while (z < target->z)
        {
            floor = GetFloor(x, y, z, &room_number);
            if (y > GetHeight(floor, x, y, z) || y < GetCeiling(floor, x, y, z))
                RETURN_TARGET2;

            last_room = room_number;

            floor = GetFloor(x, y, z+1, &room_number);
            if (y > GetHeight(floor, x, y, z+1) || y < GetCeiling(floor, x, y, z+1))
                RETURN_TARGET;

            z += WALL_L;
            x += dx;
            y += dy;
        }
    }

    target->room_number = room_number;

    return 1;
}

int xLOS(GAME_VECTOR *start, GAME_VECTOR *target)
{
    sint32 x, y, z;
    sint32 dx, dy, dz;
    sint16 room_number, last_room;
    FLOOR_INFO *floor;

    dx = target->x - start->x;
    if (dx == 0)
        return 1;

    dy = ((target->y - start->y) << WALL_SHIFT)/dx;
    dz = ((target->z - start->z) << WALL_SHIFT)/dx;

    room_number = start->room_number;

    if (dx < 0)
    {
        x = start->x & ~(WALL_L-1);
        y = start->y + (dy * (x - start->x) >> WALL_SHIFT);
        z = start->z + (dz * (x - start->x) >> WALL_SHIFT);

        while (x > target->x)
        {
            floor = GetFloor(x, y, z, &room_number);
            if (y > GetHeight(floor, x, y, z) || y < GetCeiling(floor, x, y, z))
                RETURN_TARGET2;

            last_room = room_number;

            floor = GetFloor(x-1, y, z, &room_number);
            if (y > GetHeight(floor, x-1, y, z) || y < GetCeiling(floor, x-1, y, z))
                RETURN_TARGET;

            x -= WALL_L;
            y -= dy;
            z -= dz;
        }
    }
    else
    {
        x = start->x | (WALL_L-1);
        y = start->y + (dy * (x - start->x) >> WALL_SHIFT);
        z = start->z + (dz * (x - start->x) >> WALL_SHIFT);

        while (x < target->x)
        {
            floor = GetFloor(x, y, z, &room_number);
            if (y > GetHeight(floor, x, y, z) || y < GetCeiling(floor, x, y, z))
                RETURN_TARGET2;

            last_room = room_number;

            floor = GetFloor(x+1, y, z, &room_number);
            if (y > GetHeight(floor, x+1, y, z) || y < GetCeiling(floor, x+1, y, z))
                RETURN_TARGET;

            x += WALL_L;
            y += dy;
            z += dz;
        }
    }

    target->room_number = room_number;

    return 1;
}

int ClipTarget(GAME_VECTOR *start, GAME_VECTOR *target, FLOOR_INFO *floor)
{
    sint32 dx, dy, dz, height;

    dx = target->x - start->x;
    dy = target->y - start->y;
    dz = target->z - start->z;

    height = GetHeight(floor, target->x, target->y, target->z);
    if (target->y > height && start->y < height)
    {
        target->y = height;
        target->x = start->x + dx * (height - start->y) / dy;
        target->z = start->z + dz * (height - start->y) / dy;
        return 0;
    }

    height = GetCeiling(floor, target->x, target->y, target->z);
    if (target->y < height && start->y > height)
    {
        target->y = height;
        target->x = start->x + dx * (height - start->y) / dy;
        target->z = start->z + dz * (height - start->y) / dy;
        return 0;
    }

    return 1;
}

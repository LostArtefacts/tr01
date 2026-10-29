#include "game.h"

void LaraControl(sint16 item_number)
{
    int wh, room_water_state;
    ITEM_INFO *item;
    COLL_INFO mycoll, *coll = &mycoll;

    item = lara_item;
    room_water_state = room[item->room_number].flags & 1;

    if (lara.water_status == LARA_ABOVEWATER && room_water_state)
    {
        lara.air = LARA_AIR;
        lara.water_status = LARA_UNDERWATER;
        item->gravity_status = 0;
        item->pos.y_pos += 100;
        UpdateLaraRoom(lara_item, 0);
        mn_stop_sound_effect(30, NULL);
        if (item->current_anim_state == AS_SWANDIVE)
        {
            item->pos.x_rot = -45 * ONE_DEGREE;
            item->goal_anim_state = AS_DIVE;
            AnimateLara(item);
            item->fallspeed = item->fallspeed * 2;
        }
        else if (item->current_anim_state == AS_FASTDIVE)
        {
            item->pos.x_rot = -85 * ONE_DEGREE;
            item->goal_anim_state = AS_DIVE;
            AnimateLara(item);
            item->fallspeed = item->fallspeed * 2;
        }
        else
        {
            item->pos.x_rot = -45 * ONE_DEGREE;
            item->frame_number = JUMPIN_F;
            item->anim_number = JUMPIN_A;
            item->current_anim_state = AS_DIVE;
            item->goal_anim_state = AS_SWIM;
            item->fallspeed = (item->fallspeed * 3) / 2;
        }
        lara.torso_x_rot = lara.torso_y_rot = 0;
        lara.head_x_rot = lara.head_y_rot = 0;
        Splash(lara_item);
    }
    else if (lara.water_status == LARA_UNDERWATER && !room_water_state)
    {
        wh = GetWaterHeight(item->pos.x_pos, item->pos.y_pos, item->pos.z_pos, item->room_number);
        if (wh != NO_HEIGHT && ((ABS(wh - item->pos.y_pos)) < STEP_L))
        {
            lara.water_status = LARA_SURFACE;
            item->pos.y_pos = wh + 1;
            item->frame_number = SURFTREAD_F;
            item->anim_number = SURFTREAD_A;
            item->goal_anim_state = AS_SURFTREAD;
            item->current_anim_state = AS_SURFTREAD;
            item->fallspeed = 0;
            lara.dive_count = DIVE_COUNT + 1;
            item->pos.x_rot = lara_item->pos.z_rot = 0;
            lara.torso_x_rot = lara.torso_y_rot = 0;
            lara.head_x_rot = lara.head_y_rot = 0;
            UpdateLaraRoom(item, -LARA_HITE / 2);
            SoundEffect(36, &lara_item->pos, SFX_ALWAYS);
        }
        else
        {
            lara.water_status = LARA_ABOVEWATER;
            item->frame_number = FALLDOWN_F;
            item->anim_number = FALLDOWN_A;
            item->goal_anim_state = AS_FORWARDJUMP;
            item->current_anim_state = AS_FORWARDJUMP;
            item->speed = item->fallspeed / 4;
            item->gravity_status = 1;
            item->fallspeed = 0;
            item->pos.x_rot = lara_item->pos.z_rot = 0;
            lara.gun_status = LG_ARMLESS;
            lara.torso_x_rot = lara.torso_y_rot = 0;
            lara.head_x_rot = lara.head_y_rot = 0;
        }
    }
    else if (lara.water_status == LARA_SURFACE && !room_water_state)
    {
        lara.water_status = LARA_ABOVEWATER;
        item->frame_number = FALLDOWN_F;
        item->anim_number = FALLDOWN_A;
        item->goal_anim_state = AS_FORWARDJUMP;
        item->current_anim_state = AS_FORWARDJUMP;
        item->speed = item->fallspeed / 4;
        item->gravity_status = 1;
        item->fallspeed = 0;
        item->pos.x_rot = lara_item->pos.z_rot = 0;
        lara.gun_status = LG_ARMLESS;
        lara.torso_x_rot = lara.torso_y_rot = 0;
        lara.head_x_rot = lara.head_y_rot = 0;
    }

    if (item->hit_points <= 0)
    {
        item->hit_points = -1;
        if (!lara.death_count)
            S_CDStop();
        lara.death_count++;
    }
    switch (lara.water_status)
    {
    case LARA_ABOVEWATER:
        lara.air = LARA_AIR;
        LaraAboveWater(item, coll);
        break;

    case LARA_UNDERWATER:
        if (item->hit_points >= 0)
        {
            lara.air--;
            if (lara.air < 0)
            {
                lara.air = -1;
                item->hit_points -= 5;
            }
        }
        LaraUnderWater(item, coll);
        break;

    case LARA_SURFACE:
        if (item->hit_points >= 0)
        {
            lara.air += 10;
            if (lara.air > LARA_AIR)
                lara.air = LARA_AIR;
        }
        LaraSurface(item, coll);
        break;
    }
}

void LaraSwapMeshExtra(void)
{
    int i;

    if (objects[LARA_EXTRA].loaded)
    {
        for (i = 0; i < 15; i++)
            lara.mesh_ptrs[i] = meshes[(&objects[LARA_EXTRA])->mesh_index + i];
    }
}

void AnimateLara(ITEM_INFO *item)
{
    int i;
    ANIM_STRUCT *anim;
    sint16 *command;
    sint32 speed;

    item->frame_number++;
    anim = &anims[item->anim_number];

    if (anim->number_changes > 0)
    {
        if (GetChange(item, anim))
        {
            anim = &anims[item->anim_number];
            item->current_anim_state = anim->current_anim_state;
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
                    if (lara.calc_fallspeed)
                    {
                        item->fallspeed = lara.calc_fallspeed;
                        lara.calc_fallspeed = 0;
                    }
                    break;

                case COMMAND_ATTACK_READY:
                    lara.gun_status = LG_ARMLESS;
                    break;

                case COMMAND_DEACTIVATE:
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
            case COMMAND_DEACTIVATE:
                break;

            case COMMAND_SOUND_FX:
                if (item->frame_number == *(command))
                    SoundEffect((int)*(command + 1), &item->pos, SFX_ALWAYS);
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
        if (anim->acceleration)
            speed += anim->acceleration * (item->frame_number - anim->frame_base);
        item->speed = (sint16)(speed >> 16);
    }
    else
    {
        speed = anim->velocity + anim->acceleration * (item->frame_number - anim->frame_base - 1);
        item->speed -= speed >> 16;
        speed += anim->acceleration;
        item->speed += speed >> 16;

        item->fallspeed += (item->fallspeed < FASTFALL_SPEED) ? GRAVITY : 1;

        item->pos.y_pos += item->fallspeed;
    }
    item->pos.x_pos += (phd_sin(lara.move_angle) * item->speed) >> W2V_SHIFT;
    item->pos.z_pos += (phd_cos(lara.move_angle) * item->speed) >> W2V_SHIFT;
}

void UseItem(sint16 object_num)
{
    if (object_num < 0 || object_num >= NUMBER_OBJECTS)
        return;
    switch (object_num)
    {
    case GUN_ITEM:
    case GUN_OPTION:
        lara.request_gun_type = LG_PISTOLS;
        if (lara.gun_status == LG_ARMLESS && lara.gun_type == LG_PISTOLS)
            lara.gun_type = LG_UNARMED;
        break;

    case MAGNUM_ITEM:
    case MAGNUM_OPTION:
        lara.request_gun_type = LG_MAGNUMS;
        if (lara.gun_status == LG_ARMLESS && lara.gun_type == LG_MAGNUMS)
            lara.gun_type = LG_UNARMED;
        break;

    case UZI_ITEM:
    case UZI_OPTION:
        lara.request_gun_type = LG_UZIS;
        if (lara.gun_status == LG_ARMLESS && lara.gun_type == LG_UZIS)
            lara.gun_type = LG_UNARMED;
        break;

    case SHOTGUN_ITEM:
    case SHOTGUN_OPTION:
        lara.request_gun_type = LG_SHOTGUN;
        if (lara.gun_status == LG_ARMLESS && lara.gun_type == LG_SHOTGUN)
            lara.gun_type = LG_UNARMED;
        break;

    case MEDI_ITEM:
    case MEDI_OPTION:
        if (lara_item->hit_points > 0 && lara_item->hit_points < LARA_HITPOINTS)
        {
            lara_item->hit_points += LARA_HITPOINTS / 2;
            if (lara_item->hit_points > LARA_HITPOINTS)
                lara_item->hit_points = LARA_HITPOINTS;
            Inv_RemoveItem(MEDI_ITEM);
            SoundEffect(116, NULL, SFX_ALWAYS);
        }
        break;

    case BIGMEDI_ITEM:
    case BIGMEDI_OPTION:
        if (lara_item->hit_points > 0 && lara_item->hit_points < LARA_HITPOINTS)
        {
            lara_item->hit_points += LARA_HITPOINTS;
            if (lara_item->hit_points > LARA_HITPOINTS)
                lara_item->hit_points = LARA_HITPOINTS;
            Inv_RemoveItem(BIGMEDI_ITEM);
            SoundEffect(116, NULL, SFX_ALWAYS);
        }
        break;

    default:
        break;
    }
}

void ControlLaraExtra(sint16 item_num)
{
    AnimateItem(&items[item_num]);
}

void InitialiseLaraLoad(sint16 item_num)
{
    lara.item_number = item_num;
    lara_item = &items[item_num];
}

void lara_as_walk(ITEM_INFO *item, COLL_INFO *coll);
void lara_as_run(ITEM_INFO *item, COLL_INFO *coll);
void lara_as_stop(ITEM_INFO *item, COLL_INFO *coll);
void lara_as_forwardjump(ITEM_INFO *item, COLL_INFO *coll);
void lara_as_pose(ITEM_INFO *item, COLL_INFO *coll);
void lara_as_fastback(ITEM_INFO *item, COLL_INFO *coll);
void lara_as_turn_r(ITEM_INFO *item, COLL_INFO *coll);
void lara_as_turn_l(ITEM_INFO *item, COLL_INFO *coll);
void lara_as_death(ITEM_INFO *item, COLL_INFO *coll);
void lara_as_fastfall(ITEM_INFO *item, COLL_INFO *coll);
void lara_as_hang(ITEM_INFO *item, COLL_INFO *coll);
void lara_as_reach(ITEM_INFO *item, COLL_INFO *coll);
void lara_as_splat(ITEM_INFO *item, COLL_INFO *coll);
void lara_as_tread(ITEM_INFO *item, COLL_INFO *coll);
void lara_as_land(ITEM_INFO *item, COLL_INFO *coll);
void lara_as_compress(ITEM_INFO *item, COLL_INFO *coll);
void lara_as_swim(ITEM_INFO *item, COLL_INFO *coll);
void lara_as_glide(ITEM_INFO *item, COLL_INFO *coll);
void lara_as_null(ITEM_INFO *item, COLL_INFO *coll);
void lara_as_fastturn(ITEM_INFO *item, COLL_INFO *coll);
void lara_as_stepright(ITEM_INFO *item, COLL_INFO *coll);
void lara_as_stepleft(ITEM_INFO *item, COLL_INFO *coll);
void lara_as_roll2(ITEM_INFO *item, COLL_INFO *coll);
void lara_as_slide(ITEM_INFO *item, COLL_INFO *coll);
void lara_as_backjump(ITEM_INFO *item, COLL_INFO *coll);
void lara_as_rightjump(ITEM_INFO *item, COLL_INFO *coll);
void lara_as_leftjump(ITEM_INFO *item, COLL_INFO *coll);
void lara_as_upjump(ITEM_INFO *item, COLL_INFO *coll);
void lara_as_fallback(ITEM_INFO *item, COLL_INFO *coll);
void lara_as_hangleft(ITEM_INFO *item, COLL_INFO *coll);
void lara_as_hangright(ITEM_INFO *item, COLL_INFO *coll);
void lara_as_slideback(ITEM_INFO *item, COLL_INFO *coll);
void lara_as_surftread(ITEM_INFO *item, COLL_INFO *coll);
void lara_as_surfswim(ITEM_INFO *item, COLL_INFO *coll);
void lara_as_dive(ITEM_INFO *item, COLL_INFO *coll);
void lara_as_pushblock(ITEM_INFO *item, COLL_INFO *coll);
void lara_as_pullblock(ITEM_INFO *item, COLL_INFO *coll);
void lara_as_ppready(ITEM_INFO *item, COLL_INFO *coll);
void lara_as_pickup(ITEM_INFO *item, COLL_INFO *coll);
void lara_as_switchon(ITEM_INFO *item, COLL_INFO *coll);
void lara_as_switchoff(ITEM_INFO *item, COLL_INFO *coll);
void lara_as_usekey(ITEM_INFO *item, COLL_INFO *coll);
void lara_as_usepuzzle(ITEM_INFO *item, COLL_INFO *coll);
void lara_as_uwdeath(ITEM_INFO *item, COLL_INFO *coll);
void lara_as_roll(ITEM_INFO *item, COLL_INFO *coll);
void lara_as_special(ITEM_INFO *item, COLL_INFO *coll);
void lara_as_surfback(ITEM_INFO *item, COLL_INFO *coll);
void lara_as_surfleft(ITEM_INFO *item, COLL_INFO *coll);
void lara_as_surfright(ITEM_INFO *item, COLL_INFO *coll);
void lara_as_usemidas(ITEM_INFO *item, COLL_INFO *coll);
void lara_as_diemidas(ITEM_INFO *item, COLL_INFO *coll);
void lara_as_swandive(ITEM_INFO *item, COLL_INFO *coll);
void lara_as_fastdive(ITEM_INFO *item, COLL_INFO *coll);
void lara_as_gymnast(ITEM_INFO *item, COLL_INFO *coll);
void lara_as_waterout(ITEM_INFO *item, COLL_INFO *coll);
void lara_col_walk(ITEM_INFO *item, COLL_INFO *coll);
void lara_col_run(ITEM_INFO *item, COLL_INFO *coll);
void lara_col_stop(ITEM_INFO *item, COLL_INFO *coll);
void lara_col_forwardjump(ITEM_INFO *item, COLL_INFO *coll);
void lara_col_pose(ITEM_INFO *item, COLL_INFO *coll);
void lara_col_fastback(ITEM_INFO *item, COLL_INFO *coll);
void lara_col_turn_r(ITEM_INFO *item, COLL_INFO *coll);
void lara_col_turn_l(ITEM_INFO *item, COLL_INFO *coll);
void lara_col_death(ITEM_INFO *item, COLL_INFO *coll);
void lara_col_fastfall(ITEM_INFO *item, COLL_INFO *coll);
void lara_col_hang(ITEM_INFO *item, COLL_INFO *coll);
void lara_col_reach(ITEM_INFO *item, COLL_INFO *coll);
void lara_col_splat(ITEM_INFO *item, COLL_INFO *coll);
void lara_col_tread(ITEM_INFO *item, COLL_INFO *coll);
void lara_col_land(ITEM_INFO *item, COLL_INFO *coll);
void lara_col_compress(ITEM_INFO *item, COLL_INFO *coll);
void lara_col_back(ITEM_INFO *item, COLL_INFO *coll);
void lara_col_swim(ITEM_INFO *item, COLL_INFO *coll);
void lara_col_glide(ITEM_INFO *item, COLL_INFO *coll);
void lara_col_null(ITEM_INFO *item, COLL_INFO *coll);
void lara_col_fastturn(ITEM_INFO *item, COLL_INFO *coll);
void lara_col_stepright(ITEM_INFO *item, COLL_INFO *coll);
void lara_col_stepleft(ITEM_INFO *item, COLL_INFO *coll);
void lara_col_roll2(ITEM_INFO *item, COLL_INFO *coll);
void lara_col_slide(ITEM_INFO *item, COLL_INFO *coll);
void lara_col_backjump(ITEM_INFO *item, COLL_INFO *coll);
void lara_col_rightjump(ITEM_INFO *item, COLL_INFO *coll);
void lara_col_leftjump(ITEM_INFO *item, COLL_INFO *coll);
void lara_col_upjump(ITEM_INFO *item, COLL_INFO *coll);
void lara_col_fallback(ITEM_INFO *item, COLL_INFO *coll);
void lara_col_hangleft(ITEM_INFO *item, COLL_INFO *coll);
void lara_col_hangright(ITEM_INFO *item, COLL_INFO *coll);
void lara_col_slideback(ITEM_INFO *item, COLL_INFO *coll);
void lara_col_surftread(ITEM_INFO *item, COLL_INFO *coll);
void lara_col_surfswim(ITEM_INFO *item, COLL_INFO *coll);
void lara_col_dive(ITEM_INFO *item, COLL_INFO *coll);
void lara_col_pushblock(ITEM_INFO *item, COLL_INFO *coll);
void lara_col_pullblock(ITEM_INFO *item, COLL_INFO *coll);
void lara_col_ppready(ITEM_INFO *item, COLL_INFO *coll);
void lara_col_pickup(ITEM_INFO *item, COLL_INFO *coll);
void lara_col_switchon(ITEM_INFO *item, COLL_INFO *coll);
void lara_col_switchoff(ITEM_INFO *item, COLL_INFO *coll);
void lara_col_usekey(ITEM_INFO *item, COLL_INFO *coll);
void lara_col_usepuzzle(ITEM_INFO *item, COLL_INFO *coll);
void lara_col_uwdeath(ITEM_INFO *item, COLL_INFO *coll);
void lara_col_roll(ITEM_INFO *item, COLL_INFO *coll);
void lara_col_special(ITEM_INFO *item, COLL_INFO *coll);
void lara_col_surfback(ITEM_INFO *item, COLL_INFO *coll);
void lara_col_surfleft(ITEM_INFO *item, COLL_INFO *coll);
void lara_col_surfright(ITEM_INFO *item, COLL_INFO *coll);
void lara_col_usemidas(ITEM_INFO *item, COLL_INFO *coll);
void lara_col_diemidas(ITEM_INFO *item, COLL_INFO *coll);
void lara_col_swandive(ITEM_INFO *item, COLL_INFO *coll);
void lara_col_fastdive(ITEM_INFO *item, COLL_INFO *coll);
void lara_col_gymnast(ITEM_INFO *item, COLL_INFO *coll);
void lara_col_waterout(ITEM_INFO *item, COLL_INFO *coll);

void (*lara_control_routines[])(ITEM_INFO *item, COLL_INFO *coll) = {
    lara_as_walk,
    lara_as_run,
    lara_as_stop,
    lara_as_forwardjump,
    lara_as_pose,
    lara_as_fastback,
    lara_as_turn_r,
    lara_as_turn_l,
    lara_as_death,
    lara_as_fastfall,
    lara_as_hang,
    lara_as_reach,
    lara_as_splat,
    lara_as_tread,
    lara_as_land,
    lara_as_compress,
    lara_as_back,
    lara_as_swim,
    lara_as_glide,
    lara_as_null,
    lara_as_fastturn,
    lara_as_stepright,
    lara_as_stepleft,
    lara_as_roll2,
    lara_as_slide,
    lara_as_backjump,
    lara_as_rightjump,
    lara_as_leftjump,
    lara_as_upjump,
    lara_as_fallback,
    lara_as_hangleft,
    lara_as_hangright,
    lara_as_slideback,
    lara_as_surftread,
    lara_as_surfswim,
    lara_as_dive,
    lara_as_pushblock,
    lara_as_pullblock,
    lara_as_ppready,
    lara_as_pickup,
    lara_as_switchon,
    lara_as_switchoff,
    lara_as_usekey,
    lara_as_usepuzzle,
    lara_as_uwdeath,
    lara_as_roll,
    lara_as_special,
    lara_as_surfback,
    lara_as_surfleft,
    lara_as_surfright,
    lara_as_usemidas,
    lara_as_diemidas,
    lara_as_swandive,
    lara_as_fastdive,
    lara_as_gymnast,
    lara_as_waterout,
};

void (*lara_collision_routines[])(ITEM_INFO *item, COLL_INFO *coll) = {
    lara_col_walk,
    lara_col_run,
    lara_col_stop,
    lara_col_forwardjump,
    lara_col_pose,
    lara_col_fastback,
    lara_col_turn_r,
    lara_col_turn_l,
    lara_col_death,
    lara_col_fastfall,
    lara_col_hang,
    lara_col_reach,
    lara_col_splat,
    lara_col_tread,
    lara_col_land,
    lara_col_compress,
    lara_col_back,
    lara_col_swim,
    lara_col_glide,
    lara_col_null,
    lara_col_fastturn,
    lara_col_stepright,
    lara_col_stepleft,
    lara_col_roll2,
    lara_col_slide,
    lara_col_backjump,
    lara_col_rightjump,
    lara_col_leftjump,
    lara_col_upjump,
    lara_col_fallback,
    lara_col_hangleft,
    lara_col_hangright,
    lara_col_slideback,
    lara_col_surftread,
    lara_col_surfswim,
    lara_col_dive,
    lara_col_pushblock,
    lara_col_pullblock,
    lara_col_ppready,
    lara_col_pickup,
    lara_col_switchon,
    lara_col_switchoff,
    lara_col_usekey,
    lara_col_usepuzzle,
    lara_col_uwdeath,
    lara_col_roll,
    lara_col_special,
    lara_col_surfback,
    lara_col_surfleft,
    lara_col_surfright,
    lara_col_usemidas,
    lara_col_diemidas,
    lara_col_swandive,
    lara_col_fastdive,
    lara_col_gymnast,
    lara_col_waterout,
};

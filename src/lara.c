#include "game.h"

LARA_INFO lara;
ITEM_INFO *lara_item;
int health_bar_timer = 0;

#define CAM_A_HANG 0
#define CAM_E_HANG (-60 * ONE_DEGREE)
#define DAMAGE_START 140
#define DAMAGE_LENGTH 14

#define FASTFALL_FRICTION item->speed = (item->speed * 95) / 100

#define MAX_HEAD_ROTATION (44 * ONE_DEGREE)
#define MAX_HEAD_TILT (22 * ONE_DEGREE)
#define MIN_HEAD_TILT (-42 * ONE_DEGREE)
#define HEAD_TURN (2 * ONE_DEGREE)

#define BAD_JUMP_CEILING ((STEP_L * 3) / 4)

void LaraAboveWater(ITEM_INFO *item, COLL_INFO *coll)
{
    coll->old.x = item->pos.x_pos;
    coll->old.y = item->pos.y_pos;
    coll->old.z = item->pos.z_pos;
    coll->radius = LARA_RAD;
    coll->trigger = NULL;
    coll->lava_is_pit = 0;
    coll->slopes_are_walls = 0;
    coll->slopes_are_pits = 0;
    coll->enable_hit = 1;
    coll->enable_baddie_push = 1;

    (*lara_control_routines[item->current_anim_state])(item, coll);

    if (camera.type != LOOK_CAMERA)
    {
        if (lara.head_x_rot > -HEAD_TURN && lara.head_x_rot < HEAD_TURN)
            lara.head_x_rot = 0;
        else
            lara.head_x_rot -= lara.head_x_rot / 8;
        lara.torso_x_rot = lara.head_x_rot;

        if (lara.head_y_rot > -HEAD_TURN && lara.head_y_rot < HEAD_TURN)
            lara.head_y_rot = 0;
        else
            lara.head_y_rot -= lara.head_y_rot / 8;
        lara.torso_y_rot = lara.head_y_rot;
    }

    if (item->pos.z_rot >= -LARA_LEAN_UNDO && item->pos.z_rot <= LARA_LEAN_UNDO)
        item->pos.z_rot = 0;
    else if (item->pos.z_rot < -LARA_LEAN_UNDO)
        item->pos.z_rot += LARA_LEAN_UNDO;
    else
        item->pos.z_rot -= LARA_LEAN_UNDO;

    if (lara.turn_rate >= -LARA_TURN_UNDO && lara.turn_rate <= LARA_TURN_UNDO)
        lara.turn_rate = 0;
    else if (lara.turn_rate < -LARA_TURN_UNDO)
        lara.turn_rate += LARA_TURN_UNDO;
    else
        lara.turn_rate -= LARA_TURN_UNDO;
    item->pos.y_rot += lara.turn_rate;

    AnimateLara(item);

    LaraBaddieCollision(item, coll);

    (*lara_collision_routines[item->current_anim_state])(item, coll);

    UpdateLaraRoom(item, -LARA_HITE / 2);

    LaraGun();

    TestTriggers(coll->trigger, 0);
}

void lara_as_walk(ITEM_INFO *item, COLL_INFO *coll)
{
    if (item->hit_points <= 0)
    {
        item->goal_anim_state = AS_STOP;
        return;
    }

    if (input & IN_LEFT)
    {
        lara.turn_rate -= LARA_TURN_RATE;
        if (lara.turn_rate < -LARA_SLOW_TURN)
            lara.turn_rate = -LARA_SLOW_TURN;
    }
    else if (input & IN_RIGHT)
    {
        lara.turn_rate += LARA_TURN_RATE;
        if (lara.turn_rate > LARA_SLOW_TURN)
            lara.turn_rate = LARA_SLOW_TURN;
    }
    if (input & IN_FORWARD)
    {
        if (!(input & IN_SLOW))
            item->goal_anim_state = AS_RUN;
        else
            item->goal_anim_state = AS_WALK;
    }
    else
        item->goal_anim_state = AS_STOP;
}

void lara_as_run(ITEM_INFO *item, COLL_INFO *coll)
{
    if (item->hit_points <= 0)
    {
        item->goal_anim_state = AS_DEATH;
        return;
    }

    if (input & IN_ROLL)
    {
        item->anim_number = ROLL_A;
        item->frame_number = ROLL_F;
        item->current_anim_state = AS_ROLL;
        item->goal_anim_state = AS_STOP;
        return;
    }
    if (input & IN_LEFT)
    {
        lara.turn_rate -= LARA_TURN_RATE;
        if (lara.turn_rate < -LARA_FAST_TURN)
            lara.turn_rate = -LARA_FAST_TURN;
        item->pos.z_rot -= LARA_LEAN_RATE;
        if (item->pos.z_rot < -LARA_LEAN_MAX)
            item->pos.z_rot = -LARA_LEAN_MAX;
    }
    else if (input & IN_RIGHT)
    {
        lara.turn_rate += LARA_TURN_RATE;
        if (lara.turn_rate > LARA_FAST_TURN)
            lara.turn_rate = LARA_FAST_TURN;
        item->pos.z_rot += LARA_LEAN_RATE;
        if (item->pos.z_rot > LARA_LEAN_MAX)
            item->pos.z_rot = LARA_LEAN_MAX;
    }
    if (input & IN_JUMP && !item->gravity_status)
        item->goal_anim_state = AS_FORWARDJUMP;
    else if (input & IN_FORWARD)
    {
        if (input & IN_SLOW)
            item->goal_anim_state = AS_WALK;
        else
            item->goal_anim_state = AS_RUN;
    }
    else
        item->goal_anim_state = AS_STOP;
}

void lara_as_stop(ITEM_INFO *item, COLL_INFO *coll)
{
    if (item->hit_points <= 0)
    {
        item->goal_anim_state = AS_DEATH;
        return;
    }

    if (input & IN_ROLL)
    {
        item->anim_number = ROLL_A;
        item->frame_number = ROLL_F;
        item->current_anim_state = AS_ROLL;
        item->goal_anim_state = AS_STOP;
        return;
    }

    item->goal_anim_state = AS_STOP;

    if (input & IN_LOOK)
    {
        camera.type = LOOK_CAMERA;
        if (input & IN_LEFT && lara.head_y_rot > -MAX_HEAD_ROTATION)
            lara.head_y_rot -= HEAD_TURN;
        else if (input & IN_RIGHT && lara.head_y_rot < MAX_HEAD_ROTATION)
            lara.head_y_rot += HEAD_TURN;
        lara.torso_y_rot = lara.head_y_rot;

        if (input & IN_FORWARD && lara.head_x_rot > MIN_HEAD_TILT)
            lara.head_x_rot -= HEAD_TURN;
        else if (input & IN_BACK && lara.head_x_rot < MAX_HEAD_TILT)
            lara.head_x_rot += HEAD_TURN;
        lara.torso_x_rot = lara.head_x_rot;
        return;
    }
    else if (camera.type == LOOK_CAMERA)
        camera.type = CHASE_CAMERA;

    if (input & IN_STEPL)
        item->goal_anim_state = AS_STEPLEFT;
    else if (input & IN_STEPR)
        item->goal_anim_state = AS_STEPRIGHT;
    if (input & IN_LEFT)
        item->goal_anim_state = AS_TURN_L;
    else if (input & IN_RIGHT)
        item->goal_anim_state = AS_TURN_R;

    if (input & IN_JUMP)
        item->goal_anim_state = AS_COMPRESS;
    else if (input & IN_FORWARD)
    {
        if (input & IN_SLOW)
            lara_as_walk(item, coll);
        else
            lara_as_run(item, coll);
    }
    else if (input & IN_BACK)
    {
        if (input & IN_SLOW)
            lara_as_back(item, coll);
        else
            item->goal_anim_state = AS_FASTBACK;
    }
}

void lara_as_forwardjump(ITEM_INFO *item, COLL_INFO *coll)
{
    if (item->goal_anim_state == AS_SWANDIVE || item->goal_anim_state == AS_REACH)
        item->goal_anim_state = AS_FORWARDJUMP;
    if (item->goal_anim_state != AS_DEATH && item->goal_anim_state != AS_STOP)
    {
        if ((input & IN_ACTION) && lara.gun_status == LG_ARMLESS)
            item->goal_anim_state = AS_REACH;
        if ((input & IN_SLOW) && lara.gun_status == LG_ARMLESS)
            item->goal_anim_state = AS_SWANDIVE;
        if (item->fallspeed > LARA_FASTFALL_SPEED)
            item->goal_anim_state = AS_FASTFALL;
    }

    if (input & IN_LEFT)
    {
        lara.turn_rate -= LARA_TURN_RATE;
        if (lara.turn_rate < -LARA_JUMP_TURN)
            lara.turn_rate = -LARA_JUMP_TURN;
    }
    else if (input & IN_RIGHT)
    {
        lara.turn_rate += LARA_TURN_RATE;
        if (lara.turn_rate > LARA_JUMP_TURN)
            lara.turn_rate = LARA_JUMP_TURN;
    }
}

void lara_as_pose(ITEM_INFO *item, COLL_INFO *coll)
{
}

void lara_as_fastback(ITEM_INFO *item, COLL_INFO *coll)
{
    item->goal_anim_state = AS_STOP;
    if (input & IN_LEFT)
    {
        lara.turn_rate -= LARA_TURN_RATE;
        if (lara.turn_rate < -LARA_MED_TURN)
            lara.turn_rate = -LARA_MED_TURN;
    }
    else if (input & IN_RIGHT)
    {
        lara.turn_rate += LARA_TURN_RATE;
        if (lara.turn_rate > LARA_MED_TURN)
            lara.turn_rate = LARA_MED_TURN;
    }
}

void lara_as_turn_r(ITEM_INFO *item, COLL_INFO *coll)
{
    if (item->hit_points <= 0)
    {
        item->goal_anim_state = AS_STOP;
        return;
    }
    lara.turn_rate += LARA_TURN_RATE;
    if (lara.gun_status == LG_READY)
        item->goal_anim_state = AS_FASTTURN;
    else if (lara.turn_rate > LARA_SLOW_TURN)
    {
        if (!(input & IN_SLOW))
            item->goal_anim_state = AS_FASTTURN;
        else
            lara.turn_rate = LARA_SLOW_TURN;
    }
    if (input & IN_FORWARD)
    {
        if (input & IN_SLOW)
            item->goal_anim_state = AS_WALK;
        else
            item->goal_anim_state = AS_RUN;
    }
    else if (!(input & IN_RIGHT))
        item->goal_anim_state = AS_STOP;
}

void lara_as_turn_l(ITEM_INFO *item, COLL_INFO *coll)
{
    if (item->hit_points <= 0)
    {
        item->goal_anim_state = AS_STOP;
        return;
    }
    lara.turn_rate -= LARA_TURN_RATE;
    if (lara.gun_status == LG_READY)
        item->goal_anim_state = AS_FASTTURN;
    else if (lara.turn_rate < -LARA_SLOW_TURN)
    {
        if (!(input & IN_SLOW))
            item->goal_anim_state = AS_FASTTURN;
        else
            lara.turn_rate = -LARA_SLOW_TURN;
    }
    if (input & IN_FORWARD)
    {
        if (input & IN_SLOW)
            item->goal_anim_state = AS_WALK;
        else
            item->goal_anim_state = AS_RUN;
    }
    else if (!(input & IN_LEFT))
        item->goal_anim_state = AS_STOP;
}

void lara_as_death(ITEM_INFO *item, COLL_INFO *coll)
{
    coll->enable_hit = 0;
    coll->enable_baddie_push = 0;
}

void lara_as_fastfall(ITEM_INFO *item, COLL_INFO *coll)
{
    FASTFALL_FRICTION;
    if (item->fallspeed >= DAMAGE_START + DAMAGE_LENGTH)
        SoundEffect(30, &item->pos, 0);
}

void lara_as_hang(ITEM_INFO *item, COLL_INFO *coll)
{
    coll->enable_hit = 0;
    coll->enable_baddie_push = 0;
    camera.target_angle = CAM_A_HANG;
    camera.target_elevation = CAM_E_HANG;
    if (input & IN_LEFT || input & IN_STEPL)
        item->goal_anim_state = AS_HANGLEFT;
    else if (input & IN_RIGHT || input & IN_STEPR)
        item->goal_anim_state = AS_HANGRIGHT;
}

void lara_as_reach(ITEM_INFO *item, COLL_INFO *coll)
{
    camera.target_angle = 85 * ONE_DEGREE;
    if (item->fallspeed > LARA_FASTFALL_SPEED)
        item->goal_anim_state = AS_FASTFALL;
}

void lara_as_splat(ITEM_INFO *item, COLL_INFO *coll)
{
}

void lara_as_land(ITEM_INFO *item, COLL_INFO *coll)
{
}

void lara_as_compress(ITEM_INFO *item, COLL_INFO *coll)
{
    if ((input & IN_FORWARD) && LaraFloorFront(item, item->pos.y_rot, 256) >= -STEPUP_HEIGHT)
    {
        item->goal_anim_state = AS_FORWARDJUMP;
        lara.move_angle = item->pos.y_rot;
    }
    else if ((input & IN_LEFT) && LaraFloorFront(item, item->pos.y_rot - 16384, 256) >= -STEPUP_HEIGHT)
    {
        item->goal_anim_state = AS_LEFTJUMP;
        lara.move_angle = item->pos.y_rot - 16384;
    }
    else if ((input & IN_RIGHT) && LaraFloorFront(item, item->pos.y_rot + 16384, 256) >= -STEPUP_HEIGHT)
    {
        item->goal_anim_state = AS_RIGHTJUMP;
        lara.move_angle = item->pos.y_rot + 16384;
    }
    else if ((input & IN_BACK) && LaraFloorFront(item, item->pos.y_rot - 32768, 256) >= -STEPUP_HEIGHT)
    {
        item->goal_anim_state = AS_BACKJUMP;
        lara.move_angle = item->pos.y_rot - 32768;
    }
    if (item->fallspeed > LARA_FASTFALL_SPEED)
        item->goal_anim_state = AS_FASTFALL;
}

void lara_as_back(ITEM_INFO *item, COLL_INFO *coll)
{
    if (item->hit_points <= 0)
    {
        item->goal_anim_state = AS_STOP;
        return;
    }
    if (!(input & IN_BACK) || !(input & IN_SLOW))
        item->goal_anim_state = AS_STOP;
    else
        item->goal_anim_state = AS_BACK;
    if (input & IN_LEFT)
    {
        lara.turn_rate -= LARA_TURN_RATE;
        if (lara.turn_rate < -LARA_SLOW_TURN)
            lara.turn_rate = -LARA_SLOW_TURN;
    }
    else if (input & IN_RIGHT)
    {
        lara.turn_rate += LARA_TURN_RATE;
        if (lara.turn_rate > LARA_SLOW_TURN)
            lara.turn_rate = LARA_SLOW_TURN;
    }
}

void lara_as_null(ITEM_INFO *item, COLL_INFO *coll)
{
    coll->enable_hit = 0;
    coll->enable_baddie_push = 0;
}

void lara_as_fastturn(ITEM_INFO *item, COLL_INFO *coll)
{
    if (item->hit_points <= 0)
    {
        item->goal_anim_state = AS_STOP;
        return;
    }
    if (lara.turn_rate < 0)
    {
        lara.turn_rate = -LARA_FAST_TURN;
        if (!(input & IN_LEFT))
            item->goal_anim_state = AS_STOP;
    }
    else
    {
        lara.turn_rate = LARA_FAST_TURN;
        if (!(input & IN_RIGHT))
            item->goal_anim_state = AS_STOP;
    }
}

void lara_as_stepright(ITEM_INFO *item, COLL_INFO *coll)
{
    if (item->hit_points <= 0)
    {
        item->goal_anim_state = AS_STOP;
        return;
    }
    if (!(input & IN_STEPR))
        item->goal_anim_state = AS_STOP;

    if (input & IN_LEFT)
    {
        lara.turn_rate -= LARA_TURN_RATE;
        if (lara.turn_rate < -LARA_SLOW_TURN)
            lara.turn_rate = -LARA_SLOW_TURN;
    }
    else if (input & IN_RIGHT)
    {
        lara.turn_rate += LARA_TURN_RATE;
        if (lara.turn_rate > LARA_SLOW_TURN)
            lara.turn_rate = LARA_SLOW_TURN;
    }
}

void lara_as_stepleft(ITEM_INFO *item, COLL_INFO *coll)
{
    if (item->hit_points <= 0)
    {
        item->goal_anim_state = AS_STOP;
        return;
    }
    if (!(input & IN_STEPL))
        item->goal_anim_state = AS_STOP;
    if (input & IN_LEFT)
    {
        lara.turn_rate -= LARA_TURN_RATE;
        if (lara.turn_rate < -LARA_SLOW_TURN)
            lara.turn_rate = -LARA_SLOW_TURN;
    }
    else if (input & IN_RIGHT)
    {
        lara.turn_rate += LARA_TURN_RATE;
        if (lara.turn_rate > LARA_SLOW_TURN)
            lara.turn_rate = LARA_SLOW_TURN;
    }
}

void lara_as_slide(ITEM_INFO *item, COLL_INFO *coll)
{
    camera.flags = NO_CHUNKY;
    camera.target_elevation = -45 * ONE_DEGREE;
    if (input & IN_JUMP)
        item->goal_anim_state = AS_FORWARDJUMP;
}

void lara_as_backjump(ITEM_INFO *item, COLL_INFO *coll)
{
    camera.target_angle = ONE_DEGREE * 135;
    if (item->fallspeed > LARA_FASTFALL_SPEED)
        item->goal_anim_state = AS_FASTFALL;
}

void lara_as_rightjump(ITEM_INFO *item, COLL_INFO *coll)
{
    if (item->fallspeed > LARA_FASTFALL_SPEED)
        item->goal_anim_state = AS_FASTFALL;
}

void lara_as_leftjump(ITEM_INFO *item, COLL_INFO *coll)
{
    if (item->fallspeed > LARA_FASTFALL_SPEED)
        item->goal_anim_state = AS_FASTFALL;
}

void lara_as_upjump(ITEM_INFO *item, COLL_INFO *coll)
{
    if (item->fallspeed > LARA_FASTFALL_SPEED)
        item->goal_anim_state = AS_FASTFALL;
}

void lara_as_fallback(ITEM_INFO *item, COLL_INFO *coll)
{
    if (item->fallspeed > LARA_FASTFALL_SPEED)
        item->goal_anim_state = AS_FASTFALL;
    if ((input & IN_ACTION) && lara.gun_status == LG_ARMLESS)
        item->goal_anim_state = AS_REACH;
}

void lara_as_hangleft(ITEM_INFO *item, COLL_INFO *coll)
{
    coll->enable_hit = 0;
    coll->enable_baddie_push = 0;
    camera.target_angle = CAM_A_HANG;
    camera.target_elevation = CAM_E_HANG;
    if (!(input & IN_LEFT) && !(input & IN_STEPL))
        item->goal_anim_state = AS_HANG;
}

void lara_as_hangright(ITEM_INFO *item, COLL_INFO *coll)
{
    coll->enable_hit = 0;
    coll->enable_baddie_push = 0;
    camera.target_angle = CAM_A_HANG;
    camera.target_elevation = CAM_E_HANG;
    if (!(input & IN_RIGHT) && !(input & IN_STEPR))
        item->goal_anim_state = AS_HANG;
}

void lara_as_slideback(ITEM_INFO *item, COLL_INFO *coll)
{
    if (input & IN_JUMP)
        item->goal_anim_state = AS_BACKJUMP;
}

void lara_as_pushblock(ITEM_INFO *item, COLL_INFO *coll)
{
    coll->enable_hit = 0;
    coll->enable_baddie_push = 0;
    camera.flags = FOLLOW_CENTRE;
    camera.target_angle = 35 * ONE_DEGREE;
    camera.target_elevation = -25 * ONE_DEGREE;
}

void lara_as_pullblock(ITEM_INFO *item, COLL_INFO *coll)
{
    coll->enable_hit = 0;
    coll->enable_baddie_push = 0;
    camera.flags = FOLLOW_CENTRE;
    camera.target_angle = 35 * ONE_DEGREE;
    camera.target_elevation = -25 * ONE_DEGREE;
}

void lara_as_ppready(ITEM_INFO *item, COLL_INFO *coll)
{
    coll->enable_hit = 0;
    coll->enable_baddie_push = 0;
    camera.target_angle = 75 * ONE_DEGREE;
    if (!(input & IN_ACTION))
        item->goal_anim_state = AS_STOP;
}

void lara_as_pickup(ITEM_INFO *item, COLL_INFO *coll)
{
    coll->enable_hit = 0;
    coll->enable_baddie_push = 0;
    camera.target_angle = -130 * ONE_DEGREE;
    camera.target_elevation = -15 * ONE_DEGREE;
    camera.target_distance = WALL_L;
}

void lara_as_switchon(ITEM_INFO *item, COLL_INFO *coll)
{
    coll->enable_hit = 0;
    coll->enable_baddie_push = 0;
    camera.target_angle = 80 * ONE_DEGREE;
    camera.target_elevation = -25 * ONE_DEGREE;
    camera.target_distance = WALL_L;
}

void lara_as_switchoff(ITEM_INFO *item, COLL_INFO *coll)
{
    coll->enable_hit = 0;
    coll->enable_baddie_push = 0;
    camera.target_angle = 80 * ONE_DEGREE;
    camera.target_elevation = -25 * ONE_DEGREE;
    camera.target_distance = WALL_L;
}

void lara_as_usekey(ITEM_INFO *item, COLL_INFO *coll)
{
    coll->enable_hit = 0;
    coll->enable_baddie_push = 0;
    camera.target_angle = -80 * ONE_DEGREE;
    camera.target_elevation = -25 * ONE_DEGREE;
    camera.target_distance = WALL_L;
}

void lara_as_usepuzzle(ITEM_INFO *item, COLL_INFO *coll)
{
    coll->enable_hit = 0;
    coll->enable_baddie_push = 0;
    camera.target_angle = -80 * ONE_DEGREE;
    camera.target_elevation = -25 * ONE_DEGREE;
    camera.target_distance = WALL_L;
}

void lara_as_roll(ITEM_INFO *item, COLL_INFO *coll)
{
}

void lara_as_roll2(ITEM_INFO *item, COLL_INFO *coll)
{
}

void lara_as_special(ITEM_INFO *item, COLL_INFO *coll)
{
    camera.flags = FOLLOW_CENTRE;
    camera.target_angle = 170 * ONE_DEGREE;
    camera.target_elevation = -25 * ONE_DEGREE;
}

void lara_as_usemidas(ITEM_INFO *item, COLL_INFO *coll)
{
    coll->enable_hit = 0;
    coll->enable_baddie_push = 0;
    ItemSparkle(item, (1 << HAND_L) | (1 << HAND_R));
}

void lara_as_diemidas(ITEM_INFO *item, COLL_INFO *coll)
{
    int frm;

    item->gravity_status = 0;
    coll->enable_hit = 0;
    coll->enable_baddie_push = 0;

    frm = item->frame_number - anims[item->anim_number].frame_base;
    switch (frm)
    {
    case 5:
        lara.mesh_effects |= (1 << FOOT_L);
        lara.mesh_effects |= (1 << FOOT_R);
        lara.mesh_ptrs[FOOT_L] = meshes[(&objects[LARA_EXTRA])->mesh_index + FOOT_L];
        lara.mesh_ptrs[FOOT_R] = meshes[(&objects[LARA_EXTRA])->mesh_index + FOOT_R];
        break;

    case 70:
        lara.mesh_effects |= (1 << CALF_L);
        lara.mesh_ptrs[CALF_L] = meshes[(&objects[LARA_EXTRA])->mesh_index + CALF_L];
        break;

    case 90:
        lara.mesh_effects |= (1 << THIGH_L);
        lara.mesh_ptrs[THIGH_L] = meshes[(&objects[LARA_EXTRA])->mesh_index + THIGH_L];
        break;

    case 100:
        lara.mesh_effects |= (1 << CALF_R);
        lara.mesh_ptrs[CALF_R] = meshes[(&objects[LARA_EXTRA])->mesh_index + CALF_R];
        break;

    case 120:
        lara.mesh_effects |= (1 << HIPS);
        lara.mesh_effects |= (1 << THIGH_R);
        lara.mesh_ptrs[HIPS] = meshes[(&objects[LARA_EXTRA])->mesh_index + HIPS];
        lara.mesh_ptrs[THIGH_R] = meshes[(&objects[LARA_EXTRA])->mesh_index + THIGH_R];
        break;

    case 135:
        lara.mesh_effects |= (1 << TORSO);
        lara.mesh_ptrs[TORSO] = meshes[(&objects[LARA_EXTRA])->mesh_index + TORSO];
        break;

    case 150:
        lara.mesh_effects |= (1 << UARM_L);
        lara.mesh_ptrs[UARM_L] = meshes[(&objects[LARA_EXTRA])->mesh_index + UARM_L];
        break;

    case 163:
        lara.mesh_effects |= (1 << LARM_L);
        lara.mesh_ptrs[LARM_L] = meshes[(&objects[LARA_EXTRA])->mesh_index + LARM_L];
        break;

    case 174:
        lara.mesh_effects |= (1 << HAND_L);
        lara.mesh_ptrs[HAND_L] = meshes[(&objects[LARA_EXTRA])->mesh_index + HAND_L];
        break;

    case 186:
        lara.mesh_effects |= (1 << UARM_R);
        lara.mesh_ptrs[UARM_R] = meshes[(&objects[LARA_EXTRA])->mesh_index + UARM_R];
        break;

    case 195:
        lara.mesh_effects |= (1 << LARM_R);
        lara.mesh_ptrs[LARM_R] = meshes[(&objects[LARA_EXTRA])->mesh_index + LARM_R];
        break;

    case 218:
        lara.mesh_effects |= (1 << HAND_R);
        lara.mesh_ptrs[HAND_R] = meshes[(&objects[LARA_EXTRA])->mesh_index + HAND_R];
        break;

    case 225:
        lara.mesh_effects |= (1 << HEAD);
        lara.mesh_ptrs[HEAD] = meshes[(&objects[LARA_EXTRA])->mesh_index + HEAD];
        break;
    }
    ItemSparkle(item, lara.mesh_effects);
}

void lara_as_swandive(ITEM_INFO *item, COLL_INFO *coll)
{
    coll->enable_hit = 0;
    coll->enable_baddie_push = 1;
    if (item->fallspeed > LARA_FASTFALL_SPEED)
        item->goal_anim_state = AS_FASTDIVE;
}

void lara_as_fastdive(ITEM_INFO *item, COLL_INFO *coll)
{
    coll->enable_hit = 0;
    coll->enable_baddie_push = 1;
    FASTFALL_FRICTION;
}

void lara_as_gymnast(ITEM_INFO *item, COLL_INFO *coll)
{
    coll->enable_hit = 0;
    coll->enable_baddie_push = 0;
}

void lara_as_waterout(ITEM_INFO *item, COLL_INFO *coll)
{
    coll->enable_hit = 0;
    coll->enable_baddie_push = 0;
    camera.flags = FOLLOW_CENTRE;
}

void lara_col_walk(ITEM_INFO *item, COLL_INFO *coll)
{
    item->gravity_status = item->fallspeed = 0;
    lara.move_angle = item->pos.y_rot;
    coll->bad_pos = STEPUP_HEIGHT;
    coll->bad_neg = -STEPUP_HEIGHT;
    coll->bad_ceiling = 0;
    coll->slopes_are_pits = 1;
    coll->slopes_are_walls = 1;
    coll->lava_is_pit = 1;
    GetLaraCollisionInfo(item, coll);

    if (LaraHitCeiling(item, coll))
        return;
    if (TestLaraVault(item, coll))
        return;

    if (LaraDeflectEdge(item, coll))
    {
        if (item->frame_number >= 22 + 7 && item->frame_number <= 22 + 25)
        {
            item->anim_number = STOP_RIGHT_A;
            item->frame_number = STOP_RIGHT_F;
        }
        else if ((item->frame_number >= 22 && item->frame_number <= 22 + 6) || (item->frame_number >= 22 + 26 && item->frame_number <= 22 + 35))
        {
            item->anim_number = STOP_LEFT_A;
            item->frame_number = STOP_LEFT_F;
        }
        else
        {
            item->anim_number = STOP_A;
            item->frame_number = STOP_F;
        }
    }

    if (coll->mid_floor > STEPUP_HEIGHT)
    {
        item->anim_number = FALLDOWN_A;
        item->frame_number = FALLDOWN_F;
        item->current_anim_state = AS_FORWARDJUMP;
        item->goal_anim_state = AS_FORWARDJUMP;
        item->fallspeed = 0;
        item->gravity_status = 1;
        return;
    }
    if (coll->mid_floor > STEP_L / 2)
    {
        if (item->frame_number >= 28 && item->frame_number <= 45)
        {
            item->anim_number = WALKSTEPD_RIGHT_A;
            item->frame_number = WALKSTEPD_RIGHT_F;
        }
        else
        {
            item->anim_number = WALKSTEPD_LEFT_A;
            item->frame_number = WALKSTEPD_LEFT_F;
        }
    }
    if (coll->mid_floor >= -STEPUP_HEIGHT && coll->mid_floor < -STEP_L / 2)
    {
        if (item->frame_number >= 27 && item->frame_number <= 44)
        {
            item->anim_number = WALKSTEPUP_RIGHT_A;
            item->frame_number = WALKSTEPUP_RIGHT_F;
        }
        else
        {
            item->anim_number = WALKSTEPUP_LEFT_A;
            item->frame_number = WALKSTEPUP_LEFT_F;
        }
    }
    if (TestLaraSlide(item, coll))
        return;
    item->pos.y_pos += coll->mid_floor;
}

void lara_col_run(ITEM_INFO *item, COLL_INFO *coll)
{
    lara.move_angle = item->pos.y_rot;
    coll->bad_pos = NO_BAD_POS;
    coll->bad_neg = -STEPUP_HEIGHT;
    coll->bad_ceiling = 0;
    coll->slopes_are_walls = 1;
    GetLaraCollisionInfo(item, coll);
    if (LaraHitCeiling(item, coll))
        return;
    if (TestLaraVault(item, coll))
        return;
    if (LaraDeflectEdge(item, coll))
    {
        item->pos.z_rot = 0;
        if (coll->front_type == WALL && coll->front_floor < -(STEP_L * 5) / 2)
        {
            item->current_anim_state = AS_SPLAT;
            if (item->frame_number >= 0 && item->frame_number <= 9)
            {
                item->anim_number = HITWALLLEFT_A;
                item->frame_number = HITWALLLEFT_F;
                return;
            }
            if (item->frame_number >= 10 && item->frame_number <= 21)
            {
                item->anim_number = HITWALLRIGHT_A;
                item->frame_number = HITWALLRIGHT_F;
                return;
            }
        }
        item->anim_number = STOP_A;
        item->frame_number = STOP_F;
    }

    if (coll->mid_floor > STEPUP_HEIGHT)
    {
        item->anim_number = FALLDOWN_A;
        item->frame_number = FALLDOWN_F;
        item->current_anim_state = AS_FORWARDJUMP;
        item->goal_anim_state = AS_FORWARDJUMP;
        item->fallspeed = 0;
        item->gravity_status = 1;
        return;
    }
    if (coll->mid_floor >= -STEPUP_HEIGHT && coll->mid_floor < -STEP_L / 2)
    {
        if (item->frame_number >= 3 && item->frame_number <= 14)
        {
            item->anim_number = RUNSTEPUP_LEFT_A;
            item->frame_number = RUNSTEPUP_LEFT_F;
        }
        else
        {
            item->anim_number = RUNSTEPUP_RIGHT_A;
            item->frame_number = RUNSTEPUP_RIGHT_F;
        }
    }
    if (TestLaraSlide(item, coll))
        return;
    if (coll->mid_floor >= 50)
    {
        item->pos.y_pos += 50;
        return;
    }
    item->pos.y_pos += coll->mid_floor;
}

void lara_col_stop(ITEM_INFO *item, COLL_INFO *coll)
{
    item->gravity_status = item->fallspeed = 0;
    lara.move_angle = item->pos.y_rot;
    coll->bad_pos = STEPUP_HEIGHT;
    coll->bad_neg = -STEPUP_HEIGHT;
    coll->bad_ceiling = 0;
    coll->slopes_are_pits = 1;
    coll->slopes_are_walls = 1;
    GetLaraCollisionInfo(item, coll);
    if (LaraHitCeiling(item, coll))
        return;
    if (coll->mid_floor > 100)
    {
        item->anim_number = FALLDOWN_A;
        item->frame_number = FALLDOWN_F;
        item->current_anim_state = AS_FORWARDJUMP;
        item->goal_anim_state = AS_FORWARDJUMP;
        item->fallspeed = 0;
        item->gravity_status = 1;
        return;
    }
    if (TestLaraSlide(item, coll))
        return;
    ShiftItem(item, coll);
    item->pos.y_pos += coll->mid_floor;
}

void lara_col_forwardjump(ITEM_INFO *item, COLL_INFO *coll)
{
    lara.move_angle = item->pos.y_rot;
    coll->bad_pos = NO_BAD_POS;
    coll->bad_neg = -STEPUP_HEIGHT;
    coll->bad_ceiling = BAD_JUMP_CEILING;
    GetLaraCollisionInfo(item, coll);
    LaraDeflectEdgeJump(item, coll);
    if (coll->mid_floor <= 0 && item->fallspeed > 0)
    {
        if (LaraLandedBad(item, coll))
            item->goal_anim_state = AS_DEATH;
        else
        {
            if (input & IN_FORWARD && !(input & IN_SLOW))
                item->goal_anim_state = AS_RUN;
            else
                item->goal_anim_state = AS_STOP;
        }
        item->fallspeed = 0;
        item->pos.y_pos += coll->mid_floor;
        item->gravity_status = 0;
        item->speed = 0;
        AnimateLara(item);
    }
}

void lara_col_pose(ITEM_INFO *item, COLL_INFO *coll)
{
    lara_col_stop(item, coll);
}

void lara_col_fastback(ITEM_INFO *item, COLL_INFO *coll)
{
    item->gravity_status = item->fallspeed = 0;
    lara.move_angle = item->pos.y_rot - 32768;
    coll->bad_pos = NO_BAD_POS;
    coll->bad_neg = -STEPUP_HEIGHT;
    coll->bad_ceiling = 0;
    coll->slopes_are_pits = 1;
    coll->slopes_are_walls = 1;
    GetLaraCollisionInfo(item, coll);
    if (LaraHitCeiling(item, coll))
        return;
    if (coll->mid_floor > 200)
    {
        item->anim_number = FALLBACK_A;
        item->frame_number = FALLBACK_F;
        item->current_anim_state = AS_FALLBACK;
        item->goal_anim_state = AS_FALLBACK;
        item->fallspeed = 0;
        item->gravity_status = 1;
        return;
    }
    if (LaraDeflectEdge(item, coll))
    {
        item->anim_number = STOP_A;
        item->frame_number = STOP_F;
    }
    item->pos.y_pos += coll->mid_floor;
}

void lara_col_turn_r(ITEM_INFO *item, COLL_INFO *coll)
{
    item->gravity_status = item->fallspeed = 0;
    lara.move_angle = item->pos.y_rot;
    coll->bad_pos = STEPUP_HEIGHT;
    coll->bad_neg = -STEPUP_HEIGHT;
    coll->bad_ceiling = 0;
    coll->slopes_are_pits = 1;
    coll->slopes_are_walls = 1;
    GetLaraCollisionInfo(item, coll);
    if (coll->mid_floor > 100)
    {
        item->anim_number = FALLDOWN_A;
        item->frame_number = FALLDOWN_F;
        item->current_anim_state = AS_FORWARDJUMP;
        item->goal_anim_state = AS_FORWARDJUMP;
        item->fallspeed = 0;
        item->gravity_status = 1;
        return;
    }
    if (TestLaraSlide(item, coll))
        return;
    item->pos.y_pos += coll->mid_floor;
}

void lara_col_turn_l(ITEM_INFO *item, COLL_INFO *coll)
{
    lara_col_turn_r(item, coll);
}

void lara_col_death(ITEM_INFO *item, COLL_INFO *coll)
{
    lara.move_angle = item->pos.y_rot;
    coll->bad_pos = STEPUP_HEIGHT;
    coll->bad_neg = -STEPUP_HEIGHT;
    coll->bad_ceiling = 0;
    coll->radius = LARA_RAD * 4;
    GetLaraCollisionInfo(item, coll);
    ShiftItem(item, coll);
    item->pos.y_pos += coll->mid_floor;
    item->hit_points = -1;
    lara.air = -1;
}

void lara_col_fastfall(ITEM_INFO *item, COLL_INFO *coll)
{
    item->gravity_status = 1;
    coll->bad_pos = NO_BAD_POS;
    coll->bad_neg = -STEPUP_HEIGHT;
    coll->bad_ceiling = BAD_JUMP_CEILING;
    GetLaraCollisionInfo(item, coll);
    LaraSlideEdgeJump(item, coll);
    if (coll->mid_floor <= 0)
    {
        if (LaraLandedBad(item, coll))
            item->goal_anim_state = AS_DEATH;
        else
        {
            item->goal_anim_state = AS_STOP;
            item->current_anim_state = AS_STOP;
            item->frame_number = LANDFAR_F;
            item->anim_number = LANDFAR_A;
        }
        mn_stop_sound_effect(30, NULL);
        item->pos.y_pos += coll->mid_floor;
        item->gravity_status = 0;
        item->fallspeed = 0;
    }
}

void lara_col_hang(ITEM_INFO *item, COLL_INFO *coll)
{
    LaraHangTest(item, coll);
    if ((item->goal_anim_state == AS_HANG) && (input & IN_FORWARD))
    {
        if (coll->front_floor > -850 && coll->front_floor < -650 && coll->front_floor - coll->front_ceiling >= 0 && coll->left_floor - coll->left_ceiling >= 0 && coll->right_floor - coll->right_ceiling >= 0 && !coll->hit_static)
        {
            if (input & IN_SLOW)
                item->goal_anim_state = AS_GYMNAST;
            else
                item->goal_anim_state = AS_NULL;
        }
    }
}

void lara_col_reach(ITEM_INFO *item, COLL_INFO *coll)
{
    item->gravity_status = 1;
    lara.move_angle = item->pos.y_rot;
    coll->bad_pos = NO_BAD_POS;

    coll->bad_neg = 0;
    coll->bad_ceiling = BAD_JUMP_CEILING;
    GetLaraCollisionInfo(item, coll);
    if (LaraTestHangJump(item, coll))
        return;
    LaraSlideEdgeJump(item, coll);

    if (item->fallspeed > 0)
    {
        if (coll->mid_floor <= 0)
        {
            if (LaraLandedBad(item, coll))
                item->goal_anim_state = AS_DEATH;
            else
                item->goal_anim_state = AS_STOP;
            item->fallspeed = 0;
            item->pos.y_pos += coll->mid_floor;
            item->gravity_status = 0;
        }
    }
}

void lara_col_splat(ITEM_INFO *item, COLL_INFO *coll)
{
    lara.move_angle = item->pos.y_rot;
    coll->bad_pos = STEPUP_HEIGHT;
    coll->bad_neg = -STEPUP_HEIGHT;
    coll->bad_ceiling = 0;
    coll->slopes_are_pits = 1;
    coll->slopes_are_walls = 1;
    GetLaraCollisionInfo(item, coll);
    ShiftItem(item, coll);
}

void lara_col_land(ITEM_INFO *item, COLL_INFO *coll)
{
    lara_col_stop(item, coll);
}

void lara_col_compress(ITEM_INFO *item, COLL_INFO *coll)
{
    item->gravity_status = item->fallspeed = 0;
    coll->bad_pos = NO_BAD_POS;
    coll->bad_neg = NO_BAD_NEG;
    coll->bad_ceiling = 0;
    GetLaraCollisionInfo(item, coll);
    if (coll->mid_ceiling > -100)
    {
        item->goal_anim_state = AS_STOP;
        item->current_anim_state = AS_STOP;
        item->anim_number = STOP_A;
        item->frame_number = STOP_F;
        item->speed = 0;
        item->fallspeed = 0;
        item->gravity_status = 0;
        item->pos.x_pos = coll->old.x;
        item->pos.y_pos = coll->old.y;
        item->pos.z_pos = coll->old.z;
    }
}

void lara_col_back(ITEM_INFO *item, COLL_INFO *coll)
{
    item->gravity_status = item->fallspeed = 0;
    lara.move_angle = item->pos.y_rot - 32768;
    coll->bad_pos = STEPUP_HEIGHT;
    coll->bad_neg = -STEPUP_HEIGHT;
    coll->bad_ceiling = 0;
    coll->slopes_are_pits = 1;
    coll->slopes_are_walls = 1;
    GetLaraCollisionInfo(item, coll);
    if (LaraHitCeiling(item, coll))
        return;

    if (LaraDeflectEdge(item, coll))
    {
        item->anim_number = STOP_A;
        item->frame_number = STOP_F;
    }

    if (coll->mid_floor > STEP_L / 2 && coll->mid_floor < (STEP_L * 3) / 2)
    {
        if (item->frame_number >= 964 && item->frame_number <= 993)
        {
            item->anim_number = BACKSTEPD_RIGHT_A;
            item->frame_number = BACKSTEPD_RIGHT_F;
        }
        else
        {
            item->anim_number = BACKSTEPD_LEFT_A;
            item->frame_number = BACKSTEPD_LEFT_F;
        }
    }
    if (TestLaraSlide(item, coll))
        return;
    item->pos.y_pos += coll->mid_floor;
}

void lara_col_null(ITEM_INFO *item, COLL_INFO *coll)
{
    lara_default_col(item, coll);
}

void lara_col_fastturn(ITEM_INFO *item, COLL_INFO *coll)
{
    lara_col_stop(item, coll);
}

void lara_col_stepright(ITEM_INFO *item, COLL_INFO *coll)
{
    item->gravity_status = item->fallspeed = 0;
    lara.move_angle = item->pos.y_rot + 16384;
    coll->bad_pos = STEP_L / 2;
    coll->bad_neg = -STEP_L / 2;
    coll->bad_ceiling = 0;
    coll->slopes_are_pits = 1;
    coll->slopes_are_walls = 1;
    GetLaraCollisionInfo(item, coll);
    if (LaraHitCeiling(item, coll))
        return;
    if (LaraDeflectEdge(item, coll))
    {
        item->anim_number = STOP_A;
        item->frame_number = STOP_F;
        item->current_anim_state = AS_STOP;
        item->goal_anim_state = AS_STOP;
    }
    if (TestLaraSlide(item, coll))
        return;
    item->pos.y_pos += coll->mid_floor;
}

void lara_col_stepleft(ITEM_INFO *item, COLL_INFO *coll)
{
    item->gravity_status = item->fallspeed = 0;
    lara.move_angle = item->pos.y_rot - 16384;
    coll->bad_pos = STEP_L / 2;
    coll->bad_neg = -STEP_L / 2;
    coll->bad_ceiling = 0;
    coll->slopes_are_pits = 1;
    coll->slopes_are_walls = 1;
    GetLaraCollisionInfo(item, coll);
    if (LaraHitCeiling(item, coll))
        return;
    if (LaraDeflectEdge(item, coll))
    {
        item->anim_number = STOP_A;
        item->frame_number = STOP_F;
        item->current_anim_state = AS_STOP;
        item->goal_anim_state = AS_STOP;
    }
    if (TestLaraSlide(item, coll))
        return;
    item->pos.y_pos += coll->mid_floor;
}

void lara_col_slide(ITEM_INFO *item, COLL_INFO *coll)
{
    lara.move_angle = item->pos.y_rot;
    lara_slide_slope(item, coll);
}

void lara_col_backjump(ITEM_INFO *item, COLL_INFO *coll)
{
    lara.move_angle = item->pos.y_rot - 32768;
    lara_col_jumper(item, coll);
}

void lara_col_rightjump(ITEM_INFO *item, COLL_INFO *coll)
{
    lara.move_angle = item->pos.y_rot + 16384;
    lara_col_jumper(item, coll);
}

void lara_col_leftjump(ITEM_INFO *item, COLL_INFO *coll)
{
    lara.move_angle = item->pos.y_rot - 16384;
    lara_col_jumper(item, coll);
}

void lara_col_upjump(ITEM_INFO *item, COLL_INFO *coll)
{
    lara.move_angle = item->pos.y_rot;
    coll->bad_pos = NO_BAD_POS;
    coll->bad_neg = -STEPUP_HEIGHT;
    coll->bad_ceiling = BAD_JUMP_CEILING;
    coll->facing = lara.move_angle;
    GetCollisionInfo(coll, item->pos.x_pos, item->pos.y_pos, item->pos.z_pos, item->room_number, 870);
    if (LaraTestHangJumpUp(item, coll))
        return;
    LaraSlideEdgeJump(item, coll);
    if (item->fallspeed > 0)
    {
        if (coll->mid_floor <= 0)
        {
            if (LaraLandedBad(item, coll))
                item->goal_anim_state = AS_DEATH;
            else
                item->goal_anim_state = AS_STOP;
            item->fallspeed = 0;
            item->pos.y_pos += coll->mid_floor;
            item->gravity_status = 0;
        }
    }
}

void lara_col_fallback(ITEM_INFO *item, COLL_INFO *coll)
{
    lara.move_angle = item->pos.y_rot - 32768;
    coll->bad_pos = NO_BAD_POS;
    coll->bad_neg = -STEPUP_HEIGHT;
    coll->bad_ceiling = BAD_JUMP_CEILING;
    GetLaraCollisionInfo(item, coll);
    LaraDeflectEdgeJump(item, coll);
    if (coll->mid_floor <= 0 && item->fallspeed > 0)
    {
        if (LaraLandedBad(item, coll))
            item->goal_anim_state = AS_DEATH;
        else
            item->goal_anim_state = AS_STOP;
        item->fallspeed = 0;
        item->pos.y_pos += coll->mid_floor;
        item->gravity_status = 0;
    }
}

void lara_col_hangleft(ITEM_INFO *item, COLL_INFO *coll)
{
    lara.move_angle = item->pos.y_rot - 16384;
    LaraHangTest(item, coll);
    lara.move_angle = item->pos.y_rot - 16384;
}

void lara_col_hangright(ITEM_INFO *item, COLL_INFO *coll)
{
    lara.move_angle = item->pos.y_rot + 16384;
    LaraHangTest(item, coll);
    lara.move_angle = item->pos.y_rot + 16384;
}

void lara_col_slideback(ITEM_INFO *item, COLL_INFO *coll)
{
    lara.move_angle = item->pos.y_rot - 32768;
    lara_slide_slope(item, coll);
}

void lara_col_pushblock(ITEM_INFO *item, COLL_INFO *coll)
{
    lara_default_col(item, coll);
}

void lara_col_pullblock(ITEM_INFO *item, COLL_INFO *coll)
{
    lara_default_col(item, coll);
}

void lara_col_ppready(ITEM_INFO *item, COLL_INFO *coll)
{
    lara_default_col(item, coll);
}

void lara_col_pickup(ITEM_INFO *item, COLL_INFO *coll)
{
    lara_default_col(item, coll);
}

void lara_col_switchon(ITEM_INFO *item, COLL_INFO *coll)
{
    lara_default_col(item, coll);
}

void lara_col_switchoff(ITEM_INFO *item, COLL_INFO *coll)
{
    lara_default_col(item, coll);
}

void lara_col_usekey(ITEM_INFO *item, COLL_INFO *coll)
{
    lara_default_col(item, coll);
}

void lara_default_col(ITEM_INFO *item, COLL_INFO *coll)
{
    lara.move_angle = item->pos.y_rot;
    coll->bad_pos = STEPUP_HEIGHT;
    coll->bad_neg = -STEPUP_HEIGHT;
    coll->bad_ceiling = 0;
    coll->slopes_are_pits = 1;
    coll->slopes_are_walls = 1;
    GetLaraCollisionInfo(item, coll);
}

void GetLaraCollisionInfo(ITEM_INFO *item, COLL_INFO *coll)
{
    coll->facing = lara.move_angle;
    GetCollisionInfo(coll, item->pos.x_pos, item->pos.y_pos, item->pos.z_pos, item->room_number, LARA_HITE);
}

#include "game.h"

LARA_INFO lara;
ITEM_INFO *lara_item;
int health_bar_timer = 0;

#define MAX_HEAD_ROTATION (44 * ONE_DEGREE)
#define MAX_HEAD_TILT (22 * ONE_DEGREE)
#define MIN_HEAD_TILT (-42 * ONE_DEGREE)
#define HEAD_TURN (2 * ONE_DEGREE)

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

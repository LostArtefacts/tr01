#include "game.h"

#define SURF_MAXSPEED (15 * 4)
#define SURF_RADIUS 100
#define SURF_HITE 700

#define MAX_HEAD_ROTATION_SURF (50 * ONE_DEGREE)
#define MAX_HEAD_TILT_SURF (40 * ONE_DEGREE)
#define MIN_HEAD_TILT_SURF (-40 * ONE_DEGREE)
#define HEAD_TURN_SURF (3 * ONE_DEGREE)

void LaraSurface(ITEM_INFO *item, COLL_INFO *coll)
{
    camera.target_elevation = -22 * ONE_DEGREE;

    coll->bad_pos = NO_BAD_POS;
    coll->bad_neg = -100;
    coll->bad_ceiling = 100;
    coll->old.x = item->pos.x_pos;
    coll->old.y = item->pos.y_pos;
    coll->old.z = item->pos.z_pos;
    coll->radius = SURF_RADIUS;
    coll->trigger = NULL;
    coll->slopes_are_walls = 0;
    coll->slopes_are_pits = 0;
    coll->lava_is_pit = 0;
    coll->enable_hit = 0;
    coll->enable_baddie_push = 0;

    (*lara_control_routines[item->current_anim_state])(item, coll);

    if (item->pos.z_rot >= -(2 * LARA_LEAN_UNDO) && item->pos.z_rot <= 2 * LARA_LEAN_UNDO)
        item->pos.z_rot = 0;
    else if (item->pos.z_rot < 0)
        item->pos.z_rot += 2 * LARA_LEAN_UNDO;
    else
        item->pos.z_rot -= 2 * LARA_LEAN_UNDO;

    if (camera.type != LOOK_CAMERA)
    {
        if (lara.head_y_rot > -HEAD_TURN_SURF && lara.head_y_rot < HEAD_TURN_SURF)
            lara.head_y_rot = 0;
        else
            lara.head_y_rot -= lara.head_y_rot / 8;
        lara.torso_y_rot = lara.head_y_rot / 2;
        if (lara.head_x_rot > -HEAD_TURN_SURF && lara.head_x_rot < HEAD_TURN_SURF)
            lara.head_x_rot = 0;
        else
            lara.head_x_rot -= lara.head_x_rot / 8;
        lara.torso_x_rot = 0;
    }

    if (lara.current_active && lara.water_status != LARA_CHEAT)
        LaraWaterCurrent(coll);

    AnimateLara(item);
    item->pos.x_pos += ((phd_sin(lara.move_angle) * item->fallspeed) >> (W2V_SHIFT + 2));
    item->pos.z_pos += ((phd_cos(lara.move_angle) * item->fallspeed) >> (W2V_SHIFT + 2));

    LaraBaddieCollision(item, coll);

    (*lara_collision_routines[item->current_anim_state])(item, coll);

    UpdateLaraRoom(item, 100);

    LaraGun();

    TestTriggers(coll->trigger, 0);
}

void lara_as_surfswim(ITEM_INFO *item, COLL_INFO *coll)
{
    if (item->hit_points <= 0)
    {
        item->goal_anim_state = AS_UWDEATH;
        return;
    }
    lara.dive_count = 0;
    if (input & IN_LEFT)
        item->pos.y_rot -= LARA_SLOW_TURN;
    else if (input & IN_RIGHT)
        item->pos.y_rot += LARA_SLOW_TURN;
    if (!(input & IN_FORWARD))
        item->goal_anim_state = AS_SURFTREAD;
    if (input & IN_JUMP)
        item->goal_anim_state = AS_SURFTREAD;

    item->fallspeed += 2 * 4;
    if (item->fallspeed > SURF_MAXSPEED)
        item->fallspeed = SURF_MAXSPEED;
}

void lara_as_surfback(ITEM_INFO *item, COLL_INFO *coll)
{
    if (item->hit_points <= 0)
    {
        item->goal_anim_state = AS_UWDEATH;
        return;
    }
    lara.dive_count = 0;
    if (input & IN_LEFT)
        item->pos.y_rot -= LARA_SLOW_TURN / 2;
    else if (input & IN_RIGHT)
        item->pos.y_rot += LARA_SLOW_TURN / 2;
    if (!(input & IN_BACK))
        item->goal_anim_state = AS_SURFTREAD;

    item->fallspeed += 2 * 4;
    if (item->fallspeed > SURF_MAXSPEED)
        item->fallspeed = SURF_MAXSPEED;
}

void lara_as_surfleft(ITEM_INFO *item, COLL_INFO *coll)
{
    if (item->hit_points <= 0)
    {
        item->goal_anim_state = AS_UWDEATH;
        return;
    }
    lara.dive_count = 0;
    if (input & IN_LEFT)
        item->pos.y_rot -= LARA_SLOW_TURN / 2;
    else if (input & IN_RIGHT)
        item->pos.y_rot += LARA_SLOW_TURN / 2;
    if (!(input & IN_STEPL))
        item->goal_anim_state = AS_SURFTREAD;

    item->fallspeed += 2 * 4;
    if (item->fallspeed > SURF_MAXSPEED)
        item->fallspeed = SURF_MAXSPEED;
}

void lara_as_surfright(ITEM_INFO *item, COLL_INFO *coll)
{
    if (item->hit_points <= 0)
    {
        item->goal_anim_state = AS_UWDEATH;
        return;
    }
    lara.dive_count = 0;
    if (input & IN_LEFT)
        item->pos.y_rot -= LARA_SLOW_TURN / 2;
    else if (input & IN_RIGHT)
        item->pos.y_rot += LARA_SLOW_TURN / 2;
    if (!(input & IN_STEPR))
        item->goal_anim_state = AS_SURFTREAD;

    item->fallspeed += 2 * 4;
    if (item->fallspeed > SURF_MAXSPEED)
        item->fallspeed = SURF_MAXSPEED;
}

void lara_as_surftread(ITEM_INFO *item, COLL_INFO *coll)
{
    item->fallspeed -= 4;
    if (item->fallspeed < 0)
        item->fallspeed = 0;

    if (item->hit_points <= 0)
    {
        item->goal_anim_state = AS_UWDEATH;
        return;
    }

    if (input & IN_LOOK)
    {
        camera.type = LOOK_CAMERA;
        if (input & IN_LEFT && lara.head_y_rot > -MAX_HEAD_ROTATION_SURF)
            lara.head_y_rot -= HEAD_TURN_SURF;
        else if (input & IN_RIGHT && lara.head_y_rot < MAX_HEAD_ROTATION_SURF)
            lara.head_y_rot += HEAD_TURN_SURF;
        lara.torso_y_rot = lara.head_y_rot / 2;
        if (input & IN_FORWARD && lara.head_x_rot > MIN_HEAD_TILT_SURF)
            lara.head_x_rot -= HEAD_TURN_SURF;
        else if (input & IN_BACK && lara.head_x_rot < MAX_HEAD_TILT_SURF)
            lara.head_x_rot += HEAD_TURN_SURF;
        lara.torso_x_rot = 0;
        return;
    }
    else if (camera.type == LOOK_CAMERA)
        camera.type = CHASE_CAMERA;

    if (input & IN_LEFT)
        item->pos.y_rot -= LARA_SLOW_TURN;
    else if (input & IN_RIGHT)
        item->pos.y_rot += LARA_SLOW_TURN;
    if (input & IN_FORWARD)
        item->goal_anim_state = AS_SURFSWIM;
    else if (input & IN_BACK)
        item->goal_anim_state = AS_SURFBACK;
    if (input & IN_STEPL)
        item->goal_anim_state = AS_SURFLEFT;
    else if (input & IN_STEPR)
        item->goal_anim_state = AS_SURFRIGHT;

    if (input & IN_JUMP)
    {
        lara.dive_count++;
        if (lara.dive_count == DIVE_COUNT)
        {
            item->goal_anim_state = AS_SWIM;
            item->current_anim_state = AS_DIVE;
            item->anim_number = SURFDIVE_A;
            item->frame_number = SURFDIVE_F;
            item->pos.x_rot = -45 * ONE_DEGREE;
            item->fallspeed = 20 * 4;
            lara.water_status = LARA_UNDERWATER;
        }
    }
    else
        lara.dive_count = 0;
}

void lara_col_surfswim(ITEM_INFO *item, COLL_INFO *coll)
{
    lara.move_angle = item->pos.y_rot;
    LaraSurfaceCollision(item, coll);
}

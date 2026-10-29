#include "game.h"

#define UW_MAXSPEED (50 * 4)
#define LARA_LEAN_MAX_UW (LARA_LEAN_MAX * 2)
#define WATER_FRICTION 6

void LaraUnderWater(ITEM_INFO *item, COLL_INFO *coll)
{
    coll->bad_pos = NO_BAD_POS;
    coll->bad_neg = -UW_HITE;
    coll->bad_ceiling = UW_HITE;
    coll->old.x = item->pos.x_pos;
    coll->old.y = item->pos.y_pos;
    coll->old.z = item->pos.z_pos;
    coll->radius = UW_RADIUS;
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

    if (item->pos.x_rot < -100 * ONE_DEGREE)
        item->pos.x_rot = -100 * ONE_DEGREE;
    else if (item->pos.x_rot > 100 * ONE_DEGREE)
        item->pos.x_rot = 100 * ONE_DEGREE;
    if (item->pos.z_rot < -LARA_LEAN_MAX_UW)
        item->pos.z_rot = -LARA_LEAN_MAX_UW;
    else if (item->pos.z_rot > LARA_LEAN_MAX_UW)
        item->pos.z_rot = LARA_LEAN_MAX_UW;

    if (lara.current_active && lara.water_status != LARA_CHEAT)
        LaraWaterCurrent(coll);

    AnimateLara(item);
    item->pos.y_pos -= (phd_sin(item->pos.x_rot) * item->fallspeed) >> (W2V_SHIFT + 2);
    item->pos.x_pos += (((phd_sin(item->pos.y_rot) * item->fallspeed) >> (W2V_SHIFT + 2)) * phd_cos(item->pos.x_rot)) >> W2V_SHIFT;
    item->pos.z_pos += (((phd_cos(item->pos.y_rot) * item->fallspeed) >> (W2V_SHIFT + 2)) * phd_cos(item->pos.x_rot)) >> W2V_SHIFT;

    if (lara.water_status != LARA_CHEAT)
        LaraBaddieCollision(item, coll);

    (*lara_collision_routines[item->current_anim_state])(item, coll);

    UpdateLaraRoom(item, 0);

    LaraGun();

    TestTriggers(coll->trigger, 0);
}

void lara_as_swim(ITEM_INFO *item, COLL_INFO *coll)
{
    if (item->hit_points <= 0)
    {
        item->goal_anim_state = AS_UWDEATH;
        return;
    }

    if (input & IN_FORWARD)
        item->pos.x_rot -= 2 * ONE_DEGREE;
    else if (input & IN_BACK)
        item->pos.x_rot += 2 * ONE_DEGREE;
    if (input & IN_LEFT)
    {
        item->pos.y_rot -= LARA_MED_TURN;
        item->pos.z_rot -= LARA_LEAN_RATE * 2;
    }
    else if (input & IN_RIGHT)
    {
        item->pos.y_rot += LARA_MED_TURN;
        item->pos.z_rot += LARA_LEAN_RATE * 2;
    }

    item->fallspeed += 2 * 4;
    if (item->fallspeed > UW_MAXSPEED)
        item->fallspeed = UW_MAXSPEED;

    if (!(input & IN_JUMP))
        item->goal_anim_state = AS_GLIDE;
}

void lara_as_glide(ITEM_INFO *item, COLL_INFO *coll)
{
    if (item->hit_points <= 0)
    {
        item->goal_anim_state = AS_UWDEATH;
        return;
    }

    if (input & IN_FORWARD)
        item->pos.x_rot -= 2 * ONE_DEGREE;
    else if (input & IN_BACK)
        item->pos.x_rot += 2 * ONE_DEGREE;
    if (input & IN_LEFT)
    {
        item->pos.y_rot -= LARA_MED_TURN;
        item->pos.z_rot -= LARA_LEAN_RATE * 2;
    }
    else if (input & IN_RIGHT)
    {
        item->pos.y_rot += LARA_MED_TURN;
        item->pos.z_rot += LARA_LEAN_RATE * 2;
    }

    if (input & IN_JUMP)
        item->goal_anim_state = AS_SWIM;

    item->fallspeed -= WATER_FRICTION;
    if (item->fallspeed < 0)
        item->fallspeed = 0;

    if (item->fallspeed <= (UW_MAXSPEED * 2) / 3)
        item->goal_anim_state = AS_TREAD;
}

void lara_as_tread(ITEM_INFO *item, COLL_INFO *coll)
{
    if (item->hit_points <= 0)
    {
        item->goal_anim_state = AS_UWDEATH;
        return;
    }

    if (input & IN_FORWARD)
        item->pos.x_rot -= 2 * ONE_DEGREE;
    else if (input & IN_BACK)
        item->pos.x_rot += 2 * ONE_DEGREE;
    if (input & IN_LEFT)
    {
        item->pos.y_rot -= LARA_MED_TURN;
        item->pos.z_rot -= LARA_LEAN_RATE * 2;
    }
    else if (input & IN_RIGHT)
    {
        item->pos.y_rot += LARA_MED_TURN;
        item->pos.z_rot += LARA_LEAN_RATE * 2;
    }
    if (input & IN_JUMP)
        item->goal_anim_state = AS_SWIM;

    item->fallspeed -= WATER_FRICTION;
    if (item->fallspeed < 0)
        item->fallspeed = 0;
}

void lara_as_dive(ITEM_INFO *item, COLL_INFO *coll)
{
    if (input & IN_FORWARD)
        item->pos.x_rot -= ONE_DEGREE;
}

void lara_as_uwdeath(ITEM_INFO *item, COLL_INFO *coll)
{
    item->fallspeed -= 8;
    if (item->fallspeed <= 0)
        item->fallspeed = 0;

    if (item->pos.x_rot >= -2 * ONE_DEGREE && item->pos.x_rot <= 2 * ONE_DEGREE)
        item->pos.x_rot = 0;
    else if (item->pos.x_rot < 0)
        item->pos.x_rot += 2 * ONE_DEGREE;
    else
        item->pos.x_rot -= 2 * ONE_DEGREE;
}

#define UW_WALLDEFLECT (2 * ONE_DEGREE)

void lara_col_swim(ITEM_INFO *item, COLL_INFO *coll)
{
    LaraSwimCollision(item, coll);
}

void lara_col_glide(ITEM_INFO *item, COLL_INFO *coll)
{
    LaraSwimCollision(item, coll);
}

void lara_col_tread(ITEM_INFO *item, COLL_INFO *coll)
{
    LaraSwimCollision(item, coll);
}

void lara_col_dive(ITEM_INFO *item, COLL_INFO *coll)
{
    LaraSwimCollision(item, coll);
}

void lara_col_uwdeath(ITEM_INFO *item, COLL_INFO *coll)
{
    int wh;

    item->hit_points = -1;
    lara.air = -1;
    lara.gun_status = LG_HANDSBUSY;
    wh = GetWaterHeight(item->pos.x_pos, item->pos.y_pos, item->pos.z_pos, item->room_number);
    if (wh != NO_HEIGHT && wh < item->pos.y_pos - 100)
        item->pos.y_pos -= 5;
    LaraSwimCollision(item, coll);
}

void LaraSwimCollision(ITEM_INFO *item, COLL_INFO *coll)
{
    if (item->pos.x_rot >= -16384 && item->pos.x_rot <= 16384)
        coll->facing = lara.move_angle = item->pos.y_rot;
    else
        coll->facing = lara.move_angle = item->pos.y_rot - 32768;
    GetCollisionInfo(coll, item->pos.x_pos, item->pos.y_pos + UW_HITE / 2, item->pos.z_pos, item->room_number, UW_HITE);
    ShiftItem(item, coll);
    if (coll->coll_type == COLL_FRONT)
    {
        if (item->pos.x_rot > 35 * ONE_DEGREE)
            item->pos.x_rot += UW_WALLDEFLECT;
        else if (item->pos.x_rot < -35 * ONE_DEGREE)
            item->pos.x_rot -= UW_WALLDEFLECT;
        else
            item->fallspeed = 0;
    }
    else if (coll->coll_type == COLL_TOP)
    {
        if (item->pos.x_rot >= -45 * ONE_DEGREE)
            item->pos.x_rot -= UW_WALLDEFLECT;
    }
    else if (coll->coll_type == COLL_TOPFRONT)
        item->fallspeed = 0;
    else if (coll->coll_type == COLL_LEFT)
        item->pos.y_rot += 5 * ONE_DEGREE;
    else if (coll->coll_type == COLL_RIGHT)
        item->pos.y_rot -= 5 * ONE_DEGREE;
    else if (coll->coll_type == COLL_CLAMP)
    {
        item->fallspeed = 0;
        return;
    }

    if (coll->mid_floor < 0)
    {
        item->pos.y_pos += coll->mid_floor;
        item->pos.x_rot += UW_WALLDEFLECT;
    }
}

void LaraWaterCurrent(COLL_INFO *coll)
{
    PHD_VECTOR target;
    ROOM_INFO *r;
    FLOOR_INFO *floor;
    ITEM_INFO *item;

    item = lara_item;
    r = &room[lara_item->room_number];
    floor = &r->floor[((item->pos.z_pos - r->z) >> WALL_SHIFT) + ((item->pos.x_pos - r->x) >> WALL_SHIFT) * r->x_size];
    item->box_number = floor->box;

    if (CalculateTarget(&target, item, &lara.LOT) == NO_TARGET)
        return;

    target.x -= item->pos.x_pos;
    if (target.x > lara.current_active)
        item->pos.x_pos += lara.current_active;
    else if (target.x < -lara.current_active)
        item->pos.x_pos -= lara.current_active;
    else
        item->pos.x_pos += target.x;

    target.z -= item->pos.z_pos;
    if (target.z > lara.current_active)
        item->pos.z_pos += lara.current_active;
    else if (target.z < -lara.current_active)
        item->pos.z_pos -= lara.current_active;
    else
        item->pos.z_pos += target.z;

    target.y -= item->pos.y_pos;
    if (target.y > lara.current_active)
        item->pos.y_pos += lara.current_active;
    else if (target.y < -lara.current_active)
        item->pos.y_pos -= lara.current_active;
    else
        item->pos.y_pos += target.y;

    lara.current_active = 0;

    coll->facing = (sint16)phd_atan((item->pos.z_pos - coll->old.z), (item->pos.x_pos - coll->old.x));
    GetCollisionInfo(coll, item->pos.x_pos, item->pos.y_pos + UW_HITE / 2, item->pos.z_pos, item->room_number, UW_HITE);
    if (coll->coll_type == COLL_FRONT)
    {
        if (item->pos.x_rot > 35 * ONE_DEGREE)
            item->pos.x_rot += UW_WALLDEFLECT;
        else if (item->pos.x_rot < -35 * ONE_DEGREE)
            item->pos.x_rot -= UW_WALLDEFLECT;
        else
            item->fallspeed = 0;
    }
    else if (coll->coll_type == COLL_TOP)
        item->pos.x_rot -= UW_WALLDEFLECT;
    else if (coll->coll_type == COLL_TOPFRONT)
        item->fallspeed = 0;
    else if (coll->coll_type == COLL_LEFT)
        item->pos.y_rot += 5 * ONE_DEGREE;
    else if (coll->coll_type == COLL_RIGHT)
        item->pos.y_rot -= 5 * ONE_DEGREE;

    if (coll->mid_floor < 0)
    {
        item->pos.y_pos += coll->mid_floor;
        item->pos.x_rot += UW_WALLDEFLECT;
    }
    ShiftItem(item, coll);

    coll->old.x = item->pos.x_pos;
    coll->old.y = item->pos.y_pos;
    coll->old.z = item->pos.z_pos;
}

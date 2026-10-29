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

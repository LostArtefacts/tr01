#include "game.h"

LARA_INFO lara;
ITEM_INFO *lara_item;
int health_bar_timer = 0;

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

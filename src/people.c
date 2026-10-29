#include "game.h"

#define PEOPLE_SHOOT_RANGE SQUARE(WALL_L * 7)

int Targetable(ITEM_INFO *item, AI_INFO *info)
{
    GAME_VECTOR start, target;

    if (info->ahead && info->distance < PEOPLE_SHOOT_RANGE)
    {
        start.x = item->pos.x_pos;
        start.y = item->pos.y_pos - STEP_L * 3;
        start.z = item->pos.z_pos;
        start.room_number = item->room_number;

        target.x = lara_item->pos.x_pos;
        target.y = lara_item->pos.y_pos - STEP_L * 3;
        target.z = lara_item->pos.z_pos;

        return LOS(&start, &target);
    }

    return 0;
}

void ControlGunShot(sint16 fx_number)
{
    FX_INFO *fx;

    fx = &effects[fx_number];
    fx->counter--;

    if (!fx->counter)
    {
        KillEffect(fx_number);
        return;
    }

    fx->pos.z_rot = (PHD_ANGLE)GetRandomControl();
}

sint16 GunShot(sint32 x, sint32 y, sint32 z, sint16 speed, PHD_ANGLE yrot, sint16 room_number)
{
    sint16 fx_number;
    FX_INFO *fx;

    fx_number = CreateEffect(room_number);
    if (fx_number != NO_ITEM)
    {
        fx = &effects[fx_number];
        fx->pos.x_pos = x;
        fx->pos.y_pos = y;
        fx->pos.z_pos = z;
        fx->room_number = room_number;
        fx->pos.x_rot = fx->pos.z_rot = 0;
        fx->pos.y_rot = yrot;
        fx->counter = 3;
        fx->frame_number = 0;
        fx->object_number = GUN_FLASH;
        fx->shade = 16 * 256;
    }

    return fx_number;
}

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

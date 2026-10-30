#include "game.h"

void InitialiseRollingBall(sint16 item_number)
{
    ITEM_INFO *item;
    GAME_VECTOR *old;

    item = &items[item_number];

    old = item->data = (GAME_VECTOR *)game_malloc(sizeof(GAME_VECTOR), ROLLINGBALL_STUFF);
    old->x = item->pos.x_pos;
    old->y = item->pos.y_pos;
    old->z = item->pos.z_pos;
    old->room_number = item->room_number;
}

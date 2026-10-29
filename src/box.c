#include "game.h"

int number_boxes;
int number_overlaps;
BOX_INFO *boxes;
uint16 *overlap;
sint16 *ground_zone[2], *ground_zone2[2], *fly_zone[2];

void InitialiseCreature(sint16 item_number)
{
    ITEM_INFO *item;

    item = &items[item_number];

    item->pos.y_rot += (GetRandomControl() - 0x4000) >> 1;
    item->collidable = 1;
    item->data = NULL;
}

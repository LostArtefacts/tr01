#include "game.h"

#define NUM_SLOTS 8

CREATURE_INFO *baddie_slots;
int slots_used = 0;

void InitialiseLOTarray(void)
{
    int i;
    CREATURE_INFO *creature;

    baddie_slots = (CREATURE_INFO *)game_malloc(NUM_SLOTS * sizeof(CREATURE_INFO), CREATURE_DATA);
    creature = baddie_slots;
    for (i = 0; i < NUM_SLOTS; i++, creature++)
    {
        creature->item_num = NO_ITEM;
        creature->LOT.node = (BOX_NODE *)game_malloc(sizeof(BOX_NODE) * number_boxes, CREATURE_LOT);
    }
    slots_used = 0;
}

void DisableBaddieAI(sint16 item_num)
{
    ITEM_INFO *item;
    CREATURE_INFO *creature;

    item = &items[item_num];
    creature = (CREATURE_INFO *)item->data;
    item->data = NULL;
    if (creature)
    {
        creature->item_num = NO_ITEM;
        slots_used--;
    }
}

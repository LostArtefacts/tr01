#include "game.h"

sint16 next_item_free;
sint16 next_item_active;
FX_INFO *effects;
sint16 next_fx_free;
sint16 next_fx_active;
int level_items = 0;

void InitialiseItemArray(int numitems)
{
    int i;
    ITEM_INFO *item;

    next_item_active = NO_ITEM;
    next_item_free = level_items;
    item = &items[level_items];
    for (i = level_items + 1; i < numitems; i++, item++)
        item->next_item = i;
    item->next_item = NO_ITEM;
}

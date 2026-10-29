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

void KillItem(sint16 item_num)
{
    sint16 linknum;
    ITEM_INFO *item;

    item = &items[item_num];
    linknum = next_item_active;
    if (linknum == item_num)
        next_item_active = item->next_active;
    else
    {
        for (; linknum != NO_ITEM; linknum = items[linknum].next_active)
        {
            if (items[linknum].next_active == item_num)
            {
                items[linknum].next_active = item->next_active;
                break;
            }
        }
    }

    linknum = room[item->room_number].item_number;
    if (linknum == item_num)
        room[item->room_number].item_number = item->next_item;
    else
    {
        for (; linknum != NO_ITEM; linknum = items[linknum].next_item)
        {
            if (items[linknum].next_item == item_num)
            {
                items[linknum].next_item = item->next_item;
                break;
            }
        }
    }

    if (item == lara.target)
        lara.target = NULL;
    if (item_num < level_items)
        item->flags |= KILLED_ITEM;
    else
    {
        item->next_item = next_item_free;
        next_item_free = item_num;
    }
}

sint16 CreateItem(void)
{
    sint16 item_num;

    if ((item_num = next_item_free) == NO_ITEM)
        return item_num;
    items[item_num].flags = 0;
    next_item_free = items[item_num].next_item;
    return item_num;
}

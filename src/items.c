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

void InitialiseItem(sint16 item_num)
{
    ITEM_INFO *item;
    ROOM_INFO *r;
    FLOOR_INFO *floor;

    item = &items[item_num];
    item->anim_number = objects[item->object_number].anim_index;
    item->frame_number = anims[item->anim_number].frame_base;
    item->current_anim_state = item->goal_anim_state = anims[item->anim_number].current_anim_state;
    item->required_anim_state = 0;
    item->pos.x_rot = item->pos.z_rot = 0;
    item->speed = item->fallspeed = 0;
    item->status = NOT_ACTIVE;
    item->active = 0;
    item->gravity_status = item->hit_status = item->looked_at = 0;
    item->hit_points = objects[item->object_number].hit_points;
    item->collidable = 1;
    item->timer = 0;
    item->mesh_bits = 0xffffffff;
    item->touch_bits = 0;
    item->data = NULL;

    if (item->flags & NOT_VISIBLE)
    {
        item->status = INVISIBLE;
        item->flags -= NOT_VISIBLE;
    }

    if ((item->flags & CODE_BITS) == CODE_BITS)
    {
        item->flags -= CODE_BITS;
        item->flags |= REVERSE;
        AddActiveItem(item_num);
        item->status = ACTIVE;
    }

    r = &room[item->room_number];
    item->next_item = r->item_number;
    r->item_number = item_num;
    floor = &r->floor[((item->pos.z_pos - r->z) >> WALL_SHIFT) + ((item->pos.x_pos - r->x) >> WALL_SHIFT) * r->x_size];
    item->floor = floor->floor << 8;

    if (savegame.bonus_flag)
        item->hit_points *= 2;

    if (objects[item->object_number].initialise)
        (*objects[item->object_number].initialise)(item_num);
}

void RemoveActiveItem(sint16 item_num)
{
    sint16 linknum;

    if (items[item_num].active == 0)
        S_ExitSystem("Item already deactive\n");

    items[item_num].active = 0;
    linknum = next_item_active;
    if (linknum == item_num)
    {
        next_item_active = items[item_num].next_active;
        return;
    }

    for (; linknum != NO_ITEM; linknum = items[linknum].next_active)
    {
        if (items[linknum].next_active == item_num)
        {
            items[linknum].next_active = items[item_num].next_active;
            return;
        }
    }
}

void RemoveDrawnItem(sint16 item_num)
{
    sint16 linknum;
    ITEM_INFO *item;

    item = &items[item_num];

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
                return;
            }
        }
    }
}

void AddActiveItem(sint16 item_num)
{
    ITEM_INFO *item;

    item = &items[item_num];

    if (objects[item->object_number].control == NULL)
    {
        item->status = NOT_ACTIVE;
        return;
    }

    if (item->active == 1)
    {
        sprintf(exit_message, "Item(%d)(Obj%d) already Active\n", item_num, item->object_number);
        S_ExitSystem(exit_message);
    }
    item->active = 1;
    item->next_active = next_item_active;
    next_item_active = item_num;
}

void ItemNewRoom(sint16 item_num, sint16 room_number)
{
    sint16 linknum;
    ROOM_INFO *r;
    ITEM_INFO *item;

    item = &items[item_num];
    r = &room[item->room_number];

    linknum = r->item_number;
    if (linknum == item_num)
        r->item_number = item->next_item;
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
    item->room_number = room_number;
    r = &room[room_number];
    item->next_item = r->item_number;
    r->item_number = item_num;
}

#include "game.h"
#include <string.h>

typedef struct doorpos_data
{
    FLOOR_INFO *floor;
    FLOOR_INFO data;
    sint16 block;
} DOORPOS_DATA;

typedef struct door_data
{
    DOORPOS_DATA d1, d1flip, d2, d2flip;
} DOOR_DATA;

enum cabin_anims
{
    CABIN_START,
    CABIN_DROP1,
    CABIN_DROP2,
    CABIN_DROP3,
    CABIN_FINISH
};

enum boat_anims
{
    BOAT_EMPTY,
    BOAT_SET,
    BOAT_MOVE,
    BOAT_STOP
};

void ShutThatDoor(DOORPOS_DATA *d)
{
    FLOOR_INFO *floor;

    if (d->floor)
    {
        floor = d->floor;
        floor->index = 0;
        floor->box = NO_BOX;
        floor->floor = floor->ceiling = NO_HEIGHT >> 8;
        floor->pit_room = floor->sky_room = NO_ROOM;

        if (d->block != NO_BOX)
            boxes[d->block].overlap_index |= BLOCKED;
    }
}

void OpenThatDoor(DOORPOS_DATA *d)
{
    if (d->floor)
    {
        memcpy(d->floor, &d->data, sizeof(FLOOR_INFO));

        if (d->block != NO_BOX)
            boxes[d->block].overlap_index &= (~BLOCKED);
    }
}

void DoorControl(sint16 item_number)
{
    ITEM_INFO *item;
    DOOR_DATA *door;

    item = &items[item_number];
    door = (DOOR_DATA *)item->data;

    if (TriggerActive(item))
    {
        if (item->current_anim_state == DOOR_CLOSED)
            item->goal_anim_state = DOOR_OPEN;
        else
        {
            OpenThatDoor(&door->d1);
            OpenThatDoor(&door->d2);
            OpenThatDoor(&door->d1flip);
            OpenThatDoor(&door->d2flip);
        }
    }
    else
    {
        if (item->current_anim_state == DOOR_OPEN)
            item->goal_anim_state = DOOR_CLOSED;
        else
        {
            ShutThatDoor(&door->d1);
            ShutThatDoor(&door->d2);
            ShutThatDoor(&door->d1flip);
            ShutThatDoor(&door->d2flip);
        }
    }

    AnimateItem(item);
}

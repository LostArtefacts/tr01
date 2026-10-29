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

int OnDrawBridge(ITEM_INFO *item, sint32 x, sint32 y)
{
    int ix, iy;

    ix = item->pos.z_pos >> WALL_SHIFT;
    iy = item->pos.x_pos >> WALL_SHIFT;

    x >>= WALL_SHIFT;
    y >>= WALL_SHIFT;

    if (item->pos.y_rot == 0 && y == iy && (x == ix - 1 || x == ix - 2))
        return 1;
    else if (item->pos.y_rot == -0x8000 && y == iy && (x == ix + 1 || x == ix + 2))
        return 1;
    else if (item->pos.y_rot == 0x4000 && x == ix && (y == iy - 1 || y == iy - 2))
        return 1;
    else if (item->pos.y_rot == -0x4000 && x == ix && (y == iy + 1 || y == iy + 2))
        return 1;

    return 0;
}

void DrawBridgeFloor(ITEM_INFO *item, sint32 x, sint32 y, sint32 z, sint16 *height)
{
    if (item->current_anim_state == DOOR_OPEN)
    {
        if (!OnDrawBridge(item, z, x))
            return;

        if (y <= item->pos.y_pos)
            *height = (sint16)item->pos.y_pos;
    }
}

void DrawBridgeCeiling(ITEM_INFO *item, sint32 x, sint32 y, sint32 z, sint16 *height)
{
    if (item->current_anim_state == DOOR_OPEN)
    {
        if (!OnDrawBridge(item, z, x))
            return;

        if (y > item->pos.y_pos)
            *height = (sint16)(item->pos.y_pos + STEP_L);
    }
}

void DrawBridgeCollision(sint16 item_num, ITEM_INFO *laraitem, COLL_INFO *coll)
{
    ITEM_INFO *item;

    item = &items[item_num];
    if (item->current_anim_state == DOOR_CLOSED)
        DoorCollision(item_num, laraitem, coll);
}

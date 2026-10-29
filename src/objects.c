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

void InitialiseDoor(sint16 item_number)
{
    int dx, dy;
    ITEM_INFO *item;
    ROOM_INFO *r, *b;
    DOOR_DATA *door;
    sint16 two_room, box_number, room_number;

    item = &items[item_number];

    door = item->data = (DOOR_DATA *)game_malloc(sizeof(DOOR_DATA), EXTRA_DOOR_STUFF);

    dx = dy = 0;
    if (item->pos.y_rot == 0)
        dx--;
    else if (item->pos.y_rot == -0x8000)
        dx++;
    else if (item->pos.y_rot == 0x4000)
        dy--;
    else
        dy++;

    r = &room[item->room_number];

    door->d1.floor = &r->floor[(((item->pos.z_pos - r->z) >> WALL_SHIFT) + dx) + (((item->pos.x_pos - r->x) >> WALL_SHIFT) + dy) * r->x_size];
    room_number = GetDoor(door->d1.floor);
    if (room_number == NO_ROOM)
        box_number = door->d1.floor->box;
    else
    {
        b = &room[room_number];
        box_number = b->floor[(((item->pos.z_pos - b->z) >> WALL_SHIFT) + dx) + (((item->pos.x_pos - b->x) >> WALL_SHIFT) + dy) * b->x_size].box;
    }
    door->d1.block = (boxes[box_number].overlap_index & BLOCKABLE) ? box_number : NO_BOX;

    memcpy(&door->d1.data, door->d1.floor, sizeof(FLOOR_INFO));

    if (r->flipped_room != -1)
    {
        r = &room[r->flipped_room];

        door->d1flip.floor = &r->floor[(((item->pos.z_pos - r->z) >> WALL_SHIFT) + dx) + (((item->pos.x_pos - r->x) >> WALL_SHIFT) + dy) * r->x_size];
        room_number = GetDoor(door->d1flip.floor);
        if (room_number == NO_ROOM)
            box_number = door->d1flip.floor->box;
        else
        {
            b = &room[room_number];
            box_number = b->floor[(((item->pos.z_pos - b->z) >> WALL_SHIFT) + dx) + (((item->pos.x_pos - b->x) >> WALL_SHIFT) + dy) * b->x_size].box;
        }
        door->d1flip.block = (boxes[box_number].overlap_index & BLOCKABLE) ? box_number : NO_BOX;

        memcpy(&door->d1flip.data, door->d1flip.floor, sizeof(FLOOR_INFO));
    }
    else
        door->d1flip.floor = NULL;

    two_room = GetDoor(door->d1.floor);

    ShutThatDoor(&door->d1);
    ShutThatDoor(&door->d1flip);

    if (two_room == NO_ROOM)
    {
        door->d2.floor = NULL;
        door->d2flip.floor = NULL;
    }
    else
    {
        r = &room[two_room];

        door->d2.floor = &r->floor[((item->pos.z_pos - r->z) >> WALL_SHIFT) + ((item->pos.x_pos - r->x) >> WALL_SHIFT) * r->x_size];
        room_number = GetDoor(door->d2.floor);
        if (room_number == NO_ROOM)
            box_number = door->d2.floor->box;
        else
        {
            b = &room[room_number];
            box_number = b->floor[((item->pos.z_pos - b->z) >> WALL_SHIFT) + ((item->pos.x_pos - b->x) >> WALL_SHIFT) * b->x_size].box;
        }
        door->d2.block = (boxes[box_number].overlap_index & BLOCKABLE) ? box_number : NO_BOX;

        memcpy(&door->d2.data, door->d2.floor, sizeof(FLOOR_INFO));

        if (r->flipped_room != -1)
        {
            r = &room[r->flipped_room];

            door->d2flip.floor = &r->floor[((item->pos.z_pos - r->z) >> WALL_SHIFT) + ((item->pos.x_pos - r->x) >> WALL_SHIFT) * r->x_size];
            room_number = GetDoor(door->d2flip.floor);
            if (room_number == NO_ROOM)
                box_number = door->d2flip.floor->box;
            else
            {
                b = &room[room_number];
                box_number = b->floor[((item->pos.z_pos - b->z) >> WALL_SHIFT) + ((item->pos.x_pos - b->x) >> WALL_SHIFT) * b->x_size].box;
            }
            door->d2flip.block = (boxes[box_number].overlap_index & BLOCKABLE) ? box_number : NO_BOX;

            memcpy(&door->d2flip.data, door->d2flip.floor, sizeof(FLOOR_INFO));
        }
        else
            door->d2flip.floor = NULL;

        ShutThatDoor(&door->d2);
        ShutThatDoor(&door->d2flip);
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

void BridgeFlatFloor(ITEM_INFO *item, sint32 x, sint32 y, sint32 z, sint16 *height)
{
    if (y <= item->pos.y_pos)
        *height = (sint16)item->pos.y_pos;
}

void BridgeFlatCeiling(ITEM_INFO *item, sint32 x, sint32 y, sint32 z, sint16 *height)
{
    if (y > item->pos.y_pos)
        *height = (sint16)(item->pos.y_pos + STEP_L);
}

sint32 GetOffset(ITEM_INFO *item, sint32 x, sint32 z)
{
    if (item->pos.y_rot == 0)
        return (WALL_L - x) & (WALL_L - 1);
    else if (item->pos.y_rot == -0x8000)
        return x & (WALL_L - 1);
    else if (item->pos.y_rot == 0x4000)
        return z & (WALL_L - 1);
    return (WALL_L - z) & (WALL_L - 1);
}

void BridgeTilt1Floor(ITEM_INFO *item, sint32 x, sint32 y, sint32 z, sint16 *height)
{
    sint32 level;

    level = item->pos.y_pos + (GetOffset(item, x, z) >> 2);
    if (y <= level)
        *height = (sint16)level;
}

void BridgeTilt1Ceiling(ITEM_INFO *item, sint32 x, sint32 y, sint32 z, sint16 *height)
{
    sint32 level;

    level = item->pos.y_pos + (GetOffset(item, x, z) >> 2);
    if (y > level)
        *height = (sint16)(level + STEP_L);
}

void BridgeTilt2Floor(ITEM_INFO *item, sint32 x, sint32 y, sint32 z, sint16 *height)
{
    sint32 level;

    level = item->pos.y_pos + (GetOffset(item, x, z) >> 1);
    if (y <= level)
        *height = (sint16)level;
}

void BridgeTilt2Ceiling(ITEM_INFO *item, sint32 x, sint32 y, sint32 z, sint16 *height)
{
    sint32 level;

    level = item->pos.y_pos + (GetOffset(item, x, z) >> 1);
    if (y > level)
        *height = (sint16)(level + STEP_L);
}

void CogControl(sint16 item_number)
{
    ITEM_INFO *item;
    sint16 room_number;

    item = &items[item_number];

    if (TriggerActive(item))
        item->goal_anim_state = DOOR_OPEN;
    else
        item->goal_anim_state = DOOR_CLOSED;

    AnimateItem(item);

    room_number = item->room_number;
    GetFloor(item->pos.x_pos, item->pos.y_pos, item->pos.z_pos, &room_number);
    if (room_number != item->room_number)
        ItemNewRoom(item_number, room_number);
}

void CabinControl(sint16 item_number)
{
    ITEM_INFO *item;

    item = &items[item_number];

    if ((item->flags & CODE_BITS) == CODE_BITS)
    {
        switch (item->current_anim_state)
        {
        case CABIN_START:
            item->goal_anim_state = CABIN_DROP1;
            break;
        case CABIN_DROP1:
            item->goal_anim_state = CABIN_DROP2;
            break;
        case CABIN_DROP2:
            item->goal_anim_state = CABIN_DROP3;
            break;
        }
        item->flags = 0;
    }

    if (item->current_anim_state == CABIN_FINISH)
    {
        flipmap[3] = CODE_BITS;
        FlipMap();
        KillItem(item_number);
    }

    AnimateItem(item);
}

void BoatControl(sint16 item_number)
{
    ITEM_INFO *item;

    item = &items[item_number];

    switch (item->current_anim_state)
    {
    case BOAT_SET:
        item->goal_anim_state = BOAT_MOVE;
        break;
    case BOAT_MOVE:
        item->goal_anim_state = BOAT_STOP;
        break;
    case BOAT_STOP:
        KillItem(item_number);
        break;
    }

    AnimateItem(item);
}

void ScionControl(sint16 item_number)
{
    AnimateItem(&items[item_number]);
}

void Scion3Control(sint16 item_number)
{
    static int count = 0;
    ITEM_INFO *item;
    FLOOR_INFO *floor;
    FX_INFO *fx;
    sint16 room_number;
    sint16 fx_num;

    item = &items[item_number];
    if (item->hit_points <= 0)
    {
        if (count == 0)
        {
            item->status = INVISIBLE;
            item->hit_points = DONT_TARGET;
            room_number = item->room_number;
            floor = GetFloor(item->pos.x_pos, item->pos.y_pos, item->pos.z_pos, &room_number);
            GetHeight(floor, item->pos.x_pos, item->pos.y_pos, item->pos.z_pos);
            TestTriggers(trigger_index, 1);
            RemoveDrawnItem(item_number);
        }

        if ((count % 10) == 0)
        {
            if ((fx_num = CreateEffect(item->room_number)) != NO_ITEM)
            {
                fx = &effects[fx_num];
                fx->pos.x_pos = item->pos.x_pos + (GetRandomControl() - 0x4000) / 32;
                fx->pos.y_pos = item->pos.y_pos + (GetRandomControl() - 0x4000) / 256 - 500;
                fx->pos.z_pos = item->pos.z_pos + (GetRandomControl() - 0x4000) / 32;
                fx->speed = 0;
                fx->frame_number = 0;
                fx->object_number = EXPLOSION1;
                fx->counter = 0;
                SoundEffect(104, &fx->pos, NULL);
                camera.bounce = -200;
            }
        }

        count++;
        if (count == 30 * 3)
            RemoveActiveItem(item_number);
    }
    else
    {
        count = 0;
        AnimateItem(item);
    }
}

void EarthQuake(sint16 item_number)
{
    int random;

    if (TriggerActive(&items[item_number]))
    {
        random = GetRandomDraw();

        if (random < 0x100)
        {
            camera.bounce = -150;
            SoundEffect(147, NULL, NULL);
        }
        else if (GetRandomControl() < 0x400)
        {
            camera.bounce = 50;
            SoundEffect(70, NULL, NULL);
        }
    }
}

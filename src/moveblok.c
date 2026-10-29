#include "game.h"

enum block_states
{
    STILL = 1,
    PUSH,
    PULL
};

#define MAXOFF_MB 300
#define MAXOFF_Z (LARA_RAD + 80)

static sint16 MovingBlockBounds[12] = {
    -MAXOFF_MB, +MAXOFF_MB,
    0, 0,
    -WALL_L / 2 - MAXOFF_Z, -WALL_L / 2,
    -10 * ONE_DEGREE, +10 * ONE_DEGREE,
    -30 * ONE_DEGREE, +30 * ONE_DEGREE,
    -10 * ONE_DEGREE, +10 * ONE_DEGREE};

void InitialiseMovingBlock(sint16 item_num)
{
    ITEM_INFO *item;

    item = &items[item_num];

    if (item->status != INVISIBLE)
        AlterFloorHeight(item, -1024);
}

void MovableBlock(sint16 item_number)
{
    ITEM_INFO *item;
    FLOOR_INFO *floor;
    int height;
    sint16 room_number;

    item = &items[item_number];

    if (item->flags & ONESHOT)
    {
        AlterFloorHeight(item, 1024);
        KillItem(item_number);
        return;
    }

    AnimateItem(item);

    room_number = item->room_number;
    floor = GetFloor(item->pos.x_pos, item->pos.y_pos, item->pos.z_pos, &room_number);
    height = GetHeight(floor, item->pos.x_pos, item->pos.y_pos, item->pos.z_pos);

    if (item->pos.y_pos < height)
        item->gravity_status = 1;
    else if (item->gravity_status)
    {
        item->gravity_status = 0;
        item->pos.y_pos = height;
        item->status = DEACTIVATED;
        dino_stomp_effect(item);
        SoundEffect(70, &item->pos, 0);
    }

    if (item->room_number != room_number)
        ItemNewRoom(item_number, room_number);
    if (item->status == DEACTIVATED)
    {
        item->status = NOT_ACTIVE;
        RemoveActiveItem(item_number);
        AlterFloorHeight(item, -1024);

        room_number = item->room_number;
        floor = GetFloor(item->pos.x_pos, item->pos.y_pos, item->pos.z_pos, &room_number);
        GetHeight(floor, item->pos.x_pos, item->pos.y_pos, item->pos.z_pos);
        TestTriggers(trigger_index, 1);
    }
}

void MovableBlockCollision(sint16 item_num, ITEM_INFO *laraitem, COLL_INFO *coll)
{
    uint16 quadrant;
    ITEM_INFO *item;

    item = &items[item_num];
    if (!(input & IN_ACTION) || item->status == ACTIVE || laraitem->gravity_status || laraitem->pos.y_pos != item->pos.y_pos)
        return;

    quadrant = (uint16)(laraitem->pos.y_rot + 0x2000) / 0x4000;
    if (laraitem->current_anim_state == AS_STOP)
    {
        if (input & IN_FORWARD || input & IN_BACK || lara.gun_status != LG_ARMLESS)
            return;

        switch (quadrant)
        {
        case NORTH:
            item->pos.y_rot = 0;
            break;

        case EAST:
            item->pos.y_rot = 16384;
            break;

        case SOUTH:
            item->pos.y_rot = -32768;
            break;

        case WEST:
            item->pos.y_rot = -16384;
            break;
        }
        if (!TestLaraPosition(MovingBlockBounds, item, laraitem))
            return;

        switch (quadrant)
        {
        case NORTH:
            laraitem->pos.z_pos &= -WALL_L;
            laraitem->pos.z_pos += WALL_L - LARA_RAD;
            break;

        case SOUTH:
            laraitem->pos.z_pos &= -WALL_L;
            laraitem->pos.z_pos += LARA_RAD;
            break;

        case EAST:
            laraitem->pos.x_pos &= -WALL_L;
            laraitem->pos.x_pos += WALL_L - LARA_RAD;
            break;

        case WEST:
            laraitem->pos.x_pos &= -WALL_L;
            laraitem->pos.x_pos += LARA_RAD;
            break;
        }
        laraitem->pos.y_rot = item->pos.y_rot;
        laraitem->goal_anim_state = AS_PPREADY;
        AnimateLara(laraitem);
        if (laraitem->current_anim_state == AS_PPREADY)
            lara.gun_status = LG_HANDSBUSY;
    }
    else if (laraitem->current_anim_state == AS_PPREADY)
    {
        if (laraitem->frame_number != PPREADY_F)
            return;
        if (!TestLaraPosition(MovingBlockBounds, item, laraitem))
            return;
        if (input & IN_FORWARD)
        {
            if (!TestBlockPush(item, 1024, quadrant))
                return;
            item->goal_anim_state = PUSH;
            laraitem->goal_anim_state = AS_PUSHBLOCK;
        }
        else if (input & IN_BACK)
        {
            if (!TestBlockPull(item, 1024, quadrant))
                return;
            item->goal_anim_state = PULL;
            laraitem->goal_anim_state = AS_PULLBLOCK;
        }
        else
            return;
        AddActiveItem(item_num);
        AlterFloorHeight(item, 1024);
        item->status = ACTIVE;
        AnimateItem(item);
        AnimateLara(laraitem);
    }
}

int TestBlockMovable(ITEM_INFO *item, int blokhite)
{
    sint16 room_number;
    FLOOR_INFO *floor;

    room_number = item->room_number;
    floor = GetFloor(item->pos.x_pos, item->pos.y_pos, item->pos.z_pos, &room_number);
    if (floor->floor == NO_HEIGHT / 256)
        return 1;

    if (floor->floor * 256 != item->pos.y_pos - blokhite)
        return 0;

    return 1;
}

int TestBlockPush(ITEM_INFO *item, int blokhite, uint16 quadrant)
{
    COLL_INFO scoll;
    FLOOR_INFO *floor;
    sint32 x, y, z, cmax;
    sint16 room_num;

    if (!TestBlockMovable(item, blokhite))
        return 0;

    x = item->pos.x_pos;
    y = item->pos.y_pos;
    z = item->pos.z_pos;
    room_num = item->room_number;
    switch (quadrant)
    {
    case NORTH:
        z += WALL_L;
        break;

    case EAST:
        x += WALL_L;
        break;

    case SOUTH:
        z -= WALL_L;
        break;

    case WEST:
        x -= WALL_L;
        break;
    }

    floor = GetFloor(x, y, z, &room_num);
    scoll.quadrant = quadrant;
    scoll.radius = 500;
    if (CollideStaticObjects(&scoll, x, y, z, room_num, 1000))
        return 0;

    if (((sint32)floor->floor << 8) != y)
        return 0;

    cmax = y - blokhite;
    floor = GetFloor(x, cmax, z, &room_num);
    if (((sint32)floor->ceiling << 8) > cmax)
        return 0;

    return 1;
}

int TestBlockPull(ITEM_INFO *item, int blokhite, uint16 quadrant)
{
    COLL_INFO scoll;
    FLOOR_INFO *floor;
    sint32 x, y, z, zadd, xadd, cmax;
    sint16 room_num;

    if (!TestBlockMovable(item, blokhite))
        return 0;

    xadd = zadd = 0;
    switch (quadrant)
    {
    case NORTH:
        zadd = -WALL_L;
        break;

    case EAST:
        xadd = -WALL_L;
        break;

    case SOUTH:
        zadd = WALL_L;
        break;

    case WEST:
        xadd = WALL_L;
        break;
    }

    x = item->pos.x_pos + xadd;
    y = item->pos.y_pos;
    z = item->pos.z_pos + zadd;
    room_num = item->room_number;
    floor = GetFloor(x, y, z, &room_num);
    scoll.quadrant = quadrant;
    scoll.radius = 500;
    if (CollideStaticObjects(&scoll, x, y, z, room_num, 1000))
        return 0;

    if (((sint32)floor->floor << 8) != y)
        return 0;

    cmax = y - blokhite;
    floor = GetFloor(x, cmax, z, &room_num);
    if (((sint32)floor->ceiling << 8) > cmax)
        return 0;

    x += xadd;
    z += zadd;
    room_num = item->room_number;
    floor = GetFloor(x, y, z, &room_num);

    if (((sint32)floor->floor << 8) != y)
        return 0;

    cmax = y - LARA_HITE;
    floor = GetFloor(x, cmax, z, &room_num);
    if (((sint32)floor->ceiling << 8) > cmax)
        return 0;

    x = lara_item->pos.x_pos + xadd;
    y = lara_item->pos.y_pos;
    z = lara_item->pos.z_pos + zadd;
    room_num = lara_item->room_number;
    floor = GetFloor(x, y, z, &room_num);
    scoll.quadrant = (quadrant + 2) & 3;
    scoll.radius = LARA_RAD;
    if (CollideStaticObjects(&scoll, x, y, z, room_num, LARA_HITE))
        return 0;

    return 1;
}

enum rb_states
{
    RB_START,
    RB_END,
    RB_MOVING
};

void InitialiseRollingBlock(sint16 item_num)
{
    ITEM_INFO *item;

    item = &items[item_num];
    AlterFloorHeight(item, -2048);
}

void RollingBlock(sint16 item_number)
{
    ITEM_INFO *item;
    FLOOR_INFO *floor;
    sint16 room_number;

    item = &items[item_number];
    if (TriggerActive(item))
    {
        if (item->current_anim_state == RB_START)
        {
            item->goal_anim_state = RB_END;
            AlterFloorHeight(item, +2048);
        }
    }
    else if (item->current_anim_state == RB_END)
    {
        item->goal_anim_state = RB_START;
        AlterFloorHeight(item, +2048);
    }

    AnimateItem(item);
    room_number = item->room_number;
    floor = GetFloor(item->pos.x_pos, item->pos.y_pos, item->pos.z_pos, &room_number);
    if (item->room_number != room_number)
        ItemNewRoom(item_number, room_number);

    if (item->status == DEACTIVATED)
    {
        item->status = ACTIVE;
        AlterFloorHeight(item, -2048);
        item->pos.x_pos &= -WALL_L;
        item->pos.x_pos += WALL_L / 2;
        item->pos.z_pos &= -WALL_L;
        item->pos.z_pos += WALL_L / 2;
    }
}

void AlterFloorHeight(ITEM_INFO *item, int height)
{
    FLOOR_INFO *floor, *ceiling;
    sint16 room_num;

    room_num = item->room_number;
    floor = GetFloor(item->pos.x_pos, item->pos.y_pos, item->pos.z_pos, &room_num);
    ceiling = GetFloor(item->pos.x_pos, item->pos.y_pos + height - WALL_L, item->pos.z_pos, &room_num);
    if (floor->floor == NO_HEIGHT / 256)
        floor->floor = ceiling->ceiling + height / 256;
    else
    {
        floor->floor += height / 256;
        if (floor->floor == ceiling->ceiling)
            floor->floor = NO_HEIGHT / 256;
    }

    if (boxes[floor->box].overlap_index & BLOCKABLE)
    {
        if (height < 0)
            boxes[floor->box].overlap_index |= BLOCKED;
        else
            boxes[floor->box].overlap_index &= (~BLOCKED);
    }
}

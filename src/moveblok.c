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

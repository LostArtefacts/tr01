#include "game.h"

#define SPIKE_DAMAGE 15
#define ROLLINGBALL_DAMAGE_AIR 100

int OnTrapDoor(ITEM_INFO *item, sint32 x, sint32 z);

void InitialiseRollingBall(sint16 item_number)
{
    ITEM_INFO *item;
    GAME_VECTOR *old;

    item = &items[item_number];

    old = item->data = (GAME_VECTOR *)game_malloc(sizeof(GAME_VECTOR), ROLLINGBALL_STUFF);
    old->x = item->pos.x_pos;
    old->y = item->pos.y_pos;
    old->z = item->pos.z_pos;
    old->room_number = item->room_number;
}

void RollingBallControl(sint16 item_number)
{
    sint32 x, z;
    sint32 oldx, oldz;
    ITEM_INFO *item;
    FLOOR_INFO *floor;
    GAME_VECTOR *old;
    ROOM_INFO *r;
    sint16 room_number;

    item = &items[item_number];
    if (item->status == ACTIVE)
    {
        if (item->pos.y_pos < item->floor)
        {
            if (!item->gravity_status)
            {
                item->gravity_status = 1;
                item->fallspeed = -10;
            }
        }
        else if (item->current_anim_state == TRAP_SET)
            item->goal_anim_state = TRAP_ACTIVATE;

        oldx = item->pos.x_pos;
        oldz = item->pos.z_pos;
        AnimateItem(item);

        room_number = item->room_number;
        floor = GetFloor(item->pos.x_pos, item->pos.y_pos, item->pos.z_pos, &room_number);
        if (item->room_number != room_number)
            ItemNewRoom(item_number, room_number);

        item->floor = GetHeight(floor, item->pos.x_pos, item->pos.y_pos, item->pos.z_pos);

        TestTriggers(trigger_index, 1);

        if (item->pos.y_pos >= item->floor - STEP_L)
        {
            item->gravity_status = 0;
            item->fallspeed = 0;
            item->pos.y_pos = item->floor;
        }

        x = item->pos.x_pos + ((WALL_L / 2) * phd_sin(item->pos.y_rot) >> W2V_SHIFT);
        z = item->pos.z_pos + ((WALL_L / 2) * phd_cos(item->pos.y_rot) >> W2V_SHIFT);
        floor = GetFloor(x, item->pos.y_pos, z, &room_number);
        if (GetHeight(floor, x, item->pos.y_pos, z) < item->pos.y_pos)
        {
            item->status = DEACTIVATED;
            item->pos.y_pos = item->floor;
            item->pos.x_pos = oldx;
            item->pos.z_pos = oldz;
            item->speed = item->fallspeed = 0;
            item->touch_bits = 0;
        }
    }
    else if (item->status == DEACTIVATED)
    {
        if (!TriggerActive(item))
        {
            item->status = NOT_ACTIVE;
            old = (GAME_VECTOR *)item->data;
            item->pos.x_pos = old->x;
            item->pos.y_pos = old->y;
            item->pos.z_pos = old->z;
            if (item->room_number != old->room_number)
            {
                RemoveDrawnItem(item_number);
                r = &room[old->room_number];
                item->next_item = r->item_number;
                r->item_number = item_number;
                item->room_number = old->room_number;
            }
            item->current_anim_state = item->goal_anim_state = TRAP_SET;
            item->anim_number = objects[item->object_number].anim_index;
            item->frame_number = anims[item->anim_number].frame_base;
            item->current_anim_state = item->goal_anim_state = anims[item->anim_number].current_anim_state;
            item->required_anim_state = 0;
            RemoveActiveItem(item_number);
        }
    }
}

void RollingBallCollision(sint16 item_num, ITEM_INFO *litem, COLL_INFO *coll)
{
    int x, y, z, d, i;
    ITEM_INFO *item;

    item = &items[item_num];

    if (item->status == ACTIVE)
    {
        if (!TestBoundsCollide(item, litem, coll->radius))
            return;
        if (!TestCollision(item, litem))
            return;

        if (litem->gravity_status)
        {
            if (coll->enable_baddie_push)
                ItemPushLara(item, litem, coll, coll->enable_hit, 1);
            litem->hit_points -= ROLLINGBALL_DAMAGE_AIR;
            x = litem->pos.x_pos - item->pos.x_pos;
            y = (litem->pos.y_pos - 350) - (item->pos.y_pos - WALL_L / 2);
            z = litem->pos.z_pos - item->pos.z_pos;
            d = phd_sqrt(x * x + y * y + z * z);
            if (d < WALL_L / 2)
                d = WALL_L / 2;
            x = item->pos.x_pos + (x * WALL_L / 2) / d;
            y = item->pos.y_pos - WALL_L / 2 + (y * WALL_L / 2) / d;
            z = item->pos.z_pos + (z * WALL_L / 2) / d;
            DoBloodSplat(x, y, z, item->speed, item->pos.y_rot, item->room_number);
        }
        else
        {
            litem->hit_status = 1;
            if (litem->hit_points > 0)
            {
                litem->hit_points = -1;
                if (litem->room_number != item->room_number)
                    ItemNewRoom(lara.item_number, item->room_number);

                litem->pos.y_rot = item->pos.y_rot;
                litem->pos.x_rot = litem->pos.z_rot = 0;

                litem->anim_number = RBALL_DEATH_A;
                litem->frame_number = RBALL_DEATH_F;
                litem->current_anim_state = AS_SPECIAL;
                litem->goal_anim_state = AS_SPECIAL;

                camera.flags = FOLLOW_CENTRE;
                camera.target_angle = 170 * ONE_DEGREE;
                camera.target_elevation = -25 * ONE_DEGREE;
                for (i = 0; i < 15; i++)
                {
                    x = litem->pos.x_pos + (GetRandomControl() - 16384) / 256;
                    z = litem->pos.z_pos + (GetRandomControl() - 16384) / 256;
                    y = litem->pos.y_pos - GetRandomControl() / 64;
                    d = (GetRandomControl() - 16384) / 8 + item->pos.y_rot;
                    DoBloodSplat(x, y, z, item->speed * 2, d, item->room_number);
                }
            }
        }
    }
    else if (item->status != INVISIBLE)
        ObjectCollision(item_num, litem, coll);
}

void SpikeCollision(sint16 item_num, ITEM_INFO *litem, COLL_INFO *coll)
{
    int x, y, z, num;
    ITEM_INFO *item;

    item = &items[item_num];
    if (litem->hit_points < 0)
        return;

    if (!TestBoundsCollide(item, litem, coll->radius))
        return;
    if (!TestCollision(item, litem))
        return;

    num = GetRandomControl() / 24576;
    if (litem->gravity_status)
    {
        if (litem->fallspeed > 0)
        {
            litem->hit_points = -1;
            num = 20;
        }
    }
    else if (litem->speed < 30)
        return;

    litem->hit_points -= SPIKE_DAMAGE;
    for (; num > 0; num--)
    {
        x = litem->pos.x_pos + (GetRandomControl() - 16384) / 256;
        z = litem->pos.z_pos + (GetRandomControl() - 16384) / 256;
        y = litem->pos.y_pos - GetRandomControl() / 64;
        DoBloodSplat(x, y, z, 20, (PHD_ANGLE)GetRandomControl(), item->room_number);
    }
    if (litem->hit_points <= 0)
    {
        litem->anim_number = SPIKE_DEATH_A;
        litem->frame_number = SPIKE_DEATH_F;
        litem->current_anim_state = AS_DEATH;
        litem->goal_anim_state = AS_DEATH;
        litem->pos.y_pos = item->pos.y_pos;
        litem->gravity_status = 0;
    }
}

void TrapDoorControl(sint16 item_number)
{
    ITEM_INFO *item;

    item = &items[item_number];

    if (TriggerActive(item))
    {
        if (item->current_anim_state == DOOR_CLOSED)
            item->goal_anim_state = DOOR_OPEN;
    }
    else
    {
        if (item->current_anim_state == DOOR_OPEN)
            item->goal_anim_state = DOOR_CLOSED;
    }

    AnimateItem(item);
}

void TrapDoorFloor(ITEM_INFO *item, sint32 x, sint32 y, sint32 z, sint16 *height)
{
    if (!OnTrapDoor(item, x, z))
        return;
    if (y <= item->pos.y_pos)
        if (item->current_anim_state == DOOR_CLOSED && item->pos.y_pos < *height)
            *height = (sint16)item->pos.y_pos;
}

void TrapDoorCeiling(ITEM_INFO *item, sint32 x, sint32 y, sint32 z, sint16 *height)
{
    if (!OnTrapDoor(item, x, z))
        return;
    if (y > item->pos.y_pos)
        if (item->current_anim_state == DOOR_CLOSED && item->pos.y_pos > *height)
            *height = (sint16)item->pos.y_pos + STEP_L;
}

int OnTrapDoor(ITEM_INFO *item, sint32 x, sint32 z)
{
    int tx, tz;

    x >>= WALL_SHIFT;
    z >>= WALL_SHIFT;
    tx = item->pos.x_pos >> WALL_SHIFT;
    tz = item->pos.z_pos >> WALL_SHIFT;
    if (item->pos.y_rot == 0 && x == tx && (z == tz || z == tz + 1))
        return 1;
    else if (item->pos.y_rot == -0x8000 && x == tx && (z == tz || z == tz - 1))
        return 1;
    else if (item->pos.y_rot == 0x4000 && z == tz && (x == tx || x == tx + 1))
        return 1;
    else if (item->pos.y_rot == -0x4000 && z == tz && (x == tx || x == tx - 1))
        return 1;

    return 0;
}

void Pendulum(sint16 item_number)
{
    int x, y, z, d;
    ITEM_INFO *item;
    FLOOR_INFO *floor;

    item = &items[item_number];

    if (TriggerActive(item))
    {
        if (item->current_anim_state == TRAP_SET)
            item->goal_anim_state = TRAP_WORKING;
    }
    else
    {
        if (item->current_anim_state == TRAP_WORKING)
            item->goal_anim_state = TRAP_SET;
    }

    if (item->current_anim_state == TRAP_WORKING && item->touch_bits)
    {
        lara_item->hit_points -= 100;
        lara_item->hit_status = 1;
        x = lara_item->pos.x_pos + (GetRandomControl() - 16384) / 256;
        z = lara_item->pos.z_pos + (GetRandomControl() - 16384) / 256;
        y = lara_item->pos.y_pos - GetRandomControl() / 44;
        d = (GetRandomControl() - 16384) / 8 + lara_item->pos.y_rot;
        DoBloodSplat(x, y, z, lara_item->speed, d, lara_item->room_number);
    }

    floor = GetFloor(item->pos.x_pos, item->pos.y_pos, item->pos.z_pos, &item->room_number);
    item->floor = GetHeight(floor, item->pos.x_pos, item->pos.y_pos, item->pos.z_pos);

    AnimateItem(item);
}

void FallingBlock(sint16 item_number)
{
    ITEM_INFO *item;
    FLOOR_INFO *floor;
    sint16 room_number;

    item = &items[item_number];

    switch (item->current_anim_state)
    {
    case TRAP_SET:

        if (lara_item->pos.y_pos == item->pos.y_pos - (STEP_L * 2))
            item->goal_anim_state = TRAP_ACTIVATE;
        else
        {
            item->status = NOT_ACTIVE;
            RemoveActiveItem(item_number);
            return;
        }
        break;

    case TRAP_ACTIVATE:

        item->goal_anim_state = TRAP_WORKING;
        break;

    case TRAP_WORKING:

        if (item->goal_anim_state != TRAP_FINISHED)
            item->gravity_status = 1;
        break;
    }

    AnimateItem(item);
    if (item->status == DEACTIVATED)
    {
        RemoveActiveItem(item_number);
        return;
    }

    room_number = item->room_number;
    floor = GetFloor(item->pos.x_pos, item->pos.y_pos, item->pos.z_pos, &room_number);
    if (item->room_number != room_number)
        ItemNewRoom(item_number, room_number);

    item->floor = GetHeight(floor, item->pos.x_pos, item->pos.y_pos, item->pos.z_pos);

    if (item->current_anim_state == TRAP_WORKING && item->pos.y_pos >= item->floor)
    {
        item->goal_anim_state = TRAP_FINISHED;
        item->pos.y_pos = item->floor;
        item->fallspeed = 0;
        item->gravity_status = 0;
    }
}

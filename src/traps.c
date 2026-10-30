#include "game.h"
#include <string.h>

#define SPIKE_DAMAGE 15
#define TEETHTRAP_DAMAGE 400
#define FALLING_CEILING_DAMAGE 300
#define DAMOCLES_SWORD_DAMAGE 100
#define ROLLINGBALL_DAMAGE_AIR 100

int OnTrapDoor(ITEM_INFO *item, sint32 x, sint32 z);
sint16 CreateItem(void);

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

void FallingBlockFloor(ITEM_INFO *item, sint32 x, sint32 y, sint32 z, sint16 *height)
{
    if (y <= item->pos.y_pos - (STEP_L * 2))
        if (item->current_anim_state == TRAP_SET || item->current_anim_state == TRAP_ACTIVATE)
            *height = (sint16)(item->pos.y_pos - (STEP_L * 2));
}

void FallingBlockCeiling(ITEM_INFO *item, sint32 x, sint32 y, sint32 z, sint16 *height)
{
    if (y > item->pos.y_pos - (STEP_L * 2))
        if (item->current_anim_state == TRAP_SET || item->current_anim_state == TRAP_ACTIVATE)
            *height = (sint16)(item->pos.y_pos - STEP_L);
}

enum tt_states
{
    TT_NICE,
    TT_NASTY
};

BITE_INFO teeth1a = {-23, 0, -1718, 0};
BITE_INFO teeth1b = {71, 0, -1718, 1};
BITE_INFO teeth2a = {-23, 10, -1718, 0};
BITE_INFO teeth2b = {71, 10, -1718, 1};
BITE_INFO teeth3a = {-23, -10, -1718, 0};
BITE_INFO teeth3b = {71, -10, -1718, 1};

void TeethTrap(sint16 item_number)
{
    ITEM_INFO *item;

    item = &items[item_number];

    if (TriggerActive(item))
    {
        item->goal_anim_state = TT_NASTY;
        if (item->touch_bits && item->current_anim_state == TT_NASTY)
        {
            lara_item->hit_points -= TEETHTRAP_DAMAGE;
            lara_item->hit_status = 1;
            BaddieBiteEffect(item, &teeth1a);
            BaddieBiteEffect(item, &teeth1b);
            BaddieBiteEffect(item, &teeth2a);
            BaddieBiteEffect(item, &teeth2b);
            BaddieBiteEffect(item, &teeth3a);
            BaddieBiteEffect(item, &teeth3b);
        }
    }
    else
        item->goal_anim_state = TT_NICE;

    AnimateItem(item);
}

void FallingCeiling(sint16 item_number)
{
    ITEM_INFO *item;

    item = &items[item_number];

    if (item->current_anim_state == TRAP_SET)
    {
        item->goal_anim_state = TRAP_ACTIVATE;
        item->gravity_status = 1;
    }
    else if (item->current_anim_state == TRAP_ACTIVATE)
    {
        if (item->touch_bits)
        {
            lara_item->hit_points -= FALLING_CEILING_DAMAGE;
            lara_item->hit_status = 1;
        }
    }

    AnimateItem(item);
    if (item->status == DEACTIVATED)
    {
        RemoveActiveItem(item_number);
        return;
    }
    if (item->current_anim_state == TRAP_ACTIVATE && item->pos.y_pos >= item->floor)
    {
        item->goal_anim_state = TRAP_WORKING;
        item->pos.y_pos = item->floor;
        item->fallspeed = 0;
        item->gravity_status = 0;
    }
}

void InitialiseDamoclesSword(sint16 item_number)
{
    ITEM_INFO *item;

    item = &items[item_number];
    item->pos.y_rot = (PHD_ANGLE)GetRandomControl();
    item->required_anim_state = (sint16)((GetRandomControl() - 16384) / 16);
    item->fallspeed = 50;
}

#define GO_DIST ((WALL_L * 3) / 2)

void DamoclesSwordControl(sint16 item_number)
{
    int x, y, z;
    ITEM_INFO *item;

    item = &items[item_number];

    if (item->gravity_status)
    {
        item->pos.y_rot += item->required_anim_state;
        item->fallspeed += (item->fallspeed < FASTFALL_SPEED) ? GRAVITY : 1;
        item->pos.y_pos += item->fallspeed;
        item->pos.x_pos += item->current_anim_state;
        item->pos.z_pos += item->goal_anim_state;

        if (item->pos.y_pos > item->floor)
        {
            SoundEffect(103, &item->pos, NULL);
            item->pos.y_pos = item->floor + 10;
            item->gravity_status = 0;
            item->status = DEACTIVATED;
            RemoveActiveItem(item_number);
        }
    }
    else if (item->pos.y_pos != item->floor)
    {
        item->pos.y_rot += item->required_anim_state;
        x = lara_item->pos.x_pos - item->pos.x_pos;
        y = lara_item->pos.y_pos - item->pos.y_pos;
        z = lara_item->pos.z_pos - item->pos.z_pos;
        if (x >= -GO_DIST && x <= GO_DIST && z >= -GO_DIST && z <= GO_DIST && y > 0 && y < WALL_L * 3)
        {
            item->current_anim_state = x / 32;
            item->goal_anim_state = z / 32;
            item->gravity_status = 1;
        }
    }
}

void DamoclesSwordCollision(sint16 item_num, ITEM_INFO *litem, COLL_INFO *coll)
{
    int x, y, z, d;
    ITEM_INFO *item;

    item = &items[item_num];
    if (!TestBoundsCollide(item, litem, coll->radius))
        return;
    if (coll->enable_baddie_push)
        ItemPushLara(item, litem, coll, 0, 1);
    if (item->gravity_status)
    {
        litem->hit_points -= DAMOCLES_SWORD_DAMAGE;
        x = litem->pos.x_pos + (GetRandomControl() - 16384) / 256;
        z = litem->pos.z_pos + (GetRandomControl() - 16384) / 256;
        y = litem->pos.y_pos - GetRandomControl() / 44;
        d = (GetRandomControl() - 16384) / 8 + litem->pos.y_rot;
        DoBloodSplat(x, y, z, litem->speed, d, litem->room_number);
    }
}

enum darte_types
{
    DARTE_IDLE,
    DARTE_FIRE,
    DARTE_RELOAD
};

void DartEmitterControl(sint16 item_num)
{
    ITEM_INFO *item, *dart;
    FX_INFO *fx;
    sint16 fx_num, dart_num;
    sint32 x, z;

    item = &items[item_num];

    if (TriggerActive(item))
    {
        if (item->current_anim_state == DARTE_IDLE)
            item->goal_anim_state = DARTE_FIRE;
    }
    else
    {
        if (item->current_anim_state == DARTE_FIRE)
            item->goal_anim_state = DARTE_IDLE;
    }
    if (item->current_anim_state == DARTE_FIRE && item->frame_number == anims[item->anim_number].frame_base)
    {
        dart_num = CreateItem();
        if (dart_num != NO_ITEM)
        {
            dart = &items[dart_num];

            dart->object_number = DARTS;
            dart->room_number = item->room_number;
            dart->shade = -1;
            dart->pos.y_rot = item->pos.y_rot;
            dart->pos.y_pos = item->pos.y_pos - WALL_L / 2;
            x = z = 0;
            switch (dart->pos.y_rot)
            {
            case 0:
                z = -WALL_L / 2 + 100;
                break;

            case 16364:
                x = -WALL_L / 2 + 100;
                break;

            case -32768:
                z = WALL_L / 2 - 100;
                break;

            case -16384:
                x = WALL_L / 2 - 100;
                break;
            }
            dart->pos.x_pos = item->pos.x_pos + x;
            dart->pos.z_pos = item->pos.z_pos + z;
            InitialiseItem(dart_num);
            AddActiveItem(dart_num);
            dart->status = ACTIVE;

            if ((fx_num = CreateEffect(dart->room_number)) != NO_ITEM)
            {
                fx = &effects[fx_num];
                memcpy(&fx->pos, &dart->pos, sizeof(PHD_3DPOS));
                fx->speed = 0;
                fx->frame_number = 0;
                fx->counter = 0;
                fx->object_number = DART_EFFECT;
                SoundEffect(151, &fx->pos, 0);
            }
        }
    }
    AnimateItem(item);
}

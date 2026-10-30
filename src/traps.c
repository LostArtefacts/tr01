#include "game.h"

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

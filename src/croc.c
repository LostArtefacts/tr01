#include "game.h"

#define CROC_BITE_DAMAGE 100
#define GATOR_BITE_DAMAGE 100

#define CROC_TOUCH 0x3fc

BITE_INFO croc_bite = {
    5, -21, 467, 9
};

enum croc_anims
{
    CROC_EMPTY,
    CROC_STOP,
    CROC_RUN,
    CROC_WALK,
    CROC_FASTTURN,
    CROC_ATTACK1,
    CROC_ATTACK2,
    CROC_DEATH
};

#define CROC_TURN (ONE_DEGREE * 3)
#define CROC_FASTTURN_TURN (ONE_DEGREE * 6)
#define CROC_FASTTURN_ANGLE 0x4000
#define CROC_FASTTURN_RANGE SQUARE(WALL_L * 3)

#define CROC_BITE_RANGE SQUARE(435)

#define CROC_DIE_ANIM 11

enum gator_anims
{
    GATOR_EMPTY,
    GATOR_SWIM,
    GATOR_ATTACK,
    GATOR_DEATH
};

#define GATOR_TURN (ONE_DEGREE * 3)
#define GATOR_FLOAT_SPEED (WALL_L / 32)

#define GATOR_DIE_ANIM 4

void AlligatorControl(sint16 item_number)
{
    ITEM_INFO *item;
    CREATURE_INFO *gator;
    FLOOR_INFO *floor;
    sint16 head, angle, room_number;
    AI_INFO info;
    sint32 water_level;

    item = &items[item_number];
    if (item->status == INVISIBLE)
    {
        if (!EnableBaddieAI(item_number, 0))
            return;

        item->status = ACTIVE;
    }

    gator = (CREATURE_INFO*)item->data;

    head = angle = 0;

    if (item->hit_points <= 0)
    {
        if (item->current_anim_state != GATOR_DEATH)
        {
            item->anim_number = objects[ALLIGATOR].anim_index + GATOR_DIE_ANIM;
            item->frame_number = anims[item->anim_number].frame_base;
            item->current_anim_state = GATOR_DEATH;
            item->hit_points = DONT_TARGET;
        }

        water_level = GetWaterHeight(item->pos.x_pos, item->pos.y_pos, item->pos.z_pos, item->room_number);
        if (water_level == NO_HEIGHT)
        {
            item->object_number = CROCODILE;
            item->anim_number = objects[CROCODILE].anim_index + CROC_DIE_ANIM;
            item->frame_number = anims[item->anim_number].frame_base;
            item->current_anim_state = item->goal_anim_state = CROC_DEATH;
            room_number = item->room_number;
            floor = GetFloor(item->pos.x_pos, item->pos.y_pos, item->pos.z_pos, &room_number);
            item->pos.y_pos = GetHeight(floor, item->pos.x_pos, item->pos.y_pos, item->pos.z_pos);
            item->pos.x_rot = 0;
        }
        else if (item->pos.y_pos > water_level + GATOR_FLOAT_SPEED)
            item->pos.y_pos -= GATOR_FLOAT_SPEED;
        else if (item->pos.y_pos < water_level)
        {
            item->pos.y_pos = water_level;
            if (gator)
                DisableBaddieAI(item_number);
        }

        AnimateItem(item);

        room_number = item->room_number;
        floor = GetFloor(item->pos.x_pos, item->pos.y_pos, item->pos.z_pos, &room_number);
        item->floor = GetHeight(floor, item->pos.x_pos, item->pos.y_pos, item->pos.z_pos);
        if (room_number != item->room_number)
            ItemNewRoom(item_number, room_number);

        return;
    }

    CreatureAIInfo(item, &info);

    if (info.ahead)
        head = info.angle;

    CreatureMood(item, &info, VIOLENT);

    CreatureTurn(item, GATOR_TURN);

    switch (item->current_anim_state)
    {
    case GATOR_SWIM:
        if (info.bite && item->touch_bits)
            item->goal_anim_state = GATOR_ATTACK;

        break;

    case GATOR_ATTACK:
        if (item->frame_number == anims[item->anim_number].frame_base)
            item->required_anim_state = 0;

        if (info.bite && item->touch_bits)
        {
            if (!item->required_anim_state)
            {
                CreatureEffect(item, &croc_bite, DoBloodSplat);

                lara_item->hit_points -= GATOR_BITE_DAMAGE;
                lara_item->hit_status = 1;

                item->required_anim_state = GATOR_SWIM;
            }
        }
        else
            item->goal_anim_state = GATOR_SWIM;

        break;
    }

    CreatureHead(item, head);

    water_level = GetWaterHeight(item->pos.x_pos, item->pos.y_pos, item->pos.z_pos, item->room_number);
    if (water_level == NO_HEIGHT)
    {
        item->object_number = CROCODILE;
        item->anim_number = objects[CROCODILE].anim_index;
        item->frame_number = anims[item->anim_number].frame_base;
        item->current_anim_state = item->goal_anim_state = anims[item->anim_number].current_anim_state;
        item->pos.y_pos = item->floor;
        item->pos.x_rot = 0;
        gator->LOT.step = STEP_L;
        gator->LOT.drop = -STEP_L;
        gator->LOT.fly = NO_FLYING;
    }
    else if (item->pos.y_pos < water_level + STEP_L)
        item->pos.y_pos = water_level + STEP_L;

    CreatureAnimation(item_number, angle, 0);
}

void CrocControl(sint16 item_number)
{
    ITEM_INFO *item;
    CREATURE_INFO *croc;
    sint16 head, angle;
    AI_INFO info;

    item = &items[item_number];
    if (item->status == INVISIBLE)
    {
        if (!EnableBaddieAI(item_number, 0))
            return;

        item->status = ACTIVE;
    }

    croc = (CREATURE_INFO*)item->data;
    head = angle = 0;

    if (item->hit_points <= 0)
    {
        if (item->current_anim_state != CROC_DEATH)
        {
            item->anim_number = objects[CROCODILE].anim_index + CROC_DIE_ANIM;
            item->frame_number = anims[item->anim_number].frame_base;
            item->current_anim_state = CROC_DEATH;
        }
    }
    else
    {
        CreatureAIInfo(item, &info);

        if (info.ahead)
            head = info.angle;

        CreatureMood(item, &info, VIOLENT);

        if (item->current_anim_state == CROC_FASTTURN)
            item->pos.y_rot += CROC_FASTTURN_TURN;
        else
            angle = CreatureTurn(item, CROC_TURN);

        switch (item->current_anim_state)
        {
        case CROC_STOP:
            if (info.bite && info.distance < CROC_BITE_RANGE)
                item->goal_anim_state = CROC_ATTACK1;
            else if (croc->mood == ESCAPE_MOOD)
                item->goal_anim_state = CROC_RUN;
            else if (croc->mood == ATTACK_MOOD)
            {
                if ((info.angle < -CROC_FASTTURN_ANGLE || info.angle > CROC_FASTTURN_ANGLE) && info.distance > CROC_FASTTURN_RANGE)
                    item->goal_anim_state = CROC_FASTTURN;
                else
                    item->goal_anim_state = CROC_RUN;
            }
            else if (croc->mood == STALK_MOOD)
                item->goal_anim_state = CROC_WALK;

            break;

        case CROC_WALK:
            if (info.ahead && (item->touch_bits & CROC_TOUCH))
                item->goal_anim_state = CROC_STOP;
            else if (croc->mood == ATTACK_MOOD || croc->mood == ESCAPE_MOOD)
                item->goal_anim_state = CROC_RUN;
            else if (croc->mood == BORED_MOOD)
                item->goal_anim_state = CROC_STOP;

            break;

        case CROC_FASTTURN:
            if (info.angle > -CROC_FASTTURN_ANGLE && info.angle < CROC_FASTTURN_ANGLE)
                item->goal_anim_state = CROC_WALK;

            break;

        case CROC_RUN:
            if (info.ahead && (item->touch_bits & CROC_TOUCH))
                item->goal_anim_state = CROC_STOP;
            else if (croc->mood == STALK_MOOD)
                item->goal_anim_state = CROC_WALK;
            else if (croc->mood == BORED_MOOD)
                item->goal_anim_state = CROC_STOP;
            else if (croc->mood == ATTACK_MOOD && info.distance > CROC_FASTTURN_RANGE && (info.angle < -CROC_FASTTURN_ANGLE ||
                    info.angle > CROC_FASTTURN_ANGLE))
            {
                item->goal_anim_state = CROC_STOP;
            }

            break;

        case CROC_ATTACK1:
            if (!item->required_anim_state)
            {
                CreatureEffect(item, &croc_bite, DoBloodSplat);

                lara_item->hit_points -= CROC_BITE_DAMAGE;
                lara_item->hit_status = 1;

                item->required_anim_state = CROC_STOP;
            }

            break;
        }
    }

    if (croc)
        CreatureHead(item, head);

    if (room[item->room_number].flags & UNDERWATER)
    {
        item->object_number = ALLIGATOR;
        item->anim_number = objects[ALLIGATOR].anim_index;
        item->frame_number = anims[item->anim_number].frame_base;
        item->current_anim_state = item->goal_anim_state = anims[item->anim_number].current_anim_state;
        if (croc)
        {
            croc->LOT.step = WALL_L * 20;
            croc->LOT.drop = -WALL_L * 20;
            croc->LOT.fly = STEP_L / 16;
        }
    }

    if (croc)
        CreatureAnimation(item_number, angle, 0);
    else
        AnimateItem(item);
}

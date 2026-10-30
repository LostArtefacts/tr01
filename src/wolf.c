#include "game.h"

#define WOLF_BITE_DAMAGE 100
#define WOLF_POUNCE_DAMAGE 50

#define WOLF_TOUCH (0x774f)

enum wolf_anims
{
    WOLF_EMPTY,
    WOLF_STOP,
    WOLF_WALK,
    WOLF_RUN,
    WOLF_JUMP,
    WOLF_STALK,
    WOLF_ATTACK,
    WOLF_HOWL,
    WOLF_SLEEP,
    WOLF_CROUCH,
    WOLF_FASTTURN,
    WOLF_DEATH,
    WOLF_BITE
};

#define WOLF_SLEEP_FRAME 96

#define WOLF_DIE_ANIM 20

#define WOLF_WALK_TURN (2 * ONE_DEGREE)
#define WOLF_RUN_TURN (5 * ONE_DEGREE)
#define WOLF_STALK_TURN (2 * ONE_DEGREE)

#define WOLF_ATTACK_RANGE SQUARE(WALL_L * 3 / 2)
#define WOLF_STALK_RANGE SQUARE(WALL_L * 3)
#define WOLF_BITE_RANGE SQUARE(345)

#define WOLF_WAKE_CHANCE 0x20
#define WOLF_SLEEP_CHANCE 0x20
#define WOLF_HOWL_CHANCE 0x180

BITE_INFO wolf_jaw_bite = {0, -14, 174, 6};

BITE_INFO lion_bite = {-2, -10, 132, 21};

void InitialiseWolf(sint16 item_number)
{
    items[item_number].frame_number = WOLF_SLEEP_FRAME;
    InitialiseCreature(item_number);
}

void WolfControl(sint16 item_number)
{
    ITEM_INFO *item;
    CREATURE_INFO *wolf;
    sint16 angle, head, tilt;
    AI_INFO info;

    item = &items[item_number];
    if (item->status == INVISIBLE)
    {
        if (!EnableBaddieAI(item_number, 0))
            return;
        item->status = ACTIVE;
    }
    wolf = (CREATURE_INFO *)item->data;
    head = angle = tilt = 0;

    if (item->hit_points <= 0)
    {
        if (item->current_anim_state != WOLF_DEATH)
        {
            item->anim_number = objects[WOLF].anim_index + WOLF_DIE_ANIM + GetRandomControl() / 11000;
            item->frame_number = anims[item->anim_number].frame_base;
            item->current_anim_state = WOLF_DEATH;
        }
    }
    else
    {
        CreatureAIInfo(item, &info);

        if (info.ahead)
            head = info.angle;

        CreatureMood(item, &info, TIMID);

        angle = CreatureTurn(item, wolf->maximum_turn);

        switch (item->current_anim_state)
        {
        case WOLF_SLEEP:
            head = 0;

            if (wolf->mood == ESCAPE_MOOD || info.zone_number == info.enemy_zone)
            {
                item->required_anim_state = WOLF_CROUCH;
                item->goal_anim_state = WOLF_STOP;
            }
            else if (GetRandomControl() < WOLF_WAKE_CHANCE)
            {
                item->required_anim_state = WOLF_WALK;
                item->goal_anim_state = WOLF_STOP;
            }
            break;

        case WOLF_STOP:
            if (item->required_anim_state)
                item->goal_anim_state = item->required_anim_state;
            else
                item->goal_anim_state = WOLF_WALK;
            break;

        case WOLF_WALK:
            wolf->maximum_turn = WOLF_WALK_TURN;

            if (wolf->mood != BORED_MOOD)
            {
                item->goal_anim_state = WOLF_STALK;
                item->required_anim_state = WOLF_EMPTY;
            }
            else if (GetRandomControl() < WOLF_SLEEP_CHANCE)
            {
                item->required_anim_state = WOLF_SLEEP;
                item->goal_anim_state = WOLF_STOP;
            }
            break;

        case WOLF_CROUCH:
            if (item->required_anim_state)
                item->goal_anim_state = item->required_anim_state;
            else if (wolf->mood == ESCAPE_MOOD)
                item->goal_anim_state = WOLF_RUN;
            else if (info.distance < WOLF_BITE_RANGE && info.bite)
                item->goal_anim_state = WOLF_BITE;
            else if (wolf->mood == STALK_MOOD)
                item->goal_anim_state = WOLF_STALK;
            else if (wolf->mood == BORED_MOOD)
                item->goal_anim_state = WOLF_STOP;
            else
                item->goal_anim_state = WOLF_RUN;
            break;

        case WOLF_STALK:
            wolf->maximum_turn = WOLF_STALK_TURN;

            if (wolf->mood == ESCAPE_MOOD)
                item->goal_anim_state = WOLF_RUN;
            else if (info.distance < WOLF_BITE_RANGE && info.bite)
                item->goal_anim_state = WOLF_BITE;
            else if (info.distance > WOLF_STALK_RANGE)
                item->goal_anim_state = WOLF_RUN;
            else if (wolf->mood == ATTACK_MOOD)
            {
                if (!info.ahead || info.distance > WOLF_ATTACK_RANGE || (info.enemy_facing < FRONT_ARC && info.enemy_facing > -FRONT_ARC))
                    item->goal_anim_state = WOLF_RUN;
            }
            else if (GetRandomControl() < WOLF_HOWL_CHANCE)
            {
                item->required_anim_state = WOLF_HOWL;
                item->goal_anim_state = WOLF_CROUCH;
            }
            else if (wolf->mood == BORED_MOOD)
                item->goal_anim_state = WOLF_CROUCH;
            break;

        case WOLF_RUN:
            wolf->maximum_turn = WOLF_RUN_TURN;
            tilt = angle;

            if (info.ahead && info.distance < WOLF_ATTACK_RANGE)
            {
                if (info.distance > (WOLF_ATTACK_RANGE / 2) && (info.enemy_facing > FRONT_ARC || info.enemy_facing < -FRONT_ARC))
                {
                    item->required_anim_state = WOLF_STALK;
                    item->goal_anim_state = WOLF_CROUCH;
                }
                else
                {
                    item->goal_anim_state = WOLF_ATTACK;
                    item->required_anim_state = 0;
                }
            }
            else if (wolf->mood == STALK_MOOD && info.distance < WOLF_STALK_RANGE)
            {
                item->required_anim_state = WOLF_STALK;
                item->goal_anim_state = WOLF_CROUCH;
            }
            else if (wolf->mood == BORED_MOOD)
                item->goal_anim_state = WOLF_CROUCH;
            break;

        case WOLF_ATTACK:
            tilt = angle;
            if (!item->required_anim_state && (item->touch_bits & WOLF_TOUCH))
            {
                CreatureEffect(item, &wolf_jaw_bite, DoBloodSplat);
                lara_item->hit_points -= WOLF_POUNCE_DAMAGE;
                lara_item->hit_status = 1;
                item->required_anim_state = WOLF_RUN;
            }
            item->goal_anim_state = WOLF_RUN;
            break;

        case WOLF_BITE:
            if (!item->required_anim_state && (item->touch_bits & WOLF_TOUCH) && info.ahead)
            {
                CreatureEffect(item, &wolf_jaw_bite, DoBloodSplat);
                lara_item->hit_points -= WOLF_BITE_DAMAGE;
                lara_item->hit_status = 1;
                item->required_anim_state = WOLF_CROUCH;
            }
            break;
        }
    }

    CreatureTilt(item, tilt);
    CreatureHead(item, head);

    CreatureAnimation(item_number, angle, tilt);
}

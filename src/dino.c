#include "game.h"

#define DINO_TOUCH_DAMAGE 1
#define DINO_TRAMPLE_DAMAGE 10
#define DINO_BITE_DAMAGE 10000

#define RAPTOR_LUNGE_DAMAGE 100
#define RAPTOR_BITE_DAMAGE 100
#define RAPTOR_CHARGE_DAMAGE 100

#define RAPTOR_TOUCH (0xff7c00)

enum RaptorAnims
{
    RAPTOR_EMPTY,
    RAPTOR_STOP,
    RAPTOR_WALK,
    RAPTOR_RUN,
    RAPTOR_ATTACK1,
    RAPTOR_DEATH,
    RAPTOR_WARNING,
    RAPTOR_ATTACK2,
    RAPTOR_ATTACK3
};

BITE_INFO raptor_bite = {
    0, 66, 318, 22
};

#define RAPTOR_DIE_ANIM 9
#define RAPTOR_ROAR_CHANCE 0x100

#define RAPTOR_LUNGE_RANGE SQUARE(WALL_L * 3 / 2)
#define RAPTOR_ATTACK_RANGE SQUARE(WALL_L * 3 / 2)
#define RAPTOR_CLOSE_RANGE SQUARE(680)

#define RAPTOR_RUN_TURN (ONE_DEGREE * 4)
#define RAPTOR_WALK_TURN (ONE_DEGREE)

#define DINO_TOUCH (0x3000)

enum DinoAnims
{
    DINO_LINK,
    DINO_STOP,
    DINO_WALK,
    DINO_RUN,
    DINO_ATTACK1,
    DINO_DEATH,
    DINO_ROAR,
    DINO_ATTACK2,
    DINO_KILL
};

#define DINO_ROAR_CHANCE 0x200

#define DINO_RUN_TURN (ONE_DEGREE * 4)
#define DINO_WALK_TURN (ONE_DEGREE * 2)

#define DINO_RUN_RANGE SQUARE(WALL_L * 5)
#define DINO_ATTACK_RANGE SQUARE(WALL_L * 4)
#define DINO_BITE_RANGE SQUARE(1500)

void RaptorControl(sint16 item_number)
{
    ITEM_INFO *item;
    CREATURE_INFO *raptor;
    sint16 head, angle, tilt;
    AI_INFO info;

    item = &items[item_number];
    if (item->status == INVISIBLE)
    {
        if (!EnableBaddieAI(item_number, 0))
            return;

        item->status = ACTIVE;
    }

    raptor = (CREATURE_INFO *)item->data;
    head = angle = tilt = 0;

    if (item->hit_points <= 0)
    {
        if (item->current_anim_state != RAPTOR_DEATH)
        {
            item->anim_number = objects[RAPTOR].anim_index + RAPTOR_DIE_ANIM + GetRandomControl() / 16200;
            item->frame_number = anims[item->anim_number].frame_base;
            item->current_anim_state = RAPTOR_DEATH;
        }
    }
    else
    {
        CreatureAIInfo(item, &info);

        if (info.ahead)
            head = info.angle;

        CreatureMood(item, &info, VIOLENT);

        angle = CreatureTurn(item, raptor->maximum_turn);

        switch (item->current_anim_state)
        {
        case RAPTOR_STOP:
            if (item->required_anim_state)
                item->goal_anim_state = item->required_anim_state;
            else if (item->touch_bits & RAPTOR_TOUCH)
                item->goal_anim_state = RAPTOR_ATTACK3;
            else if (info.distance < RAPTOR_CLOSE_RANGE && info.bite)
                item->goal_anim_state = RAPTOR_ATTACK3;
            else if (info.bite && info.distance < RAPTOR_LUNGE_RANGE)
                item->goal_anim_state = RAPTOR_ATTACK1;
            else if (raptor->mood == BORED_MOOD)
                item->goal_anim_state = RAPTOR_WALK;
            else
                item->goal_anim_state = RAPTOR_RUN;

            break;

        case RAPTOR_WALK:
            raptor->maximum_turn = RAPTOR_WALK_TURN;

            if (raptor->mood != BORED_MOOD)
                item->goal_anim_state = RAPTOR_STOP;
            else if (info.ahead && GetRandomControl() < RAPTOR_ROAR_CHANCE)
            {
                item->required_anim_state = RAPTOR_WARNING;
                item->goal_anim_state = RAPTOR_STOP;
            }

            break;

        case RAPTOR_RUN:
            tilt = angle;
            raptor->maximum_turn = RAPTOR_RUN_TURN;

            if (item->touch_bits & RAPTOR_TOUCH)
                item->goal_anim_state = RAPTOR_STOP;
            else if (info.bite && info.distance < RAPTOR_ATTACK_RANGE)
            {
                if (item->goal_anim_state == RAPTOR_RUN)
                {
                    if (GetRandomControl() < 0x2000)
                        item->goal_anim_state = RAPTOR_STOP;
                    else
                        item->goal_anim_state = RAPTOR_ATTACK2;
                }
            }
            else if (info.ahead && raptor->mood != ESCAPE_MOOD && GetRandomControl() < RAPTOR_ROAR_CHANCE)
            {
                item->required_anim_state = RAPTOR_WARNING;
                item->goal_anim_state = RAPTOR_STOP;
            }
            else if (raptor->mood == BORED_MOOD)
                item->goal_anim_state = RAPTOR_STOP;

            break;

        case RAPTOR_ATTACK1:
            tilt = angle;

            if (!item->required_anim_state && info.ahead && (item->touch_bits & RAPTOR_TOUCH))
            {
                CreatureEffect(item, &raptor_bite, DoBloodSplat);

                lara_item->hit_points -= RAPTOR_LUNGE_DAMAGE;
                lara_item->hit_status = 1;

                item->required_anim_state = RAPTOR_STOP;
            }

            break;

        case RAPTOR_ATTACK3:
            tilt = angle;

            if (!item->required_anim_state && (item->touch_bits & RAPTOR_TOUCH))
            {
                CreatureEffect(item, &raptor_bite, DoBloodSplat);

                lara_item->hit_points -= RAPTOR_BITE_DAMAGE;
                lara_item->hit_status = 1;

                item->required_anim_state = RAPTOR_STOP;
            }

            break;

        case RAPTOR_ATTACK2:
            tilt = angle;

            if (!item->required_anim_state && info.ahead && (item->touch_bits & RAPTOR_TOUCH))
            {
                CreatureEffect(item, &raptor_bite, DoBloodSplat);

                lara_item->hit_points -= RAPTOR_CHARGE_DAMAGE;
                lara_item->hit_status = 1;

                item->required_anim_state = RAPTOR_RUN;
            }

            break;
        }
    }

    CreatureTilt(item, tilt);
    CreatureHead(item, head);

    CreatureAnimation(item_number, angle, tilt);
}

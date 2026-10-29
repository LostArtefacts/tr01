#include "game.h"

#define RAT_BITE_DAMAGE 20
#define RAT_CHARGE_DAMAGE 20

#define RAT_TOUCH (0x300018f)

enum rat_anims
{
    RAT_EMPTY,
    RAT_STOP,
    RAT_ATTACK2,
    RAT_RUN,
    RAT_ATTACK1,
    RAT_DEATH,
    RAT_POSE
};

BITE_INFO rat_bite = {0, -11, 108, 3};

#define RAT_DIE_ANIM 8

#define RAT_RUN_TURN (ONE_DEGREE * 6)

#define RAT_BITE_RANGE SQUARE(341)
#define RAT_CHARGE_RANGE SQUARE(WALL_L * 3 / 2)

#define RAT_POSE_CHANCE 0x100

enum vole_anims
{
    VOLE_EMPTY,
    VOLE_SWIM,
    VOLE_ATTACK,
    VOLE_DEATH
};

#define VOLE_DIE_ANIM 2

#define VOLE_SWIM_TURN (ONE_DEGREE * 3)

#define VOLE_ATTACK_RANGE SQUARE(300)

void RatControl(sint16 item_number)
{
    ITEM_INFO *item;
    CREATURE_INFO *rat;
    sint16 head, angle;
    sint32 height;
    AI_INFO info;

    item = &items[item_number];
    if (item->status == INVISIBLE)
    {
        if (!EnableBaddieAI(item_number, 0))
            return;
        item->status = ACTIVE;
    }
    rat = (CREATURE_INFO *)item->data;
    head = angle = 0;

    if (item->hit_points <= 0)
    {
        if (item->current_anim_state != RAT_DEATH)
        {
            item->anim_number = objects[RAT].anim_index + RAT_DIE_ANIM;
            item->frame_number = anims[item->anim_number].frame_base;
            item->current_anim_state = RAT_DEATH;
        }
    }
    else
    {
        CreatureAIInfo(item, &info);

        if (info.ahead)
            head = info.angle;

        CreatureMood(item, &info, TIMID);

        angle = CreatureTurn(item, RAT_RUN_TURN);

        switch (item->current_anim_state)
        {
        case RAT_STOP:
            if (item->required_anim_state)
                item->goal_anim_state = item->required_anim_state;
            else if (info.bite && info.distance < RAT_BITE_RANGE)
                item->goal_anim_state = RAT_ATTACK1;
            else
                item->goal_anim_state = RAT_RUN;
            break;

        case RAT_RUN:
            if (info.ahead && (item->touch_bits & RAT_TOUCH))
                item->goal_anim_state = RAT_STOP;
            else if (info.bite && info.distance < RAT_CHARGE_RANGE)
                item->goal_anim_state = RAT_ATTACK2;
            else if (info.ahead && GetRandomControl() < RAT_POSE_CHANCE)
            {
                item->required_anim_state = RAT_POSE;
                item->goal_anim_state = RAT_STOP;
            }
            break;

        case RAT_ATTACK1:

            if (!item->required_anim_state && info.ahead && (item->touch_bits & RAT_TOUCH))
            {
                CreatureEffect(item, &rat_bite, DoBloodSplat);

                lara_item->hit_points -= RAT_BITE_DAMAGE;
                lara_item->hit_status = 1;

                item->required_anim_state = RAT_STOP;
            }
            break;

        case RAT_ATTACK2:

            if (!item->required_anim_state && info.ahead && (item->touch_bits & RAT_TOUCH))
            {
                CreatureEffect(item, &rat_bite, DoBloodSplat);

                lara_item->hit_points -= RAT_BITE_DAMAGE;
                lara_item->hit_status = 1;

                item->required_anim_state = RAT_RUN;
            }
            break;

        case RAT_POSE:
            if (rat->mood != BORED_MOOD || GetRandomControl() < RAT_POSE_CHANCE)
                item->goal_anim_state = RAT_STOP;
            break;
        }
    }

    CreatureHead(item, head);

    height = GetWaterHeight(item->pos.x_pos, item->pos.y_pos, item->pos.z_pos, item->room_number);
    if (height != NO_HEIGHT)
    {
        item->object_number = VOLE;
        item->anim_number = objects[VOLE].anim_index;
        item->frame_number = anims[item->anim_number].frame_base;
        item->current_anim_state = item->goal_anim_state = anims[item->anim_number].current_anim_state;
        item->pos.y_pos = height;
    }

    CreatureAnimation(item_number, angle, 0);
}

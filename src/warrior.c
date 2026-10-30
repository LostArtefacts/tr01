#include "game.h"

#define FLYER_PART_DAMAGE 100

#define CENTAUR_REAR_DAMAGE 200

BITE_INFO warrior_bite = {-27, 98, 0, 10};

BITE_INFO warrior_rocket = {51, 213, 0, 14};
BITE_INFO warrior_shard = {-35, 269, 0, 9};

enum centaur_anims
{
    CENTAUR_EMPTY,
    CENTAUR_STOP,
    CENTAUR_SHOOT,
    CENTAUR_RUN,
    CENTAUR_AIM,
    CENTAUR_DEATH,
    CENTAUR_WARNING
};

BITE_INFO centaur_rocket = {11, 415, 41, 13};
BITE_INFO centaur_rear = {50, 30, 0, 5};

#define CENTAUR_TOUCH 0x30199

#define CENTAUR_DIE_ANIM 8

#define CENTAUR_TURN (ONE_DEGREE * 4)

#define CENTAUR_REAR_CHANCE 0x60

#define CENTAUR_REAR_RANGE SQUARE(WALL_L * 3 / 2)

sint16 RocketGun(sint32 x, sint32 y, sint32 z, sint16 speed, PHD_ANGLE yrot, sint16 room_number);
int ExplodingDeath(sint16 item_number, sint32 mesh_bits, sint16 damage);

void CentaurControl(sint16 item_number)
{
    ITEM_INFO *item;
    CREATURE_INFO *centaur;
    sint16 angle, head, fx_number;
    AI_INFO info;

    item = &items[item_number];
    if (item->status == INVISIBLE)
    {
        if (!EnableBaddieAI(item_number, 0))
            return;
        item->status = ACTIVE;
    }
    centaur = (CREATURE_INFO *)item->data;
    head = angle = 0;

    if (item->hit_points <= 0)
    {
        if (item->current_anim_state != CENTAUR_DEATH)
        {
            item->anim_number = objects[CENTAUR].anim_index + CENTAUR_DIE_ANIM;
            item->frame_number = anims[item->anim_number].frame_base;
            item->current_anim_state = CENTAUR_DEATH;
        }
    }
    else
    {
        CreatureAIInfo(item, &info);

        if (info.ahead)
            head = info.angle;

        CreatureMood(item, &info, VIOLENT);

        angle = CreatureTurn(item, CENTAUR_TURN);

        switch (item->current_anim_state)
        {
        case CENTAUR_STOP:
            centaur->neck_rotation = 0;
            if (item->required_anim_state)
                item->goal_anim_state = item->required_anim_state;
            else if (info.bite && info.distance < CENTAUR_REAR_RANGE)
                item->goal_anim_state = CENTAUR_RUN;
            else if (Targetable(item, &info))
                item->goal_anim_state = CENTAUR_AIM;
            else
                item->goal_anim_state = CENTAUR_RUN;
            break;

        case CENTAUR_RUN:
            if (info.bite && info.distance < CENTAUR_REAR_RANGE)
            {
                item->required_anim_state = CENTAUR_WARNING;
                item->goal_anim_state = CENTAUR_STOP;
            }
            else if (Targetable(item, &info))
            {
                item->required_anim_state = CENTAUR_AIM;
                item->goal_anim_state = CENTAUR_STOP;
            }
            else if (GetRandomControl() < CENTAUR_REAR_CHANCE)
            {
                item->required_anim_state = CENTAUR_WARNING;
                item->goal_anim_state = CENTAUR_STOP;
            }
            break;

        case CENTAUR_AIM:
            if (item->required_anim_state)
                item->goal_anim_state = item->required_anim_state;
            else if (Targetable(item, &info))
                item->goal_anim_state = CENTAUR_SHOOT;
            else
                item->goal_anim_state = CENTAUR_STOP;
            break;

        case CENTAUR_SHOOT:
            if (!item->required_anim_state)
            {
                item->required_anim_state = CENTAUR_AIM;

                fx_number = CreatureEffect(item, &centaur_rocket, RocketGun);
                if (fx_number != NO_ITEM)
                    centaur->neck_rotation = effects[fx_number].pos.x_rot;
            }
            break;

        case CENTAUR_WARNING:
            if (!item->required_anim_state && (item->touch_bits & CENTAUR_TOUCH))
            {
                CreatureEffect(item, &centaur_rear, DoBloodSplat);

                lara_item->hit_points -= CENTAUR_REAR_DAMAGE;
                lara_item->hit_status = 1;

                item->required_anim_state = CENTAUR_STOP;
            }
            break;
        }
    }

    CreatureHead(item, head);

    CreatureAnimation(item_number, angle, 0);

    if (item->status == DEACTIVATED)
    {
        SoundEffect(171, &item->pos, NULL);
        ExplodingDeath(item_number, 0xffffffff, FLYER_PART_DAMAGE);
        KillItem(item_number);
        item->status = DEACTIVATED;
    }
}

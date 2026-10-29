#include "game.h"

#define BAT_ATTACK_DAMAGE 2

enum BatAnims
{
    BAT_EMPTY,
    BAT_STOP,
    BAT_FLY,
    BAT_ATTACK,
    BAT_FALL,
    BAT_DEATH
};

#define BAT_TURN (20 * ONE_DEGREE)
#define BAT_WAKE_RANGE SQUARE(WALL_L * 5)
#define BAT_ATTACK_RANGE SQUARE(STEP_L)

BITE_INFO bat_bite = {
    0, 16, 45, 4
};

void BatControl(sint16 item_number)
{
    ITEM_INFO *item;
    CREATURE_INFO *bat;
    sint16 angle;
    AI_INFO info;

    item = &items[item_number];
    if (item->status == INVISIBLE)
    {
        if (!EnableBaddieAI(item_number, 0))
            return;
        item->status = ACTIVE;
    }

    bat = (CREATURE_INFO *)item->data;
    angle = 0;

    if (item->hit_points <= 0)
    {
        if (item->pos.y_pos < item->floor)
        {
            item->gravity_status = 1;
            item->goal_anim_state = BAT_FALL;
            item->speed = 0;
        }
        else
        {
            item->gravity_status = 0;
            item->goal_anim_state = BAT_DEATH;
            item->pos.y_pos = item->floor;
        }
    }
    else
    {
        CreatureAIInfo(item, &info);
        CreatureMood(item, &info, TIMID);
        angle = CreatureTurn(item, BAT_TURN);

        switch (item->current_anim_state)
        {
        case BAT_STOP:
            item->goal_anim_state = BAT_FLY;
            break;

        case BAT_FLY:
            if (item->touch_bits)
                item->goal_anim_state = BAT_ATTACK;
            break;

        case BAT_ATTACK:
            if (item->touch_bits)
            {
                CreatureEffect(item, &bat_bite, DoBloodSplat);
                lara_item->hit_points -= BAT_ATTACK_DAMAGE;
                lara_item->hit_status = 1;
            }
            else
            {
                item->goal_anim_state = BAT_FLY;
                bat->mood = BORED_MOOD;
            }
            break;
        }
    }

    CreatureAnimation(item_number, angle, 0);
}

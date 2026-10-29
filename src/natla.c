#include "game.h"

#define TORSO_PART_DAMAGE 250
#define TORSO_ATTACK_DAMAGE 500
#define TORSO_TOUCH_DAMAGE 5

#define NATLA_SHOT_DAMAGE 100

#define NATLA_NEAR_DEATH 200

enum natla_anims
{
    NATLA_EMPTY,
    NATLA_STOP,
    NATLA_FLY,
    NATLA_RUN,
    NATLA_AIM,
    NATLA_SEMIDEATH,
    NATLA_SHOOT,
    NATLA_FALL,
    NATLA_STAND,
    NATLA_DEATH
};

BITE_INFO natla_gun = {5, 220, 7, 4};

#define NATLA_FLYMODE 0x8000
#define NATLA_TIMER 0x7fff

#define NATLA_FIRE_ARC (ONE_DEGREE * 30)

#define NATLA_FLY_TURN (ONE_DEGREE * 5)
#define NATLA_RUN_TURN (ONE_DEGREE * 6)

#define NATLA_LAND_CHANCE 0x100

#define NATLA_DIE_TIME (30 * 16)

#define NATLAGUN_SPEED 400

enum torso_anims
{
    TORSO_EMPTY,
    TORSO_STOP,
    TORSO_TURNL,
    TORSO_TURNR,
    TORSO_ATTACK1,
    TORSO_ATTACK2,
    TORSO_ATTACK3,
    TORSO_FORWARD,
    TORSO_SET,
    TORSO_FALL,
    TORSO_DEATH,
    TORSO_KILL
};

#define TORSO_NEED_TURN (ONE_DEGREE * 45)
#define TORSO_TURN (ONE_DEGREE * 3)

#define TORSO_ATTACK_RANGE SQUARE(2600)
#define TORSO_CLOSE_RANGE SQUARE(2250)

#define TORSO_ATTACK1_CHANCE 11000
#define TORSO_ATTACK2_CHANCE 22000

#define TORSO_TLEFT 0x7ff0
#define TORSO_TRIGHT 0x3ff8000
#define TORSO_TOUCH (TORSO_TLEFT | TORSO_TRIGHT)

#define TORSO_DIE_ANIM 13

void TorsoControl(sint16 item_number)
{
    ITEM_INFO *item;
    CREATURE_INFO *torso;
    AI_INFO info;
    FLOOR_INFO *floor;
    sint16 head, angle;

    item = &items[item_number];
    if (item->status == INVISIBLE)
    {
        if (!EnableBaddieAI(item_number, 0))
            return;
        item->status = ACTIVE;
    }
    torso = (CREATURE_INFO *)item->data;
    head = angle = 0;

    if (item->hit_points <= 0)
    {
        if (item->current_anim_state != TORSO_DEATH)
        {
            item->anim_number = objects[EVIL_NATLA].anim_index + TORSO_DIE_ANIM;
            item->frame_number = anims[item->anim_number].frame_base;
            item->current_anim_state = TORSO_DEATH;
        }
    }
    else
    {
        CreatureAIInfo(item, &info);

        if (info.ahead)
            head = info.angle;

        CreatureMood(item, &info, VIOLENT);

        angle = (sint16)phd_atan(torso->target.z - item->pos.z_pos, torso->target.x - item->pos.x_pos) - item->pos.y_rot;

        if (item->touch_bits)
        {
            lara_item->hit_points -= TORSO_TOUCH_DAMAGE;
            lara_item->hit_status = 1;
        }

        switch (item->current_anim_state)
        {
        case TORSO_SET:
            item->goal_anim_state = TORSO_FALL;
            item->gravity_status = 1;
            break;

        case TORSO_STOP:
            if (lara_item->hit_points <= 0)
                break;

            torso->flags = 0;
            if (angle > TORSO_NEED_TURN)
                item->goal_anim_state = TORSO_TURNR;
            else if (angle < -TORSO_NEED_TURN)
                item->goal_anim_state = TORSO_TURNL;
            else if (info.distance < TORSO_ATTACK_RANGE)
            {
                if (lara_item->hit_points <= TORSO_ATTACK_DAMAGE)
                {
                    if (info.distance < TORSO_CLOSE_RANGE)
                        item->goal_anim_state = TORSO_ATTACK3;
                    else
                        item->goal_anim_state = TORSO_FORWARD;
                }
                else if (GetRandomControl() < 0x4000)
                    item->goal_anim_state = TORSO_ATTACK1;
                else
                    item->goal_anim_state = TORSO_ATTACK2;
            }
            else
                item->goal_anim_state = TORSO_FORWARD;
            break;

        case TORSO_FORWARD:
            if (angle < -TORSO_TURN)
                item->goal_anim_state -= TORSO_TURN;
            else if (angle > TORSO_TURN)
                item->goal_anim_state += TORSO_TURN;
            else
                item->goal_anim_state += angle;

            if (angle > TORSO_NEED_TURN || angle < -TORSO_NEED_TURN)
                item->goal_anim_state = TORSO_STOP;
            else if (info.distance < TORSO_ATTACK_RANGE)
                item->goal_anim_state = TORSO_STOP;
            break;

        case TORSO_TURNR:

            if (!torso->flags)
                torso->flags = item->frame_number;
            else if (item->frame_number - torso->flags > 16 && item->frame_number - torso->flags < 23)
                item->pos.y_rot += ONE_DEGREE * 14;

            if (angle < TORSO_NEED_TURN)
                item->goal_anim_state = TORSO_STOP;
            break;

        case TORSO_TURNL:

            if (!torso->flags)
                torso->flags = item->frame_number;
            else if (item->frame_number - torso->flags > 13 && item->frame_number - torso->flags < 23)
                item->pos.y_rot -= ONE_DEGREE * 9;

            if (angle > -TORSO_NEED_TURN)
                item->goal_anim_state = TORSO_STOP;
            break;

        case TORSO_ATTACK1:
            if (!torso->flags && (item->touch_bits & TORSO_TRIGHT))
            {
                lara_item->hit_points -= TORSO_ATTACK_DAMAGE;
                lara_item->hit_status = 1;
                torso->flags = 1;
            }
            break;

        case TORSO_ATTACK2:
            if (!torso->flags && (item->touch_bits & TORSO_TOUCH))
            {
                lara_item->hit_points -= TORSO_ATTACK_DAMAGE;
                lara_item->hit_status = 1;
                torso->flags = 1;
            }
            break;

        case TORSO_ATTACK3:
            if (item->touch_bits & TORSO_TRIGHT || lara_item->hit_points <= 0)
            {
                item->goal_anim_state = TORSO_KILL;

                lara_item->anim_number = objects[LARA_EXTRA].anim_index;
                lara_item->frame_number = anims[lara_item->anim_number].frame_base;
                lara_item->current_anim_state = lara_item->goal_anim_state = AS_SPECIAL;
                lara_item->room_number = item->room_number;
                lara_item->pos.x_pos = item->pos.x_pos;
                lara_item->pos.y_pos = item->pos.y_pos;
                lara_item->pos.z_pos = item->pos.z_pos;
                lara_item->pos.y_rot = item->pos.y_rot;
                lara_item->pos.x_rot = lara_item->pos.z_rot = 0;
                lara_item->gravity_status = 0;
                lara_item->hit_points = -1;
                lara.air = -1;
                lara.gun_status = LG_HANDSBUSY;
                lara.gun_type = LG_UNARMED;

                camera.target_distance = WALL_L * 2;
                camera.flags = FOLLOW_CENTRE;
            }
            break;

        case TORSO_KILL:
            camera.target_distance = WALL_L * 2;
            camera.flags = FOLLOW_CENTRE;
            break;
        }
    }

    CreatureHead(item, head);

    if (item->current_anim_state == TORSO_FALL)
    {
        AnimateItem(item);

        if (item->pos.y_pos > item->floor)
        {
            item->goal_anim_state = TORSO_STOP;
            item->gravity_status = 0;
            item->pos.y_pos = item->floor;
            camera.bounce = 500;
        }
    }
    else
        CreatureAnimation(item_number, 0, 0);

    if (item->status == DEACTIVATED)
    {
        SoundEffect(171, &item->pos, NULL);
        ExplodingDeath(item_number, 0xffffffff, TORSO_PART_DAMAGE);

        floor = GetFloor(item->pos.x_pos, item->pos.y_pos, item->pos.z_pos, &item->room_number);
        GetHeight(floor, item->pos.x_pos, item->pos.y_pos, item->pos.z_pos);
        TestTriggers(trigger_index, 1);

        KillItem(item_number);
        item->status = DEACTIVATED;
    }
}

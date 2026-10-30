#include "game.h"

#define FLYER_PUNCH_DAMAGE 200
#define FLYER_LUNGE_DAMAGE 150
#define FLYER_CHARGE_DAMAGE 100

#define FLYER_PART_DAMAGE 100

#define SHARD_DAMAGE 30
#define ROCKET_DAMAGE 100

#define CENTAUR_REAR_DAMAGE 200

enum flyer_anims
{
    FLYER_EMPTY,
    FLYER_STOP,
    FLYER_WALK,
    FLYER_RUN,
    FLYER_ATTACK1,
    FLYER_DEATH,
    FLYER_POSE,
    FLYER_ATTACK2,
    FLYER_ATTACK3,
    FLYER_AIM1,
    FLYER_AIM2,
    FLYER_SHOOT,
    FLYER_MUMMY,
    FLYER_FLY
};

BITE_INFO warrior_bite = {-27, 98, 0, 10};

BITE_INFO warrior_rocket = {51, 213, 0, 14};
BITE_INFO warrior_shard = {-35, 269, 0, 9};

#define FLYER_WALK_TURN (ONE_DEGREE * 2)
#define FLYER_RUN_TURN (ONE_DEGREE * 6)
#define FLYER_POSE_CHANCE 0x50
#define FLYER_UNPOSE_CHANCE 0x100

#define FLYER_WALK_RANGE SQUARE(WALL_L * 9 / 2)
#define FLYER_ATTACK1_RANGE SQUARE(600)
#define FLYER_ATTACK2_RANGE SQUARE(WALL_L * 5 / 2)
#define FLYER_ATTACK3_RANGE SQUARE(300)

#define FLYER_ATTACK_RANGE SQUARE(WALL_L * 15 / 4)

#define FLYER_TOUCH (0x678)

#define FLYER_BULLET1 1
#define FLYER_BULLET2 2
#define FLYER_FLYMODE 4
#define FLYER_TWIST 8

#define SHARD_SPEED 250
#define ROCKET_SPEED 220

#define ROCKET_RANGE SQUARE(WALL_L)

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

enum mummy_anims
{
    MUMMY_EMPTY,
    MUMMY_STOP,
    MUMMY_DEATH
};

sint16 ShardGun(sint32 x, sint32 y, sint32 z, sint16 speed, PHD_ANGLE yrot, sint16 room_number);
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

void InitialiseWarrior2(sint16 item_number)
{
    InitialiseCreature(item_number);
    items[item_number].mesh_bits = 0xffe07fff;
}

void FlyerControl(sint16 item_number)
{
    ITEM_INFO *item;
    CREATURE_INFO *flyer;
    sint16 angle, head;
    int shoot1, shoot2;
    AI_INFO info;

    item = &items[item_number];
    if (item->status == INVISIBLE)
    {
        if (!EnableBaddieAI(item_number, 0))
            return;
        item->status = ACTIVE;
    }
    flyer = (CREATURE_INFO *)item->data;
    head = angle = 0;

    if (item->hit_points <= 0)
    {
        if (ExplodingDeath(item_number, 0xffffffff, FLYER_PART_DAMAGE))
        {
            SoundEffect(171, &item->pos, NULL);
            DisableBaddieAI(item_number);
            KillItem(item_number);
            item->status = DEACTIVATED;
            return;
        }
    }
    else
    {
        flyer->LOT.step = STEP_L;
        flyer->LOT.drop = -STEP_L;
        flyer->LOT.fly = NO_FLYING;
        CreatureAIInfo(item, &info);

        if (item->object_number == WARRIOR3)
            shoot1 = shoot2 = 0;
        else
        {
            shoot1 = shoot2 = 0;
            if (Targetable(item, &info) && (info.zone_number != info.enemy_zone || info.distance > FLYER_ATTACK_RANGE))
            {
                if (info.angle > 0 && info.angle < 0x2000)
                    shoot1 = 1;
                else if (info.angle < 0 && info.angle > -0x2000)
                    shoot2 = 1;
            }
        }

        if (item->object_number == WARRIOR1)
        {
            if (item->current_anim_state == FLYER_FLY)
            {
                if ((flyer->flags & FLYER_FLYMODE) && flyer->mood != ESCAPE_MOOD && info.zone_number == info.enemy_zone)
                    flyer->flags -= FLYER_FLYMODE;

                if (!(flyer->flags & FLYER_FLYMODE))
                    CreatureMood(item, &info, VIOLENT);

                flyer->LOT.step = WALL_L * 30;
                flyer->LOT.drop = -WALL_L * 30;
                flyer->LOT.fly = STEP_L / 8;
                CreatureAIInfo(item, &info);
            }
            else if ((info.zone_number != info.enemy_zone && !shoot1 && !shoot2 && (!info.ahead || flyer->mood == BORED_MOOD)) || flyer->mood == ESCAPE_MOOD)
                flyer->flags |= FLYER_FLYMODE;
        }

        if (info.ahead)
            head = info.angle;

        if (item->current_anim_state != FLYER_FLY)
            CreatureMood(item, &info, TIMID);
        else if (flyer->flags & FLYER_FLYMODE)
            CreatureMood(item, &info, VIOLENT);

        angle = CreatureTurn(item, flyer->maximum_turn);

        switch (item->current_anim_state)
        {
        case FLYER_MUMMY:
            item->goal_anim_state = FLYER_STOP;
            break;

        case FLYER_STOP:
            flyer->flags &= ~(FLYER_BULLET1 | FLYER_BULLET2 | FLYER_TWIST);

            if (flyer->flags & FLYER_FLYMODE)
                item->goal_anim_state = FLYER_FLY;
            else if (item->touch_bits & FLYER_TOUCH)
                item->goal_anim_state = FLYER_ATTACK3;
            else if (info.bite && info.distance < FLYER_ATTACK3_RANGE)
                item->goal_anim_state = FLYER_ATTACK3;
            else if (info.bite && info.distance < FLYER_ATTACK1_RANGE)
                item->goal_anim_state = FLYER_ATTACK1;
            else if (shoot1)
                item->goal_anim_state = FLYER_AIM1;
            else if (shoot2)
                item->goal_anim_state = FLYER_AIM2;
            else if (flyer->mood == BORED_MOOD || (flyer->mood == STALK_MOOD && info.distance < FLYER_WALK_RANGE))
                item->goal_anim_state = FLYER_POSE;
            else
                item->goal_anim_state = FLYER_RUN;
            break;

        case FLYER_POSE:
            head = 0;

            if (shoot1 || shoot2 || (flyer->flags & FLYER_FLYMODE))
                item->goal_anim_state = FLYER_STOP;
            else if (flyer->mood == STALK_MOOD)
            {
                if (info.distance < FLYER_WALK_RANGE)
                {
                    if (info.zone_number == info.enemy_zone || GetRandomControl() < FLYER_UNPOSE_CHANCE)
                        item->goal_anim_state = FLYER_WALK;
                }
                else
                    item->goal_anim_state = FLYER_STOP;
            }
            else if (flyer->mood == BORED_MOOD && GetRandomControl() < FLYER_UNPOSE_CHANCE)
                item->goal_anim_state = FLYER_WALK;
            else if (flyer->mood == ATTACK_MOOD || flyer->mood == ESCAPE_MOOD)
                item->goal_anim_state = FLYER_STOP;
            break;

        case FLYER_WALK:
            flyer->maximum_turn = FLYER_WALK_TURN;

            if (shoot1 || shoot2 || (flyer->flags & FLYER_FLYMODE))
                item->goal_anim_state = FLYER_STOP;
            else if (flyer->mood == ATTACK_MOOD || flyer->mood == ESCAPE_MOOD)
                item->goal_anim_state = FLYER_STOP;
            else if (flyer->mood == BORED_MOOD || (flyer->mood == STALK_MOOD && info.zone_number != info.enemy_zone))
            {
                if (GetRandomControl() < FLYER_POSE_CHANCE)
                    item->goal_anim_state = FLYER_POSE;
            }
            else if (flyer->mood == STALK_MOOD && info.distance > FLYER_WALK_RANGE)
                item->goal_anim_state = FLYER_STOP;
            break;

        case FLYER_RUN:
            flyer->maximum_turn = FLYER_RUN_TURN;

            if (flyer->flags & FLYER_FLYMODE)
                item->goal_anim_state = FLYER_STOP;
            else if (item->touch_bits & FLYER_TOUCH)
                item->goal_anim_state = FLYER_STOP;
            else if (info.bite && info.distance < FLYER_ATTACK1_RANGE)
                item->goal_anim_state = FLYER_STOP;
            else if (info.ahead && info.distance < FLYER_ATTACK2_RANGE)
                item->goal_anim_state = FLYER_ATTACK2;
            else if (shoot1 || shoot2)
                item->goal_anim_state = FLYER_STOP;
            else if (flyer->mood == BORED_MOOD || (flyer->mood == STALK_MOOD && info.distance < FLYER_WALK_RANGE))
                item->goal_anim_state = FLYER_STOP;
            break;

        case FLYER_ATTACK1:
            if (!item->required_anim_state && (item->touch_bits & FLYER_TOUCH))
            {
                CreatureEffect(item, &warrior_bite, DoBloodSplat);

                lara_item->hit_points -= FLYER_LUNGE_DAMAGE;
                lara_item->hit_status = 1;

                item->required_anim_state = FLYER_STOP;
            }
            break;

        case FLYER_ATTACK2:
            if (!item->required_anim_state && (item->touch_bits & FLYER_TOUCH))
            {
                CreatureEffect(item, &warrior_bite, DoBloodSplat);

                lara_item->hit_points -= FLYER_CHARGE_DAMAGE;
                lara_item->hit_status = 1;

                item->required_anim_state = FLYER_RUN;
            }
            break;

        case FLYER_ATTACK3:
            if (!item->required_anim_state && (item->touch_bits & FLYER_TOUCH))
            {
                CreatureEffect(item, &warrior_bite, DoBloodSplat);

                lara_item->hit_points -= FLYER_PUNCH_DAMAGE;
                lara_item->hit_status = 1;

                item->required_anim_state = FLYER_STOP;
            }
            break;

        case FLYER_AIM1:
            flyer->flags |= FLYER_TWIST;
            flyer->flags |= FLYER_BULLET1;

            if (shoot1)
                item->goal_anim_state = FLYER_SHOOT;
            else
                item->goal_anim_state = FLYER_STOP;
            break;

        case FLYER_AIM2:
            flyer->flags |= FLYER_BULLET2;

            if (shoot2)
                item->goal_anim_state = FLYER_SHOOT;
            else
                item->goal_anim_state = FLYER_STOP;
            break;

        case FLYER_SHOOT:
            if (flyer->flags & FLYER_BULLET1)
            {
                flyer->flags -= FLYER_BULLET1;
                CreatureEffect(item, &warrior_shard, ShardGun);
            }
            else if (flyer->flags & FLYER_BULLET2)
            {
                flyer->flags -= FLYER_BULLET2;
                CreatureEffect(item, &warrior_rocket, RocketGun);
            }
            break;

        case FLYER_FLY:
            if (!(flyer->flags & FLYER_FLYMODE) && item->pos.y_pos == item->floor)
                item->goal_anim_state = FLYER_STOP;
            break;
        }
    }

    if (!(flyer->flags & FLYER_TWIST))
        flyer->head_rotation = flyer->neck_rotation;

    CreatureHead(item, head);

    if (!(flyer->flags & FLYER_TWIST))
    {
        flyer->neck_rotation = flyer->head_rotation;
        flyer->head_rotation = 0;
    }
    else
        flyer->neck_rotation = 0;

    CreatureAnimation(item_number, angle, 0);
}

void ControlMissile(sint16 fx_number)
{
    FX_INFO *fx;
    FLOOR_INFO *floor;
    sint16 room_number;
    sint32 speed, x, y, z, range;

    fx = &effects[fx_number];

    fx->pos.y_pos += (fx->speed * phd_sin(-fx->pos.x_rot) >> W2V_SHIFT);
    speed = fx->speed * phd_cos(fx->pos.x_rot) >> W2V_SHIFT;
    fx->pos.z_pos += (speed * phd_cos(fx->pos.y_rot) >> W2V_SHIFT);
    fx->pos.x_pos += (speed * phd_sin(fx->pos.y_rot) >> W2V_SHIFT);
    room_number = fx->room_number;
    floor = GetFloor(fx->pos.x_pos, fx->pos.y_pos, fx->pos.z_pos, &room_number);

    if (fx->pos.y_pos >= GetHeight(floor, fx->pos.x_pos, fx->pos.y_pos, fx->pos.z_pos) || fx->pos.y_pos <= GetCeiling(floor, fx->pos.x_pos, fx->pos.y_pos, fx->pos.z_pos))
    {
        if (fx->object_number == MISSILE2)
        {
            fx->speed = 0;
            fx->frame_number = (sint16)(-GetRandomControl() / 11000);
            fx->counter = 6;
            fx->object_number = RICOCHET1;
            SoundEffect(10, &fx->pos, NULL);
        }
        else
        {
            fx->speed = 0;
            fx->frame_number = 0;
            fx->counter = 0;
            fx->object_number = EXPLOSION1;
            SoundEffect(104, &fx->pos, NULL);

            x = fx->pos.x_pos - lara_item->pos.x_pos;
            y = fx->pos.y_pos - lara_item->pos.y_pos;
            z = fx->pos.z_pos - lara_item->pos.z_pos;

            range = x * x + y * y + z * z;
            if (range < ROCKET_RANGE)
            {
                lara_item->hit_points -= ROCKET_DAMAGE * (ROCKET_RANGE - range) / ROCKET_RANGE;
                lara_item->hit_status = 1;
            }
        }
        return;
    }

    if (room_number != fx->room_number)
        EffectNewRoom(fx_number, room_number);

    if (ItemNearLara(&fx->pos, 200))
    {
        if (fx->object_number == MISSILE2)
        {
            lara_item->hit_points -= SHARD_DAMAGE;
            fx->object_number = BLOOD1;
            SoundEffect(50, &fx->pos, NULL);
        }
        else
        {
            lara_item->hit_points -= ROCKET_DAMAGE;
            fx->object_number = EXPLOSION1;
            if (lara_item->hit_points > 0)
            {
                SoundEffect(31, &lara_item->pos, NULL);
                lara.hit_effect = fx;
                lara.hit_effect_count = 5;
            }
            SoundEffect(104, &fx->pos, NULL);
        }
        lara_item->hit_status = 1;

        fx->pos.y_rot = lara_item->pos.y_rot;
        fx->speed = lara_item->speed;
        fx->frame_number = fx->counter = 0;
    }
}

void ShootAtLara(FX_INFO *fx)
{
    sint32 x, y, z, distance;
    sint16 *bounds;

    x = lara_item->pos.x_pos - fx->pos.x_pos;
    y = lara_item->pos.y_pos - fx->pos.y_pos;
    z = lara_item->pos.z_pos - fx->pos.z_pos;

    bounds = GetBoundsAccurate(lara_item);
    y += bounds[3] + (bounds[2] - bounds[3]) * 3 / 4;

    distance = phd_sqrt(SQUARE(x) + SQUARE(z));
    fx->pos.x_rot = -(PHD_ANGLE)phd_atan(distance, y);
    fx->pos.y_rot = (PHD_ANGLE)phd_atan(z, x);

    fx->pos.x_rot += (GetRandomControl() - 0x4000) / 0x40;
    fx->pos.y_rot += (GetRandomControl() - 0x4000) / 0x40;
}

sint16 ShardGun(sint32 x, sint32 y, sint32 z, sint16 speed, PHD_ANGLE yrot, sint16 room_number)
{
    sint16 fx_number;
    FX_INFO *fx;

    fx_number = CreateEffect(room_number);
    if (fx_number != NO_ITEM)
    {
        fx = &effects[fx_number];
        fx->pos.x_pos = x;
        fx->pos.y_pos = y;
        fx->pos.z_pos = z;
        fx->room_number = room_number;
        fx->pos.x_rot = fx->pos.z_rot = 0;
        fx->pos.y_rot = yrot;
        fx->speed = SHARD_SPEED;
        fx->frame_number = 0;
        fx->object_number = MISSILE2;
        fx->shade = 14 * 256;
        ShootAtLara(fx);
    }

    return fx_number;
}

sint16 RocketGun(sint32 x, sint32 y, sint32 z, sint16 speed, PHD_ANGLE yrot, sint16 room_number)
{
    sint16 fx_number;
    FX_INFO *fx;

    fx_number = CreateEffect(room_number);
    if (fx_number != NO_ITEM)
    {
        fx = &effects[fx_number];
        fx->pos.x_pos = x;
        fx->pos.y_pos = y;
        fx->pos.z_pos = z;
        fx->room_number = room_number;
        fx->pos.x_rot = fx->pos.z_rot = 0;
        fx->pos.y_rot = yrot;
        fx->speed = ROCKET_SPEED;
        fx->frame_number = 0;
        fx->object_number = MISSILE3;
        fx->shade = 16 * 256;
        ShootAtLara(fx);
    }

    return fx_number;
}

void InitialiseMummy(sint16 item_number)
{
    ITEM_INFO *item;

    item = &items[item_number];

    item->touch_bits = 0;
    item->mesh_bits = 0xffff87ff;

    item->data = (sint16 *)game_malloc(sizeof(sint16), MUMMY_HEAD_TURN);
    *(sint16 *)item->data = 0;
}

void MummyControl(sint16 item_number)
{
    ITEM_INFO *item;
    sint16 head;

    item = &items[item_number];

    head = 0;

    if (item->current_anim_state == MUMMY_STOP)
    {
        head = (sint16)phd_atan(lara_item->pos.z_pos - item->pos.z_pos, lara_item->pos.x_pos - item->pos.x_pos) - item->pos.y_rot;
        if (head < -FRONT_ARC)
            head = -FRONT_ARC;
        else if (head > FRONT_ARC)
            head = FRONT_ARC;

        if (item->hit_points <= 0 || item->touch_bits)
            item->goal_anim_state = MUMMY_DEATH;
    }

    CreatureHead(item, head);

    AnimateItem(item);

    if (item->status == DEACTIVATED)
    {
        RemoveActiveItem(item_number);
        item->hit_points = DONT_TARGET;
    }
}

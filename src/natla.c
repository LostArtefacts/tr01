#include "game.h"

sint16 ShardGun(sint32 x, sint32 y, sint32 z, sint16 speed, PHD_ANGLE yrot, sint16 room_number);
sint16 RocketGun(sint32 x, sint32 y, sint32 z, sint16 speed, PHD_ANGLE yrot, sint16 room_number);

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

void NatlaControl(sint16 item_number)
{
    static sint16 facing = 0;
    int shoot;
    ITEM_INFO *item;
    FX_INFO *fx;
    CREATURE_INFO *natla;
    sint16 angle, head, tilt, gun;
    AI_INFO info;
    sint16 fx_number, timer;

    item = &items[item_number];
    if (item->status == INVISIBLE)
    {
        if (!EnableBaddieAI(item_number, 0))
            return;
        item->status = ACTIVE;
    }
    natla = (CREATURE_INFO *)item->data;
    head = angle = tilt = 0;
    gun = natla->head_rotation * 7 / 8;

    timer = natla->flags & NATLA_TIMER;

    if (item->hit_points <= 0 && item->hit_points > DONT_TARGET)
        item->goal_anim_state = NATLA_DEATH;
    else if (item->hit_points <= NATLA_NEAR_DEATH)
    {
        natla->LOT.step = STEP_L;
        natla->LOT.drop = -STEP_L;
        natla->LOT.fly = NO_FLYING;
        CreatureAIInfo(item, &info);

        if (info.ahead)
            head = info.angle;

        CreatureMood(item, &info, VIOLENT);

        angle = CreatureTurn(item, NATLA_RUN_TURN);

        shoot = (info.angle > -NATLA_FIRE_ARC && info.angle < NATLA_FIRE_ARC && Targetable(item, &info));

        if (facing)
        {
            item->pos.y_rot += facing;
            facing = 0;
        }

        switch (item->current_anim_state)
        {
        case NATLA_FALL:
            if (item->pos.y_pos < item->floor)
            {
                item->gravity_status = 1;
                item->speed = 0;
            }
            else
            {
                item->gravity_status = 0;
                item->goal_anim_state = NATLA_SEMIDEATH;
                item->pos.y_pos = item->floor;
                timer = 0;
            }
            break;

        case NATLA_STAND:
            if (!shoot)
                item->goal_anim_state = NATLA_RUN;

            if (timer >= 20)
            {
                fx_number = CreatureEffect(item, &natla_gun, ShardGun);
                if (fx_number != NO_ITEM)
                {
                    fx = &effects[fx_number];
                    gun = fx->pos.x_rot;
                    SoundEffect(123, &fx->pos, NULL);
                }
                timer = 0;
            }
            break;

        case NATLA_RUN:
            tilt = angle;

            if (timer >= 20)
            {
                fx_number = CreatureEffect(item, &natla_gun, ShardGun);
                if (fx_number != NO_ITEM)
                {
                    fx = &effects[fx_number];
                    gun = fx->pos.x_rot;
                    SoundEffect(123, &fx->pos, NULL);
                }
                timer = 0;
            }

            if (shoot)
                item->goal_anim_state = NATLA_STAND;
            break;

        case NATLA_SEMIDEATH:
            if (timer == NATLA_DIE_TIME)
            {
                item->goal_anim_state = NATLA_STAND;
                natla->flags = 0;
                timer = 0;
                item->hit_points = NATLA_NEAR_DEATH;
                S_CDPlay(54);
            }
            else
                item->hit_points = DONT_TARGET;
            break;

        case NATLA_FLY:
            item->goal_anim_state = NATLA_FALL;
            timer = 0;
            break;

        case NATLA_STOP:
        case NATLA_SHOOT:
        case NATLA_AIM:
            item->goal_anim_state = NATLA_SEMIDEATH;
            item->flags = 0;
            timer = 0;
            break;
        }
    }
    else
    {
        natla->LOT.step = STEP_L;
        natla->LOT.drop = -STEP_L;
        natla->LOT.fly = NO_FLYING;
        CreatureAIInfo(item, &info);

        shoot = (info.angle > -NATLA_FIRE_ARC && info.angle < NATLA_FIRE_ARC && Targetable(item, &info));

        if (item->current_anim_state == NATLA_FLY && (natla->flags & NATLA_FLYMODE))
        {
            if ((natla->flags & NATLA_FLYMODE) && shoot && GetRandomControl() < NATLA_LAND_CHANCE)
                natla->flags -= NATLA_FLYMODE;

            if (!(natla->flags & NATLA_FLYMODE))
                CreatureMood(item, &info, VIOLENT);

            natla->LOT.step = WALL_L * 20;
            natla->LOT.drop = -WALL_L * 20;
            natla->LOT.fly = STEP_L / 8;
            CreatureAIInfo(item, &info);
        }
        else if (!shoot)
            natla->flags |= NATLA_FLYMODE;

        if (info.ahead)
            head = info.angle;

        if (item->current_anim_state != NATLA_FLY || (natla->flags & NATLA_FLYMODE))
            CreatureMood(item, &info, TIMID);

        item->pos.y_rot -= facing;
        angle = CreatureTurn(item, NATLA_FLY_TURN);

        if (item->current_anim_state == NATLA_FLY)
        {
            if (info.angle > NATLA_FLY_TURN)
                facing += NATLA_FLY_TURN;
            else if (info.angle < -NATLA_FLY_TURN)
                facing -= NATLA_FLY_TURN;
            else
                facing += info.angle;
            item->pos.y_rot += facing;
        }
        else
        {
            item->pos.y_rot += facing - angle;
            facing = 0;
        }

        switch (item->current_anim_state)
        {
        case NATLA_STOP:
            timer = 0;
            if (natla->flags & NATLA_FLYMODE)
                item->goal_anim_state = NATLA_FLY;
            else
                item->goal_anim_state = NATLA_AIM;
            break;

        case NATLA_FLY:
            if (!(natla->flags & NATLA_FLYMODE) && item->pos.y_pos == item->floor)
                item->goal_anim_state = NATLA_STOP;

            if (timer >= 30)
            {
                fx_number = CreatureEffect(item, &natla_gun, RocketGun);
                if (fx_number != NO_ITEM)
                {
                    fx = &effects[fx_number];
                    gun = fx->pos.x_rot;
                    SoundEffect(123, &fx->pos, NULL);
                }
                timer = 0;
            }
            break;

        case NATLA_AIM:
            if (item->required_anim_state)
                item->goal_anim_state = item->required_anim_state;
            else if (shoot)
                item->goal_anim_state = NATLA_SHOOT;
            else
                item->goal_anim_state = NATLA_STOP;
            break;

        case NATLA_SHOOT:
            if (!item->required_anim_state)
            {
                fx_number = CreatureEffect(item, &natla_gun, RocketGun);
                if (fx_number != NO_ITEM)
                    gun = effects[fx_number].pos.x_rot;
                fx_number = CreatureEffect(item, &natla_gun, RocketGun);
                if (fx_number != NO_ITEM)
                    effects[fx_number].pos.y_rot += (GetRandomControl() - 0x4000) / 4;
                fx_number = CreatureEffect(item, &natla_gun, RocketGun);
                if (fx_number != NO_ITEM)
                    effects[fx_number].pos.y_rot += (GetRandomControl() - 0x4000) / 4;

                item->required_anim_state = NATLA_STOP;
            }
            break;
        }
    }

    CreatureTilt(item, tilt);

    natla->neck_rotation = -head;
    if (gun)
        natla->head_rotation = gun;

    timer++;
    natla->flags = (natla->flags & NATLA_FLYMODE) + timer;

    item->pos.y_rot -= facing;
    CreatureAnimation(item_number, angle, 0);
    item->pos.y_rot += facing;
}

void ControlNatlaGun(sint16 fx_number)
{
    FX_INFO *fx, *newfx;
    OBJECT_INFO *object;
    FLOOR_INFO *floor;
    sint16 room_number;
    sint32 x, y, z;

    fx = &effects[fx_number];
    object = &objects[fx->object_number];
    fx->frame_number--;
    if (fx->frame_number <= objects[fx->object_number].nmeshes)
        KillEffect(fx_number);

    if (fx->frame_number == -1)
    {
        z = fx->pos.z_pos + (fx->speed * phd_cos(fx->pos.y_rot) >> W2V_SHIFT);
        x = fx->pos.x_pos + (fx->speed * phd_sin(fx->pos.y_rot) >> W2V_SHIFT);
        y = fx->pos.y_pos;
        room_number = fx->room_number;
        floor = GetFloor(x, y, z, &room_number);

        if (y >= GetHeight(floor, x, y, z) || y <= GetCeiling(floor, x, y, z))
            return;

        fx_number = CreateEffect(room_number);
        if (fx_number != NO_ITEM)
        {
            newfx = &effects[fx_number];
            newfx->pos.x_pos = x;
            newfx->pos.y_pos = y;
            newfx->pos.z_pos = z;
            newfx->pos.y_rot = fx->pos.y_rot;
            newfx->room_number = room_number;
            newfx->speed = fx->speed;
            newfx->frame_number = 0;
            newfx->object_number = MISSILE1;
        }
    }
}

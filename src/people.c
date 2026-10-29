#include "game.h"

sint16 pierre_item;

#define PIERRE_RUN_HITPOINTS 40
#define PIERRE_DISAPPEAR 10

#define APE_ATTACK_DAMAGE 200

#define PEOPLE_SHOT_DAMAGE 50

#define KID_STOP_SHOT_DAMAGE 50
#define KID_SKATE_SHOT_DAMAGE 40

#define PEOPLE_SHOOT_RANGE SQUARE(WALL_L * 7)
#define PEOPLE_MISS_CHANCE 0x2000

enum baldy_anims
{
    BALDY_EMPTY,
    BALDY_STOP,
    BALDY_WALK,
    BALDY_RUN,
    BALDY_AIM,
    BALDY_DEATH,
    BALDY_SHOOT
};

#define BALDY_WALK_TURN (ONE_DEGREE * 3)
#define BALDY_RUN_TURN (ONE_DEGREE * 6)

#define BALDY_WALK_RANGE SQUARE(WALL_L * 4)

#define BALDY_DIE_ANIM 14

BITE_INFO baldy_gun = {-20, 440, 20, 9};

enum people_anims
{
    PEOPLE_EMPTY,
    PEOPLE_STOP,
    PEOPLE_WALK,
    PEOPLE_RUN,
    PEOPLE_AIM,
    PEOPLE_DEATH,
    PEOPLE_POSE,
    PEOPLE_SHOOT
};

#define PEOPLE_WALK_TURN (ONE_DEGREE * 3)
#define PEOPLE_RUN_TURN (ONE_DEGREE * 6)

#define PEOPLE_POSE_CHANCE 0x60

#define PEOPLE_WALK_RANGE SQUARE(WALL_L * 3)

#define LARSON_DIE_ANIM 15
#define PIERRE_DIE_ANIM 12
#define PIERRE_WIMP_CHANCE 0x2000

BITE_INFO larson_gun = {-60, 170, 0, 14};

BITE_INFO pierre_gun1 = {60, 200, 0, 11};
BITE_INFO pierre_gun2 = {-57, 200, 0, 14};

BITE_INFO cowboy_gun1 = {1, 200, 41, 5};
BITE_INFO cowboy_gun2 = {-2, 200, 40, 8};

#define APE_TOUCH (0xff00)

enum ape_anims
{
    APE_EMPTY,
    APE_STOP,
    APE_WALK,
    APE_RUN,
    APE_ATTACK1,
    APE_DEATH,
    APE_WARNING,
    APE_WARNING2,
    APE_RUNLEFT,
    APE_RUNRIGHT,
    APE_JUMP,
    APE_VAULT
};

BITE_INFO ape_bite = {0, -19, 75, 15};

#define APE_DIE_ANIM 7
#define APE_VAULT_ANIM 19

#define APE_RUN_TURN (ONE_DEGREE * 5)

#define APE_DISPLAY_ANGLE (ONE_DEGREE * 45)

#define APE_ATTACK_RANGE SQUARE(430)
#define APE_PANIC_RANGE SQUARE(WALL_L * 2)

#define APE_JUMP_CHANCE 0xa0
#define APE_WARN1_CHANCE (APE_JUMP_CHANCE + 0xa0)
#define APE_WARN2_CHANCE (APE_WARN1_CHANCE + 0xa0)
#define APE_RUNLEFT_CHANCE (APE_WARN2_CHANCE + 0x110)

#define APE_ATTACK_FLAG 1
#define APE_TURNL_FLAG 2
#define APE_TURNR_FLAG 4

#define APE_SHIFT 75

enum kid_anims
{
    KID_STOP,
    KID_SHOOT,
    KID_SKATE,
    KID_PUSH,
    KID_SHOOT2,
    KID_DEATH
};

#define KID_STOP_RANGE SQUARE(WALL_L * 4)
#define KID_DONT_STOP_RANGE SQUARE(WALL_L * 5 / 2)
#define KID_TOO_CLOSE SQUARE(WALL_L)

#define KID_SKATE_TURN (ONE_DEGREE * 4)

#define KID_PUSH_CHANCE 0x200
#define KID_SKATE_CHANCE 0x400

#define KID_DIE_ANIM 13

BITE_INFO kid_gun1 = {0, 150, 34, 7};
BITE_INFO kid_gun2 = {0, 150, 37, 4};

int Targetable(ITEM_INFO *item, AI_INFO *info)
{
    GAME_VECTOR start, target;

    if (info->ahead && info->distance < PEOPLE_SHOOT_RANGE)
    {
        start.x = item->pos.x_pos;
        start.y = item->pos.y_pos - STEP_L * 3;
        start.z = item->pos.z_pos;
        start.room_number = item->room_number;

        target.x = lara_item->pos.x_pos;
        target.y = lara_item->pos.y_pos - STEP_L * 3;
        target.z = lara_item->pos.z_pos;

        return LOS(&start, &target);
    }

    return 0;
}

void ControlGunShot(sint16 fx_number)
{
    FX_INFO *fx;

    fx = &effects[fx_number];
    fx->counter--;

    if (!fx->counter)
    {
        KillEffect(fx_number);
        return;
    }

    fx->pos.z_rot = (PHD_ANGLE)GetRandomControl();
}

sint16 GunShot(sint32 x, sint32 y, sint32 z, sint16 speed, PHD_ANGLE yrot, sint16 room_number)
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
        fx->counter = 3;
        fx->frame_number = 0;
        fx->object_number = GUN_FLASH;
        fx->shade = 16 * 256;
    }

    return fx_number;
}

sint16 GunHit(sint32 x, sint32 y, sint32 z, sint16 speed, PHD_ANGLE yrot, sint16 room_number)
{
    PHD_VECTOR pos;

    pos.x = pos.y = pos.z = 0;
    GetJointAbsPosition(lara_item, &pos, GetRandomControl() * 25 / 0x7fff);
    DoBloodSplat(pos.x, pos.y, pos.z, lara_item->speed, lara_item->pos.y_rot, lara_item->room_number);
    SoundEffect(50, &lara_item->pos, NULL);

    return GunShot(x, y, z, speed, yrot, room_number);
}

sint16 GunMiss(sint32 x, sint32 y, sint32 z, sint16 speed, PHD_ANGLE yrot, sint16 room_number)
{
    GAME_VECTOR pos;

    pos.x = lara_item->pos.x_pos + (GetRandomDraw() - 0x4000) * (WALL_L / 2) / 0x7fff;
    pos.y = lara_item->floor;
    pos.z = lara_item->pos.z_pos + (GetRandomDraw() - 0x4000) * (WALL_L / 2) / 0x7fff;
    pos.room_number = lara_item->room_number;
    Richochet(&pos);

    return GunShot(x, y, z, speed, yrot, room_number);
}

int ShotLara(ITEM_INFO *item, sint32 distance, BITE_INFO *gun, sint16 extra_rotation)
{
    int hit, random;
    sint16 fx_number;

    if (distance > PEOPLE_SHOOT_RANGE)
        hit = 0;
    else
    {
        random = (PEOPLE_SHOOT_RANGE - distance) / (PEOPLE_SHOOT_RANGE / 0x7fff) - PEOPLE_MISS_CHANCE;
        hit = (GetRandomControl() < random);
    }

    if (hit)
        fx_number = CreatureEffect(item, gun, GunHit);
    else
        fx_number = CreatureEffect(item, gun, GunMiss);

    if (fx_number != NO_ITEM)
        effects[fx_number].pos.y_rot += extra_rotation;

    return hit;
}

void PeopleControl(sint16 item_number)
{
    ITEM_INFO *item;
    CREATURE_INFO *people;
    sint16 angle, head, tilt;
    AI_INFO info;

    item = &items[item_number];
    if (item->status == INVISIBLE)
    {
        if (!EnableBaddieAI(item_number, 0))
            return;
        item->status = ACTIVE;
    }
    people = (CREATURE_INFO *)item->data;
    head = angle = tilt = 0;

    if (item->hit_points <= 0)
    {
        if (item->current_anim_state != PEOPLE_DEATH)
        {
            item->anim_number = objects[LARSON].anim_index + LARSON_DIE_ANIM;
            item->frame_number = anims[item->anim_number].frame_base;
            item->current_anim_state = PEOPLE_DEATH;
        }
    }
    else
    {
        CreatureAIInfo(item, &info);

        if (info.ahead)
            head = info.angle;

        CreatureMood(item, &info, TIMID);

        angle = CreatureTurn(item, people->maximum_turn);

        switch (item->current_anim_state)
        {
        case PEOPLE_STOP:
            if (item->required_anim_state)
                item->goal_anim_state = item->required_anim_state;
            else if (people->mood == BORED_MOOD)
                item->goal_anim_state = (GetRandomControl() < PEOPLE_POSE_CHANCE) ? PEOPLE_POSE : PEOPLE_WALK;
            else if (people->mood == ESCAPE_MOOD)
                item->goal_anim_state = PEOPLE_RUN;
            else
                item->goal_anim_state = PEOPLE_WALK;
            break;

        case PEOPLE_POSE:
            if (people->mood != BORED_MOOD)
                item->goal_anim_state = PEOPLE_STOP;
            else if (GetRandomControl() < PEOPLE_POSE_CHANCE)
            {
                item->required_anim_state = PEOPLE_WALK;
                item->goal_anim_state = PEOPLE_STOP;
            }
            break;

        case PEOPLE_WALK:
            people->maximum_turn = PEOPLE_WALK_TURN;

            if (people->mood == BORED_MOOD && GetRandomControl() < PEOPLE_POSE_CHANCE)
            {
                item->required_anim_state = PEOPLE_POSE;
                item->goal_anim_state = PEOPLE_STOP;
            }
            else if (people->mood == ESCAPE_MOOD)
            {
                item->required_anim_state = PEOPLE_RUN;
                item->goal_anim_state = PEOPLE_STOP;
            }
            else if (Targetable(item, &info))
            {
                item->required_anim_state = PEOPLE_AIM;
                item->goal_anim_state = PEOPLE_STOP;
            }
            else if (!info.ahead || info.distance > PEOPLE_WALK_RANGE)
            {
                item->required_anim_state = PEOPLE_RUN;
                item->goal_anim_state = PEOPLE_STOP;
            }
            break;

        case PEOPLE_RUN:
            people->maximum_turn = PEOPLE_RUN_TURN;
            tilt = angle / 2;

            if (people->mood == BORED_MOOD && GetRandomControl() < PEOPLE_POSE_CHANCE)
            {
                item->required_anim_state = PEOPLE_POSE;
                item->goal_anim_state = PEOPLE_STOP;
            }
            else if (Targetable(item, &info))
            {
                item->required_anim_state = PEOPLE_AIM;
                item->goal_anim_state = PEOPLE_STOP;
            }
            else if (info.ahead && info.distance < PEOPLE_WALK_RANGE)
            {
                item->required_anim_state = PEOPLE_WALK;
                item->goal_anim_state = PEOPLE_STOP;
            }
            break;

        case PEOPLE_AIM:
            if (item->required_anim_state)
                item->goal_anim_state = item->required_anim_state;
            else if (Targetable(item, &info))
                item->goal_anim_state = PEOPLE_SHOOT;
            else
                item->goal_anim_state = PEOPLE_STOP;
            break;

        case PEOPLE_SHOOT:

            if (!item->required_anim_state)
            {
                if (ShotLara(item, info.distance, &larson_gun, head))
                {
                    lara_item->hit_points -= PEOPLE_SHOT_DAMAGE;
                    lara_item->hit_status = 1;
                }

                item->required_anim_state = PEOPLE_AIM;
            }

            if (people->mood == ESCAPE_MOOD)
                item->required_anim_state = PEOPLE_STOP;
            break;
        }
    }

    CreatureTilt(item, tilt);
    CreatureHead(item, head);

    CreatureAnimation(item_number, angle, 0);
}

void PierreControl(sint16 item_number)
{
    ITEM_INFO *item;
    CREATURE_INFO *people;
    sint16 angle, head, tilt;
    AI_INFO info;
    GAME_VECTOR start, end;

    item = &items[item_number];

    if (pierre_item != NO_ITEM)
    {
        if (pierre_item != item_number)
        {
            if (item->flags & ONESHOT)
                KillItem(pierre_item);
            else
                KillItem(item_number);
        }
    }
    else
        pierre_item = item_number;

    if (item->status == INVISIBLE)
    {
        if (!EnableBaddieAI(item_number, 0))
            return;
        item->status = ACTIVE;
    }
    people = (CREATURE_INFO *)item->data;
    head = angle = tilt = 0;

    if (item->hit_points <= PIERRE_RUN_HITPOINTS && !(item->flags & ONESHOT))
    {
        item->hit_points = PIERRE_RUN_HITPOINTS;
        people->flags++;
    }

    if (item->hit_points <= 0)
    {
        if (item->current_anim_state != PEOPLE_DEATH)
        {
            item->anim_number = objects[PIERRE].anim_index + PIERRE_DIE_ANIM;
            item->frame_number = anims[item->anim_number].frame_base;
            item->current_anim_state = PEOPLE_DEATH;
            SpawnItem(item, MAGNUM_ITEM);
            SpawnItem(item, SCION_ITEM2);
            SpawnItem(item, KEY_ITEM1);
        }
    }
    else
    {
        CreatureAIInfo(item, &info);

        if (info.ahead)
            head = info.angle;

        if (people->flags)
        {
            info.enemy_zone = -1;
            item->hit_status = 1;
        }
        CreatureMood(item, &info, TIMID);

        angle = CreatureTurn(item, people->maximum_turn);

        switch (item->current_anim_state)
        {
        case PEOPLE_STOP:
            if (item->required_anim_state)
                item->goal_anim_state = item->required_anim_state;
            else if (people->mood == BORED_MOOD)
                item->goal_anim_state = (GetRandomControl() < PEOPLE_POSE_CHANCE) ? PEOPLE_POSE : PEOPLE_WALK;
            else if (people->mood == ESCAPE_MOOD)
                item->goal_anim_state = PEOPLE_RUN;
            else
                item->goal_anim_state = PEOPLE_WALK;
            break;

        case PEOPLE_POSE:
            if (people->mood != BORED_MOOD)
                item->goal_anim_state = PEOPLE_STOP;
            else if (GetRandomControl() < PEOPLE_POSE_CHANCE)
            {
                item->required_anim_state = PEOPLE_WALK;
                item->goal_anim_state = PEOPLE_STOP;
            }
            break;

        case PEOPLE_WALK:
            people->maximum_turn = PEOPLE_WALK_TURN;

            if (people->mood == BORED_MOOD && GetRandomControl() < PEOPLE_POSE_CHANCE)
            {
                item->required_anim_state = PEOPLE_POSE;
                item->goal_anim_state = PEOPLE_STOP;
            }
            else if (people->mood == ESCAPE_MOOD)
            {
                item->required_anim_state = PEOPLE_RUN;
                item->goal_anim_state = PEOPLE_STOP;
            }
            else if (Targetable(item, &info))
            {
                item->required_anim_state = PEOPLE_AIM;
                item->goal_anim_state = PEOPLE_STOP;
            }
            else if (!info.ahead || info.distance > PEOPLE_WALK_RANGE)
            {
                item->required_anim_state = PEOPLE_RUN;
                item->goal_anim_state = PEOPLE_STOP;
            }
            break;

        case PEOPLE_RUN:
            people->maximum_turn = PEOPLE_RUN_TURN;
            tilt = angle / 2;

            if (people->mood == BORED_MOOD && GetRandomControl() < PEOPLE_POSE_CHANCE)
            {
                item->required_anim_state = PEOPLE_POSE;
                item->goal_anim_state = PEOPLE_STOP;
            }
            else if (Targetable(item, &info))
            {
                item->required_anim_state = PEOPLE_AIM;
                item->goal_anim_state = PEOPLE_STOP;
            }
            else if (info.ahead && info.distance < PEOPLE_WALK_RANGE)
            {
                item->required_anim_state = PEOPLE_WALK;
                item->goal_anim_state = PEOPLE_STOP;
            }
            break;

        case PEOPLE_AIM:
            if (item->required_anim_state)
                item->goal_anim_state = item->required_anim_state;
            else if (Targetable(item, &info))
                item->goal_anim_state = PEOPLE_SHOOT;
            else
                item->goal_anim_state = PEOPLE_STOP;
            break;

        case PEOPLE_SHOOT:

            if (!item->required_anim_state)
            {
                if (ShotLara(item, info.distance, &pierre_gun1, head))
                {
                    lara_item->hit_points -= PEOPLE_SHOT_DAMAGE / 2;
                    lara_item->hit_status = 1;
                }

                if (ShotLara(item, info.distance, &pierre_gun2, head))
                {
                    lara_item->hit_points -= PEOPLE_SHOT_DAMAGE / 2;
                    lara_item->hit_status = 1;
                }

                item->required_anim_state = PEOPLE_AIM;
            }

            if (people->mood == ESCAPE_MOOD && PIERRE_WIMP_CHANCE < GetRandomControl())
                item->required_anim_state = PEOPLE_STOP;
            break;
        }
    }

    CreatureTilt(item, tilt);
    CreatureHead(item, head);

    CreatureAnimation(item_number, angle, 0);

    if (people->flags)
    {
        start.x = item->pos.x_pos;
        start.y = item->pos.y_pos - WALL_L;
        start.z = item->pos.z_pos;

        end.x = camera.pos.x;
        end.y = camera.pos.y;
        end.z = camera.pos.z;
        end.room_number = camera.pos.room_number;

        if (!LOS(&end, &start))
        {
            if (people->flags > PIERRE_DISAPPEAR)
            {
                item->hit_points = DONT_TARGET;
                DisableBaddieAI(item_number);
                KillItem(item_number);
                pierre_item = NO_ITEM;
            }
        }
        else
            people->flags = 1;
    }

    if (GetWaterHeight(item->pos.x_pos, item->pos.y_pos, item->pos.z_pos, item->room_number) != NO_HEIGHT)
    {
        item->hit_points = DONT_TARGET;
        DisableBaddieAI(item_number);
        KillItem(item_number);
        pierre_item = NO_ITEM;
    }
}

void ApeVault(sint16 item_number, sint16 angle)
{
    ITEM_INFO *item;
    CREATURE_INFO *ape;
    sint32 y, xx, yy, x_floor, y_floor;
    sint16 room_number;

    item = &items[item_number];

    ape = (CREATURE_INFO *)item->data;
    if (ape->flags & APE_TURNL_FLAG)
    {
        item->pos.y_rot -= 0x4000;
        ape->flags -= APE_TURNL_FLAG;
    }
    else if (item->flags & APE_TURNR_FLAG)
    {
        item->pos.y_rot += 0x4000;
        ape->flags -= APE_TURNR_FLAG;
    }

    xx = item->pos.z_pos >> WALL_SHIFT;
    yy = item->pos.x_pos >> WALL_SHIFT;
    y = item->pos.y_pos;
    room_number = item->room_number;

    CreatureAnimation(item_number, angle, 0);

    if (item->pos.y_pos > y - STEP_L * 3 / 2)
        return;

    x_floor = item->pos.z_pos >> WALL_SHIFT;
    y_floor = item->pos.x_pos >> WALL_SHIFT;
    if (xx == x_floor)
    {
        if (yy == y_floor)
            return;

        if (yy < y_floor)
        {
            item->pos.x_pos = (y_floor << WALL_SHIFT) - APE_SHIFT;
            item->pos.y_rot = 0x4000;
        }
        else
        {
            item->pos.x_pos = (yy << WALL_SHIFT) + APE_SHIFT;
            item->pos.y_rot = -0x4000;
        }
    }
    else if (yy == y_floor)
    {
        if (xx < x_floor)
        {
            item->pos.z_pos = (x_floor << WALL_SHIFT) - APE_SHIFT;
            item->pos.y_rot = 0;
        }
        else
        {
            item->pos.z_pos = (xx << WALL_SHIFT) + APE_SHIFT;
            item->pos.y_rot = -0x8000;
        }
    }

    item->pos.y_pos = y;
    item->anim_number = objects[APE].anim_index + APE_VAULT_ANIM;
    item->frame_number = anims[item->anim_number].frame_base;
    item->current_anim_state = APE_VAULT;
}

void ApeControl(sint16 item_number)
{
    ITEM_INFO *item;
    CREATURE_INFO *ape;
    sint16 head, random, angle;
    AI_INFO info;

    item = &items[item_number];
    if (item->status == INVISIBLE)
    {
        if (!EnableBaddieAI(item_number, 0))
            return;
        item->status = ACTIVE;
    }
    ape = (CREATURE_INFO *)item->data;
    head = angle = 0;

    if (item->hit_points <= 0)
    {
        if (item->current_anim_state != APE_DEATH)
        {
            item->anim_number = objects[APE].anim_index + APE_DIE_ANIM + GetRandomControl() / 0x4000;
            item->frame_number = anims[item->anim_number].frame_base;
            item->current_anim_state = APE_DEATH;
        }
    }
    else
    {
        CreatureAIInfo(item, &info);

        if (info.ahead)
            head = info.angle;

        CreatureMood(item, &info, TIMID);

        angle = CreatureTurn(item, ape->maximum_turn);

        if (item->hit_status || info.distance < APE_PANIC_RANGE)
            ape->flags |= APE_ATTACK_FLAG;

        switch (item->current_anim_state)
        {
        case APE_STOP:

            if (ape->flags & APE_TURNL_FLAG)
            {
                item->pos.y_rot -= 0x4000;
                ape->flags -= APE_TURNL_FLAG;
            }
            else if (item->flags & APE_TURNR_FLAG)
            {
                item->pos.y_rot += 0x4000;
                ape->flags -= APE_TURNR_FLAG;
            }

            if (item->required_anim_state)
                item->goal_anim_state = item->required_anim_state;
            else if (info.bite && info.distance < APE_ATTACK_RANGE)
                item->goal_anim_state = APE_ATTACK1;
            else if (!(ape->flags & APE_ATTACK_FLAG) && info.zone_number == info.enemy_zone && info.ahead)
            {
                random = (sint16)(GetRandomControl() >> 5);
                if (random < APE_JUMP_CHANCE)
                    item->goal_anim_state = APE_JUMP;
                else if (random < APE_WARN1_CHANCE)
                    item->goal_anim_state = APE_WARNING;
                else if (random < APE_WARN2_CHANCE)
                    item->goal_anim_state = APE_WARNING2;
                else if (random < APE_RUNLEFT_CHANCE)
                {
                    item->goal_anim_state = APE_RUNLEFT;
                    ape->maximum_turn = 0;
                }
                else
                {
                    item->goal_anim_state = APE_RUNRIGHT;
                    ape->maximum_turn = 0;
                }
            }
            else
                item->goal_anim_state = APE_RUN;
            break;

        case APE_RUN:
            ape->maximum_turn = APE_RUN_TURN;

            if (ape->flags == 0 && info.angle > -APE_DISPLAY_ANGLE && info.angle < APE_DISPLAY_ANGLE)
                item->goal_anim_state = APE_STOP;
            else if (info.ahead && (item->touch_bits & APE_TOUCH))
            {
                item->required_anim_state = APE_ATTACK1;
                item->goal_anim_state = APE_STOP;
            }
            else if (ape->mood != ESCAPE_MOOD)
            {
                random = (sint16)GetRandomControl();
                if (random < APE_JUMP_CHANCE)
                {
                    item->required_anim_state = APE_JUMP;
                    item->goal_anim_state = APE_STOP;
                }
                else if (random < APE_WARN1_CHANCE)
                {
                    item->required_anim_state = APE_WARNING;
                    item->goal_anim_state = APE_STOP;
                }
                else if (random < APE_WARN2_CHANCE)
                {
                    item->required_anim_state = APE_WARNING2;
                    item->goal_anim_state = APE_STOP;
                }
            }
            break;

        case APE_RUNLEFT:
            if (!(ape->flags & APE_TURNR_FLAG))
            {
                item->pos.y_rot -= 0x4000;
                ape->flags |= APE_TURNR_FLAG;
            }

            item->goal_anim_state = APE_STOP;
            break;

        case APE_RUNRIGHT:
            if (!(ape->flags & APE_TURNL_FLAG))
            {
                item->pos.y_rot += 0x4000;
                ape->flags |= APE_TURNL_FLAG;
            }

            item->goal_anim_state = APE_STOP;
            break;

        case APE_ATTACK1:
            if (!item->required_anim_state && (item->touch_bits & APE_TOUCH))
            {
                CreatureEffect(item, &ape_bite, DoBloodSplat);

                lara_item->hit_points -= APE_ATTACK_DAMAGE;
                lara_item->hit_status = 1;

                item->required_anim_state = APE_STOP;
            }
            break;
        }
    }

    CreatureHead(item, head);

    if (item->current_anim_state != APE_VAULT)
        ApeVault(item_number, angle);
    else
        CreatureAnimation(item_number, angle, 0);
}

void InitialiseSkateKid(sint16 item_number)
{
    InitialiseCreature(item_number);
    items[item_number].current_anim_state = KID_SKATE;
}

void SkateKidControl(sint16 item_number)
{
    ITEM_INFO *item;
    CREATURE_INFO *kid;
    sint16 angle, head;
    AI_INFO info;

    item = &items[item_number];
    kid = (CREATURE_INFO *)item->data;
    head = angle = 0;

    if (item->hit_points <= 0)
    {
        if (item->current_anim_state != KID_DEATH)
        {
            item->anim_number = objects[MERCENARY1].anim_index + KID_DIE_ANIM;
            item->frame_number = anims[item->anim_number].frame_base;
            item->current_anim_state = KID_DEATH;
            SpawnItem(item, UZI_ITEM);
        }
    }
    else
    {
        CreatureAIInfo(item, &info);

        if (info.ahead)
            head = info.angle;

        CreatureMood(item, &info, TIMID);

        angle = CreatureTurn(item, KID_SKATE_TURN);

        if (item->hit_points < 120 && cdtrack != 56)
            S_CDPlay(56);

        switch (item->current_anim_state)
        {
        case KID_STOP:
            kid->flags = 0;

            if (item->required_anim_state)
                item->goal_anim_state = item->required_anim_state;
            else if (Targetable(item, &info))
                item->goal_anim_state = KID_SHOOT;
            else
                item->goal_anim_state = KID_SKATE;
            break;

        case KID_SKATE:
            kid->flags = 0;

            if (GetRandomControl() < KID_PUSH_CHANCE)
                item->goal_anim_state = KID_PUSH;
            else if (Targetable(item, &info))
            {
                if (info.distance > KID_DONT_STOP_RANGE && info.distance < KID_STOP_RANGE && kid->mood != ESCAPE_MOOD)
                    item->goal_anim_state = KID_STOP;
                else
                    item->goal_anim_state = KID_SHOOT2;
            }
            break;

        case KID_PUSH:
            if (GetRandomControl() < KID_SKATE_CHANCE)
                item->goal_anim_state = KID_SKATE;
            break;

        case KID_SHOOT:
        case KID_SHOOT2:
            if (!kid->flags && Targetable(item, &info))
            {
                if (ShotLara(item, info.distance, &kid_gun1, head))
                {
                    lara_item->hit_points -= ((item->current_anim_state == KID_SHOOT) ? KID_STOP_SHOT_DAMAGE : KID_SKATE_SHOT_DAMAGE);
                    lara_item->hit_status = 1;
                }

                if (ShotLara(item, info.distance, &kid_gun2, head))
                {
                    lara_item->hit_points -= ((item->current_anim_state == KID_SHOOT) ? KID_STOP_SHOT_DAMAGE : KID_SKATE_SHOT_DAMAGE);
                    lara_item->hit_status = 1;
                }

                kid->flags = 1;
            }

            if (kid->mood == ESCAPE_MOOD || info.distance < KID_TOO_CLOSE)
                item->required_anim_state = KID_SKATE;
            break;
        }
    }
    CreatureHead(item, head);

    CreatureAnimation(item_number, angle, 0);
}

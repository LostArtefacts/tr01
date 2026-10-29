#include "game.h"

#define PEOPLE_SHOOT_RANGE SQUARE(WALL_L * 7)
#define PEOPLE_MISS_CHANCE 0x2000

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

#include "game.h"

OBJECT_VECTOR *sound_effects;
int number_sound_effects;

#define FLIPFLAG 64
#define UNFLIPFLAG 128

int ItemNearLara(PHD_3DPOS *pos, sint32 distance)
{
    sint32 x, y, z;
    sint16 *bounds;

    x = pos->x_pos - lara_item->pos.x_pos;
    y = pos->y_pos - lara_item->pos.y_pos;
    z = pos->z_pos - lara_item->pos.z_pos;

    if (x < -distance || x > distance || z < -distance || z > distance || y < -WALL_L * 3 || y > WALL_L * 3)
        return 0;

    if (x * x + z * z > SQUARE(distance))
        return 0;

    bounds = GetBoundsAccurate(lara_item);
    if (y < bounds[2] || y > bounds[3] + 100)
        return 0;

    return 1;
}

void SoundEffects(void)
{
    int i;
    OBJECT_VECTOR *sound;

    mn_reset_ambient_loudness();
    sound = sound_effects;
    for (i = number_sound_effects; i > 0; i--, sound++)
    {
        if (!flip_status && (sound->flags & UNFLIPFLAG) == 0)
            continue;
        else if (flip_status && (sound->flags & FLIPFLAG) == 0)
            continue;

        SoundEffect(sound->data, (PHD_3DPOS *)&sound->x, 0);
    }

    if (flipeffect != -1)
        (*effect_routines[flipeffect])(NULL);

    mn_update_sound_effects();
}

sint16 DoBloodSplat(sint32 x, sint32 y, sint32 z, sint16 speed, PHD_ANGLE direction, sint16 room_num)
{
    FX_INFO *fx;
    sint16 fx_num;

    if ((fx_num = CreateEffect(room_num)) != NO_ITEM)
    {
        fx = &effects[fx_num];
        fx->pos.x_pos = x;
        fx->pos.y_pos = y;
        fx->pos.z_pos = z;
        fx->pos.y_rot = direction;
        fx->speed = speed;
        fx->frame_number = 0;
        fx->object_number = BLOOD1;
        fx->counter = 0;
    }
    return fx_num;
}

void ControlBlood1(sint16 fx_num)
{
    FX_INFO *fx;

    fx = &effects[fx_num];
    fx->pos.x_pos += (phd_sin(fx->pos.y_rot) * fx->speed) >> W2V_SHIFT;
    fx->pos.z_pos += (phd_cos(fx->pos.y_rot) * fx->speed) >> W2V_SHIFT;
    fx->counter++;
    if (fx->counter == 4)
    {
        fx->counter = 0;
        fx->frame_number--;
        if (fx->frame_number <= objects[fx->object_number].nmeshes)
            KillEffect(fx_num);
    }
}

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

void ControlExplosion1(sint16 fx_num)
{
    FX_INFO *fx;

    fx = &effects[fx_num];
    fx->counter++;
    if (fx->counter == 2)
    {
        fx->counter = 0;
        fx->frame_number--;
        if (fx->frame_number <= objects[fx->object_number].nmeshes)
            KillEffect(fx_num);
    }
}

void Richochet(GAME_VECTOR *pos)
{
    sint16 fx_num;
    FX_INFO *fx;

    if ((fx_num = CreateEffect(pos->room_number)) != NO_ITEM)
    {
        fx = &effects[fx_num];
        fx->pos.x_pos = pos->x;
        fx->pos.y_pos = pos->y;
        fx->pos.z_pos = pos->z;
        fx->counter = 4;
        fx->frame_number = (sint16) - ((int)(GetRandomDraw() * 3) / 32768);
        fx->object_number = RICOCHET1;
        SoundEffect(10, &fx->pos, NULL);
    }
}

void ControlRichochet1(sint16 fx_num)
{
    effects[fx_num].counter--;
    if (!effects[fx_num].counter)
        KillEffect(fx_num);
}

void Twinkle(GAME_VECTOR *pos)
{
    sint16 fx_num;
    FX_INFO *fx;

    if ((fx_num = CreateEffect(pos->room_number)) != NO_ITEM)
    {
        fx = &effects[fx_num];
        fx->pos.x_pos = pos->x;
        fx->pos.y_pos = pos->y;
        fx->pos.z_pos = pos->z;
        fx->counter = 0;
        fx->frame_number = 0;
        fx->object_number = TWINKLE;
    }
}

void ControlTwinkle(sint16 fx_num)
{
    FX_INFO *fx;

    fx = &effects[fx_num];
    fx->counter++;
    if (fx->counter == 1)
    {
        fx->counter = 0;
        fx->frame_number--;
        if (fx->frame_number <= objects[fx->object_number].nmeshes)
            KillEffect(fx_num);
    }
}

void ItemSparkle(ITEM_INFO *item, int meshmask)
{
    int i, num1, r;
    SPHERE *sptr, slist[34];
    GAME_VECTOR effectpos;

    num1 = GetSpheres(item, slist, 1);
    sptr = slist;
    effectpos.room_number = item->room_number;
    for (i = 0; i < num1; i++, sptr++)
    {
        if (meshmask & (1 << i))
        {
            r = sptr->r;
            effectpos.x = sptr->x + ((GetRandomDraw() - 16384) * r) / 16384;
            effectpos.y = sptr->y + ((GetRandomDraw() - 16384) * r) / 16384;
            effectpos.z = sptr->z + ((GetRandomDraw() - 16384) * r) / 16384;
            Twinkle(&effectpos);
        }
    }
}

void LaraBubbles(ITEM_INFO *item)
{
    PHD_VECTOR offset;
    FX_INFO *fx;
    int i;
    sint16 fx_num;

    i = (GetRandomDraw() * 3) / 32768;
    if (i)
    {
        SoundEffect(37, &item->pos, UNDERWATER);
        offset.x = 0;
        offset.y = 0;
        offset.z = 50;
        GetJointAbsPosition(item, &offset, 14);
        for (; i > 0; i--)
        {
            if ((fx_num = CreateEffect(item->room_number)) != NO_ITEM)
            {
                fx = &effects[fx_num];
                fx->pos.x_pos = offset.x;
                fx->pos.y_pos = offset.y;
                fx->pos.z_pos = offset.z;
                fx->speed = 10 + (GetRandomDraw() * 6) / 32768;
                fx->frame_number = -((GetRandomDraw() * 3) / 32768);
                fx->object_number = BUBBLES1;
            }
        }
    }
}

void ControlBubble1(sint16 fx_num)
{
    FX_INFO *fx;
    OBJECT_INFO *object;
    FLOOR_INFO *floor;
    sint32 x, y, z, h;
    sint16 roomy;

    fx = &effects[fx_num];
    object = &objects[fx->object_number];

    fx->pos.y_rot += 9 * ONE_DEGREE;
    fx->pos.x_rot += 13 * ONE_DEGREE;
    x = fx->pos.x_pos + ((phd_sin(fx->pos.y_rot) * 11) >> W2V_SHIFT);
    y = fx->pos.y_pos - fx->speed;
    z = fx->pos.z_pos + ((phd_cos(fx->pos.x_rot) * 8) >> W2V_SHIFT);
    roomy = fx->room_number;

    floor = GetFloor(x, y, z, &roomy);
    if (!floor || !(room[roomy].flags & 1))
    {
        KillEffect(fx_num);
        return;
    }
    h = GetCeiling(floor, x, y, z);
    if (h == NO_HEIGHT || y <= h)
    {
        KillEffect(fx_num);
        return;
    }

    if (fx->room_number != roomy)
        EffectNewRoom(fx_num, roomy);
    fx->pos.x_pos = x;
    fx->pos.y_pos = y;
    fx->pos.z_pos = z;
}

void Splash(ITEM_INFO *item)
{
    int i;
    sint16 fx_number, room_number;
    sint32 height;
    FX_INFO *fx;

    height = GetWaterHeight(item->pos.x_pos, item->pos.y_pos, item->pos.z_pos, item->room_number);
    room_number = item->room_number;
    GetFloor(item->pos.x_pos, item->pos.y_pos, item->pos.z_pos, &room_number);

    SoundEffect(33, &item->pos, NULL);

    for (i = 10; i > 0; i--)
    {
        fx_number = CreateEffect(room_number);
        if (fx_number != NO_ITEM)
        {
            fx = &effects[fx_number];
            fx->pos.x_pos = item->pos.x_pos;
            fx->pos.y_pos = height;
            fx->pos.z_pos = item->pos.z_pos;
            fx->pos.y_rot = (sint16)(GetRandomDraw() - 0x4000) * 2;
            fx->speed = (sint16)(GetRandomDraw() / 256);
            fx->frame_number = 0;
            fx->object_number = SPLASH1;
        }
    }
}

void ControlSplash1(sint16 fx_num)
{
    FX_INFO *fx;

    fx = &effects[fx_num];
    fx->frame_number--;
    if (fx->frame_number <= objects[fx->object_number].nmeshes)
    {
        KillEffect(fx_num);
        return;
    }

    fx->pos.z_pos += fx->speed * phd_cos(fx->pos.y_rot) >> W2V_SHIFT;
    fx->pos.x_pos += fx->speed * phd_sin(fx->pos.y_rot) >> W2V_SHIFT;
}

void finish_level_effect(ITEM_INFO *item)
{
    level_complete = 1;
}

void turn180_effect(ITEM_INFO *item)
{
    item->pos.y_rot -= 32768;
}

#define MAX_BOUNCE 100

void dino_stomp_effect(ITEM_INFO *item)
{
    int x, y, z, dist;

    x = item->pos.x_pos - camera.pos.x;
    y = item->pos.y_pos - camera.pos.y;
    z = item->pos.z_pos - camera.pos.z;
    if ((ABS(x)) < 16 * WALL_L && (ABS(y)) < 16 * WALL_L && (ABS(z)) < 16 * WALL_L)
    {
        dist = (x * x + y * y + z * z) / 256;
        camera.bounce = ((WALL_L * WALL_L - dist) * MAX_BOUNCE) / (WALL_L * WALL_L);
    }
}

void lara_normal_effect(ITEM_INFO *item)
{
    item->current_anim_state = AS_STOP;
    item->goal_anim_state = AS_STOP;
    item->frame_number = STOP_F;
    item->anim_number = STOP_A;
    camera.type = CHASE_CAMERA;
    AlterFOV(GAME_FOV * ONE_DEGREE);
}

void EarthQuakeFX(ITEM_INFO *item)
{
    if (fliptimer == 0)
    {
        SoundEffect(99, NULL, NULL);
        camera.bounce = -250;
    }
    else if (fliptimer == 3)
        SoundEffect(147, NULL, NULL);
    else if (fliptimer == 35)
        SoundEffect(99, NULL, NULL);
    else if (fliptimer == 20 || fliptimer == 50 || fliptimer == 70)
        SoundEffect(70, NULL, NULL);

    fliptimer++;
    if (fliptimer == 105)
        flipeffect = -1;
}

void FloodFX(ITEM_INFO *item)
{
    PHD_3DPOS pos;

    if (fliptimer > 30 * 4)
        flipeffect = -1;
    else
    {
        pos.x_pos = lara_item->pos.x_pos;
        if (fliptimer < 30)
            pos.y_pos = camera.target.y + (30 - fliptimer) * 100;
        else
            pos.y_pos = camera.target.y + (fliptimer - 30) * 100;
        pos.z_pos = lara_item->pos.z_pos;

        SoundEffect(81, &pos, NULL);
    }
    fliptimer++;
}

void RaisingBlockFX(ITEM_INFO *item)
{
    SoundEffect(117, NULL, NULL);
    flipeffect = -1;
}

void ChainBlockFX(ITEM_INFO *item)
{
    if (fliptimer == 0)
        SoundEffect(173, NULL, NULL);

    fliptimer++;
    if (fliptimer == 55)
    {
        SoundEffect(33, NULL, NULL);
        flipeffect = -1;
    }
}

void Stairs2SlopeFX(ITEM_INFO *item)
{
    if (fliptimer == 5)
    {
        SoundEffect(119, NULL, NULL);
        flipeffect = -1;
    }
    fliptimer++;
}

void SandFX(ITEM_INFO *item)
{
    PHD_3DPOS pos;

    if (fliptimer > 30 * 4)
        flipeffect = -1;
    else
    {
        if (fliptimer == 0)
            SoundEffect(161, NULL, NULL);

        pos.x_pos = camera.target.x;
        pos.y_pos = camera.target.y + fliptimer * 100;
        pos.z_pos = camera.target.z;

        SoundEffect(118, &pos, NULL);
    }
    fliptimer++;
}

void PowerUpFX(ITEM_INFO *item)
{
    PHD_3DPOS pos;

    if (fliptimer > 30 * 4)
        flipeffect = -1;
    else
    {
        pos.x_pos = camera.target.x;
        pos.y_pos = camera.target.y + fliptimer * 100;
        pos.z_pos = camera.target.z;

        SoundEffect(155, &pos, NULL);
    }
    fliptimer++;
}

void ExplosionFX(ITEM_INFO *item)
{
    SoundEffect(170, NULL, NULL);
    camera.bounce = -75;
    flipeffect = -1;
}

void FlickerFX(ITEM_INFO *item)
{
    if (fliptimer > 125)
    {
        FlipMap();
        flipeffect = -1;
    }
    else if (fliptimer == 90 || fliptimer == 92 || fliptimer == 105 || fliptimer == 107)
        FlipMap();

    fliptimer++;
}

void lara_hands_free(ITEM_INFO *item)
{
    lara.gun_status = LG_ARMLESS;
}

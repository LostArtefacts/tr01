#include <stdio.h>
#include "game.h"

#define PAN_IGNORE_DIST 2
#define PAN_LESS_DIST 5

#define PAN_IGNORE_RANGE ((PAN_IGNORE_DIST << 10) * (PAN_IGNORE_DIST << 10))
#define PAN_LESS_RANGE ((PAN_LESS_DIST << 10) * (PAN_LESS_DIST << 10))

#define SOUND_RANGE_DIVIDE_CONSTANT (SOUND_RADIUS_SQRD >> 15)
#define SOUND_RANGE_MULT_CONSTANT ((int)(32768 / SOUND_RADIUS))

SAMPLE_INFO *sample_infos;
sint16 sample_lut[MAX_SAMPLES];
int num_sample_infos = 0;
int num_samples;
int sounds_loaded = 0;
int sound_active = 1;

int mn_sound_master_volume = 32;
int mn_sounds_playing = 0;

static int mn_sound_master_vol_default = 32;
static int mn_sound_master_fade_on = 0;
static int mn_sound_fade_counter = 0;
static int mn_sound_fade_rate = 10;

MN_SFX_PLAY_INFO sfx_playing[MAX_PLAYING_FX];
static short mn_amb_lookup[MAX_AMBIENT_FX];

static int mn_ambient_lookup_indx = 0;

MN_SFX_PLAY_INFO *mn_get_fx_slot(sint32 sfx_num, uint32 loudness, PHD_3DPOS *pos, sint16 mode);
MN_SFX_PLAY_INFO *mn_get_sound_params(MN_SFX_PLAY_INFO *sndslot);
void mn_clear_fx_slot(MN_SFX_PLAY_INFO *);
void mn_clear_handles(MN_SFX_PLAY_INFO *s);

void mn_reset_sound_effects(void)
{
    SAMPLE_INFO *s;
    MN_SFX_PLAY_INFO *slot;
    int i;

    if (!sound_active)
        return;

    mn_sound_master_volume = mn_sound_master_vol_default;

    mn_sound_master_fade_on = 0;
    mn_sound_fade_counter = 0;

    for (slot = sfx_playing; slot < (sfx_playing + MAX_PLAYING_FX); slot++)
        mn_clear_fx_slot(slot);

    S_SoundStopAllSamples();

    mn_ambient_lookup_indx = 0;

    for (i = 0; i < MAX_SAMPLES; i++)
    {
        if (sample_lut[i] >= 0)
        {
            s = sample_infos + sample_lut[i];

            if (s->volume < 0)
            {
                sprintf(exit_message, "sample info for effect %d has incorrect volume(%d)", i, s->volume);
                S_ExitSystem(exit_message);
            }

            if ((s->flags & 3) == AMBIENT_SOUND)
            {
                if (mn_ambient_lookup_indx < MAX_AMBIENT_FX)
                {
                    mn_amb_lookup[mn_ambient_lookup_indx] = i;
                    mn_ambient_lookup_indx++;
                }
                else
                {
                    S_ExitSystem("Ran out of ambient fx slots in mn_reset_sound_effects()");
                }
            }
        }
    }
}

int SoundEffect(int sfx_num, PHD_3DPOS *pos, int flags)
{
    MN_SFX_PLAY_INFO *fxslot = NULL;
    SAMPLE_INFO *s;
    int number;
    uint32 loudness, distance;
    int pan = 0x7fff;
    sint32 volume, pitch, sinum, mode, vars;
    sint32 x, y, z;
    sint16 angle = 0;

    if (!sound_active)
        return 0;

    if (flags != SFX_ALWAYS && (flags & UNDERWATER) != (room[camera.pos.room_number].flags & UNDERWATER))
        return 0;

    sinum = sample_lut[sfx_num];

    if (sinum < 0)
        return 0;

    s = sample_infos + sinum;

    if (s->randomness && GetRandomDraw() > (int)s->randomness)
        return 0;

    mode = s->flags & 3;

    flags = 0;
    if (pos == NULL)
    {
        distance = 0;
        pan = 0;
        flags = MN_FX_NO_REVERB;
    }
    else
    {
        x = (pos->x_pos - camera.target.x);
        y = (pos->y_pos - camera.target.y);
        z = (pos->z_pos - camera.target.z);

        if ((x < (-SOUND_RADIUS)) || (x > SOUND_RADIUS) || (y < (-SOUND_RADIUS)) || (y > SOUND_RADIUS) || (z < (-SOUND_RADIUS)) || (z > SOUND_RADIUS))
        {
            return 0;
        }

        distance = (uint32)(x * x + y * y + z * z);

        if (distance == 0)
            pan = 0;
    }

    volume = (sint32)s->volume - (sint32)((uint32)phd_sqrt(distance) * SOUND_RANGE_MULT_CONSTANT);

    if ((s->flags & VOLUME_WIBBLE))
        volume -= GetRandomDraw() * MAX_VOLUME_CHANGE >> 15;

    if ((s->flags & NO_PAN))
    {
        pan = 0;
    }

    if ((volume <= 0) && (mode != AMBIENT_SOUND))
    {
        return 0;
    }

    if (pan)
    {
        angle = (sint16)phd_atan(pos->z_pos - lara_item->pos.z_pos, pos->x_pos - lara_item->pos.x_pos);
        angle -= (lara_item->pos.y_rot + lara.torso_y_rot + lara.head_y_rot);

        pan = angle;
    }

    pitch = 100;

    if ((s->flags & PITCH_WIBBLE))
        pitch += ((GetRandomDraw() * MAX_PITCH_CHANGE) / 16384) - MAX_PITCH_CHANGE;

    vars = (s->flags >> 2) & 15;
    if (vars == 1)
        number = s->number;
    else
        number = s->number + (int)((GetRandomDraw() * vars) / 32768);

    if (volume > 0x7fff)
    {
        volume = 0x7fff;
    }

    switch (mode)
    {
    case WAIT_SOUND:
        if ((fxslot = mn_get_fx_slot(sfx_num, 0, pos, (sint16)mode)) != NULL)
        {
            if (fxslot->mn_flags & MN_FX_RESTARTED)
            {
                fxslot->mn_flags &= (0XFFFF - MN_FX_RESTARTED);
                return 1;
            }
            else
            {
                fxslot->handle = S_SoundPlaySample(number, (sint16)volume, (sint16)pitch, (sint16)pan);

                if (fxslot->handle >= 0)
                {
                    mn_clear_handles(fxslot);
                    fxslot->mn_flags = (MN_FX_USED | flags);
                    fxslot->fxnum = sfx_num;
                    fxslot->pos = pos;
                }
                else
                {
                    return 0;
                }
            }
        }
        else
        {
            return 0;
        }
        break;

    case RESTART_SOUND:
        if ((fxslot = mn_get_fx_slot(sfx_num, 0, pos, (sint16)mode)) != NULL)
        {
            if (fxslot->mn_flags & MN_FX_RESTARTED)
            {
                S_SoundStopSample(fxslot->handle);
                fxslot->handle = S_SoundPlaySample(number, (sint16)volume, (sint16)pitch, (sint16)pan);
            }
            else
            {
                fxslot->handle = S_SoundPlaySample(number, (sint16)volume, (sint16)pitch, (sint16)pan);

                if (fxslot->handle >= 0)
                {
                    mn_clear_handles(fxslot);
                    fxslot->mn_flags = (MN_FX_USED | flags);
                    fxslot->fxnum = sfx_num;
                    fxslot->pos = pos;
                }
                else
                {
                    return 0;
                }
            }
        }
        else
        {
            return 0;
        }
        break;

    case AMBIENT_SOUND:
        loudness = distance;

        if ((fxslot = mn_get_fx_slot(sfx_num, loudness, pos, (sint16)mode)) != NULL)
        {
            fxslot->pos = pos;
            if (fxslot->mn_flags & MN_FX_AMBIENT)
            {
                if (volume > 0)
                {
                    fxslot->loudness = loudness;
                    fxslot->pan = pan;
                    fxslot->volume = (sint16)volume;
                }
                else
                {
                    fxslot->loudness = MN_NOT_AUDIBLE;
                    fxslot->volume = 0;
                }
            }
            else
            {
                if (volume > 0)
                {
                    fxslot->handle = S_SoundPlaySampleLooped(number, (sint16)volume, (sint16)pitch, (sint16)pan);

                    if (fxslot->handle >= 0)
                    {
                        mn_clear_handles(fxslot);

                        fxslot->loudness = loudness;
                        fxslot->fxnum = sfx_num;
                        fxslot->pan = pan;
                        fxslot->volume = (sint16)volume;
                        fxslot->mn_flags |= (MN_FX_AMBIENT | MN_FX_USED);
                        fxslot->pos = pos;
                    }
                    else
                    {
                        mn_clear_fx_slot(fxslot);
                        return 0;
                    }
                }
                else
                {
                    fxslot->loudness = MN_NOT_AUDIBLE;
                }
            }
        }
        else
        {
            return 0;
        }
        break;
    }

    return 1;
}

MN_SFX_PLAY_INFO *mn_get_fx_slot(sint32 sfx_num, uint32 loudness, PHD_3DPOS *pos, sint16 mode)
{
    MN_SFX_PLAY_INFO *retslot, *lastfreeSlot = NULL;
    int i;

    switch (mode)
    {
    case WAIT_SOUND:
    case RESTART_SOUND:
        for (retslot = (sfx_playing + mn_ambient_lookup_indx); retslot < (sfx_playing + MAX_PLAYING_FX); retslot++)
        {
            if ((retslot->mn_flags & MN_FX_USED) && (retslot->fxnum == sfx_num) && (retslot->pos == pos))
            {
                retslot->mn_flags |= MN_FX_RESTARTED;
                return retslot;
            }
            else
            {
                if (retslot->mn_flags == MN_FX_UNUSED)
                    lastfreeSlot = retslot;
            }
        }
        break;

    case AMBIENT_SOUND:
        for (i = 0; i < MAX_AMBIENT_FX; i++)
        {
            if (mn_amb_lookup[i] == sfx_num)
            {
                retslot = sfx_playing + i;

                if ((retslot->mn_flags == MN_FX_UNUSED) || (retslot->loudness > loudness))
                    return retslot;
                else
                    return NULL;
            }
        }

        return NULL;
        break;
    }
    return lastfreeSlot;
}

extern void mn_reset_ambient_loudness(void)
{
    MN_SFX_PLAY_INFO *resetslot;

    if (!sound_active)
        return;

    for (resetslot = sfx_playing; resetslot < (sfx_playing + mn_ambient_lookup_indx); resetslot++)
        resetslot->loudness = MN_NOT_AUDIBLE;
}

extern void mn_stop_ambient_samples(void)
{
    MN_SFX_PLAY_INFO *resetslot;

    if (!sound_active)
        return;

    for (resetslot = sfx_playing; resetslot < (sfx_playing + mn_ambient_lookup_indx); resetslot++)
    {
        if (S_SoundSampleIsPlaying(resetslot->handle))
        {
            S_SoundStopSample(resetslot->handle);
            mn_clear_fx_slot(resetslot);
        }
    }
}

void mn_clear_fx_slot(MN_SFX_PLAY_INFO *slot)
{
    slot->handle = -1;
    slot->pos = NULL;
    slot->mn_flags = 0;
    slot->volume = 0;
    slot->pan = 0;
    slot->loudness = MN_NOT_AUDIBLE;
    slot->fxnum = -1;
}

void mn_clear_handles(MN_SFX_PLAY_INFO *slot)
{
    sint32 chandle;
    MN_SFX_PLAY_INFO *rslot;

    chandle = slot->handle;

    for (rslot = sfx_playing; rslot < (sfx_playing + MAX_PLAYING_FX); rslot++)
    {
        if (rslot != slot && rslot->handle == chandle)
        {
            rslot->handle = -1;
        }
    }
}

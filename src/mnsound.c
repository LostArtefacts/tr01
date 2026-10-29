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

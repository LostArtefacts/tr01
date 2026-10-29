#ifndef MN_SINFO_H
#define MN_SINFO_H

#include "types.h"

#define NO_SAMPLE -1
#define NULL_SHANDLE -1
#define SOUND_RANGE 8
#define SOUND_RADIUS (SOUND_RANGE << 10)
#define SOUND_RADIUS_SQRD (SOUND_RADIUS * SOUND_RADIUS)
#define MAX_PLAYING_FX 24
#define MAX_AMBIENT_FX 8
#define MAX_SAMPLES 256
#define MAX_ALLOC_POSNS 8
#define MAX_VOLUME_CHANGE 0x2000
#define MAX_PITCH_CHANGE 10
#define FADE_TIME_UNIT 10

enum sound_flags
{
    WAIT_SOUND,
    RESTART_SOUND,
    AMBIENT_SOUND
};

#define NO_PAN (1 << 12)
#define PITCH_WIBBLE (1 << 13)
#define VOLUME_WIBBLE (1 << 14)

#define MN_NOT_AUDIBLE 0xffffffff
#define MN_FX_UNUSED 0
#define MN_FX_USED 1
#define MN_FX_AMBIENT (1 << 1)
#define MN_FX_RESTARTED (1 << 2)
#define MN_FX_NO_REVERB (1 << 3)

typedef struct sample_info
{
    sint16 number;
    sint16 volume;
    sint16 randomness;
    sint16 flags;
} SAMPLE_INFO;

typedef struct mn_sfx_play_info
{
    sint32 handle;
    PHD_3DPOS *pos;
    uint32 loudness;
    sint16 volume;
    sint16 pan;
    sint16 fxnum;
    sint16 mn_flags;
} MN_SFX_PLAY_INFO;

extern SAMPLE_INFO *sample_infos;
extern sint16 sample_lut[];
extern int num_sample_infos;
extern int num_samples;
extern int sounds_loaded;
extern int sound_active;
extern int mn_sound_master_volume;
extern int mn_sounds_playing;

void mn_adjust_master_volume(int newVol);
void mn_start_sound_fade(void);
void mn_set_sound_fade_rate(int rate);
void mn_reset_sound_effects(void);
void mn_reset_ambient_loudness(void);
void mn_update_sound_effects(void);
void mn_stop_ambient_samples(void);
void mn_stop_sound_effect(int sfx_num, PHD_3DPOS *pos);
int SoundEffect(int sfx_num, PHD_3DPOS *pos, int flags);

sint32 S_SoundPlaySample(sint32 dwSample, uint16 wVol, uint16 wPitch, sint16 wPan);
sint32 S_SoundPlaySampleLooped(sint32 dwSample, uint16 wVol, uint16 wPitch, sint16 dwPan);
sint32 S_SoundSampleIsPlaying(sint32 handle);
void S_SoundStopAllSamples(void);
void S_SoundStopSample(sint32 handle);
void S_SoundSetPanAndVolume(sint32 handle, sint16 wPan, sint16 newvol);

#endif

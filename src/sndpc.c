#include "game.h"

#define Sm_get_volume(a) ((a * mn_sound_master_volume) >> 6)

sint32 SoundPlaySample(sint32 sample, uint16 volume, uint16 pitch, uint16 pan);
sint32 SoundPlaySampleLooped(sint32 sample, uint16 volume, uint16 pitch, uint16 pan, int loops, int loop_start, int loop_end);
sint32 SoundSampleIsPlaying(sint32 handle);
void SoundStopAllSamples(void);
void SoundStopSample(sint32 handle);
void SoundSetSampleVolume(int handle, uint16 volume);
void SoundSetPan(int handle, uint16 pan);

uint16 S_get_pan(sint16 angle)
{
    sint32 pan;

    angle += 0x4000;
    pan = ABS(angle);

    return (uint16)pan;
}

sint32 S_SoundPlaySample(sint32 dwSample, uint16 wVol, uint16 wPitch, sint16 wPan)
{
    if (!sound_active)
        return 0;

    return SoundPlaySample(dwSample, Sm_get_volume(wVol), wPitch, S_get_pan(wPan));
}

sint32 S_SoundPlaySampleLooped(sint32 dwSample, uint16 wVol, uint16 wPitch, sint16 dwPan)
{
    if (!sound_active)
        return 0;

    return SoundPlaySampleLooped(dwSample, Sm_get_volume(wVol), wPitch, S_get_pan(dwPan), -1, 0, -1);
}

sint32 S_SoundSampleIsPlaying(sint32 handle)
{
    if (handle < 0)
        return 0;

    return SoundSampleIsPlaying(handle);
}

void S_SoundStopAllSamples(void)
{
    if (!sound_active)
        return;

    SoundStopAllSamples();
}

void S_SoundStopSample(sint32 handle)
{
    if (!sound_active)
        return;

    if (handle < 0)
        return;

    SoundStopSample(handle);
}

void S_SoundSetPanAndVolume(sint32 handle, sint16 wPan, sint16 newvol)
{
    if (handle < 0)
        return;

    SoundSetSampleVolume(handle, Sm_get_volume(newvol));
    SoundSetPan(handle, S_get_pan(wPan));
}

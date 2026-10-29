#include <stdio.h>
#include "game.h"

#define Sm_get_volume(a) ((a * mn_sound_master_volume) >> 6)

sint32 SoundPlaySample(sint32 sample, uint16 volume, uint16 pitch, uint16 pan);
sint32 SoundPlaySampleLooped(sint32 sample, uint16 volume, uint16 pitch, uint16 pan, int loops, int loop_start, int loop_end);
sint32 SoundSampleIsPlaying(sint32 handle);
void SoundStopAllSamples(void);
void SoundStopSample(sint32 handle);
void SoundSetSampleVolume(int handle, uint16 volume);
void SoundSetPan(int handle, uint16 pan);
void CDPlay(int track);
void CDStop(void);
void CDResume(void);
void SoundLoadSamples(char **sample_offsets, int num_samples);

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

void S_CDPlay(sint16 track)
{
    if (!Option_Music_Volume)
        return;

    if (track == 13)
    {
        SoundEffect(173, NULL, SFX_ALWAYS);
        return;
    }

    if (track > 2 && track < 22)
        return;

    S_CDStop();

    if (track >= 26 && track <= 56)
        SoundEffect(track + 148, NULL, SFX_ALWAYS);
    else if (track == 2)
        CDPlay(track);
    else if (track >= 22 && track <= 25)
        CDPlay(track - 15);
    else if (track > 56)
        CDPlay(track - 54);

    cdtrack = track;
}

void S_CDStop(void)
{
    if (cdtrack <= 0)
        return;

    if (cdtrack >= 26 && cdtrack <= 56)
        mn_stop_sound_effect(cdtrack + 148, NULL);
    else
        CDStop();

    cdtrack = 0;
}

void S_CDPause(void)
{
    if (cdtrack <= 0)
        return;

    if (cdtrack >= 26 && cdtrack <= 56)
        mn_stop_sound_effect(cdtrack + 148, NULL);
    else
        CDStop();
}

void S_CDRestart(void)
{
    if (cdtrack <= 0)
        return;

    if (cdtrack >= 26 && cdtrack <= 56)
        return;

    CDResume();
}

char *sample_loader(char *data)
{
    return data;
}

int LoadSamples(FILE *file)
{
    char *sample_data;
    char **sample_offsets;
    int i, sample_size;

    if (!sound_active)
        return 1;

    fread(&sample_lut[0], sizeof(sint16), MAX_SAMPLES, file);
    fread(&num_sample_infos, sizeof(int), 1, file);
    if (num_sample_infos == 0)
        S_ExitSystem("No Sample Infos!!");

    sample_infos = (SAMPLE_INFO *)game_malloc(sizeof(SAMPLE_INFO) * num_sample_infos, SAMPLEINFOS);

    fread(sample_infos, sizeof(SAMPLE_INFO), num_sample_infos, file);

    fread(&sample_size, sizeof(int), 1, file);
    if (sample_size == 0)
        S_ExitSystem("No Sample Data");

    sample_data = game_malloc(sample_size, SAMPLES);

    fread(sample_data, sample_size, 1, file);

    fread(&num_samples, sizeof(int), 1, file);
    if (num_samples == 0)
        S_ExitSystem("No Samples!!");

    sample_offsets = (char **)game_malloc((num_samples + 1) * sizeof(char *), SAMPLEOFFSETS);

    fread(&sample_offsets[1], num_samples, sizeof(char *), file);
    for (i = 0; i < num_samples; i++)
        sample_offsets[i + 1] = sample_data + (int)sample_offsets[i + 1];

    sample_offsets[0] = (char *)sample_loader;

    SoundLoadSamples(sample_offsets, -num_samples);

    sounds_loaded = 1;

    game_free((num_samples + 1) * sizeof(char *), SAMPLEOFFSETS);

    return 1;
}

void S_StartSyncedAudio(int num)
{
    S_CDPlay(num);
}

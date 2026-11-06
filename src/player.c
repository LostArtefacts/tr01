#include <stdlib.h>
#include <string.h>
#include "vidmode.h"
#include "player.h"

typedef unsigned char byte;
typedef unsigned long dword;

#pragma pack(1)
typedef struct
{
    byte reserved[0x2e];
    int width;
    int height;
    int reserved2;
    dword flags;
} VIDEO;
#pragma pack()

typedef struct
{
    int buffered;
    void **buffer;
} VIDEOEXTRA;

typedef struct VIDEOHANDLE
{
    VIDEO *video;
    VIDEOEXTRA *extra;
} VIDEOHANDLE;

typedef struct
{
    byte *buffer;
    byte *current;
    byte reserved[0xc];
    int buffer_size;
    int pending;
    byte reserved2[0x20];
    int compression;
    byte reserved3[0xc];
    void *buffer1;
    void *buffer2;
} SOUND;

typedef struct
{
    void *sample;
    int reserved;
    dword handle;
} SOUNDDEVICE;

typedef struct
{
    int reserved[3];
    int chunks;
    int correction;
    byte reserved2[0x1c];
    float milliseconds;
    int reserved3;
    SOUNDDEVICE *device;
} SOUNDEXTRA;

typedef struct SOUNDHANDLE
{
    SOUND *sound;
    SOUNDEXTRA *extra;
} SOUNDHANDLE;

typedef struct
{
    byte *buffer;
    byte reserved[0x30];
    dword rate;
    dword precision;
    dword channels;
    dword format;
    dword pan;
    byte reserved2[0x14];
    void (__cdecl *processed)(void *);
    byte reserved3[0x48];
    byte *buffer1;
    byte *buffer2;
    byte reserved4[0x40];
} PLAYERSAMPLE;

typedef struct
{
    byte reserved[0x58];
    PLAYERSAMPLE *samples;
} PLAYERDRIVER;

int RPLVideo_InitPlaybackMode(void);
int RPLVideo_ShutDownPlaybackMode(void);
int RPLVideo_Init(LPVIDEOHANDLE *, int, int, int, int, int, int, int, int, int, int *, int *);
int RPLVideo_ShutDown(LPVIDEOHANDLE);
int RPLMovie_Open(LPMOVIEHANDLE *, void *, void *, char *, int);
int RPLMovie_Close(LPMOVIEHANDLE);
int sosTIMERRegisterEvent(dword, void (*)(void), dword *);
int sosTIMERRemoveEvent(dword);
int RPLSound_Init(void (*)(SOUNDHANDLE *), LPSOUNDHANDLE *, int, int, int, int, int);
int RPLSound_SetBufferStatus(LPSOUNDHANDLE, int);
int RPLSound_ShutDown(LPSOUNDHANDLE);
int RPLMovie_InitPlayback(LPMOVIEHANDLE, LPVIDEOHANDLE, LPSOUNDHANDLE);
int RPLMovie_PlayFrame(LPMOVIEHANDLE, LPVIDEOHANDLE, LPSOUNDHANDLE, void *, int, void *, void *, int);
int RPLVideo_Map(LPVIDEOHANDLE, void *, int);
void RPLGraphics_Blit(int, byte *, int, int, int, int, int);
int RPLVideo_SetBackground(LPVIDEOHANDLE, void *, void *);
int RPLVideo_ClearBackground(LPVIDEOHANDLE, void *, void *);
int RPLVideo_SetWindow(LPVIDEOHANDLE, int, int, int, int, int, int, dword);
dword sosDIGIStartSample(dword, void *);
dword sosDIGIStopSample(dword, dword);

void Player_TimerCallback(void);
void Player_SoundChunkCallback(SOUNDHANDLE *s);

volatile int player_ticks = 0;
int player_mode = 1;

SOUNDHANDLE *player_sound;
dword player_sound_driver_handle;
PLAYERDRIVER *player_driver;
dword player_timer_handle;

void __cdecl Player_SampleProcessedCallback(void *sample);
int Player_GetElapsedTicks(LPMOVIEHANDLE m);

PLRESULT Player_InitPlaybackMode(void)
{
    player_mode = 0x110;
    return RPLVideo_InitPlaybackMode();
}

int Player_ShutDownPlaybackMode(void)
{
    player_mode = 1;
    return RPLVideo_ShutDownPlaybackMode();
}

PLRESULT Player_InitVideo(LPVIDEOHANDLE *handle, int x_size, int y_size, int xoffset, int yoffset, int clip_x, int clip_y, int width, int height, int buffered, int flags)
{
    int result;
    int w;
    int h;

    if (!buffered && (flags & 0x20)) {
        return 0x3ff;
    }
    if (buffered) {
        flags |= 0x20;
    }
    result = RPLVideo_Init(handle, x_size, y_size, xoffset, yoffset, clip_x, clip_y, width, height, flags, &w, &h);
    if (result) {
        return result;
    }
    (*handle)->video->width = w;
    (*handle)->video->height = h;
    if (!((*handle)->extra = calloc(1, sizeof(VIDEOEXTRA)))) {
        Player_ShutDownVideo(*handle);
        return 0x3e9;
    }
    if (!((*handle)->extra->buffer = calloc(1, sizeof(void *)))) {
        Player_ShutDownVideo(*handle);
        return 0x3e9;
    }
    (*handle)->extra->buffered = buffered;
    if ((*handle)->extra->buffered) {
        *(*handle)->extra->buffer = calloc(w * h * 2, 1);
        if (!*(*handle)->extra->buffer) {
            return 0x3e9;
        }
    }
    return 0;
}

PLRESULT Player_ShutDownVideo(LPVIDEOHANDLE handle)
{
    if (handle) {
        if (handle->extra) {
            if (handle->extra->buffer) {
                if (handle->extra->buffered) {
                    free(*handle->extra->buffer);
                }
                free(handle->extra->buffer);
            }
            free(handle->extra);
        }
        RPLVideo_ShutDown(handle);
    }
    return 0;
}

PLRESULT Player_InitMovie(LPMOVIEHANDLE *m, void *read_progress_callback, void *callback_interval_bytes, char *filename, int buffer_size)
{
    if (RPLMovie_Open(m, read_progress_callback, callback_interval_bytes, filename, buffer_size)) {
        return 0x3fa;
    }
    (*m)->start_ticks = 0;
    (*m)->unused_playback_state = 0;
    (*m)->unused_timing_state0 = 0;
    (*m)->elapsed = 0;
    (*m)->resume_ticks = 0;
    (*m)->pause_ticks = 0;
    (*m)->unused_timing_state1 = 0;
    (*m)->timer_started = 0;
    (*m)->paused = 1;
    return 0;
}

PLRESULT Player_ShutDownMovie(LPMOVIEHANDLE m)
{
    RPLMovie_Close(m);
    return 0;
}

PLRESULT Player_InitPlaybackSystem(ULONG handle, void *driver)
{
    player_sound_driver_handle = handle;
    player_driver = driver;
    sosTIMERRegisterEvent(200, Player_TimerCallback, &player_timer_handle);
    return 0;
}

void Player_TimerCallback(void)
{
    player_ticks++;
}

PLRESULT Player_InitSound(LPSOUNDHANDLE *handle, int buffer_size, int compression, int pcm, int chunk_size, int channels, int rate, ULONG precision)
{
    int result;
    float tick_rate;
    float bytes;
    float hz;
    float size;
    PLAYERSAMPLE *sample;

    result = RPLSound_Init(Player_SoundChunkCallback, handle, buffer_size, compression, pcm, chunk_size, channels);
    if (result) {
        return result;
    }
    if (!((*handle)->extra = calloc(1, sizeof(SOUNDEXTRA)))) {
        Player_ShutDownSound(*handle);
        return 0x3f7;
    }
    if (!((*handle)->extra->device = calloc(1, sizeof(SOUNDDEVICE)))) {
        Player_ShutDownSound(*handle);
        return 0x3f7;
    }
    if (!((*handle)->sound->buffer1 = calloc(1, buffer_size))) {
        Player_ShutDownSound(*handle);
        return 0x22;
    }
    if (!((*handle)->sound->buffer2 = calloc(1, buffer_size))) {
        Player_ShutDownSound(*handle);
        return 0x22;
    }
    (*handle)->extra->chunks = 0;
    tick_rate = 200.0f;
    bytes = (*handle)->sound->buffer_size;
    hz = rate;
    size = precision * 0.125f;
    (*handle)->extra->milliseconds = bytes / (hz * size) * tick_rate * 0.5f;
    (*handle)->extra->correction = 1;
    sample = malloc(0xf0);
    if (!sample) {
        return 0x3f0;
    }
    (*handle)->extra->device->sample = sample;
    memset(sample, 0, 0xf0);
    sample->precision = precision;
    sample->channels = channels;
    sample->format = precision == 8 ? 0x8000 : 0;
    sample->rate = rate;
    sample->pan = 0x8000;
    *(dword *)((byte *)sample + 0x2c) = 0x7fff7fff;
    sample->processed = Player_SampleProcessedCallback;
    sample->buffer1 = (*handle)->sound->buffer1;
    sample->buffer2 = (*handle)->sound->buffer2;
    sample->buffer = (*handle)->sound->buffer1;
    *(dword *)((byte *)sample + 0xc) = buffer_size;
    return 0;
}

PLRESULT Player_StartSound(LPSOUNDHANDLE handle)
{
    handle->extra->device->handle = sosDIGIStartSample(player_sound_driver_handle, handle->extra->device->sample);
    player_sound = handle;
    return 0;
}

void Player_SoundChunkCallback(SOUNDHANDLE *s)
{
    s->sound->pending = s->sound->compression;
    s->extra->chunks++;
}

void __cdecl Player_SampleProcessedCallback(void *ptr)
{
    byte *buffer;

    buffer = ((PLAYERSAMPLE *)ptr)->buffer2;
    ((PLAYERSAMPLE *)ptr)->buffer2 = ((PLAYERSAMPLE *)ptr)->buffer1;
    ((PLAYERSAMPLE *)ptr)->buffer1 = buffer;
    ((PLAYERSAMPLE *)ptr)->buffer = buffer;
    *(int *)((byte *)ptr + 0xc) = player_sound->sound->buffer_size;
    RPLSound_SetBufferStatus(player_sound, player_sound->sound->pending == 0);
}

PLRESULT Player_ShutDownPlaybackSystem(void)
{
    sosTIMERRemoveEvent(player_timer_handle);
    return 0;
}

PLRESULT Player_ShutDownSound(LPSOUNDHANDLE handle)
{
    if (handle) {
        if (handle->extra) {
            if (handle->extra->device) {
                if (handle->extra->device->sample) {
                    free(handle->extra->device->sample);
                }
                free(handle->extra->device);
            }
            free(handle->extra);
        }
        if (handle->sound->buffer1) {
            free(handle->sound->buffer1);
        }
        if (handle->sound->buffer2) {
            free(handle->sound->buffer2);
        }
        RPLSound_ShutDown(handle);
    }
}

PLRESULT Player_StartTimer(LPMOVIEHANDLE m)
{
    if (m->paused) {
        if (!m->timer_started) {
            m->start_ticks = player_ticks;
            m->resume_ticks = m->start_ticks;
            m->pause_ticks = m->resume_ticks;
            m->timer_started = 1;
        }
        m->elapsed += m->pause_ticks - m->resume_ticks;
        m->resume_ticks = player_ticks;
        m->paused = 0;
    }
    return 0;
}

int Player_StopTimer(LPMOVIEHANDLE m)
{
    if (!m->paused) {
        m->paused = 1;
        m->pause_ticks = player_ticks;
    }
    return 0;
}

int Player_AdjustElapsedTicks(LPMOVIEHANDLE m, int ticks)
{
    m->elapsed += ticks;
    return 0;
}

PLRESULT Player_InitMoviePlayback(LPMOVIEHANDLE m, LPVIDEOHANDLE v, LPSOUNDHANDLE s)
{
    RPLMovie_InitPlayback(m, v, s);
    return 0;
}

int Player_GetSamplePosition(int handle)
{
    PLAYERSAMPLE *sample;

    sample = &player_driver->samples[handle];
    return *(byte **)((byte *)sample + 4) - sample->buffer;
}

PLRESULT Player_Playframe(LPMOVIEHANDLE m, LPVIDEOHANDLE v, LPSOUNDHANDLE s, void *reference_buffer, int x_offset, int y_offset, void *reference_frame, int blend_mode)
{
    float sound_time;
    float duration;
    int result;
    int position;

    result = 0;
    if (v) {
        LPMOVIEHANDLE handle;
        LPMOVIEHANDLE current;
        int ticks;

        handle = m;
        current = handle;
        if (current->paused) {
            ticks = current->elapsed + (current->pause_ticks - current->resume_ticks);
        } else {
            ticks = current->elapsed + (player_ticks - current->resume_ticks);
        }
        if (ticks * m->frame_rate * 0.005f > m->decoded_frames) {
            if (v->extra->buffered) {
                result = RPLMovie_PlayFrame(m, v, s, reference_buffer, 1, *v->extra->buffer, reference_frame, blend_mode);
                if (v->video->flags & 8) {
                    RPLGraphics_Blit(0, *v->extra->buffer, v->video->width, v->video->height, x_offset, y_offset, 2);
                } else if (v->video->flags & 0x40) {
                    RPLGraphics_Blit(0, *v->extra->buffer, v->video->width, v->video->height, x_offset, y_offset, 1);
                } else {
                    RPLGraphics_Blit(0, *v->extra->buffer, v->video->width, v->video->height, x_offset, y_offset, 0);
                }
            } else {
                result = RPLMovie_PlayFrame(m, v, s, reference_buffer, 1, vidmode_state.display.buffer, reference_frame, blend_mode);
            }
        } else {
            result = RPLMovie_PlayFrame(m, v, s, reference_buffer, 0, 0, reference_frame, blend_mode);
        }
    } else {
        result = RPLMovie_PlayFrame(m, v, s, reference_buffer, 0, 0, reference_frame, blend_mode);
    }
    if (s) {
        int handle;
        int sample_handle;
        PLAYERSAMPLE *sample;
        int sample_position;

    if (s->sound->compression == -1) {
        handle = s->extra->device->handle;
        sample_handle = handle;
        sample = &player_driver->samples[sample_handle];
        sample_position = *(byte **)((byte *)sample + 4) - sample->buffer;
        position = sample_position;
        sound_time = ((float)(position % s->sound->buffer_size) / (float)s->sound->buffer_size + (float)s->extra->chunks) * s->extra->milliseconds;
        duration = (float)(m->header.frames_per_chunk * m->header.number_of_chunks) / m->frame_rate;
        if (duration <= sound_time * 0.005) {
            return 0x3fc;
        }
        if (Player_GetElapsedTicks(m) < (int)sound_time) {
            m->elapsed += s->extra->correction;
        } else if (Player_GetElapsedTicks(m) > (int)sound_time) {
            m->elapsed -= s->extra->correction;
        }
    }
    }
    return result == 0 ? 0 : result;
}

PLRESULT Player_MapVideo(LPVIDEOHANDLE v, int colour_mode)
{
    if (v->extra->buffered) {
        return RPLVideo_Map(v, *v->extra->buffer, colour_mode);
    } else {
        return RPLVideo_Map(v, vidmode_state.display.buffer, colour_mode);
    }
}

PLRESULT Player_StopSound(LPSOUNDHANDLE s)
{
    sosDIGIStopSample(player_sound_driver_handle, s->extra->device->handle);
    return 0;
}

int Player_SetCurrentSound(LPSOUNDHANDLE s)
{
    player_sound = s;
    return 0;
}

int Player_NoOp(void *unused_data, int unused_value)
{
    return 0;
}

int Player_SetBackground(LPVIDEOHANDLE v, void *background_buffer)
{
    if (!v->extra->buffered) {
        return 0x3eb;
    }
    RPLVideo_SetBackground(v, background_buffer, *v->extra->buffer);
    return 0;
}

int Player_ClearBackground(LPVIDEOHANDLE v, void *background_buffer)
{
    if (!v->extra->buffered) {
        return 0x3eb;
    }
    RPLVideo_ClearBackground(v, background_buffer, *v->extra->buffer);
    return 0;
}

int Player_GetElapsedTicks(LPMOVIEHANDLE m)
{
    if (m->paused) {
        return m->elapsed + (m->pause_ticks - m->resume_ticks);
    } else {
        return m->elapsed + (player_ticks - m->resume_ticks);
    }
}

int Player_GetFrameLead(LPMOVIEHANDLE m)
{
    {
        LPMOVIEHANDLE handle;
        LPMOVIEHANDLE current;
        int ticks;

        handle = m;
        current = handle;
        if (current->paused) {
            ticks = current->elapsed + (current->pause_ticks - current->resume_ticks);
        } else {
            ticks = current->elapsed + (player_ticks - current->resume_ticks);
        }
        return m->decoded_frames - (int)(ticks * m->frame_rate * 0.005f);
    }
}

int Player_SetVideoWindow(LPVIDEOHANDLE v, int x, int y, int clip_x, int clip_y, int width, int height, dword flags)
{
    return RPLVideo_SetWindow(v, x, y, clip_x, clip_y, width, height, flags);
}

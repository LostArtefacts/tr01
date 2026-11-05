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

int Func4f3ec(void);
int Func4f418(void);
int Func4efa0(LPVIDEOHANDLE *, int, int, int, int, int, int, int, int, int, int *, int *);
int Func4f610(LPVIDEOHANDLE);
int Func4f620(LPMOVIEHANDLE *, void *, void *, char *, int);
int Func4f81c(LPMOVIEHANDLE);
int sosTIMERRegisterEvent(dword, void (*)(void), dword *);
int sosTIMERRemoveEvent(dword);
int Func4f450(void (*)(SOUNDHANDLE *), LPSOUNDHANDLE *, int, int, int, int, int);
int Func4f548(LPSOUNDHANDLE, int);
int Func4f5b0(LPSOUNDHANDLE);
int Func4f9f4(LPMOVIEHANDLE, LPVIDEOHANDLE, LPSOUNDHANDLE);
int Func4fbf4(LPMOVIEHANDLE, LPVIDEOHANDLE, LPSOUNDHANDLE, void *, int, void *, void *, int);
int Func4f140(LPVIDEOHANDLE, void *, int);
void Func50d04(int, byte *, int, int, int, int, int);
int Func5056c(LPVIDEOHANDLE, void *, void *);
int Func505d8(LPVIDEOHANDLE, void *, void *);
int Func50518(LPVIDEOHANDLE, int, int, int, int, int, int, dword);
dword Func4e6b6(dword, void *);
dword Func4e836(dword, dword);

void Func492e0(void);
void Func495c4(SOUNDHANDLE *s);

volatile int player_ticks = 0;
int player_mode = 1;

SOUNDHANDLE *player_sound;
dword player_sound_driver_handle;
PLAYERDRIVER *player_driver;
dword player_timer_handle;

void __cdecl Func495f8(void *sample);
int Func49db0(LPMOVIEHANDLE m);

PLRESULT Player_InitPlaybackMode(void)
{
    player_mode = 0x110;
    return Func4f3ec();
}

int Func48f7c(void)
{
    player_mode = 1;
    return Func4f418();
}

PLRESULT Player_InitVideo(LPVIDEOHANDLE *handle, int x_size, int y_size, int xoffset, int yoffset, int a, int b, int width, int height, int buffered, int flags)
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
    result = Func4efa0(handle, x_size, y_size, xoffset, yoffset, a, b, width, height, flags, &w, &h);
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
        Func4f610(handle);
    }
    return 0;
}

PLRESULT Player_InitMovie(LPMOVIEHANDLE *m, void *a, void *b, char *filename, int buffer_size)
{
    if (Func4f620(m, a, b, filename, buffer_size)) {
        return 0x3fa;
    }
    (*m)->start_ticks = 0;
    (*m)->field138 = 0;
    (*m)->fielde4 = 0;
    (*m)->elapsed = 0;
    (*m)->resume_ticks = 0;
    (*m)->pause_ticks = 0;
    (*m)->fieldf4 = 0;
    (*m)->timer_started = 0;
    (*m)->paused = 1;
    return 0;
}

PLRESULT Player_ShutDownMovie(LPMOVIEHANDLE m)
{
    Func4f81c(m);
    return 0;
}

PLRESULT Player_InitPlaybackSystem(ULONG handle, void *driver)
{
    player_sound_driver_handle = handle;
    player_driver = driver;
    sosTIMERRegisterEvent(200, Func492e0, &player_timer_handle);
    return 0;
}

void Func492e0(void)
{
    player_ticks++;
}

PLRESULT Player_InitSound(LPSOUNDHANDLE *handle, int buffer_size, int compression, int pcm, int a, int channels, int rate, ULONG precision)
{
    int result;
    float tick_rate;
    float bytes;
    float hz;
    float size;
    PLAYERSAMPLE *sample;

    result = Func4f450(Func495c4, handle, buffer_size, compression, pcm, a, channels);
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
    sample->processed = Func495f8;
    sample->buffer1 = (*handle)->sound->buffer1;
    sample->buffer2 = (*handle)->sound->buffer2;
    sample->buffer = (*handle)->sound->buffer1;
    *(dword *)((byte *)sample + 0xc) = buffer_size;
    return 0;
}

PLRESULT Player_StartSound(LPSOUNDHANDLE handle)
{
    handle->extra->device->handle = Func4e6b6(player_sound_driver_handle, handle->extra->device->sample);
    player_sound = handle;
    return 0;
}

void Func495c4(SOUNDHANDLE *s)
{
    s->sound->pending = s->sound->compression;
    s->extra->chunks++;
}

void __cdecl Func495f8(void *ptr)
{
    byte *buffer;

    buffer = ((PLAYERSAMPLE *)ptr)->buffer2;
    ((PLAYERSAMPLE *)ptr)->buffer2 = ((PLAYERSAMPLE *)ptr)->buffer1;
    ((PLAYERSAMPLE *)ptr)->buffer1 = buffer;
    ((PLAYERSAMPLE *)ptr)->buffer = buffer;
    *(int *)((byte *)ptr + 0xc) = player_sound->sound->buffer_size;
    Func4f548(player_sound, player_sound->sound->pending == 0);
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
        Func4f5b0(handle);
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

int Func49808(LPMOVIEHANDLE m)
{
    if (!m->paused) {
        m->paused = 1;
        m->pause_ticks = player_ticks;
    }
    return 0;
}

int Func49854(LPMOVIEHANDLE m, int ticks)
{
    m->elapsed += ticks;
    return 0;
}

PLRESULT Player_InitMoviePlayback(LPMOVIEHANDLE m, LPVIDEOHANDLE v, LPSOUNDHANDLE s)
{
    Func4f9f4(m, v, s);
    return 0;
}

int Func498bc(int handle)
{
    PLAYERSAMPLE *sample;

    sample = &player_driver->samples[handle];
    return *(byte **)((byte *)sample + 4) - sample->buffer;
}

PLRESULT Player_Playframe(LPMOVIEHANDLE m, LPVIDEOHANDLE v, LPSOUNDHANDLE s, void *a, int b, int c, void *d, int e)
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
        if (ticks * m->frame_rate * 0.005f > m->vdf) {
            if (v->extra->buffered) {
                result = Func4fbf4(m, v, s, a, 1, *v->extra->buffer, d, e);
                if (v->video->flags & 8) {
                    Func50d04(0, *v->extra->buffer, v->video->width, v->video->height, b, c, 2);
                } else if (v->video->flags & 0x40) {
                    Func50d04(0, *v->extra->buffer, v->video->width, v->video->height, b, c, 1);
                } else {
                    Func50d04(0, *v->extra->buffer, v->video->width, v->video->height, b, c, 0);
                }
            } else {
                result = Func4fbf4(m, v, s, a, 1, vidmode_state.display.buffer, d, e);
            }
        } else {
            result = Func4fbf4(m, v, s, a, 0, 0, d, e);
        }
    } else {
        result = Func4fbf4(m, v, s, a, 0, 0, d, e);
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
        if (Func49db0(m) < (int)sound_time) {
            m->elapsed += s->extra->correction;
        } else if (Func49db0(m) > (int)sound_time) {
            m->elapsed -= s->extra->correction;
        }
    }
    }
    return result == 0 ? 0 : result;
}

PLRESULT Player_MapVideo(LPVIDEOHANDLE v, int a)
{
    if (v->extra->buffered) {
        return Func4f140(v, *v->extra->buffer, a);
    } else {
        return Func4f140(v, vidmode_state.display.buffer, a);
    }
}

PLRESULT Player_StopSound(LPSOUNDHANDLE s)
{
    Func4e836(player_sound_driver_handle, s->extra->device->handle);
    return 0;
}

int Func49cbc(LPSOUNDHANDLE s)
{
    player_sound = s;
    return 0;
}

int Func49ce8(void *a, int b)
{
    return 0;
}

int Func49d10(LPVIDEOHANDLE v, void *a)
{
    if (!v->extra->buffered) {
        return 0x3eb;
    }
    Func5056c(v, a, *v->extra->buffer);
    return 0;
}

int Func49d60(LPVIDEOHANDLE v, void *a)
{
    if (!v->extra->buffered) {
        return 0x3eb;
    }
    Func505d8(v, a, *v->extra->buffer);
    return 0;
}

int Func49db0(LPMOVIEHANDLE m)
{
    if (m->paused) {
        return m->elapsed + (m->pause_ticks - m->resume_ticks);
    } else {
        return m->elapsed + (player_ticks - m->resume_ticks);
    }
}

int Func49e1c(LPMOVIEHANDLE m)
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
        return m->vdf - (int)(ticks * m->frame_rate * 0.005f);
    }
}

int Func49ebc(LPVIDEOHANDLE v, int x, int y, int a, int b, int width, int height, dword flags)
{
    return Func50518(v, x, y, a, b, width, height, flags);
}

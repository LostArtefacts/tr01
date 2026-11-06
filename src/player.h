#ifndef PLAYER_H
#define PLAYER_H

typedef unsigned long ULONG;
typedef int PLRESULT;

#define PLAYER_OK 0

#define DFLAG_CLEAROUTPUT 0x01
#define DFLAG_INVIEWPORT 0x04
#define DFLAG_SOFTDOUBLED 0x40

typedef struct
{
    char reserved[0x1c];
    int x_size;
    int y_size;
    int reserved2;
    int sound_rate;
    int sound_channels;
    int sound_precision;
    int frames_per_chunk;
    int number_of_chunks;
} MOVIEHEADER;

typedef struct
{
    MOVIEHEADER header;
    char reserved[0x20];
    float frame_rate;
    char reserved2[0x80];
    int start_ticks;
    int unused_timing_state0;
    int elapsed;
    int resume_ticks;
    int pause_ticks;
    int unused_timing_state1;
    char reserved3[0xc];
    int decoded_frames;
    int buffered_video_chunk;
    char reserved4[0x28];
    int paused;
    int unused_playback_state;
    char reserved5[0x28];
    int timer_started;
} MOVIEHANDLE, *LPMOVIEHANDLE;

typedef struct VIDEOHANDLE *LPVIDEOHANDLE;
typedef struct SOUNDHANDLE *LPSOUNDHANDLE;

PLRESULT Player_InitPlaybackSystem(ULONG sos_handle, void *sos_driver);
PLRESULT Player_ShutDownPlaybackSystem(void);
PLRESULT Player_InitMovie(LPMOVIEHANDLE *mhandle, void *read_progress_callback, void *callback_interval_bytes, char *filename, int buffer_size);
PLRESULT Player_ShutDownMovie(LPMOVIEHANDLE mhandle);
PLRESULT Player_InitVideo(LPVIDEOHANDLE *vhandle, int x_size, int y_size, int xoffset, int yoffset, int clip_x, int clip_y, int width, int height, int buffered, int flags);
PLRESULT Player_ShutDownVideo(LPVIDEOHANDLE vhandle);
PLRESULT Player_InitSound(LPSOUNDHANDLE *shandle, int buffer_size, int compression, int pcm, int chunk_size, int channels, int rate, ULONG precision);
PLRESULT Player_ShutDownSound(LPSOUNDHANDLE shandle);
PLRESULT Player_InitMoviePlayback(LPMOVIEHANDLE mhandle, LPVIDEOHANDLE vhandle, LPSOUNDHANDLE shandle);
PLRESULT Player_InitPlaybackMode(void);
PLRESULT Player_MapVideo(LPVIDEOHANDLE vhandle, int colour_mode);
PLRESULT Player_StartTimer(LPMOVIEHANDLE mhandle);
PLRESULT Player_StartSound(LPSOUNDHANDLE shandle);
PLRESULT Player_StopSound(LPSOUNDHANDLE shandle);
PLRESULT Player_Playframe(LPMOVIEHANDLE mhandle, LPVIDEOHANDLE vhandle, LPSOUNDHANDLE shandle, void *reference_buffer, int x_offset, int y_offset, void *reference_frame, int blend_mode);

#endif

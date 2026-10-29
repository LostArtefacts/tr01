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
    char reserved[0xc8];
    int vdf;
} MOVIEHANDLE, *LPMOVIEHANDLE;

typedef void *LPVIDEOHANDLE;
typedef void *LPSOUNDHANDLE;

PLRESULT Player_InitPlaybackSystem(ULONG sos_handle, void *sos_driver);
PLRESULT Player_ShutDownPlaybackSystem(void);
PLRESULT Player_InitMovie(LPMOVIEHANDLE *mhandle, void *a, void *b, char *filename, int buffer_size);
PLRESULT Player_ShutDownMovie(LPMOVIEHANDLE mhandle);
PLRESULT Player_InitVideo(LPVIDEOHANDLE *vhandle, int x_size, int y_size, int xoffset, int yoffset, int a, int b, int width, int height, int c, int flags);
PLRESULT Player_ShutDownVideo(LPVIDEOHANDLE vhandle);
PLRESULT Player_InitSound(LPSOUNDHANDLE *shandle, int buffer_size, int compression, int pcm, int a, int channels, int rate, int precision);
PLRESULT Player_ShutDownSound(LPSOUNDHANDLE shandle);
PLRESULT Player_InitMoviePlayback(LPMOVIEHANDLE mhandle, LPVIDEOHANDLE vhandle, LPSOUNDHANDLE shandle);
PLRESULT Player_InitPlaybackMode(void);
PLRESULT Player_MapVideo(LPVIDEOHANDLE vhandle, int a);
PLRESULT Player_StartTimer(LPMOVIEHANDLE mhandle);
PLRESULT Player_StartSound(LPSOUNDHANDLE shandle);
PLRESULT Player_StopSound(LPSOUNDHANDLE shandle);
PLRESULT Player_Playframe(LPMOVIEHANDLE mhandle, LPVIDEOHANDLE vhandle, LPSOUNDHANDLE shandle, void *a, int b, int c, void *d, int e);

#endif

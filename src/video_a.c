#include <stdlib.h>

typedef struct
{
    void *buffer;
    void *extra;
    char reserved[0x164];
} VIDEOBUFFER;

char Datac89e0[80] = "$Id: VIDEO_A.ASM 1.4 1995/08/14 10:01:03 MFC Exp $";

void Func58aa0(VIDEOBUFFER *video);

VIDEOBUFFER *Func58a50(unsigned int size)
{
    VIDEOBUFFER *video;

    video = malloc(sizeof(VIDEOBUFFER));
    if (!video) {
        return 0;
    }
    video->extra = malloc(4);
    if (!video->extra) {
        free(video);
        return 0;
    }
    video->buffer = malloc(size);
    if (!video->buffer) {
        Func58aa0(video);
        return 0;
    }
    return video;
}

void Func58aa0(VIDEOBUFFER *video)
{
    if (video) {
        if (video->buffer) {
            free(video->buffer);
            video->buffer = 0;
        }
        if (video->extra) {
            free(video->extra);
            video->extra = 0;
        }
        free(video);
    }
}

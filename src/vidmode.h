#ifndef VIDMODE_H
#define VIDMODE_H

#pragma pack(1)
typedef struct
{
    unsigned long width;
    unsigned long height;
    unsigned char *buffer;
    int window_size;
    int granularity;
    unsigned long pages;
    int format;
    int pixel_bytes;
    int pitch;
    int page_bytes;
    int bank_a;
    unsigned char mode;
    int reserved;
    int reserved2;
    int precision;
} RPLGRAPHICS;

typedef struct
{
    int reserved;
    RPLGRAPHICS display;
    unsigned char reserved2[7];
} VIDMODESTATE;
#pragma pack()

extern VIDMODESTATE vidmode_state;

#endif

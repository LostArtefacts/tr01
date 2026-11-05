#ifndef RPLFILE_INTERNAL_H
#define RPLFILE_INTERNAL_H

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <io.h>
#include <fcntl.h>

typedef unsigned char byte;
typedef unsigned long dword;

#pragma pack(push, 1)
typedef struct
{
    byte pad0[0x4a];
    void *extra;
    byte pad4e[0x18];
    dword *table1;
    dword *table2;
    dword *table3;
    dword tail;
} DECODESTATE;
#pragma pack(pop)

typedef struct
{
    DECODESTATE *state;
    dword reserved;
} DECODE;

typedef struct
{
    long offset;
    long video;
    long audio;
} CHUNK;

typedef struct NODE NODE;
struct NODE
{
    void *data;
    NODE *next;
    byte tail;
};

typedef struct
{
    char *title;
    char *author;
    char *sound;
    char *copyright;
    long format;
    long width;
    long height;
    long depth;
    long sample_rate;
    long channels;
    long sample_bits;
    long frames_per_chunk;
    long chunks;
    long field34;
    long field38;
    long index_offset;
    long field40;
    long field44;
    long field48;
    dword magic;
    long chunk_samples;
    float frame_rate;
    CHUNK *index;
    byte pad5c[0x58];
    void *buffer;
    byte padb8[0x74];
    unsigned int read_size;
    byte pad130[0x18];
    NODE *node;
    void (*callback)(void *);
    byte pad150[0xc];
    unsigned int audio_size;
    void *context;
} RPLFILE;

void Func57b74(DECODE *decode);
int Func57e14(FILE *fp, RPLFILE *rpl);
void Func57ee8(RPLFILE *rpl);
void Func57eb0(RPLFILE *rpl);
int Func57f6c(FILE *fp, RPLFILE *rpl);
int Func58264(FILE *fp, RPLFILE *rpl);

int __cdecl Func5f305(int, int, int, int);
#pragma aux (__cdecl) Func5f305 "Func5f305_";

int __cdecl Func5eac6(int, int, int, int, int, int, int, int);
#pragma aux (__cdecl) Func5eac6 "Func5eac6_";

int __cdecl Func5f0ab(int, int, int);
#pragma aux (__cdecl) Func5f0ab "Func5f0ab_";

int __cdecl Func5f2ce(int, int, int, int);
#pragma aux (__cdecl) Func5f2ce "Func5f2ce_";

int __cdecl Func67e27(int, int, int, int, int, int, int, int, int, int, int, int, int, int, int, int, int);
#pragma aux (__cdecl) Func67e27 "Func67e27_";

int __cdecl Func5ffed(int, int, int, int, int, int, int, int);
#pragma aux (__cdecl) Func5ffed "Func5ffed_";

int __cdecl Func70d17(int, int, int, int);
#pragma aux (__cdecl) Func70d17 "Func70d17_";

int __cdecl Func78e07(int, int, int, int);
#pragma aux (__cdecl) Func78e07 "Func78e07_";

int __cdecl Func75e12(int, int);
#pragma aux (__cdecl) Func75e12 "Func75e12_";

int __cdecl Func7df02(int, int);
#pragma aux (__cdecl) Func7df02 "Func7df02_";

int __cdecl Func75e4b(int, int, int, int, int, int, int, int, int, int);
#pragma aux (__cdecl) Func75e4b "Func75e4b_";

int __cdecl Func7df3b(int, int, int, int, int, int, int, int, int, int);
#pragma aux (__cdecl) Func7df3b "Func7df3b_";


#endif

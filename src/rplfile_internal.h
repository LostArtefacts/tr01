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
    long last_chunk_index;
    long even_chunk_size;
    long odd_chunk_size;
    long index_offset;
    long sprite_offset;
    long sprite_size;
    long keyframe_list_offset;
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

void RPLDecode_Destroy(DECODE *decode);
int RPLFile_ReadMetadata(FILE *fp, RPLFILE *rpl);
void RPLFile_FreeMetadata(RPLFILE *rpl);
void RPLFile_InitMetadata(RPLFILE *rpl);
int RPLFile_ReadHeader(FILE *fp, RPLFILE *rpl);
int RPLFile_ReadIndex(FILE *fp, RPLFILE *rpl);

int __cdecl RPL124_FrameBufferSize(int, int, int, int);
#pragma aux (__cdecl) RPL124_FrameBufferSize "RPL124_FrameBufferSize_";

int __cdecl RPL124_SetBackground(int, int, int, int, int, int, int, int);
#pragma aux (__cdecl) RPL124_SetBackground "RPL124_SetBackground_";

int __cdecl RPL124_ClearBackground(int, int, int);
#pragma aux (__cdecl) RPL124_ClearBackground "RPL124_ClearBackground_";

int __cdecl RPL124_DecodeInfoSize(int, int, int, int);
#pragma aux (__cdecl) RPL124_DecodeInfoSize "RPL124_DecodeInfoSize_";

int __cdecl RPL124_DrawFrame(int, int, int, int, int, int, int, int, int, int, int, int, int, int, int, int, int);
#pragma aux (__cdecl) RPL124_DrawFrame "RPL124_DrawFrame_";

int __cdecl RPL124_DecodeFrame(int, int, int, int, int, int, int, int);
#pragma aux (__cdecl) RPL124_DecodeFrame "RPL124_DecodeFrame_";

int __cdecl RPL124D555_DecodeFrame(int, int, int, int);
#pragma aux (__cdecl) RPL124D555_DecodeFrame "RPL124D555_DecodeFrame_";

int __cdecl RPL124D565_DecodeFrame(int, int, int, int);
#pragma aux (__cdecl) RPL124D565_DecodeFrame "RPL124D565_DecodeFrame_";

int __cdecl RPL124D555_SetBankMode(int, int);
#pragma aux (__cdecl) RPL124D555_SetBankMode "RPL124D555_SetBankMode_";

int __cdecl RPL124D565_SetBankMode(int, int);
#pragma aux (__cdecl) RPL124D565_SetBankMode "RPL124D565_SetBankMode_";

int __cdecl RPL124D555_BuildBlockList(int, int, int, int, int, int, int, int, int, int);
#pragma aux (__cdecl) RPL124D555_BuildBlockList "RPL124D555_BuildBlockList_";

int __cdecl RPL124D565_BuildBlockList(int, int, int, int, int, int, int, int, int, int);
#pragma aux (__cdecl) RPL124D565_BuildBlockList "RPL124D565_BuildBlockList_";


#endif

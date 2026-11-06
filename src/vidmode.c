#include "vidmode.h"

typedef unsigned char byte;
typedef unsigned long dword;

#pragma pack(1)
typedef struct
{
    byte reserved[10];
    dword width;
    dword height;
    int y_offset;
    int x_offset;
    int clip_y;
    int clip_x;
    int output_width;
    int output_height;
    int id;
    int frame_width;
    int frame_height;
    dword format;
    dword flags;
    byte reserved2[8];
    byte *data;
    void *buffer;
    int unused_video_state0;
    int unused_video_state1;
    int initialized;
    int background_active;
    int compressed;
    int unused_video_state2;
    byte decode_info[12];
    int codebook_bit_widths;
} VIDEO;
#pragma pack()

typedef struct
{
    VIDEO *video;
    void *extra;
} VIDEOHANDLE;

static int display_mode = 1;
static int next_video_id = 0;
VIDMODESTATE vidmode_state;

int RPLDecode_Create(VIDEOHANDLE **, int);
void RPLDecode_Destroy(VIDEOHANDLE *);
int RPLDecode_GetDecodeInfoSize(dword, dword, int *, int *);
int RPLFile_AllocateBuffer(int, void **);
byte RPLGraphics_SetMode(void *, int);
void RPLGraphics_RestoreMode(void);
void RPLVideo_SetPixelFormat(VIDEOHANDLE *, int, int, int, int, int, int, int, int, int);
void RPLDecode_DrawFrame(dword, dword, int, int, int, int, int, int, dword, void *, int, int, void *, VIDEO *, int, int, int);
void RPL124_SetBankModeRGB555Doubled(int, int);
void RPL124_SetBankModeRGB555(int, int);
void RPL124_SetBankModeRGB565Doubled(int, int);
void RPL124_SetBankModeRGB565(int, int);
void RPL124_BuildRGB555DoubledBlockList(dword, dword, int, int, int, int, int, int, dword, void *);
void RPL124_BuildRGB555BlockList(dword, dword, int, int, int, int, int, int, dword, void *);
void RPL124_BuildRGB565DoubledBlockList(dword, dword, int, int, int, int, int, int, dword, void *);
void RPL124_BuildRGB565BlockList(dword, dword, int, int, int, int, int, int, dword, void *);
void RPL124_DecodeRGB555Doubled(void *, int, void *, void *);
void RPL124_DecodeRGB555(void *, int, void *, void *);
void RPL124_DecodeRGB565Doubled(void *, int, void *, void *);
void RPL124_DecodeRGB565(void *, int, void *, void *);
void *RPLBuffer_GetData(void *);
void RPLDecode_DecodeFrame(void *, int, void *, void *, void *, int, int, int);

int RPLVideo_Init(VIDEOHANDLE **handle, dword width, dword height, int x, int y, int clip_x, int clip_y, int clip_width, int clip_height, dword flags, int *actual_width, int *actual_height)
{
    int result;
    int size;
    int id;
    dword rounded_width;

    result = RPLDecode_Create(handle, flags);
    if (result != 0) {
        return result;
    }
    {
        dword rounded_height;

        id = next_video_id++;
        (*handle)->video->id = id;
        (*handle)->video->unused_video_state0 = 0;
        (*handle)->video->codebook_bit_widths = 0;
        (*handle)->video->width = width;
        (*handle)->video->height = height;
        (*handle)->video->frame_height = clip_height;
        (*handle)->video->y_offset = y;
        (*handle)->video->x_offset = x;
        (*handle)->video->clip_y = clip_y;
        (*handle)->video->clip_x = clip_x;
        (*handle)->video->output_width = clip_width;
        (*handle)->video->output_height = clip_height;
        (*handle)->video->background_active = 0;
        (*handle)->video->initialized = 0;
        (*handle)->video->flags = flags;
        if (!((*handle)->video->flags & 0x20) && ((*handle)->video->flags & 8)) {
            (*handle)->video->flags &= ~8;
            (*handle)->video->flags |= 0x40;
        }
        if ((*handle)->video->flags & 0x20) {
            (*handle)->video->compressed = 1;
            size = RPLDecode_GetDecodeInfoSize((*handle)->video->width, (*handle)->video->height, actual_width, actual_height);
        } else {
            rounded_height = height + (height & 7);
            rounded_width = width + (width & 7);
            if ((*handle)->video->flags & 0x40) {
                width >>= 2;
                height >>= 2;
                height *= width;
                *actual_width = rounded_width * 2;
                *actual_height = rounded_height * 2;
                size = height * 4;
            } else {
                *actual_width = rounded_width;
                *actual_height = rounded_height;
                width >>= 3;
                size = (height >> 3) * width * 4;
            }
            size += 8;
        }
        result = RPLFile_AllocateBuffer(size, &(*handle)->video->buffer);
        if (result) {
            RPLDecode_Destroy(*handle);
        }
        (*handle)->video->format = flags & 0xf;
    }
    return result;
}

int RPLVideo_Map(VIDEOHANDLE *handle, void *destination, int colour_mode)
{
    if (display_mode == 1) {
        return 0x23;
    }
    if (handle->video->compressed) {
        if (!handle->video->initialized) {
            handle->video->initialized = 1;
            if (vidmode_state.display.precision == 15) {
                RPLVideo_SetPixelFormat(handle, 16, 0, 0, 10, 5, 5, 5, 0, 5);
            } else {
                RPLVideo_SetPixelFormat(handle, 16, 0, 0, 11, 5, 5, 6, 0, 5);
            }
        }
        RPLDecode_DrawFrame(handle->video->width, handle->video->height, handle->video->x_offset, handle->video->y_offset, handle->video->clip_x, handle->video->clip_y, handle->video->output_width, handle->video->output_height, handle->video->format, handle->video->buffer, handle->video->frame_width, handle->video->frame_height, destination, handle->video, colour_mode, 0, 0);
    } else {
        if (!handle->video->initialized) {
            handle->video->initialized = 1;
            if (vidmode_state.display.precision == 15) {
                if (handle->video->flags & 0x40) {
                    RPL124_SetBankModeRGB555Doubled(vidmode_state.display.bank_a, vidmode_state.display.granularity);
                } else {
                    RPL124_SetBankModeRGB555(vidmode_state.display.bank_a, vidmode_state.display.granularity);
                }
            } else {
                if (handle->video->flags & 0x40) {
                    RPL124_SetBankModeRGB565Doubled(vidmode_state.display.bank_a, vidmode_state.display.granularity);
                } else {
                    RPL124_SetBankModeRGB565(vidmode_state.display.bank_a, vidmode_state.display.granularity);
                }
            }
        }
        if (vidmode_state.display.precision == 15) {
            if (handle->video->flags & 0x40) {
                RPL124_BuildRGB555DoubledBlockList(handle->video->width, handle->video->height, handle->video->x_offset, handle->video->y_offset, handle->video->clip_x, handle->video->clip_y, handle->video->output_width, handle->video->output_height, handle->video->flags & 1, handle->video->buffer);
            } else {
                RPL124_BuildRGB555BlockList(handle->video->width, handle->video->height, handle->video->x_offset, handle->video->y_offset, handle->video->clip_x, handle->video->clip_y, handle->video->output_width, handle->video->output_height, handle->video->flags & 1, handle->video->buffer);
            }
        } else {
            if (handle->video->flags & 0x40) {
                RPL124_BuildRGB565DoubledBlockList(handle->video->width, handle->video->height, handle->video->x_offset, handle->video->y_offset, handle->video->clip_x, handle->video->clip_y, handle->video->output_width, handle->video->output_height, handle->video->flags & 1, handle->video->buffer);
            } else {
                RPL124_BuildRGB565BlockList(handle->video->width, handle->video->height, handle->video->x_offset, handle->video->y_offset, handle->video->clip_x, handle->video->clip_y, handle->video->output_width, handle->video->output_height, handle->video->flags & 1, handle->video->buffer);
            }
        }
    }
    return 0;
}

int RPLVideo_DecodeFrame(VIDEOHANDLE *handle, void *reference_buffer, int destination, int reference_frame, int blend_mode)
{
    if (handle->video->compressed) {
        RPLDecode_DecodeFrame(handle->video->data + 8, destination, handle->video->decode_info, handle->video->buffer, RPLBuffer_GetData(reference_buffer), reference_frame, blend_mode, 0);
    } else {
        if (vidmode_state.display.precision == 15) {
            if (handle->video->flags & 0x40) {
                RPL124_DecodeRGB555Doubled(handle->video->data + 8, destination, handle->video->decode_info, handle->video->buffer);
            } else {
                RPL124_DecodeRGB555(handle->video->data + 8, destination, handle->video->decode_info, handle->video->buffer);
            }
        } else {
            if (handle->video->flags & 0x40) {
                RPL124_DecodeRGB565Doubled(handle->video->data + 8, destination, handle->video->decode_info, handle->video->buffer);
            } else {
                RPL124_DecodeRGB565(handle->video->data + 8, destination, handle->video->decode_info, handle->video->buffer);
            }
        }
    }
    return 0;
}

int RPLVideo_InitPlaybackMode(void)
{
    if (!RPLGraphics_SetMode(&vidmode_state.display, 0x110)) {
        return 13;
    }
    display_mode = 0x110;
    return 0;
}

int RPLVideo_ShutDownPlaybackMode(void)
{
    display_mode = 1;
    RPLGraphics_RestoreMode();
    return 0;
}

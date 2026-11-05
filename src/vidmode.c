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
    int field1a;
    int field1e;
    int output_width;
    int output_height;
    int id;
    int field2e;
    int field32;
    dword format;
    dword flags;
    byte reserved2[8];
    byte *data;
    void *buffer;
    int field4e;
    int field52;
    int initialized;
    int field5a;
    int compressed;
    int field62;
    byte decode_info[12];
    int field72;
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

int Func57a00(VIDEOHANDLE **, int);
void Func57b74(VIDEOHANDLE *);
int Func57c5c(dword, dword, int *, int *);
int Func58398(int, void **);
byte Func50784(void *, int);
void Func50be0(void);
void Func4f5c4(VIDEOHANDLE *, int, int, int, int, int, int, int, int, int);
void Func57c6c(dword, dword, int, int, int, int, int, int, dword, void *, int, int, void *, VIDEO *, int, int, int);
void Func584c0(int, int);
void Func58570(int, int);
void Func584d0(int, int);
void Func58580(int, int);
void Func584e0(dword, dword, int, int, int, int, int, int, dword, void *);
void Func58590(dword, dword, int, int, int, int, int, int, dword, void *);
void Func58514(dword, dword, int, int, int, int, int, int, dword, void *);
void Func585c4(dword, dword, int, int, int, int, int, int, dword, void *);
void Func584a0(void *, int, void *, void *);
void Func58550(void *, int, void *, void *);
void Func584b0(void *, int, void *, void *);
void Func58560(void *, int, void *, void *);
void *Func58674(void *);
void Func57cc4(void *, int, void *, void *, void *, int, int, int);

int Func4efa0(VIDEOHANDLE **handle, dword width, dword height, int x, int y, int a, int b, int w, int h, dword flags, int *actual_width, int *actual_height)
{
    int result;
    int size;
    int id;
    dword rounded_width;

    result = Func57a00(handle, flags);
    if (result != 0) {
        return result;
    }
    {
        dword rounded_height;

        id = next_video_id++;
        (*handle)->video->id = id;
        (*handle)->video->field4e = 0;
        (*handle)->video->field72 = 0;
        (*handle)->video->width = width;
        (*handle)->video->height = height;
        (*handle)->video->field32 = h;
        (*handle)->video->y_offset = y;
        (*handle)->video->x_offset = x;
        (*handle)->video->field1a = b;
        (*handle)->video->field1e = a;
        (*handle)->video->output_width = w;
        (*handle)->video->output_height = h;
        (*handle)->video->field5a = 0;
        (*handle)->video->initialized = 0;
        (*handle)->video->flags = flags;
        if (!((*handle)->video->flags & 0x20) && ((*handle)->video->flags & 8)) {
            (*handle)->video->flags &= ~8;
            (*handle)->video->flags |= 0x40;
        }
        if ((*handle)->video->flags & 0x20) {
            (*handle)->video->compressed = 1;
            size = Func57c5c((*handle)->video->width, (*handle)->video->height, actual_width, actual_height);
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
        result = Func58398(size, &(*handle)->video->buffer);
        if (result) {
            Func57b74(*handle);
        }
        (*handle)->video->format = flags & 0xf;
    }
    return result;
}

int Func4f140(VIDEOHANDLE *handle, void *data, int arg)
{
    if (display_mode == 1) {
        return 0x23;
    }
    if (handle->video->compressed) {
        if (!handle->video->initialized) {
            handle->video->initialized = 1;
            if (vidmode_state.display.precision == 15) {
                Func4f5c4(handle, 16, 0, 0, 10, 5, 5, 5, 0, 5);
            } else {
                Func4f5c4(handle, 16, 0, 0, 11, 5, 5, 6, 0, 5);
            }
        }
        Func57c6c(handle->video->width, handle->video->height, handle->video->x_offset, handle->video->y_offset, handle->video->field1e, handle->video->field1a, handle->video->output_width, handle->video->output_height, handle->video->format, handle->video->buffer, handle->video->field2e, handle->video->field32, data, handle->video, arg, 0, 0);
    } else {
        if (!handle->video->initialized) {
            handle->video->initialized = 1;
            if (vidmode_state.display.precision == 15) {
                if (handle->video->flags & 0x40) {
                    Func584c0(vidmode_state.display.bank_a, vidmode_state.display.granularity);
                } else {
                    Func58570(vidmode_state.display.bank_a, vidmode_state.display.granularity);
                }
            } else {
                if (handle->video->flags & 0x40) {
                    Func584d0(vidmode_state.display.bank_a, vidmode_state.display.granularity);
                } else {
                    Func58580(vidmode_state.display.bank_a, vidmode_state.display.granularity);
                }
            }
        }
        if (vidmode_state.display.precision == 15) {
            if (handle->video->flags & 0x40) {
                Func584e0(handle->video->width, handle->video->height, handle->video->x_offset, handle->video->y_offset, handle->video->field1e, handle->video->field1a, handle->video->output_width, handle->video->output_height, handle->video->flags & 1, handle->video->buffer);
            } else {
                Func58590(handle->video->width, handle->video->height, handle->video->x_offset, handle->video->y_offset, handle->video->field1e, handle->video->field1a, handle->video->output_width, handle->video->output_height, handle->video->flags & 1, handle->video->buffer);
            }
        } else {
            if (handle->video->flags & 0x40) {
                Func58514(handle->video->width, handle->video->height, handle->video->x_offset, handle->video->y_offset, handle->video->field1e, handle->video->field1a, handle->video->output_width, handle->video->output_height, handle->video->flags & 1, handle->video->buffer);
            } else {
                Func585c4(handle->video->width, handle->video->height, handle->video->x_offset, handle->video->y_offset, handle->video->field1e, handle->video->field1a, handle->video->output_width, handle->video->output_height, handle->video->flags & 1, handle->video->buffer);
            }
        }
    }
    return 0;
}

int Func4f344(VIDEOHANDLE *handle, void *buffer, int size, int a, int b)
{
    if (handle->video->compressed) {
        Func57cc4(handle->video->data + 8, size, handle->video->decode_info, handle->video->buffer, Func58674(buffer), a, b, 0);
    } else {
        if (vidmode_state.display.precision == 15) {
            if (handle->video->flags & 0x40) {
                Func584a0(handle->video->data + 8, size, handle->video->decode_info, handle->video->buffer);
            } else {
                Func58550(handle->video->data + 8, size, handle->video->decode_info, handle->video->buffer);
            }
        } else {
            if (handle->video->flags & 0x40) {
                Func584b0(handle->video->data + 8, size, handle->video->decode_info, handle->video->buffer);
            } else {
                Func58560(handle->video->data + 8, size, handle->video->decode_info, handle->video->buffer);
            }
        }
    }
    return 0;
}

int Func4f3ec(void)
{
    if (!Func50784(&vidmode_state.display, 0x110)) {
        return 13;
    }
    display_mode = 0x110;
    return 0;
}

int Func4f418(void)
{
    display_mode = 1;
    Func50be0();
    return 0;
}

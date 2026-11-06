#include <stdlib.h>

typedef struct
{
    void *buffer;
    int reference_frame;
    int x_offset;
    int y_offset;
    int source_width;
    int source_height;
    int width;
    int height;
} DECBUFFER;

int RPLDecode_GetFrameBufferSize(int source_width, int source_height, int *width, int *height);
int RPLBuffer_GetHeight(DECBUFFER *buffer);

DECBUFFER *RPLBuffer_Create(int source_width, int source_height)
{
    DECBUFFER *buffer;

    buffer = calloc(1, sizeof(DECBUFFER));
    if (!buffer) {
        return 0;
    }
    buffer->source_width = source_width;
    buffer->source_height = source_height;
    buffer->buffer = calloc(1, RPLDecode_GetFrameBufferSize(buffer->source_width, buffer->source_height, &buffer->width, &buffer->height));
    if (!buffer->buffer) {
        free(buffer);
        return 0;
    }
    return buffer;
}

void RPLBuffer_Destroy(DECBUFFER *buffer)
{
    if (buffer) {
        free(buffer ? buffer->buffer : 0);
        free(buffer);
    }
}

void *RPLBuffer_GetData(DECBUFFER *buffer)
{
    if (!buffer) {
        return 0;
    }
    return buffer->buffer;
}

int RPLBuffer_GetPixelCount(DECBUFFER *buffer)
{
    int width;

    if (buffer) {
        width = buffer->width;
        return width * RPLBuffer_GetHeight(buffer);
    }
    return 0;
}

void RPLBuffer_SetXOffset(DECBUFFER *buffer, int value)
{
    if (buffer) {
        buffer->x_offset = value;
    }
}

int RPLBuffer_GetXOffset(DECBUFFER *buffer)
{
    return buffer->x_offset;
}

void RPLBuffer_SetYOffset(DECBUFFER *buffer, int value)
{
    if (buffer) {
        buffer->y_offset = value;
    }
}

int RPLBuffer_GetYOffset(DECBUFFER *buffer)
{
    return buffer->y_offset;
}

int RPLBuffer_GetWidth(DECBUFFER *buffer)
{
    return buffer->width;
}

int RPLBuffer_GetHeight(DECBUFFER *buffer)
{
    return buffer->height;
}

int RPLBuffer_GetAllocationSize(DECBUFFER *buffer)
{
    return RPLDecode_GetFrameBufferSize(buffer->source_width, buffer->source_height, &buffer->width, &buffer->height);
}

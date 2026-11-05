#include <stdlib.h>

typedef struct
{
    void *buffer;
    int reserved;
    int field8;
    int fieldc;
    int format;
    int flags;
    int width;
    int height;
} DECBUFFER;

int Func57c10(int format, int flags, int *width, int *height);
int Func586ac(DECBUFFER *buffer);

DECBUFFER *Func58600(int format, int flags)
{
    DECBUFFER *buffer;

    buffer = calloc(1, sizeof(DECBUFFER));
    if (!buffer) {
        return 0;
    }
    buffer->format = format;
    buffer->flags = flags;
    buffer->buffer = calloc(1, Func57c10(buffer->format, buffer->flags, &buffer->width, &buffer->height));
    if (!buffer->buffer) {
        free(buffer);
        return 0;
    }
    return buffer;
}

void Func58658(DECBUFFER *buffer)
{
    if (buffer) {
        free(buffer ? buffer->buffer : 0);
        free(buffer);
    }
}

void *Func58674(DECBUFFER *buffer)
{
    if (!buffer) {
        return 0;
    }
    return buffer->buffer;
}

int Func5867c(DECBUFFER *buffer)
{
    int width;

    if (buffer) {
        width = buffer->width;
        return width * Func586ac(buffer);
    }
    return 0;
}

void Func58690(DECBUFFER *buffer, int value)
{
    if (buffer) {
        buffer->field8 = value;
    }
}

int Func58698(DECBUFFER *buffer)
{
    return buffer->field8;
}

void Func5869c(DECBUFFER *buffer, int value)
{
    if (buffer) {
        buffer->fieldc = value;
    }
}

int Func586a4(DECBUFFER *buffer)
{
    return buffer->fieldc;
}

int Func586a8(DECBUFFER *buffer)
{
    return buffer->width;
}

int Func586ac(DECBUFFER *buffer)
{
    return buffer->height;
}

int Func586b0(DECBUFFER *buffer)
{
    return Func57c10(buffer->format, buffer->flags, &buffer->width, &buffer->height);
}

#include <stdlib.h>
#include <string.h>

typedef struct
{
    void *state;
    void *extra;
} FMVHANDLE;

void Func58720(FMVHANDLE *handle);

FMVHANDLE *Func586d0(void)
{
    FMVHANDLE *handle;

    handle = malloc(sizeof(FMVHANDLE));
    if (!handle) {
        return 0;
    }
    handle->state = malloc(0x58);
    if (!handle->state) {
        Func58720(handle);
    }
    return handle;
}

void *Func58714(void)
{
    return malloc(0x3c);
}

void Func58720(FMVHANDLE *handle)
{
    if (handle) {
        if (handle->state) {
            free(handle->state);
            handle->state = 0;
        }
        free(handle);
    }
}

void Func58748(void *dest, const void *src, unsigned int size)
{
    memcpy(dest, src, size);
}

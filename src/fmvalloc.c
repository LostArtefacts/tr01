#include <stdlib.h>
#include <string.h>

typedef struct
{
    void *state;
    void *extra;
} FMVHANDLE;

void RPLSound_FreeHandle(FMVHANDLE *handle);

FMVHANDLE *RPLSound_AllocateHandle(void)
{
    FMVHANDLE *handle;

    handle = malloc(sizeof(FMVHANDLE));
    if (!handle) {
        return 0;
    }
    handle->state = malloc(0x58);
    if (!handle->state) {
        RPLSound_FreeHandle(handle);
    }
    return handle;
}

void *RPLSound_AllocateExtra(void)
{
    return malloc(0x3c);
}

void RPLSound_FreeHandle(FMVHANDLE *handle)
{
    if (handle) {
        if (handle->state) {
            free(handle->state);
            handle->state = 0;
        }
        free(handle);
    }
}

void RPL_CopyMemory(void *dest, const void *src, unsigned int size)
{
    memcpy(dest, src, size);
}

#include <dos.h>
#include <io.h>
#include <stdlib.h>
#include <string.h>

typedef unsigned char byte;
typedef unsigned short word;
typedef unsigned long dword;

#pragma pack(1)
typedef struct
{
    byte reserved[32];
    dword count;
    byte reserved2[8];
} SOSFILEHEADER;

typedef struct
{
    byte reserved[36];
    dword size;
    dword id;
    word flags;
    word reserved2;
} SOSFILEENTRY;

typedef struct
{
    byte reserved[0xd8];
    void __far *image;
    word reserved2;
    void __far *data;
    word reserved3;
    dword locked_size;
    void *locked_buffer;
    byte reserved4[12];
    dword memory_handle;
} SOSDRIVER;
#pragma pack()

extern char sos_driver_directory[];
extern char sos_driver_filename[];
extern SOSDRIVER *sos_drivers[];
extern SOSFILEHEADER sos_driver_file_header;
extern SOSFILEENTRY sos_driver_file_entry;
extern void *(*sos_allocate_callback)(unsigned int size);
extern void (*sos_free_callback)(void *buffer);

void __far *__cdecl sosDPMIAllocateLinearMemory(dword size, dword *memory_handle, dword *base);
void __far *__cdecl sosDPMICreateCodeAlias(void __far *pointer);
int __cdecl sosDPMILockMemory(void *begin, dword size);
int __cdecl sosDPMIUnlockMemory(void *begin, dword size);
void __cdecl sosDPMIFreeLinearMemory(void __far *pointer, dword size);
void __cdecl sosDRIVERGetConfig(void __far *dest, void __far *src, dword size);
#pragma aux (__cdecl) sosDPMIAllocateLinearMemory "sosDPMIAllocateLinearMemory_";
#pragma aux (__cdecl) sosDPMICreateCodeAlias "sosDPMICreateCodeAlias_";
#pragma aux (__cdecl) sosDPMILockMemory "sosDPMILockMemory_";
#pragma aux (__cdecl) sosDPMIUnlockMemory "sosDPMIUnlockMemory_";
#pragma aux (__cdecl) sosDPMIFreeLinearMemory "sosDPMIFreeLinearMemory_";
#pragma aux (__cdecl) sosDRIVERGetConfig "sosDRIVERGetConfig_";

void sosLOADCodeStart(void)
{
}

int sosLoadDriver(dword id, dword handle, void __far **data, void __far **image, dword *memory_handle, byte *format, dword *base)
{
    int fd;
    dword index;
    int found;
    unsigned int bytes_read;

    index = 0;
    found = 0;
    if (handle > 5) {
        return 10;
    }
    if (id < 0xe000 || id > 0xe200) {
        return 6;
    }
    strcpy(sos_driver_filename, sos_driver_directory);
    strcat(sos_driver_filename, "hmidrv.386");
    fd = open(sos_driver_filename, 0x200);
    if (fd == -1) {
        return 15;
    }
    read(fd, &sos_driver_file_header, sizeof(SOSFILEHEADER));
    while (index <= sos_driver_file_header.count && !found) {
        read(fd, &sos_driver_file_entry, sizeof(SOSFILEENTRY));
        if (sos_driver_file_entry.id == id && (sos_driver_file_entry.flags & 0x8000)) {
            found = 1;
            *image = sosDPMIAllocateLinearMemory(sos_driver_file_entry.size, memory_handle, base);
            if (((char __far *)*image) - 0 == 0) {
                return 5;
            }
            *data = sosDPMICreateCodeAlias(*image);
            if (sosDPMILockMemory((void *)*base, sos_driver_file_entry.size)) {
                return 5;
            }
            _dos_read(fd, *image, sos_driver_file_entry.size, &bytes_read);
            *format = sos_driver_file_entry.size;
        } else {
            _lseek(fd, sos_driver_file_entry.size, 1);
        }
        index++;
    }
    close(fd);
    return 0;
}

int sosUnloadDriver(dword handle)
{
    SOSDRIVER *driver;

    if (handle > 5) {
        return 10;
    }
    driver = sos_drivers[handle];
    if (!driver) {
        return 10;
    }
    if (sosDPMIUnlockMemory(driver->locked_buffer, driver->locked_size)) {
        return 5;
    }
    sosDPMIFreeLinearMemory(driver->image, driver->memory_handle);
    sosDPMIFreeLinearMemory(driver->data, driver->memory_handle);
    return 0;
}

void sosLOADCodeEnd(void)
{
}

void sosALLOCCodeStart(void)
{
}

void *sosAllocate(unsigned int size)
{
    if (sos_allocate_callback) {
        return sos_allocate_callback(size);
    }
    return malloc(size);
}

void sosFree(void *buffer)
{
    if (sos_allocate_callback) {
        sos_free_callback(buffer);
    } else {
        free(buffer);
    }
}

void sosSetAllocateCallback(void *(*allocate)(unsigned int size))
{
    sos_allocate_callback = allocate;
}

void sosSetFreeCallback(void (*release)(void *buffer))
{
    sos_free_callback = release;
}

void sosALLOCCodeEnd(void)
{
}

void sosDriverConfigCodeStart(void)
{
}

int sosGetDriverConfig(dword handle, dword size)
{
    SOSDRIVER *driver;

    driver = sos_drivers[handle];
    if (!driver) {
        return 1;
    }
    if (size) {
        sosDRIVERGetConfig(driver->data, driver->image, size);
    } else {
        return 2;
    }
    return 0;
}

void sosDriverConfigCodeEnd(void)
{
}

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

extern char Datac7e54[];
extern char Datac7ed4[];
extern SOSDRIVER *Datac7f54[];
extern SOSFILEHEADER Datac7f78;
extern SOSFILEENTRY Datac7fa4;
extern void *(*Datac7fd4)(unsigned int size);
extern void (*Datac7fd8)(void *buffer);

void __far *__cdecl Func56da7(dword size, dword *memory_handle, dword *base);
void __far *__cdecl Func56e89(void __far *pointer);
int __cdecl Func56d2d(void *begin, dword size);
int __cdecl Func56d6a(void *begin, dword size);
void __cdecl Func56e53(void __far *pointer, dword size);
void __cdecl Func56f81(void __far *dest, void __far *src, dword size);
#pragma aux (__cdecl) Func56da7 "Func56da7_";
#pragma aux (__cdecl) Func56e89 "Func56e89_";
#pragma aux (__cdecl) Func56d2d "Func56d2d_";
#pragma aux (__cdecl) Func56d6a "Func56d6a_";
#pragma aux (__cdecl) Func56e53 "Func56e53_";
#pragma aux (__cdecl) Func56f81 "Func56f81_";

void Func568ce(void)
{
}

int Func568e3(dword id, dword handle, void __far **data, void __far **image, dword *memory_handle, byte *format, dword *base)
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
    strcpy(Datac7ed4, Datac7e54);
    strcat(Datac7ed4, "hmidrv.386");
    fd = open(Datac7ed4, 0x200);
    if (fd == -1) {
        return 15;
    }
    read(fd, &Datac7f78, sizeof(SOSFILEHEADER));
    while (index <= Datac7f78.count && !found) {
        read(fd, &Datac7fa4, sizeof(SOSFILEENTRY));
        if (Datac7fa4.id == id && (Datac7fa4.flags & 0x8000)) {
            found = 1;
            *image = Func56da7(Datac7fa4.size, memory_handle, base);
            if (((char __far *)*image) - 0 == 0) {
                return 5;
            }
            *data = Func56e89(*image);
            if (Func56d2d((void *)*base, Datac7fa4.size)) {
                return 5;
            }
            _dos_read(fd, *image, Datac7fa4.size, &bytes_read);
            *format = Datac7fa4.size;
        } else {
            _lseek(fd, Datac7fa4.size, 1);
        }
        index++;
    }
    close(fd);
    return 0;
}

int Func56ac5(dword handle)
{
    SOSDRIVER *driver;

    if (handle > 5) {
        return 10;
    }
    driver = Datac7f54[handle];
    if (!driver) {
        return 10;
    }
    if (Func56d6a(driver->locked_buffer, driver->locked_size)) {
        return 5;
    }
    Func56e53(driver->image, driver->memory_handle);
    Func56e53(driver->data, driver->memory_handle);
    return 0;
}

void Func56b8b(void)
{
}

void Func56ba0(void)
{
}

void *Func56bb5(unsigned int size)
{
    if (Datac7fd4) {
        return Datac7fd4(size);
    }
    return malloc(size);
}

void Func56bf2(void *buffer)
{
    if (Datac7fd4) {
        Datac7fd8(buffer);
    } else {
        free(buffer);
    }
}

void Func56c26(void *(*allocate)(unsigned int size))
{
    Datac7fd4 = allocate;
}

void Func56c46(void (*release)(void *buffer))
{
    Datac7fd8 = release;
}

void Func56c66(void)
{
}

void Func56c7b(void)
{
}

int Func56c90(dword handle, dword size)
{
    SOSDRIVER *driver;

    driver = Datac7f54[handle];
    if (!driver) {
        return 1;
    }
    if (size) {
        Func56f81(driver->data, driver->image, size);
    } else {
        return 2;
    }
    return 0;
}

void Func56d15(void)
{
}

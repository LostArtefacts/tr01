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
    byte reserved[0x5c];
    dword port;
    dword irq;
    dword dma;
    dword hardware;
    byte info[0x3c];
    dword flags;
    byte reserved2[8];
    short __far *irq_list;
    byte reserved3[0x16];
    dword device_id;
    byte reserved4[0x30];
    dword loaded_device_id;
} SOSDRIVER;
#pragma pack()

extern dword Datac8128;
extern char Datac81ac[128];
extern byte Datac822c[44];
extern dword Datac824c;
extern byte Datac8258[48];
extern dword Datac827c;
extern dword Datac8280;
extern byte Datac8285;
extern byte Datac8288[0x6a];
extern byte Datac82c5;
extern byte *Datac82f4;
extern void __far *Datac82f8;
extern void __far *Datac8300;
extern int Datac8308;
extern dword Datac830c;
extern dword Datac8310;
extern dword Datac8314;
extern dword Datac8318;
extern char *Datac831c[];
extern dword Datac85a4;
extern dword Datac85a8;
extern dword Datac85ac;
extern dword Datac85b0;

void __far *__cdecl Func56da7(dword, dword *, dword *);
void __far *__cdecl Func56e89(void __far *);
int __cdecl Func56d2d(void *, dword);
int __cdecl Func56d6a(void *, dword);
void __cdecl Func56e53(void __far *, dword);
dword __cdecl Func57000(void __far *, void __far *);
void __cdecl Func57023(void __far *, void __far *);
void __cdecl Func57067(void __far *, void __far *, void *);
dword __cdecl Func570bd(void __far *, dword, dword, dword, void __far *);
void __cdecl Func571e5(dword);
void __cdecl Func5721a(dword);
void __cdecl Func5724f(void __far *, void __far *);
char *__cdecl Func5728e(dword);
void __cdecl Func572d8(dword, char *);
#pragma aux (__cdecl) Func56da7 "Func56da7_";
#pragma aux (__cdecl) Func56e89 "Func56e89_";
#pragma aux (__cdecl) Func56d2d "Func56d2d_";
#pragma aux (__cdecl) Func56d6a "Func56d6a_";
#pragma aux (__cdecl) Func56e53 "Func56e53_";
#pragma aux (__cdecl) Func57000 "Func57000_";
#pragma aux (__cdecl) Func57023 "Func57023_";
#pragma aux (__cdecl) Func57067 "Func57067_";
#pragma aux (__cdecl) Func570bd "Func570bd_";
#pragma aux (__cdecl) Func571e5 "Func571e5_";
#pragma aux (__cdecl) Func5721a "Func5721a_";
#pragma aux (__cdecl) Func5724f "Func5724f_";
#pragma aux (__cdecl) Func5728e "Func5728e_";
#pragma aux (__cdecl) Func572d8 "Func572d8_";

void Func59b67(void)
{
}

int Func59b7c(char *path)
{
    dword index;
    dword size;

    if (Datac8128 & 1) {
        return 3;
    }
    if (path) {
        strcpy(Datac81ac, path);
        strcat(Datac81ac, "hmidet.386");
    } else {
        strcpy(Datac81ac, "hmidet.386");
    }
    Datac8308 = open(Datac81ac, 0x200);
    if (Datac8308 == -1) {
        return 15;
    }
    read(Datac8308, Datac822c, 44);
    Datac82f8 = Func56da7(0x1000, &Datac8314, &Datac8318);
    if (Datac82f8 == 0) {
        return 5;
    }
    Datac8300 = Func56e89(Datac82f8);
    if (Func56d2d((void *)Datac8318, 0x1000)) {
        return 5;
    }
    _lseek(Datac8308, 0, 0);
    Datac8128 |= 1;
    return 0;
}

int Func59cc9(void)
{
    Datac8128 &= ~1;
    close(Datac8308);
    if (Func56d6a((void *)Datac8318, 0x1000)) {
        return 5;
    }
    Func56e53(Datac82f8, Datac8314);
    Func56e53(Datac8300, Datac8314);
    return 0;
}

int Func59d51(dword id, SOSDRIVER *driver)
{
    int found;
    dword port;
    dword position;
    unsigned int bytes_read;
    dword size;
    dword env_index;
    char *env;

    found = 0;
    port = 0;
    env_index = 0;
    env = 0;
    if (!driver) {
        return 2;
    }
    if (id < 0xe000 || id > 0xe200) {
        return 6;
    }
    Datac8310 = 0;
    _lseek(Datac8308, 0, 0);
    read(Datac8308, Datac822c, 44);
    while (Datac8310 <= Datac824c && !found) {
        position = _lseek(Datac8308, 0, 1);
        read(Datac8308, Datac8258, 48);
        size = Datac827c;
        if (Datac8280 == id && (Datac8285 & 0x80)) {
            found = 1;
            _dos_read(Datac8308, Datac82f8, size, &bytes_read);
        } else {
            _lseek(Datac8308, size, 1);
        }
        Datac8310++;
    }
    if (found) {
        Func57067(Datac8300, Datac82f8, Datac8288);
        if (Datac82c5 & 1) {
            Func5724f(Datac8300, Datac82f8);
            env_index = 0;
            while (Func5728e(env_index)) {
                env = getenv(Func5728e(env_index));
                Func572d8(env_index, env);
                env_index++;
            }
        }
        port = Func57000(Datac8300, Datac82f8);
        if (port) {
            Func57067(Datac8300, Datac82f8, driver->info);
            Datac82f4 = driver->info;
            driver->port = port;
            driver->loaded_device_id = driver->device_id;
            Datac830c = position;
            return 0;
        } else {
            return 8;
        }
    } else {
        return 7;
    }
}

int Func59fc8(dword id, SOSDRIVER *driver)
{
    dword size;
    int found;
    dword position;
    unsigned int bytes_read;

    found = 0;
    if (!driver) {
        return 2;
    }
    if (id < 0xe000 || id > 0xe200) {
        return 6;
    }
    Datac8310 = 0;
    _lseek(Datac8308, 0, 0);
    read(Datac8308, Datac822c, 44);
    while (Datac8310 <= Datac824c && !found) {
        position = _lseek(Datac8308, 0, 1);
        read(Datac8308, Datac8258, 48);
        size = Datac827c;
        if (Datac8280 == id && (Datac8285 & 0x80)) {
            found = 1;
            _dos_read(Datac8308, Datac82f8, size, &bytes_read);
        } else {
            _lseek(Datac8308, size, 1);
        }
        Datac8310++;
    }
    if (found) {
        Func57067(Datac8300, Datac82f8, driver->info);
        Datac82f4 = driver->info;
        Datac830c = position;
        return 0;
    } else {
        return 7;
    }
}

int Func5a142(SOSDRIVER *driver)
{
    dword size;
    int found;
    dword port;
    dword position;
    unsigned int bytes_read;
    dword env_index;
    char *env;

    found = 0;
    port = 0;
    env_index = 0;
    env = 0;
    if (!driver) {
        return 2;
    }
    port = 0;
    Datac8310 = 0;
    _lseek(Datac8308, 0, 0);
    read(Datac8308, Datac822c, 44);
    while (Datac8310 <= Datac824c && !found) {
        position = _lseek(Datac8308, 0, 1);
        read(Datac8308, Datac8258, 48);
        size = Datac827c;
        if (Datac8285 & 0x80) {
            _dos_read(Datac8308, Datac82f8, size, &bytes_read);
            Func57067(Datac8300, Datac82f8, Datac8288);
            if (Datac82c5 & 1) {
                Func5724f(Datac8300, Datac82f8);
                env_index = 0;
                while (Func5728e(env_index)) {
                    env = getenv(Func5728e(env_index));
                    Func572d8(env_index, env);
                    env_index++;
                }
            }
            port = Func57000(Datac8300, Datac82f8);
            if (port) {
                Datac830c = position;
                Func57067(Datac8300, Datac82f8, driver->info);
                Datac82f4 = driver->info;
                driver->port = port;
                driver->loaded_device_id = driver->device_id;
                return 0;
            }
        } else {
            _lseek(Datac8308, size, 1);
        }
        Datac8310++;
    }
    return 7;
}

int Func5a37f(SOSDRIVER *driver)
{
    dword size;
    int found;
    dword port;
    dword position;
    unsigned int bytes_read;
    dword env_index;
    char *env;

    found = 0;
    port = 0;
    env_index = 0;
    env = 0;
    if (!driver) {
        return 2;
    }
    port = 0;
    while (Datac8310 <= Datac824c && !found) {
        position = _lseek(Datac8308, 0, 1);
        read(Datac8308, Datac8258, 48);
        size = Datac827c;
        if (Datac8285 & 0x80) {
            _dos_read(Datac8308, Datac82f8, size, &bytes_read);
            Func57067(Datac8300, Datac82f8, Datac8288);
            if (Datac82c5 & 1) {
                Func5724f(Datac8300, Datac82f8);
                env_index = 0;
                while (Func5728e(env_index)) {
                    env = getenv(Func5728e(env_index));
                    Func572d8(env_index, env);
                    env_index++;
                }
            }
            port = Func57000(Datac8300, Datac82f8);
            if (port) {
                Datac830c = position;
                Func57067(Datac8300, Datac82f8, driver->info);
                Datac82f4 = driver->info;
                driver->port = port;
                driver->loaded_device_id = driver->device_id;
                return 0;
            }
        } else {
            _lseek(Datac8308, size, 1);
        }
        Datac8310++;
    }
    return 7;
}

int Func5a590(SOSDRIVER *driver)
{
    dword index;

    if (!driver) {
        return 2;
    }
    _lseek(Datac8308, Datac830c, 0);
    index = 0;
    while ((word)driver->irq_list[index] != 0xffff) {
        Func571e5(driver->irq_list[index]);
        index++;
    }
    Func57023(Datac8300, Datac82f8);
    index = 0;
    while ((word)driver->irq_list[index] != 0xffff) {
        Func5721a(driver->irq_list[index]);
        index++;
    }
    driver->port = Datac85a4;
    driver->dma = Datac85a8;
    driver->irq = Datac85ac;
    driver->hardware = Datac85b0;
    if (!(driver->flags & 1)) {
        if (Datac85ac > 1 && Datac85ac < 16) {
            return 0;
        } else {
            return 17;
        }
    } else {
        return 0;
    }
}

int Func5a710(SOSDRIVER *driver)
{
    dword port;
    dword irq;
    dword dma;
    dword reserved;
    dword reserved2;
    dword result;

    if (!driver) {
        return 2;
    }
    port = driver->port;
    dma = driver->dma;
    irq = driver->irq;
    if (!(driver->flags & 1)) {
        if (irq < 2 || irq > 15) {
            return 17;
        }
    }
    Func571e5(driver->dma);
    result = Func570bd(Datac8300, port, irq, dma, Datac82f8);
    Func5721a(driver->dma);
    return result;
}

void Func5a7cb(void)
{
}

void Func5a7e0(void)
{
}

char *Func5a7f5(dword error)
{
    return Datac831c[error];
}

void Func5a81f(void)
{
}

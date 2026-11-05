#include <dos.h>
#include <string.h>

typedef unsigned char byte;
typedef unsigned short word;
typedef unsigned long dword;

typedef struct SOSSAMPLE SOSSAMPLE;
struct SOSSAMPLE
{
    byte *data;
    byte *current;
    byte reserved08[0x14];
    dword id;
    dword flags;
    dword priority;
    dword handle;
    dword volume;
    dword loop_count;
    dword rate;
    dword bits;
    dword channels;
    dword format;
    dword pan;
    dword pan_speed;
    byte reserved4c[12];
    dword processed;
    byte reserved5c[0x90];
    SOSSAMPLE *next;
};

#pragma pack(1)
typedef struct
{
    dword flags;
    dword field04;
    dword field08;
    dword field0c;
    dword field10;
    dword max_samples;
    dword field18;
    dword field1c;
    dword field20;
    dword field24;
    byte *field28;
    dword field2c;
    SOSSAMPLE *active;
    void __far *callback;
    word reserved3a;
    byte *buffer;
    byte *field40;
    dword field44;
    byte *mix_buffer;
    byte *field4c;
    dword field50;
    dword field54;
    SOSSAMPLE *samples;
    dword field5c;
    dword field60;
    dword field64;
    dword field68;
    dword field6c;
    dword field70;
    dword field74;
    dword field78;
    dword field7c;
    dword field80;
    dword field84;
    dword field88;
    dword field8c;
    dword field90;
    dword field94;
    dword field98;
    dword field9c;
    dword fielda0;
    dword fielda4;
    dword fielda8;
    dword fieldac;
    dword fieldb0;
    dword fieldb4;
    dword fieldb8;
    dword fieldbc;
    dword fieldc0;
    dword fieldc4;
    dword fieldc8;
    dword fieldcc;
    dword fieldd0;
    dword fieldd4;
    void __far *imaged8;
    word reservedde;
    void __far *imagee0;
    word reservede6;
    dword fielde8;
    dword fieldec;
    dword fieldf0;
    void __far *buffer_pointer;
    word reservedfa;
    dword fieldfc;
    dword field100;
    dword field104;
    void (*timer)(void);
} SOSDRIVER;
#pragma pack()

extern dword Datac7e50;
extern char Datac7e54[];
extern SOSDRIVER *Datac7f54[];
extern dword Datac837c[];
extern void (*Datac839c[])(void);
extern dword Datac7f68[];
extern dword Datac7f74;
int Func561b6(void);
int Func56528(void);
void __cdecl Func57539(SOSDRIVER *driver);
#pragma aux (__cdecl) Func57539 "Func57539_";

int Func568e3(dword id, dword handle, void __far **data, void __far **image, dword *flags, byte *format, dword *base);
int Func56ac5(dword handle);
void *Func56bb5(dword size);
void Func56bf2(void *pointer);
int Func56c90(dword handle, void *config);
byte *Func4e387(dword size, dword *physical, dword *handle, void __far **pointer);
int Func4e450(void __far **pointer, dword *handle, dword *physical);
void Func4e56c(dword selector, dword handle, dword physical);
dword __cdecl Func57339(void);
int __cdecl Func56d2d(void *begin, dword size);
int __cdecl Func56ee6(dword size, dword *physical, dword *selector);
int __cdecl Func56f1c(dword selector);
int __cdecl Func57356(dword size, dword *selector, dword *handle);
int __cdecl Func57397(dword selector, dword handle);
int __cdecl Func573c5(dword handle);
int __cdecl Func57431(dword handle);
void *__cdecl Func5747e(dword physical);
void __far *__cdecl Func574de(void __far *data, void __far *image);
void __cdecl Func571e5(dword dma);
void __cdecl Func57110(void __far *data, void __far *image, dword port, dword irq, dword dma, dword a, dword b, dword c);
void __cdecl Func57194(void __far *data, void __far *image);
void __cdecl Func5716e(void __far *data, void __far *image, dword rate);
void __cdecl Func57145(void __far *data, void __far *image, dword physical, dword size);
void __cdecl Func56fdd(void __far *data, void __far *image);
void __cdecl Func570ed(void __far *data, void __far *image);
void __cdecl Func5721a(dword dma);
#pragma aux (__cdecl) Func57339 "Func57339_";
#pragma aux (__cdecl) Func56d2d "Func56d2d_";
#pragma aux (__cdecl) Func56ee6 "Func56ee6_";
#pragma aux (__cdecl) Func56f1c "Func56f1c_";
#pragma aux (__cdecl) Func57356 "Func57356_";
#pragma aux (__cdecl) Func57397 "Func57397_";
#pragma aux (__cdecl) Func573c5 "Func573c5_";
#pragma aux (__cdecl) Func57431 "Func57431_";
#pragma aux (__cdecl) Func5747e "Func5747e_";
#pragma aux (__cdecl) Func574de "Func574de_";
#pragma aux (__cdecl) Func571e5 "Func571e5_";
#pragma aux (__cdecl) Func57110 "Func57110_";
#pragma aux (__cdecl) Func57194 "Func57194_";
#pragma aux (__cdecl) Func5716e "Func5716e_";
#pragma aux (__cdecl) Func57145 "Func57145_";
#pragma aux (__cdecl) Func56fdd "Func56fdd_";
#pragma aux (__cdecl) Func570ed "Func570ed_";
#pragma aux (__cdecl) Func5721a "Func5721a_";

void Func4dc7a(void)
{
}

int Func4dc8f(char *path, dword flags)
{
    int error;

    error = Func561b6();
    if (error) {
        return error;
    }
    Datac7e50 |= 1;
    if (path) {
        strcpy(Datac7e54, path);
    } else {
        Datac7e54[0] = 0;
    }
    return 0;
}

int Func4dceb(void)
{
    int error;

    error = Func56528();
    if (error) {
        return 0;
    }
    Datac7e50 &= ~1;
    return 0;
}

void Func4dd28(void)
{
}

void Func4dd3d(void)
{
}

int Func4dd52(SOSDRIVER *driver, dword *handle)
{
    dword index;
    dword i;
    int error;

    for (index = 0; index < 5; index++) {
        if (!Datac7f54[index]) {
            break;
        }
    }
    if (index == 6) {
        return 11;
    }
    Datac7f54[index] = driver;
    if (!driver->imaged8) {
        error = Func568e3(driver->field104, index, &driver->imagee0, &driver->imaged8, &driver->fieldfc, (byte *)&driver->fielde8, &driver->fieldec);
        if (error) {
            return error;
        }
        driver->samples = Func56bb5(0x1e00);
        driver->mix_buffer = Func56bb5(0x4000);
        driver->flags |= 2;
    }
    memset(driver->samples, 0, 0x1e00);
    error = Func56c90(index, &driver->field6c);
    if (error) {
        return error;
    }
    if (!driver->buffer) {
        driver->flags |= 4;
        if (!(driver->buffer = Func4e387(driver->field44, &driver->fieldf0, &driver->field100, &driver->buffer_pointer))) {
            Func56ac5(index);
            return 5;
        }
        if (driver->field90 == 8) {
            if (driver->fielda8 & 0x8000) {
                for (i = 0; i < driver->field44; i++) {
                    driver->buffer[i] = 0;
                }
            } else {
                for (i = 0; i < driver->field44; i++) {
                    driver->buffer[i] = 0x80;
                }
            }
        } else {
            for (i = 0; i < driver->field44; i++) {
                driver->buffer[i] = 0;
            }
        }
    }
    driver->field40 = driver->buffer + driver->field44;
    driver->field18 = Datac837c[driver->field64];
    driver->field28 = driver->buffer;
    driver->field4c = driver->mix_buffer + 0x4000;
    driver->field50 = 0x4000;
    driver->active = 0;
    driver->field54 = -1;
    driver->field2c = 0x400;
    driver->max_samples = 32;
    driver->field0c = driver->field90;
    driver->field08 = driver->field94 + 1;
    driver->field10 = 0x8000;
    driver->timer = Datac839c[index];
    driver->field1c = 0;
    driver->field20 = 0;
    driver->field24 = 0;
    if (driver->fielda8 & 0x200) {
        driver->callback = Func574de(driver->imagee0, driver->imaged8);
    }
    Func571e5(driver->field64);
    Func57110(driver->imagee0, driver->imaged8, driver->field5c, driver->field60, driver->field64, driver->field68, driver->field68, driver->field68);
    Func57194(driver->imagee0, driver->imaged8);
    Func5716e(driver->imagee0, driver->imaged8, driver->field04);
    Func57145(driver->imagee0, driver->imaged8, driver->fieldf0, driver->field44);
    driver->flags |= 1;
    *handle = index;
    return 0;
}

int Func4e1b5(dword handle, int free_buffer, int free_driver)
{
    SOSDRIVER *driver;

    driver = Datac7f54[handle];
    if (!driver) {
        return 10;
    }
    if (!(driver->flags & 2)) {
        return 1;
    }
    driver->active = 0;
    Func56fdd(driver->imagee0, driver->imaged8);
    Func570ed(driver->imagee0, driver->imaged8);
    Func5721a(driver->field64);
    if ((driver->flags & 4) && free_buffer) {
        driver->flags &= ~4;
        if ((Func57339() & 0xff) == 3) {
            Func4e56c(FP_SEG(driver->buffer_pointer), (dword)driver->field100, (dword)driver->fieldf0);
        } else {
            Func56f1c(FP_SEG(driver->buffer_pointer));
            driver->flags &= ~4;
        }
    }
    if ((driver->flags & 2) && free_driver) {
        Func56ac5(handle);
        driver->imaged8 = 0;
        driver->imagee0 = 0;
        Func56bf2(driver->mix_buffer);
        Func56bf2(driver->samples);
        driver->flags &= ~2;
    }
    Datac7f54[handle] = 0;
    driver->flags &= ~1;
    return 0;
}

byte *Func4e387(dword size, dword *physical, dword *handle, void __far **pointer)
{
    dword selector;

    if ((Func57339() & 0xff) == 3) {
        if (Func4e450(pointer, handle, physical)) {
            return 0;
        }
        Func56d2d(*(void **)pointer, size);
        return (byte *)*pointer;
    } else {
        Func56ee6((size >> 4) + 4, physical, &selector);
        while ((*physical & 0xffff) > 0xffff - size) {
            Func56ee6((size >> 4) + 4, physical, &selector);
        }
        *pointer = MK_FP(selector, 0);
        return (byte *)*physical;
    }
}

int Func4e450(void __far **pointer, dword *handle, dword *physical)
{
    dword memory_handle;
    dword reserved;
    dword memory_selector;
    dword __far *memory;
    dword physical_address = 0;
    int error = 0;
    void *linear;

    *pointer = 0;
    *handle = 0;
    *physical = 0;
    memory_handle = 0;
    if (Func57356(32, &memory_selector, &memory_handle)) {
        return 0;
    }
    memory = MK_FP(memory_selector, 0);
    *memory = 0x1000;
    error = Func573c5(memory_handle);
    _fmemcpy(Datac7f68, memory, 16);
    Func57397(memory_selector, memory_handle);
    if (!error) {
        Datac7f74 &= 0xfffff000;
        linear = Func5747e(Datac7f74);
        physical_address = Datac7f74;
        *pointer = MK_FP(0, (dword)linear);
        *physical = physical_address;
        return 0;
    } else {
        return 5;
    }
}

void Func4e56c(dword selector, dword handle, dword physical)
{
    void __far *memory;
    dword memory_selector;
    dword memory_handle;

    Func57356(32, &memory_selector, &memory_handle);
    memory = MK_FP(memory_selector, 0);
    _fmemcpy(memory, Datac7f68, 16);
    Func57431(memory_handle);
    Func57397(memory_selector, memory_handle);
}

void Func4e5dd(void)
{
    Func57539(Datac7f54[0]);
}

void Func4e600(void)
{
    Func57539(Datac7f54[1]);
}

void Func4e623(void)
{
    Func57539(Datac7f54[2]);
}

void Func4e646(void)
{
    Func57539(Datac7f54[3]);
}

void Func4e669(void)
{
    Func57539(Datac7f54[4]);
}

void Func4e68c(void)
{
}

void Func4e6a1(void)
{
}

dword Func4e6b6(dword handle, SOSSAMPLE *sample)
{
    dword index;
    SOSSAMPLE *tail;
    SOSDRIVER *driver;

    driver = Datac7f54[handle];
    if (!driver) {
        return 10;
    }
    for (index = 0; index < driver->max_samples; index++) {
        if (!(driver->samples[index].flags & 0x8000)) {
            break;
        }
    }
    if (index == driver->max_samples) {
        return -1;
    }
    memcpy(&driver->samples[index], sample, sizeof(SOSSAMPLE));
    driver->samples[index].current = sample->data;
    driver->samples[index].handle = index;
    tail = driver->active;
    if (!tail) {
        driver->samples[index].next = 0;
        driver->samples[index].flags |= 0x8000;
        driver->active = &driver->samples[index];
    } else {
        while (tail->next) {
            tail = tail->next;
        }
        driver->samples[index].next = 0;
        driver->samples[index].flags |= 0x8000;
        tail->next = &driver->samples[index];
    }
    return index;
}

dword Func4e836(dword handle, dword index)
{
    SOSDRIVER *driver;

    driver = Datac7f54[handle];
    if (!driver) {
        return 10;
    }
    if (!(driver->samples[index].flags & 0x8000)) {
        return 0;
    }
    driver->samples[index].flags |= 0x4000;
    return 0;
}

dword Func4e8a8(dword handle)
{
    SOSDRIVER *driver;
    dword index;

    driver = Datac7f54[handle];
    if (!driver) {
        return 10;
    }
    for (index = 0; index < driver->max_samples; index++) {
        driver->samples[index].flags |= 0x4000;
    }
    return 0;
}

void Func4e916(void)
{
}

void Func4e92b(void)
{
}

dword Func4e940(dword handle)
{
    SOSDRIVER *driver;

    driver = Datac7f54[handle];
    if (!driver) {
        return 10;
    }
    return driver->field1c;
}

dword Func4e982(dword handle, dword index, dword value)
{
    SOSDRIVER *driver;
    SOSSAMPLE *sample;
    dword old;

    driver = Datac7f54[handle];
    if (!driver) {
        return 10;
    }
    sample = &driver->samples[index];
    if (!sample) {
        return 10;
    }
    if (sample->flags & 0x8000) {
        old = sample->volume;
        sample->volume = value;
    } else {
        return 10;
    }
    return old;
}

dword Func4ea0a(dword handle, dword index)
{
    SOSDRIVER *driver;
    SOSSAMPLE *sample;

    driver = Datac7f54[handle];
    if (!driver) {
        return 10;
    }
    sample = &driver->samples[index];
    if (!sample) {
        return 10;
    }
    if (sample->flags & 0x8000) {
        return sample->volume;
    } else {
        return 10;
    }
}

dword Func4ea80(dword handle, dword index)
{
    SOSDRIVER *driver;
    SOSSAMPLE *sample;

    driver = Datac7f54[handle];
    if (!driver) {
        return 10;
    }
    sample = &driver->samples[index];
    if (!sample) {
        return 10;
    }
    if (sample->flags & 0x8000) {
        return sample->processed;
    } else {
        return 10;
    }
}

dword Func4eaf6(dword handle, dword index)
{
    SOSDRIVER *driver;
    SOSSAMPLE *sample;

    driver = Datac7f54[handle];
    if (!driver) {
        return 10;
    }
    sample = &driver->samples[index];
    if (!sample) {
        return 10;
    }
    if (sample->flags & 0x8000) {
        return sample->loop_count;
    } else {
        return 10;
    }
}

dword Func4eb6c(dword handle, dword index, dword value)
{
    SOSDRIVER *driver;
    SOSSAMPLE *sample;
    dword old;

    driver = Datac7f54[handle];
    if (!driver) {
        return 10;
    }
    sample = &driver->samples[index];
    if (!sample) {
        return 10;
    }
    if (sample->flags & 0x8000) {
        old = sample->pan;
        sample->pan = value;
        return old;
    } else {
        return 10;
    }
}

dword Func4ebf2(dword handle, dword index)
{
    SOSDRIVER *driver;
    SOSSAMPLE *sample;

    driver = Datac7f54[handle];
    if (!driver) {
        return 10;
    }
    sample = &driver->samples[index];
    if (!sample) {
        return 10;
    }
    if (sample->flags & 0x8000) {
        return sample->pan;
    } else {
        return 10;
    }
}

dword Func4ec68(dword handle, dword index, dword value)
{
    SOSDRIVER *driver;
    SOSSAMPLE *sample;
    dword old;

    driver = Datac7f54[handle];
    if (!driver) {
        return 10;
    }
    sample = &driver->samples[index];
    if (!sample) {
        return 10;
    }
    if (sample->flags & 0x8000) {
        old = sample->rate;
        sample->rate = value;
        return old;
    } else {
        return 10;
    }
}

dword Func4ecee(dword handle, dword index)
{
    SOSDRIVER *driver;
    SOSSAMPLE *sample;

    driver = Datac7f54[handle];
    if (!driver) {
        return 10;
    }
    sample = &driver->samples[index];
    if (!sample) {
        return 10;
    }
    if (sample->flags & 0x8000) {
        return sample->rate;
    } else {
        return 10;
    }
}

dword Func4ed64(dword handle, dword index)
{
    SOSDRIVER *driver;
    SOSSAMPLE *sample;

    driver = Datac7f54[handle];
    if (!driver) {
        return 10;
    }
    sample = &driver->samples[index];
    if (!sample) {
        return 10;
    }
    if (sample->flags & 0x8000) {
        return sample->pan_speed;
    } else {
        return 10;
    }
}

dword Func4edda(dword handle, dword index)
{
    SOSDRIVER *driver;
    SOSSAMPLE *sample;

    driver = Datac7f54[handle];
    if (!driver) {
        return 10;
    }
    sample = &driver->samples[index];
    if (!sample) {
        return 10;
    }
    return sample->id;
}

dword Func4ee3e(dword handle, dword id)
{
    SOSDRIVER *driver;
    dword index;

    driver = Datac7f54[handle];
    if (!driver) {
        return 10;
    }
    for (index = 0; index < driver->max_samples; index++) {
        if (driver->samples[index].id != id) {
            return driver->samples[index].handle;
        }
    }
    return -1;
}

dword Func4eec8(dword handle)
{
    SOSDRIVER *driver;

    driver = Datac7f54[handle];
    if (!driver) {
        return 10;
    }
    return driver->field54;
}

dword Func4ef0a(dword handle, dword index)
{
    SOSDRIVER *driver;
    SOSSAMPLE *sample;

    driver = Datac7f54[handle];
    if (!driver) {
        return 10;
    }
    sample = &driver->samples[index];
    if (!sample) {
        return 10;
    }
    return !(sample->flags & 0x8000);
}

void Func4ef84(void)
{
}

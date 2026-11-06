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
    dword sample_rate;
    dword output_channels;
    dword output_bits;
    dword output_format;
    dword max_samples;
    dword dma_count_port;
    dword dma_position;
    dword last_dma_position;
    dword bytes_to_mix;
    byte *write_cursor;
    dword write_ahead_bytes;
    SOSSAMPLE *active;
    void __far *callback;
    word reserved3a;
    byte *buffer;
    byte *buffer_end;
    dword buffer_size;
    byte *mix_buffer;
    byte *mix_buffer_limit;
    dword mix_buffer_size;
    dword active_samples;
    SOSSAMPLE *samples;
    dword port;
    dword irq;
    dword dma;
    dword hardware;
    dword driver_name_word0;
    dword driver_name_word1;
    dword driver_name_word2;
    dword driver_name_word3;
    dword driver_name_word4;
    dword driver_name_word5;
    dword driver_name_word6;
    dword driver_name_word7;
    dword unused_info_word0;
    dword driver_bits;
    dword stereo_mode;
    dword min_sample_rate;
    dword max_sample_rate;
    dword unused_info_word1;
    dword unused_info_word2;
    dword capabilities;
    dword port_choices_offset;
    dword port_choices_selector;
    dword dma_choices_offset;
    dword dma_choices_selector;
    dword irq_choices_offset;
    dword irq_choices_selector;
    dword aux_choices_offset;
    dword aux_choices_selector;
    dword unused_info_word3;
    dword driver_info_id;
    dword unused_info_word4;
    void __far *image;
    word reservedde;
    void __far *entry_point;
    word reservede6;
    dword locked_size;
    dword locked_buffer;
    dword dma_physical_address;
    void __far *buffer_pointer;
    word reservedfa;
    dword image_memory_handle;
    dword dma_memory_handle;
    dword driver_id;
    void (*timer)(void);
} SOSDRIVER;
#pragma pack()

extern dword sos_digi_flags;
extern char sos_driver_directory[];
extern SOSDRIVER *sos_drivers[];
extern dword sos_dma_count_ports[];
extern void (*sos_driver_mix_callbacks[])(void);
extern dword sos_vds_buffer_descriptor[];
extern dword sos_vds_buffer_physical_address;
int sosLockSystem(void);
int sosUnlockSystem(void);
void __cdecl sosMIXUpdateDriver(SOSDRIVER *driver);
#pragma aux (__cdecl) sosMIXUpdateDriver "sosMIXUpdateDriver_";

int sosLoadDriver(dword id, dword handle, void __far **data, void __far **image, dword *flags, byte *format, dword *base);
int sosUnloadDriver(dword handle);
void *sosAllocate(dword size);
void sosFree(void *pointer);
int sosGetDriverConfig(dword handle, void *config);
byte *sosDIGIAllocateDMABuffer(dword size, dword *physical, dword *handle, void __far **pointer);
int sosDIGIAllocateVDSBuffer(void __far **pointer, dword *handle, dword *physical);
void sosDIGIFreeVDSBuffer(dword selector, dword handle, dword physical);
dword __cdecl sosGetWindowsVersion(void);
int __cdecl sosDPMILockMemory(void *begin, dword size);
int __cdecl sosDPMIAllocateDOSBuffer(dword size, dword *physical, dword *selector);
int __cdecl sosDPMIFreeDOSBuffer(dword selector);
int __cdecl sosDPMIAllocateDOSMemory(dword size, dword *selector, dword *handle);
int __cdecl sosDPMIFreeDOSMemory(dword selector, dword handle);
int __cdecl sosVDSLockBuffer(dword handle);
int __cdecl sosVDSUnlockBuffer(dword handle);
void *__cdecl sosDPMIMapPhysicalMemory(dword physical);
void __far *__cdecl sosDRIVERGetDMAPositionCallback(void __far *data, void __far *image);
void __cdecl sosVDSDisableDMATranslation(dword dma);
void __cdecl sosDRIVERInit(void __far *data, void __far *image, dword port, dword irq, dword dma, dword a, dword b, dword c);
void __cdecl sosDRIVERSetSampleSize(void __far *data, void __far *image);
void __cdecl sosDRIVERSetRate(void __far *data, void __far *image, dword rate);
void __cdecl sosDRIVERSetBuffer(void __far *data, void __far *image, dword physical, dword size);
void __cdecl sosDRIVERStop(void __far *data, void __far *image);
void __cdecl sosDRIVERUninit(void __far *data, void __far *image);
void __cdecl sosVDSEnableDMATranslation(dword dma);
#pragma aux (__cdecl) sosGetWindowsVersion "sosGetWindowsVersion_";
#pragma aux (__cdecl) sosDPMILockMemory "sosDPMILockMemory_";
#pragma aux (__cdecl) sosDPMIAllocateDOSBuffer "sosDPMIAllocateDOSBuffer_";
#pragma aux (__cdecl) sosDPMIFreeDOSBuffer "sosDPMIFreeDOSBuffer_";
#pragma aux (__cdecl) sosDPMIAllocateDOSMemory "sosDPMIAllocateDOSMemory_";
#pragma aux (__cdecl) sosDPMIFreeDOSMemory "sosDPMIFreeDOSMemory_";
#pragma aux (__cdecl) sosVDSLockBuffer "sosVDSLockBuffer_";
#pragma aux (__cdecl) sosVDSUnlockBuffer "sosVDSUnlockBuffer_";
#pragma aux (__cdecl) sosDPMIMapPhysicalMemory "sosDPMIMapPhysicalMemory_";
#pragma aux (__cdecl) sosDRIVERGetDMAPositionCallback "sosDRIVERGetDMAPositionCallback_";
#pragma aux (__cdecl) sosVDSDisableDMATranslation "sosVDSDisableDMATranslation_";
#pragma aux (__cdecl) sosDRIVERInit "sosDRIVERInit_";
#pragma aux (__cdecl) sosDRIVERSetSampleSize "sosDRIVERSetSampleSize_";
#pragma aux (__cdecl) sosDRIVERSetRate "sosDRIVERSetRate_";
#pragma aux (__cdecl) sosDRIVERSetBuffer "sosDRIVERSetBuffer_";
#pragma aux (__cdecl) sosDRIVERStop "sosDRIVERStop_";
#pragma aux (__cdecl) sosDRIVERUninit "sosDRIVERUninit_";
#pragma aux (__cdecl) sosVDSEnableDMATranslation "sosVDSEnableDMATranslation_";

void sosDIGISystemCodeStart(void)
{
}

int sosDIGIInitSystem(char *path, dword flags)
{
    int error;

    error = sosLockSystem();
    if (error) {
        return error;
    }
    sos_digi_flags |= 1;
    if (path) {
        strcpy(sos_driver_directory, path);
    } else {
        sos_driver_directory[0] = 0;
    }
    return 0;
}

int sosDIGIUninitSystem(void)
{
    int error;

    error = sosUnlockSystem();
    if (error) {
        return 0;
    }
    sos_digi_flags &= ~1;
    return 0;
}

void sosDIGISystemCodeEnd(void)
{
}

void sosDIGIDriverCodeStart(void)
{
}

int sosDIGIInitDriver(SOSDRIVER *driver, dword *handle)
{
    dword index;
    dword i;
    int error;

    for (index = 0; index < 5; index++) {
        if (!sos_drivers[index]) {
            break;
        }
    }
    if (index == 6) {
        return 11;
    }
    sos_drivers[index] = driver;
    if (!driver->image) {
        error = sosLoadDriver(driver->driver_id, index, &driver->entry_point, &driver->image, &driver->image_memory_handle, (byte *)&driver->locked_size, &driver->locked_buffer);
        if (error) {
            return error;
        }
        driver->samples = sosAllocate(0x1e00);
        driver->mix_buffer = sosAllocate(0x4000);
        driver->flags |= 2;
    }
    memset(driver->samples, 0, 0x1e00);
    error = sosGetDriverConfig(index, &driver->driver_name_word0);
    if (error) {
        return error;
    }
    if (!driver->buffer) {
        driver->flags |= 4;
        if (!(driver->buffer = sosDIGIAllocateDMABuffer(driver->buffer_size, &driver->dma_physical_address, &driver->dma_memory_handle, &driver->buffer_pointer))) {
            sosUnloadDriver(index);
            return 5;
        }
        if (driver->driver_bits == 8) {
            if (driver->capabilities & 0x8000) {
                for (i = 0; i < driver->buffer_size; i++) {
                    driver->buffer[i] = 0;
                }
            } else {
                for (i = 0; i < driver->buffer_size; i++) {
                    driver->buffer[i] = 0x80;
                }
            }
        } else {
            for (i = 0; i < driver->buffer_size; i++) {
                driver->buffer[i] = 0;
            }
        }
    }
    driver->buffer_end = driver->buffer + driver->buffer_size;
    driver->dma_count_port = sos_dma_count_ports[driver->dma];
    driver->write_cursor = driver->buffer;
    driver->mix_buffer_limit = driver->mix_buffer + 0x4000;
    driver->mix_buffer_size = 0x4000;
    driver->active = 0;
    driver->active_samples = -1;
    driver->write_ahead_bytes = 0x400;
    driver->max_samples = 32;
    driver->output_bits = driver->driver_bits;
    driver->output_channels = driver->stereo_mode + 1;
    driver->output_format = 0x8000;
    driver->timer = sos_driver_mix_callbacks[index];
    driver->dma_position = 0;
    driver->last_dma_position = 0;
    driver->bytes_to_mix = 0;
    if (driver->capabilities & 0x200) {
        driver->callback = sosDRIVERGetDMAPositionCallback(driver->entry_point, driver->image);
    }
    sosVDSDisableDMATranslation(driver->dma);
    sosDRIVERInit(driver->entry_point, driver->image, driver->port, driver->irq, driver->dma, driver->hardware, driver->hardware, driver->hardware);
    sosDRIVERSetSampleSize(driver->entry_point, driver->image);
    sosDRIVERSetRate(driver->entry_point, driver->image, driver->sample_rate);
    sosDRIVERSetBuffer(driver->entry_point, driver->image, driver->dma_physical_address, driver->buffer_size);
    driver->flags |= 1;
    *handle = index;
    return 0;
}

int sosDIGIUninitDriver(dword handle, int free_buffer, int free_driver)
{
    SOSDRIVER *driver;

    driver = sos_drivers[handle];
    if (!driver) {
        return 10;
    }
    if (!(driver->flags & 2)) {
        return 1;
    }
    driver->active = 0;
    sosDRIVERStop(driver->entry_point, driver->image);
    sosDRIVERUninit(driver->entry_point, driver->image);
    sosVDSEnableDMATranslation(driver->dma);
    if ((driver->flags & 4) && free_buffer) {
        driver->flags &= ~4;
        if ((sosGetWindowsVersion() & 0xff) == 3) {
            sosDIGIFreeVDSBuffer(FP_SEG(driver->buffer_pointer), (dword)driver->dma_memory_handle, (dword)driver->dma_physical_address);
        } else {
            sosDPMIFreeDOSBuffer(FP_SEG(driver->buffer_pointer));
            driver->flags &= ~4;
        }
    }
    if ((driver->flags & 2) && free_driver) {
        sosUnloadDriver(handle);
        driver->image = 0;
        driver->entry_point = 0;
        sosFree(driver->mix_buffer);
        sosFree(driver->samples);
        driver->flags &= ~2;
    }
    sos_drivers[handle] = 0;
    driver->flags &= ~1;
    return 0;
}

byte *sosDIGIAllocateDMABuffer(dword size, dword *physical, dword *handle, void __far **pointer)
{
    dword selector;

    if ((sosGetWindowsVersion() & 0xff) == 3) {
        if (sosDIGIAllocateVDSBuffer(pointer, handle, physical)) {
            return 0;
        }
        sosDPMILockMemory(*(void **)pointer, size);
        return (byte *)*pointer;
    } else {
        sosDPMIAllocateDOSBuffer((size >> 4) + 4, physical, &selector);
        while ((*physical & 0xffff) > 0xffff - size) {
            sosDPMIAllocateDOSBuffer((size >> 4) + 4, physical, &selector);
        }
        *pointer = MK_FP(selector, 0);
        return (byte *)*physical;
    }
}

int sosDIGIAllocateVDSBuffer(void __far **pointer, dword *handle, dword *physical)
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
    if (sosDPMIAllocateDOSMemory(32, &memory_selector, &memory_handle)) {
        return 0;
    }
    memory = MK_FP(memory_selector, 0);
    *memory = 0x1000;
    error = sosVDSLockBuffer(memory_handle);
    _fmemcpy(sos_vds_buffer_descriptor, memory, 16);
    sosDPMIFreeDOSMemory(memory_selector, memory_handle);
    if (!error) {
        sos_vds_buffer_physical_address &= 0xfffff000;
        linear = sosDPMIMapPhysicalMemory(sos_vds_buffer_physical_address);
        physical_address = sos_vds_buffer_physical_address;
        *pointer = MK_FP(0, (dword)linear);
        *physical = physical_address;
        return 0;
    } else {
        return 5;
    }
}

void sosDIGIFreeVDSBuffer(dword selector, dword handle, dword physical)
{
    void __far *memory;
    dword memory_selector;
    dword memory_handle;

    sosDPMIAllocateDOSMemory(32, &memory_selector, &memory_handle);
    memory = MK_FP(memory_selector, 0);
    _fmemcpy(memory, sos_vds_buffer_descriptor, 16);
    sosVDSUnlockBuffer(memory_handle);
    sosDPMIFreeDOSMemory(memory_selector, memory_handle);
}

void sosDIGIMixDriver0(void)
{
    sosMIXUpdateDriver(sos_drivers[0]);
}

void sosDIGIMixDriver1(void)
{
    sosMIXUpdateDriver(sos_drivers[1]);
}

void sosDIGIMixDriver2(void)
{
    sosMIXUpdateDriver(sos_drivers[2]);
}

void sosDIGIMixDriver3(void)
{
    sosMIXUpdateDriver(sos_drivers[3]);
}

void sosDIGIMixDriver4(void)
{
    sosMIXUpdateDriver(sos_drivers[4]);
}

void sosDIGIDriverCodeEnd(void)
{
}

void sosDIGISampleCodeStart(void)
{
}

dword sosDIGIStartSample(dword handle, SOSSAMPLE *sample)
{
    dword index;
    SOSSAMPLE *tail;
    SOSDRIVER *driver;

    driver = sos_drivers[handle];
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

dword sosDIGIStopSample(dword handle, dword index)
{
    SOSDRIVER *driver;

    driver = sos_drivers[handle];
    if (!driver) {
        return 10;
    }
    if (!(driver->samples[index].flags & 0x8000)) {
        return 0;
    }
    driver->samples[index].flags |= 0x4000;
    return 0;
}

dword sosDIGIStopAllSamples(dword handle)
{
    SOSDRIVER *driver;
    dword index;

    driver = sos_drivers[handle];
    if (!driver) {
        return 10;
    }
    for (index = 0; index < driver->max_samples; index++) {
        driver->samples[index].flags |= 0x4000;
    }
    return 0;
}

void sosDIGISampleCodeEnd(void)
{
}

void sosDIGIQueryCodeStart(void)
{
}

dword sosDIGIGetBufferPosition(dword handle)
{
    SOSDRIVER *driver;

    driver = sos_drivers[handle];
    if (!driver) {
        return 10;
    }
    return driver->dma_position;
}

dword sosDIGISetSampleVolume(dword handle, dword index, dword value)
{
    SOSDRIVER *driver;
    SOSSAMPLE *sample;
    dword old;

    driver = sos_drivers[handle];
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

dword sosDIGIGetSampleVolume(dword handle, dword index)
{
    SOSDRIVER *driver;
    SOSSAMPLE *sample;

    driver = sos_drivers[handle];
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

dword sosDIGIGetBytesProcessed(dword handle, dword index)
{
    SOSDRIVER *driver;
    SOSSAMPLE *sample;

    driver = sos_drivers[handle];
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

dword sosDIGIGetSampleLoopCount(dword handle, dword index)
{
    SOSDRIVER *driver;
    SOSSAMPLE *sample;

    driver = sos_drivers[handle];
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

dword sosDIGISetSamplePan(dword handle, dword index, dword value)
{
    SOSDRIVER *driver;
    SOSSAMPLE *sample;
    dword old;

    driver = sos_drivers[handle];
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

dword sosDIGIGetSamplePan(dword handle, dword index)
{
    SOSDRIVER *driver;
    SOSSAMPLE *sample;

    driver = sos_drivers[handle];
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

dword sosDIGISetSampleRate(dword handle, dword index, dword value)
{
    SOSDRIVER *driver;
    SOSSAMPLE *sample;
    dword old;

    driver = sos_drivers[handle];
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

dword sosDIGIGetSampleRate(dword handle, dword index)
{
    SOSDRIVER *driver;
    SOSSAMPLE *sample;

    driver = sos_drivers[handle];
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

dword sosDIGIGetSamplePanSpeed(dword handle, dword index)
{
    SOSDRIVER *driver;
    SOSSAMPLE *sample;

    driver = sos_drivers[handle];
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

dword sosDIGIGetSampleID(dword handle, dword index)
{
    SOSDRIVER *driver;
    SOSSAMPLE *sample;

    driver = sos_drivers[handle];
    if (!driver) {
        return 10;
    }
    sample = &driver->samples[index];
    if (!sample) {
        return 10;
    }
    return sample->id;
}

dword sosDIGIFindDifferentSample(dword handle, dword id)
{
    SOSDRIVER *driver;
    dword index;

    driver = sos_drivers[handle];
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

dword sosDIGIGetActiveSampleCount(dword handle)
{
    SOSDRIVER *driver;

    driver = sos_drivers[handle];
    if (!driver) {
        return 10;
    }
    return driver->active_samples;
}

dword sosDIGISampleDone(dword handle, dword index)
{
    SOSDRIVER *driver;
    SOSSAMPLE *sample;

    driver = sos_drivers[handle];
    if (!driver) {
        return 10;
    }
    sample = &driver->samples[index];
    if (!sample) {
        return 10;
    }
    return !(sample->flags & 0x8000);
}

void sosDIGIQueryCodeEnd(void)
{
}

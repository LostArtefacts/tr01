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
    short __far *dma_choices;
    byte reserved3[0x16];
    dword device_id;
    byte reserved4[0x30];
    dword loaded_device_id;
} SOSDRIVER;

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
#pragma pack()

extern dword sos_detect_flags;
extern char sos_detect_filename[128];
extern SOSFILEHEADER sos_detect_file_header;
extern SOSFILEENTRY sos_detect_file_entry;
extern byte sos_detect_driver_info[0x6c];
extern byte *sos_detect_current_info;
extern void __far *sos_detect_image_offset;
extern void __far *sos_detect_data_offset;
extern int sos_detect_file_handle;
extern dword sos_detect_driver_file_offset;
extern dword sos_detect_entry_index;
extern dword sos_detect_memory_handle;
extern dword sos_detect_linear_base;
extern char *sos_error_messages[];
extern dword sos_detect_port;
extern dword sos_detect_dma;
extern dword sos_detect_irq;
extern dword sos_detect_hardware;

void __far *__cdecl sosDPMIAllocateLinearMemory(dword, dword *, dword *);
void __far *__cdecl sosDPMICreateCodeAlias(void __far *);
int __cdecl sosDPMILockMemory(void *, dword);
int __cdecl sosDPMIUnlockMemory(void *, dword);
void __cdecl sosDPMIFreeLinearMemory(void __far *, dword);
dword __cdecl sosDETECTProbe(void __far *, void __far *);
void __cdecl sosDETECTProbeSettings(void __far *, void __far *);
void __cdecl sosDETECTGetDriverInfo(void __far *, void __far *, void *);
dword __cdecl sosDETECTTestSettings(void __far *, dword, dword, dword, void __far *);
void __cdecl sosVDSDisableDMATranslation(dword);
void __cdecl sosVDSEnableDMATranslation(dword);
void __cdecl sosDETECTGetEnvironmentTables(void __far *, void __far *);
char *__cdecl sosDETECTGetEnvironmentName(dword);
void __cdecl sosDETECTSetEnvironmentValue(dword, char *);
#pragma aux (__cdecl) sosDPMIAllocateLinearMemory "sosDPMIAllocateLinearMemory_";
#pragma aux (__cdecl) sosDPMICreateCodeAlias "sosDPMICreateCodeAlias_";
#pragma aux (__cdecl) sosDPMILockMemory "sosDPMILockMemory_";
#pragma aux (__cdecl) sosDPMIUnlockMemory "sosDPMIUnlockMemory_";
#pragma aux (__cdecl) sosDPMIFreeLinearMemory "sosDPMIFreeLinearMemory_";
#pragma aux (__cdecl) sosDETECTProbe "sosDETECTProbe_";
#pragma aux (__cdecl) sosDETECTProbeSettings "sosDETECTProbeSettings_";
#pragma aux (__cdecl) sosDETECTGetDriverInfo "sosDETECTGetDriverInfo_";
#pragma aux (__cdecl) sosDETECTTestSettings "sosDETECTTestSettings_";
#pragma aux (__cdecl) sosVDSDisableDMATranslation "sosVDSDisableDMATranslation_";
#pragma aux (__cdecl) sosVDSEnableDMATranslation "sosVDSEnableDMATranslation_";
#pragma aux (__cdecl) sosDETECTGetEnvironmentTables "sosDETECTGetEnvironmentTables_";
#pragma aux (__cdecl) sosDETECTGetEnvironmentName "sosDETECTGetEnvironmentName_";
#pragma aux (__cdecl) sosDETECTSetEnvironmentValue "sosDETECTSetEnvironmentValue_";

void sosDETECTCodeStart(void)
{
}

int sosDETECTInit(char *path)
{
    dword index;
    dword size;

    if (sos_detect_flags & 1) {
        return 3;
    }
    if (path) {
        strcpy(sos_detect_filename, path);
        strcat(sos_detect_filename, "hmidet.386");
    } else {
        strcpy(sos_detect_filename, "hmidet.386");
    }
    sos_detect_file_handle = open(sos_detect_filename, 0x200);
    if (sos_detect_file_handle == -1) {
        return 15;
    }
    read(sos_detect_file_handle, &sos_detect_file_header, sizeof(SOSFILEHEADER));
    sos_detect_image_offset = sosDPMIAllocateLinearMemory(0x1000, &sos_detect_memory_handle, &sos_detect_linear_base);
    if (sos_detect_image_offset == 0) {
        return 5;
    }
    sos_detect_data_offset = sosDPMICreateCodeAlias(sos_detect_image_offset);
    if (sosDPMILockMemory((void *)sos_detect_linear_base, 0x1000)) {
        return 5;
    }
    _lseek(sos_detect_file_handle, 0, 0);
    sos_detect_flags |= 1;
    return 0;
}

int sosDETECTUninit(void)
{
    sos_detect_flags &= ~1;
    close(sos_detect_file_handle);
    if (sosDPMIUnlockMemory((void *)sos_detect_linear_base, 0x1000)) {
        return 5;
    }
    sosDPMIFreeLinearMemory(sos_detect_image_offset, sos_detect_memory_handle);
    sosDPMIFreeLinearMemory(sos_detect_data_offset, sos_detect_memory_handle);
    return 0;
}

int sosDETECTFindHardware(dword id, SOSDRIVER *driver)
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
    sos_detect_entry_index = 0;
    _lseek(sos_detect_file_handle, 0, 0);
    read(sos_detect_file_handle, &sos_detect_file_header, sizeof(SOSFILEHEADER));
    while (sos_detect_entry_index <= sos_detect_file_header.count && !found) {
        position = _lseek(sos_detect_file_handle, 0, 1);
        read(sos_detect_file_handle, &sos_detect_file_entry, sizeof(SOSFILEENTRY));
        size = sos_detect_file_entry.size;
        if (sos_detect_file_entry.id == id && (sos_detect_file_entry.flags & 0x8000)) {
            found = 1;
            _dos_read(sos_detect_file_handle, sos_detect_image_offset, size, &bytes_read);
        } else {
            _lseek(sos_detect_file_handle, size, 1);
        }
        sos_detect_entry_index++;
    }
    if (found) {
        sosDETECTGetDriverInfo(sos_detect_data_offset, sos_detect_image_offset, sos_detect_driver_info);
        if (sos_detect_driver_info[0x3d] & 1) {
            sosDETECTGetEnvironmentTables(sos_detect_data_offset, sos_detect_image_offset);
            env_index = 0;
            while (sosDETECTGetEnvironmentName(env_index)) {
                env = getenv(sosDETECTGetEnvironmentName(env_index));
                sosDETECTSetEnvironmentValue(env_index, env);
                env_index++;
            }
        }
        port = sosDETECTProbe(sos_detect_data_offset, sos_detect_image_offset);
        if (port) {
            sosDETECTGetDriverInfo(sos_detect_data_offset, sos_detect_image_offset, driver->info);
            sos_detect_current_info = driver->info;
            driver->port = port;
            driver->loaded_device_id = driver->device_id;
            sos_detect_driver_file_offset = position;
            return 0;
        } else {
            return 8;
        }
    } else {
        return 7;
    }
}

int sosDETECTLoadDriverInfo(dword id, SOSDRIVER *driver)
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
    sos_detect_entry_index = 0;
    _lseek(sos_detect_file_handle, 0, 0);
    read(sos_detect_file_handle, &sos_detect_file_header, sizeof(SOSFILEHEADER));
    while (sos_detect_entry_index <= sos_detect_file_header.count && !found) {
        position = _lseek(sos_detect_file_handle, 0, 1);
        read(sos_detect_file_handle, &sos_detect_file_entry, sizeof(SOSFILEENTRY));
        size = sos_detect_file_entry.size;
        if (sos_detect_file_entry.id == id && (sos_detect_file_entry.flags & 0x8000)) {
            found = 1;
            _dos_read(sos_detect_file_handle, sos_detect_image_offset, size, &bytes_read);
        } else {
            _lseek(sos_detect_file_handle, size, 1);
        }
        sos_detect_entry_index++;
    }
    if (found) {
        sosDETECTGetDriverInfo(sos_detect_data_offset, sos_detect_image_offset, driver->info);
        sos_detect_current_info = driver->info;
        sos_detect_driver_file_offset = position;
        return 0;
    } else {
        return 7;
    }
}

int sosDETECTFindFirst(SOSDRIVER *driver)
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
    sos_detect_entry_index = 0;
    _lseek(sos_detect_file_handle, 0, 0);
    read(sos_detect_file_handle, &sos_detect_file_header, sizeof(SOSFILEHEADER));
    while (sos_detect_entry_index <= sos_detect_file_header.count && !found) {
        position = _lseek(sos_detect_file_handle, 0, 1);
        read(sos_detect_file_handle, &sos_detect_file_entry, sizeof(SOSFILEENTRY));
        size = sos_detect_file_entry.size;
        if (sos_detect_file_entry.flags & 0x8000) {
            _dos_read(sos_detect_file_handle, sos_detect_image_offset, size, &bytes_read);
            sosDETECTGetDriverInfo(sos_detect_data_offset, sos_detect_image_offset, sos_detect_driver_info);
            if (sos_detect_driver_info[0x3d] & 1) {
                sosDETECTGetEnvironmentTables(sos_detect_data_offset, sos_detect_image_offset);
                env_index = 0;
                while (sosDETECTGetEnvironmentName(env_index)) {
                    env = getenv(sosDETECTGetEnvironmentName(env_index));
                    sosDETECTSetEnvironmentValue(env_index, env);
                    env_index++;
                }
            }
            port = sosDETECTProbe(sos_detect_data_offset, sos_detect_image_offset);
            if (port) {
                sos_detect_driver_file_offset = position;
                sosDETECTGetDriverInfo(sos_detect_data_offset, sos_detect_image_offset, driver->info);
                sos_detect_current_info = driver->info;
                driver->port = port;
                driver->loaded_device_id = driver->device_id;
                return 0;
            }
        } else {
            _lseek(sos_detect_file_handle, size, 1);
        }
        sos_detect_entry_index++;
    }
    return 7;
}

int sosDETECTFindNext(SOSDRIVER *driver)
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
    while (sos_detect_entry_index <= sos_detect_file_header.count && !found) {
        position = _lseek(sos_detect_file_handle, 0, 1);
        read(sos_detect_file_handle, &sos_detect_file_entry, sizeof(SOSFILEENTRY));
        size = sos_detect_file_entry.size;
        if (sos_detect_file_entry.flags & 0x8000) {
            _dos_read(sos_detect_file_handle, sos_detect_image_offset, size, &bytes_read);
            sosDETECTGetDriverInfo(sos_detect_data_offset, sos_detect_image_offset, sos_detect_driver_info);
            if (sos_detect_driver_info[0x3d] & 1) {
                sosDETECTGetEnvironmentTables(sos_detect_data_offset, sos_detect_image_offset);
                env_index = 0;
                while (sosDETECTGetEnvironmentName(env_index)) {
                    env = getenv(sosDETECTGetEnvironmentName(env_index));
                    sosDETECTSetEnvironmentValue(env_index, env);
                    env_index++;
                }
            }
            port = sosDETECTProbe(sos_detect_data_offset, sos_detect_image_offset);
            if (port) {
                sos_detect_driver_file_offset = position;
                sosDETECTGetDriverInfo(sos_detect_data_offset, sos_detect_image_offset, driver->info);
                sos_detect_current_info = driver->info;
                driver->port = port;
                driver->loaded_device_id = driver->device_id;
                return 0;
            }
        } else {
            _lseek(sos_detect_file_handle, size, 1);
        }
        sos_detect_entry_index++;
    }
    return 7;
}

int sosDETECTGetSettings(SOSDRIVER *driver)
{
    dword index;

    if (!driver) {
        return 2;
    }
    _lseek(sos_detect_file_handle, sos_detect_driver_file_offset, 0);
    index = 0;
    while ((word)driver->dma_choices[index] != 0xffff) {
        sosVDSDisableDMATranslation(driver->dma_choices[index]);
        index++;
    }
    sosDETECTProbeSettings(sos_detect_data_offset, sos_detect_image_offset);
    index = 0;
    while ((word)driver->dma_choices[index] != 0xffff) {
        sosVDSEnableDMATranslation(driver->dma_choices[index]);
        index++;
    }
    driver->port = sos_detect_port;
    driver->dma = sos_detect_dma;
    driver->irq = sos_detect_irq;
    driver->hardware = sos_detect_hardware;
    if (!(driver->flags & 1)) {
        if (sos_detect_irq > 1 && sos_detect_irq < 16) {
            return 0;
        } else {
            return 17;
        }
    } else {
        return 0;
    }
}

int sosDETECTVerifySettings(SOSDRIVER *driver)
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
    sosVDSDisableDMATranslation(driver->dma);
    result = sosDETECTTestSettings(sos_detect_data_offset, port, irq, dma, sos_detect_image_offset);
    sosVDSEnableDMATranslation(driver->dma);
    return result;
}

void sosDETECTCodeEnd(void)
{
}

void sosERRORCodeStart(void)
{
}

char *sosGetErrorString(dword error)
{
    return sos_error_messages[error];
}

void sosERRORCodeEnd(void)
{
}

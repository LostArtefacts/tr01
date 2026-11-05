#include <stdio.h>
#include <stdlib.h>
#include <string.h>

typedef unsigned char byte;
typedef unsigned short word;
typedef unsigned long dword;

#pragma pack(1)
typedef struct
{
    dword dwFlags;
    byte szName[128];
    char *pData;
    dword dwSize;
    dword dwMaxSize;
    char *pCurrent;
    dword dwCurrent;
    char *pSection;
    char *pItemPtr;
    char *pItem;
    char *pList;
    char *pListPtr;
} _INI_INSTANCE;

typedef struct
{
    byte *pData;
    dword dwBytes;
    dword dwSamples;
    dword dwBytesPerSample;
    dword dwBitsPerSample;
    dword dwChannels;
} SampleInfo;
#pragma pack()

typedef struct _SOS_SAMPLE
{
    byte *pSample;
    byte *pSampleCurrent;
    byte *pSampleLoop;
    dword wLength;
    dword wLoopLength;
    dword wLoopEndLength;
    dword wLoopStage;
    dword wID;
    dword wFlags;
    dword wPriority;
    dword hSample;
    dword wVolume;
    dword wLoopCount;
    dword wRate;
    dword wBitsPerSample;
    dword wChannels;
    dword wFormat;
    dword wPanPosition;
    dword wPanSpeed;
    dword wPanStart;
    dword wPanEnd;
    dword wPanMode;
    dword wTotalBytesProcessed;
    void (__cdecl *pfnSampleProcessed)(struct _SOS_SAMPLE *);
    void (__cdecl *pfnSampleDone)(struct _SOS_SAMPLE *);
    void (__cdecl *pfnSampleLoop)(struct _SOS_SAMPLE *);
    dword wSystem[16];
    byte *pBuffer;
    dword dwBytesPerSample;
    FILE *pFile;
    dword dwHalf;
    dword dwStreamLength;
    dword dwStreamPos;
    dword dwRefill;
    dword dwDataOffset;
    dword wUser[8];
    struct _SOS_SAMPLE *pLink;
    struct _SOS_SAMPLE *pNext;
} SOS_SAMPLE;

typedef struct
{
    dword wFlags;
    dword wDriverRate;
    dword wDriverChannels;
    dword wDriverBitsPerSample;
    dword wReserved1[13];
    dword wDMABufferSize;
    dword wReserved2[4];
    SOS_SAMPLE *pSamples;
    dword wPort;
    dword wIRQ;
    dword wDMA;
    dword wReserved3[39];
    dword wID;
    void (*pfnTimer)(void);
} SOS_DIGI_DRIVER;

extern int file_len;

byte *FileLoad(char *name, void *where, dword flags);
int Func4d170(_INI_INSTANCE *ini, char *name);
int Func4d224(_INI_INSTANCE *ini);
int Func4d258(_INI_INSTANCE *ini, char *section);
int Func4d7d8(_INI_INSTANCE *ini, char *item, dword *value);
dword Func4dc8f(char *path, dword flags);
dword Func4dceb(void);
dword Func4dd52(SOS_DIGI_DRIVER *driver, dword *handle);
dword Func4e1b5(dword handle, dword close, dword unload);
dword Func4e6b6(dword handle, SOS_SAMPLE *sample);
dword Func4e836(dword handle, dword sample);
dword Func4e982(dword handle, dword sample, dword volume);
dword Func4eb6c(dword handle, dword sample, dword pan);
dword Func4ec68(dword handle, dword sample, dword rate);
dword Func4ecee(dword handle, dword sample);
SOS_SAMPLE *Func4edda(dword handle, dword sample);
dword Func4eec8(dword handle);
dword Func4ef0a(dword handle, dword sample);
dword sosTIMERRegisterEvent(dword rate, void (*event)(void), dword *handle);
dword sosTIMERRemoveEvent(dword handle);

int midi_inst = 0;
int digi_inst = 0;
char setup_path[] = "";
char *GpSetupFilePath = setup_path;

dword digi_unused[3];
SOS_DIGI_DRIVER sound_drv;
int digi_count;
dword digi_device;
dword sound_handle;
dword digi_bytes;
SOS_SAMPLE **digi_sample_list;
dword sound_timer_handle;
int digi_ready;
int sound_extra;
int sound_spare;

void DisableInterrupts(void);
#pragma aux DisableInterrupts = 0xfa;
void EnableInterrupts(void);
#pragma aux EnableInterrupts = 0xfb;

void SoundStopAllSamples(void);
void SoundFreeSamples(void);
void __cdecl Func48e14(SOS_SAMPLE *s);

int Func48300(char *name)
{
    _INI_INSTANCE ini;
    char path[144];

    digi_device = -1;
    strcpy(path, GpSetupFilePath);
    strcat(path, name);
    memset(&sound_drv, 0, sizeof(sound_drv));
    if (!Func4d170(&ini, path)) {
        return 0;
    }
    if (!Func4d258(&ini, "DIGITAL")
        || !Func4d7d8(&ini, "DeviceID", &digi_device)
        || !Func4d7d8(&ini, "DevicePort", &sound_drv.wPort)
        || !Func4d7d8(&ini, "DeviceDMA", &sound_drv.wDMA)
        || !Func4d7d8(&ini, "DeviceIRQ", &sound_drv.wIRQ)) {
        Func4d224(&ini);
        return 0;
    }
    Func4d224(&ini);
    return 1;
}

int SoundInit(int flags)
{
    int ok;

    digi_inst = 0;
    sound_extra = 0;
    digi_ready = 0;
    ok = !(flags & 2);
    if (ok) {
        Func48300("hmiset.cfg");
        if (digi_device == -1) {
            ok = 0;
        }
        if (!ok) {
            return 0;
        }
        Func4dc8f(0, 0);
        sound_drv.wDriverRate = 22050;
        sound_drv.wDMABufferSize = 0x1000;
        if (ok) {
            sound_drv.wID = digi_device;
            if (!Func4dd52(&sound_drv, &sound_handle)) {
                digi_inst = 1;
                sosTIMERRegisterEvent(120, sound_drv.pfnTimer, &sound_timer_handle);
                if (sound_drv.wDriverBitsPerSample == 16) {
                    digi_bytes = 2;
                } else {
                    digi_bytes = 4;
                }
            }
        }
        return digi_ready = digi_inst;
    }
    return 0;
}

void SoundExit(void)
{
    if (digi_inst) {
        SoundFreeSamples();
        sosTIMERRemoveEvent(sound_timer_handle);
        Func4e1b5(sound_handle, 1, 1);
        digi_inst = 0;
    }
    Func4dceb();
    digi_ready = 0;
}

void Func48538(SOS_SAMPLE *s)
{
    dword len;

    if (s->dwStreamLength < 0x8000) {
        len = s->dwStreamLength;
        s->dwRefill = 0;
    } else {
        len = 0x8000;
        s->dwRefill = 1;
    }
    fseek(s->pFile, s->dwDataOffset, SEEK_SET);
    fread(s->pBuffer, len, 1, s->pFile);
    s->dwHalf = 0;
    s->dwStreamPos = 0;
    s->wLength = len;
    s->pSample = s->pBuffer;
}

SOS_SAMPLE *Func485bc(char *name, byte *(*loader)(char *))
{
    int stream;
    int convert;
    byte *buffer;
    int i;
    FILE *fp;

    if (*name == '~') {
        convert = 1;
        name++;
    } else {
        convert = 0;
    }
    {
        SOS_SAMPLE *s;
        byte *data;

        data = 0;
        stream = 0;
        if (!loader) {
            if (*name == '*') {
                name++;
                data = (byte *)malloc(0x10000);
                fp = fopen(name, "rb");
                if (!fp) {
                    return 0;
                }
                if (fseek(fp, 0, SEEK_END) || ftell(fp) == -1 || fseek(fp, 0, SEEK_SET)
                    || fread(data, 44, 1, fp) != 1 && *(dword *)data == 0x46464952) {
                    fclose(fp);
                    free(data);
                    return 0;
                }
                stream = 1;
            } else {
                data = FileLoad(name, 0, 1);
                if (!data) {
                    return 0;
                }
            }
            buffer = data;
        } else {
            data = loader(name);
            buffer = 0;
        }
        s = (SOS_SAMPLE *)malloc(sizeof(SOS_SAMPLE));
        memset(s, 0, sizeof(SOS_SAMPLE));
        s->pBuffer = buffer;
        if (*(dword *)data == 0x46464952) {
            byte *hdr;

            hdr = data;
            s->pSample = data + 44;
            s->wLength = *(dword *)(data + 40) - 44;
            s->wBitsPerSample = *(int *)(data + 32) >> 16;
            s->wChannels = *(int *)(data + 20) >> 16;
            if (*(word *)(data + 34) == 8) {
                s->wFormat = 0x8000;
                s->dwBytesPerSample = s->wChannels;
            } else {
                s->wFormat = 0;
                s->dwBytesPerSample = s->wChannels * 2;
            }
            s->wRate = *(dword *)(hdr + 24);
        } else {
            s->wBitsPerSample = 8;
            s->wChannels = 1;
            s->wFormat = 0x8000;
            s->wRate = 11025;
            s->dwBytesPerSample = 1;
            s->pSample = data;
            s->wLength = file_len;
            if (convert) {
                for (i = 0; i < file_len; i++) {
                    data[i] ^= 0x80;
                }
            }
        }
        s->wPanPosition = 0x8000;
        s->wVolume = 0x7fff7fff;
        if (stream) {
            s->pFile = fp;
            s->dwStreamLength = s->wLength;
            s->dwDataOffset = s->pSample - data;
            s->pfnSampleProcessed = Func48e14;
            Func48538(s);
        }
        return s;
    }
}

void Func487f8(SOS_SAMPLE *s)
{
    if (s) {
        if (!(s->wFlags & 0x2000)) {
            Func4e836(sound_handle, s->hSample);
        }
        if (s->pBuffer) {
            free(s->pBuffer);
        }
        if (s->pFile) {
            fclose(s->pFile);
        }
        free(s);
    }
}

void SoundLoadSamples(char **names, int count)
{
    byte *(*loader)(char *);
    int i;

    if (!digi_inst) {
        return;
    }
    if (digi_sample_list) {
        SoundFreeSamples();
    }
    if (count < 0) {
        digi_count = count;
        digi_count = -count;
    } else {
        digi_count = count;
    }
    digi_sample_list = (SOS_SAMPLE **)malloc(digi_count * sizeof(SOS_SAMPLE *));
    if (count < 0) {
        loader = (byte *(*)(char *))names[0];
        for (i = 0; i < digi_count; i++) {
            digi_sample_list[i] = Func485bc(names[i + 1], loader);
        }
    } else {
        for (i = 0; i < digi_count; i++) {
            digi_sample_list[i] = Func485bc(names[i], 0);
        }
    }
}

void SoundFreeSamples(void)
{
    int i;

    SoundStopAllSamples();
    if (digi_sample_list) {
        for (i = 0; i < digi_count; i++) {
            Func487f8(digi_sample_list[i]);
        }
        free(digi_sample_list);
        digi_sample_list = 0;
        digi_count = 0;
    }
}

dword SoundPlaySample(dword sample, word vol, short pitch, short pan)
{
    SOS_SAMPLE s;
    SOS_SAMPLE *p;
    dword handle;

    if (!digi_inst || !digi_ready) {
        return 0;
    }
    p = digi_sample_list[sample];
    if (!p) {
        return 0;
    }
    s = *p;
    if (!s.pSample) {
        return 0;
    }
    if (vol > 0x7fff) {
        vol = 0x7fff;
    }
    s.wVolume = ((short)vol << 16) | (short)vol;
    if (pitch != -1) {
        s.wRate = s.wRate * pitch / 100;
    }
    if (pan != -1) {
        s.wPanPosition = pan;
    }
    s.wID = (dword)digi_sample_list[sample];
    if (s.pFile) {
        Func48538(&s);
    }
    DisableInterrupts();
    handle = Func4e6b6(sound_handle, &s);
    EnableInterrupts();
    return handle;
}

dword SoundPlaySampleLooped(dword sample, word vol, short pitch, short pan, dword count, dword offset, dword length)
{
    SOS_SAMPLE s;
    SOS_SAMPLE *p;
    dword handle;
    dword start;
    dword size;

    if (!digi_inst || !digi_ready) {
        return 0;
    }
    p = digi_sample_list[sample];
    if (!p) {
        return 0;
    }
    s = *p;
    if (!s.pSample) {
        return 0;
    }
    if (vol > 0x7fff) {
        vol = 0x7fff;
    }
    s.wVolume = ((short)vol << 16) | (short)vol;
    if (pitch != -1) {
        s.wRate = s.wRate * pitch / 100;
    }
    if (pan != -1) {
        s.wPanPosition = pan;
    }
    start = s.dwBytesPerSample * offset;
    if (start >= s.wLength) {
        return 0;
    }
    s.pSample += start;
    if (length == -1) {
        size = s.wLength;
    } else {
        size = s.dwBytesPerSample * length;
    }
    if (start + size > s.wLength) {
        s.wLoopLength = s.wLength - start;
    } else {
        s.wLoopLength = size;
    }
    s.wLoopCount = count;
    s.wID = (dword)digi_sample_list[sample];
    if (s.pFile) {
        Func48538(&s);
    }
    DisableInterrupts();
    handle = Func4e6b6(sound_handle, &s);
    EnableInterrupts();
    return handle;
}

void SoundStopAllSamples(void)
{
    dword i;

    if (digi_inst && Func4eec8(sound_handle)) {
        for (i = 0; i < 32; i++) {
            DisableInterrupts();
            Func4e836(sound_handle, i);
            EnableInterrupts();
        }
    }
}

void SoundStopSample(dword handle)
{
    if (digi_inst && digi_ready) {
        DisableInterrupts();
        Func4e836(sound_handle, handle);
        EnableInterrupts();
    }
}

void SoundSetPitch(dword handle, word pitch)
{
    if (digi_inst && digi_ready && pitch > 0 && pitch < 400) {
        Func4ec68(sound_handle, handle, Func4edda(sound_handle, handle)->wRate * pitch / 100);
    }
}

void SoundSetSampleVolume(dword handle, word volume)
{
    if (volume > 0x7fff) {
        volume = 0x7fff;
    }
    Func4e982(sound_handle, handle, ((short)volume << 16) | (short)volume);
}

dword SoundPauseSample(dword handle)
{
    dword rate;

    if (!digi_inst || !digi_ready) {
        return 0;
    }
    rate = Func4ecee(sound_handle, handle);
    Func4ec68(sound_handle, handle, 0);
    return rate;
}

void SoundUnpauseSample(dword handle, dword rate)
{
    if (digi_inst && digi_ready) {
        Func4ec68(sound_handle, handle, rate);
    }
}

void SoundSetMasterVolume(word volume)
{
}

void SoundSetPan(dword handle, word pan)
{
    if (digi_inst && digi_ready) {
        Func4eb6c(sound_handle, handle, pan);
    }
}

void SoundWaitSample(dword handle)
{
    if (digi_inst && digi_ready) {
        while (!Func4ef0a(sound_handle, handle)) {
        }
    }
}

int SoundSampleIsPlaying(dword handle)
{
    if (!digi_inst || !digi_ready) {
        return 0;
    }
    return !Func4ef0a(sound_handle, handle);
}

dword SoundSamplePosition(dword handle)
{
    SOS_SAMPLE *s;

    if (!digi_inst || !digi_ready) {
        return 0;
    }
    s = &sound_drv.pSamples[handle];
    if (!(s->wFlags & 0x8000)) {
        return 0;
    }
    return (s->pSampleCurrent - s->pSample + s->dwStreamPos) / s->dwBytesPerSample;
}

int SoundGetSampleInfo(dword sample, SampleInfo *info)
{
    SOS_SAMPLE *s;

    if (!digi_inst || !info) {
        return 0;
    }
    s = digi_sample_list[sample];
    info->pData = s->pSample;
    info->dwBytes = s->wLength;
    info->dwBytesPerSample = s->dwBytesPerSample;
    info->dwSamples = info->dwBytes / info->dwBytesPerSample;
    info->dwBitsPerSample = s->wBitsPerSample;
    info->dwChannels = s->wChannels;
    return 1;
}

void __cdecl Func48e14(SOS_SAMPLE *s)
{
    s->dwStreamPos += s->wLength;
    if (s->dwStreamPos >= s->dwStreamLength) {
        s->dwRefill = 0;
        return;
    }
    if (s->dwHalf) {
        s->pSample = s->pBuffer;
        s->dwHalf = 0;
    } else {
        s->pSample = s->pBuffer + 0x8000;
        s->dwHalf = 1;
    }
    s->wLength = s->dwStreamLength - s->dwStreamPos;
    if (s->wLength > 0x8000) {
        s->wLength = 0x8000;
    }
    s->dwRefill = 1;
}

void SoundStreamUpdate(dword handle)
{
    SOS_SAMPLE *s;
    dword len;

    if (digi_inst && digi_ready) {
        s = &sound_drv.pSamples[handle];
        if (s->dwRefill) {
            len = s->dwStreamLength - s->dwStreamPos;
            if (len > 0x8000) {
                len = 0x8000;
            }
            {
                byte *data;
                dword count;
                dword bytes;
                FILE *file;

                file = s->pFile;
                bytes = len;
                count = 1;
                data = (byte *)((s->dwHalf ? 0 : 0x8000) + (dword)s->pBuffer);

                fread(data, bytes, count, file);
                s->dwRefill = 0;
            }
        }
    }
}

dword SoundGetSOSHandle(void)
{
    return sound_handle;
}

dword SoundGetSOSDriver(void)
{
    if (!digi_inst) {
        return -1;
    }
    return (dword)&sound_drv;
}

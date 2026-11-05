typedef unsigned char byte;
typedef unsigned short word;
typedef unsigned long dword;
typedef void (*TIMEREVENT)(void);

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
#pragma pack()

typedef union
{
    dword value;
    struct
    {
        word fraction;
        word whole;
    } parts;
} TIMERPHASE;

typedef union
{
    dword value;
    byte channel;
} TIMERCHANNEL;

void Func4e5dd(void);
void Func4e600(void);
void Func4e623(void);
void Func4e646(void);
void Func4e669(void);

extern dword Datac7e36;

dword Datac6e10 = 0;
dword Datac6e14 = 0;
dword Datac6e18[2] = {0};
dword Datac6e20 = 0;
word Datac6e24 = 0;
dword *Datac6e26 = &Datac7e36;
dword Datac6e2a = 0;
dword Datac6e2e = 0;
byte Datac6e32[4100] = {0};
dword Datac7e36 = 0;
dword Datac7e3a = 0;
word Datac7e3e = 0;
dword Datac7e40 = 0;
dword Datac7e44 = 0;
dword Datac7e48 = 0;
dword Datac7e4c = 0;
dword Datac7e50 = 0;
char Datac7e54[128] = {0};
char Datac7ed4[128] = {0};
void *Datac7f54[5] = {0};
dword Datac7f68[3] = {0xffffffff, 0xffffffff, 0xffffffff};
dword Datac7f74 = 0xffffffff;
SOSFILEHEADER Datac7f78 = {0};
SOSFILEENTRY Datac7fa4 = {0};
void *(*Datac7fd4)(unsigned int size) = 0;
void (*Datac7fd8)(void *buffer) = 0;
dword Datac7fdc = 0;
dword Datac7fe0 = 0xffffffff;
TIMEREVENT Datac7fe4[15] = {0};
TIMEREVENT Datac8020 = 0;
dword Datac8024[15] = {
    0xffffffff, 0xffffffff, 0xffffffff, 0xffffffff,
    0xffffffff, 0xffffffff, 0xffffffff, 0xffffffff,
    0xffffffff, 0xffffffff, 0xffffffff, 0xffffffff,
    0xffffffff, 0xffffffff, 0xffffffff
};
dword Datac8060 = 0xffffffff;
dword Datac8064[15] = {
    0xffffffff, 0xffffffff, 0xffffffff, 0xffffffff,
    0xffffffff, 0xffffffff, 0xffffffff, 0xffffffff,
    0xffffffff, 0xffffffff, 0xffffffff, 0xffffffff,
    0xffffffff, 0xffffffff, 0xffffffff
};
dword Datac80a0 = 0xffffffff;
TIMERPHASE Datac80a4[16] = {
    0xffffffff, 0xffffffff, 0xffffffff, 0xffffffff,
    0xffffffff, 0xffffffff, 0xffffffff, 0xffffffff,
    0xffffffff, 0xffffffff, 0xffffffff, 0xffffffff,
    0xffffffff, 0xffffffff, 0xffffffff, 0xffffffff
};
TIMERCHANNEL Datac80e4[16] = {
    0xffffffff, 0xffffffff, 0xffffffff, 0xffffffff,
    0xffffffff, 0xffffffff, 0xffffffff, 0xffffffff,
    0xffffffff, 0xffffffff, 0xffffffff, 0xffffffff,
    0xffffffff, 0xffffffff, 0xffffffff, 0xffffffff
};
dword Datac8124 = 0xffffffff;
dword Datac8128 = 0;
char Datac812c[128] = {0};
char Datac81ac[128] = {0};
SOSFILEHEADER Datac822c = {0};
SOSFILEENTRY Datac8258 = {0};
byte Datac8288[0x6c] = {0};
byte *Datac82f4 = 0;
dword Datac82f8 = 0;
dword Datac82fc = 0;
dword Datac8300 = 0;
dword Datac8304 = 0;
int Datac8308 = 0;
dword Datac830c = 0;
dword Datac8310 = 0;
dword Datac8314 = 0;
dword Datac8318 = 0;
char *Datac831c[] = {
    "Error Code Does Not Indicate An Error",
    "Specified Driver Is Not Loaded",
    "Specified Pointer Is NULL",
    "Detection System Is Already Initialized",
    "File Open Failure",
    "Memory Allocation Failure",
    "Invalid Driver ID",
    "Driver Not Found",
    "Detection System Failed To Find Hardware",
    "Driver Already Loaded Using Specified Handle",
    "Invalid Handle",
    "No Handles Available",
    "Hardware Already Paused",
    "Hardware Not Paused",
    "Data Is Not Valid",
    "HMI*.386 File Open Failure",
    "Incorrect Port",
    "Incorrect IRQ",
    "Incorrect DMA",
    "Incorrect DMA/IRQ",
    "Stream Already Playing",
    "Stream Empty",
    "Stream Already Paused",
    "Stream Not Paused"
};
dword Datac837c[8] = {0x01, 0x03, 0x05, 0x07, 0xc2, 0xc6, 0xca, 0xce};
void (*Datac839c[])(void) = {
    Func4e5dd, Func4e600, Func4e623, Func4e646, Func4e669
};
dword Datac83b0 = 0;

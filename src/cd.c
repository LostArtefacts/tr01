#include <i86.h>
#include <string.h>

typedef unsigned char byte;
typedef unsigned short word;
typedef unsigned long dword;

#pragma pack(1)
typedef struct
{
    byte Length;
    byte SubUnit;
    byte CommandCode;
    word Status;
    byte Resvd[8];
} RQSTHDR;

typedef struct
{
    RQSTHDR RHdr;
    byte MediaDesc;
    dword TransAddr;
    word TransBytes;
    short StartSecTot;
    dword VolIDPtr;
    byte CtrlSubcode;
    byte TrackNum;
    dword TrackStart;
    byte TrackCtrl;
} TRACKINFRQ;

typedef struct
{
    RQSTHDR RHdr;
    byte MediaDesc;
    dword TransAddr;
    word TransBytes;
    word StartSecTot;
    dword VolIDPtr;
    byte CtrlSubcode;
    byte TrackLo;
    byte TrackHi;
    dword LOutTrackStart;
} AUDIOINFRQ;

typedef struct
{
    RQSTHDR RHdr;
    byte MediaDesc;
    dword TransAddr;
    word TransBytes;
    word StartSecTot;
    dword VolIDPtr;
    byte CtrlSubcode;
    byte input0;
    byte vol0;
    byte input1;
    byte vol1;
    byte input2;
    byte vol2;
    byte input3;
    byte vol3;
} VOLUMERQ;

typedef struct
{
    RQSTHDR RHdr;
    byte MediaDesc;
    dword TransAddr;
    word TransBytes;
    word StartSecTot;
    dword VolIDPtr;
    byte CtrlSubcode;
    byte ChangeByte;
} MEDCHGRQ;

typedef struct
{
    RQSTHDR RHdr;
    byte AddrMode;
    dword TransAddr;
    word ReadSect;
    dword StartSect;
} SEEKRQ;

typedef struct
{
    RQSTHDR RHdr;
    byte AddrMode;
    dword StartSect;
    dword PlaySect;
} PLAYRQ;

typedef struct
{
    RQSTHDR RHdr;
} STOPRQ;

typedef struct
{
    RQSTHDR RHdr;
} RESUMERQ;

typedef struct
{
    RQSTHDR RHdr;
    byte MediaDesc;
    dword TransAddr;
    word TransBytes;
    word StartSecTot;
    dword VolIDPtr;
    byte CtrlSubcode;
    dword Info;
} DRVINFORQ;

typedef struct
{
    RQSTHDR RHdr;
    byte MediaDesc;
    dword TransAddr;
    word TransBytes;
    word StartSecTot;
    dword VolIDPtr;
    byte CtrlSubcode;
    byte QInfo[10];
} QCHANRQ;

typedef struct
{
    long EDI;
    long ESI;
    long EBP;
    long reserved;
    long EBX;
    long EDX;
    long ECX;
    long EAX;
    short flags;
    short ES;
    short DS;
    short FS;
    short GS;
    short IP;
    short CS;
    short SP;
    short SS;
} RMREGS;
#pragma pack()

TRACKINFRQ cd_trackinfo = {0};
AUDIOINFRQ cd_audioinfo = {0};
SEEKRQ cd_seek = {0};
PLAYRQ cd_play = {0};
STOPRQ cd_stop = {0};
RESUMERQ cd_resume = {0};
DRVINFORQ cd_drvinfo = {0};
MEDCHGRQ cd_medchg = {0};
QCHANRQ cd_qchan = {0};
VOLUMERQ cd_volume = {0};
dword cd_error = 0;
dword cd_status = 0;
int cd_changed = 0;
short cd_playing = 0;
short cd_loop = 0;
short cd_sel = 0;
short cd_seg = 0;
int cd_dpmi = 0x31;

union REGS cd_regs;
dword cd_tstart[101];
struct SREGS cd_sregs;
dword cd_tlength[101];
int cdrom_drive;
int cd_tracks;
int last_track;
RMREGS cd_rmregs;
byte cd_present;

dword CDRequest(RQSTHDR *pHeader, int nSize);
dword CDRedAddr(dword dwPosition);
dword CDStatus(void);
int CDTrackInfo(void);
void CDStop(void);
int CDSeek(dword dwTrack);
int CDPlay(dword dwTrack);

void CDMscdexCall(void)
{
    cd_regs.w.ax = 0x300;
    cd_regs.w.bx = 0x2f;
    cd_regs.w.cx = 0;
    cd_sregs.es = FP_SEG(&cd_rmregs);
    cd_regs.x.edi = FP_OFF(&cd_rmregs);
    int386x(cd_dpmi, &cd_regs, &cd_regs, &cd_sregs);
}

int CDInit(void)
{
    int i;

    memset(&cd_sregs, 0, sizeof(cd_sregs));
    cd_regs.w.ax = 0x100;
    cd_regs.w.bx = 0x10;
    int386x(cd_dpmi, &cd_regs, &cd_regs, &cd_sregs);
    cd_seg = cd_regs.w.ax;
    cd_sel = cd_regs.w.dx;
    memset(&cd_rmregs, 0, sizeof(cd_rmregs));
    cd_rmregs.EAX = 0x1500;
    cd_rmregs.EBX = 0;
    CDMscdexCall();
    if (cd_rmregs.EBX == 0)
        return 1;
    cdrom_drive = cd_rmregs.ECX;
    {
        DRVINFORQ *p = &cd_drvinfo;
        byte length = 0x1a;
        byte command = 3;
        dword address = (cd_seg << 16) + 0x1a;
        word count = 5;
        byte subcode = 6;

        p->RHdr.CommandCode = command;
        p->RHdr.Length = length;
        p->TransAddr = address;
        p->TransBytes = count;
        p->CtrlSubcode = subcode;
    }
    {
        QCHANRQ *p = &cd_qchan;
        byte length = 0x1a;
        byte command = 3;
        dword address = (cd_seg << 16) + 0x1a;
        word count = 0xb;
        byte subcode = 0xc;

        p->RHdr.CommandCode = command;
        p->RHdr.Length = length;
        p->TransAddr = address;
        p->TransBytes = count;
        p->CtrlSubcode = subcode;
    }
    {
        TRACKINFRQ *p = &cd_trackinfo;
        byte length = 0x1a;
        byte command = 3;
        dword address = (cd_seg << 16) + 0x1a;
        word count = 7;
        byte subcode = 0xb;

        p->RHdr.CommandCode = command;
        p->RHdr.Length = length;
        p->TransAddr = address;
        p->TransBytes = count;
        p->CtrlSubcode = subcode;
    }
    {
        AUDIOINFRQ *p = &cd_audioinfo;
        byte length = 0x1a;
        byte command = 3;
        dword address = (cd_seg << 16) + 0x1a;
        word count = 7;
        byte subcode = 0xa;

        p->RHdr.CommandCode = command;
        p->RHdr.Length = length;
        p->TransAddr = address;
        p->TransBytes = count;
        p->CtrlSubcode = subcode;
    }
    {
        MEDCHGRQ *p = &cd_medchg;
        byte length = 0x1a;
        byte command = 3;
        dword address = (cd_seg << 16) + 0x1a;
        word count = 2;
        byte subcode = 9;

        p->RHdr.CommandCode = command;
        p->RHdr.Length = length;
        p->TransAddr = address;
        p->TransBytes = count;
        p->CtrlSubcode = subcode;
    }
    {
        VOLUMERQ *p = &cd_volume;
        byte length = 0x1c;
        byte command = 0xc;
        dword address = (cd_seg << 16) + 0x1a;
        word count = 9;
        byte subcode = 3;

        p->RHdr.CommandCode = command;
        p->RHdr.Length = length;
        p->TransAddr = address;
        p->TransBytes = count;
        p->CtrlSubcode = subcode;
    }
    cd_seek.RHdr.CommandCode = 0x83;
    cd_seek.RHdr.Length = 0x18;
    cd_play.RHdr.CommandCode = 0x84;
    cd_play.RHdr.Length = 0x16;
    cd_stop.RHdr.CommandCode = 0x85;
    cd_stop.RHdr.Length = 0xd;
    cd_resume.RHdr.CommandCode = 0x88;
    cd_resume.RHdr.Length = 0xd;
    cd_present = 1;
    CDStop();
    for (i = 0; i <= 5; i++) {
        cd_error = CDRequest(&cd_medchg.RHdr, sizeof(cd_medchg));
        if (cd_error == 0x100)
            break;
        delay(1000);
    }
    if (cd_error != 0x100) {
        cd_changed = 1;
        cd_present = 0;
        return 0;
    }
    CDStatus();
    CDTrackInfo();
    return 0;
}

dword CDRequest(RQSTHDR *pHeader, int nSize)
{
    pHeader->Status = 0;
    memcpy((void *)(cd_seg << 4), pHeader, nSize);
    memset(&cd_rmregs, 0, sizeof(cd_rmregs));
    cd_rmregs.EAX = 0x1510;
    cd_rmregs.ES = cd_seg;
    cd_rmregs.EBX = 0;
    cd_rmregs.ECX = cdrom_drive;
    CDMscdexCall();
    memcpy(pHeader, (void *)(cd_seg << 4), nSize);
    return pHeader->Status;
}

void CDFree(void)
{
    if (cd_present) {
        CDStop();
        if (cd_seg) {
            memset(&cd_sregs, 0, sizeof(cd_sregs));
            cd_regs.w.ax = 0x101;
            cd_regs.w.dx = cd_sel;
            int386x(cd_dpmi, &cd_regs, &cd_regs, &cd_sregs);
            cd_seg = 0;
            cd_sel = 0;
        }
        cd_present = 0;
    }
}

dword CDStatus(void)
{
    cd_status = 0;
    if (cd_present) {
        cd_error = CDRequest(&cd_drvinfo.RHdr, sizeof(cd_drvinfo));
        if (cd_error != 0x100)
            return 0;
        cd_status = cd_drvinfo.Info;
    }
    return cd_status;
}

int CDTrackInfo(void)
{
    int i;

    cd_error = CDRequest(&cd_audioinfo.RHdr, sizeof(cd_audioinfo));
    if (cd_error != 0x100)
        return 1;
    memset(cd_tstart, 0, sizeof(cd_tstart));
    memset(cd_tlength, 0, sizeof(cd_tlength));
    for (i = cd_audioinfo.TrackLo; i < cd_audioinfo.TrackHi + 1; i++) {
        cd_trackinfo.TrackNum = i;
        cd_error = CDRequest(&cd_trackinfo.RHdr, sizeof(cd_trackinfo));
        if (cd_error != 0x100)
            return 1;
        cd_tstart[i] = CDRedAddr(cd_trackinfo.TrackStart);
    }
    cd_tstart[i] = CDRedAddr(cd_audioinfo.LOutTrackStart);
    for (i = cd_audioinfo.TrackLo; i < cd_audioinfo.TrackHi + 1; i++)
        cd_tlength[i] = cd_tstart[i + 1] - cd_tstart[i];
    cd_tstart[i] = 0;
    cd_tracks = cd_audioinfo.TrackHi;
    return 0;
}

dword CDRedAddr(dword dwPosition)
{
    int addr;
    dword min;
    dword sec;
    dword frame;

    addr = 0;
    frame = dwPosition & 0xff;
    sec = (dwPosition & 0xff00) >> 8;
    min = (dwPosition & 0xff0000) >> 16;
    if (dwPosition) {
        addr = min * 4500 + sec * 75 + frame - 150;
        if (addr < 0)
            addr = 0;
    }
    return addr;
}

int CDVolume(dword volume)
{
    cd_volume.input0 = 0;
    cd_volume.vol0 = volume;
    cd_volume.input1 = 1;
    cd_volume.vol1 = volume;
    cd_volume.input2 = 2;
    cd_volume.vol2 = volume;
    cd_volume.input3 = 3;
    cd_volume.vol3 = volume;
    cd_error = CDRequest(&cd_volume.RHdr, sizeof(cd_volume));
    return 1;
}

int CDPlay(dword dwTrack)
{
    if (cd_present) {
        CDStop();
        if (cd_changed) {
            cd_error = CDRequest(&cd_medchg.RHdr, sizeof(cd_medchg));
            CDTrackInfo();
            if (cd_error == 0x100)
                cd_changed = 0;
        }
        if (dwTrack < cd_audioinfo.TrackLo || dwTrack > cd_audioinfo.TrackHi)
            return 1;
        cd_seek.StartSect = cd_tstart[dwTrack];
        cd_error = CDRequest(&cd_seek.RHdr, sizeof(cd_seek));
        if (cd_error != 0x100)
            return 1;
        cd_play.StartSect = cd_tstart[dwTrack];
        cd_play.PlaySect = cd_tlength[dwTrack];
        cd_error = CDRequest(&cd_play.RHdr, sizeof(cd_play));
        if (!(cd_error & 0x200))
            return 1;
        last_track = dwTrack;
        cd_playing = 1;
    }
    return 0;
}

int CDPlayPart(dword dwTrack, dword dwOffset, dword dwLen)
{
    if (cd_present) {
        CDStop();
        if (cd_changed) {
            cd_error = CDRequest(&cd_medchg.RHdr, sizeof(cd_medchg));
            CDTrackInfo();
            if (cd_error == 0x100)
                cd_changed = 0;
        }
        if (dwTrack < cd_audioinfo.TrackLo || dwTrack > cd_audioinfo.TrackHi)
            return 1;
        cd_seek.StartSect = cd_tstart[dwTrack] + dwOffset;
        cd_error = CDRequest(&cd_seek.RHdr, sizeof(cd_seek));
        if (cd_error != 0x100)
            return 1;
        cd_trackinfo.TrackNum = dwTrack;
        cd_error = CDRequest(&cd_trackinfo.RHdr, sizeof(cd_trackinfo));
        if (cd_error != 0x100)
            return 1;
        if (cd_trackinfo.TrackCtrl & 0x40)
            return 1;
        cd_play.StartSect = cd_tstart[dwTrack] + dwOffset;
        cd_play.PlaySect = dwLen;
        cd_error = CDRequest(&cd_play.RHdr, sizeof(cd_play));
        if (!(cd_error & 0x200))
            return 1;
        last_track = dwTrack;
        cd_playing = 0;
    }
    return 0;
}

void CDStop(void)
{
    if (cd_present) {
        cd_error = CDRequest(&cd_stop.RHdr, sizeof(cd_stop));
        cd_playing = 0;
    }
}

void CDResume(void)
{
    if (cd_present) {
        cd_error = CDRequest(&cd_resume.RHdr, sizeof(cd_resume));
        cd_playing = 1;
    }
}

int CDSeek(dword dwTrack)
{
    if (cd_present) {
        if (cd_changed) {
            cd_error = CDRequest(&cd_medchg.RHdr, sizeof(cd_medchg));
            CDTrackInfo();
            if (cd_error == 0x100)
                cd_changed = 0;
        }
        if (dwTrack < cd_audioinfo.TrackLo || dwTrack > cd_audioinfo.TrackHi)
            return 1;
        cd_seek.StartSect = cd_tstart[dwTrack];
        cd_error = CDRequest(&cd_seek.RHdr, sizeof(cd_seek));
        if (cd_error != 0x100)
            return 1;
        last_track = dwTrack;
        cd_playing = 1;
    }
    return 0;
}

void CDLoop(void)
{
    if (cd_present) {
        if (++cd_loop >= 120) {
            cd_loop = 0;
            if (cd_playing == 2) {
                cd_play.StartSect = cd_tstart[last_track];
                cd_play.PlaySect = cd_tlength[last_track];
                cd_error = CDRequest(&cd_play.RHdr, sizeof(cd_play));
                cd_playing = 1;
                return;
            }
            CDStatus();
            if (cd_status & 1) {
                cd_changed = 1;
                return;
            }
            if (cd_changed) {
                cd_error = CDRequest(&cd_medchg.RHdr, sizeof(cd_medchg));
                CDTrackInfo();
                cd_changed = 0;
                CDPlay(last_track);
                return;
            }
            cd_error = CDRequest(&cd_qchan.RHdr, sizeof(cd_qchan));
            if (!(cd_error & 0x200) && cd_playing) {
                CDSeek(last_track);
                cd_playing = 2;
            }
        }
    }
}

dword CDPosition(void)
{
    if (cd_present) {
        cd_error = CDRequest(&cd_qchan.RHdr, sizeof(cd_qchan));
        if (!(cd_error & 0x200))
            return -1;
        return cd_qchan.QInfo[3] * 4500 + cd_qchan.QInfo[4] * 75 + cd_qchan.QInfo[5];
    }
    return 0;
}

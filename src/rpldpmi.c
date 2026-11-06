#include <i86.h>
#include <string.h>

typedef unsigned char byte;
typedef unsigned short word;
typedef unsigned long dword;

static const char rpldpmi_rcsid[] = "$Id: RPLDPMI.C 1.4 1995/06/15 11:50:08 MFC Exp $";

#pragma pack(1)
typedef struct
{
    dword edi;
    dword esi;
    dword ebp;
    dword reserved;
    dword ebx;
    dword edx;
    dword ecx;
    dword eax;
    short flags;
    word es;
    word ds;
    word fs;
    word gs;
    word ip;
    word cs;
    word sp;
    word ss;
} REALREGS;
#pragma pack()

struct
{
    union REGS regs;
    struct SREGS segments;
    REALREGS real;
    byte reserved[6];
} dpmi_state;

void *RPLDPMI_SegmentToPointer(word segment, word shift)
{
    return (void *)((dword)segment << (shift + 4));
}

int RPLDPMI_RealInterrupt(int int_number, union REGS *in, union REGS *out)
{
    memset(&dpmi_state.real, 0, sizeof(REALREGS));
    dpmi_state.real.eax = in->w.ax;
    dpmi_state.real.ebx = in->w.bx;
    dpmi_state.real.ecx = in->w.cx;
    dpmi_state.real.edx = in->w.dx;
    dpmi_state.real.edi = in->w.di;
    dpmi_state.real.esi = in->w.si;
    dpmi_state.real.flags = in->w.cflag;
    dpmi_state.regs.w.ax = 0x300;
    dpmi_state.regs.w.cx = 0;
    dpmi_state.regs.h.bl = int_number;
    dpmi_state.regs.h.bh = 0;
    dpmi_state.segments.es = FP_SEG((void __far *)&dpmi_state.real);
    dpmi_state.regs.x.edi = (dword)&dpmi_state.real;
    int386x(0x31, &dpmi_state.regs, &dpmi_state.regs, &dpmi_state.segments);
    out->w.ax = dpmi_state.real.eax;
    out->w.bx = dpmi_state.real.ebx;
    out->w.cx = dpmi_state.real.ecx;
    out->w.dx = dpmi_state.real.edx;
    out->w.di = dpmi_state.real.edi;
    out->w.si = dpmi_state.real.esi;
    out->w.cflag = dpmi_state.real.flags;
    if (dpmi_state.regs.x.cflag & 1) {
        out->w.cflag |= 1;
    }
    return out->w.ax;
}

int RPLDPMI_RealInterruptWithSegments(int int_number, union REGS *in, union REGS *out, struct SREGS *segments)
{
    memset(&dpmi_state.real, 0, sizeof(REALREGS));
    dpmi_state.real.eax = in->w.ax;
    dpmi_state.real.ebx = in->w.bx;
    dpmi_state.real.ecx = in->w.cx;
    dpmi_state.real.edx = in->w.dx;
    dpmi_state.real.edi = in->w.di;
    dpmi_state.real.esi = in->w.si;
    dpmi_state.real.flags = in->w.cflag;
    dpmi_state.real.ds = segments->ds;
    dpmi_state.real.es = segments->es;
    dpmi_state.regs.w.ax = 0x300;
    dpmi_state.regs.w.cx = 0;
    dpmi_state.regs.h.bl = int_number;
    dpmi_state.regs.h.bh = 0;
    dpmi_state.segments.es = FP_SEG((void __far *)&dpmi_state.real);
    dpmi_state.regs.x.edi = (dword)&dpmi_state.real;
    int386x(0x31, &dpmi_state.regs, &dpmi_state.regs, &dpmi_state.segments);
    out->w.ax = dpmi_state.real.eax;
    out->w.bx = dpmi_state.real.ebx;
    out->w.cx = dpmi_state.real.ecx;
    out->w.dx = dpmi_state.real.edx;
    out->w.di = dpmi_state.real.edi;
    out->w.si = dpmi_state.real.esi;
    out->w.cflag = dpmi_state.real.flags;
    segments->ds = dpmi_state.real.ds;
    segments->es = dpmi_state.real.es;
    if (dpmi_state.regs.x.cflag & 1) {
        out->w.cflag |= 1;
    }
    return out->w.ax;
}

byte RPLDPMI_AllocateDOSMemory(word size, word *selector, word *segment)
{
    dpmi_state.regs.w.ax = 0x100;
    dpmi_state.regs.w.bx = size / 16 + (size % 16 != 0);
    int386(0x31, &dpmi_state.regs, &dpmi_state.regs);
    *segment = dpmi_state.regs.w.ax;
    *selector = dpmi_state.regs.w.dx;
    return !(dpmi_state.regs.x.cflag & 1);
}

byte RPLDPMI_FreeDOSMemory(word selector)
{
    dpmi_state.regs.w.ax = 0x101;
    dpmi_state.regs.w.dx = selector;
    int386(0x31, &dpmi_state.regs, &dpmi_state.regs);
    return !(dpmi_state.regs.x.cflag & 1);
}

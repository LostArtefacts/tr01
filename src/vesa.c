#include <i86.h>
#include <string.h>

typedef unsigned char byte;
typedef unsigned short word;

static const char vesa_rcsid[] = "$Id: VESA.C 1.5 1995/06/15 11:50:08 MFC Exp $";

struct
{
    struct SREGS segments;
    union REGS regs;
} vesa_state;

void *RPLDPMI_SegmentToPointer(word segment, word shift);
int RPLDPMI_RealInterrupt(int int_number, union REGS *in, union REGS *out);
int RPLDPMI_RealInterruptWithSegments(int int_number, union REGS *in, union REGS *out, struct SREGS *segments);
byte RPLDPMI_AllocateDOSMemory(word size, word *selector, word *segment);
byte RPLDPMI_FreeDOSMemory(word selector);

byte RPLVESA_GetControllerInfo(void *info)
{
    word selector;
    word segment;

    if (!RPLDPMI_AllocateDOSMemory(512, &selector, &segment)) {
        return 0;
    }
    vesa_state.segments.es = segment;
    vesa_state.regs.w.di = 0;
    vesa_state.segments.ds = 0;
    vesa_state.regs.w.ax = 0x4f00;
    RPLDPMI_RealInterruptWithSegments(0x10, &vesa_state.regs, &vesa_state.regs, &vesa_state.segments);
    memcpy(info, RPLDPMI_SegmentToPointer(segment, 0), 512);
    RPLDPMI_FreeDOSMemory(selector);
    if (vesa_state.regs.w.ax != 0x4f) {
        return 0;
    }
    return 1;
}

byte RPLVESA_GetModeInfo(word mode, void *info)
{
    word selector;
    word segment;

    if (!RPLDPMI_AllocateDOSMemory(512, &selector, &segment)) {
        return 0;
    }
    vesa_state.segments.es = segment;
    vesa_state.regs.w.di = 0;
    vesa_state.segments.ds = 0;
    vesa_state.regs.w.ax = 0x4f01;
    vesa_state.regs.w.cx = mode;
    RPLDPMI_RealInterruptWithSegments(0x10, &vesa_state.regs, &vesa_state.regs, &vesa_state.segments);
    memcpy(info, RPLDPMI_SegmentToPointer(segment, 0), 512);
    RPLDPMI_FreeDOSMemory(selector);
    if (vesa_state.regs.w.ax != 0x4f) {
        return 0;
    }
    return 1;
}

byte RPLVESA_SetMode(word mode)
{
    vesa_state.regs.w.ax = 0x4f02;
    vesa_state.regs.w.bx = mode;
    RPLDPMI_RealInterrupt(0x10, &vesa_state.regs, &vesa_state.regs);
    return vesa_state.regs.w.ax == 0x4f;
}

byte RPLVESA_GetMode(word *mode)
{
    vesa_state.regs.w.ax = 0x4f03;
    RPLDPMI_RealInterrupt(0x10, &vesa_state.regs, &vesa_state.regs);
    *mode = vesa_state.regs.w.bx;
    return vesa_state.regs.w.ax == 0x4f;
}

byte RPLVESA_SetWindowA(word bank)
{
    vesa_state.regs.w.ax = 0x4f05;
    vesa_state.regs.h.bh = 0;
    vesa_state.regs.w.dx = bank;
    vesa_state.regs.h.bl = 0;
    RPLDPMI_RealInterrupt(0x10, &vesa_state.regs, &vesa_state.regs);
    return vesa_state.regs.w.ax == 0x4f;
}

byte RPLVESA_SetWindowB(word bank)
{
    vesa_state.regs.w.ax = 0x4f05;
    vesa_state.regs.h.bh = 0;
    vesa_state.regs.w.dx = bank;
    vesa_state.regs.h.bl = 1;
    RPLDPMI_RealInterrupt(0x10, &vesa_state.regs, &vesa_state.regs);
    return vesa_state.regs.w.ax == 0x4f;
}

byte RPLVESA_SetDisplayStart(word x, word y)
{
    vesa_state.regs.w.ax = 0x4f07;
    vesa_state.regs.h.bh = 0;
    vesa_state.regs.w.cx = x;
    vesa_state.regs.w.dx = y;
    vesa_state.regs.h.bl = 0;
    RPLDPMI_RealInterrupt(0x10, &vesa_state.regs, &vesa_state.regs);
    return vesa_state.regs.w.ax == 0x4f;
}

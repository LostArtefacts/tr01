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

void *Func58f34(word segment, word shift);
int Func58f48(int int_number, union REGS *in, union REGS *out);
int Func59064(int int_number, union REGS *in, union REGS *out, struct SREGS *segments);
byte Func591ac(word size, word *selector, word *segment);
byte Func59228(word selector);

byte Func59290(void *info)
{
    word selector;
    word segment;

    if (!Func591ac(512, &selector, &segment)) {
        return 0;
    }
    vesa_state.segments.es = segment;
    vesa_state.regs.w.di = 0;
    vesa_state.segments.ds = 0;
    vesa_state.regs.w.ax = 0x4f00;
    Func59064(0x10, &vesa_state.regs, &vesa_state.regs, &vesa_state.segments);
    memcpy(info, Func58f34(segment, 0), 512);
    Func59228(selector);
    if (vesa_state.regs.w.ax != 0x4f) {
        return 0;
    }
    return 1;
}

byte Func59338(word mode, void *info)
{
    word selector;
    word segment;

    if (!Func591ac(512, &selector, &segment)) {
        return 0;
    }
    vesa_state.segments.es = segment;
    vesa_state.regs.w.di = 0;
    vesa_state.segments.ds = 0;
    vesa_state.regs.w.ax = 0x4f01;
    vesa_state.regs.w.cx = mode;
    Func59064(0x10, &vesa_state.regs, &vesa_state.regs, &vesa_state.segments);
    memcpy(info, Func58f34(segment, 0), 512);
    Func59228(selector);
    if (vesa_state.regs.w.ax != 0x4f) {
        return 0;
    }
    return 1;
}

byte Func593e8(word mode)
{
    vesa_state.regs.w.ax = 0x4f02;
    vesa_state.regs.w.bx = mode;
    Func58f48(0x10, &vesa_state.regs, &vesa_state.regs);
    return vesa_state.regs.w.ax == 0x4f;
}

byte Func5941c(word *mode)
{
    vesa_state.regs.w.ax = 0x4f03;
    Func58f48(0x10, &vesa_state.regs, &vesa_state.regs);
    *mode = vesa_state.regs.w.bx;
    return vesa_state.regs.w.ax == 0x4f;
}

byte Func59458(word bank)
{
    vesa_state.regs.w.ax = 0x4f05;
    vesa_state.regs.h.bh = 0;
    vesa_state.regs.w.dx = bank;
    vesa_state.regs.h.bl = 0;
    Func58f48(0x10, &vesa_state.regs, &vesa_state.regs);
    return vesa_state.regs.w.ax == 0x4f;
}

byte Func5949c(word bank)
{
    vesa_state.regs.w.ax = 0x4f05;
    vesa_state.regs.h.bh = 0;
    vesa_state.regs.w.dx = bank;
    vesa_state.regs.h.bl = 1;
    Func58f48(0x10, &vesa_state.regs, &vesa_state.regs);
    return vesa_state.regs.w.ax == 0x4f;
}

byte Func594e0(word x, word y)
{
    vesa_state.regs.w.ax = 0x4f07;
    vesa_state.regs.h.bh = 0;
    vesa_state.regs.w.cx = x;
    vesa_state.regs.w.dx = y;
    vesa_state.regs.h.bl = 0;
    Func58f48(0x10, &vesa_state.regs, &vesa_state.regs);
    return vesa_state.regs.w.ax == 0x4f;
}

#include <conio.h>
#include <i86.h>
#include <string.h>

typedef unsigned char byte;
typedef unsigned short word;

static const char vga_rcsid[] = "$Id: VGA.C 1.8 1995/10/25 14:57:33 MFC Exp $";

struct
{
    int reserved[2];
    struct SREGS segments;
    union REGS regs;
    word segment;
    word selector;
    int reserved2;
} vga_state;

void *RPLDPMI_SegmentToPointer(word segment, word shift);
void RPLDPMI_RealInterrupt(int int_number, union REGS *in, union REGS *out);
void RPLDPMI_RealInterruptWithSegments(int int_number, union REGS *in, union REGS *out, struct SREGS *segments);
byte RPLDPMI_AllocateDOSMemory(word size, word *selector, word *segment);
void RPLDPMI_FreeDOSMemory(word selector);
void RPLVGA_Unchain(void);

void RPLVGA_SetMode13(void)
{
    vga_state.regs.w.ax = 0x13;
    RPLDPMI_RealInterrupt(0x10, &vga_state.regs, &vga_state.regs);
}

void RPLVGA_SetTextMode(void)
{
    vga_state.regs.w.ax = 3;
    RPLDPMI_RealInterrupt(0x10, &vga_state.regs, &vga_state.regs);
}

byte RPLVGA_SetPalette(const void *palette, int first, int count)
{
    int size;
    void *buffer;

    size = (count < 256 ? count : 256) * 3;
    if (!RPLDPMI_AllocateDOSMemory(size, &vga_state.selector, &vga_state.segment)) {
        return 0;
    }
    buffer = RPLDPMI_SegmentToPointer(vga_state.segment, 0);
    memcpy(buffer, palette, size);
    vga_state.regs.w.dx = 0;
    vga_state.segments.es = vga_state.segment;
    count = count < 256 ? count : 256;
    vga_state.regs.w.ax = 0x1012;
    vga_state.regs.w.bx = first;
    vga_state.regs.w.cx = count;
    RPLDPMI_RealInterruptWithSegments(0x10, &vga_state.regs, &vga_state.regs, &vga_state.segments);
    RPLDPMI_FreeDOSMemory(vga_state.selector);
    return 1;
}

void RPLVGA_SetCursorPosition(byte page, byte column, byte row)
{
    vga_state.regs.h.ah = 2;
    vga_state.regs.h.al = 0;
    vga_state.regs.h.bh = page;
    vga_state.regs.h.dl = column;
    vga_state.regs.h.dh = row;
    RPLDPMI_RealInterrupt(0x10, &vga_state.regs, &vga_state.regs);
}

void RPLVGA_GetCursorPosition(byte page, byte *column, byte *row)
{
    vga_state.regs.h.ah = 3;
    vga_state.regs.h.al = 0;
    vga_state.regs.h.bh = page;
    RPLDPMI_RealInterrupt(0x10, &vga_state.regs, &vga_state.regs);
    if (row) {
        *row = vga_state.regs.h.dh;
    }
    if (column) {
        *column = vga_state.regs.h.dl;
    }
}

void RPLVGA_ScrollWindow(signed char lines, byte attribute, byte top, byte left, byte bottom, byte right)
{
    if (lines >= 0) {
        vga_state.regs.h.ah = 6;
        vga_state.regs.h.al = lines;
    } else {
        vga_state.regs.h.ah = 7;
        vga_state.regs.h.al = lines;
        vga_state.regs.h.al = -vga_state.regs.h.al;
    }
    vga_state.regs.h.bh = attribute;
    vga_state.regs.h.ch = top;
    vga_state.regs.h.cl = left;
    vga_state.regs.h.dh = bottom;
    vga_state.regs.h.dl = right;
    RPLDPMI_RealInterrupt(0x10, &vga_state.regs, &vga_state.regs);
}

void RPLVGA_WriteCharacter(byte character, byte page, byte attribute, word count)
{
    vga_state.regs.h.ah = 9;
    vga_state.regs.h.al = character;
    vga_state.regs.h.bh = page;
    vga_state.regs.h.bl = attribute;
    vga_state.regs.w.cx = count;
    RPLDPMI_RealInterrupt(0x10, &vga_state.regs, &vga_state.regs);
}

void RPLVGA_WriteTeletype(byte character, byte page, byte color)
{
    vga_state.regs.h.ah = 0xe;
    vga_state.regs.h.al = character;
    vga_state.regs.h.bh = page;
    vga_state.regs.h.bl = color;
    RPLDPMI_RealInterrupt(0x10, &vga_state.regs, &vga_state.regs);
}

void RPLVGA_GrayScalePalette(byte first, byte count)
{
    vga_state.regs.w.ax = 0x101b;
    vga_state.regs.w.bx = first;
    vga_state.regs.w.cx = count;
    RPLDPMI_RealInterrupt(0x10, &vga_state.regs, &vga_state.regs);
}

byte RPLVGA_SetGrayScaleSumming(byte enabled)
{
    int flag;

    vga_state.regs.h.ah = 0x12;
    vga_state.regs.h.bl = 0x33;
    flag = enabled != 0;
    vga_state.regs.h.al = flag;
    RPLDPMI_RealInterrupt(0x10, &vga_state.regs, &vga_state.regs);
    return vga_state.regs.h.al == 0x12;
}

byte RPLVGA_SetCursorEmulation(byte enabled)
{
    int flag;

    vga_state.regs.h.ah = 0x12;
    vga_state.regs.h.bl = 0x34;
    flag = enabled != 0;
    vga_state.regs.h.al = flag;
    RPLDPMI_RealInterrupt(0x10, &vga_state.regs, &vga_state.regs);
    return vga_state.regs.h.al == 0x12;
}

void RPLVGA_Set320x240(void)
{
    RPLVGA_Unchain();
    outp(0x3c2, 0xe3);
    outpw(0x3d4, 0x2c11);
    outpw(0x3d4, 0x0d06);
    outpw(0x3d4, 0x3e07);
    outpw(0x3d4, 0xea10);
    outpw(0x3d4, 0xac11);
    outpw(0x3d4, 0xdf12);
    outpw(0x3d4, 0xe715);
    outpw(0x3d4, 0x0616);
}

void RPLVGA_Unchain(void)
{
    byte *buffer;

    buffer = RPLDPMI_SegmentToPointer(0xa000, 0);
    outpw(0x3c4, 0x0604);
    outpw(0x3d4, 0xe317);
    outpw(0x3d4, 0x0014);
    outpw(0x3c4, 0x0f02);
    memset(buffer + 1, 0, 0xffff);
    buffer[0] = 0;
}

void RPLVGA_SetDisplayStart(unsigned int start)
{
    outp(0x3d4, 0x0c);
    outp(0x3d5, start >> 8);
    outp(0x3d4, 0x0d);
    outp(0x3d5, start & 0xff);
}

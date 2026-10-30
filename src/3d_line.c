#include "3dglodef.h"

extern uint8 *phd_winptr;
extern sint32 phd_scrwidth;

void draw_poly_line(sint16 *iptr);

void Insert2DLine(sint32 x1, sint32 y1, sint32 x2, sint32 y2, sint32 z, char color)
{
    *(sort3dptr + 0) = (sint32)(info3dptr);
    *(sort3dptr + 1) = z;
    sort3dptr += 2;
    *(info3dptr + 0) = DRAW_POLY_LINE;
    *(info3dptr + 1) = (sint16)x1;
    *(info3dptr + 2) = (sint16)y1;
    *(info3dptr + 3) = (sint16)x2;
    *(info3dptr + 4) = (sint16)y2;
    *(info3dptr + 5) = (sint16)color;
    info3dptr += 6;
    surfacenum++;
}

sint16 *ins_poly_line(sint16 *objptr)
{
    PHD_VBUF *vn1, *vn2;
    sint32 zdepth;

    vn1 = &vbuf[*(objptr)];
    vn2 = &vbuf[*(objptr + 1)];
    if ((vn1->clip & vn2->clip) || vn1->clip < 0 || vn2->clip < 0)
        return objptr + 3;

    if (vn1->dist > vn2->dist)
        zdepth = vn1->dist;
    else
        zdepth = vn2->dist;
    *(sort3dptr + 0) = (sint32)(info3dptr);
    *(sort3dptr + 1) = zdepth;
    sort3dptr += 2;
    *(info3dptr + 0) = DRAW_POLY_LINE;
    *(info3dptr + 1) = (sint16)vn1->xs;
    *(info3dptr + 2) = (sint16)vn1->ys;
    *(info3dptr + 3) = (sint16)vn2->xs;
    *(info3dptr + 4) = (sint16)vn2->ys;
    *(info3dptr + 5) = *(objptr + 2);
    info3dptr += 6;
    surfacenum++;
    return objptr + 3;
}

void draw_line(sint32 x1, sint32 y1, sint32 x2, sint32 y2, char color)
{
    sint16 buf[5];

    buf[0] = (sint16)x1;
    buf[1] = (sint16)y1;
    buf[2] = (sint16)x2;
    buf[3] = (sint16)y2;
    buf[4] = (sint16)color;
    draw_poly_line(buf);
}

void draw_poly_line(sint16 *iptr)
{
    sint32 i, frak, fraksum, xdif, ydif, xadd, yadd;
    sint32 x1, y1, x2, y2;
    char lcolor;
    uint8 *drawptr;

    x1 = (sint32)(*(iptr + 0));
    y1 = (sint32)(*(iptr + 1));
    x2 = (sint32)(*(iptr + 2));
    y2 = (sint32)(*(iptr + 3));
    lcolor = (char)(*(iptr + 4));
    if (x2 < x1)
    {
        i = x2;
        x2 = x1;
        x1 = i;
        i = y2;
        y2 = y1;
        y1 = i;
    }
    if (x2 < 0 || x1 > phd_winxmax)
        return;
    if (x1 < 0)
    {
        y1 -= ((y2 - y1) * x1) / (x2 - x1);
        x1 = 0;
    }
    if (x2 > phd_winxmax)
    {
        y2 = y1 + ((y2 - y1) * (phd_winxmax - x1)) / (x2 - x1);
        x2 = phd_winxmax;
    }
    if (y2 < y1)
    {
        i = x2;
        x2 = x1;
        x1 = i;
        i = y2;
        y2 = y1;
        y1 = i;
    }
    if (y2 < 0 || y1 > phd_winymax)
        return;
    if (y1 < 0)
    {
        x1 -= ((x2 - x1) * y1) / (y2 - y1);
        y1 = 0;
    }
    if (y2 > phd_winymax)
    {
        x2 = x1 + ((x2 - x1) * (phd_winymax - y1)) / (y2 - y1);
        y2 = phd_winymax;
    }
    drawptr = phd_winptr + (phd_scrwidth * y1) + x1;
    xdif = x2 - x1;
    ydif = y2 - y1;
    if (xdif || ydif)
    {
        if (xdif >= 0)
            xadd = 1;
        else
        {
            xadd = -1;
            xdif = -xdif;
        }
        if (ydif >= 0)
            yadd = phd_scrwidth;
        else
        {
            yadd = -phd_scrwidth;
            ydif = -ydif;
        }
        fraksum = 0;
        if (xdif++ < ydif++)
        {
            frak = ((xdif << 16) / ydif);
            for (i = 0; i < ydif; i++)
            {
                *(drawptr) = lcolor;
                drawptr += yadd;
                fraksum += frak;
                if (fraksum >= 65536)
                {
                    drawptr += xadd;
                    fraksum -= 65536;
                }
            }
        }
        else
        {
            frak = ((ydif << 16) / xdif);
            for (i = 0; i < xdif; i++)
            {
                *(drawptr) = lcolor;
                drawptr += xadd;
                fraksum += frak;
                if (fraksum >= 65536)
                {
                    drawptr += yadd;
                    fraksum -= 65536;
                }
            }
        }
    }
    else
        *drawptr = lcolor;
}

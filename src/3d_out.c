#include "3dglodef.h"

static sint32 xgen_ymin;
static sint32 xgen_ymax;

typedef struct
{
    sint32 Xleft;
    sint32 Xright;
} XBUF_X;

typedef struct
{
    sint32 Xleft;
    sint32 Gleft;
    sint32 Xright;
    sint32 Gright;
} XBUF_XG;

typedef struct
{
    sint32 Xleft;
    sint32 Gleft;
    sint32 Uleft;
    sint32 Vleft;
    sint32 Xright;
    sint32 Gright;
    sint32 Uright;
    sint32 Vright;
} XBUF_XGUV;

typedef struct
{
    sint32 Xleft;
    sint32 Gleft;
    float UOZleft;
    float VOZleft;
    float OOZleft;
    sint32 Xright;
    sint32 Gright;
    float UOZright;
    float VOZright;
    float OOZright;
} XBUF_PERSP_FP;

extern XBUF_X xbuffer[];
extern uint8 *phd_winptr;
extern sint32 phd_scrwidth;

int xgen_x(sint16 *iptr);
int xgen_xg(sint16 *iptr);
int xgen_xguv(sint16 *iptr);
int xgen_xguvpersp_fp(sint16 *iptr);
void gtmap_persp16_fp(int ymin, int ymax, char *tptr);
void wgtmap_persp16_fp(int ymin, int ymax, char *tptr);
void flatA(int min_y, int max_y, char color);
void transA(int min_y, int max_y, sint16 colbase);
void gourA(int min_y, int max_y, sint16 colbase);
void gtmapA(int min_y, int max_y, char *tptr);
void wgtmapA(int min_y, int max_y, char *tptr);

void draw_poly_flat(sint16 *iptr)
{
    if (xgen_x(iptr + 1))
        flatA(xgen_ymin, xgen_ymax, (char)*(iptr));
}

void draw_poly_trans(sint16 *iptr)
{
    if (xgen_x(iptr + 1))
        transA(xgen_ymin, xgen_ymax, *(iptr));
}

void draw_poly_gouraud(sint16 *iptr)
{
    if (xgen_xg(iptr + 1))
        gourA(xgen_ymin, xgen_ymax, *(iptr));
}

void draw_poly_gtmap(sint16 *iptr)
{
    if (xgen_xguv(iptr + 1))
        gtmapA(xgen_ymin, xgen_ymax, texture_page_ptrs[*(iptr)]);
}

void draw_poly_wgtmap(sint16 *iptr)
{
    if (xgen_xguv(iptr + 1))
        wgtmapA(xgen_ymin, xgen_ymax, texture_page_ptrs[*(iptr)]);
}

void draw_poly_gtmap_persp(sint16 *iptr)
{
    if (xgen_xguvpersp_fp(iptr + 1))
        gtmap_persp16_fp(xgen_ymin, xgen_ymax, texture_page_ptrs[*(iptr)]);
}

void draw_poly_wgtmap_persp(sint16 *iptr)
{
    if (xgen_xguvpersp_fp(iptr + 1))
        wgtmap_persp16_fp(xgen_ymin, xgen_ymax, texture_page_ptrs[*(iptr)]);
}

typedef struct
{
    sint16 xs;
    sint16 ys;
} X_INFO;

int xgen_x(sint16 *iptr)
{
    X_INFO *ptr1, *ptr2;
    XBUF_X *xptr;
    int x, x_add;
    int y1, y2, ydif;
    int min_y, max_y;
    int numcoords;

    numcoords = (int)*(iptr++);
    ptr1 = (X_INFO *)iptr;
    ptr2 = ptr1;
    ptr1 += numcoords - 1;
    min_y = max_y = ptr1->ys;
    for (; numcoords > 0; numcoords--, ptr1 = ptr2, ptr2++)
    {
        y1 = ptr1->ys;
        y2 = ptr2->ys;
        if (y1 < y2)
        {
            if (y1 < min_y)
                min_y = y1;
            ydif = y2 - y1;
            x = ptr1->xs;
            x_add = ((ptr2->xs - x) << 16) / ydif;
            x = (x << 16) + 0x0ffff;
            xptr = xbuffer + y1;
            for (; y1 < y2; y1++, xptr++)
            {
                x += x_add;
                xptr->Xright = x;
            }
        }
        else if (y2 < y1)
        {
            if (y1 > max_y)
                max_y = y1;
            ydif = y1 - y2;
            x = ptr2->xs;
            x_add = ((ptr1->xs - x) << 16) / ydif;
            x = (x << 16) + 0x0001;
            xptr = xbuffer + y2;
            for (; y2 < y1; y2++, xptr++)
            {
                x += x_add;
                xptr->Xleft = x;
            }
        }
    }
    if (min_y == max_y)
        return (0);
    xgen_ymin = min_y;
    xgen_ymax = max_y;
    return (1);
}

typedef struct
{
    sint16 xs;
    sint16 ys;
    sint16 shade;
} XG_INFO;

int xgen_xg(sint16 *iptr)
{
    XG_INFO *ptr1, *ptr2;
    XBUF_XG *xptr;
    int g, g_add;
    int x, x_add;
    int y1, y2, ydif;
    int min_y, max_y;
    int numcoords;

    numcoords = (int)*(iptr++);
    ptr1 = (XG_INFO *)iptr;
    ptr2 = ptr1;
    ptr1 += numcoords - 1;
    min_y = max_y = ptr1->ys;
    for (; numcoords > 0; numcoords--, ptr1 = ptr2, ptr2++)
    {
        y1 = ptr1->ys;
        y2 = ptr2->ys;
        if (y1 < y2)
        {
            if (y1 < min_y)
                min_y = y1;
            ydif = y2 - y1;
            x = ptr1->xs;
            x_add = ((ptr2->xs - x) << 16) / ydif;
            x = (x << 16) + 0x0ffff;
            g = ptr1->shade << 8;
            g_add = ((ptr2->shade << 8) - g) / ydif;
            xptr = ((XBUF_XG *)xbuffer) + y1;
            for (; y1 < y2; y1++, xptr++)
            {
                x += x_add;
                g += g_add;
                xptr->Xright = x;
                xptr->Gright = g;
            }
        }
        else if (y2 < y1)
        {
            if (y1 > max_y)
                max_y = y1;
            ydif = y1 - y2;
            x = ptr2->xs;
            x_add = ((ptr1->xs - x) << 16) / ydif;
            x = (x << 16) + 0x0001;
            g = ptr2->shade << 8;
            g_add = ((ptr1->shade << 8) - g) / ydif;
            xptr = ((XBUF_XG *)xbuffer) + y2;
            for (; y2 < y1; y2++, xptr++)
            {
                x += x_add;
                g += g_add;
                xptr->Xleft = x;
                xptr->Gleft = g;
            }
        }
    }
    if (min_y == max_y)
        return (0);
    xgen_ymin = min_y;
    xgen_ymax = max_y;
    return (1);
}

typedef struct
{
    sint16 xs;
    sint16 ys;
    sint16 shade;
    uint16 u;
    uint16 v;
} UVG_INFO;

int xgen_xguv(sint16 *iptr)
{
    UVG_INFO *ptr1, *ptr2;
    XBUF_XGUV *xptr;
    int g, g_add;
    int x, x_add;
    int u, u_add;
    int v, v_add;
    int y1, y2, ydif;
    int min_y, max_y;
    int numcoords;

    numcoords = (int)*(iptr++);
    ptr1 = (UVG_INFO *)iptr;
    ptr2 = ptr1;
    ptr1 += numcoords - 1;
    min_y = max_y = ptr1->ys;
    for (; numcoords > 0; numcoords--, ptr1 = ptr2, ptr2++)
    {
        y1 = ptr1->ys;
        y2 = ptr2->ys;
        if (y1 < y2)
        {
            if (y1 < min_y)
                min_y = y1;
            ydif = y2 - y1;
            x = ptr1->xs;
            x_add = ((ptr2->xs - x) << 16) / ydif;
            x = (x << 16) + 0x0ffff;
            g = ptr1->shade << 8;
            g_add = ((ptr2->shade << 8) - g) / ydif;
            u = ptr1->u << 8;
            u_add = ((ptr2->u << 8) - u) / ydif;
            v = ptr1->v << 8;
            v_add = ((ptr2->v << 8) - v) / ydif;
            xptr = ((XBUF_XGUV *)xbuffer) + y1;
            for (; y1 < y2; y1++, xptr++)
            {
                x += x_add;
                g += g_add;
                u += u_add;
                v += v_add;
                xptr->Xright = x;
                xptr->Gright = g;
                xptr->Uright = u;
                xptr->Vright = v;
            }
        }
        else if (y2 < y1)
        {
            if (y1 > max_y)
                max_y = y1;
            ydif = y1 - y2;
            x = ptr2->xs;
            x_add = ((ptr1->xs - x) << 16) / ydif;
            x = (x << 16) + 0x0001;
            g = ptr2->shade << 8;
            g_add = ((ptr1->shade << 8) - g) / ydif;
            u = ptr2->u << 8;
            u_add = ((ptr1->u << 8) - u) / ydif;
            v = ptr2->v << 8;
            v_add = ((ptr1->v << 8) - v) / ydif;
            xptr = ((XBUF_XGUV *)xbuffer) + y2;
            for (; y2 < y1; y2++, xptr++)
            {
                x += x_add;
                g += g_add;
                u += u_add;
                v += v_add;
                xptr->Xleft = x;
                xptr->Gleft = g;
                xptr->Uleft = u;
                xptr->Vleft = v;
            }
        }
    }
    if (min_y == max_y)
        return (0);
    xgen_ymin = min_y;
    xgen_ymax = max_y;
    return (1);
}

typedef struct
{
    sint16 xs;
    sint16 ys;
    sint16 shade;
    float ooz;
    float uoz;
    float voz;
} UVGP_INFO;

int xgen_xguvpersp_fp(sint16 *iptr)
{
    UVGP_INFO *ptr1, *ptr2;
    XBUF_PERSP_FP *xptr;
    int g, g_add;
    int x, x_add;
    float uoz, uoz_add;
    float voz, voz_add;
    float ooz, ooz_add;
    int y1, y2, ydif;
    int min_y, max_y;
    int numcoords;

    numcoords = (int)*(iptr++);
    ptr2 = (UVGP_INFO *)iptr;
    ptr1 = ptr2 + numcoords - 1;
    min_y = max_y = ptr1->ys;
    for (; numcoords > 0; numcoords--, ptr1 = ptr2, ptr2++)
    {
        y1 = ptr1->ys;
        y2 = ptr2->ys;
        if (y1 < y2)
        {
            if (y1 < min_y)
                min_y = y1;
            ydif = y2 - y1;
            x = ptr1->xs;
            x_add = ((ptr2->xs - x) << 16) / ydif;
            x = (x << 16) + 0x0ffff;
            g = ptr1->shade << 8;
            g_add = ((ptr2->shade << 8) - g) / ydif;
            uoz = ptr1->uoz;
            uoz_add = (ptr2->uoz - uoz) / ydif;
            voz = ptr1->voz;
            voz_add = (ptr2->voz - voz) / ydif;
            ooz = ptr1->ooz / 256.0;
            ooz_add = (ptr2->ooz / 256.0 - ooz) / ydif;
            xptr = ((XBUF_PERSP_FP *)xbuffer) + y1;
            for (; y1 < y2; y1++, xptr++)
            {
                x += x_add;
                g += g_add;
                uoz += uoz_add;
                voz += voz_add;
                ooz += ooz_add;
                xptr->Xright = x;
                xptr->Gright = g;
                xptr->UOZright = uoz;
                xptr->VOZright = voz;
                xptr->OOZright = ooz;
            }
        }
        else if (y2 < y1)
        {
            if (y1 > max_y)
                max_y = y1;
            ydif = y1 - y2;
            x = ptr2->xs;
            x_add = ((ptr1->xs - x) << 16) / ydif;
            x = (x << 16) + 0x0001;
            g = ptr2->shade << 8;
            g_add = ((ptr1->shade << 8) - g) / ydif;
            uoz = ptr2->uoz;
            uoz_add = (ptr1->uoz - uoz) / ydif;
            voz = ptr2->voz;
            voz_add = (ptr1->voz - voz) / ydif;
            ooz = ptr2->ooz / 256.0;
            ooz_add = (ptr1->ooz / 256.0 - ooz) / ydif;
            xptr = ((XBUF_PERSP_FP *)xbuffer) + y2;
            for (; y2 < y1; y2++, xptr++)
            {
                x += x_add;
                g += g_add;
                uoz += uoz_add;
                voz += voz_add;
                ooz += ooz_add;
                xptr->Xleft = x;
                xptr->Gleft = g;
                xptr->UOZleft = uoz;
                xptr->VOZleft = voz;
                xptr->OOZleft = ooz;
            }
        }
    }
    if (min_y == max_y)
        return 0;    xgen_ymin = min_y;
    xgen_ymax = max_y;
    return 1;
}

void gtmap_persp16_fp(int ymin, int ymax, char *tptr)
{
    XBUF_PERSP_FP *dataptr;
    uint8 *lineptr, *pixptr;
    double ooz, oozadd;
    double uoz, uozadd;
    double voz, vozadd;
    double oozadd16, uozadd16, vozadd16;
    int start_g, add_g;
    int end_u, end_v;
    int start_u, start_v;
    int add_u, add_v;
    int start_x, end_x;
    int x1, x2, xsize;

    dataptr = ((XBUF_PERSP_FP *)xbuffer) + ymin;
    lineptr = phd_winptr + (ymin * phd_scrwidth);
    for (; ymin < ymax; ymin++, dataptr++, lineptr += phd_scrwidth)
    {
        start_x = dataptr->Xleft >> 16;
        end_x = dataptr->Xright >> 16;
        xsize = end_x - start_x;
        if (xsize > 0)
        {
            uoz = dataptr->UOZleft;
            uozadd = (dataptr->UOZright - uoz) / xsize;
            voz = dataptr->VOZleft;
            vozadd = (dataptr->VOZright - voz) / xsize;
            ooz = dataptr->OOZleft;
            oozadd = (dataptr->OOZright - ooz) / xsize;
            uozadd16 = uozadd * 16.0;
            vozadd16 = vozadd * 16.0;
            oozadd16 = oozadd * 16.0;
            start_g = dataptr->Gleft;
            add_g = (dataptr->Gright - start_g) / xsize;
            end_u = (int)(uoz / ooz);
            end_v = (int)(voz / ooz);
            x2 = start_x;
            pixptr = lineptr + x2;
            for (;;)
            {
                start_u = end_u;
                start_v = end_v;
                x1 = x2;
                x2 += 16;
                if (x2 >= end_x)
                    break;
                ooz += oozadd16;
                uoz += uozadd16;
                voz += vozadd16;
                end_u = (int)(uoz / ooz);
                end_v = (int)(voz / ooz);
                add_u = (end_u - start_u) >> 4;
                add_v = (end_v - start_v) >> 4;
                *(pixptr) = depthq_table[(start_g >> 16)][*(tptr + ((start_v >> 16) << 8) + (start_u >> 16))];
                start_u += add_u;
                start_v += add_v;
                start_g += add_g;
                *(pixptr + 1) = depthq_table[(start_g >> 16)][*(tptr + ((start_v >> 16) << 8) + (start_u >> 16))];
                start_u += add_u;
                start_v += add_v;
                start_g += add_g;
                *(pixptr + 2) = depthq_table[(start_g >> 16)][*(tptr + ((start_v >> 16) << 8) + (start_u >> 16))];
                start_u += add_u;
                start_v += add_v;
                start_g += add_g;
                *(pixptr + 3) = depthq_table[(start_g >> 16)][*(tptr + ((start_v >> 16) << 8) + (start_u >> 16))];
                start_u += add_u;
                start_v += add_v;
                start_g += add_g;
                *(pixptr + 4) = depthq_table[(start_g >> 16)][*(tptr + ((start_v >> 16) << 8) + (start_u >> 16))];
                start_u += add_u;
                start_v += add_v;
                start_g += add_g;
                *(pixptr + 5) = depthq_table[(start_g >> 16)][*(tptr + ((start_v >> 16) << 8) + (start_u >> 16))];
                start_u += add_u;
                start_v += add_v;
                start_g += add_g;
                *(pixptr + 6) = depthq_table[(start_g >> 16)][*(tptr + ((start_v >> 16) << 8) + (start_u >> 16))];
                start_u += add_u;
                start_v += add_v;
                start_g += add_g;
                *(pixptr + 7) = depthq_table[(start_g >> 16)][*(tptr + ((start_v >> 16) << 8) + (start_u >> 16))];
                start_u += add_u;
                start_v += add_v;
                start_g += add_g;
                *(pixptr + 8) = depthq_table[(start_g >> 16)][*(tptr + ((start_v >> 16) << 8) + (start_u >> 16))];
                start_u += add_u;
                start_v += add_v;
                start_g += add_g;
                *(pixptr + 9) = depthq_table[(start_g >> 16)][*(tptr + ((start_v >> 16) << 8) + (start_u >> 16))];
                start_u += add_u;
                start_v += add_v;
                start_g += add_g;
                *(pixptr + 10) = depthq_table[(start_g >> 16)][*(tptr + ((start_v >> 16) << 8) + (start_u >> 16))];
                start_u += add_u;
                start_v += add_v;
                start_g += add_g;
                *(pixptr + 11) = depthq_table[(start_g >> 16)][*(tptr + ((start_v >> 16) << 8) + (start_u >> 16))];
                start_u += add_u;
                start_v += add_v;
                start_g += add_g;
                *(pixptr + 12) = depthq_table[(start_g >> 16)][*(tptr + ((start_v >> 16) << 8) + (start_u >> 16))];
                start_u += add_u;
                start_v += add_v;
                start_g += add_g;
                *(pixptr + 13) = depthq_table[(start_g >> 16)][*(tptr + ((start_v >> 16) << 8) + (start_u >> 16))];
                start_u += add_u;
                start_v += add_v;
                start_g += add_g;
                *(pixptr + 14) = depthq_table[(start_g >> 16)][*(tptr + ((start_v >> 16) << 8) + (start_u >> 16))];
                start_u += add_u;
                start_v += add_v;
                start_g += add_g;
                *(pixptr + 15) = depthq_table[(start_g >> 16)][*(tptr + ((start_v >> 16) << 8) + (start_u >> 16))];
                start_g += add_g;
                pixptr += 16;
            }
            end_u = (int)(dataptr->UOZright / dataptr->OOZright);
            end_v = (int)(dataptr->VOZright / dataptr->OOZright);
            x2 = end_x - x1;
            add_u = (end_u - start_u) / x2;
            add_v = (end_v - start_v) / x2;
            for (; x2 > 0; x2--)
            {
                *(pixptr++) = depthq_table[start_g >> 16][*(tptr + ((start_v >> 16) << 8) + (start_u >> 16))];
                start_u += add_u;
                start_v += add_v;
                start_g += add_g;
            }
        }
    }
}

void wgtmap_persp16_fp(int ymin, int ymax, char *tptr)
{
    XBUF_PERSP_FP *dataptr;
    uint8 *lineptr, *pixptr;
    double ooz, oozadd;
    double uoz, uozadd;
    double voz, vozadd;
    double oozadd16, uozadd16, vozadd16;
    int start_g, add_g;
    int end_u, end_v;
    int start_u, start_v;
    int add_u, add_v;
    int start_x, end_x;
    int x1, x2, xsize;
    char texel;

    dataptr = ((XBUF_PERSP_FP *)xbuffer) + ymin;
    lineptr = phd_winptr + (ymin * phd_scrwidth);
    for (; ymin < ymax; ymin++, dataptr++, lineptr += phd_scrwidth)
    {
        start_x = dataptr->Xleft >> 16;
        end_x = dataptr->Xright >> 16;
        xsize = end_x - start_x;
        if (xsize > 0)
        {
            uoz = dataptr->UOZleft;
            uozadd = (dataptr->UOZright - uoz) / xsize;
            voz = dataptr->VOZleft;
            vozadd = (dataptr->VOZright - voz) / xsize;
            ooz = dataptr->OOZleft;
            oozadd = (dataptr->OOZright - ooz) / xsize;
            uozadd16 = uozadd * 16.0;
            vozadd16 = vozadd * 16.0;
            oozadd16 = oozadd * 16.0;
            start_g = dataptr->Gleft;
            add_g = (dataptr->Gright - start_g) / xsize;
            end_u = (int)(uoz / ooz);
            end_v = (int)(voz / ooz);
            x2 = start_x;
            pixptr = lineptr + x2;
            for (;;)
            {
                start_u = end_u;
                start_v = end_v;
                x1 = x2;
                x2 += 16;
                if (x2 >= end_x)
                    break;
                ooz += oozadd16;
                uoz += uozadd16;
                voz += vozadd16;
                end_u = (int)(uoz / ooz);
                end_v = (int)(voz / ooz);
                add_u = (end_u - start_u) >> 4;
                add_v = (end_v - start_v) >> 4;
                if ((texel = *(tptr + ((start_v >> 16) << 8) + (start_u >> 16))))
                    *(pixptr) = depthq_table[(start_g >> 16)][texel];
                start_u += add_u;
                start_v += add_v;
                start_g += add_g;
                if ((texel = *(tptr + ((start_v >> 16) << 8) + (start_u >> 16))))
                    *(pixptr + 1) = depthq_table[(start_g >> 16)][texel];
                start_u += add_u;
                start_v += add_v;
                start_g += add_g;
                if ((texel = *(tptr + ((start_v >> 16) << 8) + (start_u >> 16))))
                    *(pixptr + 2) = depthq_table[(start_g >> 16)][texel];
                start_u += add_u;
                start_v += add_v;
                start_g += add_g;
                if ((texel = *(tptr + ((start_v >> 16) << 8) + (start_u >> 16))))
                    *(pixptr + 3) = depthq_table[(start_g >> 16)][texel];
                start_u += add_u;
                start_v += add_v;
                start_g += add_g;
                if ((texel = *(tptr + ((start_v >> 16) << 8) + (start_u >> 16))))
                    *(pixptr + 4) = depthq_table[(start_g >> 16)][texel];
                start_u += add_u;
                start_v += add_v;
                start_g += add_g;
                if ((texel = *(tptr + ((start_v >> 16) << 8) + (start_u >> 16))))
                    *(pixptr + 5) = depthq_table[(start_g >> 16)][texel];
                start_u += add_u;
                start_v += add_v;
                start_g += add_g;
                if ((texel = *(tptr + ((start_v >> 16) << 8) + (start_u >> 16))))
                    *(pixptr + 6) = depthq_table[(start_g >> 16)][texel];
                start_u += add_u;
                start_v += add_v;
                start_g += add_g;
                if ((texel = *(tptr + ((start_v >> 16) << 8) + (start_u >> 16))))
                    *(pixptr + 7) = depthq_table[(start_g >> 16)][texel];
                start_u += add_u;
                start_v += add_v;
                start_g += add_g;
                if ((texel = *(tptr + ((start_v >> 16) << 8) + (start_u >> 16))))
                    *(pixptr + 8) = depthq_table[(start_g >> 16)][texel];
                start_u += add_u;
                start_v += add_v;
                start_g += add_g;
                if ((texel = *(tptr + ((start_v >> 16) << 8) + (start_u >> 16))))
                    *(pixptr + 9) = depthq_table[(start_g >> 16)][texel];
                start_u += add_u;
                start_v += add_v;
                start_g += add_g;
                if ((texel = *(tptr + ((start_v >> 16) << 8) + (start_u >> 16))))
                    *(pixptr + 10) = depthq_table[(start_g >> 16)][texel];
                start_u += add_u;
                start_v += add_v;
                start_g += add_g;
                if ((texel = *(tptr + ((start_v >> 16) << 8) + (start_u >> 16))))
                    *(pixptr + 11) = depthq_table[(start_g >> 16)][texel];
                start_u += add_u;
                start_v += add_v;
                start_g += add_g;
                if ((texel = *(tptr + ((start_v >> 16) << 8) + (start_u >> 16))))
                    *(pixptr + 12) = depthq_table[(start_g >> 16)][texel];
                start_u += add_u;
                start_v += add_v;
                start_g += add_g;
                if ((texel = *(tptr + ((start_v >> 16) << 8) + (start_u >> 16))))
                    *(pixptr + 13) = depthq_table[(start_g >> 16)][texel];
                start_u += add_u;
                start_v += add_v;
                start_g += add_g;
                if ((texel = *(tptr + ((start_v >> 16) << 8) + (start_u >> 16))))
                    *(pixptr + 14) = depthq_table[(start_g >> 16)][texel];
                start_u += add_u;
                start_v += add_v;
                start_g += add_g;
                if ((texel = *(tptr + ((start_v >> 16) << 8) + (start_u >> 16))))
                    *(pixptr + 15) = depthq_table[(start_g >> 16)][texel];
                start_g += add_g;
                pixptr += 16;
            }
            end_u = (int)(dataptr->UOZright / dataptr->OOZright);
            end_v = (int)(dataptr->VOZright / dataptr->OOZright);
            x2 = end_x - x1;
            add_u = (end_u - start_u) / x2;
            add_v = (end_v - start_v) / x2;
            for (; x2 > 0; x2--, pixptr++)
            {
                if ((texel = *(tptr + ((start_v >> 16) << 8) + (start_u >> 16))))
                    *(pixptr) = depthq_table[(start_g >> 16)][texel];
                start_u += add_u;
                start_v += add_v;
                start_g += add_g;
            }
        }
    }
}

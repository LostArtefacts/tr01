#include "3dglodef.h"

#define DPQ_START 12288

extern sint32 phd_viewdist;
extern uint8 *phd_winptr;
extern sint32 phd_scrwidth;

void S_DrawSpriteAbs(sint32 x, sint32 y, sint32 z, sint16 sprnum, sint16 shade)
{
    PHDSPRITESTRUCT *dptr;
    sint32 xv, yv, zv, zp;
    sint32 x1, y1, x2, y2;

    x -= *(w2v_matrix + M03);
    y -= *(w2v_matrix + M13);
    z -= *(w2v_matrix + M23);
    if (x < -phd_viewdist || x > phd_viewdist || y < -phd_viewdist || y > phd_viewdist || z < -phd_viewdist || z > phd_viewdist)
        return;
    zv = *(w2v_matrix + M20) * x + *(w2v_matrix + M21) * y + *(w2v_matrix + M22) * z;
    if (zv < phd_znear || zv > phd_zfar)
        return;
    xv = *(w2v_matrix + M00) * x + *(w2v_matrix + M01) * y + *(w2v_matrix + M02) * z;
    yv = *(w2v_matrix + M10) * x + *(w2v_matrix + M11) * y + *(w2v_matrix + M12) * z;
    zp = zv / phd_persp;
    dptr = &phdsprinfo[sprnum];
    x1 = (sint32)((xv + (dptr->x1 << W2V_SHIFT)) / zp + phd_centerx);
    y1 = (sint32)((yv + (dptr->y1 << W2V_SHIFT)) / zp + phd_centery);
    x2 = (sint32)((xv + (dptr->x2 << W2V_SHIFT)) / zp + phd_centerx);
    y2 = (sint32)((yv + (dptr->y2 << W2V_SHIFT)) / zp + phd_centery);
    if (x2 < 0 || y2 < 0 || x1 >= phd_winwidth || y1 >= phd_winheight)
        return;
    if (zv > (DPQ_START << W2V_SHIFT))
    {
        shade = shade + (zv >> W2V_SHIFT) - DPQ_START;
        if (shade > 0x1fff)
            return;
    }
    *(sort3dptr) = (sint32)(info3dptr);
    *(sort3dptr + 1) = zv;
    sort3dptr += 2;
    *(info3dptr) = DRAW_SCALED_SPRITE;
    *(info3dptr + 1) = (sint16)x1;
    *(info3dptr + 2) = (sint16)y1;
    *(info3dptr + 3) = (sint16)x2;
    *(info3dptr + 4) = (sint16)y2;
    *(info3dptr + 5) = sprnum;
    *(info3dptr + 6) = shade;
    info3dptr += 7;
    surfacenum++;
}

void S_DrawSpriteRel(sint32 x, sint32 y, sint32 z, sint16 sprnum, sint16 shade)
{
    PHDSPRITESTRUCT *dptr;
    sint32 xv, yv, zv, zp;
    sint32 x1, y1, x2, y2;

    zv = *(phd_mxptr + M20) * x + *(phd_mxptr + M21) * y + *(phd_mxptr + M22) * z + *(phd_mxptr + M23);
    if (zv < phd_znear || zv > phd_zfar)
        return;
    xv = *(phd_mxptr + M00) * x + *(phd_mxptr + M01) * y + *(phd_mxptr + M02) * z + *(phd_mxptr + M03);
    yv = *(phd_mxptr + M10) * x + *(phd_mxptr + M11) * y + *(phd_mxptr + M12) * z + *(phd_mxptr + M13);
    zp = zv / phd_persp;
    dptr = &phdsprinfo[sprnum];
    x1 = (sint32)((xv + (dptr->x1 << W2V_SHIFT)) / zp + phd_centerx);
    y1 = (sint32)((yv + (dptr->y1 << W2V_SHIFT)) / zp + phd_centery);
    x2 = (sint32)((xv + (dptr->x2 << W2V_SHIFT)) / zp + phd_centerx);
    y2 = (sint32)((yv + (dptr->y2 << W2V_SHIFT)) / zp + phd_centery);
    if (x2 < 0 || y2 < 0 || x1 >= phd_winwidth || y1 >= phd_winheight)
        return;
    if (zv > (DPQ_START << W2V_SHIFT))
    {
        shade = shade + (zv >> W2V_SHIFT) - DPQ_START;
        if (shade > 0x1fff)
            return;
    }
    *(sort3dptr) = (sint32)(info3dptr);
    *(sort3dptr + 1) = zv;
    sort3dptr += 2;
    *(info3dptr) = DRAW_SCALED_SPRITE;
    *(info3dptr + 1) = (sint16)x1;
    *(info3dptr + 2) = (sint16)y1;
    *(info3dptr + 3) = (sint16)x2;
    *(info3dptr + 4) = (sint16)y2;
    *(info3dptr + 5) = sprnum;
    *(info3dptr + 6) = shade;
    info3dptr += 7;
    surfacenum++;
}

void S_DrawPickup(sint32 x, sint32 y, sint32 scale, sint16 sprnum, sint16 shade, uint16 flags)
{
    PHDSPRITESTRUCT *sptr;
    sint16 x1, y1, x2, y2;

    sptr = &phdsprinfo[sprnum];
    x1 = (sint16)(((sptr->x1 * scale) >> 16) + x);
    x2 = (sint16)(((sptr->x2 * scale) >> 16) + x);
    y1 = (sint16)(((sptr->y1 * scale) >> 16) + y);
    y2 = (sint16)(((sptr->y2 * scale) >> 16) + y);
    if (x2 < 0 || y2 < 0 || x1 >= phd_winwidth || y1 >= phd_winheight)
        return;
    *(sort3dptr) = (sint32)(info3dptr);
    *(sort3dptr + 1) = 0;
    sort3dptr += 2;
    *(info3dptr) = DRAW_SCALED_SPRITE;
    *(info3dptr + 1) = x1;
    *(info3dptr + 2) = y1;
    *(info3dptr + 3) = x2;
    *(info3dptr + 4) = y2;
    *(info3dptr + 5) = sprnum;
    *(info3dptr + 6) = shade;
    info3dptr += 7;
    surfacenum++;
}

sint16 *ins_room_sprite(sint16 *objptr, int num)
{
    PHD_VBUF *vn;
    sint32 x1, y1, x2, y2, zv;
    PHDSPRITESTRUCT *sptr;

    for (; num > 0; num--, objptr += 2)
    {
        vn = &vbuf[*(objptr)];
        if (vn->clip < 0)
            continue;
        zv = vn->zv / phd_persp;
        sptr = &phdsprinfo[*(objptr + 1)];
        x1 = (sint32)((vn->xv + (sptr->x1 << W2V_SHIFT)) / zv + phd_centerx);
        y1 = (sint32)((vn->yv + (sptr->y1 << W2V_SHIFT)) / zv + phd_centery);
        x2 = (sint32)((vn->xv + (sptr->x2 << W2V_SHIFT)) / zv + phd_centerx);
        y2 = (sint32)((vn->yv + (sptr->y2 << W2V_SHIFT)) / zv + phd_centery);
        if (x2 < phd_left || y2 < phd_top || x1 >= phd_right || y1 >= phd_bottom)
            continue;
        *(sort3dptr) = (sint32)(info3dptr);
        *(sort3dptr + 1) = vn->zv;
        sort3dptr += 2;
        *(info3dptr) = DRAW_SCALED_SPRITE;
        *(info3dptr + 1) = (sint16)x1;
        *(info3dptr + 2) = (sint16)y1;
        *(info3dptr + 3) = (sint16)x2;
        *(info3dptr + 4) = (sint16)y2;
        *(info3dptr + 5) = *(objptr + 1);
        *(info3dptr + 6) = vn->g;
        info3dptr += 7;
        surfacenum++;
    }
    return objptr;
}

void draw_scaled_spriteC(sint16 *inptr)
{
    sint32 x1, y1, x2, y2;
    sint32 xdif;
    sint32 u, ustart, uadd;
    sint32 vstart, vadd, pixadd;
    uint8 *pixptr, *dqptr;
    uint8 *ssptr, *slptr;
    uint8 pix;
    PHDSPRITESTRUCT *sptr;

    x1 = (int)*(inptr);
    y1 = (int)*(inptr + 1);
    x2 = (int)*(inptr + 2);
    y2 = (int)*(inptr + 3);
    if (x2 <= x1 || y2 <= y1 || x2 <= 0 || y2 <= 0 || x1 >= phd_winxmax || y1 >= phd_winymax)
        return;
    dqptr = depthq_table[(*(inptr + 5)) >> 8];
    sptr = &phdsprinfo[*(inptr + 4)];
    vadd = (int)((sptr->height << 8) / (y2 - y1));
    uadd = (int)((sptr->width << 8) / (x2 - x1));
    ssptr = (uint8 *)texture_page_ptrs[sptr->tpage] + sptr->offset;
    ustart = vstart = 0x4000;
    if (x1 < 0)
    {
        ustart -= uadd * x1;
        x1 = 0;
    }
    if (y1 < 0)
    {
        vstart -= vadd * y1;
        y1 = 0;
    }
    if (x2 > phd_winxmax)
        x2 = phd_winxmax;
    if (y2 > phd_winymax)
        y2 = phd_winymax;
    x2 -= x1;
    y2 -= y1;
    pixptr = phd_winptr + y1 * phd_scrwidth + x1;
    pixadd = phd_scrwidth - x2;
    if (dqptr == depthq_table[16])
    {
        for (; y2 > 0; y2--)
        {
            slptr = ssptr + ((vstart >> 16) << 8);
            u = ustart;
            for (xdif = x2; xdif > 0; xdif--)
            {
                if ((pix = *(slptr + (u >> 16))))
                    *(pixptr) = pix;
                u += uadd;
                pixptr++;
            }
            pixptr += pixadd;
            vstart += vadd;
        }
    }
    else
    {
        for (; y2 > 0; y2--)
        {
            slptr = ssptr + ((vstart >> 16) << 8);
            u = ustart;
            for (xdif = x2; xdif > 0; xdif--)
            {
                if ((pix = *(slptr + (u >> 16))))
                    *(pixptr) = *(dqptr + pix);
                u += uadd;
                pixptr++;
            }
            pixptr += pixadd;
            vstart += vadd;
        }
    }
}

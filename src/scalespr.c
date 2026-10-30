#include "3dglodef.h"

#define DPQ_START 12288

extern sint32 phd_viewdist;

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

#include "3dglodef.h"

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

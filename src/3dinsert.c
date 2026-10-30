#include "3dglodef.h"

typedef struct
{
    float xv, yv, zv;
    float xs, ys;
    float u, v;
    float g;
} POINT_INFO;

typedef struct
{
    sint16 xs;
    sint16 ys;
    sint16 g;
    float ooz;
    float u;
    float v;
} OUTPUT_INFO;

extern float phd_leftfloat;
extern float phd_rightfloat;
extern float phd_topfloat;
extern float phd_bottomfloat;

int visible_zclip(PHD_VBUF *vn1, PHD_VBUF *vn2, PHD_VBUF *vn3);

static float one = 65536.0 * 8.0 * 16384.0;

int ZedClipper(int number, POINT_INFO *input, VERTEX_INFO *output)
{
    int i, j;
    POINT_INFO *A, *B, point;
    float clipper;

    B = &input[number - 1];
    for (i = j = 0; i < number; i++)
    {
        A = B;
        B = &input[i];
        if (A->zv < phd_znear)
        {
            if (B->zv < phd_znear)
                continue;
            clipper = (phd_znear - B->zv) / (A->zv - B->zv);
            point.xv = B->xv + (A->xv - B->xv) * clipper;
            point.yv = B->yv + (A->yv - B->yv) * clipper;
            point.xs = phd_persp * point.xv / phd_znear + phd_centerx;
            point.ys = phd_persp * point.yv / phd_znear + phd_centery;
            point.u = B->u + (A->u - B->u) * clipper;
            point.v = B->v + (A->v - B->v) * clipper;
            point.g = B->g + (A->g - B->g) * clipper;
            output[j].x = point.xs;
            output[j].y = point.ys;
            output[j].ooz = one / phd_znear;
            output[j].g = point.g;
            output[j].u = point.u * output[j].ooz;
            output[j].v = point.v * output[j].ooz;
            j++;
        }
        if (B->zv < phd_znear)
        {
            clipper = (phd_znear - B->zv) / (A->zv - B->zv);
            point.xv = B->xv + (A->xv - B->xv) * clipper;
            point.yv = B->yv + (A->yv - B->yv) * clipper;
            point.xs = phd_persp * point.xv / phd_znear + phd_centerx;
            point.ys = phd_persp * point.yv / phd_znear + phd_centery;
            point.u = B->u + (A->u - B->u) * clipper;
            point.v = B->v + (A->v - B->v) * clipper;
            point.g = B->g + (A->g - B->g) * clipper;
            output[j].x = point.xs;
            output[j].y = point.ys;
            output[j].ooz = one / phd_znear;
            output[j].g = point.g;
            output[j].u = point.u * output[j].ooz;
            output[j].v = point.v * output[j].ooz;
            j++;
        }
        else
        {
            output[j].x = B->xs;
            output[j].y = B->ys;
            output[j].ooz = one / B->zv;
            output[j].g = B->g;
            output[j].u = B->u * output[j].ooz;
            output[j].v = B->v * output[j].ooz;
            j++;
        }
    }
    if (j < 3)
        return 0;
    return j;
}

int XYGUVClipper(int number, VERTEX_INFO *input)
{
    int i, j;
    VERTEX_INFO output[8], *A, *B;
    float clipper;

    B = &input[number - 1];
    for (i = j = 0; i < number; i++)
    {
        A = B;
        B = &input[i];
        if (A->x < phd_leftfloat)
        {
            if (B->x < phd_leftfloat)
                continue;
            clipper = (phd_leftfloat - B->x) / (A->x - B->x);
            output[j].ooz = B->ooz + (A->ooz - B->ooz) * clipper;
            output[j].u = B->u + (A->u - B->u) * clipper;
            output[j].v = B->v + (A->v - B->v) * clipper;
            output[j].g = B->g + (A->g - B->g) * clipper;
            output[j].x = phd_leftfloat;
            output[j++].y = B->y + (A->y - B->y) * clipper;
        }
        else if (A->x > phd_rightfloat)
        {
            if (B->x > phd_rightfloat)
                continue;
            clipper = (phd_rightfloat - B->x) / (A->x - B->x);
            output[j].ooz = B->ooz + (A->ooz - B->ooz) * clipper;
            output[j].u = B->u + (A->u - B->u) * clipper;
            output[j].v = B->v + (A->v - B->v) * clipper;
            output[j].g = B->g + (A->g - B->g) * clipper;
            output[j].x = phd_rightfloat;
            output[j++].y = B->y + (A->y - B->y) * clipper;
        }
        if (B->x < phd_leftfloat)
        {
            clipper = (phd_leftfloat - B->x) / (A->x - B->x);
            output[j].ooz = B->ooz + (A->ooz - B->ooz) * clipper;
            output[j].u = B->u + (A->u - B->u) * clipper;
            output[j].v = B->v + (A->v - B->v) * clipper;
            output[j].g = B->g + (A->g - B->g) * clipper;
            output[j].x = phd_leftfloat;
            output[j++].y = B->y + (A->y - B->y) * clipper;
        }
        else if (B->x > phd_rightfloat)
        {
            clipper = (phd_rightfloat - B->x) / (A->x - B->x);
            output[j].ooz = B->ooz + (A->ooz - B->ooz) * clipper;
            output[j].u = B->u + (A->u - B->u) * clipper;
            output[j].v = B->v + (A->v - B->v) * clipper;
            output[j].g = B->g + (A->g - B->g) * clipper;
            output[j].x = phd_rightfloat;
            output[j++].y = B->y + (A->y - B->y) * clipper;
        }
        else
        {
            output[j].x = B->x;
            output[j].y = B->y;
            output[j].g = B->g;
            output[j].ooz = B->ooz;
            output[j].u = B->u;
            output[j++].v = B->v;
        }
    }
    if (j < 3)
        return 0;
    number = j;
    B = &output[number - 1];
    for (i = j = 0; i < number; i++)
    {
        A = B;
        B = &output[i];
        if (A->y < phd_topfloat)
        {
            if (B->y < phd_topfloat)
                continue;
            clipper = (phd_topfloat - B->y) / (A->y - B->y);
            input[j].ooz = B->ooz + (A->ooz - B->ooz) * clipper;
            input[j].u = B->u + (A->u - B->u) * clipper;
            input[j].v = B->v + (A->v - B->v) * clipper;
            input[j].g = B->g + (A->g - B->g) * clipper;
            input[j].x = B->x + (A->x - B->x) * clipper;
            input[j++].y = phd_topfloat;
        }
        else if (A->y > phd_bottomfloat)
        {
            if (B->y > phd_bottomfloat)
                continue;
            clipper = (phd_bottomfloat - B->y) / (A->y - B->y);
            input[j].ooz = B->ooz + (A->ooz - B->ooz) * clipper;
            input[j].u = B->u + (A->u - B->u) * clipper;
            input[j].v = B->v + (A->v - B->v) * clipper;
            input[j].g = B->g + (A->g - B->g) * clipper;
            input[j].x = B->x + (A->x - B->x) * clipper;
            input[j++].y = phd_bottomfloat;
        }
        if (B->y < phd_topfloat)
        {
            clipper = (phd_topfloat - B->y) / (A->y - B->y);
            input[j].ooz = B->ooz + (A->ooz - B->ooz) * clipper;
            input[j].u = B->u + (A->u - B->u) * clipper;
            input[j].v = B->v + (A->v - B->v) * clipper;
            input[j].g = B->g + (A->g - B->g) * clipper;
            input[j].x = B->x + (A->x - B->x) * clipper;
            input[j++].y = phd_topfloat;
        }
        else if (B->y > phd_bottomfloat)
        {
            clipper = (phd_bottomfloat - B->y) / (A->y - B->y);
            input[j].ooz = B->ooz + (A->ooz - B->ooz) * clipper;
            input[j].u = B->u + (A->u - B->u) * clipper;
            input[j].v = B->v + (A->v - B->v) * clipper;
            input[j].g = B->g + (A->g - B->g) * clipper;
            input[j].x = B->x + (A->x - B->x) * clipper;
            input[j++].y = phd_bottomfloat;
        }
        else
        {
            input[j].x = B->x;
            input[j].y = B->y;
            input[j].g = B->g;
            input[j].ooz = B->ooz;
            input[j].u = B->u;
            input[j++].v = B->v;
        }
    }
    if (j < 3)
        return 0;
    return j;
}

sint16 *ins_roomGT4(sint16 *objptr, int number)
{
    PHD_VBUF *vn1, *vn2, *vn3, *vn4;
    PHDTEXTURESTRUCT *tex;
    VERTEX_INFO *v;
    POINT_INFO point[4], *p;
    OUTPUT_INFO *outptr;
    int i, npoints;
    sint32 zdepth;

    for (; number > 0; number--, objptr += 5)
    {
        vn1 = &vbuf[*(objptr)];
        vn2 = &vbuf[*(objptr + 1)];
        vn3 = &vbuf[*(objptr + 2)];
        vn4 = &vbuf[*(objptr + 3)];
        if (vn1->clip & vn2->clip & vn3->clip & vn4->clip)
            continue;
        if (vn1->clip < 0 || vn2->clip < 0 || vn3->clip < 0 || vn4->clip < 0)
        {
            if (!visible_zclip(vn1, vn2, vn3))
                continue;
            tex = &phdtextinfo[*(objptr + 4)];
            p = point;
            p->xv = (float)vn1->xv;
            p->yv = (float)vn1->yv;
            p->zv = (float)vn1->zv;
            p->xs = (float)vn1->xs;
            p->ys = (float)vn1->ys;
            p->g = (float)vn1->g;
            p->u = (float)tex->u1;
            p->v = (float)tex->v1;
            p++;
            p->xv = (float)vn2->xv;
            p->yv = (float)vn2->yv;
            p->zv = (float)vn2->zv;
            p->xs = (float)vn2->xs;
            p->ys = (float)vn2->ys;
            p->g = (float)vn2->g;
            p->u = (float)tex->u2;
            p->v = (float)tex->v2;
            p++;
            p->xv = (float)vn3->xv;
            p->yv = (float)vn3->yv;
            p->zv = (float)vn3->zv;
            p->xs = (float)vn3->xs;
            p->ys = (float)vn3->ys;
            p->g = (float)vn3->g;
            p->u = (float)tex->u3;
            p->v = (float)tex->v3;
            p++;
            p->xv = (float)vn4->xv;
            p->yv = (float)vn4->yv;
            p->zv = (float)vn4->zv;
            p->xs = (float)vn4->xs;
            p->ys = (float)vn4->ys;
            p->g = (float)vn4->g;
            p->u = (float)tex->u4;
            p->v = (float)tex->v4;
            npoints = ZedClipper(4, point, v_buffer);
            if (npoints)
                npoints = XYGUVClipper(npoints, v_buffer);
        }
        else
        {
            if ((sint32)((vn3->xs - vn2->xs) * (vn1->ys - vn2->ys) - (vn1->xs - vn2->xs) * (vn3->ys - vn2->ys)) < 0)
                continue;
            tex = &phdtextinfo[*(objptr + 4)];
            v = v_buffer;
            v->x = (float)vn1->xs;
            v->y = (float)vn1->ys;
            v->ooz = one / vn1->zv;
            v->g = (float)vn1->g;
            v->u = tex->u1 * v->ooz;
            v->v = tex->v1 * v->ooz;
            v++;
            v->x = (float)vn2->xs;
            v->y = (float)vn2->ys;
            v->ooz = one / vn2->zv;
            v->g = (float)vn2->g;
            v->u = tex->u2 * v->ooz;
            v->v = tex->v2 * v->ooz;
            v++;
            v->x = (float)vn3->xs;
            v->y = (float)vn3->ys;
            v->ooz = one / vn3->zv;
            v->g = (float)vn3->g;
            v->u = tex->u3 * v->ooz;
            v->v = tex->v3 * v->ooz;
            v++;
            v->x = (float)vn4->xs;
            v->y = (float)vn4->ys;
            v->ooz = one / vn4->zv;
            v->g = (float)vn4->g;
            v->u = tex->u4 * v->ooz;
            v->v = tex->v4 * v->ooz;
            npoints = 4;
            if (vn1->clip || vn2->clip || vn3->clip || vn4->clip)
                npoints = XYGUVClipper(npoints, v_buffer);
        }
        if (npoints)
        {
            zdepth = vn1->zv;
            if (vn2->zv > zdepth)
                zdepth = vn2->zv;
            if (vn3->zv > zdepth)
                zdepth = vn3->zv;
            if (vn4->zv > zdepth)
                zdepth = vn4->zv;
            *(sort3dptr) = (sint32)info3dptr;
            *(sort3dptr + 1) = zdepth;
            sort3dptr += 2;
            if (zdepth < perspective_distance)
            {
                *(info3dptr) = tex->drawtype + (DRAW_POLY_GTMAP_PERSPECTIVE - DRAW_POLY_GTMAP);
                *(info3dptr + 1) = tex->tpage;
                *(info3dptr + 2) = npoints;
                outptr = (OUTPUT_INFO *)(info3dptr + 3);
                for (i = 0, v = v_buffer; i < npoints; i++, v++, outptr++)
                {
                    outptr->xs = (sint16)v->x;
                    outptr->ys = (sint16)v->y;
                    outptr->g = (sint16)v->g;
                    outptr->ooz = v->ooz;
                    outptr->u = v->u;
                    outptr->v = v->v;
                }
                info3dptr = (sint16 *)outptr;
            }
            else
            {
                *((uint32 *)info3dptr) = *((uint32 *)&tex->drawtype);
                *(info3dptr + 2) = npoints;
                info3dptr += 3;
                for (i = 0, v = v_buffer; i < npoints; i++, v++, info3dptr += 5)
                {
                    *(info3dptr) = (sint16)v->x;
                    *(info3dptr + 1) = (sint16)v->y;
                    *(info3dptr + 2) = (sint16)v->g;
                    *(info3dptr + 3) = (sint16)(v->u / v->ooz);
                    *(info3dptr + 4) = (sint16)(v->v / v->ooz);
                }
            }
            surfacenum++;
        }
    }
    return objptr;
}

sint16 *ins_roomGT3(sint16 *objptr, int number)
{
    PHD_VBUF *vn1, *vn2, *vn3;
    PHDTEXTURESTRUCT *tex;
    OUTPUT_INFO *outptr;
    VERTEX_INFO *v;
    POINT_INFO point[3], *p;
    int i, npoints;
    sint32 zdepth;

    for (; number > 0; number--, objptr += 4)
    {
        vn1 = &vbuf[*(objptr)];
        vn2 = &vbuf[*(objptr + 1)];
        vn3 = &vbuf[*(objptr + 2)];
        if (vn1->clip & vn2->clip & vn3->clip)
            continue;
        if (vn1->clip < 0 || vn2->clip < 0 || vn3->clip < 0)
        {
            if (!visible_zclip(vn1, vn2, vn3))
                continue;
            tex = &phdtextinfo[*(objptr + 3)];
            p = point;
            p->xv = (float)vn1->xv;
            p->yv = (float)vn1->yv;
            p->zv = (float)vn1->zv;
            p->xs = (float)vn1->xs;
            p->ys = (float)vn1->ys;
            p->g = (float)vn1->g;
            p->u = (float)tex->u1;
            p->v = (float)tex->v1;
            p++;
            p->xv = (float)vn2->xv;
            p->yv = (float)vn2->yv;
            p->zv = (float)vn2->zv;
            p->xs = (float)vn2->xs;
            p->ys = (float)vn2->ys;
            p->g = (float)vn2->g;
            p->u = (float)tex->u2;
            p->v = (float)tex->v2;
            p++;
            p->xv = (float)vn3->xv;
            p->yv = (float)vn3->yv;
            p->zv = (float)vn3->zv;
            p->xs = (float)vn3->xs;
            p->ys = (float)vn3->ys;
            p->g = (float)vn3->g;
            p->u = (float)tex->u3;
            p->v = (float)tex->v3;
            npoints = ZedClipper(3, point, v_buffer);
            if (npoints)
                npoints = XYGUVClipper(npoints, v_buffer);
        }
        else
        {
            if ((sint32)((vn3->xs - vn2->xs) * (vn1->ys - vn2->ys) - (vn1->xs - vn2->xs) * (vn3->ys - vn2->ys)) < 0)
                continue;
            tex = &phdtextinfo[*(objptr + 3)];
            v = v_buffer;
            v->x = (float)vn1->xs;
            v->y = (float)vn1->ys;
            v->ooz = one / vn1->zv;
            v->g = (float)vn1->g;
            v->u = tex->u1 * v->ooz;
            v->v = tex->v1 * v->ooz;
            v++;
            v->x = (float)vn2->xs;
            v->y = (float)vn2->ys;
            v->ooz = one / vn2->zv;
            v->g = (float)vn2->g;
            v->u = tex->u2 * v->ooz;
            v->v = tex->v2 * v->ooz;
            v++;
            v->x = (float)vn3->xs;
            v->y = (float)vn3->ys;
            v->ooz = one / vn3->zv;
            v->g = (float)vn3->g;
            v->u = tex->u3 * v->ooz;
            v->v = tex->v3 * v->ooz;
            npoints = 3;
            if (vn1->clip || vn2->clip || vn3->clip)
                npoints = XYGUVClipper(npoints, v_buffer);
        }
        if (npoints)
        {
            zdepth = vn1->zv;
            if (vn2->zv > zdepth)
                zdepth = vn2->zv;
            if (vn3->zv > zdepth)
                zdepth = vn3->zv;
            *(sort3dptr) = (sint32)info3dptr;
            *(sort3dptr + 1) = zdepth;
            sort3dptr += 2;
            if (zdepth < perspective_distance)
            {
                *(info3dptr) = tex->drawtype + (DRAW_POLY_GTMAP_PERSPECTIVE - DRAW_POLY_GTMAP);
                *(info3dptr + 1) = tex->tpage;
                *(info3dptr + 2) = npoints;
                outptr = (OUTPUT_INFO *)(info3dptr + 3);
                for (i = 0, v = v_buffer; i < npoints; i++, v++, outptr++)
                {
                    outptr->xs = (sint16)v->x;
                    outptr->ys = (sint16)v->y;
                    outptr->g = (sint16)v->g;
                    outptr->ooz = v->ooz;
                    outptr->u = v->u;
                    outptr->v = v->v;
                }
                info3dptr = (sint16 *)outptr;
            }
            else
            {
                *((uint32 *)info3dptr) = *((uint32 *)&tex->drawtype);
                *(info3dptr + 2) = npoints;
                info3dptr += 3;
                for (i = 0, v = v_buffer; i < npoints; i++, v++, info3dptr += 5)
                {
                    *(info3dptr) = (sint16)v->x;
                    *(info3dptr + 1) = (sint16)v->y;
                    *(info3dptr + 2) = (sint16)v->g;
                    *(info3dptr + 3) = (sint16)(v->u / v->ooz);
                    *(info3dptr + 4) = (sint16)(v->v / v->ooz);
                }
            }
            surfacenum++;
        }
    }
    return objptr;
}

sint16 *ins_objectGT4persp(sint16 *objptr, int number)
{
    PHD_VBUF *vn1, *vn2, *vn3, *vn4;
    PHDTEXTURESTRUCT *tex;
    VERTEX_INFO *v;
    POINT_INFO point[4], *p;
    OUTPUT_INFO *outptr;
    int i, npoints;
    sint32 zdepth;

    for (; number > 0; number--, objptr += 5)
    {
        vn1 = &vbuf[*(objptr)];
        vn2 = &vbuf[*(objptr + 1)];
        vn3 = &vbuf[*(objptr + 2)];
        vn4 = &vbuf[*(objptr + 3)];
        if (vn1->clip & vn2->clip & vn3->clip & vn4->clip)
            continue;
        if (vn1->clip < 0 || vn2->clip < 0 || vn3->clip < 0 || vn4->clip < 0)
        {
            if (!visible_zclip(vn1, vn2, vn3))
                continue;
            tex = &phdtextinfo[*(objptr + 4)];
            p = point;
            p->xv = (float)vn1->xv;
            p->yv = (float)vn1->yv;
            p->zv = (float)vn1->zv;
            p->xs = (float)vn1->xs;
            p->ys = (float)vn1->ys;
            p->g = (float)vn1->g;
            p->u = (float)tex->u1;
            p->v = (float)tex->v1;
            p++;
            p->xv = (float)vn2->xv;
            p->yv = (float)vn2->yv;
            p->zv = (float)vn2->zv;
            p->xs = (float)vn2->xs;
            p->ys = (float)vn2->ys;
            p->g = (float)vn2->g;
            p->u = (float)tex->u2;
            p->v = (float)tex->v2;
            p++;
            p->xv = (float)vn3->xv;
            p->yv = (float)vn3->yv;
            p->zv = (float)vn3->zv;
            p->xs = (float)vn3->xs;
            p->ys = (float)vn3->ys;
            p->g = (float)vn3->g;
            p->u = (float)tex->u3;
            p->v = (float)tex->v3;
            p++;
            p->xv = (float)vn4->xv;
            p->yv = (float)vn4->yv;
            p->zv = (float)vn4->zv;
            p->xs = (float)vn4->xs;
            p->ys = (float)vn4->ys;
            p->g = (float)vn4->g;
            p->u = (float)tex->u4;
            p->v = (float)tex->v4;
            npoints = ZedClipper(4, point, v_buffer);
            if (npoints)
                npoints = XYGUVClipper(npoints, v_buffer);
        }
        else
        {
            if ((sint32)((vn3->xs - vn2->xs) * (vn1->ys - vn2->ys) - (vn1->xs - vn2->xs) * (vn3->ys - vn2->ys)) < 0)
                continue;
            tex = &phdtextinfo[*(objptr + 4)];
            v = v_buffer;
            v->x = (float)vn1->xs;
            v->y = (float)vn1->ys;
            v->ooz = one / vn1->zv;
            v->g = (float)vn1->g;
            v->u = tex->u1 * v->ooz;
            v->v = tex->v1 * v->ooz;
            v++;
            v->x = (float)vn2->xs;
            v->y = (float)vn2->ys;
            v->ooz = one / vn2->zv;
            v->g = (float)vn2->g;
            v->u = tex->u2 * v->ooz;
            v->v = tex->v2 * v->ooz;
            v++;
            v->x = (float)vn3->xs;
            v->y = (float)vn3->ys;
            v->ooz = one / vn3->zv;
            v->g = (float)vn3->g;
            v->u = tex->u3 * v->ooz;
            v->v = tex->v3 * v->ooz;
            v++;
            v->x = (float)vn4->xs;
            v->y = (float)vn4->ys;
            v->ooz = one / vn4->zv;
            v->g = (float)vn4->g;
            v->u = tex->u4 * v->ooz;
            v->v = tex->v4 * v->ooz;
            npoints = 4;
            if (vn1->clip || vn2->clip || vn3->clip || vn4->clip)
                npoints = XYGUVClipper(npoints, v_buffer);
        }
        if (npoints)
        {
            zdepth = (vn1->zv + vn2->zv + vn3->zv + vn4->zv) / 4;
            *(sort3dptr) = (sint32)info3dptr;
            *(sort3dptr + 1) = zdepth;
            sort3dptr += 2;
            if (zdepth < perspective_distance)
            {
                *(info3dptr) = tex->drawtype + (DRAW_POLY_GTMAP_PERSPECTIVE - DRAW_POLY_GTMAP);
                *(info3dptr + 1) = tex->tpage;
                *(info3dptr + 2) = npoints;
                outptr = (OUTPUT_INFO *)(info3dptr + 3);
                for (i = 0, v = v_buffer; i < npoints; i++, v++, outptr++)
                {
                    outptr->xs = (sint16)v->x;
                    outptr->ys = (sint16)v->y;
                    outptr->g = (sint16)v->g;
                    outptr->ooz = v->ooz;
                    outptr->u = v->u;
                    outptr->v = v->v;
                }
                info3dptr = (sint16 *)outptr;
            }
            else
            {
                *((uint32 *)info3dptr) = *((uint32 *)&tex->drawtype);
                *(info3dptr + 2) = npoints;
                info3dptr += 3;
                for (i = 0, v = v_buffer; i < npoints; i++, v++, info3dptr += 5)
                {
                    *(info3dptr) = (sint16)v->x;
                    *(info3dptr + 1) = (sint16)v->y;
                    *(info3dptr + 2) = (sint16)v->g;
                    *(info3dptr + 3) = (sint16)(v->u / v->ooz);
                    *(info3dptr + 4) = (sint16)(v->v / v->ooz);
                }
            }
            surfacenum++;
        }
    }
    return objptr;
}

sint16 *ins_objectGT3persp(sint16 *objptr, int number)
{
    PHD_VBUF *vn1, *vn2, *vn3;
    PHDTEXTURESTRUCT *tex;
    OUTPUT_INFO *outptr;
    VERTEX_INFO *v;
    POINT_INFO point[3], *p;
    int i, npoints;
    sint32 zdepth;

    for (; number > 0; number--, objptr += 4)
    {
        vn1 = &vbuf[*(objptr)];
        vn2 = &vbuf[*(objptr + 1)];
        vn3 = &vbuf[*(objptr + 2)];
        if (vn1->clip & vn2->clip & vn3->clip)
            continue;
        if (vn1->clip < 0 || vn2->clip < 0 || vn3->clip < 0)
        {
            if (!visible_zclip(vn1, vn2, vn3))
                continue;
            tex = &phdtextinfo[*(objptr + 3)];
            p = point;
            p->xv = (float)vn1->xv;
            p->yv = (float)vn1->yv;
            p->zv = (float)vn1->zv;
            p->xs = (float)vn1->xs;
            p->ys = (float)vn1->ys;
            p->g = (float)vn1->g;
            p->u = (float)tex->u1;
            p->v = (float)tex->v1;
            p++;
            p->xv = (float)vn2->xv;
            p->yv = (float)vn2->yv;
            p->zv = (float)vn2->zv;
            p->xs = (float)vn2->xs;
            p->ys = (float)vn2->ys;
            p->g = (float)vn2->g;
            p->u = (float)tex->u2;
            p->v = (float)tex->v2;
            p++;
            p->xv = (float)vn3->xv;
            p->yv = (float)vn3->yv;
            p->zv = (float)vn3->zv;
            p->xs = (float)vn3->xs;
            p->ys = (float)vn3->ys;
            p->g = (float)vn3->g;
            p->u = (float)tex->u3;
            p->v = (float)tex->v3;
            npoints = ZedClipper(3, point, v_buffer);
            if (npoints)
                npoints = XYGUVClipper(npoints, v_buffer);
        }
        else
        {
            if ((sint32)((vn3->xs - vn2->xs) * (vn1->ys - vn2->ys) - (vn1->xs - vn2->xs) * (vn3->ys - vn2->ys)) < 0)
                continue;
            tex = &phdtextinfo[*(objptr + 3)];
            v = v_buffer;
            v->x = (float)vn1->xs;
            v->y = (float)vn1->ys;
            v->ooz = one / vn1->zv;
            v->g = (float)vn1->g;
            v->u = tex->u1 * v->ooz;
            v->v = tex->v1 * v->ooz;
            v++;
            v->x = (float)vn2->xs;
            v->y = (float)vn2->ys;
            v->ooz = one / vn2->zv;
            v->g = (float)vn2->g;
            v->u = tex->u2 * v->ooz;
            v->v = tex->v2 * v->ooz;
            v++;
            v->x = (float)vn3->xs;
            v->y = (float)vn3->ys;
            v->ooz = one / vn3->zv;
            v->g = (float)vn3->g;
            v->u = tex->u3 * v->ooz;
            v->v = tex->v3 * v->ooz;
            npoints = 3;
            if (vn1->clip || vn2->clip || vn3->clip)
                npoints = XYGUVClipper(npoints, v_buffer);
        }
        if (npoints)
        {
            zdepth = (vn1->zv + vn2->zv + vn3->zv) / 3;
            *(sort3dptr) = (sint32)info3dptr;
            *(sort3dptr + 1) = zdepth;
            sort3dptr += 2;
            if (zdepth < perspective_distance)
            {
                *(info3dptr) = tex->drawtype + (DRAW_POLY_GTMAP_PERSPECTIVE - DRAW_POLY_GTMAP);
                *(info3dptr + 1) = tex->tpage;
                *(info3dptr + 2) = npoints;
                outptr = (OUTPUT_INFO *)(info3dptr + 3);
                for (i = 0, v = v_buffer; i < npoints; i++, v++, outptr++)
                {
                    outptr->xs = (sint16)v->x;
                    outptr->ys = (sint16)v->y;
                    outptr->g = (sint16)v->g;
                    outptr->ooz = v->ooz;
                    outptr->u = v->u;
                    outptr->v = v->v;
                }
                info3dptr = (sint16 *)outptr;
            }
            else
            {
                *((uint32 *)info3dptr) = *((uint32 *)&tex->drawtype);
                *(info3dptr + 2) = npoints;
                info3dptr += 3;
                for (i = 0, v = v_buffer; i < npoints; i++, v++, info3dptr += 5)
                {
                    *(info3dptr) = (sint16)v->x;
                    *(info3dptr + 1) = (sint16)v->y;
                    *(info3dptr + 2) = (sint16)v->g;
                    *(info3dptr + 3) = (sint16)(v->u / v->ooz);
                    *(info3dptr + 4) = (sint16)(v->v / v->ooz);
                }
            }
            surfacenum++;
        }
    }
    return objptr;
}

sint16 *ins_objectGT4(sint16 *objptr, int number)
{
    PHD_VBUF *vn1, *vn2, *vn3, *vn4;
    PHDTEXTURESTRUCT *tex;
    VERTEX_INFO *v;
    int i, npoints;
    sint32 zdepth;
    sint16 *outptr;

    outptr = info3dptr;
    for (; number > 0; number--, objptr += 5)
    {
        vn1 = &vbuf[*(objptr)];
        vn2 = &vbuf[*(objptr + 1)];
        vn3 = &vbuf[*(objptr + 2)];
        vn4 = &vbuf[*(objptr + 3)];
        if ((vn1->clip & vn2->clip & vn3->clip & vn4->clip) || vn1->clip < 0 || vn2->clip < 0 || vn3->clip < 0 || vn4->clip < 0)
            continue;
        if ((sint32)((vn3->xs - vn2->xs) * (vn1->ys - vn2->ys) - (vn1->xs - vn2->xs) * (vn3->ys - vn2->ys)) < 0)
            continue;
        tex = &phdtextinfo[*(objptr + 4)];
        v = v_buffer;
        v->x = (float)vn1->xs;
        v->y = (float)vn1->ys;
        v->ooz = one / vn1->zv;
        v->g = (float)vn1->g;
        v->u = tex->u1 * v->ooz;
        v->v = tex->v1 * v->ooz;
        v++;
        v->x = (float)vn2->xs;
        v->y = (float)vn2->ys;
        v->ooz = one / vn2->zv;
        v->g = (float)vn2->g;
        v->u = tex->u2 * v->ooz;
        v->v = tex->v2 * v->ooz;
        v++;
        v->x = (float)vn3->xs;
        v->y = (float)vn3->ys;
        v->ooz = one / vn3->zv;
        v->g = (float)vn3->g;
        v->u = tex->u3 * v->ooz;
        v->v = tex->v3 * v->ooz;
        v++;
        v->x = (float)vn4->xs;
        v->y = (float)vn4->ys;
        v->ooz = one / vn4->zv;
        v->g = (float)vn4->g;
        v->u = tex->u4 * v->ooz;
        v->v = tex->v4 * v->ooz;
        npoints = 4;
        if (vn1->clip || vn2->clip || vn3->clip || vn4->clip)
            npoints = XYGUVClipper(npoints, v_buffer);
        if (npoints)
        {
            zdepth = (vn1->zv + vn2->zv + vn3->zv + vn4->zv) / 4;
            *(sort3dptr) = (sint32)outptr;
            *(sort3dptr + 1) = zdepth;
            sort3dptr += 2;
            *((uint32 *)outptr) = *((uint32 *)&tex->drawtype);
            *(outptr + 2) = npoints;
            outptr += 3;
            for (i = 0, v = v_buffer; i < npoints; i++, v++, outptr += 5)
            {
                *(outptr) = (sint16)v->x;
                *(outptr + 1) = (sint16)v->y;
                *(outptr + 2) = (sint16)v->g;
                *(outptr + 3) = (sint16)(v->u / v->ooz);
                *(outptr + 4) = (sint16)(v->v / v->ooz);
            }
            surfacenum++;
        }
    }
    info3dptr = outptr;
    return objptr;
}

sint16 *ins_objectGT3(sint16 *objptr, int number)
{
    PHD_VBUF *vn1, *vn2, *vn3;
    PHDTEXTURESTRUCT *tex;
    VERTEX_INFO *v;
    int i, npoints;
    sint32 zdepth;
    sint16 *outptr;

    outptr = info3dptr;
    for (; number > 0; number--, objptr += 4)
    {
        vn1 = &vbuf[*(objptr)];
        vn2 = &vbuf[*(objptr + 1)];
        vn3 = &vbuf[*(objptr + 2)];
        if ((vn1->clip & vn2->clip & vn3->clip) || vn1->clip < 0 || vn2->clip < 0 || vn3->clip < 0)
            continue;
        if ((sint32)((vn3->xs - vn2->xs) * (vn1->ys - vn2->ys) - (vn1->xs - vn2->xs) * (vn3->ys - vn2->ys)) < 0)
            continue;
        tex = &phdtextinfo[*(objptr + 3)];
        v = v_buffer;
        v->x = (float)vn1->xs;
        v->y = (float)vn1->ys;
        v->ooz = one / vn1->zv;
        v->g = (float)vn1->g;
        v->u = tex->u1 * v->ooz;
        v->v = tex->v1 * v->ooz;
        v++;
        v->x = (float)vn2->xs;
        v->y = (float)vn2->ys;
        v->ooz = one / vn2->zv;
        v->g = (float)vn2->g;
        v->u = tex->u2 * v->ooz;
        v->v = tex->v2 * v->ooz;
        v++;
        v->x = (float)vn3->xs;
        v->y = (float)vn3->ys;
        v->ooz = one / vn3->zv;
        v->g = (float)vn3->g;
        v->u = tex->u3 * v->ooz;
        v->v = tex->v3 * v->ooz;
        npoints = 3;
        if (vn1->clip || vn2->clip || vn3->clip)
            npoints = XYGUVClipper(npoints, v_buffer);
        if (npoints)
        {
            zdepth = (vn1->zv + vn2->zv + vn3->zv) / 3;
            *(sort3dptr) = (sint32)outptr;
            *(sort3dptr + 1) = zdepth;
            sort3dptr += 2;
            *((uint32 *)outptr) = *((uint32 *)&tex->drawtype);
            *(outptr + 2) = npoints;
            outptr += 3;
            for (i = 0, v = v_buffer; i < npoints; i++, v++, outptr += 5)
            {
                *(outptr) = (sint16)v->x;
                *(outptr + 1) = (sint16)v->y;
                *(outptr + 2) = (sint16)v->g;
                *(outptr + 3) = (sint16)(v->u / v->ooz);
                *(outptr + 4) = (sint16)(v->v / v->ooz);
            }
            surfacenum++;
        }
    }
    info3dptr = outptr;
    return objptr;
}

int XYGClipper(int number, VERTEX_INFO *input)
{
    int i, j;
    VERTEX_INFO output[8], *A, *B;
    float clipper;

    B = &input[number - 1];
    for (i = j = 0; i < number; i++)
    {
        A = B;
        B = &input[i];
        if (A->x < phd_leftfloat)
        {
            if (B->x < phd_leftfloat)
                continue;
            clipper = (phd_leftfloat - B->x) / (A->x - B->x);
            output[j].g = B->g + (A->g - B->g) * clipper;
            output[j].x = phd_leftfloat;
            output[j++].y = B->y + (A->y - B->y) * clipper;
        }
        else if (A->x > phd_rightfloat)
        {
            if (B->x > phd_rightfloat)
                continue;
            clipper = (phd_rightfloat - B->x) / (A->x - B->x);
            output[j].g = B->g + (A->g - B->g) * clipper;
            output[j].x = phd_rightfloat;
            output[j++].y = B->y + (A->y - B->y) * clipper;
        }
        if (B->x < phd_leftfloat)
        {
            clipper = (phd_leftfloat - B->x) / (A->x - B->x);
            output[j].g = B->g + (A->g - B->g) * clipper;
            output[j].x = phd_leftfloat;
            output[j++].y = B->y + (A->y - B->y) * clipper;
        }
        else if (B->x > phd_rightfloat)
        {
            clipper = (phd_rightfloat - B->x) / (A->x - B->x);
            output[j].g = B->g + (A->g - B->g) * clipper;
            output[j].x = phd_rightfloat;
            output[j++].y = B->y + (A->y - B->y) * clipper;
        }
        else
        {
            output[j].x = B->x;
            output[j].y = B->y;
            output[j++].g = B->g;
        }
    }
    if (j < 3)
        return 0;
    number = j;
    B = &output[number - 1];
    for (i = j = 0; i < number; i++)
    {
        A = B;
        B = &output[i];
        if (A->y < phd_topfloat)
        {
            if (B->y < phd_topfloat)
                continue;
            clipper = (phd_topfloat - B->y) / (A->y - B->y);
            input[j].g = B->g + (A->g - B->g) * clipper;
            input[j].x = B->x + (A->x - B->x) * clipper;
            input[j++].y = phd_topfloat;
        }
        else if (A->y > phd_bottomfloat)
        {
            if (B->y > phd_bottomfloat)
                continue;
            clipper = (phd_bottomfloat - B->y) / (A->y - B->y);
            input[j].g = B->g + (A->g - B->g) * clipper;
            input[j].x = B->x + (A->x - B->x) * clipper;
            input[j++].y = phd_bottomfloat;
        }
        if (B->y < phd_topfloat)
        {
            clipper = (phd_topfloat - B->y) / (A->y - B->y);
            input[j].g = B->g + (A->g - B->g) * clipper;
            input[j].x = B->x + (A->x - B->x) * clipper;
            input[j++].y = phd_topfloat;
        }
        else if (B->y > phd_bottomfloat)
        {
            clipper = (phd_bottomfloat - B->y) / (A->y - B->y);
            input[j].g = B->g + (A->g - B->g) * clipper;
            input[j].x = B->x + (A->x - B->x) * clipper;
            input[j++].y = phd_bottomfloat;
        }
        else
        {
            input[j].x = B->x;
            input[j].y = B->y;
            input[j++].g = B->g;
        }
    }
    if (j < 3)
        return 0;
    return j;
}

sint16 *ins_objectG4(sint16 *objptr, int number)
{
    PHD_VBUF *vn1, *vn2, *vn3, *vn4;
    VERTEX_INFO *v;
    sint16 *outptr;
    int i, npoints;
    sint32 zdepth;

    outptr = info3dptr;
    for (; number > 0; number--, objptr += 5)
    {
        vn1 = &vbuf[*(objptr)];
        vn2 = &vbuf[*(objptr + 1)];
        vn3 = &vbuf[*(objptr + 2)];
        vn4 = &vbuf[*(objptr + 3)];
        if ((vn1->clip & vn2->clip & vn3->clip & vn4->clip) || vn1->clip < 0 || vn2->clip < 0 || vn3->clip < 0 || vn4->clip < 0)
            continue;
        if ((sint32)((vn3->xs - vn2->xs) * (vn1->ys - vn2->ys) - (vn1->xs - vn2->xs) * (vn3->ys - vn2->ys)) < 0)
            continue;
        v = v_buffer;
        v->x = (float)vn1->xs;
        v->y = (float)vn1->ys;
        v->g = (float)vn1->g;
        v++;
        v->x = (float)vn2->xs;
        v->y = (float)vn2->ys;
        v->g = (float)vn2->g;
        v++;
        v->x = (float)vn3->xs;
        v->y = (float)vn3->ys;
        v->g = (float)vn3->g;
        v++;
        v->x = (float)vn4->xs;
        v->y = (float)vn4->ys;
        v->g = (float)vn4->g;
        npoints = 4;
        if (vn1->clip || vn2->clip || vn3->clip || vn4->clip)
            npoints = XYGClipper(npoints, v_buffer);
        if (npoints)
        {
            zdepth = (vn1->zv + vn2->zv + vn3->zv + vn4->zv) / 4;
            *(sort3dptr) = (sint32)outptr;
            *(sort3dptr + 1) = zdepth;
            sort3dptr += 2;
            *(outptr) = DRAW_POLY_GOURAUD;
            *(outptr + 1) = *(objptr + 4);
            *(outptr + 2) = npoints;
            outptr += 3;
            for (i = 0, v = v_buffer; i < npoints; i++, v++, outptr += 3)
            {
                *(outptr) = (sint16)v->x;
                *(outptr + 1) = (sint16)v->y;
                *(outptr + 2) = (sint16)v->g;
            }
            surfacenum++;
        }
    }
    info3dptr = outptr;
    return objptr;
}

sint16 *ins_objectG3(sint16 *objptr, int number)
{
    PHD_VBUF *vn1, *vn2, *vn3;
    VERTEX_INFO *v;
    sint16 *outptr;
    int i, npoints;
    sint32 zdepth;

    outptr = info3dptr;
    for (; number > 0; number--, objptr += 4)
    {
        vn1 = &vbuf[*(objptr)];
        vn2 = &vbuf[*(objptr + 1)];
        vn3 = &vbuf[*(objptr + 2)];
        if ((vn1->clip & vn2->clip & vn3->clip) || vn1->clip < 0 || vn2->clip < 0 || vn3->clip < 0)
            continue;
        if ((sint32)((vn3->xs - vn2->xs) * (vn1->ys - vn2->ys) - (vn1->xs - vn2->xs) * (vn3->ys - vn2->ys)) < 0)
            continue;
        v = v_buffer;
        v->x = (float)vn1->xs;
        v->y = (float)vn1->ys;
        v->g = (float)vn1->g;
        v++;
        v->x = (float)vn2->xs;
        v->y = (float)vn2->ys;
        v->g = (float)vn2->g;
        v++;
        v->x = (float)vn3->xs;
        v->y = (float)vn3->ys;
        v->g = (float)vn3->g;
        npoints = 3;
        if (vn1->clip || vn2->clip || vn3->clip)
            npoints = XYGClipper(npoints, v_buffer);
        if (npoints)
        {
            zdepth = (vn1->zv + vn2->zv + vn3->zv) / 3;
            *(sort3dptr) = (sint32)outptr;
            *(sort3dptr + 1) = zdepth;
            sort3dptr += 2;
            *(outptr) = DRAW_POLY_GOURAUD;
            *(outptr + 1) = *(objptr + 3);
            *(outptr + 2) = npoints;
            outptr += 3;
            for (i = 0, v = v_buffer; i < npoints; i++, v++, outptr += 3)
            {
                *(outptr) = (sint16)v->x;
                *(outptr + 1) = (sint16)v->y;
                *(outptr + 2) = (sint16)v->g;
            }
            surfacenum++;
        }
    }
    info3dptr = outptr;
    return objptr;
}

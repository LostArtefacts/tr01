#include "3dglodef.h"

typedef struct
{
    float xv, yv, zv;
    float xs, ys;
    float u, v;
    float g;
} POINT_INFO;

extern float phd_leftfloat;
extern float phd_rightfloat;
extern float phd_topfloat;
extern float phd_bottomfloat;

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

#include "3dglodef.h"

typedef struct
{
    float xv, yv, zv;
    float xs, ys;
    float u, v;
    float g;
} POINT_INFO;

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

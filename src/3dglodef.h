#ifndef _3DGLODEF_H
#define _3DGLODEF_H

#include "types.h"

enum msoff
{
    M00, M01, M02, M03,
    M10, M11, M12, M13,
    M20, M21, M22, M23
};

typedef struct
{
    sint32 xv;
    sint32 yv;
    sint32 zv;
    sint32 xs;
    sint32 ys;
    sint32 dist;
    sint16 clip;
    sint16 g;
    uint16 u, v;
} PHD_VBUF;

#define phd_PopMatrix() phd_mxptr -= 12

extern sint32 phd_left;
extern sint32 phd_right;
extern sint32 phd_top;
extern sint32 phd_bottom;
extern sint32 phd_winxmax;
extern sint32 phd_winymax;
extern sint32 phd_centerx;
extern sint32 phd_centery;
extern sint32 phd_znear;
extern sint32 phd_zfar;
extern sint32 phd_persp;
extern sint32 *phd_mxptr;

extern PHD_VBUF vbuf[];

void phd_PushMatrix(void);
void phd_RotY(PHD_ANGLE ry);
void phd_TranslateAbs(sint32 x, sint32 y, sint32 z);
sint16 *calc_object_vertices(sint16 *objptr);
int ins_poly_trans8(PHD_VBUF *v, sint16 shade);
void phd_InitPolyList(void);
void phd_SortPolyList(void);
void phd_PrintPolyList(void);

#endif

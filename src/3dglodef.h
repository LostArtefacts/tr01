#ifndef _3DGLODEF_H
#define _3DGLODEF_H

#include "types.h"

enum msoff
{
    M00, M01, M02, M03,
    M10, M11, M12, M13,
    M20, M21, M22, M23
};

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

void phd_InitPolyList(void);
void phd_SortPolyList(void);
void phd_PrintPolyList(void);

#endif

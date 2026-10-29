#ifndef _3DGLODEF_H
#define _3DGLODEF_H

#define MAX_TEXTURES 2048
#define MAX_SPRITES 512

#include "types.h"

#define WIBBLE_SIZE 32

#define DPQ_END 20480

#define ABS(x) (((x) < 0) ? (-(x)) : (x))

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

typedef struct
{
    uint16 drawtype;
    uint16 tpage;
    uint16 u1, v1;
    uint16 u2, v2;
    uint16 u3, v3;
    uint16 u4, v4;
} PHDTEXTURESTRUCT;

typedef struct
{
    uint16 tpage;
    uint16 offset;
    uint16 width;
    uint16 height;
    sint16 x1;
    sint16 y1;
    sint16 x2;
    sint16 y2;
} PHDSPRITESTRUCT;

typedef struct
{
    float x, y;
    float ooz;
    float u, v, g;
} VERTEX_INFO;

enum
{
    DRAW_POLY_GTMAP,
    DRAW_POLY_WGTMAP,
    DRAW_POLY_GTMAP_PERSPECTIVE,
    DRAW_POLY_WGTMAP_PERSPECTIVE,
    DRAW_POLY_LINE,
    DRAW_POLY_FLAT,
    DRAW_POLY_GOURAUD,
    DRAW_POLY_TRANS,
    DRAW_SCALED_SPRITE
};

#define phd_PopMatrix() phd_mxptr -= 12

extern char *texture_page_ptrs[];
extern sint32 ls_adder;
extern sint32 ls_divider;

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
extern sint32 w2v_matrix[];

extern sint32 surfacenum;
extern sint16 *info3dptr;
extern sint32 *sort3dptr;

extern sint32 wibble_offset;
extern sint32 water_effect;
extern sint32 shade_effect;
extern uint8 depthq_table[32][256];
extern uint8 gouraud_table[256][32];

extern VERTEX_INFO v_buffer[];
extern PHD_VBUF vbuf[];
extern PHDTEXTURESTRUCT phdtextinfo[];
extern PHDSPRITESTRUCT phdsprinfo[];

void AlterFOV(PHD_ANGLE fov);
void phd_LookAt(sint32 xsrc, sint32 ysrc, sint32 zsrc, sint32 xtar, sint32 ytar, sint32 ztar, PHD_ANGLE roll);
void phd_GetVectorAngles(sint32 x, sint32 y, sint32 z, PHD_ANGLE *dest);
void phd_PushMatrix(void);
void phd_PushUnitMatrix(void);
void phd_RotYXZ(PHD_ANGLE ry, PHD_ANGLE rx, PHD_ANGLE rz);
void phd_RotX(PHD_ANGLE rx);
void phd_RotY(PHD_ANGLE ry);
void phd_RotZ(PHD_ANGLE rz);
void phd_RotYXZpack(sint32 rots);
void phd_TranslateRel(sint32 x, sint32 y, sint32 z);
void phd_TranslateAbs(sint32 x, sint32 y, sint32 z);
void phd_RotateLight(PHD_ANGLE pitch, PHD_ANGLE yaw);
sint16 *calc_object_vertices(sint16 *objptr);
int ins_poly_trans8(PHD_VBUF *v, sint16 shade);
int XYGClipper(int number, VERTEX_INFO *input);
void Insert2DLine(sint32 x1, sint32 y1, sint32 x2, sint32 y2, sint32 z, char color);
void phd_InitPolyList(void);
sint32 phd_cos(sint32 angle);
sint32 phd_sqrt(sint32 n);
sint32 phd_sin(sint32 angle);
sint32 phd_atan(sint32 x, sint32 y);
void phd_SortPolyList(void);
void phd_PutPolygons(sint16 *objptr, int clip);
void S_InsertRoom(sint16 *objptr);
void phd_InitWindow(int x, int y, int width, int height, int nearz, int farz, int view_angle, int scrwidth, int scrheight, uint8 *scrptr);
void phd_PrintPolyList(void);

#endif

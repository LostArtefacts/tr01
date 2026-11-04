#include "3dglodef.h"

void draw_poly_gtmap(sint16 *iptr);
void draw_poly_wgtmap(sint16 *iptr);
void draw_poly_gtmap_persp(sint16 *iptr);
void draw_poly_wgtmap_persp(sint16 *iptr);
void draw_poly_line(sint16 *iptr);
void draw_poly_flat(sint16 *iptr);
void draw_poly_gouraud(sint16 *iptr);
void draw_poly_trans(sint16 *iptr);
void draw_scaled_spriteC(sint16 *iptr);

sint32 wibble_table[WIBBLE_SIZE], wibble_offset = 0, water_effect = 0;
sint32 rand_table[WIBBLE_SIZE], shade_effect = 0;
sint32 shade_table[WIBBLE_SIZE];
sint32 ls_adder;
sint32 ls_divider;
int perspective_distance = ((3 * 1024) << W2V_SHIFT);
float phd_leftfloat;
float phd_rightfloat;
float phd_topfloat;
float phd_bottomfloat;
uint8 *phd_winptr;
sint32 phd_left;
sint32 phd_right;
sint32 phd_top;
sint32 phd_bottom;
sint32 phd_winxmax;
sint32 phd_winymax;
sint32 phd_winwidth;
sint32 phd_winheight;
sint32 phd_centerx;
sint32 phd_centery;
sint32 phd_znear;
sint32 phd_zfar;
sint32 phd_viewdist;
sint32 phd_scrwidth;
sint32 phd_scrheight;
sint32 phd_persp;
sint32 *phd_mxptr;
sint32 w2v_matrix[12];
sint32 matrix_stack[MAX_MATRICES * 12];
PHD_VECTOR ls_vector_view;
PHD_ANGLE phd_ls_pitch, phd_ls_yaw;
sint32 surfacenum;
sint16 *info3dptr;
sint32 *sort3dptr;
char *texture_page_ptrs[MAX_TEXTPAGES];
XBUF_PERSP xbuffer[MAX_SCANLINES];
PHD_VBUF vbuf[MAX_VERTICES];
sint32 sort3d_buffer[MAX_POLYGONS][2];
sint16 info3d_buffer[110000];
PHDTEXTURESTRUCT phdtextinfo[MAX_TEXTURES];
PHDSPRITESTRUCT phdsprinfo[MAX_SPRITES];
uint8 depthq_table[32][256];
uint8 gouraud_table[256][32];
void (*poly_draw_routines[])(sint16 *) = {
    draw_poly_gtmap,
    draw_poly_wgtmap,
    draw_poly_gtmap_persp,
    draw_poly_wgtmap_persp,
    draw_poly_line,
    draw_poly_flat,
    draw_poly_gouraud,
    draw_poly_trans,
    draw_scaled_spriteC
};

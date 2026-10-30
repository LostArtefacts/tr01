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

sint32 wibble_offset = 0, water_effect = 0;
sint32 shade_effect = 0;
int perspective_distance = ((3 * 1024) << W2V_SHIFT);
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

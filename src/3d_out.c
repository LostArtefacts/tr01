#include "3dglodef.h"

static sint32 xgen_ymin;
static sint32 xgen_ymax;

int xgen_x(sint16 *iptr);
int xgen_xg(sint16 *iptr);
int xgen_xguv(sint16 *iptr);
void flatA(int min_y, int max_y, char color);
void transA(int min_y, int max_y, sint16 colbase);
void gourA(int min_y, int max_y, sint16 colbase);
void gtmapA(int min_y, int max_y, char *tptr);
void wgtmapA(int min_y, int max_y, char *tptr);

void draw_poly_flat(sint16 *iptr)
{
    if (xgen_x(iptr + 1))
        flatA(xgen_ymin, xgen_ymax, (char)*(iptr));
}

void draw_poly_trans(sint16 *iptr)
{
    if (xgen_x(iptr + 1))
        transA(xgen_ymin, xgen_ymax, *(iptr));
}

void draw_poly_gouraud(sint16 *iptr)
{
    if (xgen_xg(iptr + 1))
        gourA(xgen_ymin, xgen_ymax, *(iptr));
}

void draw_poly_gtmap(sint16 *iptr)
{
    if (xgen_xguv(iptr + 1))
        gtmapA(xgen_ymin, xgen_ymax, texture_page_ptrs[*(iptr)]);
}

void draw_poly_wgtmap(sint16 *iptr)
{
    if (xgen_xguv(iptr + 1))
        wgtmapA(xgen_ymin, xgen_ymax, texture_page_ptrs[*(iptr)]);
}

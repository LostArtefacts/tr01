#include "3dglodef.h"

static sint32 xgen_ymin;
static sint32 xgen_ymax;

int xgen_x(sint16 *iptr);
void flatA(int min_y, int max_y, char color);

void draw_poly_flat(sint16 *iptr)
{
    if (xgen_x(iptr + 1))
        flatA(xgen_ymin, xgen_ymax, (char)*(iptr));
}

#include "game.h"

SG_COL S_COLOUR(int R, int G, int B)
{
    SG_COL i, colour;
    int distance, closest, r, g, b;
    uint8 *pal;

    R >>= 2;
    G >>= 2;
    B >>= 2;

    closest = 256 * 256 * 4;
    for (i = 0, pal = game_palette; i < 256; i++)
    {
        r = R - *(pal++);
        g = G - *(pal++);
        b = B - *(pal++);

        distance = r * r + g * g + b * b;

        if (distance < closest)
        {
            colour = i;
            closest = distance;
        }
    }

    return colour;
}

void S_SetGamma(sint16 gamma)
{
}

void S_DrawSpriteSize(sint32 x, sint32 y, sint32 z, sint32 w, sint32 h, sint16 sprnum, sint16 shade, uint16 flags)
{
    if (x + w < 0 || y + h < 0 || x >= phd_winwidth || y >= phd_winheight)
        return;

    *(sort3dptr) = (sint32)(info3dptr);
    *(sort3dptr + 1) = z;
    sort3dptr += 2;
    *(info3dptr) = DRAW_SCALED_SPRITE;
    *(info3dptr + 1) = (sint16)x;
    *(info3dptr + 2) = (sint16)y;
    *(info3dptr + 3) = (sint16)(x + w);
    *(info3dptr + 4) = (sint16)(y + h);
    *(info3dptr + 5) = sprnum;
    *(info3dptr + 6) = shade;
    info3dptr += 7;
    surfacenum++;
}

void S_DrawScreenSprite2d(sint32 sx, sint32 sy, sint32 z, sint32 scaleH, sint32 scaleV, sint16 sprnum, sint16 shade, uint16 flags)
{
    PHDSPRITESTRUCT *sptr;
    sint16 x1, y1, x2, y2;

    sptr = &phdsprinfo[sprnum];
    x1 = (sint16)(((sptr->x1 * scaleH) >> 16) + sx);
    x2 = (sint16)((((sptr->x2) * scaleH) >> 16) + sx);
    y1 = (sint16)(((sptr->y1 * scaleV) >> 16) + sy);
    y2 = (sint16)((((sptr->y2) * scaleV) >> 16) + sy);

    if (x2 < 0 || y2 < 0 || x1 >= phd_winwidth || y1 >= phd_winheight)
        return;

    *(sort3dptr) = (sint32)(info3dptr);
    *(sort3dptr + 1) = z << 3;
    sort3dptr += 2;

    *(info3dptr) = DRAW_SCALED_SPRITE;
    *(info3dptr + 1) = x1;
    *(info3dptr + 2) = y1;
    *(info3dptr + 3) = x2;
    *(info3dptr + 4) = y2;
    *(info3dptr + 5) = sprnum;
    *(info3dptr + 6) = shade;
    info3dptr += 7;

    surfacenum++;
}

void S_DrawScreenSprite(sint32 sx, sint32 sy, sint32 z, sint32 scaleH, sint32 scaleV, sint16 sprnum, sint16 shade, uint16 flags)
{
    PHDSPRITESTRUCT *sptr;
    sint16 x1, y1, x2, y2;

    sptr = &phdsprinfo[sprnum];
    x1 = (sint16)((((sptr->x1 >> 3) * scaleH) >> 16) + sx);
    x2 = (sint16)((((sptr->x2 >> 3) * scaleH) >> 16) + sx);
    y1 = (sint16)((((sptr->y1 >> 3) * scaleV) >> 16) + sy);
    y2 = (sint16)((((sptr->y2 >> 3) * scaleV) >> 16) + sy);

    if (x2 < 0 || y2 < 0 || x1 >= phd_winwidth || y1 >= phd_winheight)
        return;

    *(sort3dptr) = (sint32)(info3dptr);
    *(sort3dptr + 1) = z << 3;
    sort3dptr += 2;

    *(info3dptr) = DRAW_SCALED_SPRITE;
    *(info3dptr + 1) = x1;
    *(info3dptr + 2) = y1;
    *(info3dptr + 3) = x2;
    *(info3dptr + 4) = y2;
    *(info3dptr + 5) = sprnum;
    *(info3dptr + 6) = shade;
    info3dptr += 7;

    surfacenum++;
}

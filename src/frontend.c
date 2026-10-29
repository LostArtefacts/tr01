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

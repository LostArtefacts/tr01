#include "game.h"
#include "shell.h"
#include "3dglodef.h"

extern uint8 game_palette[256 * 3];

void S_InitialisePolyList(void)
{
    phd_InitPolyList();
}

sint32 S_DumpScreen(void)
{
    sint32 nframes;

    nframes = Sync();
    while (nframes < 2)
    {
        while (!Sync())
            ;
        nframes++;
    }
    ScreenPartialDump();
    return nframes;
}

void S_ClearScreen(void)
{
    ScreenClear();
}

void S_InitialiseScreen(void)
{
    if (CurrentLevel != TITLE)
        TempVideoRemove();
    FadeToPal(60, game_palette);
}

void S_OutputPolyList(void)
{
    phd_SortPolyList();
    phd_PrintPolyList();
}

int S_GetObjectBounds(sint16 *bptr)
{
    sint32 minx, maxx;
    sint32 miny, maxy;
    sint32 minz, maxz;
    sint32 zv, coord, numz, i;
    sint32 vertex[8][3];
    sint32 *vertptr, *mptr;

    if (*(phd_mxptr + M23) >= phd_zfar)
        return 0;

    minx = (sint32)*(bptr + 0);
    maxx = (sint32)*(bptr + 1);
    miny = (sint32)*(bptr + 2);
    maxy = (sint32)*(bptr + 3);
    minz = (sint32)*(bptr + 4);
    maxz = (sint32)*(bptr + 5);

    vertex[0][0] = minx;
    vertex[0][1] = miny;
    vertex[0][2] = minz;

    vertex[1][0] = maxx;
    vertex[1][1] = miny;
    vertex[1][2] = minz;

    vertex[2][0] = maxx;
    vertex[2][1] = maxy;
    vertex[2][2] = minz;

    vertex[3][0] = minx;
    vertex[3][1] = maxy;
    vertex[3][2] = minz;

    vertex[4][0] = minx;
    vertex[4][1] = miny;
    vertex[4][2] = maxz;

    vertex[5][0] = maxx;
    vertex[5][1] = miny;
    vertex[5][2] = maxz;

    vertex[6][0] = maxx;
    vertex[6][1] = maxy;
    vertex[6][2] = maxz;

    vertex[7][0] = minx;
    vertex[7][1] = maxy;
    vertex[7][2] = maxz;

    numz = 0;
    minx = miny = 0x3fffffff;
    maxx = maxy = -0x3fffffff;
    mptr = phd_mxptr;
    vertptr = &vertex[0][0];
    for (i = 0; i < 8; i++, vertptr += 3)
    {
        zv = *(mptr + M20) * *(vertptr + 0) +
             *(mptr + M21) * *(vertptr + 1) +
             *(mptr + M22) * *(vertptr + 2) +
             *(mptr + M23);

        if (zv > phd_znear && zv < phd_zfar)
        {
            numz++;
            zv /= phd_persp;
            coord = (*(mptr + M00) * *(vertptr + 0) +
                     *(mptr + M01) * *(vertptr + 1) +
                     *(mptr + M02) * *(vertptr + 2) +
                     *(mptr + M03)) / zv;
            if (coord < minx)
                minx = coord;
            else if (coord > maxx)
                maxx = coord;

            coord = (*(mptr + M10) * *(vertptr + 0) +
                     *(mptr + M11) * *(vertptr + 1) +
                     *(mptr + M12) * *(vertptr + 2) +
                     *(mptr + M13)) / zv;
            if (coord < miny)
                miny = coord;
            else if (coord > maxy)
                maxy = coord;
        }
    }
    minx += phd_centerx;
    maxx += phd_centerx;
    miny += phd_centery;
    maxy += phd_centery;

    if (!numz ||
        minx > phd_right ||
        miny > phd_bottom ||
        maxx < phd_left ||
        maxy < phd_top)
        return 0;

    if (numz < 8 ||
        minx < 0 ||
        miny < 0 ||
        maxx > phd_winxmax ||
        maxy > phd_winymax)
        return -1;

    return 1;
}

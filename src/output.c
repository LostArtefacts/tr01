#include "game.h"
#include "shell.h"
#include "3dglodef.h"

extern uint8 game_palette[256 * 3];

#define DEPTHQ_END (20 * 1024)
#define DEPTHQ_START ((DEPTHQ_END) - (8 * 1024))

static sint16 shadowman[] = {
    0, 0, 0,
    32767,
    1,
    8,
    0, 0, 0,
    0, 0, 0,
    0, 0, 0,
    0, 0, 0,
    0, 0, 0,
    0, 0, 0,
    0, 0, 0,
    0, 0, 0
};

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

void S_PrintShadow(sint16 size, sint16 *bptr, ITEM_INFO *iptr)
{
    int midx, xadd, xadd2;
    int midz, zadd, zadd2;

    midx = (*(bptr + 0) + *(bptr + 1)) / 2;
    midz = (*(bptr + 4) + *(bptr + 5)) / 2;
    xadd = ((*(bptr + 1) - *(bptr + 0)) * size) / (UNIT_SHADOW * 4);
    zadd = ((*(bptr + 5) - *(bptr + 4)) * size) / (UNIT_SHADOW * 4);
    xadd2 = xadd * 2;
    zadd2 = zadd * 2;

    shadowman[2 + 4] = midx - xadd;
    shadowman[4 + 4] = midz + zadd2;

    shadowman[5 + 4] = midx + xadd;
    shadowman[7 + 4] = midz + zadd2;

    shadowman[8 + 4] = midx + xadd2;
    shadowman[10 + 4] = midz + zadd;

    shadowman[11 + 4] = midx + xadd2;
    shadowman[13 + 4] = midz - zadd;

    shadowman[14 + 4] = midx + xadd;
    shadowman[16 + 4] = midz - zadd * 2;

    shadowman[17 + 4] = midx - xadd;
    shadowman[19 + 4] = midz - zadd * 2;

    shadowman[20 + 4] = midx - xadd2;
    shadowman[22 + 4] = midz - zadd;

    shadowman[23 + 4] = midx - xadd2;
    shadowman[25 + 4] = midz + zadd;

    phd_PushMatrix();
    phd_TranslateAbs(iptr->pos.x_pos, iptr->floor, iptr->pos.z_pos);
    phd_RotY(iptr->pos.y_rot);
    if (calc_object_vertices(&shadowman[4]))
        ins_poly_trans8(vbuf, 24);
    phd_PopMatrix();
}

void S_CalculateLight(sint32 x, sint32 y, sint32 z, sint16 room_number)
{
    ROOM_INFO *r;
    LIGHT_INFO *light;
    PHD_ANGLE angles[2];
    PHD_VECTOR ls, lc;
    sint32 i, distance, falloff, shade, brightest, ambient;

    r = &room[room_number];

    if (r->num_lights == 0)
    {
        ls_adder = r->ambient;
        ls_divider = 0;
    }
    else
    {
        ambient = 0x1fff - r->ambient;
        brightest = 0;

        for (i = r->num_lights, light = r->light; i > 0; i--, light++)
        {
            lc.x = x - light->x;
            lc.y = y - light->y;
            lc.z = z - light->z;

            distance = (SQUARE(lc.x) + SQUARE(lc.y) + SQUARE(lc.z)) >> 12;
            falloff = SQUARE(light->falloff) >> 12;

            shade = (light->intensity * falloff) / (distance + falloff) + ambient;

            if (shade > brightest)
            {
                brightest = shade;
                ls = lc;
            }
        }

        ls_adder = (brightest + ambient) / 2;
        if (brightest != ambient)
            ls_divider = (1 << (W2V_SHIFT + 12)) / (brightest - ls_adder);
        else
            ls_divider = 0;
        ls_adder = 0x1fff - ls_adder;

        phd_GetVectorAngles(ls.x, ls.y, ls.z, angles);
        phd_RotateLight(angles[1], angles[0]);
    }

    distance = *(phd_mxptr + M23) >> W2V_SHIFT;
    if (distance > DEPTHQ_START)
    {
        ls_adder += distance - DEPTHQ_START;
        if (ls_adder > 0x1fff)
            ls_adder = 0x1fff;
    }
}

void S_CalculateStaticLight(sint16 adder)
{
    sint32 zdist;

    ls_adder = adder - (16 * 256);
    zdist = *(phd_mxptr + M23) >> W2V_SHIFT;
    if (zdist > DEPTHQ_START)
        ls_adder += zdist - DEPTHQ_START;
}

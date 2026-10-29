#include <string.h>
#include "game.h"
#include "shell.h"
#include "3dglodef.h"
#include "inventry.h"
#include "specific.h"


#define DEPTHQ_END (20 * 1024)
#define DEPTHQ_START ((DEPTHQ_END) - (8 * 1024))

#define HealthBarX 8
#define HealthBarY 6
#define HealthBarW 100

#define AirBarX (game_setup.dump_width - 110)
#define AirBarY 6
#define AirBarW 100

#define ANIMATED_TEXTURE 10

typedef struct pcx_header
{
    char zsoft_flag, version, encoding, bits;
    unsigned short xmin, ymin, xmax, ymax;
    unsigned short h_res, v_res;
    char header_pal[48], reserved, planes;
    unsigned short bytes_per_line, pal_interp, width, height;
    char blank[54];
} PCX_HEADER;

typedef struct pic
{
    char mask, comp, type;
    short w, h, d, x, y;
    char *ptr;
    char pal[256 * 3];
} PIC;

int hires_flag;

int wet = 0;
uint8 game_palette[256 * 3], water_palette[256 * 3];

sint16 *aranges;
char *malloc_ptr;
int malloc_used, malloc_free;

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

void S_DrawHealthBar(int percent)
{
    int x, y;
    int w;

    x = HealthBarX;
    y = HealthBarY;
    w = (percent * HealthBarW) / 100;

    Insert2DLine(x - 1, y + 1, x + HealthBarW + 1, y + 1, -100, 0);
    Insert2DLine(x - 1, y + 2, x + HealthBarW + 1, y + 2, -100, 0);
    Insert2DLine(x - 1, y + 3, x + HealthBarW + 1, y + 3, -100, 0);
    Insert2DLine(x - 1, y + 4, x + HealthBarW + 1, y + 4, -100, 0);
    Insert2DLine(x - 1, y + 5, x + HealthBarW + 1, y + 5, -100, 0);
    Insert2DLine(x - 1, y + 6, x + HealthBarW + 1, y + 6, -100, 0);
    Insert2DLine(x - 1, y + 7, x + HealthBarW + 1, y + 7, -100, 0);
    Insert2DLine(x - 2, y + 8, x + HealthBarW + 2, y + 8, -200, 17);
    Insert2DLine(x + HealthBarW + 2, y, x + HealthBarW + 2, y + 8, -200, 17);
    Insert2DLine(x - 2, y, x + HealthBarW + 2, y, -300, 19);
    Insert2DLine(x - 2, y, x - 2, y + 8, -300, 19);
    if (w)
    {
        Insert2DLine(x, y + 2, x + w, y + 2, -400, 8);
        Insert2DLine(x, y + 3, x + w, y + 3, -400, 11);
        Insert2DLine(x, y + 4, x + w, y + 4, -400, 8);
        Insert2DLine(x, y + 5, x + w, y + 5, -400, 6);
        Insert2DLine(x, y + 6, x + w, y + 6, -400, 24);
    }
}

void S_DrawAirBar(int percent)
{
    int x, y;
    int w;

    x = AirBarX;
    y = AirBarY;
    w = (percent * AirBarW) / 100;

    Insert2DLine(x - 1, y + 1, x + AirBarW + 1, y + 1, -100, 0);
    Insert2DLine(x - 1, y + 2, x + AirBarW + 1, y + 2, -100, 0);
    Insert2DLine(x - 1, y + 3, x + AirBarW + 1, y + 3, -100, 0);
    Insert2DLine(x - 1, y + 4, x + AirBarW + 1, y + 4, -100, 0);
    Insert2DLine(x - 1, y + 5, x + AirBarW + 1, y + 5, -100, 0);
    Insert2DLine(x - 1, y + 6, x + AirBarW + 1, y + 6, -100, 0);
    Insert2DLine(x - 1, y + 7, x + AirBarW + 1, y + 7, -100, 0);

    Insert2DLine(x - 2, y + 8, x + AirBarW + 2, y + 8, -200, 17);
    Insert2DLine(x + AirBarW + 2, y, x + AirBarW + 2, y + 8, -200, 17);
    Insert2DLine(x - 2, y, x + AirBarW + 2, y, -300, 19);
    Insert2DLine(x - 2, y, x - 2, y + 8, -300, 19);
    if (percent > 0)
    {
        Insert2DLine(x, y + 2, x + w, y + 2, -400, 32);
        Insert2DLine(x, y + 3, x + w, y + 3, -400, 41);
        Insert2DLine(x, y + 4, x + w, y + 4, -400, 32);
        Insert2DLine(x, y + 5, x + w, y + 5, -400, 19);
        Insert2DLine(x, y + 6, x + w, y + 6, -400, 21);
    }
}

void AnimateTextures(int nframes)
{
    int i, j;
    sint16 *ptr;
    PHDTEXTURESTRUCT temp;
    static int frame_comp = 0;

    frame_comp += nframes;
    while (frame_comp > ANIMATED_TEXTURE)
    {
        ptr = aranges;
        for (i = (int)*(ptr++); i > 0; i--, ptr++)
        {
            j = (int)*(ptr++);
            temp = phdtextinfo[*(ptr)];
            for (; j > 0; j--, ptr++)
                phdtextinfo[*(ptr)] = phdtextinfo[*(ptr + 1)];
            phdtextinfo[*(ptr)] = temp;
        }
        frame_comp -= ANIMATED_TEXTURE;
    }
}

void S_SetupBelowWater(int underwater)
{
    if (underwater ^ wet)
    {
        if (underwater)
            FadeToPal(1, water_palette);
        else
            FadeToPal(1, game_palette);

        wet = underwater;
    }

    water_effect = !underwater;

    shade_effect = 1;
}

void S_SetupAboveWater(int underwater)
{
    water_effect = underwater;
    shade_effect = 0;
}

void S_AnimateTextures(int nframes)
{
    wibble_offset = (wibble_offset + (nframes / 2)) & (WIBBLE_SIZE - 1);
    AnimateTextures(nframes);
}

void S_DrawLighteningSegment(sint32 x1, sint32 y1, sint32 z1, sint32 x2, sint32 y2, sint32 z2, sint32 width)
{
    sint32 z, npoints;
    sint32 minx, maxx, miny, maxy;
    sint32 thickness1, thickness2;
    VERTEX_INFO *v;

    if (z1 < phd_znear || z1 > phd_zfar ||
        z2 < phd_znear || z2 > phd_zfar)
        return;
    z = z1 / phd_persp;
    x1 = x1 / z + phd_centerx;
    y1 = y1 / z + phd_centery;
    thickness1 = (width << W2V_SHIFT) / z;
    z = z2 / phd_persp;
    x2 = x2 / z + phd_centerx;
    y2 = y2 / z + phd_centery;
    thickness2 = (width << W2V_SHIFT) / z;

    if (x1 < x2)
    {
        minx = x1;
        maxx = x2;
    }
    else
    {
        minx = x2;
        maxx = x1;
    }
    if (y1 < y2)
    {
        miny = y1;
        maxy = y2;
    }
    else
    {
        miny = y2;
        maxy = y1;
    }

    if (maxx < phd_left || minx > phd_right ||
        maxy < phd_top || miny > phd_bottom ||
        maxx >= 16000 || minx <= -16000 ||
        maxy >= 16000 || miny <= -16000)
        return;

    if (z1 < z2)
        z1 = z2;

    v = v_buffer;
    if (y1 < y2)
    {
        v->x = (float)x1;
        v->y = (float)y1;
        v->g = 0.0f;
        v++;

        v->x = (float)(x1 + thickness1);
        v->y = (float)y1;
        v->g = 0.0f;
        v++;

        v->x = (float)(x2 + thickness2);
        v->y = (float)y2;
        v->g = 0.0f;
        v++;

        v->x = (float)x2;
        v->y = (float)y2;
        v->g = 0.0f;
    }
    else
    {
        v->x = (float)x2;
        v->y = (float)y2;
        v->g = 0.0f;
        v++;

        v->x = (float)(x2 + thickness2);
        v->y = (float)y2;
        v->g = 0.0f;
        v++;

        v->x = (float)(x1 + thickness1);
        v->y = (float)y1;
        v->g = 0.0f;
        v++;

        v->x = (float)x1;
        v->y = (float)y1;
        v->g = 0.0f;
    }

    npoints = XYGClipper(4, v_buffer);
    if (npoints)
    {
        *(sort3dptr + 0) = (sint32)(info3dptr);
        *(sort3dptr + 1) = z1;
        sort3dptr += 2;
        *(info3dptr + 0) = DRAW_POLY_GOURAUD;
        *(info3dptr + 1) = inv_colours[C_BLUE];
        *(info3dptr + 2) = (sint16)npoints;
        info3dptr += 3;
        for (v = v_buffer; npoints > 0; npoints--, info3dptr += 3, v++)
        {
            *(info3dptr) = (sint16)v->x;
            *(info3dptr + 1) = (sint16)v->y;
            *(info3dptr + 2) = (sint16)v->g;
        }
        surfacenum++;
    }

    *(sort3dptr + 0) = (sint32)(info3dptr);
    *(sort3dptr + 1) = z1 - 2;
    sort3dptr += 2;

    *(info3dptr + 0) = DRAW_POLY_LINE;
    *(info3dptr + 1) = (sint16)(x1 + thickness1 / 2);
    *(info3dptr + 2) = (sint16)y1;
    *(info3dptr + 3) = (sint16)(x2 + thickness2 / 2);
    *(info3dptr + 4) = (sint16)y2;
    *(info3dptr + 5) = inv_colours[C_WHITE];
    info3dptr += 6;
    surfacenum++;
}

int decomp_pcx(PIC *pic, uint8 *file_buf);

void S_DisplayPicture(char *filename)
{
    uint8 *pcx;
    PIC pic;
    char name[100];

    strcpy(name, filename);
    strcat(name, ".pcx");

    pcx = FileLoad(GetFullPath(name), bckscrn, 0);

    decomp_pcx(&pic, pcx);
}

int decomp_pcx(PIC *pic, uint8 *file_buf)
{
    PCX_HEADER *pcx = (PCX_HEADER *)file_buf;
    int i, sz;
    uint8 *src = file_buf + 128, *dest, c;

    if (pcx->zsoft_flag != 10 || pcx->version < 5 || pcx->bits != 8 || pcx->encoding != 1 || pcx->planes != 1)
    {
        return 0;
    }

    pic->w = pcx->xmax + 1 - pcx->xmin;
    pic->h = pcx->ymax + 1 - pcx->ymin;

    if (pic->w == 0 || pic->h == 0)
    {
        return 0;
    }

    dest = (uint8 *)game_setup.scrn_ptr;
    sz = pic->w * pic->h;

    while (sz > 1)
    {
        if ((*src & 0xc0) == 0xc0)
        {
            i = *src++;
            i &= 0x3f;
            c = *src++;

            while (i--)
            {
                *dest++ = c;
                sz--;
            }
        }
        else
        {
            *dest++ = *src++;
            sz--;
        }
    }

    src = file_buf + file_len - 768;

    for (i = 0; i < 256 * 3; i++)
    {
        game_palette[i] = (*src++) / 4;
    }

    return 1;
}

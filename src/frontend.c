#include <stdio.h>
#include <stdlib.h>
#include "game.h"
#include "player.h"

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

void S_DrawScreenLine(sint32 sx, sint32 sy, sint32 z, sint32 w, sint32 h, sint32 col, uint16 *grdptr, uint16 flags)
{
    *(sort3dptr) = (sint32)(info3dptr);
    *(sort3dptr + 1) = z << 3;
    sort3dptr += 2;

    *(info3dptr) = DRAW_POLY_LINE;
    *(info3dptr + 1) = (sint16)sx;
    *(info3dptr + 2) = (sint16)sy;
    *(info3dptr + 3) = (sint16)(sx + w);
    *(info3dptr + 4) = (sint16)(sy + h);
    *(info3dptr + 5) = (sint16)col;
    info3dptr += 6;
    surfacenum++;
}

#define B_YELLOW 15
#define B_ORANGE 31

void S_DrawScreenBox(sint32 sx, sint32 sy, sint32 z, sint32 w, sint32 h, sint32 col, uint16 *grdptr, uint16 flags)
{
    S_DrawScreenLine(sx, sy - 1, z, w + 1, 0, B_YELLOW, NULL, flags);
    S_DrawScreenLine(sx, sy, z, w, 0, B_ORANGE, NULL, flags);

    S_DrawScreenLine(sx + w, sy, z, 0, h, B_YELLOW, NULL, flags);
    S_DrawScreenLine(sx + w + 1, sy, z, 0, h + 1, B_ORANGE, NULL, flags);

    S_DrawScreenLine(sx + w, sy + h, z, -w, 0, B_YELLOW, NULL, flags);
    S_DrawScreenLine(sx + w, sy + h + 1, z, -w - 1, 0, B_ORANGE, NULL, flags);

    S_DrawScreenLine(sx - 1, sy + h, z, 0, -h - 1, B_YELLOW, NULL, flags);
    S_DrawScreenLine(sx, sy + h, z, 0, -h, B_ORANGE, NULL, flags);
}

void S_DrawScreenFBox(sint32 sx, sint32 sy, sint32 z, sint32 w, sint32 h, sint32 col, uint16 *grdptr, uint16 flags)
{
    *(sort3dptr) = (sint32)(info3dptr);
    *(sort3dptr + 1) = z << 3;
    sort3dptr += 2;

    *(info3dptr) = DRAW_POLY_TRANS;
    *(info3dptr + 1) = 24;
    *(info3dptr + 2) = 4;
    *(info3dptr + 3) = (sint16)sx;
    *(info3dptr + 4) = (sint16)sy;
    *(info3dptr + 5) = (sint16)(sx + w);
    *(info3dptr + 6) = (sint16)sy;
    *(info3dptr + 7) = (sint16)(sx + w);
    *(info3dptr + 8) = (sint16)(sy + h);
    *(info3dptr + 9) = (sint16)sx;
    *(info3dptr + 10) = (sint16)(sy + h);
    info3dptr += 11;

    surfacenum++;
}

void S_SetBackgroundGamma(sint16 gamma)
{
}

void S_SetGamma(sint16 gamma)
{
}

void S_FinishInventory(void)
{
    if (Inventory_Mode != INV_TITLE_MODE)
        TempVideoRemove();
}

void S_FadeToBlack(void)
{
    int i;
    uint8 *p;

    for (i = 0, p = game_palette; i < 256 * 3; i++, p++)
        *p = 0;

    FadeToPal(20, game_palette);
    FadeWait();

    ScreenClear();
    ScreenDump();
}

void S_LoadingScreen(int level_number)
{
}

void S_Wait(int frames)
{
    while (input)
        S_UpdateInput();

    while (frames > 0)
    {
        S_UpdateInput();
        if (keydata->keys_held)
            return;

        while (!Sync())
            ;
        frames--;
    }
}

char *fmv_names[] = {
    "fmv\\cafe.rpl",
    "fmv\\mansion.rpl",
    "fmv\\snow.rpl",
    "fmv\\lift.rpl",
    "fmv\\vision.rpl",
    "fmv\\canyon.rpl",
    "fmv\\pyramid.rpl",
    "fmv\\prison.rpl",
    "fmv\\end.rpl",
    "fmv\\core.rpl",
    "fmv\\escape.rpl"
};

int EscapeFMV(int sequence, int mode)
{
    int finished, frames, xoffset = 0, yoffset = 0, frigfactor = 2;
    PLRESULT pRes = PLAYER_OK;
    LPMOVIEHANDLE mhandle = NULL;
    LPVIDEOHANDLE vhandle = NULL;
    LPSOUNDHANDLE shandle = NULL;

    finished = 1;

    Player_InitPlaybackSystem((ULONG)SoundGetSOSHandle(), (void *)SoundGetSOSDriver());

    pRes = Player_InitMovie(&mhandle, NULL, NULL, GetFullPath(fmv_names[sequence]), 1 << 20);

    if (pRes != PLAYER_OK)
        S_ExitSystem("ERROR: Cannot initialise FMV player");

    if (mode == 0)
    {
        yoffset = 0;
        pRes = Player_InitVideo(&vhandle, mhandle->header.x_size, mhandle->header.y_size, xoffset, yoffset, 0, 0, 640, 480, 0, DFLAG_INVIEWPORT | DFLAG_CLEAROUTPUT);
    }
    else
    {
        yoffset = (480 - (mhandle->header.y_size << 1)) >> 1;
        pRes = Player_InitVideo(&vhandle, mhandle->header.x_size, mhandle->header.y_size, xoffset, yoffset, 0, 0, 640, 480, 0, DFLAG_SOFTDOUBLED | DFLAG_INVIEWPORT | DFLAG_CLEAROUTPUT);
    }

    if (pRes != PLAYER_OK)
        goto shutdownplayer;

    if (sound_active)
        pRes = Player_InitSound(&shandle, 44100, 1, 1, 22050, mhandle->header.sound_channels, mhandle->header.sound_rate, mhandle->header.sound_precision);
    else
        pRes = PLAYER_OK;

    if (pRes != PLAYER_OK)
        goto shutdownplayer;

    pRes = Player_InitMoviePlayback(mhandle, vhandle, shandle);

    if (pRes != PLAYER_OK)
        goto shutdownplayer;

    pRes = Player_InitPlaybackMode();

    if (pRes != PLAYER_OK)
        goto shutdownplayer;

    Player_MapVideo(vhandle, 0);

    frames = (mhandle->header.number_of_chunks + 1) * mhandle->header.frames_per_chunk;

    pRes = Player_StartTimer(mhandle);

    sprintf(exit_message, "Frames %d\n", frames);

    if (pRes != PLAYER_OK)
        goto shutdownplayer;

    if (shandle)
        Player_StartSound(shandle);

    while (mhandle->vdf < frames - frigfactor)
    {
        pRes = Player_Playframe(mhandle, vhandle, shandle, NULL, 0, 0, NULL, 0);
        if (pRes != PLAYER_OK)
            break;

        if (rawkey(K_ESC))
        {
            finished = 0;
            break;
        }
    }

shutdownplayer:
    if (shandle)
        Player_StopSound(shandle);
    Player_ShutDownSound(shandle);
    Player_ShutDownVideo(vhandle);
    Player_ShutDownMovie(mhandle);
    Player_ShutDownPlaybackSystem();

    return finished;
}

int S_PlayFMV(int sequence, int mode)
{
    int finished;

    if (malloc_buffer)
        free(malloc_buffer);

    finished = EscapeFMV(sequence, mode);

    hires_flag = -1;

    malloc_buffer = malloc(MALLOC_SIZE);
    if (!malloc_buffer)
        S_ExitSystem("ERROR: Could not allocate enough memory");
    init_game_malloc();

    return finished;
}

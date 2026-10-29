#include <stdio.h>
#include "game.h"

int overlay_flag = 1;

void DrawGameInfo(void)
{
    DrawAmmoInfo();
    if (overlay_flag > 0)
    {
        DrawHealthBar();
        DrawAirBar();
        DrawPickups();
    }
    T_DrawText();
}

void DrawHealthBar(void)
{
    int hitpoints;
    static int old_hitpoints = 0;

    hitpoints = (int)lara_item->hit_points;
    if (hitpoints < 0)
        hitpoints = 0;
    else if (hitpoints > LARA_HITPOINTS)
        hitpoints = LARA_HITPOINTS;

    if (old_hitpoints != hitpoints)
    {
        old_hitpoints = hitpoints;
        health_bar_timer = 40;
    }
    if (health_bar_timer < 0)
        health_bar_timer = 0;
    if (health_bar_timer > 0 || hitpoints <= 0 || lara.gun_status == LG_READY)
        S_DrawHealthBar(hitpoints / 10);
}

void DrawAirBar(void)
{
    int air;

    if (lara.water_status != LARA_UNDERWATER && lara.water_status != LARA_SURFACE)
        return;

    air = (int)lara.air;
    if (air < 0)
        air = 0;
    else if (air > LARA_AIR)
        air = LARA_AIR;

    S_DrawAirBar((air * 100) / LARA_AIR);
}

TEXTSTRING *ammotext = NULL;

void MakeAmmoString(char *string)
{
    char *c;

    for (c = string; *c != 0; c++)
    {
        if (*c == 32)
            continue;
        else if (*c - 'A' >= 0)
            *c += 12 - 'A';
        else
            *c += 1 - '0';
    }
}

void DrawAmmoInfo(void)
{
    char ammostring[80] = "";

    if (lara.gun_status != LG_READY || overlay_flag <= 0 || savegame.bonus_flag)
    {
        if (ammotext)
        {
            T_RemovePrint(ammotext);
            ammotext = NULL;
        }
        return;
    }
    switch (lara.gun_type)
    {
    case LG_PISTOLS:
        return;
        break;

    case LG_MAGNUMS:
        sprintf(ammostring, "%5d B", lara.magnums.ammo);
        break;

    case LG_UZIS:
        sprintf(ammostring, "%5d C", lara.uzis.ammo);
        break;

    case LG_SHOTGUN:
        sprintf(ammostring, "%5d A", lara.shotgun.ammo / SHOTGUN_AMMO_CLIP);
        break;

    default:
        return;
        break;
    }

    MakeAmmoString(ammostring);

    if (ammotext)
        T_ChangeText(ammotext, ammostring);
    else
    {
        ammotext = T_Print(-17, 22, 0, ammostring);
        T_RightAlign(ammotext, 1);
    }
}

#define NUM_PU 3

typedef struct displaypu
{
    sint16 duration;
    sint16 sprnum;
} DISPLAYPU;

DISPLAYPU pickups[NUM_PU];

void InitialisePickUpDisplay(void)
{
    int i;

    for (i = 0; i < NUM_PU; i++)
        pickups[i].duration = 0;
}

void DrawPickups(void)
{
    int i, time;
    static int old_game_timer;
    DISPLAYPU *pu;
    int wa, w, x, y;
    int scaler = 12288;

    time = savegame.timer - old_game_timer;
    old_game_timer = savegame.timer;
    if (time <= 0 || time >= 60)
        return;

    w = phd_winwidth / 10;
    x = phd_winwidth - w;
    y = phd_winheight - w;
    wa = (w * 4) / 3;

    pu = pickups;
    for (i = 0; i < NUM_PU; i++, pu++, x -= wa)
    {
        pu->duration -= time;
        if (pu->duration > 0)
            S_DrawPickup(x, y, scaler, pu->sprnum, 16 * 256, 0);
        else
            pu->duration = 0;
    }
}

void AddDisplayPickup(sint16 objnum)
{
    int i;

    for (i = 0; i < NUM_PU; i++)
    {
        if (pickups[i].duration <= 0)
        {
            pickups[i].duration = 75;
            pickups[i].sprnum = objects[objnum].mesh_index;
            return;
        }
    }
}

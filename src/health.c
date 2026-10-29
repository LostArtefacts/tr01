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

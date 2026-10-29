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

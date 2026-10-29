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

#include "game.h"
#include "invdata.h"

void SelectMeshes(INVENTORY_ITEM *inv_item);

void InitColours(void)
{
    inv_colours[C_BLACK] = S_COLOUR(0, 0, 0);
    inv_colours[C_GREY] = S_COLOUR(64, 64, 64);
    inv_colours[C_WHITE] = S_COLOUR(255, 255, 255);
    inv_colours[C_RED] = S_COLOUR(255, 0, 0);
    inv_colours[C_ORANGE] = S_COLOUR(255, 128, 0);
    inv_colours[C_YELLOW] = S_COLOUR(255, 255, 0);
    inv_colours[C_DARKGREEN] = S_COLOUR(0, 128, 0);
    inv_colours[C_GREEN] = S_COLOUR(0, 255, 0);
    inv_colours[C_CYAN] = S_COLOUR(0, 255, 255);
    inv_colours[C_BLUE] = S_COLOUR(0, 0, 255);
    inv_colours[C_MAGENTA] = S_COLOUR(255, 0, 255);
}

void RingIsOpen(RING_INFO *ring)
{
    if (Inventory_Mode == INV_TITLE_MODE)
        return;

    if (!Inv_ringText)
    {
        switch (ring->type)
        {
        case MAIN_RING:
            Inv_ringText = T_Print(0, 26, 0, inventory_main_heading);
            break;
        case OPTION_RING:
            if (Inventory_Mode == INV_DEATH_MODE)
                Inv_ringText = T_Print(0, 26, 0, inventory_gameover_heading);
            else
                Inv_ringText = T_Print(0, 26, 0, inventory_option_heading);
            break;
        case KEYS_RING:
            Inv_ringText = T_Print(0, 26, 0, inventory_keys_heading);
            break;
        }
        T_CentreH(Inv_ringText, 1);
    }

    if (Inventory_Mode == INV_KEYS_MODE || Inventory_Mode == INV_DEATH_MODE)
        return;

    if (!Inv_upArrow1)
    {
        if (ring->type == OPTION_RING || (ring->type == MAIN_RING && inv_keys_objects))
        {
            Inv_upArrow1 = T_Print(20, 28, 0, "[");
            Inv_upArrow2 = T_Print(-20, 28, 0, "[");
            T_RightAlign(Inv_upArrow2, 1);
        }
    }

    if (!Inv_downArrow1)
    {
        if (ring->type == MAIN_RING || ring->type == KEYS_RING)
        {
            Inv_downArrow1 = T_Print(20, -15, 0, "]");
            T_BottomAlign(Inv_downArrow1, 1);
            Inv_downArrow2 = T_Print(-20, -15, 0, "]");
            T_BottomAlign(Inv_downArrow2, 1);
            T_RightAlign(Inv_downArrow2, 1);
        }
    }
}

#include <stdio.h>
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

void RingIsNotOpen(RING_INFO *ring)
{
    if (Inv_ringText)
    {
        T_RemovePrint(Inv_ringText);
        Inv_ringText = NULL;

        if (Inv_upArrow1)
        {
            T_RemovePrint(Inv_upArrow1);
            T_RemovePrint(Inv_upArrow2);
            Inv_upArrow1 = Inv_upArrow2 = NULL;
        }

        if (Inv_downArrow1)
        {
            T_RemovePrint(Inv_downArrow1);
            T_RemovePrint(Inv_downArrow2);
            Inv_downArrow1 = Inv_downArrow2 = NULL;
        }
    }
}

void RingNotActive(INVENTORY_ITEM *inv_item)
{
    int tempInt;
    char tempText[64];

    if (!Inv_itemText[IT_NAME])
    {
        switch (inv_item->object_number)
        {
        case PUZZLE_OPTION1:
            Inv_itemText[IT_NAME] = T_Print(0, -16, 0, puzzle1_strings[CurrentLevel]);
            break;
        case PUZZLE_OPTION2:
            Inv_itemText[IT_NAME] = T_Print(0, -16, 0, puzzle2_strings[CurrentLevel]);
            break;
        case PUZZLE_OPTION3:
            Inv_itemText[IT_NAME] = T_Print(0, -16, 0, puzzle3_strings[CurrentLevel]);
            break;
        case PUZZLE_OPTION4:
            Inv_itemText[IT_NAME] = T_Print(0, -16, 0, puzzle4_strings[CurrentLevel]);
            break;
        case PICKUP_OPTION1:
            Inv_itemText[IT_NAME] = T_Print(0, -16, 0, pickup1_strings[CurrentLevel]);
            break;
        case PICKUP_OPTION2:
            Inv_itemText[IT_NAME] = T_Print(0, -16, 0, pickup2_strings[CurrentLevel]);
            break;
        case KEY_OPTION1:
            Inv_itemText[IT_NAME] = T_Print(0, -16, 0, key1_strings[CurrentLevel]);
            break;
        case KEY_OPTION2:
            Inv_itemText[IT_NAME] = T_Print(0, -16, 0, key2_strings[CurrentLevel]);
            break;
        case KEY_OPTION3:
            Inv_itemText[IT_NAME] = T_Print(0, -16, 0, key3_strings[CurrentLevel]);
            break;
        case KEY_OPTION4:
            Inv_itemText[IT_NAME] = T_Print(0, -16, 0, key4_strings[CurrentLevel]);
            break;
        case PASSPORT_OPTION:
            break;
        default:
            Inv_itemText[IT_NAME] = T_Print(0, -16, 0, inv_item->itemText);
            break;
        }
        if (Inv_itemText[IT_NAME])
        {
            T_BottomAlign(Inv_itemText[IT_NAME], 1);
            T_CentreH(Inv_itemText[IT_NAME], 1);
        }
    }
    tempInt = Inv_RequestItem(inv_item->object_number);
    switch (inv_item->object_number)
    {
    case SHOTGUN_OPTION:
        if (!Inv_itemText[IT_QTY] && !savegame.bonus_flag)
        {
            sprintf(tempText, "%5d A", lara.shotgun.ammo / SHOTGUN_AMMO_CLIP);
            MakeAmmoString(tempText);
            Inv_itemText[IT_QTY] = T_Print(64, -56, 0, tempText);
            T_BottomAlign(Inv_itemText[IT_QTY], 1);
            T_CentreH(Inv_itemText[IT_QTY], 1);
        }
        break;
    case MAGNUM_OPTION:
        if (!Inv_itemText[IT_QTY] && !savegame.bonus_flag)
        {
            sprintf(tempText, "%5d B", lara.magnums.ammo);
            MakeAmmoString(tempText);
            Inv_itemText[IT_QTY] = T_Print(64, -56, 0, tempText);
            T_BottomAlign(Inv_itemText[IT_QTY], 1);
            T_CentreH(Inv_itemText[IT_QTY], 1);
        }
        break;
    case UZI_OPTION:
        if (!Inv_itemText[IT_QTY] && !savegame.bonus_flag)
        {
            sprintf(tempText, "%5d C", lara.uzis.ammo);
            MakeAmmoString(tempText);
            Inv_itemText[IT_QTY] = T_Print(64, -56, 0, tempText);
            T_BottomAlign(Inv_itemText[IT_QTY], 1);
            T_CentreH(Inv_itemText[IT_QTY], 1);
        }
        break;
    case SG_AMMO_OPTION:
        if (!Inv_itemText[IT_QTY])
        {
            sprintf(tempText, "%d", tempInt * NUM_SG_SHELLS);
            MakeAmmoString(tempText);
            Inv_itemText[IT_QTY] = T_Print(64, -56, 0, tempText);
            T_BottomAlign(Inv_itemText[IT_QTY], 1);
            T_CentreH(Inv_itemText[IT_QTY], 1);
        }
        break;
    case MAG_AMMO_OPTION:
        if (!Inv_itemText[IT_QTY])
        {
            sprintf(tempText, "%d", Inv_RequestItem(MAG_AMMO_OPTION) * 2);
            MakeAmmoString(tempText);
            Inv_itemText[IT_QTY] = T_Print(64, -56, 0, tempText);
            T_BottomAlign(Inv_itemText[IT_QTY], 1);
            T_CentreH(Inv_itemText[IT_QTY], 1);
        }
        break;
    case UZI_AMMO_OPTION:
        if (!Inv_itemText[IT_QTY])
        {
            sprintf(tempText, "%d", Inv_RequestItem(UZI_AMMO_OPTION) * 2);
            MakeAmmoString(tempText);
            Inv_itemText[IT_QTY] = T_Print(64, -56, 0, tempText);
            T_BottomAlign(Inv_itemText[IT_QTY], 1);
            T_CentreH(Inv_itemText[IT_QTY], 1);
        }
        break;
    case MEDI_OPTION:
        health_bar_timer = 40;
        DrawHealthBar();
        if (!Inv_itemText[IT_QTY] && tempInt > 1)
        {
            sprintf(tempText, "%d", tempInt);
            MakeAmmoString(tempText);
            Inv_itemText[IT_QTY] = T_Print(64, -56, 0, tempText);
            T_BottomAlign(Inv_itemText[IT_QTY], 1);
            T_CentreH(Inv_itemText[IT_QTY], 1);
        }
        break;
    case BIGMEDI_OPTION:
        health_bar_timer = 40;
        DrawHealthBar();
        if (!Inv_itemText[IT_QTY] && tempInt > 1)
        {
            sprintf(tempText, "%d", tempInt);
            MakeAmmoString(tempText);
            Inv_itemText[IT_QTY] = T_Print(64, -56, 0, tempText);
            T_BottomAlign(Inv_itemText[IT_QTY], 1);
            T_CentreH(Inv_itemText[IT_QTY], 1);
        }
        break;
    case LEADBAR_OPTION:
        if (!Inv_itemText[IT_QTY] && tempInt > 1)
        {
            sprintf(tempText, "%d", tempInt);
            MakeAmmoString(tempText);
            Inv_itemText[IT_QTY] = T_Print(64, -56, 0, tempText);
            T_BottomAlign(Inv_itemText[IT_QTY], 1);
            T_CentreH(Inv_itemText[IT_QTY], 1);
        }
    case PUZZLE_OPTION1:
        if (!Inv_itemText[IT_QTY] && tempInt > 1)
        {
            sprintf(tempText, "%d", tempInt);
            MakeAmmoString(tempText);
            Inv_itemText[IT_QTY] = T_Print(64, -56, 0, tempText);
            T_BottomAlign(Inv_itemText[IT_QTY], 1);
            T_CentreH(Inv_itemText[IT_QTY], 1);
        }
    case PUZZLE_OPTION2:
        if (!Inv_itemText[IT_QTY] && tempInt > 1)
        {
            sprintf(tempText, "%d", tempInt);
            MakeAmmoString(tempText);
            Inv_itemText[IT_QTY] = T_Print(64, -56, 0, tempText);
            T_BottomAlign(Inv_itemText[IT_QTY], 1);
            T_CentreH(Inv_itemText[IT_QTY], 1);
        }
    case PUZZLE_OPTION3:
        if (!Inv_itemText[IT_QTY] && tempInt > 1)
        {
            sprintf(tempText, "%d", tempInt);
            MakeAmmoString(tempText);
            Inv_itemText[IT_QTY] = T_Print(64, -56, 0, tempText);
            T_BottomAlign(Inv_itemText[IT_QTY], 1);
            T_CentreH(Inv_itemText[IT_QTY], 1);
        }
    case PUZZLE_OPTION4:
        if (!Inv_itemText[IT_QTY] && tempInt > 1)
        {
            sprintf(tempText, "%d", tempInt);
            MakeAmmoString(tempText);
            Inv_itemText[IT_QTY] = T_Print(64, -56, 0, tempText);
            T_BottomAlign(Inv_itemText[IT_QTY], 1);
            T_CentreH(Inv_itemText[IT_QTY], 1);
        }
        break;
    case PICKUP_OPTION1:
        if (!Inv_itemText[IT_QTY] && tempInt > 1)
        {
            sprintf(tempText, "%d", tempInt);
            MakeAmmoString(tempText);
            Inv_itemText[IT_QTY] = T_Print(64, -56, 0, tempText);
            T_BottomAlign(Inv_itemText[IT_QTY], 1);
            T_CentreH(Inv_itemText[IT_QTY], 1);
        }
        break;
    case PICKUP_OPTION2:
        if (!Inv_itemText[IT_QTY] && tempInt > 1)
        {
            sprintf(tempText, "%d", tempInt);
            MakeAmmoString(tempText);
            Inv_itemText[IT_QTY] = T_Print(64, -56, 0, tempText);
            T_BottomAlign(Inv_itemText[IT_QTY], 1);
            T_CentreH(Inv_itemText[IT_QTY], 1);
        }
        break;
    case KEY_OPTION1:
        if (!Inv_itemText[IT_QTY] && tempInt > 1)
        {
            sprintf(tempText, "%d", tempInt);
            MakeAmmoString(tempText);
            Inv_itemText[IT_QTY] = T_Print(64, -56, 0, tempText);
            T_BottomAlign(Inv_itemText[IT_QTY], 1);
            T_CentreH(Inv_itemText[IT_QTY], 1);
        }
        break;
    case KEY_OPTION2:
        if (!Inv_itemText[IT_QTY] && tempInt > 1)
        {
            sprintf(tempText, "%d", tempInt);
            MakeAmmoString(tempText);
            Inv_itemText[IT_QTY] = T_Print(64, -56, 0, tempText);
            T_BottomAlign(Inv_itemText[IT_QTY], 1);
            T_CentreH(Inv_itemText[IT_QTY], 1);
        }
        break;
    case KEY_OPTION3:
        if (!Inv_itemText[IT_QTY] && tempInt > 1)
        {
            sprintf(tempText, "%d", tempInt);
            MakeAmmoString(tempText);
            Inv_itemText[IT_QTY] = T_Print(64, -56, 0, tempText);
            T_BottomAlign(Inv_itemText[IT_QTY], 1);
            T_CentreH(Inv_itemText[IT_QTY], 1);
        }
        break;
    case KEY_OPTION4:
        if (!Inv_itemText[IT_QTY] && tempInt > 1)
        {
            sprintf(tempText, "%d", tempInt);
            MakeAmmoString(tempText);
            Inv_itemText[IT_QTY] = T_Print(64, -56, 0, tempText);
            T_BottomAlign(Inv_itemText[IT_QTY], 1);
            T_CentreH(Inv_itemText[IT_QTY], 1);
        }
        break;
    case SCION_OPTION:
        if (!Inv_itemText[IT_QTY] && tempInt > 1)
        {
            sprintf(tempText, "%d", tempInt);
            MakeAmmoString(tempText);
            Inv_itemText[IT_QTY] = T_Print(64, -56, 0, tempText);
            T_BottomAlign(Inv_itemText[IT_QTY], 1);
            T_CentreH(Inv_itemText[IT_QTY], 1);
        }
        break;
    }
}

void RingActive(void)
{
    if (Inv_itemText[IT_NAME])
    {
        T_RemovePrint(Inv_itemText[IT_NAME]);
        Inv_itemText[IT_NAME] = NULL;
    }
    if (Inv_itemText[IT_QTY])
    {
        T_RemovePrint(Inv_itemText[IT_QTY]);
        Inv_itemText[IT_QTY] = NULL;
    }
}

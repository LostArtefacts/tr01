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

int Inv_AddItem(int itemNum)
{
    int n, m, found = 0;
    int itemNumOption = 0;
    INVENTORY_ITEM *inv_item;

    itemNumOption = Inv_GetItemOption(itemNum);

    for (n = 0; n < inv_main_objects; n++)
    {
        inv_item = inv_main_list[n];
        if (inv_item->object_number == itemNumOption)
        {
            found = 1;
            break;
        }
    }
    for (m = 0; m < inv_keys_objects; m++)
    {
        inv_item = inv_keys_list[m];
        if (inv_item->object_number == itemNumOption)
        {
            found = 2;
            break;
        }
    }

    if (found == 1)
    {
        inv_main_qtys[n]++;
        return 1;
    }
    else if (found == 2)
    {
        inv_keys_qtys[m]++;
        return 1;
    }
    else
    {
        switch (itemNum)
        {
        case GUN_ITEM:
        case GUN_OPTION:
            Inv_InsertItem(&igun_option);
            return 1;
        case SHOTGUN_ITEM:
        case SHOTGUN_OPTION:
            if ((found = Inv_RequestItem(SG_AMMO_ITEM)))
            {
                for (n = 0; n < found; n++)
                {
                    Inv_RemoveItem(SG_AMMO_ITEM);
                    lara.shotgun.ammo += SHOTGUN_AMMO_QTY;
                }
            }
            lara.shotgun.ammo += SHOTGUN_AMMO_QTY;
            Inv_InsertItem(&ishotgun_option);
            GlobalItemReplace(SHOTGUN_ITEM, SG_AMMO_ITEM);
            break;
        case MAGNUM_ITEM:
        case MAGNUM_OPTION:
            if ((found = Inv_RequestItem(MAG_AMMO_ITEM)))
            {
                for (n = 0; n < found; n++)
                {
                    Inv_RemoveItem(MAG_AMMO_ITEM);
                    lara.magnums.ammo += MAGNUM_AMMO_QTY;
                }
            }
            GlobalItemReplace(MAGNUM_ITEM, MAG_AMMO_ITEM);
            lara.magnums.ammo += MAGNUM_AMMO_QTY;
            Inv_InsertItem(&imagnum_option);
            break;
        case UZI_ITEM:
        case UZI_OPTION:
            if ((found = Inv_RequestItem(UZI_AMMO_ITEM)))
            {
                for (n = 0; n < found; n++)
                {
                    Inv_RemoveItem(UZI_AMMO_ITEM);
                    lara.uzis.ammo += UZI_AMMO_QTY;
                }
            }
            GlobalItemReplace(UZI_ITEM, UZI_AMMO_ITEM);
            lara.uzis.ammo += UZI_AMMO_QTY;
            Inv_InsertItem(&iuzi_option);
            break;
        case SG_AMMO_ITEM:
        case SG_AMMO_OPTION:
            if (Inv_RequestItem(SHOTGUN_ITEM))
                lara.shotgun.ammo += SHOTGUN_AMMO_QTY;
            else
                Inv_InsertItem(&isgunammo_option);
            break;
        case MAG_AMMO_ITEM:
        case MAG_AMMO_OPTION:
            if (Inv_RequestItem(MAGNUM_ITEM))
                lara.magnums.ammo += MAGNUM_AMMO_QTY;
            else
                Inv_InsertItem(&imagammo_option);
            break;
        case UZI_AMMO_ITEM:
        case UZI_AMMO_OPTION:
            if (Inv_RequestItem(UZI_ITEM))
                lara.uzis.ammo += UZI_AMMO_QTY;
            else
                Inv_InsertItem(&iuziammo_option);
            break;
        case MEDI_ITEM:
        case MEDI_OPTION:
            Inv_InsertItem(&imedi_option);
            return 1;
        case BIGMEDI_ITEM:
        case BIGMEDI_OPTION:
            Inv_InsertItem(&ibigmedi_option);
            return 1;
        case LEADBAR_ITEM:
        case LEADBAR_OPTION:
            Inv_InsertItem(&ileadbar_option);
            return 1;
        case PICKUP_ITEM1:
        case PICKUP_OPTION1:
            Inv_InsertItem(&ipickup1_option);
            return 1;
        case PICKUP_ITEM2:
        case PICKUP_OPTION2:
            Inv_InsertItem(&ipickup2_option);
            return 1;
        case SCION_ITEM:
        case SCION_ITEM2:
        case SCION_OPTION:
            Inv_InsertItem(&iscion_option);
            return 1;
        case PUZZLE_ITEM1:
        case PUZZLE_OPTION1:
            Inv_InsertItem(&ipuzzle1_option);
            return 1;
        case PUZZLE_ITEM2:
        case PUZZLE_OPTION2:
            Inv_InsertItem(&ipuzzle2_option);
            return 1;
        case PUZZLE_ITEM3:
        case PUZZLE_OPTION3:
            Inv_InsertItem(&ipuzzle3_option);
            return 1;
        case PUZZLE_ITEM4:
        case PUZZLE_OPTION4:
            Inv_InsertItem(&ipuzzle4_option);
            return 1;
        case KEY_ITEM1:
        case KEY_OPTION1:
            Inv_InsertItem(&ikey1_option);
            return 1;
        case KEY_ITEM2:
        case KEY_OPTION2:
            Inv_InsertItem(&ikey2_option);
            return 1;
        case KEY_ITEM3:
        case KEY_OPTION3:
            Inv_InsertItem(&ikey3_option);
            return 1;
        case KEY_ITEM4:
        case KEY_OPTION4:
            Inv_InsertItem(&ikey4_option);
            return 1;
        default:
            return 0;
        }
    }
    return 0;
}

void Inv_InsertItem(INVENTORY_ITEM *inv_item)
{
    int n, m;
    INVENTORY_ITEM *inv_place;

    if (inv_item->inv_pos < 100)
    {
        for (n = 0; n < inv_main_objects; n++)
        {
            inv_place = inv_main_list[n];
            if (inv_place->inv_pos > inv_item->inv_pos)
                break;
        }
        if (n == inv_main_objects)
        {
            inv_main_list[inv_main_objects] = inv_item;
            inv_main_qtys[inv_main_objects] = 1;
            inv_main_objects++;
        }
        else
        {
            for (m = inv_main_objects; m > (n - 1); m--)
            {
                inv_main_list[m + 1] = inv_main_list[m];
                inv_main_qtys[m + 1] = inv_main_qtys[m];
            }
            inv_main_list[n] = inv_item;
            inv_main_qtys[n] = 1;
            inv_main_objects++;
        }
    }
    else
    {
        for (n = 0; n < inv_keys_objects; n++)
        {
            inv_place = inv_keys_list[n];
            if (inv_place->inv_pos > inv_item->inv_pos)
                break;
        }
        if (n == inv_keys_objects)
        {
            inv_keys_list[inv_keys_objects] = inv_item;
            inv_keys_qtys[inv_keys_objects] = 1;
            inv_keys_objects++;
        }
        else
        {
            for (m = inv_keys_objects; m > (n - 1); m--)
            {
                inv_keys_list[m + 1] = inv_keys_list[m];
                inv_keys_qtys[m + 1] = inv_keys_qtys[m];
            }
            inv_keys_list[n] = inv_item;
            inv_keys_qtys[n] = 1;
            inv_keys_objects++;
        }
    }
}

int Inv_RequestItem(int itemNum)
{
    int n;
    int itemNumOption;
    INVENTORY_ITEM *inv_item;

    itemNumOption = Inv_GetItemOption(itemNum);

    for (n = 0; n < inv_main_objects; n++)
    {
        inv_item = inv_main_list[n];
        if (inv_item->object_number == itemNumOption)
            return inv_main_qtys[n];
    }
    for (n = 0; n < inv_keys_objects; n++)
    {
        inv_item = inv_keys_list[n];
        if (inv_item->object_number == itemNumOption)
            return inv_keys_qtys[n];
    }
    return 0;
}

void Inv_RemoveAllItems(void)
{
    inv_main_objects = 1;
    inv_main_current = 0;

    inv_keys_objects = 0;
    inv_keys_current = 0;
}

int Inv_RemoveItem(int itemNum)
{
    int n, m;
    int itemNumOption;
    INVENTORY_ITEM *inv_item;

    itemNumOption = Inv_GetItemOption(itemNum);
    for (n = 0; n < inv_main_objects; n++)
    {
        inv_item = inv_main_list[n];
        if (inv_item->object_number == itemNumOption)
        {
            inv_main_qtys[n]--;
            if (inv_main_qtys[n] <= 0)
            {
                inv_main_objects--;
                for (m = n; m < inv_main_objects; m++)
                {
                    inv_main_list[m] = inv_main_list[m + 1];
                    inv_main_qtys[m] = inv_main_qtys[m + 1];
                }
            }
            return 1;
        }
    }
    for (n = 0; n < inv_keys_objects; n++)
    {
        inv_item = inv_keys_list[n];
        if (inv_item->object_number == itemNumOption)
        {
            inv_keys_qtys[n]--;
            if (inv_keys_qtys[n] <= 0)
            {
                inv_keys_objects--;
                for (m = n; m < inv_keys_objects; m++)
                {
                    inv_keys_list[m] = inv_keys_list[m + 1];
                    inv_keys_qtys[m] = inv_keys_qtys[m + 1];
                }
            }
            return 1;
        }
    }
    return 0;
}

int Inv_GetCount(void)
{
    int n, qty = 0;
    for (n = 0; n < inv_main_objects; n++)
    {
        qty += inv_main_qtys[n];
    }
    return qty;
}

int Inv_GetItemOption(int itemNum)
{
    switch (itemNum)
    {
    case GUN_ITEM:
    case GUN_OPTION:
        return GUN_OPTION;
    case SHOTGUN_ITEM:
    case SHOTGUN_OPTION:
        return SHOTGUN_OPTION;
    case MAGNUM_ITEM:
    case MAGNUM_OPTION:
        return MAGNUM_OPTION;
    case UZI_ITEM:
    case UZI_OPTION:
        return UZI_OPTION;
    case SG_AMMO_ITEM:
    case SG_AMMO_OPTION:
        return SG_AMMO_OPTION;
    case MAG_AMMO_ITEM:
    case MAG_AMMO_OPTION:
        return MAG_AMMO_OPTION;
    case UZI_AMMO_ITEM:
    case UZI_AMMO_OPTION:
        return UZI_AMMO_OPTION;
    case EXPLOSIVE_ITEM:
    case EXPLOSIVE_OPTION:
        return EXPLOSIVE_OPTION;
    case MEDI_ITEM:
    case MEDI_OPTION:
        return MEDI_OPTION;
    case BIGMEDI_ITEM:
    case BIGMEDI_OPTION:
        return BIGMEDI_OPTION;
    case LEADBAR_ITEM:
    case LEADBAR_OPTION:
        return LEADBAR_OPTION;
    case PICKUP_ITEM1:
    case PICKUP_OPTION1:
        return PICKUP_OPTION1;
    case PICKUP_ITEM2:
    case PICKUP_OPTION2:
        return PICKUP_OPTION2;
    case SCION_ITEM:
    case SCION_ITEM2:
    case SCION_OPTION:
        return SCION_OPTION;
    case PUZZLE_ITEM1:
    case PUZZLE_OPTION1:
        return PUZZLE_OPTION1;
    case PUZZLE_ITEM2:
    case PUZZLE_OPTION2:
        return PUZZLE_OPTION2;
    case PUZZLE_ITEM3:
    case PUZZLE_OPTION3:
        return PUZZLE_OPTION3;
    case PUZZLE_ITEM4:
    case PUZZLE_OPTION4:
        return PUZZLE_OPTION4;
    case KEY_ITEM1:
    case KEY_OPTION1:
        return KEY_OPTION1;
    case KEY_ITEM2:
    case KEY_OPTION2:
        return KEY_OPTION2;
    case KEY_ITEM3:
    case KEY_OPTION3:
        return KEY_OPTION3;
    case KEY_ITEM4:
    case KEY_OPTION4:
        return KEY_OPTION4;
    }
    return -1;
}

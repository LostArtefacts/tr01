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

void RemoveInventoryText(void)
{
    int n;

    for (n = 0; n < IT_NUMBEROF; n++)
    {
        if (Inv_itemText[n])
        {
            T_RemovePrint(Inv_itemText[n]);
            Inv_itemText[n] = NULL;
        }
    }
}

void Inv_RingInit(RING_INFO *ring, sint16 type, INVENTORY_ITEM **list, sint16 qty, sint16 current, IMOTION_INFO *imo)
{
    ring->type = type;
    ring->radius = 0;
    ring->list = list;
    ring->number_of_objects = qty;
    ring->current_object = current;
    ring->angle_adder = 0x10000 / qty;

    if (Inventory_Mode != INV_TITLE_MODE)
        ring->camera_pitch = 0;
    else
        ring->camera_pitch = 0x400;
    ring->rotating = 0;
    ring->rot_count = 0;
    ring->target_object = 0;
    ring->rot_adder = 0;
    ring->rot_adderL = 0;
    ring->rot_adderR = 0;

    ring->imo = imo;

    ring->camera.x_pos = 0;
    ring->camera.y_pos = CAMERA_STARTHEIGHT;
    ring->camera.z_pos = 0x380;
    ring->camera.x_rot = 0;
    ring->camera.y_rot = 0;
    ring->camera.z_rot = 0;

    Inv_RingMotionInit(ring, OPEN_FRAMES, RNG_OPENING, RNG_OPEN);
    Inv_RingMotionRadius(ring, RING_RADIUS);
    Inv_RingMotionCameraPos(ring, CAMERA_HEIGHT);
    Inv_RingMotionRotation(ring, OPEN_ROTATION, 0xc000 - (ring->current_object * ring->angle_adder));

    ring->ringpos.x_pos = 0;
    ring->ringpos.y_pos = 0;
    ring->ringpos.z_pos = 0;
    ring->ringpos.x_rot = 0;
    ring->ringpos.y_rot = imo->rotate_target - OPEN_ROTATION;
    ring->ringpos.z_rot = 0;

    ring->light.x = -0x600;
    ring->light.y = 0x100;
    ring->light.z = 0x400;
}

void Inv_RingGetView(RING_INFO *ring, PHD_3DPOS *viewer)
{
    PHD_ANGLE angles[2];

    phd_GetVectorAngles(0 - ring->camera.x_pos, CAMERA_YOFFSET - ring->camera.y_pos, ring->radius - ring->camera.z_pos, angles);
    viewer->x_pos = ring->camera.x_pos;
    viewer->y_pos = ring->camera.y_pos;
    viewer->z_pos = ring->camera.z_pos;
    viewer->x_rot = angles[1] + ring->camera_pitch;
    viewer->y_rot = angles[0];
    viewer->z_rot = 0;
}

void Inv_RingLight(RING_INFO *ring)
{
    PHD_ANGLE angles[2];

    ls_divider = 0x6000;
    phd_GetVectorAngles(ring->light.x, ring->light.y, ring->light.z, angles);
    phd_RotateLight(angles[1], angles[0]);
}

void Inv_RingCalcAdders(RING_INFO *ring, sint16 rotation_duration)
{
    ring->angle_adder = 0x10000 / ring->number_of_objects;
    ring->rot_adderL = ring->angle_adder / rotation_duration;
    ring->rot_adderR = -ring->rot_adderL;
}

void Inv_RingDoMotions(RING_INFO *ring)
{
    INVENTORY_ITEM *inv_item;
    IMOTION_INFO *imo;

    imo = ring->imo;

    if (imo->count)
    {
        ring->radius += imo->radius_rate;
        ring->camera.y_pos += imo->camera_yrate;
        ring->ringpos.y_rot += imo->rotate_rate;
        ring->camera_pitch += imo->camera_pitch_rate;

        inv_item = *(ring->list + ring->current_object);
        inv_item->pt_xrot += imo->item_ptxrot_rate;
        inv_item->x_rot += imo->item_xrot_rate;
        inv_item->ytrans += imo->item_ytrans_rate;
        inv_item->ztrans += imo->item_ztrans_rate;

        imo->count--;
        if (!imo->count)
        {
            imo->status = imo->status_target;

            if (imo->radius_rate)
            {
                imo->radius_rate = 0;
                ring->radius = imo->radius_target;
            }
            if (imo->camera_yrate)
            {
                imo->camera_yrate = 0;
                ring->camera.y_pos = imo->camera_ytarget;
            }
            if (imo->rotate_rate)
            {
                imo->rotate_rate = 0;
                ring->ringpos.y_rot = imo->rotate_target;
            }
            if (imo->item_ptxrot_rate)
            {
                imo->item_ptxrot_rate = 0;
                inv_item->pt_xrot = imo->item_ptxrot_target;
            }
            if (imo->item_xrot_rate)
            {
                imo->item_xrot_rate = 0;
                inv_item->x_rot = imo->item_xrot_target;
            }
            if (imo->item_ytrans_rate)
            {
                imo->item_ytrans_rate = 0;
                inv_item->ytrans = imo->item_ytrans_target;
            }
            if (imo->item_ztrans_rate)
            {
                imo->item_ztrans_rate = 0;
                inv_item->ztrans = imo->item_ztrans_target;
            }
            if (imo->camera_pitch_rate)
            {
                imo->camera_pitch_rate = 0;
                ring->camera_pitch = imo->camera_pitch_target;
            }
        }
    }

    if (ring->rotating)
    {
        ring->ringpos.y_rot += ring->rot_adder;
        ring->rot_count--;
        if (ring->rot_count == 0)
        {
            ring->current_object = ring->target_object;
            ring->ringpos.y_rot = 0xc000 - (ring->current_object * ring->angle_adder);
            ring->rotating = 0;
        }
    }
}

void Inv_RingRotateLeft(RING_INFO *ring)
{
    ring->rotating = 1;
    ring->target_object = ring->current_object - 1;
    if (ring->target_object < 0)
        ring->target_object = ring->number_of_objects - 1;
    ring->rot_count = ROTATE_DURATION;
    ring->rot_adder = ring->rot_adderL;
}

void Inv_RingRotateRight(RING_INFO *ring)
{
    ring->rotating = 1;
    ring->target_object = ring->current_object + 1;
    if (ring->target_object >= ring->number_of_objects)
        ring->target_object = 0;
    ring->rot_count = ROTATE_DURATION;
    ring->rot_adder = ring->rot_adderR;
}

void Inv_RingMotionRadius(RING_INFO *ring, sint16 target)
{
    IMOTION_INFO *imo;

    imo = ring->imo;
    imo->radius_target = target;
    imo->radius_rate = (target - ring->radius) / imo->count;
}

void Inv_RingMotionRotation(RING_INFO *ring, sint16 rotation, sint16 target)
{
    IMOTION_INFO *imo;

    imo = ring->imo;
    imo->rotate_rate = rotation / imo->count;
    imo->rotate_target = target;
}

void Inv_RingMotionCameraPos(RING_INFO *ring, sint16 target)
{
    IMOTION_INFO *imo;

    imo = ring->imo;
    imo->camera_ytarget = target;
    imo->camera_yrate = (sint16)((target - ring->camera.y_pos) / imo->count);
}

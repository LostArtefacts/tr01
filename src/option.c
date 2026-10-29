#include "game.h"
#include "invdata.h"

int keychange = 0, select_key = 0;
int iconfig = 0;

int detail_level = 1;

TEXTSTRING *ctext[13] = {NULL};
TEXTSTRING *btext[13] = {NULL};

void do_passport_option(INVENTORY_ITEM *inv_item);
void do_gamma_option(INVENTORY_ITEM *inv_item);
void do_detail_option(INVENTORY_ITEM *inv_item);
void do_sound_option(INVENTORY_ITEM *inv_item);
void do_compass_option(INVENTORY_ITEM *inv_item);
void do_control_option(INVENTORY_ITEM *inv_item);
void GetSavedGamesList(REQUEST_INFO *req);
void Init_Requester(REQUEST_INFO *req);
sint32 Display_Requester(REQUEST_INFO *req);

sint32 m_status = 0;

void do_inventory_options(INVENTORY_ITEM *inv_item)
{
    switch (inv_item->object_number)
    {
    case MAP_OPTION:
        do_compass_option(inv_item);
        break;
    case GUN_OPTION:
        inputDB |= SELECT_ITEM;
        break;
    case SHOTGUN_OPTION:
        inputDB |= SELECT_ITEM;
        break;
    case MAGNUM_OPTION:
        inputDB |= SELECT_ITEM;
        break;
    case UZI_OPTION:
        inputDB |= SELECT_ITEM;
        break;
    case GUN_AMMO_OPTION:
        break;
    case SG_AMMO_OPTION:
        break;
    case MAG_AMMO_OPTION:
        break;
    case UZI_AMMO_OPTION:
        break;
    case EXPLOSIVE_OPTION:
        inputDB |= SELECT_ITEM;
        break;
    case MEDI_OPTION:
        inputDB |= SELECT_ITEM;
        break;
    case BIGMEDI_OPTION:
        inputDB |= SELECT_ITEM;
        break;
    case PICKUP_OPTION1:
        inputDB |= SELECT_ITEM;
        break;
    case PICKUP_OPTION2:
        inputDB |= SELECT_ITEM;
        break;
    case SCION_OPTION:
        inputDB |= SELECT_ITEM;
        break;
    case PUZZLE_OPTION1:
        inputDB |= SELECT_ITEM;
        break;
    case PUZZLE_OPTION2:
        inputDB |= SELECT_ITEM;
        break;
    case PUZZLE_OPTION3:
        inputDB |= SELECT_ITEM;
        break;
    case PUZZLE_OPTION4:
        inputDB |= SELECT_ITEM;
        break;
    case KEY_OPTION1:
        inputDB |= SELECT_ITEM;
        break;
    case KEY_OPTION2:
        inputDB |= SELECT_ITEM;
        break;
    case KEY_OPTION3:
        inputDB |= SELECT_ITEM;
        break;
    case KEY_OPTION4:
        inputDB |= SELECT_ITEM;
        break;
    case PASSPORT_OPTION:
        do_passport_option(inv_item);
        break;
    case GAMMA_OPTION:
        do_gamma_option(inv_item);
        break;
    case DETAIL_OPTION:
        do_detail_option(inv_item);
        break;
    case SOUND_OPTION:
        do_sound_option(inv_item);
        break;
    case CONTROL_OPTION:
        do_control_option(inv_item);
        break;
    default:
        if (inputDB & SELECT_ITEM || inputDB & DESELECT_ITEM)
        {
            inv_item->goal_frame = 0;
            inv_item->anim_direction = -1;
        }
        break;
    }
}

TEXTSTRING *passport_text1 = NULL;

int passport_mode = 0;

void do_passport_option(INVENTORY_ITEM *inv_item)
{
    sint16 page;
    sint32 select;

    T_RemovePrint(Inv_itemText[IT_NAME]);
    Inv_itemText[IT_NAME] = NULL;

    page = (inv_item->goal_frame - inv_item->open_frame) / 5;
    if ((inv_item->goal_frame - inv_item->open_frame) % 5)
        page = -1;

    if (Inventory_Mode == INV_LOAD_MODE || Inventory_Mode == INV_SAVE_MODE)
        inputDB &= ~(PASSPORT_2FRONT | PASSPORT_2BACK);

    switch (page)
    {
    case 0:
        if (passport_mode == 1)
        {
            select = Display_Requester(&Load_Game_Requester);
            if (select)
            {
                if (select > 0)
                    Inventory_ExtraData[1] = select - 1;
                else if (Inventory_Mode != INV_SAVE_MODE && Inventory_Mode != INV_LOAD_MODE)
                    input = inputDB = 0;
                passport_mode = 0;
            }
            else
                input = inputDB = 0;
        }
        else if (passport_mode == 0)
        {
            if (!SavedGames || Inventory_Mode == INV_SAVE_MODE)
                inputDB = PASSPORT_2BACK;
            else
            {
                if (!passport_text1)
                {
                    passport_text1 = T_Print(0, -16, 0, passport_load_game);
                    T_BottomAlign(passport_text1, 1);
                    T_CentreH(passport_text1, 1);
                }

                if (inputDB & SELECT_ITEM || Inventory_Mode == INV_LOAD_MODE)
                {
                    T_RemovePrint(Inv_ringText);
                    Inv_ringText = NULL;
                    T_RemovePrint(Inv_itemText[IT_NAME]);
                    Inv_itemText[IT_NAME] = NULL;
                    GetSavedGamesList(&Load_Game_Requester);
                    Init_Requester(&Load_Game_Requester);
                    passport_mode = 1;
                    input = 0;
                    inputDB = 0;
                }
            }
        }
        break;
    case 1:
        if (passport_mode == 1)
        {
            select = Display_Requester(&Load_Game_Requester);
            if (select)
            {
                if (select > 0)
                    Inventory_ExtraData[1] = select - 1;
                else if (Inventory_Mode != INV_SAVE_MODE && Inventory_Mode != INV_LOAD_MODE)
                    input = inputDB = 0;
                passport_mode = 0;
            }
            else
                input = inputDB = 0;
        }
        else if (passport_mode == 0)
        {
            if (Inventory_Mode == INV_DEATH_MODE)
            {
                if (inv_item->anim_direction == -1)
                    inputDB = PASSPORT_2FRONT;
                else
                    inputDB = PASSPORT_2BACK;
            }
            else
            {
                if (!passport_text1)
                {
                    if (Inventory_Mode == INV_TITLE_MODE || CurrentLevel == GYM)
                        passport_text1 = T_Print(0, -16, 0, passport_start_game);
                    else
                        passport_text1 = T_Print(0, -16, 0, passport_save_game);
                    T_BottomAlign(passport_text1, 1);
                    T_CentreH(passport_text1, 1);
                }

                if (inputDB & SELECT_ITEM || Inventory_Mode == INV_SAVE_MODE)
                {
                    if (Inventory_Mode == INV_TITLE_MODE || CurrentLevel == GYM)
                        Inventory_ExtraData[1] = CurrentLevel;
                    else
                    {
                        T_RemovePrint(Inv_ringText);
                        Inv_ringText = NULL;
                        T_RemovePrint(Inv_itemText[IT_NAME]);
                        Inv_itemText[IT_NAME] = NULL;
                        GetSavedGamesList(&Load_Game_Requester);
                        Init_Requester(&Load_Game_Requester);
                        passport_mode = 1;
                        input = 0;
                        inputDB = 0;
                    }
                }
            }
        }
        break;
    case 2:
        if (!passport_text1)
        {
            if (Inventory_Mode == INV_TITLE_MODE)
                passport_text1 = T_Print(0, -16, 0, passport_exit_game);
            else
                passport_text1 = T_Print(0, -16, 0, passport_exit2title);
            T_BottomAlign(passport_text1, 1);
            T_CentreH(passport_text1, 1);
        }
        break;
    }

    if (inputDB & PASSPORT_2FRONT)
    {
        if (Inventory_Mode != INV_DEATH_MODE || SavedGames)
        {
            inv_item->anim_direction = -1;
            inv_item->goal_frame -= 5;

            if (!SavedGames)
            {
                if (inv_item->goal_frame < (inv_item->open_frame + 5))
                    inv_item->goal_frame = (inv_item->open_frame + 5);
                else if (passport_text1)
                {
                    T_RemovePrint(passport_text1);
                    passport_text1 = NULL;
                }
            }
            else
            {
                if (inv_item->goal_frame < inv_item->open_frame)
                    inv_item->goal_frame = inv_item->open_frame;
                else
                {
                    SoundEffect(115, NULL, SFX_ALWAYS);
                    if (passport_text1)
                    {
                        T_RemovePrint(passport_text1);
                        passport_text1 = NULL;
                    }
                }
            }
            input = 0;
            inputDB = 0;
        }
    }

    if (inputDB & PASSPORT_2BACK)
    {
        inv_item->anim_direction = 1;
        inv_item->goal_frame += 5;

        if (inv_item->goal_frame > inv_item->frames_total - 6)
            inv_item->goal_frame = inv_item->frames_total - 6;
        else
        {
            SoundEffect(115, NULL, SFX_ALWAYS);
            if (passport_text1)
            {
                T_RemovePrint(passport_text1);
                passport_text1 = NULL;
            }
        }
        input = 0;
        inputDB = 0;
    }

    if (inputDB & DESELECT_ITEM)
    {
        if (Inventory_Mode == INV_DEATH_MODE)
        {
            input = 0;
            inputDB = 0;
        }
        else
        {
            if (page == 2)
            {
                inv_item->goal_frame = inv_item->frames_total - 1;
                inv_item->anim_direction = 1;
            }
            else
            {
                inv_item->goal_frame = 0;
                inv_item->anim_direction = -1;
            }
            if (passport_text1)
            {
                T_RemovePrint(passport_text1);
                passport_text1 = NULL;
            }
        }
    }

    if (inputDB & SELECT_ITEM)
    {
        if (inputDB & SELECT_ITEM)
        {
            Inventory_ExtraData[0] = page;
        }
        if (page == 2)
        {
            inv_item->goal_frame = inv_item->frames_total - 1;
            inv_item->anim_direction = 1;
        }
        else
        {
            inv_item->goal_frame = 0;
            inv_item->anim_direction = -1;
        }
        if (passport_text1)
        {
            T_RemovePrint(passport_text1);
            passport_text1 = NULL;
        }
    }
}

void do_compass_option(INVENTORY_ITEM *inv_item)
{
    if (inputDB & (DESELECT_ITEM | SELECT_ITEM))
    {
        inv_item->goal_frame = inv_item->frames_total - 1;
        inv_item->anim_direction = 1;
    }
}

void Init_Requester(REQUEST_INFO *req)
{
    int n;

    req->heading = NULL;
    req->background = NULL;
    req->moreup = NULL;
    req->moredown = NULL;
    for (n = 0; n < MAX_REQLINES; n++)
    {
        req->texts[n] = NULL;
    }
}

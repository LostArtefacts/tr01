#include <stdio.h>
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

extern sint16 layout[2][13];
extern int conflict[];

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

sint16 sam_num = 0;
sint16 normal_pitch = 0x1700;

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

void do_gamma_option(INVENTORY_ITEM *inv_item)
{
    int gamma;

    if (input & DEC_HBAR)
    {
        idelay = 1;
        idcount = 10;
        Option_Gamma_Level -= GAMMA_MODIFIER;
        if (Option_Gamma_Level < MIN_GAMMA_LEVEL)
            Option_Gamma_Level = MIN_GAMMA_LEVEL;
    }
    if (input & INC_HBAR)
    {
        idelay = 1;
        idcount = 10;
        Option_Gamma_Level += GAMMA_MODIFIER;
        if (Option_Gamma_Level > MAX_GAMMA_LEVEL)
            Option_Gamma_Level = MAX_GAMMA_LEVEL;
    }
    inv_item->sprlist = is_gamma_list;
    is_gamma_level[6].param1 = Option_Gamma_Level / 2 + 63;
    S_SetGamma(Option_Gamma_Level);

    if ((inputDB & SELECT_ITEM))
    {
        inv_item->goal_frame = 0;
        inv_item->anim_direction = -1;
    }
    if ((inputDB & DESELECT_ITEM))
    {
        gamma = Option_Gamma_Level - 64;
        if (gamma < -255)
            gamma = -255;
        if (Inventory_Mode != INV_TITLE_MODE)
            S_SetBackgroundGamma(gamma);
    }
}

TEXTSTRING *dtext[5] = {NULL};

#define DWIDTH 160

void do_detail_option(INVENTORY_ITEM *inv_item)
{
    int i;

    if (dtext[0] == NULL)
    {
        dtext[2] = T_Print(0, 0, 0, str_high);
        dtext[1] = T_Print(0, 25, 0, str_medium);
        dtext[0] = T_Print(0, 50, 0, str_low);
        dtext[3] = T_Print(0, -32, 0, " ");
        dtext[4] = T_Print(0, -30, 0, str_detail);

        T_AddBackground(dtext[4], DWIDTH - 4, 0, 0, 0, 8, C_BLACK, NULL, NULL);
        T_AddOutline(dtext[4], 1, C_ORANGE, NULL, NULL);

        T_AddBackground(dtext[detail_level], DWIDTH - 12, 0, 0, 0, 8, C_BLACK, NULL, NULL);
        T_AddOutline(dtext[detail_level], 1, C_ORANGE, NULL, NULL);

        T_AddBackground(dtext[3], DWIDTH, 107, 0, 0, 16, C_BLACK, NULL, NULL);
        T_AddOutline(dtext[3], 1, C_BLUE, NULL, NULL);

        for (i = 0; i < 5; i++)
        {
            T_CentreH(dtext[i], 1);
            T_CentreV(dtext[i], 1);
        }
    }

    if ((inputDB & IN_BACK) && detail_level > 0)
    {
        T_RemoveOutline(dtext[detail_level]);
        T_RemoveBackground(dtext[detail_level]);

        detail_level--;

        T_AddOutline(dtext[detail_level], 1, C_ORANGE, NULL, NULL);
        T_AddBackground(dtext[detail_level], DWIDTH - 12, 0, 0, 0, 8, C_BLACK, NULL, NULL);
    }
    if ((inputDB & IN_FORWARD) && detail_level < 2)
    {
        T_RemoveOutline(dtext[detail_level]);
        T_RemoveBackground(dtext[detail_level]);

        detail_level++;

        T_AddOutline(dtext[detail_level], 1, C_ORANGE, NULL, NULL);
        T_AddBackground(dtext[detail_level], DWIDTH - 12, 0, 0, 0, 8, C_BLACK, NULL, NULL);
    }

    switch (detail_level)
    {
    case 0:
        perspective_distance = 0 * 1024 * W2V_SCALE;
        break;
    case 1:
        perspective_distance = 3 * 1024 * W2V_SCALE;
        break;
    case 2:
        perspective_distance = 6 * 1024 * W2V_SCALE;
        break;
    }

    if (inputDB & (SELECT_ITEM | DESELECT_ITEM))
    {
        for (i = 0; i < 5; i++)
            T_RemovePrint(dtext[i]);
        dtext[0] = NULL;
    }
}

TEXTSTRING *sa_text[4] = {NULL};

#define SAWIDTH 140

void do_sound_option(INVENTORY_ITEM *inv_item)
{
    int i;
    char string[20];

    if (!sa_text[0])
    {
        if (Option_Music_Volume > 10)
            Option_Music_Volume = 10;
        sprintf(string, "| %2d", Option_Music_Volume);
        sa_text[0] = T_Print(0, 0, 0, string);
        T_AddBackground(sa_text[0], SAWIDTH - 12, 0, 0, 0, 8, C_BLACK, NULL, NULL);
        T_AddOutline(sa_text[0], 1, C_ORANGE, NULL, NULL);

        if (Option_SoundFX_Volume > 10)
            Option_SoundFX_Volume = 10;
        sprintf(string, "} %2d", Option_SoundFX_Volume);
        sa_text[1] = T_Print(0, 25, 0, string);

        sa_text[2] = T_Print(0, -32, 0, " ");
        T_AddBackground(sa_text[2], SAWIDTH, 85, 0, 0, 48, C_BLACK, NULL, NULL);
        T_AddOutline(sa_text[2], 1, C_BLUE, NULL, NULL);

        sa_text[3] = T_Print(0, -30, 0, str_volume);
        T_AddBackground(sa_text[3], SAWIDTH - 4, 0, 0, 0, 8, C_BLACK, NULL, NULL);
        T_AddOutline(sa_text[3], 1, C_BLUE, NULL, NULL);

        for (i = 0; i < 4; i++)
        {
            T_CentreH(sa_text[i], 1);
            T_CentreV(sa_text[i], 1);
        }
    }

    if ((inputDB & PREV_HBAR) && item_data > 0)
    {
        T_RemoveOutline(sa_text[item_data]);
        T_RemoveBackground(sa_text[item_data]);

        item_data--;

        T_AddBackground(sa_text[item_data], SAWIDTH - 12, 0, 0, 0, 8, C_BLACK, NULL, NULL);
        T_AddOutline(sa_text[item_data], 1, C_ORANGE, NULL, NULL);
    }
    if ((inputDB & NEXT_HBAR) && item_data < 1)
    {
        T_RemoveOutline(sa_text[item_data]);
        T_RemoveBackground(sa_text[item_data]);

        item_data++;

        T_AddBackground(sa_text[item_data], SAWIDTH - 12, 0, 0, 0, 8, C_BLACK, NULL, NULL);
        T_AddOutline(sa_text[item_data], 1, C_ORANGE, NULL, NULL);
    }

    if (!item_data)
    {
        if ((input & DEC_HBAR) && Option_Music_Volume > 0)
        {
            idelay = 1;
            idcount = 10;
            Option_Music_Volume--;
            sprintf(string, "| %2d", Option_Music_Volume);
            T_ChangeText(sa_text[0], string);
        }
        else if ((input & INC_HBAR) && Option_Music_Volume < 10)
        {
            idelay = 1;
            idcount = 10;
            Option_Music_Volume++;
            sprintf(string, "| %2d", Option_Music_Volume);
            T_ChangeText(sa_text[0], string);
        }

        if (input & (INC_HBAR | DEC_HBAR))
        {
            if (Option_Music_Volume)
                S_CDVolume(Option_Music_Volume * 25 + 5);
            else
                S_CDVolume(0);
            SoundEffect(115, NULL, SFX_ALWAYS);
        }
    }
    else
    {
        if ((input & DEC_HBAR) && Option_SoundFX_Volume > 0)
        {
            idelay = 1;
            idcount = 10;
            Option_SoundFX_Volume--;
            sprintf(string, "} %2d", Option_SoundFX_Volume);
            T_ChangeText(sa_text[1], string);
        }
        else if ((input & INC_HBAR) && Option_SoundFX_Volume < 10)
        {
            idelay = 1;
            idcount = 10;
            Option_SoundFX_Volume++;
            sprintf(string, "} %2d", Option_SoundFX_Volume);
            T_ChangeText(sa_text[1], string);
        }

        if (input & (INC_HBAR | DEC_HBAR))
        {
            if (Option_SoundFX_Volume)
                mn_adjust_master_volume(Option_SoundFX_Volume * 6 + 3);
            else
                mn_adjust_master_volume(0);
            SoundEffect(115, NULL, SFX_ALWAYS);
        }
    }

    is_sound_sfxlevel[6].param1 = Option_SoundFX_Volume;
    is_sound_sfxlevellow[6].param1 = Option_SoundFX_Volume;

    is_sound_muslevel[6].param1 = Option_Music_Volume;
    is_sound_muslevellow[6].param1 = Option_Music_Volume;

    if (inputDB & (DESELECT_ITEM | SELECT_ITEM))
    {
        T_RemovePrint(sa_text[0]);
        T_RemovePrint(sa_text[1]);
        T_RemovePrint(sa_text[2]);
        T_RemovePrint(sa_text[3]);
        sa_text[0] = NULL;
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

void FlashConflicts(void)
{
    int i, j;
    sint16 key;

    for (i = 0; i < 13; i++)
    {
        key = layout[iconfig][i];

        T_FlashText(btext[i], 0, 0);

        for (j = 0; j < 13; j++)
        {
            if (i == j)
                continue;

            if (key == layout[iconfig][j])
            {
                T_FlashText(btext[i], 1, 20);
                break;
            }
        }
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

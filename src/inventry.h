#ifndef INVENTRY_H
#define INVENTRY_H

#include "types.h"

enum shapes
{
    SHAPE_SPRITE = 1,
    SHAPE_LINE,
    SHAPE_BOX,
    SHAPE_FBOX
};

enum inv_modes
{
    INV_GAME_MODE = 0,
    INV_TITLE_MODE,
    INV_KEYS_MODE,
    INV_SAVE_MODE,
    INV_LOAD_MODE,
    INV_DEATH_MODE
};

enum inventory_colours
{
    C_BLACK = 0,
    C_GREY,
    C_WHITE,
    C_RED,
    C_ORANGE,
    C_YELLOW,
    C_GREEN1,
    C_GREEN2,
    C_GREEN3,
    C_GREEN4,
    C_GREEN5,
    C_GREEN6,
    C_DARKGREEN,
    C_GREEN,
    C_CYAN,
    C_BLUE,
    C_MAGENTA,
    C_NUMBER_COLOURS
};

extern SG_COL inv_colours[];
extern sint32 Inventory_Mode;
extern sint16 Option_Music_Volume;
extern sint16 Inventory_Chosen;
extern sint32 Inventory_ExtraData[];

sint32 Display_Inventory(sint32 inventory_mode);
int Inv_AddItem(int itemNum);
int Inv_RequestItem(int itemNum);
void Inv_RemoveAllItems(void);
int Inv_RemoveItem(int itemNum);
int Inv_GetCount(void);
int Inv_GetItemOption(int itemNum);
void DrawGameInfo(void);

#endif

#ifndef TEXT_H
#define TEXT_H

#include "types.h"

#define MAX_TEXT_STRINGS 32
#define MAX_STRING_SIZE 64

#define TEXT_HEIGHT 11

typedef struct textstringinfo
{
    uint32 flags;
    uint16 textflags;
    uint16 bgndflags;
    uint16 outlflags;
    sint16 xpos;
    sint16 ypos;
    sint16 zpos;
    sint16 letterSpacing;
    sint16 wordSpacing;
    sint16 flashRate;
    sint16 flashCount;
    sint16 bgndColour;
    SG_COL *bgndGour;
    sint16 outlColour;
    SG_COL *outlGour;
    sint16 bgndSizeX;
    sint16 bgndSizeY;
    sint16 bgndOffX;
    sint16 bgndOffY;
    sint16 bgndOffZ;
    sint32 scaleH;
    sint32 scaleV;
    char *string;
} TEXTSTRING;

enum T_flags
{
    T_ACTIVE = (1 << 0),
    T_FLASH = (1 << 1),
    T_ROTATE_H = (1 << 2),
    T_ROTATE_V = (1 << 3),
    T_CENTRE_H = (1 << 4),
    T_CENTRE_V = (1 << 5),
    T_RIGHT = (1 << 7),
    T_BOTTOM = (1 << 8),
    T_BGND = (1 << 9),
    T_OUTLINE = (1 << 10)
};

void T_InitPrint(void);
TEXTSTRING *T_Print(sint16 xpos, sint16 ypos, sint16 zpos, char *string);
void T_ChangeText(TEXTSTRING *textString, char *string);
void T_FlashText(TEXTSTRING *textString, sint16 i_bool, sint16 rate);
void T_CentreH(TEXTSTRING *textString, sint16 i_bool);
void T_CentreV(TEXTSTRING *textString, sint16 i_bool);
void T_RightAlign(TEXTSTRING *textString, sint16 i_bool);
void T_BottomAlign(TEXTSTRING *textString, sint16 i_bool);
int T_RemovePrint(TEXTSTRING *tString);
void T_DrawText(void);

#endif

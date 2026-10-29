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

enum D_flags
{
    D_TRANS1 = 1,
    D_TRANS2 = 2,
    D_TRANS3 = 3,
    D_TRANS4 = 4,
    D_NEXT = (1 << 3)
};

void T_InitPrint(void);
TEXTSTRING *T_Print(sint16 xpos, sint16 ypos, sint16 zpos, char *string);
void T_ChangeText(TEXTSTRING *textString, char *string);
void T_SetScale(TEXTSTRING *textString, sint32 scaleH, sint32 scaleV);
void T_FlashText(TEXTSTRING *textString, sint16 i_bool, sint16 rate);
void T_AddBackground(TEXTSTRING *textString, sint16 xsize, sint16 ysize, sint16 xoff, sint16 yoff, sint16 zoff, sint16 colour, SG_COL *gourptr, uint16 flags);
void T_RemoveBackground(TEXTSTRING *textString);
void T_AddOutline(TEXTSTRING *textString, sint16 i_bool, sint16 colour, SG_COL *gourptr, uint16 flags);
void T_RemoveOutline(TEXTSTRING *textString);
void T_CentreH(TEXTSTRING *textString, sint16 i_bool);
void T_CentreV(TEXTSTRING *textString, sint16 i_bool);
void T_RightAlign(TEXTSTRING *textString, sint16 i_bool);
void T_BottomAlign(TEXTSTRING *textString, sint16 i_bool);
int T_RemovePrint(TEXTSTRING *tString);
void T_DrawText(void);

#endif

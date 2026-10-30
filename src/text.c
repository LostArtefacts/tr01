#include "game.h"
#include <stdio.h>
#include <string.h>

sint16 T_GetStringLen(char *string);
void T_DrawThisText(TEXTSTRING *textString);

TEXTSTRING T_textStrings[MAX_TEXT_STRINGS];
sint16 T_numStrings;

char T_theStrings[MAX_TEXT_STRINGS * MAX_STRING_SIZE];

char T_textSpacing[] = {
    14, 11, 11, 11, 11,
    11, 11, 13, 8, 11,
    12, 11, 13, 13, 12,
    11, 12, 12, 11, 12,
    13, 13, 13, 12, 12, 11,

    9, 9, 9, 9, 9,
    9, 9, 9, 5, 9,
    9, 5, 12, 10, 9,
    9, 9, 8, 9, 8,
    9, 9, 11, 9, 9, 9,

    12, 8, 10, 10, 10,
    10, 10, 9, 10, 10,

    5, 5, 5, 11, 9,
    10, 8, 6, 6, 7,
    7, 3, 11, 8, 13,
    16, 9, 4,
    12, 12,
    7, 5, 7, 7, 7, 7, 7, 7, 7, 7,
    16, 14, 14, 14, 16, 16, 16, 16, 16,
    12, 14,
    8, 8, 8, 8, 8, 8, 8
};

char T_remapASCII[] = {
    0,
    64, 66, 78, 77, 74, 78, 79, 69,
    70, 92, 72, 63, 71, 62, 68, 52,
    53, 54, 55, 56, 57, 58, 59, 60,
    61, 73, 73, 66, 74, 75, 65, 0,
    0, 1, 2, 3, 4, 5, 6, 7,
    8, 9, 10, 11, 12, 13, 14, 15,
    16, 17, 18, 19, 20, 21, 22, 23,
    24, 25, 80, 76, 81, 97, 98, 77,
    26, 27, 28, 29, 30, 31, 32, 33,
    34, 35, 36, 37, 38, 39, 40, 41,
    42, 43, 44, 45, 46, 47, 48, 49,
    50, 51, 100, 101, 102, 67
};

void T_InitPrint(void)
{
    int n;
    TEXTSTRING *textString = T_textStrings;

    for (n = 0; n < MAX_TEXT_STRINGS; n++)
    {
        textString->flags = 0;
        textString++;
    }
    T_numStrings = 0;
}

TEXTSTRING *T_Print(sint16 xpos, sint16 ypos, sint16 zpos, char *string)
{
    int n, length;
    TEXTSTRING *textString = T_textStrings;

    if (T_numStrings == MAX_TEXT_STRINGS)
        return 0;
    for (n = 0; n < MAX_TEXT_STRINGS; n++)
    {
        if (!(textString->flags & T_ACTIVE))
            break;
        textString++;
    }
    if (n >= MAX_TEXT_STRINGS)
        return 0;

    length = T_GetStringLen(string);
    if (length >= MAX_STRING_SIZE)
        length = MAX_STRING_SIZE - 1;
    textString->string = &T_theStrings[n * MAX_STRING_SIZE];

    textString->xpos = xpos;
    textString->ypos = ypos;
    textString->zpos = zpos;
    textString->letterSpacing = 1;
    textString->wordSpacing = 6;
    textString->scaleH = 0x10000;
    textString->scaleV = 0x10000;

    memcpy(textString->string, string, length + 1);

    textString->flags = T_ACTIVE;
    textString->textflags = 0;
    textString->outlflags = 0;
    textString->bgndflags = 0;

    textString->bgndSizeX = 0;
    textString->bgndSizeY = 0;
    textString->bgndOffX = 0;
    textString->bgndOffY = 0;
    textString->bgndOffZ = 0;

    T_numStrings++;

    return textString;
}

void T_ChangeText(TEXTSTRING *textString, char *string)
{
    if (textString->flags & T_ACTIVE)
    {
        if (T_GetStringLen(string) > MAX_STRING_SIZE)
            string[MAX_STRING_SIZE - 1] = 0;

        sprintf(textString->string, string);
    }
}

void T_SetFlags(TEXTSTRING *textString, uint32 flags)
{
    textString->flags = flags;
}

void T_SetBgndFlags(TEXTSTRING *textString, uint32 flags)
{
    textString->bgndflags = (sint16)flags;
}

void T_SetOutlFlags(TEXTSTRING *textString, uint32 flags)
{
    textString->outlflags = (sint16)flags;
}

void T_SetScale(TEXTSTRING *textString, sint32 scaleH, sint32 scaleV)
{
    textString->scaleH = scaleH;
    textString->scaleV = scaleV;
}

void T_LetterSpacing(TEXTSTRING *textString, sint16 pixels)
{
    textString->letterSpacing = pixels * 8;
}

void T_WordSpacing(TEXTSTRING *textString, sint16 pixels)
{
    textString->wordSpacing = pixels * 8;
}

void T_FlashText(TEXTSTRING *textString, sint16 i_bool, sint16 rate)
{
    if (i_bool)
    {
        textString->flags |= T_FLASH;
        textString->flashRate = rate;
        textString->flashCount = rate;
    }
    else
        textString->flags &= ~T_FLASH;
}

void T_AddBackground(TEXTSTRING *textString, sint16 xsize, sint16 ysize, sint16 xoff, sint16 yoff, sint16 zoff, sint16 colour, SG_COL *gourptr, uint16 flags)
{
    textString->flags |= T_BGND;
    textString->bgndSizeX = xsize;
    textString->bgndSizeY = ysize;
    textString->bgndOffX = xoff;
    textString->bgndOffY = yoff;
    textString->bgndOffZ = zoff;
    textString->bgndColour = colour;
    textString->bgndGour = gourptr;
    textString->bgndflags = flags;
}

void T_RemoveBackground(TEXTSTRING *textString)
{
    textString->flags &= ~T_BGND;
}

void T_AddOutline(TEXTSTRING *textString, sint16 i_bool, sint16 colour, SG_COL *gourptr, uint16 flags)
{
    textString->flags |= T_OUTLINE;
    textString->outlColour = colour;
    textString->outlGour = gourptr;
    textString->outlflags = flags;
}

void T_RemoveOutline(TEXTSTRING *textString)
{
    textString->flags &= ~T_OUTLINE;
}

void T_CentreH(TEXTSTRING *textString, sint16 i_bool)
{
    if (i_bool)
        textString->flags |= T_CENTRE_H;
    else
        textString->flags &= ~T_CENTRE_H;
}

void T_CentreV(TEXTSTRING *textString, sint16 i_bool)
{
    if (i_bool)
        textString->flags |= T_CENTRE_V;
    else
        textString->flags &= ~T_CENTRE_V;
}

void T_RightAlign(TEXTSTRING *textString, sint16 i_bool)
{
    if (i_bool)
        textString->flags |= T_RIGHT;
    else
        textString->flags &= ~T_RIGHT;
}

void T_BottomAlign(TEXTSTRING *textString, sint16 i_bool)
{
    if (i_bool)
        textString->flags |= T_BOTTOM;
    else
        textString->flags &= ~T_BOTTOM;
}

sint32 T_GetTextWidth(TEXTSTRING *textString)
{
    char *string;
    int letter = 0;
    sint32 width = 0;

    string = textString->string;

    while (*string)
    {
        letter = *(string++);
        if (letter > 126)
            continue;
        if (letter > 10 && letter < 32)
            continue;
        if (letter == 32)
        {
            if (textString->scaleH == 0x10000)
                width += textString->wordSpacing;
            else
                width += ((textString->wordSpacing * textString->scaleH) >> 16);
            continue;
        }
        if (letter < 11)
            letter += 81;
        else if (letter < 16)
            letter += 91;
        else
            letter = T_remapASCII[letter - 32];

        if (textString->scaleH == 0x10000)
            width += (T_textSpacing[letter] + textString->letterSpacing);
        else
            width += ((((sint32)T_textSpacing[letter] + textString->letterSpacing) * textString->scaleH) >> 16);
    }
    width -= textString->letterSpacing;
    width &= 0xfffe;
    return width;
}

int T_RemovePrint(TEXTSTRING *textString)
{
    if (!textString)
        return 0;
    if (!(textString->flags & T_ACTIVE))
        return 0;
    textString->flags &= ~T_ACTIVE;
    T_numStrings--;
    return 1;
}

void T_RemoveAllPrints(void)
{
    T_InitPrint();
}

sint16 T_GetStringLen(char *string)
{
    sint16 len = 1;

    while (*string++)
        len++;
    return len;
}

void T_DrawText(void)
{
    int n;
    TEXTSTRING *textString = T_textStrings;

    for (n = 0; n < MAX_TEXT_STRINGS; n++)
    {
        if (textString->flags & T_ACTIVE)
            T_DrawThisText(textString);
        textString++;
    }
}

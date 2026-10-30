#include "game.h"
#include <stdio.h>
#include <string.h>

sint16 T_GetStringLen(char *string);

TEXTSTRING T_textStrings[MAX_TEXT_STRINGS];
sint16 T_numStrings;

char T_theStrings[MAX_TEXT_STRINGS * MAX_STRING_SIZE];

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

sint16 T_GetStringLen(char *string)
{
    sint16 len = 1;

    while (*string++)
        len++;
    return len;
}

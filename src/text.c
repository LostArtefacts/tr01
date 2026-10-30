#include "game.h"

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

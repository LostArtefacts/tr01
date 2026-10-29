#include "game.h"

int record_demo = 0;

sint32 input;

int conflict[13];

sint16 layout[2][13] = {
    {K_UP, K_DOWN, K_LEFT, K_RIGHT, K_DELETE, K_PGDN, K_RSHIFT, K_RALT, K_RCTRL, K_SPACE, K_NUM0, K_END, K_ESC},
    {K_NUMUP, K_NUMDOWN, K_NUMLEFT, K_NUMRIGHT, K_NUMHOME, K_NUMPGUP, K_NUMEND, K_NUMPLUS, K_NUMENTER, K_NUMPGDN, K_NUM0, K_NUM5, K_NUMDEL}
};

int Key(int number)
{
    sint16 key;

    key = layout[1][number];

    if (key & 256)
    {
        if ((key & 0xff) == joy_fire)
            return 1;
    }
    else
    {
        if (rawkey(key))
            return 1;

        if (key == K_RCTRL)
            return rawkey(K_LCTRL);
        if (key == K_LCTRL)
            return rawkey(K_RCTRL);
        if (key == K_RSHIFT)
            return rawkey(K_LSHIFT);
        if (key == K_LSHIFT)
            return rawkey(K_RSHIFT);
        if (key == K_RALT)
            return rawkey(K_LALT);
        if (key == K_LALT)
            return rawkey(K_RALT);
    }

    if (conflict[number])
        return 0;

    key = layout[0][number];

    if (rawkey(key))
        return 1;

    if (key == K_RCTRL)
        return rawkey(K_LCTRL);
    if (key == K_LCTRL)
        return rawkey(K_RCTRL);
    if (key == K_RSHIFT)
        return rawkey(K_LSHIFT);
    if (key == K_LSHIFT)
        return rawkey(K_RSHIFT);
    if (key == K_RALT)
        return rawkey(K_LALT);
    if (key == K_LALT)
        return rawkey(K_RALT);

    return 0;
}

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

void S_UpdateInput(void)
{
    sint32 linput;

    linput = 0;

    JoyRead();

    if (joy1_x < -8)
        linput |= IN_LEFT;
    else if (joy1_x > 8)
        linput |= IN_RIGHT;

    if (joy1_y > 8)
    {
        linput |= IN_BACK;
        if (joy1_y < 20)
            linput |= IN_SLOW;
    }
    else if (joy1_y < -8)
    {
        linput |= IN_FORWARD;
        if (joy1_y > -20)
            linput |= IN_SLOW;
    }

    if (Key(0))
        linput |= IN_FORWARD;
    if (Key(1))
        linput |= IN_BACK;
    if (Key(2))
        linput |= IN_LEFT;
    if (Key(3))
        linput |= IN_RIGHT;
    if (Key(4))
        linput |= IN_STEPL;
    if (Key(5))
        linput |= IN_STEPR;
    if (Key(6))
        linput |= IN_SLOW;
    if (Key(7))
        linput |= IN_JUMP;
    if (Key(8))
        linput |= IN_ACTION;
    if (Key(9))
        linput |= IN_DRAW;
    if (Key(10))
        linput |= IN_LOOK;
    if (Key(11))
        linput |= IN_ROLL;

    if (Key(12) && camera.type != CINEMATIC_CAMERA)
        linput |= IN_OPTION;

    if (linput & IN_FORWARD && linput & IN_BACK)
        linput |= IN_ROLL;

    if (rawkey(K_RET) || (linput & IN_ACTION))
        linput |= IN_SELECT;
    if (rawkey(K_ESC))
        linput |= IN_DESELECT;

    if ((linput & (IN_LEFT | IN_RIGHT)) == (IN_LEFT | IN_RIGHT))
        linput -= (IN_LEFT | IN_RIGHT);

    if (!mode_lock && camera.type != CINEMATIC_CAMERA)
    {
        if (rawkey(K_F3))
        {
            IncreaseScreenSize();
            do
            {
            } while (rawkey(K_F3));
        }
        else if (rawkey(K_F2))
        {
            DecreaseScreenSize();
            do
            {
            } while (rawkey(K_F2));
        }
        else if (rawkey(K_F1))
        {
            switch_resolution();
            game_hires = hires_flag;
            do
            {
            } while (rawkey(K_F1));
        }
        else if (rawkey(K_F4))
        {
            detail_level = (detail_level + 1) % 3;
            do
            {
            } while (rawkey(K_F4));
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
        }
        else if (rawkey(K_F5))
            linput |= IN_SAVE;
        else if (rawkey(K_F6))
            linput |= IN_LOAD;
    }

    input = linput;
}

#include "game.h"

uint16 S_get_pan(sint16 angle)
{
    sint32 pan;

    angle += 0x4000;
    pan = ABS(angle);

    return (uint16)pan;
}

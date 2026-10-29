#ifndef TRAPS_H
#define TRAPS_H

#include "types.h"

enum trap_anims
{
    TRAP_SET,
    TRAP_ACTIVATE,
    TRAP_WORKING,
    TRAP_FINISHED
};

enum door_anims
{
    DOOR_CLOSED,
    DOOR_OPEN
};

void LavaBurn(ITEM_INFO *item);

#endif

#include "game.h"

#define WOLF_SLEEP_FRAME 96

BITE_INFO wolf_jaw_bite = {0, -14, 174, 6};

BITE_INFO lion_bite = {-2, -10, 132, 21};

void InitialiseWolf(sint16 item_number)
{
    items[item_number].frame_number = WOLF_SLEEP_FRAME;
    InitialiseCreature(item_number);
}

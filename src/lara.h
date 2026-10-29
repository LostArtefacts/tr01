#ifndef LARA_H
#define LARA_H

#include "types.h"

#define ONE_DEGREE 182

extern ITEM_INFO *lara_item;

sint16 DoBloodSplat(sint32 x, sint32 y, sint32 z, sint16 speed, PHD_ANGLE direction, sint16 room_num);
int EnableBaddieAI(sint16 item_number, int Always);

#endif

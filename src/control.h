#ifndef CONTROL_H
#define CONTROL_H

#include "types.h"

extern int flip_status;
extern ITEM_INFO *items;

FLOOR_INFO *GetFloor(sint32 x, sint32 y, sint32 z, sint16 *room_number);

#endif

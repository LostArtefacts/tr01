#ifndef CONTROL_H
#define CONTROL_H

#include "types.h"

extern int flip_status;
extern ITEM_INFO *items;

void AnimateItem(ITEM_INFO *item);
FLOOR_INFO *GetFloor(sint32 x, sint32 y, sint32 z, sint16 *room_number);
sint16 GetHeight(FLOOR_INFO *floor, sint32 x, sint32 y, sint32 z);
sint16 GetCeiling(FLOOR_INFO *floor, sint32 x, sint32 y, sint32 z);

#endif

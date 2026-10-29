#ifndef CONTROL_H
#define CONTROL_H

#include "types.h"

extern int flip_status;
extern int chunky_flag;
extern sint16 *trigger_index;
extern ITEM_INFO *items;

void AnimateItem(ITEM_INFO *item);
FLOOR_INFO *GetFloor(sint32 x, sint32 y, sint32 z, sint16 *room_number);
sint16 GetTiltType(FLOOR_INFO *floor, sint32 x, sint32 y, sint32 z);
sint16 GetHeight(FLOOR_INFO *floor, sint32 x, sint32 y, sint32 z);
sint16 GetCeiling(FLOOR_INFO *floor, sint32 x, sint32 y, sint32 z);
void FlipMap(void);
int LOS(GAME_VECTOR *start, GAME_VECTOR *target);

#endif

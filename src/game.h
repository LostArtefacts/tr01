#ifndef GAME_H
#define GAME_H

#include "types.h"
#include "objects.h"
#include "box.h"
#include "lara.h"
#include "control.h"
#include "3dglodef.h"
#include "inventry.h"
#include "mn_sinfo.h"
#include "specific.h"

#define TITLE 20

extern int CurrentLevel;
extern ROOM_INFO *room;
extern OBJECT_INFO objects[];

sint32 GetRandomControl(void);

extern CAMERA_INFO camera;

void InitialiseCamera(void);
void MoveCamera(GAME_VECTOR *ideal, int speed);
void ClipCamera(sint32 *x, sint32 *y, sint32 target_x, sint32 target_y, sint32 left, sint32 top, sint32 right, sint32 bottom);
void ShiftCamera(sint32 *x, sint32 *y, sint32 target_x, sint32 target_y, sint32 left, sint32 top, sint32 right, sint32 bottom);
int BadPosition(sint32 x, sint32 y, sint32 z, sint16 room_number);
void ChaseCamera(ITEM_INFO *item);
void CombatCamera(ITEM_INFO *item);
void LookCamera(ITEM_INFO *item);
void FixedCamera(void);
void CalculateCamera(void);

#endif

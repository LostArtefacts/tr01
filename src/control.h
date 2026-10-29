#ifndef CONTROL_H
#define CONTROL_H

#include "types.h"

extern int flipmap[];
extern int flip_status;
extern sint16 cd_flags[];
extern sint16 cdtrack;
extern int noinput_count;
extern int reset_flag;
extern int animation_rate;
extern int flipeffect, fliptimer;
extern int chunky_flag;

sint32 ControlPhase(sint32 nframes, int demo_mode);
int GetChange(ITEM_INFO *item, ANIM_STRUCT *anim);
void TranslateItem(ITEM_INFO *item, sint32 x, sint32 y, sint32 z);
void RefreshCamera(sint16 type, sint16 *data);
void TestTriggers(sint16 *data, int heavy);
int TriggerActive(ITEM_INFO *item);
void AnimateItem(ITEM_INFO *item);
FLOOR_INFO *GetFloor(sint32 x, sint32 y, sint32 z, sint16 *room_number);
sint16 GetWaterHeight(sint32 x, sint32 y, sint32 z, sint16 room_number);
sint16 GetTiltType(FLOOR_INFO *floor, sint32 x, sint32 y, sint32 z);
sint16 GetHeight(FLOOR_INFO *floor, sint32 x, sint32 y, sint32 z);
sint16 GetCeiling(FLOOR_INFO *floor, sint32 x, sint32 y, sint32 z);
void FlipMap(void);
void RemoveRoomFlipItems(ROOM_INFO *r);
void AddRoomFlipItems(ROOM_INFO *r);
void TriggerCDTrack(sint16 value, sint16 flags, sint16 type);
void TriggerNormalCDTrack(sint16 value, sint16 flags, sint16 type);
sint16 GetDoor(FLOOR_INFO *floor);
int LOS(GAME_VECTOR *start, GAME_VECTOR *target);
int zLOS(GAME_VECTOR *start, GAME_VECTOR *target);
int xLOS(GAME_VECTOR *start, GAME_VECTOR *target);
int ClipTarget(GAME_VECTOR *start, GAME_VECTOR *target, FLOOR_INFO *floor);

#endif

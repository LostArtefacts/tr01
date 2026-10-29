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
#include "shell.h"
#include "title.h"
#include "savegame.h"

#define NO_ACTION 0
#define GAME_ACTION 1
#define END_ACTION 2
#define LOAD_ACTION 4
#define SAVE_ACTION 8
#define SOUND_ACTION 16
#define VIDEO_ACTION 32

extern int CurrentLevel;
extern int level_complete;
extern int number_draw_rooms;
extern sint16 draw_rooms[];
extern sint16 number_rooms;
extern sint16 next_item_active;
extern FX_INFO *effects;
extern sint16 next_fx_active;
extern ROOM_INFO *room;
extern OBJECT_INFO objects[];
extern sint16 **meshes;
extern STATIC_INFO static_objects[];
extern sint16 *floor_data;

sint32 GetRandomControl(void);

extern CAMERA_INFO camera;

extern sint16 *cine;
extern sint16 num_cine_frames;
extern sint16 cine_frame;
extern sint16 cinematic_level;
extern PHD_3DPOS cinematic_pos;

sint32 StartCinematic(int level_number);
void InitCinematicRooms(void);
sint32 DoCinematic(sint32 nframes);
void CalculateCinematicCamera(void);
void ControlCinematicPlayer(sint16 item_num);
void ControlCinematicPlayer4(sint16 item_num);
void InitialisePlayer1(sint16 item_num);
void InitialiseGenPlayer(sint16 item_num);

int InitialiseLevel(int level_number);

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

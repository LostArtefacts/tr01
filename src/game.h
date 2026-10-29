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
#include "traps.h"
#include "text.h"
#include "gametext.h"
#include "main.h"

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
extern ANIM_STRUCT *anims;
extern CHANGE_STRUCT *changes;
extern RANGE_STRUCT *ranges;
extern sint16 *commands;
extern STATIC_INFO static_objects[];
extern sint16 *floor_data;
extern sint16 *frames;
extern sint32 *bones;
extern int camera_underwater;

sint32 DrawPhaseCinematic(void);
sint32 DrawPhaseGame(void);
void DrawRooms(sint16 current_room);
void GetRoomBounds(sint16 room_number);
int SetRoomBounds(sint16 *objptr, sint16 room_number, ROOM_INFO *parent);
void PrintRooms(sint16 room_number);
void DrawEffect(sint16 fx_num);
void DrawSpriteItem(ITEM_INFO *item);
void DrawDummyItem(ITEM_INFO *item);
void DrawAnimatingItem(ITEM_INFO *item);
void DrawLara(ITEM_INFO *item);
void DrawGunFlash(int weapon_type, int clip);
void CalculateObjectLighting(ITEM_INFO *item, sint16 *frame);
void DrawLaraInt(ITEM_INFO *item, sint16 *frame1, sint16 *frame2, int frac, int rate);
void InitInterpolate(int frac, int rate);
void phd_PopMatrix_I(void);
void phd_PushMatrix_I(void);
void phd_RotY_I(sint16 ang);
void phd_RotX_I(sint16 ang);
void phd_RotZ_I(sint16 ang);
void phd_TranslateRel_I(sint32 x, sint32 y, sint32 z);
void phd_TranslateRel_ID(sint32 x, sint32 y, sint32 z, sint32 x2, sint32 y2, sint32 z2);
void phd_RotYXZ_I(sint16 y, sint16 x, sint16 z);
void phd_RotYXZpack_I(sint32 r1, sint32 r2);
void phd_PutPolygons_I(sint16 *ptr, int clip);
void InterpolateMatrix(void);
void InterpolateArmMatrix(void);
int GetFrames(ITEM_INFO *item, sint16 *frmptr[], int *rate);
sint16 *GetBoundsAccurate(ITEM_INFO *item);
sint16 *GetBestFrame(ITEM_INFO *item);

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

#ifndef LARA_H
#define LARA_H

#include "types.h"
#include "box.h"

#define ONE_DEGREE 182
#define NO_BAD_POS (-NO_HEIGHT)
#define NO_BAD_NEG NO_HEIGHT

#define NUMBER_ITEMS 256

#define LARA_AIR (2 * 30 * 30)
#define LARA_HITPOINTS 1000

#define SHOTGUN_AMMO_CLIP 6

#define LARA_RAD 100
#define LARA_HITE 762
#define UW_RADIUS 300
#define UW_HITE 400

#define STEPUP_HEIGHT ((STEP_L * 3) / 2)

#define STOP_A 11
#define STOP_F 185

#define HIT_FORWARD_A 125
#define HIT_BACK_A 126
#define HIT_RIGHT_A 127
#define HIT_LEFT_A 128

typedef struct lara_arm
{
    sint16 *frame_base;
    sint16 frame_number;
    sint16 lock;
    PHD_ANGLE y_rot, x_rot, z_rot;
    sint16 flash_gun;
} LARA_ARM;

typedef struct ammo_info
{
    int ammo;
    int hit;
    int miss;
} AMMO_INFO;

typedef struct lara_info
{
    sint16 item_number;
    sint16 gun_status;
    sint16 gun_type;
    sint16 request_gun_type;
    sint16 calc_fallspeed;
    sint16 water_status;
    sint16 pose_count;
    sint16 hit_frame;
    sint16 hit_direction;
    sint16 air;
    sint16 dive_count;
    sint16 death_count;
    sint16 current_active;
    sint16 hit_effect_count;
    FX_INFO *hit_effect;
    int mesh_effects;
    sint16 *mesh_ptrs[15];
    ITEM_INFO *target;
    PHD_ANGLE target_angles[2];
    PHD_ANGLE turn_rate;
    PHD_ANGLE move_angle;
    PHD_ANGLE head_y_rot, head_x_rot, head_z_rot;
    PHD_ANGLE torso_y_rot, torso_x_rot, torso_z_rot;
    LARA_ARM left_arm, right_arm;
    AMMO_INFO pistols;
    AMMO_INFO magnums;
    AMMO_INFO uzis;
    AMMO_INFO shotgun;
    LOT_INFO LOT;
} LARA_INFO;

enum lara_states
{
    AS_WALK = 0,
    AS_RUN,
    AS_STOP,
    AS_FORWARDJUMP,
    AS_POSE,
    AS_FASTBACK,
    AS_TURN_R,
    AS_TURN_L,
    AS_DEATH,
    AS_FASTFALL,
    AS_HANG,
    AS_REACH,
    AS_SPLAT,
    AS_TREAD,
    AS_LAND,
    AS_COMPRESS,
    AS_BACK,
    AS_SWIM,
    AS_GLIDE,
    AS_NULL,
    AS_FASTTURN,
    AS_STEPRIGHT,
    AS_STEPLEFT,
    AS_HIT,
    AS_SLIDE,
    AS_BACKJUMP,
    AS_RIGHTJUMP,
    AS_LEFTJUMP,
    AS_UPJUMP,
    AS_FALLBACK,
    AS_HANGLEFT,
    AS_HANGRIGHT,
    AS_SLIDEBACK,
    AS_SURFTREAD,
    AS_SURFSWIM,
    AS_DIVE,
    AS_PUSHBLOCK,
    AS_PULLBLOCK,
    AS_PPREADY,
    AS_PICKUP,
    AS_SWITCHON,
    AS_SWITCHOFF,
    AS_USEKEY,
    AS_USEPUZZLE,
    AS_UWDEATH,
    AS_ROLL,
    AS_SPECIAL,
    AS_SURFBACK,
    AS_SURFLEFT,
    AS_SURFRIGHT,
    AS_USEMIDAS,
    AS_DIEMIDAS,
    AS_SWANDIVE,
    AS_FASTDIVE,
    AS_GYMNAST,
    AS_WATEROUT
};

enum lara_water_states
{
    LARA_ABOVEWATER,
    LARA_UNDERWATER,
    LARA_SURFACE,
    LARA_CHEAT
};

enum lara_gun_types
{
    LG_UNARMED = 0,
    LG_PISTOLS,
    LG_MAGNUMS,
    LG_UZIS,
    LG_SHOTGUN,
    NUM_WEAPONS
};

enum lara_gun_states
{
    LG_ARMLESS,
    LG_HANDSBUSY,
    LG_DRAW,
    LG_UNDRAW,
    LG_READY
};

enum headings
{
    NORTH = 0,
    EAST,
    SOUTH,
    WEST
};

enum lara_meshes
{
    HIPS,
    THIGH_L, CALF_L, FOOT_L,
    THIGH_R, CALF_R, FOOT_R,
    TORSO,
    UARM_R, LARM_R, HAND_R,
    UARM_L, LARM_L, HAND_L,
    HEAD
};

extern void (*effect_routines[])(ITEM_INFO *item);
extern OBJECT_VECTOR *sound_effects;
extern int number_sound_effects;
extern int health_bar_timer;
extern int overlay_flag;
extern LARA_INFO lara;
extern ITEM_INFO *lara_item;
extern sint16 *cine;
extern sint16 num_cine_frames;
extern sint16 cine_frame;
extern PHD_3DPOS cinematic_pos;

void AddActiveItem(sint16 item_num);
void RemoveActiveItem(sint16 item_num);
void ItemNewRoom(sint16 item_number, sint16 room_number);
sint16 *GetBoundsAccurate(ITEM_INFO *item);
sint16 *GetBestFrame(ITEM_INFO *item);
int ItemNearLara(PHD_3DPOS *pos, sint32 distance);
void SoundEffects(void);
void KillEffect(sint16 fx_num);
sint16 CreateEffect(sint16 room_num);
void EffectNewRoom(sint16 fx_num, sint16 room_number);
void WaterFall(sint16 item_number);
void InitialiseItemArray(int numitems);
void InitialiseItem(sint16 item_num);
void LoadLaraDemoPos(void);
void GetDemoInput(void);
sint16 DoBloodSplat(sint32 x, sint32 y, sint32 z, sint16 speed, PHD_ANGLE direction, sint16 room_num);
sint32 DrawPhaseCinematic(void);
void LaraControl(sint16 item_num);
void InGameCinematicCamera(void);
int SwitchTrigger(sint16 item_num, sint16 timer);
int KeyTrigger(sint16 item_num);
int PickupTrigger(sint16 item_num);
int TestCollision(ITEM_INFO *item, ITEM_INFO *laraitem);
void GetCollisionInfo(COLL_INFO *coll, sint32 xpos, sint32 ypos, sint32 zpos, sint16 room_number, sint32 objheight);
sint32 FindGridShift(sint32 src, sint32 dst);
int CollideStaticObjects(COLL_INFO *coll, sint32 x, sint32 y, sint32 z, sint16 room_number, sint32 hite);
void GetNearByRooms(sint32 x, sint32 y, sint32 z, sint32 r, sint32 h, sint16 room_number);
void GetNewRoom(sint32 x, sint32 y, sint32 z, sint16 room_number);
void ShiftItem(ITEM_INFO *item, COLL_INFO *coll);
void UpdateLaraRoom(ITEM_INFO *item, int height);
void LaraBaddieCollision(ITEM_INFO *laraitem, COLL_INFO *coll);
void EffectHit(ITEM_INFO *laraitem, COLL_INFO *coll);
void CreatureCollision(sint16 item_num, ITEM_INFO *laraitem, COLL_INFO *coll);
void ObjectCollision(sint16 item_num, ITEM_INFO *laraitem, COLL_INFO *coll);
void DoorCollision(sint16 item_num, ITEM_INFO *laraitem, COLL_INFO *coll);
void TrapCollision(sint16 item_num, ITEM_INFO *laraitem, COLL_INFO *coll);
void ItemPushLara(ITEM_INFO *item, ITEM_INFO *laraitem, COLL_INFO *coll, int enable_hit, int bigpush);
int GetSpheres(ITEM_INFO *item, SPHERE *ptr, int WorldSpace);
void GetJointAbsPosition(ITEM_INFO *item, PHD_VECTOR *vec, int joint);
int TestBoundsCollide(ITEM_INFO *item, ITEM_INFO *laraitem, sint32 radius);
int TestLaraPosition(sint16 *bounds, ITEM_INFO *item, ITEM_INFO *laraitem);
void AlignLaraPosition(PHD_VECTOR *vec, ITEM_INFO *item, ITEM_INFO *laraitem);
int MoveLaraPosition(PHD_VECTOR *vec, ITEM_INFO *item, ITEM_INFO *laraitem);
int Move3DPosTo3DPos(PHD_3DPOS *srcpos, PHD_3DPOS *destpos, int velocity, PHD_ANGLE angadd);
void DisableBaddieAI(sint16 item_num);
int EnableBaddieAI(sint16 item_number, int Always);
void AlterFloorHeight(ITEM_INFO *item, int height);
void LaraSwapMeshExtra(void);
void DrawHealthBar(void);
void DrawAirBar(void);
void MakeAmmoString(char *string);
void DrawAmmoInfo(void);
void InitialisePickUpDisplay(void);
void DrawPickups(void);
void AddDisplayPickup(sint16 objnum);

#endif

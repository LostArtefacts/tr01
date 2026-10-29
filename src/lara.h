#ifndef LARA_H
#define LARA_H

#include "types.h"
#include "box.h"

#define ONE_DEGREE 182
#define NO_BAD_POS (-NO_HEIGHT)
#define NO_BAD_NEG NO_HEIGHT

#define LARA_RAD 100
#define LARA_HITE 762
#define UW_RADIUS 300
#define UW_HITE 400

#define STEPUP_HEIGHT ((STEP_L * 3) / 2)

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

enum lara_water_states
{
    LARA_ABOVEWATER,
    LARA_UNDERWATER,
    LARA_SURFACE,
    LARA_CHEAT
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

extern int health_bar_timer;
extern int overlay_flag;
extern LARA_INFO lara;
extern ITEM_INFO *lara_item;

void AddActiveItem(sint16 item_num);
void RemoveActiveItem(sint16 item_num);
void ItemNewRoom(sint16 item_number, sint16 room_number);
sint16 *GetBoundsAccurate(ITEM_INFO *item);
sint16 *GetBestFrame(ITEM_INFO *item);
void SoundEffects(void);
void GetDemoInput(void);
sint16 DoBloodSplat(sint32 x, sint32 y, sint32 z, sint16 speed, PHD_ANGLE direction, sint16 room_num);
sint32 DrawPhaseCinematic(void);
void LaraControl(sint16 item_num);
void InGameCinematicCamera(void);
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
int TestBoundsCollide(ITEM_INFO *item, ITEM_INFO *laraitem, sint32 radius);
int TestLaraPosition(sint16 *bounds, ITEM_INFO *item, ITEM_INFO *laraitem);
void AlignLaraPosition(PHD_VECTOR *vec, ITEM_INFO *item, ITEM_INFO *laraitem);
int MoveLaraPosition(PHD_VECTOR *vec, ITEM_INFO *item, ITEM_INFO *laraitem);
int Move3DPosTo3DPos(PHD_3DPOS *srcpos, PHD_3DPOS *destpos, int velocity, PHD_ANGLE angadd);
void DisableBaddieAI(sint16 item_num);
int EnableBaddieAI(sint16 item_number, int Always);

#endif

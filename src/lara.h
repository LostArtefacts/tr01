#ifndef LARA_H
#define LARA_H

#include "types.h"
#include "box.h"

#define ONE_DEGREE 182

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

extern LARA_INFO lara;
extern ITEM_INFO *lara_item;

void RemoveActiveItem(sint16 item_num);
void ItemNewRoom(sint16 item_number, sint16 room_number);
sint16 *GetBoundsAccurate(ITEM_INFO *item);
sint16 *GetBestFrame(ITEM_INFO *item);
sint16 DoBloodSplat(sint32 x, sint32 y, sint32 z, sint16 speed, PHD_ANGLE direction, sint16 room_num);
sint32 DrawPhaseCinematic(void);
void InGameCinematicCamera(void);
void DisableBaddieAI(sint16 item_num);
int EnableBaddieAI(sint16 item_number, int Always);

#endif

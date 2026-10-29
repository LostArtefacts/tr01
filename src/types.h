#ifndef TYPES_H
#define TYPES_H

#include <stddef.h>

typedef signed char sint8;
typedef unsigned char uint8;
typedef short sint16;
typedef unsigned short uint16;
typedef long sint32;
typedef unsigned long uint32;

typedef uint16 SG_COL;

#define W2V_SHIFT 14

#define UNIT_SHADOW 256

#define END_BIT 0x8000

#define WALL_SHIFT 10
#define WALL_L 1024
#define STEP_L (WALL_L / 4)

#define NO_ITEM -1

#define DONT_TARGET (-16384)

#define NOT_ACTIVE 0
#define ACTIVE 1
#define DEACTIVATED 2
#define INVISIBLE 3

typedef sint16 PHD_ANGLE;

typedef struct COLL_INFO COLL_INFO;

typedef struct
{
    sint32 x;
    sint32 y;
    sint32 z;
    sint16 room_number;
    sint16 box_number;
} GAME_VECTOR;

typedef struct
{
    sint32 x;
    sint32 y;
    sint32 z;
    sint16 data;
    sint16 flags;
} OBJECT_VECTOR;

typedef struct
{
    sint32 x;
    sint32 y;
    sint32 z;
} PHD_VECTOR;

typedef struct
{
    sint32 x_pos;
    sint32 y_pos;
    sint32 z_pos;
    PHD_ANGLE x_rot;
    PHD_ANGLE y_rot;
    PHD_ANGLE z_rot;
} PHD_3DPOS;

typedef struct
{
    sint32 floor;
    uint32 touch_bits;
    uint32 mesh_bits;
    sint16 object_number;
    sint16 current_anim_state;
    sint16 goal_anim_state;
    sint16 required_anim_state;
    sint16 anim_number;
    sint16 frame_number;
    sint16 room_number;
    sint16 next_item;
    sint16 next_active;
    sint16 speed;
    sint16 fallspeed;
    sint16 hit_points;
    sint16 box_number;
    sint16 timer;
    sint16 flags;
    sint16 shade;
    void *data;
    PHD_3DPOS pos;
    uint16 active:1;
    uint16 status:2;
    uint16 gravity_status:1;
    uint16 hit_status:1;
    uint16 collidable:1;
    uint16 looked_at:1;
} ITEM_INFO;

typedef struct
{
    uint16 index;
    sint16 box;
    uint8 pit_room;
    sint8 floor;
    uint8 sky_room;
    sint8 ceiling;
} FLOOR_INFO;

typedef struct
{
    sint32 x;
    sint32 y;
    sint32 z;
    sint16 intensity;
    sint32 falloff;
} LIGHT_INFO;

typedef struct
{
    sint32 x;
    sint32 y;
    sint32 z;
    PHD_ANGLE y_rot;
    sint16 shade;
    sint16 static_number;
} MESH_INFO;

typedef struct
{
    sint16 *data;
    sint16 *door;
    FLOOR_INFO *floor;
    LIGHT_INFO *light;
    MESH_INFO *mesh;
    sint32 x;
    sint32 y;
    sint32 z;
    sint32 minfloor;
    sint32 maxceiling;
    sint16 x_size;
    sint16 y_size;
    sint16 ambient;
    sint16 num_lights;
    sint16 num_meshes;
    sint16 left;
    sint16 right;
    sint16 top;
    sint16 bottom;
    sint16 bound_active;
    sint16 item_number;
    sint16 fx_number;
    sint16 flipped_room;
    uint16 flags;
} ROOM_INFO;

typedef struct
{
    sint32 x;
    sint32 y;
    sint32 z;
    sint32 mesh_num;
} BITE_INFO;

typedef struct
{
    PHD_3DPOS pos;
    sint16 room_number;
    sint16 object_number;
    sint16 next_fx;
    sint16 next_active;
    sint16 speed;
    sint16 fallspeed;
    sint16 frame_number;
    sint16 counter;
    sint16 shade;
} FX_INFO;

typedef struct
{
    sint16 nmeshes;
    sint16 mesh_index;
    sint32 bone_index;
    sint16 *frame_base;
    void (*initialise)(sint16 item_number);
    void (*control)(sint16 item_number);
    void (*floor)(ITEM_INFO *item, sint32 x, sint32 y, sint32 z, sint16 *height);
    void (*ceiling)(ITEM_INFO *item, sint32 x, sint32 y, sint32 z, sint16 *height);
    void (*draw_routine)(ITEM_INFO *item);
    void (*collision)(sint16 item_num, ITEM_INFO *laraitem, COLL_INFO *coll);
    sint16 anim_index;
    sint16 hit_points;
    sint16 pivot_length;
    sint16 radius;
    sint16 smartness;
    sint16 shadow_size;
    uint16 loaded:1;
    uint16 intelligent:1;
    uint16 save_position:1;
    uint16 save_hitpoints:1;
    uint16 save_flags:1;
    uint16 save_anim:1;
} OBJECT_INFO;

#define NO_CAMERA -1

typedef enum
{
    CHASE_CAMERA,
    FIXED_CAMERA,
    LOOK_CAMERA,
    COMBAT_CAMERA,
    CINEMATIC_CAMERA,
    HEAVY_CAMERA
} CAMERA_TYPE;

typedef struct
{
    GAME_VECTOR pos;
    GAME_VECTOR target;
    CAMERA_TYPE type;
    sint32 shift;
    sint32 flags;
    sint32 fixed_camera;
    sint32 number_frames;
    sint32 bounce;
    sint32 underwater;
    sint32 target_distance;
    sint32 target_square;
    sint16 target_angle;
    sint16 actual_angle;
    sint16 target_elevation;
    sint16 box;
    sint16 number;
    sint16 last;
    sint16 timer;
    sint16 speed;
    ITEM_INFO *item;
    ITEM_INFO *last_item;
    OBJECT_VECTOR *fixed;
} CAMERA_INFO;

#define SQUARE(A) ((A) * (A))

#endif

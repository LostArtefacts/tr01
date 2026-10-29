#ifndef TYPES_H
#define TYPES_H

typedef signed char sint8;
typedef unsigned char uint8;
typedef short sint16;
typedef unsigned short uint16;
typedef long sint32;
typedef unsigned long uint32;

typedef sint16 SG_COL;

#define W2V_SHIFT 14

#define UNIT_SHADOW 256

typedef sint16 PHD_ANGLE;

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

#define SQUARE(A) ((A) * (A))

#endif

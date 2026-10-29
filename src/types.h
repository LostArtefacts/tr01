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
#define W2V_SCALE (1 << W2V_SHIFT)

#define GAME_FOV 80

#define MAX_SECRETS 16

#define IN_FORWARD 1
#define IN_BACK (1 << 1)
#define IN_LEFT (1 << 2)
#define IN_RIGHT (1 << 3)
#define IN_JUMP (1 << 4)
#define IN_DRAW (1 << 5)
#define IN_ACTION (1 << 6)
#define IN_SLOW (1 << 7)
#define IN_OPTION (1 << 8)
#define IN_LOOK (1 << 9)
#define IN_STEPL (1 << 10)
#define IN_STEPR (1 << 11)
#define IN_ROLL (1 << 12)
#define IN_PAUSE (1 << 13)
#define IN_A (1 << 14)
#define IN_B (1 << 15)
#define IN_C (1 << 16)
#define IN_D (1 << 17)
#define IN_E (1 << 18)
#define IN_F (1 << 19)
#define IN_SELECT (1 << 20)
#define IN_DESELECT (1 << 21)
#define IN_SAVE (1 << 22)
#define IN_LOAD (1 << 23)

#define UNIT_SHADOW 256

#define DEMOCOUNT_MAX (30 * 60 * 5)

#define ROT_X 4
#define ROT_Y 8
#define ROT_Z 16

enum game_levels
{
    GYM,
    LEVEL1,
    LEVEL2,
    LEVEL3A,
    LEVEL3B,
    LEVEL4,
    LEVEL5,
    LEVEL6,
    LEVEL7A,
    LEVEL7B,
    LEVEL8A,
    LEVEL8B,
    LEVEL8C,
    LEVEL10A,
    LEVEL10B,
    LEVEL10C,
    CUTSCENE1,
    CUTSCENE2,
    CUTSCENE3,
    CUTSCENE4,
    TITLE,
    CURRENT,
    NUMBER_OF_LEVELS
};

#define END_BIT 0x8000

#define DATA_TYPE 0x00ff
#define VALUE_BITS 0x03ff

#define WALL_SHIFT 10
#define WALL_L 1024
#define STEP_L (WALL_L / 4)

#define NO_ITEM -1

#define ONESHOT 0x0100
#define CODE_BITS 0x3e00
#define REVERSE 0x4000
#define NOT_VISIBLE ONESHOT
#define KILLED_ITEM (1 << 15)

#define DONT_TARGET (-16384)

#define GRAVITY 6
#define FASTFALL_SPEED 128

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

enum coll_types
{
    COLL_NONE = 0,
    COLL_FRONT = 1,
    COLL_LEFT = 2,
    COLL_RIGHT = 4,
    COLL_TOP = 8,
    COLL_TOPFRONT = 16,
    COLL_CLAMP = 32
};

struct COLL_INFO
{
    sint32 mid_floor;
    sint32 mid_ceiling;
    sint32 mid_type;
    sint32 front_floor;
    sint32 front_ceiling;
    sint32 front_type;
    sint32 left_floor;
    sint32 left_ceiling;
    sint32 left_type;
    sint32 right_floor;
    sint32 right_ceiling;
    sint32 right_type;
    sint32 radius;
    sint32 bad_pos;
    sint32 bad_neg;
    sint32 bad_ceiling;
    PHD_VECTOR shift;
    PHD_VECTOR old;
    sint16 facing;
    sint16 quadrant;
    sint16 coll_type;
    sint16 *trigger;
    sint8 tilt_x;
    sint8 tilt_z;
    sint8 hit_by_baddie;
    sint8 hit_static;
    uint16 slopes_are_walls:1;
    uint16 slopes_are_pits:1;
    uint16 lava_is_pit:1;
    uint16 enable_baddie_push:1;
    uint16 enable_hit:1;
};

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

#define NO_ROOM 255

#define MAX_ROOMS 1024
#define MAX_FLIPMAPS 10
#define MAX_CD_TRACKS 64

#define NO_HEIGHT (-0x7f00)

enum height_types
{
    WALL,
    SMALL_SLOPE,
    BIG_SLOPE
};

extern int height_type;

#define UNDERWATER 1
#define SFX_ALWAYS 2

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

typedef struct
{
    sint16 *frame_ptr;
    sint16 interpolation;
    sint16 current_anim_state;
    sint32 velocity;
    sint32 acceleration;
    sint16 frame_base;
    sint16 frame_end;
    sint16 jump_anim_num;
    sint16 jump_frame_num;
    sint16 number_changes;
    sint16 change_index;
    sint16 number_commands;
    sint16 command_index;
} ANIM_STRUCT;

typedef struct
{
    sint16 goal_anim_state;
    sint16 number_ranges;
    sint16 range_index;
} CHANGE_STRUCT;

typedef struct
{
    sint16 start_frame;
    sint16 end_frame;
    sint16 link_anim_num;
    sint16 link_frame_num;
} RANGE_STRUCT;

enum command_types
{
    COMMAND_NULL = 0,
    COMMAND_MOVE_ORIGIN,
    COMMAND_JUMP_VELOCITY,
    COMMAND_ATTACK_READY,
    COMMAND_DEACTIVATE,
    COMMAND_SOUND_FX,
    COMMAND_EFFECT
};

typedef struct
{
    sint16 mesh_number;
    sint16 flags;
    sint16 x_minp;
    sint16 x_maxp;
    sint16 y_minp;
    sint16 y_maxp;
    sint16 z_minp;
    sint16 z_maxp;
    sint16 x_minc;
    sint16 x_maxc;
    sint16 y_minc;
    sint16 y_maxc;
    sint16 z_minc;
    sint16 z_maxc;
} STATIC_INFO;

typedef struct
{
    sint32 x;
    sint32 y;
    sint32 z;
    sint32 r;
} SPHERE;

#define NO_CAMERA -1

#define FOLLOW_CENTRE 1
#define NO_CHUNKY 2
#define CHASE_OBJECT 3

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

#ifndef INVDATA_H
#define INVDATA_H

#include "types.h"
#include "text.h"

#define MAIN_RING 0
#define OPTION_RING 1
#define KEYS_RING 2

#define MAX_INV_OBJ 30

#define DESELECT_ITEM IN_DESELECT
#define SELECT_ITEM IN_SELECT
#define ROTATE_RIGHT IN_RIGHT
#define ROTATE_LEFT IN_LEFT
#define EXIT_INVENTORY IN_OPTION

typedef enum pass_pages
{
    PSPINE = 1,
    PFRONT = 2,
    PINFRONT = 4,
    PPAGE2 = 8,
    PBACK = 16,
    PINBACK = 32,
    PPAGE1 = 64
} PASS_PAGES;

typedef enum inv_text
{
    IT_NAME,
    IT_QTY,
    IT_NUMBEROF
} INV_TEXT;

#define OPEN_FRAMES 32
#define CLOSE_FRAMES 32
#define OPEN_ROTATION -0x8000
#define CLOSE_ROTATION -0x8000
#define ROTATE_DURATION 24
#define RINGSWITCH_FRAMES 48
#define SELECTING_FRAMES 16
#define CAMERA_STARTHEIGHT -0x600
#define CAMERA_HEIGHT -0x100
#define CAMERA_2_RING 0x256
#define RING_RADIUS 0x2b0
#define CAMERA_YOFFSET -0x60
#define ITEM_TILT 0x0

#define LOW_LIGHT 0x1400
#define HIGH_LIGHT 0x1000

typedef enum status_codes
{
    RNG_OPENING,
    RNG_OPEN,
    RNG_CLOSING,
    RNG_MAIN2OPTION,
    RNG_MAIN2KEYS,
    RNG_KEYS2MAIN,
    RNG_OPTION2MAIN,
    RNG_SELECTING,
    RNG_SELECTED,
    RNG_DESELECTING,
    RNG_DESELECT,
    RNG_CLOSING_ITEM,
    RNG_EXITING_INVENTORY,
    RNG_DONE
} STATUS_CODES;

#define OPTION_RING_OBJECTS 4
#define TITLE_RING_OBJECTS 5

#define PASS_MESH (PFRONT | PSPINE | PBACK)

typedef struct imotion_info
{
    sint16 count;
    sint16 status;
    sint16 status_target;
    sint16 radius_target;
    sint16 radius_rate;
    sint16 camera_ytarget;
    sint16 camera_yrate;
    sint16 camera_pitch_target;
    sint16 camera_pitch_rate;
    sint16 rotate_target;
    sint16 rotate_rate;
    PHD_ANGLE item_ptxrot_target;
    PHD_ANGLE item_ptxrot_rate;
    PHD_ANGLE item_xrot_target;
    PHD_ANGLE item_xrot_rate;
    sint32 item_ytrans_target;
    sint32 item_ytrans_rate;
    sint32 item_ztrans_target;
    sint32 item_ztrans_rate;
    sint32 misc;
} IMOTION_INFO;

typedef struct inventory_sprite
{
    sint16 shape;
    sint16 x;
    sint16 y;
    sint16 z;
    sint32 param1;
    sint32 param2;
    SG_COL *grdptr;
    sint16 sprnum;
} INVENTORY_SPRITE;

typedef struct inventory_item
{
    char *itemText;
    sint16 object_number;
    sint16 frames_total;
    sint16 current_frame;
    sint16 goal_frame;
    sint16 open_frame;
    sint16 anim_direction;
    sint16 anim_speed;
    sint16 anim_count;
    PHD_ANGLE pt_xrot_sel;
    PHD_ANGLE pt_xrot;
    PHD_ANGLE x_rot_sel;
    PHD_ANGLE x_rot;
    PHD_ANGLE y_rot_sel;
    PHD_ANGLE y_rot;
    sint32 ytrans_sel;
    sint32 ytrans;
    sint32 ztrans_sel;
    sint32 ztrans;
    uint32 which_meshes;
    uint32 drawn_meshes;
    sint16 inv_pos;
    INVENTORY_SPRITE **sprlist;
} INVENTORY_ITEM;

typedef struct ring_info
{
    INVENTORY_ITEM **list;
    sint16 type;
    sint16 radius;
    sint16 camera_pitch;
    sint16 rotating;
    sint16 rot_count;
    sint16 current_object;
    sint16 target_object;
    sint16 number_of_objects;
    sint16 angle_adder;
    sint16 rot_adder;
    sint16 rot_adderL;
    sint16 rot_adderR;
    PHD_3DPOS ringpos;
    PHD_3DPOS camera;
    PHD_VECTOR light;
    IMOTION_INFO *imo;
} RING_INFO;

#define MAX_REQLINES 16

typedef struct request_info
{
    uint16 items;
    uint16 selected;
    uint16 vis_lines;
    uint16 line_offset;
    uint16 line_oldoffset;
    uint16 pixwidth;
    uint16 line_height;
    sint16 xpos;
    sint16 ypos;
    sint16 zpos;
    char *headingtext;
    char *itemtexts;
    sint16 itemtextlen;
    TEXTSTRING *heading;
    TEXTSTRING *background;
    TEXTSTRING *moreup;
    TEXTSTRING *moredown;
    TEXTSTRING *texts[MAX_REQLINES];
} REQUEST_INFO;

extern REQUEST_INFO Load_Game_Requester;

extern sint32 inv_nframes;

extern sint16 inv_main_objects;
extern sint16 inv_main_current;
extern INVENTORY_ITEM *inv_main_list[];
extern sint16 inv_main_qtys[];
extern sint16 inv_keys_objects;
extern sint16 inv_keys_current;
extern INVENTORY_ITEM *inv_keys_list[];
extern sint16 inv_keys_qtys[];
extern sint16 inv_option_objects;
extern sint16 inv_option_current;
extern INVENTORY_ITEM *inv_option_list[];

extern TEXTSTRING *Inv_itemText[];
extern TEXTSTRING *Inv_ringText;
extern TEXTSTRING *Inv_upArrow1;
extern TEXTSTRING *Inv_upArrow2;
extern TEXTSTRING *Inv_downArrow1;
extern TEXTSTRING *Inv_downArrow2;

sint32 GetDebouncedInput(sint32 input);
extern sint32 inputDB;
extern sint32 oldInputDB;

void Inv_InsertItem(INVENTORY_ITEM *inv_item);
void RingIsOpen(RING_INFO *ring);
void RingIsNotOpen(RING_INFO *ring);
void RingNotActive(INVENTORY_ITEM *inv_item);
void RingActive(void);
void RemoveInventoryText(void);
void Inv_RingInit(RING_INFO *ring, sint16 type, INVENTORY_ITEM **list, sint16 qty, sint16 current, IMOTION_INFO *imo);
void Inv_RingGetView(RING_INFO *ring, PHD_3DPOS *viewer);
void Inv_RingLight(RING_INFO *ring);
void Inv_RingCalcAdders(RING_INFO *ring, sint16 rotation_duration);
void Inv_RingDoMotions(RING_INFO *ring);
void Inv_RingRotateLeft(RING_INFO *ring);
void Inv_RingRotateRight(RING_INFO *ring);
void Inv_RingMotionInit(RING_INFO *ring, sint16 frames, sint16 status, sint16 status_target);
void Inv_RingMotionSetup(RING_INFO *ring, sint16 status, sint16 status_target, sint16 frames);
void Inv_RingMotionRadius(RING_INFO *ring, sint16 target);
void Inv_RingMotionRotation(RING_INFO *ring, sint16 rotation, sint16 target);
void Inv_RingMotionCameraPos(RING_INFO *ring, sint16 target);
void Inv_RingMotionCameraPitch(RING_INFO *ring, sint16 target);
void Inv_RingMotionItemSelect(RING_INFO *ring, INVENTORY_ITEM *inv_item);
void Inv_RingMotionItemDeselect(RING_INFO *ring, INVENTORY_ITEM *inv_item);

void do_inventory_options(INVENTORY_ITEM *inv_item);

#endif

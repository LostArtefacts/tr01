#include "game.h"
#include <string.h>

extern sint16 inv_keys_objects;
static int pup_x, pup_y, pup_z;

static sint16 PickUpBounds[12] = {
    -256, 256,
    -100, 100,
    -256, 100,
    -10 * ONE_DEGREE, 10 * ONE_DEGREE,
    0, 0,
    0, 0};
static PHD_VECTOR PickUpPosition = {0, 0, -100};

static sint16 PickUpScionBounds[12] = {
    -256, 256,
    640 - 100, 640 + 100,
    -350, -200,
    -10 * ONE_DEGREE, 10 * ONE_DEGREE,
    0, 0,
    0, 0};
static PHD_VECTOR PickUpScionPosition = {0, 640, -310};

static sint16 PickUpScion4Bounds[12] = {
    -256, 256,
    256 - 50, 256 + 50,
    -512 - 350, -200,
    -10 * ONE_DEGREE, 10 * ONE_DEGREE,
    0, 0,
    0, 0};
static PHD_VECTOR PickUpScion4Position = {0, 280, -512 + 105};

static sint16 MidasBounds[12] = {
    -700, 700,
    384 - 100, 384 + 100 + 512,
    -700, 700,
    -10 * ONE_DEGREE, 10 * ONE_DEGREE,
    -30 * ONE_DEGREE, +30 * ONE_DEGREE,
    -10 * ONE_DEGREE, +10 * ONE_DEGREE};

static sint16 PickUpBoundsUW[12] = {
    -512, 512,
    -512, 512,
    -512, 512,
    -45 * ONE_DEGREE, 45 * ONE_DEGREE,
    -45 * ONE_DEGREE, 45 * ONE_DEGREE,
    -45 * ONE_DEGREE, 45 * ONE_DEGREE};
static PHD_VECTOR PickUpPositionUW = {0, -200, -350};

#define MAXOFF 200
static sint16 Switch1Bounds[12] = {
    -MAXOFF, +MAXOFF,
    0, 0,
    WALL_L / 2 - MAXOFF, WALL_L / 2,
    -10 * ONE_DEGREE, +10 * ONE_DEGREE,
    -30 * ONE_DEGREE, +30 * ONE_DEGREE,
    -10 * ONE_DEGREE, +10 * ONE_DEGREE};

static sint16 Switch2Bounds[12] = {
    -WALL_L, WALL_L,
    -WALL_L, WALL_L,
    -WALL_L, WALL_L / 2,
    -80 * ONE_DEGREE, +80 * ONE_DEGREE,
    -80 * ONE_DEGREE, +80 * ONE_DEGREE,
    -80 * ONE_DEGREE, +80 * ONE_DEGREE};

static PHD_VECTOR Switch2Position = {0, 0, 108};

#define MAXOFF_KH 200
static sint16 KeyHoleBounds[12] = {
    -MAXOFF_KH, +MAXOFF_KH,
    0, 0,
    WALL_L / 2 - MAXOFF_KH, WALL_L / 2,
    -10 * ONE_DEGREE, +10 * ONE_DEGREE,
    -30 * ONE_DEGREE, +30 * ONE_DEGREE,
    -10 * ONE_DEGREE, +10 * ONE_DEGREE};

static PHD_VECTOR KeyHolePosition = {0, 0, WALL_L / 2 - LARA_RAD - 50};

#define MAXOFF_PH 200
static sint16 PuzzleHoleBounds[12] = {
    -MAXOFF_PH, +MAXOFF_PH,
    0, 0,
    WALL_L / 2 - MAXOFF_PH, WALL_L / 2,
    -10 * ONE_DEGREE, +10 * ONE_DEGREE,
    -30 * ONE_DEGREE, +30 * ONE_DEGREE,
    -10 * ONE_DEGREE, +10 * ONE_DEGREE};

static PHD_VECTOR PuzzleHolePosition = {0, 0, WALL_L / 2 - LARA_RAD - 85};

void PickUpCollision(sint16 item_num, ITEM_INFO *laraitem, COLL_INFO *coll)
{
    ITEM_INFO *item;

    item = &items[item_num];
    item->pos.y_rot = laraitem->pos.y_rot;
    item->pos.z_rot = 0;
    if (lara.water_status == LARA_ABOVEWATER)
    {
        item->pos.x_rot = 0;
        if (!TestLaraPosition(PickUpBounds, item, laraitem))
            return;
        if (laraitem->current_anim_state == AS_PICKUP)
        {
            if (laraitem->frame_number == PICKUP_F)
            {
                if (item->object_number == SHOTGUN_ITEM)
                    lara.mesh_ptrs[TORSO] = meshes[(&objects[SHOTGUN])->mesh_index + TORSO];
                AddDisplayPickup(item->object_number);
                Inv_AddItem(item->object_number);
                item->status = INVISIBLE;
                RemoveDrawnItem(item_num);
                savegame.pickups++;
            }
            return;
        }
        else if (input & IN_ACTION && lara.gun_status == LG_ARMLESS && !laraitem->gravity_status && laraitem->current_anim_state == AS_STOP)
        {
            AlignLaraPosition(&PickUpPosition, item, laraitem);
            laraitem->goal_anim_state = AS_PICKUP;
            do
            {
                AnimateLara(laraitem);
            } while (laraitem->current_anim_state != AS_PICKUP);
            laraitem->goal_anim_state = AS_STOP;
            lara.gun_status = LG_HANDSBUSY;
            return;
        }
    }
    else if (lara.water_status == LARA_UNDERWATER)
    {
        item->pos.x_rot = -25 * ONE_DEGREE;
        if (!TestLaraPosition(PickUpBoundsUW, item, laraitem))
            return;
        if (laraitem->current_anim_state == AS_PICKUP)
        {
            if (laraitem->frame_number == PICKUP_UW_F)
            {
                AddDisplayPickup(item->object_number);
                Inv_AddItem(item->object_number);
                item->status = INVISIBLE;
                RemoveDrawnItem(item_num);
                savegame.pickups++;
            }
            return;
        }
        else if (input & IN_ACTION && laraitem->current_anim_state == AS_TREAD)
        {
            if (!MoveLaraPosition(&PickUpPositionUW, item, laraitem))
                return;
            laraitem->goal_anim_state = AS_PICKUP;
            do
            {
                AnimateLara(laraitem);
            } while (laraitem->current_anim_state != AS_PICKUP);
            laraitem->goal_anim_state = AS_TREAD;
            return;
        }
    }
}

void PickUpScionCollision(sint16 item_num, ITEM_INFO *laraitem, COLL_INFO *coll)
{
    ITEM_INFO *item;

    item = &items[item_num];
    item->pos.y_rot = laraitem->pos.y_rot;
    item->pos.z_rot = item->pos.x_rot = 0;

    if (!TestLaraPosition(PickUpScionBounds, item, laraitem))
        return;
    if (laraitem->current_anim_state == AS_PICKUP)
    {
        if (laraitem->frame_number == PICKUPSCION_F +
                                          anims[laraitem->anim_number].frame_base)
        {
            AddDisplayPickup(item->object_number);
            Inv_AddItem(item->object_number);
            item->status = INVISIBLE;
            RemoveDrawnItem(item_num);
            savegame.pickups++;
        }
        return;
    }
    else if (input & IN_ACTION && lara.gun_status == LG_ARMLESS && !laraitem->gravity_status && laraitem->current_anim_state == AS_STOP)
    {
        AlignLaraPosition(&PickUpScionPosition, item, laraitem);
        laraitem->anim_number = objects[LARA_EXTRA].anim_index;
        laraitem->frame_number = anims[laraitem->anim_number].frame_base;
        lara.gun_status = LG_HANDSBUSY;
        laraitem->current_anim_state = AS_PICKUP;
        laraitem->goal_anim_state = AS_PICKUP;
        camera.type = CINEMATIC_CAMERA;
        cine_frame = 0;
        memcpy(&cinematic_pos, &laraitem->pos, sizeof(PHD_3DPOS));
    }
}

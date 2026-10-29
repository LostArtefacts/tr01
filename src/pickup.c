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

void PickUpScion4Collision(sint16 item_num, ITEM_INFO *laraitem, COLL_INFO *coll)
{
    ITEM_INFO *item;

    item = &items[item_num];
    item->pos.y_rot = laraitem->pos.y_rot;
    item->pos.z_rot = item->pos.x_rot = 0;
    if (!TestLaraPosition(PickUpScion4Bounds, item, laraitem))
        return;
    if (input & IN_ACTION && lara.gun_status == LG_ARMLESS && !laraitem->gravity_status && laraitem->current_anim_state == AS_STOP)
    {
        AlignLaraPosition(&PickUpScion4Position, item, laraitem);
        laraitem->anim_number = objects[LARA_EXTRA].anim_index;
        laraitem->frame_number = anims[laraitem->anim_number].frame_base;
        lara.gun_status = LG_HANDSBUSY;
        laraitem->current_anim_state = AS_PICKUP;
        laraitem->goal_anim_state = AS_PICKUP;
        camera.type = CINEMATIC_CAMERA;
        cine_frame = 0;
        memcpy(&cinematic_pos, &laraitem->pos, sizeof(PHD_3DPOS));
        cinematic_pos.y_rot -= 16384;
    }
}

void MidasCollision(sint16 item_num, ITEM_INFO *laraitem, COLL_INFO *coll)
{
    ITEM_INFO *item;
    uint16 quadrant;

    item = &items[item_num];
    if (!laraitem->gravity_status && laraitem->current_anim_state == AS_STOP && laraitem->pos.x_pos > item->pos.x_pos - 512 && laraitem->pos.x_pos < item->pos.x_pos + 512 && laraitem->pos.z_pos > item->pos.z_pos - 512 && laraitem->pos.z_pos < item->pos.z_pos + 512)
    {
        laraitem->anim_number = objects[LARA_EXTRA].anim_index + 1;
        laraitem->frame_number = anims[laraitem->anim_number].frame_base;
        laraitem->current_anim_state = AS_DIEMIDAS;
        laraitem->goal_anim_state = AS_DIEMIDAS;
        laraitem->hit_points = -1;
        laraitem->gravity_status = 0;
        lara.air = -1;
        lara.gun_status = LG_HANDSBUSY;
        lara.gun_type = LG_UNARMED;
        camera.type = CINEMATIC_CAMERA;
        cine_frame = 0;
        memcpy(&cinematic_pos, &laraitem->pos, sizeof(PHD_3DPOS));
    }
    else
    {
        if ((Inventory_Chosen == -1 && !(input & IN_ACTION)) || lara.gun_status != LG_ARMLESS || laraitem->gravity_status || laraitem->current_anim_state != AS_STOP)
            return;

        quadrant = (uint16)(laraitem->pos.y_rot + 0x2000) / 0x4000;
        switch (quadrant)
        {
        case 0:
            item->pos.y_rot = 0;
            break;
        case 1:
            item->pos.y_rot = 16384;
            break;
        case 2:
            item->pos.y_rot = -32768;
            break;
        case 3:
            item->pos.y_rot = -16384;
            break;
        }
        if (!TestLaraPosition(MidasBounds, item, laraitem))
            return;
        if (Inventory_Chosen == -1)
            Display_Inventory(INV_KEYS_MODE);
        if (Inventory_Chosen != LEADBAR_OPTION)
            return;
        Inv_RemoveItem(LEADBAR_OPTION);
        Inv_AddItem(PUZZLE_ITEM1);

        laraitem->anim_number = objects[LARA_EXTRA].anim_index;
        laraitem->frame_number = anims[item->anim_number].frame_base;
        laraitem->current_anim_state = AS_USEMIDAS;
        laraitem->goal_anim_state = AS_USEMIDAS;
        lara.gun_status = LG_HANDSBUSY;
    }
}

enum switch_states
{
    SS_OFF,
    SS_ON,
    SS_LINK
};

void SwitchCollision(sint16 item_num, ITEM_INFO *laraitem, COLL_INFO *coll)
{
    ITEM_INFO *item;

    item = &items[item_num];
    if (!(input & IN_ACTION) || item->status != NOT_ACTIVE || lara.gun_status != LG_ARMLESS || laraitem->gravity_status)
        return;

    if (laraitem->current_anim_state == AS_STOP)
    {
        if (!TestLaraPosition(Switch1Bounds, item, laraitem))
            return;
        laraitem->pos.y_rot = item->pos.y_rot;
        if (item->current_anim_state == SS_ON)
        {
            laraitem->goal_anim_state = AS_SWITCHON;
            do
            {
                AnimateLara(laraitem);
            } while (laraitem->current_anim_state != AS_SWITCHON);
            laraitem->goal_anim_state = AS_STOP;
            lara.gun_status = LG_HANDSBUSY;
            item->status = ACTIVE;
            item->goal_anim_state = SS_OFF;
            AddActiveItem(item_num);
            AnimateItem(item);
            return;
        }
        else if (item->current_anim_state == SS_OFF)
        {
            laraitem->goal_anim_state = AS_SWITCHOFF;
            do
            {
                AnimateLara(laraitem);
            } while (laraitem->current_anim_state != AS_SWITCHOFF);
            laraitem->goal_anim_state = AS_STOP;
            lara.gun_status = LG_HANDSBUSY;
            item->status = ACTIVE;
            item->goal_anim_state = SS_ON;
            AddActiveItem(item_num);
            AnimateItem(item);
        }
    }
}

void SwitchCollision2(sint16 item_num, ITEM_INFO *laraitem, COLL_INFO *coll)
{
    ITEM_INFO *item;

    item = &items[item_num];
    if (!(input & IN_ACTION) || item->status != NOT_ACTIVE || lara.water_status != LARA_UNDERWATER)
        return;

    if (laraitem->current_anim_state == AS_TREAD)
    {
        if (!TestLaraPosition(Switch2Bounds, item, laraitem))
            return;
        if (item->current_anim_state == SS_ON || item->current_anim_state == SS_OFF)
        {
            if (MoveLaraPosition(&Switch2Position, item, laraitem))
            {
                laraitem->fallspeed = 0;
                laraitem->goal_anim_state = AS_SWITCHON;
                do
                {
                    AnimateLara(laraitem);
                } while (laraitem->current_anim_state != AS_SWITCHON);
                laraitem->goal_anim_state = AS_TREAD;
                lara.gun_status = LG_HANDSBUSY;
                item->status = ACTIVE;
                if (item->current_anim_state == SS_ON)
                    item->goal_anim_state = SS_OFF;
                else
                    item->goal_anim_state = SS_ON;
                AddActiveItem(item_num);
                AnimateItem(item);
            }
        }
    }
}

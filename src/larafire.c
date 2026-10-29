#include "game.h"

void draw_pistols(int weapon_type);
void undraw_pistols(int weapon_type);
void draw_pistol_meshes(int weapon_type);
void PistolHandler(int weapon_type);
void draw_shotgun(void);
void undraw_shotgun(void);
void draw_shotgun_meshes(void);
void RifleHandler(int weapon_type);

#define PISTOL_DAMAGE 1

#define PISTOL_LOCK_YMIN (-60 * ONE_DEGREE)
#define PISTOL_LOCK_YMAX (+60 * ONE_DEGREE)
#define PISTOL_LOCK_XMIN (-60 * ONE_DEGREE)
#define PISTOL_LOCK_XMAX (+60 * ONE_DEGREE)

#define PISTOL_LARM_YMIN (-170 * ONE_DEGREE)
#define PISTOL_LARM_YMAX (+60 * ONE_DEGREE)
#define PISTOL_LARM_XMIN (-80 * ONE_DEGREE)
#define PISTOL_LARM_XMAX (+80 * ONE_DEGREE)

#define PISTOL_RARM_YMIN (-60 * ONE_DEGREE)
#define PISTOL_RARM_YMAX (+170 * ONE_DEGREE)
#define PISTOL_RARM_XMIN (-80 * ONE_DEGREE)
#define PISTOL_RARM_XMAX (+80 * ONE_DEGREE)

#define SHOTGUN_LOCK_YMIN (-60 * ONE_DEGREE)
#define SHOTGUN_LOCK_YMAX (+60 * ONE_DEGREE)
#define SHOTGUN_LOCK_XMIN (-55 * ONE_DEGREE)
#define SHOTGUN_LOCK_XMAX (+55 * ONE_DEGREE)

#define SHOTGUN_LARM_YMIN (-80 * ONE_DEGREE)
#define SHOTGUN_LARM_YMAX (+80 * ONE_DEGREE)
#define SHOTGUN_LARM_XMIN (-65 * ONE_DEGREE)
#define SHOTGUN_LARM_XMAX (+65 * ONE_DEGREE)

#define SHOTGUN_RARM_YMIN (-80 * ONE_DEGREE)
#define SHOTGUN_RARM_YMAX (+80 * ONE_DEGREE)
#define SHOTGUN_RARM_XMIN (-65 * ONE_DEGREE)
#define SHOTGUN_RARM_XMAX (+65 * ONE_DEGREE)

WEAPON_INFO weapons[NUM_WEAPONS] = {
    {
        {0, 0, 0, 0},
        {0, 0, 0, 0},
        {0, 0, 0, 0},
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
    },
    {
        {PISTOL_LOCK_YMIN, PISTOL_LOCK_YMAX, PISTOL_LOCK_XMIN, PISTOL_LOCK_XMAX},
        {PISTOL_LARM_YMIN, PISTOL_LARM_YMAX, PISTOL_LARM_XMIN, PISTOL_LARM_XMAX},
        {PISTOL_RARM_YMIN, PISTOL_RARM_YMAX, PISTOL_RARM_XMIN, PISTOL_RARM_XMAX},
        10 * ONE_DEGREE,
        8 * ONE_DEGREE,
        650,
        PISTOL_DAMAGE,
        8 * WALL_L,
        9,
        3,
        8,
    },
    {
        {PISTOL_LOCK_YMIN, PISTOL_LOCK_YMAX, PISTOL_LOCK_XMIN, PISTOL_LOCK_XMAX},
        {PISTOL_LARM_YMIN, PISTOL_LARM_YMAX, PISTOL_LARM_XMIN, PISTOL_LARM_XMAX},
        {PISTOL_RARM_YMIN, PISTOL_RARM_YMAX, PISTOL_RARM_XMIN, PISTOL_RARM_XMAX},
        10 * ONE_DEGREE,
        8 * ONE_DEGREE,
        650,
        2 * PISTOL_DAMAGE,
        8 * WALL_L,
        9,
        3,
        44,
    },
    {
        {PISTOL_LOCK_YMIN, PISTOL_LOCK_YMAX, PISTOL_LOCK_XMIN, PISTOL_LOCK_XMAX},
        {PISTOL_LARM_YMIN, PISTOL_LARM_YMAX, PISTOL_LARM_XMIN, PISTOL_LARM_XMAX},
        {PISTOL_RARM_YMIN, PISTOL_RARM_YMAX, PISTOL_RARM_XMIN, PISTOL_RARM_XMAX},
        10 * ONE_DEGREE,
        8 * ONE_DEGREE,
        650,
        1 * PISTOL_DAMAGE,
        8 * WALL_L,
        3,
        2,
        43,
    },
    {
        {SHOTGUN_LOCK_YMIN, SHOTGUN_LOCK_YMAX, SHOTGUN_LOCK_XMIN, SHOTGUN_LOCK_XMAX},
        {SHOTGUN_LARM_YMIN, SHOTGUN_LARM_YMAX, SHOTGUN_LARM_XMIN, SHOTGUN_LARM_XMAX},
        {SHOTGUN_RARM_YMIN, SHOTGUN_RARM_YMAX, SHOTGUN_RARM_XMIN, SHOTGUN_RARM_XMAX},
        10 * ONE_DEGREE,
        0,
        500,
        4 * PISTOL_DAMAGE,
        8 * WALL_L,
        9,
        3,
        45,
    }
};

void LaraGun(void)
{
    int draw;

    if (lara.left_arm.flash_gun > 0)
        lara.left_arm.flash_gun--;
    if (lara.right_arm.flash_gun > 0)
        lara.right_arm.flash_gun--;

    draw = 0;
    if (lara_item->hit_points <= 0)
        lara.gun_status = LG_ARMLESS;
    else if (lara.water_status == LARA_ABOVEWATER)
    {
        if (lara.request_gun_type != lara.gun_type)
        {
            if (lara.gun_status == LG_ARMLESS)
            {
                lara.gun_type = lara.request_gun_type;
                InitialiseNewWeapon();
                draw = 1;
            }
            else if (lara.gun_status == LG_READY)
                draw = 1;
        }
        else if (input & IN_DRAW)
            draw = 1;
    }
    else if (lara.gun_status == LG_READY)
        draw = 1;

    if (draw)
    {
        switch (lara.gun_type)
        {
        case LG_PISTOLS:
        case LG_MAGNUMS:
        case LG_UZIS:
            if (lara.gun_status == LG_ARMLESS)
            {
                lara.gun_status = LG_DRAW;
                lara.left_arm.frame_number = lara.right_arm.frame_number = 0;
            }
            else if (lara.gun_status == LG_READY)
            {
                lara.gun_status = LG_UNDRAW;
            }
            break;

        case LG_SHOTGUN:
            if (lara.gun_status == LG_ARMLESS)
            {
                lara.gun_status = LG_DRAW;
                lara.left_arm.frame_number = lara.right_arm.frame_number = 0;
            }
            else if (lara.gun_status == LG_READY)
            {
                lara.gun_status = LG_UNDRAW;
            }
            break;

        default:
            break;
        }
    }

    switch (lara.gun_status)
    {
    case LG_DRAW:
        switch (lara.gun_type)
        {
        case LG_PISTOLS:
        case LG_MAGNUMS:
        case LG_UZIS:
            if (camera.type != CINEMATIC_CAMERA && camera.type != LOOK_CAMERA)
                camera.type = COMBAT_CAMERA;
            draw_pistols(lara.gun_type);
            break;

        case LG_SHOTGUN:
            if (camera.type != CINEMATIC_CAMERA && camera.type != LOOK_CAMERA)
                camera.type = COMBAT_CAMERA;
            draw_shotgun();
            break;

        default:
            break;
        }
        break;

    case LG_UNDRAW:
        lara.mesh_ptrs[HEAD] = meshes[objects[LARA].mesh_index + HEAD];
        switch (lara.gun_type)
        {
        case LG_PISTOLS:
        case LG_MAGNUMS:
        case LG_UZIS:
            undraw_pistols(lara.gun_type);
            break;

        case LG_SHOTGUN:
            undraw_shotgun();
            break;

        default:
            break;
        }
        break;

    case LG_READY:
        lara.mesh_ptrs[HEAD] = meshes[objects[LARA].mesh_index + HEAD];
        switch (lara.gun_type)
        {
        case LG_PISTOLS:
            if (lara.pistols.ammo && input & IN_ACTION)
                lara.mesh_ptrs[HEAD] = meshes[objects[UZI].mesh_index + HEAD];
            if (camera.type != CINEMATIC_CAMERA && camera.type != LOOK_CAMERA)
                camera.type = COMBAT_CAMERA;
            PistolHandler(lara.gun_type);
            break;

        case LG_MAGNUMS:
            if (lara.magnums.ammo && input & IN_ACTION)
                lara.mesh_ptrs[HEAD] = meshes[objects[UZI].mesh_index + HEAD];
            if (camera.type != CINEMATIC_CAMERA && camera.type != LOOK_CAMERA)
                camera.type = COMBAT_CAMERA;
            PistolHandler(lara.gun_type);
            break;

        case LG_UZIS:
            if (lara.uzis.ammo && input & IN_ACTION)
                lara.mesh_ptrs[HEAD] = meshes[objects[UZI].mesh_index + HEAD];
            if (camera.type != CINEMATIC_CAMERA && camera.type != LOOK_CAMERA)
                camera.type = COMBAT_CAMERA;
            PistolHandler(lara.gun_type);
            break;

        case LG_SHOTGUN:
            if (lara.shotgun.ammo && input & IN_ACTION)
                lara.mesh_ptrs[HEAD] = meshes[objects[UZI].mesh_index + HEAD];
            if (camera.type != CINEMATIC_CAMERA && camera.type != LOOK_CAMERA)
                camera.type = COMBAT_CAMERA;
            RifleHandler(LG_SHOTGUN);
            break;

        default:
            break;
        }
        break;
    }
}

void InitialiseNewWeapon(void)
{
    lara.left_arm.frame_number = lara.right_arm.frame_number = 0;
    lara.left_arm.x_rot = lara.left_arm.y_rot = lara.left_arm.z_rot = 0;
    lara.right_arm.x_rot = lara.right_arm.y_rot = lara.right_arm.z_rot = 0;
    lara.target = NULL;
    lara.left_arm.lock = lara.right_arm.lock = 0;
    lara.left_arm.flash_gun = lara.right_arm.flash_gun = 0;

    switch (lara.gun_type)
    {
    case LG_PISTOLS:
    case LG_MAGNUMS:
    case LG_UZIS:
        lara.left_arm.frame_base = lara.right_arm.frame_base = objects[PISTOLS].frame_base;
        if (lara.gun_status != LG_ARMLESS)
            draw_pistol_meshes(lara.gun_type);
        break;

    case LG_SHOTGUN:
        lara.left_arm.frame_base = lara.right_arm.frame_base = objects[SHOTGUN].frame_base;
        if (lara.gun_status != LG_ARMLESS)
            draw_shotgun_meshes();
        break;

    default:
        lara.left_arm.frame_base = lara.right_arm.frame_base = objects[LARA].frame_base;
        break;
    }
}

void LaraTargetInfo(WEAPON_INFO *winfo)
{
    GAME_VECTOR src, target;
    PHD_ANGLE ang[2];
    ITEM_INFO *item;

    if ((item = lara.target) == NULL)
    {
        lara.left_arm.lock = lara.right_arm.lock = 0;
        lara.target_angles[0] = lara.target_angles[1] = 0;
        return;
    }

    src.x = lara_item->pos.x_pos;
    src.y = lara_item->pos.y_pos - 650;
    src.z = lara_item->pos.z_pos;
    src.room_number = lara_item->room_number;
    find_target_point(item, &target);
    phd_GetVectorAngles(target.x - src.x, target.y - src.y, target.z - src.z, ang);

    ang[0] -= lara_item->pos.y_rot;
    ang[1] -= lara_item->pos.x_rot;

    if (LOS(&src, &target))
    {
        if (ang[0] >= winfo->lock_angles[0] && ang[0] <= winfo->lock_angles[1] && ang[1] >= winfo->lock_angles[2] && ang[1] <= winfo->lock_angles[3])
            lara.left_arm.lock = lara.right_arm.lock = 1;
        else
        {
            if (lara.left_arm.lock)
            {
                if (ang[0] < winfo->left_angles[0] || ang[0] > winfo->left_angles[1] || ang[1] < winfo->left_angles[2] || ang[1] > winfo->left_angles[3])
                    lara.left_arm.lock = 0;
            }
            if (lara.right_arm.lock)
            {
                if (ang[0] < winfo->right_angles[0] || ang[0] > winfo->right_angles[1] || ang[1] < winfo->right_angles[2] || ang[1] > winfo->right_angles[3])
                    lara.right_arm.lock = 0;
            }
        }
    }
    else
        lara.left_arm.lock = lara.right_arm.lock = 0;
    lara.target_angles[0] = ang[0];
    lara.target_angles[1] = ang[1];
}

void LaraGetNewTarget(WEAPON_INFO *winfo)
{
    int x, y, z;
    int dist, maxdist, maxdist2;
    ITEM_INFO *item, *bestitem;
    PHD_ANGLE ang[2], bestyrot, yrot;
    GAME_VECTOR src, target;
    sint16 item_num;

    src.x = lara_item->pos.x_pos;
    src.y = lara_item->pos.y_pos - 650;
    src.z = lara_item->pos.z_pos;
    src.room_number = lara_item->room_number;
    bestitem = NULL;
    bestyrot = 32767;
    maxdist = winfo->target_dist;
    maxdist2 = maxdist * maxdist;
    for (item_num = next_item_active; item_num != NO_ITEM; item_num = item->next_active)
    {
        item = &items[item_num];
        if (item->hit_points <= 0)
            continue;
        x = item->pos.x_pos - src.x;
        y = item->pos.y_pos - src.y;
        z = item->pos.z_pos - src.z;
        if ((ABS(x)) > maxdist || (ABS(y)) > maxdist || (ABS(z)) > maxdist)
            continue;
        dist = x * x + y * y + z * z;
        if (dist < maxdist2)
        {
            find_target_point(item, &target);
            if (LOS(&src, &target))
            {
                phd_GetVectorAngles(target.x - src.x, target.y - src.y, target.z - src.z, ang);
                ang[0] -= lara_item->pos.y_rot + lara.torso_y_rot;
                ang[1] -= lara_item->pos.x_rot + lara.torso_x_rot;
                if (ang[0] >= winfo->lock_angles[0] && ang[0] <= winfo->lock_angles[1] && ang[1] >= winfo->lock_angles[2] && ang[1] <= winfo->lock_angles[3])
                {
                    yrot = ABS(ang[0]);
                    if (yrot < bestyrot)
                    {
                        bestyrot = yrot;
                        bestitem = item;
                    }
                }
            }
        }
    }
    lara.target = bestitem;

    LaraTargetInfo(winfo);
}

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

void find_target_point(ITEM_INFO *item, GAME_VECTOR *target)
{
    sint16 *bounds;
    sint32 x, y, z, c, s;

    bounds = GetBestFrame(item);
    x = (sint32)((*(bounds + 0) + *(bounds + 1)) / 2);
    y = (sint32)(*(bounds + 2) + (*(bounds + 3) - *(bounds + 2)) / 3);
    z = (sint32)((*(bounds + 4) + *(bounds + 5)) / 2);
    c = phd_cos(item->pos.y_rot);
    s = phd_sin(item->pos.y_rot);
    target->x = item->pos.x_pos + ((c * x + s * z) >> W2V_SHIFT);
    target->y = item->pos.y_pos + y;
    target->z = item->pos.z_pos + ((c * z - s * x) >> W2V_SHIFT);
    target->room_number = item->room_number;
}

void AimWeapon(WEAPON_INFO *winfo, LARA_ARM *arm)
{
    PHD_ANGLE curr, speed;
    PHD_ANGLE destx, desty;

    speed = winfo->aim_speed;

    if (arm->lock)
    {
        desty = lara.target_angles[0];
        destx = lara.target_angles[1];
    }
    else
        desty = destx = 0;

    curr = arm->y_rot;
    if (curr >= desty - speed && curr <= desty + speed)
        curr = desty;
    else if (curr < desty)
        curr += speed;
    else
        curr -= speed;
    arm->y_rot = curr;

    curr = arm->x_rot;
    if (curr >= destx - speed && curr <= destx + speed)
        curr = destx;
    else if (curr < destx)
        curr += speed;
    else
        curr -= speed;
    arm->x_rot = curr;

    arm->z_rot = 0;
}

int FireWeapon(int weapon_type, ITEM_INFO *target, ITEM_INFO *src, PHD_ANGLE *angles)
{
    int r, i, nums, bestdist, best;
    AMMO_INFO *ammo;
    WEAPON_INFO *winfo;
    PHD_3DPOS view;
    SPHERE *sptr, slist[33];
    GAME_VECTOR vsrc, vdest;

    switch (weapon_type)
    {
    default:
        ammo = &lara.pistols;
        ammo->ammo = 1000;
        break;

    case LG_MAGNUMS:
        ammo = &lara.magnums;
        if (savegame.bonus_flag)
            ammo->ammo = 1000;
        break;

    case LG_UZIS:
        ammo = &lara.uzis;
        if (savegame.bonus_flag)
            ammo->ammo = 1000;
        break;

    case LG_SHOTGUN:
        ammo = &lara.shotgun;
        if (savegame.bonus_flag)
            ammo->ammo = 1000;
        break;
    }

    if (ammo->ammo > 0)
    {
        ammo->ammo--;
        winfo = &weapons[weapon_type];
        view.x_pos = src->pos.x_pos;
        view.y_pos = src->pos.y_pos - winfo->gun_height;
        view.z_pos = src->pos.z_pos;
        r = (int)((GetRandomControl() - 16384) * winfo->shot_accuracy) / 65536;
        view.x_rot = *(angles + 1) + (sint16)r;
        r = (int)((GetRandomControl() - 16384) * winfo->shot_accuracy) / 65536;
        view.y_rot = *(angles + 0) + (sint16)r;
        view.z_rot = 0;
        phd_GenerateW2V(&view);
        nums = GetSpheres(target, slist, 0);

        sptr = &slist[0];
        best = -1;
        bestdist = 0x7fffffff;
        for (i = 0; i < nums; i++, sptr++)
        {
            r = sptr->r;
            if ((ABS(sptr->x)) < r && (ABS(sptr->y)) < r && sptr->z > r && (sptr->x * sptr->x) + (sptr->y * sptr->y) <= (r * r))
            {
                if (sptr->z - r < bestdist)
                {
                    bestdist = sptr->z - r;
                    best = i;
                }
            }
        }

        vsrc.x = view.x_pos;
        vsrc.y = view.y_pos;
        vsrc.z = view.z_pos;
        vsrc.room_number = src->room_number;
        if (best >= 0)
        {
            ammo->hit++;
            vdest.x = vsrc.x + ((*(phd_mxptr + M20) * bestdist) >> W2V_SHIFT);
            vdest.y = vsrc.y + ((*(phd_mxptr + M21) * bestdist) >> W2V_SHIFT);
            vdest.z = vsrc.z + ((*(phd_mxptr + M22) * bestdist) >> W2V_SHIFT);
            HitTarget(target, &vdest, winfo->damage);
            return 1;
        }
        else
        {
            ammo->miss++;
            vdest.x = vsrc.x + *(phd_mxptr + M20);
            vdest.y = vsrc.y + *(phd_mxptr + M21);
            vdest.z = vsrc.z + *(phd_mxptr + M22);
            LOS(&vsrc, &vdest);
            Richochet(&vdest);
            return -1;
        }
    }
    else
    {
        ammo->ammo = 0;
        SoundEffect(48, &src->pos, NULL);
        lara.request_gun_type = LG_PISTOLS;
        return 0;
    }
}

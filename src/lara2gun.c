#include "game.h"

void ready_pistols(int weapon_type);
void draw_pistol_meshes(int weapon_type);
void undraw_pistol_mesh_left(int weapon_type);
void undraw_pistol_mesh_right(int weapon_type);
void AnimatePistols(int weapon_type);

#define AIMGUNS_F 0
#define DRAW1_F 5
#define DRAW2_F 13
#define RECOIL_F 24

void draw_pistols(int weapon_type)
{
    sint16 ani;

    ani = lara.left_arm.frame_number;
    ani++;
    if (ani < 5 || ani > 23)
        ani = 5;
    else if (ani == 13)
    {
        draw_pistol_meshes(weapon_type);
        SoundEffect(6, &lara_item->pos, NULL);
    }
    else if (ani == 23)
    {
        ready_pistols(weapon_type);
        ani = 0;
    }
    lara.right_arm.frame_number = lara.left_arm.frame_number = ani;
}

void undraw_pistols(int weapon_type)
{
    sint16 anil, anir;

    anil = lara.left_arm.frame_number;
    if (anil >= RECOIL_F)
        anil = DRAW1_F - 1;
    else if (anil > 0 && anil < DRAW1_F)
    {
        lara.left_arm.x_rot -= lara.left_arm.x_rot / anil;
        lara.left_arm.y_rot -= lara.left_arm.y_rot / anil;
        anil--;
    }
    else if (anil == 0)
    {
        lara.left_arm.x_rot = lara.left_arm.y_rot = lara.left_arm.z_rot = 0;
        anil = RECOIL_F - 1;
    }
    else if (anil > DRAW1_F && anil < RECOIL_F)
    {
        anil--;
        if (anil == DRAW2_F - 1)
        {
            undraw_pistol_mesh_left(weapon_type);
            SoundEffect(7, &lara_item->pos, NULL);
        }
    }
    lara.left_arm.frame_number = anil;

    anir = lara.right_arm.frame_number;
    if (anir >= RECOIL_F)
        anir = DRAW1_F - 1;
    else if (anir > 0 && anir < DRAW1_F)
    {
        lara.right_arm.x_rot -= lara.right_arm.x_rot / anir;
        lara.right_arm.y_rot -= lara.right_arm.y_rot / anir;
        anir--;
    }
    else if (anir == 0)
    {
        lara.right_arm.x_rot = lara.right_arm.y_rot = lara.right_arm.z_rot = 0;
        anir = RECOIL_F - 1;
    }
    else if (anir > DRAW1_F && anir < RECOIL_F)
    {
        anir--;
        if (anir == DRAW2_F - 1)
        {
            undraw_pistol_mesh_right(weapon_type);
            SoundEffect(7, &lara_item->pos, NULL);
        }
    }
    lara.right_arm.frame_number = anir;

    if (anil == DRAW1_F && anir == DRAW1_F)
    {
        lara.gun_status = LG_ARMLESS;
        lara.right_arm.frame_number = lara.left_arm.frame_number = 0;
        lara.target = NULL;
        lara.left_arm.lock = lara.right_arm.lock = NULL;
    }
    lara.torso_y_rot = lara.head_y_rot = (lara.left_arm.y_rot + lara.right_arm.y_rot) / 4;
    lara.torso_x_rot = lara.head_x_rot = (lara.left_arm.x_rot + lara.right_arm.x_rot) / 4;
}

void ready_pistols(int weapon_type)
{
    lara.gun_status = LG_READY;
    lara.left_arm.x_rot = lara.left_arm.y_rot = lara.left_arm.z_rot = 0;
    lara.right_arm.x_rot = lara.right_arm.y_rot = lara.right_arm.z_rot = 0;
    lara.left_arm.frame_number = lara.right_arm.frame_number = 0;
    lara.target = NULL;
    lara.left_arm.lock = lara.right_arm.lock = 0;
    lara.torso_x_rot = lara.torso_y_rot = 0;
    lara.head_x_rot = lara.head_y_rot = 0;
    lara.left_arm.frame_base = lara.right_arm.frame_base = objects[PISTOLS].frame_base;
}

void draw_pistol_meshes(int weapon_type)
{
    int obj;

    obj = PISTOLS;
    if (weapon_type == LG_MAGNUMS)
        obj = MAGNUM;
    else if (weapon_type == LG_UZIS)
        obj = UZI;
    lara.mesh_ptrs[HAND_L] = meshes[(&objects[obj])->mesh_index + HAND_L];
    lara.mesh_ptrs[HAND_R] = meshes[(&objects[obj])->mesh_index + HAND_R];
    lara.mesh_ptrs[THIGH_L] = meshes[(&objects[LARA])->mesh_index + THIGH_L];
    lara.mesh_ptrs[THIGH_R] = meshes[(&objects[LARA])->mesh_index + THIGH_R];
}

void undraw_pistol_mesh_left(int weapon_type)
{
    int obj;

    obj = PISTOLS;
    if (weapon_type == LG_MAGNUMS)
        obj = MAGNUM;
    else if (weapon_type == LG_UZIS)
        obj = UZI;
    lara.mesh_ptrs[THIGH_L] = meshes[(&objects[obj])->mesh_index + THIGH_L];
    lara.mesh_ptrs[HAND_L] = meshes[(&objects[LARA])->mesh_index + HAND_L];
}

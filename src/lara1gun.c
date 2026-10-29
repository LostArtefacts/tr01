#include "game.h"

void draw_shotgun_meshes(void);
void undraw_shotgun_meshes(void);
void ready_shotgun(void);
void AnimateShotgun(void);
void FireShotgun(void);

#define SG_AIM_F 0
#define SG_DRAW_F 13
#define SG_RECOIL_F 47
#define SG_UNDRAW_F 80
#define SG_UNAIM_F 114
#define SG_END_F 127

void draw_shotgun(void)
{
    sint16 ani;

    ani = lara.left_arm.frame_number;
    ani++;
    if (ani < SG_DRAW_F || ani > SG_RECOIL_F)
        ani = SG_DRAW_F;
    else if (ani == SG_DRAW_F + 10)
    {
        draw_shotgun_meshes();
        SoundEffect(6, &lara_item->pos, NULL);
    }
    else if (ani == SG_RECOIL_F)
    {
        ready_shotgun();
        ani = SG_AIM_F;
    }
    lara.right_arm.frame_number = lara.left_arm.frame_number = ani;
}

void undraw_shotgun(void)
{
    sint16 ani;

    ani = lara.left_arm.frame_number;
    if (ani == SG_AIM_F)
        ani = SG_UNDRAW_F;
    else if (ani >= SG_AIM_F && ani < SG_DRAW_F)
    {
        ani++;
        if (ani == SG_DRAW_F)
            ani = SG_UNAIM_F;
    }
    else if (ani == SG_RECOIL_F)
        ani = SG_UNAIM_F;
    else if (ani >= SG_RECOIL_F && ani < SG_UNDRAW_F)
    {
        ani++;
        if (ani == SG_RECOIL_F + 12 + 1)
            ani = SG_AIM_F;
        else if (ani == SG_UNDRAW_F)
            ani = SG_UNAIM_F;
    }
    else if (ani >= SG_UNAIM_F && ani < SG_END_F)
    {
        ani++;
        if (ani == SG_END_F)
            ani = SG_UNDRAW_F;
    }
    else if (ani >= SG_UNDRAW_F && ani < SG_UNAIM_F)
    {
        ani++;
        if (ani == SG_UNDRAW_F + 21)
        {
            undraw_shotgun_meshes();
            SoundEffect(6, &lara_item->pos, NULL);
        }
        else if (ani == SG_UNAIM_F)
        {
            ani = 0;
            lara.gun_status = LG_ARMLESS;
            lara.target = NULL;
            lara.left_arm.lock = lara.right_arm.lock = 0;
        }
    }
    lara.left_arm.frame_number = lara.right_arm.frame_number = ani;
    lara.head_y_rot = lara.head_x_rot = 0;
    lara.torso_y_rot -= lara.torso_y_rot / 2;
    lara.torso_x_rot -= lara.torso_x_rot / 2;
}

void draw_shotgun_meshes(void)
{
    lara.mesh_ptrs[HAND_L] = meshes[objects[SHOTGUN].mesh_index + HAND_L];
    lara.mesh_ptrs[HAND_R] = meshes[objects[SHOTGUN].mesh_index + HAND_R];
    lara.mesh_ptrs[TORSO] = meshes[objects[LARA].mesh_index + TORSO];
}

void undraw_shotgun_meshes(void)
{
    lara.mesh_ptrs[HAND_L] = meshes[objects[LARA].mesh_index + HAND_L];
    lara.mesh_ptrs[HAND_R] = meshes[objects[LARA].mesh_index + HAND_R];
    lara.mesh_ptrs[TORSO] = meshes[objects[SHOTGUN].mesh_index + TORSO];
}

void ready_shotgun(void)
{
    lara.gun_status = LG_READY;
    lara.left_arm.x_rot = lara.left_arm.y_rot = lara.left_arm.z_rot = 0;
    lara.right_arm.x_rot = lara.right_arm.y_rot = lara.right_arm.z_rot = 0;
    lara.left_arm.frame_number = lara.right_arm.frame_number = 0;
    lara.left_arm.lock = lara.right_arm.lock = 0;
    lara.target = NULL;
    lara.left_arm.frame_base = lara.right_arm.frame_base = objects[SHOTGUN].frame_base;
    lara.torso_x_rot = lara.torso_y_rot = 0;
    lara.head_x_rot = lara.head_y_rot = 0;
}

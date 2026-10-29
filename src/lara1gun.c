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

void draw_shotgun_meshes(void)
{
    lara.mesh_ptrs[HAND_L] = meshes[objects[SHOTGUN].mesh_index + HAND_L];
    lara.mesh_ptrs[HAND_R] = meshes[objects[SHOTGUN].mesh_index + HAND_R];
    lara.mesh_ptrs[TORSO] = meshes[objects[LARA].mesh_index + TORSO];
}

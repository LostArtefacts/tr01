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

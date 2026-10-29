#include <string.h>
#include "game.h"

int number_draw_rooms;
sint16 draw_rooms[100];
sint16 number_rooms;
ROOM_INFO *room;
int camera_underwater;

OBJECT_INFO objects[NUMBER_OBJECTS];
STATIC_INFO static_objects[NUMBER_STATIC_OBJECTS];
sint16 **meshes, *commands, *frames;
sint32 *bones;
ANIM_STRUCT *anims;
CHANGE_STRUCT *changes;
RANGE_STRUCT *ranges;

struct door_vbuf
{
    sint32 xv;
    sint32 yv;
    sint32 zv;
} vbufdoor[4];

sint32 DrawPhaseCinematic(void)
{
    int i;
    ROOM_INFO *r;

    S_InitialisePolyList();

    S_ClearScreen();
    camera_underwater = 0;
    for (i = 0; i < number_draw_rooms; i++)
    {
        r = &room[draw_rooms[i]];
        r->left = r->top = 0;
        r->right = (sint16)phd_winxmax;
        r->bottom = (sint16)phd_winymax;
        PrintRooms(draw_rooms[i]);
    }

    S_OutputPolyList();
    camera.number_frames = S_DumpScreen();
    S_AnimateTextures(camera.number_frames);
    return camera.number_frames;
}

sint32 DrawPhaseGame(void)
{
    S_InitialisePolyList();
    DrawRooms(camera.pos.room_number);
    DrawGameInfo();
    S_OutputPolyList();
    camera.number_frames = S_DumpScreen();
    S_AnimateTextures(camera.number_frames);
    return camera.number_frames;
}

void DrawRooms(sint16 current_room)
{
    int i;
    ROOM_INFO *r;

    r = &room[current_room];
    phd_left = r->left = 0;
    phd_top = r->top = 0;
    phd_right = r->right = (sint16)phd_winxmax;
    phd_bottom = r->bottom = (sint16)phd_winymax;
    r->bound_active = 1;

    camera_underwater = r->flags & UNDERWATER;

    number_draw_rooms = 0;
    draw_rooms[number_draw_rooms++] = current_room;

    GetRoomBounds(current_room);

    S_ClearScreen();

    if (objects[LARA].loaded)
    {
        if (room[lara_item->room_number].flags & UNDERWATER)
            S_SetupBelowWater(camera_underwater);
        else
            S_SetupAboveWater(camera_underwater);

        DrawLara(lara_item);
    }

    for (i = 0; i < number_draw_rooms; i++)
        PrintRooms(draw_rooms[i]);
}

void GetRoomBounds(sint16 room_number)
{
    int i;
    sint16 *door;
    ROOM_INFO *r;

    phd_PushMatrix();
    r = &room[room_number];
    phd_TranslateAbs(r->x, r->y, r->z);
    if ((door = r->door))
    {
        for (i = *(door++); i > 0; i--, door += 15)
        {
            room_number = *(door++);
            if (SetRoomBounds(door, room_number, r))
                GetRoomBounds(room_number);
        }
    }

    phd_PopMatrix();
}

int SetRoomBounds(sint16 *objptr, sint16 room_number, ROOM_INFO *parent)
{
    int i, z_behind, z_toofar;
    sint32 left, right, top, bottom;
    sint32 xv, yv, zv, xs, ys;
    sint32 *mptr;
    ROOM_INFO *r;
    struct door_vbuf *dest, *last;

    if ((sint32)(*(objptr + 0) * (parent->x + *(objptr + 3) - *(w2v_matrix + M03))) + (sint32)(*(objptr + 1) * (parent->y + *(objptr + 4) - *(w2v_matrix + M13))) + (sint32)(*(objptr + 2) * (parent->z + *(objptr + 5) - *(w2v_matrix + M23))) >= 0)
        return 0;

    left = parent->right;
    right = parent->left;
    top = parent->bottom;
    bottom = parent->top;

    objptr += 3;
    mptr = phd_mxptr;
    dest = vbufdoor;
    z_behind = z_toofar = 0;
    for (i = 0; i < 4; i++, dest++, objptr += 3)
    {
        dest->xv = xv = (sint32)(*(mptr + M00) * *(objptr) + *(mptr + M01) * *(objptr + 1) + *(mptr + M02) * *(objptr + 2) + *(mptr + M03));
        dest->yv = yv = (sint32)(*(mptr + M10) * *(objptr) + *(mptr + M11) * *(objptr + 1) + *(mptr + M12) * *(objptr + 2) + *(mptr + M13));
        dest->zv = zv = (sint32)(*(mptr + M20) * *(objptr) + *(mptr + M21) * *(objptr + 1) + *(mptr + M22) * *(objptr + 2) + *(mptr + M23));

        if (zv > 0)
        {
            if (zv > phd_zfar)
                z_toofar++;

            zv /= phd_persp;
            if (zv)
            {
                xs = xv / zv + phd_centerx;
                ys = yv / zv + phd_centery;
            }
            else
            {
                xs = (xv >= 0) ? phd_right : phd_left;
                ys = (yv >= 0) ? phd_bottom : phd_top;
            }

            if (xs < left)
                left = xs;

            if (xs > right)
                right = xs;

            if (ys < top)
                top = ys;

            if (ys > bottom)
                bottom = ys;
        }
        else
            z_behind++;
    }

    if (z_behind == 4 || z_toofar == 4)
        return 0;

    if (z_behind > 0)
    {
        dest = vbufdoor;
        last = dest + 3;
        for (i = 0; i < 4; i++, last = dest, dest++)
        {
            if ((dest->zv < 0) ^ (last->zv < 0))
            {
                if (dest->xv < 0 && last->xv < 0)
                    left = 0;
                else if (dest->xv > 0 && last->xv > 0)
                    right = phd_winxmax;
                else
                {
                    left = 0;
                    right = phd_winxmax;
                }

                if (dest->yv < 0 && last->yv < 0)
                    top = 0;
                else if (dest->yv > 0 && last->yv > 0)
                    bottom = phd_winymax;
                else
                {
                    top = 0;
                    bottom = phd_winymax;
                }
            }
        }
    }

    if (left < parent->left)
        left = parent->left;

    if (right > parent->right)
        right = parent->right;

    if (top < parent->top)
        top = parent->top;

    if (bottom > parent->bottom)
        bottom = parent->bottom;

    if (left >= right || top >= bottom)
        return 0;

    r = &room[room_number];
    if (left < r->left)
        r->left = (sint16)left;

    if (top < r->top)
        r->top = (sint16)top;

    if (right > r->right)
        r->right = (sint16)right;

    if (bottom > r->bottom)
        r->bottom = (sint16)bottom;

    if (!r->bound_active)
    {
        draw_rooms[number_draw_rooms++] = room_number;
        r->bound_active = 1;
    }

    return 1;
}

void PrintRooms(sint16 room_number)
{
    sint16 i, item_num, clip;
    ROOM_INFO *r;
    MESH_INFO *mesh;
    ITEM_INFO *item;

    r = &room[room_number];
    if (r->flags & UNDERWATER)
        S_SetupBelowWater(camera_underwater);
    else
        S_SetupAboveWater(camera_underwater);

    r->bound_active = 0;

    phd_PushMatrix();
    phd_TranslateAbs(r->x, r->y, r->z);

    phd_left = r->left;
    phd_right = r->right;
    phd_top = r->top;
    phd_bottom = r->bottom;

    S_InsertRoom(r->data);

    for (item_num = r->item_number; item_num != NO_ITEM; item_num = items[item_num].next_item)
    {
        item = &items[item_num];
        if (item->status != INVISIBLE)
            (*objects[item->object_number].draw_routine)(item);
    }

    mesh = r->mesh;
    for (i = r->num_meshes; i > 0; i--, mesh++)
    {
        if ((static_objects[mesh->static_number].flags & 2))
        {
            phd_PushMatrix();
            phd_TranslateAbs(mesh->x, mesh->y, mesh->z);
            phd_RotY(mesh->y_rot);
            if ((clip = S_GetObjectBounds(&static_objects[mesh->static_number].x_minp)))
            {
                S_CalculateStaticLight(mesh->shade);
                phd_PutPolygons(meshes[static_objects[mesh->static_number].mesh_number], clip);
            }

            phd_PopMatrix();
        }
    }

    for (item_num = r->fx_number; item_num != NO_ITEM; item_num = effects[item_num].next_fx)
        DrawEffect(item_num);

    phd_PopMatrix();

    r->left = (sint16)phd_winxmax;
    r->top = (sint16)phd_winymax;
    r->right = r->bottom = 0;
}

void DrawEffect(sint16 fx_num)
{
    FX_INFO *fx;
    OBJECT_INFO *object;

    fx = &effects[fx_num];
    object = &objects[fx->object_number];

    if (!object->loaded)
        return;

    if (object->nmeshes < 0)
        S_DrawSpriteAbs(fx->pos.x_pos, fx->pos.y_pos, fx->pos.z_pos, object->mesh_index - fx->frame_number, 16 * 256);
    else
    {
        phd_PushMatrix();
        phd_TranslateAbs(fx->pos.x_pos, fx->pos.y_pos, fx->pos.z_pos);
        if (*(phd_mxptr + M23) > phd_znear && *(phd_mxptr + M23) < phd_zfar)
        {
            phd_RotYXZ(fx->pos.y_rot, fx->pos.x_rot, fx->pos.z_rot);
            if (object->nmeshes)
            {
                S_CalculateStaticLight(fx->shade);
                phd_PutPolygons(meshes[object->mesh_index], -1);
            }
            else
            {
                S_CalculateLight(fx->pos.x_pos, fx->pos.y_pos, fx->pos.z_pos, fx->room_number);
                phd_PutPolygons(meshes[fx->frame_number], -1);
            }
        }

        phd_PopMatrix();
    }
}

void DrawSpriteItem(ITEM_INFO *item)
{
    S_DrawSpriteAbs(item->pos.x_pos, item->pos.y_pos, item->pos.z_pos, objects[item->object_number].mesh_index - item->frame_number, item->shade);
}

sint16 null_rotations[] = {
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
};

void DrawAnimatingItem(ITEM_INFO *item)
{
    int clip, i, poppush;
    OBJECT_INFO *object;
    sint32 *bone;
    sint32 *packed_rotation1;
    sint32 *packed_rotation2;
    sint16 *extra_rotation;
    sint16 **meshpp;
    uint32 bit;
    sint16 *frmptr[2];
    int rate, frac;

    frac = GetFrames(item, frmptr, &rate);

    object = &objects[item->object_number];
    if (object->shadow_size)
        S_PrintShadow(object->shadow_size, frmptr[0], item);

    phd_PushMatrix();
    phd_TranslateAbs(item->pos.x_pos, item->pos.y_pos, item->pos.z_pos);
    phd_RotYXZ(item->pos.y_rot, item->pos.x_rot, item->pos.z_rot);

    if ((clip = S_GetObjectBounds(frmptr[0])))
    {
        CalculateObjectLighting(item, frmptr[0]);

        if (item->data)
            extra_rotation = (sint16 *)item->data;
        else
            extra_rotation = null_rotations;

        meshpp = &meshes[object->mesh_index];
        bone = bones + object->bone_index;
        bit = 1;

        if (!frac)
        {
            phd_TranslateRel((sint32)*(frmptr[0] + 6), (sint32)*(frmptr[0] + 7), (sint32)*(frmptr[0] + 8));
            packed_rotation1 = (sint32 *)(frmptr[0] + 10);
            phd_RotYXZpack(*(packed_rotation1++));

            if (bit & item->mesh_bits)
                phd_PutPolygons(*(meshpp++), clip);

            for (i = object->nmeshes - 1; i > 0; i--, bone += 4, meshpp++)
            {
                poppush = *(bone);
                if (poppush & 1)
                    phd_PopMatrix();

                if (poppush & 2)
                    phd_PushMatrix();

                phd_TranslateRel(*(bone + 1), *(bone + 2), *(bone + 3));
                phd_RotYXZpack(*(packed_rotation1++));

                if (poppush & (ROT_X | ROT_Y | ROT_Z))
                {
                    if (poppush & ROT_Y)
                        phd_RotY(*(extra_rotation++));

                    if (poppush & ROT_X)
                        phd_RotX(*(extra_rotation++));

                    if (poppush & ROT_Z)
                        phd_RotZ(*(extra_rotation++));
                }

                bit <<= 1;
                if (bit & item->mesh_bits)
                    phd_PutPolygons(*meshpp, clip);
            }
        }
        else
        {
            InitInterpolate(frac, rate);
            phd_TranslateRel_ID((sint32)*(frmptr[0] + 6), (sint32)*(frmptr[0] + 7), (sint32)*(frmptr[0] + 8), (sint32)*(frmptr[1] + 6), (sint32)*(frmptr[1] + 7), (sint32)*(frmptr[1] + 8));
            packed_rotation1 = (sint32 *)(frmptr[0] + 10);
            packed_rotation2 = (sint32 *)(frmptr[1] + 10);
            phd_RotYXZpack_I(*(packed_rotation1++), *(packed_rotation2++));

            if (bit & item->mesh_bits)
                phd_PutPolygons_I(*(meshpp++), clip);

            for (i = object->nmeshes - 1; i > 0; i--, bone += 4, meshpp++)
            {
                poppush = *(bone);
                if (poppush & 1)
                    phd_PopMatrix_I();

                if (poppush & 2)
                    phd_PushMatrix_I();

                phd_TranslateRel_I(*(bone + 1), *(bone + 2), *(bone + 3));
                phd_RotYXZpack_I(*(packed_rotation1++), *(packed_rotation2++));

                if (poppush & (ROT_X | ROT_Y | ROT_Z))
                {
                    if (poppush & ROT_Y)
                        phd_RotY_I(*(extra_rotation++));

                    if (poppush & ROT_X)
                        phd_RotX_I(*(extra_rotation++));

                    if (poppush & ROT_Z)
                        phd_RotZ_I(*(extra_rotation++));
                }

                bit <<= 1;
                if (bit & item->mesh_bits)
                    phd_PutPolygons_I(*meshpp, clip);
            }
        }
    }

    phd_PopMatrix();
}

#define PutPolyLara(A, B) phd_PutPolygons(lara.mesh_ptrs[A], B)
#define PutPolyLara_I(A, B) phd_PutPolygons_I(lara.mesh_ptrs[A], B)

void DrawLara(ITEM_INFO *item)
{
    OBJECT_INFO *object;
    sint32 *bone;
    sint32 *packed_rotation;
    sint16 *frame;
    int clip, fire_arms;
    sint32 savemox[12];
    sint16 *frmptr[2];
    int frac, rate;
    int left, right, top, bottom;

    left = phd_left;
    right = phd_right;
    top = phd_top;
    bottom = phd_bottom;
    phd_left = phd_top = 0;
    phd_bottom = phd_winymax;
    phd_right = phd_winxmax;
    if (lara.hit_direction < 0 && (frac = GetFrames(item, frmptr, &rate)))
    {
        DrawLaraInt(item, frmptr[0], frmptr[1], frac, rate);
        phd_left = left;
        phd_right = right;
        phd_top = top;
        phd_bottom = bottom;
        return;
    }

    object = &objects[item->object_number];
    if (lara.hit_direction >= 0)
    {
        switch (lara.hit_direction)
        {
        default:
        case NORTH:
            frame = anims[HIT_FORWARD_A].frame_ptr;
            break;

        case EAST:
            frame = anims[HIT_RIGHT_A].frame_ptr;
            break;

        case SOUTH:
            frame = anims[HIT_BACK_A].frame_ptr;
            break;

        case WEST:
            frame = anims[HIT_LEFT_A].frame_ptr;
            break;
        }

        frame += (int)(lara.hit_frame * (object->nmeshes * 2 + 10));
    }
    else
        frame = frmptr[0];

    S_PrintShadow(object->shadow_size, frame, item);

    phd_PushMatrix();
    phd_TranslateAbs(item->pos.x_pos, item->pos.y_pos, item->pos.z_pos);
    phd_RotYXZ(item->pos.y_rot, item->pos.x_rot, item->pos.z_rot);

    if (!(clip = S_GetObjectBounds(frame)))
    {
        phd_PopMatrix();
        return;
    }

    phd_PushMatrix();

    CalculateObjectLighting(item, frame);

    bone = bones + object->bone_index;
    packed_rotation = (sint32 *)(frame + 10);

    phd_TranslateRel((sint32)*(frame + 6), (sint32)*(frame + 7), (sint32)*(frame + 8));
    phd_RotYXZpack(*(packed_rotation));
    PutPolyLara(HIPS, clip);

    phd_PushMatrix();
    phd_TranslateRel(*(bone + 1), *(bone + 2), *(bone + 3));
    phd_RotYXZpack(*(packed_rotation + 1));
    PutPolyLara(THIGH_L, clip);

    phd_TranslateRel(*(bone + 1 + 4), *(bone + 2 + 4), *(bone + 3 + 4));
    phd_RotYXZpack(*(packed_rotation + 2));
    PutPolyLara(CALF_L, clip);

    phd_TranslateRel(*(bone + 1 + 8), *(bone + 2 + 8), *(bone + 3 + 8));
    phd_RotYXZpack(*(packed_rotation + 3));
    PutPolyLara(FOOT_L, clip);

    phd_PopMatrix();
    phd_PushMatrix();
    phd_TranslateRel(*(bone + 1 + 12), *(bone + 2 + 12), *(bone + 3 + 12));
    phd_RotYXZpack(*(packed_rotation + 4));
    PutPolyLara(THIGH_R, clip);

    phd_TranslateRel(*(bone + 1 + 16), *(bone + 2 + 16), *(bone + 3 + 16));
    phd_RotYXZpack(*(packed_rotation + 5));
    PutPolyLara(CALF_R, clip);

    phd_TranslateRel(*(bone + 1 + 20), *(bone + 2 + 20), *(bone + 3 + 20));
    phd_RotYXZpack(*(packed_rotation + 6));
    PutPolyLara(FOOT_R, clip);

    phd_PopMatrix();
    phd_TranslateRel(*(bone + 1 + 24), *(bone + 2 + 24), *(bone + 3 + 24));
    phd_RotYXZpack(*(packed_rotation + 7));
    phd_RotYXZ(lara.torso_y_rot, lara.torso_x_rot, lara.torso_z_rot);
    PutPolyLara(TORSO, clip);

    phd_PushMatrix();
    phd_TranslateRel(*(bone + 1 + 52), *(bone + 2 + 52), *(bone + 3 + 52));
    phd_RotYXZpack(*(packed_rotation + 14));
    phd_RotYXZ(lara.head_y_rot, lara.head_x_rot, lara.head_z_rot);
    PutPolyLara(HEAD, clip);
    phd_PopMatrix();

    fire_arms = LG_UNARMED;
    if (lara.gun_status == LG_READY || lara.gun_status == LG_DRAW || lara.gun_status == LG_UNDRAW)
    {
        fire_arms = lara.gun_type;
    }

    switch (fire_arms)
    {
    case LG_UNARMED:
        phd_PushMatrix();
        phd_TranslateRel(*(bone + 1 + 28), *(bone + 2 + 28), *(bone + 3 + 28));
        phd_RotYXZpack(*(packed_rotation + 8));
        PutPolyLara(UARM_R, clip);
        phd_TranslateRel(*(bone + 1 + 32), *(bone + 2 + 32), *(bone + 3 + 32));
        phd_RotYXZpack(*(packed_rotation + 9));
        PutPolyLara(LARM_R, clip);
        phd_TranslateRel(*(bone + 1 + 36), *(bone + 2 + 36), *(bone + 3 + 36));
        phd_RotYXZpack(*(packed_rotation + 10));
        PutPolyLara(HAND_R, clip);
        phd_PopMatrix();
        phd_PushMatrix();
        phd_TranslateRel(*(bone + 1 + 40), *(bone + 2 + 40), *(bone + 3 + 40));
        phd_RotYXZpack(*(packed_rotation + 11));
        PutPolyLara(UARM_L, clip);
        phd_TranslateRel(*(bone + 1 + 44), *(bone + 2 + 44), *(bone + 3 + 44));
        phd_RotYXZpack(*(packed_rotation + 12));
        PutPolyLara(LARM_L, clip);
        phd_TranslateRel(*(bone + 1 + 48), *(bone + 2 + 48), *(bone + 3 + 48));
        phd_RotYXZpack(*(packed_rotation + 13));
        PutPolyLara(HAND_L, clip);
        break;

    case LG_PISTOLS:
    case LG_MAGNUMS:
    case LG_UZIS:
        phd_PushMatrix();
        phd_TranslateRel(*(bone + 1 + 28), *(bone + 2 + 28), *(bone + 3 + 28));
        *(phd_mxptr + M00) = *(phd_mxptr + M00 - 24);
        *(phd_mxptr + M01) = *(phd_mxptr + M01 - 24);
        *(phd_mxptr + M02) = *(phd_mxptr + M02 - 24);
        *(phd_mxptr + M10) = *(phd_mxptr + M10 - 24);
        *(phd_mxptr + M11) = *(phd_mxptr + M11 - 24);
        *(phd_mxptr + M12) = *(phd_mxptr + M12 - 24);
        *(phd_mxptr + M20) = *(phd_mxptr + M20 - 24);
        *(phd_mxptr + M21) = *(phd_mxptr + M21 - 24);
        *(phd_mxptr + M22) = *(phd_mxptr + M22 - 24);
        phd_RotYXZ(lara.right_arm.y_rot, lara.right_arm.x_rot, lara.right_arm.z_rot);
        packed_rotation = (sint32 *)(lara.right_arm.frame_base + lara.right_arm.frame_number * (object->nmeshes * 2 + 10) + 10);
        phd_RotYXZpack(*(packed_rotation + 8));
        PutPolyLara(UARM_R, clip);
        phd_TranslateRel(*(bone + 1 + 32), *(bone + 2 + 32), *(bone + 3 + 32));
        phd_RotYXZpack(*(packed_rotation + 9));
        PutPolyLara(LARM_R, clip);
        phd_TranslateRel(*(bone + 1 + 36), *(bone + 2 + 36), *(bone + 3 + 36));
        phd_RotYXZpack(*(packed_rotation + 10));
        PutPolyLara(HAND_R, clip);
        if (lara.right_arm.flash_gun)
            memcpy(savemox, phd_mxptr, 12 * 4);

        phd_PopMatrix();
        phd_PushMatrix();
        phd_TranslateRel(*(bone + 1 + 40), *(bone + 2 + 40), *(bone + 3 + 40));
        *(phd_mxptr + M00) = *(phd_mxptr + M00 - 24);
        *(phd_mxptr + M01) = *(phd_mxptr + M01 - 24);
        *(phd_mxptr + M02) = *(phd_mxptr + M02 - 24);
        *(phd_mxptr + M10) = *(phd_mxptr + M10 - 24);
        *(phd_mxptr + M11) = *(phd_mxptr + M11 - 24);
        *(phd_mxptr + M12) = *(phd_mxptr + M12 - 24);
        *(phd_mxptr + M20) = *(phd_mxptr + M20 - 24);
        *(phd_mxptr + M21) = *(phd_mxptr + M21 - 24);
        *(phd_mxptr + M22) = *(phd_mxptr + M22 - 24);
        phd_RotYXZ(lara.left_arm.y_rot, lara.left_arm.x_rot, lara.left_arm.z_rot);
        packed_rotation = (sint32 *)(lara.left_arm.frame_base + lara.left_arm.frame_number * (object->nmeshes * 2 + 10) + 10);
        phd_RotYXZpack(*(packed_rotation + 11));
        PutPolyLara(UARM_L, clip);
        phd_TranslateRel(*(bone + 1 + 44), *(bone + 2 + 44), *(bone + 3 + 44));
        phd_RotYXZpack(*(packed_rotation + 12));
        PutPolyLara(LARM_L, clip);
        phd_TranslateRel(*(bone + 1 + 48), *(bone + 2 + 48), *(bone + 3 + 48));
        phd_RotYXZpack(*(packed_rotation + 13));
        PutPolyLara(HAND_L, clip);

        if (lara.left_arm.flash_gun)
            DrawGunFlash(fire_arms, clip);

        if (lara.right_arm.flash_gun)
        {
            memcpy(phd_mxptr, savemox, 12 * 4);
            DrawGunFlash(fire_arms, clip);
        }

        break;

    case LG_SHOTGUN:
        phd_PushMatrix();
        phd_TranslateRel(*(bone + 1 + 28), *(bone + 2 + 28), *(bone + 3 + 28));
        packed_rotation = (sint32 *)(lara.right_arm.frame_base + lara.right_arm.frame_number * (object->nmeshes * 2 + 10) + 10);
        phd_RotYXZpack(*(packed_rotation + 8));
        PutPolyLara(UARM_R, clip);
        phd_TranslateRel(*(bone + 1 + 32), *(bone + 2 + 32), *(bone + 3 + 32));
        phd_RotYXZpack(*(packed_rotation + 9));
        PutPolyLara(LARM_R, clip);
        phd_TranslateRel(*(bone + 1 + 36), *(bone + 2 + 36), *(bone + 3 + 36));
        phd_RotYXZpack(*(packed_rotation + 10));
        PutPolyLara(HAND_R, clip);

        phd_PopMatrix();
        phd_PushMatrix();
        phd_TranslateRel(*(bone + 1 + 40), *(bone + 2 + 40), *(bone + 3 + 40));
        packed_rotation = (sint32 *)(lara.left_arm.frame_base + lara.left_arm.frame_number * (object->nmeshes * 2 + 10) + 10);
        phd_RotYXZpack(*(packed_rotation + 11));
        PutPolyLara(UARM_L, clip);
        phd_TranslateRel(*(bone + 1 + 44), *(bone + 2 + 44), *(bone + 3 + 44));
        phd_RotYXZpack(*(packed_rotation + 12));
        PutPolyLara(LARM_L, clip);
        phd_TranslateRel(*(bone + 1 + 48), *(bone + 2 + 48), *(bone + 3 + 48));
        phd_RotYXZpack(*(packed_rotation + 13));
        PutPolyLara(HAND_L, clip);
        break;
    }

    phd_PopMatrix();
    phd_PopMatrix();
    phd_PopMatrix();

    phd_left = left;
    phd_right = right;
    phd_top = top;
    phd_bottom = bottom;
}

void DrawGunFlash(int weapon_type, int clip)
{
    int light;
    int g_len;

    switch (weapon_type)
    {
    case LG_MAGNUMS:
        light = 16 * 256;
        g_len = 155;
        break;

    case LG_UZIS:
        light = 10 * 256;
        g_len = 180;
        break;

    default:
        light = 20 * 256;
        g_len = 155;
        break;
    }

    phd_TranslateRel(0, g_len, 55);
    phd_RotYXZ(0, -90 * ONE_DEGREE, (PHD_ANGLE)(GetRandomDraw() * 2));
    S_CalculateStaticLight(light);
    phd_PutPolygons(meshes[objects[GUN_FLASH].mesh_index], clip);
}

void CalculateObjectLighting(ITEM_INFO *item, sint16 *frame)
{
    sint32 x, y, z;
    sint32 *mptr;

    if (item->shade < 0)
    {
        phd_PushUnitMatrix();
        mptr = phd_mxptr;
        *(mptr + M03) = *(mptr + M13) = *(mptr + M23) = 0;
        phd_RotYXZ(item->pos.y_rot, item->pos.x_rot, item->pos.z_rot);
        x = (sint32)((*(frame + 0) + *(frame + 1)) / 2);
        y = (sint32)((*(frame + 2) + *(frame + 3)) / 2);
        z = (sint32)((*(frame + 4) + *(frame + 5)) / 2);
        phd_TranslateRel(x, y, z);
        x = (*(phd_mxptr + M03) >> W2V_SHIFT) + item->pos.x_pos;
        y = (*(phd_mxptr + M13) >> W2V_SHIFT) + item->pos.y_pos;
        z = (*(phd_mxptr + M23) >> W2V_SHIFT) + item->pos.z_pos;
        phd_PopMatrix();
        S_CalculateLight(x, y, z, item->room_number);
    }
    else
        S_CalculateStaticLight(item->shade);
}

sint32 *IMptr;
sint32 IMstack[12 * 32];
sint32 IM_frac;
sint32 IM_rate;

void InitInterpolate(int frac, int rate)
{
    IM_frac = frac;
    IM_rate = rate;

    IMptr = IMstack;
    memcpy(IMstack, phd_mxptr, 12 * 4);
}

void phd_PopMatrix_I(void)
{
    phd_PopMatrix();
    IMptr -= 12;
}

void phd_PushMatrix_I(void)
{
    phd_PushMatrix();
    memcpy(IMptr + 12, IMptr, 12 * 4);
    IMptr += 12;
}

void phd_RotY_I(sint16 ang)
{
    sint32 *oldm;

    phd_RotY(ang);
    oldm = phd_mxptr;
    phd_mxptr = IMptr;
    phd_RotY(ang);
    phd_mxptr = oldm;
}

void phd_RotX_I(sint16 ang)
{
    sint32 *oldm;

    phd_RotX(ang);
    oldm = phd_mxptr;
    phd_mxptr = IMptr;
    phd_RotX(ang);
    phd_mxptr = oldm;
}

void phd_RotZ_I(sint16 ang)
{
    sint32 *oldm;

    phd_RotZ(ang);
    oldm = phd_mxptr;
    phd_mxptr = IMptr;
    phd_RotZ(ang);
    phd_mxptr = oldm;
}

void phd_TranslateRel_I(sint32 x, sint32 y, sint32 z)
{
    sint32 *oldm;

    phd_TranslateRel(x, y, z);
    oldm = phd_mxptr;
    phd_mxptr = IMptr;
    phd_TranslateRel(x, y, z);
    phd_mxptr = oldm;
}

void phd_TranslateRel_ID(sint32 x, sint32 y, sint32 z, sint32 x2, sint32 y2, sint32 z2)
{
    sint32 *oldm;

    phd_TranslateRel(x, y, z);
    oldm = phd_mxptr;
    phd_mxptr = IMptr;
    phd_TranslateRel(x2, y2, z2);
    phd_mxptr = oldm;
}

void phd_RotYXZ_I(sint16 y, sint16 x, sint16 z)
{
    sint32 *oldm;

    phd_RotYXZ(y, x, z);
    oldm = phd_mxptr;
    phd_mxptr = IMptr;
    phd_RotYXZ(y, x, z);
    phd_mxptr = oldm;
}

void phd_RotYXZpack_I(sint32 r1, sint32 r2)
{
    sint32 *oldm;

    phd_RotYXZpack(r1);
    oldm = phd_mxptr;
    phd_mxptr = IMptr;
    phd_RotYXZpack(r2);
    phd_mxptr = oldm;
}

void phd_PutPolygons_I(sint16 *ptr, int clip)
{
    phd_PushMatrix();
    InterpolateMatrix();
    phd_PutPolygons(ptr, clip);
    phd_PopMatrix();
}

void InterpolateMatrix(void)
{
    sint32 *mptr, *iptr;
    sint32 frac, rate;

    mptr = phd_mxptr;
    iptr = IMptr;
    frac = IM_frac;
    rate = IM_rate;
    if (rate == 2)
    {
        *(mptr + M00) = (*(iptr + M00) + *(mptr + M00)) / 2;
        *(mptr + M01) = (*(iptr + M01) + *(mptr + M01)) / 2;
        *(mptr + M02) = (*(iptr + M02) + *(mptr + M02)) / 2;
        *(mptr + M03) = (*(iptr + M03) + *(mptr + M03)) / 2;

        *(mptr + M10) = (*(iptr + M10) + *(mptr + M10)) / 2;
        *(mptr + M11) = (*(iptr + M11) + *(mptr + M11)) / 2;
        *(mptr + M12) = (*(iptr + M12) + *(mptr + M12)) / 2;
        *(mptr + M13) = (*(iptr + M13) + *(mptr + M13)) / 2;

        *(mptr + M20) = (*(iptr + M20) + *(mptr + M20)) / 2;
        *(mptr + M21) = (*(iptr + M21) + *(mptr + M21)) / 2;
        *(mptr + M22) = (*(iptr + M22) + *(mptr + M22)) / 2;
        *(mptr + M23) = (*(iptr + M23) + *(mptr + M23)) / 2;
    }
    else
    {
        *(mptr + M00) += ((*(iptr + M00) - *(mptr + M00)) * frac) / rate;
        *(mptr + M01) += ((*(iptr + M01) - *(mptr + M01)) * frac) / rate;
        *(mptr + M02) += ((*(iptr + M02) - *(mptr + M02)) * frac) / rate;
        *(mptr + M03) += ((*(iptr + M03) - *(mptr + M03)) * frac) / rate;

        *(mptr + M10) += ((*(iptr + M10) - *(mptr + M10)) * frac) / rate;
        *(mptr + M11) += ((*(iptr + M11) - *(mptr + M11)) * frac) / rate;
        *(mptr + M12) += ((*(iptr + M12) - *(mptr + M12)) * frac) / rate;
        *(mptr + M13) += ((*(iptr + M13) - *(mptr + M13)) * frac) / rate;

        *(mptr + M20) += ((*(iptr + M20) - *(mptr + M20)) * frac) / rate;
        *(mptr + M21) += ((*(iptr + M21) - *(mptr + M21)) * frac) / rate;
        *(mptr + M22) += ((*(iptr + M22) - *(mptr + M22)) * frac) / rate;
        *(mptr + M23) += ((*(iptr + M23) - *(mptr + M23)) * frac) / rate;
    }
}

void InterpolateArmMatrix(void)
{
    sint32 *mptr, *iptr;
    sint32 frac, rate;

    mptr = phd_mxptr;
    iptr = IMptr;
    frac = IM_frac;
    rate = IM_rate;
    if (rate == 2)
    {
        *(mptr + M00) = *(mptr + M00 - 24);
        *(mptr + M01) = *(mptr + M01 - 24);
        *(mptr + M02) = *(mptr + M02 - 24);
        *(mptr + M03) = (*(iptr + M03) + *(mptr + M03)) / 2;
        *(mptr + M10) = *(mptr + M10 - 24);
        *(mptr + M11) = *(mptr + M11 - 24);
        *(mptr + M12) = *(mptr + M12 - 24);
        *(mptr + M13) = (*(iptr + M13) + *(mptr + M13)) / 2;
        *(mptr + M20) = *(mptr + M20 - 24);
        *(mptr + M21) = *(mptr + M21 - 24);
        *(mptr + M22) = *(mptr + M22 - 24);
        *(mptr + M23) = (*(iptr + M23) + *(mptr + M23)) / 2;
    }
    else
    {
        *(mptr + M00) = *(mptr + M00 - 24);
        *(mptr + M01) = *(mptr + M01 - 24);
        *(mptr + M02) = *(mptr + M02 - 24);
        *(mptr + M03) += ((*(iptr + M03) - *(mptr + M03)) * frac) / rate;
        *(mptr + M10) = *(mptr + M10 - 24);
        *(mptr + M11) = *(mptr + M11 - 24);
        *(mptr + M12) = *(mptr + M12 - 24);
        *(mptr + M13) += ((*(iptr + M13) - *(mptr + M13)) * frac) / rate;
        *(mptr + M20) = *(mptr + M20 - 24);
        *(mptr + M21) = *(mptr + M21 - 24);
        *(mptr + M22) = *(mptr + M22 - 24);
        *(mptr + M23) += ((*(iptr + M23) - *(mptr + M23)) * frac) / rate;
    }
}

int GetFrames(ITEM_INFO *item, sint16 *frmptr[], int *rate)
{
    ANIM_STRUCT *anim;
    int frm;
    int first, second;
    int frame_size;
    int interp, rat;

    frm = item->frame_number;
    anim = &anims[item->anim_number];
    frmptr[0] = frmptr[1] = anim->frame_ptr;
    rat = *rate = anim->interpolation;
    frame_size = objects[item->object_number].nmeshes * 2 + 10;
    frm -= anim->frame_base;
    first = frm / rat;
    interp = frm % rat;
    frmptr[0] += first * frame_size;
    frmptr[1] = frmptr[0] + frame_size;
    if (interp == 0)
        return 0;

    second = first * rat + rat;
    if (second > anim->frame_end)
        *rate = anim->frame_end - (second - rat);

    return interp;
}

sint16 interpolated_bounds[6];

sint16 *GetBoundsAccurate(ITEM_INFO *item)
{
    int i, frac, rate;
    sint16 *bptr, *frmptr[2];

    if ((frac = GetFrames(item, frmptr, &rate)) == 0)
        return frmptr[0];
    else
    {
        bptr = interpolated_bounds;
        for (i = 0; i < 6; i++, bptr++, frmptr[0]++, frmptr[1]++)
            *(bptr) = *(frmptr[0]) + ((*(frmptr[1]) - *(frmptr[0])) * frac) / rate;

        return interpolated_bounds;
    }
}

sint16 *GetBestFrame(ITEM_INFO *item)
{
    int frac, rate;
    sint16 *frmptr[2];

    frac = GetFrames(item, frmptr, &rate);
    if (frac <= rate / 2)
        return frmptr[0];
    else
        return frmptr[1];
}

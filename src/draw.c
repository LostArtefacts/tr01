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

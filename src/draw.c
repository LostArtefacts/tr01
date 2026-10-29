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

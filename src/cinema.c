#include "game.h"

sint16 *cine;
sint16 num_cine_frames;
sint16 cine_frame;
sint16 cinematic_level;
PHD_3DPOS cinematic_pos;

int cinematic_animation_rate = 32768;

sint32 StartCinematic(int level_number)
{
    sint32 nframes, cine_over;
    int saved_sound_active;

    cinematic_level = level_number;
    if (!InitialiseLevel(level_number))
        return END_ACTION;

    InitCinematicRooms();

    switch (level_number)
    {
    case CUTSCENE1:
        camera.pos.x = 36668;
        camera.pos.z = 63180;
        camera.target_angle = -23312;
        S_StartSyncedAudio(23);
        break;

    case CUTSCENE2:
        camera.pos.x = 51962;
        camera.pos.z = 53760;
        camera.target_angle = 16380;
        S_StartSyncedAudio(25);
        break;

    case CUTSCENE3:
        camera.target_angle = 16384;
        FlipMap();
        S_StartSyncedAudio(24);
        break;

    case CUTSCENE4:
        camera.target_angle = 16384;
        S_StartSyncedAudio(22);
        break;
    }

    saved_sound_active = sound_active;
    sound_active = 0;
    cine_frame = 0;

    DoCinematic(2);
    nframes = DrawPhaseCinematic();
    do
    {
        nframes = DrawPhaseCinematic();
        cine_over = DoCinematic(nframes);
    } while (!cine_over);

    S_CDStop();

    sound_active = saved_sound_active;
    S_SoundStopAllSamples();
    level_complete = 1;
    S_FadeInInventory(1);

    return LEVELCOMPLETE | level_number;
}

void InitCinematicRooms(void)
{
    int i;

    for (i = 0; i < number_rooms; i++)
    {
        if (room[i].flipped_room >= 0)
            room[room[i].flipped_room].bound_active = 1;
    }

    number_draw_rooms = 0;
    for (i = 0; i < number_rooms; i++)
    {
        if (!room[i].bound_active)
            draw_rooms[number_draw_rooms++] = i;
    }
}

sint32 DoCinematic(sint32 nframes)
{
    sint16 item_num, nex;
    static int framecount = 0;

    framecount += nframes * cinematic_animation_rate;
    for (; framecount >= 0; framecount -= 65536)
    {
        S_UpdateInput();

        if (input & IN_OPTION)
            return 1;

        item_num = next_item_active;
        while (item_num != NO_ITEM)
        {
            nex = items[item_num].next_active;
            if (objects[items[item_num].object_number].control)
                (*objects[items[item_num].object_number].control)(item_num);

            item_num = nex;
        }

        item_num = next_fx_active;
        while (item_num != NO_ITEM)
        {
            nex = effects[item_num].next_active;
            if (objects[effects[item_num].object_number].control)
                (*objects[effects[item_num].object_number].control)(item_num);

            item_num = nex;
        }

        CalculateCinematicCamera();
        cine_frame++;

        if (cine_frame >= num_cine_frames)
            return 1;
    }

    return 0;
}

void CalculateCinematicCamera(void)
{
    sint32 tx, ty, tz;
    sint32 cx, cy, cz;
    sint32 c, s;
    sint16 roll, fov;
    sint16 *ptr;
    PHD_VECTOR campos, camtar;

    ptr = cine + (int)(8 * cine_frame);
    tx = (sint32)*(ptr + 0);
    ty = (sint32)*(ptr + 1);
    tz = (sint32)*(ptr + 2);
    cx = (sint32)*(ptr + 3);
    cy = (sint32)*(ptr + 4);
    cz = (sint32)*(ptr + 5);
    fov = *(ptr + 6);
    roll = *(ptr + 7);

    c = phd_cos(camera.target_angle);
    s = phd_sin(camera.target_angle);
    camtar.x = camera.pos.x + ((tx * c + tz * s) >> W2V_SHIFT);
    camtar.y = camera.pos.y + ty;
    camtar.z = camera.pos.z + ((tz * c - tx * s) >> W2V_SHIFT);
    campos.x = camera.pos.x + ((cx * c + cz * s) >> W2V_SHIFT);
    campos.y = camera.pos.y + cy;
    campos.z = camera.pos.z + ((cz * c - cx * s) >> W2V_SHIFT);
    AlterFOV(fov);
    phd_LookAt(campos.x, campos.y, campos.z, camtar.x, camtar.y, camtar.z, roll);
}

void ControlCinematicPlayer(sint16 item_num)
{
    ITEM_INFO *item;

    item = &items[item_num];
    item->pos.y_rot = camera.target_angle;
    item->pos.x_pos = camera.pos.x;
    item->pos.y_pos = camera.pos.y;
    item->pos.z_pos = camera.pos.z;
    AnimateItem(item);
}

void ControlCinematicPlayer4(sint16 item_num)
{
    AnimateItem(&items[item_num]);
}

void InitialisePlayer1(sint16 item_num)
{
    ITEM_INFO *item;
    sint16 *temp;

    AddActiveItem(item_num);
    item = &items[item_num];
    camera.pos.x = item->pos.x_pos;
    camera.pos.y = item->pos.y_pos;
    camera.pos.z = item->pos.z_pos;
    camera.target_angle = item->pos.y_rot = 0;
    camera.pos.room_number = item->room_number;

    if (cinematic_level == CUTSCENE2 || cinematic_level == CUTSCENE4)
    {
        temp = meshes[objects[PLAYER_1].mesh_index + THIGH_L];
        meshes[objects[PLAYER_1].mesh_index + THIGH_L] = meshes[objects[PISTOLS].mesh_index + THIGH_L];
        meshes[objects[PISTOLS].mesh_index + THIGH_L] = temp;
        temp = meshes[objects[PLAYER_1].mesh_index + THIGH_R];
        meshes[objects[PLAYER_1].mesh_index + THIGH_R] = meshes[objects[PISTOLS].mesh_index + THIGH_R];
        meshes[objects[PISTOLS].mesh_index + THIGH_R] = temp;
    }
}

void InitialiseGenPlayer(sint16 item_num)
{
    AddActiveItem(item_num);
    items[item_num].pos.y_rot = 0;
}

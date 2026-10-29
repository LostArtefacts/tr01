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

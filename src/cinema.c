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

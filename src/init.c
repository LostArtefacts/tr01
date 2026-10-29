#include <stdio.h>
#include <stdlib.h>
#include "game.h"

SETUP game_setup = {320, 200, 25, 25, 50, 0, 0};

char *malloc_buffer = NULL;
int malloc_size;

void S_InitialiseSystem(void)
{
    S_SeedRandom();
    FindCdDrive();

    if (hires_flag)
    {
        game_setup.sc_width = 640;
        game_setup.sc_height = 480;
    }
    else
    {
        game_setup.sc_width = 320;
        game_setup.sc_height = 200;
    }
    game_setup.dump_x = 0;
    game_setup.dump_y = 0;
    game_setup.dump_width = game_setup.sc_width;
    game_setup.dump_height = game_setup.sc_height;

    if (sound_active)
        ShellInit(&game_setup, CD_ON | NO_MIDI);
    else
        ShellInit(&game_setup, NO_SOS | CD_ON);

    if (SoundGetSOSDriver() == -1)
        sound_active = 0;

    CalculateWibbleTable();

    malloc_size = MALLOC_SIZE;
}

void S_ExitSystem(char *exit_message)
{
    while (input & IN_SELECT)
        S_UpdateInput();

    if (malloc_buffer)
        free(malloc_buffer);

    ShellExit("\n\nTomb Raider (c) Core Design. %s %s \n%s\n%s\n", "Oct 30 1996", "16:24:55", " ", exit_message);
}

void init_game_malloc(void)
{
    malloc_ptr = malloc_buffer;
    malloc_free = malloc_size;
    malloc_used = 0;
}

char *game_malloc_strings[] = {
    "Sprite Textures",
    "Object Textures",
    "Mesh Pointers",
    "Meshes",
    "Anims",
    "Structs",
    "Ranges",
    "Commands",
    "Bones",
    "Frames",
    "Room Textures",
    "Room Infos",
    "Room Mesh",
    "Room Door",
    "Room Floor",
    "Room Lights",
    "Room Static Mesh Infos",
    "Floor Data",
    "ITEMS!!",
    "Cameras",
    "Sound FX",
    "Boxes",
    "Overlaps",
    "GroundZone",
    "FlyZone",
    "Animating Texture Ranges",
    "Cinematic Frames",
    "LoadDemo Buffer",
    "SaveDemo Buffer",
    "Cinematic Effects",
    "Mummy Head Turn",
    "Extra Door stuff",
    "Effects_Array",
    "Creature Data",
    "Creature LOT",
    "Sample Infos",
    "Samples",
    "Sample Offsets",
    "Rolling Ball Stuff",
};

char *game_malloc(int size, int type)
{
    char *ptr;

    size = (size + 3) & 0xfffffffc;
    if (size <= malloc_free)
    {
        ptr = malloc_ptr;
        malloc_free -= size;
        malloc_used += size;
        malloc_ptr += size;
        return ptr;
    }
    sprintf(exit_message, "game_malloc(): OUT OF MEMORY %s %d", game_malloc_strings[type], size);
    S_ExitSystem(exit_message);
    return NULL;
}

void game_free(int size, int type)
{
    malloc_ptr -= size;
    malloc_free += size;
    malloc_used -= size;
}

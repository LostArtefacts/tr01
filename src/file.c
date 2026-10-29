#include <stdio.h>
#include <string.h>
#include "game.h"

int LoadTexturePages(FILE *file);
int LoadRooms(FILE *file);
int LoadObjects(FILE *file);
int LoadSprites(FILE *file);
int LoadItems(FILE *file);
int LoadDepthQ(FILE *file);
int LoadPalette(FILE *file);
int LoadCameras(FILE *file);
int LoadSoundEffects(FILE *file);
int LoadBoxes(FILE *file);
int LoadAnimatedTextures(FILE *file);
int LoadCinematic(FILE *file);
int LoadDemo(FILE *file);
int LoadSamples(FILE *file);

sint16 *mesh_base;
char *sprite_base;
char *room_text_base;
char *object_text_base;
sint16 *floor_data;

char *levelnames[NUMBER_OF_LEVELS] = {
    "data\\gym.phd",
    "data\\level1.phd",
    "data\\level2.phd",
    "data\\level3a.phd",
    "data\\level3b.phd",
    "data\\level4.phd",
    "data\\level5.phd",
    "data\\level6.phd",
    "data\\level7a.phd",
    "data\\level7b.phd",
    "data\\level8a.phd",
    "data\\level8b.phd",
    "data\\level8c.phd",
    "data\\level10a.phd",
    "data\\level10b.phd",
    "data\\level10c.phd",
    "data\\cut1.phd",
    "data\\cut2.phd",
    "data\\cut3.phd",
    "data\\cut4.phd",
    "data\\title.phd",
    "data\\current.phd"
};

int S_LoadTitle(void)
{
    return LoadLevel(levelnames[TITLE], TITLE);
}

int S_LoadLevel(int level_number)
{
    return LoadLevel(levelnames[level_number], level_number);
}

int LoadLevel(char *filename, int req_level)
{
    FILE *file;
    int version, level;

    filename = GetFullPath(filename);

    init_game_malloc();

    file = fopen(filename, "rb");
    if (file == NULL)
    {
        sprintf(exit_message, "S_LoadLevel(): Could not open %s", filename);
        S_ExitSystem(exit_message);
    }

    fread(&version, sizeof(int), 1, file);
    if (version != OBJECT_VERSION)
    {
        sprintf(exit_message, "Level %d (%s) is version %d (this game code is version %d)", req_level, filename, version, OBJECT_VERSION);
        S_ExitSystem(exit_message);
    }

    if (!LoadTexturePages(file))
        return 0;

    fread(&level, sizeof(int), 1, file);

    if (!LoadRooms(file))
        return 0;

    if (!LoadObjects(file))
        return 0;

    if (!LoadSprites(file))
        return 0;

    if (!LoadCameras(file))
        return 0;

    if (!LoadSoundEffects(file))
        return 0;

    if (!LoadBoxes(file))
        return 0;

    if (!LoadAnimatedTextures(file))
        return 0;

    if (!LoadItems(file))
        return 0;

    if (!LoadDepthQ(file))
        return 0;

    if (!LoadPalette(file))
        return 0;

    if (!LoadCinematic(file))
        return 0;

    if (!LoadDemo(file))
        return 0;

    if (!LoadSamples(file))
        return 0;

    fclose(file);
    return 1;
}

int LoadTexturePages(FILE *file)
{
    char *base;
    int i, num_pages;

    fread(&num_pages, sizeof(int), 1, file);
    base = game_malloc(num_pages * 65536, TEXTURE_PAGES);
    fread(base, 65536, num_pages, file);
    for (i = 0; i < num_pages; i++, base += 65536)
        texture_page_ptrs[i] = base;

    return 1;
}

int LoadRooms(FILE *file)
{
    int i;
    sint16 ndoors;
    sint32 size;
    ROOM_INFO *r;

    fread(&number_rooms, sizeof(number_rooms), 1, file);

    if (number_rooms > MAX_ROOMS)
    {
        strcpy(exit_message, "LoadRoom(): Too many rooms");
        return 0;
    }

    room = (ROOM_INFO *)game_malloc(number_rooms * sizeof(ROOM_INFO), ROOM_INFOS);
    if (room == NULL)
    {
        strcpy(exit_message, "LoadRoom(): Could not allocate memory for rooms");
        return 0;
    }

    for (i = 0, r = room; i < number_rooms; i++, r++)
    {
        fread(&r->x, sizeof(sint32), 1, file);
        r->y = 0;
        fread(&r->z, sizeof(sint32), 1, file);

        fread(&r->minfloor, sizeof(sint32), 1, file);
        fread(&r->maxceiling, sizeof(sint32), 1, file);

        fread(&size, sizeof(size), 1, file);
        r->data = (sint16 *)game_malloc(size * sizeof(sint16), ROOM_MESH);
        fread(r->data, sizeof(sint16), size, file);

        fread(&ndoors, sizeof(sint16), 1, file);
        if (ndoors)
        {
            r->door = (sint16 *)game_malloc((ndoors * 16 + 1) * sizeof(sint16), ROOM_DOOR);
            r->door[0] = ndoors;
            fread(&r->door[1], sizeof(sint16), ndoors * 16, file);
        }
        else
            r->door = NULL;

        fread(&r->x_size, sizeof(sint16), 1, file);
        fread(&r->y_size, sizeof(sint16), 1, file);
        size = (int)r->x_size * r->y_size;
        r->floor = (FLOOR_INFO *)game_malloc(size * sizeof(FLOOR_INFO), ROOM_FLOOR);
        fread(r->floor, sizeof(FLOOR_INFO), size, file);

        fread(&r->ambient, sizeof(sint16), 1, file);
        fread(&r->num_lights, sizeof(sint16), 1, file);
        if (r->num_lights)
        {
            r->light = (LIGHT_INFO *)game_malloc(r->num_lights * sizeof(LIGHT_INFO), ROOM_LIGHTS);
            fread(r->light, sizeof(LIGHT_INFO), r->num_lights, file);
        }
        else
        {
            r->light = NULL;
        }

        fread(&r->num_meshes, sizeof(sint16), 1, file);
        if (r->num_meshes)
        {
            r->mesh = (MESH_INFO *)game_malloc(r->num_meshes * sizeof(MESH_INFO), ROOM_STATIC_MESH_INFOS);
            fread(r->mesh, sizeof(MESH_INFO), r->num_meshes, file);
        }
        else
            r->mesh = NULL;

        fread(&r->flipped_room, sizeof(sint16), 1, file);

        fread(&r->flags, sizeof(uint16), 1, file);

        r->bound_active = 0;
        r->left = (sint16)phd_winxmax;
        r->top = (sint16)phd_winymax;
        r->right = r->bottom = 0;
        r->item_number = NO_ITEM;
        r->fx_number = NO_ITEM;
    }

    fread(&size, sizeof(sint32), 1, file);
    floor_data = (sint16 *)game_malloc(size * sizeof(sint16), FLOOR_DATA);
    fread(floor_data, sizeof(sint16), size, file);

    return 1;
}

int LoadObjects(FILE *file)
{
    int i;
    int j;
    sint32 number;
    sint32 size;
    sint32 number_anims;

    fread(&size, sizeof(sint32), 1, file);
    mesh_base = (sint16 *)game_malloc(size * sizeof(sint16), MESHES);
    fread(mesh_base, sizeof(sint16), size, file);

    fread(&number, sizeof(sint32), 1, file);
    meshes = (sint16 **)game_malloc(number * sizeof(sint16 *), MESH_POINTERS);
    fread(meshes, sizeof(sint16 *), number, file);

    for (i = 0; i < number; i++)
        meshes[i] = mesh_base + (int)meshes[i] / 2;

    fread(&number_anims, sizeof(sint32), 1, file);
    anims = (ANIM_STRUCT *)game_malloc(number_anims * sizeof(ANIM_STRUCT), ANIMS);
    fread(anims, sizeof(ANIM_STRUCT), number_anims, file);

    fread(&number, sizeof(sint32), 1, file);
    changes = (CHANGE_STRUCT *)game_malloc(number * sizeof(CHANGE_STRUCT), STRUCTS);
    fread(changes, sizeof(CHANGE_STRUCT), number, file);

    fread(&number, sizeof(sint32), 1, file);
    ranges = (RANGE_STRUCT *)game_malloc(number * sizeof(RANGE_STRUCT), RANGES);
    fread(ranges, sizeof(RANGE_STRUCT), number, file);

    fread(&size, sizeof(sint32), 1, file);
    commands = (sint16 *)game_malloc(size * sizeof(sint16), COMMANDS);
    fread(commands, sizeof(sint16), size, file);

    fread(&size, sizeof(sint32), 1, file);
    bones = (sint32 *)game_malloc(size * sizeof(sint32), BONES);
    fread(bones, sizeof(sint32), size, file);

    fread(&size, sizeof(sint32), 1, file);
    frames = (sint16 *)game_malloc(size * sizeof(sint16), FRAMES);
    fread(frames, sizeof(sint16), size, file);

    for (i = 0; i < number_anims; i++)
        anims[i].frame_ptr = (sint16 *)((long)anims[i].frame_ptr + (long)frames);

    fread(&number, sizeof(sint32), 1, file);
    for (i = 0; i < number; i++)
    {
        fread(&j, sizeof(sint32), 1, file);
        fread(&objects[j].nmeshes, sizeof(sint16), 1, file);
        fread(&objects[j].mesh_index, sizeof(sint16), 1, file);
        fread(&objects[j].bone_index, sizeof(sint32), 1, file);
        fread(&size, sizeof(sint32), 1, file);
        objects[j].frame_base = (sint16 *)((long)size + (long)frames);
        fread(&objects[j].anim_index, sizeof(sint16), 1, file);
        objects[j].loaded = 1;
    }

    InitialiseObjects();

    fread(&number, sizeof(sint32), 1, file);
    for (i = 0; i < number; i++)
    {
        fread(&j, sizeof(sint32), 1, file);
        fread(&static_objects[j].mesh_number, sizeof(sint16), 1, file);
        fread(&static_objects[j].x_minp, sizeof(sint16), 6, file);
        fread(&static_objects[j].x_minc, sizeof(sint16), 6, file);
        fread(&static_objects[j].flags, sizeof(sint16), 1, file);
    }

    fread(&number, sizeof(sint32), 1, file);
    if (number > MAX_TEXTURES)
    {
        sprintf(exit_message, "Too many Textures in level");
        return 0;
    }
    fread(phdtextinfo, sizeof(PHDTEXTURESTRUCT), number, file);

    return 1;
}

int LoadSprites(FILE *file)
{
    int i, j;
    int number;

    fread(&number, sizeof(sint32), 1, file);
    fread(phdsprinfo, sizeof(PHDSPRITESTRUCT), number, file);

    fread(&number, sizeof(sint32), 1, file);

    for (i = 0; i < number; i++)
    {
        fread(&j, sizeof(sint32), 1, file);

        if (j < NUMBER_OBJECTS)
        {
            fread(&objects[j].nmeshes, sizeof(sint16), 1, file);
            fread(&objects[j].mesh_index, sizeof(sint16), 1, file);
            objects[j].loaded = 1;
        }
        else
        {
            j -= NUMBER_OBJECTS;
            fseek(file, sizeof(sint16), SEEK_CUR);
            fread(&static_objects[j].mesh_number, sizeof(sint16), 1, file);
        }
    }
    return 1;
}

int LoadItems(FILE *file)
{
    int i;
    sint32 number_items;
    ITEM_INFO *item;

    fread(&number_items, sizeof(sint32), 1, file);

    if (number_items == 0)
        return 1;

    if (number_items > NUMBER_ITEMS)
    {
        strcpy(exit_message, "LoadItems(): Too Many Items being Loaded!!");
        return 0;
    }

    items = (ITEM_INFO *)game_malloc(sizeof(ITEM_INFO) * NUMBER_ITEMS, ITEMS);
    if (items == NULL)
    {
        strcpy(exit_message, "LoadItems(): Unable to allocate memory for 'items'");
        return 0;
    }

    level_items = number_items;

    InitialiseItemArray(NUMBER_ITEMS);

    for (i = 0; i < number_items; i++)
    {
        item = &items[i];
        fread(&item->object_number, sizeof(sint16), 1, file);
        fread(&item->room_number, sizeof(sint16), 1, file);
        fread(&item->pos.x_pos, sizeof(sint32), 1, file);
        fread(&item->pos.y_pos, sizeof(sint32), 1, file);
        fread(&item->pos.z_pos, sizeof(sint32), 1, file);
        fread(&item->pos.y_rot, sizeof(sint16), 1, file);
        fread(&item->shade, sizeof(sint16), 1, file);
        fread(&item->flags, sizeof(sint16), 1, file);

        if (item->object_number < 0 || item->object_number >= NUMBER_OBJECTS)
        {
            sprintf(exit_message, "LoadItems(): Bad Object number (%d) on Item %d", item->object_number, i);
            S_ExitSystem(exit_message);
        }

        InitialiseItem(i);
    }

    return 1;
}

int LoadDepthQ(FILE *file)
{
    int i, j;

    fread(depthq_table, sizeof(uint8), 32 * 256, file);

    for (i = 0; i < 32; i++)
        depthq_table[i][0] = 0;

    for (i = 0; i < 32; i++)
    {
        for (j = 0; j < 256; j++)
            gouraud_table[j][i] = depthq_table[i][j];
    }
    return 1;
}

int LoadPalette(FILE *file)
{
    int i, col;

    fread(game_palette, sizeof(char), 256 * 3, file);

    game_palette[0] = game_palette[1] = game_palette[2] = 0;

    wet = 0;
    for (i = 0; i < 256 * 3; i += 3)
    {
        col = (int)(game_palette[i] * 2) / 3;
        water_palette[i] = col;
        col = (int)(game_palette[i + 1] * 2) / 3;
        water_palette[i + 1] = col;
        water_palette[i + 2] = game_palette[i + 2];
    }

    return 1;
}

int LoadCameras(FILE *file)
{
    fread(&number_cameras, sizeof(sint32), 1, file);
    if (number_cameras == 0)
        return 1;

    camera.fixed = (OBJECT_VECTOR *)game_malloc(sizeof(OBJECT_VECTOR) * number_cameras, CAMERAS);
    if (camera.fixed == NULL)
        return 0;
    fread(camera.fixed, sizeof(OBJECT_VECTOR), number_cameras, file);

    return 1;
}

int LoadSoundEffects(FILE *file)
{
    fread(&number_sound_effects, sizeof(sint32), 1, file);
    if (number_sound_effects == 0)
        return 1;

    sound_effects = (OBJECT_VECTOR *)game_malloc(sizeof(OBJECT_VECTOR) * number_sound_effects, SOUND_FX);
    if (sound_effects == NULL)
        return 0;
    fread(sound_effects, sizeof(OBJECT_VECTOR), number_sound_effects, file);

    return 1;
}

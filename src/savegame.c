#include "game.h"

extern sint16 *mesh_base;

SAVEGAME_INFO savegame;

int SGcount;
char *SGpoint;

int number_cameras = 0;

#define SAVE_CREATURE (1 << 7)

int LoadSaveGameInfo(void)
{
    return 1;
}

void InitialiseStartInfo(void)
{
    int i;

    if (savegame.bonus_flag == 0)
    {
        for (i = 0; i < NUMBER_OF_LEVELS; i++)
        {
            ModifyStartInfo(i);
            savegame.start[i].available = 0;
        }

        savegame.start[GYM].available = 1;
        savegame.start[LEVEL1].available = 1;
    }
}

void ModifyStartInfo(int level_number)
{
    START_INFO *start;

    start = &savegame.start[level_number];

    start->got_pistols = 1;
    start->gun_type = LG_PISTOLS;
    start->pistol_ammo = 1000;
    switch (level_number)
    {
    case GYM:
        start->available = 1;
        start->costume = 1;
        start->pistol_ammo = start->magnum_ammo = start->uzi_ammo = start->shotgun_ammo = 0;
        start->got_pistols = start->got_magnums = start->got_uzis = start->got_shotgun = 0;
        start->num_medis = start->num_big_medis = start->num_scions = 0;
        start->gun_type = LG_UNARMED;
        start->gun_status = LG_ARMLESS;
        break;

    case LEVEL1:
        start->costume = 0;
        start->available = 1;
        start->magnum_ammo = start->uzi_ammo = start->shotgun_ammo = 0;
        start->got_magnums = start->got_uzis = start->got_shotgun = 0;
        start->num_medis = start->num_big_medis = start->num_scions = 0;
        start->gun_status = LG_ARMLESS;
        break;

    case LEVEL10A:

        start->costume = 0;
        start->got_pistols = start->got_magnums = start->got_uzis = start->got_shotgun = 0;
        start->num_scions = 0;
        start->gun_type = LG_UNARMED;
        start->gun_status = LG_ARMLESS;
        break;
    }
    if (savegame.bonus_flag && level_number != GYM)
    {
        start->got_pistols = start->got_magnums = start->got_uzis = start->got_shotgun = 1;
        start->magnum_ammo = start->uzi_ammo = start->shotgun_ammo = 1234;
        start->gun_type = LG_UZIS;
    }
}

void CreateStartInfo(int level_number)
{
    START_INFO *start;

    start = &savegame.start[level_number];
    start->available = 1;
    start->costume = 0;

    if (Inv_RequestItem(GUN_ITEM))
    {
        start->pistol_ammo = 1000;
        start->got_pistols = 1;
    }
    else
    {
        start->pistol_ammo = 1000;
        start->got_pistols = 0;
    }

    if (Inv_RequestItem(MAGNUM_ITEM))
    {
        start->magnum_ammo = lara.magnums.ammo;
        start->got_magnums = 1;
    }
    else
    {
        start->magnum_ammo = Inv_RequestItem(MAG_AMMO_ITEM) * MAGNUM_AMMO_QTY;
        start->got_magnums = 0;
    }

    if (Inv_RequestItem(UZI_ITEM))
    {
        start->uzi_ammo = lara.uzis.ammo;
        start->got_uzis = 1;
    }
    else
    {
        start->uzi_ammo = Inv_RequestItem(UZI_AMMO_ITEM) * UZI_AMMO_QTY;
        start->got_uzis = 0;
    }

    if (Inv_RequestItem(SHOTGUN_ITEM))
    {
        start->shotgun_ammo = lara.shotgun.ammo;
        start->got_shotgun = 1;
    }
    else
    {
        start->shotgun_ammo = Inv_RequestItem(SG_AMMO_ITEM) * SHOTGUN_AMMO_QTY;
        start->got_shotgun = 0;
    }

    start->num_medis = Inv_RequestItem(MEDI_ITEM);
    start->num_big_medis = Inv_RequestItem(BIGMEDI_ITEM);
    start->num_scions = Inv_RequestItem(SCION_ITEM);

    start->gun_type = (sint8)lara.gun_type;
    if (lara.gun_status == LG_READY)
        start->gun_status = LG_READY;
    else
        start->gun_status = LG_ARMLESS;
}

void CreateSaveGameInfo(void)
{
    int i;
    OBJECT_INFO *obj;
    ITEM_INFO *item;
    sint16 flags;
    char tflag;
    CREATURE_INFO *creature;

    savegame.current_level = (sint16)CurrentLevel;

    CreateStartInfo(CURRENT);

    savegame.num_pickup1 = Inv_RequestItem(PICKUP_ITEM1);
    savegame.num_pickup2 = Inv_RequestItem(PICKUP_ITEM2);
    savegame.num_puzzle1 = Inv_RequestItem(PUZZLE_ITEM1);
    savegame.num_puzzle2 = Inv_RequestItem(PUZZLE_ITEM2);
    savegame.num_puzzle3 = Inv_RequestItem(PUZZLE_ITEM3);
    savegame.num_puzzle4 = Inv_RequestItem(PUZZLE_ITEM4);
    savegame.num_key1 = Inv_RequestItem(KEY_ITEM1);
    savegame.num_key2 = Inv_RequestItem(KEY_ITEM2);
    savegame.num_key3 = Inv_RequestItem(KEY_ITEM3);
    savegame.num_key4 = Inv_RequestItem(KEY_ITEM4);
    savegame.num_leadbar = Inv_RequestItem(LEADBAR_ITEM);

    ResetSG();

    for (i = 0; i < MAX_SAVEGAME_BUFFER; i++)
        savegame.buffer[i] = 0;

    WriteSG(&flip_status, sizeof(int));

    for (i = 0; i < MAX_FLIPMAPS; i++)
    {
        tflag = (flipmap[i] >> 8);
        WriteSG(&tflag, sizeof(char));
    }

    for (i = 0; i < number_cameras; i++)
        WriteSG(&camera.fixed[i].flags, sizeof(sint16));

    for (i = 0, item = items; i < level_items; i++, item++)
    {
        obj = &objects[item->object_number];
        if (obj->save_position)
        {
            WriteSG(&item->pos, sizeof(PHD_3DPOS));
            WriteSG(&item->room_number, sizeof(sint16));
            WriteSG(&item->speed, sizeof(sint16));
            WriteSG(&item->fallspeed, sizeof(sint16));
        }

        if (obj->save_anim)
        {
            WriteSG(&item->current_anim_state, sizeof(sint16));
            WriteSG(&item->goal_anim_state, sizeof(sint16));
            WriteSG(&item->required_anim_state, sizeof(sint16));
            WriteSG(&item->anim_number, sizeof(sint16));
            WriteSG(&item->frame_number, sizeof(sint16));
        }

        if (obj->save_hitpoints)
            WriteSG(&item->hit_points, sizeof(sint16));

        if (obj->save_flags)
        {
            flags = item->flags + item->active + (item->status << 1) + (item->gravity_status << 3) + (item->collidable << 4);
            WriteSG(&flags, sizeof(sint16));

            WriteSG(&item->timer, sizeof(sint16));
            if (obj->intelligent)
            {
                creature = (CREATURE_INFO *)item->data;
                WriteSG(&creature->head_rotation, sizeof(sint16));
                WriteSG(&creature->neck_rotation, sizeof(sint16));
                WriteSG(&creature->maximum_turn, sizeof(sint16));
                WriteSG(&creature->flags, sizeof(sint16));
                WriteSG(&creature->mood, sizeof(MOOD_TYPE));
            }
        }
    }

    for (i = 0; i < 15; i++)
        lara.mesh_ptrs[i] = (sint16 *)((long)lara.mesh_ptrs[i] - (long)mesh_base);
    lara.left_arm.frame_base = (sint16 *)((long)lara.left_arm.frame_base - (long)frames);
    lara.right_arm.frame_base = (sint16 *)((long)lara.right_arm.frame_base - (long)frames);

    WriteSG(&lara, sizeof(LARA_INFO));

    for (i = 0; i < 15; i++)
        lara.mesh_ptrs[i] = (sint16 *)((long)lara.mesh_ptrs[i] + (long)mesh_base);
    lara.left_arm.frame_base = (sint16 *)((long)lara.left_arm.frame_base + (long)frames);
    lara.right_arm.frame_base = (sint16 *)((long)lara.right_arm.frame_base + (long)frames);

    WriteSG(&flipeffect, sizeof(int));
    WriteSG(&fliptimer, sizeof(int));
}

void ResetSG()
{
    SGcount = 0;
    SGpoint = savegame.buffer;
}

void WriteSG(void *pointer, int size)
{
    char *data;

    SGcount += size;
    if (SGcount >= MAX_SAVEGAME_BUFFER)
        S_ExitSystem("FATAL: Savegame is too big to fit in buffer");

    data = (char *)pointer;

    for (; size > 0; size--)
        *(SGpoint++) = *(data++);
}

void ReadSG(void *pointer, int size)
{
    char *data;

    SGcount += size;

    data = (char *)pointer;

    for (; size > 0; size--)
        *(data++) = *(SGpoint++);
}

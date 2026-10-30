#include "game.h"

extern SG_COL req_sel_gour2[];
extern char sav_mess3[];
extern char sav_mess4[];
extern char sav_mess8[];

extern sint16 *mesh_base;

void MovableBlock(sint16 item_number);
void RollingBlock(sint16 item_number);
void PodControl(sint16 item_number);
void PickUpCollision(sint16 item_num, ITEM_INFO *laraitem, COLL_INFO *coll);
void PuzzleHoleCollision(sint16 item_num, ITEM_INFO *laraitem, COLL_INFO *coll);
void ReadSG(void *pointer, int size);
void KillItem(sint16 item_num);
void RemoveDrawnItem(sint16 item_num);
sint16 SpawnItem(ITEM_INFO *item, int object_number);
void InitialiseLaraInventory(int level_number);

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

void ExtractSaveGameInfo(void)
{
    int i;
    OBJECT_INFO *obj;
    ITEM_INFO *item;
    FLOOR_INFO *floor;
    sint16 room_number;
    char tflag;
    CREATURE_INFO *creature;
    BOX_NODE *node;

    InitialiseLaraInventory(CURRENT);

    for (i = savegame.num_pickup1; i > 0; i--)
        Inv_AddItem(PICKUP_ITEM1);

    for (i = savegame.num_pickup2; i > 0; i--)
        Inv_AddItem(PICKUP_ITEM2);

    for (i = savegame.num_puzzle1; i > 0; i--)
        Inv_AddItem(PUZZLE_ITEM1);

    for (i = savegame.num_puzzle2; i > 0; i--)
        Inv_AddItem(PUZZLE_ITEM2);

    for (i = savegame.num_puzzle3; i > 0; i--)
        Inv_AddItem(PUZZLE_ITEM3);

    for (i = savegame.num_puzzle4; i > 0; i--)
        Inv_AddItem(PUZZLE_ITEM4);

    for (i = savegame.num_key1; i > 0; i--)
        Inv_AddItem(KEY_ITEM1);

    for (i = savegame.num_key2; i > 0; i--)
        Inv_AddItem(KEY_ITEM2);

    for (i = savegame.num_key3; i > 0; i--)
        Inv_AddItem(KEY_ITEM3);

    for (i = savegame.num_key4; i > 0; i--)
        Inv_AddItem(KEY_ITEM4);

    for (i = savegame.num_leadbar; i > 0; i--)
        Inv_AddItem(LEADBAR_ITEM);

    ResetSG();

    ReadSG(&i, sizeof(int));
    if (i)
        FlipMap();

    for (i = 0; i < MAX_FLIPMAPS; i++)
    {
        ReadSG(&tflag, sizeof(char));
        flipmap[i] = (sint16)tflag << 8;
    }

    for (i = 0; i < number_cameras; i++)
        ReadSG(&camera.fixed[i].flags, sizeof(sint16));

    for (i = 0, item = items; i < level_items; i++, item++)
    {
        obj = &objects[item->object_number];

        if (obj->control == MovableBlock)
            AlterFloorHeight(item, 1024);
        if (obj->control == RollingBlock)
            AlterFloorHeight(item, 2048);

        if (obj->save_position)
        {
            ReadSG(&item->pos, sizeof(PHD_3DPOS));
            ReadSG(&room_number, sizeof(sint16));
            ReadSG(&item->speed, sizeof(sint16));
            ReadSG(&item->fallspeed, sizeof(sint16));

            if (item->room_number != room_number)
                ItemNewRoom(i, room_number);

            if (obj->shadow_size)
            {
                floor = GetFloor(item->pos.x_pos, item->pos.y_pos, item->pos.z_pos, &room_number);
                item->floor = GetHeight(floor, item->pos.x_pos, item->pos.y_pos, item->pos.z_pos);
            }
        }

        if (obj->save_anim)
        {
            ReadSG(&item->current_anim_state, sizeof(sint16));
            ReadSG(&item->goal_anim_state, sizeof(sint16));
            ReadSG(&item->required_anim_state, sizeof(sint16));
            ReadSG(&item->anim_number, sizeof(sint16));
            ReadSG(&item->frame_number, sizeof(sint16));
        }

        if (obj->save_hitpoints)
            ReadSG(&item->hit_points, sizeof(sint16));

        if (obj->save_flags)
        {
            ReadSG(&item->flags, sizeof(sint16));
            ReadSG(&item->timer, sizeof(sint16));

            if (obj->intelligent)
            {
                creature = (CREATURE_INFO *)item->data;
                ReadSG(&creature->head_rotation, sizeof(sint16));
                ReadSG(&creature->neck_rotation, sizeof(sint16));
                ReadSG(&creature->maximum_turn, sizeof(sint16));
                ReadSG(&creature->flags, sizeof(sint16));
                ReadSG(&creature->mood, sizeof(MOOD_TYPE));
            }

            if (item->flags & KILLED_ITEM)
            {
                KillItem(i);
                item->status = DEACTIVATED;
            }
            else
            {
                if ((item->flags & 1) && !item->active)
                {
                    AddActiveItem(i);
                    if (obj->intelligent)
                        EnableBaddieAI(i, 1);
                }
                item->status = (item->flags & 6) >> 1;
                if (item->flags & 8)
                    item->gravity_status = 1;
                if (!(item->flags & 0x10))
                    item->collidable = 0;
            }

            item->flags &= 0xff00;

            if (obj->collision == PuzzleHoleCollision && (item->status == DEACTIVATED || item->status == ACTIVE))
                item->object_number += PUZZLE_DONE1 - PUZZLE_HOLE1;

            if (obj->control == PodControl && item->status == DEACTIVATED)
            {
                item->mesh_bits = 0x1ff;
                item->collidable = 0;
            }

            if (obj->collision == PickUpCollision && item->status == DEACTIVATED)
                RemoveDrawnItem(i);
        }

        if (obj->control == MovableBlock && item->status == NOT_ACTIVE)
            AlterFloorHeight(item, -1024);
        if (obj->control == RollingBlock && item->current_anim_state != 2)
            AlterFloorHeight(item, -2048);

        if (item->object_number == PIERRE && item->hit_points <= 0 && (item->flags & ONESHOT))
        {
            if (Inv_RequestItem(SCION_ITEM) == 1)
            {
                SpawnItem(item, MAGNUM_ITEM);
                SpawnItem(item, SCION_ITEM2);
                SpawnItem(item, KEY_ITEM1);
            }
            cd_flags[55] |= ONESHOT;
        }
        if (item->object_number == MERCENARY1 && item->hit_points <= 0 && Inv_RequestItem(UZI_ITEM) == 0)
            SpawnItem(item, UZI_ITEM);
        if (item->object_number == MERCENARY2 && item->hit_points <= 0)
        {
            if (Inv_RequestItem(MAGNUM_ITEM) == 0)
                SpawnItem(item, MAGNUM_ITEM);
            cd_flags[52] |= ONESHOT;
        }
        if (item->object_number == MERCENARY3 && item->hit_points <= 0)
        {
            if (Inv_RequestItem(SHOTGUN_ITEM) == 0)
                SpawnItem(item, SHOTGUN_ITEM);
            cd_flags[51] |= ONESHOT;
        }
        if (item->object_number == LARSON && item->hit_points <= 0)
            cd_flags[53] |= ONESHOT;
    }

    node = lara.LOT.node;

    ReadSG(&lara, sizeof(LARA_INFO));

    lara.LOT.node = node;
    lara.LOT.target_box = NO_BOX;

    lara.hit_effect = NULL;
    for (i = 0; i < 15; i++)
        lara.mesh_ptrs[i] = (sint16 *)((long)lara.mesh_ptrs[i] + (long)mesh_base);
    lara.target = NULL;
    lara.left_arm.frame_base = (sint16 *)((long)lara.left_arm.frame_base + (long)frames);
    lara.right_arm.frame_base = (sint16 *)((long)lara.right_arm.frame_base + (long)frames);

    ReadSG(&flipeffect, sizeof(int));
    ReadSG(&fliptimer, sizeof(int));
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

int ConfirmSave(int fade)
{
    int nframes;
    int status = 1;
    TEXTSTRING *text[3];

    T_InitPrint();
    if (fade)
        S_FadeInInventory(1);
    text[0] = T_Print(0, 0, 0, sav_mess8);
    T_CentreH(text[0], 1);
    T_CentreV(text[0], 1);

    text[1] = T_Print(-26, 20, 0, sav_mess3);
    T_CentreH(text[1], 1);
    T_CentreV(text[1], 1);
    T_AddOutline(text[1], 1, C_ORANGE, req_sel_gour2, NULL);

    text[2] = T_Print(30, 20, 0, sav_mess4);
    T_CentreH(text[2], 1);
    T_CentreV(text[2], 1);

    while (input & IN_SELECT)
        S_UpdateInput();

    do
    {
        S_UpdateInput();
        S_InitialisePolyList();
        S_CopyBufferToScreen();
        if (input & IN_LEFT && status == 0)
        {
            T_AddOutline(text[1], 1, C_ORANGE, req_sel_gour2, NULL);
            T_RemoveOutline(text[2]);
            status = 1;
        }
        if (input & IN_RIGHT && status == 1)
        {
            T_RemoveOutline(text[1]);
            T_AddOutline(text[2], 1, C_ORANGE, req_sel_gour2, NULL);
            status = 0;
        }

        T_DrawText();
        S_OutputPolyList();
        nframes = S_DumpScreen();
    } while (!(input & IN_SELECT));

    input = 0;

    while (input & IN_SELECT)
        S_UpdateInput();

    T_RemovePrint(text[0]);
    T_RemovePrint(text[1]);
    T_RemovePrint(text[2]);

    return status;
}

void CompleteSave(int fade)
{
    if (fade)
        S_FadeOutInventory(1);
}

void CreateCheckSum(void)
{
    int i;
    signed char *ptr, csum;

    csum = 0;
    savegame.checksum = 0;
    ptr = (signed char *)&savegame;
    for (i = 0; i < sizeof(SAVEGAME_INFO); i++, ptr++)
        csum += *ptr;
    savegame.checksum = -csum;
}

int CheckSumValid(SAVEGAME_INFO *buffer)
{
    int i;
    signed char *ptr, csum;

    csum = 0;
    ptr = (signed char *)buffer;
    for (i = 0; i < sizeof(SAVEGAME_INFO); i++, ptr++)
        csum += *ptr;
    if (!csum)
        return 1;

    return 0;
}

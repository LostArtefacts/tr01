#include "game.h"

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

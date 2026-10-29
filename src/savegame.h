#ifndef SAVEGAME_H
#define SAVEGAME_H

#include "types.h"

#define MAX_SAVEGAME_BUFFER (10 * 1024)

typedef struct
{
    uint16 pistol_ammo;
    uint16 magnum_ammo;
    uint16 uzi_ammo;
    uint16 shotgun_ammo;
    uint8 num_medis;
    uint8 num_big_medis;
    uint8 num_scions;
    sint8 gun_status;
    sint8 gun_type;
    uint16 available:1;
    uint16 got_pistols:1;
    uint16 got_magnums:1;
    uint16 got_uzis:1;
    uint16 got_shotgun:1;
    uint16 costume:1;
} START_INFO;

typedef struct
{
    START_INFO start[NUMBER_OF_LEVELS];
    uint32 timer;
    uint32 kills;
    uint16 secrets;
    sint16 current_level;
    uint8 pickups, bonus_flag;
    uint8 num_pickup1;
    uint8 num_pickup2;
    uint8 num_puzzle1;
    uint8 num_puzzle2;
    uint8 num_puzzle3;
    uint8 num_puzzle4;
    uint8 num_key1;
    uint8 num_key2;
    uint8 num_key3;
    uint8 num_key4;
    uint8 num_leadbar;
    sint8 checksum;
    char buffer[MAX_SAVEGAME_BUFFER];
} SAVEGAME_INFO;

extern SAVEGAME_INFO savegame;

void CreateSaveGameInfo(void);

#endif

#include "game.h"
#include "invdata.h"

extern char compass_name[];
extern char pistols_name[];
extern char shotgun_name[];
extern char magnum_name[];
extern char uzi_name[];
extern char gun_ammo_name[];
extern char sg_ammo_name[];
extern char mag_ammo_name[];
extern char uzi_ammo_name[];
extern char explosive_name[];
extern char medi_name[];
extern char bigmedi_name[];
extern char leadbar_name[];
extern char pickup_name[];
extern char scion_name[];
extern char puzzle_name[];
extern char key_name[];
extern char game_name[];
extern char detail_name[];
extern char sound_name[];
extern char control_name[];
extern char gamma_name[];
extern char gym_name[];
extern char load_game_heading[];
extern char save_game_heading[];
extern char Save_Game_Strings[NUMBER_OF_LEVELS][LEVLEN];

sint32 inv_nframes = 2;

SG_COL inv_colours[C_NUMBER_COLOURS];

SG_COL req_bgnd_moreup[] = {
    8192, 8192, 6144, 8192, 8192, 8192, 8192, 6144,
    6144, 8192, 6144, 4112, 8192, 6144, 4112, 6144
};

SG_COL req_bgnd_moredown[] = {
    6144, 4112, 6144, 8192, 4112, 6144, 8192, 6144,
    6144, 8192, 8192, 8192, 8192, 6144, 8192, 8192
};

SG_COL req_bgnd_gour1[] = {
    8192, 8192, 7168, 8192, 8192, 8192, 8192, 7168,
    7168, 8192, 8192, 8192, 8192, 7168, 8192, 8192
};

SG_COL req_bgnd_gour2[] = {
    6656, 6144, 7680, 8192, 8192, 7680, 7168, 7168,
    6656
};

SG_COL req_main_gour1[] = {
    8192, 8192, 6144, 8192, 8192, 8192, 8192, 6144,
    6144, 8192, 8192, 8192, 8192, 6144, 8192, 8192
};

SG_COL req_main_gour2[] = {
    8192, 8192, 8192, 8192, 8192, 8192, 8192, 8192,
    8192
};

SG_COL req_sel_gour1[] = {
    8192, 8192, 5120, 8192, 8192, 8192, 8192, 5120,
    5120, 8192, 8192, 8192, 8192, 5120, 8192, 8192
};

SG_COL req_sel_gour2[] = {
    8192, 4112, 8192, 5120, 8192, 4112, 8192, 5120,
    8192
};

SG_COL req_unsel_gour1[] = {
    8192, 8192, 6656, 8192, 8192, 8192, 8192, 6656,
    6656, 8192, 8192, 8192, 8192, 6656, 8192, 8192
};

SG_COL req_unsel_gour2[] = {
    8192, 7232, 8192, 7232, 8192, 7232, 8192, 7232,
    8192
};

SG_COL is_gour1[] = {
    4112, 5632
};

SG_COL is_gour2[] = {
    6656, 7680
};

SG_COL is_gour3[] = {
    5632, 6144, 6656, 6144
};

SG_COL is_gour4[] = {
    8192, 4112, 4112, 8192
};

SG_COL is_gour5[] = {
    8192, 4112, 4112, 8192
};

SG_COL is_gour6[] = {
    8192, 4112, 4112, 8192
};

SG_COL is_gour7[] = {
    8192, 4112, 4112, 8192
};

SG_COL is_gour8[] = {
    4624, 6144
};

SG_COL is_gour9[] = {
    7168, 8192
};

SG_COL is_gour10[] = {
    6144, 6656, 7168, 6656
};

SG_COL is_gour11[] = {
    8192, 6144, 6144, 8192
};

SG_COL is_gour12[] = {
    8192, 6144, 6144, 8192
};

INVENTORY_SPRITE is_gamma_level[] = {
    {SHAPE_LINE, -66, -80, 32, 132, 0, is_gour1, C_GREY},
    {SHAPE_LINE, -66, -65, 32, 132, 0, is_gour2, C_GREY},
    {SHAPE_LINE, -66, -80, 32, 0, 16, is_gour1, C_GREY},
    {SHAPE_LINE, 66, -80, 32, 0, 16, is_gour2, C_GREY},
    {SHAPE_BOX, -65, -79, 32, 130, 14, is_gour3, C_GREY},
    {SHAPE_BOX, -64, -78, 32, 129, 12, is_gour3, C_GREY},
    {SHAPE_FBOX, -63, -77, 32, 126, 10, is_gour4, C_RED},
    {SHAPE_FBOX, -63, -77, 33, 127, 10, 0, C_BLACK},
    {SHAPE_LINE, 1, -77, 31, 0, 10, 0, C_WHITE},
    {0}
};

INVENTORY_SPRITE *is_gamma_list[] = {
    is_gamma_level,
    NULL
};

INVENTORY_SPRITE is_detail_level[] = {
    {SHAPE_LINE, -66, -72, 32, 132, 0, is_gour1, C_GREY},
    {SHAPE_LINE, -66, -56, 32, 132, 0, is_gour2, C_GREY},
    {SHAPE_LINE, -66, -72, 32, 0, 16, is_gour1, C_GREY},
    {SHAPE_LINE, 66, -72, 32, 0, 16, is_gour2, C_GREY},
    {SHAPE_BOX, -65, -71, 32, 130, 14, is_gour3, C_GREY},
    {SHAPE_BOX, -64, -70, 32, 128, 12, is_gour3, C_GREY},
    {SHAPE_FBOX, -63, -69, 32, 126, 10, is_gour7, C_MAGENTA},
    {SHAPE_FBOX, -63, -69, 33, 126, 10, 0, C_BLACK},
    {SHAPE_LINE, 1, -69, 31, 0, 10, 0, C_WHITE},
    {0}
};

INVENTORY_SPRITE *is_detail_list[] = {
    is_detail_level,
    NULL
};

INVENTORY_SPRITE is_sound_muslevel[] = {
    {SHAPE_LINE, -66, -80, 32, 132, 0, is_gour1, C_GREY},
    {SHAPE_LINE, -66, -65, 32, 132, 0, is_gour2, C_GREY},
    {SHAPE_LINE, -66, -80, 32, 0, 16, is_gour1, C_GREY},
    {SHAPE_LINE, 66, -80, 32, 0, 16, is_gour2, C_GREY},
    {SHAPE_BOX, -65, -79, 32, 131, 14, is_gour3, C_GREY},
    {SHAPE_BOX, -64, -78, 32, 129, 12, is_gour3, C_GREY},
    {SHAPE_FBOX, -63, -77, 32, 126, 10, is_gour5, C_RED},
    {SHAPE_FBOX, -63, -77, 33, 127, 10, 0, C_BLACK},
    {0}
};

INVENTORY_SPRITE is_sound_sfxlevel[] = {
    {SHAPE_LINE, -66, -56, 32, 132, 0, is_gour1, C_GREY},
    {SHAPE_LINE, -66, -41, 32, 132, 0, is_gour2, C_GREY},
    {SHAPE_LINE, -66, -56, 32, 0, 16, is_gour1, C_GREY},
    {SHAPE_LINE, 66, -56, 32, 0, 16, is_gour2, C_GREY},
    {SHAPE_BOX, -65, -55, 32, 131, 14, is_gour3, C_GREY},
    {SHAPE_BOX, -64, -54, 32, 129, 12, is_gour3, C_GREY},
    {SHAPE_FBOX, -63, -53, 32, 126, 10, is_gour6, C_BLUE},
    {SHAPE_FBOX, -63, -53, 33, 127, 10, 0, C_BLACK},
    {0}
};

INVENTORY_SPRITE is_sound_muslevellow[] = {
    {SHAPE_LINE, -66, -80, 32, 132, 0, is_gour8, C_GREY},
    {SHAPE_LINE, -66, -65, 32, 132, 0, is_gour9, C_GREY},
    {SHAPE_LINE, -66, -80, 32, 0, 16, is_gour8, C_GREY},
    {SHAPE_LINE, 66, -80, 32, 0, 16, is_gour9, C_GREY},
    {SHAPE_BOX, -65, -79, 32, 131, 14, is_gour10, C_GREY},
    {SHAPE_BOX, -64, -78, 32, 129, 12, is_gour10, C_GREY},
    {SHAPE_FBOX, -63, -77, 32, 126, 10, is_gour11, C_RED},
    {SHAPE_FBOX, -63, -77, 33, 127, 10, 0, C_BLACK},
    {0}
};

INVENTORY_SPRITE is_sound_sfxlevellow[] = {
    {SHAPE_LINE, -66, -56, 32, 132, 0, is_gour8, C_GREY},
    {SHAPE_LINE, -66, -41, 32, 132, 0, is_gour9, C_GREY},
    {SHAPE_LINE, -66, -56, 32, 0, 16, is_gour8, C_GREY},
    {SHAPE_LINE, 66, -56, 32, 0, 16, is_gour9, C_GREY},
    {SHAPE_BOX, -65, -55, 32, 131, 14, is_gour10, C_GREY},
    {SHAPE_BOX, -64, -54, 32, 129, 12, is_gour10, C_GREY},
    {SHAPE_FBOX, -63, -53, 32, 126, 10, is_gour12, C_BLUE},
    {SHAPE_FBOX, -63, -53, 33, 127, 10, 0, C_BLACK},
    {0}
};

INVENTORY_SPRITE is_sound_names[] = {
    {SHAPE_SPRITE, -75, -63, 32, 0x80000, 0x80000, 0, 101},
    {SHAPE_SPRITE, -75, -40, 32, 0x80000, 0x80000, 0, 102},
    {0}
};

INVENTORY_SPRITE *is_sound_list[] = {
    is_sound_names,
    is_sound_muslevel,
    is_sound_sfxlevel,
    NULL
};

INVENTORY_ITEM icompass_option = {compass_name, MAP_OPTION, 25, 0, 0, 10, 1, 1, 0, 4352, 0, -8192, 0, 0, 0, 0, 0, 456, 0, 5, 5, 0, NULL};

INVENTORY_ITEM igun_option = {pistols_name, GUN_OPTION, 12, 0, 0, 11, 1, 1, 0, 3200, 0, -3808, 0, 0, 0, 0, 0, 296, 0, 0xffffffff, 0xffffffff, 1, NULL};

INVENTORY_ITEM ishotgun_option = {shotgun_name, SHOTGUN_OPTION, 13, 0, 0, 12, 1, 1, 0, 3200, 0, 0, 0, -8192, 0, 0, 0, 296, 0, 0xffffffff, 0xffffffff, 2, NULL};

INVENTORY_ITEM imagnum_option = {magnum_name, MAGNUM_OPTION, 12, 0, 0, 11, 1, 1, 0, 3200, 0, -3808, 0, 0, 0, 0, 0, 296, 0, 0xffffffff, 0xffffffff, 3, NULL};

INVENTORY_ITEM iuzi_option = {uzi_name, UZI_OPTION, 13, 0, 0, 12, 1, 1, 0, 3200, 0, -3808, 0, 0, 0, 0, 0, 296, 0, 0xffffffff, 0xffffffff, 4, NULL};

INVENTORY_ITEM igunammo_option = {gun_ammo_name, GUN_AMMO_OPTION, 1, 0, 0, 0, 1, 1, 0, 3200, 0, -3808, 0, 0, 0, 0, 0, 296, 0, 0xffffffff, 0xffffffff, 1, NULL};

INVENTORY_ITEM isgunammo_option = {sg_ammo_name, SG_AMMO_OPTION, 1, 0, 0, 0, 1, 1, 0, 3200, 0, -3808, 0, 0, 0, 0, 0, 296, 0, 0xffffffff, 0xffffffff, 2, NULL};

INVENTORY_ITEM imagammo_option = {mag_ammo_name, MAG_AMMO_OPTION, 1, 0, 0, 0, 1, 1, 0, 3200, 0, -3808, 0, 0, 0, 0, 0, 296, 0, 0xffffffff, 0xffffffff, 3, NULL};

INVENTORY_ITEM iuziammo_option = {uzi_ammo_name, UZI_AMMO_OPTION, 1, 0, 0, 0, 1, 1, 0, 3200, 0, -3808, 0, 0, 0, 0, 0, 296, 0, 0xffffffff, 0xffffffff, 4, NULL};

INVENTORY_ITEM iexplosiv_option = {explosive_name, EXPLOSIVE_OPTION, 15, 0, 0, 14, 1, 1, 0, 5024, 0, 0, 0, 0, 0, 0, 0, 368, 0, 0xffffffff, 0xffffffff, 5, NULL};

INVENTORY_ITEM imedi_option = {medi_name, MEDI_OPTION, 26, 0, 0, 25, 1, 1, 0, 4032, 0, -7296, 0, -4096, 0, 0, 0, 216, 0, 0xffffffff, 0xffffffff, 7, NULL};

INVENTORY_ITEM ibigmedi_option = {bigmedi_name, BIGMEDI_OPTION, 20, 0, 0, 19, 1, 1, 0, 3616, 0, -8160, 0, -4096, 0, 0, 0, 352, 0, 0xffffffff, 0xffffffff, 6, NULL};

INVENTORY_ITEM ileadbar_option = {leadbar_name, LEADBAR_OPTION, 1, 0, 0, 0, 1, 1, 0, 3616, 0, -8160, 0, -4096, 0, 0, 0, 352, 0, 0xffffffff, 0xffffffff, 100, NULL};

INVENTORY_ITEM ipickup1_option = {pickup_name, PICKUP_OPTION1, 1, 0, 0, 0, 1, 1, 0, 7200, 0, -4352, 0, 0, 0, 0, 0, 256, 0, 0xffffffff, 0xffffffff, 111, NULL};

INVENTORY_ITEM ipickup2_option = {pickup_name, PICKUP_OPTION2, 1, 0, 0, 0, 1, 1, 0, 7200, 0, -4352, 0, 0, 0, 0, 0, 256, 0, 0xffffffff, 0xffffffff, 110, NULL};

INVENTORY_ITEM iscion_option = {scion_name, SCION_OPTION, 1, 0, 0, 0, 1, 1, 0, 7200, 0, -4352, 0, 0, 0, 0, 0, 256, 0, 0xffffffff, 0xffffffff, 109, NULL};

INVENTORY_ITEM ipuzzle1_option = {puzzle_name, PUZZLE_OPTION1, 1, 0, 0, 0, 1, 1, 0, 7200, 0, -4352, 0, 0, 0, 0, 0, 256, 0, 0xffffffff, 0xffffffff, 108, NULL};

INVENTORY_ITEM ipuzzle2_option = {puzzle_name, PUZZLE_OPTION2, 1, 0, 0, 0, 1, 1, 0, 7200, 0, -4352, 0, 0, 0, 0, 0, 256, 0, 0xffffffff, 0xffffffff, 107, NULL};

INVENTORY_ITEM ipuzzle3_option = {puzzle_name, PUZZLE_OPTION3, 1, 0, 0, 0, 1, 1, 0, 7200, 0, -4352, 0, 0, 0, 0, 0, 256, 0, 0xffffffff, 0xffffffff, 106, NULL};

INVENTORY_ITEM ipuzzle4_option = {puzzle_name, PUZZLE_OPTION4, 1, 0, 0, 0, 1, 1, 0, 7200, 0, -4352, 0, 0, 0, 0, 0, 256, 0, 0xffffffff, 0xffffffff, 105, NULL};

INVENTORY_ITEM ikey1_option = {key_name, KEY_OPTION1, 1, 0, 0, 0, 1, 1, 0, 7200, 0, -4352, 0, 0, 0, 0, 0, 256, 0, 0xffffffff, 0xffffffff, 101, NULL};

INVENTORY_ITEM ikey2_option = {key_name, KEY_OPTION2, 1, 0, 0, 0, 1, 1, 0, 7200, 0, -4352, 0, 0, 0, 0, 0, 256, 0, 0xffffffff, 0xffffffff, 102, NULL};

INVENTORY_ITEM ikey3_option = {key_name, KEY_OPTION3, 1, 0, 0, 0, 1, 1, 0, 7200, 0, -4352, 0, 0, 0, 0, 0, 256, 0, 0xffffffff, 0xffffffff, 103, NULL};

INVENTORY_ITEM ikey4_option = {key_name, KEY_OPTION4, 1, 0, 0, 0, 1, 1, 0, 7200, 0, -4352, 0, 0, 0, 0, 0, 256, 0, 0xffffffff, 0xffffffff, 104, NULL};

INVENTORY_ITEM ipassport_option = {game_name, PASSPORT_CLOSED, 30, 0, 0, 14, 1, 1, 0, 4640, 0, -4320, 0, 0, 0, 0, 0, 384, 0, 19, 19, 0, NULL};

INVENTORY_ITEM idetail_option = {detail_name, DETAIL_OPTION, 1, 0, 0, 0, 1, 1, 0, 4224, 0, -6720, 0, 0, 0, 0, 0, 424, 0, 0xffffffff, 0xffffffff, 1, NULL};

INVENTORY_ITEM isound_option = {sound_name, SOUND_OPTION, 1, 0, 0, 0, 1, 1, 0, 4832, 0, -2336, 0, 0, 0, 0, 0, 368, 0, 0xffffffff, 0xffffffff, 2, NULL};

INVENTORY_ITEM icontrol_option = {control_name, CONTROL_OPTION, 1, 0, 0, 0, 1, 1, 0, 5504, 0, 1536, 0, 0, 0, 0, 0, 352, 0, 0xffffffff, 0xffffffff, 3, NULL};

INVENTORY_ITEM igamma_option = {gamma_name, GAMMA_OPTION, 1, 0, 0, 0, 1, 1, 0, 3904, 0, 0, 0, 0, 0, 0, 0, 440, 0, 0xffffffff, 0xffffffff, 4, NULL};

INVENTORY_ITEM iphoto_option = {gym_name, PHOTO_OPTION, 1, 0, 0, 0, 1, 1, 0, 4640, 0, -4320, 0, 0, 0, 0, 0, 384, 0, 0xffffffff, 0xffffffff, 5, NULL};

sint16 inv_main_objects = 1;

sint16 inv_main_current = 0;

sint16 inv_main_select = -1;

sint16 inv_main_qtys[23] = {1, 1, 1, 1, 1, 1, 1, 1, 1};

INVENTORY_ITEM *inv_main_list[23] = {
    &icompass_option,
    &igun_option,
    &ishotgun_option,
    &imagnum_option,
    &iuzi_option,
    &iexplosiv_option,
    &ibigmedi_option,
    &imedi_option
};

sint16 inv_keys_objects = 0;

sint16 inv_keys_current = 0;

sint16 inv_keys_select = -1;

sint16 inv_keys_qtys[23] = {1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1};

INVENTORY_ITEM *inv_keys_list[23] = {
    &ileadbar_option,
    &ipuzzle1_option,
    &ipuzzle2_option,
    &ipuzzle3_option,
    &ipuzzle4_option,
    &ikey1_option,
    &ikey2_option,
    &ikey3_option,
    &ikey4_option,
    &ipickup1_option,
    &ipickup2_option
};

sint16 inv_option_objects = 5;

sint16 inv_option_current = 0;

INVENTORY_ITEM *inv_option_list[] = {
    &ipassport_option,
    &icontrol_option,
    &idetail_option,
    &isound_option,
    &iphoto_option
};

TEXTSTRING *Inv_itemText[IT_NUMBEROF] = {NULL};

TEXTSTRING *Inv_ringText = NULL;

TEXTSTRING *Inv_upArrow1 = NULL;

TEXTSTRING *Inv_upArrow2 = NULL;

TEXTSTRING *Inv_downArrow1 = NULL;

TEXTSTRING *Inv_downArrow2 = NULL;

REQUEST_INFO Load_Game_Requester = {
    1, 0,
    5, 0, 0,
    272, 18,
    0, -32, 0,
    load_game_heading,
    &Save_Game_Strings[0][0],
    30
};

REQUEST_INFO Save_Game_Requester = {
    1, 0,
    5, 0, 0,
    272, 18,
    0, -32, 0,
    save_game_heading,
    &Save_Game_Strings[0][0],
    30
};

char Exit_Strings[5][20] = {
    "EXIT",
    "PLAYBACK DEMO",
    "RECORD DEMO",
    "PLAY FMV",
    "LEVEL COMPLETE"
};

REQUEST_INFO Exit_Game_Requester = {
    5, 0,
    5, 0, 0,
    224, 18,
    0, -32, 0,
    "MISC",
    &Exit_Strings[0][0],
    20
};

char FMV_Strings[10][20] = {
    "MAIN INTRO",
    "GYM SEQUENCE",
    "1 SNOW 1",
    "2 LIFT 4",
    "3 VISION 8A",
    "4 CANYON 10A",
    "5 PYRAMID 10B",
    "6 PRISON 10C",
    "END SEQUENCE",
    "CORE LOGO"
};

REQUEST_INFO Play_FMV_Requester = {
    11, 0,
    5, 0, 0,
    224, 18,
    0, -32, 0,
    "PLAY FMV",
    &FMV_Strings[0][0],
    20
};

sint32 inputDB = 0;

sint32 oldInputDB = 0;

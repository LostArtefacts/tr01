#include "game.h"

char inventory_main_heading[] = "INVENTORY";
char inventory_option_heading[] = "OPTION";
char inventory_keys_heading[] = "ITEMS";
char inventory_gameover_heading[] = "GAME OVER";
char passport_load_game[] = "Load Game";
char passport_save_game[] = "Save Game";
char passport_start_game[] = "New Game";
char passport_restart_game[] = "Restart Level";
char passport_exit2title[] = "Exit to Title";
char passport_exit_game[] = "Exit Game";
char select_level_heading[] = "Select Level";
char load_game_heading[] = "Select Level";
char save_game_heading[] = "Save Position";

char *Level_Strings[NUMBER_OF_LEVELS] = {
    "Lara's Home",
    "Caves",
    "City of Vilcabamba",
    "Lost Valley",
    "Tomb of Qualopec",
    "St. Francis' Folly",
    "Colosseum",
    "Palace Midas",
    "The Cistern",
    "Tomb of Tihocan",
    "City of Khamoon",
    "Obelisk of Khamoon",
    "Sanctuary of the Scion",
    "Natla's Mines",
    "Atlantis",
    "The Great Pyramid",
    "Cut Scene 1",
    "Cut Scene 2",
    "Cut Scene 3",
    "Cut Scene 4",
    "Title",
    "Current Position"
};

char compass_name[] = "Compass";
char pistols_name[] = "Pistols";
char shotgun_name[] = "Shotgun";
char magnum_name[] = "Magnums";
char uzi_name[] = "Uzis";
char gun_ammo_name[] = "Pistol Clips";
char sg_ammo_name[] = "Shotgun Shells";
char mag_ammo_name[] = "Magnum Clips";
char uzi_ammo_name[] = "Uzi Clips";
char explosive_name[] = "Grenade";
char medi_name[] = "Small Medi Pack";
char bigmedi_name[] = "Large Medi Pack";
char leadbar_name[] = "Lead Bar";
char pickup_name[] = "Pickup";
char scion_name[] = "Scion";
char puzzle_name[] = "Puzzle";
char key_name[] = "Key";
char game_name[] = "Game";
char detail_name[] = "Detail Levels";
char demomode_text[] = "Demo Mode";
char sound_name[] = "Sound";
char control_name[] = "Controls";
char gamma_name[] = "Gamma";
char gym_name[] = "Lara's Home";

char *puzzle1_strings[NUMBER_OF_LEVELS] = {
    "",
    "",
    "Gold Idol",
    "Machine Cog",
    "",
    "",
    "",
    "Gold Bar",
    "",
    "",
    "",
    "Eye of Horus",
    "Ankh",
    "Fuse",
    "",
    ""
};

char *puzzle2_strings[NUMBER_OF_LEVELS] = {
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "Scarab",
    "Scarab",
    "Pyramid Key",
    "",
    ""
};

char *puzzle3_strings[NUMBER_OF_LEVELS] = {
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "Seal of Anubis",
    "",
    "",
    "",
    ""
};

char *puzzle4_strings[NUMBER_OF_LEVELS] = {
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "Ankh",
    "",
    "",
    "",
    ""
};

char *pickup1_strings[NUMBER_OF_LEVELS] = {
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    ""
};

char *pickup2_strings[NUMBER_OF_LEVELS] = {
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    ""
};

char *key1_strings[NUMBER_OF_LEVELS] = {
    "",
    "",
    "Silver Key",
    "",
    "",
    "Neptune Key",
    "Rusty Key",
    "",
    "Gold Key",
    "Gold Key",
    "Saphire Key",
    "Saphire Key",
    "Gold Key",
    "",
    "",
    ""
};

char *key2_strings[NUMBER_OF_LEVELS] = {
    "",
    "",
    "",
    "",
    "",
    "Atlas Key",
    "",
    "",
    "Silver Key",
    "Rusty Key",
    "",
    "",
    "",
    "",
    "",
    ""
};

char *key3_strings[NUMBER_OF_LEVELS] = {
    "",
    "",
    "",
    "",
    "",
    "Damocles Key",
    "",
    "",
    "Rusty Key",
    "Rusty Key",
    "",
    "",
    "",
    "",
    "",
    ""
};

char *key4_strings[NUMBER_OF_LEVELS] = {
    "",
    "",
    "",
    "",
    "",
    "Thor Key",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    ""
};

char loading_string[] = "LOADING";
char sa_off[] = "OFF";
char sa_on[] = "ON";
char sa_setup[] = "Setup Sound Card";
char str_default[] = "Default Keys";
char str_heading[] = "User Keys";
char str_slow[] = "Walk";
char str_roll[] = "Roll";
char str_run[] = "Run";
char str_left[] = "Left";
char str_right[] = "Right";
char str_back[] = "Back";
char str_stepl[] = "Step Left";
char str_stepr[] = "Step Right";
char str_look[] = "Look";
char str_jump[] = "Jump";
char str_action[] = "Action";
char str_draw[] = "Draw Weapon";
char str_inv[] = "Inventory";
char str_timetaken[] = "TIME TAKEN";
char str_secrets[] = "SECRETS";
char str_pickups[] = "PICKUPS";
char str_kills[] = "KILLS";
char str_of[] = "of";
char sav_mess1[] = "The file could not be saved!";
char sav_mess2[] = "Try Again?";
char sav_mess3[] = "YES";
char sav_mess4[] = "NO";
char sav_mess5[] = "Save Complete!";
char sav_mess6[] = "No save games!";
char sav_mess7[] = "None valid";
char sav_mess8[] = "Save Game?";
char str_volume[] = "Set Volumes";
char str_detail[] = "Select Detail";
char str_high[] = "High";
char str_medium[] = "Medium";
char str_low[] = "Low";

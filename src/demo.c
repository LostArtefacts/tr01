#include <string.h>
#include "game.h"

int democount;
uint32 *demoptr;
int demo_level = LEVEL1;

char valid_demos[] = {
    0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
};

sint32 StartDemo(void)
{
    TEXTSTRING *txt;
    START_INFO start, *s;

    do
    {
        demo_level++;
        if (demo_level > LEVEL10C)
            demo_level = LEVEL1;
    } while (!valid_demos[demo_level]);

    s = &savegame.start[demo_level];
    memcpy(&start, s, sizeof(START_INFO));
    s->available = 1;
    s->got_pistols = 1;
    s->pistol_ammo = 1000;
    s->gun_status = LG_ARMLESS;
    s->gun_type = LG_PISTOLS;

    SeedRandomDraw(0xd371f947);
    SeedRandomControl(0xd371f947);
    if (!InitialiseLevel(demo_level))
        return EXIT_TO_TITLE;
    title_loaded = 0;

    LoadLaraDemoPos();

    SeedRandomDraw(0xd371f947);
    SeedRandomControl(0xd371f947);

    txt = T_Print(0, game_setup.dump_height / 2 - 16, 0, demomode_text);
    T_FlashText(txt, 1, 20);
    T_CentreV(txt, 1);
    T_CentreH(txt, 1);

    GameLoop(1);

    T_RemovePrint(txt);

    memcpy(s, &start, sizeof(START_INFO));

    S_FadeToBlack();

    return EXIT_TO_TITLE;
}

void LoadLaraDemoPos(void)
{
    sint16 room_number;
    FLOOR_INFO *floor;
    ITEM_INFO *item;

    item = lara_item;
    item->pos.x_pos = (sint32)*(demoptr + 0);
    item->pos.y_pos = (sint32)*(demoptr + 1);
    item->pos.z_pos = (sint32)*(demoptr + 2);
    item->pos.x_rot = (sint16)*(demoptr + 3);
    item->pos.y_rot = (sint16)*(demoptr + 4);
    item->pos.z_rot = (sint16)*(demoptr + 5);
    room_number = (sint16)*(demoptr + 6);
    if (item->room_number != room_number)
        ItemNewRoom(lara.item_number, room_number);
    floor = GetFloor(item->pos.x_pos, item->pos.y_pos, item->pos.z_pos, &room_number);
    lara_item->floor = GetHeight(floor, item->pos.x_pos, item->pos.y_pos, item->pos.z_pos);
    democount += 7;
}

void GetDemoInput(void)
{
    if (democount < DEMOCOUNT_MAX)
        input = *(demoptr + democount);
    else
        input = -1;
    if (input != -1)
        democount++;
}

#include "game.h"
#include "invdata.h"

void SelectMeshes(INVENTORY_ITEM *inv_item);

void InitColours(void)
{
    inv_colours[C_BLACK] = S_COLOUR(0, 0, 0);
    inv_colours[C_GREY] = S_COLOUR(64, 64, 64);
    inv_colours[C_WHITE] = S_COLOUR(255, 255, 255);
    inv_colours[C_RED] = S_COLOUR(255, 0, 0);
    inv_colours[C_ORANGE] = S_COLOUR(255, 128, 0);
    inv_colours[C_YELLOW] = S_COLOUR(255, 255, 0);
    inv_colours[C_DARKGREEN] = S_COLOUR(0, 128, 0);
    inv_colours[C_GREEN] = S_COLOUR(0, 255, 0);
    inv_colours[C_CYAN] = S_COLOUR(0, 255, 255);
    inv_colours[C_BLUE] = S_COLOUR(0, 0, 255);
    inv_colours[C_MAGENTA] = S_COLOUR(255, 0, 255);
}

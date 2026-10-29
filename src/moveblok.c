#include "game.h"

enum block_states
{
    STILL = 1,
    PUSH,
    PULL
};

#define MAXOFF_MB 300
#define MAXOFF_Z (LARA_RAD + 80)

static sint16 MovingBlockBounds[12] = {
    -MAXOFF_MB, +MAXOFF_MB,
    0, 0,
    -WALL_L / 2 - MAXOFF_Z, -WALL_L / 2,
    -10 * ONE_DEGREE, +10 * ONE_DEGREE,
    -30 * ONE_DEGREE, +30 * ONE_DEGREE,
    -10 * ONE_DEGREE, +10 * ONE_DEGREE};

void InitialiseMovingBlock(sint16 item_num)
{
    ITEM_INFO *item;

    item = &items[item_num];

    if (item->status != INVISIBLE)
        AlterFloorHeight(item, -1024);
}

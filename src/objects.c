#include "game.h"

typedef struct doorpos_data
{
    FLOOR_INFO *floor;
    FLOOR_INFO data;
    sint16 block;
} DOORPOS_DATA;

typedef struct door_data
{
    DOORPOS_DATA d1, d1flip, d2, d2flip;
} DOOR_DATA;

enum cabin_anims
{
    CABIN_START,
    CABIN_DROP1,
    CABIN_DROP2,
    CABIN_DROP3,
    CABIN_FINISH
};

enum boat_anims
{
    BOAT_EMPTY,
    BOAT_SET,
    BOAT_MOVE,
    BOAT_STOP
};

void ShutThatDoor(DOORPOS_DATA *d)
{
    FLOOR_INFO *floor;

    if (d->floor)
    {
        floor = d->floor;
        floor->index = 0;
        floor->box = NO_BOX;
        floor->floor = floor->ceiling = NO_HEIGHT >> 8;
        floor->pit_room = floor->sky_room = NO_ROOM;

        if (d->block != NO_BOX)
            boxes[d->block].overlap_index |= BLOCKED;
    }
}

#include "game.h"

#define NUM_SLOTS 8

CREATURE_INFO *baddie_slots;
int slots_used = 0;

void InitialiseLOTarray(void)
{
    int i;
    CREATURE_INFO *creature;

    baddie_slots = (CREATURE_INFO *)game_malloc(NUM_SLOTS * sizeof(CREATURE_INFO), CREATURE_DATA);
    creature = baddie_slots;
    for (i = 0; i < NUM_SLOTS; i++, creature++)
    {
        creature->item_num = NO_ITEM;
        creature->LOT.node = (BOX_NODE *)game_malloc(sizeof(BOX_NODE) * number_boxes, CREATURE_LOT);
    }
    slots_used = 0;
}

void DisableBaddieAI(sint16 item_num)
{
    ITEM_INFO *item;
    CREATURE_INFO *creature;

    item = &items[item_num];
    creature = (CREATURE_INFO *)item->data;
    item->data = NULL;
    if (creature)
    {
        creature->item_num = NO_ITEM;
        slots_used--;
    }
}

int EnableBaddieAI(sint16 item_number, int Always)
{
    int x, y, z;
    int worstslot, slot;
    int worstdist, dist;
    ITEM_INFO *item;
    CREATURE_INFO *creature;

    if (items[item_number].data)
        return 1;

    if (slots_used < NUM_SLOTS)
    {
        creature = baddie_slots;
        for (slot = 0; slot < NUM_SLOTS; slot++, creature++)
        {
            if (creature->item_num == NO_ITEM)
            {
                InitialiseSlot(item_number, slot);
                return 1;
            }
        }
        S_ExitSystem("UnpauseBaddie() grimmer!");
    }

    if (!Always)
    {
        item = &items[item_number];
        x = (item->pos.x_pos - camera.pos.x) >> 8;
        y = (item->pos.y_pos - camera.pos.y) >> 8;
        z = (item->pos.z_pos - camera.pos.z) >> 8;
        worstdist = x * x + y * y + z * z;
    }
    else
        worstdist = 0;

    worstslot = -1;
    creature = baddie_slots;
    for (slot = 0; slot < NUM_SLOTS; slot++, creature++)
    {
        item = &items[creature->item_num];
        x = (item->pos.x_pos - camera.pos.x) >> 8;
        y = (item->pos.y_pos - camera.pos.y) >> 8;
        z = (item->pos.z_pos - camera.pos.z) >> 8;
        dist = x * x + y * y + z * z;
        if (dist > worstdist)
        {
            worstdist = dist;
            worstslot = slot;
        }
    }

    if (worstslot >= 0)
    {
        items[baddie_slots[worstslot].item_num].status = INVISIBLE;
        DisableBaddieAI(baddie_slots[worstslot].item_num);
        InitialiseSlot(item_number, worstslot);
        return 1;
    }
    return 0;
}

void InitialiseSlot(sint16 item_number, int slot)
{
    CREATURE_INFO *creature;
    ITEM_INFO *item;

    creature = &baddie_slots[slot];
    item = &items[item_number];
    item->data = (void *)creature;
    creature->item_num = item_number;
    creature->mood = BORED_MOOD;
    creature->head_rotation = creature->neck_rotation = 0;
    creature->maximum_turn = ONE_DEGREE;
    creature->flags = 0;

    creature->LOT.step = STEP_L;
    creature->LOT.drop = -STEP_L;
    creature->LOT.block_mask = BLOCKED;
    creature->LOT.fly = NO_FLYING;

    switch (item->object_number)
    {
    case BAT:
    case ALLIGATOR:
    case FISH:
        creature->LOT.step = WALL_L * 20;
        creature->LOT.drop = -WALL_L * 20;
        creature->LOT.fly = STEP_L / 16;
        break;

    case DINOSAUR:
    case WARRIOR1:
    case CENTAUR:
        creature->LOT.block_mask = BLOCKABLE;
        break;

    case WOLF:
    case LION:
    case LIONESS:
    case PUMA:
        creature->LOT.drop = -WALL_L;
        break;

    case APE:
        creature->LOT.step = STEP_L * 2;
        creature->LOT.drop = -WALL_L;
        break;
    }

    ClearLOT(&creature->LOT);

    CreateZone(item);

    slots_used++;
}

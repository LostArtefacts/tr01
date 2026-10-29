#include "game.h"

int number_boxes;
int number_overlaps;
BOX_INFO *boxes;
uint16 *overlap;
sint16 *ground_zone[2], *ground_zone2[2], *fly_zone[2];

void InitialiseCreature(sint16 item_number)
{
    ITEM_INFO *item;

    item = &items[item_number];

    item->pos.y_rot += (GetRandomControl() - 0x4000) >> 1;
    item->collidable = 1;
    item->data = NULL;
}

void CreatureAIInfo(ITEM_INFO *item, AI_INFO *info)
{
    ROOM_INFO *r;
    sint32 x, z;
    sint16 angle, *zone, *bounds;
    CREATURE_INFO *creature;
    OBJECT_INFO *object;

    if (item->data == NULL)
        return;

    creature = (CREATURE_INFO *)item->data;

    if (creature->LOT.fly == NO_FLYING)
        zone = (creature->LOT.step == STEP_L) ? ground_zone[flip_status] : ground_zone2[flip_status];
    else
        zone = fly_zone[flip_status];

    r = &room[item->room_number];
    item->box_number = r->floor[((item->pos.z_pos - r->z) >> WALL_SHIFT) +
                                ((item->pos.x_pos - r->x) >> WALL_SHIFT) * r->x_size].box;
    info->zone_number = zone[item->box_number];

    r = &room[lara_item->room_number];
    lara_item->box_number = r->floor[((lara_item->pos.z_pos - r->z) >> WALL_SHIFT) +
                                     ((lara_item->pos.x_pos - r->x) >> WALL_SHIFT) * r->x_size].box;
    info->enemy_zone = zone[lara_item->box_number];

    if (boxes[lara_item->box_number].overlap_index & creature->LOT.block_mask)
        info->enemy_zone |= BLOCKED;
    else if (creature->LOT.node[item->box_number].search_number == (creature->LOT.search_number | BLOCKED_SEARCH))
        info->enemy_zone |= BLOCKED;

    object = &objects[item->object_number];
    bounds = GetBestFrame(item);

    z = lara_item->pos.z_pos - (item->pos.z_pos + (object->pivot_length * phd_cos(item->pos.y_rot) >> W2V_SHIFT));
    x = lara_item->pos.x_pos - (item->pos.x_pos + (object->pivot_length * phd_sin(item->pos.y_rot) >> W2V_SHIFT));
    angle = (sint16)phd_atan(z, x);

    info->distance = z * z + x * x;
    info->angle = angle - item->pos.y_rot;
    info->enemy_facing = 0x8000 + angle - lara_item->pos.y_rot;

    info->ahead = (info->angle > -FRONT_ARC && info->angle < FRONT_ARC);
    info->bite = (info->ahead && lara_item->pos.y_pos > item->pos.y_pos - STEP_L && lara_item->pos.y_pos < item->pos.y_pos + STEP_L);
}

#include <stdlib.h>
#include "game.h"

int number_boxes;
int number_overlaps;
BOX_INFO *boxes;
uint16 *overlap;
sint16 *ground_zone[2], *ground_zone2[2], *fly_zone[2];

#define CLIP_LEFT 1
#define CLIP_RIGHT 2
#define CLIP_TOP 4
#define CLIP_BOTTOM 8
#define ALL_CLIP (CLIP_LEFT | CLIP_RIGHT | CLIP_TOP | CLIP_BOTTOM)
#define SECONDARY_CLIP 16

#define BIFF (WALL_L >> 1)

#define STALK_DIST (WALL_L * 3)
#define ESCAPE_DIST (WALL_L * 5)

#define ATTACK_RANGE SQUARE(WALL_L * 3)
#define ESCAPE_CHANCE 0x800
#define RECOVER_CHANCE 0x100

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

int SearchLOT(LOT_INFO *LOT, int expansion)
{
    int i, index, done, change, box_number;
    BOX_NODE *node, *expand;
    BOX_INFO *box;
    sint16 *zone, search_zone;

    if (LOT->fly == NO_FLYING)
        zone = (LOT->step == STEP_L) ? ground_zone[flip_status] : ground_zone2[flip_status];
    else
        zone = fly_zone[flip_status];

    search_zone = zone[LOT->head];

    for (i = 0; i < expansion; i++)
    {
        if (LOT->head == NO_BOX)
            return 0;

        node = &LOT->node[LOT->head];
        box = &boxes[LOT->head];

        index = box->overlap_index & OVERLAP_INDEX;
        done = 0;
        do
        {
            box_number = overlap[index++];
            if (box_number & END_BIT)
            {
                done = 1;
                box_number &= BOX_NUMBER;
            }

            if (search_zone != zone[box_number])
                continue;

            change = boxes[box_number].height - box->height;
            if (change > LOT->step || change < LOT->drop)
                continue;

            expand = &LOT->node[box_number];

            if ((node->search_number & SEARCH_NUMBER) < (expand->search_number & SEARCH_NUMBER))
                continue;

            if (node->search_number & BLOCKED_SEARCH)
            {
                if ((node->search_number & SEARCH_NUMBER) == (expand->search_number & SEARCH_NUMBER))
                    continue;

                expand->search_number = node->search_number;
            }
            else
            {
                if ((node->search_number & SEARCH_NUMBER) == (expand->search_number & SEARCH_NUMBER) &&
                    !(expand->search_number & BLOCKED_SEARCH))
                    continue;

                if (boxes[box_number].overlap_index & LOT->block_mask)
                {
                    expand->search_number = node->search_number | BLOCKED_SEARCH;
                }
                else
                {
                    expand->search_number = node->search_number;
                    expand->exit_box = LOT->head;
                }
            }

            if (expand->next_expansion == NO_BOX && box_number != LOT->tail)
            {
                LOT->node[LOT->tail].next_expansion = box_number;
                LOT->tail = box_number;
            }
        } while (!done);

        LOT->head = node->next_expansion;
        node->next_expansion = NO_BOX;
    }

    return 1;
}

int UpdateLOT(LOT_INFO *LOT, int expansion)
{
    BOX_NODE *expand;

    if (LOT->required_box != NO_BOX && LOT->required_box != LOT->target_box)
    {
        LOT->target_box = LOT->required_box;

        expand = &LOT->node[LOT->target_box];
        if (expand->next_expansion == NO_BOX && LOT->tail != LOT->target_box)
        {
            expand->next_expansion = LOT->head;

            if (LOT->head == NO_BOX)
                LOT->tail = LOT->target_box;

            LOT->head = LOT->target_box;
        }

        expand->search_number = ++LOT->search_number;
        expand->exit_box = NO_BOX;
    }

    return SearchLOT(LOT, expansion);
}

void TargetBox(LOT_INFO *LOT, sint16 box_number)
{
    BOX_INFO *box;

    box_number &= BOX_NUMBER;

    box = &boxes[box_number];

    LOT->target.z = box->left + WALL_L / 2 + (GetRandomControl() * (box->right - box->left - WALL_L) >> 15);
    LOT->target.x = box->top + WALL_L / 2 + (GetRandomControl() * (box->bottom - box->top - WALL_L) >> 15);
    LOT->required_box = box_number;

    if (LOT->fly == NO_FLYING)
        LOT->target.y = box->height;
    else
        LOT->target.y = box->height - STEP_L * 3 / 2;
}

int StalkBox(ITEM_INFO *item, sint16 box_number)
{
    BOX_INFO *box;
    int baddie_quad, box_quad, enemy_quad;
    sint32 x, z;

    box = &boxes[box_number];
    z = ((box->left + box->right) >> 1) - lara_item->pos.z_pos;
    x = ((box->top + box->bottom) >> 1) - lara_item->pos.x_pos;

    if (x > STALK_DIST || x < -STALK_DIST || z > STALK_DIST || z < -STALK_DIST)
        return 0;

    enemy_quad = (lara_item->pos.y_rot >> 14) + 2;

    if (z > 0)
        box_quad = (x > 0) ? 2 : 1;
    else
        box_quad = (x > 0) ? 3 : 0;

    if (enemy_quad == box_quad)
        return 0;

    if (item->pos.z_pos > lara_item->pos.z_pos)
        baddie_quad = (item->pos.x_pos > lara_item->pos.x_pos) ? 2 : 1;
    else
        baddie_quad = (item->pos.x_pos > lara_item->pos.x_pos) ? 3 : 0;

    if (enemy_quad == baddie_quad && abs(enemy_quad - box_quad) == 2)
        return 0;

    return 1;
}

int EscapeBox(ITEM_INFO *item, sint16 box_number)
{
    BOX_INFO *box;
    sint32 x, z;

    box = &boxes[box_number];
    z = ((box->left + box->right) >> 1) - lara_item->pos.z_pos;
    x = ((box->top + box->bottom) >> 1) - lara_item->pos.x_pos;

    if (x > -ESCAPE_DIST && x < ESCAPE_DIST && z > -ESCAPE_DIST && z < ESCAPE_DIST)
        return 0;

    if (((z > 0) ^ (item->pos.z_pos > lara_item->pos.z_pos)) &&
        ((x > 0) ^ (item->pos.x_pos > lara_item->pos.x_pos)))
        return 0;

    return 1;
}

int ValidBox(ITEM_INFO *item, sint16 zone_number, sint16 box_number)
{
    BOX_INFO *box;
    CREATURE_INFO *creature;
    sint16 *zone;

    creature = (CREATURE_INFO *)item->data;
    if (creature->LOT.fly == NO_FLYING)
        zone = (creature->LOT.step == STEP_L) ? ground_zone[flip_status] : ground_zone2[flip_status];
    else
        zone = fly_zone[flip_status];

    if (zone[box_number] != zone_number)
        return 0;

    box = &boxes[box_number];
    if (box->overlap_index & creature->LOT.block_mask)
        return 0;

    if (item->pos.z_pos > box->left && item->pos.z_pos < box->right &&
        item->pos.x_pos > box->top && item->pos.x_pos < box->bottom)
        return 0;

    return 1;
}

void CreatureMood(ITEM_INFO *item, AI_INFO *info, int violent)
{
    int box_number;
    CREATURE_INFO *creature;
    MOOD_TYPE mood;
    LOT_INFO *LOT;
    OBJECT_INFO *object;
    sint16 *bounds;

    if (item->data == NULL)
        return;

    creature = (CREATURE_INFO *)item->data;
    LOT = &creature->LOT;

    if (LOT->node[item->box_number].search_number == (LOT->search_number | BLOCKED_SEARCH))
        LOT->required_box = NO_BOX;

    if (creature->mood != ATTACK_MOOD && LOT->required_box != NO_BOX)
    {
        if (!ValidBox(item, info->zone_number, LOT->target_box))
        {
            if (info->zone_number == info->enemy_zone)
                creature->mood = BORED_MOOD;
            LOT->required_box = NO_BOX;
        }
    }

    mood = creature->mood;

    if (lara_item->hit_points <= 0)
        creature->mood = BORED_MOOD;
    else if (violent)
    {
        switch (creature->mood)
        {
        case ATTACK_MOOD:
            if (info->zone_number != info->enemy_zone)
                creature->mood = BORED_MOOD;
            break;

        case BORED_MOOD:
        case STALK_MOOD:
            if (info->zone_number == info->enemy_zone)
                creature->mood = ATTACK_MOOD;
            else if (item->hit_status)
                creature->mood = ESCAPE_MOOD;
            break;

        case ESCAPE_MOOD:
            if (info->zone_number == info->enemy_zone)
                creature->mood = ATTACK_MOOD;
            break;
        }
    }
    else
    {
        switch (creature->mood)
        {
        case ATTACK_MOOD:
            if (item->hit_status && (GetRandomControl() < ESCAPE_CHANCE || info->zone_number != info->enemy_zone))
                creature->mood = ESCAPE_MOOD;
            else if (info->zone_number != info->enemy_zone)
                creature->mood = BORED_MOOD;
            break;

        case BORED_MOOD:
        case STALK_MOOD:
            if (item->hit_status && (GetRandomControl() < ESCAPE_CHANCE || info->zone_number != info->enemy_zone))
                creature->mood = ESCAPE_MOOD;
            else if (info->zone_number == info->enemy_zone)
            {
                if (info->distance < ATTACK_RANGE || (creature->mood == STALK_MOOD && LOT->required_box == NO_BOX))
                    creature->mood = ATTACK_MOOD;
                else
                    creature->mood = STALK_MOOD;
            }
            break;

        case ESCAPE_MOOD:
            if (info->zone_number == info->enemy_zone && GetRandomControl() < RECOVER_CHANCE)
                creature->mood = STALK_MOOD;
            break;
        }
    }

    if (mood != creature->mood)
    {
        if (mood == ATTACK_MOOD)
            TargetBox(LOT, LOT->target_box);

        LOT->required_box = NO_BOX;
    }

    switch (creature->mood)
    {
    case ATTACK_MOOD:
        if (GetRandomControl() < objects[item->object_number].smartness)
        {
            LOT->target.x = lara_item->pos.x_pos;
            LOT->target.y = lara_item->pos.y_pos;
            LOT->target.z = lara_item->pos.z_pos;
            LOT->required_box = lara_item->box_number;

            if (LOT->fly != NO_FLYING)
            {
                object = &objects[lara_item->object_number];
                if (lara.water_status == LARA_ABOVEWATER)
                {
                    bounds = GetBestFrame(lara_item);
                    LOT->target.y += bounds[2];
                }
            }
        }
        break;

    case BORED_MOOD:
        box_number = LOT->node[GetRandomControl() * LOT->zone_count / 0x7fff].box_number;
        if (ValidBox(item, info->zone_number, box_number))
        {
            if (StalkBox(item, box_number))
            {
                TargetBox(LOT, box_number);
                creature->mood = STALK_MOOD;
            }
            else if (LOT->required_box == NO_BOX)
                TargetBox(LOT, box_number);
        }
        break;

    case STALK_MOOD:
        if (LOT->required_box == NO_BOX || !StalkBox(item, LOT->required_box))
        {
            box_number = LOT->node[GetRandomControl() * LOT->zone_count / 0x7fff].box_number;
            if (ValidBox(item, info->zone_number, box_number))
            {
                if (StalkBox(item, box_number))
                    TargetBox(LOT, box_number);
                else if (LOT->required_box == NO_BOX)
                {
                    TargetBox(LOT, box_number);

                    if (info->zone_number != info->enemy_zone)
                        creature->mood = BORED_MOOD;
                }
            }
        }
        break;

    case ESCAPE_MOOD:
        box_number = LOT->node[GetRandomControl() * LOT->zone_count / 0x7fff].box_number;
        if (ValidBox(item, info->zone_number, box_number))
        {
            if (LOT->required_box == NO_BOX)
            {
                if (EscapeBox(item, box_number))
                    TargetBox(LOT, box_number);
                else if (info->zone_number == info->enemy_zone && StalkBox(item, box_number))
                {
                    TargetBox(LOT, box_number);
                    creature->mood = STALK_MOOD;
                }
            }
        }
        break;
    }

    if (LOT->target_box == NO_BOX)
        TargetBox(LOT, item->box_number);

    CalculateTarget(&creature->target, item, &creature->LOT);
}

TARGET_TYPE CalculateTarget(PHD_VECTOR *target, ITEM_INFO *item, LOT_INFO *LOT)
{
    int box_number, prime_free;
    BOX_INFO *box;
    sint32 left, right, top, bottom;

    UpdateLOT(LOT, MAX_EXPANSION);

    target->x = item->pos.x_pos;
    target->y = item->pos.y_pos;
    target->z = item->pos.z_pos;

    box_number = item->box_number;
    if (box_number == NO_BOX)
        return NO_TARGET;

    prime_free = ALL_CLIP;
    do
    {
        box = &boxes[box_number];

        if (LOT->fly == NO_FLYING)
        {
            if (target->y > box->height)
                target->y = box->height;
        }
        else
        {
            if (target->y > box->height - WALL_L)
                target->y = box->height - WALL_L;
        }

        if (item->pos.z_pos >= box->left && item->pos.z_pos <= box->right &&
            item->pos.x_pos >= box->top && item->pos.x_pos <= box->bottom)
        {
            left = box->left;
            right = box->right;
            top = box->top;
            bottom = box->bottom;
        }
        else
        {
            if (item->pos.z_pos < box->left)
            {
                if ((prime_free & CLIP_LEFT) && item->pos.x_pos >= box->top && item->pos.x_pos <= box->bottom)
                {
                    if (target->z < box->left + BIFF)
                        target->z = box->left + BIFF;

                    if (prime_free & SECONDARY_CLIP)
                        return SECONDARY_TARGET;

                    if (box->top > top)
                        top = box->top;
                    if (box->bottom < bottom)
                        bottom = box->bottom;

                    prime_free = CLIP_LEFT;
                }
                else if (prime_free != CLIP_LEFT)
                {
                    target->z = right - BIFF;
                    if (prime_free != ALL_CLIP)
                        return SECONDARY_TARGET;

                    prime_free |= SECONDARY_CLIP;
                }
            }
            else if (item->pos.z_pos > box->right)
            {
                if ((prime_free & CLIP_RIGHT) && item->pos.x_pos >= box->top && item->pos.x_pos <= box->bottom)
                {
                    if (target->z > box->right - BIFF)
                        target->z = box->right - BIFF;

                    if (prime_free & SECONDARY_CLIP)
                        return SECONDARY_TARGET;

                    if (box->top > top)
                        top = box->top;
                    if (box->bottom < bottom)
                        bottom = box->bottom;

                    prime_free = CLIP_RIGHT;
                }
                else if (prime_free != CLIP_RIGHT)
                {
                    target->z = left + BIFF;
                    if (prime_free != ALL_CLIP)
                        return SECONDARY_TARGET;

                    prime_free |= SECONDARY_CLIP;
                }
            }

            if (item->pos.x_pos < box->top)
            {
                if ((prime_free & CLIP_TOP) && item->pos.z_pos >= box->left && item->pos.z_pos <= box->right)
                {
                    if (target->x < box->top + BIFF)
                        target->x = box->top + BIFF;

                    if (prime_free & SECONDARY_CLIP)
                        return SECONDARY_TARGET;

                    if (box->left > left)
                        left = box->left;
                    if (box->right < right)
                        right = box->right;

                    prime_free = CLIP_TOP;
                }
                else if (prime_free != CLIP_TOP)
                {
                    target->x = bottom - BIFF;
                    if (prime_free != ALL_CLIP)
                        return SECONDARY_TARGET;

                    prime_free |= SECONDARY_CLIP;
                }
            }
            else if (item->pos.x_pos > box->bottom)
            {
                if ((prime_free & CLIP_BOTTOM) && item->pos.z_pos >= box->left && item->pos.z_pos <= box->right)
                {
                    if (target->x > box->bottom - BIFF)
                        target->x = box->bottom - BIFF;

                    if (prime_free & SECONDARY_CLIP)
                        return SECONDARY_TARGET;

                    if (box->left > left)
                        left = box->left;
                    if (box->right < right)
                        right = box->right;

                    prime_free = CLIP_BOTTOM;
                }
                else if (prime_free != CLIP_BOTTOM)
                {
                    target->x = top + BIFF;
                    if (prime_free != ALL_CLIP)
                        return SECONDARY_TARGET;

                    prime_free |= SECONDARY_CLIP;
                }
            }
        }

        if (box_number == LOT->target_box)
        {
            if (prime_free & (CLIP_LEFT | CLIP_RIGHT))
                target->z = LOT->target.z;
            else if (!(prime_free & SECONDARY_CLIP))
            {
                if (target->z < box->left + BIFF)
                    target->z = box->left + BIFF;
                else if (target->z > box->right - BIFF)
                    target->z = box->right - BIFF;
            }

            if (prime_free & (CLIP_TOP | CLIP_BOTTOM))
                target->x = LOT->target.x;
            else if (!(prime_free & SECONDARY_CLIP))
            {
                if (target->x < box->top + BIFF)
                    target->x = box->top + BIFF;
                else if (target->x > box->bottom - BIFF)
                    target->x = box->bottom - BIFF;
            }

            target->y = LOT->target.y;

            return PRIME_TARGET;
        }

        box_number = LOT->node[box_number].exit_box;
        if (box_number != NO_BOX && (boxes[box_number].overlap_index & LOT->block_mask))
            break;
    } while (box_number != NO_BOX);

    if (prime_free & (CLIP_LEFT | CLIP_RIGHT))
        target->z = box->left + WALL_L / 2 + (GetRandomControl() * (box->right - box->left - WALL_L) >> 15);
    else if (!(prime_free & SECONDARY_CLIP))
    {
        if (target->z < box->left + BIFF)
            target->z = box->left + BIFF;
        else if (target->z > box->right - BIFF)
            target->z = box->right - BIFF;
    }

    if (prime_free & (CLIP_TOP | CLIP_BOTTOM))
        target->x = box->top + WALL_L / 2 + (GetRandomControl() * (box->bottom - box->top - WALL_L) >> 15);
    else if (!(prime_free & SECONDARY_CLIP))
    {
        if (target->x < box->top + BIFF)
            target->x = box->top + BIFF;
        else if (target->x > box->bottom - BIFF)
            target->x = box->bottom - BIFF;
    }

    if (LOT->fly == NO_FLYING)
        target->y = box->height;
    else
        target->y = box->height - STEP_L * 3 / 2;

    return NO_TARGET;
}

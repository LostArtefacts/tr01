#ifndef BOX_H
#define BOX_H

#include "types.h"

typedef struct
{
    sint16 exit_box;
    uint16 search_number;
    sint16 next_expansion;
    sint16 box_number;
} BOX_NODE;

typedef enum
{
    BORED_MOOD,
    ATTACK_MOOD,
    ESCAPE_MOOD,
    STALK_MOOD
} MOOD_TYPE;

#define TIMID 0
#define VIOLENT 1

typedef struct
{
    sint16 zone_number;
    sint16 enemy_zone;
    sint32 distance;
    sint32 ahead;
    sint32 bite;
    sint16 angle;
    sint16 enemy_facing;
} AI_INFO;

typedef struct
{
    BOX_NODE *node;
    sint16 head, tail;
    uint16 search_number;
    uint16 block_mask;
    sint16 step;
    sint16 drop;
    sint16 fly;
    sint16 zone_count;
    sint16 target_box;
    sint16 required_box;
    PHD_VECTOR target;
} LOT_INFO;

typedef struct
{
    sint16 head_rotation;
    sint16 neck_rotation;
    sint16 maximum_turn;
    sint16 flags;
    sint16 item_num;
    MOOD_TYPE mood;
    LOT_INFO LOT;
    PHD_VECTOR target;
} CREATURE_INFO;

void CreatureAIInfo(ITEM_INFO *item, AI_INFO *info);
void CreatureMood(ITEM_INFO *item, AI_INFO *info, int violent);
int CreatureAnimation(sint16 item_number, sint16 angle, sint16 tilt);
sint16 CreatureTurn(ITEM_INFO *item, sint16 maximum_turn);
sint16 CreatureEffect(ITEM_INFO *item, BITE_INFO *bite,
    sint16 (*generate)(sint32 x, sint32 y, sint32 z, sint16 speed, PHD_ANGLE yrot, sint16 room_number));

void BatControl(sint16 item_number);

#endif

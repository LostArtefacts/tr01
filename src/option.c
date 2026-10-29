#include "game.h"
#include "invdata.h"

void do_passport_option(INVENTORY_ITEM *inv_item);
void do_gamma_option(INVENTORY_ITEM *inv_item);
void do_detail_option(INVENTORY_ITEM *inv_item);
void do_sound_option(INVENTORY_ITEM *inv_item);
void do_compass_option(INVENTORY_ITEM *inv_item);
void do_control_option(INVENTORY_ITEM *inv_item);

void do_inventory_options(INVENTORY_ITEM *inv_item)
{
    switch (inv_item->object_number)
    {
    case MAP_OPTION:
        do_compass_option(inv_item);
        break;
    case GUN_OPTION:
        inputDB |= SELECT_ITEM;
        break;
    case SHOTGUN_OPTION:
        inputDB |= SELECT_ITEM;
        break;
    case MAGNUM_OPTION:
        inputDB |= SELECT_ITEM;
        break;
    case UZI_OPTION:
        inputDB |= SELECT_ITEM;
        break;
    case GUN_AMMO_OPTION:
        break;
    case SG_AMMO_OPTION:
        break;
    case MAG_AMMO_OPTION:
        break;
    case UZI_AMMO_OPTION:
        break;
    case EXPLOSIVE_OPTION:
        inputDB |= SELECT_ITEM;
        break;
    case MEDI_OPTION:
        inputDB |= SELECT_ITEM;
        break;
    case BIGMEDI_OPTION:
        inputDB |= SELECT_ITEM;
        break;
    case PICKUP_OPTION1:
        inputDB |= SELECT_ITEM;
        break;
    case PICKUP_OPTION2:
        inputDB |= SELECT_ITEM;
        break;
    case SCION_OPTION:
        inputDB |= SELECT_ITEM;
        break;
    case PUZZLE_OPTION1:
        inputDB |= SELECT_ITEM;
        break;
    case PUZZLE_OPTION2:
        inputDB |= SELECT_ITEM;
        break;
    case PUZZLE_OPTION3:
        inputDB |= SELECT_ITEM;
        break;
    case PUZZLE_OPTION4:
        inputDB |= SELECT_ITEM;
        break;
    case KEY_OPTION1:
        inputDB |= SELECT_ITEM;
        break;
    case KEY_OPTION2:
        inputDB |= SELECT_ITEM;
        break;
    case KEY_OPTION3:
        inputDB |= SELECT_ITEM;
        break;
    case KEY_OPTION4:
        inputDB |= SELECT_ITEM;
        break;
    case PASSPORT_OPTION:
        do_passport_option(inv_item);
        break;
    case GAMMA_OPTION:
        do_gamma_option(inv_item);
        break;
    case DETAIL_OPTION:
        do_detail_option(inv_item);
        break;
    case SOUND_OPTION:
        do_sound_option(inv_item);
        break;
    case CONTROL_OPTION:
        do_control_option(inv_item);
        break;
    default:
        if (inputDB & SELECT_ITEM || inputDB & DESELECT_ITEM)
        {
            inv_item->goal_frame = 0;
            inv_item->anim_direction = -1;
        }
        break;
    }
}

void do_compass_option(INVENTORY_ITEM *inv_item)
{
    if (inputDB & (DESELECT_ITEM | SELECT_ITEM))
    {
        inv_item->goal_frame = inv_item->frames_total - 1;
        inv_item->anim_direction = 1;
    }
}

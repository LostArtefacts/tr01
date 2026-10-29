#include "game.h"

void GetCollisionInfo(COLL_INFO *coll, sint32 xpos, sint32 ypos, sint32 zpos, sint16 room_number, sint32 objheight)
{
    sint32 height, ceiling;
    sint32 xleft, zleft;
    sint32 xright, zright;
    sint32 xfront, zfront;
    sint32 x, y, z, ytop;
    FLOOR_INFO *floor;
    sint16 tilt;

    coll->coll_type = 0;
    coll->shift.x = coll->shift.y = coll->shift.z = 0;
    coll->quadrant = (uint16)(coll->facing + 0x2000) / 0x4000;
    x = xpos;
    y = ypos - objheight;
    ytop = y - 160;
    z = zpos;
    floor = GetFloor(x, ytop, z, &room_number);
    height = GetHeight(floor, x, ytop, z);
    if (height != NO_HEIGHT)
        height -= ypos;

    ceiling = GetCeiling(floor, x, ytop, z);
    if (ceiling != NO_HEIGHT)
        ceiling -= y;

    coll->mid_floor = height;
    coll->mid_ceiling = ceiling;
    coll->mid_type = height_type;
    coll->trigger = trigger_index;

    tilt = GetTiltType(floor, x, lara_item->pos.y_pos, z);
    coll->tilt_z = tilt >> 8;
    coll->tilt_x = (signed char)tilt;

    switch (coll->quadrant)
    {
    case 0:
        xfront = (phd_sin(coll->facing) * coll->radius) >> W2V_SHIFT;
        zfront = coll->radius;
        xleft = -coll->radius;
        zleft = coll->radius;
        xright = coll->radius;
        zright = coll->radius;
        break;

    case 1:
        xfront = coll->radius;
        zfront = (phd_cos(coll->facing) * coll->radius) >> W2V_SHIFT;
        xleft = coll->radius;
        zleft = coll->radius;
        xright = coll->radius;
        zright = -coll->radius;
        break;

    case 2:
        xfront = (phd_sin(coll->facing) * coll->radius) >> W2V_SHIFT;
        zfront = -coll->radius;
        xleft = coll->radius;
        zleft = -coll->radius;
        xright = -coll->radius;
        zright = -coll->radius;
        break;

    case 3:
        xfront = -coll->radius;
        zfront = (phd_cos(coll->facing) * coll->radius) >> W2V_SHIFT;
        xleft = -coll->radius;
        zleft = -coll->radius;
        xright = -coll->radius;
        zright = coll->radius;
        break;

    default:
        xleft = zleft = 0;
        xright = zright = 0;
        xfront = zfront = 0;
        break;
    }

    x = xpos + xfront;
    z = zpos + zfront;
    floor = GetFloor(x, ytop, z, &room_number);
    height = GetHeight(floor, x, ytop, z);
    if (height != NO_HEIGHT)
        height -= ypos;

    ceiling = GetCeiling(floor, x, ytop, z);
    if (ceiling != NO_HEIGHT)
        ceiling -= y;

    coll->front_floor = height;
    coll->front_ceiling = ceiling;
    coll->front_type = height_type;
    if (coll->slopes_are_walls && coll->front_type == BIG_SLOPE && coll->front_floor < 0)
        coll->front_floor = -32767;
    else if (coll->slopes_are_pits && coll->front_type == BIG_SLOPE && coll->front_floor > 0)
        coll->front_floor = 512;
    else if (coll->lava_is_pit && coll->front_floor > 0 && trigger_index && (*(trigger_index) & DATA_TYPE) == LAVA_TYPE)
        coll->front_floor = 512;

    x = xpos + xleft;
    z = zpos + zleft;
    floor = GetFloor(x, ytop, z, &room_number);
    height = GetHeight(floor, x, ytop, z);
    if (height != NO_HEIGHT)
        height -= ypos;

    ceiling = GetCeiling(floor, x, ytop, z);
    if (ceiling != NO_HEIGHT)
        ceiling -= y;

    coll->left_floor = height;
    coll->left_ceiling = ceiling;
    coll->left_type = height_type;
    if (coll->slopes_are_walls && coll->left_type == BIG_SLOPE && coll->left_floor < 0)
        coll->left_floor = -32767;
    else if (coll->slopes_are_pits && coll->left_type == BIG_SLOPE && coll->left_floor > 0)
        coll->left_floor = 512;
    else if (coll->lava_is_pit && coll->left_floor > 0 && trigger_index && (*(trigger_index) & DATA_TYPE) == LAVA_TYPE)
        coll->left_floor = 512;

    x = xpos + xright;
    z = zpos + zright;
    floor = GetFloor(x, ytop, z, &room_number);
    height = GetHeight(floor, x, ytop, z);
    if (height != NO_HEIGHT)
        height -= ypos;

    ceiling = GetCeiling(floor, x, ytop, z);
    if (ceiling != NO_HEIGHT)
        ceiling -= y;

    coll->right_floor = height;
    coll->right_ceiling = ceiling;
    coll->right_type = height_type;
    if (coll->slopes_are_walls && coll->right_type == BIG_SLOPE && coll->right_floor < 0)
        coll->right_floor = -32767;
    else if (coll->slopes_are_pits && coll->right_type == BIG_SLOPE && coll->right_floor > 0)
        coll->right_floor = 512;
    else if (coll->lava_is_pit && coll->right_floor > 0 && trigger_index && (*(trigger_index) & DATA_TYPE) == LAVA_TYPE)
        coll->right_floor = 512;

    CollideStaticObjects(coll, xpos, ypos, zpos, room_number, objheight);

    if (coll->mid_floor == NO_HEIGHT)
    {
        coll->shift.x = coll->old.x - xpos;
        coll->shift.y = coll->old.y - ypos;
        coll->shift.z = coll->old.z - zpos;
        coll->coll_type = COLL_FRONT;
        return;
    }

    if (coll->mid_floor - coll->mid_ceiling <= 0)
    {
        coll->shift.x = coll->old.x - xpos;
        coll->shift.y = coll->old.y - ypos;
        coll->shift.z = coll->old.z - zpos;
        coll->coll_type = COLL_CLAMP;
        return;
    }

    if (coll->mid_ceiling >= 0)
    {
        coll->shift.y = coll->mid_ceiling;
        coll->coll_type = COLL_TOP;
    }

    if (coll->front_floor > coll->bad_pos || coll->front_floor < coll->bad_neg || coll->front_ceiling > coll->bad_ceiling)
    {
        switch (coll->quadrant)
        {
        case 0:
        case 2:
            coll->shift.x = coll->old.x - xpos;
            coll->shift.z = FindGridShift(zpos + zfront, zpos);
            break;

        case 1:
        case 3:
            coll->shift.x = FindGridShift(xpos + xfront, xpos);
            coll->shift.z = coll->old.z - zpos;
            break;
        }

        coll->coll_type = COLL_FRONT;
        return;
    }

    if (coll->front_ceiling >= coll->bad_ceiling)
    {
        coll->shift.x = coll->old.x - xpos;
        coll->shift.y = coll->old.y - ypos;
        coll->shift.z = coll->old.z - zpos;
        coll->coll_type = COLL_TOPFRONT;
        return;
    }

    if (coll->left_floor > coll->bad_pos || coll->left_floor < coll->bad_neg)
    {
        switch (coll->quadrant)
        {
        case 0:
        case 2:
            coll->shift.x = FindGridShift(xpos + xleft, xpos + xfront);
            break;

        case 1:
        case 3:
            coll->shift.z = FindGridShift(zpos + zleft, zpos + zfront);
            break;
        }

        coll->coll_type = COLL_LEFT;
        return;
    }

    if (coll->right_floor > coll->bad_pos || coll->right_floor < coll->bad_neg)
    {
        switch (coll->quadrant)
        {
        case 0:
        case 2:
            coll->shift.x = FindGridShift(xpos + xright, xpos + xfront);
            break;

        case 1:
        case 3:
            coll->shift.z = FindGridShift(zpos + zright, zpos + zfront);
            break;
        }

        coll->coll_type = COLL_RIGHT;
        return;
    }
}

sint32 FindGridShift(sint32 src, sint32 dst)
{
    sint32 srcw, dstw;

    srcw = src >> WALL_SHIFT;
    dstw = dst >> WALL_SHIFT;
    if (srcw == dstw)
        return 0;

    src &= WALL_L - 1;
    if (dstw > srcw)
        return WALL_L - (src - 1);
    else
        return -(src + 1);
}

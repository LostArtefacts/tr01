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

int CollideStaticObjects(COLL_INFO *coll, sint32 x, sint32 y, sint32 z, sint16 room_number, sint32 hite)
{
    int i, j;
    ROOM_INFO *r;
    MESH_INFO *mesh;
    STATIC_INFO *sinfo;
    sint32 xmin, xmax, ymin, ymax, zmin, zmax;
    sint32 inxmin, inxmax, inymin, inymax, inzmin, inzmax;
    PHD_VECTOR shifter;
    sint32 shl, shr;

    coll->hit_static = 0;
    inxmin = x - coll->radius;
    inxmax = x + coll->radius;
    inymin = y - hite;
    inymax = y;
    inzmin = z - coll->radius;
    inzmax = z + coll->radius;
    shifter.x = shifter.y = shifter.z = 0;
    GetNearByRooms(x, y, z, coll->radius + 50, hite + 50, room_number);
    for (i = 0; i < number_draw_rooms; i++)
    {
        r = &room[draw_rooms[i]];
        mesh = r->mesh;

        for (j = r->num_meshes; j > 0; j--, mesh++)
        {
            sinfo = &static_objects[mesh->static_number];
            if (sinfo->flags & 1)
                continue;

            ymin = mesh->y + sinfo->y_minc;
            ymax = mesh->y + sinfo->y_maxc;
            switch (mesh->y_rot)
            {
            default:
                xmin = mesh->x + sinfo->x_minc;
                xmax = mesh->x + sinfo->x_maxc;
                zmin = mesh->z + sinfo->z_minc;
                zmax = mesh->z + sinfo->z_maxc;
                break;

            case 16384:
                xmin = mesh->x + sinfo->z_minc;
                xmax = mesh->x + sinfo->z_maxc;
                zmin = mesh->z - sinfo->x_maxc;
                zmax = mesh->z - sinfo->x_minc;
                break;

            case -32768:
                xmin = mesh->x - sinfo->x_maxc;
                xmax = mesh->x - sinfo->x_minc;
                zmin = mesh->z - sinfo->z_maxc;
                zmax = mesh->z - sinfo->z_minc;
                break;

            case -16384:
                xmin = mesh->x - sinfo->z_maxc;
                xmax = mesh->x - sinfo->z_minc;
                zmin = mesh->z + sinfo->x_minc;
                zmax = mesh->z + sinfo->x_maxc;
                break;
            }

            if (inxmax <= xmin || inxmin >= xmax || inymax <= ymin || inymin >= ymax || inzmax <= zmin ||
                inzmin >= zmax)
                continue;

            shl = inxmax - xmin;
            shr = xmax - inxmin;
            if (shl < shr)
                shifter.x = -shl;
            else
                shifter.x = shr;

            shl = inzmax - zmin;
            shr = zmax - inzmin;
            if (shl < shr)
                shifter.z = -shl;
            else
                shifter.z = shr;

            switch (coll->quadrant)
            {
            case NORTH:
                if (shifter.x > coll->radius || shifter.x < -coll->radius)
                {
                    coll->shift.z = shifter.z;
                    coll->shift.x = coll->old.x - x;
                    coll->coll_type = COLL_FRONT;
                }
                else if (shifter.x > 0 && shifter.x <= coll->radius)
                {
                    coll->shift.x = shifter.x;
                    coll->shift.z = 0;
                    coll->coll_type = COLL_LEFT;
                }
                else if (shifter.x < 0 && shifter.x >= -coll->radius)
                {
                    coll->shift.x = shifter.x;
                    coll->shift.z = 0;
                    coll->coll_type = COLL_RIGHT;
                }

                break;

            case EAST:
                if (shifter.z > coll->radius || shifter.z < -coll->radius)
                {
                    coll->shift.x = shifter.x;
                    coll->shift.z = coll->old.z - z;
                    coll->coll_type = COLL_FRONT;
                }
                else if (shifter.z > 0 && shifter.z <= coll->radius)
                {
                    coll->shift.z = shifter.z;
                    coll->shift.x = 0;
                    coll->coll_type = COLL_RIGHT;
                }
                else if (shifter.z < 0 && shifter.z >= -coll->radius)
                {
                    coll->shift.z = shifter.z;
                    coll->shift.x = 0;
                    coll->coll_type = COLL_LEFT;
                }

                break;

            case SOUTH:
                if (shifter.x > coll->radius || shifter.x < -coll->radius)
                {
                    coll->shift.z = shifter.z;
                    coll->shift.x = coll->old.x - x;
                    coll->coll_type = COLL_FRONT;
                }
                else if (shifter.x > 0 && shifter.x <= coll->radius)
                {
                    coll->shift.x = shifter.x;
                    coll->shift.z = 0;
                    coll->coll_type = COLL_RIGHT;
                }
                else if (shifter.x < 0 && shifter.x >= -coll->radius)
                {
                    coll->shift.x = shifter.x;
                    coll->shift.z = 0;
                    coll->coll_type = COLL_LEFT;
                }

                break;

            case WEST:
                if (shifter.z > coll->radius || shifter.z < -coll->radius)
                {
                    coll->shift.x = shifter.x;
                    coll->shift.z = coll->old.z - z;
                    coll->coll_type = COLL_FRONT;
                }
                else if (shifter.z > 0 && shifter.z <= coll->radius)
                {
                    coll->shift.z = shifter.z;
                    coll->shift.x = 0;
                    coll->coll_type = COLL_LEFT;
                }
                else if (shifter.z < 0 && shifter.z >= -coll->radius)
                {
                    coll->shift.z = shifter.z;
                    coll->shift.x = 0;
                    coll->coll_type = COLL_RIGHT;
                }

                break;
            }

            coll->hit_static = 1;
            return 1;
        }
    }

    return 0;
}

void GetNearByRooms(sint32 x, sint32 y, sint32 z, sint32 r, sint32 h, sint16 room_number)
{
    draw_rooms[0] = room_number;
    number_draw_rooms = 1;
    GetNewRoom(x + r, y, z + r, room_number);
    GetNewRoom(x - r, y, z + r, room_number);
    GetNewRoom(x + r, y, z - r, room_number);
    GetNewRoom(x - r, y, z - r, room_number);
    GetNewRoom(x + r, y - h, z + r, room_number);
    GetNewRoom(x - r, y - h, z + r, room_number);
    GetNewRoom(x + r, y - h, z - r, room_number);
    GetNewRoom(x - r, y - h, z - r, room_number);
}

void GetNewRoom(sint32 x, sint32 y, sint32 z, sint16 room_number)
{
    int i;

    GetFloor(x, y, z, &room_number);
    for (i = 0; i < number_draw_rooms; i++)
    {
        if (draw_rooms[i] == room_number)
            break;
    }

    if (i == number_draw_rooms)
        draw_rooms[number_draw_rooms++] = room_number;
}

void ShiftItem(ITEM_INFO *item, COLL_INFO *coll)
{
    item->pos.x_pos += coll->shift.x;
    item->pos.y_pos += coll->shift.y;
    item->pos.z_pos += coll->shift.z;
    coll->shift.x = coll->shift.y = coll->shift.z = 0;
}

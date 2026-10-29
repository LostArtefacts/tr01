#include "game.h"

#define TARGET_DIST (WALL_L * 4)

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

void UpdateLaraRoom(ITEM_INFO *item, int height)
{
    sint16 room_number;
    FLOOR_INFO *floor;
    sint32 x, y, z;

    x = item->pos.x_pos;
    y = item->pos.y_pos + height;
    z = item->pos.z_pos;
    room_number = item->room_number;
    floor = GetFloor(x, y, z, &room_number);
    item->floor = GetHeight(floor, x, y, z);
    if (item->room_number != room_number)
        ItemNewRoom(lara.item_number, room_number);
}

sint16 GetTiltType(FLOOR_INFO *floor, sint32 x, sint32 y, sint32 z)
{
    ROOM_INFO *r;
    sint16 *data;
    uint16 index;
    sint16 type;

    while (floor->pit_room != NO_ROOM)
    {
        r = &room[floor->pit_room];
        floor = &r->floor[((z - r->z) >> WALL_SHIFT) + ((x - r->x) >> WALL_SHIFT) * r->x_size];
    }

    index = floor->index;

    if (y + 512 < ((sint32)floor->floor << 8))
        return 0;

    if (floor->index)
    {
        data = &floor_data[floor->index];
        type = *(data) & DATA_TYPE;
        if (type == TILT_TYPE)
            return *(data + 1);
    }

    return 0;
}

void LaraBaddieCollision(ITEM_INFO *laraitem, COLL_INFO *coll)
{
    int i, x, y, z;
    ITEM_INFO *item;
    OBJECT_INFO *object;
    sint16 roomies[12], numroom, *door;
    sint16 item_num, nex;

    laraitem->hit_status = 0;
    lara.hit_direction = -1;
    if (laraitem->hit_points <= 0)
        return;

    numroom = 1;
    roomies[0] = laraitem->room_number;
    door = room[laraitem->room_number].door;
    if (door)
    {
        for (i = (int)*(door++); i > 0; i--)
        {
            roomies[numroom++] = *(door);
            door += 16;
        }
    }

    for (i = 0; i < numroom; i++)
    {
        item_num = room[roomies[i]].item_number;
        while (item_num != NO_ITEM)
        {
            item = &items[item_num];
            nex = item->next_item;
            if (item->collidable && item->status != INVISIBLE)
            {
                object = &objects[item->object_number];
                if (object->collision)
                {
                    x = laraitem->pos.x_pos - item->pos.x_pos;
                    y = laraitem->pos.y_pos - item->pos.y_pos;
                    z = laraitem->pos.z_pos - item->pos.z_pos;
                    if (x > -TARGET_DIST && x < TARGET_DIST &&
                        z > -TARGET_DIST && z < TARGET_DIST &&
                        y > -TARGET_DIST && y < TARGET_DIST)
                        (*object->collision)(item_num, laraitem, coll);
                }
            }

            item_num = nex;
        }
    }

    if (lara.hit_effect_count)
        EffectHit(laraitem, coll);

    if (lara.hit_direction == -1)
        lara.hit_frame = 0;

    Inventory_Chosen = -1;
}

void EffectHit(ITEM_INFO *laraitem, COLL_INFO *coll)
{
    FX_INFO *fx;
    sint32 x, z;
    PHD_ANGLE hitang;

    fx = lara.hit_effect;
    x = lara.hit_effect->pos.x_pos - laraitem->pos.x_pos;
    z = lara.hit_effect->pos.z_pos - laraitem->pos.z_pos;
    hitang = (sint16)(laraitem->pos.y_rot - (32768 + phd_atan(z, x)));
    lara.hit_direction = (uint16)(hitang + 0x2000) / 0x4000;
    if (!lara.hit_frame)
        SoundEffect(27, &laraitem->pos, 0);

    lara.hit_frame++;
    if (lara.hit_frame > 34)
        lara.hit_frame = 34;

    lara.hit_effect_count--;
}

void CreatureCollision(sint16 item_num, ITEM_INFO *laraitem, COLL_INFO *coll)
{
    ITEM_INFO *item;

    item = &items[item_num];
    if (!TestBoundsCollide(item, laraitem, coll->radius))
        return;

    if (!TestCollision(item, laraitem))
        return;

    if (coll->enable_baddie_push)
    {
        if (item->hit_points <= 0)
            ItemPushLara(item, laraitem, coll, 0, 0);
        else
            ItemPushLara(item, laraitem, coll, coll->enable_hit, 0);
    }
}

void ObjectCollision(sint16 item_num, ITEM_INFO *laraitem, COLL_INFO *coll)
{
    ITEM_INFO *item;

    item = &items[item_num];
    if (!TestBoundsCollide(item, laraitem, coll->radius))
        return;

    if (!TestCollision(item, laraitem))
        return;

    if (coll->enable_baddie_push)
        ItemPushLara(item, laraitem, coll, 0, 1);
}

void DoorCollision(sint16 item_num, ITEM_INFO *laraitem, COLL_INFO *coll)
{
    ITEM_INFO *item;

    item = &items[item_num];
    if (!TestBoundsCollide(item, laraitem, coll->radius))
        return;

    if (!TestCollision(item, laraitem))
        return;

    if (coll->enable_baddie_push)
    {
        if (item->current_anim_state != item->goal_anim_state)
            ItemPushLara(item, laraitem, coll, coll->enable_hit, 1);
        else
            ItemPushLara(item, laraitem, coll, 0, 1);
    }
}

void TrapCollision(sint16 item_num, ITEM_INFO *laraitem, COLL_INFO *coll)
{
    ITEM_INFO *item;

    item = &items[item_num];

    if (item->status == ACTIVE)
    {
        if (!TestBoundsCollide(item, laraitem, coll->radius))
            return;

        TestCollision(item, laraitem);
    }
    else if (item->status != INVISIBLE)
        ObjectCollision(item_num, laraitem, coll);
}

void ItemPushLara(ITEM_INFO *item, ITEM_INFO *laraitem, COLL_INFO *coll, int enable_hit, int bigpush)
{
    int x, z, rx, rz, c, s;
    int minx, maxx, minz, maxz;
    int l, r, t, b, ax, az;
    OBJECT_INFO *object;
    PHD_ANGLE hitang;
    sint16 *bounds;

    x = laraitem->pos.x_pos - item->pos.x_pos;
    z = laraitem->pos.z_pos - item->pos.z_pos;
    c = phd_cos(item->pos.y_rot);
    s = phd_sin(item->pos.y_rot);
    rx = (c * x - s * z) >> W2V_SHIFT;
    rz = (c * z + s * x) >> W2V_SHIFT;

    object = &objects[item->object_number];
    bounds = GetBestFrame(item);
    minx = *(bounds + 0);
    maxx = *(bounds + 1);
    minz = *(bounds + 4);
    maxz = *(bounds + 5);
    if (bigpush)
    {
        minx -= coll->radius;
        maxx += coll->radius;
        minz -= coll->radius;
        maxz += coll->radius;
    }

    if (rx >= minx && rx <= maxx && rz >= minz && rz <= maxz)
    {
        l = rx - minx;
        r = maxx - rx;
        t = maxz - rz;
        b = rz - minz;

        if (l <= r && l <= t && l <= b)
            rx -= l;
        else if (r <= l && r <= t && r <= b)
            rx += r;
        else if (t <= l && t <= r && t <= b)
            rz += t;
        else
            rz -= b;

        ax = (c * rx + s * rz) >> W2V_SHIFT;
        az = (c * rz - s * rx) >> W2V_SHIFT;

        laraitem->pos.x_pos = item->pos.x_pos + ax;
        laraitem->pos.z_pos = item->pos.z_pos + az;

        rx = (*(bounds + 0) + *(bounds + 1)) / 2;
        rz = (*(bounds + 4) + *(bounds + 5)) / 2;
        x -= (c * rx + s * rz) >> W2V_SHIFT;
        z -= (c * rz - s * rx) >> W2V_SHIFT;
        if (enable_hit)
        {
            hitang = (sint16)(laraitem->pos.y_rot - (32768 + phd_atan(z, x)));
            lara.hit_direction = (uint16)(hitang + 0x2000) / 0x4000;
            if (!lara.hit_frame)
                SoundEffect(27, &laraitem->pos, 0);

            lara.hit_frame++;
            if (lara.hit_frame > 34)
                lara.hit_frame = 34;
        }

        coll->bad_pos = NO_BAD_POS;
        coll->bad_neg = -STEPUP_HEIGHT;
        coll->bad_ceiling = 0;
        hitang = coll->facing;
        coll->facing = (sint16)phd_atan(laraitem->pos.z_pos - coll->old.z, laraitem->pos.x_pos - coll->old.x);
        GetCollisionInfo(coll, laraitem->pos.x_pos, laraitem->pos.y_pos, laraitem->pos.z_pos, laraitem->room_number,
                         LARA_HITE);
        coll->facing = hitang;
        if (coll->coll_type != COLL_NONE)
        {
            laraitem->pos.x_pos = coll->old.x;
            laraitem->pos.z_pos = coll->old.z;
        }
        else
        {
            coll->old.x = laraitem->pos.x_pos;
            coll->old.y = laraitem->pos.y_pos;
            coll->old.z = laraitem->pos.z_pos;
            UpdateLaraRoom(laraitem, -10);
        }
    }
}

int TestBoundsCollide(ITEM_INFO *item, ITEM_INFO *laraitem, sint32 radius)
{
    sint16 *larabounds, *bounds;
    OBJECT_INFO *object;
    sint32 c, s, rx, rz, x, z;
    sint32 minx, maxx, minz, maxz;

    object = &objects[item->object_number];
    bounds = GetBestFrame(item);
    object = &objects[laraitem->object_number];
    larabounds = GetBestFrame(laraitem);
    if (item->pos.y_pos + *(bounds + 3) <= laraitem->pos.y_pos + *(larabounds + 2) ||
        item->pos.y_pos + *(bounds + 2) >= laraitem->pos.y_pos + *(larabounds + 3))
        return 0;

    c = phd_cos(item->pos.y_rot);
    s = phd_sin(item->pos.y_rot);
    x = laraitem->pos.x_pos - item->pos.x_pos;
    z = laraitem->pos.z_pos - item->pos.z_pos;
    rx = (c * x - s * z) >> W2V_SHIFT;
    rz = (c * z + s * x) >> W2V_SHIFT;
    minx = *(bounds + 0) - radius;
    maxx = *(bounds + 1) + radius;
    minz = *(bounds + 4) - radius;
    maxz = *(bounds + 5) + radius;
    if (rx >= minx && rx <= maxx && rz >= minz && rz <= maxz)
        return 1;

    return 0;
}

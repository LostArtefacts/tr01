#include "game.h"

CAMERA_INFO camera;

#define MIN_SQUARE SQUARE(WALL_L / 4)
#define MIN_CAM_ANGLE (ONE_DEGREE / 2)

#define GROUND_SHIFT (STEP_L)

#define MAX_ELEVATION (ONE_DEGREE * 85)

#define MAX_HEAD_ROTATION (50 * ONE_DEGREE)

#define MAX_HEAD_TILT (85 * ONE_DEGREE)
#define MIN_HEAD_TILT (-85 * ONE_DEGREE)
#define HEAD_TURN (4 * ONE_DEGREE)

#define CHASE_SPEED 12
#define COMBAT_SPEED 8
#define COMBAT_DISTANCE (WALL_L * 5 / 2)
#define LOOK_SPEED 4

void InitialiseCamera(void)
{
    camera.target.x = lara_item->pos.x_pos;
    camera.target.y = camera.shift = lara_item->pos.y_pos - WALL_L;
    camera.target.z = lara_item->pos.z_pos;
    camera.target.room_number = lara_item->room_number;

    camera.pos.x = camera.target.x;
    camera.pos.y = camera.target.y;
    camera.pos.z = camera.target.z - 100;
    camera.pos.room_number = camera.target.room_number;

    camera.target_distance = WALL_L * 3 / 2;
    camera.item = NULL;

    camera.number_frames = 1;
    camera.type = CHASE_CAMERA;
    camera.flags = 0;

    camera.bounce = 0;

    camera.number = NO_CAMERA;

    CalculateCamera();
}

void MoveCamera(GAME_VECTOR *ideal, int speed)
{
    sint32 height, ceiling, shake;
    FLOOR_INFO *floor;

    camera.pos.x += (ideal->x - camera.pos.x) / speed;
    camera.pos.z += (ideal->z - camera.pos.z) / speed;
    camera.pos.y += (ideal->y - camera.pos.y) / speed;
    camera.pos.room_number = ideal->room_number;

    chunky_flag = 0;

    floor = GetFloor(camera.pos.x, camera.pos.y, camera.pos.z, &camera.pos.room_number);
    height = GetHeight(floor, camera.pos.x, camera.pos.y, camera.pos.z) - GROUND_SHIFT;

    if (camera.pos.y >= height && ideal->y >= height)
    {
        LOS(&camera.target, &camera.pos);
        floor = GetFloor(camera.pos.x, camera.pos.y, camera.pos.z, &camera.pos.room_number);
        height = GetHeight(floor, camera.pos.x, camera.pos.y, camera.pos.z) - GROUND_SHIFT;
    }

    ceiling = GetCeiling(floor, camera.pos.x, camera.pos.y, camera.pos.z) + GROUND_SHIFT;
    if (height < ceiling)
        height = ceiling = (height + ceiling) >> 1;

    if (camera.bounce)
    {
        if (camera.bounce > 0)
        {
            camera.pos.y += camera.bounce;
            camera.target.y += camera.bounce;
            camera.bounce = 0;
        }
        else
        {
            shake = (GetRandomControl() - 0x4000) * camera.bounce / 0x7fff;
            camera.pos.x += shake;
            camera.target.y += shake;
            shake = (GetRandomControl() - 0x4000) * camera.bounce / 0x7fff;
            camera.pos.y += shake;
            camera.target.y += shake;
            shake = (GetRandomControl() - 0x4000) * camera.bounce / 0x7fff;
            camera.pos.z += shake;
            camera.target.z += shake;
            camera.bounce += 5;
        }
    }

    if (camera.pos.y > height)
        camera.shift = height - camera.pos.y;
    else if (camera.pos.y < ceiling)
        camera.shift = ceiling - camera.pos.y;
    else
        camera.shift = 0;

    GetFloor(camera.pos.x, camera.pos.y + camera.shift, camera.pos.z, &camera.pos.room_number);

    phd_LookAt(camera.pos.x, camera.pos.y + camera.shift, camera.pos.z, camera.target.x, camera.target.y,
               camera.target.z, 0);

    camera.actual_angle = (sint16)phd_atan(camera.target.z - camera.pos.z, camera.target.x - camera.pos.x);
}

void ClipCamera(sint32 *x, sint32 *y, sint32 target_x, sint32 target_y, sint32 left, sint32 top, sint32 right, sint32 bottom)
{
    if ((right > left) ^ (target_x < left))
    {
        *y = target_y + (*y - target_y) * (left - target_x) / (*x - target_x);
        *x = left;
    }

    if ((bottom > top && target_y > top && *y < top) || (bottom < top && target_y < top && *y > top))
    {
        *x = target_x + (*x - target_x) * (top - target_y) / (*y - target_y);
        *y = top;
    }
}

void ShiftCamera(sint32 *x, sint32 *y, sint32 target_x, sint32 target_y, sint32 left, sint32 top, sint32 right, sint32 bottom)
{
    sint32 shift, TL_square, BL_square, TR_square;

    TL_square = SQUARE(target_x - left) + SQUARE(target_y - top);
    BL_square = SQUARE(target_x - left) + SQUARE(target_y - bottom);
    TR_square = SQUARE(target_x - right) + SQUARE(target_y - top);

    if (camera.target_square < TL_square)
    {
        *x = left;
        shift = camera.target_square - SQUARE(target_x - left);
        if (shift < 0)
            return;

        shift = phd_sqrt(shift);
        *y = target_y + ((top < bottom) ? -shift : shift);
    }
    else if (TL_square > MIN_SQUARE)
    {
        *x = left;
        *y = top;
    }
    else if (camera.target_square < BL_square)
    {
        *x = left;
        shift = camera.target_square - SQUARE(target_x - left);
        if (shift < 0)
            return;

        shift = phd_sqrt(shift);
        *y = target_y + ((top < bottom) ? shift : -shift);
    }
    else if (BL_square > MIN_SQUARE)
    {
        *x = left;
        *y = bottom;
    }
    else if (camera.target_square < TR_square)
    {
        shift = camera.target_square - SQUARE(target_y - top);
        if (shift < 0)
            return;

        shift = phd_sqrt(shift);
        *x = target_x + ((left < right) ? shift : -shift);
        *y = top;
    }
    else
    {
        *x = right;
        *y = top;
    }
}

int BadPosition(sint32 x, sint32 y, sint32 z, sint16 room_number)
{
    FLOOR_INFO *floor;

    floor = GetFloor(x, y, z, &room_number);
    if (y >= GetHeight(floor, x, y, z) || y <= GetCeiling(floor, x, y, z))
        return 1;

    return 0;
}

void SmartShift(GAME_VECTOR *ideal, void (*shift)(sint32 *x, sint32 *y, sint32 target_x, sint32 target_y, sint32 left, sint32 top, sint32 right, sint32 bottom))
{
    int noclip;
    ROOM_INFO *r;
    sint16 item_box, camera_box;
    BOX_INFO *box;
    int x_floor, y_floor;
    sint32 left, right, top, bottom;
    int bad_left, bad_right, bad_top, bad_bottom;

    LOS(&camera.target, ideal);

    r = &room[camera.target.room_number];
    x_floor = (camera.target.z - r->z) >> WALL_SHIFT;
    y_floor = (camera.target.x - r->x) >> WALL_SHIFT;
    item_box = r->floor[x_floor + y_floor * r->x_size].box;

    box = &boxes[item_box];

    r = &room[ideal->room_number];
    x_floor = (ideal->z - r->z) >> WALL_SHIFT;
    y_floor = (ideal->x - r->x) >> WALL_SHIFT;
    camera_box = r->floor[x_floor + y_floor * r->x_size].box;

    if (camera_box != NO_BOX && (ideal->z < box->left || ideal->z > box->right || ideal->x < box->top ||
        ideal->x > box->bottom))
    {
        box = &boxes[camera_box];
    }

    left = box->left;
    right = box->right;
    top = box->top;
    bottom = box->bottom;

    bad_left = BadPosition(ideal->x, ideal->y, (ideal->z - WALL_L) | (WALL_L - 1), ideal->room_number);
    if (!bad_left)
    {
        camera_box = r->floor[x_floor - 1 + y_floor * r->x_size].box;
        if (camera_box != NO_ITEM && boxes[camera_box].left < left)
            left = boxes[camera_box].left;
    }

    bad_right = BadPosition(ideal->x, ideal->y, (ideal->z + WALL_L) & ~(WALL_L - 1), ideal->room_number);
    if (!bad_right)
    {
        camera_box = r->floor[x_floor + 1 + y_floor * r->x_size].box;
        if (camera_box != NO_ITEM && boxes[camera_box].right > right)
            right = boxes[camera_box].right;
    }

    bad_top = BadPosition((ideal->x - WALL_L) | (WALL_L - 1), ideal->y, ideal->z, ideal->room_number);
    if (!bad_top)
    {
        camera_box = r->floor[x_floor + (y_floor - 1) * r->x_size].box;
        if (camera_box != NO_ITEM && boxes[camera_box].top < top)
            top = boxes[camera_box].top;
    }

    bad_bottom = BadPosition((ideal->x + WALL_L) & ~(WALL_L - 1), ideal->y, ideal->z, ideal->room_number);
    if (!bad_bottom)
    {
        camera_box = r->floor[x_floor + (y_floor + 1) * r->x_size].box;
        if (camera_box != NO_ITEM && boxes[camera_box].bottom > bottom)
            bottom = boxes[camera_box].bottom;
    }

    left += STEP_L;
    right -= STEP_L;
    top += STEP_L;
    bottom -= STEP_L;

    noclip = 1;
    if (ideal->z < left && bad_left)
    {
        noclip = 0;
        if (ideal->x < camera.target.x)
            (*shift)(&ideal->z, &ideal->x, camera.target.z, camera.target.x, left, top, right, bottom);
        else
            (*shift)(&ideal->z, &ideal->x, camera.target.z, camera.target.x, left, bottom, right, top);
    }
    else if (ideal->z > right && bad_right)
    {
        noclip = 0;
        if (ideal->x < camera.target.x)
            (*shift)(&ideal->z, &ideal->x, camera.target.z, camera.target.x, right, top, left, bottom);
        else
            (*shift)(&ideal->z, &ideal->x, camera.target.z, camera.target.x, right, bottom, left, top);
    }

    if (noclip)
    {
        if (ideal->x < top && bad_top)
        {
            noclip = 0;
            if (ideal->z < camera.target.z)
                (*shift)(&ideal->x, &ideal->z, camera.target.x, camera.target.z, top, left, bottom, right);
            else
                (*shift)(&ideal->x, &ideal->z, camera.target.x, camera.target.z, top, right, bottom, left);
        }
        else if (ideal->x > bottom && bad_bottom)
        {
            noclip = 0;
            if (ideal->z < camera.target.z)
                (*shift)(&ideal->x, &ideal->z, camera.target.x, camera.target.z, bottom, left, top, right);
            else
                (*shift)(&ideal->x, &ideal->z, camera.target.x, camera.target.z, bottom, right, top, left);
        }
    }

    if (!noclip)
        GetFloor(ideal->x, ideal->y, ideal->z, &ideal->room_number);
}

void ChaseCamera(ITEM_INFO *item)
{
    GAME_VECTOR ideal;
    sint32 distance;
    sint16 angle;

    camera.target_elevation += item->pos.x_rot;
    if (camera.target_elevation > MAX_ELEVATION)
        camera.target_elevation = MAX_ELEVATION;
    else if (camera.target_elevation < -MAX_ELEVATION)
        camera.target_elevation = -MAX_ELEVATION;

    distance = camera.target_distance * phd_cos(camera.target_elevation) >> W2V_SHIFT;
    ideal.y = camera.target.y + (camera.target_distance * phd_sin(camera.target_elevation) >> W2V_SHIFT);

    camera.target_square = SQUARE(distance);

    angle = item->pos.y_rot + camera.target_angle;
    ideal.x = camera.target.x - (distance * phd_sin(angle) >> W2V_SHIFT);
    ideal.z = camera.target.z - (distance * phd_cos(angle) >> W2V_SHIFT);
    ideal.room_number = camera.pos.room_number;

    SmartShift(&ideal, ShiftCamera);

    if (camera.fixed_camera)
        MoveCamera(&ideal, camera.speed);
    else
        MoveCamera(&ideal, CHASE_SPEED);
}

int ShiftClamp(GAME_VECTOR *pos, sint32 clamp)
{
    sint32 height, ceiling, shift, x, y, z;
    FLOOR_INFO *floor;
    BOX_INFO *box;

    x = pos->x;
    y = pos->y;
    z = pos->z;

    floor = GetFloor(x, y, z, &pos->room_number);

    box = &boxes[floor->box];
    if (z < box->left + clamp && BadPosition(x, y, z - clamp, pos->room_number))
        pos->z = box->left + clamp;
    else if (z > box->right - clamp && BadPosition(x, y, z + clamp, pos->room_number))
        pos->z = box->right - clamp;

    if (x < box->top + clamp && BadPosition(x - clamp, y, z, pos->room_number))
        pos->x = box->top + clamp;
    else if (x > box->bottom - clamp && BadPosition(x + clamp, y, z, pos->room_number))
        pos->x = box->bottom - clamp;

    height = GetHeight(floor, x, y, z) - clamp;
    ceiling = GetCeiling(floor, x, y, z) + clamp;

    if (height < ceiling)
        height = ceiling = (height + ceiling) >> 1;

    if (y > height)
        shift = height - y;
    else if (pos->y < ceiling)
        shift = ceiling - y;
    else
        shift = 0;

    return shift;
}

void CombatCamera(ITEM_INFO *item)
{
    sint32 distance;
    GAME_VECTOR ideal;

    camera.target.z = item->pos.z_pos;
    camera.target.x = item->pos.x_pos;

    if (lara.target)
    {
        camera.target_angle = item->pos.y_rot + lara.target_angles[0];
        camera.target_elevation = item->pos.x_rot + lara.target_angles[1];
    }
    else
    {
        camera.target_angle = item->pos.y_rot + lara.head_y_rot + lara.torso_y_rot;
        camera.target_elevation = item->pos.x_rot + lara.head_x_rot + lara.torso_x_rot;
    }

    camera.target_distance = COMBAT_DISTANCE;

    distance = camera.target_distance * phd_cos(camera.target_elevation) >> W2V_SHIFT;

    ideal.x = camera.target.x - (distance * phd_sin(camera.target_angle) >> W2V_SHIFT);
    ideal.y = camera.target.y + (camera.target_distance * phd_sin(camera.target_elevation) >> W2V_SHIFT);
    ideal.z = camera.target.z - (distance * phd_cos(camera.target_angle) >> W2V_SHIFT);
    ideal.room_number = camera.pos.room_number;

    SmartShift(&ideal, ShiftCamera);

    MoveCamera(&ideal, camera.speed);
}

void LookCamera(ITEM_INFO *item)
{
    sint32 distance;
    GAME_VECTOR ideal, old;

    old.z = camera.target.z;
    old.x = camera.target.x;

    camera.target.z = item->pos.z_pos;
    camera.target.x = item->pos.x_pos;

    camera.target_angle = item->pos.y_rot + lara.head_y_rot + lara.torso_y_rot;
    camera.target_elevation = item->pos.x_rot + lara.head_x_rot + lara.torso_x_rot;
    camera.target_distance = WALL_L * 3 / 2;

    distance = camera.target_distance * phd_cos(camera.target_elevation) >> W2V_SHIFT;

    camera.shift = -STEP_L * 2 * phd_sin(camera.target_elevation) >> W2V_SHIFT;
    camera.target.z += camera.shift * phd_cos(item->pos.y_rot) >> W2V_SHIFT;
    camera.target.x += camera.shift * phd_sin(item->pos.y_rot) >> W2V_SHIFT;

    if (BadPosition(camera.target.x, camera.target.y, camera.target.z, camera.target.room_number))
    {
        camera.target.x = item->pos.x_pos;
        camera.target.z = item->pos.z_pos;
    }

    camera.target.y += ShiftClamp(&camera.target, STEP_L + 50);

    ideal.x = camera.target.x - (distance * phd_sin(camera.target_angle) >> W2V_SHIFT);
    ideal.y = camera.target.y + (camera.target_distance * phd_sin(camera.target_elevation) >> W2V_SHIFT);
    ideal.z = camera.target.z - (distance * phd_cos(camera.target_angle) >> W2V_SHIFT);
    ideal.room_number = camera.pos.room_number;

    SmartShift(&ideal, ClipCamera);

    camera.target.z = old.z + (camera.target.z - old.z) / camera.speed;
    camera.target.x = old.x + (camera.target.x - old.x) / camera.speed;

    MoveCamera(&ideal, camera.speed);
}

void FixedCamera(void)
{
    GAME_VECTOR ideal;
    OBJECT_VECTOR *fixed;

    fixed = &camera.fixed[camera.number];
    ideal.x = fixed->x;
    ideal.y = fixed->y;
    ideal.z = fixed->z;
    ideal.room_number = fixed->data;

    if (!LOS(&camera.target, &ideal))
        ShiftClamp(&ideal, STEP_L);

    camera.fixed_camera = 1;

    MoveCamera(&ideal, camera.speed);

    if (camera.timer)
    {
        camera.timer--;
        if (!camera.timer)
            camera.timer = -1;
    }
}

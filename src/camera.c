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

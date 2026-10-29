#include "game.h"
#include <string.h>

#define LIGHTENING_DAMAGE 400

#define STEPS 8
#define RND ((64 << W2V_SHIFT) / 32768)

#define SHOOTS 2

struct lightning
{
    int onstate, count, zapped, notarget;
    PHD_VECTOR target;
    PHD_VECTOR main[STEPS], wibble[STEPS];
    int start[SHOOTS];
    PHD_VECTOR end[SHOOTS];
    PHD_VECTOR shoot[SHOOTS][STEPS];
};

void DrawLightning(ITEM_INFO *item)
{
    sint32 i, j, clip, steps;
    sint32 x1, y1, z1, x2, y2, z2, dx, dy, dz;
    sint16 *frmptr[2];
    int rate;
    struct lightning *l;
    PHD_VECTOR *pos;

    GetFrames(item, frmptr, &rate);

    phd_PushMatrix();
    phd_TranslateAbs(item->pos.x_pos, item->pos.y_pos, item->pos.z_pos);
    phd_RotYXZ(item->pos.y_rot, item->pos.x_rot, item->pos.z_rot);

    if ((clip = S_GetObjectBounds(frmptr[0])))
    {
        CalculateObjectLighting(item, frmptr[0]);

        phd_TranslateRel((sint32)*(frmptr[0] + 6), (sint32)*(frmptr[0] + 7), (sint32)*(frmptr[0] + 8));

        x1 = *(phd_mxptr + M03);
        y1 = *(phd_mxptr + M13);
        z1 = *(phd_mxptr + M23);

        phd_PutPolygons(meshes[objects[LIGHTNING_EMITTER].mesh_index], clip);

        phd_PopMatrix();

        l = (struct lightning *)item->data;
        if (!l->onstate)
            return;

        phd_PushMatrix();

        phd_TranslateAbs(l->target.x, l->target.y, l->target.z);
        phd_RotYXZ(item->pos.y_rot, item->pos.x_rot, item->pos.z_rot);

        x2 = *(phd_mxptr + M03);
        y2 = *(phd_mxptr + M13);
        z2 = *(phd_mxptr + M23);

        dx = (x2 - x1) / STEPS;
        dy = (y2 - y1) / STEPS;
        dz = (z2 - z1) / STEPS;

        for (i = 0, pos = l->wibble; i < STEPS; i++, pos++)
        {
            pos->x += (GetRandomDraw() - 0x4000) * RND;
            pos->y += (GetRandomDraw() - 0x4000) * RND;
            pos->z += (GetRandomDraw() - 0x4000) * RND;

            if (i == STEPS - 1)
                pos->y = 0;

            x2 = x1 + dx + pos->x;
            y2 = y1 + dy + pos->y;
            z2 = z1 + dz + pos->z;

            if (i > 0)
                S_DrawLighteningSegment(x1, y1 + l->wibble[i - 1].y, z1, x2, y2, z2, phd_winwidth / 6);
            else
                S_DrawLighteningSegment(x1, y1, z1, x2, y2, z2, phd_winwidth / 6);

            x1 = x2;
            y1 += dy;
            z1 = z2;

            l->main[i].x = x2;
            l->main[i].y = y2;
            l->main[i].z = z2;
        }

        for (i = 0; i < SHOOTS; i++)
        {
            j = l->start[i];
            x1 = l->main[j].x;
            y1 = l->main[j].y;
            z1 = l->main[j].z;

            phd_PopMatrix();
            phd_PushMatrix();

            phd_TranslateAbs(l->end[i].x, l->end[i].y, l->end[i].z);
            phd_RotYXZ(item->pos.y_rot, item->pos.x_rot, item->pos.z_rot);

            x2 = *(phd_mxptr + M03);
            y2 = *(phd_mxptr + M13);
            z2 = *(phd_mxptr + M23);

            steps = STEPS - j;

            dx = (x2 - x1) / steps;
            dy = (y2 - y1) / steps;
            dz = (z2 - z1) / steps;

            for (j = 0, pos = l->shoot[i]; j < steps; j++, pos++)
            {
                pos->x += (GetRandomDraw() - 0x4000) * RND;
                pos->y += (GetRandomDraw() - 0x4000) * RND;
                pos->z += (GetRandomDraw() - 0x4000) * RND;

                if (j == steps - 1)
                    pos->y = 0;

                x2 = x1 + dx + pos->x;
                y2 = y1 + dy + pos->y;
                z2 = z1 + dz + pos->z;

                if (j > 0)
                    S_DrawLighteningSegment(x1, y1 + l->shoot[i][j - 1].y, z1, x2, y2, z2, phd_winwidth / 16);
                else
                    S_DrawLighteningSegment(x1, y1, z1, x2, y2, z2, phd_winwidth / 16);

                x1 = x2;
                y1 += dy;
                z1 = z2;
            }
        }
    }
    phd_PopMatrix();
}

void InitialiseLightning(sint16 item_num)
{
    struct lightning *l;

    items[item_num].data = l = (struct lightning *)game_malloc(sizeof(struct lightning), 0);

    if (objects[items[item_num].object_number].nmeshes > 1)
    {
        items[item_num].mesh_bits = 1;
        l->notarget = 0;
    }
    else
        l->notarget = 1;

    l->onstate = 0;
    l->count = 1;
    l->zapped = 0;
}

void LightningControl(sint16 item_number)
{
    sint32 i, j, radius;
    ITEM_INFO *item;
    FLOOR_INFO *floor;
    struct lightning *l;

    item = &items[item_number];
    l = (struct lightning *)item->data;

    if (TriggerActive(item))
    {
        l->count--;
        if (l->count <= 0)
        {
            if (l->onstate)
            {
                l->onstate = 0;
                l->count = 35 + (GetRandomControl() * 45) / 32768;
                l->zapped = 0;
                if (flip_status)
                    FlipMap();
            }
            else
            {
                l->onstate = 1;
                l->count = 20;

                for (i = 0; i < STEPS; i++)
                    l->wibble[i].x = l->wibble[i].y = l->wibble[i].z = 0;

                radius = (l->notarget) ? WALL_L : WALL_L * 5 / 2;
                if (ItemNearLara(&item->pos, radius))
                {
                    l->target.x = lara_item->pos.x_pos;
                    l->target.y = lara_item->pos.y_pos;
                    l->target.z = lara_item->pos.z_pos;

                    lara_item->hit_points -= LIGHTENING_DAMAGE;
                    lara_item->hit_status = 1;

                    l->zapped = 1;
                }
                else if (l->notarget)
                {
                    l->target.x = item->pos.x_pos;
                    l->target.z = item->pos.z_pos;
                    floor = GetFloor(item->pos.x_pos, item->pos.y_pos, item->pos.z_pos, &item->room_number);
                    l->target.y = GetHeight(floor, item->pos.x_pos, item->pos.y_pos, item->pos.z_pos);
                    l->zapped = 0;
                }
                else
                {
                    l->target.x = l->target.y = l->target.z = 0;
                    GetJointAbsPosition(item, &(l->target), GetRandomControl() * 5 / 0x7fff + 1);
                    l->zapped = 0;
                }

                for (i = 0; i < SHOOTS; i++)
                {
                    l->start[i] = GetRandomControl() * (STEPS - 1) / 0x7fff;
                    l->end[i].x = l->target.x + GetRandomControl() * WALL_L / 0x7fff;
                    l->end[i].y = l->target.y;
                    l->end[i].z = l->target.z + GetRandomControl() * WALL_L / 0x7fff;

                    for (j = 0; j < STEPS; j++)
                        l->shoot[i][j].x = l->shoot[i][j].y = l->shoot[i][j].z = 0;
                }

                if (!flip_status)
                    FlipMap();
            }

            SoundEffect(98, (PHD_3DPOS *)&item->pos, NULL);
        }
    }
    else
    {
        l->count = 1;
        l->onstate = 0;
        l->zapped = 0;
        if (flip_status)
            FlipMap();

        RemoveActiveItem(item_number);
        item->status = NOT_ACTIVE;
    }
}

void LightningCollision(sint16 item_num, ITEM_INFO *laraitem, COLL_INFO *coll)
{
    struct lightning *l;

    l = (struct lightning *)items[item_num].data;
    if (!l->zapped)
        return;

    lara.hit_direction = (sint16)(GetRandomControl() * 4 / 0x7fff + 1);
    lara.hit_frame++;
    if (lara.hit_frame > 34)
        lara.hit_frame = 34;
}

enum hammer_states
{
    TH_SET,
    TH_TEASE,
    TH_ACTIVE,
    TH_DONE
};

void InitialiseThorsHandle(sint16 item_num)
{
    ITEM_INFO *handitem;
    ITEM_INFO *headitem;
    sint16 headnum;

    handitem = &items[item_num];
    headnum = CreateItem();
    headitem = &items[headnum];
    headitem->object_number = THORS_HEAD;
    headitem->room_number = handitem->room_number;
    memcpy(&headitem->pos, &handitem->pos, sizeof(PHD_3DPOS));
    headitem->shade = handitem->shade;
    InitialiseItem(headnum);
    handitem->data = (void *)headitem;
    level_items++;
}

void ThorsHandleControl(sint16 item_number)
{
    FLOOR_INFO *floor;
    ITEM_INFO *item, *headitem;
    sint16 room_number;
    int oldx, x, oldz, z;
    sint16 frm, anm;

    item = &items[item_number];
    switch (item->current_anim_state)
    {
    case TH_SET:
        if (TriggerActive(item))
            item->goal_anim_state = TH_TEASE;
        else
        {
            RemoveActiveItem(item_number);
            item->status = NOT_ACTIVE;
        }
        break;

    case TH_TEASE:
        if (TriggerActive(item))
            item->goal_anim_state = TH_ACTIVE;
        else
            item->goal_anim_state = TH_SET;
        break;

    case TH_ACTIVE:
        frm = item->frame_number - anims[item->anim_number].frame_base;
        if (frm > 30)
        {
            x = item->pos.x_pos;
            z = item->pos.z_pos;
            switch (item->pos.y_rot)
            {
            case 0:
                z += WALL_L * 3;
                break;
            case 16384:
                x += WALL_L * 3;
                break;
            case -16384:
                x -= WALL_L * 3;
                break;
            case -32768:
                z -= WALL_L * 3;
                break;
            }
            if (lara_item->hit_points >= 0 && lara_item->pos.x_pos > x - 520 && lara_item->pos.x_pos < x + 520 && lara_item->pos.z_pos > z - 520 && lara_item->pos.z_pos < z + 520)
            {
                lara_item->hit_points = -1;
                lara_item->pos.y_pos = item->pos.y_pos;
                lara_item->gravity_status = 0;
                lara_item->anim_number = RBALL_DEATH_A;
                lara_item->frame_number = RBALL_DEATH_F;
                lara_item->current_anim_state = AS_SPECIAL;
                lara_item->goal_anim_state = AS_SPECIAL;
            }
        }
        break;

    case TH_DONE:
        room_number = item->room_number;
        x = item->pos.x_pos;
        z = item->pos.z_pos;
        floor = GetFloor(x, item->pos.y_pos, z, &room_number);
        GetHeight(floor, x, item->pos.y_pos, z);
        TestTriggers(trigger_index, 1);
        oldx = x;
        oldz = z;
        switch (item->pos.y_rot)
        {
        case 0:
            z += WALL_L * 3;
            break;
        case 16384:
            x += WALL_L * 3;
            break;
        case -16384:
            x -= WALL_L * 3;
            break;
        case -32768:
            z -= WALL_L * 3;
            break;
        }
        item->pos.x_pos = x;
        item->pos.z_pos = z;
        if (lara_item->hit_points >= 0)
            AlterFloorHeight(item, -2 * WALL_L);
        item->pos.x_pos = oldx;
        item->pos.z_pos = oldz;

        RemoveActiveItem(item_number);
        item->status = DEACTIVATED;
        break;
    }
    AnimateItem(item);

    headitem = (ITEM_INFO *)item->data;
    anm = item->anim_number - objects[THORS_HANDLE].anim_index;
    frm = item->frame_number - anims[item->anim_number].frame_base;
    headitem->anim_number = objects[THORS_HEAD].anim_index + anm;
    headitem->frame_number = anims[headitem->anim_number].frame_base + frm;
    headitem->current_anim_state = item->current_anim_state;
}

void ThorsHandleCollision(sint16 item_num, ITEM_INFO *laraitem, COLL_INFO *coll)
{
    ITEM_INFO *item;

    item = &items[item_num];
    if (!TestBoundsCollide(item, laraitem, coll->radius))
        return;
    if (coll->enable_baddie_push)
        ItemPushLara(item, laraitem, coll, 0, 1);
}

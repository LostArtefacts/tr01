#include "game.h"

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

#include "game.h"

#define ifkey(x) if (keydata->keymap[x])

#define K_Q 0x10
#define K_A 0x1e
#define K_COMMA 0x33
#define K_DOT 0x34

int KeyGet(void);
void print(int x, int y, char *fmt, ...);
void phd_PointLight(PHD_3DPOS *destpos, PHD_3DPOS *srcpos);

void view_texture_page(void)
{
    static int text_off = 0;
    int i, j, *ptr;
    uint8 *src, *dest;

    for (;; keydata->last_key = KeyGet())
    {
        ifkey(K_ESC)
            break;

        S_DumpScreen();
        ptr = (int *)phd_winptr;
        j = (phd_scrwidth * phd_winheight) / 4;
        for (i = 0; i < j; i++)
            *(ptr++) = 0;

        ifkey(K_UP)
            text_off--;
        ifkey(K_DOWN)
            text_off++;
        if (text_off < 0)
            text_off = 0;

        src = (uint8 *)texture_page_ptrs[0];
        src += text_off * 256;
        dest = phd_winptr;

        for (i = 0; i <= phd_winymax; i++)
        {
            for (j = 0; j < 256; j++)
                *(dest + j) = *(src++);
            dest += phd_scrwidth;
        }
        print(200, 0, "ESC to EXIT");
        print(2, 0, "Y top:%d", text_off);
        print(2, 10, "Y bot:%d", text_off + phd_winymax);
    }
}

void view_objects(void)
{
    static int objnum = 0;
    int i, j;
    int *ptr;
    PHD_3DPOS objpos = {0, 0, 1000, 0, 0, 0};
    PHD_3DPOS campos = {0, 0, 0, 0, 0, 0};

    phd_left = 0;
    phd_right = phd_winxmax;
    phd_top = 0;
    phd_bottom = phd_winymax;
    phd_PointLight(&campos, &objpos);
    for (;; keydata->last_key = KeyGet())
    {
        ifkey(K_ESC)
            break;

        S_DumpScreen();

        ptr = (int *)phd_winptr;
        j = (phd_scrwidth * phd_winheight) / 4;
        for (i = 0; i < j; i++)
            *(ptr++) = 0;

        ifkey(K_UP)
            objpos.x_rot += 5 * ONE_DEGREE;
        ifkey(K_DOWN)
            objpos.x_rot -= 5 * ONE_DEGREE;
        ifkey(K_LEFT)
            objpos.y_rot += 5 * ONE_DEGREE;
        ifkey(K_RIGHT)
            objpos.y_rot -= 5 * ONE_DEGREE;
        ifkey(K_Q)
            objpos.z_pos -= 10;
        ifkey(K_A)
            objpos.z_pos += 10;

        ifkey(K_COMMA)
        {
            objnum--;
            while (keydata->keys_held)
                Sync();
        }
        ifkey(K_DOT)
        {
            objnum++;
            while (keydata->keys_held)
                Sync();
        }
        if (objnum < 0)
            objnum = 0;
        if (objnum > 200)
            objnum = 200;

        S_InitialisePolyList();
        phd_GenerateW2V(&campos);
        ls_adder = 0x1000;
        ls_divider = 0;
        phd_TranslateAbs(objpos.x_pos, objpos.y_pos, objpos.z_pos);
        phd_RotYXZ(objpos.y_rot, objpos.x_rot, objpos.z_rot);
        phd_PutPolygons(meshes[objnum], -1);
        S_OutputPolyList();

        print(200, 0, "ESC to EXIT");
        print(2, 0, "Obj Number:%d", objnum);
        print(2, 10, "Obj Dist:%d", objpos.z_pos);
    }
}

void view_depthq(void)
{
    int i, j;
    uint8 *ptr;

    for (;; keydata->last_key = KeyGet())
    {
        ifkey(K_ESC)
            break;

        S_DumpScreen();

        ptr = phd_winptr + phd_scrwidth * 32;
        for (j = 0; j < 32; j++, ptr += phd_scrwidth - 256)
        {
            for (i = 0; i < 256; i++)
                *(ptr++) = depthq_table[j][i];
        }

        ptr = phd_winptr + phd_scrwidth * 96;
        for (j = 0; j < 32; j++, ptr += phd_scrwidth - 256)
        {
            for (i = 0; i < 256; i++)
                *(ptr++) = gouraud_table[i][j];
        }
        print(200, 0, "ESC to EXIT");
    }
}

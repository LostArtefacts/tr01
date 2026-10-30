#include "3dglodef.h"

#define TRIGMULT2(A, B) (((A) * (B)) >> W2V_SHIFT)
#define TRIGMULT3(A, B, C) (TRIGMULT2((TRIGMULT2(A, B)), C))
#define CLAMP_XY 32760
#define DPQ_START 12288

extern sint32 matrix_stack[];
extern float phd_leftfloat, phd_rightfloat, phd_topfloat, phd_bottomfloat;
extern PHD_VECTOR ls_vector_view;

void phd_GetMatrixAngles(PHD_ANGLE *dest);
void phd_UnitMatrix(void);
sint16 *calc_vertice_light(sint16 *objptr);
sint16 *ins_objectGT4persp(sint16 *objptr, int number);
sint16 *ins_objectGT3persp(sint16 *objptr, int number);
sint16 *ins_objectGT4(sint16 *objptr, int number);
sint16 *ins_objectGT3(sint16 *objptr, int number);
sint16 *ins_objectG4(sint16 *objptr, int number);
sint16 *ins_objectG3(sint16 *objptr, int number);
sint16 *calc_roomvert(sint16 *objptr);
sint16 *ins_roomGT4(sint16 *objptr, int number);
sint16 *ins_roomGT3(sint16 *objptr, int number);
sint16 *ins_room_sprite(sint16 *objptr, int number);

void phd_GenerateW2V(PHD_3DPOS *viewpos)
{
    sint32 sx, sy, sz;
    sint32 cx, cy, cz;
    sint32 *mptr, *nptr;

    mptr = phd_mxptr = matrix_stack;
    nptr = w2v_matrix;

    sx = phd_sin(viewpos->x_rot);
    cx = phd_cos(viewpos->x_rot);
    sy = phd_sin(viewpos->y_rot);
    cy = phd_cos(viewpos->y_rot);
    sz = phd_sin(viewpos->z_rot);
    cz = phd_cos(viewpos->z_rot);

    *(nptr + M00) = *(mptr + M00) = (TRIGMULT3(sx, sy, sz) + TRIGMULT2(cy, cz));
    *(nptr + M01) = *(mptr + M01) = (TRIGMULT2(cx, sz));
    *(nptr + M02) = *(mptr + M02) = (TRIGMULT3(sx, cy, sz) - TRIGMULT2(sy, cz));
    *(nptr + M10) = *(mptr + M10) = (TRIGMULT3(sx, sy, cz) - TRIGMULT2(cy, sz));
    *(nptr + M11) = *(mptr + M11) = (TRIGMULT2(cx, cz));
    *(nptr + M12) = *(mptr + M12) = (TRIGMULT3(sx, cy, cz) + TRIGMULT2(sy, sz));
    *(nptr + M20) = *(mptr + M20) = (TRIGMULT2(cx, sy));
    *(nptr + M21) = *(mptr + M21) = -(sx);
    *(nptr + M22) = *(mptr + M22) = (TRIGMULT2(cx, cy));
    *(nptr + M03) = *(mptr + M03) = viewpos->x_pos;
    *(nptr + M13) = *(mptr + M13) = viewpos->y_pos;
    *(nptr + M23) = *(mptr + M23) = viewpos->z_pos;
}

void phd_LookAt(sint32 xsrc, sint32 ysrc, sint32 zsrc, sint32 xtar, sint32 ytar, sint32 ztar, PHD_ANGLE roll)
{
    PHD_ANGLE angles[2];
    PHD_3DPOS viewer;

    phd_GetVectorAngles(xtar - xsrc, ytar - ysrc, ztar - zsrc, angles);
    viewer.x_pos = xsrc;
    viewer.y_pos = ysrc;
    viewer.z_pos = zsrc;
    viewer.x_rot = angles[1];
    viewer.y_rot = angles[0];
    viewer.z_rot = roll;
    phd_GenerateW2V(&viewer);
}

void phd_GetVectorAngles(sint32 x, sint32 y, sint32 z, PHD_ANGLE *dest)
{
    PHD_ANGLE pitch;

    *(dest + 0) = (PHD_ANGLE)phd_atan(z, x);
    while ((sint16)x != x || (sint16)y != y || (sint16)z != z)
    {
        x >>= 2;
        y >>= 2;
        z >>= 2;
    }
    pitch = (PHD_ANGLE)phd_atan(phd_sqrt(x * x + z * z), y);
    if ((y > 0 && pitch > 0) || (y < 0 && pitch < 0))
        pitch = -pitch;
    *(dest + 1) = pitch;
}

void phd_NormaliseVector(sint32 x, sint32 y, sint32 z, sint32 *dest)
{
    sint32 len;

    if (x || y || z)
    {
        while ((sint16)x != x || (sint16)y != y || (sint16)z != z)
        {
            x >>= 2;
            y >>= 2;
            z >>= 2;
        }
        len = phd_sqrt(x * x + y * y + z * z);
        *(dest + 0) = (x << W2V_SHIFT) / len;
        *(dest + 1) = (y << W2V_SHIFT) / len;
        *(dest + 2) = (z << W2V_SHIFT) / len;
    }
    else
    {
        *(dest + 0) = 0;
        *(dest + 1) = 0;
        *(dest + 2) = 0;
    }
}

void phd_NormaliseMatrix(void)
{
    PHD_ANGLE angles[3];

    phd_GetMatrixAngles(angles);
    phd_UnitMatrix();
    phd_RotYXZ(angles[1], angles[0], angles[2]);
}

void phd_GetMatrixAngles(PHD_ANGLE *dest)
{
    PHD_ANGLE roll, pitch, yaw;
    sint32 sy, cy;
    sint32 *mptr = phd_mxptr;

    yaw = phd_atan(*(mptr + M22), *(mptr + M02));
    pitch = phd_atan(phd_sqrt(*(mptr + M22) * *(mptr + M22) + *(mptr + M02) * *(mptr + M02)), *(mptr + M12));
    sy = phd_sin(yaw);
    cy = phd_cos(yaw);
    roll = phd_atan(((cy * *(mptr + M00)) - (sy * *(mptr + M20))), ((sy * *(mptr + M21)) - (cy * *(mptr + M01))));
    if ((*(mptr + M12) >= 0 && pitch > 0) || (*(mptr + M12) < 0 && pitch < 0))
        pitch = -pitch;

    *(dest + 0) = pitch;
    *(dest + 1) = yaw;
    *(dest + 2) = roll;
}

void phd_RotX(PHD_ANGLE rx)
{
    sint32 sx, cx, r0, r1;
    sint32 *mptr;

    if (rx)
    {
        mptr = phd_mxptr;
        sx = phd_sin(rx);
        cx = phd_cos(rx);

        r0 = mptr[M01] * cx + mptr[M02] * sx;
        r1 = mptr[M02] * cx - mptr[M01] * sx;
        mptr[M01] = r0 >> W2V_SHIFT;
        mptr[M02] = r1 >> W2V_SHIFT;

        r0 = mptr[M11] * cx + mptr[M12] * sx;
        r1 = mptr[M12] * cx - mptr[M11] * sx;
        mptr[M11] = r0 >> W2V_SHIFT;
        mptr[M12] = r1 >> W2V_SHIFT;

        r0 = mptr[M21] * cx + mptr[M22] * sx;
        r1 = mptr[M22] * cx - mptr[M21] * sx;
        mptr[M21] = r0 >> W2V_SHIFT;
        mptr[M22] = r1 >> W2V_SHIFT;
    }
}

void phd_RotY(PHD_ANGLE ry)
{
    sint32 sy, cy, r0, r1;
    sint32 *mptr;

    if (ry)
    {
        mptr = phd_mxptr;
        sy = phd_sin(ry);
        cy = phd_cos(ry);

        r0 = *(mptr + M00) * cy - *(mptr + M02) * sy;
        r1 = *(mptr + M02) * cy + *(mptr + M00) * sy;
        *(mptr + M00) = r0 >> W2V_SHIFT;
        *(mptr + M02) = r1 >> W2V_SHIFT;

        r0 = *(mptr + M10) * cy - *(mptr + M12) * sy;
        r1 = *(mptr + M12) * cy + *(mptr + M10) * sy;
        *(mptr + M10) = r0 >> W2V_SHIFT;
        *(mptr + M12) = r1 >> W2V_SHIFT;

        r0 = *(mptr + M20) * cy - *(mptr + M22) * sy;
        r1 = *(mptr + M22) * cy + *(mptr + M20) * sy;
        *(mptr + M20) = r0 >> W2V_SHIFT;
        *(mptr + M22) = r1 >> W2V_SHIFT;
    }
}

void phd_RotZ(PHD_ANGLE rz)
{
    sint32 sz, cz, r0, r1;
    sint32 *mptr;

    if (rz)
    {
        mptr = phd_mxptr;
        sz = phd_sin(rz);
        cz = phd_cos(rz);

        r0 = *(mptr + M00) * cz + *(mptr + M01) * sz;
        r1 = *(mptr + M01) * cz - *(mptr + M00) * sz;
        *(mptr + M00) = r0 >> W2V_SHIFT;
        *(mptr + M01) = r1 >> W2V_SHIFT;

        r0 = *(mptr + M10) * cz + *(mptr + M11) * sz;
        r1 = *(mptr + M11) * cz - *(mptr + M10) * sz;
        *(mptr + M10) = r0 >> W2V_SHIFT;
        *(mptr + M11) = r1 >> W2V_SHIFT;

        r0 = *(mptr + M20) * cz + *(mptr + M21) * sz;
        r1 = *(mptr + M21) * cz - *(mptr + M20) * sz;
        *(mptr + M20) = r0 >> W2V_SHIFT;
        *(mptr + M21) = r1 >> W2V_SHIFT;
    }
}

void phd_RotYXZ(PHD_ANGLE ry, PHD_ANGLE rx, PHD_ANGLE rz)
{
    sint32 sina, cosa, r0, r1;
    sint32 *mptr;

    mptr = phd_mxptr;
    if (ry)
    {
        sina = phd_sin(ry);
        cosa = phd_cos(ry);
        r0 = *(mptr + M00) * cosa - *(mptr + M02) * sina;
        r1 = *(mptr + M02) * cosa + *(mptr + M00) * sina;
        *(mptr + M00) = r0 >> W2V_SHIFT;
        *(mptr + M02) = r1 >> W2V_SHIFT;
        r0 = *(mptr + M10) * cosa - *(mptr + M12) * sina;
        r1 = *(mptr + M12) * cosa + *(mptr + M10) * sina;
        *(mptr + M10) = r0 >> W2V_SHIFT;
        *(mptr + M12) = r1 >> W2V_SHIFT;
        r0 = *(mptr + M20) * cosa - *(mptr + M22) * sina;
        r1 = *(mptr + M22) * cosa + *(mptr + M20) * sina;
        *(mptr + M20) = r0 >> W2V_SHIFT;
        *(mptr + M22) = r1 >> W2V_SHIFT;
    }
    if (rx)
    {
        sina = phd_sin(rx);
        cosa = phd_cos(rx);
        r0 = *(mptr + M01) * cosa + *(mptr + M02) * sina;
        r1 = *(mptr + M02) * cosa - *(mptr + M01) * sina;
        *(mptr + M01) = r0 >> W2V_SHIFT;
        *(mptr + M02) = r1 >> W2V_SHIFT;
        r0 = *(mptr + M11) * cosa + *(mptr + M12) * sina;
        r1 = *(mptr + M12) * cosa - *(mptr + M11) * sina;
        *(mptr + M11) = r0 >> W2V_SHIFT;
        *(mptr + M12) = r1 >> W2V_SHIFT;
        r0 = *(mptr + M21) * cosa + *(mptr + M22) * sina;
        r1 = *(mptr + M22) * cosa - *(mptr + M21) * sina;
        *(mptr + M21) = r0 >> W2V_SHIFT;
        *(mptr + M22) = r1 >> W2V_SHIFT;
    }
    if (rz)
    {
        sina = phd_sin(rz);
        cosa = phd_cos(rz);
        r0 = *(mptr + M00) * cosa + *(mptr + M01) * sina;
        r1 = *(mptr + M01) * cosa - *(mptr + M00) * sina;
        *(mptr + M00) = r0 >> W2V_SHIFT;
        *(mptr + M01) = r1 >> W2V_SHIFT;
        r0 = *(mptr + M10) * cosa + *(mptr + M11) * sina;
        r1 = *(mptr + M11) * cosa - *(mptr + M10) * sina;
        *(mptr + M10) = r0 >> W2V_SHIFT;
        *(mptr + M11) = r1 >> W2V_SHIFT;
        r0 = *(mptr + M20) * cosa + *(mptr + M21) * sina;
        r1 = *(mptr + M21) * cosa - *(mptr + M20) * sina;
        *(mptr + M20) = r0 >> W2V_SHIFT;
        *(mptr + M21) = r1 >> W2V_SHIFT;
    }
}

void phd_RotYXZpack(sint32 rots)
{
    sint32 ang;
    sint32 sina, cosa, r0, r1;
    sint32 *mptr;

    mptr = phd_mxptr;
    ang = ((rots >> 10) & 1023) << 6;
    if (ang)
    {
        sina = phd_sin(ang);
        cosa = phd_cos(ang);
        r0 = *(mptr + M00) * cosa - *(mptr + M02) * sina;
        r1 = *(mptr + M02) * cosa + *(mptr + M00) * sina;
        *(mptr + M00) = r0 >> W2V_SHIFT;
        *(mptr + M02) = r1 >> W2V_SHIFT;
        r0 = *(mptr + M10) * cosa - *(mptr + M12) * sina;
        r1 = *(mptr + M12) * cosa + *(mptr + M10) * sina;
        *(mptr + M10) = r0 >> W2V_SHIFT;
        *(mptr + M12) = r1 >> W2V_SHIFT;
        r0 = *(mptr + M20) * cosa - *(mptr + M22) * sina;
        r1 = *(mptr + M22) * cosa + *(mptr + M20) * sina;
        *(mptr + M20) = r0 >> W2V_SHIFT;
        *(mptr + M22) = r1 >> W2V_SHIFT;
    }
    ang = ((rots >> 20) & 1023) << 6;
    if (ang)
    {
        sina = phd_sin(ang);
        cosa = phd_cos(ang);
        r0 = *(mptr + M01) * cosa + *(mptr + M02) * sina;
        r1 = *(mptr + M02) * cosa - *(mptr + M01) * sina;
        *(mptr + M01) = r0 >> W2V_SHIFT;
        *(mptr + M02) = r1 >> W2V_SHIFT;
        r0 = *(mptr + M11) * cosa + *(mptr + M12) * sina;
        r1 = *(mptr + M12) * cosa - *(mptr + M11) * sina;
        *(mptr + M11) = r0 >> W2V_SHIFT;
        *(mptr + M12) = r1 >> W2V_SHIFT;
        r0 = *(mptr + M21) * cosa + *(mptr + M22) * sina;
        r1 = *(mptr + M22) * cosa - *(mptr + M21) * sina;
        *(mptr + M21) = r0 >> W2V_SHIFT;
        *(mptr + M22) = r1 >> W2V_SHIFT;
    }
    ang = (rots & 1023) << 6;
    if (ang)
    {
        sina = phd_sin(ang);
        cosa = phd_cos(ang);
        r0 = *(mptr + M00) * cosa + *(mptr + M01) * sina;
        r1 = *(mptr + M01) * cosa - *(mptr + M00) * sina;
        *(mptr + M00) = r0 >> W2V_SHIFT;
        *(mptr + M01) = r1 >> W2V_SHIFT;
        r0 = *(mptr + M10) * cosa + *(mptr + M11) * sina;
        r1 = *(mptr + M11) * cosa - *(mptr + M10) * sina;
        *(mptr + M10) = r0 >> W2V_SHIFT;
        *(mptr + M11) = r1 >> W2V_SHIFT;
        r0 = *(mptr + M20) * cosa + *(mptr + M21) * sina;
        r1 = *(mptr + M21) * cosa - *(mptr + M20) * sina;
        *(mptr + M20) = r0 >> W2V_SHIFT;
        *(mptr + M21) = r1 >> W2V_SHIFT;
    }
}

int phd_TranslateRel(sint32 x, sint32 y, sint32 z)
{
    sint32 *mptr;

    mptr = phd_mxptr;
    *(mptr + M03) += *(mptr + M00) * x + *(mptr + M01) * y + *(mptr + M02) * z;
    *(mptr + M13) += *(mptr + M10) * x + *(mptr + M11) * y + *(mptr + M12) * z;
    *(mptr + M23) += *(mptr + M20) * x + *(mptr + M21) * y + *(mptr + M22) * z;
    if ((x = ABS(*(mptr + M03))) > phd_zfar || (y = ABS(*(mptr + M13))) > phd_zfar || (z = ABS(*(mptr + M23))) > phd_zfar)
        return 0;
    return 1;
}

void phd_TranslateAbs(sint32 x, sint32 y, sint32 z)
{
    sint32 *mptr = phd_mxptr;

    x -= *(w2v_matrix + M03);
    y -= *(w2v_matrix + M13);
    z -= *(w2v_matrix + M23);
    *(mptr + M03) = *(mptr + M00) * x + *(mptr + M01) * y + *(mptr + M02) * z;
    *(mptr + M13) = *(mptr + M10) * x + *(mptr + M11) * y + *(mptr + M12) * z;
    *(mptr + M23) = *(mptr + M20) * x + *(mptr + M21) * y + *(mptr + M22) * z;
}

int visible_zclip(PHD_VBUF *vn1, PHD_VBUF *vn2, PHD_VBUF *vn3)
{
    double v1x, v1y, v1z;
    double v2x, v2y, v2z;
    double v3x, v3y, v3z;
    double a, b, c;

    v1x = (double)vn1->xv;
    v1y = (double)vn1->yv;
    v1z = (double)vn1->zv;
    v2x = (double)vn2->xv;
    v2y = (double)vn2->yv;
    v2z = (double)vn2->zv;
    v3x = (double)vn3->xv;
    v3y = (double)vn3->yv;
    v3z = (double)vn3->zv;
    a = (v3y * v1x) - (v1y * v3x);
    b = (v3x * v1z) - (v1x * v3z);
    c = (v1y * v3z) - (v3y * v1z);
    if (((a * v2z) + (b * v2y) + (c * v2x)) < 0.0)
        return 1;
    return 0;
}

void phd_PutPolygons(sint16 *objptr, int clipstatus)
{
    objptr += 4;
    if (*objptr & 1)
    {
        if ((objptr = calc_object_vertices(objptr)))
        {
            phd_leftfloat = phd_topfloat = 0.0;
            phd_rightfloat = (float)phd_winxmax;
            phd_bottomfloat = (float)phd_winymax;
            objptr = calc_vertice_light(objptr);
            objptr = ins_objectGT4persp(objptr + 1, *objptr);
            objptr = ins_objectGT3persp(objptr + 1, *objptr);
            objptr = ins_objectG4(objptr + 1, *objptr);
            objptr = ins_objectG3(objptr + 1, *objptr);
        }
    }
    else
    {
        if ((objptr = calc_object_vertices(objptr)))
        {
            phd_leftfloat = phd_topfloat = 0.0;
            phd_rightfloat = (float)phd_winxmax;
            phd_bottomfloat = (float)phd_winymax;
            objptr = calc_vertice_light(objptr);
            objptr = ins_objectGT4(objptr + 1, *objptr);
            objptr = ins_objectGT3(objptr + 1, *objptr);
            objptr = ins_objectG4(objptr + 1, *objptr);
            objptr = ins_objectG3(objptr + 1, *objptr);
        }
    }
}

void S_InsertRoom(sint16 *objptr)
{
    phd_leftfloat = (float)phd_left;
    phd_rightfloat = (float)phd_right;
    phd_topfloat = (float)phd_top;
    phd_bottomfloat = (float)phd_bottom;
    objptr = calc_roomvert(objptr);
    objptr = ins_roomGT4(objptr + 1, *objptr);
    objptr = ins_roomGT3(objptr + 1, *objptr);
    objptr = ins_room_sprite(objptr + 1, *objptr);
}

sint16 *calc_object_vertices(sint16 *objptr)
{
    sint32 *mptr;
    sint32 xv, yv, zv;
    sint32 cx, cy;
    sint32 xs, ys;
    int numvert;
    sint16 clipflag, totclip;
    PHD_VBUF *dest;

    cx = phd_centerx;
    cy = phd_centery;
    mptr = phd_mxptr;
    dest = vbuf;
    totclip = -1;
    objptr++;
    for (numvert = (int)*(objptr++); numvert > 0; numvert--, dest++, objptr += 3)
    {
        dest->xv = xv = *(mptr + M00) * *(objptr) + *(mptr + M01) * *(objptr + 1) + *(mptr + M02) * *(objptr + 2) + *(mptr + M03);
        dest->yv = yv = *(mptr + M10) * *(objptr) + *(mptr + M11) * *(objptr + 1) + *(mptr + M12) * *(objptr + 2) + *(mptr + M13);
        dest->zv = zv = *(mptr + M20) * *(objptr) + *(mptr + M21) * *(objptr + 1) + *(mptr + M22) * *(objptr + 2) + *(mptr + M23);
        if (zv >= phd_znear)
        {
            clipflag = 0;
            zv /= phd_persp;
            xs = (xv / zv) + cx;
            ys = (yv / zv) + cy;
            if (xs < phd_left)
            {
                if (xs < -CLAMP_XY)
                    xs = -CLAMP_XY;
                clipflag++;
            }
            else if (xs > phd_right)
            {
                if (xs > CLAMP_XY)
                    xs = CLAMP_XY;
                clipflag += 2;
            }
            dest->xs = (sint16)xs;
            if (ys < phd_top)
            {
                if (ys < -CLAMP_XY)
                    ys = -CLAMP_XY;
                clipflag += 4;
            }
            else if (ys > phd_bottom)
            {
                if (ys > CLAMP_XY)
                    ys = CLAMP_XY;
                clipflag += 8;
            }
            dest->ys = (sint16)ys;
        }
        else
            clipflag = -32768;
        dest->clip = clipflag;
        totclip &= clipflag;
    }
    if (totclip)
        return NULL;
    else
        return objptr;
}

sint16 *calc_vertice_light(sint16 *objptr)
{
    int numvert;
    sint32 xv, yv, zv;
    PHD_VBUF *dest;
    sint32 *mptr;
    sint32 shad;

    dest = &vbuf[0];
    numvert = (int)*(objptr++);
    if (numvert > 0)
    {
        if (ls_divider)
        {
            mptr = phd_mxptr;
            xv = (*(mptr + M00) * ls_vector_view.x + *(mptr + M10) * ls_vector_view.y + *(mptr + M20) * ls_vector_view.z) / ls_divider;
            yv = (*(mptr + M01) * ls_vector_view.x + *(mptr + M11) * ls_vector_view.y + *(mptr + M21) * ls_vector_view.z) / ls_divider;
            zv = (*(mptr + M02) * ls_vector_view.x + *(mptr + M12) * ls_vector_view.y + *(mptr + M22) * ls_vector_view.z) / ls_divider;
            for (; numvert > 0; numvert--, dest++, objptr += 3)
            {
                shad = ((*(objptr + 0) * xv + *(objptr + 1) * yv + *(objptr + 2) * zv) >> (W2V_SHIFT + 2)) + ls_adder;
                if (shad < 0)
                    shad = 0;
                else if (shad > ((32 << 8) - 1))
                    shad = ((32 << 8) - 1);
                dest->g = (sint16)shad;
            }
        }
        else
        {
            shad = ls_adder;
            if (shad < 0)
                shad = 0;
            else if (shad > ((32 << 8) - 1))
                shad = ((32 << 8) - 1);
            for (; numvert > 0; numvert--, dest++, objptr += 3)
                dest->g = (sint16)shad;
        }
    }
    else if (numvert < 0)
    {
        for (; numvert < 0; numvert++, dest++)
        {
            shad = *(objptr++) + ls_adder;
            if (shad < 0)
                shad = 0;
            else if (shad > ((32 << 8) - 1))
                shad = ((32 << 8) - 1);
            dest->g = (sint16)shad;
        }
    }
    return objptr;
}

sint16 *calc_roomvert(sint16 *objptr)
{
    PHD_VBUF *dest;
    sint32 *mptr;
    sint32 xv, yv, zv;
    sint32 x, y, z;
    int numvert;
    sint16 clipflag;
    sint32 shade;

    mptr = phd_mxptr;
    dest = vbuf;
    if (shade_effect)
    {
        for (numvert = (int)*(objptr++); numvert > 0; numvert--, dest++, objptr += 4)
        {
            dest->xv = xv = *(mptr + M00) * *(objptr) + *(mptr + M01) * *(objptr + 1) + *(mptr + M02) * *(objptr + 2) + *(mptr + M03);
            dest->yv = yv = *(mptr + M10) * *(objptr) + *(mptr + M11) * *(objptr + 1) + *(mptr + M12) * *(objptr + 2) + *(mptr + M13);
            dest->zv = zv = *(mptr + M20) * *(objptr) + *(mptr + M21) * *(objptr + 1) + *(mptr + M22) * *(objptr + 2) + *(mptr + M23);
            if (zv >= phd_znear)
            {
                clipflag = 0;
                z = zv >> W2V_SHIFT;
                if (z > DPQ_END)
                {
                    dest->g = 0x1fff;
                    clipflag += 16;
                }
                else if (z > DPQ_START)
                    dest->g = (int)(*(objptr + 3) + z - DPQ_START);
                else
                    dest->g = *(objptr + 3);
                zv /= phd_persp;
                x = (xv / zv) + phd_centerx;
                y = (yv / zv) + phd_centery;
                if (water_effect)
                {
                    x += wibble_table[(y + wibble_offset) & (WIBBLE_SIZE - 1)];
                    y += wibble_table[(x + wibble_offset) & (WIBBLE_SIZE - 1)];
                }
                if (x < phd_left)
                {
                    if (x < -CLAMP_XY)
                        x = -CLAMP_XY;
                    clipflag++;
                }
                else if (x > phd_right)
                {
                    if (x > CLAMP_XY)
                        x = CLAMP_XY;
                    clipflag += 2;
                }
                dest->xs = x;
                if (y < phd_top)
                {
                    if (y < -CLAMP_XY)
                        y = -CLAMP_XY;
                    clipflag += 4;
                }
                else if (y > phd_bottom)
                {
                    if (y > CLAMP_XY)
                        y = CLAMP_XY;
                    clipflag += 8;
                }
                dest->ys = y;
                dest->clip = clipflag;
            }
            else
            {
                dest->clip = -32768;
                dest->g = *(objptr + 3);
            }
            dest->g += (sint16)shade_table[(rand_table[numvert & (WIBBLE_SIZE - 1)] + wibble_offset) & (WIBBLE_SIZE - 1)];
            if (dest->g < 0)
                dest->g = 0;
            else if (dest->g > 0x1fff)
                dest->g = 0x1fff;
        }
    }
    else
    {
        for (numvert = (int)*(objptr++); numvert > 0; numvert--, dest++, objptr += 4)
        {
            dest->xv = xv = *(mptr + M00) * *(objptr) + *(mptr + M01) * *(objptr + 1) + *(mptr + M02) * *(objptr + 2) + *(mptr + M03);
            dest->yv = yv = *(mptr + M10) * *(objptr) + *(mptr + M11) * *(objptr + 1) + *(mptr + M12) * *(objptr + 2) + *(mptr + M13);
            dest->zv = zv = *(mptr + M20) * *(objptr) + *(mptr + M21) * *(objptr + 1) + *(mptr + M22) * *(objptr + 2) + *(mptr + M23);
            if (zv >= phd_znear)
            {
                clipflag = 0;
                z = zv >> W2V_SHIFT;
                if (z > DPQ_END)
                {
                    dest->g = 0x1fff;
                    clipflag += 16;
                }
                else if (z > DPQ_START)
                {
                    shade = (int)(*(objptr + 3) + z - DPQ_START);
                    if (shade > 0x1fff)
                        shade = 0x1fff;
                    dest->g = (sint16)shade;
                }
                else
                    dest->g = *(objptr + 3);
                zv /= phd_persp;
                x = (xv / zv) + phd_centerx;
                y = (yv / zv) + phd_centery;
                if (water_effect)
                {
                    x += wibble_table[(y + wibble_offset) & (WIBBLE_SIZE - 1)];
                    y += wibble_table[(x + wibble_offset) & (WIBBLE_SIZE - 1)];
                }
                if (x < phd_left)
                {
                    if (x < -CLAMP_XY)
                        x = -CLAMP_XY;
                    clipflag++;
                }
                else if (x > phd_right)
                {
                    if (x > CLAMP_XY)
                        x = CLAMP_XY;
                    clipflag += 2;
                }
                dest->xs = x;
                if (y < phd_top)
                {
                    if (y < -CLAMP_XY)
                        y = -CLAMP_XY;
                    clipflag += 4;
                }
                else if (y > phd_bottom)
                {
                    if (y > CLAMP_XY)
                        y = CLAMP_XY;
                    clipflag += 8;
                }
                dest->ys = y;
                dest->clip = clipflag;
            }
            else
            {
                dest->clip = -32768;
                dest->g = *(objptr + 3);
            }
        }
    }
    return objptr;
}

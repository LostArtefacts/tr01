#include "3dglodef.h"

#define TRIGMULT2(A, B) (((A) * (B)) >> W2V_SHIFT)
#define TRIGMULT3(A, B, C) (TRIGMULT2((TRIGMULT2(A, B)), C))

extern sint32 matrix_stack[];

void phd_GetMatrixAngles(PHD_ANGLE *dest);
void phd_UnitMatrix(void);

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

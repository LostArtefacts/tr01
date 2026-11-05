int __cdecl Func80bcd(void *dest, const void *src, int width, int height);
int __cdecl Func879bd(void *dest, const void *src, int width, int height);
int __cdecl Func8537e(int bank_a, int granularity);
int __cdecl Func8c16e(int bank_a, int granularity);
int __cdecl Func853b7(void *dest, const void *src, int a, int b, int c, int d, int e, int f, int g, int h);
int __cdecl Func8c1a7(void *dest, const void *src, int a, int b, int c, int d, int e, int f, int g, int h);

#pragma aux (__cdecl) Func80bcd "Func80bcd_";
#pragma aux (__cdecl) Func879bd "Func879bd_";
#pragma aux (__cdecl) Func8537e "Func8537e_";
#pragma aux (__cdecl) Func8c16e "Func8c16e_";
#pragma aux (__cdecl) Func853b7 "Func853b7_";
#pragma aux (__cdecl) Func8c1a7 "Func8c1a7_";

int Func58550(void *dest, const void *src, int width, int height)
{
    return Func80bcd(dest, src, width, height);
}

int Func58560(void *dest, const void *src, int width, int height)
{
    return Func879bd(dest, src, width, height);
}

int Func58570(int bank_a, int granularity)
{
    return Func8537e(bank_a, granularity);
}

int Func58580(int bank_a, int granularity)
{
    return Func8c16e(bank_a, granularity);
}

int Func58590(void *dest, const void *src, int a, int b, int c, int d, int e, int f, int g, int h)
{
    return Func853b7(dest, src, a, b, c, d, e, f, g, h);
}

int Func585c4(void *dest, const void *src, int a, int b, int c, int d, int e, int f, int g, int h)
{
    return Func8c1a7(dest, src, a, b, c, d, e, f, g, h);
}

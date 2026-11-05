#include "rplfile_internal.h"

int Func57a00(DECODE **decode, unsigned int flags)
{
    dword count2;
    dword count1;
    dword i;
    dword count3;

    if (flags & 0x10) {
        count1 = 0x8000;
        count2 = 0x25800;
        count3 = 0x80000;
    } else {
        count1 = 0x4000;
        count2 = 0x12c00;
        count3 = 0x40000;
    }
    if (!(*decode = calloc(1, sizeof(DECODE)))) {
        return 12;
    }
    if (!((*decode)->state = calloc(1, sizeof(DECODESTATE)))) {
        Func57b74(*decode);
        return 12;
    }
    if (!((*decode)->state->table1 = calloc(count1, 4))) {
        Func57b74(*decode);
        return 12;
    }
    for (i = 0; i < count1; i++) {
        (*decode)->state->table1[i] = 0xffff;
    }
    if (!((*decode)->state->table2 = calloc(count2, 4))) {
        Func57b74(*decode);
        return 12;
    }
    for (i = 0; i < count2; i++) {
        (*decode)->state->table2[i] = 0xffff;
    }
    if (!((*decode)->state->table3 = calloc(count3, 4))) {
        Func57b74(*decode);
        return 12;
    }
    for (i = 0; i < count3; i++) {
        (*decode)->state->table3[i] = 0xffff;
    }
    return 0;
}

void Func57b74(DECODE *decode)
{
    if (decode) {
        if (decode->state) {
            if (decode->state->extra) {
                free(decode->state->extra);
                decode->state->extra = 0;
            }
            if (decode->state->table1) {
                free(decode->state->table1);
                decode->state->table1 = 0;
            }
            if (decode->state->table2) {
                free(decode->state->table2);
                decode->state->table2 = 0;
            }
            if (decode->state->table3) {
                free(decode->state->table3);
                decode->state->table3 = 0;
            }
            free(decode->state);
            decode->state = 0;
        }
        free(decode);
    }
}

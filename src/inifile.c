#include <stdlib.h>
#include <string.h>

typedef unsigned char byte;
typedef unsigned long dword;

typedef struct
{
    dword dwFlags;
    byte szName[128];
    char *pData;
    dword dwSize;
    dword dwMaxSize;
    char *pCurrent;
    dword dwCurrent;
    char *pSection;
    char *pItemPtr;
    char *pItem;
    char *pList;
    char *pListPtr;
} INI_INSTANCE;

int FileSize(char *name);
byte *FileLoad(char *name, void *where, dword flags);
int FileSave(char *name, void *data, dword size);
int Func4dc00(char *text);
int Func4dc4c(char digit);

static char *hex_digits = "0123456789ABCDEF0123456789abcdef";
static dword hex_powers[] = {1, 0x10, 0x100, 0x1000, 0x10000, 0x100000, 0x1000000, 0x10000000};

int Func4d170(INI_INSTANCE *ini, char *name)
{
    int size;

    strcpy((char *)ini->szName, name);
    size = FileSize(name);
    if (size == -1) {
        return 0;
    }
    ini->dwSize = size;
    ini->dwMaxSize = size + 1024;
    ini->pData = malloc(ini->dwMaxSize);
    FileLoad(name, ini->pData, 0);
    ini->dwCurrent = 0;
    ini->pItem = 0;
    ini->pList = 0;
    ini->pCurrent = ini->pData;
    ini->pItemPtr = 0;
    ini->pListPtr = 0;
    ini->dwFlags &= ~0x8000;
    return 1;
}

int Func4d224(INI_INSTANCE *ini)
{
    if (ini->dwFlags & 0x8000) {
        FileSave((char *)ini->szName, ini->pData, ini->dwSize);
    }
    free(ini->pData);
    return 1;
}

int Func4d258(INI_INSTANCE *ini, char *name)
{
    char *p;
    char *start;
    char *match;
    dword pos;
    int found;

    p = ini->pData;
    found = 0;
    pos = 0;
    do {
        if (*p == '[') {
            start = p;
            match = name;
            p++;
            while (*p == *match && pos < ini->dwSize) {
                match++;
                p++;
                pos++;
            }
            if (*p == ']' && !*match) {
                found = 1;
                while (*p++ != '\n') {
                    p++;
                }
                ini->pListPtr = p;
                ini->pCurrent = p;
                ini->dwCurrent = pos;
                ini->pSection = start;
            }
        }
        p++;
        pos++;
    } while (!found && pos < ini->dwSize);
    return found;
}

int Func4d2e4(INI_INSTANCE *ini, char *name)
{
    char *p;
    char *start;
    char *match;
    dword pos;
    int found;

    p = ini->pCurrent;
    pos = ini->dwCurrent;
    found = 0;
    do {
        if (*p == *name) {
            start = p;
            match = name + 1;
            p++;
            pos++;
            while (*p == *match && pos < ini->dwSize) {
                match++;
                p++;
                pos++;
            }
            if (!*match) {
                while (*p != '=' && *p != '\r') {
                    p++;
                    pos++;
                }
                if (*p == '=') {
                    p++;
                    pos++;
                    ini->pItem = p;
                } else {
                    ini->pItem = 0;
                }
                ini->pList = 0;
                found = 1;
                ini->pItemPtr = start;
            }
        }
        p++;
        pos++;
    } while (!found && pos < ini->dwSize && *p != '[');
    return found;
}

int Func4d3a0(INI_INSTANCE *ini, dword *value)
{
    char *p;
    char text[32];
    dword n;

    if (ini->pList) {
        p = ini->pList;
    } else {
        p = ini->pItem;
    }
    if (!p) {
        return 0;
    }
    while (*p == ' ') {
        p++;
    }
    if (*p == '\r') {
        return 0;
    }
    n = 0;
    while (*p != '\r' && *p != ',' && *p != ' ') {
        text[n++] = *p++;
    }
    text[n] = 0;
    if (!n) {
        return 0;
    }
    while (*p == ' ') {
        p++;
    }
    if (*p == ',') {
        p++;
    }
    ini->pList = p;
    if (text[1] == 'x') {
        *value = Func4dc00(text + 2);
    } else {
        *value = atoi(text);
    }
    return 1;
}

int Func4d454(INI_INSTANCE *ini, char *text, dword size)
{
    char *p;
    dword n;

    if (ini->pList) {
        p = ini->pList;
    } else {
        p = ini->pItem;
    }
    if (!p) {
        return 0;
    }
    n = 0;
    while (*p == ' ') {
        p++;
    }
    while (*p != '\r' && *p != ',' && n < size - 1) {
        text[n++] = *p++;
    }
    text[n] = 0;
    if (n == size - 1) {
        while (*p != '\r' && *p != ',') {
            p++;
        }
    }
    if (*p == ',') {
        p++;
    }
    ini->pList = p;
    return 1;
}

int Func4d4f0(INI_INSTANCE *ini, char *text, dword size)
{
    char *p;
    char *end;
    dword n;

    p = ini->pListPtr;
    if (!p || *p == '[' || *p == '\r') {
        return 0;
    }
    end = ini->pData + ini->dwSize;
    n = 0;
    while (*p == ' ') {
        p++;
    }
    while (*p != '\r' && n < size - 1) {
        text[n++] = *p++;
    }
    p += 2;
    text[n] = 0;
    if (p >= end) {
        ini->pListPtr = 0;
    } else {
        ini->pListPtr = p;
    }
    return 1;
}

int Func4d580(INI_INSTANCE *ini, dword value)
{
    char *p;
    char *start;
    char text[32];
    dword old_size;
    dword new_size;
    dword delta;
    dword n;

    if (!ini->pItem) {
        return 0;
    }
    p = ini->pItem;
    while (*p == ' ') {
        p++;
    }
    start = p;
    old_size = 0;
    while (*p != '\r') {
        text[old_size++] = *p++;
    }
    text[old_size] = 0;
    if (text[1] == 'x') {
        _itoa(value, text + 2, 16);
    } else {
        _itoa(value, text, 10);
    }
    new_size = strlen(text);
    if (new_size < old_size) {
        memmove(start, start + (old_size - new_size), ini->pData + ini->dwSize - start - (old_size - new_size));
        ini->dwSize -= (old_size - new_size);
    } else if (new_size > old_size) {
        delta = new_size - old_size;
        if (ini->dwSize + delta > ini->dwMaxSize) {
            return 0;
        }
        memmove(start + delta, start, ini->pData + ini->dwSize - start + delta);
        ini->dwSize += delta;
    }
    n = 0;
    while (text[n]) {
        *start++ = text[n++];
    }
    ini->dwFlags |= 0x8000;
    return 1;
}

int Func4d6b0(INI_INSTANCE *ini, char *text)
{
    char *p;
    char *start;
    dword old_size;
    dword new_size;
    dword delta;

    p = ini->pItem;
    if (!p) {
        return 0;
    }
    old_size = 0;
    while (*p == ' ') {
        p++;
    }
    start = p;
    while (*p++ != '\r') {
        old_size++;
    }
    new_size = strlen(text);
    if (new_size < old_size) {
        memmove(start, start + (old_size - new_size), ini->pData + ini->dwSize - start - (old_size - new_size));
        ini->dwSize -= (old_size - new_size);
    } else if (new_size > old_size) {
        delta = new_size - old_size;
        if (ini->dwSize + delta > ini->dwMaxSize) {
            return 0;
        }
        memmove(start + delta, start, ini->pData + ini->dwSize - start + delta);
        ini->dwSize += delta;
    }
    while (*text) {
        *start++ = *text++;
    }
    ini->dwFlags |= 0x8000;
    return 1;
}

int Func4d794(INI_INSTANCE *ini, char *item)
{
    char text[32];

    if (!Func4d2e4(ini, item)) {
        return 0;
    }
    if (!Func4d454(ini, text, 32)) {
        return 0;
    }
    if (!_stricmp(text, "YES")) {
        return 1;
    }
    return 0;
}

int Func4d7d8(INI_INSTANCE *ini, char *item, dword *value)
{
    if (!Func4d2e4(ini, item)) {
        return 0;
    }
    if (!Func4d3a0(ini, value)) {
        return 0;
    }
    return 1;
}

int Func4d7f8(INI_INSTANCE *ini, char *item, char *text, dword size)
{
    if (!Func4d2e4(ini, item)) {
        return 0;
    }
    if (!Func4d454(ini, text, size)) {
        return 0;
    }
    return 1;
}

int Func4d820(INI_INSTANCE *ini, char *item, int state)
{
    if (!Func4d2e4(ini, item)) {
        return 0;
    }
    if (state) {
        if (!Func4d6b0(ini, "Yes")) {
            return 0;
        }
    } else {
        if (!Func4d6b0(ini, "No")) {
            return 0;
        }
    }
    return 1;
}

int Func4d85c(INI_INSTANCE *ini, char *item)
{
    char *p;
    char *start;
    dword size;

    size = 0;
    if (!Func4d2e4(ini, item)) {
        return 0;
    }
    start = ini->pItemPtr;
    p = start;
    for (;;) {
        size++;
        if (*p == '\n') {
            break;
        }
        p++;
    }
    memmove(start, start + size, ini->pData + ini->dwSize - (start + size));
    ini->dwSize -= size;
    ini->dwFlags |= 0x8000;
    return 1;
}

int Func4d8bc(INI_INSTANCE *ini, char *section)
{
    char *end;
    char *start;
    dword size;

    if (!Func4d258(ini, section)) {
        return 0;
    }
    size = 1;
    end = ini->pData + ini->dwSize;
    start = ini->pSection;
    while (start[size] != '[' && start + size < end) {
        size++;
    }
    memmove(start, start + size, end - (start + size));
    ini->dwSize -= size;
    ini->dwFlags |= 0x8000;
    return 1;
}

int Func4d930(INI_INSTANCE *ini, char *name)
{
    char *p;
    dword size;

    if (Func4d258(ini, name)) {
        return 0;
    }
    p = ini->pData + ini->dwSize;
    size = strlen(name) + 6;
    if (ini->dwSize + size > ini->dwMaxSize) {
        return 0;
    }
    *p++ = '\r';
    *p++ = '\n';
    ini->pSection = p;
    *p++ = '[';
    while (*name) {
        *p++ = *name++;
    }
    *p++ = ']';
    *p++ = '\r';
    *p++ = '\n';
    ini->pListPtr = p;
    ini->pCurrent = p;
    ini->dwSize += size;
    ini->dwFlags |= 0x8000;
    return 1;
}

int Func4d9e0(INI_INSTANCE *ini, char *item, char *text, dword justify)
{
    char *p;
    dword size;

    if (Func4d2e4(ini, item)) {
        Func4d6b0(ini, text);
    } else {
        p = ini->pCurrent;
        size = strlen(text) + (justify + 4);
        if (ini->dwSize + size > ini->dwMaxSize) {
            return 0;
        }
        memmove(p + size, p, ini->pData + ini->dwSize - p);
        while (*item) {
            *p++ = *item++;
            justify--;
        }
        while (justify-- != 0) {
            *p++ = ' ';
        }
        *p++ = '=';
        *p++ = ' ';
        while (*text) {
            *p++ = *text++;
        }
        *p++ = '\r';
        *p = '\n';
        ini->dwSize += size;
        ini->dwFlags |= 0x8000;
    }
    return 1;
}

int Func4dae4(INI_INSTANCE *ini, char *item, dword value, dword justify, dword radix)
{
    char text[32];
    char *p;
    dword size;
    dword n;

    if (Func4d2e4(ini, item)) {
        Func4d580(ini, value);
    } else {
        if (radix == 16) {
            text[0] = '0';
            text[1] = 'x';
            _itoa(value, text + 2, 16);
        } else {
            _itoa(value, text, 10);
        }
        p = ini->pCurrent;
        size = strlen(text) + (justify + 4);
        if (ini->dwSize + size > ini->dwMaxSize) {
            return 0;
        }
        memmove(p + size, p, ini->pData + ini->dwSize - p);
        while (*item) {
            *p++ = *item++;
            justify--;
        }
        while (justify-- != 0) {
            *p++ = ' ';
        }
        *p++ = '=';
        *p++ = ' ';
        n = 0;
        while (text[n]) {
            *p++ = text[n++];
        }
        *p++ = '\r';
        *p = '\n';
        ini->dwSize += size;
        ini->dwFlags |= 0x8000;
    }
    return 1;
}

int Func4dc00(char *text)
{
    dword n;
    dword value;
    dword i;

    n = strlen(text);
    i = 0;
    value = 0;
    do {
        value += Func4dc4c(text[i++]) * hex_powers[n - 1];
        n--;
    } while (n > 0);
    return value;
}

int Func4dc4c(char digit)
{
    dword i;

    for (i = 0; i < 16; i++) {
        if (digit == hex_digits[i] || digit == hex_digits[i + 16]) {
            return i;
        }
    }
    return -1;
}

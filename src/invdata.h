#ifndef INVDATA_H
#define INVDATA_H

#include "types.h"
#include "text.h"

#define MAX_REQLINES 16

typedef struct request_info
{
    uint16 items;
    uint16 selected;
    uint16 vis_lines;
    uint16 line_offset;
    uint16 line_oldoffset;
    uint16 pixwidth;
    uint16 line_height;
    sint16 xpos;
    sint16 ypos;
    sint16 zpos;
    char *headingtext;
    char *itemtexts;
    sint16 itemtextlen;
    TEXTSTRING *heading;
    TEXTSTRING *background;
    TEXTSTRING *moreup;
    TEXTSTRING *moredown;
    TEXTSTRING *texts[MAX_REQLINES];
} REQUEST_INFO;

#endif

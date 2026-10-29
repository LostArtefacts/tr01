#ifndef TITLE_H
#define TITLE_H

typedef enum title_options
{
    STARTGAME = 0,
    STARTCINE = 1 << 6,
    STARTFMV = 2 << 6,
    STARTDEMO = 3 << 6,
    EXIT_TO_TITLE = 4 << 6,
    LEVELCOMPLETE = 5 << 6,
    EXITGAME = 6 << 6,
    EXIT_TO_OPTION = 7 << 6,
    TITLE_DESELECT = 8 << 6
} TITLE_OPTIONS;

#endif

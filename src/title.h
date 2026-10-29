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

enum fmv_sequence
{
    FMV_INTRO,
    FMV_GYM,
    FMV_SNOW,
    FMV_LIFT,
    FMV_VISION,
    FMV_CANYON,
    FMV_PYRAMID,
    FMV_PRISON,
    FMV_ENDSEQ,
    FMV_CORE,
    FMV_ESCAPE
};

#endif

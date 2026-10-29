#ifndef GAME_H
#define GAME_H

#include "types.h"
#include "box.h"
#include "lara.h"
#include "control.h"
#include "3dglodef.h"

#define TITLE 20

extern int CurrentLevel;
extern ROOM_INFO *room;
extern OBJECT_INFO objects[];

sint32 GetRandomControl(void);

#endif

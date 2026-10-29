#ifndef MAIN_H
#define MAIN_H

#include "types.h"

sint32 StartGame(int level_number);
sint32 GameLoop(int demo_mode);
sint32 LevelCompleteSequence(int level_number);
void LevelStats(int level_number);
void SeedRandomDraw(sint32 seed);
void SeedRandomControl(sint32 seed);

#endif

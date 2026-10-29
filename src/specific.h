#ifndef SPECIFIC_H
#define SPECIFIC_H

#include "types.h"

extern char *bckscrn;
extern sint32 input;

void S_UpdateInput(void);
char *GetFullPath(char *filename);
void S_CDVolume(sint16 volume);
void S_CDStop(void);
void S_StartSyncedAudio(int num);
void S_FadeInInventory(int fade);

#endif

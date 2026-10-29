#ifndef SPECIFIC_H
#define SPECIFIC_H

#include "types.h"

extern char *bckscrn;
extern sint32 input;

void S_ExitSystem(char *exit_message);
void S_UpdateInput(void);
int S_SaveGame(void *data, int size, int slot);
void CheckCheatMode(void);
void S_SaveSettings(void);
char *GetFullPath(char *filename);
void S_CDVolume(sint16 volume);
void S_CDPlay(sint16 track);
void S_CDStop(void);
void S_StartSyncedAudio(int num);
void S_FadeInInventory(int fade);

#endif

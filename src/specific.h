#ifndef SPECIFIC_H
#define SPECIFIC_H

#include "types.h"

extern int game_hires;
extern double screen_sizer, game_sizer;
extern char *bckscrn;
extern int mode_lock;
extern int hires_flag;
extern uint8 game_palette[], water_palette[];
extern int wet;
extern sint32 input;
extern int title_loaded;

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
void IncreaseScreenSize(void);
void DecreaseScreenSize(void);
void setup_screen_size(void);
void switch_resolution(void);
void TempVideoAdjust(int hires, double sizer);
void S_CopyScreenToBuffer(void);
void S_CopyBufferToScreen(void);
void S_NoFade(void);
void S_FadeInInventory(int fade);
void S_FadeOutInventory(int fade);
void S_FadeToBlack(void);

#endif

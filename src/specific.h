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

void S_InitialisePolyList(void);
sint32 S_DumpScreen(void);
void S_ClearScreen(void);
void S_InitialiseScreen(void);
void S_OutputPolyList(void);
int S_GetObjectBounds(sint16 *bptr);
void S_PrintShadow(sint16 size, sint16 *bptr, ITEM_INFO *iptr);
void S_CalculateLight(sint32 x, sint32 y, sint32 z, sint16 room_number);
void S_CalculateStaticLight(sint16 adder);
void S_DrawHealthBar(int percent);
void S_DrawAirBar(int percent);
void AnimateTextures(int nframes);
void S_SetupBelowWater(int underwater);
void S_SetupAboveWater(int underwater);
void S_AnimateTextures(int nframes);
void S_DrawLighteningSegment(sint32 x1, sint32 y1, sint32 z1, sint32 x2, sint32 y2, sint32 z2, sint32 width);
void S_DisplayPicture(char *filename);
void S_DrawSpriteAbs(sint32 x, sint32 y, sint32 z, sint16 sprnum, sint16 shade);
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

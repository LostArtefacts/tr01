#ifndef SPECIFIC_H
#define SPECIFIC_H

#include "types.h"

#define MALLOC_SIZE (1024 * 1024 * 7 / 2)

enum game_malloc_types
{
    TEXTURE_PAGES,
    OBJECT_TEXTURES,
    MESH_POINTERS,
    MESHES,
    ANIMS,
    STRUCTS,
    RANGES,
    COMMANDS,
    BONES,
    FRAMES,
    ROOM_TEXTURES,
    ROOM_INFOS,
    ROOM_MESH,
    ROOM_DOOR,
    ROOM_FLOOR,
    ROOM_LIGHTS,
    ROOM_STATIC_MESH_INFOS,
    FLOOR_DATA,
    ITEMS,
    CAMERAS,
    SOUND_FX,
    BOXES,
    OVERLAPS,
    GROUNDZONE,
    FLYZONE,
    ANIMATING_TEXTURE_RANGES,
    CINEMATIC_FRAMES,
    LOADDEMO_BUFFER,
    SAVEDEMO_BUFFER,
    CINEMATIC_EFFECTS,
    MUMMY_HEAD_TURN,
    EXTRA_DOOR_STUFF,
    EFFECTS_ARRAY,
    CREATURE_DATA,
    CREATURE_LOT,
    SAMPLEINFOS,
    SAMPLES,
    SAMPLEOFFSETS,
    ROLLINGBALL_STUFF
};

extern uint8 water_palette[], game_palette[];
extern int wet;
extern char *bckscrn;
extern int mode_lock;
extern char *malloc_ptr;
extern int hires_flag;
extern int malloc_free;
extern sint16 *aranges;
extern int malloc_used;
extern int malloc_size;
extern sint32 input;
extern int game_hires;
extern int detail_level;
extern char exit_message[];
extern double screen_sizer, game_sizer;
extern int title_loaded;
extern char *malloc_buffer;

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
void S_InitialiseSystem(void);
void CalculateWibbleTable(void);
void S_SeedRandom(void);
void init_game_malloc(void);
char *game_malloc(int size, int type);
void game_free(int size, int type);
void S_UpdateInput(void);
int S_SaveGame(void *data, int size, int slot);
int S_LoadGame(void *data, int size, int slot);
void CheckCheatMode(void);
void S_SaveSettings(void);
int S_LoadTitle(void);
int S_LoadLevel(int level_number);
int LoadLevel(char *filename, int req_level);
char *GetFullPath(char *filename);
void FindCdDrive(void);
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
void S_LoadingScreen(int level_number);
void S_Wait(int frames);
SG_COL S_COLOUR(int R, int G, int B);
void S_DrawSpriteSize(sint32 x, sint32 y, sint32 z, sint32 w, sint32 h, sint16 sprnum, sint16 shade, uint16 flags);
void S_DrawSpriteRel(sint32 x, sint32 y, sint32 z, sint16 sprnum, sint16 shade);
void S_DrawScreenSprite(sint32 sx, sint32 sy, sint32 z, sint32 scaleH, sint32 scaleV, sint16 sprnum, sint16 shade, uint16 flags);
void S_DrawScreenLine(sint32 sx, sint32 sy, sint32 z, sint32 w, sint32 h, sint32 col, uint16 *grdptr, uint16 flags);
void S_DrawScreenBox(sint32 sx, sint32 sy, sint32 z, sint32 w, sint32 h, sint32 col, uint16 *grdptr, uint16 flags);
void S_DrawScreenFBox(sint32 sx, sint32 sy, sint32 z, sint32 w, sint32 h, sint32 col, uint16 *grdptr, uint16 flags);
void S_SetBackgroundGamma(sint16 gamma);
void S_SetGamma(sint16 gamma);
int S_PlayFMV(int sequence, int mode);
void S_DrawPickup(sint32 x, sint32 y, sint32 scale, sint16 sprnum, sint16 shade, uint16 flags);

#endif

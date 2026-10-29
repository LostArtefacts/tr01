#ifndef MN_SINFO_H
#define MN_SINFO_H

#include "types.h"

extern int sound_active;

void S_SoundStopAllSamples(void);
void mn_stop_sound_effect(int sfx_num, PHD_3DPOS *pos);
void mn_reset_ambient_loudness(void);
void mn_update_sound_effects(void);
void mn_stop_ambient_samples(void);
int SoundEffect(int sfx_num, PHD_3DPOS *pos, int flags);

#endif

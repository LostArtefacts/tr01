#ifndef MN_SINFO_H
#define MN_SINFO_H

#include "types.h"

extern int sound_active;

void S_SoundStopAllSamples(void);
void mn_stop_sound_effect(int sfx_num, PHD_3DPOS *pos);
int SoundEffect(int sfx_num, PHD_3DPOS *pos, int flags);

#endif

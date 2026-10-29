#include "game.h"
#include <string.h>

void InitialiseGameFlags(void);
void InitialiseLara(void);
void InitialiseFXArray(void);
void InitialiseLOTarray(void);
void InitColours(void);
void ExtractSaveGameInfo(void);
void InitialiseLaraLoad(sint16 item_num);
void ControlLaraExtra(sint16 item_num);
void InitialiseEvilLara(sint16 item_num);
void ControlEvilLara(sint16 item_num);
void DrawEvilLara(ITEM_INFO *item);
void DrawUnclippedItem(ITEM_INFO *item);
void InitialiseWolf(sint16 item_number);
void WolfControl(sint16 item_number);
void PeopleControl(sint16 item_number);
void PierreControl(sint16 item_number);
void RatControl(sint16 item_number);
void VoleControl(sint16 item_number);
void LionControl(sint16 item_number);
void ApeControl(sint16 item_number);
void FlyerControl(sint16 item_number);
void InitialiseWarrior2(sint16 item_number);
void CentaurControl(sint16 item_number);
void InitialiseMummy(sint16 item_number);
void MummyControl(sint16 item_number);
void InitialiseSkateKid(sint16 item_number);
void SkateKidControl(sint16 item_number);
void DrawSkateKid(ITEM_INFO *item);
void CowboyControl(sint16 item_number);
void InitialiseBaldy(sint16 item_number);
void BaldyControl(sint16 item_number);
void TorsoControl(sint16 item_number);
void NatlaControl(sint16 item_number);
void InitialisePod(sint16 item_number);
void PodControl(sint16 item_number);
void InitialiseStatue(sint16 item_number);
void StatueControl(sint16 item_number);
void FallingBlock(sint16 item_number);
void FallingBlockFloor(ITEM_INFO *item, sint32 x, sint32 y, sint32 z, sint16 *height);
void FallingBlockCeiling(ITEM_INFO *item, sint32 x, sint32 y, sint32 z, sint16 *height);
void Pendulum(sint16 item_number);
void TeethTrap(sint16 item_number);
void InitialiseRollingBall(sint16 item_number);
void RollingBallControl(sint16 item_number);
void RollingBallCollision(sint16 item_num, ITEM_INFO *litem, COLL_INFO *coll);
void SpikeCollision(sint16 item_num, ITEM_INFO *litem, COLL_INFO *coll);
void FallingCeiling(sint16 item_number);
void InitialiseDamoclesSword(sint16 item_number);
void DamoclesSwordControl(sint16 item_number);
void DamoclesSwordCollision(sint16 item_num, ITEM_INFO *laraitem, COLL_INFO *coll);
void InitialiseMovingBlock(sint16 item_num);
void MovableBlock(sint16 item_number);
void MovableBlockCollision(sint16 item_num, ITEM_INFO *laraitem, COLL_INFO *coll);
void DrawMovableBlock(ITEM_INFO *item);
void InitialiseRollingBlock(sint16 item_num);
void RollingBlock(sint16 item_number);
void InitialiseLightning(sint16 item_num);
void LightningControl(sint16 item_number);
void DrawLightning(ITEM_INFO *item);
void LightningCollision(sint16 item_num, ITEM_INFO *laraitem, COLL_INFO *coll);
void InitialiseThorsHandle(sint16 item_num);
void ThorsHandleControl(sint16 item_number);
void ThorsHandleCollision(sint16 item_num, ITEM_INFO *laraitem, COLL_INFO *coll);
void ThorsHeadCollision(sint16 item_num, ITEM_INFO *laraitem, COLL_INFO *coll);
void MidasCollision(sint16 item_num, ITEM_INFO *laraitem, COLL_INFO *coll);
void DartEmitterControl(sint16 item_num);
void DartsControl(sint16 item_num);
void DartEffectControl(sint16 item_num);
void FlameEmitterControl(sint16 item_number);
void FlameControl(sint16 fx_number);
void LavaSpray(sint16 item_number);
void ControlLavaBlob(sint16 fx_number);
void LavaWedge(sint16 item_number);
void BridgeFlatCeiling(ITEM_INFO *item, sint32 x, sint32 y, sint32 z, sint16 *height);
void BridgeFlatFloor(ITEM_INFO *item, sint32 x, sint32 y, sint32 z, sint16 *height);
void BridgeTilt1Ceiling(ITEM_INFO *item, sint32 x, sint32 y, sint32 z, sint16 *height);
void BridgeTilt1Floor(ITEM_INFO *item, sint32 x, sint32 y, sint32 z, sint16 *height);
void BridgeTilt2Ceiling(ITEM_INFO *item, sint32 x, sint32 y, sint32 z, sint16 *height);
void BridgeTilt2Floor(ITEM_INFO *item, sint32 x, sint32 y, sint32 z, sint16 *height);
void CogControl(sint16 item_number);
void DoorControl(sint16 item_number);
void DrawBridgeCeiling(ITEM_INFO *item, sint32 x, sint32 y, sint32 z, sint16 *height);
void DrawBridgeCollision(sint16 item_num, ITEM_INFO *laraitem, COLL_INFO *coll);
void DrawBridgeFloor(ITEM_INFO *item, sint32 x, sint32 y, sint32 z, sint16 *height);
void InitialiseDoor(sint16 item_number);
void PickUpCollision(sint16 item_num, ITEM_INFO *laraitem, COLL_INFO *coll);
void SwitchCollision(sint16 item_num, ITEM_INFO *laraitem, COLL_INFO *coll);
void SwitchCollision2(sint16 item_num, ITEM_INFO *laraitem, COLL_INFO *coll);
void SwitchControl(sint16 item_number);
void TrapDoorCeiling(ITEM_INFO *item, sint32 x, sint32 y, sint32 z, sint16 *height);
void TrapDoorControl(sint16 item_number);
void TrapDoorFloor(ITEM_INFO *item, sint32 x, sint32 y, sint32 z, sint16 *height);
void BoatControl(sint16 item_number);
void CabinControl(sint16 item_number);
void ControlBlood1(sint16 fx_num);
void ControlBodyPart(sint16 fx_number);
void ControlBubble1(sint16 fx_num);
void ControlExplosion1(sint16 fx_num);
void ControlGunShot(sint16 fx_number);
void ControlMissile(sint16 fx_number);
void ControlNatlaGun(sint16 fx_number);
void ControlRichochet1(sint16 fx_num);
void ControlSplash1(sint16 fx_num);
void ControlTwinkle(sint16 fx_num);
void EarthQuake(sint16 item_number);
void InitialiseSavegameItem(sint16 item_num);
void KeyHoleCollision(sint16 item_num, ITEM_INFO *laraitem, COLL_INFO *coll);
void PickUpScion4Collision(sint16 item_num, ITEM_INFO *laraitem, COLL_INFO *coll);
void PickUpScionCollision(sint16 item_num, ITEM_INFO *laraitem, COLL_INFO *coll);
void PuzzleHoleCollision(sint16 item_num, ITEM_INFO *laraitem, COLL_INFO *coll);
void Scion3Control(sint16 item_number);
void ScionControl(sint16 item_number);

extern sint16 pierre_item;

sint16 level_music[NUMBER_OF_LEVELS] = {
    0,
    57,
    57,
    57,
    57,
    59,
    59,
    59,
    58,
    58,
    59,
    59,
    59,
    58,
    60,
    60,
    0, 0, 0, 0,
    2,
    0
};

#define DEFAULT_RADIUS 10

#define BEAR_HIT_POINTS 20
#define BEAR_RADIUS (WALL_L / 3)
#define BEAR_SMARTNESS 0x4000

#define WOLF_HIT_POINTS 6
#define WOLF_RADIUS (WALL_L / 3)
#define WOLF_SMARTNESS 0x2000

#define BAT_HIT_POINTS 1
#define BAT_RADIUS (WALL_L / 10)
#define BAT_SMARTNESS 0x400

#define DINOSAUR_HIT_POINTS 100
#define DINOSAUR_RADIUS (WALL_L / 3)
#define DINOSAUR_SMARTNESS 0x7fff

#define RAPTOR_HIT_POINTS 20
#define RAPTOR_RADIUS (WALL_L / 3)
#define RAPTOR_SMARTNESS 0x4000

#define CROCODILE_HIT_POINTS 20
#define CROCODILE_RADIUS (WALL_L / 3)
#define CROCODILE_SMARTNESS 0x2000

#define ALLIGATOR_HIT_POINTS 20
#define ALLIGATOR_RADIUS (WALL_L / 3)
#define ALLIGATOR_SMARTNESS 0x400

#define LARSON_HIT_POINTS 50
#define LARSON_RADIUS (WALL_L / 10)
#define LARSON_SMARTNESS 0x7fff

#define PIERRE_HIT_POINTS 70
#define PIERRE_RADIUS (WALL_L / 10)
#define PIERRE_SMARTNESS 0x7fff

#define RAT_HIT_POINTS 5
#define RAT_RADIUS (WALL_L / 5)
#define RAT_SMARTNESS 0x2000

#define APE_HIT_POINTS 22
#define APE_RADIUS (WALL_L / 3)
#define APE_SMARTNESS 0x7fff

#define LION_HIT_POINTS 30
#define LION_RADIUS (WALL_L / 3)
#define LION_SMARTNESS 0x7fff

#define LIONESS_HIT_POINTS 25
#define LIONESS_RADIUS (WALL_L / 3)
#define LIONESS_SMARTNESS 0x2000

#define PUMA_HIT_POINTS 45
#define PUMA_RADIUS (WALL_L / 3)
#define PUMA_SMARTNESS 0x2000

#define FLYER_HIT_POINTS 50
#define FLYER_RADIUS (WALL_L / 3)
#define FLYER_SMARTNESS 0x7fff
#define WARRIOR2_SMARTNESS 0x2000

#define CENTAUR_HIT_POINTS 120
#define CENTAUR_RADIUS (WALL_L / 3)
#define CENTAUR_SMARTNESS 0x7fff

#define MUMMY_HIT_POINTS 18

#define SKATEKID_HIT_POINTS 125
#define SKATEKID_RADIUS (WALL_L / 5)
#define SKATEKID_SMARTNESS 0x7fff

#define COWBOY_HIT_POINTS 150
#define COWBOY_RADIUS (WALL_L / 10)
#define COWBOY_SMARTNESS 0x7fff

#define BALDY_HIT_POINTS 200
#define BALDY_RADIUS (WALL_L / 10)
#define BALDY_SMARTNESS 0x7fff

#define TORSO_HIT_POINTS 500
#define TORSO_RADIUS (WALL_L / 3)
#define TORSO_SMARTNESS 0x7fff

#define NATLA_HIT_POINTS 400
#define NATLA_RADIUS (WALL_L / 5)
#define NATLA_SMARTNESS 0x7fff

int InitialiseLevel(int level_number)
{
    if (level_number == CURRENT)
        CurrentLevel = savegame.current_level;
    else
        CurrentLevel = level_number;

    S_LoadingScreen(CurrentLevel);
    InitialiseGameFlags();
    lara.item_number = NO_ITEM;
    if (!S_LoadLevel(CurrentLevel))
        return 0;

    if (lara.item_number != NO_ITEM)
        InitialiseLara();

    effects = (FX_INFO *)game_malloc(NUM_EFFECTS * sizeof(FX_INFO), EFFECTS_ARRAY);
    InitialiseFXArray();
    InitialiseLOTarray();
    InitColours();
    T_InitPrint();
    InitialisePickUpDisplay();
    S_InitialiseScreen();

    health_bar_timer = 100;
    mn_reset_sound_effects();

    if (level_number == CURRENT)
        ExtractSaveGameInfo();

    if (level_music[CurrentLevel])
        S_CDPlay(level_music[CurrentLevel]);
    camera.underwater = 0;

    return 1;
}

void InitialiseGameFlags(void)
{
    int i;

    flip_status = 0;
    for (i = 0; i < MAX_FLIPMAPS; i++)
        flipmap[i] = 0;

    for (i = 0; i < MAX_CD_TRACKS; i++)
        cd_flags[i] = 0;

    for (i = 0; i < NUMBER_OBJECTS; i++)
        objects[i].loaded = 0;

    ammotext = NULL;
    level_complete = 0;
    flipeffect = -1;
    pierre_item = NO_ITEM;
}

void InitialiseLevelFlags(void)
{
    savegame.secrets = 0;
    savegame.timer = 0;
    savegame.pickups = 0;
    savegame.kills = 0;
}

void BaddyObjects(void)
{
    OBJECT_INFO *obj;

    obj = &objects[LARA];
    obj->initialise = InitialiseLaraLoad;
    obj->shadow_size = (UNIT_SHADOW * 10) / 16;
    obj->hit_points = LARA_HITPOINTS;
    obj->draw_routine = DrawDummyItem;
    obj->save_position = obj->save_hitpoints = 1;
    obj->save_anim = obj->save_flags = 1;

    obj = &objects[LARA_EXTRA];
    obj->control = ControlLaraExtra;

    obj = &objects[EVIL_LARA];
    obj->initialise = InitialiseEvilLara;
    obj->control = ControlEvilLara;
    obj->draw_routine = DrawEvilLara;
    obj->collision = CreatureCollision;
    obj->shadow_size = (UNIT_SHADOW * 10) / 16;
    obj->hit_points = 1000;
    obj->save_position = obj->save_hitpoints = 1;

    obj = &objects[WOLF];
    if (obj->loaded)
    {
        obj->initialise = InitialiseWolf;
        obj->control = WolfControl;
        obj->collision = CreatureCollision;
        obj->shadow_size = UNIT_SHADOW / 2;
        obj->hit_points = WOLF_HIT_POINTS;
        obj->pivot_length = 375;
        obj->radius = WOLF_RADIUS;
        obj->smartness = WOLF_SMARTNESS;
        obj->intelligent = 1;
        obj->save_position = obj->save_hitpoints = obj->save_anim = obj->save_flags = 1;
        bones[obj->bone_index + 2 * 4] |= ROT_Y;
    }

    obj = &objects[BEAR];
    if (obj->loaded)
    {
        obj->initialise = InitialiseCreature;
        obj->control = BearControl;
        obj->collision = CreatureCollision;
        obj->shadow_size = UNIT_SHADOW / 2;
        obj->hit_points = BEAR_HIT_POINTS;
        obj->pivot_length = 500;
        obj->radius = BEAR_RADIUS;
        obj->smartness = BEAR_SMARTNESS;
        obj->intelligent = 1;
        obj->save_position = obj->save_hitpoints = obj->save_anim = obj->save_flags = 1;
        bones[obj->bone_index + 13 * 4] |= ROT_Y;
    }

    obj = &objects[BAT];
    if (obj->loaded)
    {
        obj->initialise = InitialiseCreature;
        obj->control = BatControl;
        obj->collision = CreatureCollision;
        obj->shadow_size = UNIT_SHADOW / 2;
        obj->hit_points = BAT_HIT_POINTS;
        obj->radius = BAT_RADIUS;
        obj->smartness = BAT_SMARTNESS;
        obj->intelligent = 1;
        obj->save_position = obj->save_hitpoints = obj->save_anim = obj->save_flags = 1;
    }

    obj = &objects[DINOSAUR];
    if (obj->loaded)
    {
        obj->initialise = InitialiseCreature;
        obj->draw_routine = DrawUnclippedItem;
        obj->control = DinoControl;
        obj->collision = CreatureCollision;
        obj->shadow_size = UNIT_SHADOW / 4;
        obj->hit_points = DINOSAUR_HIT_POINTS;
        obj->pivot_length = 2000;
        obj->radius = DINOSAUR_RADIUS;
        obj->smartness = DINOSAUR_SMARTNESS;
        obj->intelligent = 1;
        obj->save_position = obj->save_hitpoints = obj->save_anim = obj->save_flags = 1;
        bones[obj->bone_index + 10 * 4] |= ROT_Y;
        bones[obj->bone_index + 11 * 4] |= ROT_Y;
    }

    obj = &objects[RAPTOR];
    if (obj->loaded)
    {
        obj->initialise = InitialiseCreature;
        obj->control = RaptorControl;
        obj->collision = CreatureCollision;
        obj->shadow_size = UNIT_SHADOW / 2;
        obj->hit_points = RAPTOR_HIT_POINTS;
        obj->pivot_length = 400;
        obj->radius = RAPTOR_RADIUS;
        obj->smartness = RAPTOR_SMARTNESS;
        obj->intelligent = 1;
        obj->save_position = obj->save_hitpoints = obj->save_anim = obj->save_flags = 1;
        bones[obj->bone_index + 21 * 4] |= ROT_Y;
    }

    obj = &objects[LARSON];
    if (obj->loaded)
    {
        obj->initialise = InitialiseCreature;
        obj->control = PeopleControl;
        obj->collision = CreatureCollision;
        obj->shadow_size = UNIT_SHADOW / 2;
        obj->hit_points = LARSON_HIT_POINTS;
        obj->radius = LARSON_RADIUS;
        obj->smartness = LARSON_SMARTNESS;
        obj->intelligent = 1;
        obj->save_position = obj->save_hitpoints = obj->save_anim = obj->save_flags = 1;
        bones[obj->bone_index + 6 * 4] |= ROT_Y;
    }

    obj = &objects[PIERRE];
    if (obj->loaded)
    {
        obj->initialise = InitialiseCreature;
        obj->control = PierreControl;
        obj->collision = CreatureCollision;
        obj->shadow_size = UNIT_SHADOW / 2;
        obj->hit_points = PIERRE_HIT_POINTS;
        obj->radius = PIERRE_RADIUS;
        obj->smartness = PIERRE_SMARTNESS;
        obj->intelligent = 1;
        obj->save_position = obj->save_hitpoints = obj->save_anim = obj->save_flags = 1;
        bones[obj->bone_index + 6 * 4] |= ROT_Y;
    }

    obj = &objects[RAT];
    if (obj->loaded)
    {
        obj->initialise = InitialiseCreature;
        obj->control = RatControl;
        obj->collision = CreatureCollision;
        obj->shadow_size = UNIT_SHADOW / 2;
        obj->hit_points = RAT_HIT_POINTS;
        obj->pivot_length = 200;
        obj->radius = RAT_RADIUS;
        obj->smartness = RAT_SMARTNESS;
        obj->intelligent = 1;
        obj->save_position = obj->save_hitpoints = obj->save_anim = obj->save_flags = 1;
        bones[obj->bone_index + 4] |= ROT_Y;
    }

    obj = &objects[VOLE];
    if (obj->loaded)
    {
        obj->initialise = InitialiseCreature;
        obj->control = VoleControl;
        obj->collision = CreatureCollision;
        obj->shadow_size = UNIT_SHADOW / 2;
        obj->hit_points = RAT_HIT_POINTS;
        obj->pivot_length = 200;
        obj->radius = RAT_RADIUS;
        obj->smartness = RAT_SMARTNESS;
        obj->intelligent = 1;
        obj->save_position = obj->save_hitpoints = obj->save_anim = obj->save_flags = 1;
        bones[obj->bone_index + 4] |= ROT_Y;
    }

    obj = &objects[LION];
    if (obj->loaded)
    {
        obj->initialise = InitialiseCreature;
        obj->control = LionControl;
        obj->collision = CreatureCollision;
        obj->shadow_size = UNIT_SHADOW / 2;
        obj->hit_points = LION_HIT_POINTS;
        obj->pivot_length = 400;
        obj->radius = LION_RADIUS;
        obj->smartness = LION_SMARTNESS;
        obj->intelligent = 1;
        obj->save_position = obj->save_hitpoints = obj->save_anim = obj->save_flags = 1;
        bones[obj->bone_index + 19 * 4] |= ROT_Y;
    }

    obj = &objects[LIONESS];
    if (obj->loaded)
    {
        obj->initialise = InitialiseCreature;
        obj->control = LionControl;
        obj->collision = CreatureCollision;
        obj->shadow_size = UNIT_SHADOW / 2;
        obj->hit_points = LIONESS_HIT_POINTS;
        obj->pivot_length = 400;
        obj->radius = LIONESS_RADIUS;
        obj->smartness = LIONESS_SMARTNESS;
        obj->intelligent = 1;
        obj->save_position = obj->save_hitpoints = obj->save_anim = obj->save_flags = 1;
        bones[obj->bone_index + 19 * 4] |= ROT_Y;
    }

    obj = &objects[PUMA];
    if (obj->loaded)
    {
        obj->initialise = InitialiseCreature;
        obj->control = LionControl;
        obj->collision = CreatureCollision;
        obj->shadow_size = UNIT_SHADOW / 2;
        obj->hit_points = PUMA_HIT_POINTS;
        obj->pivot_length = 400;
        obj->radius = PUMA_RADIUS;
        obj->smartness = PUMA_SMARTNESS;
        obj->intelligent = 1;
        obj->save_position = obj->save_hitpoints = obj->save_anim = obj->save_flags = 1;
        bones[obj->bone_index + 19 * 4] |= ROT_Y;
    }

    obj = &objects[CROCODILE];
    if (obj->loaded)
    {
        obj->initialise = InitialiseCreature;
        obj->control = CrocControl;
        obj->collision = CreatureCollision;
        obj->shadow_size = UNIT_SHADOW / 3;
        obj->hit_points = CROCODILE_HIT_POINTS;
        obj->pivot_length = 600;
        obj->radius = CROCODILE_RADIUS;
        obj->smartness = CROCODILE_SMARTNESS;
        obj->intelligent = 1;
        obj->save_position = obj->save_hitpoints = obj->save_anim = obj->save_flags = 1;
        bones[obj->bone_index + 7 * 4] |= ROT_Y;
    }

    obj = &objects[ALLIGATOR];
    if (obj->loaded)
    {
        obj->initialise = InitialiseCreature;
        obj->control = AlligatorControl;
        obj->collision = CreatureCollision;
        obj->shadow_size = UNIT_SHADOW / 3;
        obj->hit_points = ALLIGATOR_HIT_POINTS;
        obj->pivot_length = 600;
        obj->radius = ALLIGATOR_RADIUS;
        obj->smartness = ALLIGATOR_SMARTNESS;
        obj->intelligent = 1;
        obj->save_position = obj->save_hitpoints = obj->save_anim = obj->save_flags = 1;
        bones[obj->bone_index + 7 * 4] |= ROT_Y;
    }

    obj = &objects[APE];
    if (obj->loaded)
    {
        obj->initialise = InitialiseCreature;
        obj->control = ApeControl;
        obj->collision = CreatureCollision;
        obj->shadow_size = UNIT_SHADOW / 2;
        obj->hit_points = APE_HIT_POINTS;
        obj->pivot_length = 250;
        obj->radius = APE_RADIUS;
        obj->smartness = APE_SMARTNESS;
        obj->intelligent = 1;
        obj->save_position = obj->save_hitpoints = obj->save_anim = obj->save_flags = 1;
        bones[obj->bone_index + 13 * 4] |= ROT_Y;
    }

    obj = &objects[WARRIOR1];
    if (obj->loaded)
    {
        obj->initialise = InitialiseCreature;
        obj->control = FlyerControl;
        obj->collision = CreatureCollision;
        obj->shadow_size = UNIT_SHADOW / 3;
        obj->hit_points = FLYER_HIT_POINTS;
        obj->pivot_length = 150;
        obj->radius = FLYER_RADIUS;
        obj->smartness = FLYER_SMARTNESS;
        obj->intelligent = 1;
        obj->save_position = obj->save_hitpoints = obj->save_anim = obj->save_flags = 1;
        bones[obj->bone_index] |= ROT_Y;
        bones[obj->bone_index + 2 * 4] |= ROT_Y;
    }

    obj = &objects[WARRIOR2];
    if (obj->loaded)
    {
        memcpy(&objects[WARRIOR2], &objects[WARRIOR1], sizeof(OBJECT_INFO));
        objects[WARRIOR2].initialise = InitialiseWarrior2;
        objects[WARRIOR2].smartness = WARRIOR2_SMARTNESS;
    }

    obj = &objects[WARRIOR3];
    if (obj->loaded)
    {
        memcpy(&objects[WARRIOR3], &objects[WARRIOR1], sizeof(OBJECT_INFO));
        objects[WARRIOR3].initialise = InitialiseWarrior2;
        objects[WARRIOR2].smartness = WARRIOR2_SMARTNESS;
    }

    obj = &objects[CENTAUR];
    if (obj->loaded)
    {
        obj->initialise = InitialiseCreature;
        obj->control = CentaurControl;
        obj->collision = CreatureCollision;
        obj->shadow_size = UNIT_SHADOW / 3;
        obj->hit_points = CENTAUR_HIT_POINTS;
        obj->pivot_length = 400;
        obj->radius = CENTAUR_RADIUS;
        obj->smartness = CENTAUR_SMARTNESS;
        obj->intelligent = 1;
        obj->save_position = obj->save_hitpoints = obj->save_anim = obj->save_flags = 1;
        bones[obj->bone_index + 10 * 4] |= ROT_Y | ROT_X;
    }

    obj = &objects[MUMMY];
    if (obj->loaded)
    {
        obj->initialise = InitialiseMummy;
        obj->control = MummyControl;
        obj->collision = ObjectCollision;
        obj->hit_points = MUMMY_HIT_POINTS;
        obj->save_flags = obj->save_hitpoints = obj->save_anim = 1;
        bones[obj->bone_index + 2 * 4] |= ROT_Y;
    }

    obj = &objects[MERCENARY1];
    if (obj->loaded)
    {
        obj->initialise = InitialiseSkateKid;
        obj->control = SkateKidControl;
        obj->collision = CreatureCollision;
        obj->draw_routine = DrawSkateKid;
        obj->shadow_size = UNIT_SHADOW / 2;
        obj->hit_points = SKATEKID_HIT_POINTS;
        obj->radius = SKATEKID_RADIUS;
        obj->smartness = SKATEKID_SMARTNESS;
        obj->intelligent = 1;
        obj->save_position = obj->save_hitpoints = obj->save_anim = obj->save_flags = 1;
        bones[obj->bone_index] |= ROT_Y;
    }

    obj = &objects[MERCENARY2];
    if (obj->loaded)
    {
        obj->initialise = InitialiseCreature;
        obj->control = CowboyControl;
        obj->collision = CreatureCollision;
        obj->shadow_size = UNIT_SHADOW / 2;
        obj->hit_points = COWBOY_HIT_POINTS;
        obj->radius = COWBOY_RADIUS;
        obj->smartness = COWBOY_SMARTNESS;
        obj->intelligent = 1;
        obj->save_position = obj->save_hitpoints = obj->save_anim = obj->save_flags = 1;
        bones[obj->bone_index] |= ROT_Y;
    }

    obj = &objects[MERCENARY3];
    if (obj->loaded)
    {
        obj->initialise = InitialiseBaldy;
        obj->control = BaldyControl;
        obj->collision = CreatureCollision;
        obj->shadow_size = UNIT_SHADOW / 2;
        obj->hit_points = BALDY_HIT_POINTS;
        obj->radius = BALDY_RADIUS;
        obj->smartness = BALDY_SMARTNESS;
        obj->intelligent = 1;
        obj->save_position = obj->save_hitpoints = obj->save_anim = obj->save_flags = 1;
        bones[obj->bone_index] |= ROT_Y;
    }

    obj = &objects[EVIL_NATLA];
    if (obj->loaded)
    {
        obj->initialise = InitialiseCreature;
        obj->control = TorsoControl;
        obj->collision = CreatureCollision;
        obj->shadow_size = UNIT_SHADOW / 3;
        obj->hit_points = TORSO_HIT_POINTS;
        obj->radius = TORSO_RADIUS;
        obj->smartness = TORSO_SMARTNESS;
        obj->intelligent = 1;
        obj->save_position = obj->save_hitpoints = obj->save_anim = obj->save_flags = 1;
        bones[obj->bone_index + 1 * 4] |= ROT_Y;
    }

    obj = &objects[NATLA];
    if (obj->loaded)
    {
        obj->initialise = InitialiseCreature;
        obj->control = NatlaControl;
        obj->collision = CreatureCollision;
        obj->shadow_size = UNIT_SHADOW / 2;
        obj->hit_points = NATLA_HIT_POINTS;
        obj->radius = NATLA_RADIUS;
        obj->smartness = NATLA_SMARTNESS;
        obj->intelligent = 1;
        obj->save_position = obj->save_hitpoints = obj->save_anim = obj->save_flags = 1;
        bones[obj->bone_index + 2 * 4] |= ROT_Z | ROT_X;
    }

    obj = &objects[PODS];
    if (obj->loaded)
    {
        obj->initialise = InitialisePod;
        obj->control = PodControl;
        obj->collision = ObjectCollision;
        obj->save_anim = obj->save_flags = 1;
    }
    obj = &objects[BIG_POD];
    if (obj->loaded)
    {
        obj->initialise = InitialisePod;
        obj->control = PodControl;
        obj->collision = ObjectCollision;
        obj->save_anim = obj->save_flags = 1;
    }

    obj = &objects[STATUE];
    if (obj->loaded)
    {
        obj->initialise = InitialiseStatue;
        obj->control = StatueControl;
        obj->collision = ObjectCollision;
        obj->save_anim = obj->save_flags = 1;
    }
}

#define INIT_MOVBLOCK(a) \
    obj = &objects[a]; \
    obj->initialise = InitialiseMovingBlock; \
    obj->control = MovableBlock; \
    obj->collision = MovableBlockCollision; \
    obj->draw_routine = DrawMovableBlock; \
    obj->save_position = obj->save_anim = obj->save_flags = 1

void TrapObjects(void)
{
    OBJECT_INFO *obj;

    obj = &objects[FALLING_BLOCK];
    obj->control = FallingBlock;
    obj->floor = FallingBlockFloor;
    obj->ceiling = FallingBlockCeiling;
    obj->save_position = obj->save_anim = 1;
    obj->save_flags = 1;

    obj = &objects[PENDULUM];
    obj->shadow_size = UNIT_SHADOW / 2;
    obj->control = Pendulum;
    obj->collision = TrapCollision;
    obj->save_flags = 1;
    obj->save_anim = 1;

    obj = &objects[TEETH_TRAP];
    obj->collision = TrapCollision;
    obj->control = TeethTrap;
    obj->save_flags = 1;
    obj->save_anim = 1;

    obj = &objects[ROLLING_BALL];
    obj->collision = RollingBallCollision;
    obj->control = RollingBallControl;
    obj->initialise = InitialiseRollingBall;
    obj->save_position = obj->save_flags = 1;
    obj->save_anim = 1;

    obj = &objects[SPIKES];
    obj->collision = SpikeCollision;

    obj = &objects[FALLING_CEILING1];
    obj->control = FallingCeiling;
    obj->collision = TrapCollision;
    obj->save_position = obj->save_anim = 1;
    obj->save_flags = 1;
    obj = &objects[FALLING_CEILING2];
    obj->control = FallingCeiling;
    obj->collision = TrapCollision;
    obj->save_position = obj->save_anim = 1;
    obj->save_flags = 1;

    obj = &objects[DAMOCLES_SWORD];
    obj->initialise = InitialiseDamoclesSword;
    obj->control = DamoclesSwordControl;
    obj->collision = DamoclesSwordCollision;
    obj->shadow_size = UNIT_SHADOW;
    obj->save_position = obj->save_flags = 1;
    obj->save_anim = 1;

    INIT_MOVBLOCK(MOVABLE_BLOCK);
    INIT_MOVBLOCK(MOVABLE_BLOCK2);
    INIT_MOVBLOCK(MOVABLE_BLOCK3);
    INIT_MOVBLOCK(MOVABLE_BLOCK4);
    obj = &objects[ROLLING_BLOCK];
    obj->initialise = InitialiseRollingBlock;
    obj->control = RollingBlock;
    obj->save_position = obj->save_flags = obj->save_anim = 1;

    obj = &objects[LIGHTNING_EMITTER];
    obj->initialise = InitialiseLightning;
    obj->control = LightningControl;
    obj->draw_routine = DrawLightning;
    obj->collision = LightningCollision;
    obj->save_flags = 1;

    obj = &objects[THORS_HANDLE];
    obj->initialise = InitialiseThorsHandle;
    obj->control = ThorsHandleControl;
    obj->collision = ThorsHandleCollision;
    obj->draw_routine = DrawUnclippedItem;
    obj->save_anim = 1;
    obj->save_flags = 1;
    obj = &objects[THORS_HEAD];
    obj->collision = ThorsHeadCollision;
    obj->draw_routine = DrawUnclippedItem;
    obj->save_anim = 1;
    obj->save_flags = 1;

    obj = &objects[MIDAS_TOUCH];
    obj->collision = MidasCollision;
    obj->draw_routine = DrawDummyItem;

    objects[DART_EMITTER].control = DartEmitterControl;
    obj = &objects[DARTS];
    obj->control = DartsControl;
    obj->collision = ObjectCollision;
    obj->shadow_size = UNIT_SHADOW / 2;
    obj->save_flags = 1;

    obj = &objects[DART_EFFECT];
    obj->control = DartEffectControl;
    obj->draw_routine = DrawSpriteItem;

    objects[FLAME_EMITTER].control = FlameEmitterControl;
    objects[FLAME_EMITTER].draw_routine = DrawDummyItem;
    objects[FLAME].control = FlameControl;

    objects[LAVA_EMITTER].control = LavaSpray;
    objects[LAVA_EMITTER].collision = ObjectCollision;
    objects[LAVA_EMITTER].draw_routine = DrawDummyItem;
    objects[LAVA].control = ControlLavaBlob;

    obj = &objects[LAVA_WEDGE];
    obj->control = LavaWedge;
    obj->collision = CreatureCollision;
    obj->save_position = obj->save_flags = 1;
    obj->save_anim = 1;
}

#define INIT_PICKUP(a) \
    obj = &objects[a]; \
    obj->draw_routine = DrawSpriteItem; \
    obj->collision = PickUpCollision; \
    obj->save_flags = 1

#define INIT_KEYHOLE(a) \
    obj = &objects[a]; \
    obj->collision = KeyHoleCollision; \
    obj->save_flags = 1

#define INIT_PUZZLEHOLE(a) \
    obj = &objects[a]; \
    obj->collision = PuzzleHoleCollision; \
    obj->save_flags = 1

#define INIT_DOOR(a) \
    obj = &objects[a]; \
    obj->initialise = InitialiseDoor; \
    obj->draw_routine = DrawUnclippedItem; \
    obj->control = DoorControl; \
    obj->collision = DoorCollision; \
    obj->save_flags = obj->save_anim = 1

void ObjectObjects(void)
{
    OBJECT_INFO *obj;

    objects[CAMERA_TARGET].draw_routine = DrawDummyItem;

    obj = &objects[BRIDGE_FLAT];
    obj->floor = BridgeFlatFloor;
    obj->ceiling = BridgeFlatCeiling;
    obj = &objects[BRIDGE_TILT1];
    obj->floor = BridgeTilt1Floor;
    obj->ceiling = BridgeTilt1Ceiling;
    obj = &objects[BRIDGE_TILT2];
    obj->floor = BridgeTilt2Floor;
    obj->ceiling = BridgeTilt2Ceiling;

    obj = &objects[DRAW_BRIDGE];
    if (obj->loaded)
    {
        obj->control = CogControl;
        obj->collision = DrawBridgeCollision;
        obj->floor = DrawBridgeFloor;
        obj->ceiling = DrawBridgeCeiling;
        obj->save_anim = obj->save_flags = 1;
    }

    obj = &objects[SWITCH_TYPE1];
    obj->control = SwitchControl;
    obj->collision = SwitchCollision;
    obj->save_anim = obj->save_flags = 1;
    obj = &objects[SWITCH_TYPE2];
    obj->control = SwitchControl;
    obj->collision = SwitchCollision2;
    obj->save_anim = obj->save_flags = 1;

    INIT_DOOR(DOOR_TYPE1);
    INIT_DOOR(DOOR_TYPE2);
    INIT_DOOR(DOOR_TYPE3);
    INIT_DOOR(DOOR_TYPE4);
    INIT_DOOR(DOOR_TYPE5);
    INIT_DOOR(DOOR_TYPE6);
    INIT_DOOR(DOOR_TYPE7);
    INIT_DOOR(DOOR_TYPE8);
    obj = &objects[TRAPDOOR];
    obj->control = TrapDoorControl;
    obj->floor = TrapDoorFloor;
    obj->ceiling = TrapDoorCeiling;
    obj->save_anim = obj->save_flags = 1;
    obj = &objects[TRAPDOOR2];
    obj->control = TrapDoorControl;
    obj->floor = TrapDoorFloor;
    obj->ceiling = TrapDoorCeiling;
    obj->save_anim = obj->save_flags = 1;

    obj = &objects[COG_1];
    obj->control = CogControl;
    obj->save_flags = 1;
    obj = &objects[COG_2];
    obj->control = CogControl;
    obj->save_flags = 1;
    obj = &objects[COG_3];
    obj->control = CogControl;
    obj->save_flags = 1;
    obj = &objects[MOVING_BAR];
    obj->control = CogControl;
    obj->collision = ObjectCollision;
    obj->save_flags = obj->save_anim = obj->save_position = 1;

    INIT_PICKUP(PICKUP_ITEM1);
    INIT_PICKUP(PICKUP_ITEM2);
    INIT_PICKUP(KEY_ITEM1);
    INIT_PICKUP(KEY_ITEM2);
    INIT_PICKUP(KEY_ITEM3);
    INIT_PICKUP(KEY_ITEM4);
    INIT_PICKUP(PUZZLE_ITEM1);
    INIT_PICKUP(PUZZLE_ITEM2);
    INIT_PICKUP(PUZZLE_ITEM3);
    INIT_PICKUP(PUZZLE_ITEM4);
    INIT_PICKUP(GUN_ITEM);
    INIT_PICKUP(SHOTGUN_ITEM);
    INIT_PICKUP(MAGNUM_ITEM);
    INIT_PICKUP(UZI_ITEM);
    INIT_PICKUP(GUN_AMMO_ITEM);
    INIT_PICKUP(SG_AMMO_ITEM);
    INIT_PICKUP(MAG_AMMO_ITEM);
    INIT_PICKUP(UZI_AMMO_ITEM);
    INIT_PICKUP(EXPLOSIVE_ITEM);
    INIT_PICKUP(MEDI_ITEM);
    INIT_PICKUP(BIGMEDI_ITEM);
    INIT_PICKUP(SCION_ITEM2);
    INIT_PICKUP(LEADBAR_ITEM);
    obj = &objects[SAVEGAME_ITEM];
    obj->initialise = InitialiseSavegameItem;
    obj = &objects[SCION_ITEM];
    obj->collision = PickUpScionCollision;
    obj->draw_routine = DrawSpriteItem;

    INIT_KEYHOLE(KEY_HOLE1);
    INIT_KEYHOLE(KEY_HOLE2);
    INIT_KEYHOLE(KEY_HOLE3);
    INIT_KEYHOLE(KEY_HOLE4);

    INIT_PUZZLEHOLE(PUZZLE_HOLE1);
    INIT_PUZZLEHOLE(PUZZLE_HOLE2);
    INIT_PUZZLEHOLE(PUZZLE_HOLE3);
    INIT_PUZZLEHOLE(PUZZLE_HOLE4);
    objects[PUZZLE_DONE1].save_flags = 1;
    objects[PUZZLE_DONE2].save_flags = 1;
    objects[PUZZLE_DONE3].save_flags = 1;
    objects[PUZZLE_DONE4].save_flags = 1;

    obj = &objects[PORTACABIN];
    obj->control = CabinControl;
    obj->draw_routine = DrawUnclippedItem;
    obj->collision = ObjectCollision;
    obj->save_anim = obj->save_flags = 1;

    obj = &objects[BOAT];
    obj->control = BoatControl;
    obj->save_flags = 1;
    obj->save_position = obj->save_anim = 1;

    obj = &objects[SCION_HOLDER];
    obj->control = ScionControl;
    obj->collision = ObjectCollision;
    obj->save_flags = 1;
    obj->save_anim = 1;
    obj = &objects[SCION_ITEM3];
    obj->control = Scion3Control;
    obj->hit_points = 5;
    obj->save_flags = 1;
    obj = &objects[SCION_ITEM4];
    obj->control = ScionControl;
    obj->collision = PickUpScion4Collision;
    obj->save_flags = 1;

    obj = &objects[EARTHQUAKE];
    obj->control = EarthQuake;
    obj->draw_routine = DrawDummyItem;
    obj->save_flags = 1;

    obj = &objects[PLAYER_1];
    obj->initialise = InitialisePlayer1;
    obj->control = ControlCinematicPlayer;
    obj->hit_points = 1;
    obj = &objects[PLAYER_2];
    obj->initialise = InitialiseGenPlayer;
    obj->control = ControlCinematicPlayer;
    obj->hit_points = 1;
    obj = &objects[PLAYER_3];
    obj->initialise = InitialiseGenPlayer;
    obj->control = ControlCinematicPlayer;
    obj->hit_points = 1;
    obj = &objects[PLAYER4];
    obj->initialise = InitialiseGenPlayer;
    obj->control = ControlCinematicPlayer4;
    obj->hit_points = 1;

    objects[BLOOD1].control = ControlBlood1;
    objects[BUBBLES1].control = ControlBubble1;
    objects[EXPLOSION1].control = ControlExplosion1;

    objects[RICOCHET1].control = ControlRichochet1;
    objects[TWINKLE].control = ControlTwinkle;
    objects[SPLASH1].control = ControlSplash1;
    objects[WATERFALL].control = WaterFall;
    objects[WATERFALL].draw_routine = DrawDummyItem;

    objects[BODY_PART].control = ControlBodyPart;
    objects[BODY_PART].nmeshes = 0;
    objects[BODY_PART].loaded = 1;

    objects[MISSILE1].control = ControlNatlaGun;
    objects[MISSILE2].control = ControlMissile;
    objects[MISSILE3].control = ControlMissile;

    objects[GUN_FLASH].control = ControlGunShot;
}

void InitialiseObjects(void)
{
    int i;
    OBJECT_INFO *obj;

    for (i = 0, obj = objects; i < NUMBER_OBJECTS; i++, obj++)
    {
        obj->initialise = NULL;
        obj->collision = NULL;
        obj->control = NULL;
        obj->draw_routine = DrawAnimatingItem;
        obj->floor = obj->ceiling = NULL;
        obj->pivot_length = 0;
        obj->radius = DEFAULT_RADIUS;
        obj->shadow_size = 0;
        obj->hit_points = DONT_TARGET;
        obj->intelligent = 0;
        obj->save_position = obj->save_hitpoints = obj->save_flags = obj->save_anim = 0;
    }

    BaddyObjects();
    TrapObjects();
    ObjectObjects();
}

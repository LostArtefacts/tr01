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

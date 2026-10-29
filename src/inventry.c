#include "game.h"
#include "invdata.h"

sint16 Inventory_Displaying = 0;
sint16 Inventory_Chosen = -1;
sint32 Inventory_ExtraData[8] = {0};
sint32 Inventory_Mode = INV_TITLE_MODE;

sint16 Option_Gamma_Level = 0;
sint16 Option_SoundFX_Volume = 165;
sint16 Option_Music_Volume = 255;
sint16 Option_Detail_Level = 255;

sint16 Compass_Status = 0;
sint16 Compass_Speed = 0;
sint16 Compass_Needle = 0;

sint32 idelay = 0, idcount = 0;
sint16 item_data = 0;

void Construct_Inventory(void);
void SelectMeshes(INVENTORY_ITEM *inv_item);
sint32 AnimateInventoryItem(INVENTORY_ITEM *inv_item);
void DrawInventoryItem(INVENTORY_ITEM *inv_item);

sint32 Display_Inventory(sint32 inventory_mode)
{
    int n, frm, busy = 0, pass_open = 0;
    PHD_3DPOS viewer;
    sint16 angle;
    sint32 tempSint32;
    sint16 icam2obj = CAMERA_2_RING;
    INVENTORY_ITEM *inv_item;
    sint16 itilt = ITEM_TILT;
    IMOTION_INFO imo = {0};
    RING_INFO ring = {0};

    if (inventory_mode == INV_KEYS_MODE && !inv_keys_objects)
    {
        Inventory_Chosen = -1;
        return 0;
    }

    if (ammotext)
    {
        T_RemovePrint(ammotext);
        ammotext = NULL;
    }

    AlterFOV(GAME_FOV * ONE_DEGREE);
    Inventory_Mode = inventory_mode;

    inv_nframes = 2;
    Construct_Inventory();

    if (inventory_mode != INV_TITLE_MODE)
        S_FadeInInventory(1);
    else
        S_FadeInInventory(0);

    mn_stop_ambient_samples();
    S_SoundStopAllSamples();
    if (inventory_mode != INV_TITLE_MODE)
        S_CDVolume(0);

    switch (inventory_mode)
    {
    case INV_DEATH_MODE:
    case INV_SAVE_MODE:
    case INV_LOAD_MODE:
    case INV_TITLE_MODE:
        Inv_RingInit(&ring, OPTION_RING, inv_option_list, inv_option_objects, inv_option_current, &imo);
        break;
    case INV_KEYS_MODE:
        Inv_RingInit(&ring, KEYS_RING, inv_keys_list, inv_keys_objects, inv_main_current, &imo);
        break;
    default:
        if (inv_main_objects)
            Inv_RingInit(&ring, MAIN_RING, inv_main_list, inv_main_objects, inv_main_current, &imo);
        else
            Inv_RingInit(&ring, OPTION_RING, inv_option_list, inv_option_objects, inv_option_current, &imo);
        break;
    }

    SoundEffect(111, NULL, SFX_ALWAYS);

    inv_nframes = 2;
    do
    {
        Inv_RingCalcAdders(&ring, ROTATE_DURATION);

        S_UpdateInput();

        inputDB = GetDebouncedInput(input);

        if (Inventory_Mode == INV_TITLE_MODE && !input && !inputDB)
        {
            noinput_count++;
            if (noinput_count > 480)
                reset_flag = 1;
        }
        else
        {
            noinput_count = 0;
            reset_flag = 0;
        }

        for (frm = 0; frm < inv_nframes; frm++)
        {

            if (idelay)
            {
                if (idcount)
                    idcount--;
                else
                    idelay = 0;
            }

            Inv_RingDoMotions(&ring);
        }
        ring.camera.z_pos = ring.radius + icam2obj;

        Inv_RingGetView(&ring, &viewer);
        phd_GenerateW2V(&viewer);

        Inv_RingLight(&ring);

        S_InitialisePolyList();
        S_CopyBufferToScreen();

        phd_PushMatrix();

        phd_TranslateAbs(ring.ringpos.x_pos, ring.ringpos.y_pos, ring.ringpos.z_pos);
        phd_RotYXZ(ring.ringpos.y_rot, ring.ringpos.x_rot, ring.ringpos.z_rot);

        for (n = 0, angle = 0; n < ring.number_of_objects; n++)
        {
            inv_item = *(ring.list + n);
            if (n == ring.current_object)
            {

                for (frm = 0; frm < inv_nframes; frm++)
                {

                    if (ring.rotating)
                    {
                        ls_adder = LOW_LIGHT;
                        if (inv_item->y_rot != 0)
                        {
                            if (inv_item->y_rot < 0)
                                inv_item->y_rot += 0x200;
                            else
                                inv_item->y_rot -= 0x200;
                        }
                    }
                    else if (imo.status == RNG_SELECTED || imo.status == RNG_DESELECTING || imo.status == RNG_SELECTING || imo.status == RNG_DESELECT || imo.status == RNG_CLOSING_ITEM)
                    {
                        ls_adder = HIGH_LIGHT;
                        if (inv_item->y_rot != inv_item->y_rot_sel)
                        {
                            tempSint32 = inv_item->y_rot_sel - inv_item->y_rot;
                            if (tempSint32 > 0 && tempSint32 < 0x8000)
                                inv_item->y_rot += 0x400;
                            else
                                inv_item->y_rot -= 0x400;
                            inv_item->y_rot &= 0xfc00;
                        }
                    }
                    else if (ring.number_of_objects == 1 || !(input & IN_LEFT || input & IN_RIGHT))
                    {
                        ls_adder = HIGH_LIGHT;
                        inv_item->y_rot += 0x100;
                    }
                }
                if ((imo.status == RNG_OPEN || imo.status == RNG_SELECTING || imo.status == RNG_SELECTED || imo.status == RNG_DESELECTING || imo.status == RNG_DESELECT || imo.status == RNG_CLOSING_ITEM) && !ring.rotating && !(input & IN_LEFT || input & IN_RIGHT))
                    RingNotActive(inv_item);
            }
            else
            {

                ls_adder = LOW_LIGHT;
                for (frm = 0; frm < inv_nframes; frm++)
                {
                    if (inv_item->y_rot != 0)
                    {
                        if (inv_item->y_rot < 0)
                            inv_item->y_rot += 0x100;
                        else
                            inv_item->y_rot -= 0x100;
                    }
                }
            }
            if (imo.status == RNG_OPEN || imo.status == RNG_SELECTING || imo.status == RNG_SELECTED || imo.status == RNG_DESELECTING || imo.status == RNG_DESELECT || imo.status == RNG_CLOSING_ITEM)
                RingIsOpen(&ring);
            else
                RingIsNotOpen(&ring);

            if (imo.status == RNG_OPENING || imo.status == RNG_CLOSING || imo.status == RNG_MAIN2OPTION || imo.status == RNG_OPTION2MAIN || imo.status == RNG_EXITING_INVENTORY || imo.status == RNG_DONE || ring.rotating)
                RingActive();

            phd_PushMatrix();
            phd_RotYXZ(angle, 0, 0);
            phd_TranslateRel(ring.radius, 0, 0);
            phd_RotYXZ(0x4000, itilt + inv_item->pt_xrot, 0);
            DrawInventoryItem(inv_item);
            phd_PopMatrix();
            angle += ring.angle_adder;
            angle &= 0xffff;
        }
        phd_PopMatrix();

        mn_update_sound_effects();
        T_DrawText();
        S_OutputPolyList();
        camera.number_frames = inv_nframes = S_DumpScreen();

        if (!ring.rotating)
        {
            if ((Inventory_Mode == INV_SAVE_MODE || Inventory_Mode == INV_LOAD_MODE || Inventory_Mode == INV_DEATH_MODE) && !pass_open)
            {
                inputDB = SELECT_ITEM;
            }

            switch (imo.status)
            {

            case RNG_OPEN:

                if ((input & ROTATE_RIGHT) && ring.number_of_objects > 1)
                {
                    Inv_RingRotateLeft(&ring);
                    SoundEffect(108, NULL, SFX_ALWAYS);
                    break;
                }

                if ((input & ROTATE_LEFT) && ring.number_of_objects > 1)
                {
                    Inv_RingRotateRight(&ring);
                    SoundEffect(108, NULL, SFX_ALWAYS);
                    break;
                }

                if (reset_flag || (inputDB & EXIT_INVENTORY))
                {
                    if (reset_flag || Inventory_Mode != INV_TITLE_MODE)
                    {
                        SoundEffect(112, NULL, SFX_ALWAYS);
                        Inventory_Chosen = -1;
                        if (ring.type == MAIN_RING)
                            inv_main_current = ring.current_object;
                        else
                            inv_option_current = ring.current_object;

                        if (inventory_mode != INV_TITLE_MODE)
                            S_FadeOutInventory(1);
                        else
                            S_FadeOutInventory(0);

                        Inv_RingMotionSetup(&ring, RNG_CLOSING, RNG_DONE, CLOSE_FRAMES);
                        Inv_RingMotionRadius(&ring, 0);
                        Inv_RingMotionCameraPos(&ring, CAMERA_STARTHEIGHT);
                        Inv_RingMotionRotation(&ring, CLOSE_ROTATION, ring.ringpos.y_rot - CLOSE_ROTATION);
                        input = 0;
                        inputDB = 0;
                    }
                }

                if ((inputDB & SELECT_ITEM))
                {
                    if ((Inventory_Mode == INV_SAVE_MODE || Inventory_Mode == INV_LOAD_MODE || Inventory_Mode == INV_DEATH_MODE) && !pass_open)
                        pass_open = 1;
                    item_data = 0;

                    if (ring.type == MAIN_RING)
                    {
                        inv_main_current = ring.current_object;
                        inv_item = inv_main_list[ring.current_object];
                    }
                    else if (ring.type == OPTION_RING)
                    {
                        inv_option_current = ring.current_object;
                        inv_item = inv_option_list[ring.current_object];
                    }
                    else
                    {
                        inv_keys_current = ring.current_object;
                        inv_item = inv_keys_list[ring.current_object];
                    }
                    inv_item->goal_frame = inv_item->open_frame;
                    inv_item->anim_direction = 1;

                    Inv_RingMotionSetup(&ring, RNG_SELECTING, RNG_SELECTED, SELECTING_FRAMES);
                    Inv_RingMotionRotation(&ring, 0, 0xc000 - (ring.current_object * ring.angle_adder));
                    Inv_RingMotionItemSelect(&ring, inv_item);
                    input = 0;
                    inputDB = 0;
                    switch (inv_item->object_number)
                    {
                    case PHOTO_OPTION:
                        SoundEffect(109, NULL, SFX_ALWAYS);
                        break;
                    case CONTROL_OPTION:
                        SoundEffect(110, NULL, SFX_ALWAYS);
                        break;
                    case MAP_OPTION:
                        SoundEffect(113, NULL, SFX_ALWAYS);
                        break;
                    case GUN_OPTION:
                    case SHOTGUN_OPTION:
                    case MAGNUM_OPTION:
                    case UZI_OPTION:
                        SoundEffect(114, NULL, SFX_ALWAYS);
                        break;
                    default:
                        SoundEffect(111, NULL, SFX_ALWAYS);
                        break;
                    }
                }
                if (inputDB & IN_FORWARD && inventory_mode != INV_TITLE_MODE && inventory_mode != INV_KEYS_MODE)
                {
                    if (ring.type == MAIN_RING)
                    {
                        if (inv_keys_objects)
                        {

                            Inv_RingMotionSetup(&ring, RNG_CLOSING, RNG_MAIN2KEYS, RINGSWITCH_FRAMES / 2);
                            Inv_RingMotionRadius(&ring, 0);
                            Inv_RingMotionRotation(&ring, CLOSE_ROTATION, ring.ringpos.y_rot - CLOSE_ROTATION);
                            Inv_RingMotionCameraPitch(&ring, 0x2000);
                            imo.misc = 0x2000;
                        }
                        input = 0;
                        inputDB = 0;
                    }
                    else if (ring.type == OPTION_RING)
                    {
                        if (inv_main_objects)
                        {

                            Inv_RingMotionSetup(&ring, RNG_CLOSING, RNG_OPTION2MAIN, RINGSWITCH_FRAMES / 2);
                            Inv_RingMotionRadius(&ring, 0);
                            Inv_RingMotionRotation(&ring, CLOSE_ROTATION, ring.ringpos.y_rot - CLOSE_ROTATION);
                            Inv_RingMotionCameraPitch(&ring, 0x2000);
                            imo.misc = 0x2000;
                        }
                        inputDB = 0;
                    }
                }
                else if (inputDB & IN_BACK && inventory_mode != INV_TITLE_MODE && inventory_mode != INV_KEYS_MODE)
                {
                    if (ring.type == KEYS_RING)
                    {
                        if (inv_main_objects)
                        {

                            Inv_RingMotionSetup(&ring, RNG_CLOSING, RNG_KEYS2MAIN, RINGSWITCH_FRAMES / 2);
                            Inv_RingMotionRadius(&ring, 0);
                            Inv_RingMotionRotation(&ring, CLOSE_ROTATION, ring.ringpos.y_rot - CLOSE_ROTATION);
                            Inv_RingMotionCameraPitch(&ring, 0 - 0x2000);
                            imo.misc = 0 - 0x2000;
                        }
                        input = 0;
                        inputDB = 0;
                    }
                    else if (ring.type == MAIN_RING)
                    {
                        if (inv_option_objects)
                        {

                            Inv_RingMotionSetup(&ring, RNG_CLOSING, RNG_MAIN2OPTION, RINGSWITCH_FRAMES / 2);
                            Inv_RingMotionRadius(&ring, 0);
                            Inv_RingMotionRotation(&ring, CLOSE_ROTATION, ring.ringpos.y_rot - CLOSE_ROTATION);
                            Inv_RingMotionCameraPitch(&ring, 0 - 0x2000);
                            imo.misc = 0 - 0x2000;
                        }
                        inputDB = 0;
                    }
                }
                break;

            case RNG_MAIN2OPTION:
                Inv_RingMotionSetup(&ring, RNG_OPENING, RNG_OPEN, RINGSWITCH_FRAMES / 2);
                Inv_RingMotionRadius(&ring, RING_RADIUS);
                imo.camera_pitch_target = 0;
                ring.camera_pitch = (sint16)(0 - imo.misc);
                imo.camera_pitch_rate = (sint16)(imo.misc / (RINGSWITCH_FRAMES / 2));

                ring.list = inv_option_list;
                ring.type = OPTION_RING;
                inv_main_current = ring.current_object;

                ring.number_of_objects = inv_option_objects;
                ring.current_object = inv_option_current;

                Inv_RingCalcAdders(&ring, ROTATE_DURATION);
                Inv_RingMotionRotation(&ring, OPEN_ROTATION, 0xc000 - (ring.current_object * ring.angle_adder));
                ring.ringpos.y_rot = imo.rotate_target + OPEN_ROTATION;
                break;

            case RNG_OPTION2MAIN:
                Inv_RingMotionSetup(&ring, RNG_OPENING, RNG_OPEN, RINGSWITCH_FRAMES / 2);
                Inv_RingMotionRadius(&ring, RING_RADIUS);
                imo.camera_pitch_target = 0;
                ring.camera_pitch = (sint16)(0 - imo.misc);
                imo.camera_pitch_rate = (sint16)(imo.misc / (RINGSWITCH_FRAMES / 2));

                ring.list = inv_main_list;
                ring.type = MAIN_RING;
                inv_option_objects = ring.number_of_objects;
                inv_option_current = ring.current_object;

                ring.number_of_objects = inv_main_objects;
                ring.current_object = inv_main_current;

                Inv_RingCalcAdders(&ring, ROTATE_DURATION);
                Inv_RingMotionRotation(&ring, OPEN_ROTATION, 0xc000 - (ring.current_object * ring.angle_adder));
                ring.ringpos.y_rot = imo.rotate_target + OPEN_ROTATION;
                break;

            case RNG_MAIN2KEYS:
                Inv_RingMotionSetup(&ring, RNG_OPENING, RNG_OPEN, RINGSWITCH_FRAMES / 2);
                Inv_RingMotionRadius(&ring, RING_RADIUS);
                imo.camera_pitch_target = 0;
                ring.camera_pitch = (sint16)(0 - imo.misc);
                imo.camera_pitch_rate = (sint16)(imo.misc / (RINGSWITCH_FRAMES / 2));

                ring.list = inv_keys_list;
                ring.type = KEYS_RING;
                inv_main_objects = ring.number_of_objects;
                inv_main_current = ring.current_object;

                ring.number_of_objects = inv_keys_objects;
                ring.current_object = inv_keys_current;

                Inv_RingCalcAdders(&ring, ROTATE_DURATION);
                Inv_RingMotionRotation(&ring, OPEN_ROTATION, 0xc000 - (ring.current_object * ring.angle_adder));
                ring.ringpos.y_rot = imo.rotate_target + OPEN_ROTATION;
                break;

            case RNG_KEYS2MAIN:
                Inv_RingMotionSetup(&ring, RNG_OPENING, RNG_OPEN, RINGSWITCH_FRAMES / 2);
                Inv_RingMotionRadius(&ring, RING_RADIUS);
                imo.camera_pitch_target = 0;
                ring.camera_pitch = (sint16)(0 - imo.misc);
                imo.camera_pitch_rate = (sint16)(imo.misc / (RINGSWITCH_FRAMES / 2));

                ring.list = inv_main_list;
                ring.type = MAIN_RING;
                inv_keys_current = ring.current_object;

                ring.number_of_objects = inv_main_objects;
                ring.current_object = inv_main_current;

                Inv_RingCalcAdders(&ring, ROTATE_DURATION);
                Inv_RingMotionRotation(&ring, OPEN_ROTATION, 0xc000 - (ring.current_object * ring.angle_adder));
                ring.ringpos.y_rot = imo.rotate_target + OPEN_ROTATION;
                break;

            case RNG_CLOSING_ITEM:
                inv_item = *(ring.list + ring.current_object);
                for (frm = 0; frm < inv_nframes; frm++)
                {
                    if (!AnimateInventoryItem(inv_item))
                    {

                        if (inv_item->object_number == PASSPORT_OPTION)
                        {
                            inv_item->object_number = PASSPORT_CLOSED;
                            inv_item->current_frame = 0;
                        }
                        imo.count = SELECTING_FRAMES;
                        imo.status = imo.status_target;
                        Inv_RingMotionItemDeselect(&ring, inv_item);
                        break;
                    }
                }
                break;

            case RNG_DESELECT:
                SoundEffect(112, NULL, SFX_ALWAYS);
                Inv_RingMotionSetup(&ring, RNG_DESELECTING, RNG_OPEN, SELECTING_FRAMES);
                Inv_RingMotionRotation(&ring, 0, 0xc000 - (ring.current_object * ring.angle_adder));
                input = 0;
                inputDB = 0;
                break;

            case RNG_SELECTED:
                inv_item = *(ring.list + ring.current_object);

                if (inv_item->object_number == PASSPORT_CLOSED)
                    inv_item->object_number = PASSPORT_OPTION;

                for (frm = 0; frm < inv_nframes; frm++)
                {
                    busy = 0;
                    if (inv_item->y_rot == inv_item->y_rot_sel)
                        busy = AnimateInventoryItem(inv_item);
                }

                if (!busy && !idelay)
                {

                    do_inventory_options(inv_item);

                    if ((inputDB & DESELECT_ITEM))
                    {
                        inv_item->sprlist = NULL;
                        Inv_RingMotionSetup(&ring, RNG_CLOSING_ITEM, RNG_DESELECT, 0);
                        input = 0;
                        inputDB = 0;

                        if (Inventory_Mode == INV_LOAD_MODE || Inventory_Mode == INV_SAVE_MODE)
                        {
                            Inv_RingMotionSetup(&ring, RNG_CLOSING_ITEM, RNG_EXITING_INVENTORY, 0);
                            input = inputDB = 0;
                        }
                    }

                    if (inputDB & SELECT_ITEM)
                    {
                        inv_item->sprlist = NULL;
                        Inventory_Chosen = inv_item->object_number;
                        if (ring.type == MAIN_RING)
                            inv_main_current = ring.current_object;
                        else
                            inv_option_current = ring.current_object;

                        if (Inventory_Mode == INV_TITLE_MODE && (inv_item->object_number == DETAIL_OPTION || inv_item->object_number == SOUND_OPTION || inv_item->object_number == CONTROL_OPTION || inv_item->object_number == GAMMA_OPTION))
                            Inv_RingMotionSetup(&ring, RNG_CLOSING_ITEM, RNG_DESELECT, 0);
                        else
                            Inv_RingMotionSetup(&ring, RNG_CLOSING_ITEM, RNG_EXITING_INVENTORY, 0);
                        input = 0;
                        inputDB = 0;
                    }
                }
                break;

            case RNG_EXITING_INVENTORY:
                if (!imo.count)
                {
                    if (inventory_mode != INV_TITLE_MODE)
                        S_FadeOutInventory(1);
                    else
                        S_FadeOutInventory(0);

                    Inv_RingMotionSetup(&ring, RNG_CLOSING, RNG_DONE, CLOSE_FRAMES);
                    Inv_RingMotionRadius(&ring, 0);
                    Inv_RingMotionCameraPos(&ring, CAMERA_STARTHEIGHT);
                    Inv_RingMotionRotation(&ring, CLOSE_ROTATION, ring.ringpos.y_rot - CLOSE_ROTATION);
                }
                break;
            default:
                break;
            }
        }
    } while (imo.status != RNG_DONE);

    RemoveInventoryText();

    S_FinishInventory();

    Inventory_Displaying = 0;

    if (reset_flag)
        return EXIT_TO_TITLE;

    if (Inventory_Chosen == -1)
    {
        if (inventory_mode != INV_TITLE_MODE && Option_Music_Volume)
            S_CDVolume(Option_Music_Volume * 25 + 5);
        return 0;
    }

    switch (Inventory_Chosen)
    {

    case PASSPORT_OPTION:
        if (Inventory_ExtraData[0] == 1 && Option_Music_Volume)
            S_CDVolume(Option_Music_Volume * 25 + 5);

        return 1;
    case PHOTO_OPTION:
        Inventory_ExtraData[1] = 0;

        return 1;
    case DETAIL_OPTION:
        break;
    case SOUND_OPTION:
        break;
    case CONTROL_OPTION:
        break;
    case GAMMA_OPTION:
        break;

    case GUN_OPTION:
        UseItem(GUN_OPTION);
        break;
    case SHOTGUN_OPTION:
        UseItem(SHOTGUN_OPTION);
        break;
    case MAGNUM_OPTION:
        UseItem(MAGNUM_OPTION);
        break;
    case UZI_OPTION:
        UseItem(UZI_OPTION);
        break;
    case MEDI_OPTION:
        UseItem(MEDI_OPTION);
        break;
    case BIGMEDI_OPTION:
        UseItem(BIGMEDI_OPTION);
        break;
    default:
        break;
    }

    if (inventory_mode != INV_TITLE_MODE && Option_Music_Volume)
        S_CDVolume(Option_Music_Volume * 25 + 5);

    return 0;
}

void Construct_Inventory(void)
{
    int n;
    INVENTORY_ITEM *inv_item;

    S_SetupAboveWater(0);

    if (Inventory_Mode != INV_TITLE_MODE)
        TempVideoAdjust(hires_flag, 1.0);

    phd_left = 0;
    phd_top = 0;
    phd_right = phd_winxmax;
    phd_bottom = phd_winymax;

    Inventory_Displaying = 1;
    Inventory_Chosen = 0;
    for (n = 0; n < 8; n++)
    {
        Inventory_ExtraData[n] = 0;
    }
    if (Inventory_Mode == INV_TITLE_MODE)
        inv_option_objects = TITLE_RING_OBJECTS;
    else
        inv_option_objects = OPTION_RING_OBJECTS;

    for (n = 0; n < inv_main_objects; n++)
    {
        inv_item = inv_main_list[n];
        inv_item->drawn_meshes = inv_item->which_meshes;
        if (inv_item->object_number == MAP_OPTION && Compass_Status)
        {
            inv_item->current_frame = inv_item->open_frame;
            inv_item->drawn_meshes = 0xffffffff;
        }
        else
            inv_item->current_frame = 0;
        inv_item->goal_frame = inv_item->current_frame;
        inv_item->anim_count = 0;
        inv_item->y_rot = 0;
    }
    for (n = 0; n < inv_option_objects; n++)
    {
        inv_item = inv_option_list[n];
        inv_item->current_frame = 0;
        inv_item->goal_frame = inv_item->current_frame;
        inv_item->anim_count = 0;
        inv_item->y_rot = 0;
    }
    inv_main_current = 0;
    inv_option_current = 0;
    item_data = 0;
}

sint32 GetDebouncedInput(sint32 input)
{
    if (input && !oldInputDB)
    {
        oldInputDB = input;
    }
    else if (!input)
    {
        oldInputDB = 0;
    }
    else
    {
        input = 0;
    }

    return input;
}

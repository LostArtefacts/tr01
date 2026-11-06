    .386p
    .model flat

    extrn _sos_mix_routines:near
    extrn _sos_mix_convert_routines:near
    extrn _sos_mix_current_sample:byte
    extrn _sos_mix_output_limit:byte
    extrn _sos_mix_output_bytes:byte
    extrn _sos_mix_output_cursor:byte
    extrn _sos_mix_previous_sample:byte
    extrn _sos_mix_sample_end:byte
    extrn _sos_mix_fractional_step:byte
    extrn _sos_mix_step_without_carry:byte
    extrn _sos_mix_step_with_carry:byte
    extrn _sos_mix_flags:byte
    extrn _sos_mix_convert_flags:byte
    extrn _sos_mix_left_volume:byte
    extrn _sos_mix_right_volume:byte
    extrn _sos_mix_selected_routine:byte

    public sosMIXCodeStart_
    public sosMIXUpdateDriver_
    public sosMIXCodeEnd_

    .code
sosMIXCodeStart_ proc near
    ret
sosMIXCodeStart_ endp
sosMIXUpdateDriver_ proc near
    push ebp
    mov ebp, esp
    push ebx
    push ecx
    push edx
    push esi
    push edi
    push ebp
    mov eax, dword ptr [ebp+08h]
    mov ebp, eax
    cmp dword ptr [ebp+034h], 00h
    je short read_dma_count
    push es
    xor edx, edx
    mov edi, dword ptr [ebp+03ch]
    push ds
    pop es
    xor eax, eax
    push fs
    push eax
    call fword ptr [ebp+034h]
    add esp, 08h
    pop es
    movzx ebx, ax
    cmp ebx, dword ptr [ebp+020h]
    jne short check_position
    nop
    nop
    nop
    nop
    jmp mix_done
read_dma_count:
    xor eax, eax
    mov edx, 0ch
    out dx, al
    jmp short $+2
    mov edx, dword ptr [ebp+018h]
    in al, dx
    jmp short $+2
    xchg al, ah
    in al, dx
    jmp short $+2
    xchg al, ah
    inc eax
    cmp edx, 07h
    jbe short have_dma_count
    add eax, eax
have_dma_count:
    cmp eax, dword ptr [ebp+044h]
    jbe short have_dma_position
    xor eax, eax
    mov edx, 0ch
    out dx, al
    jmp short $+2
    mov eax, dword ptr [ebp+044h]
    dec eax
    mov edx, dword ptr [ebp+018h]
    out dx, al
    jmp short $+2
    xchg al, ah
    out dx, al
    jmp short $+2
    xchg al, ah
have_dma_position:
    mov ebx, dword ptr [ebp+044h]
    sub ebx, eax
    and ebx, 0fffch
check_position:
    or ebx, ebx
    jne short position_ready
    add ebx, 020h
position_ready:
    cmp ebx, dword ptr [ebp+020h]
    je mix_done
    mov dword ptr [ebp+01ch], ebx
    mov eax, dword ptr [ebp+01ch]
    sub eax, dword ptr [ebp+020h]
    jae short have_length
    mov eax, dword ptr [ebp+044h]
    sub eax, dword ptr [ebp+020h]
    add eax, dword ptr [ebp+01ch]
have_length:
    mov dword ptr [ebp+024h], eax
    cmp dword ptr [ebp+0ch], 010h
    je short length_in_bytes
    shl eax, 1
length_in_bytes:
    shl eax, 1
    mov dword ptr [_sos_mix_output_bytes], eax
    add eax, dword ptr [ebp+048h]
    dec eax
    mov dword ptr [ebp+04ch], eax
    mov dword ptr [_sos_mix_output_limit], eax
    mov edi, dword ptr [ebp+048h]
    mov ecx, dword ptr [_sos_mix_output_bytes]
    add ecx, 020h
    xor eax, eax
    push ecx
    shr ecx, 02h
    rep stosd
    pop ecx
    and ecx, 03h
    rep stosb
    mov eax, dword ptr [ebp+01ch]
    mov dword ptr [ebp+020h], eax
    mov dword ptr [ebp+054h], 00h
    mov dword ptr [_sos_mix_previous_sample], 00h
    mov esi, dword ptr [ebp+030h]
    or esi, esi
    je select_converter
next_sample:
    mov dword ptr [_sos_mix_current_sample], esi
    test dword ptr [esi+020h], 04000h
    jne remove_sample
    inc dword ptr [ebp+054h]
    mov edi, dword ptr [ebp+048h]
mix_chunk:
    mov dword ptr [_sos_mix_flags], 00h
    test dword ptr [esi+040h], 08000h
    je short check_flag_4000
    nop
    nop
    nop
    nop
    or dword ptr [_sos_mix_flags], 01h
check_flag_4000:
    test dword ptr [esi+040h], 04000h
    je short check_volume
    nop
    nop
    nop
    nop
    or dword ptr [_sos_mix_flags], 040h
check_volume:
    cmp dword ptr [esi+044h], 08000h
    jne short split_pan
    mov eax, dword ptr [esi+02ch]
    and eax, 07fffh
    mov dword ptr [_sos_mix_left_volume], eax
    mov eax, dword ptr [esi+02ch]
    shr eax, 010h
    and eax, 07fffh
    mov dword ptr [_sos_mix_right_volume], eax
    jmp short check_full_volume
split_pan:
    mov ebx, 07fffh
    mov ecx, 07fffh
    test dword ptr [esi+044h], 08000h
    jne short pan_right
    mov ecx, dword ptr [esi+044h]
    jmp short scale_volume
pan_right:
    mov ebx, 0ffffh
    sub ebx, dword ptr [esi+044h]
scale_volume:
    xor edx, edx
    mov eax, dword ptr [esi+02ch]
    imul bx
    add edx, edx
    mov dword ptr [_sos_mix_left_volume], edx
    xor edx, edx
    mov eax, dword ptr [esi+02ch]
    imul cx
    add edx, edx
    mov dword ptr [_sos_mix_right_volume], edx
check_full_volume:
    cmp dword ptr [_sos_mix_left_volume], 07ff0h
    jb short set_volume_bit
    cmp dword ptr [_sos_mix_right_volume], 07ff0h
    jae short check_sample_bits
set_volume_bit:
    or dword ptr [_sos_mix_flags], 020h
check_sample_bits:
    cmp dword ptr [esi+038h], 08h
    je short check_sample_channels
    or dword ptr [_sos_mix_flags], 02h
check_sample_channels:
    cmp dword ptr [esi+03ch], 01h
    je short check_output_channels
    or dword ptr [_sos_mix_flags], 08h
check_output_channels:
    cmp dword ptr [ebp+08h], 01h
    je short check_rate
    or dword ptr [_sos_mix_flags], 04h
check_rate:
    xor eax, eax
    mov edx, dword ptr [esi+034h]
    cmp edx, dword ptr [ebp+04h]
    je short call_mixer
    mov ecx, dword ptr [ebp+04h]
    shl ecx, 010h
    div ecx
    mov ebx, eax
    shr ebx, 010h
    shl eax, 010h
    mov dword ptr [_sos_mix_fractional_step], eax
    mov eax, ebx
    inc ebx
    test dword ptr [_sos_mix_flags], 08h
    je short check_16bit_step
    shl eax, 1
    shl ebx, 1
check_16bit_step:
    test dword ptr [_sos_mix_flags], 02h
    je short store_step
    nop
    nop
    nop
    nop
    shl eax, 1
    shl ebx, 1
store_step:
    mov word ptr [_sos_mix_step_without_carry], ax
    mov word ptr [_sos_mix_step_with_carry], bx
    or dword ptr [_sos_mix_flags], 010h
call_mixer:
    mov eax, dword ptr [_sos_mix_flags]
    shl eax, 02h
    add eax, offset _sos_mix_routines
    mov eax, dword ptr [eax]
    mov dword ptr [_sos_mix_selected_routine], eax
    mov eax, dword ptr [esi]
    add eax, dword ptr [esi+0ch]
    mov dword ptr [_sos_mix_sample_end], eax
    mov esi, dword ptr [esi+04h]
    mov ecx, 080000000h
    push ebp
    xor eax, eax
    xor ebx, ebx
    call dword ptr [_sos_mix_selected_routine]
    pop ebp
    mov dword ptr [_sos_mix_output_cursor], edi
    mov edi, esi
    mov esi, dword ptr [_sos_mix_current_sample]
    mov eax, edi
    sub eax, dword ptr [esi+04h]
    add dword ptr [esi+04h], eax
    mov eax, dword ptr [_sos_mix_output_cursor]
    sub eax, dword ptr [ebp+048h]
    shr eax, 02h
    add dword ptr [esi+058h], eax
    mov eax, dword ptr [esi+04h]
    cmp eax, dword ptr [_sos_mix_sample_end]
    jb check_sample_limit
    cmp dword ptr [esi+030h], 0ffffffffh
    je restart_sample
    cmp dword ptr [esi+030h], 00h
    je short sample_ended
    nop
    nop
    nop
    nop
    dec dword ptr [esi+030h]
    jmp restart_sample
sample_ended:
    or dword ptr [esi+020h], 04000h
    cmp dword ptr [esi+05ch], 00h
    je check_sample_limit
    mov dword ptr [esi], 00h
    push ebx
    push ecx
    push edx
    push esi
    push edi
    push ebp
    push esi
    call dword ptr [esi+05ch]
    add esp, 04h
    pop ebp
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    cmp dword ptr [esi], 00h
    je check_sample_limit
    and dword ptr [esi+020h], 0ffffbfffh
    jmp short restart_sample
    nop
    nop
    nop
remove_sample:
    mov dword ptr [esi+020h], 00h
    cmp dword ptr [esi+060h], 00h
    je short unlink_sample
    nop
    nop
    nop
    nop
    push ebx
    push ecx
    push edx
    push esi
    push edi
    push ebp
    push esi
    call dword ptr [esi+060h]
    add esp, 04h
    pop ebp
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
unlink_sample:
    and dword ptr [esi+020h], 0ffff7fffh
    or dword ptr [esi+020h], 02000h
    cmp dword ptr [_sos_mix_previous_sample], 00h
    jne short unlink_from_previous
    mov eax, dword ptr [esi+0ech]
    mov dword ptr [ebp+030h], eax
    jmp short advance_list
    nop
    nop
    nop
unlink_from_previous:
    mov eax, dword ptr [esi+0ech]
    mov edi, dword ptr [_sos_mix_previous_sample]
    mov dword ptr [edi+0ech], eax
    jmp short advance_list
    nop
    nop
    nop
restart_sample:
    mov eax, dword ptr [esi]
    mov dword ptr [esi+04h], eax
    mov edi, dword ptr [_sos_mix_output_cursor]
    cmp edi, dword ptr [ebp+04ch]
    jb mix_chunk
check_sample_limit:
    mov eax, dword ptr [ebp+054h]
    cmp eax, dword ptr [ebp+014h]
    jae short select_converter
    nop
    nop
    nop
    nop
    mov dword ptr [_sos_mix_previous_sample], esi
advance_list:
    mov esi, dword ptr [esi+0ech]
    or esi, esi
    jne next_sample
select_converter:
    xor eax, eax
    test dword ptr [ebp+010h], 08000h
    je short check_swap
    nop
    nop
    nop
    nop
    or eax, 02h
check_swap:
    test dword ptr [ebp+010h], 04000h
    je short check_output_bits
    nop
    nop
    nop
    nop
    or eax, 08h
check_output_bits:
    cmp dword ptr [ebp+0ch], 08h
    je short check_output_stereo
    and eax, 0fffffffdh
    or eax, 01h
check_output_stereo:
    cmp dword ptr [ebp+08h], 01h
    je short check_clip
    or eax, 04h
check_clip:
    cmp dword ptr [ebp+054h], 01h
    jbe short store_format
    or eax, 010h
store_format:
    mov dword ptr [_sos_mix_convert_flags], eax
    shl eax, 02h
    add eax, offset _sos_mix_convert_routines
    mov eax, dword ptr [eax]
    mov dword ptr [_sos_mix_selected_routine], eax
    mov edi, dword ptr [ebp+028h]
    mov esi, dword ptr [ebp+048h]
    mov ecx, dword ptr [_sos_mix_output_bytes]
    shr ecx, 02h
    mov edx, ecx
    cmp dword ptr [ebp+08h], 01h
    je short check_16bit_output
    shr ecx, 1
check_16bit_output:
    cmp dword ptr [ebp+0ch], 010h
    jne short check_wrap
    shl edx, 1
check_wrap:
    mov eax, edi
    add eax, edx
    cmp eax, dword ptr [ebp+040h]
    jb short convert_whole
    nop
    nop
    nop
    nop
    mov eax, edx
    mov ecx, dword ptr [ebp+040h]
    sub ecx, dword ptr [ebp+028h]
    sub eax, ecx
    push eax
    cmp dword ptr [ebp+0ch], 08h
    je short first_part_channels
    shr ecx, 1
first_part_channels:
    cmp dword ptr [ebp+08h], 01h
    je short convert_first_part
    shr ecx, 1
convert_first_part:
    call dword ptr [_sos_mix_selected_routine]
    pop ecx
    mov edi, dword ptr [ebp+03ch]
    or ecx, ecx
    je short converted
    cmp dword ptr [ebp+0ch], 08h
    je short second_part_bits
    shr ecx, 1
second_part_bits:
    cmp dword ptr [ebp+08h], 01h
    je short convert_second_part
    shr ecx, 1
convert_second_part:
    call dword ptr [_sos_mix_selected_routine]
    jmp short converted
convert_whole:
    call dword ptr [_sos_mix_selected_routine]
converted:
    mov dword ptr [ebp+028h], edi
    cmp dword ptr [ebp+054h], 00h
    jne short mix_done
    mov eax, dword ptr [ebp+03ch]
    add eax, dword ptr [ebp+01ch]
    add eax, dword ptr [ebp+02ch]
    cmp eax, dword ptr [ebp+040h]
    jb short store_write_position
    nop
    nop
    nop
    nop
    sub eax, dword ptr [ebp+044h]
store_write_position:
    mov dword ptr [ebp+028h], eax
mix_done:
    pop ebp
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    pop ebp
    ret
sosMIXUpdateDriver_ endp
sosMIXCodeEnd_ proc near
    ret
sosMIXCodeEnd_ endp

    end

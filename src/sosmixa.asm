    .386p
    .model flat

    extrn _Datac85c4:byte
    extrn _Datac85d4:byte
    extrn _Datac85d8:byte
    extrn _Datac85dc:byte
    extrn _Datac85f0:byte
    extrn _Datac85f4:byte

    public Func5a834_
    public _Data5a835
    public Func5c71b_
    public Func5c775_

    .code
Func5a834_ proc near
    ret
Func5a834_ endp
_Data5a835 dword offset mix_s8_mono_to_mono
    dword offset mix_u8_mono_to_mono
    dword offset mix_s16_mono_to_mono
    dword offset mix_u16_mono_to_mono
    dword offset mix_s8_mono_to_stereo
    dword offset mix_u8_mono_to_stereo
    dword offset mix_s16_mono_to_stereo
    dword offset mix_u16_mono_to_stereo
    dword offset mix_s8_stereo_to_mono
    dword offset mix_u8_stereo_to_mono
    dword offset mix_s16_stereo_to_mono
    dword offset mix_u16_stereo_to_mono
    dword offset mix_s8_stereo_to_stereo
    dword offset mix_u8_stereo_to_stereo
    dword offset mix_s16_stereo_to_stereo
    dword offset mix_u16_stereo_to_stereo
    dword offset mix_s8_mono_to_mono_step
    dword offset mix_u8_mono_to_mono_step
    dword offset mix_s16_mono_to_mono_step
    dword offset mix_u16_mono_to_mono_step
    dword offset mix_s8_mono_to_stereo_step
    dword offset mix_u8_mono_to_stereo_step
    dword offset mix_s16_mono_to_stereo_step
    dword offset mix_u16_mono_to_stereo_step
    dword offset mix_s8_stereo_to_mono_step
    dword offset mix_u8_stereo_to_mono_step
    dword offset mix_s16_stereo_to_mono_step
    dword offset mix_u16_stereo_to_mono_step
    dword offset mix_s8_stereo_to_stereo_step
    dword offset mix_u8_stereo_to_stereo_step
    dword offset mix_s16_stereo_to_stereo_step
    dword offset mix_u16_stereo_to_stereo_step
    dword offset mix_s8_mono_to_mono_volume
    dword offset mix_u8_mono_to_mono_volume
    dword offset mix_s16_mono_to_mono_volume
    dword offset mix_u16_mono_to_mono_volume
    dword offset mix_s8_mono_to_stereo_volume
    dword offset mix_u8_mono_to_stereo_volume
    dword offset mix_s16_mono_to_stereo_volume
    dword offset mix_u16_mono_to_stereo_volume
    dword offset mix_s8_stereo_to_mono_volume
    dword offset mix_u8_stereo_to_mono_volume
    dword offset mix_s16_stereo_to_mono_volume
    dword offset mix_u16_stereo_to_mono_volume
    dword offset mix_s8_stereo_to_stereo_volume
    dword offset mix_u8_stereo_to_stereo_volume
    dword offset mix_s16_stereo_to_stereo_volume
    dword offset mix_u16_stereo_to_stereo_volume
    dword offset mix_s8_mono_to_mono_volume_step
    dword offset mix_u8_mono_to_mono_volume_step
    dword offset mix_s16_mono_to_mono_volume_step
    dword offset mix_u16_mono_to_mono_volume_step
    dword offset mix_s8_mono_to_stereo_volume_step
    dword offset mix_u8_mono_to_stereo_volume_step
    dword offset mix_s16_mono_to_stereo_volume_step
    dword offset mix_u16_mono_to_stereo_volume_step
    dword offset mix_s8_stereo_to_mono_volume_step
    dword offset mix_u8_stereo_to_mono_volume_step
    dword offset mix_s16_stereo_to_mono_volume_step
    dword offset mix_u16_stereo_to_mono_volume_step
    dword offset mix_s8_stereo_to_stereo_volume_step
    dword offset mix_u8_stereo_to_stereo_volume_step
    dword offset mix_s16_stereo_to_stereo_volume_step
    dword offset mix_u16_stereo_to_stereo_volume_step
    dword offset mix_s8_mono_to_mono_swapped
    dword offset mix_u8_mono_to_mono_swapped
    dword offset mix_s16_mono_to_mono_swapped
    dword offset mix_u16_mono_to_mono_swapped
    dword offset mix_s8_mono_to_stereo_swapped
    dword offset mix_u8_mono_to_stereo_swapped
    dword offset mix_s16_mono_to_stereo_swapped
    dword offset mix_u16_mono_to_stereo_swapped
    dword offset mix_s8_stereo_to_mono_swapped
    dword offset mix_u8_stereo_to_mono_swapped
    dword offset mix_s16_stereo_to_mono_swapped
    dword offset mix_u16_stereo_to_mono_swapped
    dword offset mix_s8_stereo_to_stereo_swapped
    dword offset mix_u8_stereo_to_stereo_swapped
    dword offset mix_s16_stereo_to_stereo_swapped
    dword offset mix_u16_stereo_to_stereo_swapped
    dword offset mix_s8_mono_to_mono_step_swapped
    dword offset mix_u8_mono_to_mono_step_swapped
    dword offset mix_s16_mono_to_mono_step_swapped
    dword offset mix_u16_mono_to_mono_step_swapped
    dword offset mix_s8_mono_to_stereo_step_swapped
    dword offset mix_u8_mono_to_stereo_step_swapped
    dword offset mix_s16_mono_to_stereo_step_swapped
    dword offset mix_u16_mono_to_stereo_step_swapped
    dword offset mix_s8_stereo_to_mono_step_swapped
    dword offset mix_u8_stereo_to_mono_step_swapped
    dword offset mix_s16_stereo_to_mono_step_swapped
    dword offset mix_u16_stereo_to_mono_step_swapped
    dword offset mix_s8_stereo_to_stereo_step_swapped
    dword offset mix_u8_stereo_to_stereo_step_swapped
    dword offset mix_s16_stereo_to_stereo_step_swapped
    dword offset mix_u16_stereo_to_stereo_step_swapped
    dword offset mix_s8_mono_to_mono_volume_swapped
    dword offset mix_u8_mono_to_mono_volume_swapped
    dword offset mix_s16_mono_to_mono_volume_swapped
    dword offset mix_u16_mono_to_mono_volume_swapped
    dword offset mix_s8_mono_to_stereo_volume_swapped
    dword offset mix_u8_mono_to_stereo_volume_swapped
    dword offset mix_s16_mono_to_stereo_volume_swapped
    dword offset mix_u16_mono_to_stereo_volume_swapped
    dword offset mix_s8_stereo_to_mono_volume_swapped
    dword offset mix_u8_stereo_to_mono_volume_swapped
    dword offset mix_s16_stereo_to_mono_volume_swapped
    dword offset mix_u16_stereo_to_mono_volume_swapped
    dword offset mix_s8_stereo_to_stereo_volume_swapped
    dword offset mix_u8_stereo_to_stereo_volume_swapped
    dword offset mix_s16_stereo_to_stereo_volume_swapped
    dword offset mix_u16_stereo_to_stereo_volume_swapped
    dword offset mix_s8_mono_to_mono_volume_step_swapped
    dword offset mix_u8_mono_to_mono_volume_step_swapped
    dword offset mix_s16_mono_to_mono_volume_step_swapped
    dword offset mix_u16_mono_to_mono_volume_step_swapped
    dword offset mix_s8_mono_to_stereo_volume_step_swapped
    dword offset mix_u8_mono_to_stereo_volume_step_swapped
    dword offset mix_s16_mono_to_stereo_volume_step_swapped
    dword offset mix_u16_mono_to_stereo_volume_step_swapped
    dword offset mix_s8_stereo_to_mono_volume_step_swapped
    dword offset mix_u8_stereo_to_mono_volume_step_swapped
    dword offset mix_s16_stereo_to_mono_volume_step_swapped
    dword offset mix_u16_stereo_to_mono_volume_step_swapped
    dword offset mix_s8_stereo_to_stereo_volume_step_swapped
    dword offset mix_u8_stereo_to_stereo_volume_step_swapped
    dword offset mix_s16_stereo_to_stereo_volume_step_swapped
    dword offset Func5c71b_
    dword 128 dup(0)
mix_s8_mono_to_mono:
    cmp esi, dword ptr [_Datac85d4]
    jae mix_s8_mono_to_mono_done
    mov ah, byte ptr [esi]
    movsx eax, ax
    add dword ptr [edi], eax
    add edi, 04h
    add esi, 01h
    cmp edi, dword ptr [_Datac85c4]
    jbe mix_s8_mono_to_mono
mix_s8_mono_to_mono_done:
    ret
mix_u8_mono_to_mono:
    cmp esi, dword ptr [_Datac85d4]
    jae mix_u8_mono_to_mono_done
    mov ah, byte ptr [esi]
    xor eax, 08000h
    movsx eax, ax
    add dword ptr [edi], eax
    add edi, 04h
    add esi, 01h
    cmp edi, dword ptr [_Datac85c4]
    jbe mix_u8_mono_to_mono
mix_u8_mono_to_mono_done:
    ret
mix_s16_mono_to_mono:
    cmp esi, dword ptr [_Datac85d4]
    jae mix_s16_mono_to_mono_done
    mov ax, word ptr [esi]
    movsx eax, ax
    add dword ptr [edi], eax
    add edi, 04h
    add esi, 02h
    cmp edi, dword ptr [_Datac85c4]
    jbe mix_s16_mono_to_mono
mix_s16_mono_to_mono_done:
    ret
mix_u16_mono_to_mono:
    cmp esi, dword ptr [_Datac85d4]
    jae mix_u16_mono_to_mono_done
    mov ax, word ptr [esi]
    xor eax, 08000h
    movsx eax, ax
    add dword ptr [edi], eax
    add edi, 04h
    add esi, 02h
    cmp edi, dword ptr [_Datac85c4]
    jbe mix_u16_mono_to_mono
mix_u16_mono_to_mono_done:
    ret
mix_s8_mono_to_stereo:
    cmp esi, dword ptr [_Datac85d4]
    jae mix_s8_mono_to_stereo_done
    mov ah, byte ptr [esi]
    movsx eax, ax
    add dword ptr [edi], eax
    add dword ptr [edi+04h], eax
    add edi, 08h
    add esi, 01h
    cmp edi, dword ptr [_Datac85c4]
    jbe mix_s8_mono_to_stereo
mix_s8_mono_to_stereo_done:
    ret
mix_u8_mono_to_stereo:
    cmp esi, dword ptr [_Datac85d4]
    jae mix_u8_mono_to_stereo_done
    mov ah, byte ptr [esi]
    xor eax, 08000h
    movsx eax, ax
    add dword ptr [edi], eax
    add dword ptr [edi+04h], eax
    add edi, 08h
    add esi, 01h
    cmp edi, dword ptr [_Datac85c4]
    jbe mix_u8_mono_to_stereo
mix_u8_mono_to_stereo_done:
    ret
mix_s16_mono_to_stereo:
    cmp esi, dword ptr [_Datac85d4]
    jae mix_s16_mono_to_stereo_done
    mov ax, word ptr [esi]
    movsx eax, ax
    add dword ptr [edi], eax
    add dword ptr [edi+04h], eax
    add edi, 08h
    add esi, 02h
    cmp edi, dword ptr [_Datac85c4]
    jbe mix_s16_mono_to_stereo
mix_s16_mono_to_stereo_done:
    ret
mix_u16_mono_to_stereo:
    cmp esi, dword ptr [_Datac85d4]
    jae mix_u16_mono_to_stereo_done
    mov ax, word ptr [esi]
    xor eax, 08000h
    movsx eax, ax
    add dword ptr [edi], eax
    add dword ptr [edi+04h], eax
    add edi, 08h
    add esi, 02h
    cmp edi, dword ptr [_Datac85c4]
    jbe mix_u16_mono_to_stereo
mix_u16_mono_to_stereo_done:
    ret
mix_s8_stereo_to_mono:
    cmp esi, dword ptr [_Datac85d4]
    jae mix_s8_stereo_to_mono_done
    mov ah, byte ptr [esi]
    mov bh, byte ptr [esi+01h]
    movsx eax, ax
    add dword ptr [edi], eax
    add edi, 04h
    add esi, 02h
    cmp edi, dword ptr [_Datac85c4]
    jbe mix_s8_stereo_to_mono
mix_s8_stereo_to_mono_done:
    ret
mix_u8_stereo_to_mono:
    cmp esi, dword ptr [_Datac85d4]
    jae mix_u8_stereo_to_mono_done
    mov ah, byte ptr [esi]
    mov bh, byte ptr [esi+01h]
    xor eax, 08000h
    xor ebx, 08000h
    movsx eax, ax
    add dword ptr [edi], eax
    add edi, 04h
    add esi, 02h
    cmp edi, dword ptr [_Datac85c4]
    jbe mix_u8_stereo_to_mono
mix_u8_stereo_to_mono_done:
    ret
mix_s16_stereo_to_mono:
    cmp esi, dword ptr [_Datac85d4]
    jae mix_s16_stereo_to_mono_done
    mov ax, word ptr [esi]
    mov bx, word ptr [esi+02h]
    movsx eax, ax
    add dword ptr [edi], eax
    add edi, 04h
    add esi, 04h
    cmp edi, dword ptr [_Datac85c4]
    jbe mix_s16_stereo_to_mono
mix_s16_stereo_to_mono_done:
    ret
mix_u16_stereo_to_mono:
    cmp esi, dword ptr [_Datac85d4]
    jae mix_u16_stereo_to_mono_done
    mov ax, word ptr [esi]
    mov bx, word ptr [esi+02h]
    xor eax, 08000h
    xor ebx, 08000h
    movsx eax, ax
    add dword ptr [edi], eax
    add edi, 04h
    add esi, 04h
    cmp edi, dword ptr [_Datac85c4]
    jbe mix_u16_stereo_to_mono
mix_u16_stereo_to_mono_done:
    ret
mix_s8_stereo_to_stereo:
    cmp esi, dword ptr [_Datac85d4]
    jae mix_s8_stereo_to_stereo_done
    mov ah, byte ptr [esi]
    mov bh, byte ptr [esi+01h]
    movsx eax, ax
    add dword ptr [edi], eax
    movsx ebx, bx
    add dword ptr [edi+04h], ebx
    add edi, 08h
    add esi, 02h
    cmp edi, dword ptr [_Datac85c4]
    jbe mix_s8_stereo_to_stereo
mix_s8_stereo_to_stereo_done:
    ret
mix_u8_stereo_to_stereo:
    cmp esi, dword ptr [_Datac85d4]
    jae mix_u8_stereo_to_stereo_done
    mov ah, byte ptr [esi]
    mov bh, byte ptr [esi+01h]
    xor eax, 08000h
    xor ebx, 08000h
    movsx eax, ax
    add dword ptr [edi], eax
    movsx ebx, bx
    add dword ptr [edi+04h], ebx
    add edi, 08h
    add esi, 02h
    cmp edi, dword ptr [_Datac85c4]
    jbe mix_u8_stereo_to_stereo
mix_u8_stereo_to_stereo_done:
    ret
mix_s16_stereo_to_stereo:
    cmp esi, dword ptr [_Datac85d4]
    jae mix_s16_stereo_to_stereo_done
    mov ax, word ptr [esi]
    mov bx, word ptr [esi+02h]
    movsx eax, ax
    add dword ptr [edi], eax
    movsx ebx, bx
    add dword ptr [edi+04h], ebx
    add edi, 08h
    add esi, 04h
    cmp edi, dword ptr [_Datac85c4]
    jbe mix_s16_stereo_to_stereo
mix_s16_stereo_to_stereo_done:
    ret
mix_u16_stereo_to_stereo:
    cmp esi, dword ptr [_Datac85d4]
    jae mix_u16_stereo_to_stereo_done
    mov ax, word ptr [esi]
    mov bx, word ptr [esi+02h]
    xor eax, 08000h
    xor ebx, 08000h
    movsx eax, ax
    add dword ptr [edi], eax
    movsx ebx, bx
    add dword ptr [edi+04h], ebx
    add edi, 08h
    add esi, 04h
    cmp edi, dword ptr [_Datac85c4]
    jbe mix_u16_stereo_to_stereo
mix_u16_stereo_to_stereo_done:
    ret
mix_s8_mono_to_mono_step:
    cmp esi, dword ptr [_Datac85d4]
    jae mix_s8_mono_to_mono_step_done
    mov ah, byte ptr [esi]
    movsx eax, ax
    add dword ptr [edi], eax
    add edi, 04h
    add ecx, dword ptr [_Datac85d8]
    adc esi, dword ptr [_Datac85dc]
    cmp edi, dword ptr [_Datac85c4]
    jbe mix_s8_mono_to_mono_step
mix_s8_mono_to_mono_step_done:
    ret
mix_u8_mono_to_mono_step:
    cmp esi, dword ptr [_Datac85d4]
    jae mix_u8_mono_to_mono_step_done
    mov ah, byte ptr [esi]
    xor eax, 08000h
    movsx eax, ax
    add dword ptr [edi], eax
    add edi, 04h
    add ecx, dword ptr [_Datac85d8]
    adc esi, dword ptr [_Datac85dc]
    cmp edi, dword ptr [_Datac85c4]
    jbe mix_u8_mono_to_mono_step
mix_u8_mono_to_mono_step_done:
    ret
mix_s16_mono_to_mono_step:
    cmp esi, dword ptr [_Datac85d4]
    jae mix_s16_mono_to_mono_step_done
    mov ax, word ptr [esi]
    movsx eax, ax
    add dword ptr [edi], eax
    add edi, 04h
    xor ebp, ebp
    add ecx, dword ptr [_Datac85d8]
    adc ebp, ebp
    add esi, dword ptr [ebp*4+_Datac85dc]
    cmp edi, dword ptr [_Datac85c4]
    jbe mix_s16_mono_to_mono_step
mix_s16_mono_to_mono_step_done:
    ret
mix_u16_mono_to_mono_step:
    cmp esi, dword ptr [_Datac85d4]
    jae mix_u16_mono_to_mono_step_done
    mov ax, word ptr [esi]
    xor eax, 08000h
    movsx eax, ax
    add dword ptr [edi], eax
    add edi, 04h
    xor ebp, ebp
    add ecx, dword ptr [_Datac85d8]
    adc ebp, ebp
    add esi, dword ptr [ebp*4+_Datac85dc]
    cmp edi, dword ptr [_Datac85c4]
    jbe mix_u16_mono_to_mono_step
mix_u16_mono_to_mono_step_done:
    ret
mix_s8_mono_to_stereo_step:
    cmp esi, dword ptr [_Datac85d4]
    jae mix_s8_mono_to_stereo_step_done
    mov ah, byte ptr [esi]
    movsx eax, ax
    add dword ptr [edi], eax
    add dword ptr [edi+04h], eax
    add edi, 08h
    add ecx, dword ptr [_Datac85d8]
    adc esi, dword ptr [_Datac85dc]
    cmp edi, dword ptr [_Datac85c4]
    jbe mix_s8_mono_to_stereo_step
mix_s8_mono_to_stereo_step_done:
    ret
mix_u8_mono_to_stereo_step:
    cmp esi, dword ptr [_Datac85d4]
    jae mix_u8_mono_to_stereo_step_done
    mov ah, byte ptr [esi]
    xor eax, 08000h
    movsx eax, ax
    add dword ptr [edi], eax
    add dword ptr [edi+04h], eax
    add edi, 08h
    add ecx, dword ptr [_Datac85d8]
    adc esi, dword ptr [_Datac85dc]
    cmp edi, dword ptr [_Datac85c4]
    jbe mix_u8_mono_to_stereo_step
mix_u8_mono_to_stereo_step_done:
    ret
mix_s16_mono_to_stereo_step:
    cmp esi, dword ptr [_Datac85d4]
    jae mix_s16_mono_to_stereo_step_done
    mov ax, word ptr [esi]
    movsx eax, ax
    add dword ptr [edi], eax
    add dword ptr [edi+04h], eax
    add edi, 08h
    xor ebp, ebp
    add ecx, dword ptr [_Datac85d8]
    adc ebp, ebp
    add esi, dword ptr [ebp*4+_Datac85dc]
    cmp edi, dword ptr [_Datac85c4]
    jbe mix_s16_mono_to_stereo_step
mix_s16_mono_to_stereo_step_done:
    ret
mix_u16_mono_to_stereo_step:
    cmp esi, dword ptr [_Datac85d4]
    jae mix_u16_mono_to_stereo_step_done
    mov ax, word ptr [esi]
    xor eax, 08000h
    movsx eax, ax
    add dword ptr [edi], eax
    add dword ptr [edi+04h], eax
    add edi, 08h
    xor ebp, ebp
    add ecx, dword ptr [_Datac85d8]
    adc ebp, ebp
    add esi, dword ptr [ebp*4+_Datac85dc]
    cmp edi, dword ptr [_Datac85c4]
    jbe mix_u16_mono_to_stereo_step
mix_u16_mono_to_stereo_step_done:
    ret
mix_s8_stereo_to_mono_step:
    cmp esi, dword ptr [_Datac85d4]
    jae mix_s8_stereo_to_mono_step_done
    mov ah, byte ptr [esi]
    mov bh, byte ptr [esi+01h]
    movsx eax, ax
    add dword ptr [edi], eax
    add edi, 04h
    xor ebp, ebp
    add ecx, dword ptr [_Datac85d8]
    adc ebp, ebp
    add esi, dword ptr [ebp*4+_Datac85dc]
    cmp edi, dword ptr [_Datac85c4]
    jbe mix_s8_stereo_to_mono_step
mix_s8_stereo_to_mono_step_done:
    ret
mix_u8_stereo_to_mono_step:
    cmp esi, dword ptr [_Datac85d4]
    jae mix_u8_stereo_to_mono_step_done
    mov ah, byte ptr [esi]
    mov bh, byte ptr [esi+01h]
    xor eax, 08000h
    xor ebx, 08000h
    movsx eax, ax
    add dword ptr [edi], eax
    add edi, 04h
    xor ebp, ebp
    add ecx, dword ptr [_Datac85d8]
    adc ebp, ebp
    add esi, dword ptr [ebp*4+_Datac85dc]
    cmp edi, dword ptr [_Datac85c4]
    jbe mix_u8_stereo_to_mono_step
mix_u8_stereo_to_mono_step_done:
    ret
mix_s16_stereo_to_mono_step:
    cmp esi, dword ptr [_Datac85d4]
    jae mix_s16_stereo_to_mono_step_done
    mov ax, word ptr [esi]
    mov bx, word ptr [esi+02h]
    movsx eax, ax
    add dword ptr [edi], eax
    add edi, 04h
    xor ebp, ebp
    add ecx, dword ptr [_Datac85d8]
    adc ebp, ebp
    add esi, dword ptr [ebp*4+_Datac85dc]
    cmp edi, dword ptr [_Datac85c4]
    jbe mix_s16_stereo_to_mono_step
mix_s16_stereo_to_mono_step_done:
    ret
mix_u16_stereo_to_mono_step:
    cmp esi, dword ptr [_Datac85d4]
    jae mix_u16_stereo_to_mono_step_done
    mov ax, word ptr [esi]
    mov bx, word ptr [esi+02h]
    xor eax, 08000h
    xor ebx, 08000h
    movsx eax, ax
    add dword ptr [edi], eax
    add edi, 04h
    xor ebp, ebp
    add ecx, dword ptr [_Datac85d8]
    adc ebp, ebp
    add esi, dword ptr [ebp*4+_Datac85dc]
    cmp edi, dword ptr [_Datac85c4]
    jbe mix_u16_stereo_to_mono_step
mix_u16_stereo_to_mono_step_done:
    ret
mix_s8_stereo_to_stereo_step:
    cmp esi, dword ptr [_Datac85d4]
    jae mix_s8_stereo_to_stereo_step_done
    mov ah, byte ptr [esi]
    mov bh, byte ptr [esi+01h]
    movsx eax, ax
    add dword ptr [edi], eax
    movsx ebx, bx
    add dword ptr [edi+04h], ebx
    add edi, 08h
    xor ebp, ebp
    add ecx, dword ptr [_Datac85d8]
    adc ebp, ebp
    add esi, dword ptr [ebp*4+_Datac85dc]
    cmp edi, dword ptr [_Datac85c4]
    jbe mix_s8_stereo_to_stereo_step
mix_s8_stereo_to_stereo_step_done:
    ret
mix_u8_stereo_to_stereo_step:
    cmp esi, dword ptr [_Datac85d4]
    jae mix_u8_stereo_to_stereo_step_done
    mov ah, byte ptr [esi]
    mov bh, byte ptr [esi+01h]
    xor eax, 08000h
    xor ebx, 08000h
    movsx eax, ax
    add dword ptr [edi], eax
    movsx ebx, bx
    add dword ptr [edi+04h], ebx
    add edi, 08h
    xor ebp, ebp
    add ecx, dword ptr [_Datac85d8]
    adc ebp, ebp
    add esi, dword ptr [ebp*4+_Datac85dc]
    cmp edi, dword ptr [_Datac85c4]
    jbe mix_u8_stereo_to_stereo_step
mix_u8_stereo_to_stereo_step_done:
    ret
mix_s16_stereo_to_stereo_step:
    cmp esi, dword ptr [_Datac85d4]
    jae mix_s16_stereo_to_stereo_step_done
    mov ax, word ptr [esi]
    mov bx, word ptr [esi+02h]
    movsx eax, ax
    add dword ptr [edi], eax
    movsx ebx, bx
    add dword ptr [edi+04h], ebx
    add edi, 08h
    xor ebp, ebp
    add ecx, dword ptr [_Datac85d8]
    adc ebp, ebp
    add esi, dword ptr [ebp*4+_Datac85dc]
    cmp edi, dword ptr [_Datac85c4]
    jbe mix_s16_stereo_to_stereo_step
mix_s16_stereo_to_stereo_step_done:
    ret
mix_u16_stereo_to_stereo_step:
    cmp esi, dword ptr [_Datac85d4]
    jae mix_u16_stereo_to_stereo_step_done
    mov ax, word ptr [esi]
    mov bx, word ptr [esi+02h]
    xor eax, 08000h
    xor ebx, 08000h
    movsx eax, ax
    add dword ptr [edi], eax
    movsx ebx, bx
    add dword ptr [edi+04h], ebx
    add edi, 08h
    xor ebp, ebp
    add ecx, dword ptr [_Datac85d8]
    adc ebp, ebp
    add esi, dword ptr [ebp*4+_Datac85dc]
    cmp edi, dword ptr [_Datac85c4]
    jbe mix_u16_stereo_to_stereo_step
mix_u16_stereo_to_stereo_step_done:
    ret
mix_s8_mono_to_mono_volume:
    cmp esi, dword ptr [_Datac85d4]
    jae mix_s8_mono_to_mono_volume_done
    mov ah, byte ptr [esi]
    movzx eax, ax
    imul word ptr [_Datac85f0]
    add edx, edx
    movsx edx, dx
    add dword ptr [edi], edx
    add edi, 04h
    add esi, 01h
    cmp edi, dword ptr [_Datac85c4]
    jbe mix_s8_mono_to_mono_volume
mix_s8_mono_to_mono_volume_done:
    ret
mix_u8_mono_to_mono_volume:
    cmp esi, dword ptr [_Datac85d4]
    jae mix_u8_mono_to_mono_volume_done
    mov ah, byte ptr [esi]
    xor eax, 08000h
    movzx eax, ax
    imul word ptr [_Datac85f0]
    add edx, edx
    movsx edx, dx
    add dword ptr [edi], edx
    add edi, 04h
    add esi, 01h
    cmp edi, dword ptr [_Datac85c4]
    jbe mix_u8_mono_to_mono_volume
mix_u8_mono_to_mono_volume_done:
    ret
mix_s16_mono_to_mono_volume:
    cmp esi, dword ptr [_Datac85d4]
    jae mix_s16_mono_to_mono_volume_done
    mov ax, word ptr [esi]
    movzx eax, ax
    imul word ptr [_Datac85f0]
    add edx, edx
    movsx edx, dx
    add dword ptr [edi], edx
    add edi, 04h
    add esi, 02h
    cmp edi, dword ptr [_Datac85c4]
    jbe mix_s16_mono_to_mono_volume
mix_s16_mono_to_mono_volume_done:
    ret
mix_u16_mono_to_mono_volume:
    cmp esi, dword ptr [_Datac85d4]
    jae mix_u16_mono_to_mono_volume_done
    mov ax, word ptr [esi]
    xor eax, 08000h
    movzx eax, ax
    imul word ptr [_Datac85f0]
    add edx, edx
    movsx edx, dx
    add dword ptr [edi], edx
    add edi, 04h
    add esi, 02h
    cmp edi, dword ptr [_Datac85c4]
    jbe mix_u16_mono_to_mono_volume
mix_u16_mono_to_mono_volume_done:
    ret
mix_s8_mono_to_stereo_volume:
    cmp esi, dword ptr [_Datac85d4]
    jae mix_s8_mono_to_stereo_volume_done
    mov ah, byte ptr [esi]
    mov ebx, eax
    movzx eax, ax
    imul word ptr [_Datac85f0]
    add edx, edx
    movsx edx, dx
    add dword ptr [edi], edx
    movzx eax, bx
    imul word ptr [_Datac85f4]
    add edx, edx
    movsx edx, dx
    add dword ptr [edi+04h], edx
    add edi, 08h
    add esi, 01h
    cmp edi, dword ptr [_Datac85c4]
    jbe mix_s8_mono_to_stereo_volume
mix_s8_mono_to_stereo_volume_done:
    ret
mix_u8_mono_to_stereo_volume:
    cmp esi, dword ptr [_Datac85d4]
    jae mix_u8_mono_to_stereo_volume_done
    mov ah, byte ptr [esi]
    xor eax, 08000h
    mov ebx, eax
    movzx eax, ax
    imul word ptr [_Datac85f0]
    add edx, edx
    movsx edx, dx
    add dword ptr [edi], edx
    movzx eax, bx
    imul word ptr [_Datac85f4]
    add edx, edx
    movsx edx, dx
    add dword ptr [edi+04h], edx
    add edi, 08h
    add esi, 01h
    cmp edi, dword ptr [_Datac85c4]
    jbe mix_u8_mono_to_stereo_volume
mix_u8_mono_to_stereo_volume_done:
    ret
mix_s16_mono_to_stereo_volume:
    cmp esi, dword ptr [_Datac85d4]
    jae mix_s16_mono_to_stereo_volume_done
    mov ax, word ptr [esi]
    mov ebx, eax
    movzx eax, ax
    imul word ptr [_Datac85f0]
    add edx, edx
    movsx edx, dx
    add dword ptr [edi], edx
    movzx eax, bx
    imul word ptr [_Datac85f4]
    add edx, edx
    movsx edx, dx
    add dword ptr [edi+04h], edx
    add edi, 08h
    add esi, 02h
    cmp edi, dword ptr [_Datac85c4]
    jbe mix_s16_mono_to_stereo_volume
mix_s16_mono_to_stereo_volume_done:
    ret
mix_u16_mono_to_stereo_volume:
    cmp esi, dword ptr [_Datac85d4]
    jae mix_u16_mono_to_stereo_volume_done
    mov ax, word ptr [esi]
    xor eax, 08000h
    mov ebx, eax
    movzx eax, ax
    imul word ptr [_Datac85f0]
    add edx, edx
    movsx edx, dx
    add dword ptr [edi], edx
    movzx eax, bx
    imul word ptr [_Datac85f4]
    add edx, edx
    movsx edx, dx
    add dword ptr [edi+04h], edx
    add edi, 08h
    add esi, 02h
    cmp edi, dword ptr [_Datac85c4]
    jbe mix_u16_mono_to_stereo_volume
mix_u16_mono_to_stereo_volume_done:
    ret
mix_s8_stereo_to_mono_volume:
    cmp esi, dword ptr [_Datac85d4]
    jae mix_s8_stereo_to_mono_volume_done
    mov ah, byte ptr [esi]
    mov bh, byte ptr [esi+01h]
    movzx eax, ax
    imul word ptr [_Datac85f0]
    add edx, edx
    movsx edx, dx
    add dword ptr [edi], edx
    add edi, 04h
    add esi, 02h
    cmp edi, dword ptr [_Datac85c4]
    jbe mix_s8_stereo_to_mono_volume
mix_s8_stereo_to_mono_volume_done:
    ret
mix_u8_stereo_to_mono_volume:
    cmp esi, dword ptr [_Datac85d4]
    jae mix_u8_stereo_to_mono_volume_done
    mov ah, byte ptr [esi]
    mov bh, byte ptr [esi+01h]
    xor eax, 08000h
    xor ebx, 08000h
    movzx eax, ax
    imul word ptr [_Datac85f0]
    add edx, edx
    movsx edx, dx
    add dword ptr [edi], edx
    add edi, 04h
    add esi, 02h
    cmp edi, dword ptr [_Datac85c4]
    jbe mix_u8_stereo_to_mono_volume
mix_u8_stereo_to_mono_volume_done:
    ret
mix_s16_stereo_to_mono_volume:
    cmp esi, dword ptr [_Datac85d4]
    jae mix_s16_stereo_to_mono_volume_done
    mov ax, word ptr [esi]
    mov bx, word ptr [esi+02h]
    movzx eax, ax
    imul word ptr [_Datac85f0]
    add edx, edx
    movsx edx, dx
    add dword ptr [edi], edx
    add edi, 04h
    add esi, 04h
    cmp edi, dword ptr [_Datac85c4]
    jbe mix_s16_stereo_to_mono_volume
mix_s16_stereo_to_mono_volume_done:
    ret
mix_u16_stereo_to_mono_volume:
    cmp esi, dword ptr [_Datac85d4]
    jae mix_u16_stereo_to_mono_volume_done
    mov ax, word ptr [esi]
    mov bx, word ptr [esi+02h]
    xor eax, 08000h
    xor ebx, 08000h
    movzx eax, ax
    imul word ptr [_Datac85f0]
    add edx, edx
    movsx edx, dx
    add dword ptr [edi], edx
    add edi, 04h
    add esi, 04h
    cmp edi, dword ptr [_Datac85c4]
    jbe mix_u16_stereo_to_mono_volume
mix_u16_stereo_to_mono_volume_done:
    ret
mix_s8_stereo_to_stereo_volume:
    cmp esi, dword ptr [_Datac85d4]
    jae mix_s8_stereo_to_stereo_volume_done
    mov ah, byte ptr [esi]
    mov bh, byte ptr [esi+01h]
    movzx eax, ax
    imul word ptr [_Datac85f0]
    add edx, edx
    movsx edx, dx
    add dword ptr [edi], edx
    movzx eax, bx
    imul word ptr [_Datac85f4]
    add edx, edx
    movsx edx, dx
    add dword ptr [edi+04h], edx
    add edi, 08h
    add esi, 02h
    cmp edi, dword ptr [_Datac85c4]
    jbe mix_s8_stereo_to_stereo_volume
mix_s8_stereo_to_stereo_volume_done:
    ret
mix_u8_stereo_to_stereo_volume:
    cmp esi, dword ptr [_Datac85d4]
    jae mix_u8_stereo_to_stereo_volume_done
    mov ah, byte ptr [esi]
    mov bh, byte ptr [esi+01h]
    xor eax, 08000h
    xor ebx, 08000h
    movzx eax, ax
    imul word ptr [_Datac85f0]
    add edx, edx
    movsx edx, dx
    add dword ptr [edi], edx
    movzx eax, bx
    imul word ptr [_Datac85f4]
    add edx, edx
    movsx edx, dx
    add dword ptr [edi+04h], edx
    add edi, 08h
    add esi, 02h
    cmp edi, dword ptr [_Datac85c4]
    jbe mix_u8_stereo_to_stereo_volume
mix_u8_stereo_to_stereo_volume_done:
    ret
mix_s16_stereo_to_stereo_volume:
    cmp esi, dword ptr [_Datac85d4]
    jae mix_s16_stereo_to_stereo_volume_done
    mov ax, word ptr [esi]
    mov bx, word ptr [esi+02h]
    movzx eax, ax
    imul word ptr [_Datac85f0]
    add edx, edx
    movsx edx, dx
    add dword ptr [edi], edx
    movzx eax, bx
    imul word ptr [_Datac85f4]
    add edx, edx
    movsx edx, dx
    add dword ptr [edi+04h], edx
    add edi, 08h
    add esi, 04h
    cmp edi, dword ptr [_Datac85c4]
    jbe mix_s16_stereo_to_stereo_volume
mix_s16_stereo_to_stereo_volume_done:
    ret
mix_u16_stereo_to_stereo_volume:
    cmp esi, dword ptr [_Datac85d4]
    jae mix_u16_stereo_to_stereo_volume_done
    mov ax, word ptr [esi]
    mov bx, word ptr [esi+02h]
    xor eax, 08000h
    xor ebx, 08000h
    movzx eax, ax
    imul word ptr [_Datac85f0]
    add edx, edx
    movsx edx, dx
    add dword ptr [edi], edx
    movzx eax, bx
    imul word ptr [_Datac85f4]
    add edx, edx
    movsx edx, dx
    add dword ptr [edi+04h], edx
    add edi, 08h
    add esi, 04h
    cmp edi, dword ptr [_Datac85c4]
    jbe mix_u16_stereo_to_stereo_volume
mix_u16_stereo_to_stereo_volume_done:
    ret
mix_s8_mono_to_mono_volume_step:
    cmp esi, dword ptr [_Datac85d4]
    jae mix_s8_mono_to_mono_volume_step_done
    mov ah, byte ptr [esi]
    movzx eax, ax
    imul word ptr [_Datac85f0]
    add edx, edx
    movsx edx, dx
    add dword ptr [edi], edx
    add edi, 04h
    add ecx, dword ptr [_Datac85d8]
    adc esi, dword ptr [_Datac85dc]
    cmp edi, dword ptr [_Datac85c4]
    jbe mix_s8_mono_to_mono_volume_step
mix_s8_mono_to_mono_volume_step_done:
    ret
mix_u8_mono_to_mono_volume_step:
    cmp esi, dword ptr [_Datac85d4]
    jae mix_u8_mono_to_mono_volume_step_done
    mov ah, byte ptr [esi]
    xor eax, 08000h
    movzx eax, ax
    imul word ptr [_Datac85f0]
    add edx, edx
    movsx edx, dx
    add dword ptr [edi], edx
    add edi, 04h
    add ecx, dword ptr [_Datac85d8]
    adc esi, dword ptr [_Datac85dc]
    cmp edi, dword ptr [_Datac85c4]
    jbe mix_u8_mono_to_mono_volume_step
mix_u8_mono_to_mono_volume_step_done:
    ret
mix_s16_mono_to_mono_volume_step:
    cmp esi, dword ptr [_Datac85d4]
    jae mix_s16_mono_to_mono_volume_step_done
    mov ax, word ptr [esi]
    movzx eax, ax
    imul word ptr [_Datac85f0]
    add edx, edx
    movsx edx, dx
    add dword ptr [edi], edx
    add edi, 04h
    xor ebp, ebp
    add ecx, dword ptr [_Datac85d8]
    adc ebp, ebp
    add esi, dword ptr [ebp*4+_Datac85dc]
    cmp edi, dword ptr [_Datac85c4]
    jbe mix_s16_mono_to_mono_volume_step
mix_s16_mono_to_mono_volume_step_done:
    ret
mix_u16_mono_to_mono_volume_step:
    cmp esi, dword ptr [_Datac85d4]
    jae mix_u16_mono_to_mono_volume_step_done
    mov ax, word ptr [esi]
    xor eax, 08000h
    movzx eax, ax
    imul word ptr [_Datac85f0]
    add edx, edx
    movsx edx, dx
    add dword ptr [edi], edx
    add edi, 04h
    xor ebp, ebp
    add ecx, dword ptr [_Datac85d8]
    adc ebp, ebp
    add esi, dword ptr [ebp*4+_Datac85dc]
    cmp edi, dword ptr [_Datac85c4]
    jbe mix_u16_mono_to_mono_volume_step
mix_u16_mono_to_mono_volume_step_done:
    ret
mix_s8_mono_to_stereo_volume_step:
    cmp esi, dword ptr [_Datac85d4]
    jae mix_s8_mono_to_stereo_volume_step_done
    mov ah, byte ptr [esi]
    mov ebx, eax
    movzx eax, ax
    imul word ptr [_Datac85f0]
    add edx, edx
    movsx edx, dx
    add dword ptr [edi], edx
    movzx eax, bx
    imul word ptr [_Datac85f4]
    add edx, edx
    movsx edx, dx
    add dword ptr [edi+04h], edx
    add edi, 08h
    add ecx, dword ptr [_Datac85d8]
    adc esi, dword ptr [_Datac85dc]
    cmp edi, dword ptr [_Datac85c4]
    jbe mix_s8_mono_to_stereo_volume_step
mix_s8_mono_to_stereo_volume_step_done:
    ret
mix_u8_mono_to_stereo_volume_step:
    cmp esi, dword ptr [_Datac85d4]
    jae mix_u8_mono_to_stereo_volume_step_done
    mov ah, byte ptr [esi]
    xor eax, 08000h
    mov ebx, eax
    movzx eax, ax
    imul word ptr [_Datac85f0]
    add edx, edx
    movsx edx, dx
    add dword ptr [edi], edx
    movzx eax, bx
    imul word ptr [_Datac85f4]
    add edx, edx
    movsx edx, dx
    add dword ptr [edi+04h], edx
    add edi, 08h
    add ecx, dword ptr [_Datac85d8]
    adc esi, dword ptr [_Datac85dc]
    cmp edi, dword ptr [_Datac85c4]
    jbe mix_u8_mono_to_stereo_volume_step
mix_u8_mono_to_stereo_volume_step_done:
    ret
mix_s16_mono_to_stereo_volume_step:
    cmp esi, dword ptr [_Datac85d4]
    jae mix_s16_mono_to_stereo_volume_step_done
    mov ax, word ptr [esi]
    mov ebx, eax
    movzx eax, ax
    imul word ptr [_Datac85f0]
    add edx, edx
    movsx edx, dx
    add dword ptr [edi], edx
    movzx eax, bx
    imul word ptr [_Datac85f4]
    add edx, edx
    movsx edx, dx
    add dword ptr [edi+04h], edx
    add edi, 08h
    xor ebp, ebp
    add ecx, dword ptr [_Datac85d8]
    adc ebp, ebp
    add esi, dword ptr [ebp*4+_Datac85dc]
    cmp edi, dword ptr [_Datac85c4]
    jbe mix_s16_mono_to_stereo_volume_step
mix_s16_mono_to_stereo_volume_step_done:
    ret
mix_u16_mono_to_stereo_volume_step:
    cmp esi, dword ptr [_Datac85d4]
    jae mix_u16_mono_to_stereo_volume_step_done
    mov ax, word ptr [esi]
    xor eax, 08000h
    mov ebx, eax
    movzx eax, ax
    imul word ptr [_Datac85f0]
    add edx, edx
    movsx edx, dx
    add dword ptr [edi], edx
    movzx eax, bx
    imul word ptr [_Datac85f4]
    add edx, edx
    movsx edx, dx
    add dword ptr [edi+04h], edx
    add edi, 08h
    xor ebp, ebp
    add ecx, dword ptr [_Datac85d8]
    adc ebp, ebp
    add esi, dword ptr [ebp*4+_Datac85dc]
    cmp edi, dword ptr [_Datac85c4]
    jbe mix_u16_mono_to_stereo_volume_step
mix_u16_mono_to_stereo_volume_step_done:
    ret
mix_s8_stereo_to_mono_volume_step:
    cmp esi, dword ptr [_Datac85d4]
    jae mix_s8_stereo_to_mono_volume_step_done
    mov ah, byte ptr [esi]
    mov bh, byte ptr [esi+01h]
    movzx eax, ax
    imul word ptr [_Datac85f0]
    add edx, edx
    movsx edx, dx
    add dword ptr [edi], edx
    add edi, 04h
    xor ebp, ebp
    add ecx, dword ptr [_Datac85d8]
    adc ebp, ebp
    add esi, dword ptr [ebp*4+_Datac85dc]
    cmp edi, dword ptr [_Datac85c4]
    jbe mix_s8_stereo_to_mono_volume_step
mix_s8_stereo_to_mono_volume_step_done:
    ret
mix_u8_stereo_to_mono_volume_step:
    cmp esi, dword ptr [_Datac85d4]
    jae mix_u8_stereo_to_mono_volume_step_done
    mov ah, byte ptr [esi]
    mov bh, byte ptr [esi+01h]
    xor eax, 08000h
    xor ebx, 08000h
    movzx eax, ax
    imul word ptr [_Datac85f0]
    add edx, edx
    movsx edx, dx
    add dword ptr [edi], edx
    add edi, 04h
    xor ebp, ebp
    add ecx, dword ptr [_Datac85d8]
    adc ebp, ebp
    add esi, dword ptr [ebp*4+_Datac85dc]
    cmp edi, dword ptr [_Datac85c4]
    jbe mix_u8_stereo_to_mono_volume_step
mix_u8_stereo_to_mono_volume_step_done:
    ret
mix_s16_stereo_to_mono_volume_step:
    cmp esi, dword ptr [_Datac85d4]
    jae mix_s16_stereo_to_mono_volume_step_done
    mov ax, word ptr [esi]
    mov bx, word ptr [esi+02h]
    movzx eax, ax
    imul word ptr [_Datac85f0]
    add edx, edx
    movsx edx, dx
    add dword ptr [edi], edx
    add edi, 04h
    xor ebp, ebp
    add ecx, dword ptr [_Datac85d8]
    adc ebp, ebp
    add esi, dword ptr [ebp*4+_Datac85dc]
    cmp edi, dword ptr [_Datac85c4]
    jbe mix_s16_stereo_to_mono_volume_step
mix_s16_stereo_to_mono_volume_step_done:
    ret
mix_u16_stereo_to_mono_volume_step:
    cmp esi, dword ptr [_Datac85d4]
    jae mix_u16_stereo_to_mono_volume_step_done
    mov ax, word ptr [esi]
    mov bx, word ptr [esi+02h]
    xor eax, 08000h
    xor ebx, 08000h
    movzx eax, ax
    imul word ptr [_Datac85f0]
    add edx, edx
    movsx edx, dx
    add dword ptr [edi], edx
    add edi, 04h
    xor ebp, ebp
    add ecx, dword ptr [_Datac85d8]
    adc ebp, ebp
    add esi, dword ptr [ebp*4+_Datac85dc]
    cmp edi, dword ptr [_Datac85c4]
    jbe mix_u16_stereo_to_mono_volume_step
mix_u16_stereo_to_mono_volume_step_done:
    ret
mix_s8_stereo_to_stereo_volume_step:
    cmp esi, dword ptr [_Datac85d4]
    jae mix_s8_stereo_to_stereo_volume_step_done
    mov ah, byte ptr [esi]
    mov bh, byte ptr [esi+01h]
    movzx eax, ax
    imul word ptr [_Datac85f0]
    add edx, edx
    movsx edx, dx
    add dword ptr [edi], edx
    movzx eax, bx
    imul word ptr [_Datac85f4]
    add edx, edx
    movsx edx, dx
    add dword ptr [edi+04h], edx
    add edi, 08h
    xor ebp, ebp
    add ecx, dword ptr [_Datac85d8]
    adc ebp, ebp
    add esi, dword ptr [ebp*4+_Datac85dc]
    cmp edi, dword ptr [_Datac85c4]
    jbe mix_s8_stereo_to_stereo_volume_step
mix_s8_stereo_to_stereo_volume_step_done:
    ret
mix_u8_stereo_to_stereo_volume_step:
    cmp esi, dword ptr [_Datac85d4]
    jae mix_u8_stereo_to_stereo_volume_step_done
    mov ah, byte ptr [esi]
    mov bh, byte ptr [esi+01h]
    xor eax, 08000h
    xor ebx, 08000h
    movzx eax, ax
    imul word ptr [_Datac85f0]
    add edx, edx
    movsx edx, dx
    add dword ptr [edi], edx
    movzx eax, bx
    imul word ptr [_Datac85f4]
    add edx, edx
    movsx edx, dx
    add dword ptr [edi+04h], edx
    add edi, 08h
    xor ebp, ebp
    add ecx, dword ptr [_Datac85d8]
    adc ebp, ebp
    add esi, dword ptr [ebp*4+_Datac85dc]
    cmp edi, dword ptr [_Datac85c4]
    jbe mix_u8_stereo_to_stereo_volume_step
mix_u8_stereo_to_stereo_volume_step_done:
    ret
mix_s16_stereo_to_stereo_volume_step:
    cmp esi, dword ptr [_Datac85d4]
    jae mix_s16_stereo_to_stereo_volume_step_done
    mov ax, word ptr [esi]
    mov bx, word ptr [esi+02h]
    movzx eax, ax
    imul word ptr [_Datac85f0]
    add edx, edx
    movsx edx, dx
    add dword ptr [edi], edx
    movzx eax, bx
    imul word ptr [_Datac85f4]
    add edx, edx
    movsx edx, dx
    add dword ptr [edi+04h], edx
    add edi, 08h
    xor ebp, ebp
    add ecx, dword ptr [_Datac85d8]
    adc ebp, ebp
    add esi, dword ptr [ebp*4+_Datac85dc]
    cmp edi, dword ptr [_Datac85c4]
    jbe mix_s16_stereo_to_stereo_volume_step
mix_s16_stereo_to_stereo_volume_step_done:
    ret
mix_u16_stereo_to_stereo_volume_step:
    cmp esi, dword ptr [_Datac85d4]
    jae mix_u16_stereo_to_stereo_volume_step_done
    mov ax, word ptr [esi]
    mov bx, word ptr [esi+02h]
    xor eax, 08000h
    xor ebx, 08000h
    movzx eax, ax
    imul word ptr [_Datac85f0]
    add edx, edx
    movsx edx, dx
    add dword ptr [edi], edx
    movzx eax, bx
    imul word ptr [_Datac85f4]
    add edx, edx
    movsx edx, dx
    add dword ptr [edi+04h], edx
    add edi, 08h
    xor ebp, ebp
    add ecx, dword ptr [_Datac85d8]
    adc ebp, ebp
    add esi, dword ptr [ebp*4+_Datac85dc]
    cmp edi, dword ptr [_Datac85c4]
    jbe mix_u16_stereo_to_stereo_volume_step
mix_u16_stereo_to_stereo_volume_step_done:
    ret
mix_s8_mono_to_mono_swapped:
    cmp esi, dword ptr [_Datac85d4]
    jae mix_s8_mono_to_mono_swapped_done
    mov ah, byte ptr [esi]
    movsx eax, ax
    add dword ptr [edi], eax
    add edi, 04h
    add esi, 01h
    cmp edi, dword ptr [_Datac85c4]
    jbe mix_s8_mono_to_mono_swapped
mix_s8_mono_to_mono_swapped_done:
    ret
mix_u8_mono_to_mono_swapped:
    cmp esi, dword ptr [_Datac85d4]
    jae mix_u8_mono_to_mono_swapped_done
    mov ah, byte ptr [esi]
    xor eax, 08000h
    movsx eax, ax
    add dword ptr [edi], eax
    add edi, 04h
    add esi, 01h
    cmp edi, dword ptr [_Datac85c4]
    jbe mix_u8_mono_to_mono_swapped
mix_u8_mono_to_mono_swapped_done:
    ret
mix_s16_mono_to_mono_swapped:
    cmp esi, dword ptr [_Datac85d4]
    jae mix_s16_mono_to_mono_swapped_done
    mov ax, word ptr [esi]
    movsx eax, ax
    add dword ptr [edi], eax
    add edi, 04h
    add esi, 02h
    cmp edi, dword ptr [_Datac85c4]
    jbe mix_s16_mono_to_mono_swapped
mix_s16_mono_to_mono_swapped_done:
    ret
mix_u16_mono_to_mono_swapped:
    cmp esi, dword ptr [_Datac85d4]
    jae mix_u16_mono_to_mono_swapped_done
    mov ax, word ptr [esi]
    xor eax, 08000h
    movsx eax, ax
    add dword ptr [edi], eax
    add edi, 04h
    add esi, 02h
    cmp edi, dword ptr [_Datac85c4]
    jbe mix_u16_mono_to_mono_swapped
mix_u16_mono_to_mono_swapped_done:
    ret
mix_s8_mono_to_stereo_swapped:
    cmp esi, dword ptr [_Datac85d4]
    jae mix_s8_mono_to_stereo_swapped_done
    mov ah, byte ptr [esi]
    movsx eax, ax
    add dword ptr [edi], eax
    add dword ptr [edi+04h], eax
    add edi, 08h
    add esi, 01h
    cmp edi, dword ptr [_Datac85c4]
    jbe mix_s8_mono_to_stereo_swapped
mix_s8_mono_to_stereo_swapped_done:
    ret
mix_u8_mono_to_stereo_swapped:
    cmp esi, dword ptr [_Datac85d4]
    jae mix_u8_mono_to_stereo_swapped_done
    mov ah, byte ptr [esi]
    xor eax, 08000h
    movsx eax, ax
    add dword ptr [edi], eax
    add dword ptr [edi+04h], eax
    add edi, 08h
    add esi, 01h
    cmp edi, dword ptr [_Datac85c4]
    jbe mix_u8_mono_to_stereo_swapped
mix_u8_mono_to_stereo_swapped_done:
    ret
mix_s16_mono_to_stereo_swapped:
    cmp esi, dword ptr [_Datac85d4]
    jae mix_s16_mono_to_stereo_swapped_done
    mov ax, word ptr [esi]
    movsx eax, ax
    add dword ptr [edi], eax
    add dword ptr [edi+04h], eax
    add edi, 08h
    add esi, 02h
    cmp edi, dword ptr [_Datac85c4]
    jbe mix_s16_mono_to_stereo_swapped
mix_s16_mono_to_stereo_swapped_done:
    ret
mix_u16_mono_to_stereo_swapped:
    cmp esi, dword ptr [_Datac85d4]
    jae mix_u16_mono_to_stereo_swapped_done
    mov ax, word ptr [esi]
    xor eax, 08000h
    movsx eax, ax
    add dword ptr [edi], eax
    add dword ptr [edi+04h], eax
    add edi, 08h
    add esi, 02h
    cmp edi, dword ptr [_Datac85c4]
    jbe mix_u16_mono_to_stereo_swapped
mix_u16_mono_to_stereo_swapped_done:
    ret
mix_s8_stereo_to_mono_swapped:
    cmp esi, dword ptr [_Datac85d4]
    jae mix_s8_stereo_to_mono_swapped_done
    mov bh, byte ptr [esi]
    mov ah, byte ptr [esi+01h]
    movsx eax, ax
    add dword ptr [edi], eax
    add edi, 04h
    add esi, 02h
    cmp edi, dword ptr [_Datac85c4]
    jbe mix_s8_stereo_to_mono_swapped
mix_s8_stereo_to_mono_swapped_done:
    ret
mix_u8_stereo_to_mono_swapped:
    cmp esi, dword ptr [_Datac85d4]
    jae mix_u8_stereo_to_mono_swapped_done
    mov bh, byte ptr [esi]
    mov ah, byte ptr [esi+01h]
    xor eax, 08000h
    xor ebx, 08000h
    movsx eax, ax
    add dword ptr [edi], eax
    add edi, 04h
    add esi, 02h
    cmp edi, dword ptr [_Datac85c4]
    jbe mix_u8_stereo_to_mono_swapped
mix_u8_stereo_to_mono_swapped_done:
    ret
mix_s16_stereo_to_mono_swapped:
    cmp esi, dword ptr [_Datac85d4]
    jae mix_s16_stereo_to_mono_swapped_done
    mov bx, word ptr [esi]
    mov ax, word ptr [esi+02h]
    movsx eax, ax
    add dword ptr [edi], eax
    add edi, 04h
    add esi, 04h
    cmp edi, dword ptr [_Datac85c4]
    jbe mix_s16_stereo_to_mono_swapped
mix_s16_stereo_to_mono_swapped_done:
    ret
mix_u16_stereo_to_mono_swapped:
    cmp esi, dword ptr [_Datac85d4]
    jae mix_u16_stereo_to_mono_swapped_done
    mov bx, word ptr [esi]
    mov ax, word ptr [esi+02h]
    xor eax, 08000h
    xor ebx, 08000h
    movsx eax, ax
    add dword ptr [edi], eax
    add edi, 04h
    add esi, 04h
    cmp edi, dword ptr [_Datac85c4]
    jbe mix_u16_stereo_to_mono_swapped
mix_u16_stereo_to_mono_swapped_done:
    ret
mix_s8_stereo_to_stereo_swapped:
    cmp esi, dword ptr [_Datac85d4]
    jae mix_s8_stereo_to_stereo_swapped_done
    mov bh, byte ptr [esi]
    mov ah, byte ptr [esi+01h]
    movsx eax, ax
    add dword ptr [edi], eax
    movsx ebx, bx
    add dword ptr [edi+04h], ebx
    add edi, 08h
    add esi, 02h
    cmp edi, dword ptr [_Datac85c4]
    jbe mix_s8_stereo_to_stereo_swapped
mix_s8_stereo_to_stereo_swapped_done:
    ret
mix_u8_stereo_to_stereo_swapped:
    cmp esi, dword ptr [_Datac85d4]
    jae mix_u8_stereo_to_stereo_swapped_done
    mov bh, byte ptr [esi]
    mov ah, byte ptr [esi+01h]
    xor eax, 08000h
    xor ebx, 08000h
    movsx eax, ax
    add dword ptr [edi], eax
    movsx ebx, bx
    add dword ptr [edi+04h], ebx
    add edi, 08h
    add esi, 02h
    cmp edi, dword ptr [_Datac85c4]
    jbe mix_u8_stereo_to_stereo_swapped
mix_u8_stereo_to_stereo_swapped_done:
    ret
mix_s16_stereo_to_stereo_swapped:
    cmp esi, dword ptr [_Datac85d4]
    jae mix_s16_stereo_to_stereo_swapped_done
    mov bx, word ptr [esi]
    mov ax, word ptr [esi+02h]
    movsx eax, ax
    add dword ptr [edi], eax
    movsx ebx, bx
    add dword ptr [edi+04h], ebx
    add edi, 08h
    add esi, 04h
    cmp edi, dword ptr [_Datac85c4]
    jbe mix_s16_stereo_to_stereo_swapped
mix_s16_stereo_to_stereo_swapped_done:
    ret
mix_u16_stereo_to_stereo_swapped:
    cmp esi, dword ptr [_Datac85d4]
    jae mix_u16_stereo_to_stereo_swapped_done
    mov bx, word ptr [esi]
    mov ax, word ptr [esi+02h]
    xor eax, 08000h
    xor ebx, 08000h
    movsx eax, ax
    add dword ptr [edi], eax
    movsx ebx, bx
    add dword ptr [edi+04h], ebx
    add edi, 08h
    add esi, 04h
    cmp edi, dword ptr [_Datac85c4]
    jbe mix_u16_stereo_to_stereo_swapped
mix_u16_stereo_to_stereo_swapped_done:
    ret
mix_s8_mono_to_mono_step_swapped:
    cmp esi, dword ptr [_Datac85d4]
    jae mix_s8_mono_to_mono_step_swapped_done
    mov ah, byte ptr [esi]
    movsx eax, ax
    add dword ptr [edi], eax
    add edi, 04h
    add ecx, dword ptr [_Datac85d8]
    adc esi, dword ptr [_Datac85dc]
    cmp edi, dword ptr [_Datac85c4]
    jbe mix_s8_mono_to_mono_step_swapped
mix_s8_mono_to_mono_step_swapped_done:
    ret
mix_u8_mono_to_mono_step_swapped:
    cmp esi, dword ptr [_Datac85d4]
    jae mix_u8_mono_to_mono_step_swapped_done
    mov ah, byte ptr [esi]
    xor eax, 08000h
    movsx eax, ax
    add dword ptr [edi], eax
    add edi, 04h
    add ecx, dword ptr [_Datac85d8]
    adc esi, dword ptr [_Datac85dc]
    cmp edi, dword ptr [_Datac85c4]
    jbe mix_u8_mono_to_mono_step_swapped
mix_u8_mono_to_mono_step_swapped_done:
    ret
mix_s16_mono_to_mono_step_swapped:
    cmp esi, dword ptr [_Datac85d4]
    jae mix_s16_mono_to_mono_step_swapped_done
    mov ax, word ptr [esi]
    movsx eax, ax
    add dword ptr [edi], eax
    add edi, 04h
    xor ebp, ebp
    add ecx, dword ptr [_Datac85d8]
    adc ebp, ebp
    add esi, dword ptr [ebp*4+_Datac85dc]
    cmp edi, dword ptr [_Datac85c4]
    jbe mix_s16_mono_to_mono_step_swapped
mix_s16_mono_to_mono_step_swapped_done:
    ret
mix_u16_mono_to_mono_step_swapped:
    cmp esi, dword ptr [_Datac85d4]
    jae mix_u16_mono_to_mono_step_swapped_done
    mov ax, word ptr [esi]
    xor eax, 08000h
    movsx eax, ax
    add dword ptr [edi], eax
    add edi, 04h
    xor ebp, ebp
    add ecx, dword ptr [_Datac85d8]
    adc ebp, ebp
    add esi, dword ptr [ebp*4+_Datac85dc]
    cmp edi, dword ptr [_Datac85c4]
    jbe mix_u16_mono_to_mono_step_swapped
mix_u16_mono_to_mono_step_swapped_done:
    ret
mix_s8_mono_to_stereo_step_swapped:
    cmp esi, dword ptr [_Datac85d4]
    jae mix_s8_mono_to_stereo_step_swapped_done
    mov ah, byte ptr [esi]
    movsx eax, ax
    add dword ptr [edi], eax
    add dword ptr [edi+04h], eax
    add edi, 08h
    add ecx, dword ptr [_Datac85d8]
    adc esi, dword ptr [_Datac85dc]
    cmp edi, dword ptr [_Datac85c4]
    jbe mix_s8_mono_to_stereo_step_swapped
mix_s8_mono_to_stereo_step_swapped_done:
    ret
mix_u8_mono_to_stereo_step_swapped:
    cmp esi, dword ptr [_Datac85d4]
    jae mix_u8_mono_to_stereo_step_swapped_done
    mov ah, byte ptr [esi]
    xor eax, 08000h
    movsx eax, ax
    add dword ptr [edi], eax
    add dword ptr [edi+04h], eax
    add edi, 08h
    add ecx, dword ptr [_Datac85d8]
    adc esi, dword ptr [_Datac85dc]
    cmp edi, dword ptr [_Datac85c4]
    jbe mix_u8_mono_to_stereo_step_swapped
mix_u8_mono_to_stereo_step_swapped_done:
    ret
mix_s16_mono_to_stereo_step_swapped:
    cmp esi, dword ptr [_Datac85d4]
    jae mix_s16_mono_to_stereo_step_swapped_done
    mov ax, word ptr [esi]
    movsx eax, ax
    add dword ptr [edi], eax
    add dword ptr [edi+04h], eax
    add edi, 08h
    xor ebp, ebp
    add ecx, dword ptr [_Datac85d8]
    adc ebp, ebp
    add esi, dword ptr [ebp*4+_Datac85dc]
    cmp edi, dword ptr [_Datac85c4]
    jbe mix_s16_mono_to_stereo_step_swapped
mix_s16_mono_to_stereo_step_swapped_done:
    ret
mix_u16_mono_to_stereo_step_swapped:
    cmp esi, dword ptr [_Datac85d4]
    jae mix_u16_mono_to_stereo_step_swapped_done
    mov ax, word ptr [esi]
    xor eax, 08000h
    movsx eax, ax
    add dword ptr [edi], eax
    add dword ptr [edi+04h], eax
    add edi, 08h
    xor ebp, ebp
    add ecx, dword ptr [_Datac85d8]
    adc ebp, ebp
    add esi, dword ptr [ebp*4+_Datac85dc]
    cmp edi, dword ptr [_Datac85c4]
    jbe mix_u16_mono_to_stereo_step_swapped
mix_u16_mono_to_stereo_step_swapped_done:
    ret
mix_s8_stereo_to_mono_step_swapped:
    cmp esi, dword ptr [_Datac85d4]
    jae mix_s8_stereo_to_mono_step_swapped_done
    mov bh, byte ptr [esi]
    mov ah, byte ptr [esi+01h]
    movsx eax, ax
    add dword ptr [edi], eax
    add edi, 04h
    xor ebp, ebp
    add ecx, dword ptr [_Datac85d8]
    adc ebp, ebp
    add esi, dword ptr [ebp*4+_Datac85dc]
    cmp edi, dword ptr [_Datac85c4]
    jbe mix_s8_stereo_to_mono_step_swapped
mix_s8_stereo_to_mono_step_swapped_done:
    ret
mix_u8_stereo_to_mono_step_swapped:
    cmp esi, dword ptr [_Datac85d4]
    jae mix_u8_stereo_to_mono_step_swapped_done
    mov bh, byte ptr [esi]
    mov ah, byte ptr [esi+01h]
    xor eax, 08000h
    xor ebx, 08000h
    movsx eax, ax
    add dword ptr [edi], eax
    add edi, 04h
    xor ebp, ebp
    add ecx, dword ptr [_Datac85d8]
    adc ebp, ebp
    add esi, dword ptr [ebp*4+_Datac85dc]
    cmp edi, dword ptr [_Datac85c4]
    jbe mix_u8_stereo_to_mono_step_swapped
mix_u8_stereo_to_mono_step_swapped_done:
    ret
mix_s16_stereo_to_mono_step_swapped:
    cmp esi, dword ptr [_Datac85d4]
    jae mix_s16_stereo_to_mono_step_swapped_done
    mov bx, word ptr [esi]
    mov ax, word ptr [esi+02h]
    movsx eax, ax
    add dword ptr [edi], eax
    add edi, 04h
    xor ebp, ebp
    add ecx, dword ptr [_Datac85d8]
    adc ebp, ebp
    add esi, dword ptr [ebp*4+_Datac85dc]
    cmp edi, dword ptr [_Datac85c4]
    jbe mix_s16_stereo_to_mono_step_swapped
mix_s16_stereo_to_mono_step_swapped_done:
    ret
mix_u16_stereo_to_mono_step_swapped:
    cmp esi, dword ptr [_Datac85d4]
    jae mix_u16_stereo_to_mono_step_swapped_done
    mov bx, word ptr [esi]
    mov ax, word ptr [esi+02h]
    xor eax, 08000h
    xor ebx, 08000h
    movsx eax, ax
    add dword ptr [edi], eax
    add edi, 04h
    xor ebp, ebp
    add ecx, dword ptr [_Datac85d8]
    adc ebp, ebp
    add esi, dword ptr [ebp*4+_Datac85dc]
    cmp edi, dword ptr [_Datac85c4]
    jbe mix_u16_stereo_to_mono_step_swapped
mix_u16_stereo_to_mono_step_swapped_done:
    ret
mix_s8_stereo_to_stereo_step_swapped:
    cmp esi, dword ptr [_Datac85d4]
    jae mix_s8_stereo_to_stereo_step_swapped_done
    mov bh, byte ptr [esi]
    mov ah, byte ptr [esi+01h]
    movsx eax, ax
    add dword ptr [edi], eax
    movsx ebx, bx
    add dword ptr [edi+04h], ebx
    add edi, 08h
    xor ebp, ebp
    add ecx, dword ptr [_Datac85d8]
    adc ebp, ebp
    add esi, dword ptr [ebp*4+_Datac85dc]
    cmp edi, dword ptr [_Datac85c4]
    jbe mix_s8_stereo_to_stereo_step_swapped
mix_s8_stereo_to_stereo_step_swapped_done:
    ret
mix_u8_stereo_to_stereo_step_swapped:
    cmp esi, dword ptr [_Datac85d4]
    jae mix_u8_stereo_to_stereo_step_swapped_done
    mov bh, byte ptr [esi]
    mov ah, byte ptr [esi+01h]
    xor eax, 08000h
    xor ebx, 08000h
    movsx eax, ax
    add dword ptr [edi], eax
    movsx ebx, bx
    add dword ptr [edi+04h], ebx
    add edi, 08h
    xor ebp, ebp
    add ecx, dword ptr [_Datac85d8]
    adc ebp, ebp
    add esi, dword ptr [ebp*4+_Datac85dc]
    cmp edi, dword ptr [_Datac85c4]
    jbe mix_u8_stereo_to_stereo_step_swapped
mix_u8_stereo_to_stereo_step_swapped_done:
    ret
mix_s16_stereo_to_stereo_step_swapped:
    cmp esi, dword ptr [_Datac85d4]
    jae mix_s16_stereo_to_stereo_step_swapped_done
    mov bx, word ptr [esi]
    mov ax, word ptr [esi+02h]
    movsx eax, ax
    add dword ptr [edi], eax
    movsx ebx, bx
    add dword ptr [edi+04h], ebx
    add edi, 08h
    xor ebp, ebp
    add ecx, dword ptr [_Datac85d8]
    adc ebp, ebp
    add esi, dword ptr [ebp*4+_Datac85dc]
    cmp edi, dword ptr [_Datac85c4]
    jbe mix_s16_stereo_to_stereo_step_swapped
mix_s16_stereo_to_stereo_step_swapped_done:
    ret
mix_u16_stereo_to_stereo_step_swapped:
    cmp esi, dword ptr [_Datac85d4]
    jae mix_u16_stereo_to_stereo_step_swapped_done
    mov bx, word ptr [esi]
    mov ax, word ptr [esi+02h]
    xor eax, 08000h
    xor ebx, 08000h
    movsx eax, ax
    add dword ptr [edi], eax
    movsx ebx, bx
    add dword ptr [edi+04h], ebx
    add edi, 08h
    xor ebp, ebp
    add ecx, dword ptr [_Datac85d8]
    adc ebp, ebp
    add esi, dword ptr [ebp*4+_Datac85dc]
    cmp edi, dword ptr [_Datac85c4]
    jbe mix_u16_stereo_to_stereo_step_swapped
mix_u16_stereo_to_stereo_step_swapped_done:
    ret
mix_s8_mono_to_mono_volume_swapped:
    cmp esi, dword ptr [_Datac85d4]
    jae mix_s8_mono_to_mono_volume_swapped_done
    mov ah, byte ptr [esi]
    movzx eax, ax
    imul word ptr [_Datac85f0]
    add edx, edx
    movsx edx, dx
    add dword ptr [edi], edx
    add edi, 04h
    add esi, 01h
    cmp edi, dword ptr [_Datac85c4]
    jbe mix_s8_mono_to_mono_volume_swapped
mix_s8_mono_to_mono_volume_swapped_done:
    ret
mix_u8_mono_to_mono_volume_swapped:
    cmp esi, dword ptr [_Datac85d4]
    jae mix_u8_mono_to_mono_volume_swapped_done
    mov ah, byte ptr [esi]
    xor eax, 08000h
    movzx eax, ax
    imul word ptr [_Datac85f0]
    add edx, edx
    movsx edx, dx
    add dword ptr [edi], edx
    add edi, 04h
    add esi, 01h
    cmp edi, dword ptr [_Datac85c4]
    jbe mix_u8_mono_to_mono_volume_swapped
mix_u8_mono_to_mono_volume_swapped_done:
    ret
mix_s16_mono_to_mono_volume_swapped:
    cmp esi, dword ptr [_Datac85d4]
    jae mix_s16_mono_to_mono_volume_swapped_done
    mov ax, word ptr [esi]
    movzx eax, ax
    imul word ptr [_Datac85f0]
    add edx, edx
    movsx edx, dx
    add dword ptr [edi], edx
    add edi, 04h
    add esi, 02h
    cmp edi, dword ptr [_Datac85c4]
    jbe mix_s16_mono_to_mono_volume_swapped
mix_s16_mono_to_mono_volume_swapped_done:
    ret
mix_u16_mono_to_mono_volume_swapped:
    cmp esi, dword ptr [_Datac85d4]
    jae mix_u16_mono_to_mono_volume_swapped_done
    mov ax, word ptr [esi]
    xor eax, 08000h
    movzx eax, ax
    imul word ptr [_Datac85f0]
    add edx, edx
    movsx edx, dx
    add dword ptr [edi], edx
    add edi, 04h
    add esi, 02h
    cmp edi, dword ptr [_Datac85c4]
    jbe mix_u16_mono_to_mono_volume_swapped
mix_u16_mono_to_mono_volume_swapped_done:
    ret
mix_s8_mono_to_stereo_volume_swapped:
    cmp esi, dword ptr [_Datac85d4]
    jae mix_s8_mono_to_stereo_volume_swapped_done
    mov ah, byte ptr [esi]
    mov ebx, eax
    movzx eax, ax
    imul word ptr [_Datac85f0]
    add edx, edx
    movsx edx, dx
    add dword ptr [edi], edx
    movzx eax, bx
    imul word ptr [_Datac85f4]
    add edx, edx
    movsx edx, dx
    add dword ptr [edi+04h], edx
    add edi, 08h
    add esi, 01h
    cmp edi, dword ptr [_Datac85c4]
    jbe mix_s8_mono_to_stereo_volume_swapped
mix_s8_mono_to_stereo_volume_swapped_done:
    ret
mix_u8_mono_to_stereo_volume_swapped:
    cmp esi, dword ptr [_Datac85d4]
    jae mix_u8_mono_to_stereo_volume_swapped_done
    mov ah, byte ptr [esi]
    xor eax, 08000h
    mov ebx, eax
    movzx eax, ax
    imul word ptr [_Datac85f0]
    add edx, edx
    movsx edx, dx
    add dword ptr [edi], edx
    movzx eax, bx
    imul word ptr [_Datac85f4]
    add edx, edx
    movsx edx, dx
    add dword ptr [edi+04h], edx
    add edi, 08h
    add esi, 01h
    cmp edi, dword ptr [_Datac85c4]
    jbe mix_u8_mono_to_stereo_volume_swapped
mix_u8_mono_to_stereo_volume_swapped_done:
    ret
mix_s16_mono_to_stereo_volume_swapped:
    cmp esi, dword ptr [_Datac85d4]
    jae mix_s16_mono_to_stereo_volume_swapped_done
    mov ax, word ptr [esi]
    mov ebx, eax
    movzx eax, ax
    imul word ptr [_Datac85f0]
    add edx, edx
    movsx edx, dx
    add dword ptr [edi], edx
    movzx eax, bx
    imul word ptr [_Datac85f4]
    add edx, edx
    movsx edx, dx
    add dword ptr [edi+04h], edx
    add edi, 08h
    add esi, 02h
    cmp edi, dword ptr [_Datac85c4]
    jbe mix_s16_mono_to_stereo_volume_swapped
mix_s16_mono_to_stereo_volume_swapped_done:
    ret
mix_u16_mono_to_stereo_volume_swapped:
    cmp esi, dword ptr [_Datac85d4]
    jae mix_u16_mono_to_stereo_volume_swapped_done
    mov ax, word ptr [esi]
    xor eax, 08000h
    mov ebx, eax
    movzx eax, ax
    imul word ptr [_Datac85f0]
    add edx, edx
    movsx edx, dx
    add dword ptr [edi], edx
    movzx eax, bx
    imul word ptr [_Datac85f4]
    add edx, edx
    movsx edx, dx
    add dword ptr [edi+04h], edx
    add edi, 08h
    add esi, 02h
    cmp edi, dword ptr [_Datac85c4]
    jbe mix_u16_mono_to_stereo_volume_swapped
mix_u16_mono_to_stereo_volume_swapped_done:
    ret
mix_s8_stereo_to_mono_volume_swapped:
    cmp esi, dword ptr [_Datac85d4]
    jae mix_s8_stereo_to_mono_volume_swapped_done
    mov bh, byte ptr [esi]
    mov ah, byte ptr [esi+01h]
    movzx eax, ax
    imul word ptr [_Datac85f0]
    add edx, edx
    movsx edx, dx
    add dword ptr [edi], edx
    add edi, 04h
    add esi, 02h
    cmp edi, dword ptr [_Datac85c4]
    jbe mix_s8_stereo_to_mono_volume_swapped
mix_s8_stereo_to_mono_volume_swapped_done:
    ret
mix_u8_stereo_to_mono_volume_swapped:
    cmp esi, dword ptr [_Datac85d4]
    jae mix_u8_stereo_to_mono_volume_swapped_done
    mov bh, byte ptr [esi]
    mov ah, byte ptr [esi+01h]
    xor eax, 08000h
    xor ebx, 08000h
    movzx eax, ax
    imul word ptr [_Datac85f0]
    add edx, edx
    movsx edx, dx
    add dword ptr [edi], edx
    add edi, 04h
    add esi, 02h
    cmp edi, dword ptr [_Datac85c4]
    jbe mix_u8_stereo_to_mono_volume_swapped
mix_u8_stereo_to_mono_volume_swapped_done:
    ret
mix_s16_stereo_to_mono_volume_swapped:
    cmp esi, dword ptr [_Datac85d4]
    jae mix_s16_stereo_to_mono_volume_swapped_done
    mov bx, word ptr [esi]
    mov ax, word ptr [esi+02h]
    movzx eax, ax
    imul word ptr [_Datac85f0]
    add edx, edx
    movsx edx, dx
    add dword ptr [edi], edx
    add edi, 04h
    add esi, 04h
    cmp edi, dword ptr [_Datac85c4]
    jbe mix_s16_stereo_to_mono_volume_swapped
mix_s16_stereo_to_mono_volume_swapped_done:
    ret
mix_u16_stereo_to_mono_volume_swapped:
    cmp esi, dword ptr [_Datac85d4]
    jae mix_u16_stereo_to_mono_volume_swapped_done
    mov bx, word ptr [esi]
    mov ax, word ptr [esi+02h]
    xor eax, 08000h
    xor ebx, 08000h
    movzx eax, ax
    imul word ptr [_Datac85f0]
    add edx, edx
    movsx edx, dx
    add dword ptr [edi], edx
    add edi, 04h
    add esi, 04h
    cmp edi, dword ptr [_Datac85c4]
    jbe mix_u16_stereo_to_mono_volume_swapped
mix_u16_stereo_to_mono_volume_swapped_done:
    ret
mix_s8_stereo_to_stereo_volume_swapped:
    cmp esi, dword ptr [_Datac85d4]
    jae mix_s8_stereo_to_stereo_volume_swapped_done
    mov bh, byte ptr [esi]
    mov ah, byte ptr [esi+01h]
    movzx eax, ax
    imul word ptr [_Datac85f0]
    add edx, edx
    movsx edx, dx
    add dword ptr [edi], edx
    movzx eax, bx
    imul word ptr [_Datac85f4]
    add edx, edx
    movsx edx, dx
    add dword ptr [edi+04h], edx
    add edi, 08h
    add esi, 02h
    cmp edi, dword ptr [_Datac85c4]
    jbe mix_s8_stereo_to_stereo_volume_swapped
mix_s8_stereo_to_stereo_volume_swapped_done:
    ret
mix_u8_stereo_to_stereo_volume_swapped:
    cmp esi, dword ptr [_Datac85d4]
    jae mix_u8_stereo_to_stereo_volume_swapped_done
    mov bh, byte ptr [esi]
    mov ah, byte ptr [esi+01h]
    xor eax, 08000h
    xor ebx, 08000h
    movzx eax, ax
    imul word ptr [_Datac85f0]
    add edx, edx
    movsx edx, dx
    add dword ptr [edi], edx
    movzx eax, bx
    imul word ptr [_Datac85f4]
    add edx, edx
    movsx edx, dx
    add dword ptr [edi+04h], edx
    add edi, 08h
    add esi, 02h
    cmp edi, dword ptr [_Datac85c4]
    jbe mix_u8_stereo_to_stereo_volume_swapped
mix_u8_stereo_to_stereo_volume_swapped_done:
    ret
mix_s16_stereo_to_stereo_volume_swapped:
    cmp esi, dword ptr [_Datac85d4]
    jae mix_s16_stereo_to_stereo_volume_swapped_done
    mov bx, word ptr [esi]
    mov ax, word ptr [esi+02h]
    movzx eax, ax
    imul word ptr [_Datac85f0]
    add edx, edx
    movsx edx, dx
    add dword ptr [edi], edx
    movzx eax, bx
    imul word ptr [_Datac85f4]
    add edx, edx
    movsx edx, dx
    add dword ptr [edi+04h], edx
    add edi, 08h
    add esi, 04h
    cmp edi, dword ptr [_Datac85c4]
    jbe mix_s16_stereo_to_stereo_volume_swapped
mix_s16_stereo_to_stereo_volume_swapped_done:
    ret
mix_u16_stereo_to_stereo_volume_swapped:
    cmp esi, dword ptr [_Datac85d4]
    jae mix_u16_stereo_to_stereo_volume_swapped_done
    mov bx, word ptr [esi]
    mov ax, word ptr [esi+02h]
    xor eax, 08000h
    xor ebx, 08000h
    movzx eax, ax
    imul word ptr [_Datac85f0]
    add edx, edx
    movsx edx, dx
    add dword ptr [edi], edx
    movzx eax, bx
    imul word ptr [_Datac85f4]
    add edx, edx
    movsx edx, dx
    add dword ptr [edi+04h], edx
    add edi, 08h
    add esi, 04h
    cmp edi, dword ptr [_Datac85c4]
    jbe mix_u16_stereo_to_stereo_volume_swapped
mix_u16_stereo_to_stereo_volume_swapped_done:
    ret
mix_s8_mono_to_mono_volume_step_swapped:
    cmp esi, dword ptr [_Datac85d4]
    jae mix_s8_mono_to_mono_volume_step_swapped_done
    mov ah, byte ptr [esi]
    movzx eax, ax
    imul word ptr [_Datac85f0]
    add edx, edx
    movsx edx, dx
    add dword ptr [edi], edx
    add edi, 04h
    add ecx, dword ptr [_Datac85d8]
    adc esi, dword ptr [_Datac85dc]
    cmp edi, dword ptr [_Datac85c4]
    jbe mix_s8_mono_to_mono_volume_step_swapped
mix_s8_mono_to_mono_volume_step_swapped_done:
    ret
mix_u8_mono_to_mono_volume_step_swapped:
    cmp esi, dword ptr [_Datac85d4]
    jae mix_u8_mono_to_mono_volume_step_swapped_done
    mov ah, byte ptr [esi]
    xor eax, 08000h
    movzx eax, ax
    imul word ptr [_Datac85f0]
    add edx, edx
    movsx edx, dx
    add dword ptr [edi], edx
    add edi, 04h
    add ecx, dword ptr [_Datac85d8]
    adc esi, dword ptr [_Datac85dc]
    cmp edi, dword ptr [_Datac85c4]
    jbe mix_u8_mono_to_mono_volume_step_swapped
mix_u8_mono_to_mono_volume_step_swapped_done:
    ret
mix_s16_mono_to_mono_volume_step_swapped:
    cmp esi, dword ptr [_Datac85d4]
    jae mix_s16_mono_to_mono_volume_step_swapped_done
    mov ax, word ptr [esi]
    movzx eax, ax
    imul word ptr [_Datac85f0]
    add edx, edx
    movsx edx, dx
    add dword ptr [edi], edx
    add edi, 04h
    xor ebp, ebp
    add ecx, dword ptr [_Datac85d8]
    adc ebp, ebp
    add esi, dword ptr [ebp*4+_Datac85dc]
    cmp edi, dword ptr [_Datac85c4]
    jbe mix_s16_mono_to_mono_volume_step_swapped
mix_s16_mono_to_mono_volume_step_swapped_done:
    ret
mix_u16_mono_to_mono_volume_step_swapped:
    cmp esi, dword ptr [_Datac85d4]
    jae mix_u16_mono_to_mono_volume_step_swapped_done
    mov ax, word ptr [esi]
    xor eax, 08000h
    movzx eax, ax
    imul word ptr [_Datac85f0]
    add edx, edx
    movsx edx, dx
    add dword ptr [edi], edx
    add edi, 04h
    xor ebp, ebp
    add ecx, dword ptr [_Datac85d8]
    adc ebp, ebp
    add esi, dword ptr [ebp*4+_Datac85dc]
    cmp edi, dword ptr [_Datac85c4]
    jbe mix_u16_mono_to_mono_volume_step_swapped
mix_u16_mono_to_mono_volume_step_swapped_done:
    ret
mix_s8_mono_to_stereo_volume_step_swapped:
    cmp esi, dword ptr [_Datac85d4]
    jae mix_s8_mono_to_stereo_volume_step_swapped_done
    mov ah, byte ptr [esi]
    mov ebx, eax
    movzx eax, ax
    imul word ptr [_Datac85f0]
    add edx, edx
    movsx edx, dx
    add dword ptr [edi], edx
    movzx eax, bx
    imul word ptr [_Datac85f4]
    add edx, edx
    movsx edx, dx
    add dword ptr [edi+04h], edx
    add edi, 08h
    add ecx, dword ptr [_Datac85d8]
    adc esi, dword ptr [_Datac85dc]
    cmp edi, dword ptr [_Datac85c4]
    jbe mix_s8_mono_to_stereo_volume_step_swapped
mix_s8_mono_to_stereo_volume_step_swapped_done:
    ret
mix_u8_mono_to_stereo_volume_step_swapped:
    cmp esi, dword ptr [_Datac85d4]
    jae mix_u8_mono_to_stereo_volume_step_swapped_done
    mov ah, byte ptr [esi]
    xor eax, 08000h
    mov ebx, eax
    movzx eax, ax
    imul word ptr [_Datac85f0]
    add edx, edx
    movsx edx, dx
    add dword ptr [edi], edx
    movzx eax, bx
    imul word ptr [_Datac85f4]
    add edx, edx
    movsx edx, dx
    add dword ptr [edi+04h], edx
    add edi, 08h
    add ecx, dword ptr [_Datac85d8]
    adc esi, dword ptr [_Datac85dc]
    cmp edi, dword ptr [_Datac85c4]
    jbe mix_u8_mono_to_stereo_volume_step_swapped
mix_u8_mono_to_stereo_volume_step_swapped_done:
    ret
mix_s16_mono_to_stereo_volume_step_swapped:
    cmp esi, dword ptr [_Datac85d4]
    jae mix_s16_mono_to_stereo_volume_step_swapped_done
    mov ax, word ptr [esi]
    mov ebx, eax
    movzx eax, ax
    imul word ptr [_Datac85f0]
    add edx, edx
    movsx edx, dx
    add dword ptr [edi], edx
    movzx eax, bx
    imul word ptr [_Datac85f4]
    add edx, edx
    movsx edx, dx
    add dword ptr [edi+04h], edx
    add edi, 08h
    xor ebp, ebp
    add ecx, dword ptr [_Datac85d8]
    adc ebp, ebp
    add esi, dword ptr [ebp*4+_Datac85dc]
    cmp edi, dword ptr [_Datac85c4]
    jbe mix_s16_mono_to_stereo_volume_step_swapped
mix_s16_mono_to_stereo_volume_step_swapped_done:
    ret
mix_u16_mono_to_stereo_volume_step_swapped:
    cmp esi, dword ptr [_Datac85d4]
    jae mix_u16_mono_to_stereo_volume_step_swapped_done
    mov ax, word ptr [esi]
    xor eax, 08000h
    mov ebx, eax
    movzx eax, ax
    imul word ptr [_Datac85f0]
    add edx, edx
    movsx edx, dx
    add dword ptr [edi], edx
    movzx eax, bx
    imul word ptr [_Datac85f4]
    add edx, edx
    movsx edx, dx
    add dword ptr [edi+04h], edx
    add edi, 08h
    xor ebp, ebp
    add ecx, dword ptr [_Datac85d8]
    adc ebp, ebp
    add esi, dword ptr [ebp*4+_Datac85dc]
    cmp edi, dword ptr [_Datac85c4]
    jbe mix_u16_mono_to_stereo_volume_step_swapped
mix_u16_mono_to_stereo_volume_step_swapped_done:
    ret
mix_s8_stereo_to_mono_volume_step_swapped:
    cmp esi, dword ptr [_Datac85d4]
    jae mix_s8_stereo_to_mono_volume_step_swapped_done
    mov bh, byte ptr [esi]
    mov ah, byte ptr [esi+01h]
    movzx eax, ax
    imul word ptr [_Datac85f0]
    add edx, edx
    movsx edx, dx
    add dword ptr [edi], edx
    add edi, 04h
    xor ebp, ebp
    add ecx, dword ptr [_Datac85d8]
    adc ebp, ebp
    add esi, dword ptr [ebp*4+_Datac85dc]
    cmp edi, dword ptr [_Datac85c4]
    jbe mix_s8_stereo_to_mono_volume_step_swapped
mix_s8_stereo_to_mono_volume_step_swapped_done:
    ret
mix_u8_stereo_to_mono_volume_step_swapped:
    cmp esi, dword ptr [_Datac85d4]
    jae mix_u8_stereo_to_mono_volume_step_swapped_done
    mov bh, byte ptr [esi]
    mov ah, byte ptr [esi+01h]
    xor eax, 08000h
    xor ebx, 08000h
    movzx eax, ax
    imul word ptr [_Datac85f0]
    add edx, edx
    movsx edx, dx
    add dword ptr [edi], edx
    add edi, 04h
    xor ebp, ebp
    add ecx, dword ptr [_Datac85d8]
    adc ebp, ebp
    add esi, dword ptr [ebp*4+_Datac85dc]
    cmp edi, dword ptr [_Datac85c4]
    jbe mix_u8_stereo_to_mono_volume_step_swapped
mix_u8_stereo_to_mono_volume_step_swapped_done:
    ret
mix_s16_stereo_to_mono_volume_step_swapped:
    cmp esi, dword ptr [_Datac85d4]
    jae mix_s16_stereo_to_mono_volume_step_swapped_done
    mov bx, word ptr [esi]
    mov ax, word ptr [esi+02h]
    movzx eax, ax
    imul word ptr [_Datac85f0]
    add edx, edx
    movsx edx, dx
    add dword ptr [edi], edx
    add edi, 04h
    xor ebp, ebp
    add ecx, dword ptr [_Datac85d8]
    adc ebp, ebp
    add esi, dword ptr [ebp*4+_Datac85dc]
    cmp edi, dword ptr [_Datac85c4]
    jbe mix_s16_stereo_to_mono_volume_step_swapped
mix_s16_stereo_to_mono_volume_step_swapped_done:
    ret
mix_u16_stereo_to_mono_volume_step_swapped:
    cmp esi, dword ptr [_Datac85d4]
    jae mix_u16_stereo_to_mono_volume_step_swapped_done
    mov bx, word ptr [esi]
    mov ax, word ptr [esi+02h]
    xor eax, 08000h
    xor ebx, 08000h
    movzx eax, ax
    imul word ptr [_Datac85f0]
    add edx, edx
    movsx edx, dx
    add dword ptr [edi], edx
    add edi, 04h
    xor ebp, ebp
    add ecx, dword ptr [_Datac85d8]
    adc ebp, ebp
    add esi, dword ptr [ebp*4+_Datac85dc]
    cmp edi, dword ptr [_Datac85c4]
    jbe mix_u16_stereo_to_mono_volume_step_swapped
mix_u16_stereo_to_mono_volume_step_swapped_done:
    ret
mix_s8_stereo_to_stereo_volume_step_swapped:
    cmp esi, dword ptr [_Datac85d4]
    jae mix_s8_stereo_to_stereo_volume_step_swapped_done
    mov bh, byte ptr [esi]
    mov ah, byte ptr [esi+01h]
    movzx eax, ax
    imul word ptr [_Datac85f0]
    add edx, edx
    movsx edx, dx
    add dword ptr [edi], edx
    movzx eax, bx
    imul word ptr [_Datac85f4]
    add edx, edx
    movsx edx, dx
    add dword ptr [edi+04h], edx
    add edi, 08h
    xor ebp, ebp
    add ecx, dword ptr [_Datac85d8]
    adc ebp, ebp
    add esi, dword ptr [ebp*4+_Datac85dc]
    cmp edi, dword ptr [_Datac85c4]
    jbe mix_s8_stereo_to_stereo_volume_step_swapped
mix_s8_stereo_to_stereo_volume_step_swapped_done:
    ret
mix_u8_stereo_to_stereo_volume_step_swapped:
    cmp esi, dword ptr [_Datac85d4]
    jae mix_u8_stereo_to_stereo_volume_step_swapped_done
    mov bh, byte ptr [esi]
    mov ah, byte ptr [esi+01h]
    xor eax, 08000h
    xor ebx, 08000h
    movzx eax, ax
    imul word ptr [_Datac85f0]
    add edx, edx
    movsx edx, dx
    add dword ptr [edi], edx
    movzx eax, bx
    imul word ptr [_Datac85f4]
    add edx, edx
    movsx edx, dx
    add dword ptr [edi+04h], edx
    add edi, 08h
    xor ebp, ebp
    add ecx, dword ptr [_Datac85d8]
    adc ebp, ebp
    add esi, dword ptr [ebp*4+_Datac85dc]
    cmp edi, dword ptr [_Datac85c4]
    jbe mix_u8_stereo_to_stereo_volume_step_swapped
mix_u8_stereo_to_stereo_volume_step_swapped_done:
    ret
mix_s16_stereo_to_stereo_volume_step_swapped:
    cmp esi, dword ptr [_Datac85d4]
    jae mix_s16_stereo_to_stereo_volume_step_swapped_done
    mov bx, word ptr [esi]
    mov ax, word ptr [esi+02h]
    movzx eax, ax
    imul word ptr [_Datac85f0]
    add edx, edx
    movsx edx, dx
    add dword ptr [edi], edx
    movzx eax, bx
    imul word ptr [_Datac85f4]
    add edx, edx
    movsx edx, dx
    add dword ptr [edi+04h], edx
    add edi, 08h
    xor ebp, ebp
    add ecx, dword ptr [_Datac85d8]
    adc ebp, ebp
    add esi, dword ptr [ebp*4+_Datac85dc]
    cmp edi, dword ptr [_Datac85c4]
    jbe mix_s16_stereo_to_stereo_volume_step_swapped
mix_s16_stereo_to_stereo_volume_step_swapped_done:
    ret
Func5c71b_ proc near
    cmp esi, dword ptr [_Datac85d4]
    jae mix_u16_stereo_to_stereo_volume_step_swapped_done
    mov bx, word ptr [esi]
    mov ax, word ptr [esi+02h]
    xor eax, 08000h
    xor ebx, 08000h
    movzx eax, ax
    imul word ptr [_Datac85f0]
    add edx, edx
    movsx edx, dx
    add dword ptr [edi], edx
    movzx eax, bx
    imul word ptr [_Datac85f4]
    add edx, edx
    movsx edx, dx
    add dword ptr [edi+04h], edx
    add edi, 08h
    xor ebp, ebp
    add ecx, dword ptr [_Datac85d8]
    adc ebp, ebp
    add esi, dword ptr [ebp*4+_Datac85dc]
    cmp edi, dword ptr [_Datac85c4]
    jbe Func5c71b_
mix_u16_stereo_to_stereo_volume_step_swapped_done::
    ret
Func5c71b_ endp
Func5c775_ proc near
    ret
Func5c775_ endp

    end

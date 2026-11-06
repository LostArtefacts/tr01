    .386p
    .model flat

    public sosMIXConvertCodeStart_
    public _sos_mix_convert_routines
    public sosMIXConvertS16StereoSwappedClipped_
    public sosMIXConvertU8StereoSwappedClipped_
    public sosMIXConvertCodeEnd_

    .code
sosMIXConvertCodeStart_ proc near
    ret
sosMIXConvertCodeStart_ endp
_sos_mix_convert_routines label dword
    dd convert_s8_mono
    dd convert_s16_mono
    dd convert_u8_mono
    dd convert_u16_mono
    dd convert_s8_stereo
    dd convert_s16_stereo
    dd convert_u8_stereo
    dd convert_u16_stereo
    dd convert_s8_mono_swapped
    dd convert_s16_mono_swapped
    dd convert_u8_mono_swapped
    dd convert_u16_mono_swapped
    dd convert_s8_stereo_swapped
    dd convert_s16_stereo_swapped
    dd convert_u8_stereo_swapped
    dd convert_u16_stereo_swapped
    dd convert_s8_mono_clipped
    dd convert_s16_mono_clipped
    dd convert_u8_mono_clipped
    dd convert_u16_mono_clipped
    dd convert_s8_stereo_clipped
    dd convert_s16_stereo_clipped
    dd convert_u8_stereo_clipped
    dd convert_u16_stereo_clipped
    dd convert_s8_mono_swapped_clipped
    dd convert_s16_mono_swapped_clipped
    dd convert_u8_mono_swapped_clipped
    dd convert_u16_mono_swapped_clipped
    dd convert_s8_stereo_swapped_clipped
    dd sosMIXConvertS16StereoSwappedClipped_
    dd sosMIXConvertU8StereoSwappedClipped_
    dd convert_u16_stereo_swapped_clipped
    dd 224 dup(0)
convert_s8_mono:
    mov eax, dword ptr [esi]
    add esi, 04h
    mov byte ptr [edi], ah
    add edi, 01h
    dec ecx
    jne convert_s8_mono
    ret
convert_s16_mono:
    mov eax, dword ptr [esi]
    add esi, 04h
    mov word ptr [edi], ax
    add edi, 02h
    dec ecx
    jne convert_s16_mono
    ret
convert_u8_mono:
    mov eax, dword ptr [esi]
    add esi, 04h
    xor eax, 08000h
    mov byte ptr [edi], ah
    add edi, 01h
    dec ecx
    jne convert_u8_mono
    ret
convert_u16_mono:
    mov eax, dword ptr [esi]
    add esi, 04h
    xor eax, 08000h
    mov word ptr [edi], ax
    add edi, 02h
    dec ecx
    jne convert_u16_mono
    ret
convert_s8_stereo:
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    add esi, 08h
    mov bl, ah
    mov word ptr [edi], bx
    add edi, 02h
    dec ecx
    jne convert_s8_stereo
    ret
convert_s16_stereo:
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    add esi, 08h
    mov word ptr [edi], ax
    mov word ptr [edi+02h], bx
    add edi, 04h
    dec ecx
    jne convert_s16_stereo
    ret
convert_u8_stereo:
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    add esi, 08h
    xor eax, 08000h
    xor ebx, 08000h
    mov bl, ah
    mov word ptr [edi], bx
    add edi, 02h
    dec ecx
    jne convert_u8_stereo
    ret
convert_u16_stereo:
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    add esi, 08h
    xor eax, 08000h
    xor ebx, 08000h
    mov word ptr [edi], ax
    mov word ptr [edi+02h], bx
    add edi, 04h
    dec ecx
    jne convert_u16_stereo
    ret
convert_s8_mono_swapped:
    mov eax, dword ptr [esi]
    add esi, 04h
    mov byte ptr [edi], ah
    add edi, 01h
    dec ecx
    jne convert_s8_mono_swapped
    ret
convert_s16_mono_swapped:
    mov eax, dword ptr [esi]
    add esi, 04h
    mov word ptr [edi], ax
    add edi, 02h
    dec ecx
    jne convert_s16_mono_swapped
    ret
convert_u8_mono_swapped:
    mov eax, dword ptr [esi]
    add esi, 04h
    xor eax, 08000h
    mov byte ptr [edi], ah
    add edi, 01h
    dec ecx
    jne convert_u8_mono_swapped
    ret
convert_u16_mono_swapped:
    mov eax, dword ptr [esi]
    add esi, 04h
    xor eax, 08000h
    mov word ptr [edi], ax
    add edi, 02h
    dec ecx
    jne convert_u16_mono_swapped
    ret
convert_s8_stereo_swapped:
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    add esi, 08h
    mov al, bh
    mov word ptr [edi], ax
    add edi, 02h
    dec ecx
    jne convert_s8_stereo_swapped
    ret
convert_s16_stereo_swapped:
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    add esi, 08h
    mov word ptr [edi], bx
    mov word ptr [edi+02h], ax
    add edi, 04h
    dec ecx
    jne convert_s16_stereo_swapped
    ret
convert_u8_stereo_swapped:
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    add esi, 08h
    xor eax, 08000h
    xor ebx, 08000h
    mov al, bh
    mov word ptr [edi], ax
    add edi, 02h
    dec ecx
    jne convert_u8_stereo_swapped
    ret
convert_u16_stereo_swapped:
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    add esi, 08h
    xor eax, 08000h
    xor ebx, 08000h
    mov word ptr [edi], bx
    mov word ptr [edi+02h], ax
    add edi, 04h
    dec ecx
    jne convert_u16_stereo_swapped
    ret
convert_s8_mono_clipped:
    mov eax, dword ptr [esi]
    add esi, 04h
    cmp eax, 07fffh
    jg s8_mono_clipped_clip_high
    cmp eax, -8000h
    jl s8_mono_clipped_clip_low
s8_mono_clipped_store:
    mov byte ptr [edi], ah
    add edi, 01h
    dec ecx
    jne convert_s8_mono_clipped
    ret
s8_mono_clipped_clip_high:
    mov eax, 07fffh
    jmp s8_mono_clipped_store
s8_mono_clipped_clip_low:
    mov eax, -8000h
    jmp s8_mono_clipped_store
convert_s16_mono_clipped:
    mov eax, dword ptr [esi]
    add esi, 04h
    cmp eax, 07fffh
    jg s16_mono_clipped_clip_high
    cmp eax, -8000h
    jl s16_mono_clipped_clip_low
s16_mono_clipped_store:
    mov word ptr [edi], ax
    add edi, 02h
    dec ecx
    jne convert_s16_mono_clipped
    ret
s16_mono_clipped_clip_high:
    mov eax, 07fffh
    jmp s16_mono_clipped_store
s16_mono_clipped_clip_low:
    mov eax, -8000h
    jmp s16_mono_clipped_store
convert_u8_mono_clipped:
    mov eax, dword ptr [esi]
    add esi, 04h
    cmp eax, 07fffh
    jg u8_mono_clipped_clip_high
    cmp eax, -8000h
    jl u8_mono_clipped_clip_low
u8_mono_clipped_store:
    xor eax, 08000h
    mov byte ptr [edi], ah
    add edi, 01h
    dec ecx
    jne convert_u8_mono_clipped
    ret
u8_mono_clipped_clip_high:
    mov eax, 07fffh
    jmp u8_mono_clipped_store
u8_mono_clipped_clip_low:
    mov eax, -8000h
    jmp u8_mono_clipped_store
convert_u16_mono_clipped:
    mov eax, dword ptr [esi]
    add esi, 04h
    cmp eax, 07fffh
    jg u16_mono_clipped_clip_high
    cmp eax, -8000h
    jl u16_mono_clipped_clip_low
u16_mono_clipped_store:
    xor eax, 08000h
    mov word ptr [edi], ax
    add edi, 02h
    dec ecx
    jne convert_u16_mono_clipped
    ret
u16_mono_clipped_clip_high:
    mov eax, 07fffh
    jmp u16_mono_clipped_store
u16_mono_clipped_clip_low:
    mov eax, -8000h
    jmp u16_mono_clipped_store
convert_s8_stereo_clipped:
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    add esi, 08h
    cmp eax, 07fffh
    jg s8_stereo_clipped_left_high
    cmp eax, -8000h
    jl s8_stereo_clipped_left_low
s8_stereo_clipped_check_right:
    cmp ebx, 07fffh
    jg s8_stereo_clipped_right_high
    cmp ebx, -8000h
    jl s8_stereo_clipped_right_low
s8_stereo_clipped_store:
    mov bl, ah
    mov word ptr [edi], bx
    add edi, 02h
    dec ecx
    jne convert_s8_stereo_clipped
    ret
s8_stereo_clipped_left_high:
    mov eax, 07fffh
    jmp s8_stereo_clipped_check_right
s8_stereo_clipped_left_low:
    mov eax, -8000h
    jmp s8_stereo_clipped_check_right
s8_stereo_clipped_right_high:
    mov ebx, 07fffh
    jmp s8_stereo_clipped_store
s8_stereo_clipped_right_low:
    mov ebx, -8000h
    jmp s8_stereo_clipped_store
convert_s16_stereo_clipped:
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    add esi, 08h
    cmp eax, 07fffh
    jg s16_stereo_clipped_left_high
    cmp eax, -8000h
    jl s16_stereo_clipped_left_low
s16_stereo_clipped_check_right:
    cmp ebx, 07fffh
    jg s16_stereo_clipped_right_high
    cmp ebx, -8000h
    jl s16_stereo_clipped_right_low
s16_stereo_clipped_store:
    mov word ptr [edi], ax
    mov word ptr [edi+02h], bx
    add edi, 04h
    dec ecx
    jne convert_s16_stereo_clipped
    ret
s16_stereo_clipped_left_high:
    mov eax, 07fffh
    jmp s16_stereo_clipped_check_right
s16_stereo_clipped_left_low:
    mov eax, -8000h
    jmp s16_stereo_clipped_check_right
s16_stereo_clipped_right_high:
    mov ebx, 07fffh
    jmp s16_stereo_clipped_store
s16_stereo_clipped_right_low:
    mov ebx, -8000h
    jmp s16_stereo_clipped_store
convert_u8_stereo_clipped:
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    add esi, 08h
    cmp eax, 07fffh
    jg u8_stereo_clipped_left_high
    cmp eax, -8000h
    jl u8_stereo_clipped_left_low
u8_stereo_clipped_check_right:
    cmp ebx, 07fffh
    jg u8_stereo_clipped_right_high
    cmp ebx, -8000h
    jl u8_stereo_clipped_right_low
u8_stereo_clipped_store:
    xor eax, 08000h
    xor ebx, 08000h
    mov bl, ah
    mov word ptr [edi], bx
    add edi, 02h
    dec ecx
    jne convert_u8_stereo_clipped
    ret
u8_stereo_clipped_left_high:
    mov eax, 07fffh
    jmp u8_stereo_clipped_check_right
u8_stereo_clipped_left_low:
    mov eax, -8000h
    jmp u8_stereo_clipped_check_right
u8_stereo_clipped_right_high:
    mov ebx, 07fffh
    jmp u8_stereo_clipped_store
u8_stereo_clipped_right_low:
    mov ebx, -8000h
    jmp u8_stereo_clipped_store
convert_u16_stereo_clipped:
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    add esi, 08h
    cmp eax, 07fffh
    jg u16_stereo_clipped_left_high
    cmp eax, -8000h
    jl u16_stereo_clipped_left_low
u16_stereo_clipped_check_right:
    cmp ebx, 07fffh
    jg u16_stereo_clipped_right_high
    cmp ebx, -8000h
    jl u16_stereo_clipped_right_low
u16_stereo_clipped_store:
    xor eax, 08000h
    xor ebx, 08000h
    mov word ptr [edi], ax
    mov word ptr [edi+02h], bx
    add edi, 04h
    dec ecx
    jne convert_u16_stereo_clipped
    ret
u16_stereo_clipped_left_high:
    mov eax, 07fffh
    jmp u16_stereo_clipped_check_right
u16_stereo_clipped_left_low:
    mov eax, -8000h
    jmp u16_stereo_clipped_check_right
u16_stereo_clipped_right_high:
    mov ebx, 07fffh
    jmp u16_stereo_clipped_store
u16_stereo_clipped_right_low:
    mov ebx, -8000h
    jmp u16_stereo_clipped_store
convert_s8_mono_swapped_clipped:
    mov eax, dword ptr [esi]
    add esi, 04h
    cmp eax, 07fffh
    jg s8_mono_swapped_clipped_clip_high
    cmp eax, -8000h
    jl s8_mono_swapped_clipped_clip_low
s8_mono_swapped_clipped_store:
    mov byte ptr [edi], ah
    add edi, 01h
    dec ecx
    jne convert_s8_mono_swapped_clipped
    ret
s8_mono_swapped_clipped_clip_high:
    mov eax, 07fffh
    jmp s8_mono_swapped_clipped_store
s8_mono_swapped_clipped_clip_low:
    mov eax, -8000h
    jmp s8_mono_swapped_clipped_store
convert_s16_mono_swapped_clipped:
    mov eax, dword ptr [esi]
    add esi, 04h
    cmp eax, 07fffh
    jg s16_mono_swapped_clipped_clip_high
    cmp eax, -8000h
    jl s16_mono_swapped_clipped_clip_low
s16_mono_swapped_clipped_store:
    mov word ptr [edi], ax
    add edi, 02h
    dec ecx
    jne convert_s16_mono_swapped_clipped
    ret
s16_mono_swapped_clipped_clip_high:
    mov eax, 07fffh
    jmp s16_mono_swapped_clipped_store
s16_mono_swapped_clipped_clip_low:
    mov eax, -8000h
    jmp s16_mono_swapped_clipped_store
convert_u8_mono_swapped_clipped:
    mov eax, dword ptr [esi]
    add esi, 04h
    cmp eax, 07fffh
    jg u8_mono_swapped_clipped_clip_high
    cmp eax, -8000h
    jl u8_mono_swapped_clipped_clip_low
u8_mono_swapped_clipped_store:
    xor eax, 08000h
    mov byte ptr [edi], ah
    add edi, 01h
    dec ecx
    jne convert_u8_mono_swapped_clipped
    ret
u8_mono_swapped_clipped_clip_high:
    mov eax, 07fffh
    jmp u8_mono_swapped_clipped_store
u8_mono_swapped_clipped_clip_low:
    mov eax, -8000h
    jmp u8_mono_swapped_clipped_store
convert_u16_mono_swapped_clipped:
    mov eax, dword ptr [esi]
    add esi, 04h
    cmp eax, 07fffh
    jg u16_mono_swapped_clipped_clip_high
    cmp eax, -8000h
    jl u16_mono_swapped_clipped_clip_low
u16_mono_swapped_clipped_store:
    xor eax, 08000h
    mov word ptr [edi], ax
    add edi, 02h
    dec ecx
    jne convert_u16_mono_swapped_clipped
    ret
u16_mono_swapped_clipped_clip_high:
    mov eax, 07fffh
    jmp u16_mono_swapped_clipped_store
u16_mono_swapped_clipped_clip_low:
    mov eax, -8000h
    jmp u16_mono_swapped_clipped_store
convert_s8_stereo_swapped_clipped:
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    add esi, 08h
    cmp eax, 07fffh
    jg s8_stereo_swapped_clipped_left_high
    cmp eax, -8000h
    jl s8_stereo_swapped_clipped_left_low
s8_stereo_swapped_clipped_check_right:
    cmp ebx, 07fffh
    jg s8_stereo_swapped_clipped_right_high
    cmp ebx, -8000h
    jl s8_stereo_swapped_clipped_right_low
s8_stereo_swapped_clipped_store:
    mov al, bh
    mov word ptr [edi], ax
    add edi, 02h
    dec ecx
    jne convert_s8_stereo_swapped_clipped
    ret
s8_stereo_swapped_clipped_left_high:
    mov eax, 07fffh
    jmp s8_stereo_swapped_clipped_check_right
s8_stereo_swapped_clipped_left_low:
    mov eax, -8000h
    jmp s8_stereo_swapped_clipped_check_right
s8_stereo_swapped_clipped_right_high:
    mov ebx, 07fffh
    jmp s8_stereo_swapped_clipped_store
s8_stereo_swapped_clipped_right_low:
    mov ebx, -8000h
    jmp s8_stereo_swapped_clipped_store
sosMIXConvertS16StereoSwappedClipped_ proc near
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    add esi, 08h
    cmp eax, 07fffh
    jg left_high
    cmp eax, -8000h
    jl left_low
check_right:
    cmp ebx, 07fffh
    jg right_high
    cmp ebx, -8000h
    jl right_low
store:
    mov word ptr [edi], bx
    mov word ptr [edi+02h], ax
    add edi, 04h
    dec ecx
    jne sosMIXConvertS16StereoSwappedClipped_
    ret
left_high:
    mov eax, 07fffh
    jmp check_right
left_low:
    mov eax, -8000h
    jmp check_right
right_high:
    mov ebx, 07fffh
    jmp store
right_low:
    mov ebx, -8000h
    jmp store
sosMIXConvertS16StereoSwappedClipped_ endp
sosMIXConvertU8StereoSwappedClipped_ proc near
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    add esi, 08h
    cmp eax, 07fffh
    jg left_high
    cmp eax, -8000h
    jl left_low
check_right:
    cmp ebx, 07fffh
    jg right_high
    cmp ebx, -8000h
    jl right_low
store:
    xor eax, 08000h
    xor ebx, 08000h
    mov al, bh
    mov word ptr [edi], ax
    add edi, 02h
    dec ecx
    jne sosMIXConvertU8StereoSwappedClipped_
    ret
left_high:
    mov eax, 07fffh
    jmp check_right
left_low:
    mov eax, -8000h
    jmp check_right
right_high:
    mov ebx, 07fffh
    jmp store
right_low:
    mov ebx, -8000h
    jmp store
convert_u16_stereo_swapped_clipped::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    add esi, 08h
    cmp eax, 07fffh
    jg left_high2
    cmp eax, -8000h
    jl left_low2
check_right2:
    cmp ebx, 07fffh
    jg right_high2
    cmp ebx, -8000h
    jl right_low2
store2:
    xor eax, 08000h
    xor ebx, 08000h
    mov word ptr [edi], bx
    mov word ptr [edi+02h], ax
    add edi, 04h
    dec ecx
    jne convert_u16_stereo_swapped_clipped
    ret
left_high2:
    mov eax, 07fffh
    jmp check_right2
left_low2:
    mov eax, -8000h
    jmp check_right2
right_high2:
    mov ebx, 07fffh
    jmp store2
right_low2:
    mov ebx, -8000h
    jmp store2
sosMIXConvertU8StereoSwappedClipped_ endp
sosMIXConvertCodeEnd_ proc near
    ret
sosMIXConvertCodeEnd_ endp

    end

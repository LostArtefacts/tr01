    .386p

_TEXT segment para public use32 'CODE'
_TEXT ends
_DATA segment dword public use32 'DATA'
_DATA ends

    assume cs:FLAT, ds:FLAT, es:FLAT, ss:FLAT

    public RPLADPCM_DecodeMono_

_TEXT segment
RPLADPCM_DecodeMono_ proc near
    push ebp
    mov ebp, esp
    push eax
    push ebx
    push ecx
    push edx
    push esi
    push edi
    mov esi, dword ptr [ebp+08h]
    mov edi, dword ptr [ebp+0ch]
    mov ecx, dword ptr [ebp+010h]
    push ebp
    mov ebp, ecx
decode_bytes:
    xor eax, eax
    mov al, byte ptr [esi]
    shr al, 04h
    and al, 0fh
    xor ecx, ecx
    mov cl, byte ptr [step_index]
    mov edx, dword ptr [ecx*4+step_table]
    add ecx, dword ptr [eax*4+index_adjust]
    cmp ecx, 0ffffffffh
    jg short high_check_max_index
    mov ecx, 00h
    jmp short high_index_ready
high_check_max_index:
    cmp ecx, 059h
    jl short high_index_ready
    mov ecx, 058h
high_index_ready:
    mov byte ptr [step_index], cl
    mov ebx, 00h
    test eax, 04h
    je short high_add_mid_bit
    mov ebx, edx
    shl ebx, 02h
high_add_mid_bit:
    test eax, 02h
    je short high_add_low_bit
    mov ecx, edx
    add ecx, ecx
    add ebx, ecx
high_add_low_bit:
    test eax, 01h
    je short high_scale_delta
    add ebx, edx
high_scale_delta:
    shr ebx, 02h
    mov cx, word ptr [sample]
    movsx ecx, cx
    test eax, 08h
    je short high_positive_delta
    sub ecx, ebx
    jmp short high_check_max_sample
high_positive_delta:
    add ecx, ebx
high_check_max_sample:
    cmp ecx, 08000h
    jl short high_check_min_sample
    mov ecx, 07fffh
    jmp short high_store_sample
high_check_min_sample:
    cmp ecx, 0ffff7fffh
    jg short high_store_sample
    mov ecx, 0ffff8000h
high_store_sample:
    mov word ptr [sample], cx
    mov word ptr [edi], cx
    add edi, 02h
    xor eax, eax
    mov al, byte ptr [esi]
    inc esi
    and al, 0fh
    xor ecx, ecx
    mov cl, byte ptr [step_index]
    mov edx, dword ptr [ecx*4+step_table]
    add ecx, dword ptr [eax*4+index_adjust]
    cmp ecx, 0ffffffffh
    jg short low_check_max_index
    mov ecx, 00h
    jmp short low_index_ready
low_check_max_index:
    cmp ecx, 059h
    jl short low_index_ready
    mov ecx, 058h
low_index_ready:
    mov byte ptr [step_index], cl
    mov ebx, 00h
    test eax, 04h
    je short low_add_mid_bit
    mov ebx, edx
    shl ebx, 02h
low_add_mid_bit:
    test eax, 02h
    je short low_add_low_bit
    mov ecx, edx
    add ecx, ecx
    add ebx, ecx
low_add_low_bit:
    test eax, 01h
    je short low_scale_delta
    add ebx, edx
low_scale_delta:
    shr ebx, 02h
    mov cx, word ptr [sample]
    movsx ecx, cx
    test eax, 08h
    je short low_positive_delta
    sub ecx, ebx
    jmp short low_check_max_sample
low_positive_delta:
    add ecx, ebx
low_check_max_sample:
    cmp ecx, 08000h
    jl short low_check_min_sample
    mov ecx, 07fffh
    jmp short low_store_sample
low_check_min_sample:
    cmp ecx, 0ffff7fffh
    jg short low_store_sample
    mov ecx, 0ffff8000h
low_store_sample:
    mov word ptr [sample], cx
    mov word ptr [edi], cx
    add edi, 02h
    dec ebp
    jne near ptr decode_bytes
    pop ebp
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    pop eax
    leave
    ret
RPLADPCM_DecodeMono_ endp
_TEXT ends

_DATA segment
index_adjust dd -1, -1, -1, -1, 2, 4, 6, 8, -1, -1, -1, -1, 2, 4, 6, 8
step_table label dword
    dd 7, 8, 9, 10, 11, 12, 13, 14
    dd 16, 17, 19, 21, 23, 25, 28, 31
    dd 34, 37, 41, 45, 50, 55, 60, 66
    dd 73, 80, 88, 97, 107, 118, 130, 143
    dd 157, 173, 190, 209, 230, 253, 279, 307
    dd 337, 371, 408, 449, 494, 544, 598, 658
    dd 724, 796, 876, 963, 1060, 1166, 1282, 1411
    dd 1552, 1707, 1878, 2066, 2272, 2499, 2749, 3024
    dd 3327, 3660, 4026, 4428, 4871, 5358, 5894, 6484
    dd 7132, 7845, 8630, 9493, 10442, 11487, 12635, 13899
    dd 15289, 16818, 18500, 20350, 22385, 24623, 27086, 29794
    dd 32767
    db "$Id: ADPCM_M.ASM 1.1 1995/08/10 16:51:23 MFC Exp $", 0
sample dw 0
    align 4
step_index dd 0
_DATA ends

    end

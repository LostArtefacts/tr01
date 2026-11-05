    .486p

frame_buffer_size textequ <Func5f305_>
decode_info_size  textequ <Func5f2ce_>
decode_frame      textequ <Func5ffed_>
draw_frame        textequ <Func67e27_>
average_colour    textequ <Func5e39e_>
bit_masks         textequ <_Datab0000>
id_string         textequ <_Datac8a30>

_TEXT segment para public use32 'CODE'
_TEXT ends
_DATA segment dword public use32 'DATA'
_DATA ends
OBJ4 segment para public use32 'OBJ4DATA'
OBJ4 ends

    assume cs:FLAT, ds:FLAT, es:FLAT, ss:FLAT

    public Func5d270_
    public Func5d2f6_
    public Func5d4ae_
    public Func5d5c2_
    public Func5d603_
    public Func5d635_
    public Func5d6b0_
    public Func5e272_
    public Func5e287_
    public Func5e294_
    public Func5e2a8_
    public Func5e2af_
    public Func5e2b6_
    public Func5e2bd_
    public Func5e2c4_
    public Func5e2cb_
    public Func5e2d2_
    public Func5e2db_
    public Func5e2e1_
    public Func5e2e2_
    public Func5e2eb_
    public Func5e2f4_
    public Func5e2fd_
    public Func5e306_
    public Func5e30f_
    public Func5e318_
    public Func5e323_
    public Func5e32a_
    public Func5e331_
    public Func5e338_
    public Func5e33f_
    public Func5e346_
    public Func5e34d_
    public Func5e356_
    public Func5e35c_
    public Func5e35d_
    public Func5e366_
    public Func5e36f_
    public Func5e378_
    public Func5e381_
    public Func5e38a_
    public Func5e393_
    public average_colour
    public Func5e449_
    public Func5e620_
    public Func5e6d6_
    public Func5ea37_
    public Func5eac6_
    public Func5f0ab_
    public decode_info_size
    public frame_buffer_size
    public Func5f33c_
    public Func5f33d_
    public Func5f39e_
    public Func5f402_
    public Func5f46c_
    public Func5f4d0_
    public Func5f53d_
    public Func5f5aa_
    public Func5f614_
    public Func5f684_
    public Func5f6ee_
    public Func5f75b_
    public Func5f7c8_
    public Func5f841_
    public Func5f8ae_
    public Func5f91b_
    public Func5f985_
    public Func5f9a2_
    public Func5fa0c_
    public Func5fa79_
    public Func5fae6_
    public Func5fb5f_
    public Func5fbcc_
    public Func5fc39_
    public Func5fca3_
    public Func5fd13_
    public Func5fd7d_
    public Func5fdea_
    public Func5fe57_
    public Func5febb_
    public Func5ff25_
    public Func5ff89_
    public Func5ffea_
    public decode_frame
    public Func605d8_
    public Func61872_
    public Func62bfb_
    public Func62d3f_
    public Func62e8a_
    public Func62fd6_
    public Func63135_
    public Func63274_
    public Func633b5_
    public Func634fc_
    public Func6365b_
    public Func6379a_
    public Func638db_
    public Func63a22_
    public Func63b81_
    public Func63cc0_
    public Func63e04_
    public Func63f4b_
    public Func640b0_
    public Func641ea_
    public Func6432b_
    public Func6446d_
    public Func645cc_
    public Func6470b_
    public Func6484c_
    public Func64993_
    public Func64af2_
    public Func64c31_
    public Func64d72_
    public Func64eb9_
    public Func65018_
    public Func65157_
    public Func6529b_
    public Func653e2_
    public Func65547_
    public Func65681_
    public Func657c2_
    public Func65904_
    public Func65a63_
    public Func65ba2_
    public Func65ce3_
    public Func65e2a_
    public Func65f89_
    public Func660c8_
    public Func66209_
    public Func66350_
    public Func664af_
    public Func665ee_
    public Func66732_
    public Func66879_
    public Func669de_
    public Func66b18_
    public Func66c59_
    public Func66da5_
    public Func66f0e_
    public Func6704d_
    public Func6718e_
    public Func672df_
    public Func67448_
    public Func67587_
    public Func676c8_
    public Func67819_
    public Func67982_
    public Func67ac1_
    public Func67c05_
    public Func67d56_
    public draw_frame
    public bit_masks
    public id_string

_TEXT segment
Func5d270_ proc near
    mov edx, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd edx, ebx, cl
    add cl, 04h
    jns L6ed5e
L5d281::
    and edx, 0fh
    mov eax, dword ptr [esi]
    shrd eax, ebx, cl
    add cl, 01eh
    js L5d297
    add esi, 04h
    or cl, 0e0h
    mov ebx, dword ptr [esi+04h]
L5d297::
    and eax, 03fffffffh
    add eax, eax
    mov ebx, dword ptr [Dc9cd4]
    shr ah, 1
    rcr al, 1
    jmp dword ptr [ebx+D5d2ae]
Func5d270_ endp
D5d2ae dword offset L5d3d5
    dword offset L5d3d0
    dword offset L5d373
    dword offset L5d36c
    dword offset L5d360
    dword offset L5d354
    dword offset L5d345
    dword offset L5d336
    dword offset L5d327
    dword offset L5d318
    dword offset Func5d2f6_
    dword offset L5d308
    dword offset L5d3c2
    dword offset L5d3b4
    dword offset L5d3a6
    dword offset L5d398
    dword offset L5d38a
    dword offset L5d37c
Func5d2f6_ proc near
    call Func5d5c2_
    and eax, dword ptr [Dc9cc0]
    shr eax, 1
    jmp L5d3d5
L5d308::
    call Func5d5c2_
    xor eax, dword ptr [Dc9cc4]
    jmp L5d3d5
L5d318::
    call Func5d5c2_
    and eax, 03ff03ffh
    jmp L5d3d5
L5d327::
    call Func5d5c2_
    and eax, 07c1f7c1fh
    jmp L5d3d5
L5d336::
    call Func5d5c2_
    and eax, 07fe07fe0h
    jmp L5d3d5
L5d345::
    call Func5d5c2_
    and eax, 01f001fh
    jmp L5d3d5
L5d354::
    call Func5d5c2_
    and eax, 03e003e0h
    jmp L5d3d5
L5d360::
    call Func5d5c2_
    and eax, 07c007c00h
    jmp L5d3d5
L5d36c::
    call Func5d5c2_
    jmp L5d3d5
L5d373::
    and eax, 07bde7bdeh
    shr eax, 1
    jmp L5d3d5
L5d37c::
    call Func5d5c2_
    not eax
    and eax, 03ff03ffh
    jmp L5d3d5
L5d38a::
    call Func5d5c2_
    not eax
    and eax, 07c1f7c1fh
    jmp L5d3d5
L5d398::
    call Func5d5c2_
    not eax
    and eax, 07fe07fe0h
    jmp L5d3d5
L5d3a6::
    call Func5d5c2_
    not eax
    and eax, 01f001fh
    jmp L5d3d5
L5d3b4::
    call Func5d5c2_
    not eax
    and eax, 03e003e0h
    jmp L5d3d5
L5d3c2::
    call Func5d5c2_
    not eax
    and eax, 07c007c00h
    jmp L5d3d5
L5d3d0::
    xor eax, 07fff7fffh
L5d3d5::
    push edx
    push edi
    push ecx
    mov edi, eax
    mov cl, 05h
    and edi, 07c007c00h
    shr edi, 0ah
    sub cl, byte ptr [Dc9afd]
    jns L5d3f3
    neg cl
    shl edi, cl
    jmp L5d3fb
L5d3f3::
    shr edi, cl
    and edi, 01f001fh
L5d3fb::
    mov cl, byte ptr [Dc9afe]
    shl edi, cl
    mov edx, eax
    mov cl, 05h
    and edx, 03e003e0h
    shr edx, 05h
    sub cl, byte ptr [Dc9b01]
    jns L5d41e
    neg cl
    shl edx, cl
    jmp L5d426
L5d41e::
    shr edx, cl
    and edx, 01f001fh
L5d426::
    mov cl, byte ptr [Dc9b02]
    shl edx, cl
    or edi, edx
    mov edx, eax
    mov cl, 05h
    and edx, 01f001fh
    sub cl, byte ptr [Dc9aff]
    jns L5d448
    neg cl
    shl edx, cl
    jmp L5d450
L5d448::
    shr edx, cl
    and edx, 01f001fh
L5d450::
    mov cl, byte ptr [Dc9b00]
    shl edx, cl
    lea eax, [edx+edi*1]
    or eax, dword ptr [Dc9cd8]
    pop ecx
    pop edi
    pop edx
    add edi, 08h
    jmp dword ptr [edx*4+D5d46e]
Func5d2f6_ endp
D5d46e dword offset Func5d4ae_
    dword offset L5d4c1
    dword offset L5d4d7
    dword offset L5d4ea
    dword offset L5d4fc
    dword offset L5d512
    dword offset L5d520
    dword offset L5d52e
    dword offset L5d53e
    dword offset L5d54e
    dword offset L5d559
    dword offset L5d561
    dword offset L5d572
    dword offset L5d581
    dword offset L5d591
    dword offset L5d5a2
Func5d4ae_ proc near
    mov edx, eax
    shl edx, 010h
    mov dx, ax
    mov dword ptr [edi-08h], edx
    mov dword ptr [edi-04h], edx
    jmp L5d5b5
L5d4c1::
    mov edx, eax
    shl edx, 010h
    mov dx, ax
    ror eax, 010h
    mov dword ptr [edi-04h], edx
    mov dword ptr [edi-08h], eax
    jmp L5d5b5
L5d4d7::
    mov edx, eax
    shl edx, 010h
    mov dx, ax
    mov dword ptr [edi-04h], edx
    mov dword ptr [edi-08h], eax
    jmp L5d5b5
L5d4ea::
    mov edx, eax
    ror eax, 010h
    xchg dx, ax
    mov dword ptr [edi-04h], eax
    mov dword ptr [edi-08h], edx
    jmp L5d5b5
L5d4fc::
    mov edx, eax
    shl edx, 010h
    mov dx, ax
    ror eax, 010h
    mov dword ptr [edi-08h], edx
    mov dword ptr [edi-04h], eax
    jmp L5d5b5
L5d512::
    ror eax, 010h
    mov dword ptr [edi-04h], eax
    mov dword ptr [edi-08h], eax
    jmp L5d5b5
L5d520::
    mov dword ptr [edi-08h], eax
    ror eax, 010h
    mov dword ptr [edi-04h], eax
    jmp L5d5b5
L5d52e::
    mov edx, eax
    ror eax, 010h
    mov dx, ax
    mov dword ptr [edi-04h], eax
    mov dword ptr [edi-08h], edx
    jmp L5d5b5
L5d53e::
    mov edx, eax
    shl edx, 010h
    mov dx, ax
    mov dword ptr [edi-04h], eax
    mov dword ptr [edi-08h], edx
    jmp L5d5b5
L5d54e::
    mov dword ptr [edi-04h], eax
    ror eax, 010h
    mov dword ptr [edi-08h], eax
    jmp L5d5b5
L5d559::
    mov dword ptr [edi-04h], eax
    mov dword ptr [edi-08h], eax
    jmp L5d5b5
L5d561::
    mov edx, eax
    shr edx, 010h
    shld edx, eax, 010h
    mov dword ptr [edi-08h], edx
    mov dword ptr [edi-04h], eax
    jmp L5d5b5
L5d572::
    mov edx, eax
    ror eax, 010h
    xchg dx, ax
    mov dword ptr [edi-04h], edx
    mov dword ptr [edi-08h], eax
    jmp L5d5b5
L5d581::
    mov edx, eax
    ror eax, 010h
    mov dx, ax
    mov dword ptr [edi-08h], eax
    mov dword ptr [edi-04h], edx
    jmp L5d5b5
L5d591::
    mov edx, eax
    shr edx, 010h
    shld edx, eax, 010h
    mov dword ptr [edi-08h], eax
    mov dword ptr [edi-04h], edx
    jmp L5d5b5
L5d5a2::
    mov edx, eax
    shr eax, 010h
    and edx, 0ffff0000h
    or edx, eax
    mov dword ptr [edi-08h], edx
    mov dword ptr [edi-04h], edx
L5d5b5::
    dec dword ptr [Dc9a88]
    jne Func5d270_
    ret
Func5d4ae_ endp
Func5d5c2_ proc near
    push edx
    push ebx
    xor edx, edx
    mov dl, ah
    mov ebx, dword ptr [edx*4+Db0080]
    mov dl, al
    add ebx, dword ptr [edx*4+Db0480]
    mov ebx, dword ptr [ebx*4+Db0880]
    shrd eax, ebx, 010h
    mov dl, ah
    mov ebx, dword ptr [edx*4+Db0080]
    mov dl, al
    add ebx, dword ptr [edx*4+Db0480]
    mov ebx, dword ptr [ebx*4+Db0880]
    shrd eax, ebx, 010h
    pop ebx
    pop edx
    ret
Func5d5c2_ endp
Func5d603_ proc near
    push ebp
    mov ebp, esp
    push esi
    push edi
    push eax
    push ebx
    push ecx
    push edx
    sar dword ptr [ebp+018h], 03h
    sar dword ptr [ebp+01ch], 03h
    shr dword ptr [ebp+020h], 03h
    shr dword ptr [ebp+024h], 03h
    mov edx, dword ptr [ebp+014h]
    mov ecx, dword ptr [ebp+08h]
    jmp dword ptr [edx*4+D5d629]
Func5d603_ endp
D5d629 dword offset L5d651
    dword offset Func5d635_
    dword offset Func5d635_
Func5d635_ proc near
    mov eax, dword ptr [ebp+018h]
    add eax, dword ptr [ebp+020h]
    sub eax, dword ptr [ecx+08h]
    jl L5d643
    sub dword ptr [ebp+020h], eax
L5d643::
    mov eax, dword ptr [ebp+01ch]
    add eax, dword ptr [ebp+024h]
    sub eax, dword ptr [ecx+024h]
    jl L5d651
    sub dword ptr [ebp+024h], eax
L5d651::
    mov eax, dword ptr [ecx+08h]
    shl eax, 04h
    mov dword ptr [Dc9aa4], eax
    mov eax, dword ptr [ecx]
    imul eax, dword ptr [ecx+04h]
    lea eax, [eax+eax*4]
    lea eax, [ecx+eax*4]
    mov dword ptr [Dc9a84], eax
    mov eax, dword ptr [Dc9aa4]
L5d672::
    mov edi, dword ptr [ecx+034h]
    or edi, edi
    js L5d7a4
    and edi, 03fffffffh
    mov ebx, dword ptr [ecx+044h]
    sub ebx, dword ptr [ebp+01ch]
    jl Func5d6b0_
    cmp ebx, dword ptr [ebp+024h]
    jge Func5d6b0_
    mov ebx, dword ptr [ecx+040h]
    sub ebx, dword ptr [ebp+018h]
    jl Func5d6b0_
    cmp ebx, dword ptr [ebp+020h]
    jge Func5d6b0_
    jmp dword ptr [edx*4+D5d6a4]
Func5d635_ endp
D5d6a4 dword offset Func5d6b0_
    dword offset L5d7c0
    dword offset L5dd79
Func5d6b0_ proc near
    push edx
    mov ebx, edi
    add edi, dword ptr [ebp+0ch]
    add ebx, dword ptr [ebp+010h]
    mov esi, dword ptr [edi]
    mov edx, dword ptr [eax+edi*1]
    mov dword ptr [ebx], esi
    mov dword ptr [eax+ebx*1], edx
    mov esi, dword ptr [edi+04h]
    mov edx, dword ptr [eax+edi*1+04h]
    mov dword ptr [ebx+04h], esi
    mov dword ptr [eax+ebx*1+04h], edx
    mov esi, dword ptr [edi+08h]
    mov edx, dword ptr [eax+edi*1+08h]
    mov dword ptr [ebx+08h], esi
    mov dword ptr [eax+ebx*1+08h], edx
    mov esi, dword ptr [edi+0ch]
    mov edx, dword ptr [eax+edi*1+0ch]
    mov dword ptr [ebx+0ch], esi
    mov dword ptr [eax+ebx*1+0ch], edx
    lea edi, [edi+eax*2]
    lea ebx, [ebx+eax*2]
    mov esi, dword ptr [edi]
    mov edx, dword ptr [eax+edi*1]
    mov dword ptr [ebx], esi
    mov dword ptr [eax+ebx*1], edx
    mov esi, dword ptr [edi+04h]
    mov edx, dword ptr [eax+edi*1+04h]
    mov dword ptr [ebx+04h], esi
    mov dword ptr [eax+ebx*1+04h], edx
    mov esi, dword ptr [edi+08h]
    mov edx, dword ptr [eax+edi*1+08h]
    mov dword ptr [ebx+08h], esi
    mov dword ptr [eax+ebx*1+08h], edx
    mov esi, dword ptr [edi+0ch]
    mov edx, dword ptr [eax+edi*1+0ch]
    mov dword ptr [ebx+0ch], esi
    mov dword ptr [eax+ebx*1+0ch], edx
    lea edi, [edi+eax*2]
    lea ebx, [ebx+eax*2]
    mov esi, dword ptr [edi]
    mov edx, dword ptr [eax+edi*1]
    mov dword ptr [ebx], esi
    mov dword ptr [eax+ebx*1], edx
    mov esi, dword ptr [edi+04h]
    mov edx, dword ptr [eax+edi*1+04h]
    mov dword ptr [ebx+04h], esi
    mov dword ptr [eax+ebx*1+04h], edx
    mov esi, dword ptr [edi+08h]
    mov edx, dword ptr [eax+edi*1+08h]
    mov dword ptr [ebx+08h], esi
    mov dword ptr [eax+ebx*1+08h], edx
    mov esi, dword ptr [edi+0ch]
    mov edx, dword ptr [eax+edi*1+0ch]
    mov dword ptr [ebx+0ch], esi
    mov dword ptr [eax+ebx*1+0ch], edx
    lea edi, [edi+eax*2]
    lea ebx, [ebx+eax*2]
    mov esi, dword ptr [edi]
    mov edx, dword ptr [eax+edi*1]
    mov dword ptr [ebx], esi
    mov dword ptr [eax+ebx*1], edx
    mov esi, dword ptr [edi+04h]
    mov edx, dword ptr [eax+edi*1+04h]
    mov dword ptr [ebx+04h], esi
    mov dword ptr [eax+ebx*1+04h], edx
    mov esi, dword ptr [edi+08h]
    mov edx, dword ptr [eax+edi*1+08h]
    mov dword ptr [ebx+08h], esi
    mov dword ptr [eax+ebx*1+08h], edx
    mov esi, dword ptr [edi+0ch]
    mov edx, dword ptr [eax+edi*1+0ch]
    mov dword ptr [ebx+0ch], esi
    mov dword ptr [eax+ebx*1+0ch], edx
    lea edi, [edi+eax*2]
    lea ebx, [ebx+eax*2]
    pop edx
    jmp L5d7a9
L5d7a4::
    cmp edi, 0fffffffeh
    je L5d7b8
L5d7a9::
    add ecx, 014h
    cmp ecx, dword ptr [Dc9a84]
    jne L5d672
L5d7b8::
    pop edx
    pop ecx
    pop ebx
    pop eax
    pop edi
    pop esi
    leave
    ret
L5d7c0::
    push ecx
    push edx
    mov ebx, edi
    add edi, dword ptr [ebp+0ch]
    add ebx, dword ptr [ebp+010h]
    mov esi, dword ptr [edi]
    mov edx, dword ptr [eax+edi*1+02h]
    xor edx, dword ptr [Dc9cc4]
    mov ecx, edx
    and ecx, dword ptr [Dc9cc8]
    and ecx, esi
    and esi, dword ptr [Dc9cc0]
    and edx, dword ptr [Dc9cc0]
    add esi, edx
    rcr esi, 1
    add esi, ecx
    mov dword ptr [ebx], esi
    mov esi, dword ptr [eax+edi*1]
    mov edx, dword ptr [edi+eax*2+02h]
    xor edx, dword ptr [Dc9cc4]
    mov ecx, edx
    and ecx, dword ptr [Dc9cc8]
    and ecx, esi
    and esi, dword ptr [Dc9cc0]
    and edx, dword ptr [Dc9cc0]
    add esi, edx
    rcr esi, 1
    add esi, ecx
    mov dword ptr [eax+ebx*1], esi
    mov esi, dword ptr [edi+04h]
    mov edx, dword ptr [eax+edi*1+06h]
    xor edx, dword ptr [Dc9cc4]
    mov ecx, edx
    and ecx, dword ptr [Dc9cc8]
    and ecx, esi
    and esi, dword ptr [Dc9cc0]
    and edx, dword ptr [Dc9cc0]
    add esi, edx
    rcr esi, 1
    add esi, ecx
    mov dword ptr [ebx+04h], esi
    mov esi, dword ptr [eax+edi*1+04h]
    mov edx, dword ptr [edi+eax*2+06h]
    xor edx, dword ptr [Dc9cc4]
    mov ecx, edx
    and ecx, dword ptr [Dc9cc8]
    and ecx, esi
    and esi, dword ptr [Dc9cc0]
    and edx, dword ptr [Dc9cc0]
    add esi, edx
    rcr esi, 1
    add esi, ecx
    mov dword ptr [eax+ebx*1+04h], esi
    mov esi, dword ptr [edi+08h]
    mov edx, dword ptr [eax+edi*1+0ah]
    xor edx, dword ptr [Dc9cc4]
    mov ecx, edx
    and ecx, dword ptr [Dc9cc8]
    and ecx, esi
    and esi, dword ptr [Dc9cc0]
    and edx, dword ptr [Dc9cc0]
    add esi, edx
    rcr esi, 1
    add esi, ecx
    mov dword ptr [ebx+08h], esi
    mov esi, dword ptr [eax+edi*1+08h]
    mov edx, dword ptr [edi+eax*2+0ah]
    xor edx, dword ptr [Dc9cc4]
    mov ecx, edx
    and ecx, dword ptr [Dc9cc8]
    and ecx, esi
    and esi, dword ptr [Dc9cc0]
    and edx, dword ptr [Dc9cc0]
    add esi, edx
    rcr esi, 1
    add esi, ecx
    mov dword ptr [eax+ebx*1+08h], esi
    mov esi, dword ptr [edi+0ch]
    mov edx, dword ptr [eax+edi*1+0eh]
    xor edx, dword ptr [Dc9cc4]
    mov ecx, edx
    and ecx, dword ptr [Dc9cc8]
    and ecx, esi
    and esi, dword ptr [Dc9cc0]
    and edx, dword ptr [Dc9cc0]
    add esi, edx
    rcr esi, 1
    add esi, ecx
    mov dword ptr [ebx+0ch], esi
    mov esi, dword ptr [eax+edi*1+0ch]
    mov edx, dword ptr [edi+eax*2+0eh]
    xor edx, dword ptr [Dc9cc4]
    mov ecx, edx
    and ecx, dword ptr [Dc9cc8]
    and ecx, esi
    and esi, dword ptr [Dc9cc0]
    and edx, dword ptr [Dc9cc0]
    add esi, edx
    rcr esi, 1
    add esi, ecx
    mov dword ptr [eax+ebx*1+0ch], esi
    lea edi, [edi+eax*2]
    lea ebx, [ebx+eax*2]
    mov esi, dword ptr [edi]
    mov edx, dword ptr [eax+edi*1+02h]
    xor edx, dword ptr [Dc9cc4]
    mov ecx, edx
    and ecx, dword ptr [Dc9cc8]
    and ecx, esi
    and esi, dword ptr [Dc9cc0]
    and edx, dword ptr [Dc9cc0]
    add esi, edx
    rcr esi, 1
    add esi, ecx
    mov dword ptr [ebx], esi
    mov esi, dword ptr [eax+edi*1]
    mov edx, dword ptr [edi+eax*2+02h]
    xor edx, dword ptr [Dc9cc4]
    mov ecx, edx
    and ecx, dword ptr [Dc9cc8]
    and ecx, esi
    and esi, dword ptr [Dc9cc0]
    and edx, dword ptr [Dc9cc0]
    add esi, edx
    rcr esi, 1
    add esi, ecx
    mov dword ptr [eax+ebx*1], esi
    mov esi, dword ptr [edi+04h]
    mov edx, dword ptr [eax+edi*1+06h]
    xor edx, dword ptr [Dc9cc4]
    mov ecx, edx
    and ecx, dword ptr [Dc9cc8]
    and ecx, esi
    and esi, dword ptr [Dc9cc0]
    and edx, dword ptr [Dc9cc0]
    add esi, edx
    rcr esi, 1
    add esi, ecx
    mov dword ptr [ebx+04h], esi
    mov esi, dword ptr [eax+edi*1+04h]
    mov edx, dword ptr [edi+eax*2+06h]
    xor edx, dword ptr [Dc9cc4]
    mov ecx, edx
    and ecx, dword ptr [Dc9cc8]
    and ecx, esi
    and esi, dword ptr [Dc9cc0]
    and edx, dword ptr [Dc9cc0]
    add esi, edx
    rcr esi, 1
    add esi, ecx
    mov dword ptr [eax+ebx*1+04h], esi
    mov esi, dword ptr [edi+08h]
    mov edx, dword ptr [eax+edi*1+0ah]
    xor edx, dword ptr [Dc9cc4]
    mov ecx, edx
    and ecx, dword ptr [Dc9cc8]
    and ecx, esi
    and esi, dword ptr [Dc9cc0]
    and edx, dword ptr [Dc9cc0]
    add esi, edx
    rcr esi, 1
    add esi, ecx
    mov dword ptr [ebx+08h], esi
    mov esi, dword ptr [eax+edi*1+08h]
    mov edx, dword ptr [edi+eax*2+0ah]
    xor edx, dword ptr [Dc9cc4]
    mov ecx, edx
    and ecx, dword ptr [Dc9cc8]
    and ecx, esi
    and esi, dword ptr [Dc9cc0]
    and edx, dword ptr [Dc9cc0]
    add esi, edx
    rcr esi, 1
    add esi, ecx
    mov dword ptr [eax+ebx*1+08h], esi
    mov esi, dword ptr [edi+0ch]
    mov edx, dword ptr [eax+edi*1+0eh]
    xor edx, dword ptr [Dc9cc4]
    mov ecx, edx
    and ecx, dword ptr [Dc9cc8]
    and ecx, esi
    and esi, dword ptr [Dc9cc0]
    and edx, dword ptr [Dc9cc0]
    add esi, edx
    rcr esi, 1
    add esi, ecx
    mov dword ptr [ebx+0ch], esi
    mov esi, dword ptr [eax+edi*1+0ch]
    mov edx, dword ptr [edi+eax*2+0eh]
    xor edx, dword ptr [Dc9cc4]
    mov ecx, edx
    and ecx, dword ptr [Dc9cc8]
    and ecx, esi
    and esi, dword ptr [Dc9cc0]
    and edx, dword ptr [Dc9cc0]
    add esi, edx
    rcr esi, 1
    add esi, ecx
    mov dword ptr [eax+ebx*1+0ch], esi
    lea edi, [edi+eax*2]
    lea ebx, [ebx+eax*2]
    mov esi, dword ptr [edi]
    mov edx, dword ptr [eax+edi*1+02h]
    xor edx, dword ptr [Dc9cc4]
    mov ecx, edx
    and ecx, dword ptr [Dc9cc8]
    and ecx, esi
    and esi, dword ptr [Dc9cc0]
    and edx, dword ptr [Dc9cc0]
    add esi, edx
    rcr esi, 1
    add esi, ecx
    mov dword ptr [ebx], esi
    mov esi, dword ptr [eax+edi*1]
    mov edx, dword ptr [edi+eax*2+02h]
    xor edx, dword ptr [Dc9cc4]
    mov ecx, edx
    and ecx, dword ptr [Dc9cc8]
    and ecx, esi
    and esi, dword ptr [Dc9cc0]
    and edx, dword ptr [Dc9cc0]
    add esi, edx
    rcr esi, 1
    add esi, ecx
    mov dword ptr [eax+ebx*1], esi
    mov esi, dword ptr [edi+04h]
    mov edx, dword ptr [eax+edi*1+06h]
    xor edx, dword ptr [Dc9cc4]
    mov ecx, edx
    and ecx, dword ptr [Dc9cc8]
    and ecx, esi
    and esi, dword ptr [Dc9cc0]
    and edx, dword ptr [Dc9cc0]
    add esi, edx
    rcr esi, 1
    add esi, ecx
    mov dword ptr [ebx+04h], esi
    mov esi, dword ptr [eax+edi*1+04h]
    mov edx, dword ptr [edi+eax*2+06h]
    xor edx, dword ptr [Dc9cc4]
    mov ecx, edx
    and ecx, dword ptr [Dc9cc8]
    and ecx, esi
    and esi, dword ptr [Dc9cc0]
    and edx, dword ptr [Dc9cc0]
    add esi, edx
    rcr esi, 1
    add esi, ecx
    mov dword ptr [eax+ebx*1+04h], esi
    mov esi, dword ptr [edi+08h]
    mov edx, dword ptr [eax+edi*1+0ah]
    xor edx, dword ptr [Dc9cc4]
    mov ecx, edx
    and ecx, dword ptr [Dc9cc8]
    and ecx, esi
    and esi, dword ptr [Dc9cc0]
    and edx, dword ptr [Dc9cc0]
    add esi, edx
    rcr esi, 1
    add esi, ecx
    mov dword ptr [ebx+08h], esi
    mov esi, dword ptr [eax+edi*1+08h]
    mov edx, dword ptr [edi+eax*2+0ah]
    xor edx, dword ptr [Dc9cc4]
    mov ecx, edx
    and ecx, dword ptr [Dc9cc8]
    and ecx, esi
    and esi, dword ptr [Dc9cc0]
    and edx, dword ptr [Dc9cc0]
    add esi, edx
    rcr esi, 1
    add esi, ecx
    mov dword ptr [eax+ebx*1+08h], esi
    mov esi, dword ptr [edi+0ch]
    mov edx, dword ptr [eax+edi*1+0eh]
    xor edx, dword ptr [Dc9cc4]
    mov ecx, edx
    and ecx, dword ptr [Dc9cc8]
    and ecx, esi
    and esi, dword ptr [Dc9cc0]
    and edx, dword ptr [Dc9cc0]
    add esi, edx
    rcr esi, 1
    add esi, ecx
    mov dword ptr [ebx+0ch], esi
    mov esi, dword ptr [eax+edi*1+0ch]
    mov edx, dword ptr [edi+eax*2+0eh]
    xor edx, dword ptr [Dc9cc4]
    mov ecx, edx
    and ecx, dword ptr [Dc9cc8]
    and ecx, esi
    and esi, dword ptr [Dc9cc0]
    and edx, dword ptr [Dc9cc0]
    add esi, edx
    rcr esi, 1
    add esi, ecx
    mov dword ptr [eax+ebx*1+0ch], esi
    lea edi, [edi+eax*2]
    lea ebx, [ebx+eax*2]
    mov esi, dword ptr [edi]
    mov edx, dword ptr [eax+edi*1+02h]
    xor edx, dword ptr [Dc9cc4]
    mov ecx, edx
    and ecx, dword ptr [Dc9cc8]
    and ecx, esi
    and esi, dword ptr [Dc9cc0]
    and edx, dword ptr [Dc9cc0]
    add esi, edx
    rcr esi, 1
    add esi, ecx
    mov dword ptr [ebx], esi
    mov esi, dword ptr [eax+edi*1]
    mov edx, dword ptr [edi+eax*2+02h]
    xor edx, dword ptr [Dc9cc4]
    mov ecx, edx
    and ecx, dword ptr [Dc9cc8]
    and ecx, esi
    and esi, dword ptr [Dc9cc0]
    and edx, dword ptr [Dc9cc0]
    add esi, edx
    rcr esi, 1
    add esi, ecx
    mov dword ptr [eax+ebx*1], esi
    mov esi, dword ptr [edi+04h]
    mov edx, dword ptr [eax+edi*1+06h]
    xor edx, dword ptr [Dc9cc4]
    mov ecx, edx
    and ecx, dword ptr [Dc9cc8]
    and ecx, esi
    and esi, dword ptr [Dc9cc0]
    and edx, dword ptr [Dc9cc0]
    add esi, edx
    rcr esi, 1
    add esi, ecx
    mov dword ptr [ebx+04h], esi
    mov esi, dword ptr [eax+edi*1+04h]
    mov edx, dword ptr [edi+eax*2+06h]
    xor edx, dword ptr [Dc9cc4]
    mov ecx, edx
    and ecx, dword ptr [Dc9cc8]
    and ecx, esi
    and esi, dword ptr [Dc9cc0]
    and edx, dword ptr [Dc9cc0]
    add esi, edx
    rcr esi, 1
    add esi, ecx
    mov dword ptr [eax+ebx*1+04h], esi
    mov esi, dword ptr [edi+08h]
    mov edx, dword ptr [eax+edi*1+0ah]
    xor edx, dword ptr [Dc9cc4]
    mov ecx, edx
    and ecx, dword ptr [Dc9cc8]
    and ecx, esi
    and esi, dword ptr [Dc9cc0]
    and edx, dword ptr [Dc9cc0]
    add esi, edx
    rcr esi, 1
    add esi, ecx
    mov dword ptr [ebx+08h], esi
    mov esi, dword ptr [eax+edi*1+08h]
    mov edx, dword ptr [edi+eax*2+0ah]
    xor edx, dword ptr [Dc9cc4]
    mov ecx, edx
    and ecx, dword ptr [Dc9cc8]
    and ecx, esi
    and esi, dword ptr [Dc9cc0]
    and edx, dword ptr [Dc9cc0]
    add esi, edx
    rcr esi, 1
    add esi, ecx
    mov dword ptr [eax+ebx*1+08h], esi
    mov esi, dword ptr [edi+0ch]
    mov edx, dword ptr [eax+edi*1+0eh]
    xor edx, dword ptr [Dc9cc4]
    mov ecx, edx
    and ecx, dword ptr [Dc9cc8]
    and ecx, esi
    and esi, dword ptr [Dc9cc0]
    and edx, dword ptr [Dc9cc0]
    add esi, edx
    rcr esi, 1
    add esi, ecx
    mov dword ptr [ebx+0ch], esi
    mov esi, dword ptr [eax+edi*1+0ch]
    mov edx, dword ptr [edi+eax*2+0eh]
    xor edx, dword ptr [Dc9cc4]
    mov ecx, edx
    and ecx, dword ptr [Dc9cc8]
    and ecx, esi
    and esi, dword ptr [Dc9cc0]
    and edx, dword ptr [Dc9cc0]
    add esi, edx
    rcr esi, 1
    add esi, ecx
    mov dword ptr [eax+ebx*1+0ch], esi
    lea edi, [edi+eax*2]
    lea ebx, [ebx+eax*2]
    pop edx
    pop ecx
    jmp L5d7a9
L5dd79::
    push ecx
    push edx
    mov ebx, edi
    add edi, dword ptr [ebp+0ch]
    add ebx, dword ptr [ebp+010h]
    mov esi, dword ptr [edi]
    mov edx, dword ptr [eax+edi*1+02h]
    mov ecx, edx
    and ecx, 08210821h
    and ecx, esi
    and esi, dword ptr [Dc9cc0]
    and edx, dword ptr [Dc9cc0]
    add esi, edx
    rcr esi, 1
    add esi, ecx
    mov dword ptr [ebx], esi
    mov esi, dword ptr [eax+edi*1]
    mov edx, dword ptr [edi+eax*2+02h]
    mov ecx, edx
    and ecx, 08210821h
    and ecx, esi
    and esi, dword ptr [Dc9cc0]
    and edx, dword ptr [Dc9cc0]
    add esi, edx
    rcr esi, 1
    add esi, ecx
    mov dword ptr [eax+ebx*1], esi
    mov esi, dword ptr [edi+04h]
    mov edx, dword ptr [eax+edi*1+06h]
    mov ecx, edx
    and ecx, 08210821h
    and ecx, esi
    and esi, dword ptr [Dc9cc0]
    and edx, dword ptr [Dc9cc0]
    add esi, edx
    rcr esi, 1
    add esi, ecx
    mov dword ptr [ebx+04h], esi
    mov esi, dword ptr [eax+edi*1+04h]
    mov edx, dword ptr [edi+eax*2+06h]
    mov ecx, edx
    and ecx, 08210821h
    and ecx, esi
    and esi, dword ptr [Dc9cc0]
    and edx, dword ptr [Dc9cc0]
    add esi, edx
    rcr esi, 1
    add esi, ecx
    mov dword ptr [eax+ebx*1+04h], esi
    mov esi, dword ptr [edi+08h]
    mov edx, dword ptr [eax+edi*1+0ah]
    mov ecx, edx
    and ecx, 08210821h
    and ecx, esi
    and esi, dword ptr [Dc9cc0]
    and edx, dword ptr [Dc9cc0]
    add esi, edx
    rcr esi, 1
    add esi, ecx
    mov dword ptr [ebx+08h], esi
    mov esi, dword ptr [eax+edi*1+08h]
    mov edx, dword ptr [edi+eax*2+0ah]
    mov ecx, edx
    and ecx, 08210821h
    and ecx, esi
    and esi, dword ptr [Dc9cc0]
    and edx, dword ptr [Dc9cc0]
    add esi, edx
    rcr esi, 1
    add esi, ecx
    mov dword ptr [eax+ebx*1+08h], esi
    mov esi, dword ptr [edi+0ch]
    mov edx, dword ptr [eax+edi*1+0eh]
    mov ecx, edx
    and ecx, 08210821h
    and ecx, esi
    and esi, dword ptr [Dc9cc0]
    and edx, dword ptr [Dc9cc0]
    add esi, edx
    rcr esi, 1
    add esi, ecx
    mov dword ptr [ebx+0ch], esi
    mov esi, dword ptr [eax+edi*1+0ch]
    mov edx, dword ptr [edi+eax*2+0eh]
    mov ecx, edx
    and ecx, 08210821h
    and ecx, esi
    and esi, dword ptr [Dc9cc0]
    and edx, dword ptr [Dc9cc0]
    add esi, edx
    rcr esi, 1
    add esi, ecx
    mov dword ptr [eax+ebx*1+0ch], esi
    lea edi, [edi+eax*2]
    lea ebx, [ebx+eax*2]
    mov esi, dword ptr [edi]
    mov edx, dword ptr [eax+edi*1+02h]
    mov ecx, edx
    and ecx, 08210821h
    and ecx, esi
    and esi, dword ptr [Dc9cc0]
    and edx, dword ptr [Dc9cc0]
    add esi, edx
    rcr esi, 1
    add esi, ecx
    mov dword ptr [ebx], esi
    mov esi, dword ptr [eax+edi*1]
    mov edx, dword ptr [edi+eax*2+02h]
    mov ecx, edx
    and ecx, 08210821h
    and ecx, esi
    and esi, dword ptr [Dc9cc0]
    and edx, dword ptr [Dc9cc0]
    add esi, edx
    rcr esi, 1
    add esi, ecx
    mov dword ptr [eax+ebx*1], esi
    mov esi, dword ptr [edi+04h]
    mov edx, dword ptr [eax+edi*1+06h]
    mov ecx, edx
    and ecx, 08210821h
    and ecx, esi
    and esi, dword ptr [Dc9cc0]
    and edx, dword ptr [Dc9cc0]
    add esi, edx
    rcr esi, 1
    add esi, ecx
    mov dword ptr [ebx+04h], esi
    mov esi, dword ptr [eax+edi*1+04h]
    mov edx, dword ptr [edi+eax*2+06h]
    mov ecx, edx
    and ecx, 08210821h
    and ecx, esi
    and esi, dword ptr [Dc9cc0]
    and edx, dword ptr [Dc9cc0]
    add esi, edx
    rcr esi, 1
    add esi, ecx
    mov dword ptr [eax+ebx*1+04h], esi
    mov esi, dword ptr [edi+08h]
    mov edx, dword ptr [eax+edi*1+0ah]
    mov ecx, edx
    and ecx, 08210821h
    and ecx, esi
    and esi, dword ptr [Dc9cc0]
    and edx, dword ptr [Dc9cc0]
    add esi, edx
    rcr esi, 1
    add esi, ecx
    mov dword ptr [ebx+08h], esi
    mov esi, dword ptr [eax+edi*1+08h]
    mov edx, dword ptr [edi+eax*2+0ah]
    mov ecx, edx
    and ecx, 08210821h
    and ecx, esi
    and esi, dword ptr [Dc9cc0]
    and edx, dword ptr [Dc9cc0]
    add esi, edx
    rcr esi, 1
    add esi, ecx
    mov dword ptr [eax+ebx*1+08h], esi
    mov esi, dword ptr [edi+0ch]
    mov edx, dword ptr [eax+edi*1+0eh]
    mov ecx, edx
    and ecx, 08210821h
    and ecx, esi
    and esi, dword ptr [Dc9cc0]
    and edx, dword ptr [Dc9cc0]
    add esi, edx
    rcr esi, 1
    add esi, ecx
    mov dword ptr [ebx+0ch], esi
    mov esi, dword ptr [eax+edi*1+0ch]
    mov edx, dword ptr [edi+eax*2+0eh]
    mov ecx, edx
    and ecx, 08210821h
    and ecx, esi
    and esi, dword ptr [Dc9cc0]
    and edx, dword ptr [Dc9cc0]
    add esi, edx
    rcr esi, 1
    add esi, ecx
    mov dword ptr [eax+ebx*1+0ch], esi
    lea edi, [edi+eax*2]
    lea ebx, [ebx+eax*2]
    mov esi, dword ptr [edi]
    mov edx, dword ptr [eax+edi*1+02h]
    mov ecx, edx
    and ecx, 08210821h
    and ecx, esi
    and esi, dword ptr [Dc9cc0]
    and edx, dword ptr [Dc9cc0]
    add esi, edx
    rcr esi, 1
    add esi, ecx
    mov dword ptr [ebx], esi
    mov esi, dword ptr [eax+edi*1]
    mov edx, dword ptr [edi+eax*2+02h]
    mov ecx, edx
    and ecx, 08210821h
    and ecx, esi
    and esi, dword ptr [Dc9cc0]
    and edx, dword ptr [Dc9cc0]
    add esi, edx
    rcr esi, 1
    add esi, ecx
    mov dword ptr [eax+ebx*1], esi
    mov esi, dword ptr [edi+04h]
    mov edx, dword ptr [eax+edi*1+06h]
    mov ecx, edx
    and ecx, 08210821h
    and ecx, esi
    and esi, dword ptr [Dc9cc0]
    and edx, dword ptr [Dc9cc0]
    add esi, edx
    rcr esi, 1
    add esi, ecx
    mov dword ptr [ebx+04h], esi
    mov esi, dword ptr [eax+edi*1+04h]
    mov edx, dword ptr [edi+eax*2+06h]
    mov ecx, edx
    and ecx, 08210821h
    and ecx, esi
    and esi, dword ptr [Dc9cc0]
    and edx, dword ptr [Dc9cc0]
    add esi, edx
    rcr esi, 1
    add esi, ecx
    mov dword ptr [eax+ebx*1+04h], esi
    mov esi, dword ptr [edi+08h]
    mov edx, dword ptr [eax+edi*1+0ah]
    mov ecx, edx
    and ecx, 08210821h
    and ecx, esi
    and esi, dword ptr [Dc9cc0]
    and edx, dword ptr [Dc9cc0]
    add esi, edx
    rcr esi, 1
    add esi, ecx
    mov dword ptr [ebx+08h], esi
    mov esi, dword ptr [eax+edi*1+08h]
    mov edx, dword ptr [edi+eax*2+0ah]
    mov ecx, edx
    and ecx, 08210821h
    and ecx, esi
    and esi, dword ptr [Dc9cc0]
    and edx, dword ptr [Dc9cc0]
    add esi, edx
    rcr esi, 1
    add esi, ecx
    mov dword ptr [eax+ebx*1+08h], esi
    mov esi, dword ptr [edi+0ch]
    mov edx, dword ptr [eax+edi*1+0eh]
    mov ecx, edx
    and ecx, 08210821h
    and ecx, esi
    and esi, dword ptr [Dc9cc0]
    and edx, dword ptr [Dc9cc0]
    add esi, edx
    rcr esi, 1
    add esi, ecx
    mov dword ptr [ebx+0ch], esi
    mov esi, dword ptr [eax+edi*1+0ch]
    mov edx, dword ptr [edi+eax*2+0eh]
    mov ecx, edx
    and ecx, 08210821h
    and ecx, esi
    and esi, dword ptr [Dc9cc0]
    and edx, dword ptr [Dc9cc0]
    add esi, edx
    rcr esi, 1
    add esi, ecx
    mov dword ptr [eax+ebx*1+0ch], esi
    lea edi, [edi+eax*2]
    lea ebx, [ebx+eax*2]
    mov esi, dword ptr [edi]
    mov edx, dword ptr [eax+edi*1+02h]
    mov ecx, edx
    and ecx, 08210821h
    and ecx, esi
    and esi, dword ptr [Dc9cc0]
    and edx, dword ptr [Dc9cc0]
    add esi, edx
    rcr esi, 1
    add esi, ecx
    mov dword ptr [ebx], esi
    mov esi, dword ptr [eax+edi*1]
    mov edx, dword ptr [edi+eax*2+02h]
    mov ecx, edx
    and ecx, 08210821h
    and ecx, esi
    and esi, dword ptr [Dc9cc0]
    and edx, dword ptr [Dc9cc0]
    add esi, edx
    rcr esi, 1
    add esi, ecx
    mov dword ptr [eax+ebx*1], esi
    mov esi, dword ptr [edi+04h]
    mov edx, dword ptr [eax+edi*1+06h]
    mov ecx, edx
    and ecx, 08210821h
    and ecx, esi
    and esi, dword ptr [Dc9cc0]
    and edx, dword ptr [Dc9cc0]
    add esi, edx
    rcr esi, 1
    add esi, ecx
    mov dword ptr [ebx+04h], esi
    mov esi, dword ptr [eax+edi*1+04h]
    mov edx, dword ptr [edi+eax*2+06h]
    mov ecx, edx
    and ecx, 08210821h
    and ecx, esi
    and esi, dword ptr [Dc9cc0]
    and edx, dword ptr [Dc9cc0]
    add esi, edx
    rcr esi, 1
    add esi, ecx
    mov dword ptr [eax+ebx*1+04h], esi
    mov esi, dword ptr [edi+08h]
    mov edx, dword ptr [eax+edi*1+0ah]
    mov ecx, edx
    and ecx, 08210821h
    and ecx, esi
    and esi, dword ptr [Dc9cc0]
    and edx, dword ptr [Dc9cc0]
    add esi, edx
    rcr esi, 1
    add esi, ecx
    mov dword ptr [ebx+08h], esi
    mov esi, dword ptr [eax+edi*1+08h]
    mov edx, dword ptr [edi+eax*2+0ah]
    mov ecx, edx
    and ecx, 08210821h
    and ecx, esi
    and esi, dword ptr [Dc9cc0]
    and edx, dword ptr [Dc9cc0]
    add esi, edx
    rcr esi, 1
    add esi, ecx
    mov dword ptr [eax+ebx*1+08h], esi
    mov esi, dword ptr [edi+0ch]
    mov edx, dword ptr [eax+edi*1+0eh]
    mov ecx, edx
    and ecx, 08210821h
    and ecx, esi
    and esi, dword ptr [Dc9cc0]
    and edx, dword ptr [Dc9cc0]
    add esi, edx
    rcr esi, 1
    add esi, ecx
    mov dword ptr [ebx+0ch], esi
    mov esi, dword ptr [eax+edi*1+0ch]
    mov edx, dword ptr [edi+eax*2+0eh]
    mov ecx, edx
    and ecx, 08210821h
    and ecx, esi
    and esi, dword ptr [Dc9cc0]
    and edx, dword ptr [Dc9cc0]
    add esi, edx
    rcr esi, 1
    add esi, ecx
    mov dword ptr [eax+ebx*1+0ch], esi
    lea edi, [edi+eax*2]
    lea ebx, [ebx+eax*2]
    pop edx
    pop ecx
    jmp L5d7a9
Func5d6b0_ endp
Func5e272_ proc near
    push ebp
    mov ebp, esp
    push edi
    push edx
    xor eax, eax
    mov edi, dword ptr [ebp+010h]
    mov dword ptr [edi], eax
    mov edi, dword ptr [ebp+014h]
    mov dword ptr [edi], eax
    pop edx
    pop edi
    leave
    ret
Func5e272_ endp
Func5e287_ proc near
    push ebp
    mov ebp, esp
    push edi
    push ebx
    push ecx
    push edx
    pop edx
    pop ecx
    pop ebx
    pop edi
    leave
    ret
Func5e287_ endp
Func5e294_ proc near
    push ebp
    mov ebp, esp
    add esp, 0fffffff4h
    push esi
    push edi
    push eax
    push ebx
    push ecx
    push edx
    pop edx
    pop ecx
    pop ebx
    pop eax
    pop edi
    pop esi
    leave
    ret
Func5e294_ endp
Func5e2a8_ proc near
    and ebx, dword ptr [red_mask]
    ret
Func5e2a8_ endp
Func5e2af_ proc near
    and ebx, dword ptr [green_mask]
    ret
Func5e2af_ endp
Func5e2b6_ proc near
    and ebx, dword ptr [blue_mask]
    ret
Func5e2b6_ endp
Func5e2bd_ proc near
    and ebx, dword ptr [Dc9c04]
    ret
Func5e2bd_ endp
Func5e2c4_ proc near
    and ebx, dword ptr [Dc9c08]
    ret
Func5e2c4_ endp
Func5e2cb_ proc near
    and ebx, dword ptr [Dc9c0c]
    ret
Func5e2cb_ endp
Func5e2d2_ proc near
    and ebx, dword ptr [Dc9cc0]
    shr ebx, 1
    ret
Func5e2d2_ endp
Func5e2db_ proc near
    xor ebx, dword ptr [Dc9cc4]
Func5e2db_ endp
Func5e2e1_ proc near
    ret
Func5e2e1_ endp
Func5e2e2_ proc near
    not ebx
    and ebx, dword ptr [red_mask]
    ret
Func5e2e2_ endp
Func5e2eb_ proc near
    not ebx
    and ebx, dword ptr [green_mask]
    ret
Func5e2eb_ endp
Func5e2f4_ proc near
    not ebx
    and ebx, dword ptr [blue_mask]
    ret
Func5e2f4_ endp
Func5e2fd_ proc near
    not ebx
    and ebx, dword ptr [Dc9c04]
    ret
Func5e2fd_ endp
Func5e306_ proc near
    not ebx
    and ebx, dword ptr [Dc9c08]
    ret
Func5e306_ endp
Func5e30f_ proc near
    not ebx
    and ebx, dword ptr [Dc9c0c]
    ret
Func5e30f_ endp
Func5e318_ proc near
    and ebx, 01fh
    mov ebx, dword ptr [ebx*4+Dc9c40]
    ret
Func5e318_ endp
Func5e323_ proc near
    and esi, dword ptr [red_mask]
    ret
Func5e323_ endp
Func5e32a_ proc near
    and esi, dword ptr [green_mask]
    ret
Func5e32a_ endp
Func5e331_ proc near
    and esi, dword ptr [blue_mask]
    ret
Func5e331_ endp
Func5e338_ proc near
    and esi, dword ptr [Dc9c04]
    ret
Func5e338_ endp
Func5e33f_ proc near
    and esi, dword ptr [Dc9c08]
    ret
Func5e33f_ endp
Func5e346_ proc near
    and esi, dword ptr [Dc9c0c]
    ret
Func5e346_ endp
Func5e34d_ proc near
    and esi, dword ptr [Dc9cc0]
    shr esi, 1
    ret
Func5e34d_ endp
Func5e356_ proc near
    xor esi, dword ptr [Dc9cc4]
Func5e356_ endp
Func5e35c_ proc near
    ret
Func5e35c_ endp
Func5e35d_ proc near
    not esi
    and esi, dword ptr [red_mask]
    ret
Func5e35d_ endp
Func5e366_ proc near
    not esi
    and esi, dword ptr [green_mask]
    ret
Func5e366_ endp
Func5e36f_ proc near
    not esi
    and esi, dword ptr [blue_mask]
    ret
Func5e36f_ endp
Func5e378_ proc near
    not esi
    and esi, dword ptr [Dc9c04]
    ret
Func5e378_ endp
Func5e381_ proc near
    not esi
    and esi, dword ptr [Dc9c08]
    ret
Func5e381_ endp
Func5e38a_ proc near
    not esi
    and esi, dword ptr [Dc9c0c]
    ret
Func5e38a_ endp
Func5e393_ proc near
    and esi, 01fh
    mov esi, dword ptr [esi*4+Dc9c40]
    ret
Func5e393_ endp
average_colour proc near
    push eax
    push ecx
    mov dword ptr [Dc9c34], 00h
    mov dword ptr [Dc9c38], 00h
    mov dword ptr [Dc9c2c], 00h
    mov ecx, 01fh
L5e3c3::
    mov eax, dword ptr [ebp+ecx*4+00h]
    mov esi, eax
    mov ebx, eax
    and esi, dword ptr [green_mask]
    and eax, dword ptr [red_mask]
    shr esi, 05h
    and ebx, dword ptr [blue_mask]
    shr eax, 0ah
    add dword ptr [Dc9c38], esi
    add dword ptr [Dc9c34], eax
    add dword ptr [Dc9c2c], ebx
    dec ecx
    jns L5e3c3
    mov eax, dword ptr [Dc9c34]
    mov esi, dword ptr [Dc9c38]
    mov ebx, dword ptr [Dc9c2c]
    shld ecx, eax, 010h
    add eax, ecx
    shld ecx, esi, 010h
    shr eax, 06h
    add esi, ecx
    shld ecx, ebx, 010h
    shr esi, 06h
    add ebx, ecx
    shr ebx, 06h
    pop ecx
    shl eax, 0ah
    and ebx, dword ptr [blue_mask]
    shl esi, 05h
    and eax, dword ptr [red_mask]
    and esi, dword ptr [green_mask]
    or esi, eax
    or esi, ebx
    pop eax
    mov dword ptr [Dc9c2c], esi
    ret
average_colour endp
Func5e449_ proc near
    push ebp
    mov ebp, esp
    push esi
    push edi
    push eax
    push ebx
    push ecx
    push edx
    mov ebx, dword ptr [ebp+08h]
    mov esi, dword ptr [ebp+0ch]
    mov edi, dword ptr [ebp+010h]
    push ebp
    mov eax, dword ptr [ebx+024h]
    lea eax, [eax*4-01h]
    mov dword ptr [Dc9b08], eax
    mov ecx, dword ptr [ebx+08h]
    lea ecx, [ecx*4-02h]
    lea ebx, [ecx*4+08h]
    lea edi, [ebx+edi*1+02h]
    lea esi, [ebx+esi*1+02h]
    lea ebp, [ebx+edi*1]
    lea ebx, [ebx+esi*1]
    push esi
    push edi
    add esi, esi
    add edi, edi
    sub esi, ebx
    sub edi, ebp
    push ecx
    inc ecx
L5e496::
    mov eax, dword ptr [esi+ecx*4-02h]
    mov dword ptr [edi+ecx*4-02h], eax
    dec ecx
    jns L5e496
    pop ecx
    pop edi
    pop esi
L5e4a4::
    push ecx
L5e4a5::
    mov eax, dword ptr [esi+ecx*4+02h]
    mov edx, dword ptr [ebx+ecx*4+02h]
    mov dword ptr [edi+ecx*4+02h], eax
    mov dword ptr [ebp+ecx*4+02h], edx
    mov eax, dword ptr [esi-02h]
    mov edx, dword ptr [ebx-02h]
    mov dword ptr [edi-02h], eax
    mov dword ptr [ebp-02h], edx
    mov eax, dword ptr [esi+ecx*4]
    mov edx, dword ptr [ebx+ecx*4]
    mov dword ptr [edi+ecx*4], eax
    mov dword ptr [ebp+ecx*4+00h], edx
    push ecx
    push eax
    push edx
    mov ecx, eax
    and ecx, dword ptr [Dc9cc8]
    and ecx, edx
    and edx, dword ptr [Dc9cc0]
    and eax, dword ptr [Dc9cc0]
    add edx, eax
    rcr edx, 1
    add edx, ecx
    mov dword ptr [Dc9b0c], edx
    pop edx
    pop eax
    xchg dx, ax
    ror edx, 010h
    mov ecx, eax
    and ecx, dword ptr [Dc9cc8]
    and ecx, edx
    and edx, dword ptr [Dc9cc0]
    and eax, dword ptr [Dc9cc0]
    add edx, eax
    rcr edx, 1
    add edx, ecx
    mov dword ptr [Dc9b10], edx
    mov eax, dword ptr [Dc9b0c]
    mov ecx, eax
    and ecx, dword ptr [Dc9cc8]
    and ecx, edx
    and edx, dword ptr [Dc9cc0]
    and eax, dword ptr [Dc9cc0]
    add edx, eax
    rcr edx, 1
    add edx, ecx
    push edx
    mov eax, dword ptr [Dc9b0c]
    mov edx, dword ptr [Dc9b10]
    ror eax, 010h
    mov ecx, eax
    and ecx, dword ptr [Dc9cc8]
    and ecx, edx
    and edx, dword ptr [Dc9cc0]
    and eax, dword ptr [Dc9cc0]
    add edx, eax
    rcr edx, 1
    add edx, ecx
    pop ecx
    ror edx, 010h
    xchg dx, cx
    mov eax, ecx
    pop ecx
    push esi
    push ebx
    push edx
    neg ebx
    lea ebx, [ebx+esi*2]
    mov edx, dword ptr [ebx+ecx*4-02h]
    cmp edx, dword ptr [esi+ecx*4-02h]
    jne L5e591
    ror edx, 010h
    cmp edx, dword ptr [esi+ecx*4-02h]
    jne L5e591
    mov word ptr [edi+ecx*4], ax
L5e591::
    mov edx, dword ptr [ebx+ecx*4+02h]
    cmp edx, dword ptr [esi+ecx*4+02h]
    jne L5e5ac
    ror edx, 010h
    cmp edx, dword ptr [esi+ecx*4+02h]
    jne L5e5ac
    shr eax, 010h
    mov word ptr [edi+ecx*4+02h], ax
L5e5ac::
    pop edx
    pop ebx
    neg esi
    lea esi, [esi+ebx*2]
    mov eax, dword ptr [ebx+ecx*4-02h]
    cmp eax, dword ptr [esi+ecx*4-02h]
    jne L5e5cb
    ror eax, 010h
    cmp eax, dword ptr [esi+ecx*4-02h]
    jne L5e5cb
    mov word ptr [ebp+ecx*4+00h], dx
L5e5cb::
    mov eax, dword ptr [ebx+ecx*4+02h]
    cmp eax, dword ptr [esi+ecx*4+02h]
    jne L5e5e6
    ror eax, 010h
    cmp eax, dword ptr [esi+ecx*4+02h]
    jne L5e5e6
    shr edx, 010h
    mov word ptr [ebp+ecx*4+02h], dx
L5e5e6::
    pop esi
    dec ecx
    jns L5e4a5
    pop ecx
    lea esi, [esi+ecx*8+010h]
    lea edi, [edi+ecx*8+010h]
    lea ebx, [ebx+ecx*8+010h]
    lea ebp, [ebp+ecx*8+010h]
    dec dword ptr [Dc9b08]
    jne L5e4a4
    inc ecx
L5e60c::
    mov eax, dword ptr [esi+ecx*4-02h]
    mov dword ptr [edi+ecx*4-02h], eax
    dec ecx
    jns L5e60c
    pop ebp
    pop edx
    pop ecx
    pop ebx
    pop eax
    pop edi
    pop esi
    leave
    ret
Func5e449_ endp
Func5e620_ proc near
    push ebp
    mov ebp, esp
    push esi
    push edi
    push eax
    push ebx
    push ecx
    push edx
    mov ebx, dword ptr [ebp+08h]
    mov esi, dword ptr [ebp+0ch]
    mov edi, dword ptr [ebp+010h]
    push ebp
    mov ebp, dword ptr [ebx+024h]
    shl ebp, 03h
L5e639::
    mov ecx, dword ptr [ebx+08h]
    shl ecx, 02h
    dec ecx
    push ebx
L5e641::
    mov eax, dword ptr [esi]
    mov edx, dword ptr [esi+02h]
    mov ebx, eax
    and ebx, dword ptr [Dc9cc8]
    and ebx, edx
    and eax, dword ptr [Dc9cc0]
    and edx, dword ptr [Dc9cc0]
    add edx, eax
    rcr edx, 1
    add ebx, edx
    mov eax, dword ptr [esi]
    mov edx, dword ptr [esi+02h]
    ror eax, 010h
    add esi, 04h
    shrd eax, ebx, 010h
    shld edx, ebx, 010h
    ror edx, 010h
    mov dword ptr [edi], eax
    mov dword ptr [edi+04h], edx
    add edi, 08h
    dec ecx
    jne L5e641
    mov eax, dword ptr [esi]
    shld edx, eax, 010h
    shld edx, eax, 010h
    mov dword ptr [edi+04h], edx
    mov ebx, eax
    mov edx, eax
    shl edx, 010h
    mov dx, ax
    and ebx, dword ptr [Dc9cc8]
    and ebx, edx
    and eax, dword ptr [Dc9cc0]
    and edx, dword ptr [Dc9cc0]
    add esi, 04h
    add edx, eax
    rcr edx, 1
    add edx, ebx
    mov dword ptr [edi], edx
    pop ebx
    add edi, 08h
    mov ecx, dword ptr [ebx+08h]
    shl ecx, 04h
    dec ebp
    lea edi, [edi+ecx*2]
    jne L5e639
    pop ebp
    pop edx
    pop ecx
    pop ebx
    pop eax
    pop edi
    pop esi
    leave
    ret
Func5e620_ endp
Func5e6d6_ proc near
    push ebp
    mov ebp, esp
    push esi
    push edi
    push eax
    push ebx
    push ecx
    push edx
    mov ebx, dword ptr [ebp+08h]
    mov esi, dword ptr [ebp+0ch]
    mov edi, dword ptr [ebp+010h]
    push ebp
    mov ebp, offset Dc8a68
    mov eax, dword ptr [ebx+08h]
    shl eax, 02h
    dec eax
    mov dword ptr [Dc9a70], eax
    push ebx
    mov eax, dword ptr [esi]
L5e6fd::
    mov edx, dword ptr [esi+02h]
    mov ebx, eax
    and ebx, dword ptr [Dc9cc8]
    and ebx, edx
    and eax, dword ptr [Dc9cc0]
    and edx, dword ptr [Dc9cc0]
    add edi, 08h
    add ebp, 08h
    add edx, eax
    rcr edx, 1
    mov eax, dword ptr [esi]
    add ebx, edx
    add esi, 04h
    ror eax, 010h
    mov edx, dword ptr [esi-02h]
    shrd eax, ebx, 010h
    shld edx, ebx, 010h
    ror edx, 010h
    mov dword ptr [edi-08h], eax
    mov dword ptr [edi-04h], edx
    mov dword ptr [ebp-08h], eax
    mov dword ptr [ebp-04h], edx
    dec dword ptr [Dc9a70]
    mov eax, dword ptr [esi]
    jne L5e6fd
    mov ebx, eax
    mov edx, eax
    ror edx, 010h
    add esi, 04h
    xchg bx, dx
    mov dword ptr [edi+04h], ebx
    add ebp, 08h
    mov ebx, eax
    add edi, 08h
    and ebx, dword ptr [Dc9cc8]
    and ebx, edx
    and eax, dword ptr [Dc9cc0]
    and edx, dword ptr [Dc9cc0]
    mov ecx, edi
    add edx, eax
    rcr edx, 1
    add edx, ebx
    mov dword ptr [edi-08h], edx
    mov dword ptr [ebp-08h], edx
    pop ebx
    mov eax, dword ptr [ebx+08h]
    shl eax, 04h
    lea edi, [edi+eax*2]
    mov eax, dword ptr [ebx+024h]
    shl eax, 03h
    sub eax, 02h
    mov dword ptr [Dc9a6c], eax
L5e7a0::
    mov ebp, offset Dc8a68
    mov eax, dword ptr [ebx+08h]
    shl eax, 02h
    dec eax
    mov dword ptr [Dc9a70], eax
    push ebx
    mov eax, dword ptr [esi]
    mov edx, dword ptr [esi+02h]
L5e7b7::
    mov ebx, eax
    add esi, 04h
    and ebx, dword ptr [Dc9cc8]
    add edi, 08h
    and ebx, edx
    and eax, dword ptr [Dc9cc0]
    and edx, dword ptr [Dc9cc0]
    add ecx, 08h
    add ebp, 08h
    add edx, eax
    rcr edx, 1
    mov eax, dword ptr [esi-04h]
    add ebx, edx
    ror eax, 010h
    mov edx, dword ptr [esi-02h]
    shrd eax, ebx, 010h
    shld edx, ebx, 010h
    ror edx, 010h
    mov dword ptr [edi-08h], eax
    mov dword ptr [edi-04h], edx
    push edx
    mov edx, dword ptr [ebp-08h]
    mov ebx, eax
    mov dword ptr [ebp-08h], eax
    and ebx, edx
    and ebx, dword ptr [Dc9cc8]
    and edx, dword ptr [Dc9cc0]
    and eax, dword ptr [Dc9cc0]
    add edx, eax
    rcr edx, 1
    add ebx, edx
    mov eax, dword ptr [edi-04h]
    mov dword ptr [ecx-08h], ebx
    mov edx, dword ptr [ebp-04h]
    mov ebx, eax
    and ebx, edx
    and eax, dword ptr [Dc9cc0]
    and edx, dword ptr [Dc9cc0]
    and ebx, dword ptr [Dc9cc8]
    add edx, eax
    rcr edx, 1
    add ebx, edx
    dec dword ptr [Dc9a70]
    mov dword ptr [ecx-04h], ebx
    mov eax, dword ptr [esi]
    pop dword ptr [ebp-04h]
    mov edx, dword ptr [esi+02h]
    jne L5e7b7
    mov eax, dword ptr [esi]
    mov ebx, eax
    mov edx, eax
    ror ebx, 010h
    mov eax, dword ptr [ebp+04h]
    xchg dx, bx
    mov dword ptr [edi+04h], edx
    push ebx
    mov ebx, eax
    mov dword ptr [ebp+04h], edx
    and ebx, dword ptr [Dc9cc8]
    and ebx, edx
    and edx, dword ptr [Dc9cc0]
    and eax, dword ptr [Dc9cc0]
    add edx, eax
    rcr edx, 1
    add ebx, edx
    mov eax, dword ptr [esi]
    mov dword ptr [ecx+04h], ebx
    pop edx
    mov ebx, eax
    and ebx, dword ptr [Dc9cc8]
    and ebx, edx
    and edx, dword ptr [Dc9cc0]
    and eax, dword ptr [Dc9cc0]
    add edx, eax
    rcr edx, 1
    add edx, ebx
    mov dword ptr [edi], edx
    mov eax, dword ptr [ebp+00h]
    mov ebx, eax
    mov dword ptr [ebp+00h], edx
    and ebx, dword ptr [Dc9cc8]
    add ecx, 08h
    and ebx, edx
    add esi, 04h
    and edx, dword ptr [Dc9cc0]
    and eax, dword ptr [Dc9cc0]
    add edx, eax
    rcr edx, 1
    add ebx, edx
    add edi, 08h
    mov dword ptr [ecx-08h], ebx
    pop ebx
    mov ecx, edi
    mov eax, dword ptr [ebx+08h]
    shl eax, 04h
    dec dword ptr [Dc9a6c]
    lea edi, [edi+eax*2]
    jne L5e7a0
    mov eax, dword ptr [ebx+08h]
    shl eax, 02h
    dec eax
    mov dword ptr [Dc9a70], eax
    lea ebp, [edi+eax*8+08h]
    mov eax, dword ptr [esi]
    mov edx, dword ptr [esi+02h]
L5e909::
    mov ebx, eax
    add esi, 04h
    and ebx, dword ptr [Dc9cc8]
    add edi, 08h
    and ebx, edx
    and eax, dword ptr [Dc9cc0]
    and edx, dword ptr [Dc9cc0]
    add ecx, 08h
    add ebp, 08h
    add edx, eax
    rcr edx, 1
    mov eax, dword ptr [esi-04h]
    add ebx, edx
    ror eax, 010h
    mov edx, dword ptr [esi-02h]
    shrd eax, ebx, 010h
    shld edx, ebx, 010h
    ror edx, 010h
    mov dword ptr [edi-08h], eax
    mov dword ptr [edi-04h], edx
    push edx
    mov edx, dword ptr [ebp-08h]
    mov ebx, eax
    mov dword ptr [ebp-08h], eax
    and ebx, edx
    and ebx, dword ptr [Dc9cc8]
    and edx, dword ptr [Dc9cc0]
    and eax, dword ptr [Dc9cc0]
    add edx, eax
    rcr edx, 1
    add ebx, edx
    mov eax, dword ptr [edi-04h]
    mov dword ptr [ecx-08h], ebx
    mov edx, dword ptr [ebp-04h]
    mov ebx, eax
    and ebx, edx
    and eax, dword ptr [Dc9cc0]
    and edx, dword ptr [Dc9cc0]
    and ebx, dword ptr [Dc9cc8]
    add edx, eax
    rcr edx, 1
    add ebx, edx
    dec dword ptr [Dc9a70]
    mov dword ptr [ecx-04h], ebx
    mov eax, dword ptr [esi]
    pop dword ptr [ebp-04h]
    mov edx, dword ptr [esi+02h]
    jne L5e909
    mov eax, dword ptr [esi]
    mov ebx, eax
    mov edx, eax
    ror ebx, 010h
    mov eax, dword ptr [ebp+04h]
    xchg dx, bx
    mov dword ptr [edi+04h], edx
    push ebx
    mov ebx, eax
    mov dword ptr [ebp+04h], edx
    and ebx, dword ptr [Dc9cc8]
    and ebx, edx
    and edx, dword ptr [Dc9cc0]
    and eax, dword ptr [Dc9cc0]
    add edx, eax
    rcr edx, 1
    add ebx, edx
    mov eax, dword ptr [esi]
    mov dword ptr [ecx+04h], ebx
    pop edx
    mov ebx, eax
    and ebx, dword ptr [Dc9cc8]
    and ebx, edx
    and edx, dword ptr [Dc9cc0]
    and eax, dword ptr [Dc9cc0]
    add edx, eax
    rcr edx, 1
    add edx, ebx
    mov dword ptr [edi], edx
    mov eax, dword ptr [ebp+00h]
    mov ebx, eax
    mov dword ptr [ebp+00h], edx
    and ebx, dword ptr [Dc9cc8]
    add ecx, 08h
    and ebx, edx
    add esi, 04h
    and edx, dword ptr [Dc9cc0]
    and eax, dword ptr [Dc9cc0]
    add edx, eax
    rcr edx, 1
    add ebx, edx
    add edi, 08h
    mov dword ptr [ecx-08h], ebx
    pop ebp
    pop edx
    pop ecx
    pop ebx
    pop eax
    pop edi
    pop esi
    leave
    ret
Func5e6d6_ endp
Func5ea37_ proc near
    push ebp
    mov ebp, esp
    push esi
    push edi
    push eax
    push ebx
    push ecx
    push edx
    mov ebx, dword ptr [ebp+08h]
    mov esi, dword ptr [ebp+0ch]
    mov edi, dword ptr [ebp+010h]
    push ebp
    mov ebp, dword ptr [ebx+024h]
    shl ebp, 03h
L5ea50::
    mov ecx, dword ptr [ebx+08h]
    shl ecx, 02h
L5ea56::
    mov edx, dword ptr [esi+ecx*4-010h]
    mov eax, dword ptr [esi+ecx*4-010h]
    ror edx, 010h
    xchg dx, ax
    mov dword ptr [edi+ecx*8-020h], edx
    mov dword ptr [edi+ecx*8-01ch], eax
    mov edx, dword ptr [esi+ecx*4-0ch]
    mov eax, dword ptr [esi+ecx*4-0ch]
    ror edx, 010h
    xchg dx, ax
    mov dword ptr [edi+ecx*8-018h], edx
    mov dword ptr [edi+ecx*8-014h], eax
    mov edx, dword ptr [esi+ecx*4-08h]
    mov eax, dword ptr [esi+ecx*4-08h]
    ror edx, 010h
    xchg dx, ax
    mov dword ptr [edi+ecx*8-010h], edx
    mov dword ptr [edi+ecx*8-0ch], eax
    mov edx, dword ptr [esi+ecx*4-04h]
    mov eax, dword ptr [esi+ecx*4-04h]
    ror edx, 010h
    xchg dx, ax
    mov dword ptr [edi+ecx*8-08h], edx
    mov dword ptr [edi+ecx*8-04h], eax
    sub ecx, 04h
    jne L5ea56
    mov ecx, dword ptr [ebx+08h]
    shl ecx, 04h
    add esi, ecx
    dec ebp
    lea edi, [edi+ecx*4]
    jne L5ea50
    pop ebp
    pop edx
    pop ecx
    pop ebx
    pop eax
    pop edi
    pop esi
    leave
    ret
Func5ea37_ endp
Func5eac6_ proc near
    push ebp
    mov ebp, esp
    add esp, 0ffffffdch
    push esi
    push edi
    push eax
    push ebx
    push ecx
    push edx
    mov ebx, dword ptr [ebp+08h]
    test dword ptr [ebx+0ch], 08h
    jne L5f0a3
    mov eax, dword ptr [ebp+018h]
    and eax, 07h
    mov dword ptr [ebp-01ch], eax
    mov eax, dword ptr [ebp+014h]
    and eax, 07h
    mov dword ptr [ebp-018h], eax
    sar dword ptr [ebp+014h], 03h
    sar dword ptr [ebp+018h], 03h
    mov edx, dword ptr [ebp+01ch]
    mov ebx, dword ptr [ebp+020h]
    shr edx, 03h
    shr ebx, 03h
    mov dword ptr [ebp+01ch], edx
    mov dword ptr [ebp+020h], ebx
    lea ecx, [edx*8+00h]
    mov dword ptr [ebp-020h], ecx
    add ecx, ecx
    mov dword ptr [Dc9c3c], ecx
    add ecx, ecx
    mov dword ptr [ebp-024h], ecx
    mov edi, dword ptr [ebp+0ch]
    imul edx, ebx
    shl edx, 06h
    lea esi, [edx+edi*1-08h]
    mov edx, dword ptr [ebp+01ch]
    inc edx
    inc ebx
    mov ecx, 08h
    sub ecx, dword ptr [ebp-01ch]
    imul ecx, edx
    imul edx, ebx
    shl edx, 06h
    lea edi, [edx+edi*1-08h]
L5eb4c::
    mov dword ptr [edi], 00h
    mov dword ptr [edi+04h], 00h
    sub edi, 08h
    dec ecx
    jne L5eb4c
    add edi, dword ptr [ebp-018h]
    lea ebx, [ebx*8-08h]
    xor ecx, ecx
    mov dword ptr [ebp-04h], ebx
L5eb6e::
    mov dword ptr [edi], 00h
    mov edx, dword ptr [ebp+01ch]
    mov dword ptr [edi+04h], 00h
    lea ebx, [edx*8+00h]
    sub edi, 08h
    sub esi, ebx
    sub edi, ebx
L5eb8c::
    mov eax, dword ptr [esi+edx*8]
    mov ebx, dword ptr [esi+edx*8+04h]
    mov dword ptr [edi+edx*8], eax
    mov dword ptr [edi+edx*8+04h], ebx
    and eax, 0c0c0c0c0h
    and ebx, 0c0c0c0c0h
    xor eax, 080808080h
    xor ebx, 080808080h
    test al, 0c0h
    jne L5ebb6
    mov cl, 01h
L5ebb6::
    test ah, 0c0h
    jne L5ebbf
    mov cl, 01h
    jmp L5ec39
L5ebbf::
    test eax, 0c00000h
    jne L5ebca
    mov cl, 01h
    jmp L5ec39
L5ebca::
    test eax, 0c0000000h
    jne L5ebd5
    mov cl, 01h
    jmp L5ec39
L5ebd5::
    test bl, 0c0h
    jne L5ebde
    mov cl, 01h
    jmp L5ec39
L5ebde::
    test bh, 0c0h
    jne L5ebe7
    mov cl, 01h
    jmp L5ec39
L5ebe7::
    test ebx, 0c00000h
    jne L5ebf3
    mov cl, 01h
    jmp L5ec39
L5ebf3::
    test ebx, 0c0000000h
    jne L5ebff
    mov cl, 01h
    jmp L5ec39
L5ebff::
    dec edx
    jne L5eb8c
    dec dword ptr [ebp-04h]
    jne L5eb6e
    jmp L5ec41
L5ec0d::
    mov dword ptr [edi], 00h
    mov edx, dword ptr [ebp+01ch]
    mov dword ptr [edi+04h], 00h
    lea ebx, [edx*8+00h]
    sub edi, 08h
    sub esi, ebx
    sub edi, ebx
L5ec2b::
    mov eax, dword ptr [esi+edx*8]
    mov ebx, dword ptr [esi+edx*8+04h]
    mov dword ptr [edi+edx*8], eax
    mov dword ptr [edi+edx*8+04h], ebx
L5ec39::
    dec edx
    jne L5ec2b
    dec dword ptr [ebp-04h]
    jne L5ec0d
L5ec41::
    mov eax, dword ptr [ebp+08h]
    mov dword ptr [eax+02ch], ecx
    mov edx, dword ptr [ebp-01ch]
    or edx, edx
    je L5ec72
    mov ecx, dword ptr [ebp+01ch]
    inc ecx
    imul ecx, edx
    lea ecx, [ecx*8+00h]
    sub edi, ecx
L5ec5e::
    mov dword ptr [ecx+edi*1], 00h
    mov dword ptr [ecx+edi*1+04h], 00h
    sub ecx, 08h
    jne L5ec5e
L5ec72::
    mov ecx, dword ptr [ebp-018h]
    sub edi, ecx
    dec ecx
    js L5ec82
L5ec7a::
    mov byte ptr [ecx+edi*1+08h], 00h
    dec ecx
    jns L5ec7a
L5ec82::
    mov edx, dword ptr [ebp+01ch]
    mov ebx, dword ptr [ebp+020h]
    inc edx
    inc ebx
    mov dword ptr [ebp+01ch], edx
    mov dword ptr [ebp+020h], ebx
    shl edx, 06h
    mov dword ptr [ebp-010h], edx
    mov esi, edx
    dec ebx
    imul esi, ebx
    add esi, dword ptr [ebp+0ch]
    lea edi, [edx+esi*1]
    mov ebx, dword ptr [ebp+01ch]
    shl ebx, 03h
    mov eax, dword ptr [ebp+020h]
    mov dword ptr [ebp-04h], eax
L5ecae::
    mov eax, dword ptr [ebp+01ch]
    mov dword ptr [ebp-08h], eax
L5ecb4::
    mov dword ptr [ebp-0ch], 04h
L5ecbb::
    mov ecx, dword ptr [ebx+esi*1]
    mov eax, dword ptr [esi]
    ror ecx, 010h
    xchg cx, ax
    ror eax, 010h
    mov dword ptr [edi], ecx
    mov dword ptr [edi+04h], eax
    mov ecx, dword ptr [ebx+esi*1+04h]
    mov eax, dword ptr [esi+04h]
    ror ecx, 010h
    xchg cx, ax
    ror eax, 010h
    mov dword ptr [edi+08h], ecx
    mov dword ptr [edi+0ch], eax
    add edi, 010h
    lea esi, [esi+ebx*2]
    dec dword ptr [ebp-0ch]
    jne L5ecbb
    sub esi, edx
    add esi, 08h
    dec dword ptr [ebp-08h]
    jne L5ecb4
    sub esi, edx
    sub edi, edx
    sub esi, ebx
    sub edi, edx
    dec dword ptr [ebp-04h]
    jne L5ecae
    mov ecx, dword ptr [ebp+08h]
    mov edi, dword ptr [ebp+01ch]
    mov eax, dword ptr [ebp-01ch]
    dec edi
    imul eax, dword ptr [ebp+01ch]
    shl edi, 06h
    lea eax, [eax*8+00h]
    add edi, edi
    add eax, dword ptr [ebp-018h]
    mov dword ptr [ecx+028h], edi
    mov dword ptr [ecx+010h], eax
    mov ebx, dword ptr [ecx+08h]
    mov eax, dword ptr [ebp+020h]
    shl ebx, 04h
    mov dword ptr [ecx+01ch], eax
    mov dword ptr [Dc9aa4], ebx
    inc eax
    mov ebx, dword ptr [ebp+01ch]
    mul ebx
    shl eax, 06h
    mov dword ptr [ecx+020h], ebx
    mov dword ptr [ecx+018h], eax
    mov dword ptr [ebp-014h], eax
    mov eax, dword ptr [ecx]
    mov ebx, dword ptr [ebp+0ch]
    imul eax, dword ptr [ecx+04h]
    lea eax, [eax+eax*4]
    lea eax, [ecx+eax*4]
    mov dword ptr [Dc9a84], eax
L5ed5f::
    mov edi, dword ptr [ecx+034h]
    or edi, edi
    js L5f08f
    and edi, 03fffffffh
    mov dword ptr [ecx+034h], edi
    push edx
    mov eax, dword ptr [ecx+044h]
    mov edx, dword ptr [ecx+040h]
    sub eax, dword ptr [ebp+018h]
    jl L5f08c
    cmp eax, dword ptr [ebp+020h]
    jge L5f08c
    sub edx, dword ptr [ebp+014h]
    jl L5f08c
    cmp edx, dword ptr [ebp+01ch]
    jge L5f08c
    push edx
    push eax
    lea ebx, [eax*8+00h]
    lea esi, [edx*8+00h]
    sub ebx, dword ptr [ebp-01ch]
    sub esi, dword ptr [ebp-018h]
    imul ebx, dword ptr [ebp-020h]
    add ebx, esi
    add ebx, ebx
    add ebx, dword ptr [ebp+024h]
    mov dword ptr [Dc9c30], ebx
    imul eax, dword ptr [ebp+01ch]
    add edx, eax
    mov esi, dword ptr [ebp+0ch]
    shl edx, 06h
    add edi, dword ptr [ebp+010h]
    lea eax, [edx*2+00h]
    add edx, dword ptr [ebp-010h]
    mov dword ptr [ecx+03ch], eax
    mov dword ptr [ecx+038h], edx
    add esi, eax
    add edx, dword ptr [ebp+0ch]
    add esi, dword ptr [ebp-014h]
    mov eax, dword ptr [Dc9aa4]
    mov ebx, dword ptr [edi]
    test dword ptr [edx], 04040h
    mov dword ptr [esi], ebx
    jne L6838a
L5ee01::
    mov ebx, dword ptr [eax+edi*1]
    test dword ptr [edx], 040400000h
    mov dword ptr [esi+04h], ebx
    jne L6846a
L5ee13::
    mov ebx, dword ptr [edi+04h]
    test dword ptr [edx+04h], 04040h
    mov dword ptr [esi+08h], ebx
    jne L68567
L5ee26::
    mov ebx, dword ptr [eax+edi*1+04h]
    test dword ptr [edx+04h], 040400000h
    mov dword ptr [esi+0ch], ebx
    jne L68652
L5ee3a::
    mov ebx, dword ptr [edi+08h]
    test dword ptr [edx+08h], 04040h
    mov dword ptr [esi+010h], ebx
    jne L68756
L5ee4d::
    mov ebx, dword ptr [eax+edi*1+08h]
    test dword ptr [edx+08h], 040400000h
    mov dword ptr [esi+014h], ebx
    jne L68841
L5ee61::
    mov ebx, dword ptr [edi+0ch]
    test dword ptr [edx+0ch], 04040h
    mov dword ptr [esi+018h], ebx
    jne L68945
L5ee74::
    mov ebx, dword ptr [eax+edi*1+0ch]
    test dword ptr [edx+0ch], 040400000h
    mov dword ptr [esi+01ch], ebx
    jne L68a30
L5ee88::
    mov ebx, dword ptr [ebp-024h]
    lea edi, [edi+eax*2]
    add dword ptr [Dc9c30], ebx
    mov ebx, dword ptr [edi]
    test dword ptr [edx+010h], 04040h
    mov dword ptr [esi+020h], ebx
    jne L68b34
L5eea6::
    mov ebx, dword ptr [eax+edi*1]
    test dword ptr [edx+010h], 040400000h
    mov dword ptr [esi+024h], ebx
    jne L68c18
L5eeb9::
    mov ebx, dword ptr [edi+04h]
    test dword ptr [edx+014h], 04040h
    mov dword ptr [esi+028h], ebx
    jne L68d15
L5eecc::
    mov ebx, dword ptr [eax+edi*1+04h]
    test dword ptr [edx+014h], 040400000h
    mov dword ptr [esi+02ch], ebx
    jne L68e00
L5eee0::
    mov ebx, dword ptr [edi+08h]
    test dword ptr [edx+018h], 04040h
    mov dword ptr [esi+030h], ebx
    jne L68f04
L5eef3::
    mov ebx, dword ptr [eax+edi*1+08h]
    test dword ptr [edx+018h], 040400000h
    mov dword ptr [esi+034h], ebx
    jne L68fef
L5ef07::
    mov ebx, dword ptr [edi+0ch]
    test dword ptr [edx+01ch], 04040h
    mov dword ptr [esi+038h], ebx
    jne L690f3
L5ef1a::
    mov ebx, dword ptr [eax+edi*1+0ch]
    test dword ptr [edx+01ch], 040400000h
    mov dword ptr [esi+03ch], ebx
    jne L691de
L5ef2e::
    mov ebx, dword ptr [ebp-024h]
    lea edi, [edi+eax*2]
    add dword ptr [Dc9c30], ebx
    mov ebx, dword ptr [edi]
    test dword ptr [edx+020h], 04040h
    mov dword ptr [esi+040h], ebx
    jne L692e2
L5ef4c::
    mov ebx, dword ptr [eax+edi*1]
    test dword ptr [edx+020h], 040400000h
    mov dword ptr [esi+044h], ebx
    jne L693c6
L5ef5f::
    mov ebx, dword ptr [edi+04h]
    test dword ptr [edx+024h], 04040h
    mov dword ptr [esi+048h], ebx
    jne L694c3
L5ef72::
    mov ebx, dword ptr [eax+edi*1+04h]
    test dword ptr [edx+024h], 040400000h
    mov dword ptr [esi+04ch], ebx
    jne L695ae
L5ef86::
    mov ebx, dword ptr [edi+08h]
    test dword ptr [edx+028h], 04040h
    mov dword ptr [esi+050h], ebx
    jne L696b2
L5ef99::
    mov ebx, dword ptr [eax+edi*1+08h]
    test dword ptr [edx+028h], 040400000h
    mov dword ptr [esi+054h], ebx
    jne L6979d
L5efad::
    mov ebx, dword ptr [edi+0ch]
    test dword ptr [edx+02ch], 04040h
    mov dword ptr [esi+058h], ebx
    jne L698a1
L5efc0::
    mov ebx, dword ptr [eax+edi*1+0ch]
    test dword ptr [edx+02ch], 040400000h
    mov dword ptr [esi+05ch], ebx
    jne L6998c
L5efd4::
    mov ebx, dword ptr [ebp-024h]
    lea edi, [edi+eax*2]
    add dword ptr [Dc9c30], ebx
    mov ebx, dword ptr [edi]
    test dword ptr [edx+030h], 04040h
    mov dword ptr [esi+060h], ebx
    jne L69a90
L5eff2::
    mov ebx, dword ptr [eax+edi*1]
    test dword ptr [edx+030h], 040400000h
    mov dword ptr [esi+064h], ebx
    jne L69b74
L5f005::
    mov ebx, dword ptr [edi+04h]
    test dword ptr [edx+034h], 04040h
    mov dword ptr [esi+068h], ebx
    jne L69c71
L5f018::
    mov ebx, dword ptr [eax+edi*1+04h]
    test dword ptr [edx+034h], 040400000h
    mov dword ptr [esi+06ch], ebx
    jne L69d5c
L5f02c::
    mov ebx, dword ptr [edi+08h]
    test dword ptr [edx+038h], 04040h
    mov dword ptr [esi+070h], ebx
    jne L69e60
L5f03f::
    mov ebx, dword ptr [eax+edi*1+08h]
    test dword ptr [edx+038h], 040400000h
    mov dword ptr [esi+074h], ebx
    jne L69f4b
L5f053::
    mov ebx, dword ptr [edi+0ch]
    test dword ptr [edx+03ch], 04040h
    mov dword ptr [esi+078h], ebx
    jne L6a04f
L5f066::
    mov ebx, dword ptr [eax+edi*1+0ch]
    test dword ptr [edx+03ch], 040400000h
    mov dword ptr [esi+07ch], ebx
    jne L6a13a
L5f07a::
    mov ebx, dword ptr [ebp-024h]
    lea edi, [edi+eax*2]
    add dword ptr [Dc9c30], ebx
    pop eax
    pop edx
    or byte ptr [ecx+037h], 040h
L5f08c::
    pop edx
    jmp L5f094
L5f08f::
    cmp edi, 0fffffffeh
    je L5f0a3
L5f094::
    add ecx, 014h
    cmp ecx, dword ptr [Dc9a84]
    jne L5ed5f
L5f0a3::
    pop edx
    pop ecx
    pop ebx
    pop eax
    pop edi
    pop esi
    leave
    ret
Func5eac6_ endp
Func5f0ab_ proc near
    push ebp
    mov ebp, esp
    add esp, 0fffffff0h
    push esi
    push edi
    push eax
    push ebx
    push ecx
    push edx
    mov ecx, dword ptr [ebp+08h]
    test dword ptr [ecx+0ch], 08h
    jne L5f2c6
    mov ebx, dword ptr [ecx+01ch]
    mov edx, dword ptr [ecx+020h]
    mov dword ptr [ebp-08h], ebx
    mov dword ptr [ebp-04h], edx
    shl edx, 06h
    mov esi, dword ptr [ebp+0ch]
    lea edi, [edx+esi*1]
    mov ebx, dword ptr [ebp-04h]
    mov dword ptr [ecx+02ch], 00h
    shl ebx, 03h
L5f0e9::
    mov eax, dword ptr [ebp-04h]
    mov dword ptr [ebp-0ch], eax
L5f0ef::
    mov dword ptr [ebp-010h], 04h
L5f0f6::
    mov eax, dword ptr [edi]
    mov ecx, dword ptr [edi+04h]
    ror ecx, 010h
    xchg cx, ax
    ror eax, 010h
    mov dword ptr [esi], ecx
    mov dword ptr [ebx+esi*1], eax
    mov eax, dword ptr [edi+08h]
    mov ecx, dword ptr [edi+0ch]
    ror ecx, 010h
    xchg cx, ax
    ror eax, 010h
    mov dword ptr [esi+04h], ecx
    mov dword ptr [ebx+esi*1+04h], eax
    add edi, 010h
    lea esi, [esi+ebx*2]
    dec dword ptr [ebp-010h]
    jne L5f0f6
    sub esi, edx
    add esi, 08h
    dec dword ptr [ebp-0ch]
    jne L5f0ef
    add esi, edx
    sub esi, ebx
    dec dword ptr [ebp-08h]
    jne L5f0e9
    mov ecx, dword ptr [ebp+08h]
    mov ebx, dword ptr [ecx+01ch]
    mov edx, dword ptr [ecx+020h]
    lea ebx, [ebx*8-08h]
    dec edx
    mov dword ptr [ebp-08h], ebx
    mov dword ptr [ebp-04h], edx
    mov esi, dword ptr [ebp+0ch]
    mov edi, esi
    add esi, dword ptr [ecx+010h]
L5f15a::
    mov ecx, dword ptr [ebp-04h]
    mov eax, ecx
    lea esi, [esi+ecx*8]
    lea edi, [edi+ecx*8]
    neg ecx
L5f167::
    mov ebx, dword ptr [esi+ecx*8]
    mov edx, dword ptr [esi+ecx*8+04h]
    mov dword ptr [edi+ecx*8], ebx
    mov dword ptr [edi+ecx*8+04h], edx
    inc ecx
    jne L5f167
    add esi, 08h
    dec dword ptr [ebp-08h]
    jne L5f15a
    mov edx, dword ptr [ebp+08h]
    mov ebx, dword ptr [edx+08h]
    mov eax, dword ptr [edx]
    shl ebx, 04h
    imul eax, dword ptr [edx+04h]
    mov dword ptr [Dc9aa4], ebx
    lea eax, [eax+eax*4]
    xor edi, edi
    lea eax, [eax*4+00h]
    mov esi, dword ptr [Dc9aa4]
    mov ebx, dword ptr [ebp+0ch]
    mov dword ptr [Dc9a84], eax
L5f1af::
    or edi, dword ptr [edx+ecx*1+034h]
    js L5f2b0
    cmp edi, 040000000h
    jl L5f2b5
    and edi, 03fffffffh
    mov ebx, dword ptr [edx+ecx*1+03ch]
    mov dword ptr [edx+ecx*1+034h], edi
    add ebx, dword ptr [edx+018h]
    add edi, dword ptr [ebp+010h]
    add ebx, dword ptr [ebp+0ch]
    push edx
    mov eax, dword ptr [ebx]
    mov edx, dword ptr [ebx+04h]
    mov dword ptr [edi], eax
    mov dword ptr [esi+edi*1], edx
    mov eax, dword ptr [ebx+08h]
    mov edx, dword ptr [ebx+0ch]
    mov dword ptr [edi+04h], eax
    mov dword ptr [esi+edi*1+04h], edx
    mov eax, dword ptr [ebx+010h]
    mov edx, dword ptr [ebx+014h]
    mov dword ptr [edi+08h], eax
    mov dword ptr [esi+edi*1+08h], edx
    mov eax, dword ptr [ebx+018h]
    mov edx, dword ptr [ebx+01ch]
    mov dword ptr [edi+0ch], eax
    mov dword ptr [esi+edi*1+0ch], edx
    lea edi, [edi+esi*2]
    mov eax, dword ptr [ebx+020h]
    mov edx, dword ptr [ebx+024h]
    mov dword ptr [edi], eax
    mov dword ptr [esi+edi*1], edx
    mov eax, dword ptr [ebx+028h]
    mov edx, dword ptr [ebx+02ch]
    mov dword ptr [edi+04h], eax
    mov dword ptr [esi+edi*1+04h], edx
    mov eax, dword ptr [ebx+030h]
    mov edx, dword ptr [ebx+034h]
    mov dword ptr [edi+08h], eax
    mov dword ptr [esi+edi*1+08h], edx
    mov eax, dword ptr [ebx+038h]
    mov edx, dword ptr [ebx+03ch]
    mov dword ptr [edi+0ch], eax
    mov dword ptr [esi+edi*1+0ch], edx
    lea edi, [edi+esi*2]
    mov eax, dword ptr [ebx+040h]
    mov edx, dword ptr [ebx+044h]
    mov dword ptr [edi], eax
    mov dword ptr [esi+edi*1], edx
    mov eax, dword ptr [ebx+048h]
    mov edx, dword ptr [ebx+04ch]
    mov dword ptr [edi+04h], eax
    mov dword ptr [esi+edi*1+04h], edx
    mov eax, dword ptr [ebx+050h]
    mov edx, dword ptr [ebx+054h]
    mov dword ptr [edi+08h], eax
    mov dword ptr [esi+edi*1+08h], edx
    mov eax, dword ptr [ebx+058h]
    mov edx, dword ptr [ebx+05ch]
    mov dword ptr [edi+0ch], eax
    mov dword ptr [esi+edi*1+0ch], edx
    lea edi, [edi+esi*2]
    mov eax, dword ptr [ebx+060h]
    mov edx, dword ptr [ebx+064h]
    mov dword ptr [edi], eax
    mov dword ptr [esi+edi*1], edx
    mov eax, dword ptr [ebx+068h]
    mov edx, dword ptr [ebx+06ch]
    mov dword ptr [edi+04h], eax
    mov dword ptr [esi+edi*1+04h], edx
    mov eax, dword ptr [ebx+070h]
    mov edx, dword ptr [ebx+074h]
    mov dword ptr [edi+08h], eax
    mov dword ptr [esi+edi*1+08h], edx
    mov eax, dword ptr [ebx+078h]
    mov edx, dword ptr [ebx+07ch]
    mov dword ptr [edi+0ch], eax
    mov dword ptr [esi+edi*1+0ch], edx
    pop edx
    jmp L5f2b5
L5f2b0::
    cmp edi, 0fffffffeh
    je L5f2c6
L5f2b5::
    add ecx, 014h
    xor edi, edi
    cmp ecx, dword ptr [Dc9a84]
    jne L5f1af
L5f2c6::
    pop edx
    pop ecx
    pop ebx
    pop eax
    pop edi
    pop esi
    leave
    ret
Func5f0ab_ endp
decode_info_size proc near
    push ebp
    mov ebp, esp
    push ebx
    push ecx
    push edx
    mov eax, dword ptr [ebp+08h]
    mov edx, dword ptr [ebp+0ch]
    add eax, 07h
    add edx, 07h
    and al, 0f8h
    and dl, 0f8h
    mov ebx, dword ptr [ebp+010h]
    mov ecx, dword ptr [ebp+014h]
    mov dword ptr [ebx], eax
    mov dword ptr [ecx], edx
    imul edx
    mov ebx, eax
    shrd eax, edx, 02h
    shrd ebx, edx, 04h
    add eax, ebx
    add eax, 034h
    pop edx
    pop ecx
    pop ebx
    leave
    ret
decode_info_size endp
frame_buffer_size proc near
    push ebp
    mov ebp, esp
    push edi
    push ebx
    push ecx
    push edx
    mov eax, dword ptr [ebp+08h]
    mov edx, dword ptr [ebp+0ch]
    add eax, 07h
    add edx, 07h
    and al, 0f8h
    and dl, 0f8h
    mov edi, dword ptr [ebp+010h]
    mov ebx, dword ptr [ebp+014h]
    mov dword ptr [edi], eax
    mov dword ptr [ebx], edx
    add eax, 08h
    add edx, 08h
    lea ebx, [eax+eax*2]
    imul edx, ebx
    lea eax, [edx+eax*8]
    pop edx
    pop ecx
    pop ebx
    pop edi
    leave
    ret
frame_buffer_size endp
Func5f33c_ proc near
    ret
Func5f33c_ endp
Func5f33d_ proc near
    push edx
    push eax
    push edi
    mov eax, ebx
    mov ecx, esi
    mov edx, ebx
    mov edi, esi
    and eax, dword ptr [Dc9c18]
    and edx, dword ptr [Dc9c10]
    and ebx, dword ptr [Dc9c14]
    and ecx, dword ptr [Dc9c18]
    and edi, dword ptr [Dc9c10]
    and esi, dword ptr [Dc9c14]
    sub eax, ecx
    shl ecx, 05h
    sub edx, edi
    shl edi, 05h
    sub ebx, esi
    shl esi, 05h
    add ecx, eax
    add edi, edx
    add esi, ebx
    and ecx, dword ptr [Dc9c24]
    and edi, dword ptr [Dc9c1c]
    and esi, dword ptr [Dc9c20]
    or ecx, edi
    or esi, ecx
    pop edi
    shr esi, 05h
    pop eax
    pop edx
    ret
Func5f33d_ endp
Func5f39e_ proc near
    push edx
    push eax
    push edi
    mov eax, ebx
    mov ecx, esi
    mov edx, ebx
    mov edi, esi
    and eax, dword ptr [Dc9c18]
    and edx, dword ptr [Dc9c10]
    and ebx, dword ptr [Dc9c14]
    and ecx, dword ptr [Dc9c18]
    and edi, dword ptr [Dc9c10]
    and esi, dword ptr [Dc9c14]
    sub eax, ecx
    shl ecx, 05h
    sub edx, edi
    shl edi, 05h
    sub ebx, esi
    shl esi, 05h
    lea ecx, [ecx+eax*2]
    lea edi, [edi+edx*2]
    lea esi, [esi+ebx*2]
    and ecx, dword ptr [Dc9c24]
    and edi, dword ptr [Dc9c1c]
    and esi, dword ptr [Dc9c20]
    or ecx, edi
    or esi, ecx
    pop edi
    shr esi, 05h
    pop eax
    pop edx
    ret
Func5f39e_ endp
Func5f402_ proc near
    push edx
    push eax
    push edi
    mov eax, ebx
    mov ecx, esi
    mov edx, ebx
    mov edi, esi
    and eax, dword ptr [Dc9c18]
    and edx, dword ptr [Dc9c10]
    and ebx, dword ptr [Dc9c14]
    and ecx, dword ptr [Dc9c18]
    and edi, dword ptr [Dc9c10]
    and esi, dword ptr [Dc9c14]
    sub eax, ecx
    sub edx, edi
    sub ebx, esi
    shl ecx, 05h
    lea eax, [eax+eax*2]
    shl edi, 05h
    lea edx, [edx+edx*2]
    shl esi, 05h
    add ecx, eax
    lea ebx, [ebx+ebx*2]
    add edi, edx
    add esi, ebx
    and ecx, dword ptr [Dc9c24]
    and edi, dword ptr [Dc9c1c]
    and esi, dword ptr [Dc9c20]
    or ecx, edi
    pop edi
    or esi, ecx
    pop eax
    shr esi, 05h
    pop edx
    ret
Func5f402_ endp
Func5f46c_ proc near
    push edx
    push eax
    push edi
    mov eax, ebx
    mov ecx, esi
    mov edx, ebx
    mov edi, esi
    and eax, dword ptr [Dc9c18]
    and edx, dword ptr [Dc9c10]
    and ebx, dword ptr [Dc9c14]
    and ecx, dword ptr [Dc9c18]
    and edi, dword ptr [Dc9c10]
    and esi, dword ptr [Dc9c14]
    sub eax, ecx
    shl ecx, 05h
    sub edx, edi
    shl edi, 05h
    sub ebx, esi
    shl esi, 05h
    lea ecx, [ecx+eax*4]
    lea edi, [edi+edx*4]
    lea esi, [esi+ebx*4]
    and ecx, dword ptr [Dc9c24]
    and edi, dword ptr [Dc9c1c]
    and esi, dword ptr [Dc9c20]
    or ecx, edi
    pop edi
    or esi, ecx
    shr esi, 05h
    pop eax
    pop edx
    ret
Func5f46c_ endp
Func5f4d0_ proc near
    push edx
    push eax
    push edi
    mov eax, ebx
    mov ecx, esi
    mov edx, ebx
    mov edi, esi
    and eax, dword ptr [Dc9c18]
    and edx, dword ptr [Dc9c10]
    and ebx, dword ptr [Dc9c14]
    and ecx, dword ptr [Dc9c18]
    and edi, dword ptr [Dc9c10]
    and esi, dword ptr [Dc9c14]
    lea ecx, [ecx+ecx*2]
    lea edi, [edi+edi*2]
    lea esi, [esi+esi*2]
    lea ecx, [ecx+ecx*8]
    lea edi, [edi+edi*8]
    lea esi, [esi+esi*8]
    lea eax, [eax+eax*4]
    lea edx, [edx+edx*4]
    lea ebx, [ebx+ebx*4]
    add ecx, eax
    add edi, edx
    add esi, ebx
    and ecx, dword ptr [Dc9c24]
    and edi, dword ptr [Dc9c1c]
    and esi, dword ptr [Dc9c20]
    or ecx, edi
    pop edi
    or esi, ecx
    pop eax
    shr esi, 05h
    pop edx
    ret
Func5f4d0_ endp
Func5f53d_ proc near
    push edx
    push eax
    push edi
    mov eax, ebx
    mov ecx, esi
    mov edx, ebx
    mov edi, esi
    and eax, dword ptr [Dc9c18]
    and edx, dword ptr [Dc9c10]
    and ebx, dword ptr [Dc9c14]
    and ecx, dword ptr [Dc9c18]
    and edi, dword ptr [Dc9c10]
    and esi, dword ptr [Dc9c14]
    sub eax, ecx
    sub edx, edi
    sub ebx, esi
    shl ecx, 05h
    lea eax, [eax+eax*2]
    shl edi, 05h
    lea edx, [edx+edx*2]
    shl esi, 05h
    lea ebx, [ebx+ebx*2]
    lea ecx, [ecx+eax*2]
    lea edi, [edi+edx*2]
    lea esi, [esi+ebx*2]
    and ecx, dword ptr [Dc9c24]
    and edi, dword ptr [Dc9c1c]
    and esi, dword ptr [Dc9c20]
    or ecx, edi
    pop edi
    or esi, ecx
    pop eax
    shr esi, 05h
    pop edx
    ret
Func5f53d_ endp
Func5f5aa_ proc near
    push edx
    push eax
    push edi
    mov eax, ebx
    mov ecx, esi
    mov edx, ebx
    mov edi, esi
    and eax, dword ptr [Dc9c18]
    and edx, dword ptr [Dc9c10]
    and ebx, dword ptr [Dc9c14]
    and ecx, dword ptr [Dc9c18]
    and edi, dword ptr [Dc9c10]
    and esi, dword ptr [Dc9c14]
    sub eax, ecx
    shl ecx, 05h
    sub edx, edi
    shl edi, 05h
    sub ebx, esi
    shl esi, 05h
    sub ecx, eax
    sub edi, edx
    sub esi, ebx
    lea ecx, [ecx+eax*8]
    lea edi, [edi+edx*8]
    lea esi, [esi+ebx*8]
    and ecx, dword ptr [Dc9c24]
    and edi, dword ptr [Dc9c1c]
    and esi, dword ptr [Dc9c20]
    or ecx, edi
    pop edi
    or esi, ecx
    pop eax
    shr esi, 05h
    pop edx
    ret
Func5f5aa_ endp
Func5f614_ proc near
    push edx
    push eax
    push edi
    mov eax, ebx
    mov ecx, esi
    mov edx, ebx
    mov edi, esi
    and eax, dword ptr [Dc9c18]
    and edx, dword ptr [Dc9c10]
    and ebx, dword ptr [Dc9c14]
    and ecx, dword ptr [Dc9c18]
    and edi, dword ptr [Dc9c10]
    and esi, dword ptr [Dc9c14]
    lea ecx, [ecx+ecx*2]
    lea edi, [edi+edi*2]
    lea esi, [esi+esi*2]
    add ecx, eax
    add edi, edx
    add esi, ebx
    lea ecx, [ecx*8+00h]
    lea edi, [edi*8+00h]
    lea esi, [esi*8+00h]
    and ecx, dword ptr [Dc9c24]
    and edi, dword ptr [Dc9c1c]
    and esi, dword ptr [Dc9c20]
    or ecx, edi
    pop edi
    or esi, ecx
    pop eax
    pop edx
    shr esi, 05h
    ret
Func5f614_ endp
Func5f684_ proc near
    push edx
    push eax
    push edi
    mov eax, ebx
    mov ecx, esi
    mov edx, ebx
    mov edi, esi
    and eax, dword ptr [Dc9c18]
    and edx, dword ptr [Dc9c10]
    and ebx, dword ptr [Dc9c14]
    and ecx, dword ptr [Dc9c18]
    and edi, dword ptr [Dc9c10]
    and esi, dword ptr [Dc9c14]
    sub eax, ecx
    sub edx, edi
    sub ebx, esi
    shl ecx, 05h
    lea eax, [eax+eax*8]
    shl edi, 05h
    lea edx, [edx+edx*8]
    shl esi, 05h
    lea ebx, [ebx+ebx*8]
    add ecx, eax
    add edi, edx
    add esi, ebx
    and ecx, dword ptr [Dc9c24]
    and edi, dword ptr [Dc9c1c]
    and esi, dword ptr [Dc9c20]
    or ecx, edi
    pop edi
    or esi, ecx
    pop eax
    shr esi, 05h
    pop edx
    ret
Func5f684_ endp
Func5f6ee_ proc near
    push edx
    push eax
    push edi
    mov eax, ebx
    mov ecx, esi
    mov edx, ebx
    mov edi, esi
    and eax, dword ptr [Dc9c18]
    and edx, dword ptr [Dc9c10]
    and ebx, dword ptr [Dc9c14]
    and ecx, dword ptr [Dc9c18]
    and edi, dword ptr [Dc9c10]
    and esi, dword ptr [Dc9c14]
    sub eax, ecx
    sub edx, edi
    sub ebx, esi
    shl ecx, 05h
    lea eax, [eax+eax*4]
    shl edi, 05h
    lea edx, [edx+edx*4]
    shl esi, 05h
    lea ebx, [ebx+ebx*4]
    lea ecx, [ecx+eax*2]
    lea edi, [edi+edx*2]
    lea esi, [esi+ebx*2]
    and ecx, dword ptr [Dc9c24]
    and edi, dword ptr [Dc9c1c]
    and esi, dword ptr [Dc9c20]
    or ecx, edi
    pop edi
    or esi, ecx
    pop eax
    shr esi, 05h
    pop edx
    ret
Func5f6ee_ endp
Func5f75b_ proc near
    push edx
    push eax
    push edi
    mov eax, ebx
    mov ecx, esi
    mov edx, ebx
    mov edi, esi
    and eax, dword ptr [Dc9c18]
    and edx, dword ptr [Dc9c10]
    and ebx, dword ptr [Dc9c14]
    and ecx, dword ptr [Dc9c18]
    and edi, dword ptr [Dc9c10]
    and esi, dword ptr [Dc9c14]
    sub eax, ecx
    sub ebx, esi
    sub edx, edi
    lea ecx, [eax+ecx*4]
    lea edi, [edx+edi*4]
    lea esi, [ebx+esi*4]
    lea ecx, [eax+ecx*4]
    lea edi, [edx+edi*4]
    lea esi, [ebx+esi*4]
    lea ecx, [eax+ecx*2]
    lea edi, [edx+edi*2]
    lea esi, [ebx+esi*2]
    and ecx, dword ptr [Dc9c24]
    and edi, dword ptr [Dc9c1c]
    and esi, dword ptr [Dc9c20]
    or ecx, edi
    pop edi
    or esi, ecx
    pop eax
    shr esi, 05h
    pop edx
    ret
Func5f75b_ endp
Func5f7c8_ proc near
    push edx
    push eax
    push edi
    mov eax, ebx
    mov ecx, esi
    mov edx, ebx
    mov edi, esi
    and eax, dword ptr [Dc9c18]
    and edx, dword ptr [Dc9c10]
    and ebx, dword ptr [Dc9c14]
    and ecx, dword ptr [Dc9c18]
    and edi, dword ptr [Dc9c10]
    and esi, dword ptr [Dc9c14]
    sub eax, ecx
    sub ebx, esi
    sub edx, edi
    lea ecx, [eax+ecx*4]
    lea esi, [ebx+esi*4]
    lea edi, [edx+edi*4]
    lea ecx, [eax+ecx*2]
    lea esi, [ebx+esi*2]
    lea edi, [edx+edi*2]
    lea ecx, [ecx*4+00h]
    lea esi, [esi*4+00h]
    lea edi, [edi*4+00h]
    and ecx, dword ptr [Dc9c24]
    and edi, dword ptr [Dc9c1c]
    and esi, dword ptr [Dc9c20]
    or ecx, edi
    pop edi
    or esi, ecx
    pop eax
    shr esi, 05h
    pop edx
    ret
Func5f7c8_ endp
Func5f841_ proc near
    push edx
    push eax
    push edi
    mov eax, ebx
    mov ecx, esi
    mov edx, ebx
    mov edi, esi
    and eax, dword ptr [Dc9c18]
    and edx, dword ptr [Dc9c10]
    and ebx, dword ptr [Dc9c14]
    and ecx, dword ptr [Dc9c18]
    and edi, dword ptr [Dc9c10]
    and esi, dword ptr [Dc9c14]
    sub eax, ecx
    sub ebx, esi
    sub edx, edi
    lea ecx, [eax+ecx*4]
    lea esi, [ebx+esi*4]
    lea edi, [edx+edi*4]
    lea ecx, [eax+ecx*2]
    lea esi, [ebx+esi*2]
    lea edi, [edx+edi*2]
    lea ecx, [eax+ecx*4]
    lea esi, [ebx+esi*4]
    lea edi, [edx+edi*4]
    and ecx, dword ptr [Dc9c24]
    and edi, dword ptr [Dc9c1c]
    and esi, dword ptr [Dc9c20]
    or ecx, edi
    pop edi
    or esi, ecx
    pop eax
    shr esi, 05h
    pop edx
    ret
Func5f841_ endp
Func5f8ae_ proc near
    push edx
    push eax
    push edi
    mov eax, ebx
    mov ecx, esi
    mov edx, ebx
    mov edi, esi
    and eax, dword ptr [Dc9c18]
    and edx, dword ptr [Dc9c10]
    and ebx, dword ptr [Dc9c14]
    and ecx, dword ptr [Dc9c18]
    and edi, dword ptr [Dc9c10]
    and esi, dword ptr [Dc9c14]
    sub ecx, eax
    sub esi, ebx
    sub edi, edx
    shl eax, 05h
    lea ecx, [ecx+ecx*8]
    shl ebx, 05h
    lea esi, [esi+esi*8]
    shl edx, 05h
    lea edi, [edi+edi*8]
    lea ecx, [eax+ecx*2]
    lea esi, [ebx+esi*2]
    lea edx, [edx+edi*2]
    and ecx, dword ptr [Dc9c24]
    and edx, dword ptr [Dc9c1c]
    and esi, dword ptr [Dc9c20]
    or ecx, edx
    pop edi
    or esi, ecx
    pop eax
    shr esi, 05h
    pop edx
    ret
Func5f8ae_ endp
Func5f91b_ proc near
    push edx
    push eax
    push edi
    mov eax, ebx
    mov ecx, esi
    mov edx, ebx
    mov edi, esi
    and eax, dword ptr [Dc9c18]
    and edx, dword ptr [Dc9c10]
    and ebx, dword ptr [Dc9c14]
    and ecx, dword ptr [Dc9c18]
    and edi, dword ptr [Dc9c10]
    and esi, dword ptr [Dc9c14]
    sub ecx, eax
    sub esi, ebx
    sub edi, edx
    lea eax, [ecx+eax*2]
    lea ebx, [esi+ebx*2]
    lea edx, [edi+edx*2]
    add eax, eax
    add ebx, ebx
    add edx, edx
    lea ecx, [ecx+eax*8]
    lea esi, [esi+ebx*8]
    lea edi, [edi+edx*8]
    and ecx, dword ptr [Dc9c24]
    and edi, dword ptr [Dc9c1c]
    and esi, dword ptr [Dc9c20]
    or ecx, edi
    pop edi
    or esi, ecx
    pop eax
    shr esi, 05h
    pop edx
    ret
Func5f91b_ endp
Func5f985_ proc near
    mov ecx, ebx
    and ecx, dword ptr [Dc9cc8]
    and ecx, esi
    and esi, dword ptr [Dc9cc0]
    and ebx, dword ptr [Dc9cc0]
    add esi, ebx
    rcr esi, 1
    add esi, ecx
    ret
Func5f985_ endp
Func5f9a2_ proc near
    push edx
    push eax
    push edi
    mov eax, ebx
    mov ecx, esi
    mov edx, ebx
    mov edi, esi
    and eax, dword ptr [Dc9c18]
    and edx, dword ptr [Dc9c10]
    and ebx, dword ptr [Dc9c14]
    and ecx, dword ptr [Dc9c18]
    and edi, dword ptr [Dc9c10]
    and esi, dword ptr [Dc9c14]
    sub eax, ecx
    sub ebx, esi
    sub edx, edi
    lea ecx, [eax+ecx*2]
    lea esi, [ebx+esi*2]
    lea edi, [edx+edi*2]
    add ecx, ecx
    add esi, esi
    add edi, edi
    lea ecx, [eax+ecx*8]
    lea esi, [ebx+esi*8]
    lea edx, [edx+edi*8]
    and ecx, dword ptr [Dc9c24]
    and edx, dword ptr [Dc9c1c]
    and esi, dword ptr [Dc9c20]
    or ecx, edx
    pop edi
    or esi, ecx
    pop eax
    shr esi, 05h
    pop edx
    ret
Func5f9a2_ endp
Func5fa0c_ proc near
    push edx
    push eax
    push edi
    mov eax, ebx
    mov ecx, esi
    mov edx, ebx
    mov edi, esi
    and eax, dword ptr [Dc9c18]
    and edx, dword ptr [Dc9c10]
    and ebx, dword ptr [Dc9c14]
    and ecx, dword ptr [Dc9c18]
    and edi, dword ptr [Dc9c10]
    and esi, dword ptr [Dc9c14]
    sub eax, ecx
    sub ebx, esi
    sub edx, edi
    shl ecx, 05h
    lea eax, [eax+eax*8]
    shl esi, 05h
    lea ebx, [ebx+ebx*8]
    shl edi, 05h
    lea edx, [edx+edx*8]
    lea ecx, [ecx+eax*2]
    lea esi, [esi+ebx*2]
    lea edi, [edi+edx*2]
    and ecx, dword ptr [Dc9c24]
    and edi, dword ptr [Dc9c1c]
    and esi, dword ptr [Dc9c20]
    or ecx, edi
    pop edi
    or esi, ecx
    pop eax
    shr esi, 05h
    pop edx
    ret
Func5fa0c_ endp
Func5fa79_ proc near
    push edx
    push eax
    push edi
    mov eax, ebx
    mov ecx, esi
    mov edx, ebx
    mov edi, esi
    and eax, dword ptr [Dc9c18]
    and edx, dword ptr [Dc9c10]
    and ebx, dword ptr [Dc9c14]
    and ecx, dword ptr [Dc9c18]
    and edi, dword ptr [Dc9c10]
    and esi, dword ptr [Dc9c14]
    sub ecx, eax
    sub esi, ebx
    sub edi, edx
    lea eax, [ecx+eax*4]
    lea ebx, [esi+ebx*4]
    lea edx, [edi+edx*4]
    lea eax, [ecx+eax*2]
    lea ebx, [esi+ebx*2]
    lea edx, [edi+edx*2]
    lea ecx, [ecx+eax*4]
    lea esi, [esi+ebx*4]
    lea edx, [edi+edx*4]
    and ecx, dword ptr [Dc9c24]
    and edx, dword ptr [Dc9c1c]
    and esi, dword ptr [Dc9c20]
    or ecx, edx
    pop edi
    or esi, ecx
    pop eax
    shr esi, 05h
    pop edx
    ret
Func5fa79_ endp
Func5fae6_ proc near
    push edx
    push eax
    push edi
    mov eax, ebx
    mov ecx, esi
    mov edx, ebx
    mov edi, esi
    and eax, dword ptr [Dc9c18]
    and edx, dword ptr [Dc9c10]
    and ebx, dword ptr [Dc9c14]
    and ecx, dword ptr [Dc9c18]
    and edi, dword ptr [Dc9c10]
    and esi, dword ptr [Dc9c14]
    sub ecx, eax
    sub esi, ebx
    sub edi, edx
    lea eax, [ecx+eax*4]
    lea ebx, [esi+ebx*4]
    lea edx, [edi+edx*4]
    lea eax, [ecx+eax*2]
    lea ebx, [esi+ebx*2]
    lea edx, [edi+edx*2]
    lea ecx, [eax*4+00h]
    lea esi, [ebx*4+00h]
    lea edx, [edx*4+00h]
    and ecx, dword ptr [Dc9c24]
    and edx, dword ptr [Dc9c1c]
    and esi, dword ptr [Dc9c20]
    or ecx, edx
    pop edi
    or esi, ecx
    pop eax
    pop edx
    shr esi, 05h
    ret
Func5fae6_ endp
Func5fb5f_ proc near
    push edx
    push eax
    push edi
    mov eax, ebx
    mov ecx, esi
    mov edx, ebx
    mov edi, esi
    and eax, dword ptr [Dc9c18]
    and edx, dword ptr [Dc9c10]
    and ebx, dword ptr [Dc9c14]
    and ecx, dword ptr [Dc9c18]
    and edi, dword ptr [Dc9c10]
    and esi, dword ptr [Dc9c14]
    sub ecx, eax
    sub esi, ebx
    sub edi, edx
    lea eax, [ecx+eax*4]
    lea edx, [edi+edx*4]
    lea ebx, [esi+ebx*4]
    lea eax, [ecx+eax*4]
    lea edx, [edi+edx*4]
    lea ebx, [esi+ebx*4]
    lea ecx, [ecx+eax*2]
    lea edx, [edi+edx*2]
    lea esi, [esi+ebx*2]
    and ecx, dword ptr [Dc9c24]
    and edx, dword ptr [Dc9c1c]
    and esi, dword ptr [Dc9c20]
    or ecx, edx
    pop edi
    or esi, ecx
    pop eax
    shr esi, 05h
    pop edx
    ret
Func5fb5f_ endp
Func5fbcc_ proc near
    push edx
    push eax
    push edi
    mov eax, ebx
    mov ecx, esi
    mov edx, ebx
    mov edi, esi
    and eax, dword ptr [Dc9c18]
    and edx, dword ptr [Dc9c10]
    and ebx, dword ptr [Dc9c14]
    and ecx, dword ptr [Dc9c18]
    and edi, dword ptr [Dc9c10]
    and esi, dword ptr [Dc9c14]
    sub ecx, eax
    sub edi, edx
    sub esi, ebx
    shl eax, 05h
    lea ecx, [ecx+ecx*4]
    shl edx, 05h
    lea edi, [edi+edi*4]
    shl ebx, 05h
    lea esi, [esi+esi*4]
    lea ecx, [eax+ecx*2]
    lea edx, [edx+edi*2]
    lea esi, [ebx+esi*2]
    and ecx, dword ptr [Dc9c24]
    and edx, dword ptr [Dc9c1c]
    and esi, dword ptr [Dc9c20]
    or ecx, edx
    pop edi
    or esi, ecx
    pop eax
    shr esi, 05h
    pop edx
    ret
Func5fbcc_ endp
Func5fc39_ proc near
    push edx
    push eax
    push edi
    mov eax, ebx
    mov ecx, esi
    mov edx, ebx
    mov edi, esi
    and eax, dword ptr [Dc9c18]
    and edx, dword ptr [Dc9c10]
    and ebx, dword ptr [Dc9c14]
    and ecx, dword ptr [Dc9c18]
    and edi, dword ptr [Dc9c10]
    and esi, dword ptr [Dc9c14]
    sub ecx, eax
    sub edi, edx
    sub esi, ebx
    shl eax, 05h
    lea ecx, [ecx+ecx*8]
    shl edx, 05h
    lea edi, [edi+edi*8]
    shl ebx, 05h
    lea esi, [esi+esi*8]
    add ecx, eax
    add edx, edi
    add esi, ebx
    and ecx, dword ptr [Dc9c24]
    and edx, dword ptr [Dc9c1c]
    and esi, dword ptr [Dc9c20]
    or ecx, edx
    pop edi
    or esi, ecx
    pop eax
    shr esi, 05h
    pop edx
    ret
Func5fc39_ endp
Func5fca3_ proc near
    push edx
    push eax
    push edi
    mov eax, ebx
    mov ecx, esi
    mov edx, ebx
    mov edi, esi
    and eax, dword ptr [Dc9c18]
    and edx, dword ptr [Dc9c10]
    and ebx, dword ptr [Dc9c14]
    and ecx, dword ptr [Dc9c18]
    and edi, dword ptr [Dc9c10]
    and esi, dword ptr [Dc9c14]
    lea eax, [eax+eax*2]
    lea edx, [edx+edx*2]
    lea ebx, [ebx+ebx*2]
    add eax, ecx
    add edx, edi
    add ebx, esi
    lea ecx, [eax*8+00h]
    lea edx, [edx*8+00h]
    lea esi, [ebx*8+00h]
    and ecx, dword ptr [Dc9c24]
    and edx, dword ptr [Dc9c1c]
    and esi, dword ptr [Dc9c20]
    or ecx, edx
    pop edi
    or esi, ecx
    pop eax
    pop edx
    shr esi, 05h
    ret
Func5fca3_ endp
Func5fd13_ proc near
    push edx
    push eax
    push edi
    mov eax, ebx
    mov ecx, esi
    mov edx, ebx
    mov edi, esi
    and eax, dword ptr [Dc9c18]
    and edx, dword ptr [Dc9c10]
    and ebx, dword ptr [Dc9c14]
    and ecx, dword ptr [Dc9c18]
    and edi, dword ptr [Dc9c10]
    and esi, dword ptr [Dc9c14]
    sub ecx, eax
    shl eax, 05h
    sub edi, edx
    shl edx, 05h
    sub esi, ebx
    shl ebx, 05h
    sub eax, ecx
    sub edx, edi
    sub ebx, esi
    lea ecx, [eax+ecx*8]
    lea edx, [edx+edi*8]
    lea esi, [ebx+esi*8]
    and ecx, dword ptr [Dc9c24]
    and edx, dword ptr [Dc9c1c]
    and esi, dword ptr [Dc9c20]
    or ecx, edx
    pop edi
    or esi, ecx
    pop eax
    shr esi, 05h
    pop edx
    ret
Func5fd13_ endp
Func5fd7d_ proc near
    push edx
    push eax
    push edi
    mov eax, ebx
    mov ecx, esi
    mov edx, ebx
    mov edi, esi
    and eax, dword ptr [Dc9c18]
    and edx, dword ptr [Dc9c10]
    and ebx, dword ptr [Dc9c14]
    and ecx, dword ptr [Dc9c18]
    and edi, dword ptr [Dc9c10]
    and esi, dword ptr [Dc9c14]
    sub ecx, eax
    sub edi, edx
    sub esi, ebx
    shl eax, 05h
    lea ecx, [ecx+ecx*2]
    shl edx, 05h
    lea edi, [edi+edi*2]
    shl ebx, 05h
    lea esi, [esi+esi*2]
    lea ecx, [eax+ecx*2]
    lea edx, [edx+edi*2]
    lea esi, [ebx+esi*2]
    and ecx, dword ptr [Dc9c24]
    and edx, dword ptr [Dc9c1c]
    and esi, dword ptr [Dc9c20]
    or ecx, edx
    pop edi
    or esi, ecx
    pop eax
    shr esi, 05h
    pop edx
    ret
Func5fd7d_ endp
Func5fdea_ proc near
    push edx
    push eax
    push edi
    mov eax, ebx
    mov ecx, esi
    mov edx, ebx
    mov edi, esi
    and eax, dword ptr [Dc9c18]
    and edx, dword ptr [Dc9c10]
    and ebx, dword ptr [Dc9c14]
    and ecx, dword ptr [Dc9c18]
    and edi, dword ptr [Dc9c10]
    and esi, dword ptr [Dc9c14]
    lea eax, [eax+eax*2]
    lea edx, [edx+edx*2]
    lea ebx, [ebx+ebx*2]
    lea eax, [eax+eax*8]
    lea edx, [edx+edx*8]
    lea ebx, [ebx+ebx*8]
    lea ecx, [ecx+ecx*4]
    lea edi, [edi+edi*4]
    lea esi, [esi+esi*4]
    add ecx, eax
    add edx, edi
    add esi, ebx
    and ecx, dword ptr [Dc9c24]
    and edx, dword ptr [Dc9c1c]
    and esi, dword ptr [Dc9c20]
    or ecx, edx
    pop edi
    or esi, ecx
    pop eax
    shr esi, 05h
    pop edx
    ret
Func5fdea_ endp
Func5fe57_ proc near
    push edx
    push eax
    push edi
    mov eax, ebx
    mov ecx, esi
    mov edx, ebx
    mov edi, esi
    and eax, dword ptr [Dc9c18]
    and edx, dword ptr [Dc9c10]
    and ebx, dword ptr [Dc9c14]
    and ecx, dword ptr [Dc9c18]
    and edi, dword ptr [Dc9c10]
    and esi, dword ptr [Dc9c14]
    sub ecx, eax
    shl eax, 05h
    sub edi, edx
    shl edx, 05h
    sub esi, ebx
    shl ebx, 05h
    lea ecx, [eax+ecx*4]
    lea edx, [edx+edi*4]
    lea esi, [ebx+esi*4]
    and ecx, dword ptr [Dc9c24]
    and edx, dword ptr [Dc9c1c]
    and esi, dword ptr [Dc9c20]
    or ecx, edx
    pop edi
    or esi, ecx
    pop eax
    pop edx
    shr esi, 05h
    ret
Func5fe57_ endp
Func5febb_ proc near
    push edx
    push eax
    push edi
    mov eax, ebx
    mov ecx, esi
    mov edx, ebx
    mov edi, esi
    and eax, dword ptr [Dc9c18]
    and edx, dword ptr [Dc9c10]
    and ebx, dword ptr [Dc9c14]
    and ecx, dword ptr [Dc9c18]
    and edi, dword ptr [Dc9c10]
    and esi, dword ptr [Dc9c14]
    sub ecx, eax
    sub edi, edx
    sub esi, ebx
    shl eax, 05h
    lea ecx, [ecx+ecx*2]
    shl edx, 05h
    lea edi, [edi+edi*2]
    shl ebx, 05h
    add ecx, eax
    lea esi, [esi+esi*2]
    add edx, edi
    add esi, ebx
    and ecx, dword ptr [Dc9c24]
    and edx, dword ptr [Dc9c1c]
    and esi, dword ptr [Dc9c20]
    or ecx, edx
    pop edi
    or esi, ecx
    pop eax
    shr esi, 05h
    pop edx
    ret
Func5febb_ endp
Func5ff25_ proc near
    push edx
    push eax
    push edi
    mov eax, ebx
    mov ecx, esi
    mov edx, ebx
    mov edi, esi
    and eax, dword ptr [Dc9c18]
    and edx, dword ptr [Dc9c10]
    and ebx, dword ptr [Dc9c14]
    and ecx, dword ptr [Dc9c18]
    and edi, dword ptr [Dc9c10]
    and esi, dword ptr [Dc9c14]
    sub ecx, eax
    shl eax, 05h
    sub edi, edx
    shl edx, 05h
    sub esi, ebx
    shl ebx, 05h
    lea ecx, [eax+ecx*2]
    lea edx, [edx+edi*2]
    lea esi, [ebx+esi*2]
    and ecx, dword ptr [Dc9c24]
    and edx, dword ptr [Dc9c1c]
    and esi, dword ptr [Dc9c20]
    or ecx, edx
    pop edi
    or esi, ecx
    pop eax
    pop edx
    shr esi, 05h
    ret
Func5ff25_ endp
Func5ff89_ proc near
    push edx
    push eax
    push edi
    mov eax, ebx
    mov ecx, esi
    mov edx, ebx
    mov edi, esi
    and eax, dword ptr [Dc9c18]
    and edx, dword ptr [Dc9c10]
    and ebx, dword ptr [Dc9c14]
    and ecx, dword ptr [Dc9c18]
    and edi, dword ptr [Dc9c10]
    and esi, dword ptr [Dc9c14]
    sub ecx, eax
    shl eax, 05h
    sub edi, edx
    shl edx, 05h
    sub esi, ebx
    shl ebx, 05h
    add ecx, eax
    add edx, edi
    add esi, ebx
    and ecx, dword ptr [Dc9c24]
    and edx, dword ptr [Dc9c1c]
    and esi, dword ptr [Dc9c20]
    or ecx, edx
    pop edi
    or esi, ecx
    pop eax
    pop edx
    shr esi, 05h
    ret
Func5ff89_ endp
Func5ffea_ proc near
    mov esi, ebx
    ret
Func5ffea_ endp
decode_frame proc near
    push ebp
    mov ebp, esp
    push esi
    push edi
    push eax
    push ebx
    push ecx
    push edx
    mov edi, dword ptr [ebp+014h]
    mov ebx, dword ptr [ebp+020h]
    mov eax, dword ptr [ebp+01ch]
    mov dword ptr [Dc9bf0], ebx
    sub eax, dword ptr [ebp+0ch]
    mov ebx, dword ptr [ebp+018h]
    mov dword ptr [Dc9bec], eax
    mov dword ptr [Dc9be4], ebx
    add ebx, dword ptr [edi+018h]
    mov dword ptr [Dc9be8], ebx
    mov eax, dword ptr [edi+030h]
    mov dword ptr [Dc9b14], eax
    mov eax, dword ptr [edi+08h]
    shl eax, 04h
    mov dword ptr [Dc9aa4], eax
    add eax, eax
    mov dword ptr [Dc9aa8], eax
    lea eax, [eax+eax*2]
    mov dword ptr [Dc9aac], eax
    xor eax, eax
    mov ebx, eax
    mov dword ptr [Dc9ab8], ebx
    add ebx, 04h
    mov dword ptr [Dc9abc], ebx
    add ebx, 04h
    mov dword ptr [Dc9ac0], ebx
    add ebx, 04h
    mov dword ptr [Dc9ac4], ebx
    add eax, dword ptr [Dc9aa8]
    mov ebx, eax
    mov dword ptr [Dc9ac8], ebx
    add ebx, 04h
    mov dword ptr [Dc9acc], ebx
    add ebx, 04h
    mov dword ptr [Dc9ad0], ebx
    add ebx, 04h
    mov dword ptr [Dc9ad4], ebx
    add eax, dword ptr [Dc9aa8]
    mov ebx, eax
    mov dword ptr [Dc9ad8], ebx
    add ebx, 04h
    mov dword ptr [Dc9adc], ebx
    add ebx, 04h
    mov dword ptr [Dc9ae0], ebx
    add ebx, 04h
    mov dword ptr [Dc9ae4], ebx
    add eax, dword ptr [Dc9aa8]
    mov ebx, eax
    mov dword ptr [Dc9ae8], ebx
    add ebx, 04h
    mov dword ptr [Dc9aec], ebx
    add ebx, 04h
    mov dword ptr [Dc9af0], ebx
    add ebx, 04h
    mov dword ptr [Dc9af4], ebx
    mov eax, dword ptr [edi]
    mov ebx, dword ptr [edi+014h]
    imul eax, dword ptr [edi+04h]
    lea ebx, [ebx*4+00h]
    mov dword ptr [Dc9a84], eax
    mov dword ptr [Dc9cd4], ebx
    add edi, 034h
    mov dword ptr [Dc9ab0], edi
    mov edi, dword ptr [ebp+010h]
    mov eax, dword ptr [edi]
    mov esi, dword ptr [edi+04h]
    mov dword ptr [Dc9a78], eax
    mov dword ptr [Dc9a7c], esi
    mov al, byte ptr [edi+0ch]
    mov esi, dword ptr [edi+08h]
    mov byte ptr [Dc9af8], al
    mov dword ptr [Dc9a80], esi
    mov al, byte ptr [edi+0dh]
    mov dl, byte ptr [edi+0eh]
    mov byte ptr [Dc9af9], al
    mov byte ptr [Dc9afa], dl
    mov esi, dword ptr [ebp+08h]
    mov eax, dword ptr [esi-08h]
    mov dword ptr [Dc9a94], eax
    test eax, 07800000h
    je L67e1f
    mov dword ptr [Dc9a8c], 00h
    mov dword ptr [Dc9a88], 00h
    mov dword ptr [Dc9a90], 00h
    mov cl, 0e0h
    mov esi, dword ptr [ebp+08h]
    test dword ptr [Dc9a94], 020000h
    je L601af
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 04h
    jns L6ed69
L60190::
    and eax, 0fh
    mov byte ptr [Dc9af8], al
    mov eax, dword ptr [eax*4+bit_masks]
    mov edi, dword ptr [Dc9a78]
    mov dword ptr [Dc9a88], eax
    call Func5d270_
L601af::
    test dword ptr [Dc9a94], 040000h
    je L601f1
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 04h
    jns L6ed74
L601cc::
    and eax, 0fh
    mov byte ptr [Dc9af9], al
    mov eax, dword ptr [eax*4+bit_masks]
    mul dword ptr [Dc9a84]
    mov edi, dword ptr [Dc9a7c]
    mov dword ptr [Dc9a88], eax
    call Func5d270_
L601f1::
    test dword ptr [Dc9a94], 080000h
    je L60238
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 014h
    js L60210
    add esi, 04h
    or cl, 0e0h
L60210::
    and eax, 0fffffh
    mov dword ptr [Dc9a88], eax
    test eax, eax
    je L60238
    xor ch, ch
    dec eax
L60221::
    inc ch
    shr eax, 1
    jne L60221
    mov byte ptr [Dc9afa], ch
    mov edi, dword ptr [Dc9a80]
    call Func5d270_
L60238::
    mov edx, dword ptr [Dc9a7c]
    mov dword ptr [Dc9a90], edx
    bswap ecx
    mov edx, dword ptr [ebp+010h]
    mov cl, byte ptr [Dc9af8]
    mov eax, 07fffffffh
    mov byte ptr [edx+0ch], cl
    xor cl, 01fh
    shr eax, cl
    mov cl, byte ptr [Dc9afa]
    mov dword ptr [Dc9aa0], eax
    mov byte ptr [edx+0eh], cl
    mov eax, 07fffffffh
    xor cl, 01fh
    shr eax, cl
    mov cl, byte ptr [Dc9af9]
    mov dword ptr [Dc9a9c], eax
    mov byte ptr [edx+0dh], cl
    mov eax, 07fffffffh
    xor cl, 01fh
    shr eax, cl
    xor cl, 01fh
    mov edi, dword ptr [ebp+0ch]
    add cl, 03h
    mov dword ptr [Dc9a98], eax
    mov byte ptr [Dc9afb], cl
    bswap ecx
    mov eax, dword ptr [Dc9ab0]
    xor ch, ch
    xor ebx, ebx
    mov dl, byte ptr [eax+0ch]
    add edi, dword ptr [Dc9b14]
    mov dword ptr [Dc9a74], edi
    mov byte ptr [Dc9afc], dl
    mov dword ptr [Dc9bf4], 00h
    push ebp
    jmp L60411
L602d0::
    cmp dword ptr [Dc9bf4], 00h
    je L6040c
    mov ebx, dword ptr [Dc9bf4]
    mov edx, dword ptr [Dc9b5c]
    mov edi, dword ptr [Dc9b60]
    mov dword ptr [ebx], edx
    mov dword ptr [ebx+04h], edi
    mov edx, dword ptr [Dc9b64]
    mov edi, dword ptr [Dc9b68]
    mov dword ptr [ebx+08h], edx
    mov dword ptr [ebx+0ch], edi
    mov edx, dword ptr [Dc9b6c]
    mov edi, dword ptr [Dc9b70]
    mov dword ptr [ebx+010h], edx
    mov dword ptr [ebx+014h], edi
    mov edx, dword ptr [Dc9b74]
    mov edi, dword ptr [Dc9b78]
    mov dword ptr [ebx+018h], edx
    mov dword ptr [ebx+01ch], edi
    mov edx, dword ptr [Dc9b7c]
    mov edi, dword ptr [Dc9b80]
    mov dword ptr [ebx+020h], edx
    mov dword ptr [ebx+024h], edi
    mov edx, dword ptr [Dc9b84]
    mov edi, dword ptr [Dc9b88]
    mov dword ptr [ebx+028h], edx
    mov dword ptr [ebx+02ch], edi
    mov edx, dword ptr [Dc9b8c]
    mov edi, dword ptr [Dc9b90]
    mov dword ptr [ebx+030h], edx
    mov dword ptr [ebx+034h], edi
    mov edx, dword ptr [Dc9b94]
    mov edi, dword ptr [Dc9b98]
    mov dword ptr [ebx+038h], edx
    mov dword ptr [ebx+03ch], edi
    mov edx, dword ptr [Dc9b9c]
    mov edi, dword ptr [Dc9ba0]
    mov dword ptr [ebx+040h], edx
    mov dword ptr [ebx+044h], edi
    mov edx, dword ptr [Dc9ba4]
    mov edi, dword ptr [Dc9ba8]
    mov dword ptr [ebx+048h], edx
    mov dword ptr [ebx+04ch], edi
    mov edx, dword ptr [Dc9bac]
    mov edi, dword ptr [Dc9bb0]
    mov dword ptr [ebx+050h], edx
    mov dword ptr [ebx+054h], edi
    mov edx, dword ptr [Dc9bb4]
    mov edi, dword ptr [Dc9bb8]
    mov dword ptr [ebx+058h], edx
    mov dword ptr [ebx+05ch], edi
    mov edx, dword ptr [Dc9bbc]
    mov edi, dword ptr [Dc9bc0]
    mov dword ptr [ebx+060h], edx
    mov dword ptr [ebx+064h], edi
    mov edx, dword ptr [Dc9bc4]
    mov edi, dword ptr [Dc9bc8]
    mov dword ptr [ebx+068h], edx
    mov dword ptr [ebx+06ch], edi
    mov edx, dword ptr [Dc9bcc]
    mov edi, dword ptr [Dc9bd0]
    mov dword ptr [ebx+070h], edx
    mov dword ptr [ebx+074h], edi
    mov edx, dword ptr [Dc9bd4]
    mov edi, dword ptr [Dc9bd8]
    mov dword ptr [ebx+078h], edx
    mov dword ptr [ebx+07ch], edi
    mov dword ptr [Dc9bf4], 00h
L6040c::
    mov ebx, 01h
L60411::
    mov eax, dword ptr [esi]
    shr eax, cl
    inc cl
    jns L6ed7f
L6041d::
    and eax, 01h
    je L6046d
    add ebx, 01h
    mov eax, dword ptr [esi]
    mov edx, dword ptr [esi+04h]
    shrd eax, edx, cl
    add cl, 03h
    jns L6ed8a
L60436::
    and eax, 07h
    add ebx, eax
    cmp eax, 07h
    jl L6046d
    mov eax, dword ptr [esi]
    shrd eax, edx, cl
    add cl, 07h
    jns L6ed95
L6044e::
    and eax, 07fh
    add ebx, eax
    cmp eax, 07fh
    jl L6046d
    mov eax, dword ptr [esi]
    shrd eax, edx, cl
    add cl, 0ch
    jns L6eda3
L60466::
    and eax, 0fffh
    add ebx, eax
L6046d::
    bswap ecx
    mov edx, ebx
    mov cl, byte ptr [Dc9afb]
    add edx, dword ptr [Dc9a8c]
    shl ebx, cl
    bswap ecx
    add dword ptr [Dc9a90], ebx
    cmp edx, dword ptr [Dc9a84]
    jae L62ad1
    lea edi, [edx+edx*4]
    mov dword ptr [Dc9a8c], edx
    lea edx, [edi*4+00h]
    xor edi, edi
    add edx, dword ptr [Dc9ab0]
    or edi, dword ptr [edx]
    jns L6101e
    cmp edi, 0fffffffeh
    je L62ad1
    xor ebp, ebp
    mov ebx, dword ptr [esi+04h]
    mov eax, dword ptr [esi]
    shr eax, cl
    inc cl
    jns L6edae
L604cd::
    test al, 01h
    jne L6056c
L604d5::
    mov eax, dword ptr [esi]
    shr eax, cl
    inc cl
    jns L6edbc
L604e1::
    and eax, 01h
    jne L604f2
    test ch, 0ffh
    je L6053b
    test ch, 02h
    jne L60528
    jmp L60515
L604f2::
    mov eax, dword ptr [esi]
    shr eax, cl
    inc cl
    jns L6edca
L604fe::
    and eax, 01h
    mov al, ch
    je L60507
    inc al
L60507::
    sub al, 02h
    sbb al, 00h
    and al, 03h
    mov ch, al
    je L6053b
    test al, 02h
    jne L60528
L60515::
    add cl, byte ptr [Dc9af8]
    jae L6054c
    add esi, 04h
    or cl, 0e0h
    mov ebx, dword ptr [esi+04h]
    jmp L6054c
L60528::
    add cl, byte ptr [Dc9afa]
    jae L6054c
    add esi, 04h
    or cl, 0e0h
    mov ebx, dword ptr [esi+04h]
    jmp L6054c
L6053b::
    add cl, byte ptr [Dc9af9]
    jae L6054c
    add esi, 04h
    or cl, 0e0h
    mov ebx, dword ptr [esi+04h]
L6054c::
    mov eax, dword ptr [esi]
    shrd eax, ebx, cl
    add cl, 011h
    js L6055f
    add esi, 04h
    or cl, 0e0h
    mov ebx, dword ptr [esi+04h]
L6055f::
    or ebp, eax
    test eax, 010000h
    je L604d5
L6056c::
    mov eax, dword ptr [esi]
    shr eax, cl
    inc cl
    jns L6edd8
L60578::
    test al, 01h
    jne L60f65
    mov eax, dword ptr [esi]
    shrd eax, ebx, cl
    add cl, 04h
    jns L6ede6
L6058e::
    and eax, 0fh
    jmp dword ptr [eax*4+D60598]
decode_frame endp
D60598 dword offset Func605d8_
    dword offset L605f2
    dword offset L6060c
    dword offset L60629
    dword offset L60642
    dword offset L6065d
    dword offset L6067d
    dword offset L60699
    dword offset L606b6
    dword offset L606ce
    dword offset L606e8
    dword offset L60704
    dword offset L6071d
    dword offset L60731
    dword offset L6074b
    dword offset L60762
Func605d8_ proc near
    mov eax, dword ptr [esi]
    shrd eax, ebx, cl
    add cl, 010h
    js L605eb
    add esi, 04h
    or cl, 0e0h
    mov ebx, dword ptr [esi+04h]
L605eb::
    xor ebp, eax
    jmp L60764
L605f2::
    mov eax, dword ptr [esi]
    shrd eax, ebx, cl
    add cl, 0ch
    jns L6edf4
L60600::
    shl eax, 04h
    or al, 0fh
    xor ebp, eax
    jmp L60764
L6060c::
    mov eax, dword ptr [esi]
    shrd eax, ebx, cl
    add cl, 0ch
    jns L6ee02
L6061a::
    shl eax, 04h
    shr al, 04h
    or al, 0f0h
    xor ebp, eax
    jmp L60764
L60629::
    mov eax, dword ptr [esi]
    shrd eax, ebx, cl
    add cl, 08h
    jns L6ee10
L60637::
    mov ah, al
    mov al, 0ffh
    xor ebp, eax
    jmp L60764
L60642::
    mov eax, dword ptr [esi]
    shrd eax, ebx, cl
    add cl, 0ch
    jns L6ee1e
L60650::
    shl ah, 04h
    or ah, 0fh
    xor ebp, eax
    jmp L60764
L6065d::
    mov eax, dword ptr [esi]
    shrd eax, ebx, cl
    add cl, 08h
    jns L6ee2c
L6066b::
    shl eax, 04h
    shl ah, 04h
    or eax, 0f0fh
    xor ebp, eax
    jmp L60764
L6067d::
    mov eax, dword ptr [esi]
    shrd eax, ebx, cl
    add cl, 08h
    jns L6ee3a
L6068b::
    mov ah, al
    or eax, 0ff0h
    xor ebp, eax
    jmp L60764
L60699::
    mov eax, dword ptr [esi]
    shrd eax, ebx, cl
    add cl, 04h
    jns L6ee48
L606a7::
    shl eax, 0ch
    or eax, 0fffh
    xor ebp, eax
    jmp L60764
L606b6::
    mov eax, dword ptr [esi]
    shrd eax, ebx, cl
    add cl, 0ch
    jns L6ee56
L606c4::
    or ah, 0f0h
    xor ebp, eax
    jmp L60764
L606ce::
    mov eax, dword ptr [esi]
    shrd eax, ebx, cl
    add cl, 08h
    jns L6ee64
L606dc::
    shl eax, 04h
    or eax, 0f00fh
    xor ebp, eax
    jmp L60764
L606e8::
    mov eax, dword ptr [esi]
    shrd eax, ebx, cl
    add cl, 08h
    jns L6ee72
L606f6::
    mov ah, al
    ror ah, 04h
    or eax, 0f0f0h
    xor ebp, eax
    jmp L60764
L60704::
    mov eax, dword ptr [esi]
    shrd eax, ebx, cl
    add cl, 04h
    jns L6ee80
L60712::
    mov ah, al
    or eax, 0f0ffh
    xor ebp, eax
    jmp L60764
L6071d::
    mov eax, dword ptr [esi]
    shrd eax, ebx, cl
    add cl, 08h
    jns L6ee8e
L6072b::
    mov ah, 0ffh
    xor ebp, eax
    jmp L60764
L60731::
    mov eax, dword ptr [esi]
    shrd eax, ebx, cl
    add cl, 04h
    jns L6ee9c
L6073f::
    or eax, 0fff0h
    rol al, 04h
    xor ebp, eax
    jmp L60764
L6074b::
    mov eax, dword ptr [esi]
    shrd eax, ebx, cl
    add cl, 04h
    jns L6eeaa
L60759::
    or eax, 0fff0h
    xor ebp, eax
    jmp L60764
L60762::
    not ebp
L60764::
    test ebp, 0ffffh
    je L602d0
    test ebp, 01h
    je L607ef
    mov eax, dword ptr [esi]
    shr eax, cl
    inc cl
    jns L6eeb8
L60784::
    and eax, 01h
    jne L60795
    test ch, 0ffh
    je L607de
    test ch, 02h
    jne L607cb
    jmp L607b8
L60795::
    mov eax, dword ptr [esi]
    shr eax, cl
    inc cl
    jns L6eec6
L607a1::
    and eax, 01h
    mov al, ch
    je L607aa
    inc al
L607aa::
    sub al, 02h
    sbb al, 00h
    and al, 03h
    mov ch, al
    je L607de
    test al, 02h
    jne L607cb
L607b8::
    add cl, byte ptr [Dc9af8]
    jae L607ef
    add esi, 04h
    or cl, 0e0h
    mov ebx, dword ptr [esi+04h]
    jmp L607ef
L607cb::
    add cl, byte ptr [Dc9afa]
    jae L607ef
    add esi, 04h
    or cl, 0e0h
    mov ebx, dword ptr [esi+04h]
    jmp L607ef
L607de::
    add cl, byte ptr [Dc9af9]
    jae L607ef
    add esi, 04h
    or cl, 0e0h
    mov ebx, dword ptr [esi+04h]
L607ef::
    test ebp, 02h
    je L6086e
    mov eax, dword ptr [esi]
    shr eax, cl
    inc cl
    jns L6eed4
L60803::
    and eax, 01h
    jne L60814
    test ch, 0ffh
    je L6085d
    test ch, 02h
    jne L6084a
    jmp L60837
L60814::
    mov eax, dword ptr [esi]
    shr eax, cl
    inc cl
    jns L6eee2
L60820::
    and eax, 01h
    mov al, ch
    je L60829
    inc al
L60829::
    sub al, 02h
    sbb al, 00h
    and al, 03h
    mov ch, al
    je L6085d
    test al, 02h
    jne L6084a
L60837::
    add cl, byte ptr [Dc9af8]
    jae L6086e
    add esi, 04h
    or cl, 0e0h
    mov ebx, dword ptr [esi+04h]
    jmp L6086e
L6084a::
    add cl, byte ptr [Dc9afa]
    jae L6086e
    add esi, 04h
    or cl, 0e0h
    mov ebx, dword ptr [esi+04h]
    jmp L6086e
L6085d::
    add cl, byte ptr [Dc9af9]
    jae L6086e
    add esi, 04h
    or cl, 0e0h
    mov ebx, dword ptr [esi+04h]
L6086e::
    test ebp, 010h
    je L608ed
    mov eax, dword ptr [esi]
    shr eax, cl
    inc cl
    jns L6eef0
L60882::
    and eax, 01h
    jne L60893
    test ch, 0ffh
    je L608dc
    test ch, 02h
    jne L608c9
    jmp L608b6
L60893::
    mov eax, dword ptr [esi]
    shr eax, cl
    inc cl
    jns L6eefe
L6089f::
    and eax, 01h
    mov al, ch
    je L608a8
    inc al
L608a8::
    sub al, 02h
    sbb al, 00h
    and al, 03h
    mov ch, al
    je L608dc
    test al, 02h
    jne L608c9
L608b6::
    add cl, byte ptr [Dc9af8]
    jae L608ed
    add esi, 04h
    or cl, 0e0h
    mov ebx, dword ptr [esi+04h]
    jmp L608ed
L608c9::
    add cl, byte ptr [Dc9afa]
    jae L608ed
    add esi, 04h
    or cl, 0e0h
    mov ebx, dword ptr [esi+04h]
    jmp L608ed
L608dc::
    add cl, byte ptr [Dc9af9]
    jae L608ed
    add esi, 04h
    or cl, 0e0h
    mov ebx, dword ptr [esi+04h]
L608ed::
    test ebp, 020h
    je L6096c
    mov eax, dword ptr [esi]
    shr eax, cl
    inc cl
    jns L6ef0c
L60901::
    and eax, 01h
    jne L60912
    test ch, 0ffh
    je L6095b
    test ch, 02h
    jne L60948
    jmp L60935
L60912::
    mov eax, dword ptr [esi]
    shr eax, cl
    inc cl
    jns L6ef1a
L6091e::
    and eax, 01h
    mov al, ch
    je L60927
    inc al
L60927::
    sub al, 02h
    sbb al, 00h
    and al, 03h
    mov ch, al
    je L6095b
    test al, 02h
    jne L60948
L60935::
    add cl, byte ptr [Dc9af8]
    jae L6096c
    add esi, 04h
    or cl, 0e0h
    mov ebx, dword ptr [esi+04h]
    jmp L6096c
L60948::
    add cl, byte ptr [Dc9afa]
    jae L6096c
    add esi, 04h
    or cl, 0e0h
    mov ebx, dword ptr [esi+04h]
    jmp L6096c
L6095b::
    add cl, byte ptr [Dc9af9]
    jae L6096c
    add esi, 04h
    or cl, 0e0h
    mov ebx, dword ptr [esi+04h]
L6096c::
    test ebp, 04h
    je L609eb
    mov eax, dword ptr [esi]
    shr eax, cl
    inc cl
    jns L6ef28
L60980::
    and eax, 01h
    jne L60991
    test ch, 0ffh
    je L609da
    test ch, 02h
    jne L609c7
    jmp L609b4
L60991::
    mov eax, dword ptr [esi]
    shr eax, cl
    inc cl
    jns L6ef36
L6099d::
    and eax, 01h
    mov al, ch
    je L609a6
    inc al
L609a6::
    sub al, 02h
    sbb al, 00h
    and al, 03h
    mov ch, al
    je L609da
    test al, 02h
    jne L609c7
L609b4::
    add cl, byte ptr [Dc9af8]
    jae L609eb
    add esi, 04h
    or cl, 0e0h
    mov ebx, dword ptr [esi+04h]
    jmp L609eb
L609c7::
    add cl, byte ptr [Dc9afa]
    jae L609eb
    add esi, 04h
    or cl, 0e0h
    mov ebx, dword ptr [esi+04h]
    jmp L609eb
L609da::
    add cl, byte ptr [Dc9af9]
    jae L609eb
    add esi, 04h
    or cl, 0e0h
    mov ebx, dword ptr [esi+04h]
L609eb::
    test ebp, 08h
    je L60a6a
    mov eax, dword ptr [esi]
    shr eax, cl
    inc cl
    jns L6ef44
L609ff::
    and eax, 01h
    jne L60a10
    test ch, 0ffh
    je L60a59
    test ch, 02h
    jne L60a46
    jmp L60a33
L60a10::
    mov eax, dword ptr [esi]
    shr eax, cl
    inc cl
    jns L6ef52
L60a1c::
    and eax, 01h
    mov al, ch
    je L60a25
    inc al
L60a25::
    sub al, 02h
    sbb al, 00h
    and al, 03h
    mov ch, al
    je L60a59
    test al, 02h
    jne L60a46
L60a33::
    add cl, byte ptr [Dc9af8]
    jae L60a6a
    add esi, 04h
    or cl, 0e0h
    mov ebx, dword ptr [esi+04h]
    jmp L60a6a
L60a46::
    add cl, byte ptr [Dc9afa]
    jae L60a6a
    add esi, 04h
    or cl, 0e0h
    mov ebx, dword ptr [esi+04h]
    jmp L60a6a
L60a59::
    add cl, byte ptr [Dc9af9]
    jae L60a6a
    add esi, 04h
    or cl, 0e0h
    mov ebx, dword ptr [esi+04h]
L60a6a::
    test ebp, 040h
    je L60ae9
    mov eax, dword ptr [esi]
    shr eax, cl
    inc cl
    jns L6ef60
L60a7e::
    and eax, 01h
    jne L60a8f
    test ch, 0ffh
    je L60ad8
    test ch, 02h
    jne L60ac5
    jmp L60ab2
L60a8f::
    mov eax, dword ptr [esi]
    shr eax, cl
    inc cl
    jns L6ef6e
L60a9b::
    and eax, 01h
    mov al, ch
    je L60aa4
    inc al
L60aa4::
    sub al, 02h
    sbb al, 00h
    and al, 03h
    mov ch, al
    je L60ad8
    test al, 02h
    jne L60ac5
L60ab2::
    add cl, byte ptr [Dc9af8]
    jae L60ae9
    add esi, 04h
    or cl, 0e0h
    mov ebx, dword ptr [esi+04h]
    jmp L60ae9
L60ac5::
    add cl, byte ptr [Dc9afa]
    jae L60ae9
    add esi, 04h
    or cl, 0e0h
    mov ebx, dword ptr [esi+04h]
    jmp L60ae9
L60ad8::
    add cl, byte ptr [Dc9af9]
    jae L60ae9
    add esi, 04h
    or cl, 0e0h
    mov ebx, dword ptr [esi+04h]
L60ae9::
    test ebp, 080h
    je L60b68
    mov eax, dword ptr [esi]
    shr eax, cl
    inc cl
    jns L6ef7c
L60afd::
    and eax, 01h
    jne L60b0e
    test ch, 0ffh
    je L60b57
    test ch, 02h
    jne L60b44
    jmp L60b31
L60b0e::
    mov eax, dword ptr [esi]
    shr eax, cl
    inc cl
    jns L6ef8a
L60b1a::
    and eax, 01h
    mov al, ch
    je L60b23
    inc al
L60b23::
    sub al, 02h
    sbb al, 00h
    and al, 03h
    mov ch, al
    je L60b57
    test al, 02h
    jne L60b44
L60b31::
    add cl, byte ptr [Dc9af8]
    jae L60b68
    add esi, 04h
    or cl, 0e0h
    mov ebx, dword ptr [esi+04h]
    jmp L60b68
L60b44::
    add cl, byte ptr [Dc9afa]
    jae L60b68
    add esi, 04h
    or cl, 0e0h
    mov ebx, dword ptr [esi+04h]
    jmp L60b68
L60b57::
    add cl, byte ptr [Dc9af9]
    jae L60b68
    add esi, 04h
    or cl, 0e0h
    mov ebx, dword ptr [esi+04h]
L60b68::
    test ebp, 0100h
    je L60be7
    mov eax, dword ptr [esi]
    shr eax, cl
    inc cl
    jns L6ef98
L60b7c::
    and eax, 01h
    jne L60b8d
    test ch, 0ffh
    je L60bd6
    test ch, 02h
    jne L60bc3
    jmp L60bb0
L60b8d::
    mov eax, dword ptr [esi]
    shr eax, cl
    inc cl
    jns L6efa6
L60b99::
    and eax, 01h
    mov al, ch
    je L60ba2
    inc al
L60ba2::
    sub al, 02h
    sbb al, 00h
    and al, 03h
    mov ch, al
    je L60bd6
    test al, 02h
    jne L60bc3
L60bb0::
    add cl, byte ptr [Dc9af8]
    jae L60be7
    add esi, 04h
    or cl, 0e0h
    mov ebx, dword ptr [esi+04h]
    jmp L60be7
L60bc3::
    add cl, byte ptr [Dc9afa]
    jae L60be7
    add esi, 04h
    or cl, 0e0h
    mov ebx, dword ptr [esi+04h]
    jmp L60be7
L60bd6::
    add cl, byte ptr [Dc9af9]
    jae L60be7
    add esi, 04h
    or cl, 0e0h
    mov ebx, dword ptr [esi+04h]
L60be7::
    test ebp, 0200h
    je L60c66
    mov eax, dword ptr [esi]
    shr eax, cl
    inc cl
    jns L6efb4
L60bfb::
    and eax, 01h
    jne L60c0c
    test ch, 0ffh
    je L60c55
    test ch, 02h
    jne L60c42
    jmp L60c2f
L60c0c::
    mov eax, dword ptr [esi]
    shr eax, cl
    inc cl
    jns L6efc2
L60c18::
    and eax, 01h
    mov al, ch
    je L60c21
    inc al
L60c21::
    sub al, 02h
    sbb al, 00h
    and al, 03h
    mov ch, al
    je L60c55
    test al, 02h
    jne L60c42
L60c2f::
    add cl, byte ptr [Dc9af8]
    jae L60c66
    add esi, 04h
    or cl, 0e0h
    mov ebx, dword ptr [esi+04h]
    jmp L60c66
L60c42::
    add cl, byte ptr [Dc9afa]
    jae L60c66
    add esi, 04h
    or cl, 0e0h
    mov ebx, dword ptr [esi+04h]
    jmp L60c66
L60c55::
    add cl, byte ptr [Dc9af9]
    jae L60c66
    add esi, 04h
    or cl, 0e0h
    mov ebx, dword ptr [esi+04h]
L60c66::
    test ebp, 01000h
    je L60ce5
    mov eax, dword ptr [esi]
    shr eax, cl
    inc cl
    jns L6efd0
L60c7a::
    and eax, 01h
    jne L60c8b
    test ch, 0ffh
    je L60cd4
    test ch, 02h
    jne L60cc1
    jmp L60cae
L60c8b::
    mov eax, dword ptr [esi]
    shr eax, cl
    inc cl
    jns L6efde
L60c97::
    and eax, 01h
    mov al, ch
    je L60ca0
    inc al
L60ca0::
    sub al, 02h
    sbb al, 00h
    and al, 03h
    mov ch, al
    je L60cd4
    test al, 02h
    jne L60cc1
L60cae::
    add cl, byte ptr [Dc9af8]
    jae L60ce5
    add esi, 04h
    or cl, 0e0h
    mov ebx, dword ptr [esi+04h]
    jmp L60ce5
L60cc1::
    add cl, byte ptr [Dc9afa]
    jae L60ce5
    add esi, 04h
    or cl, 0e0h
    mov ebx, dword ptr [esi+04h]
    jmp L60ce5
L60cd4::
    add cl, byte ptr [Dc9af9]
    jae L60ce5
    add esi, 04h
    or cl, 0e0h
    mov ebx, dword ptr [esi+04h]
L60ce5::
    test ebp, 02000h
    je L60d64
    mov eax, dword ptr [esi]
    shr eax, cl
    inc cl
    jns L6efec
L60cf9::
    and eax, 01h
    jne L60d0a
    test ch, 0ffh
    je L60d53
    test ch, 02h
    jne L60d40
    jmp L60d2d
L60d0a::
    mov eax, dword ptr [esi]
    shr eax, cl
    inc cl
    jns L6effa
L60d16::
    and eax, 01h
    mov al, ch
    je L60d1f
    inc al
L60d1f::
    sub al, 02h
    sbb al, 00h
    and al, 03h
    mov ch, al
    je L60d53
    test al, 02h
    jne L60d40
L60d2d::
    add cl, byte ptr [Dc9af8]
    jae L60d64
    add esi, 04h
    or cl, 0e0h
    mov ebx, dword ptr [esi+04h]
    jmp L60d64
L60d40::
    add cl, byte ptr [Dc9afa]
    jae L60d64
    add esi, 04h
    or cl, 0e0h
    mov ebx, dword ptr [esi+04h]
    jmp L60d64
L60d53::
    add cl, byte ptr [Dc9af9]
    jae L60d64
    add esi, 04h
    or cl, 0e0h
    mov ebx, dword ptr [esi+04h]
L60d64::
    test ebp, 0400h
    je L60de3
    mov eax, dword ptr [esi]
    shr eax, cl
    inc cl
    jns L6f008
L60d78::
    and eax, 01h
    jne L60d89
    test ch, 0ffh
    je L60dd2
    test ch, 02h
    jne L60dbf
    jmp L60dac
L60d89::
    mov eax, dword ptr [esi]
    shr eax, cl
    inc cl
    jns L6f016
L60d95::
    and eax, 01h
    mov al, ch
    je L60d9e
    inc al
L60d9e::
    sub al, 02h
    sbb al, 00h
    and al, 03h
    mov ch, al
    je L60dd2
    test al, 02h
    jne L60dbf
L60dac::
    add cl, byte ptr [Dc9af8]
    jae L60de3
    add esi, 04h
    or cl, 0e0h
    mov ebx, dword ptr [esi+04h]
    jmp L60de3
L60dbf::
    add cl, byte ptr [Dc9afa]
    jae L60de3
    add esi, 04h
    or cl, 0e0h
    mov ebx, dword ptr [esi+04h]
    jmp L60de3
L60dd2::
    add cl, byte ptr [Dc9af9]
    jae L60de3
    add esi, 04h
    or cl, 0e0h
    mov ebx, dword ptr [esi+04h]
L60de3::
    test ebp, 0800h
    je L60e62
    mov eax, dword ptr [esi]
    shr eax, cl
    inc cl
    jns L6f024
L60df7::
    and eax, 01h
    jne L60e08
    test ch, 0ffh
    je L60e51
    test ch, 02h
    jne L60e3e
    jmp L60e2b
L60e08::
    mov eax, dword ptr [esi]
    shr eax, cl
    inc cl
    jns L6f032
L60e14::
    and eax, 01h
    mov al, ch
    je L60e1d
    inc al
L60e1d::
    sub al, 02h
    sbb al, 00h
    and al, 03h
    mov ch, al
    je L60e51
    test al, 02h
    jne L60e3e
L60e2b::
    add cl, byte ptr [Dc9af8]
    jae L60e62
    add esi, 04h
    or cl, 0e0h
    mov ebx, dword ptr [esi+04h]
    jmp L60e62
L60e3e::
    add cl, byte ptr [Dc9afa]
    jae L60e62
    add esi, 04h
    or cl, 0e0h
    mov ebx, dword ptr [esi+04h]
    jmp L60e62
L60e51::
    add cl, byte ptr [Dc9af9]
    jae L60e62
    add esi, 04h
    or cl, 0e0h
    mov ebx, dword ptr [esi+04h]
L60e62::
    test ebp, 04000h
    je L60ee1
    mov eax, dword ptr [esi]
    shr eax, cl
    inc cl
    jns L6f040
L60e76::
    and eax, 01h
    jne L60e87
    test ch, 0ffh
    je L60ed0
    test ch, 02h
    jne L60ebd
    jmp L60eaa
L60e87::
    mov eax, dword ptr [esi]
    shr eax, cl
    inc cl
    jns L6f04e
L60e93::
    and eax, 01h
    mov al, ch
    je L60e9c
    inc al
L60e9c::
    sub al, 02h
    sbb al, 00h
    and al, 03h
    mov ch, al
    je L60ed0
    test al, 02h
    jne L60ebd
L60eaa::
    add cl, byte ptr [Dc9af8]
    jae L60ee1
    add esi, 04h
    or cl, 0e0h
    mov ebx, dword ptr [esi+04h]
    jmp L60ee1
L60ebd::
    add cl, byte ptr [Dc9afa]
    jae L60ee1
    add esi, 04h
    or cl, 0e0h
    mov ebx, dword ptr [esi+04h]
    jmp L60ee1
L60ed0::
    add cl, byte ptr [Dc9af9]
    jae L60ee1
    add esi, 04h
    or cl, 0e0h
    mov ebx, dword ptr [esi+04h]
L60ee1::
    test ebp, 08000h
    je L60f60
    mov eax, dword ptr [esi]
    shr eax, cl
    inc cl
    jns L6f05c
L60ef5::
    and eax, 01h
    jne L60f06
    test ch, 0ffh
    je L60f4f
    test ch, 02h
    jne L60f3c
    jmp L60f29
L60f06::
    mov eax, dword ptr [esi]
    shr eax, cl
    inc cl
    jns L6f06a
L60f12::
    and eax, 01h
    mov al, ch
    je L60f1b
    inc al
L60f1b::
    sub al, 02h
    sbb al, 00h
    and al, 03h
    mov ch, al
    je L60f4f
    test al, 02h
    jne L60f3c
L60f29::
    add cl, byte ptr [Dc9af8]
    jae L60f60
    add esi, 04h
    or cl, 0e0h
    mov ebx, dword ptr [esi+04h]
    jmp L60f60
L60f3c::
    add cl, byte ptr [Dc9afa]
    jae L60f60
    add esi, 04h
    or cl, 0e0h
    mov ebx, dword ptr [esi+04h]
    jmp L60f60
L60f4f::
    add cl, byte ptr [Dc9af9]
    jae L60f60
    add esi, 04h
    or cl, 0e0h
    mov ebx, dword ptr [esi+04h]
L60f60::
    jmp L602d0
L60f65::
    test dword ptr [Dc9a94], 010000h
    je L602d0
    mov eax, dword ptr [esi]
    shr eax, cl
    inc cl
    jns L6f078
L60f81::
    test al, 01h
    jne L602d0
L60f89::
    mov eax, dword ptr [esi]
    shr eax, cl
    inc cl
    jns L6f086
L60f95::
    and eax, 01h
    jne L60fa6
    test ch, 0ffh
    je L60fef
    test ch, 02h
    jne L60fdc
    jmp L60fc9
L60fa6::
    mov eax, dword ptr [esi]
    shr eax, cl
    inc cl
    jns L6f094
L60fb2::
    and eax, 01h
    mov al, ch
    je L60fbb
    inc al
L60fbb::
    sub al, 02h
    sbb al, 00h
    and al, 03h
    mov ch, al
    je L60fef
    test al, 02h
    jne L60fdc
L60fc9::
    add cl, byte ptr [Dc9af8]
    jae L61000
    add esi, 04h
    or cl, 0e0h
    mov ebx, dword ptr [esi+04h]
    jmp L61000
L60fdc::
    add cl, byte ptr [Dc9afa]
    jae L61000
    add esi, 04h
    or cl, 0e0h
    mov ebx, dword ptr [esi+04h]
    jmp L61000
L60fef::
    add cl, byte ptr [Dc9af9]
    jae L61000
    add esi, 04h
    or cl, 0e0h
    mov ebx, dword ptr [esi+04h]
L61000::
    mov eax, dword ptr [esi]
    shrd eax, ebx, cl
    add cl, 05h
    jns L6f0a2
L6100e::
    test eax, 010h
    je L60f89
    jmp L602d0
L6101e::
    cmp edi, 040000000h
    jl L611fa
    mov eax, dword ptr [edx+04h]
    and edi, 03fffffffh
    add eax, dword ptr [Dc9be4]
    mov ebp, dword ptr [eax]
    mov ebx, dword ptr [eax+04h]
    mov dword ptr [Dc9b1c], ebp
    mov dword ptr [Dc9b20], ebx
    mov ebp, dword ptr [eax+08h]
    mov ebx, dword ptr [eax+0ch]
    mov dword ptr [Dc9b24], ebp
    mov dword ptr [Dc9b28], ebx
    mov ebp, dword ptr [eax+010h]
    mov ebx, dword ptr [eax+014h]
    mov dword ptr [Dc9b2c], ebp
    mov dword ptr [Dc9b30], ebx
    mov ebp, dword ptr [eax+018h]
    mov ebx, dword ptr [eax+01ch]
    mov dword ptr [Dc9b34], ebp
    mov dword ptr [Dc9b38], ebx
    mov ebp, dword ptr [eax+020h]
    mov ebx, dword ptr [eax+024h]
    mov dword ptr [Dc9b3c], ebp
    mov dword ptr [Dc9b40], ebx
    mov ebp, dword ptr [eax+028h]
    mov ebx, dword ptr [eax+02ch]
    mov dword ptr [Dc9b44], ebp
    mov dword ptr [Dc9b48], ebx
    mov ebp, dword ptr [eax+030h]
    mov ebx, dword ptr [eax+034h]
    mov dword ptr [Dc9b4c], ebp
    mov dword ptr [Dc9b50], ebx
    mov ebp, dword ptr [eax+038h]
    mov ebx, dword ptr [eax+03ch]
    mov dword ptr [Dc9b54], ebp
    mov eax, dword ptr [edx+08h]
    add eax, dword ptr [Dc9be8]
    mov dword ptr [Dc9b58], ebx
    mov ebp, dword ptr [eax]
    mov ebx, dword ptr [eax+04h]
    mov dword ptr [Dc9b5c], ebp
    mov dword ptr [Dc9b60], ebx
    mov ebp, dword ptr [eax+08h]
    mov ebx, dword ptr [eax+0ch]
    mov dword ptr [Dc9b64], ebp
    mov dword ptr [Dc9b68], ebx
    mov ebp, dword ptr [eax+010h]
    mov ebx, dword ptr [eax+014h]
    mov dword ptr [Dc9b6c], ebp
    mov dword ptr [Dc9b70], ebx
    mov ebp, dword ptr [eax+018h]
    mov ebx, dword ptr [eax+01ch]
    mov dword ptr [Dc9b74], ebp
    mov dword ptr [Dc9b78], ebx
    mov ebp, dword ptr [eax+020h]
    mov ebx, dword ptr [eax+024h]
    mov dword ptr [Dc9b7c], ebp
    mov dword ptr [Dc9b80], ebx
    mov ebp, dword ptr [eax+028h]
    mov ebx, dword ptr [eax+02ch]
    mov dword ptr [Dc9b84], ebp
    mov dword ptr [Dc9b88], ebx
    mov ebp, dword ptr [eax+030h]
    mov ebx, dword ptr [eax+034h]
    mov dword ptr [Dc9b8c], ebp
    mov dword ptr [Dc9b90], ebx
    mov ebp, dword ptr [eax+038h]
    mov ebx, dword ptr [eax+03ch]
    mov dword ptr [Dc9b94], ebp
    mov dword ptr [Dc9b98], ebx
    mov ebp, dword ptr [eax+040h]
    mov ebx, dword ptr [eax+044h]
    mov dword ptr [Dc9b9c], ebp
    mov dword ptr [Dc9ba0], ebx
    mov ebp, dword ptr [eax+048h]
    mov ebx, dword ptr [eax+04ch]
    mov dword ptr [Dc9ba4], ebp
    mov dword ptr [Dc9ba8], ebx
    mov ebp, dword ptr [eax+050h]
    mov ebx, dword ptr [eax+054h]
    mov dword ptr [Dc9bac], ebp
    mov dword ptr [Dc9bb0], ebx
    mov ebp, dword ptr [eax+058h]
    mov ebx, dword ptr [eax+05ch]
    mov dword ptr [Dc9bb4], ebp
    mov dword ptr [Dc9bb8], ebx
    mov ebp, dword ptr [eax+060h]
    mov ebx, dword ptr [eax+064h]
    mov dword ptr [Dc9bbc], ebp
    mov dword ptr [Dc9bc0], ebx
    mov ebp, dword ptr [eax+068h]
    mov ebx, dword ptr [eax+06ch]
    mov dword ptr [Dc9bc4], ebp
    mov dword ptr [Dc9bc8], ebx
    mov ebp, dword ptr [eax+070h]
    mov ebx, dword ptr [eax+074h]
    mov dword ptr [Dc9bcc], ebp
    mov dword ptr [Dc9bd0], ebx
    mov ebp, dword ptr [eax+078h]
    mov ebx, dword ptr [eax+07ch]
    mov dword ptr [Dc9bd4], ebp
    mov dword ptr [Dc9bd8], ebx
    mov dword ptr [Dc9bf4], eax
    jmp L6129a
L611fa::
    mov dword ptr [Dc9b1c], 00h
    mov dword ptr [Dc9b20], 00h
    mov dword ptr [Dc9b24], 00h
    mov dword ptr [Dc9b28], 00h
    mov dword ptr [Dc9b2c], 00h
    mov dword ptr [Dc9b30], 00h
    mov dword ptr [Dc9b34], 00h
    mov dword ptr [Dc9b38], 00h
    mov dword ptr [Dc9b3c], 00h
    mov dword ptr [Dc9b40], 00h
    mov dword ptr [Dc9b44], 00h
    mov dword ptr [Dc9b48], 00h
    mov dword ptr [Dc9b4c], 00h
    mov dword ptr [Dc9b50], 00h
    mov dword ptr [Dc9b54], 00h
    mov dword ptr [Dc9b58], 00h
L6129a::
    add edi, dword ptr [Dc9a74]
    mov dword ptr [Dc9a68], 00h
    mov eax, dword ptr [esi]
    shr eax, cl
    inc cl
    jns L6f0b0
L612b6::
    test al, 01h
    jne L617fd
L612be::
    mov eax, dword ptr [esi]
    shr eax, cl
    inc cl
    jns L6f0bb
L612ca::
    and eax, 01h
    jne L612db
    test ch, 0ffh
    je L61348
    test ch, 02h
    jne L61323
    jmp L612fe
L612db::
    mov eax, dword ptr [esi]
    shr eax, cl
    inc cl
    jns L6f0c6
L612e7::
    and eax, 01h
    mov al, ch
    je L612f0
    inc al
L612f0::
    sub al, 02h
    sbb al, 00h
    and al, 03h
    mov ch, al
    je L61348
    test al, 02h
    jne L61323
L612fe::
    mov edx, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd edx, ebx, cl
    and edx, dword ptr [Dc9aa0]
    shl edx, 03h
    add edx, dword ptr [Dc9a78]
    add cl, byte ptr [Dc9af8]
    jb L6f3e8
    jmp L6136b
L61323::
    mov edx, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd edx, ebx, cl
    and edx, dword ptr [Dc9a9c]
    shl edx, 03h
    add edx, dword ptr [Dc9a80]
    add cl, byte ptr [Dc9afa]
    jb L6f3f4
    jmp L6136b
L61348::
    mov edx, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd edx, ebx, cl
    and edx, dword ptr [Dc9a98]
    shl edx, 03h
    add edx, dword ptr [Dc9a90]
    add cl, byte ptr [Dc9af9]
    jb L6f310
L6136b::
    mov eax, dword ptr [esi]
    shrd eax, ebx, cl
    add cl, 011h
    js L6137b
    add esi, 04h
    or cl, 0e0h
L6137b::
    mov ebx, dword ptr [edx+04h]
    mov ebp, dword ptr [edx]
    or dword ptr [Dc9a68], eax
    test eax, 0ffffh
    je L617f2
    mov edx, dword ptr [Dc9aa4]
    test al, 01h
    jne L61436
    test al, 02h
    jne L6146f
L613a7::
    test al, 010h
    jne L614aa
L613af::
    test al, 020h
    jne L614e5
L613b7::
    test al, 04h
    jne L61520
L613bf::
    add edi, dword ptr [Dc9aa8]
    test al, 08h
    jne L6155f
L613cd::
    test al, 040h
    jne L6159a
L613d5::
    test al, 080h
    jne L615d5
L613dd::
    test ah, 01h
    jne L61611
L613e6::
    add edi, dword ptr [Dc9aa8]
    test ah, 02h
    jne L61651
L613f5::
    test ah, 010h
    jne L6168d
L613fe::
    test ah, 020h
    jne L616c9
L61407::
    test ah, 04h
    jne L61705
L61410::
    add edi, dword ptr [Dc9aa8]
    test ah, 08h
    jne L61745
L6141f::
    test ah, 040h
    jne L61781
L61428::
    test ah, 080h
    jne L617b9
    jmp L617ec
L61436::
    test dword ptr [Dc9b1c], 04040h
    jne L6a23e
    mov dword ptr [edi], ebp
L61448::
    mov dword ptr [Dc9b5c], ebp
    test dword ptr [Dc9b1c], 040400000h
    jne L6a35a
    mov dword ptr [edx+edi*1], ebx
L61461::
    mov dword ptr [Dc9b60], ebx
    test al, 02h
    je L613a7
L6146f::
    test dword ptr [Dc9b20], 04040h
    jne L6a47e
    mov dword ptr [edi+04h], ebp
L61482::
    mov dword ptr [Dc9b64], ebp
    test dword ptr [Dc9b20], 040400000h
    jne L6a59e
    mov dword ptr [edx+edi*1+04h], ebx
L6149c::
    mov dword ptr [Dc9b68], ebx
    test al, 010h
    je L613af
L614aa::
    test dword ptr [Dc9b24], 04040h
    jne L6a6c6
    mov dword ptr [edi+08h], ebp
L614bd::
    mov dword ptr [Dc9b6c], ebp
    test dword ptr [Dc9b24], 040400000h
    jne L6a7e6
    mov dword ptr [edx+edi*1+08h], ebx
L614d7::
    mov dword ptr [Dc9b70], ebx
    test al, 020h
    je L613b7
L614e5::
    test dword ptr [Dc9b28], 04040h
    jne L6a90e
    mov dword ptr [edi+0ch], ebp
L614f8::
    mov dword ptr [Dc9b74], ebp
    test dword ptr [Dc9b28], 040400000h
    jne L6aa2e
    mov dword ptr [edx+edi*1+0ch], ebx
L61512::
    mov dword ptr [Dc9b78], ebx
    test al, 04h
    je L613bf
L61520::
    add edi, dword ptr [Dc9aa8]
    test dword ptr [Dc9b2c], 04040h
    jne L6ab56
    mov dword ptr [edi], ebp
L61538::
    mov dword ptr [Dc9b7c], ebp
    test dword ptr [Dc9b2c], 040400000h
    jne L6ac72
    mov dword ptr [edx+edi*1], ebx
L61551::
    mov dword ptr [Dc9b80], ebx
    test al, 08h
    je L613cd
L6155f::
    test dword ptr [Dc9b30], 04040h
    jne L6ad96
    mov dword ptr [edi+04h], ebp
L61572::
    mov dword ptr [Dc9b84], ebp
    test dword ptr [Dc9b30], 040400000h
    jne L6aeb6
    mov dword ptr [edx+edi*1+04h], ebx
L6158c::
    mov dword ptr [Dc9b88], ebx
    test al, 040h
    je L613d5
L6159a::
    test dword ptr [Dc9b34], 04040h
    jne L6afde
    mov dword ptr [edi+08h], ebp
L615ad::
    mov dword ptr [Dc9b8c], ebp
    test dword ptr [Dc9b34], 040400000h
    jne L6b0fe
    mov dword ptr [edx+edi*1+08h], ebx
L615c7::
    mov dword ptr [Dc9b90], ebx
    test al, 080h
    je L613dd
L615d5::
    test dword ptr [Dc9b38], 04040h
    jne L6b226
    mov dword ptr [edi+0ch], ebp
L615e8::
    mov dword ptr [Dc9b94], ebp
    test dword ptr [Dc9b38], 040400000h
    jne L6b346
    mov dword ptr [edx+edi*1+0ch], ebx
L61602::
    mov dword ptr [Dc9b98], ebx
    test ah, 01h
    je L613e6
L61611::
    add edi, dword ptr [Dc9aa8]
    test dword ptr [Dc9b3c], 04040h
    jne L6b46e
    mov dword ptr [edi], ebp
L61629::
    mov dword ptr [Dc9b9c], ebp
    test dword ptr [Dc9b3c], 040400000h
    jne L6b58a
    mov dword ptr [edx+edi*1], ebx
L61642::
    mov dword ptr [Dc9ba0], ebx
    test ah, 02h
    je L613f5
L61651::
    test dword ptr [Dc9b40], 04040h
    jne L6b6ae
    mov dword ptr [edi+04h], ebp
L61664::
    mov dword ptr [Dc9ba4], ebp
    test dword ptr [Dc9b40], 040400000h
    jne L6b7ce
    mov dword ptr [edx+edi*1+04h], ebx
L6167e::
    mov dword ptr [Dc9ba8], ebx
    test ah, 010h
    je L613fe
L6168d::
    test dword ptr [Dc9b44], 04040h
    jne L6b8f6
    mov dword ptr [edi+08h], ebp
L616a0::
    mov dword ptr [Dc9bac], ebp
    test dword ptr [Dc9b44], 040400000h
    jne L6ba16
    mov dword ptr [edx+edi*1+08h], ebx
L616ba::
    mov dword ptr [Dc9bb0], ebx
    test ah, 020h
    je L61407
L616c9::
    test dword ptr [Dc9b48], 04040h
    jne L6bb3e
    mov dword ptr [edi+0ch], ebp
L616dc::
    mov dword ptr [Dc9bb4], ebp
    test dword ptr [Dc9b48], 040400000h
    jne L6bc5e
    mov dword ptr [edx+edi*1+0ch], ebx
L616f6::
    mov dword ptr [Dc9bb8], ebx
    test ah, 04h
    je L61410
L61705::
    add edi, dword ptr [Dc9aa8]
    test dword ptr [Dc9b4c], 04040h
    jne L6bd86
    mov dword ptr [edi], ebp
L6171d::
    mov dword ptr [Dc9bbc], ebp
    test dword ptr [Dc9b4c], 040400000h
    jne L6bea2
    mov dword ptr [edx+edi*1], ebx
L61736::
    mov dword ptr [Dc9bc0], ebx
    test ah, 08h
    je L6141f
L61745::
    test dword ptr [Dc9b50], 04040h
    jne L6bfc6
    mov dword ptr [edi+04h], ebp
L61758::
    mov dword ptr [Dc9bc4], ebp
    test dword ptr [Dc9b50], 040400000h
    jne L6c0e6
    mov dword ptr [edx+edi*1+04h], ebx
L61772::
    mov dword ptr [Dc9bc8], ebx
    test ah, 040h
    je L61428
L61781::
    test dword ptr [Dc9b54], 04040h
    jne L6c20e
    mov dword ptr [edi+08h], ebp
L61794::
    mov dword ptr [Dc9bcc], ebp
    test dword ptr [Dc9b54], 040400000h
    jne L6c32e
    mov dword ptr [edx+edi*1+08h], ebx
L617ae::
    mov dword ptr [Dc9bd0], ebx
    test ah, 080h
    je L617ec
L617b9::
    test dword ptr [Dc9b58], 04040h
    jne L6c456
    mov dword ptr [edi+0ch], ebp
L617cc::
    mov dword ptr [Dc9bd4], ebp
    test dword ptr [Dc9b58], 040400000h
    jne L6c576
    mov dword ptr [edx+edi*1+0ch], ebx
L617e6::
    mov dword ptr [Dc9bd8], ebx
L617ec::
    sub edi, dword ptr [Dc9aac]
L617f2::
    test eax, 010000h
    je L612be
L617fd::
    mov eax, dword ptr [esi]
    shr eax, cl
    inc cl
    jns L6f0d1
L61809::
    test al, 01h
    jne L6299d
    mov ebp, dword ptr [Dc9a68]
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 04h
    jns L6f0dc
L61828::
    and eax, 0fh
    jmp dword ptr [eax*4+D61832]
Func605d8_ endp
D61832 dword offset Func61872_
    dword offset L6188c
    dword offset L618a9
    dword offset L618c9
    dword offset L618e5
    dword offset L61903
    dword offset L61926
    dword offset L61945
    dword offset L61965
    dword offset L61980
    dword offset L619a0
    dword offset L619bf
    dword offset L619db
    dword offset L619f2
    dword offset L61a0f
    dword offset L61a29
Func61872_ proc near
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 010h
    js L61885
    add esi, 04h
    or cl, 0e0h
L61885::
    xor ebp, eax
    jmp L61a2c
L6188c::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 0ch
    jns L6f0e7
L6189d::
    shl eax, 04h
    or al, 0fh
    xor ebp, eax
    jmp L61a2c
L618a9::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 0ch
    jns L6f0f2
L618ba::
    shl eax, 04h
    shr al, 04h
    or al, 0f0h
    xor ebp, eax
    jmp L61a2c
L618c9::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 08h
    jns L6f0fd
L618da::
    mov ah, al
    mov al, 0ffh
    xor ebp, eax
    jmp L61a2c
L618e5::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 0ch
    jns L6f108
L618f6::
    shl ah, 04h
    or ah, 0fh
    xor ebp, eax
    jmp L61a2c
L61903::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 08h
    jns L6f113
L61914::
    shl eax, 04h
    shl ah, 04h
    or eax, 0f0fh
    xor ebp, eax
    jmp L61a2c
L61926::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 08h
    jns L6f11e
L61937::
    mov ah, al
    or eax, 0ff0h
    xor ebp, eax
    jmp L61a2c
L61945::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 04h
    jns L6f129
L61956::
    shl eax, 0ch
    or eax, 0fffh
    xor ebp, eax
    jmp L61a2c
L61965::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 0ch
    jns L6f134
L61976::
    or ah, 0f0h
    xor ebp, eax
    jmp L61a2c
L61980::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 08h
    jns L6f13f
L61991::
    shl eax, 04h
    or eax, 0f00fh
    xor ebp, eax
    jmp L61a2c
L619a0::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 08h
    jns L6f14a
L619b1::
    mov ah, al
    ror ah, 04h
    or eax, 0f0f0h
    xor ebp, eax
    jmp L61a2c
L619bf::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 04h
    jns L6f155
L619d0::
    mov ah, al
    or eax, 0f0ffh
    xor ebp, eax
    jmp L61a2c
L619db::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 08h
    jns L6f160
L619ec::
    mov ah, 0ffh
    xor ebp, eax
    jmp L61a2c
L619f2::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 04h
    jns L6f16b
L61a03::
    or eax, 0fff0h
    rol al, 04h
    xor ebp, eax
    jmp L61a2c
L61a0f::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 04h
    jns L6f176
L61a20::
    or eax, 0fff0h
    xor ebp, eax
    jmp L61a2c
L61a29::
    xor ebp, 0ffffffffh
L61a2c::
    test ebp, 0ffffh
    je L602d0
    test ebp, 01h
    je L61b2b
    mov eax, dword ptr [esi]
    shr eax, cl
    inc cl
    jns L6f181
L61a50::
    and eax, 01h
    jne L61a61
    test ch, 0ffh
    je L61ace
    test ch, 02h
    jne L61aa9
    jmp L61a84
L61a61::
    mov eax, dword ptr [esi]
    shr eax, cl
    inc cl
    jns L6f18c
L61a6d::
    and eax, 01h
    mov al, ch
    je L61a76
    inc al
L61a76::
    sub al, 02h
    sbb al, 00h
    and al, 03h
    mov ch, al
    je L61ace
    test al, 02h
    jne L61aa9
L61a84::
    mov edx, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd edx, ebx, cl
    and edx, dword ptr [Dc9aa0]
    shl edx, 03h
    add edx, dword ptr [Dc9a78]
    add cl, byte ptr [Dc9af8]
    jb L6f400
    jmp L61af1
L61aa9::
    mov edx, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd edx, ebx, cl
    and edx, dword ptr [Dc9a9c]
    shl edx, 03h
    add edx, dword ptr [Dc9a80]
    add cl, byte ptr [Dc9afa]
    jb L6f40c
    jmp L61af1
L61ace::
    mov edx, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd edx, ebx, cl
    and edx, dword ptr [Dc9a98]
    shl edx, 03h
    add edx, dword ptr [Dc9a90]
    add cl, byte ptr [Dc9af9]
    jb L6f31c
L61af1::
    mov eax, dword ptr [edx]
    test dword ptr [Dc9b1c], 04040h
    jne L6c69e
    mov dword ptr [edi], eax
L61b05::
    mov dword ptr [Dc9b5c], eax
    mov eax, dword ptr [edx+04h]
    mov edx, dword ptr [Dc9aa4]
    test dword ptr [Dc9b1c], 040400000h
    jne L6c7ba
    mov dword ptr [edx+edi*1], eax
L61b26::
    mov dword ptr [Dc9b60], eax
L61b2b::
    test ebp, 02h
    je L61c20
    mov eax, dword ptr [esi]
    shr eax, cl
    inc cl
    jns L6f197
L61b43::
    and eax, 01h
    jne L61b54
    test ch, 0ffh
    je L61bc1
    test ch, 02h
    jne L61b9c
    jmp L61b77
L61b54::
    mov eax, dword ptr [esi]
    shr eax, cl
    inc cl
    jns L6f1a2
L61b60::
    and eax, 01h
    mov al, ch
    je L61b69
    inc al
L61b69::
    sub al, 02h
    sbb al, 00h
    and al, 03h
    mov ch, al
    je L61bc1
    test al, 02h
    jne L61b9c
L61b77::
    mov edx, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd edx, ebx, cl
    and edx, dword ptr [Dc9aa0]
    shl edx, 03h
    add edx, dword ptr [Dc9a78]
    add cl, byte ptr [Dc9af8]
    jb L6f418
    jmp L61be4
L61b9c::
    mov edx, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd edx, ebx, cl
    and edx, dword ptr [Dc9a9c]
    shl edx, 03h
    add edx, dword ptr [Dc9a80]
    add cl, byte ptr [Dc9afa]
    jb L6f424
    jmp L61be4
L61bc1::
    mov edx, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd edx, ebx, cl
    and edx, dword ptr [Dc9a98]
    shl edx, 03h
    add edx, dword ptr [Dc9a90]
    add cl, byte ptr [Dc9af9]
    jb L6f328
L61be4::
    mov eax, dword ptr [edx]
    test dword ptr [Dc9b20], 04040h
    jne L6c8de
    mov dword ptr [edi+04h], eax
L61bf9::
    mov dword ptr [Dc9b64], eax
    mov eax, dword ptr [edx+04h]
    mov edx, dword ptr [Dc9aa4]
    test dword ptr [Dc9b20], 040400000h
    jne L6c9fe
    mov dword ptr [edx+edi*1+04h], eax
L61c1b::
    mov dword ptr [Dc9b68], eax
L61c20::
    test ebp, 010h
    je L61d15
    mov eax, dword ptr [esi]
    shr eax, cl
    inc cl
    jns L6f1ad
L61c38::
    and eax, 01h
    jne L61c49
    test ch, 0ffh
    je L61cb6
    test ch, 02h
    jne L61c91
    jmp L61c6c
L61c49::
    mov eax, dword ptr [esi]
    shr eax, cl
    inc cl
    jns L6f1b8
L61c55::
    and eax, 01h
    mov al, ch
    je L61c5e
    inc al
L61c5e::
    sub al, 02h
    sbb al, 00h
    and al, 03h
    mov ch, al
    je L61cb6
    test al, 02h
    jne L61c91
L61c6c::
    mov edx, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd edx, ebx, cl
    and edx, dword ptr [Dc9aa0]
    shl edx, 03h
    add edx, dword ptr [Dc9a78]
    add cl, byte ptr [Dc9af8]
    jb L6f430
    jmp L61cd9
L61c91::
    mov edx, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd edx, ebx, cl
    and edx, dword ptr [Dc9a9c]
    shl edx, 03h
    add edx, dword ptr [Dc9a80]
    add cl, byte ptr [Dc9afa]
    jb L6f43c
    jmp L61cd9
L61cb6::
    mov edx, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd edx, ebx, cl
    and edx, dword ptr [Dc9a98]
    shl edx, 03h
    add edx, dword ptr [Dc9a90]
    add cl, byte ptr [Dc9af9]
    jb L6f334
L61cd9::
    mov eax, dword ptr [edx]
    test dword ptr [Dc9b24], 04040h
    jne L6cb26
    mov dword ptr [edi+08h], eax
L61cee::
    mov dword ptr [Dc9b6c], eax
    mov eax, dword ptr [edx+04h]
    mov edx, dword ptr [Dc9aa4]
    test dword ptr [Dc9b24], 040400000h
    jne L6cc46
    mov dword ptr [edx+edi*1+08h], eax
L61d10::
    mov dword ptr [Dc9b70], eax
L61d15::
    test ebp, 020h
    je L61e0a
    mov eax, dword ptr [esi]
    shr eax, cl
    inc cl
    jns L6f1c3
L61d2d::
    and eax, 01h
    jne L61d3e
    test ch, 0ffh
    je L61dab
    test ch, 02h
    jne L61d86
    jmp L61d61
L61d3e::
    mov eax, dword ptr [esi]
    shr eax, cl
    inc cl
    jns L6f1ce
L61d4a::
    and eax, 01h
    mov al, ch
    je L61d53
    inc al
L61d53::
    sub al, 02h
    sbb al, 00h
    and al, 03h
    mov ch, al
    je L61dab
    test al, 02h
    jne L61d86
L61d61::
    mov edx, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd edx, ebx, cl
    and edx, dword ptr [Dc9aa0]
    shl edx, 03h
    add edx, dword ptr [Dc9a78]
    add cl, byte ptr [Dc9af8]
    jb L6f448
    jmp L61dce
L61d86::
    mov edx, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd edx, ebx, cl
    and edx, dword ptr [Dc9a9c]
    shl edx, 03h
    add edx, dword ptr [Dc9a80]
    add cl, byte ptr [Dc9afa]
    jb L6f454
    jmp L61dce
L61dab::
    mov edx, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd edx, ebx, cl
    and edx, dword ptr [Dc9a98]
    shl edx, 03h
    add edx, dword ptr [Dc9a90]
    add cl, byte ptr [Dc9af9]
    jb L6f340
L61dce::
    mov eax, dword ptr [edx]
    test dword ptr [Dc9b28], 04040h
    jne L6cd6e
    mov dword ptr [edi+0ch], eax
L61de3::
    mov dword ptr [Dc9b74], eax
    mov eax, dword ptr [edx+04h]
    mov edx, dword ptr [Dc9aa4]
    test dword ptr [Dc9b28], 040400000h
    jne L6ce8e
    mov dword ptr [edx+edi*1+0ch], eax
L61e05::
    mov dword ptr [Dc9b78], eax
L61e0a::
    add edi, dword ptr [Dc9aa8]
    test ebp, 04h
    je L61f03
    mov eax, dword ptr [esi]
    shr eax, cl
    inc cl
    jns L6f1d9
L61e28::
    and eax, 01h
    jne L61e39
    test ch, 0ffh
    je L61ea6
    test ch, 02h
    jne L61e81
    jmp L61e5c
L61e39::
    mov eax, dword ptr [esi]
    shr eax, cl
    inc cl
    jns L6f1e4
L61e45::
    and eax, 01h
    mov al, ch
    je L61e4e
    inc al
L61e4e::
    sub al, 02h
    sbb al, 00h
    and al, 03h
    mov ch, al
    je L61ea6
    test al, 02h
    jne L61e81
L61e5c::
    mov edx, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd edx, ebx, cl
    and edx, dword ptr [Dc9aa0]
    shl edx, 03h
    add edx, dword ptr [Dc9a78]
    add cl, byte ptr [Dc9af8]
    jb L6f460
    jmp L61ec9
L61e81::
    mov edx, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd edx, ebx, cl
    and edx, dword ptr [Dc9a9c]
    shl edx, 03h
    add edx, dword ptr [Dc9a80]
    add cl, byte ptr [Dc9afa]
    jb L6f46c
    jmp L61ec9
L61ea6::
    mov edx, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd edx, ebx, cl
    and edx, dword ptr [Dc9a98]
    shl edx, 03h
    add edx, dword ptr [Dc9a90]
    add cl, byte ptr [Dc9af9]
    jb L6f34c
L61ec9::
    mov eax, dword ptr [edx]
    test dword ptr [Dc9b2c], 04040h
    jne L6cfb6
    mov dword ptr [edi], eax
L61edd::
    mov dword ptr [Dc9b7c], eax
    mov eax, dword ptr [edx+04h]
    mov edx, dword ptr [Dc9aa4]
    test dword ptr [Dc9b2c], 040400000h
    jne L6d0d2
    mov dword ptr [edx+edi*1], eax
L61efe::
    mov dword ptr [Dc9b80], eax
L61f03::
    test ebp, 08h
    je L61ff8
    mov eax, dword ptr [esi]
    shr eax, cl
    inc cl
    jns L6f1ef
L61f1b::
    and eax, 01h
    jne L61f2c
    test ch, 0ffh
    je L61f99
    test ch, 02h
    jne L61f74
    jmp L61f4f
L61f2c::
    mov eax, dword ptr [esi]
    shr eax, cl
    inc cl
    jns L6f1fa
L61f38::
    and eax, 01h
    mov al, ch
    je L61f41
    inc al
L61f41::
    sub al, 02h
    sbb al, 00h
    and al, 03h
    mov ch, al
    je L61f99
    test al, 02h
    jne L61f74
L61f4f::
    mov edx, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd edx, ebx, cl
    and edx, dword ptr [Dc9aa0]
    shl edx, 03h
    add edx, dword ptr [Dc9a78]
    add cl, byte ptr [Dc9af8]
    jb L6f478
    jmp L61fbc
L61f74::
    mov edx, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd edx, ebx, cl
    and edx, dword ptr [Dc9a9c]
    shl edx, 03h
    add edx, dword ptr [Dc9a80]
    add cl, byte ptr [Dc9afa]
    jb L6f484
    jmp L61fbc
L61f99::
    mov edx, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd edx, ebx, cl
    and edx, dword ptr [Dc9a98]
    shl edx, 03h
    add edx, dword ptr [Dc9a90]
    add cl, byte ptr [Dc9af9]
    jb L6f358
L61fbc::
    mov eax, dword ptr [edx]
    test dword ptr [Dc9b30], 04040h
    jne L6d1f6
    mov dword ptr [edi+04h], eax
L61fd1::
    mov dword ptr [Dc9b84], eax
    mov eax, dword ptr [edx+04h]
    mov edx, dword ptr [Dc9aa4]
    test dword ptr [Dc9b30], 040400000h
    jne L6d316
    mov dword ptr [edx+edi*1+04h], eax
L61ff3::
    mov dword ptr [Dc9b88], eax
L61ff8::
    test ebp, 040h
    je L620ed
    mov eax, dword ptr [esi]
    shr eax, cl
    inc cl
    jns L6f205
L62010::
    and eax, 01h
    jne L62021
    test ch, 0ffh
    je L6208e
    test ch, 02h
    jne L62069
    jmp L62044
L62021::
    mov eax, dword ptr [esi]
    shr eax, cl
    inc cl
    jns L6f210
L6202d::
    and eax, 01h
    mov al, ch
    je L62036
    inc al
L62036::
    sub al, 02h
    sbb al, 00h
    and al, 03h
    mov ch, al
    je L6208e
    test al, 02h
    jne L62069
L62044::
    mov edx, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd edx, ebx, cl
    and edx, dword ptr [Dc9aa0]
    shl edx, 03h
    add edx, dword ptr [Dc9a78]
    add cl, byte ptr [Dc9af8]
    jb L6f490
    jmp L620b1
L62069::
    mov edx, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd edx, ebx, cl
    and edx, dword ptr [Dc9a9c]
    shl edx, 03h
    add edx, dword ptr [Dc9a80]
    add cl, byte ptr [Dc9afa]
    jb L6f49c
    jmp L620b1
L6208e::
    mov edx, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd edx, ebx, cl
    and edx, dword ptr [Dc9a98]
    shl edx, 03h
    add edx, dword ptr [Dc9a90]
    add cl, byte ptr [Dc9af9]
    jb L6f364
L620b1::
    mov eax, dword ptr [edx]
    test dword ptr [Dc9b34], 04040h
    jne L6d43e
    mov dword ptr [edi+08h], eax
L620c6::
    mov dword ptr [Dc9b8c], eax
    mov eax, dword ptr [edx+04h]
    mov edx, dword ptr [Dc9aa4]
    test dword ptr [Dc9b34], 040400000h
    jne L6d55e
    mov dword ptr [edx+edi*1+08h], eax
L620e8::
    mov dword ptr [Dc9b90], eax
L620ed::
    test ebp, 080h
    je L621e2
    mov eax, dword ptr [esi]
    shr eax, cl
    inc cl
    jns L6f21b
L62105::
    and eax, 01h
    jne L62116
    test ch, 0ffh
    je L62183
    test ch, 02h
    jne L6215e
    jmp L62139
L62116::
    mov eax, dword ptr [esi]
    shr eax, cl
    inc cl
    jns L6f226
L62122::
    and eax, 01h
    mov al, ch
    je L6212b
    inc al
L6212b::
    sub al, 02h
    sbb al, 00h
    and al, 03h
    mov ch, al
    je L62183
    test al, 02h
    jne L6215e
L62139::
    mov edx, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd edx, ebx, cl
    and edx, dword ptr [Dc9aa0]
    shl edx, 03h
    add edx, dword ptr [Dc9a78]
    add cl, byte ptr [Dc9af8]
    jb L6f4a8
    jmp L621a6
L6215e::
    mov edx, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd edx, ebx, cl
    and edx, dword ptr [Dc9a9c]
    shl edx, 03h
    add edx, dword ptr [Dc9a80]
    add cl, byte ptr [Dc9afa]
    jb L6f4b4
    jmp L621a6
L62183::
    mov edx, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd edx, ebx, cl
    and edx, dword ptr [Dc9a98]
    shl edx, 03h
    add edx, dword ptr [Dc9a90]
    add cl, byte ptr [Dc9af9]
    jb L6f370
L621a6::
    mov eax, dword ptr [edx]
    test dword ptr [Dc9b38], 04040h
    jne L6d686
    mov dword ptr [edi+0ch], eax
L621bb::
    mov dword ptr [Dc9b94], eax
    mov eax, dword ptr [edx+04h]
    mov edx, dword ptr [Dc9aa4]
    test dword ptr [Dc9b38], 040400000h
    jne L6d7a6
    mov dword ptr [edx+edi*1+0ch], eax
L621dd::
    mov dword ptr [Dc9b98], eax
L621e2::
    add edi, dword ptr [Dc9aa8]
    test ebp, 0100h
    je L622db
    mov eax, dword ptr [esi]
    shr eax, cl
    inc cl
    jns L6f231
L62200::
    and eax, 01h
    jne L62211
    test ch, 0ffh
    je L6227e
    test ch, 02h
    jne L62259
    jmp L62234
L62211::
    mov eax, dword ptr [esi]
    shr eax, cl
    inc cl
    jns L6f23c
L6221d::
    and eax, 01h
    mov al, ch
    je L62226
    inc al
L62226::
    sub al, 02h
    sbb al, 00h
    and al, 03h
    mov ch, al
    je L6227e
    test al, 02h
    jne L62259
L62234::
    mov edx, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd edx, ebx, cl
    and edx, dword ptr [Dc9aa0]
    shl edx, 03h
    add edx, dword ptr [Dc9a78]
    add cl, byte ptr [Dc9af8]
    jb L6f4c0
    jmp L622a1
L62259::
    mov edx, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd edx, ebx, cl
    and edx, dword ptr [Dc9a9c]
    shl edx, 03h
    add edx, dword ptr [Dc9a80]
    add cl, byte ptr [Dc9afa]
    jb L6f4cc
    jmp L622a1
L6227e::
    mov edx, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd edx, ebx, cl
    and edx, dword ptr [Dc9a98]
    shl edx, 03h
    add edx, dword ptr [Dc9a90]
    add cl, byte ptr [Dc9af9]
    jb L6f37c
L622a1::
    mov eax, dword ptr [edx]
    test dword ptr [Dc9b3c], 04040h
    jne L6d8ce
    mov dword ptr [edi], eax
L622b5::
    mov dword ptr [Dc9b9c], eax
    mov eax, dword ptr [edx+04h]
    mov edx, dword ptr [Dc9aa4]
    test dword ptr [Dc9b3c], 040400000h
    jne L6d9ea
    mov dword ptr [edx+edi*1], eax
L622d6::
    mov dword ptr [Dc9ba0], eax
L622db::
    test ebp, 0200h
    je L623d0
    mov eax, dword ptr [esi]
    shr eax, cl
    inc cl
    jns L6f247
L622f3::
    and eax, 01h
    jne L62304
    test ch, 0ffh
    je L62371
    test ch, 02h
    jne L6234c
    jmp L62327
L62304::
    mov eax, dword ptr [esi]
    shr eax, cl
    inc cl
    jns L6f252
L62310::
    and eax, 01h
    mov al, ch
    je L62319
    inc al
L62319::
    sub al, 02h
    sbb al, 00h
    and al, 03h
    mov ch, al
    je L62371
    test al, 02h
    jne L6234c
L62327::
    mov edx, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd edx, ebx, cl
    and edx, dword ptr [Dc9aa0]
    shl edx, 03h
    add edx, dword ptr [Dc9a78]
    add cl, byte ptr [Dc9af8]
    jb L6f4d8
    jmp L62394
L6234c::
    mov edx, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd edx, ebx, cl
    and edx, dword ptr [Dc9a9c]
    shl edx, 03h
    add edx, dword ptr [Dc9a80]
    add cl, byte ptr [Dc9afa]
    jb L6f4e4
    jmp L62394
L62371::
    mov edx, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd edx, ebx, cl
    and edx, dword ptr [Dc9a98]
    shl edx, 03h
    add edx, dword ptr [Dc9a90]
    add cl, byte ptr [Dc9af9]
    jb L6f388
L62394::
    mov eax, dword ptr [edx]
    test dword ptr [Dc9b40], 04040h
    jne L6db0e
    mov dword ptr [edi+04h], eax
L623a9::
    mov dword ptr [Dc9ba4], eax
    mov eax, dword ptr [edx+04h]
    mov edx, dword ptr [Dc9aa4]
    test dword ptr [Dc9b40], 040400000h
    jne L6dc2e
    mov dword ptr [edx+edi*1+04h], eax
L623cb::
    mov dword ptr [Dc9ba8], eax
L623d0::
    test ebp, 01000h
    je L624c5
    mov eax, dword ptr [esi]
    shr eax, cl
    inc cl
    jns L6f25d
L623e8::
    and eax, 01h
    jne L623f9
    test ch, 0ffh
    je L62466
    test ch, 02h
    jne L62441
    jmp L6241c
L623f9::
    mov eax, dword ptr [esi]
    shr eax, cl
    inc cl
    jns L6f268
L62405::
    and eax, 01h
    mov al, ch
    je L6240e
    inc al
L6240e::
    sub al, 02h
    sbb al, 00h
    and al, 03h
    mov ch, al
    je L62466
    test al, 02h
    jne L62441
L6241c::
    mov edx, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd edx, ebx, cl
    and edx, dword ptr [Dc9aa0]
    shl edx, 03h
    add edx, dword ptr [Dc9a78]
    add cl, byte ptr [Dc9af8]
    jb L6f4f0
    jmp L62489
L62441::
    mov edx, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd edx, ebx, cl
    and edx, dword ptr [Dc9a9c]
    shl edx, 03h
    add edx, dword ptr [Dc9a80]
    add cl, byte ptr [Dc9afa]
    jb L6f4fc
    jmp L62489
L62466::
    mov edx, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd edx, ebx, cl
    and edx, dword ptr [Dc9a98]
    shl edx, 03h
    add edx, dword ptr [Dc9a90]
    add cl, byte ptr [Dc9af9]
    jb L6f394
L62489::
    mov eax, dword ptr [edx]
    test dword ptr [Dc9b44], 04040h
    jne L6dd56
    mov dword ptr [edi+08h], eax
L6249e::
    mov dword ptr [Dc9bac], eax
    mov eax, dword ptr [edx+04h]
    mov edx, dword ptr [Dc9aa4]
    test dword ptr [Dc9b44], 040400000h
    jne L6de76
    mov dword ptr [edx+edi*1+08h], eax
L624c0::
    mov dword ptr [Dc9bb0], eax
L624c5::
    test ebp, 02000h
    je L625ba
    mov eax, dword ptr [esi]
    shr eax, cl
    inc cl
    jns L6f273
L624dd::
    and eax, 01h
    jne L624ee
    test ch, 0ffh
    je L6255b
    test ch, 02h
    jne L62536
    jmp L62511
L624ee::
    mov eax, dword ptr [esi]
    shr eax, cl
    inc cl
    jns L6f27e
L624fa::
    and eax, 01h
    mov al, ch
    je L62503
    inc al
L62503::
    sub al, 02h
    sbb al, 00h
    and al, 03h
    mov ch, al
    je L6255b
    test al, 02h
    jne L62536
L62511::
    mov edx, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd edx, ebx, cl
    and edx, dword ptr [Dc9aa0]
    shl edx, 03h
    add edx, dword ptr [Dc9a78]
    add cl, byte ptr [Dc9af8]
    jb L6f508
    jmp L6257e
L62536::
    mov edx, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd edx, ebx, cl
    and edx, dword ptr [Dc9a9c]
    shl edx, 03h
    add edx, dword ptr [Dc9a80]
    add cl, byte ptr [Dc9afa]
    jb L6f514
    jmp L6257e
L6255b::
    mov edx, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd edx, ebx, cl
    and edx, dword ptr [Dc9a98]
    shl edx, 03h
    add edx, dword ptr [Dc9a90]
    add cl, byte ptr [Dc9af9]
    jb L6f3a0
L6257e::
    mov eax, dword ptr [edx]
    test dword ptr [Dc9b48], 04040h
    jne L6df9e
    mov dword ptr [edi+0ch], eax
L62593::
    mov dword ptr [Dc9bb4], eax
    mov eax, dword ptr [edx+04h]
    mov edx, dword ptr [Dc9aa4]
    test dword ptr [Dc9b48], 040400000h
    jne L6e0be
    mov dword ptr [edx+edi*1+0ch], eax
L625b5::
    mov dword ptr [Dc9bb8], eax
L625ba::
    add edi, dword ptr [Dc9aa8]
    test ebp, 0400h
    je L626b3
    mov eax, dword ptr [esi]
    shr eax, cl
    inc cl
    jns L6f289
L625d8::
    and eax, 01h
    jne L625e9
    test ch, 0ffh
    je L62656
    test ch, 02h
    jne L62631
    jmp L6260c
L625e9::
    mov eax, dword ptr [esi]
    shr eax, cl
    inc cl
    jns L6f294
L625f5::
    and eax, 01h
    mov al, ch
    je L625fe
    inc al
L625fe::
    sub al, 02h
    sbb al, 00h
    and al, 03h
    mov ch, al
    je L62656
    test al, 02h
    jne L62631
L6260c::
    mov edx, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd edx, ebx, cl
    and edx, dword ptr [Dc9aa0]
    shl edx, 03h
    add edx, dword ptr [Dc9a78]
    add cl, byte ptr [Dc9af8]
    jb L6f520
    jmp L62679
L62631::
    mov edx, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd edx, ebx, cl
    and edx, dword ptr [Dc9a9c]
    shl edx, 03h
    add edx, dword ptr [Dc9a80]
    add cl, byte ptr [Dc9afa]
    jb L6f52c
    jmp L62679
L62656::
    mov edx, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd edx, ebx, cl
    and edx, dword ptr [Dc9a98]
    shl edx, 03h
    add edx, dword ptr [Dc9a90]
    add cl, byte ptr [Dc9af9]
    jb L6f3ac
L62679::
    mov eax, dword ptr [edx]
    test dword ptr [Dc9b4c], 04040h
    jne L6e1e6
    mov dword ptr [edi], eax
L6268d::
    mov dword ptr [Dc9bbc], eax
    mov eax, dword ptr [edx+04h]
    mov edx, dword ptr [Dc9aa4]
    test dword ptr [Dc9b4c], 040400000h
    jne L6e302
    mov dword ptr [edx+edi*1], eax
L626ae::
    mov dword ptr [Dc9bc0], eax
L626b3::
    test ebp, 0800h
    je L627a8
    mov eax, dword ptr [esi]
    shr eax, cl
    inc cl
    jns L6f29f
L626cb::
    and eax, 01h
    jne L626dc
    test ch, 0ffh
    je L62749
    test ch, 02h
    jne L62724
    jmp L626ff
L626dc::
    mov eax, dword ptr [esi]
    shr eax, cl
    inc cl
    jns L6f2aa
L626e8::
    and eax, 01h
    mov al, ch
    je L626f1
    inc al
L626f1::
    sub al, 02h
    sbb al, 00h
    and al, 03h
    mov ch, al
    je L62749
    test al, 02h
    jne L62724
L626ff::
    mov edx, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd edx, ebx, cl
    and edx, dword ptr [Dc9aa0]
    shl edx, 03h
    add edx, dword ptr [Dc9a78]
    add cl, byte ptr [Dc9af8]
    jb L6f538
    jmp L6276c
L62724::
    mov edx, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd edx, ebx, cl
    and edx, dword ptr [Dc9a9c]
    shl edx, 03h
    add edx, dword ptr [Dc9a80]
    add cl, byte ptr [Dc9afa]
    jb L6f544
    jmp L6276c
L62749::
    mov edx, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd edx, ebx, cl
    and edx, dword ptr [Dc9a98]
    shl edx, 03h
    add edx, dword ptr [Dc9a90]
    add cl, byte ptr [Dc9af9]
    jb L6f3b8
L6276c::
    mov eax, dword ptr [edx]
    test dword ptr [Dc9b50], 04040h
    jne L6e426
    mov dword ptr [edi+04h], eax
L62781::
    mov dword ptr [Dc9bc4], eax
    mov eax, dword ptr [edx+04h]
    mov edx, dword ptr [Dc9aa4]
    test dword ptr [Dc9b50], 040400000h
    jne L6e546
    mov dword ptr [edx+edi*1+04h], eax
L627a3::
    mov dword ptr [Dc9bc8], eax
L627a8::
    test ebp, 04000h
    je L6289d
    mov eax, dword ptr [esi]
    shr eax, cl
    inc cl
    jns L6f2b5
L627c0::
    and eax, 01h
    jne L627d1
    test ch, 0ffh
    je L6283e
    test ch, 02h
    jne L62819
    jmp L627f4
L627d1::
    mov eax, dword ptr [esi]
    shr eax, cl
    inc cl
    jns L6f2c0
L627dd::
    and eax, 01h
    mov al, ch
    je L627e6
    inc al
L627e6::
    sub al, 02h
    sbb al, 00h
    and al, 03h
    mov ch, al
    je L6283e
    test al, 02h
    jne L62819
L627f4::
    mov edx, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd edx, ebx, cl
    and edx, dword ptr [Dc9aa0]
    shl edx, 03h
    add edx, dword ptr [Dc9a78]
    add cl, byte ptr [Dc9af8]
    jb L6f550
    jmp L62861
L62819::
    mov edx, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd edx, ebx, cl
    and edx, dword ptr [Dc9a9c]
    shl edx, 03h
    add edx, dword ptr [Dc9a80]
    add cl, byte ptr [Dc9afa]
    jb L6f55c
    jmp L62861
L6283e::
    mov edx, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd edx, ebx, cl
    and edx, dword ptr [Dc9a98]
    shl edx, 03h
    add edx, dword ptr [Dc9a90]
    add cl, byte ptr [Dc9af9]
    jb L6f3c4
L62861::
    mov eax, dword ptr [edx]
    test dword ptr [Dc9b54], 04040h
    jne L6e66e
    mov dword ptr [edi+08h], eax
L62876::
    mov dword ptr [Dc9bcc], eax
    mov eax, dword ptr [edx+04h]
    mov edx, dword ptr [Dc9aa4]
    test dword ptr [Dc9b54], 040400000h
    jne L6e78e
    mov dword ptr [edx+edi*1+08h], eax
L62898::
    mov dword ptr [Dc9bd0], eax
L6289d::
    test ebp, 08000h
    je L62992
    mov eax, dword ptr [esi]
    shr eax, cl
    inc cl
    jns L6f2cb
L628b5::
    and eax, 01h
    jne L628c6
    test ch, 0ffh
    je L62933
    test ch, 02h
    jne L6290e
    jmp L628e9
L628c6::
    mov eax, dword ptr [esi]
    shr eax, cl
    inc cl
    jns L6f2d6
L628d2::
    and eax, 01h
    mov al, ch
    je L628db
    inc al
L628db::
    sub al, 02h
    sbb al, 00h
    and al, 03h
    mov ch, al
    je L62933
    test al, 02h
    jne L6290e
L628e9::
    mov edx, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd edx, ebx, cl
    and edx, dword ptr [Dc9aa0]
    shl edx, 03h
    add edx, dword ptr [Dc9a78]
    add cl, byte ptr [Dc9af8]
    jb L6f568
    jmp L62956
L6290e::
    mov edx, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd edx, ebx, cl
    and edx, dword ptr [Dc9a9c]
    shl edx, 03h
    add edx, dword ptr [Dc9a80]
    add cl, byte ptr [Dc9afa]
    jb L6f574
    jmp L62956
L62933::
    mov edx, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd edx, ebx, cl
    and edx, dword ptr [Dc9a98]
    shl edx, 03h
    add edx, dword ptr [Dc9a90]
    add cl, byte ptr [Dc9af9]
    jb L6f3d0
L62956::
    mov eax, dword ptr [edx]
    test dword ptr [Dc9b58], 04040h
    jne L6e8b6
    mov dword ptr [edi+0ch], eax
L6296b::
    mov dword ptr [Dc9bd4], eax
    mov eax, dword ptr [edx+04h]
    mov edx, dword ptr [Dc9aa4]
    test dword ptr [Dc9b58], 040400000h
    jne L6e9d6
    mov dword ptr [edx+edi*1+0ch], eax
L6298d::
    mov dword ptr [Dc9bd8], eax
L62992::
    sub edi, dword ptr [Dc9aac]
    jmp L602d0
L6299d::
    test dword ptr [Dc9a94], 010000h
    je L602d0
L629ad::
    mov eax, dword ptr [esi]
    shr eax, cl
    inc cl
    jns L6f2e1
L629b9::
    test al, 01h
    jne L602d0
    mov eax, dword ptr [esi]
    shr eax, cl
    inc cl
    jns L6f2ec
L629cd::
    and eax, 01h
    jne L629de
    test ch, 0ffh
    je L62a4b
    test ch, 02h
    jne L62a26
    jmp L62a01
L629de::
    mov eax, dword ptr [esi]
    shr eax, cl
    inc cl
    jns L6f2f7
L629ea::
    and eax, 01h
    mov al, ch
    je L629f3
    inc al
L629f3::
    sub al, 02h
    sbb al, 00h
    and al, 03h
    mov ch, al
    je L62a4b
    test al, 02h
    jne L62a26
L62a01::
    mov edx, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd edx, ebx, cl
    and edx, dword ptr [Dc9aa0]
    shl edx, 03h
    add edx, dword ptr [Dc9a78]
    add cl, byte ptr [Dc9af8]
    jb L6f580
    jmp L62a6e
L62a26::
    mov edx, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd edx, ebx, cl
    and edx, dword ptr [Dc9a9c]
    shl edx, 03h
    add edx, dword ptr [Dc9a80]
    add cl, byte ptr [Dc9afa]
    jb L6f58c
    jmp L62a6e
L62a4b::
    mov edx, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd edx, ebx, cl
    and edx, dword ptr [Dc9a98]
    shl edx, 03h
    add edx, dword ptr [Dc9a90]
    add cl, byte ptr [Dc9af9]
    jb L6f3dc
L62a6e::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 04h
    jns L6f302
L62a7f::
    and eax, 0fh
    mov ebp, dword ptr [eax*4+Dc9ab8]
    mov ebx, dword ptr [edx]
    test dword ptr [eax*4+Dc9b1c], 04040h
    jne L6eafe
    mov dword ptr [ebp+edi*1+00h], ebx
L62aa0::
    mov dword ptr [eax*8+Dc9b5c], ebx
    mov ebx, dword ptr [edx+04h]
    add ebp, dword ptr [Dc9aa4]
    test dword ptr [eax*4+Dc9b1c], 040400000h
    jne L6ec2e
    mov dword ptr [ebp+edi*1+00h], ebx
L62ac5::
    mov dword ptr [eax*8+Dc9b60], ebx
    jmp L629ad
L62ad1::
    mov ecx, dword ptr [Dc9ab0]
    sub ecx, 034h
    cmp dword ptr [ecx+02ch], 00h
    je L67e16
    mov ebx, dword ptr [ecx+028h]
    mov eax, dword ptr [ecx]
    mov dword ptr [Dc9c28], ebx
    imul eax, dword ptr [ecx+04h]
    lea eax, [eax+eax*4]
    lea eax, [ecx+eax*4]
    mov dword ptr [Dc9a84], eax
    xor edi, edi
    mov eax, dword ptr [Dc9aa4]
L62b05::
    or edi, dword ptr [ecx+034h]
    js L67e00
    cmp edi, 040000000h
    jl L67e05
    and edi, 03fffffffh
    mov ebx, dword ptr [ecx+038h]
    add edi, dword ptr [Dc9a74]
    xor edx, edx
    add ebx, dword ptr [Dc9be4]
    or edx, dword ptr [ebx]
    je L63074
    mov ebp, dword ptr [ecx+03ch]
    push ebx
    add ebp, dword ptr [Dc9be8]
    push ecx
    cmp dl, 084h
    jne L62b4e
    call average_colour
L62b4e::
    mov bl, dl
    and bl, 0c0h
    cmp bl, 080h
    jne L62c88
    xor ebx, ebx
    add bl, dl
    jmp dword ptr [ebx*4+D62b67-80h*4]
Func61872_ endp
D62b67 dword offset L62c5d
    dword offset L62c3f
    dword offset L62c52
    dword offset L62c24
    dword offset L62c1c
    dword offset Func62bfb_
    dword offset Func62bfb_
    dword offset Func62bfb_
    dword offset Func62bfb_
    dword offset Func62bfb_
    dword offset Func62bfb_
    dword offset Func62bfb_
    dword offset Func62bfb_
    dword offset Func62bfb_
    dword offset Func62bfb_
    dword offset Func62bfb_
    dword offset Func62bfb_
    dword offset Func62bfb_
    dword offset Func62bfb_
    dword offset Func62bfb_
    dword offset Func62bfb_
    dword offset Func62bfb_
    dword offset Func62bfb_
    dword offset Func62bfb_
    dword offset Func62bfb_
    dword offset Func62bfb_
    dword offset Func62bfb_
    dword offset Func62bfb_
    dword offset Func62bfb_
    dword offset Func62bfb_
    dword offset Func62bfb_
    dword offset Func62bfb_
    dword offset Func62bfb_
    dword offset Func62bfb_
    dword offset Func62bfb_
    dword offset Func62bfb_
    dword offset Func62bfb_
Func62bfb_ proc near
    lea ecx, [ebx-085h]
    add ecx, dword ptr [Dc9bf0]
    mov ebx, dword ptr [Dc9bec]
    mov esi, dword ptr [ebp+00h]
    mov ebx, dword ptr [edi+ebx*1]
    call dword ptr [ecx*4+blend_ops]
    jmp L62c85
L62c1c::
    mov esi, dword ptr [Dc9c2c]
    jmp L62c85
L62c24::
    mov ebx, dword ptr [Dc9bec]
    mov esi, dword ptr [ebp+00h]
    mov ecx, dword ptr [Dc9bf0]
    mov ebx, dword ptr [edi+ebx*1]
    call dword ptr [ecx*4+blend_ops]
    jmp L62c85
L62c3f::
    mov esi, dword ptr [ebp+00h]
    add edi, dword ptr [Dc9bec]
    mov ebx, dword ptr [edi]
    sub edi, dword ptr [Dc9bec]
    jmp L62c69
L62c52::
    mov ebx, dword ptr [Dc9bec]
    mov esi, dword ptr [edi+ebx*1]
    jmp L62c85
L62c5d::
    mov ebx, dword ptr [Dc9cc4]
    mov esi, dword ptr [ebp+00h]
    xor ebx, dword ptr [ebp+06h]
L62c69::
    mov ecx, ebx
    and ecx, dword ptr [Dc9cc8]
    and ecx, esi
    and ebx, dword ptr [Dc9cc0]
    and esi, dword ptr [Dc9cc0]
    add esi, ebx
    rcr esi, 1
    add esi, ecx
L62c85::
    mov word ptr [edi], si
L62c88::
    cmp dh, 084h
    jne L62c92
    call average_colour
L62c92::
    mov bl, dh
    and bl, 0c0h
    cmp bl, 080h
    jne L62dd1
    xor ebx, ebx
    add bl, dh
    jmp dword ptr [ebx*4+D62b67-2fh*4]
Func62bfb_ endp
    dword offset L62da5
    dword offset L62d85
    dword offset L62d99
    dword offset L62d69
    dword offset L62d61
    dword offset Func62d3f_
    dword offset Func62d3f_
    dword offset Func62d3f_
    dword offset Func62d3f_
    dword offset Func62d3f_
    dword offset Func62d3f_
    dword offset Func62d3f_
    dword offset Func62d3f_
    dword offset Func62d3f_
    dword offset Func62d3f_
    dword offset Func62d3f_
    dword offset Func62d3f_
    dword offset Func62d3f_
    dword offset Func62d3f_
    dword offset Func62d3f_
    dword offset Func62d3f_
    dword offset Func62d3f_
    dword offset Func62d3f_
    dword offset Func62d3f_
    dword offset Func62d3f_
    dword offset Func62d3f_
    dword offset Func62d3f_
    dword offset Func62d3f_
    dword offset Func62d3f_
    dword offset Func62d3f_
    dword offset Func62d3f_
    dword offset Func62d3f_
    dword offset Func62d3f_
    dword offset Func62d3f_
    dword offset Func62d3f_
    dword offset Func62d3f_
    dword offset Func62d3f_
Func62d3f_ proc near
    lea ecx, [ebx-085h]
    add ecx, dword ptr [Dc9bf0]
    mov ebx, dword ptr [Dc9bec]
    mov esi, dword ptr [ebp+02h]
    mov ebx, dword ptr [edi+ebx*1+02h]
    call dword ptr [ecx*4+blend_ops]
    jmp L62dcd
L62d61::
    mov esi, dword ptr [Dc9c2c]
    jmp L62dcd
L62d69::
    mov ebx, dword ptr [Dc9bec]
    mov esi, dword ptr [ebp+02h]
    mov ecx, dword ptr [Dc9bf0]
    mov ebx, dword ptr [edi+ebx*1+02h]
    call dword ptr [ecx*4+blend_ops]
    jmp L62dcd
L62d85::
    mov esi, dword ptr [ebp+02h]
    add edi, dword ptr [Dc9bec]
    mov ebx, dword ptr [edi+02h]
    sub edi, dword ptr [Dc9bec]
    jmp L62db1
L62d99::
    mov ebx, dword ptr [Dc9bec]
    mov esi, dword ptr [edi+ebx*1+02h]
    jmp L62dcd
L62da5::
    mov ebx, dword ptr [Dc9cc4]
    mov esi, dword ptr [ebp+02h]
    xor ebx, dword ptr [ebp+0ch]
L62db1::
    mov ecx, ebx
    and ecx, dword ptr [Dc9cc8]
    and ecx, esi
    and ebx, dword ptr [Dc9cc0]
    and esi, dword ptr [Dc9cc0]
    add esi, ebx
    rcr esi, 1
    add esi, ecx
L62dcd::
    mov word ptr [edi+02h], si
L62dd1::
    bswap edx
    cmp dh, 084h
    jne L62ddd
    call average_colour
L62ddd::
    mov bl, dh
    and bl, 0c0h
    cmp bl, 080h
    jne L62f1f
    xor ebx, ebx
    add bl, dh
    jmp dword ptr [ebx*4+D62df6-80h*4]
Func62d3f_ endp
D62df6 dword offset L62ef3
    dword offset L62ed2
    dword offset L62ee6
    dword offset L62eb5
    dword offset L62ead
    dword offset Func62e8a_
    dword offset Func62e8a_
    dword offset Func62e8a_
    dword offset Func62e8a_
    dword offset Func62e8a_
    dword offset Func62e8a_
    dword offset Func62e8a_
    dword offset Func62e8a_
    dword offset Func62e8a_
    dword offset Func62e8a_
    dword offset Func62e8a_
    dword offset Func62e8a_
    dword offset Func62e8a_
    dword offset Func62e8a_
    dword offset Func62e8a_
    dword offset Func62e8a_
    dword offset Func62e8a_
    dword offset Func62e8a_
    dword offset Func62e8a_
    dword offset Func62e8a_
    dword offset Func62e8a_
    dword offset Func62e8a_
    dword offset Func62e8a_
    dword offset Func62e8a_
    dword offset Func62e8a_
    dword offset Func62e8a_
    dword offset Func62e8a_
    dword offset Func62e8a_
    dword offset Func62e8a_
    dword offset Func62e8a_
    dword offset Func62e8a_
    dword offset Func62e8a_
Func62e8a_ proc near
    lea ecx, [ebx-085h]
    add ecx, dword ptr [Dc9bf0]
    mov ebx, edi
    mov esi, dword ptr [ebp+04h]
    add ebx, dword ptr [Dc9bec]
    mov ebx, dword ptr [eax+ebx*1]
    call dword ptr [ecx*4+blend_ops]
    jmp L62f1b
L62ead::
    mov esi, dword ptr [Dc9c2c]
    jmp L62f1b
L62eb5::
    mov ebx, edi
    mov esi, dword ptr [ebp+04h]
    add ebx, dword ptr [Dc9bec]
    mov ecx, dword ptr [Dc9bf0]
    mov ebx, dword ptr [eax+ebx*1]
    call dword ptr [ecx*4+blend_ops]
    jmp L62f1b
L62ed2::
    mov esi, dword ptr [ebp+04h]
    add edi, dword ptr [Dc9bec]
    mov ebx, dword ptr [eax+edi*1]
    sub edi, dword ptr [Dc9bec]
    jmp L62eff
L62ee6::
    mov ebx, edi
    add ebx, dword ptr [Dc9bec]
    mov esi, dword ptr [eax+ebx*1]
    jmp L62f1b
L62ef3::
    mov ebx, dword ptr [Dc9cc4]
    mov esi, dword ptr [ebp+04h]
    xor ebx, dword ptr [ebp+022h]
L62eff::
    mov ecx, ebx
    and ecx, dword ptr [Dc9cc8]
    and ecx, esi
    and ebx, dword ptr [Dc9cc0]
    and esi, dword ptr [Dc9cc0]
    add esi, ebx
    rcr esi, 1
    add esi, ecx
L62f1b::
    mov word ptr [eax+edi*1], si
L62f1f::
    cmp dl, 084h
    jne L62f29
    call average_colour
L62f29::
    mov bl, dl
    and bl, 0c0h
    cmp bl, 080h
    jne L63070
    xor ebx, ebx
    add bl, dl
    jmp dword ptr [ebx*4+D62df6-2dh*4]
Func62e8a_ endp
    dword offset L63043
    dword offset L63020
    dword offset L63035
    dword offset L63002
    dword offset L62ffa
    dword offset Func62fd6_
    dword offset Func62fd6_
    dword offset Func62fd6_
    dword offset Func62fd6_
    dword offset Func62fd6_
    dword offset Func62fd6_
    dword offset Func62fd6_
    dword offset Func62fd6_
    dword offset Func62fd6_
    dword offset Func62fd6_
    dword offset Func62fd6_
    dword offset Func62fd6_
    dword offset Func62fd6_
    dword offset Func62fd6_
    dword offset Func62fd6_
    dword offset Func62fd6_
    dword offset Func62fd6_
    dword offset Func62fd6_
    dword offset Func62fd6_
    dword offset Func62fd6_
    dword offset Func62fd6_
    dword offset Func62fd6_
    dword offset Func62fd6_
    dword offset Func62fd6_
    dword offset Func62fd6_
    dword offset Func62fd6_
    dword offset Func62fd6_
    dword offset Func62fd6_
    dword offset Func62fd6_
    dword offset Func62fd6_
    dword offset Func62fd6_
    dword offset Func62fd6_
Func62fd6_ proc near
    lea ecx, [ebx-085h]
    add ecx, dword ptr [Dc9bf0]
    mov ebx, edi
    mov esi, dword ptr [ebp+06h]
    add ebx, dword ptr [Dc9bec]
    mov ebx, dword ptr [eax+ebx*1+02h]
    call dword ptr [ecx*4+blend_ops]
    jmp L6306b
L62ffa::
    mov esi, dword ptr [Dc9c2c]
    jmp L6306b
L63002::
    mov ebx, edi
    mov esi, dword ptr [ebp+06h]
    add ebx, dword ptr [Dc9bec]
    mov ecx, dword ptr [Dc9bf0]
    mov ebx, dword ptr [eax+ebx*1+02h]
    call dword ptr [ecx*4+blend_ops]
    jmp L6306b
L63020::
    mov esi, dword ptr [ebp+06h]
    add edi, dword ptr [Dc9bec]
    mov ebx, dword ptr [eax+edi*1+02h]
    sub edi, dword ptr [Dc9bec]
    jmp L6304f
L63035::
    mov ebx, edi
    add ebx, dword ptr [Dc9bec]
    mov esi, dword ptr [eax+ebx*1+02h]
    jmp L6306b
L63043::
    mov ebx, dword ptr [Dc9cc4]
    mov esi, dword ptr [ebp+06h]
    xor ebx, dword ptr [ebp+028h]
L6304f::
    mov ecx, ebx
    and ecx, dword ptr [Dc9cc8]
    and ecx, esi
    and ebx, dword ptr [Dc9cc0]
    and esi, dword ptr [Dc9cc0]
    add esi, ebx
    rcr esi, 1
    add esi, ecx
L6306b::
    mov word ptr [eax+edi*1+02h], si
L63070::
    pop ecx
    xor edx, edx
    pop ebx
L63074::
    or edx, dword ptr [ebx+04h]
    je L6359a
    mov ebp, dword ptr [ecx+03ch]
    push ebx
    add ebp, dword ptr [Dc9be8]
    push ecx
    mov bl, dl
    and bl, 0c0h
    cmp bl, 080h
    jne L631c7
    xor ebx, ebx
    add bl, dl
    jmp dword ptr [ebx*4+D630a1-80h*4]
Func62fd6_ endp
D630a1 dword offset L6319b
    dword offset L6317b
    dword offset L6318f
    dword offset L6315f
    dword offset L63157
    dword offset Func63135_
    dword offset Func63135_
    dword offset Func63135_
    dword offset Func63135_
    dword offset Func63135_
    dword offset Func63135_
    dword offset Func63135_
    dword offset Func63135_
    dword offset Func63135_
    dword offset Func63135_
    dword offset Func63135_
    dword offset Func63135_
    dword offset Func63135_
    dword offset Func63135_
    dword offset Func63135_
    dword offset Func63135_
    dword offset Func63135_
    dword offset Func63135_
    dword offset Func63135_
    dword offset Func63135_
    dword offset Func63135_
    dword offset Func63135_
    dword offset Func63135_
    dword offset Func63135_
    dword offset Func63135_
    dword offset Func63135_
    dword offset Func63135_
D63121 dword offset Func63135_
    dword offset Func63135_
    dword offset Func63135_
    dword offset Func63135_
    dword offset Func63135_
Func63135_ proc near
    lea ecx, [ebx-085h]
    add ecx, dword ptr [Dc9bf0]
    mov ebx, dword ptr [Dc9bec]
    mov esi, dword ptr [ebp+08h]
    mov ebx, dword ptr [edi+ebx*1+04h]
    call dword ptr [ecx*4+blend_ops]
    jmp L631c3
L63157::
    mov esi, dword ptr [Dc9c2c]
    jmp L631c3
L6315f::
    mov ebx, dword ptr [Dc9bec]
    mov esi, dword ptr [ebp+08h]
    mov ecx, dword ptr [Dc9bf0]
    mov ebx, dword ptr [edi+ebx*1+04h]
    call dword ptr [ecx*4+blend_ops]
    jmp L631c3
L6317b::
    mov esi, dword ptr [ebp+08h]
    add edi, dword ptr [Dc9bec]
    mov ebx, dword ptr [edi+04h]
    sub edi, dword ptr [Dc9bec]
    jmp L631a7
L6318f::
    mov ebx, dword ptr [Dc9bec]
    mov esi, dword ptr [edi+ebx*1+04h]
    jmp L631c3
L6319b::
    mov ebx, dword ptr [Dc9cc4]
    mov esi, dword ptr [ebp+08h]
    xor ebx, dword ptr [ebp+0eh]
L631a7::
    mov ecx, ebx
    and ecx, dword ptr [Dc9cc8]
    and ecx, esi
    and ebx, dword ptr [Dc9cc0]
    and esi, dword ptr [Dc9cc0]
    add esi, ebx
    rcr esi, 1
    add esi, ecx
L631c3::
    mov word ptr [edi+04h], si
L631c7::
    mov bl, dh
    and bl, 0c0h
    cmp bl, 080h
    jne L63306
    xor ebx, ebx
    add bl, dh
    jmp dword ptr [ebx*4+D631e0-80h*4]
Func63135_ endp
D631e0 dword offset L632da
    dword offset L632ba
    dword offset L632ce
    dword offset L6329e
    dword offset L63296
    dword offset Func63274_
    dword offset Func63274_
    dword offset Func63274_
    dword offset Func63274_
    dword offset Func63274_
    dword offset Func63274_
    dword offset Func63274_
    dword offset Func63274_
    dword offset Func63274_
    dword offset Func63274_
    dword offset Func63274_
    dword offset Func63274_
    dword offset Func63274_
    dword offset Func63274_
    dword offset Func63274_
    dword offset Func63274_
    dword offset Func63274_
    dword offset Func63274_
    dword offset Func63274_
    dword offset Func63274_
    dword offset Func63274_
    dword offset Func63274_
    dword offset Func63274_
    dword offset Func63274_
    dword offset Func63274_
    dword offset Func63274_
    dword offset Func63274_
    dword offset Func63274_
    dword offset Func63274_
D63268 dword offset Func63274_
    dword offset Func63274_
    dword offset Func63274_
Func63274_ proc near
    lea ecx, [ebx-085h]
    add ecx, dword ptr [Dc9bf0]
    mov ebx, dword ptr [Dc9bec]
    mov esi, dword ptr [ebp+0ah]
    mov ebx, dword ptr [edi+ebx*1+06h]
    call dword ptr [ecx*4+blend_ops]
    jmp L63302
L63296::
    mov esi, dword ptr [Dc9c2c]
    jmp L63302
L6329e::
    mov ebx, dword ptr [Dc9bec]
    mov esi, dword ptr [ebp+0ah]
    mov ecx, dword ptr [Dc9bf0]
    mov ebx, dword ptr [edi+ebx*1+06h]
    call dword ptr [ecx*4+blend_ops]
    jmp L63302
L632ba::
    mov esi, dword ptr [ebp+0ah]
    add edi, dword ptr [Dc9bec]
    mov ebx, dword ptr [edi+06h]
    sub edi, dword ptr [Dc9bec]
    jmp L632e6
L632ce::
    mov ebx, dword ptr [Dc9bec]
    mov esi, dword ptr [edi+ebx*1+06h]
    jmp L63302
L632da::
    mov ebx, dword ptr [Dc9cc4]
    mov esi, dword ptr [ebp+0ah]
    xor ebx, dword ptr [ebp+014h]
L632e6::
    mov ecx, ebx
    and ecx, dword ptr [Dc9cc8]
    and ecx, esi
    and ebx, dword ptr [Dc9cc0]
    and esi, dword ptr [Dc9cc0]
    add esi, ebx
    rcr esi, 1
    add esi, ecx
L63302::
    mov word ptr [edi+06h], si
L63306::
    bswap edx
    mov bl, dh
    and bl, 0c0h
    cmp bl, 080h
    jne L6344f
    xor ebx, ebx
    add bl, dh
    jmp dword ptr [ebx*4+D63121]
Func63274_ endp
    dword offset L63422
    dword offset L633ff
    dword offset L63414
    dword offset L633e1
    dword offset L633d9
    dword offset Func633b5_
    dword offset Func633b5_
    dword offset Func633b5_
    dword offset Func633b5_
    dword offset Func633b5_
    dword offset Func633b5_
    dword offset Func633b5_
    dword offset Func633b5_
    dword offset Func633b5_
    dword offset Func633b5_
    dword offset Func633b5_
    dword offset Func633b5_
    dword offset Func633b5_
    dword offset Func633b5_
    dword offset Func633b5_
    dword offset Func633b5_
    dword offset Func633b5_
    dword offset Func633b5_
    dword offset Func633b5_
    dword offset Func633b5_
    dword offset Func633b5_
    dword offset Func633b5_
    dword offset Func633b5_
    dword offset Func633b5_
    dword offset Func633b5_
    dword offset Func633b5_
    dword offset Func633b5_
    dword offset Func633b5_
    dword offset Func633b5_
    dword offset Func633b5_
    dword offset Func633b5_
    dword offset Func633b5_
Func633b5_ proc near
    lea ecx, [ebx-085h]
    add ecx, dword ptr [Dc9bf0]
    mov ebx, edi
    mov esi, dword ptr [ebp+0ch]
    add ebx, dword ptr [Dc9bec]
    mov ebx, dword ptr [eax+ebx*1+04h]
    call dword ptr [ecx*4+blend_ops]
    jmp L6344a
L633d9::
    mov esi, dword ptr [Dc9c2c]
    jmp L6344a
L633e1::
    mov ebx, edi
    mov esi, dword ptr [ebp+0ch]
    add ebx, dword ptr [Dc9bec]
    mov ecx, dword ptr [Dc9bf0]
    mov ebx, dword ptr [eax+ebx*1+04h]
    call dword ptr [ecx*4+blend_ops]
    jmp L6344a
L633ff::
    mov esi, dword ptr [ebp+0ch]
    add edi, dword ptr [Dc9bec]
    mov ebx, dword ptr [eax+edi*1+04h]
    sub edi, dword ptr [Dc9bec]
    jmp L6342e
L63414::
    mov ebx, edi
    add ebx, dword ptr [Dc9bec]
    mov esi, dword ptr [eax+ebx*1+04h]
    jmp L6344a
L63422::
    mov ebx, dword ptr [Dc9cc4]
    mov esi, dword ptr [ebp+0ch]
    xor ebx, dword ptr [ebp+02ah]
L6342e::
    mov ecx, ebx
    and ecx, dword ptr [Dc9cc8]
    and ecx, esi
    and ebx, dword ptr [Dc9cc0]
    and esi, dword ptr [Dc9cc0]
    add esi, ebx
    rcr esi, 1
    add esi, ecx
L6344a::
    mov word ptr [eax+edi*1+04h], si
L6344f::
    mov bl, dl
    and bl, 0c0h
    cmp bl, 080h
    jne L63596
    xor ebx, ebx
    add bl, dl
    jmp dword ptr [ebx*4+D63268]
Func633b5_ endp
    dword offset L63569
    dword offset L63546
    dword offset L6355b
    dword offset L63528
    dword offset L63520
    dword offset Func634fc_
    dword offset Func634fc_
    dword offset Func634fc_
    dword offset Func634fc_
    dword offset Func634fc_
    dword offset Func634fc_
    dword offset Func634fc_
    dword offset Func634fc_
    dword offset Func634fc_
    dword offset Func634fc_
    dword offset Func634fc_
    dword offset Func634fc_
    dword offset Func634fc_
    dword offset Func634fc_
    dword offset Func634fc_
    dword offset Func634fc_
    dword offset Func634fc_
    dword offset Func634fc_
    dword offset Func634fc_
    dword offset Func634fc_
    dword offset Func634fc_
    dword offset Func634fc_
    dword offset Func634fc_
    dword offset Func634fc_
    dword offset Func634fc_
    dword offset Func634fc_
    dword offset Func634fc_
    dword offset Func634fc_
    dword offset Func634fc_
    dword offset Func634fc_
    dword offset Func634fc_
    dword offset Func634fc_
Func634fc_ proc near
    lea ecx, [ebx-085h]
    add ecx, dword ptr [Dc9bf0]
    mov ebx, edi
    mov esi, dword ptr [ebp+0eh]
    add ebx, dword ptr [Dc9bec]
    mov ebx, dword ptr [eax+ebx*1+06h]
    call dword ptr [ecx*4+blend_ops]
    jmp L63591
L63520::
    mov esi, dword ptr [Dc9c2c]
    jmp L63591
L63528::
    mov ebx, edi
    mov esi, dword ptr [ebp+0eh]
    add ebx, dword ptr [Dc9bec]
    mov ecx, dword ptr [Dc9bf0]
    mov ebx, dword ptr [eax+ebx*1+06h]
    call dword ptr [ecx*4+blend_ops]
    jmp L63591
L63546::
    mov esi, dword ptr [ebp+0eh]
    add edi, dword ptr [Dc9bec]
    mov ebx, dword ptr [eax+edi*1+06h]
    sub edi, dword ptr [Dc9bec]
    jmp L63575
L6355b::
    mov ebx, edi
    add ebx, dword ptr [Dc9bec]
    mov esi, dword ptr [eax+ebx*1+06h]
    jmp L63591
L63569::
    mov ebx, dword ptr [Dc9cc4]
    mov esi, dword ptr [ebp+0eh]
    xor ebx, dword ptr [ebp+030h]
L63575::
    mov ecx, ebx
    and ecx, dword ptr [Dc9cc8]
    and ecx, esi
    and ebx, dword ptr [Dc9cc0]
    and esi, dword ptr [Dc9cc0]
    add esi, ebx
    rcr esi, 1
    add esi, ecx
L63591::
    mov word ptr [eax+edi*1+06h], si
L63596::
    pop ecx
    xor edx, edx
    pop ebx
L6359a::
    or edx, dword ptr [ebx+08h]
    je L63ac0
    mov ebp, dword ptr [ecx+03ch]
    push ebx
    add ebp, dword ptr [Dc9be8]
    push ecx
    mov bl, dl
    and bl, 0c0h
    cmp bl, 080h
    jne L636ed
    xor ebx, ebx
    add bl, dl
    jmp dword ptr [ebx*4+D635c7-80h*4]
Func634fc_ endp
D635c7 dword offset L636c1
    dword offset L636a1
    dword offset L636b5
    dword offset L63685
    dword offset L6367d
    dword offset Func6365b_
    dword offset Func6365b_
    dword offset Func6365b_
    dword offset Func6365b_
    dword offset Func6365b_
    dword offset Func6365b_
    dword offset Func6365b_
    dword offset Func6365b_
    dword offset Func6365b_
    dword offset Func6365b_
    dword offset Func6365b_
    dword offset Func6365b_
    dword offset Func6365b_
    dword offset Func6365b_
    dword offset Func6365b_
    dword offset Func6365b_
    dword offset Func6365b_
    dword offset Func6365b_
    dword offset Func6365b_
    dword offset Func6365b_
    dword offset Func6365b_
    dword offset Func6365b_
    dword offset Func6365b_
    dword offset Func6365b_
    dword offset Func6365b_
    dword offset Func6365b_
    dword offset Func6365b_
D63647 dword offset Func6365b_
    dword offset Func6365b_
    dword offset Func6365b_
    dword offset Func6365b_
    dword offset Func6365b_
Func6365b_ proc near
    lea ecx, [ebx-085h]
    add ecx, dword ptr [Dc9bf0]
    mov ebx, dword ptr [Dc9bec]
    mov esi, dword ptr [ebp+010h]
    mov ebx, dword ptr [edi+ebx*1+08h]
    call dword ptr [ecx*4+blend_ops]
    jmp L636e9
L6367d::
    mov esi, dword ptr [Dc9c2c]
    jmp L636e9
L63685::
    mov ebx, dword ptr [Dc9bec]
    mov esi, dword ptr [ebp+010h]
    mov ecx, dword ptr [Dc9bf0]
    mov ebx, dword ptr [edi+ebx*1+08h]
    call dword ptr [ecx*4+blend_ops]
    jmp L636e9
L636a1::
    mov esi, dword ptr [ebp+010h]
    add edi, dword ptr [Dc9bec]
    mov ebx, dword ptr [edi+08h]
    sub edi, dword ptr [Dc9bec]
    jmp L636cd
L636b5::
    mov ebx, dword ptr [Dc9bec]
    mov esi, dword ptr [edi+ebx*1+08h]
    jmp L636e9
L636c1::
    mov ebx, dword ptr [Dc9cc4]
    mov esi, dword ptr [ebp+010h]
    xor ebx, dword ptr [ebp+016h]
L636cd::
    mov ecx, ebx
    and ecx, dword ptr [Dc9cc8]
    and ecx, esi
    and ebx, dword ptr [Dc9cc0]
    and esi, dword ptr [Dc9cc0]
    add esi, ebx
    rcr esi, 1
    add esi, ecx
L636e9::
    mov word ptr [edi+08h], si
L636ed::
    mov bl, dh
    and bl, 0c0h
    cmp bl, 080h
    jne L6382c
    xor ebx, ebx
    add bl, dh
    jmp dword ptr [ebx*4+D63706-80h*4]
Func6365b_ endp
D63706 dword offset L63800
    dword offset L637e0
    dword offset L637f4
    dword offset L637c4
    dword offset L637bc
    dword offset Func6379a_
    dword offset Func6379a_
    dword offset Func6379a_
    dword offset Func6379a_
    dword offset Func6379a_
    dword offset Func6379a_
    dword offset Func6379a_
    dword offset Func6379a_
    dword offset Func6379a_
    dword offset Func6379a_
    dword offset Func6379a_
    dword offset Func6379a_
    dword offset Func6379a_
    dword offset Func6379a_
    dword offset Func6379a_
    dword offset Func6379a_
    dword offset Func6379a_
    dword offset Func6379a_
    dword offset Func6379a_
    dword offset Func6379a_
    dword offset Func6379a_
    dword offset Func6379a_
    dword offset Func6379a_
    dword offset Func6379a_
    dword offset Func6379a_
    dword offset Func6379a_
    dword offset Func6379a_
    dword offset Func6379a_
    dword offset Func6379a_
D6378e dword offset Func6379a_
    dword offset Func6379a_
    dword offset Func6379a_
Func6379a_ proc near
    lea ecx, [ebx-085h]
    add ecx, dword ptr [Dc9bf0]
    mov ebx, dword ptr [Dc9bec]
    mov esi, dword ptr [ebp+012h]
    mov ebx, dword ptr [edi+ebx*1+0ah]
    call dword ptr [ecx*4+blend_ops]
    jmp L63828
L637bc::
    mov esi, dword ptr [Dc9c2c]
    jmp L63828
L637c4::
    mov ebx, dword ptr [Dc9bec]
    mov esi, dword ptr [ebp+012h]
    mov ecx, dword ptr [Dc9bf0]
    mov ebx, dword ptr [edi+ebx*1+0ah]
    call dword ptr [ecx*4+blend_ops]
    jmp L63828
L637e0::
    mov esi, dword ptr [ebp+012h]
    add edi, dword ptr [Dc9bec]
    mov ebx, dword ptr [edi+0ah]
    sub edi, dword ptr [Dc9bec]
    jmp L6380c
L637f4::
    mov ebx, dword ptr [Dc9bec]
    mov esi, dword ptr [edi+ebx*1+0ah]
    jmp L63828
L63800::
    mov ebx, dword ptr [Dc9cc4]
    mov esi, dword ptr [ebp+012h]
    xor ebx, dword ptr [ebp+01ch]
L6380c::
    mov ecx, ebx
    and ecx, dword ptr [Dc9cc8]
    and ecx, esi
    and ebx, dword ptr [Dc9cc0]
    and esi, dword ptr [Dc9cc0]
    add esi, ebx
    rcr esi, 1
    add esi, ecx
L63828::
    mov word ptr [edi+0ah], si
L6382c::
    bswap edx
    mov bl, dh
    and bl, 0c0h
    cmp bl, 080h
    jne L63975
    xor ebx, ebx
    add bl, dh
    jmp dword ptr [ebx*4+D63647]
Func6379a_ endp
    dword offset L63948
    dword offset L63925
    dword offset L6393a
    dword offset L63907
    dword offset L638ff
    dword offset Func638db_
    dword offset Func638db_
    dword offset Func638db_
    dword offset Func638db_
    dword offset Func638db_
    dword offset Func638db_
    dword offset Func638db_
    dword offset Func638db_
    dword offset Func638db_
    dword offset Func638db_
    dword offset Func638db_
    dword offset Func638db_
    dword offset Func638db_
    dword offset Func638db_
    dword offset Func638db_
    dword offset Func638db_
    dword offset Func638db_
    dword offset Func638db_
    dword offset Func638db_
    dword offset Func638db_
    dword offset Func638db_
    dword offset Func638db_
    dword offset Func638db_
    dword offset Func638db_
    dword offset Func638db_
    dword offset Func638db_
    dword offset Func638db_
    dword offset Func638db_
    dword offset Func638db_
    dword offset Func638db_
    dword offset Func638db_
    dword offset Func638db_
Func638db_ proc near
    lea ecx, [ebx-085h]
    add ecx, dword ptr [Dc9bf0]
    mov ebx, edi
    mov esi, dword ptr [ebp+014h]
    add ebx, dword ptr [Dc9bec]
    mov ebx, dword ptr [eax+ebx*1+08h]
    call dword ptr [ecx*4+blend_ops]
    jmp L63970
L638ff::
    mov esi, dword ptr [Dc9c2c]
    jmp L63970
L63907::
    mov ebx, edi
    mov esi, dword ptr [ebp+014h]
    add ebx, dword ptr [Dc9bec]
    mov ecx, dword ptr [Dc9bf0]
    mov ebx, dword ptr [eax+ebx*1+08h]
    call dword ptr [ecx*4+blend_ops]
    jmp L63970
L63925::
    mov esi, dword ptr [ebp+014h]
    add edi, dword ptr [Dc9bec]
    mov ebx, dword ptr [eax+edi*1+08h]
    sub edi, dword ptr [Dc9bec]
    jmp L63954
L6393a::
    mov ebx, edi
    add ebx, dword ptr [Dc9bec]
    mov esi, dword ptr [eax+ebx*1+08h]
    jmp L63970
L63948::
    mov ebx, dword ptr [Dc9cc4]
    mov esi, dword ptr [ebp+014h]
    xor ebx, dword ptr [ebp+032h]
L63954::
    mov ecx, ebx
    and ecx, dword ptr [Dc9cc8]
    and ecx, esi
    and ebx, dword ptr [Dc9cc0]
    and esi, dword ptr [Dc9cc0]
    add esi, ebx
    rcr esi, 1
    add esi, ecx
L63970::
    mov word ptr [eax+edi*1+08h], si
L63975::
    mov bl, dl
    and bl, 0c0h
    cmp bl, 080h
    jne L63abc
    xor ebx, ebx
    add bl, dl
    jmp dword ptr [ebx*4+D6378e]
Func638db_ endp
    dword offset L63a8f
    dword offset L63a6c
    dword offset L63a81
    dword offset L63a4e
    dword offset L63a46
    dword offset Func63a22_
    dword offset Func63a22_
    dword offset Func63a22_
    dword offset Func63a22_
    dword offset Func63a22_
    dword offset Func63a22_
    dword offset Func63a22_
    dword offset Func63a22_
    dword offset Func63a22_
    dword offset Func63a22_
    dword offset Func63a22_
    dword offset Func63a22_
    dword offset Func63a22_
    dword offset Func63a22_
    dword offset Func63a22_
    dword offset Func63a22_
    dword offset Func63a22_
    dword offset Func63a22_
    dword offset Func63a22_
    dword offset Func63a22_
    dword offset Func63a22_
    dword offset Func63a22_
    dword offset Func63a22_
    dword offset Func63a22_
    dword offset Func63a22_
    dword offset Func63a22_
    dword offset Func63a22_
    dword offset Func63a22_
    dword offset Func63a22_
    dword offset Func63a22_
    dword offset Func63a22_
    dword offset Func63a22_
Func63a22_ proc near
    lea ecx, [ebx-085h]
    add ecx, dword ptr [Dc9bf0]
    mov ebx, edi
    mov esi, dword ptr [ebp+016h]
    add ebx, dword ptr [Dc9bec]
    mov ebx, dword ptr [eax+ebx*1+0ah]
    call dword ptr [ecx*4+blend_ops]
    jmp L63ab7
L63a46::
    mov esi, dword ptr [Dc9c2c]
    jmp L63ab7
L63a4e::
    mov ebx, edi
    mov esi, dword ptr [ebp+016h]
    add ebx, dword ptr [Dc9bec]
    mov ecx, dword ptr [Dc9bf0]
    mov ebx, dword ptr [eax+ebx*1+0ah]
    call dword ptr [ecx*4+blend_ops]
    jmp L63ab7
L63a6c::
    mov esi, dword ptr [ebp+016h]
    add edi, dword ptr [Dc9bec]
    mov ebx, dword ptr [eax+edi*1+0ah]
    sub edi, dword ptr [Dc9bec]
    jmp L63a9b
L63a81::
    mov ebx, edi
    add ebx, dword ptr [Dc9bec]
    mov esi, dword ptr [eax+ebx*1+0ah]
    jmp L63ab7
L63a8f::
    mov ebx, dword ptr [Dc9cc4]
    mov esi, dword ptr [ebp+016h]
    xor ebx, dword ptr [ebp+038h]
L63a9b::
    mov ecx, ebx
    and ecx, dword ptr [Dc9cc8]
    and ecx, esi
    and ebx, dword ptr [Dc9cc0]
    and esi, dword ptr [Dc9cc0]
    add esi, ebx
    rcr esi, 1
    add esi, ecx
L63ab7::
    mov word ptr [eax+edi*1+0ah], si
L63abc::
    pop ecx
    xor edx, edx
    pop ebx
L63ac0::
    or edx, dword ptr [ebx+0ch]
    je L63fec
    mov ebp, dword ptr [ecx+03ch]
    push ebx
    add ebp, dword ptr [Dc9be8]
    push ecx
    mov bl, dl
    and bl, 0c0h
    cmp bl, 080h
    jne L63c13
    xor ebx, ebx
    add bl, dl
    jmp dword ptr [ebx*4+D63aed-80h*4]
Func63a22_ endp
D63aed dword offset L63be7
    dword offset L63bc7
    dword offset L63bdb
    dword offset L63bab
    dword offset L63ba3
    dword offset Func63b81_
    dword offset Func63b81_
    dword offset Func63b81_
    dword offset Func63b81_
    dword offset Func63b81_
    dword offset Func63b81_
    dword offset Func63b81_
    dword offset Func63b81_
    dword offset Func63b81_
    dword offset Func63b81_
    dword offset Func63b81_
    dword offset Func63b81_
    dword offset Func63b81_
    dword offset Func63b81_
    dword offset Func63b81_
    dword offset Func63b81_
    dword offset Func63b81_
    dword offset Func63b81_
    dword offset Func63b81_
    dword offset Func63b81_
    dword offset Func63b81_
    dword offset Func63b81_
    dword offset Func63b81_
    dword offset Func63b81_
    dword offset Func63b81_
    dword offset Func63b81_
    dword offset Func63b81_
    dword offset Func63b81_
    dword offset Func63b81_
    dword offset Func63b81_
    dword offset Func63b81_
    dword offset Func63b81_
Func63b81_ proc near
    lea ecx, [ebx-085h]
    add ecx, dword ptr [Dc9bf0]
    mov ebx, dword ptr [Dc9bec]
    mov esi, dword ptr [ebp+018h]
    mov ebx, dword ptr [edi+ebx*1+0ch]
    call dword ptr [ecx*4+blend_ops]
    jmp L63c0f
L63ba3::
    mov esi, dword ptr [Dc9c2c]
    jmp L63c0f
L63bab::
    mov ebx, dword ptr [Dc9bec]
    mov esi, dword ptr [ebp+018h]
    mov ecx, dword ptr [Dc9bf0]
    mov ebx, dword ptr [edi+ebx*1+0ch]
    call dword ptr [ecx*4+blend_ops]
    jmp L63c0f
L63bc7::
    mov esi, dword ptr [ebp+018h]
    add edi, dword ptr [Dc9bec]
    mov ebx, dword ptr [edi+0ch]
    sub edi, dword ptr [Dc9bec]
    jmp L63bf3
L63bdb::
    mov ebx, dword ptr [Dc9bec]
    mov esi, dword ptr [edi+ebx*1+0ch]
    jmp L63c0f
L63be7::
    mov ebx, dword ptr [Dc9cc4]
    mov esi, dword ptr [ebp+018h]
    xor ebx, dword ptr [ebp+01eh]
L63bf3::
    mov ecx, ebx
    and ecx, dword ptr [Dc9cc8]
    and ecx, esi
    and ebx, dword ptr [Dc9cc0]
    and esi, dword ptr [Dc9cc0]
    add esi, ebx
    rcr esi, 1
    add esi, ecx
L63c0f::
    mov word ptr [edi+0ch], si
L63c13::
    mov bl, dh
    and bl, 0c0h
    cmp bl, 080h
    jne L63d55
    xor ebx, ebx
    add bl, dh
    jmp dword ptr [ebx*4+D63c2c-80h*4]
Func63b81_ endp
D63c2c dword offset L63d26
    dword offset L63d06
    dword offset L63d1a
    dword offset L63cea
    dword offset L63ce2
    dword offset Func63cc0_
    dword offset Func63cc0_
    dword offset Func63cc0_
    dword offset Func63cc0_
    dword offset Func63cc0_
    dword offset Func63cc0_
    dword offset Func63cc0_
    dword offset Func63cc0_
    dword offset Func63cc0_
    dword offset Func63cc0_
    dword offset Func63cc0_
    dword offset Func63cc0_
    dword offset Func63cc0_
    dword offset Func63cc0_
    dword offset Func63cc0_
    dword offset Func63cc0_
    dword offset Func63cc0_
    dword offset Func63cc0_
    dword offset Func63cc0_
    dword offset Func63cc0_
    dword offset Func63cc0_
    dword offset Func63cc0_
    dword offset Func63cc0_
    dword offset Func63cc0_
    dword offset Func63cc0_
    dword offset Func63cc0_
    dword offset Func63cc0_
    dword offset Func63cc0_
    dword offset Func63cc0_
    dword offset Func63cc0_
    dword offset Func63cc0_
    dword offset Func63cc0_
Func63cc0_ proc near
    lea ecx, [ebx-085h]
    add ecx, dword ptr [Dc9bf0]
    mov ebx, dword ptr [Dc9bec]
    mov esi, dword ptr [ebp+01ah]
    mov ebx, dword ptr [edi+ebx*1+0eh]
    call dword ptr [ecx*4+blend_ops]
    jmp L63d51
L63ce2::
    mov esi, dword ptr [Dc9c2c]
    jmp L63d51
L63cea::
    mov ebx, dword ptr [Dc9bec]
    mov esi, dword ptr [ebp+01ah]
    mov ecx, dword ptr [Dc9bf0]
    mov ebx, dword ptr [edi+ebx*1+0eh]
    call dword ptr [ecx*4+blend_ops]
    jmp L63d51
L63d06::
    mov esi, dword ptr [ebp+01ah]
    add edi, dword ptr [Dc9bec]
    mov ebx, dword ptr [edi+0eh]
    sub edi, dword ptr [Dc9bec]
    jmp L63d35
L63d1a::
    mov ebx, dword ptr [Dc9bec]
    mov esi, dword ptr [edi+ebx*1+0eh]
    jmp L63d51
L63d26::
    mov ebx, dword ptr [Dc9cc4]
    mov esi, dword ptr [ebp+01ah]
    xor ebx, dword ptr [ebp+084h]
L63d35::
    mov ecx, ebx
    and ecx, dword ptr [Dc9cc8]
    and ecx, esi
    and ebx, dword ptr [Dc9cc0]
    and esi, dword ptr [Dc9cc0]
    add esi, ebx
    rcr esi, 1
    add esi, ecx
L63d51::
    mov word ptr [edi+0eh], si
L63d55::
    bswap edx
    mov bl, dh
    and bl, 0c0h
    cmp bl, 080h
    jne L63e9e
    xor ebx, ebx
    add bl, dh
    jmp dword ptr [ebx*4+D63c2c-2fh*4]
Func63cc0_ endp
    dword offset L63e71
    dword offset L63e4e
    dword offset L63e63
    dword offset L63e30
    dword offset L63e28
    dword offset Func63e04_
    dword offset Func63e04_
    dword offset Func63e04_
    dword offset Func63e04_
    dword offset Func63e04_
    dword offset Func63e04_
    dword offset Func63e04_
    dword offset Func63e04_
    dword offset Func63e04_
    dword offset Func63e04_
    dword offset Func63e04_
    dword offset Func63e04_
    dword offset Func63e04_
    dword offset Func63e04_
    dword offset Func63e04_
    dword offset Func63e04_
    dword offset Func63e04_
    dword offset Func63e04_
    dword offset Func63e04_
    dword offset Func63e04_
    dword offset Func63e04_
    dword offset Func63e04_
    dword offset Func63e04_
    dword offset Func63e04_
    dword offset Func63e04_
    dword offset Func63e04_
    dword offset Func63e04_
    dword offset Func63e04_
    dword offset Func63e04_
    dword offset Func63e04_
    dword offset Func63e04_
    dword offset Func63e04_
Func63e04_ proc near
    lea ecx, [ebx-085h]
    add ecx, dword ptr [Dc9bf0]
    mov ebx, edi
    mov esi, dword ptr [ebp+01ch]
    add ebx, dword ptr [Dc9bec]
    mov ebx, dword ptr [eax+ebx*1+0ch]
    call dword ptr [ecx*4+blend_ops]
    jmp L63e99
L63e28::
    mov esi, dword ptr [Dc9c2c]
    jmp L63e99
L63e30::
    mov ebx, edi
    mov esi, dword ptr [ebp+01ch]
    add ebx, dword ptr [Dc9bec]
    mov ecx, dword ptr [Dc9bf0]
    mov ebx, dword ptr [eax+ebx*1+0ch]
    call dword ptr [ecx*4+blend_ops]
    jmp L63e99
L63e4e::
    mov esi, dword ptr [ebp+01ch]
    add edi, dword ptr [Dc9bec]
    mov ebx, dword ptr [eax+edi*1+0ch]
    sub edi, dword ptr [Dc9bec]
    jmp L63e7d
L63e63::
    mov ebx, edi
    add ebx, dword ptr [Dc9bec]
    mov esi, dword ptr [eax+ebx*1+0ch]
    jmp L63e99
L63e71::
    mov ebx, dword ptr [Dc9cc4]
    mov esi, dword ptr [ebp+01ch]
    xor ebx, dword ptr [ebp+03ah]
L63e7d::
    mov ecx, ebx
    and ecx, dword ptr [Dc9cc8]
    and ecx, esi
    and ebx, dword ptr [Dc9cc0]
    and esi, dword ptr [Dc9cc0]
    add esi, ebx
    rcr esi, 1
    add esi, ecx
L63e99::
    mov word ptr [eax+edi*1+0ch], si
L63e9e::
    mov bl, dl
    and bl, 0c0h
    cmp bl, 080h
    jne L63fe8
    xor ebx, ebx
    add bl, dl
    jmp dword ptr [ebx*4+D63eb7-80h*4]
Func63e04_ endp
D63eb7 dword offset L63fb8
    dword offset L63f95
    dword offset L63faa
    dword offset L63f77
    dword offset L63f6f
    dword offset Func63f4b_
    dword offset Func63f4b_
    dword offset Func63f4b_
    dword offset Func63f4b_
    dword offset Func63f4b_
    dword offset Func63f4b_
    dword offset Func63f4b_
    dword offset Func63f4b_
    dword offset Func63f4b_
    dword offset Func63f4b_
    dword offset Func63f4b_
    dword offset Func63f4b_
    dword offset Func63f4b_
    dword offset Func63f4b_
    dword offset Func63f4b_
    dword offset Func63f4b_
    dword offset Func63f4b_
    dword offset Func63f4b_
    dword offset Func63f4b_
    dword offset Func63f4b_
    dword offset Func63f4b_
    dword offset Func63f4b_
    dword offset Func63f4b_
    dword offset Func63f4b_
    dword offset Func63f4b_
    dword offset Func63f4b_
    dword offset Func63f4b_
    dword offset Func63f4b_
    dword offset Func63f4b_
    dword offset Func63f4b_
    dword offset Func63f4b_
    dword offset Func63f4b_
Func63f4b_ proc near
    lea ecx, [ebx-085h]
    add ecx, dword ptr [Dc9bf0]
    mov ebx, edi
    mov esi, dword ptr [ebp+01eh]
    add ebx, dword ptr [Dc9bec]
    mov ebx, dword ptr [eax+ebx*1+0eh]
    call dword ptr [ecx*4+blend_ops]
    jmp L63fe3
L63f6f::
    mov esi, dword ptr [Dc9c2c]
    jmp L63fe3
L63f77::
    mov ebx, edi
    mov esi, dword ptr [ebp+01eh]
    add ebx, dword ptr [Dc9bec]
    mov ecx, dword ptr [Dc9bf0]
    mov ebx, dword ptr [eax+ebx*1+0eh]
    call dword ptr [ecx*4+blend_ops]
    jmp L63fe3
L63f95::
    mov esi, dword ptr [ebp+01eh]
    add edi, dword ptr [Dc9bec]
    mov ebx, dword ptr [eax+edi*1+0eh]
    sub edi, dword ptr [Dc9bec]
    jmp L63fc7
L63faa::
    mov ebx, edi
    add ebx, dword ptr [Dc9bec]
    mov esi, dword ptr [eax+ebx*1+0eh]
    jmp L63fe3
L63fb8::
    mov ebx, dword ptr [Dc9cc4]
    mov esi, dword ptr [ebp+01eh]
    xor ebx, dword ptr [ebp+0a0h]
L63fc7::
    mov ecx, ebx
    and ecx, dword ptr [Dc9cc8]
    and ecx, esi
    and ebx, dword ptr [Dc9cc0]
    and esi, dword ptr [Dc9cc0]
    add esi, ebx
    rcr esi, 1
    add esi, ecx
L63fe3::
    mov word ptr [eax+edi*1+0eh], si
L63fe8::
    pop ecx
    xor edx, edx
    pop ebx
L63fec::
    lea edi, [edi+eax*2]
    or edx, dword ptr [ebx+010h]
    je L6450b
    mov ebp, dword ptr [ecx+03ch]
    push ebx
    add ebp, dword ptr [Dc9be8]
    push ecx
    mov bl, dl
    and bl, 0c0h
    cmp bl, 080h
    jne L6413d
    xor ebx, ebx
    add bl, dl
    jmp dword ptr [ebx*4+D6401c-80h*4]
Func63f4b_ endp
D6401c dword offset L64112
    dword offset L640f4
    dword offset L64107
    dword offset L640d9
    dword offset L640d1
    dword offset Func640b0_
    dword offset Func640b0_
    dword offset Func640b0_
    dword offset Func640b0_
    dword offset Func640b0_
    dword offset Func640b0_
    dword offset Func640b0_
    dword offset Func640b0_
    dword offset Func640b0_
    dword offset Func640b0_
    dword offset Func640b0_
    dword offset Func640b0_
    dword offset Func640b0_
    dword offset Func640b0_
    dword offset Func640b0_
    dword offset Func640b0_
    dword offset Func640b0_
    dword offset Func640b0_
    dword offset Func640b0_
    dword offset Func640b0_
    dword offset Func640b0_
    dword offset Func640b0_
    dword offset Func640b0_
    dword offset Func640b0_
    dword offset Func640b0_
    dword offset Func640b0_
    dword offset Func640b0_
    dword offset Func640b0_
    dword offset Func640b0_
    dword offset Func640b0_
    dword offset Func640b0_
    dword offset Func640b0_
Func640b0_ proc near
    lea ecx, [ebx-085h]
    add ecx, dword ptr [Dc9bf0]
    mov ebx, dword ptr [Dc9bec]
    mov esi, dword ptr [ebp+020h]
    mov ebx, dword ptr [edi+ebx*1]
    call dword ptr [ecx*4+blend_ops]
    jmp L6413a
L640d1::
    mov esi, dword ptr [Dc9c2c]
    jmp L6413a
L640d9::
    mov ebx, dword ptr [Dc9bec]
    mov esi, dword ptr [ebp+020h]
    mov ecx, dword ptr [Dc9bf0]
    mov ebx, dword ptr [edi+ebx*1]
    call dword ptr [ecx*4+blend_ops]
    jmp L6413a
L640f4::
    mov esi, dword ptr [ebp+020h]
    add edi, dword ptr [Dc9bec]
    mov ebx, dword ptr [edi]
    sub edi, dword ptr [Dc9bec]
    jmp L6411e
L64107::
    mov ebx, dword ptr [Dc9bec]
    mov esi, dword ptr [edi+ebx*1]
    jmp L6413a
L64112::
    mov ebx, dword ptr [Dc9cc4]
    mov esi, dword ptr [ebp+020h]
    xor ebx, dword ptr [ebp+026h]
L6411e::
    mov ecx, ebx
    and ecx, dword ptr [Dc9cc8]
    and ecx, esi
    and ebx, dword ptr [Dc9cc0]
    and esi, dword ptr [Dc9cc0]
    add esi, ebx
    rcr esi, 1
    add esi, ecx
L6413a::
    mov word ptr [edi], si
L6413d::
    mov bl, dh
    and bl, 0c0h
    cmp bl, 080h
    jne L6427c
    xor ebx, ebx
    add bl, dh
    jmp dword ptr [ebx*4+D64156-80h*4]
Func640b0_ endp
D64156 dword offset L64250
    dword offset L64230
    dword offset L64244
    dword offset L64214
    dword offset L6420c
    dword offset Func641ea_
    dword offset Func641ea_
    dword offset Func641ea_
    dword offset Func641ea_
    dword offset Func641ea_
    dword offset Func641ea_
    dword offset Func641ea_
    dword offset Func641ea_
    dword offset Func641ea_
    dword offset Func641ea_
    dword offset Func641ea_
    dword offset Func641ea_
    dword offset Func641ea_
    dword offset Func641ea_
    dword offset Func641ea_
    dword offset Func641ea_
    dword offset Func641ea_
    dword offset Func641ea_
    dword offset Func641ea_
    dword offset Func641ea_
    dword offset Func641ea_
    dword offset Func641ea_
    dword offset Func641ea_
    dword offset Func641ea_
    dword offset Func641ea_
    dword offset Func641ea_
    dword offset Func641ea_
    dword offset Func641ea_
    dword offset Func641ea_
    dword offset Func641ea_
    dword offset Func641ea_
    dword offset Func641ea_
Func641ea_ proc near
    lea ecx, [ebx-085h]
    add ecx, dword ptr [Dc9bf0]
    mov ebx, dword ptr [Dc9bec]
    mov esi, dword ptr [ebp+022h]
    mov ebx, dword ptr [edi+ebx*1+02h]
    call dword ptr [ecx*4+blend_ops]
    jmp L64278
L6420c::
    mov esi, dword ptr [Dc9c2c]
    jmp L64278
L64214::
    mov ebx, dword ptr [Dc9bec]
    mov esi, dword ptr [ebp+022h]
    mov ecx, dword ptr [Dc9bf0]
    mov ebx, dword ptr [edi+ebx*1+02h]
    call dword ptr [ecx*4+blend_ops]
    jmp L64278
L64230::
    mov esi, dword ptr [ebp+022h]
    add edi, dword ptr [Dc9bec]
    mov ebx, dword ptr [edi+02h]
    sub edi, dword ptr [Dc9bec]
    jmp L6425c
L64244::
    mov ebx, dword ptr [Dc9bec]
    mov esi, dword ptr [edi+ebx*1+02h]
    jmp L64278
L64250::
    mov ebx, dword ptr [Dc9cc4]
    mov esi, dword ptr [ebp+022h]
    xor ebx, dword ptr [ebp+02ch]
L6425c::
    mov ecx, ebx
    and ecx, dword ptr [Dc9cc8]
    and ecx, esi
    and ebx, dword ptr [Dc9cc0]
    and esi, dword ptr [Dc9cc0]
    add esi, ebx
    rcr esi, 1
    add esi, ecx
L64278::
    mov word ptr [edi+02h], si
L6427c::
    bswap edx
    mov bl, dh
    and bl, 0c0h
    cmp bl, 080h
    jne L643c0
    xor ebx, ebx
    add bl, dh
    jmp dword ptr [ebx*4+D64297-80h*4]
Func641ea_ endp
D64297 dword offset L64394
    dword offset L64373
    dword offset L64387
    dword offset L64356
    dword offset L6434e
    dword offset Func6432b_
    dword offset Func6432b_
    dword offset Func6432b_
    dword offset Func6432b_
    dword offset Func6432b_
    dword offset Func6432b_
    dword offset Func6432b_
    dword offset Func6432b_
    dword offset Func6432b_
    dword offset Func6432b_
    dword offset Func6432b_
    dword offset Func6432b_
    dword offset Func6432b_
    dword offset Func6432b_
    dword offset Func6432b_
    dword offset Func6432b_
    dword offset Func6432b_
    dword offset Func6432b_
    dword offset Func6432b_
    dword offset Func6432b_
    dword offset Func6432b_
    dword offset Func6432b_
    dword offset Func6432b_
    dword offset Func6432b_
    dword offset Func6432b_
    dword offset Func6432b_
    dword offset Func6432b_
    dword offset Func6432b_
    dword offset Func6432b_
    dword offset Func6432b_
    dword offset Func6432b_
    dword offset Func6432b_
Func6432b_ proc near
    lea ecx, [ebx-085h]
    add ecx, dword ptr [Dc9bf0]
    mov ebx, edi
    mov esi, dword ptr [ebp+024h]
    add ebx, dword ptr [Dc9bec]
    mov ebx, dword ptr [eax+ebx*1]
    call dword ptr [ecx*4+blend_ops]
    jmp L643bc
L6434e::
    mov esi, dword ptr [Dc9c2c]
    jmp L643bc
L64356::
    mov ebx, edi
    mov esi, dword ptr [ebp+024h]
    add ebx, dword ptr [Dc9bec]
    mov ecx, dword ptr [Dc9bf0]
    mov ebx, dword ptr [eax+ebx*1]
    call dword ptr [ecx*4+blend_ops]
    jmp L643bc
L64373::
    mov esi, dword ptr [ebp+024h]
    add edi, dword ptr [Dc9bec]
    mov ebx, dword ptr [eax+edi*1]
    sub edi, dword ptr [Dc9bec]
    jmp L643a0
L64387::
    mov ebx, edi
    add ebx, dword ptr [Dc9bec]
    mov esi, dword ptr [eax+ebx*1]
    jmp L643bc
L64394::
    mov ebx, dword ptr [Dc9cc4]
    mov esi, dword ptr [ebp+024h]
    xor ebx, dword ptr [ebp+042h]
L643a0::
    mov ecx, ebx
    and ecx, dword ptr [Dc9cc8]
    and ecx, esi
    and ebx, dword ptr [Dc9cc0]
    and esi, dword ptr [Dc9cc0]
    add esi, ebx
    rcr esi, 1
    add esi, ecx
L643bc::
    mov word ptr [eax+edi*1], si
L643c0::
    mov bl, dl
    and bl, 0c0h
    cmp bl, 080h
    jne L64507
    xor ebx, ebx
    add bl, dl
    jmp dword ptr [ebx*4+D643d9-80h*4]
Func6432b_ endp
D643d9 dword offset L644da
    dword offset L644b7
    dword offset L644cc
    dword offset L64499
    dword offset L64491
    dword offset Func6446d_
    dword offset Func6446d_
    dword offset Func6446d_
    dword offset Func6446d_
    dword offset Func6446d_
    dword offset Func6446d_
    dword offset Func6446d_
    dword offset Func6446d_
    dword offset Func6446d_
    dword offset Func6446d_
    dword offset Func6446d_
    dword offset Func6446d_
    dword offset Func6446d_
    dword offset Func6446d_
    dword offset Func6446d_
    dword offset Func6446d_
    dword offset Func6446d_
    dword offset Func6446d_
    dword offset Func6446d_
    dword offset Func6446d_
    dword offset Func6446d_
    dword offset Func6446d_
    dword offset Func6446d_
    dword offset Func6446d_
    dword offset Func6446d_
    dword offset Func6446d_
    dword offset Func6446d_
    dword offset Func6446d_
    dword offset Func6446d_
    dword offset Func6446d_
    dword offset Func6446d_
    dword offset Func6446d_
Func6446d_ proc near
    lea ecx, [ebx-085h]
    add ecx, dword ptr [Dc9bf0]
    mov ebx, edi
    mov esi, dword ptr [ebp+026h]
    add ebx, dword ptr [Dc9bec]
    mov ebx, dword ptr [eax+ebx*1+02h]
    call dword ptr [ecx*4+blend_ops]
    jmp L64502
L64491::
    mov esi, dword ptr [Dc9c2c]
    jmp L64502
L64499::
    mov ebx, edi
    mov esi, dword ptr [ebp+026h]
    add ebx, dword ptr [Dc9bec]
    mov ecx, dword ptr [Dc9bf0]
    mov ebx, dword ptr [eax+ebx*1+02h]
    call dword ptr [ecx*4+blend_ops]
    jmp L64502
L644b7::
    mov esi, dword ptr [ebp+026h]
    add edi, dword ptr [Dc9bec]
    mov ebx, dword ptr [eax+edi*1+02h]
    sub edi, dword ptr [Dc9bec]
    jmp L644e6
L644cc::
    mov ebx, edi
    add ebx, dword ptr [Dc9bec]
    mov esi, dword ptr [eax+ebx*1+02h]
    jmp L64502
L644da::
    mov ebx, dword ptr [Dc9cc4]
    mov esi, dword ptr [ebp+026h]
    xor ebx, dword ptr [ebp+048h]
L644e6::
    mov ecx, ebx
    and ecx, dword ptr [Dc9cc8]
    and ecx, esi
    and ebx, dword ptr [Dc9cc0]
    and esi, dword ptr [Dc9cc0]
    add esi, ebx
    rcr esi, 1
    add esi, ecx
L64502::
    mov word ptr [eax+edi*1+02h], si
L64507::
    pop ecx
    xor edx, edx
    pop ebx
L6450b::
    or edx, dword ptr [ebx+014h]
    je L64a31
    mov ebp, dword ptr [ecx+03ch]
    push ebx
    add ebp, dword ptr [Dc9be8]
    push ecx
    mov bl, dl
    and bl, 0c0h
    cmp bl, 080h
    jne L6465e
    xor ebx, ebx
    add bl, dl
    jmp dword ptr [ebx*4+D64538-80h*4]
Func6446d_ endp
D64538 dword offset L64632
    dword offset L64612
    dword offset L64626
    dword offset L645f6
    dword offset L645ee
    dword offset Func645cc_
    dword offset Func645cc_
    dword offset Func645cc_
    dword offset Func645cc_
    dword offset Func645cc_
    dword offset Func645cc_
    dword offset Func645cc_
    dword offset Func645cc_
    dword offset Func645cc_
    dword offset Func645cc_
    dword offset Func645cc_
    dword offset Func645cc_
    dword offset Func645cc_
    dword offset Func645cc_
    dword offset Func645cc_
    dword offset Func645cc_
    dword offset Func645cc_
    dword offset Func645cc_
    dword offset Func645cc_
    dword offset Func645cc_
    dword offset Func645cc_
    dword offset Func645cc_
    dword offset Func645cc_
    dword offset Func645cc_
    dword offset Func645cc_
    dword offset Func645cc_
    dword offset Func645cc_
D645b8 dword offset Func645cc_
    dword offset Func645cc_
    dword offset Func645cc_
    dword offset Func645cc_
    dword offset Func645cc_
Func645cc_ proc near
    lea ecx, [ebx-085h]
    add ecx, dword ptr [Dc9bf0]
    mov ebx, dword ptr [Dc9bec]
    mov esi, dword ptr [ebp+028h]
    mov ebx, dword ptr [edi+ebx*1+04h]
    call dword ptr [ecx*4+blend_ops]
    jmp L6465a
L645ee::
    mov esi, dword ptr [Dc9c2c]
    jmp L6465a
L645f6::
    mov ebx, dword ptr [Dc9bec]
    mov esi, dword ptr [ebp+028h]
    mov ecx, dword ptr [Dc9bf0]
    mov ebx, dword ptr [edi+ebx*1+04h]
    call dword ptr [ecx*4+blend_ops]
    jmp L6465a
L64612::
    mov esi, dword ptr [ebp+028h]
    add edi, dword ptr [Dc9bec]
    mov ebx, dword ptr [edi+04h]
    sub edi, dword ptr [Dc9bec]
    jmp L6463e
L64626::
    mov ebx, dword ptr [Dc9bec]
    mov esi, dword ptr [edi+ebx*1+04h]
    jmp L6465a
L64632::
    mov ebx, dword ptr [Dc9cc4]
    mov esi, dword ptr [ebp+028h]
    xor ebx, dword ptr [ebp+02eh]
L6463e::
    mov ecx, ebx
    and ecx, dword ptr [Dc9cc8]
    and ecx, esi
    and ebx, dword ptr [Dc9cc0]
    and esi, dword ptr [Dc9cc0]
    add esi, ebx
    rcr esi, 1
    add esi, ecx
L6465a::
    mov word ptr [edi+04h], si
L6465e::
    mov bl, dh
    and bl, 0c0h
    cmp bl, 080h
    jne L6479d
    xor ebx, ebx
    add bl, dh
    jmp dword ptr [ebx*4+D64677-80h*4]
Func645cc_ endp
D64677 dword offset L64771
    dword offset L64751
    dword offset L64765
    dword offset L64735
    dword offset L6472d
    dword offset Func6470b_
    dword offset Func6470b_
    dword offset Func6470b_
    dword offset Func6470b_
    dword offset Func6470b_
    dword offset Func6470b_
    dword offset Func6470b_
    dword offset Func6470b_
    dword offset Func6470b_
    dword offset Func6470b_
    dword offset Func6470b_
    dword offset Func6470b_
    dword offset Func6470b_
    dword offset Func6470b_
    dword offset Func6470b_
    dword offset Func6470b_
    dword offset Func6470b_
    dword offset Func6470b_
    dword offset Func6470b_
    dword offset Func6470b_
    dword offset Func6470b_
    dword offset Func6470b_
    dword offset Func6470b_
    dword offset Func6470b_
    dword offset Func6470b_
    dword offset Func6470b_
    dword offset Func6470b_
    dword offset Func6470b_
    dword offset Func6470b_
D646ff dword offset Func6470b_
    dword offset Func6470b_
    dword offset Func6470b_
Func6470b_ proc near
    lea ecx, [ebx-085h]
    add ecx, dword ptr [Dc9bf0]
    mov ebx, dword ptr [Dc9bec]
    mov esi, dword ptr [ebp+02ah]
    mov ebx, dword ptr [edi+ebx*1+06h]
    call dword ptr [ecx*4+blend_ops]
    jmp L64799
L6472d::
    mov esi, dword ptr [Dc9c2c]
    jmp L64799
L64735::
    mov ebx, dword ptr [Dc9bec]
    mov esi, dword ptr [ebp+02ah]
    mov ecx, dword ptr [Dc9bf0]
    mov ebx, dword ptr [edi+ebx*1+06h]
    call dword ptr [ecx*4+blend_ops]
    jmp L64799
L64751::
    mov esi, dword ptr [ebp+02ah]
    add edi, dword ptr [Dc9bec]
    mov ebx, dword ptr [edi+06h]
    sub edi, dword ptr [Dc9bec]
    jmp L6477d
L64765::
    mov ebx, dword ptr [Dc9bec]
    mov esi, dword ptr [edi+ebx*1+06h]
    jmp L64799
L64771::
    mov ebx, dword ptr [Dc9cc4]
    mov esi, dword ptr [ebp+02ah]
    xor ebx, dword ptr [ebp+034h]
L6477d::
    mov ecx, ebx
    and ecx, dword ptr [Dc9cc8]
    and ecx, esi
    and ebx, dword ptr [Dc9cc0]
    and esi, dword ptr [Dc9cc0]
    add esi, ebx
    rcr esi, 1
    add esi, ecx
L64799::
    mov word ptr [edi+06h], si
L6479d::
    bswap edx
    mov bl, dh
    and bl, 0c0h
    cmp bl, 080h
    jne L648e6
    xor ebx, ebx
    add bl, dh
    jmp dword ptr [ebx*4+D645b8]
Func6470b_ endp
    dword offset L648b9
    dword offset L64896
    dword offset L648ab
    dword offset L64878
    dword offset L64870
    dword offset Func6484c_
    dword offset Func6484c_
    dword offset Func6484c_
    dword offset Func6484c_
    dword offset Func6484c_
    dword offset Func6484c_
    dword offset Func6484c_
    dword offset Func6484c_
    dword offset Func6484c_
    dword offset Func6484c_
    dword offset Func6484c_
    dword offset Func6484c_
    dword offset Func6484c_
    dword offset Func6484c_
    dword offset Func6484c_
    dword offset Func6484c_
    dword offset Func6484c_
    dword offset Func6484c_
    dword offset Func6484c_
    dword offset Func6484c_
    dword offset Func6484c_
    dword offset Func6484c_
    dword offset Func6484c_
    dword offset Func6484c_
    dword offset Func6484c_
    dword offset Func6484c_
    dword offset Func6484c_
    dword offset Func6484c_
    dword offset Func6484c_
    dword offset Func6484c_
    dword offset Func6484c_
    dword offset Func6484c_
Func6484c_ proc near
    lea ecx, [ebx-085h]
    add ecx, dword ptr [Dc9bf0]
    mov ebx, edi
    mov esi, dword ptr [ebp+02ch]
    add ebx, dword ptr [Dc9bec]
    mov ebx, dword ptr [eax+ebx*1+04h]
    call dword ptr [ecx*4+blend_ops]
    jmp L648e1
L64870::
    mov esi, dword ptr [Dc9c2c]
    jmp L648e1
L64878::
    mov ebx, edi
    mov esi, dword ptr [ebp+02ch]
    add ebx, dword ptr [Dc9bec]
    mov ecx, dword ptr [Dc9bf0]
    mov ebx, dword ptr [eax+ebx*1+04h]
    call dword ptr [ecx*4+blend_ops]
    jmp L648e1
L64896::
    mov esi, dword ptr [ebp+02ch]
    add edi, dword ptr [Dc9bec]
    mov ebx, dword ptr [eax+edi*1+04h]
    sub edi, dword ptr [Dc9bec]
    jmp L648c5
L648ab::
    mov ebx, edi
    add ebx, dword ptr [Dc9bec]
    mov esi, dword ptr [eax+ebx*1+04h]
    jmp L648e1
L648b9::
    mov ebx, dword ptr [Dc9cc4]
    mov esi, dword ptr [ebp+02ch]
    xor ebx, dword ptr [ebp+04ah]
L648c5::
    mov ecx, ebx
    and ecx, dword ptr [Dc9cc8]
    and ecx, esi
    and ebx, dword ptr [Dc9cc0]
    and esi, dword ptr [Dc9cc0]
    add esi, ebx
    rcr esi, 1
    add esi, ecx
L648e1::
    mov word ptr [eax+edi*1+04h], si
L648e6::
    mov bl, dl
    and bl, 0c0h
    cmp bl, 080h
    jne L64a2d
    xor ebx, ebx
    add bl, dl
    jmp dword ptr [ebx*4+D646ff]
Func6484c_ endp
    dword offset L64a00
    dword offset L649dd
    dword offset L649f2
    dword offset L649bf
    dword offset L649b7
    dword offset Func64993_
    dword offset Func64993_
    dword offset Func64993_
    dword offset Func64993_
    dword offset Func64993_
    dword offset Func64993_
    dword offset Func64993_
    dword offset Func64993_
    dword offset Func64993_
    dword offset Func64993_
    dword offset Func64993_
    dword offset Func64993_
    dword offset Func64993_
    dword offset Func64993_
    dword offset Func64993_
    dword offset Func64993_
    dword offset Func64993_
    dword offset Func64993_
    dword offset Func64993_
    dword offset Func64993_
    dword offset Func64993_
    dword offset Func64993_
    dword offset Func64993_
    dword offset Func64993_
    dword offset Func64993_
    dword offset Func64993_
    dword offset Func64993_
    dword offset Func64993_
    dword offset Func64993_
    dword offset Func64993_
    dword offset Func64993_
    dword offset Func64993_
Func64993_ proc near
    lea ecx, [ebx-085h]
    add ecx, dword ptr [Dc9bf0]
    mov ebx, edi
    mov esi, dword ptr [ebp+02eh]
    add ebx, dword ptr [Dc9bec]
    mov ebx, dword ptr [eax+ebx*1+06h]
    call dword ptr [ecx*4+blend_ops]
    jmp L64a28
L649b7::
    mov esi, dword ptr [Dc9c2c]
    jmp L64a28
L649bf::
    mov ebx, edi
    mov esi, dword ptr [ebp+02eh]
    add ebx, dword ptr [Dc9bec]
    mov ecx, dword ptr [Dc9bf0]
    mov ebx, dword ptr [eax+ebx*1+06h]
    call dword ptr [ecx*4+blend_ops]
    jmp L64a28
L649dd::
    mov esi, dword ptr [ebp+02eh]
    add edi, dword ptr [Dc9bec]
    mov ebx, dword ptr [eax+edi*1+06h]
    sub edi, dword ptr [Dc9bec]
    jmp L64a0c
L649f2::
    mov ebx, edi
    add ebx, dword ptr [Dc9bec]
    mov esi, dword ptr [eax+ebx*1+06h]
    jmp L64a28
L64a00::
    mov ebx, dword ptr [Dc9cc4]
    mov esi, dword ptr [ebp+02eh]
    xor ebx, dword ptr [ebp+050h]
L64a0c::
    mov ecx, ebx
    and ecx, dword ptr [Dc9cc8]
    and ecx, esi
    and ebx, dword ptr [Dc9cc0]
    and esi, dword ptr [Dc9cc0]
    add esi, ebx
    rcr esi, 1
    add esi, ecx
L64a28::
    mov word ptr [eax+edi*1+06h], si
L64a2d::
    pop ecx
    xor edx, edx
    pop ebx
L64a31::
    or edx, dword ptr [ebx+018h]
    je L64f57
    mov ebp, dword ptr [ecx+03ch]
    push ebx
    add ebp, dword ptr [Dc9be8]
    push ecx
    mov bl, dl
    and bl, 0c0h
    cmp bl, 080h
    jne L64b84
    xor ebx, ebx
    add bl, dl
    jmp dword ptr [ebx*4+D64a5e-80h*4]
Func64993_ endp
D64a5e dword offset L64b58
    dword offset L64b38
    dword offset L64b4c
    dword offset L64b1c
    dword offset L64b14
    dword offset Func64af2_
    dword offset Func64af2_
    dword offset Func64af2_
    dword offset Func64af2_
    dword offset Func64af2_
    dword offset Func64af2_
    dword offset Func64af2_
    dword offset Func64af2_
    dword offset Func64af2_
    dword offset Func64af2_
    dword offset Func64af2_
    dword offset Func64af2_
    dword offset Func64af2_
    dword offset Func64af2_
    dword offset Func64af2_
    dword offset Func64af2_
    dword offset Func64af2_
    dword offset Func64af2_
    dword offset Func64af2_
    dword offset Func64af2_
    dword offset Func64af2_
    dword offset Func64af2_
    dword offset Func64af2_
    dword offset Func64af2_
    dword offset Func64af2_
    dword offset Func64af2_
    dword offset Func64af2_
D64ade dword offset Func64af2_
    dword offset Func64af2_
    dword offset Func64af2_
    dword offset Func64af2_
    dword offset Func64af2_
Func64af2_ proc near
    lea ecx, [ebx-085h]
    add ecx, dword ptr [Dc9bf0]
    mov ebx, dword ptr [Dc9bec]
    mov esi, dword ptr [ebp+030h]
    mov ebx, dword ptr [edi+ebx*1+08h]
    call dword ptr [ecx*4+blend_ops]
    jmp L64b80
L64b14::
    mov esi, dword ptr [Dc9c2c]
    jmp L64b80
L64b1c::
    mov ebx, dword ptr [Dc9bec]
    mov esi, dword ptr [ebp+030h]
    mov ecx, dword ptr [Dc9bf0]
    mov ebx, dword ptr [edi+ebx*1+08h]
    call dword ptr [ecx*4+blend_ops]
    jmp L64b80
L64b38::
    mov esi, dword ptr [ebp+030h]
    add edi, dword ptr [Dc9bec]
    mov ebx, dword ptr [edi+08h]
    sub edi, dword ptr [Dc9bec]
    jmp L64b64
L64b4c::
    mov ebx, dword ptr [Dc9bec]
    mov esi, dword ptr [edi+ebx*1+08h]
    jmp L64b80
L64b58::
    mov ebx, dword ptr [Dc9cc4]
    mov esi, dword ptr [ebp+030h]
    xor ebx, dword ptr [ebp+036h]
L64b64::
    mov ecx, ebx
    and ecx, dword ptr [Dc9cc8]
    and ecx, esi
    and ebx, dword ptr [Dc9cc0]
    and esi, dword ptr [Dc9cc0]
    add esi, ebx
    rcr esi, 1
    add esi, ecx
L64b80::
    mov word ptr [edi+08h], si
L64b84::
    mov bl, dh
    and bl, 0c0h
    cmp bl, 080h
    jne L64cc3
    xor ebx, ebx
    add bl, dh
    jmp dword ptr [ebx*4+D64b9d-80h*4]
Func64af2_ endp
D64b9d dword offset L64c97
    dword offset L64c77
    dword offset L64c8b
    dword offset L64c5b
    dword offset L64c53
    dword offset Func64c31_
    dword offset Func64c31_
    dword offset Func64c31_
    dword offset Func64c31_
    dword offset Func64c31_
    dword offset Func64c31_
    dword offset Func64c31_
    dword offset Func64c31_
    dword offset Func64c31_
    dword offset Func64c31_
    dword offset Func64c31_
    dword offset Func64c31_
    dword offset Func64c31_
    dword offset Func64c31_
    dword offset Func64c31_
    dword offset Func64c31_
    dword offset Func64c31_
    dword offset Func64c31_
    dword offset Func64c31_
    dword offset Func64c31_
    dword offset Func64c31_
    dword offset Func64c31_
    dword offset Func64c31_
    dword offset Func64c31_
    dword offset Func64c31_
    dword offset Func64c31_
    dword offset Func64c31_
    dword offset Func64c31_
    dword offset Func64c31_
D64c25 dword offset Func64c31_
    dword offset Func64c31_
    dword offset Func64c31_
Func64c31_ proc near
    lea ecx, [ebx-085h]
    add ecx, dword ptr [Dc9bf0]
    mov ebx, dword ptr [Dc9bec]
    mov esi, dword ptr [ebp+032h]
    mov ebx, dword ptr [edi+ebx*1+0ah]
    call dword ptr [ecx*4+blend_ops]
    jmp L64cbf
L64c53::
    mov esi, dword ptr [Dc9c2c]
    jmp L64cbf
L64c5b::
    mov ebx, dword ptr [Dc9bec]
    mov esi, dword ptr [ebp+032h]
    mov ecx, dword ptr [Dc9bf0]
    mov ebx, dword ptr [edi+ebx*1+0ah]
    call dword ptr [ecx*4+blend_ops]
    jmp L64cbf
L64c77::
    mov esi, dword ptr [ebp+032h]
    add edi, dword ptr [Dc9bec]
    mov ebx, dword ptr [edi+0ah]
    sub edi, dword ptr [Dc9bec]
    jmp L64ca3
L64c8b::
    mov ebx, dword ptr [Dc9bec]
    mov esi, dword ptr [edi+ebx*1+0ah]
    jmp L64cbf
L64c97::
    mov ebx, dword ptr [Dc9cc4]
    mov esi, dword ptr [ebp+032h]
    xor ebx, dword ptr [ebp+03ch]
L64ca3::
    mov ecx, ebx
    and ecx, dword ptr [Dc9cc8]
    and ecx, esi
    and ebx, dword ptr [Dc9cc0]
    and esi, dword ptr [Dc9cc0]
    add esi, ebx
    rcr esi, 1
    add esi, ecx
L64cbf::
    mov word ptr [edi+0ah], si
L64cc3::
    bswap edx
    mov bl, dh
    and bl, 0c0h
    cmp bl, 080h
    jne L64e0c
    xor ebx, ebx
    add bl, dh
    jmp dword ptr [ebx*4+D64ade]
Func64c31_ endp
    dword offset L64ddf
    dword offset L64dbc
    dword offset L64dd1
    dword offset L64d9e
    dword offset L64d96
    dword offset Func64d72_
    dword offset Func64d72_
    dword offset Func64d72_
    dword offset Func64d72_
    dword offset Func64d72_
    dword offset Func64d72_
    dword offset Func64d72_
    dword offset Func64d72_
    dword offset Func64d72_
    dword offset Func64d72_
    dword offset Func64d72_
    dword offset Func64d72_
    dword offset Func64d72_
    dword offset Func64d72_
    dword offset Func64d72_
    dword offset Func64d72_
    dword offset Func64d72_
    dword offset Func64d72_
    dword offset Func64d72_
    dword offset Func64d72_
    dword offset Func64d72_
    dword offset Func64d72_
    dword offset Func64d72_
    dword offset Func64d72_
    dword offset Func64d72_
    dword offset Func64d72_
    dword offset Func64d72_
    dword offset Func64d72_
    dword offset Func64d72_
    dword offset Func64d72_
    dword offset Func64d72_
    dword offset Func64d72_
Func64d72_ proc near
    lea ecx, [ebx-085h]
    add ecx, dword ptr [Dc9bf0]
    mov ebx, edi
    mov esi, dword ptr [ebp+034h]
    add ebx, dword ptr [Dc9bec]
    mov ebx, dword ptr [eax+ebx*1+08h]
    call dword ptr [ecx*4+blend_ops]
    jmp L64e07
L64d96::
    mov esi, dword ptr [Dc9c2c]
    jmp L64e07
L64d9e::
    mov ebx, edi
    mov esi, dword ptr [ebp+034h]
    add ebx, dword ptr [Dc9bec]
    mov ecx, dword ptr [Dc9bf0]
    mov ebx, dword ptr [eax+ebx*1+08h]
    call dword ptr [ecx*4+blend_ops]
    jmp L64e07
L64dbc::
    mov esi, dword ptr [ebp+034h]
    add edi, dword ptr [Dc9bec]
    mov ebx, dword ptr [eax+edi*1+08h]
    sub edi, dword ptr [Dc9bec]
    jmp L64deb
L64dd1::
    mov ebx, edi
    add ebx, dword ptr [Dc9bec]
    mov esi, dword ptr [eax+ebx*1+08h]
    jmp L64e07
L64ddf::
    mov ebx, dword ptr [Dc9cc4]
    mov esi, dword ptr [ebp+034h]
    xor ebx, dword ptr [ebp+052h]
L64deb::
    mov ecx, ebx
    and ecx, dword ptr [Dc9cc8]
    and ecx, esi
    and ebx, dword ptr [Dc9cc0]
    and esi, dword ptr [Dc9cc0]
    add esi, ebx
    rcr esi, 1
    add esi, ecx
L64e07::
    mov word ptr [eax+edi*1+08h], si
L64e0c::
    mov bl, dl
    and bl, 0c0h
    cmp bl, 080h
    jne L64f53
    xor ebx, ebx
    add bl, dl
    jmp dword ptr [ebx*4+D64c25]
Func64d72_ endp
    dword offset L64f26
    dword offset L64f03
    dword offset L64f18
    dword offset L64ee5
    dword offset L64edd
    dword offset Func64eb9_
    dword offset Func64eb9_
    dword offset Func64eb9_
    dword offset Func64eb9_
    dword offset Func64eb9_
    dword offset Func64eb9_
    dword offset Func64eb9_
    dword offset Func64eb9_
    dword offset Func64eb9_
    dword offset Func64eb9_
    dword offset Func64eb9_
    dword offset Func64eb9_
    dword offset Func64eb9_
    dword offset Func64eb9_
    dword offset Func64eb9_
    dword offset Func64eb9_
    dword offset Func64eb9_
    dword offset Func64eb9_
    dword offset Func64eb9_
    dword offset Func64eb9_
    dword offset Func64eb9_
    dword offset Func64eb9_
    dword offset Func64eb9_
    dword offset Func64eb9_
    dword offset Func64eb9_
    dword offset Func64eb9_
    dword offset Func64eb9_
    dword offset Func64eb9_
    dword offset Func64eb9_
    dword offset Func64eb9_
    dword offset Func64eb9_
    dword offset Func64eb9_
Func64eb9_ proc near
    lea ecx, [ebx-085h]
    add ecx, dword ptr [Dc9bf0]
    mov ebx, edi
    mov esi, dword ptr [ebp+036h]
    add ebx, dword ptr [Dc9bec]
    mov ebx, dword ptr [eax+ebx*1+0ah]
    call dword ptr [ecx*4+blend_ops]
    jmp L64f4e
L64edd::
    mov esi, dword ptr [Dc9c2c]
    jmp L64f4e
L64ee5::
    mov ebx, edi
    mov esi, dword ptr [ebp+036h]
    add ebx, dword ptr [Dc9bec]
    mov ecx, dword ptr [Dc9bf0]
    mov ebx, dword ptr [eax+ebx*1+0ah]
    call dword ptr [ecx*4+blend_ops]
    jmp L64f4e
L64f03::
    mov esi, dword ptr [ebp+036h]
    add edi, dword ptr [Dc9bec]
    mov ebx, dword ptr [eax+edi*1+0ah]
    sub edi, dword ptr [Dc9bec]
    jmp L64f32
L64f18::
    mov ebx, edi
    add ebx, dword ptr [Dc9bec]
    mov esi, dword ptr [eax+ebx*1+0ah]
    jmp L64f4e
L64f26::
    mov ebx, dword ptr [Dc9cc4]
    mov esi, dword ptr [ebp+036h]
    xor ebx, dword ptr [ebp+058h]
L64f32::
    mov ecx, ebx
    and ecx, dword ptr [Dc9cc8]
    and ecx, esi
    and ebx, dword ptr [Dc9cc0]
    and esi, dword ptr [Dc9cc0]
    add esi, ebx
    rcr esi, 1
    add esi, ecx
L64f4e::
    mov word ptr [eax+edi*1+0ah], si
L64f53::
    pop ecx
    xor edx, edx
    pop ebx
L64f57::
    or edx, dword ptr [ebx+01ch]
    je L65483
    mov ebp, dword ptr [ecx+03ch]
    push ebx
    add ebp, dword ptr [Dc9be8]
    push ecx
    mov bl, dl
    and bl, 0c0h
    cmp bl, 080h
    jne L650aa
    xor ebx, ebx
    add bl, dl
    jmp dword ptr [ebx*4+D64f84-80h*4]
Func64eb9_ endp
D64f84 dword offset L6507e
    dword offset L6505e
    dword offset L65072
    dword offset L65042
    dword offset L6503a
    dword offset Func65018_
    dword offset Func65018_
    dword offset Func65018_
    dword offset Func65018_
    dword offset Func65018_
    dword offset Func65018_
    dword offset Func65018_
    dword offset Func65018_
    dword offset Func65018_
    dword offset Func65018_
    dword offset Func65018_
    dword offset Func65018_
    dword offset Func65018_
    dword offset Func65018_
    dword offset Func65018_
    dword offset Func65018_
    dword offset Func65018_
    dword offset Func65018_
    dword offset Func65018_
    dword offset Func65018_
    dword offset Func65018_
    dword offset Func65018_
    dword offset Func65018_
    dword offset Func65018_
    dword offset Func65018_
    dword offset Func65018_
    dword offset Func65018_
    dword offset Func65018_
    dword offset Func65018_
    dword offset Func65018_
    dword offset Func65018_
    dword offset Func65018_
Func65018_ proc near
    lea ecx, [ebx-085h]
    add ecx, dword ptr [Dc9bf0]
    mov ebx, dword ptr [Dc9bec]
    mov esi, dword ptr [ebp+038h]
    mov ebx, dword ptr [edi+ebx*1+0ch]
    call dword ptr [ecx*4+blend_ops]
    jmp L650a6
L6503a::
    mov esi, dword ptr [Dc9c2c]
    jmp L650a6
L65042::
    mov ebx, dword ptr [Dc9bec]
    mov esi, dword ptr [ebp+038h]
    mov ecx, dword ptr [Dc9bf0]
    mov ebx, dword ptr [edi+ebx*1+0ch]
    call dword ptr [ecx*4+blend_ops]
    jmp L650a6
L6505e::
    mov esi, dword ptr [ebp+038h]
    add edi, dword ptr [Dc9bec]
    mov ebx, dword ptr [edi+0ch]
    sub edi, dword ptr [Dc9bec]
    jmp L6508a
L65072::
    mov ebx, dword ptr [Dc9bec]
    mov esi, dword ptr [edi+ebx*1+0ch]
    jmp L650a6
L6507e::
    mov ebx, dword ptr [Dc9cc4]
    mov esi, dword ptr [ebp+038h]
    xor ebx, dword ptr [ebp+03eh]
L6508a::
    mov ecx, ebx
    and ecx, dword ptr [Dc9cc8]
    and ecx, esi
    and ebx, dword ptr [Dc9cc0]
    and esi, dword ptr [Dc9cc0]
    add esi, ebx
    rcr esi, 1
    add esi, ecx
L650a6::
    mov word ptr [edi+0ch], si
L650aa::
    mov bl, dh
    and bl, 0c0h
    cmp bl, 080h
    jne L651ec
    xor ebx, ebx
    add bl, dh
    jmp dword ptr [ebx*4+D650c3-80h*4]
Func65018_ endp
D650c3 dword offset L651bd
    dword offset L6519d
    dword offset L651b1
    dword offset L65181
    dword offset L65179
    dword offset Func65157_
    dword offset Func65157_
    dword offset Func65157_
    dword offset Func65157_
    dword offset Func65157_
    dword offset Func65157_
    dword offset Func65157_
    dword offset Func65157_
    dword offset Func65157_
    dword offset Func65157_
    dword offset Func65157_
    dword offset Func65157_
    dword offset Func65157_
    dword offset Func65157_
    dword offset Func65157_
    dword offset Func65157_
    dword offset Func65157_
    dword offset Func65157_
    dword offset Func65157_
    dword offset Func65157_
    dword offset Func65157_
    dword offset Func65157_
    dword offset Func65157_
    dword offset Func65157_
    dword offset Func65157_
    dword offset Func65157_
    dword offset Func65157_
    dword offset Func65157_
    dword offset Func65157_
    dword offset Func65157_
    dword offset Func65157_
    dword offset Func65157_
Func65157_ proc near
    lea ecx, [ebx-085h]
    add ecx, dword ptr [Dc9bf0]
    mov ebx, dword ptr [Dc9bec]
    mov esi, dword ptr [ebp+03ah]
    mov ebx, dword ptr [edi+ebx*1+0eh]
    call dword ptr [ecx*4+blend_ops]
    jmp L651e8
L65179::
    mov esi, dword ptr [Dc9c2c]
    jmp L651e8
L65181::
    mov ebx, dword ptr [Dc9bec]
    mov esi, dword ptr [ebp+03ah]
    mov ecx, dword ptr [Dc9bf0]
    mov ebx, dword ptr [edi+ebx*1+0eh]
    call dword ptr [ecx*4+blend_ops]
    jmp L651e8
L6519d::
    mov esi, dword ptr [ebp+03ah]
    add edi, dword ptr [Dc9bec]
    mov ebx, dword ptr [edi+0eh]
    sub edi, dword ptr [Dc9bec]
    jmp L651cc
L651b1::
    mov ebx, dword ptr [Dc9bec]
    mov esi, dword ptr [edi+ebx*1+0eh]
    jmp L651e8
L651bd::
    mov ebx, dword ptr [Dc9cc4]
    mov esi, dword ptr [ebp+03ah]
    xor ebx, dword ptr [ebp+0a4h]
L651cc::
    mov ecx, ebx
    and ecx, dword ptr [Dc9cc8]
    and ecx, esi
    and ebx, dword ptr [Dc9cc0]
    and esi, dword ptr [Dc9cc0]
    add esi, ebx
    rcr esi, 1
    add esi, ecx
L651e8::
    mov word ptr [edi+0eh], si
L651ec::
    bswap edx
    mov bl, dh
    and bl, 0c0h
    cmp bl, 080h
    jne L65335
    xor ebx, ebx
    add bl, dh
    jmp dword ptr [ebx*4+D650c3-2fh*4]
Func65157_ endp
    dword offset L65308
    dword offset L652e5
    dword offset L652fa
    dword offset L652c7
    dword offset L652bf
    dword offset Func6529b_
    dword offset Func6529b_
    dword offset Func6529b_
    dword offset Func6529b_
    dword offset Func6529b_
    dword offset Func6529b_
    dword offset Func6529b_
    dword offset Func6529b_
    dword offset Func6529b_
    dword offset Func6529b_
    dword offset Func6529b_
    dword offset Func6529b_
    dword offset Func6529b_
    dword offset Func6529b_
    dword offset Func6529b_
    dword offset Func6529b_
    dword offset Func6529b_
    dword offset Func6529b_
    dword offset Func6529b_
    dword offset Func6529b_
    dword offset Func6529b_
    dword offset Func6529b_
    dword offset Func6529b_
    dword offset Func6529b_
    dword offset Func6529b_
    dword offset Func6529b_
    dword offset Func6529b_
    dword offset Func6529b_
    dword offset Func6529b_
    dword offset Func6529b_
    dword offset Func6529b_
    dword offset Func6529b_
Func6529b_ proc near
    lea ecx, [ebx-085h]
    add ecx, dword ptr [Dc9bf0]
    mov ebx, edi
    mov esi, dword ptr [ebp+03ch]
    add ebx, dword ptr [Dc9bec]
    mov ebx, dword ptr [eax+ebx*1+0ch]
    call dword ptr [ecx*4+blend_ops]
    jmp L65330
L652bf::
    mov esi, dword ptr [Dc9c2c]
    jmp L65330
L652c7::
    mov ebx, edi
    mov esi, dword ptr [ebp+03ch]
    add ebx, dword ptr [Dc9bec]
    mov ecx, dword ptr [Dc9bf0]
    mov ebx, dword ptr [eax+ebx*1+0ch]
    call dword ptr [ecx*4+blend_ops]
    jmp L65330
L652e5::
    mov esi, dword ptr [ebp+03ch]
    add edi, dword ptr [Dc9bec]
    mov ebx, dword ptr [eax+edi*1+0ch]
    sub edi, dword ptr [Dc9bec]
    jmp L65314
L652fa::
    mov ebx, edi
    add ebx, dword ptr [Dc9bec]
    mov esi, dword ptr [eax+ebx*1+0ch]
    jmp L65330
L65308::
    mov ebx, dword ptr [Dc9cc4]
    mov esi, dword ptr [ebp+03ch]
    xor ebx, dword ptr [ebp+05ah]
L65314::
    mov ecx, ebx
    and ecx, dword ptr [Dc9cc8]
    and ecx, esi
    and ebx, dword ptr [Dc9cc0]
    and esi, dword ptr [Dc9cc0]
    add esi, ebx
    rcr esi, 1
    add esi, ecx
L65330::
    mov word ptr [eax+edi*1+0ch], si
L65335::
    mov bl, dl
    and bl, 0c0h
    cmp bl, 080h
    jne L6547f
    xor ebx, ebx
    add bl, dl
    jmp dword ptr [ebx*4+D6534e-80h*4]
Func6529b_ endp
D6534e dword offset L6544f
    dword offset L6542c
    dword offset L65441
    dword offset L6540e
    dword offset L65406
    dword offset Func653e2_
    dword offset Func653e2_
    dword offset Func653e2_
    dword offset Func653e2_
    dword offset Func653e2_
    dword offset Func653e2_
    dword offset Func653e2_
    dword offset Func653e2_
    dword offset Func653e2_
    dword offset Func653e2_
    dword offset Func653e2_
    dword offset Func653e2_
    dword offset Func653e2_
    dword offset Func653e2_
    dword offset Func653e2_
    dword offset Func653e2_
    dword offset Func653e2_
    dword offset Func653e2_
    dword offset Func653e2_
    dword offset Func653e2_
    dword offset Func653e2_
    dword offset Func653e2_
    dword offset Func653e2_
    dword offset Func653e2_
    dword offset Func653e2_
    dword offset Func653e2_
    dword offset Func653e2_
    dword offset Func653e2_
    dword offset Func653e2_
    dword offset Func653e2_
    dword offset Func653e2_
    dword offset Func653e2_
Func653e2_ proc near
    lea ecx, [ebx-085h]
    add ecx, dword ptr [Dc9bf0]
    mov ebx, edi
    mov esi, dword ptr [ebp+03eh]
    add ebx, dword ptr [Dc9bec]
    mov ebx, dword ptr [eax+ebx*1+0eh]
    call dword ptr [ecx*4+blend_ops]
    jmp L6547a
L65406::
    mov esi, dword ptr [Dc9c2c]
    jmp L6547a
L6540e::
    mov ebx, edi
    mov esi, dword ptr [ebp+03eh]
    add ebx, dword ptr [Dc9bec]
    mov ecx, dword ptr [Dc9bf0]
    mov ebx, dword ptr [eax+ebx*1+0eh]
    call dword ptr [ecx*4+blend_ops]
    jmp L6547a
L6542c::
    mov esi, dword ptr [ebp+03eh]
    add edi, dword ptr [Dc9bec]
    mov ebx, dword ptr [eax+edi*1+0eh]
    sub edi, dword ptr [Dc9bec]
    jmp L6545e
L65441::
    mov ebx, edi
    add ebx, dword ptr [Dc9bec]
    mov esi, dword ptr [eax+ebx*1+0eh]
    jmp L6547a
L6544f::
    mov ebx, dword ptr [Dc9cc4]
    mov esi, dword ptr [ebp+03eh]
    xor ebx, dword ptr [ebp+0c0h]
L6545e::
    mov ecx, ebx
    and ecx, dword ptr [Dc9cc8]
    and ecx, esi
    and ebx, dword ptr [Dc9cc0]
    and esi, dword ptr [Dc9cc0]
    add esi, ebx
    rcr esi, 1
    add esi, ecx
L6547a::
    mov word ptr [eax+edi*1+0eh], si
L6547f::
    pop ecx
    xor edx, edx
    pop ebx
L65483::
    lea edi, [edi+eax*2]
    or edx, dword ptr [ebx+020h]
    je L659a2
    mov ebp, dword ptr [ecx+03ch]
    push ebx
    add ebp, dword ptr [Dc9be8]
    push ecx
    mov bl, dl
    and bl, 0c0h
    cmp bl, 080h
    jne L655d4
    xor ebx, ebx
    add bl, dl
    jmp dword ptr [ebx*4+D654b3-80h*4]
Func653e2_ endp
D654b3 dword offset L655a9
    dword offset L6558b
    dword offset L6559e
    dword offset L65570
    dword offset L65568
    dword offset Func65547_
    dword offset Func65547_
    dword offset Func65547_
    dword offset Func65547_
    dword offset Func65547_
    dword offset Func65547_
    dword offset Func65547_
    dword offset Func65547_
    dword offset Func65547_
    dword offset Func65547_
    dword offset Func65547_
    dword offset Func65547_
    dword offset Func65547_
    dword offset Func65547_
    dword offset Func65547_
    dword offset Func65547_
    dword offset Func65547_
    dword offset Func65547_
    dword offset Func65547_
    dword offset Func65547_
    dword offset Func65547_
    dword offset Func65547_
    dword offset Func65547_
    dword offset Func65547_
    dword offset Func65547_
    dword offset Func65547_
    dword offset Func65547_
    dword offset Func65547_
    dword offset Func65547_
    dword offset Func65547_
    dword offset Func65547_
    dword offset Func65547_
Func65547_ proc near
    lea ecx, [ebx-085h]
    add ecx, dword ptr [Dc9bf0]
    mov ebx, dword ptr [Dc9bec]
    mov esi, dword ptr [ebp+040h]
    mov ebx, dword ptr [edi+ebx*1]
    call dword ptr [ecx*4+blend_ops]
    jmp L655d1
L65568::
    mov esi, dword ptr [Dc9c2c]
    jmp L655d1
L65570::
    mov ebx, dword ptr [Dc9bec]
    mov esi, dword ptr [ebp+040h]
    mov ecx, dword ptr [Dc9bf0]
    mov ebx, dword ptr [edi+ebx*1]
    call dword ptr [ecx*4+blend_ops]
    jmp L655d1
L6558b::
    mov esi, dword ptr [ebp+040h]
    add edi, dword ptr [Dc9bec]
    mov ebx, dword ptr [edi]
    sub edi, dword ptr [Dc9bec]
    jmp L655b5
L6559e::
    mov ebx, dword ptr [Dc9bec]
    mov esi, dword ptr [edi+ebx*1]
    jmp L655d1
L655a9::
    mov ebx, dword ptr [Dc9cc4]
    mov esi, dword ptr [ebp+040h]
    xor ebx, dword ptr [ebp+046h]
L655b5::
    mov ecx, ebx
    and ecx, dword ptr [Dc9cc8]
    and ecx, esi
    and ebx, dword ptr [Dc9cc0]
    and esi, dword ptr [Dc9cc0]
    add esi, ebx
    rcr esi, 1
    add esi, ecx
L655d1::
    mov word ptr [edi], si
L655d4::
    mov bl, dh
    and bl, 0c0h
    cmp bl, 080h
    jne L65713
    xor ebx, ebx
    add bl, dh
    jmp dword ptr [ebx*4+D655ed-80h*4]
Func65547_ endp
D655ed dword offset L656e7
    dword offset L656c7
    dword offset L656db
    dword offset L656ab
    dword offset L656a3
    dword offset Func65681_
    dword offset Func65681_
    dword offset Func65681_
    dword offset Func65681_
    dword offset Func65681_
    dword offset Func65681_
    dword offset Func65681_
    dword offset Func65681_
    dword offset Func65681_
    dword offset Func65681_
    dword offset Func65681_
    dword offset Func65681_
    dword offset Func65681_
    dword offset Func65681_
    dword offset Func65681_
    dword offset Func65681_
    dword offset Func65681_
    dword offset Func65681_
    dword offset Func65681_
    dword offset Func65681_
    dword offset Func65681_
    dword offset Func65681_
    dword offset Func65681_
    dword offset Func65681_
    dword offset Func65681_
    dword offset Func65681_
    dword offset Func65681_
    dword offset Func65681_
    dword offset Func65681_
    dword offset Func65681_
    dword offset Func65681_
    dword offset Func65681_
Func65681_ proc near
    lea ecx, [ebx-085h]
    add ecx, dword ptr [Dc9bf0]
    mov ebx, dword ptr [Dc9bec]
    mov esi, dword ptr [ebp+042h]
    mov ebx, dword ptr [edi+ebx*1+02h]
    call dword ptr [ecx*4+blend_ops]
    jmp L6570f
L656a3::
    mov esi, dword ptr [Dc9c2c]
    jmp L6570f
L656ab::
    mov ebx, dword ptr [Dc9bec]
    mov esi, dword ptr [ebp+042h]
    mov ecx, dword ptr [Dc9bf0]
    mov ebx, dword ptr [edi+ebx*1+02h]
    call dword ptr [ecx*4+blend_ops]
    jmp L6570f
L656c7::
    mov esi, dword ptr [ebp+042h]
    add edi, dword ptr [Dc9bec]
    mov ebx, dword ptr [edi+02h]
    sub edi, dword ptr [Dc9bec]
    jmp L656f3
L656db::
    mov ebx, dword ptr [Dc9bec]
    mov esi, dword ptr [edi+ebx*1+02h]
    jmp L6570f
L656e7::
    mov ebx, dword ptr [Dc9cc4]
    mov esi, dword ptr [ebp+042h]
    xor ebx, dword ptr [ebp+04ch]
L656f3::
    mov ecx, ebx
    and ecx, dword ptr [Dc9cc8]
    and ecx, esi
    and ebx, dword ptr [Dc9cc0]
    and esi, dword ptr [Dc9cc0]
    add esi, ebx
    rcr esi, 1
    add esi, ecx
L6570f::
    mov word ptr [edi+02h], si
L65713::
    bswap edx
    mov bl, dh
    and bl, 0c0h
    cmp bl, 080h
    jne L65857
    xor ebx, ebx
    add bl, dh
    jmp dword ptr [ebx*4+D6572e-80h*4]
Func65681_ endp
D6572e dword offset L6582b
    dword offset L6580a
    dword offset L6581e
    dword offset L657ed
    dword offset L657e5
    dword offset Func657c2_
    dword offset Func657c2_
    dword offset Func657c2_
    dword offset Func657c2_
    dword offset Func657c2_
    dword offset Func657c2_
    dword offset Func657c2_
    dword offset Func657c2_
    dword offset Func657c2_
    dword offset Func657c2_
    dword offset Func657c2_
    dword offset Func657c2_
    dword offset Func657c2_
    dword offset Func657c2_
    dword offset Func657c2_
    dword offset Func657c2_
    dword offset Func657c2_
    dword offset Func657c2_
    dword offset Func657c2_
    dword offset Func657c2_
    dword offset Func657c2_
    dword offset Func657c2_
    dword offset Func657c2_
    dword offset Func657c2_
    dword offset Func657c2_
    dword offset Func657c2_
    dword offset Func657c2_
    dword offset Func657c2_
    dword offset Func657c2_
    dword offset Func657c2_
    dword offset Func657c2_
    dword offset Func657c2_
Func657c2_ proc near
    lea ecx, [ebx-085h]
    add ecx, dword ptr [Dc9bf0]
    mov ebx, edi
    mov esi, dword ptr [ebp+044h]
    add ebx, dword ptr [Dc9bec]
    mov ebx, dword ptr [eax+ebx*1]
    call dword ptr [ecx*4+blend_ops]
    jmp L65853
L657e5::
    mov esi, dword ptr [Dc9c2c]
    jmp L65853
L657ed::
    mov ebx, edi
    mov esi, dword ptr [ebp+044h]
    add ebx, dword ptr [Dc9bec]
    mov ecx, dword ptr [Dc9bf0]
    mov ebx, dword ptr [eax+ebx*1]
    call dword ptr [ecx*4+blend_ops]
    jmp L65853
L6580a::
    mov esi, dword ptr [ebp+044h]
    add edi, dword ptr [Dc9bec]
    mov ebx, dword ptr [eax+edi*1]
    sub edi, dword ptr [Dc9bec]
    jmp L65837
L6581e::
    mov ebx, edi
    add ebx, dword ptr [Dc9bec]
    mov esi, dword ptr [eax+ebx*1]
    jmp L65853
L6582b::
    mov ebx, dword ptr [Dc9cc4]
    mov esi, dword ptr [ebp+044h]
    xor ebx, dword ptr [ebp+062h]
L65837::
    mov ecx, ebx
    and ecx, dword ptr [Dc9cc8]
    and ecx, esi
    and ebx, dword ptr [Dc9cc0]
    and esi, dword ptr [Dc9cc0]
    add esi, ebx
    rcr esi, 1
    add esi, ecx
L65853::
    mov word ptr [eax+edi*1], si
L65857::
    mov bl, dl
    and bl, 0c0h
    cmp bl, 080h
    jne L6599e
    xor ebx, ebx
    add bl, dl
    jmp dword ptr [ebx*4+D65870-80h*4]
Func657c2_ endp
D65870 dword offset L65971
    dword offset L6594e
    dword offset L65963
    dword offset L65930
    dword offset L65928
    dword offset Func65904_
    dword offset Func65904_
    dword offset Func65904_
    dword offset Func65904_
    dword offset Func65904_
    dword offset Func65904_
    dword offset Func65904_
    dword offset Func65904_
    dword offset Func65904_
    dword offset Func65904_
    dword offset Func65904_
    dword offset Func65904_
    dword offset Func65904_
    dword offset Func65904_
    dword offset Func65904_
    dword offset Func65904_
    dword offset Func65904_
    dword offset Func65904_
    dword offset Func65904_
    dword offset Func65904_
    dword offset Func65904_
    dword offset Func65904_
    dword offset Func65904_
    dword offset Func65904_
    dword offset Func65904_
    dword offset Func65904_
    dword offset Func65904_
    dword offset Func65904_
    dword offset Func65904_
    dword offset Func65904_
    dword offset Func65904_
    dword offset Func65904_
Func65904_ proc near
    lea ecx, [ebx-085h]
    add ecx, dword ptr [Dc9bf0]
    mov ebx, edi
    mov esi, dword ptr [ebp+046h]
    add ebx, dword ptr [Dc9bec]
    mov ebx, dword ptr [eax+ebx*1+02h]
    call dword ptr [ecx*4+blend_ops]
    jmp L65999
L65928::
    mov esi, dword ptr [Dc9c2c]
    jmp L65999
L65930::
    mov ebx, edi
    mov esi, dword ptr [ebp+046h]
    add ebx, dword ptr [Dc9bec]
    mov ecx, dword ptr [Dc9bf0]
    mov ebx, dword ptr [eax+ebx*1+02h]
    call dword ptr [ecx*4+blend_ops]
    jmp L65999
L6594e::
    mov esi, dword ptr [ebp+046h]
    add edi, dword ptr [Dc9bec]
    mov ebx, dword ptr [eax+edi*1+02h]
    sub edi, dword ptr [Dc9bec]
    jmp L6597d
L65963::
    mov ebx, edi
    add ebx, dword ptr [Dc9bec]
    mov esi, dword ptr [eax+ebx*1+02h]
    jmp L65999
L65971::
    mov ebx, dword ptr [Dc9cc4]
    mov esi, dword ptr [ebp+046h]
    xor ebx, dword ptr [ebp+068h]
L6597d::
    mov ecx, ebx
    and ecx, dword ptr [Dc9cc8]
    and ecx, esi
    and ebx, dword ptr [Dc9cc0]
    and esi, dword ptr [Dc9cc0]
    add esi, ebx
    rcr esi, 1
    add esi, ecx
L65999::
    mov word ptr [eax+edi*1+02h], si
L6599e::
    pop ecx
    xor edx, edx
    pop ebx
L659a2::
    or edx, dword ptr [ebx+024h]
    je L65ec8
    mov ebp, dword ptr [ecx+03ch]
    push ebx
    add ebp, dword ptr [Dc9be8]
    push ecx
    mov bl, dl
    and bl, 0c0h
    cmp bl, 080h
    jne L65af5
    xor ebx, ebx
    add bl, dl
    jmp dword ptr [ebx*4+D659cf-80h*4]
Func65904_ endp
D659cf dword offset L65ac9
    dword offset L65aa9
    dword offset L65abd
    dword offset L65a8d
    dword offset L65a85
    dword offset Func65a63_
    dword offset Func65a63_
    dword offset Func65a63_
    dword offset Func65a63_
    dword offset Func65a63_
    dword offset Func65a63_
    dword offset Func65a63_
    dword offset Func65a63_
    dword offset Func65a63_
    dword offset Func65a63_
    dword offset Func65a63_
    dword offset Func65a63_
    dword offset Func65a63_
    dword offset Func65a63_
    dword offset Func65a63_
    dword offset Func65a63_
    dword offset Func65a63_
    dword offset Func65a63_
    dword offset Func65a63_
    dword offset Func65a63_
    dword offset Func65a63_
    dword offset Func65a63_
    dword offset Func65a63_
    dword offset Func65a63_
    dword offset Func65a63_
    dword offset Func65a63_
    dword offset Func65a63_
D65a4f dword offset Func65a63_
    dword offset Func65a63_
    dword offset Func65a63_
    dword offset Func65a63_
    dword offset Func65a63_
Func65a63_ proc near
    lea ecx, [ebx-085h]
    add ecx, dword ptr [Dc9bf0]
    mov ebx, dword ptr [Dc9bec]
    mov esi, dword ptr [ebp+048h]
    mov ebx, dword ptr [edi+ebx*1+04h]
    call dword ptr [ecx*4+blend_ops]
    jmp L65af1
L65a85::
    mov esi, dword ptr [Dc9c2c]
    jmp L65af1
L65a8d::
    mov ebx, dword ptr [Dc9bec]
    mov esi, dword ptr [ebp+048h]
    mov ecx, dword ptr [Dc9bf0]
    mov ebx, dword ptr [edi+ebx*1+04h]
    call dword ptr [ecx*4+blend_ops]
    jmp L65af1
L65aa9::
    mov esi, dword ptr [ebp+048h]
    add edi, dword ptr [Dc9bec]
    mov ebx, dword ptr [edi+04h]
    sub edi, dword ptr [Dc9bec]
    jmp L65ad5
L65abd::
    mov ebx, dword ptr [Dc9bec]
    mov esi, dword ptr [edi+ebx*1+04h]
    jmp L65af1
L65ac9::
    mov ebx, dword ptr [Dc9cc4]
    mov esi, dword ptr [ebp+048h]
    xor ebx, dword ptr [ebp+04eh]
L65ad5::
    mov ecx, ebx
    and ecx, dword ptr [Dc9cc8]
    and ecx, esi
    and ebx, dword ptr [Dc9cc0]
    and esi, dword ptr [Dc9cc0]
    add esi, ebx
    rcr esi, 1
    add esi, ecx
L65af1::
    mov word ptr [edi+04h], si
L65af5::
    mov bl, dh
    and bl, 0c0h
    cmp bl, 080h
    jne L65c34
    xor ebx, ebx
    add bl, dh
    jmp dword ptr [ebx*4+D65b0e-80h*4]
Func65a63_ endp
D65b0e dword offset L65c08
    dword offset L65be8
    dword offset L65bfc
    dword offset L65bcc
    dword offset L65bc4
    dword offset Func65ba2_
    dword offset Func65ba2_
    dword offset Func65ba2_
    dword offset Func65ba2_
    dword offset Func65ba2_
    dword offset Func65ba2_
    dword offset Func65ba2_
    dword offset Func65ba2_
    dword offset Func65ba2_
    dword offset Func65ba2_
    dword offset Func65ba2_
    dword offset Func65ba2_
    dword offset Func65ba2_
    dword offset Func65ba2_
    dword offset Func65ba2_
    dword offset Func65ba2_
    dword offset Func65ba2_
    dword offset Func65ba2_
    dword offset Func65ba2_
    dword offset Func65ba2_
    dword offset Func65ba2_
    dword offset Func65ba2_
    dword offset Func65ba2_
    dword offset Func65ba2_
    dword offset Func65ba2_
    dword offset Func65ba2_
    dword offset Func65ba2_
    dword offset Func65ba2_
    dword offset Func65ba2_
D65b96 dword offset Func65ba2_
    dword offset Func65ba2_
    dword offset Func65ba2_
Func65ba2_ proc near
    lea ecx, [ebx-085h]
    add ecx, dword ptr [Dc9bf0]
    mov ebx, dword ptr [Dc9bec]
    mov esi, dword ptr [ebp+04ah]
    mov ebx, dword ptr [edi+ebx*1+06h]
    call dword ptr [ecx*4+blend_ops]
    jmp L65c30
L65bc4::
    mov esi, dword ptr [Dc9c2c]
    jmp L65c30
L65bcc::
    mov ebx, dword ptr [Dc9bec]
    mov esi, dword ptr [ebp+04ah]
    mov ecx, dword ptr [Dc9bf0]
    mov ebx, dword ptr [edi+ebx*1+06h]
    call dword ptr [ecx*4+blend_ops]
    jmp L65c30
L65be8::
    mov esi, dword ptr [ebp+04ah]
    add edi, dword ptr [Dc9bec]
    mov ebx, dword ptr [edi+06h]
    sub edi, dword ptr [Dc9bec]
    jmp L65c14
L65bfc::
    mov ebx, dword ptr [Dc9bec]
    mov esi, dword ptr [edi+ebx*1+06h]
    jmp L65c30
L65c08::
    mov ebx, dword ptr [Dc9cc4]
    mov esi, dword ptr [ebp+04ah]
    xor ebx, dword ptr [ebp+054h]
L65c14::
    mov ecx, ebx
    and ecx, dword ptr [Dc9cc8]
    and ecx, esi
    and ebx, dword ptr [Dc9cc0]
    and esi, dword ptr [Dc9cc0]
    add esi, ebx
    rcr esi, 1
    add esi, ecx
L65c30::
    mov word ptr [edi+06h], si
L65c34::
    bswap edx
    mov bl, dh
    and bl, 0c0h
    cmp bl, 080h
    jne L65d7d
    xor ebx, ebx
    add bl, dh
    jmp dword ptr [ebx*4+D65a4f]
Func65ba2_ endp
    dword offset L65d50
    dword offset L65d2d
    dword offset L65d42
    dword offset L65d0f
    dword offset L65d07
    dword offset Func65ce3_
    dword offset Func65ce3_
    dword offset Func65ce3_
    dword offset Func65ce3_
    dword offset Func65ce3_
    dword offset Func65ce3_
    dword offset Func65ce3_
    dword offset Func65ce3_
    dword offset Func65ce3_
    dword offset Func65ce3_
    dword offset Func65ce3_
    dword offset Func65ce3_
    dword offset Func65ce3_
    dword offset Func65ce3_
    dword offset Func65ce3_
    dword offset Func65ce3_
    dword offset Func65ce3_
    dword offset Func65ce3_
    dword offset Func65ce3_
    dword offset Func65ce3_
    dword offset Func65ce3_
    dword offset Func65ce3_
    dword offset Func65ce3_
    dword offset Func65ce3_
    dword offset Func65ce3_
    dword offset Func65ce3_
    dword offset Func65ce3_
    dword offset Func65ce3_
    dword offset Func65ce3_
    dword offset Func65ce3_
    dword offset Func65ce3_
    dword offset Func65ce3_
Func65ce3_ proc near
    lea ecx, [ebx-085h]
    add ecx, dword ptr [Dc9bf0]
    mov ebx, edi
    mov esi, dword ptr [ebp+04ch]
    add ebx, dword ptr [Dc9bec]
    mov ebx, dword ptr [eax+ebx*1+04h]
    call dword ptr [ecx*4+blend_ops]
    jmp L65d78
L65d07::
    mov esi, dword ptr [Dc9c2c]
    jmp L65d78
L65d0f::
    mov ebx, edi
    mov esi, dword ptr [ebp+04ch]
    add ebx, dword ptr [Dc9bec]
    mov ecx, dword ptr [Dc9bf0]
    mov ebx, dword ptr [eax+ebx*1+04h]
    call dword ptr [ecx*4+blend_ops]
    jmp L65d78
L65d2d::
    mov esi, dword ptr [ebp+04ch]
    add edi, dword ptr [Dc9bec]
    mov ebx, dword ptr [eax+edi*1+04h]
    sub edi, dword ptr [Dc9bec]
    jmp L65d5c
L65d42::
    mov ebx, edi
    add ebx, dword ptr [Dc9bec]
    mov esi, dword ptr [eax+ebx*1+04h]
    jmp L65d78
L65d50::
    mov ebx, dword ptr [Dc9cc4]
    mov esi, dword ptr [ebp+04ch]
    xor ebx, dword ptr [ebp+06ah]
L65d5c::
    mov ecx, ebx
    and ecx, dword ptr [Dc9cc8]
    and ecx, esi
    and ebx, dword ptr [Dc9cc0]
    and esi, dword ptr [Dc9cc0]
    add esi, ebx
    rcr esi, 1
    add esi, ecx
L65d78::
    mov word ptr [eax+edi*1+04h], si
L65d7d::
    mov bl, dl
    and bl, 0c0h
    cmp bl, 080h
    jne L65ec4
    xor ebx, ebx
    add bl, dl
    jmp dword ptr [ebx*4+D65b96]
Func65ce3_ endp
    dword offset L65e97
    dword offset L65e74
    dword offset L65e89
    dword offset L65e56
    dword offset L65e4e
    dword offset Func65e2a_
    dword offset Func65e2a_
    dword offset Func65e2a_
    dword offset Func65e2a_
    dword offset Func65e2a_
    dword offset Func65e2a_
    dword offset Func65e2a_
    dword offset Func65e2a_
    dword offset Func65e2a_
    dword offset Func65e2a_
    dword offset Func65e2a_
    dword offset Func65e2a_
    dword offset Func65e2a_
    dword offset Func65e2a_
    dword offset Func65e2a_
    dword offset Func65e2a_
    dword offset Func65e2a_
    dword offset Func65e2a_
    dword offset Func65e2a_
    dword offset Func65e2a_
    dword offset Func65e2a_
    dword offset Func65e2a_
    dword offset Func65e2a_
    dword offset Func65e2a_
    dword offset Func65e2a_
    dword offset Func65e2a_
    dword offset Func65e2a_
    dword offset Func65e2a_
    dword offset Func65e2a_
    dword offset Func65e2a_
    dword offset Func65e2a_
    dword offset Func65e2a_
Func65e2a_ proc near
    lea ecx, [ebx-085h]
    add ecx, dword ptr [Dc9bf0]
    mov ebx, edi
    mov esi, dword ptr [ebp+04eh]
    add ebx, dword ptr [Dc9bec]
    mov ebx, dword ptr [eax+ebx*1+06h]
    call dword ptr [ecx*4+blend_ops]
    jmp L65ebf
L65e4e::
    mov esi, dword ptr [Dc9c2c]
    jmp L65ebf
L65e56::
    mov ebx, edi
    mov esi, dword ptr [ebp+04eh]
    add ebx, dword ptr [Dc9bec]
    mov ecx, dword ptr [Dc9bf0]
    mov ebx, dword ptr [eax+ebx*1+06h]
    call dword ptr [ecx*4+blend_ops]
    jmp L65ebf
L65e74::
    mov esi, dword ptr [ebp+04eh]
    add edi, dword ptr [Dc9bec]
    mov ebx, dword ptr [eax+edi*1+06h]
    sub edi, dword ptr [Dc9bec]
    jmp L65ea3
L65e89::
    mov ebx, edi
    add ebx, dword ptr [Dc9bec]
    mov esi, dword ptr [eax+ebx*1+06h]
    jmp L65ebf
L65e97::
    mov ebx, dword ptr [Dc9cc4]
    mov esi, dword ptr [ebp+04eh]
    xor ebx, dword ptr [ebp+070h]
L65ea3::
    mov ecx, ebx
    and ecx, dword ptr [Dc9cc8]
    and ecx, esi
    and ebx, dword ptr [Dc9cc0]
    and esi, dword ptr [Dc9cc0]
    add esi, ebx
    rcr esi, 1
    add esi, ecx
L65ebf::
    mov word ptr [eax+edi*1+06h], si
L65ec4::
    pop ecx
    xor edx, edx
    pop ebx
L65ec8::
    or edx, dword ptr [ebx+028h]
    je L663ee
    mov ebp, dword ptr [ecx+03ch]
    push ebx
    add ebp, dword ptr [Dc9be8]
    push ecx
    mov bl, dl
    and bl, 0c0h
    cmp bl, 080h
    jne L6601b
    xor ebx, ebx
    add bl, dl
    jmp dword ptr [ebx*4+D65ef5-80h*4]
Func65e2a_ endp
D65ef5 dword offset L65fef
    dword offset L65fcf
    dword offset L65fe3
    dword offset L65fb3
    dword offset L65fab
    dword offset Func65f89_
    dword offset Func65f89_
    dword offset Func65f89_
    dword offset Func65f89_
    dword offset Func65f89_
    dword offset Func65f89_
    dword offset Func65f89_
    dword offset Func65f89_
    dword offset Func65f89_
    dword offset Func65f89_
    dword offset Func65f89_
    dword offset Func65f89_
    dword offset Func65f89_
    dword offset Func65f89_
    dword offset Func65f89_
    dword offset Func65f89_
    dword offset Func65f89_
    dword offset Func65f89_
    dword offset Func65f89_
    dword offset Func65f89_
    dword offset Func65f89_
    dword offset Func65f89_
    dword offset Func65f89_
    dword offset Func65f89_
    dword offset Func65f89_
    dword offset Func65f89_
    dword offset Func65f89_
D65f75 dword offset Func65f89_
    dword offset Func65f89_
    dword offset Func65f89_
    dword offset Func65f89_
    dword offset Func65f89_
Func65f89_ proc near
    lea ecx, [ebx-085h]
    add ecx, dword ptr [Dc9bf0]
    mov ebx, dword ptr [Dc9bec]
    mov esi, dword ptr [ebp+050h]
    mov ebx, dword ptr [edi+ebx*1+08h]
    call dword ptr [ecx*4+blend_ops]
    jmp L66017
L65fab::
    mov esi, dword ptr [Dc9c2c]
    jmp L66017
L65fb3::
    mov ebx, dword ptr [Dc9bec]
    mov esi, dword ptr [ebp+050h]
    mov ecx, dword ptr [Dc9bf0]
    mov ebx, dword ptr [edi+ebx*1+08h]
    call dword ptr [ecx*4+blend_ops]
    jmp L66017
L65fcf::
    mov esi, dword ptr [ebp+050h]
    add edi, dword ptr [Dc9bec]
    mov ebx, dword ptr [edi+08h]
    sub edi, dword ptr [Dc9bec]
    jmp L65ffb
L65fe3::
    mov ebx, dword ptr [Dc9bec]
    mov esi, dword ptr [edi+ebx*1+08h]
    jmp L66017
L65fef::
    mov ebx, dword ptr [Dc9cc4]
    mov esi, dword ptr [ebp+050h]
    xor ebx, dword ptr [ebp+056h]
L65ffb::
    mov ecx, ebx
    and ecx, dword ptr [Dc9cc8]
    and ecx, esi
    and ebx, dword ptr [Dc9cc0]
    and esi, dword ptr [Dc9cc0]
    add esi, ebx
    rcr esi, 1
    add esi, ecx
L66017::
    mov word ptr [edi+08h], si
L6601b::
    mov bl, dh
    and bl, 0c0h
    cmp bl, 080h
    jne L6615a
    xor ebx, ebx
    add bl, dh
    jmp dword ptr [ebx*4+D66034-80h*4]
Func65f89_ endp
D66034 dword offset L6612e
    dword offset L6610e
    dword offset L66122
    dword offset L660f2
    dword offset L660ea
    dword offset Func660c8_
    dword offset Func660c8_
    dword offset Func660c8_
    dword offset Func660c8_
    dword offset Func660c8_
    dword offset Func660c8_
    dword offset Func660c8_
    dword offset Func660c8_
    dword offset Func660c8_
    dword offset Func660c8_
    dword offset Func660c8_
    dword offset Func660c8_
    dword offset Func660c8_
    dword offset Func660c8_
    dword offset Func660c8_
    dword offset Func660c8_
    dword offset Func660c8_
    dword offset Func660c8_
    dword offset Func660c8_
    dword offset Func660c8_
    dword offset Func660c8_
    dword offset Func660c8_
    dword offset Func660c8_
    dword offset Func660c8_
    dword offset Func660c8_
    dword offset Func660c8_
    dword offset Func660c8_
    dword offset Func660c8_
    dword offset Func660c8_
D660bc dword offset Func660c8_
    dword offset Func660c8_
    dword offset Func660c8_
Func660c8_ proc near
    lea ecx, [ebx-085h]
    add ecx, dword ptr [Dc9bf0]
    mov ebx, dword ptr [Dc9bec]
    mov esi, dword ptr [ebp+052h]
    mov ebx, dword ptr [edi+ebx*1+0ah]
    call dword ptr [ecx*4+blend_ops]
    jmp L66156
L660ea::
    mov esi, dword ptr [Dc9c2c]
    jmp L66156
L660f2::
    mov ebx, dword ptr [Dc9bec]
    mov esi, dword ptr [ebp+052h]
    mov ecx, dword ptr [Dc9bf0]
    mov ebx, dword ptr [edi+ebx*1+0ah]
    call dword ptr [ecx*4+blend_ops]
    jmp L66156
L6610e::
    mov esi, dword ptr [ebp+052h]
    add edi, dword ptr [Dc9bec]
    mov ebx, dword ptr [edi+0ah]
    sub edi, dword ptr [Dc9bec]
    jmp L6613a
L66122::
    mov ebx, dword ptr [Dc9bec]
    mov esi, dword ptr [edi+ebx*1+0ah]
    jmp L66156
L6612e::
    mov ebx, dword ptr [Dc9cc4]
    mov esi, dword ptr [ebp+052h]
    xor ebx, dword ptr [ebp+05ch]
L6613a::
    mov ecx, ebx
    and ecx, dword ptr [Dc9cc8]
    and ecx, esi
    and ebx, dword ptr [Dc9cc0]
    and esi, dword ptr [Dc9cc0]
    add esi, ebx
    rcr esi, 1
    add esi, ecx
L66156::
    mov word ptr [edi+0ah], si
L6615a::
    bswap edx
    mov bl, dh
    and bl, 0c0h
    cmp bl, 080h
    jne L662a3
    xor ebx, ebx
    add bl, dh
    jmp dword ptr [ebx*4+D65f75]
Func660c8_ endp
    dword offset L66276
    dword offset L66253
    dword offset L66268
    dword offset L66235
    dword offset L6622d
    dword offset Func66209_
    dword offset Func66209_
    dword offset Func66209_
    dword offset Func66209_
    dword offset Func66209_
    dword offset Func66209_
    dword offset Func66209_
    dword offset Func66209_
    dword offset Func66209_
    dword offset Func66209_
    dword offset Func66209_
    dword offset Func66209_
    dword offset Func66209_
    dword offset Func66209_
    dword offset Func66209_
    dword offset Func66209_
    dword offset Func66209_
    dword offset Func66209_
    dword offset Func66209_
    dword offset Func66209_
    dword offset Func66209_
    dword offset Func66209_
    dword offset Func66209_
    dword offset Func66209_
    dword offset Func66209_
    dword offset Func66209_
    dword offset Func66209_
    dword offset Func66209_
    dword offset Func66209_
    dword offset Func66209_
    dword offset Func66209_
    dword offset Func66209_
Func66209_ proc near
    lea ecx, [ebx-085h]
    add ecx, dword ptr [Dc9bf0]
    mov ebx, edi
    mov esi, dword ptr [ebp+054h]
    add ebx, dword ptr [Dc9bec]
    mov ebx, dword ptr [eax+ebx*1+08h]
    call dword ptr [ecx*4+blend_ops]
    jmp L6629e
L6622d::
    mov esi, dword ptr [Dc9c2c]
    jmp L6629e
L66235::
    mov ebx, edi
    mov esi, dword ptr [ebp+054h]
    add ebx, dword ptr [Dc9bec]
    mov ecx, dword ptr [Dc9bf0]
    mov ebx, dword ptr [eax+ebx*1+08h]
    call dword ptr [ecx*4+blend_ops]
    jmp L6629e
L66253::
    mov esi, dword ptr [ebp+054h]
    add edi, dword ptr [Dc9bec]
    mov ebx, dword ptr [eax+edi*1+08h]
    sub edi, dword ptr [Dc9bec]
    jmp L66282
L66268::
    mov ebx, edi
    add ebx, dword ptr [Dc9bec]
    mov esi, dword ptr [eax+ebx*1+08h]
    jmp L6629e
L66276::
    mov ebx, dword ptr [Dc9cc4]
    mov esi, dword ptr [ebp+054h]
    xor ebx, dword ptr [ebp+072h]
L66282::
    mov ecx, ebx
    and ecx, dword ptr [Dc9cc8]
    and ecx, esi
    and ebx, dword ptr [Dc9cc0]
    and esi, dword ptr [Dc9cc0]
    add esi, ebx
    rcr esi, 1
    add esi, ecx
L6629e::
    mov word ptr [eax+edi*1+08h], si
L662a3::
    mov bl, dl
    and bl, 0c0h
    cmp bl, 080h
    jne L663ea
    xor ebx, ebx
    add bl, dl
    jmp dword ptr [ebx*4+D660bc]
Func66209_ endp
    dword offset L663bd
    dword offset L6639a
    dword offset L663af
    dword offset L6637c
    dword offset L66374
    dword offset Func66350_
    dword offset Func66350_
    dword offset Func66350_
    dword offset Func66350_
    dword offset Func66350_
    dword offset Func66350_
    dword offset Func66350_
    dword offset Func66350_
    dword offset Func66350_
    dword offset Func66350_
    dword offset Func66350_
    dword offset Func66350_
    dword offset Func66350_
    dword offset Func66350_
    dword offset Func66350_
    dword offset Func66350_
    dword offset Func66350_
    dword offset Func66350_
    dword offset Func66350_
    dword offset Func66350_
    dword offset Func66350_
    dword offset Func66350_
    dword offset Func66350_
    dword offset Func66350_
    dword offset Func66350_
    dword offset Func66350_
    dword offset Func66350_
    dword offset Func66350_
    dword offset Func66350_
    dword offset Func66350_
    dword offset Func66350_
    dword offset Func66350_
Func66350_ proc near
    lea ecx, [ebx-085h]
    add ecx, dword ptr [Dc9bf0]
    mov ebx, edi
    mov esi, dword ptr [ebp+056h]
    add ebx, dword ptr [Dc9bec]
    mov ebx, dword ptr [eax+ebx*1+0ah]
    call dword ptr [ecx*4+blend_ops]
    jmp L663e5
L66374::
    mov esi, dword ptr [Dc9c2c]
    jmp L663e5
L6637c::
    mov ebx, edi
    mov esi, dword ptr [ebp+056h]
    add ebx, dword ptr [Dc9bec]
    mov ecx, dword ptr [Dc9bf0]
    mov ebx, dword ptr [eax+ebx*1+0ah]
    call dword ptr [ecx*4+blend_ops]
    jmp L663e5
L6639a::
    mov esi, dword ptr [ebp+056h]
    add edi, dword ptr [Dc9bec]
    mov ebx, dword ptr [eax+edi*1+0ah]
    sub edi, dword ptr [Dc9bec]
    jmp L663c9
L663af::
    mov ebx, edi
    add ebx, dword ptr [Dc9bec]
    mov esi, dword ptr [eax+ebx*1+0ah]
    jmp L663e5
L663bd::
    mov ebx, dword ptr [Dc9cc4]
    mov esi, dword ptr [ebp+056h]
    xor ebx, dword ptr [ebp+078h]
L663c9::
    mov ecx, ebx
    and ecx, dword ptr [Dc9cc8]
    and ecx, esi
    and ebx, dword ptr [Dc9cc0]
    and esi, dword ptr [Dc9cc0]
    add esi, ebx
    rcr esi, 1
    add esi, ecx
L663e5::
    mov word ptr [eax+edi*1+0ah], si
L663ea::
    pop ecx
    xor edx, edx
    pop ebx
L663ee::
    or edx, dword ptr [ebx+02ch]
    je L6691a
    mov ebp, dword ptr [ecx+03ch]
    push ebx
    add ebp, dword ptr [Dc9be8]
    push ecx
    mov bl, dl
    and bl, 0c0h
    cmp bl, 080h
    jne L66541
    xor ebx, ebx
    add bl, dl
    jmp dword ptr [ebx*4+D6641b-80h*4]
Func66350_ endp
D6641b dword offset L66515
    dword offset L664f5
    dword offset L66509
    dword offset L664d9
    dword offset L664d1
    dword offset Func664af_
    dword offset Func664af_
    dword offset Func664af_
    dword offset Func664af_
    dword offset Func664af_
    dword offset Func664af_
    dword offset Func664af_
    dword offset Func664af_
    dword offset Func664af_
    dword offset Func664af_
    dword offset Func664af_
    dword offset Func664af_
    dword offset Func664af_
    dword offset Func664af_
    dword offset Func664af_
    dword offset Func664af_
    dword offset Func664af_
    dword offset Func664af_
    dword offset Func664af_
    dword offset Func664af_
    dword offset Func664af_
    dword offset Func664af_
    dword offset Func664af_
    dword offset Func664af_
    dword offset Func664af_
    dword offset Func664af_
    dword offset Func664af_
    dword offset Func664af_
    dword offset Func664af_
    dword offset Func664af_
    dword offset Func664af_
    dword offset Func664af_
Func664af_ proc near
    lea ecx, [ebx-085h]
    add ecx, dword ptr [Dc9bf0]
    mov ebx, dword ptr [Dc9bec]
    mov esi, dword ptr [ebp+058h]
    mov ebx, dword ptr [edi+ebx*1+0ch]
    call dword ptr [ecx*4+blend_ops]
    jmp L6653d
L664d1::
    mov esi, dword ptr [Dc9c2c]
    jmp L6653d
L664d9::
    mov ebx, dword ptr [Dc9bec]
    mov esi, dword ptr [ebp+058h]
    mov ecx, dword ptr [Dc9bf0]
    mov ebx, dword ptr [edi+ebx*1+0ch]
    call dword ptr [ecx*4+blend_ops]
    jmp L6653d
L664f5::
    mov esi, dword ptr [ebp+058h]
    add edi, dword ptr [Dc9bec]
    mov ebx, dword ptr [edi+0ch]
    sub edi, dword ptr [Dc9bec]
    jmp L66521
L66509::
    mov ebx, dword ptr [Dc9bec]
    mov esi, dword ptr [edi+ebx*1+0ch]
    jmp L6653d
L66515::
    mov ebx, dword ptr [Dc9cc4]
    mov esi, dword ptr [ebp+058h]
    xor ebx, dword ptr [ebp+05eh]
L66521::
    mov ecx, ebx
    and ecx, dword ptr [Dc9cc8]
    and ecx, esi
    and ebx, dword ptr [Dc9cc0]
    and esi, dword ptr [Dc9cc0]
    add esi, ebx
    rcr esi, 1
    add esi, ecx
L6653d::
    mov word ptr [edi+0ch], si
L66541::
    mov bl, dh
    and bl, 0c0h
    cmp bl, 080h
    jne L66683
    xor ebx, ebx
    add bl, dh
    jmp dword ptr [ebx*4+D6655a-80h*4]
Func664af_ endp
D6655a dword offset L66654
    dword offset L66634
    dword offset L66648
    dword offset L66618
    dword offset L66610
    dword offset Func665ee_
    dword offset Func665ee_
    dword offset Func665ee_
    dword offset Func665ee_
    dword offset Func665ee_
    dword offset Func665ee_
    dword offset Func665ee_
    dword offset Func665ee_
    dword offset Func665ee_
    dword offset Func665ee_
    dword offset Func665ee_
    dword offset Func665ee_
    dword offset Func665ee_
    dword offset Func665ee_
    dword offset Func665ee_
    dword offset Func665ee_
    dword offset Func665ee_
    dword offset Func665ee_
    dword offset Func665ee_
    dword offset Func665ee_
    dword offset Func665ee_
    dword offset Func665ee_
    dword offset Func665ee_
    dword offset Func665ee_
    dword offset Func665ee_
    dword offset Func665ee_
    dword offset Func665ee_
    dword offset Func665ee_
    dword offset Func665ee_
    dword offset Func665ee_
    dword offset Func665ee_
    dword offset Func665ee_
Func665ee_ proc near
    lea ecx, [ebx-085h]
    add ecx, dword ptr [Dc9bf0]
    mov ebx, dword ptr [Dc9bec]
    mov esi, dword ptr [ebp+05ah]
    mov ebx, dword ptr [edi+ebx*1+0eh]
    call dword ptr [ecx*4+blend_ops]
    jmp L6667f
L66610::
    mov esi, dword ptr [Dc9c2c]
    jmp L6667f
L66618::
    mov ebx, dword ptr [Dc9bec]
    mov esi, dword ptr [ebp+05ah]
    mov ecx, dword ptr [Dc9bf0]
    mov ebx, dword ptr [edi+ebx*1+0eh]
    call dword ptr [ecx*4+blend_ops]
    jmp L6667f
L66634::
    mov esi, dword ptr [ebp+05ah]
    add edi, dword ptr [Dc9bec]
    mov ebx, dword ptr [edi+0eh]
    sub edi, dword ptr [Dc9bec]
    jmp L66663
L66648::
    mov ebx, dword ptr [Dc9bec]
    mov esi, dword ptr [edi+ebx*1+0eh]
    jmp L6667f
L66654::
    mov ebx, dword ptr [Dc9cc4]
    mov esi, dword ptr [ebp+05ah]
    xor ebx, dword ptr [ebp+0c4h]
L66663::
    mov ecx, ebx
    and ecx, dword ptr [Dc9cc8]
    and ecx, esi
    and ebx, dword ptr [Dc9cc0]
    and esi, dword ptr [Dc9cc0]
    add esi, ebx
    rcr esi, 1
    add esi, ecx
L6667f::
    mov word ptr [edi+0eh], si
L66683::
    bswap edx
    mov bl, dh
    and bl, 0c0h
    cmp bl, 080h
    jne L667cc
    xor ebx, ebx
    add bl, dh
    jmp dword ptr [ebx*4+D6655a-2fh*4]
Func665ee_ endp
    dword offset L6679f
    dword offset L6677c
    dword offset L66791
    dword offset L6675e
    dword offset L66756
    dword offset Func66732_
    dword offset Func66732_
    dword offset Func66732_
    dword offset Func66732_
    dword offset Func66732_
    dword offset Func66732_
    dword offset Func66732_
    dword offset Func66732_
    dword offset Func66732_
    dword offset Func66732_
    dword offset Func66732_
    dword offset Func66732_
    dword offset Func66732_
    dword offset Func66732_
    dword offset Func66732_
    dword offset Func66732_
    dword offset Func66732_
    dword offset Func66732_
    dword offset Func66732_
    dword offset Func66732_
    dword offset Func66732_
    dword offset Func66732_
    dword offset Func66732_
    dword offset Func66732_
    dword offset Func66732_
    dword offset Func66732_
    dword offset Func66732_
    dword offset Func66732_
    dword offset Func66732_
    dword offset Func66732_
    dword offset Func66732_
    dword offset Func66732_
Func66732_ proc near
    lea ecx, [ebx-085h]
    add ecx, dword ptr [Dc9bf0]
    mov ebx, edi
    mov esi, dword ptr [ebp+05ch]
    add ebx, dword ptr [Dc9bec]
    mov ebx, dword ptr [eax+ebx*1+0ch]
    call dword ptr [ecx*4+blend_ops]
    jmp L667c7
L66756::
    mov esi, dword ptr [Dc9c2c]
    jmp L667c7
L6675e::
    mov ebx, edi
    mov esi, dword ptr [ebp+05ch]
    add ebx, dword ptr [Dc9bec]
    mov ecx, dword ptr [Dc9bf0]
    mov ebx, dword ptr [eax+ebx*1+0ch]
    call dword ptr [ecx*4+blend_ops]
    jmp L667c7
L6677c::
    mov esi, dword ptr [ebp+05ch]
    add edi, dword ptr [Dc9bec]
    mov ebx, dword ptr [eax+edi*1+0ch]
    sub edi, dword ptr [Dc9bec]
    jmp L667ab
L66791::
    mov ebx, edi
    add ebx, dword ptr [Dc9bec]
    mov esi, dword ptr [eax+ebx*1+0ch]
    jmp L667c7
L6679f::
    mov ebx, dword ptr [Dc9cc4]
    mov esi, dword ptr [ebp+05ch]
    xor ebx, dword ptr [ebp+07ah]
L667ab::
    mov ecx, ebx
    and ecx, dword ptr [Dc9cc8]
    and ecx, esi
    and ebx, dword ptr [Dc9cc0]
    and esi, dword ptr [Dc9cc0]
    add esi, ebx
    rcr esi, 1
    add esi, ecx
L667c7::
    mov word ptr [eax+edi*1+0ch], si
L667cc::
    mov bl, dl
    and bl, 0c0h
    cmp bl, 080h
    jne L66916
    xor ebx, ebx
    add bl, dl
    jmp dword ptr [ebx*4+D667e5-80h*4]
Func66732_ endp
D667e5 dword offset L668e6
    dword offset L668c3
    dword offset L668d8
    dword offset L668a5
    dword offset L6689d
    dword offset Func66879_
    dword offset Func66879_
    dword offset Func66879_
    dword offset Func66879_
    dword offset Func66879_
    dword offset Func66879_
    dword offset Func66879_
    dword offset Func66879_
    dword offset Func66879_
    dword offset Func66879_
    dword offset Func66879_
    dword offset Func66879_
    dword offset Func66879_
    dword offset Func66879_
    dword offset Func66879_
    dword offset Func66879_
    dword offset Func66879_
    dword offset Func66879_
    dword offset Func66879_
    dword offset Func66879_
    dword offset Func66879_
    dword offset Func66879_
    dword offset Func66879_
    dword offset Func66879_
    dword offset Func66879_
    dword offset Func66879_
    dword offset Func66879_
    dword offset Func66879_
    dword offset Func66879_
    dword offset Func66879_
    dword offset Func66879_
    dword offset Func66879_
Func66879_ proc near
    lea ecx, [ebx-085h]
    add ecx, dword ptr [Dc9bf0]
    mov ebx, edi
    mov esi, dword ptr [ebp+05eh]
    add ebx, dword ptr [Dc9bec]
    mov ebx, dword ptr [eax+ebx*1+0eh]
    call dword ptr [ecx*4+blend_ops]
    jmp L66911
L6689d::
    mov esi, dword ptr [Dc9c2c]
    jmp L66911
L668a5::
    mov ebx, edi
    mov esi, dword ptr [ebp+05eh]
    add ebx, dword ptr [Dc9bec]
    mov ecx, dword ptr [Dc9bf0]
    mov ebx, dword ptr [eax+ebx*1+0eh]
    call dword ptr [ecx*4+blend_ops]
    jmp L66911
L668c3::
    mov esi, dword ptr [ebp+05eh]
    add edi, dword ptr [Dc9bec]
    mov ebx, dword ptr [eax+edi*1+0eh]
    sub edi, dword ptr [Dc9bec]
    jmp L668f5
L668d8::
    mov ebx, edi
    add ebx, dword ptr [Dc9bec]
    mov esi, dword ptr [eax+ebx*1+0eh]
    jmp L66911
L668e6::
    mov ebx, dword ptr [Dc9cc4]
    mov esi, dword ptr [ebp+05eh]
    xor ebx, dword ptr [ebp+0e0h]
L668f5::
    mov ecx, ebx
    and ecx, dword ptr [Dc9cc8]
    and ecx, esi
    and ebx, dword ptr [Dc9cc0]
    and esi, dword ptr [Dc9cc0]
    add esi, ebx
    rcr esi, 1
    add esi, ecx
L66911::
    mov word ptr [eax+edi*1+0eh], si
L66916::
    pop ecx
    xor edx, edx
    pop ebx
L6691a::
    lea edi, [edi+eax*2]
    or edx, dword ptr [ebx+030h]
    je L66e4d
    mov ebp, dword ptr [ecx+03ch]
    push ebx
    add ebp, dword ptr [Dc9be8]
    push ecx
    mov bl, dl
    and bl, 0c0h
    cmp bl, 080h
    jne L66a6b
    xor ebx, ebx
    add bl, dl
    jmp dword ptr [ebx*4+D6694a-80h*4]
Func66879_ endp
D6694a dword offset L66a40
    dword offset L66a22
    dword offset L66a35
    dword offset L66a07
    dword offset L669ff
    dword offset Func669de_
    dword offset Func669de_
    dword offset Func669de_
    dword offset Func669de_
    dword offset Func669de_
    dword offset Func669de_
    dword offset Func669de_
    dword offset Func669de_
    dword offset Func669de_
    dword offset Func669de_
    dword offset Func669de_
    dword offset Func669de_
    dword offset Func669de_
    dword offset Func669de_
    dword offset Func669de_
    dword offset Func669de_
    dword offset Func669de_
    dword offset Func669de_
    dword offset Func669de_
    dword offset Func669de_
    dword offset Func669de_
    dword offset Func669de_
    dword offset Func669de_
    dword offset Func669de_
    dword offset Func669de_
    dword offset Func669de_
    dword offset Func669de_
    dword offset Func669de_
    dword offset Func669de_
    dword offset Func669de_
    dword offset Func669de_
    dword offset Func669de_
Func669de_ proc near
    lea ecx, [ebx-085h]
    add ecx, dword ptr [Dc9bf0]
    mov ebx, dword ptr [Dc9bec]
    mov esi, dword ptr [ebp+060h]
    mov ebx, dword ptr [edi+ebx*1]
    call dword ptr [ecx*4+blend_ops]
    jmp L66a68
L669ff::
    mov esi, dword ptr [Dc9c2c]
    jmp L66a68
L66a07::
    mov ebx, dword ptr [Dc9bec]
    mov esi, dword ptr [ebp+060h]
    mov ecx, dword ptr [Dc9bf0]
    mov ebx, dword ptr [edi+ebx*1]
    call dword ptr [ecx*4+blend_ops]
    jmp L66a68
L66a22::
    mov esi, dword ptr [ebp+060h]
    add edi, dword ptr [Dc9bec]
    mov ebx, dword ptr [edi]
    sub edi, dword ptr [Dc9bec]
    jmp L66a4c
L66a35::
    mov ebx, dword ptr [Dc9bec]
    mov esi, dword ptr [edi+ebx*1]
    jmp L66a68
L66a40::
    mov ebx, dword ptr [Dc9cc4]
    mov esi, dword ptr [ebp+060h]
    xor ebx, dword ptr [ebp+066h]
L66a4c::
    mov ecx, ebx
    and ecx, dword ptr [Dc9cc8]
    and ecx, esi
    and ebx, dword ptr [Dc9cc0]
    and esi, dword ptr [Dc9cc0]
    add esi, ebx
    rcr esi, 1
    add esi, ecx
L66a68::
    mov word ptr [edi], si
L66a6b::
    mov bl, dh
    and bl, 0c0h
    cmp bl, 080h
    jne L66baa
    xor ebx, ebx
    add bl, dh
    jmp dword ptr [ebx*4+D66a84-80h*4]
Func669de_ endp
D66a84 dword offset L66b7e
    dword offset L66b5e
    dword offset L66b72
    dword offset L66b42
    dword offset L66b3a
    dword offset Func66b18_
    dword offset Func66b18_
    dword offset Func66b18_
    dword offset Func66b18_
    dword offset Func66b18_
    dword offset Func66b18_
    dword offset Func66b18_
    dword offset Func66b18_
    dword offset Func66b18_
    dword offset Func66b18_
    dword offset Func66b18_
    dword offset Func66b18_
    dword offset Func66b18_
    dword offset Func66b18_
    dword offset Func66b18_
    dword offset Func66b18_
    dword offset Func66b18_
    dword offset Func66b18_
    dword offset Func66b18_
    dword offset Func66b18_
    dword offset Func66b18_
    dword offset Func66b18_
    dword offset Func66b18_
    dword offset Func66b18_
    dword offset Func66b18_
    dword offset Func66b18_
    dword offset Func66b18_
    dword offset Func66b18_
    dword offset Func66b18_
    dword offset Func66b18_
    dword offset Func66b18_
    dword offset Func66b18_
Func66b18_ proc near
    lea ecx, [ebx-085h]
    add ecx, dword ptr [Dc9bf0]
    mov ebx, dword ptr [Dc9bec]
    mov esi, dword ptr [ebp+062h]
    mov ebx, dword ptr [edi+ebx*1+02h]
    call dword ptr [ecx*4+blend_ops]
    jmp L66ba6
L66b3a::
    mov esi, dword ptr [Dc9c2c]
    jmp L66ba6
L66b42::
    mov ebx, dword ptr [Dc9bec]
    mov esi, dword ptr [ebp+062h]
    mov ecx, dword ptr [Dc9bf0]
    mov ebx, dword ptr [edi+ebx*1+02h]
    call dword ptr [ecx*4+blend_ops]
    jmp L66ba6
L66b5e::
    mov esi, dword ptr [ebp+062h]
    add edi, dword ptr [Dc9bec]
    mov ebx, dword ptr [edi+02h]
    sub edi, dword ptr [Dc9bec]
    jmp L66b8a
L66b72::
    mov ebx, dword ptr [Dc9bec]
    mov esi, dword ptr [edi+ebx*1+02h]
    jmp L66ba6
L66b7e::
    mov ebx, dword ptr [Dc9cc4]
    mov esi, dword ptr [ebp+062h]
    xor ebx, dword ptr [ebp+06ch]
L66b8a::
    mov ecx, ebx
    and ecx, dword ptr [Dc9cc8]
    and ecx, esi
    and ebx, dword ptr [Dc9cc0]
    and esi, dword ptr [Dc9cc0]
    add esi, ebx
    rcr esi, 1
    add esi, ecx
L66ba6::
    mov word ptr [edi+02h], si
L66baa::
    bswap edx
    mov bl, dh
    and bl, 0c0h
    cmp bl, 080h
    jne L66cf8
    xor ebx, ebx
    add bl, dh
    jmp dword ptr [ebx*4+D66bc5-80h*4]
Func66b18_ endp
D66bc5 dword offset L66cc2
    dword offset L66ca1
    dword offset L66cb5
    dword offset L66c84
    dword offset L66c7c
    dword offset Func66c59_
    dword offset Func66c59_
    dword offset Func66c59_
    dword offset Func66c59_
    dword offset Func66c59_
    dword offset Func66c59_
    dword offset Func66c59_
    dword offset Func66c59_
    dword offset Func66c59_
    dword offset Func66c59_
    dword offset Func66c59_
    dword offset Func66c59_
    dword offset Func66c59_
    dword offset Func66c59_
    dword offset Func66c59_
    dword offset Func66c59_
    dword offset Func66c59_
    dword offset Func66c59_
    dword offset Func66c59_
    dword offset Func66c59_
    dword offset Func66c59_
    dword offset Func66c59_
    dword offset Func66c59_
    dword offset Func66c59_
    dword offset Func66c59_
    dword offset Func66c59_
    dword offset Func66c59_
    dword offset Func66c59_
    dword offset Func66c59_
    dword offset Func66c59_
    dword offset Func66c59_
    dword offset Func66c59_
Func66c59_ proc near
    lea ecx, [ebx-085h]
    add ecx, dword ptr [Dc9bf0]
    mov ebx, edi
    mov esi, dword ptr [ebp+064h]
    add ebx, dword ptr [Dc9bec]
    mov ebx, dword ptr [eax+ebx*1]
    call dword ptr [ecx*4+blend_ops]
    jmp L66cf4
L66c7c::
    mov esi, dword ptr [Dc9c2c]
    jmp L66cf4
L66c84::
    mov ebx, edi
    mov esi, dword ptr [ebp+064h]
    add ebx, dword ptr [Dc9bec]
    mov ecx, dword ptr [Dc9bf0]
    mov ebx, dword ptr [eax+ebx*1]
    call dword ptr [ecx*4+blend_ops]
    jmp L66cf4
L66ca1::
    mov esi, dword ptr [ebp+064h]
    add edi, dword ptr [Dc9bec]
    mov ebx, dword ptr [eax+edi*1]
    sub edi, dword ptr [Dc9bec]
    jmp L66cd8
L66cb5::
    mov ebx, edi
    add ebx, dword ptr [Dc9bec]
    mov esi, dword ptr [eax+ebx*1]
    jmp L66cf4
L66cc2::
    mov ebx, dword ptr [Dc9cc4]
    mov ecx, dword ptr [Dc9c28]
    xor ebx, dword ptr [ecx+ebp*1+082h]
    mov esi, dword ptr [ebp+064h]
L66cd8::
    mov ecx, ebx
    and ecx, dword ptr [Dc9cc8]
    and ecx, esi
    and ebx, dword ptr [Dc9cc0]
    and esi, dword ptr [Dc9cc0]
    add esi, ebx
    rcr esi, 1
    add esi, ecx
L66cf4::
    mov word ptr [eax+edi*1], si
L66cf8::
    mov bl, dl
    and bl, 0c0h
    cmp bl, 080h
    jne L66e49
    xor ebx, ebx
    add bl, dl
    jmp dword ptr [ebx*4+D66bc5-2dh*4]
Func66c59_ endp
    dword offset L66e12
    dword offset L66def
    dword offset L66e04
    dword offset L66dd1
    dword offset L66dc9
    dword offset Func66da5_
    dword offset Func66da5_
    dword offset Func66da5_
    dword offset Func66da5_
    dword offset Func66da5_
    dword offset Func66da5_
    dword offset Func66da5_
    dword offset Func66da5_
    dword offset Func66da5_
    dword offset Func66da5_
    dword offset Func66da5_
    dword offset Func66da5_
    dword offset Func66da5_
    dword offset Func66da5_
    dword offset Func66da5_
    dword offset Func66da5_
    dword offset Func66da5_
    dword offset Func66da5_
    dword offset Func66da5_
    dword offset Func66da5_
    dword offset Func66da5_
    dword offset Func66da5_
    dword offset Func66da5_
    dword offset Func66da5_
    dword offset Func66da5_
    dword offset Func66da5_
    dword offset Func66da5_
    dword offset Func66da5_
    dword offset Func66da5_
    dword offset Func66da5_
    dword offset Func66da5_
    dword offset Func66da5_
Func66da5_ proc near
    lea ecx, [ebx-085h]
    add ecx, dword ptr [Dc9bf0]
    mov ebx, edi
    mov esi, dword ptr [ebp+066h]
    add ebx, dword ptr [Dc9bec]
    mov ebx, dword ptr [eax+ebx*1+02h]
    call dword ptr [ecx*4+blend_ops]
    jmp L66e44
L66dc9::
    mov esi, dword ptr [Dc9c2c]
    jmp L66e44
L66dd1::
    mov ebx, edi
    mov esi, dword ptr [ebp+066h]
    add ebx, dword ptr [Dc9bec]
    mov ecx, dword ptr [Dc9bf0]
    mov ebx, dword ptr [eax+ebx*1+02h]
    call dword ptr [ecx*4+blend_ops]
    jmp L66e44
L66def::
    mov esi, dword ptr [ebp+066h]
    add edi, dword ptr [Dc9bec]
    mov ebx, dword ptr [eax+edi*1+02h]
    sub edi, dword ptr [Dc9bec]
    jmp L66e28
L66e04::
    mov ebx, edi
    add ebx, dword ptr [Dc9bec]
    mov esi, dword ptr [eax+ebx*1+02h]
    jmp L66e44
L66e12::
    mov ebx, dword ptr [Dc9cc4]
    mov ecx, dword ptr [Dc9c28]
    xor ebx, dword ptr [ecx+ebp*1+088h]
    mov esi, dword ptr [ebp+066h]
L66e28::
    mov ecx, ebx
    and ecx, dword ptr [Dc9cc8]
    and ecx, esi
    and ebx, dword ptr [Dc9cc0]
    and esi, dword ptr [Dc9cc0]
    add esi, ebx
    rcr esi, 1
    add esi, ecx
L66e44::
    mov word ptr [eax+edi*1+02h], si
L66e49::
    pop ecx
    xor edx, edx
    pop ebx
L66e4d::
    or edx, dword ptr [ebx+034h]
    je L67387
    mov ebp, dword ptr [ecx+03ch]
    push ebx
    add ebp, dword ptr [Dc9be8]
    push ecx
    mov bl, dl
    and bl, 0c0h
    cmp bl, 080h
    jne L66fa0
    xor ebx, ebx
    add bl, dl
    jmp dword ptr [ebx*4+D66e7a-80h*4]
Func66da5_ endp
D66e7a dword offset L66f74
    dword offset L66f54
    dword offset L66f68
    dword offset L66f38
    dword offset L66f30
    dword offset Func66f0e_
    dword offset Func66f0e_
    dword offset Func66f0e_
    dword offset Func66f0e_
    dword offset Func66f0e_
    dword offset Func66f0e_
    dword offset Func66f0e_
    dword offset Func66f0e_
    dword offset Func66f0e_
    dword offset Func66f0e_
    dword offset Func66f0e_
    dword offset Func66f0e_
    dword offset Func66f0e_
    dword offset Func66f0e_
    dword offset Func66f0e_
    dword offset Func66f0e_
    dword offset Func66f0e_
    dword offset Func66f0e_
    dword offset Func66f0e_
    dword offset Func66f0e_
    dword offset Func66f0e_
    dword offset Func66f0e_
    dword offset Func66f0e_
    dword offset Func66f0e_
    dword offset Func66f0e_
    dword offset Func66f0e_
    dword offset Func66f0e_
D66efa dword offset Func66f0e_
    dword offset Func66f0e_
    dword offset Func66f0e_
    dword offset Func66f0e_
    dword offset Func66f0e_
Func66f0e_ proc near
    lea ecx, [ebx-085h]
    add ecx, dword ptr [Dc9bf0]
    mov ebx, dword ptr [Dc9bec]
    mov esi, dword ptr [ebp+068h]
    mov ebx, dword ptr [edi+ebx*1+04h]
    call dword ptr [ecx*4+blend_ops]
    jmp L66f9c
L66f30::
    mov esi, dword ptr [Dc9c2c]
    jmp L66f9c
L66f38::
    mov ebx, dword ptr [Dc9bec]
    mov esi, dword ptr [ebp+068h]
    mov ecx, dword ptr [Dc9bf0]
    mov ebx, dword ptr [edi+ebx*1+04h]
    call dword ptr [ecx*4+blend_ops]
    jmp L66f9c
L66f54::
    mov esi, dword ptr [ebp+068h]
    add edi, dword ptr [Dc9bec]
    mov ebx, dword ptr [edi+04h]
    sub edi, dword ptr [Dc9bec]
    jmp L66f80
L66f68::
    mov ebx, dword ptr [Dc9bec]
    mov esi, dword ptr [edi+ebx*1+04h]
    jmp L66f9c
L66f74::
    mov ebx, dword ptr [Dc9cc4]
    mov esi, dword ptr [ebp+068h]
    xor ebx, dword ptr [ebp+06eh]
L66f80::
    mov ecx, ebx
    and ecx, dword ptr [Dc9cc8]
    and ecx, esi
    and ebx, dword ptr [Dc9cc0]
    and esi, dword ptr [Dc9cc0]
    add esi, ebx
    rcr esi, 1
    add esi, ecx
L66f9c::
    mov word ptr [edi+04h], si
L66fa0::
    mov bl, dh
    and bl, 0c0h
    cmp bl, 080h
    jne L670df
    xor ebx, ebx
    add bl, dh
    jmp dword ptr [ebx*4+D66fb9-80h*4]
Func66f0e_ endp
D66fb9 dword offset L670b3
    dword offset L67093
    dword offset L670a7
    dword offset L67077
    dword offset L6706f
    dword offset Func6704d_
    dword offset Func6704d_
    dword offset Func6704d_
    dword offset Func6704d_
    dword offset Func6704d_
    dword offset Func6704d_
    dword offset Func6704d_
    dword offset Func6704d_
    dword offset Func6704d_
    dword offset Func6704d_
    dword offset Func6704d_
    dword offset Func6704d_
    dword offset Func6704d_
    dword offset Func6704d_
    dword offset Func6704d_
    dword offset Func6704d_
    dword offset Func6704d_
    dword offset Func6704d_
    dword offset Func6704d_
    dword offset Func6704d_
    dword offset Func6704d_
    dword offset Func6704d_
    dword offset Func6704d_
    dword offset Func6704d_
    dword offset Func6704d_
    dword offset Func6704d_
    dword offset Func6704d_
    dword offset Func6704d_
    dword offset Func6704d_
    dword offset Func6704d_
    dword offset Func6704d_
    dword offset Func6704d_
Func6704d_ proc near
    lea ecx, [ebx-085h]
    add ecx, dword ptr [Dc9bf0]
    mov ebx, dword ptr [Dc9bec]
    mov esi, dword ptr [ebp+06ah]
    mov ebx, dword ptr [edi+ebx*1+06h]
    call dword ptr [ecx*4+blend_ops]
    jmp L670db
L6706f::
    mov esi, dword ptr [Dc9c2c]
    jmp L670db
L67077::
    mov ebx, dword ptr [Dc9bec]
    mov esi, dword ptr [ebp+06ah]
    mov ecx, dword ptr [Dc9bf0]
    mov ebx, dword ptr [edi+ebx*1+06h]
    call dword ptr [ecx*4+blend_ops]
    jmp L670db
L67093::
    mov esi, dword ptr [ebp+06ah]
    add edi, dword ptr [Dc9bec]
    mov ebx, dword ptr [edi+06h]
    sub edi, dword ptr [Dc9bec]
    jmp L670bf
L670a7::
    mov ebx, dword ptr [Dc9bec]
    mov esi, dword ptr [edi+ebx*1+06h]
    jmp L670db
L670b3::
    mov ebx, dword ptr [Dc9cc4]
    mov esi, dword ptr [ebp+06ah]
    xor ebx, dword ptr [ebp+074h]
L670bf::
    mov ecx, ebx
    and ecx, dword ptr [Dc9cc8]
    and ecx, esi
    and ebx, dword ptr [Dc9cc0]
    and esi, dword ptr [Dc9cc0]
    add esi, ebx
    rcr esi, 1
    add esi, ecx
L670db::
    mov word ptr [edi+06h], si
L670df::
    bswap edx
    mov bl, dh
    and bl, 0c0h
    cmp bl, 080h
    jne L67232
    xor ebx, ebx
    add bl, dh
    jmp dword ptr [ebx*4+D66efa]
Func6704d_ endp
    dword offset L671fb
    dword offset L671d8
    dword offset L671ed
    dword offset L671ba
    dword offset L671b2
    dword offset Func6718e_
    dword offset Func6718e_
    dword offset Func6718e_
    dword offset Func6718e_
    dword offset Func6718e_
    dword offset Func6718e_
    dword offset Func6718e_
    dword offset Func6718e_
    dword offset Func6718e_
    dword offset Func6718e_
    dword offset Func6718e_
    dword offset Func6718e_
    dword offset Func6718e_
    dword offset Func6718e_
    dword offset Func6718e_
    dword offset Func6718e_
    dword offset Func6718e_
    dword offset Func6718e_
    dword offset Func6718e_
    dword offset Func6718e_
    dword offset Func6718e_
    dword offset Func6718e_
    dword offset Func6718e_
    dword offset Func6718e_
    dword offset Func6718e_
    dword offset Func6718e_
    dword offset Func6718e_
    dword offset Func6718e_
    dword offset Func6718e_
    dword offset Func6718e_
    dword offset Func6718e_
    dword offset Func6718e_
Func6718e_ proc near
    lea ecx, [ebx-085h]
    add ecx, dword ptr [Dc9bf0]
    mov ebx, edi
    mov esi, dword ptr [ebp+06ch]
    add ebx, dword ptr [Dc9bec]
    mov ebx, dword ptr [eax+ebx*1+04h]
    call dword ptr [ecx*4+blend_ops]
    jmp L6722d
L671b2::
    mov esi, dword ptr [Dc9c2c]
    jmp L6722d
L671ba::
    mov ebx, edi
    mov esi, dword ptr [ebp+06ch]
    add ebx, dword ptr [Dc9bec]
    mov ecx, dword ptr [Dc9bf0]
    mov ebx, dword ptr [eax+ebx*1+04h]
    call dword ptr [ecx*4+blend_ops]
    jmp L6722d
L671d8::
    mov esi, dword ptr [ebp+06ch]
    add edi, dword ptr [Dc9bec]
    mov ebx, dword ptr [eax+edi*1+04h]
    sub edi, dword ptr [Dc9bec]
    jmp L67211
L671ed::
    mov ebx, edi
    add ebx, dword ptr [Dc9bec]
    mov esi, dword ptr [eax+ebx*1+04h]
    jmp L6722d
L671fb::
    mov ebx, dword ptr [Dc9cc4]
    mov ecx, dword ptr [Dc9c28]
    xor ebx, dword ptr [ecx+ebp*1+08ah]
    mov esi, dword ptr [ebp+06ch]
L67211::
    mov ecx, ebx
    and ecx, dword ptr [Dc9cc8]
    and ecx, esi
    and ebx, dword ptr [Dc9cc0]
    and esi, dword ptr [Dc9cc0]
    add esi, ebx
    rcr esi, 1
    add esi, ecx
L6722d::
    mov word ptr [eax+edi*1+04h], si
L67232::
    mov bl, dl
    and bl, 0c0h
    cmp bl, 080h
    jne L67383
    xor ebx, ebx
    add bl, dl
    jmp dword ptr [ebx*4+D6724b-80h*4]
Func6718e_ endp
D6724b dword offset L6734c
    dword offset L67329
    dword offset L6733e
    dword offset L6730b
    dword offset L67303
    dword offset Func672df_
    dword offset Func672df_
    dword offset Func672df_
    dword offset Func672df_
    dword offset Func672df_
    dword offset Func672df_
    dword offset Func672df_
    dword offset Func672df_
    dword offset Func672df_
    dword offset Func672df_
    dword offset Func672df_
    dword offset Func672df_
    dword offset Func672df_
    dword offset Func672df_
    dword offset Func672df_
    dword offset Func672df_
    dword offset Func672df_
    dword offset Func672df_
    dword offset Func672df_
    dword offset Func672df_
    dword offset Func672df_
    dword offset Func672df_
    dword offset Func672df_
    dword offset Func672df_
    dword offset Func672df_
    dword offset Func672df_
    dword offset Func672df_
    dword offset Func672df_
    dword offset Func672df_
    dword offset Func672df_
    dword offset Func672df_
    dword offset Func672df_
Func672df_ proc near
    lea ecx, [ebx-085h]
    add ecx, dword ptr [Dc9bf0]
    mov ebx, edi
    mov esi, dword ptr [ebp+06eh]
    add ebx, dword ptr [Dc9bec]
    mov ebx, dword ptr [eax+ebx*1+06h]
    call dword ptr [ecx*4+blend_ops]
    jmp L6737e
L67303::
    mov esi, dword ptr [Dc9c2c]
    jmp L6737e
L6730b::
    mov ebx, edi
    mov esi, dword ptr [ebp+06eh]
    add ebx, dword ptr [Dc9bec]
    mov ecx, dword ptr [Dc9bf0]
    mov ebx, dword ptr [eax+ebx*1+06h]
    call dword ptr [ecx*4+blend_ops]
    jmp L6737e
L67329::
    mov esi, dword ptr [ebp+06eh]
    add edi, dword ptr [Dc9bec]
    mov ebx, dword ptr [eax+edi*1+06h]
    sub edi, dword ptr [Dc9bec]
    jmp L67362
L6733e::
    mov ebx, edi
    add ebx, dword ptr [Dc9bec]
    mov esi, dword ptr [eax+ebx*1+06h]
    jmp L6737e
L6734c::
    mov ebx, dword ptr [Dc9cc4]
    mov ecx, dword ptr [Dc9c28]
    xor ebx, dword ptr [ecx+ebp*1+090h]
    mov esi, dword ptr [ebp+06eh]
L67362::
    mov ecx, ebx
    and ecx, dword ptr [Dc9cc8]
    and ecx, esi
    and ebx, dword ptr [Dc9cc0]
    and esi, dword ptr [Dc9cc0]
    add esi, ebx
    rcr esi, 1
    add esi, ecx
L6737e::
    mov word ptr [eax+edi*1+06h], si
L67383::
    pop ecx
    xor edx, edx
    pop ebx
L67387::
    or edx, dword ptr [ebx+038h]
    je L678c1
    mov ebp, dword ptr [ecx+03ch]
    push ebx
    add ebp, dword ptr [Dc9be8]
    push ecx
    mov bl, dl
    and bl, 0c0h
    cmp bl, 080h
    jne L674da
    xor ebx, ebx
    add bl, dl
    jmp dword ptr [ebx*4+D673b4-80h*4]
Func672df_ endp
D673b4 dword offset L674ae
    dword offset L6748e
    dword offset L674a2
    dword offset L67472
    dword offset L6746a
    dword offset Func67448_
    dword offset Func67448_
    dword offset Func67448_
    dword offset Func67448_
    dword offset Func67448_
    dword offset Func67448_
    dword offset Func67448_
    dword offset Func67448_
    dword offset Func67448_
    dword offset Func67448_
    dword offset Func67448_
    dword offset Func67448_
    dword offset Func67448_
    dword offset Func67448_
    dword offset Func67448_
    dword offset Func67448_
    dword offset Func67448_
    dword offset Func67448_
    dword offset Func67448_
    dword offset Func67448_
    dword offset Func67448_
    dword offset Func67448_
    dword offset Func67448_
    dword offset Func67448_
    dword offset Func67448_
    dword offset Func67448_
    dword offset Func67448_
D67434 dword offset Func67448_
    dword offset Func67448_
    dword offset Func67448_
    dword offset Func67448_
    dword offset Func67448_
Func67448_ proc near
    lea ecx, [ebx-085h]
    add ecx, dword ptr [Dc9bf0]
    mov ebx, dword ptr [Dc9bec]
    mov esi, dword ptr [ebp+070h]
    mov ebx, dword ptr [edi+ebx*1+08h]
    call dword ptr [ecx*4+blend_ops]
    jmp L674d6
L6746a::
    mov esi, dword ptr [Dc9c2c]
    jmp L674d6
L67472::
    mov ebx, dword ptr [Dc9bec]
    mov esi, dword ptr [ebp+070h]
    mov ecx, dword ptr [Dc9bf0]
    mov ebx, dword ptr [edi+ebx*1+08h]
    call dword ptr [ecx*4+blend_ops]
    jmp L674d6
L6748e::
    mov esi, dword ptr [ebp+070h]
    add edi, dword ptr [Dc9bec]
    mov ebx, dword ptr [edi+08h]
    sub edi, dword ptr [Dc9bec]
    jmp L674ba
L674a2::
    mov ebx, dword ptr [Dc9bec]
    mov esi, dword ptr [edi+ebx*1+08h]
    jmp L674d6
L674ae::
    mov ebx, dword ptr [Dc9cc4]
    mov esi, dword ptr [ebp+070h]
    xor ebx, dword ptr [ebp+076h]
L674ba::
    mov ecx, ebx
    and ecx, dword ptr [Dc9cc8]
    and ecx, esi
    and ebx, dword ptr [Dc9cc0]
    and esi, dword ptr [Dc9cc0]
    add esi, ebx
    rcr esi, 1
    add esi, ecx
L674d6::
    mov word ptr [edi+08h], si
L674da::
    mov bl, dh
    and bl, 0c0h
    cmp bl, 080h
    jne L67619
    xor ebx, ebx
    add bl, dh
    jmp dword ptr [ebx*4+D674f3-80h*4]
Func67448_ endp
D674f3 dword offset L675ed
    dword offset L675cd
    dword offset L675e1
    dword offset L675b1
    dword offset L675a9
    dword offset Func67587_
    dword offset Func67587_
    dword offset Func67587_
    dword offset Func67587_
    dword offset Func67587_
    dword offset Func67587_
    dword offset Func67587_
    dword offset Func67587_
    dword offset Func67587_
    dword offset Func67587_
    dword offset Func67587_
    dword offset Func67587_
    dword offset Func67587_
    dword offset Func67587_
    dword offset Func67587_
    dword offset Func67587_
    dword offset Func67587_
    dword offset Func67587_
    dword offset Func67587_
    dword offset Func67587_
    dword offset Func67587_
    dword offset Func67587_
    dword offset Func67587_
    dword offset Func67587_
    dword offset Func67587_
    dword offset Func67587_
    dword offset Func67587_
    dword offset Func67587_
    dword offset Func67587_
    dword offset Func67587_
    dword offset Func67587_
    dword offset Func67587_
Func67587_ proc near
    lea ecx, [ebx-085h]
    add ecx, dword ptr [Dc9bf0]
    mov ebx, dword ptr [Dc9bec]
    mov esi, dword ptr [ebp+072h]
    mov ebx, dword ptr [edi+ebx*1+0ah]
    call dword ptr [ecx*4+blend_ops]
    jmp L67615
L675a9::
    mov esi, dword ptr [Dc9c2c]
    jmp L67615
L675b1::
    mov ebx, dword ptr [Dc9bec]
    mov esi, dword ptr [ebp+072h]
    mov ecx, dword ptr [Dc9bf0]
    mov ebx, dword ptr [edi+ebx*1+0ah]
    call dword ptr [ecx*4+blend_ops]
    jmp L67615
L675cd::
    mov esi, dword ptr [ebp+072h]
    add edi, dword ptr [Dc9bec]
    mov ebx, dword ptr [edi+0ah]
    sub edi, dword ptr [Dc9bec]
    jmp L675f9
L675e1::
    mov ebx, dword ptr [Dc9bec]
    mov esi, dword ptr [edi+ebx*1+0ah]
    jmp L67615
L675ed::
    mov ebx, dword ptr [Dc9cc4]
    mov esi, dword ptr [ebp+072h]
    xor ebx, dword ptr [ebp+07ch]
L675f9::
    mov ecx, ebx
    and ecx, dword ptr [Dc9cc8]
    and ecx, esi
    and ebx, dword ptr [Dc9cc0]
    and esi, dword ptr [Dc9cc0]
    add esi, ebx
    rcr esi, 1
    add esi, ecx
L67615::
    mov word ptr [edi+0ah], si
L67619::
    bswap edx
    mov bl, dh
    and bl, 0c0h
    cmp bl, 080h
    jne L6776c
    xor ebx, ebx
    add bl, dh
    jmp dword ptr [ebx*4+D67434]
Func67587_ endp
    dword offset L67735
    dword offset L67712
    dword offset L67727
    dword offset L676f4
    dword offset L676ec
    dword offset Func676c8_
    dword offset Func676c8_
    dword offset Func676c8_
    dword offset Func676c8_
    dword offset Func676c8_
    dword offset Func676c8_
    dword offset Func676c8_
    dword offset Func676c8_
    dword offset Func676c8_
    dword offset Func676c8_
    dword offset Func676c8_
    dword offset Func676c8_
    dword offset Func676c8_
    dword offset Func676c8_
    dword offset Func676c8_
    dword offset Func676c8_
    dword offset Func676c8_
    dword offset Func676c8_
    dword offset Func676c8_
    dword offset Func676c8_
    dword offset Func676c8_
    dword offset Func676c8_
    dword offset Func676c8_
    dword offset Func676c8_
    dword offset Func676c8_
    dword offset Func676c8_
    dword offset Func676c8_
    dword offset Func676c8_
    dword offset Func676c8_
    dword offset Func676c8_
    dword offset Func676c8_
    dword offset Func676c8_
Func676c8_ proc near
    lea ecx, [ebx-085h]
    add ecx, dword ptr [Dc9bf0]
    mov ebx, edi
    mov esi, dword ptr [ebp+074h]
    add ebx, dword ptr [Dc9bec]
    mov ebx, dword ptr [eax+ebx*1+08h]
    call dword ptr [ecx*4+blend_ops]
    jmp L67767
L676ec::
    mov esi, dword ptr [Dc9c2c]
    jmp L67767
L676f4::
    mov ebx, edi
    mov esi, dword ptr [ebp+074h]
    add ebx, dword ptr [Dc9bec]
    mov ecx, dword ptr [Dc9bf0]
    mov ebx, dword ptr [eax+ebx*1+08h]
    call dword ptr [ecx*4+blend_ops]
    jmp L67767
L67712::
    mov esi, dword ptr [ebp+074h]
    add edi, dword ptr [Dc9bec]
    mov ebx, dword ptr [eax+edi*1+08h]
    sub edi, dword ptr [Dc9bec]
    jmp L6774b
L67727::
    mov ebx, edi
    add ebx, dword ptr [Dc9bec]
    mov esi, dword ptr [eax+ebx*1+08h]
    jmp L67767
L67735::
    mov ebx, dword ptr [Dc9cc4]
    mov ecx, dword ptr [Dc9c28]
    xor ebx, dword ptr [ecx+ebp*1+092h]
    mov esi, dword ptr [ebp+074h]
L6774b::
    mov ecx, ebx
    and ecx, dword ptr [Dc9cc8]
    and ecx, esi
    and ebx, dword ptr [Dc9cc0]
    and esi, dword ptr [Dc9cc0]
    add esi, ebx
    rcr esi, 1
    add esi, ecx
L67767::
    mov word ptr [eax+edi*1+08h], si
L6776c::
    mov bl, dl
    and bl, 0c0h
    cmp bl, 080h
    jne L678bd
    xor ebx, ebx
    add bl, dl
    jmp dword ptr [ebx*4+D67785-80h*4]
Func676c8_ endp
D67785 dword offset L67886
    dword offset L67863
    dword offset L67878
    dword offset L67845
    dword offset L6783d
    dword offset Func67819_
    dword offset Func67819_
    dword offset Func67819_
    dword offset Func67819_
    dword offset Func67819_
    dword offset Func67819_
    dword offset Func67819_
    dword offset Func67819_
    dword offset Func67819_
    dword offset Func67819_
    dword offset Func67819_
    dword offset Func67819_
    dword offset Func67819_
    dword offset Func67819_
    dword offset Func67819_
    dword offset Func67819_
    dword offset Func67819_
    dword offset Func67819_
    dword offset Func67819_
    dword offset Func67819_
    dword offset Func67819_
    dword offset Func67819_
    dword offset Func67819_
    dword offset Func67819_
    dword offset Func67819_
    dword offset Func67819_
    dword offset Func67819_
    dword offset Func67819_
    dword offset Func67819_
    dword offset Func67819_
    dword offset Func67819_
    dword offset Func67819_
Func67819_ proc near
    lea ecx, [ebx-085h]
    add ecx, dword ptr [Dc9bf0]
    mov ebx, edi
    mov esi, dword ptr [ebp+076h]
    add ebx, dword ptr [Dc9bec]
    mov ebx, dword ptr [eax+ebx*1+0ah]
    call dword ptr [ecx*4+blend_ops]
    jmp L678b8
L6783d::
    mov esi, dword ptr [Dc9c2c]
    jmp L678b8
L67845::
    mov ebx, edi
    mov esi, dword ptr [ebp+076h]
    add ebx, dword ptr [Dc9bec]
    mov ecx, dword ptr [Dc9bf0]
    mov ebx, dword ptr [eax+ebx*1+0ah]
    call dword ptr [ecx*4+blend_ops]
    jmp L678b8
L67863::
    mov esi, dword ptr [ebp+076h]
    add edi, dword ptr [Dc9bec]
    mov ebx, dword ptr [eax+edi*1+0ah]
    sub edi, dword ptr [Dc9bec]
    jmp L6789c
L67878::
    mov ebx, edi
    add ebx, dword ptr [Dc9bec]
    mov esi, dword ptr [eax+ebx*1+0ah]
    jmp L678b8
L67886::
    mov ebx, dword ptr [Dc9cc4]
    mov ecx, dword ptr [Dc9c28]
    xor ebx, dword ptr [ecx+ebp*1+098h]
    mov esi, dword ptr [ebp+076h]
L6789c::
    mov ecx, ebx
    and ecx, dword ptr [Dc9cc8]
    and ecx, esi
    and ebx, dword ptr [Dc9cc0]
    and esi, dword ptr [Dc9cc0]
    add esi, ebx
    rcr esi, 1
    add esi, ecx
L678b8::
    mov word ptr [eax+edi*1+0ah], si
L678bd::
    pop ecx
    xor edx, edx
    pop ebx
L678c1::
    or edx, dword ptr [ebx+03ch]
    je L67dfe
    mov ebp, dword ptr [ecx+03ch]
    push ebx
    add ebp, dword ptr [Dc9be8]
    push ecx
    mov bl, dl
    and bl, 0c0h
    cmp bl, 080h
    jne L67a14
    xor ebx, ebx
    add bl, dl
    jmp dword ptr [ebx*4+D678ee-80h*4]
Func67819_ endp
D678ee dword offset L679e8
    dword offset L679c8
    dword offset L679dc
    dword offset L679ac
    dword offset L679a4
    dword offset Func67982_
    dword offset Func67982_
    dword offset Func67982_
    dword offset Func67982_
    dword offset Func67982_
    dword offset Func67982_
    dword offset Func67982_
    dword offset Func67982_
    dword offset Func67982_
    dword offset Func67982_
    dword offset Func67982_
    dword offset Func67982_
    dword offset Func67982_
    dword offset Func67982_
    dword offset Func67982_
    dword offset Func67982_
    dword offset Func67982_
    dword offset Func67982_
    dword offset Func67982_
    dword offset Func67982_
    dword offset Func67982_
    dword offset Func67982_
    dword offset Func67982_
    dword offset Func67982_
    dword offset Func67982_
    dword offset Func67982_
    dword offset Func67982_
    dword offset Func67982_
    dword offset Func67982_
    dword offset Func67982_
    dword offset Func67982_
    dword offset Func67982_
Func67982_ proc near
    lea ecx, [ebx-085h]
    add ecx, dword ptr [Dc9bf0]
    mov ebx, dword ptr [Dc9bec]
    mov esi, dword ptr [ebp+078h]
    mov ebx, dword ptr [edi+ebx*1+0ch]
    call dword ptr [ecx*4+blend_ops]
    jmp L67a10
L679a4::
    mov esi, dword ptr [Dc9c2c]
    jmp L67a10
L679ac::
    mov ebx, dword ptr [Dc9bec]
    mov esi, dword ptr [ebp+078h]
    mov ecx, dword ptr [Dc9bf0]
    mov ebx, dword ptr [edi+ebx*1+0ch]
    call dword ptr [ecx*4+blend_ops]
    jmp L67a10
L679c8::
    mov esi, dword ptr [ebp+078h]
    add edi, dword ptr [Dc9bec]
    mov ebx, dword ptr [edi+0ch]
    sub edi, dword ptr [Dc9bec]
    jmp L679f4
L679dc::
    mov ebx, dword ptr [Dc9bec]
    mov esi, dword ptr [edi+ebx*1+0ch]
    jmp L67a10
L679e8::
    mov ebx, dword ptr [Dc9cc4]
    mov esi, dword ptr [ebp+078h]
    xor ebx, dword ptr [ebp+07eh]
L679f4::
    mov ecx, ebx
    and ecx, dword ptr [Dc9cc8]
    and ecx, esi
    and ebx, dword ptr [Dc9cc0]
    and esi, dword ptr [Dc9cc0]
    add esi, ebx
    rcr esi, 1
    add esi, ecx
L67a10::
    mov word ptr [edi+0ch], si
L67a14::
    mov bl, dh
    and bl, 0c0h
    cmp bl, 080h
    jne L67b56
    xor ebx, ebx
    add bl, dh
    jmp dword ptr [ebx*4+D67a2d-80h*4]
Func67982_ endp
D67a2d dword offset L67b27
    dword offset L67b07
    dword offset L67b1b
    dword offset L67aeb
    dword offset L67ae3
    dword offset Func67ac1_
    dword offset Func67ac1_
    dword offset Func67ac1_
    dword offset Func67ac1_
    dword offset Func67ac1_
    dword offset Func67ac1_
    dword offset Func67ac1_
    dword offset Func67ac1_
    dword offset Func67ac1_
    dword offset Func67ac1_
    dword offset Func67ac1_
    dword offset Func67ac1_
    dword offset Func67ac1_
    dword offset Func67ac1_
    dword offset Func67ac1_
    dword offset Func67ac1_
    dword offset Func67ac1_
    dword offset Func67ac1_
    dword offset Func67ac1_
    dword offset Func67ac1_
    dword offset Func67ac1_
    dword offset Func67ac1_
    dword offset Func67ac1_
    dword offset Func67ac1_
    dword offset Func67ac1_
    dword offset Func67ac1_
    dword offset Func67ac1_
    dword offset Func67ac1_
    dword offset Func67ac1_
    dword offset Func67ac1_
    dword offset Func67ac1_
    dword offset Func67ac1_
Func67ac1_ proc near
    lea ecx, [ebx-085h]
    add ecx, dword ptr [Dc9bf0]
    mov ebx, dword ptr [Dc9bec]
    mov esi, dword ptr [ebp+07ah]
    mov ebx, dword ptr [edi+ebx*1+0eh]
    call dword ptr [ecx*4+blend_ops]
    jmp L67b52
L67ae3::
    mov esi, dword ptr [Dc9c2c]
    jmp L67b52
L67aeb::
    mov ebx, dword ptr [Dc9bec]
    mov esi, dword ptr [ebp+07ah]
    mov ecx, dword ptr [Dc9bf0]
    mov ebx, dword ptr [edi+ebx*1+0eh]
    call dword ptr [ecx*4+blend_ops]
    jmp L67b52
L67b07::
    mov esi, dword ptr [ebp+07ah]
    add edi, dword ptr [Dc9bec]
    mov ebx, dword ptr [edi+0eh]
    sub edi, dword ptr [Dc9bec]
    jmp L67b36
L67b1b::
    mov ebx, dword ptr [Dc9bec]
    mov esi, dword ptr [edi+ebx*1+0eh]
    jmp L67b52
L67b27::
    mov ebx, dword ptr [Dc9cc4]
    mov esi, dword ptr [ebp+07ah]
    xor ebx, dword ptr [ebp+0e4h]
L67b36::
    mov ecx, ebx
    and ecx, dword ptr [Dc9cc8]
    and ecx, esi
    and ebx, dword ptr [Dc9cc0]
    and esi, dword ptr [Dc9cc0]
    add esi, ebx
    rcr esi, 1
    add esi, ecx
L67b52::
    mov word ptr [edi+0eh], si
L67b56::
    bswap edx
    mov bl, dh
    and bl, 0c0h
    cmp bl, 080h
    jne L67ca9
    xor ebx, ebx
    add bl, dh
    jmp dword ptr [ebx*4+D67a2d-2fh*4]
Func67ac1_ endp
    dword offset L67c72
    dword offset L67c4f
    dword offset L67c64
    dword offset L67c31
    dword offset L67c29
    dword offset Func67c05_
    dword offset Func67c05_
    dword offset Func67c05_
    dword offset Func67c05_
    dword offset Func67c05_
    dword offset Func67c05_
    dword offset Func67c05_
    dword offset Func67c05_
    dword offset Func67c05_
    dword offset Func67c05_
    dword offset Func67c05_
    dword offset Func67c05_
    dword offset Func67c05_
    dword offset Func67c05_
    dword offset Func67c05_
    dword offset Func67c05_
    dword offset Func67c05_
    dword offset Func67c05_
    dword offset Func67c05_
    dword offset Func67c05_
    dword offset Func67c05_
    dword offset Func67c05_
    dword offset Func67c05_
    dword offset Func67c05_
    dword offset Func67c05_
    dword offset Func67c05_
    dword offset Func67c05_
    dword offset Func67c05_
    dword offset Func67c05_
    dword offset Func67c05_
    dword offset Func67c05_
    dword offset Func67c05_
Func67c05_ proc near
    lea ecx, [ebx-085h]
    add ecx, dword ptr [Dc9bf0]
    mov ebx, edi
    mov esi, dword ptr [ebp+07ch]
    add ebx, dword ptr [Dc9bec]
    mov ebx, dword ptr [eax+ebx*1+0ch]
    call dword ptr [ecx*4+blend_ops]
    jmp L67ca4
L67c29::
    mov esi, dword ptr [Dc9c2c]
    jmp L67ca4
L67c31::
    mov ebx, edi
    mov esi, dword ptr [ebp+07ch]
    add ebx, dword ptr [Dc9bec]
    mov ecx, dword ptr [Dc9bf0]
    mov ebx, dword ptr [eax+ebx*1+0ch]
    call dword ptr [ecx*4+blend_ops]
    jmp L67ca4
L67c4f::
    mov esi, dword ptr [ebp+07ch]
    add edi, dword ptr [Dc9bec]
    mov ebx, dword ptr [eax+edi*1+0ch]
    sub edi, dword ptr [Dc9bec]
    jmp L67c88
L67c64::
    mov ebx, edi
    add ebx, dword ptr [Dc9bec]
    mov esi, dword ptr [eax+ebx*1+0ch]
    jmp L67ca4
L67c72::
    mov ebx, dword ptr [Dc9cc4]
    mov ecx, dword ptr [Dc9c28]
    xor ebx, dword ptr [ecx+ebp*1+09ah]
    mov esi, dword ptr [ebp+07ch]
L67c88::
    mov ecx, ebx
    and ecx, dword ptr [Dc9cc8]
    and ecx, esi
    and ebx, dword ptr [Dc9cc0]
    and esi, dword ptr [Dc9cc0]
    add esi, ebx
    rcr esi, 1
    add esi, ecx
L67ca4::
    mov word ptr [eax+edi*1+0ch], si
L67ca9::
    mov bl, dl
    and bl, 0c0h
    cmp bl, 080h
    jne L67dfa
    xor ebx, ebx
    add bl, dl
    jmp dword ptr [ebx*4+D67cc2-80h*4]
Func67c05_ endp
D67cc2 dword offset L67dc3
    dword offset L67da0
    dword offset L67db5
    dword offset L67d82
    dword offset L67d7a
    dword offset Func67d56_
    dword offset Func67d56_
    dword offset Func67d56_
    dword offset Func67d56_
    dword offset Func67d56_
    dword offset Func67d56_
    dword offset Func67d56_
    dword offset Func67d56_
    dword offset Func67d56_
    dword offset Func67d56_
    dword offset Func67d56_
    dword offset Func67d56_
    dword offset Func67d56_
    dword offset Func67d56_
    dword offset Func67d56_
    dword offset Func67d56_
    dword offset Func67d56_
    dword offset Func67d56_
    dword offset Func67d56_
    dword offset Func67d56_
    dword offset Func67d56_
    dword offset Func67d56_
    dword offset Func67d56_
    dword offset Func67d56_
    dword offset Func67d56_
    dword offset Func67d56_
    dword offset Func67d56_
    dword offset Func67d56_
    dword offset Func67d56_
    dword offset Func67d56_
    dword offset Func67d56_
    dword offset Func67d56_
Func67d56_ proc near
    lea ecx, [ebx-085h]
    add ecx, dword ptr [Dc9bf0]
    mov ebx, edi
    mov esi, dword ptr [ebp+07eh]
    add ebx, dword ptr [Dc9bec]
    mov ebx, dword ptr [eax+ebx*1+0eh]
    call dword ptr [ecx*4+blend_ops]
    jmp L67df5
L67d7a::
    mov esi, dword ptr [Dc9c2c]
    jmp L67df5
L67d82::
    mov ebx, edi
    mov esi, dword ptr [ebp+07eh]
    add ebx, dword ptr [Dc9bec]
    mov ecx, dword ptr [Dc9bf0]
    mov ebx, dword ptr [eax+ebx*1+0eh]
    call dword ptr [ecx*4+blend_ops]
    jmp L67df5
L67da0::
    mov esi, dword ptr [ebp+07eh]
    add edi, dword ptr [Dc9bec]
    mov ebx, dword ptr [eax+edi*1+0eh]
    sub edi, dword ptr [Dc9bec]
    jmp L67dd9
L67db5::
    mov ebx, edi
    add ebx, dword ptr [Dc9bec]
    mov esi, dword ptr [eax+ebx*1+0eh]
    jmp L67df5
L67dc3::
    mov ebx, dword ptr [Dc9cc4]
    mov ecx, dword ptr [Dc9c28]
    xor ebx, dword ptr [ecx+ebp*1+0100h]
    mov esi, dword ptr [ebp+07eh]
L67dd9::
    mov ecx, ebx
    and ecx, dword ptr [Dc9cc8]
    and ecx, esi
    and ebx, dword ptr [Dc9cc0]
    and esi, dword ptr [Dc9cc0]
    add esi, ebx
    rcr esi, 1
    add esi, ecx
L67df5::
    mov word ptr [eax+edi*1+0eh], si
L67dfa::
    pop ecx
    xor edx, edx
    pop ebx
L67dfe::
    jmp L67e05
L67e00::
    cmp edi, 0fffffffeh
    je L67e16
L67e05::
    add ecx, 014h
    xor edi, edi
    cmp ecx, dword ptr [Dc9a84]
    jne L62b05
L67e16::
    pop ebp
    pop edx
    pop ecx
    pop ebx
    pop eax
    pop edi
    pop esi
    leave
    ret
L67e1f::
    pop edx
    pop ecx
    pop ebx
    pop eax
    pop edi
    pop esi
    leave
    ret
Func67d56_ endp
draw_frame proc near
    push ebp
    mov ebp, esp
    add esp, 0ffffffe4h
    push esi
    push edi
    push eax
    push ebx
    push ecx
    push edx
    mov edi, dword ptr [ebp+02ch]
    mov eax, dword ptr [ebp+010h]
    mov edx, dword ptr [ebp+014h]
    and eax, 07h
    imul eax, dword ptr [ebp+030h]
    and edx, 07h
    add eax, edx
    add eax, eax
    mov dword ptr [edi+030h], eax
    shr dword ptr [ebp+010h], 03h
    shr dword ptr [ebp+014h], 03h
    mov dword ptr [edi+02ch], 00h
    mov eax, dword ptr [ebp+030h]
    mov edx, dword ptr [ebp+034h]
    shr eax, 03h
    shr edx, 03h
    mov dword ptr [edi+08h], eax
    mov dword ptr [edi+024h], edx
    mov dword ptr [ebp-04h], eax
    mov dword ptr [ebp-010h], edx
    shl eax, 04h
    mov edx, dword ptr [ebp+0ch]
    mov dword ptr [ebp-08h], eax
    sar edx, 03h
    mov ecx, dword ptr [ebp+08h]
    shl eax, 03h
    mov dword ptr [edi+04h], edx
    sar ecx, 03h
    mov dword ptr [ebp-0ch], eax
    mov dword ptr [ebp+0ch], edx
    mov dword ptr [edi], ecx
    mov edx, dword ptr [ebp+028h]
    mov dword ptr [ebp+08h], ecx
    mov dword ptr [edi+0ch], edx
    mov dword ptr [Dc9cd0], 00h
    mov edx, dword ptr [ebp+03ch]
    pusha
    mov cl, byte ptr [edx+03h]
    mov eax, 01h
    shl eax, cl
    dec eax
    mov cl, byte ptr [edx+02h]
    shl eax, cl
    mov ecx, eax
    shl ecx, 010h
    mov cx, ax
    mov dword ptr [Dc9cd8], ecx
    mov cl, byte ptr [edx+05h]
    mov eax, 01h
    shl eax, cl
    dec eax
    mov dword ptr [ebp-014h], eax
    mov cl, byte ptr [edx+04h]
    shl eax, cl
    mov ebx, eax
    shl ebx, 010h
    mov bx, ax
    mov dword ptr [red_mask], ebx
    mov eax, ebx
    and eax, 0ffffh
    mov dword ptr [Dc9c18], eax
    shl eax, 05h
    mov dword ptr [Dc9c24], eax
    mov cl, byte ptr [edx+07h]
    mov eax, 01h
    shl eax, cl
    dec eax
    mov dword ptr [ebp-01ch], eax
    mov cl, byte ptr [edx+06h]
    shl eax, cl
    mov esi, eax
    shl esi, 010h
    mov si, ax
    mov dword ptr [green_mask], esi
    mov eax, esi
    and eax, 0ffffh
    mov dword ptr [Dc9c10], eax
    shl eax, 05h
    mov dword ptr [Dc9c1c], eax
    mov cl, byte ptr [edx+09h]
    mov eax, 01h
    shl eax, cl
    dec eax
    mov dword ptr [ebp-018h], eax
    mov cl, byte ptr [edx+08h]
    shl eax, cl
    mov edi, eax
    shl edi, 010h
    mov di, ax
    mov dword ptr [blue_mask], edi
    mov eax, edi
    and eax, 0ffffh
    mov dword ptr [Dc9c14], eax
    shl eax, 05h
    mov dword ptr [Dc9c20], eax
    lea eax, [esi+ebx*1]
    mov dword ptr [Dc9c04], eax
    add eax, edi
    mov dword ptr [Dc9ccc], eax
    mov dword ptr [Dc9cc4], eax
    mov eax, dword ptr [ebp-014h]
    and al, 0feh
    mov cl, byte ptr [edx+04h]
    shl eax, cl
    mov ebx, dword ptr [ebp-01ch]
    and bl, 0feh
    mov cl, byte ptr [edx+06h]
    shl ebx, cl
    or eax, ebx
    mov ebx, dword ptr [ebp-018h]
    and bl, 0feh
    mov cl, byte ptr [edx+08h]
    shl ebx, cl
    or eax, ebx
    mov ebx, eax
    shl ebx, 010h
    mov bx, ax
    mov dword ptr [Dc9cc0], ebx
    xor ebx, dword ptr [Dc9ccc]
    mov dword ptr [Dc9cc8], ebx
    mov ebx, dword ptr [red_mask]
    lea eax, [edi+ebx*1]
    mov dword ptr [Dc9c08], eax
    lea eax, [edi+esi*1]
    mov dword ptr [Dc9c0c], eax
    popa
    pusha
    xor eax, eax
L67fd4::
    mov cl, byte ptr [edx+05h]
    mov ebx, 01h
    shl ebx, cl
    dec ebx
    mov cl, 08h
    sub cl, byte ptr [edx+04h]
    jle L68039
    mov cl, byte ptr [edx+04h]
    mov ch, cl
    add ch, byte ptr [edx+05h]
    sub ch, 08h
    ja L68008
    mov edi, eax
    shr edi, cl
    and edi, ebx
    imul edi, edi, 0132h
    mov dword ptr [eax*4+Dca0dc], edi
    jmp L6804e
L68008::
    mov cl, ch
    mov esi, 01h
    shl esi, cl
    dec esi
    mov edi, eax
    and edi, esi
    imul edi, edi, 0132h
    mov dword ptr [eax*4+Dc9cdc], edi
    mov cl, byte ptr [edx+04h]
    mov edi, eax
    shr edi, cl
    imul edi, edi, 0132h
    mov dword ptr [eax*4+Dca0dc], edi
    jmp L6804e
L68039::
    neg cl
    mov edi, eax
    shr edi, cl
    and edi, ebx
    imul edi, edi, 0132h
    mov dword ptr [eax*4+Dc9cdc], edi
L6804e::
    mov cl, byte ptr [edx+07h]
    mov ebx, 01h
    shl ebx, cl
    dec ebx
    mov cl, 08h
    sub cl, byte ptr [edx+06h]
    jle L680b3
    mov cl, byte ptr [edx+06h]
    mov ch, cl
    add ch, byte ptr [edx+07h]
    sub ch, 08h
    ja L68082
    mov edi, eax
    shr edi, cl
    and edi, ebx
    imul edi, edi, 0259h
    add dword ptr [eax*4+Dca0dc], edi
    jmp L680c8
L68082::
    mov cl, ch
    mov esi, 01h
    shl esi, cl
    dec esi
    mov edi, eax
    and edi, esi
    imul edi, edi, 0259h
    add dword ptr [eax*4+Dc9cdc], edi
    mov cl, byte ptr [edx+06h]
    mov edi, eax
    shr edi, cl
    imul edi, edi, 0259h
    add dword ptr [eax*4+Dca0dc], edi
    jmp L680c8
L680b3::
    neg cl
    mov edi, eax
    shr edi, cl
    and edi, ebx
    imul edi, edi, 0259h
    add dword ptr [eax*4+Dc9cdc], edi
L680c8::
    mov cl, byte ptr [edx+09h]
    mov ebx, 01h
    shl ebx, cl
    dec ebx
    mov cl, 08h
    sub cl, byte ptr [edx+08h]
    jle L68124
    mov cl, byte ptr [edx+08h]
    mov ch, cl
    add ch, byte ptr [edx+09h]
    sub ch, 08h
    ja L680f9
    mov edi, eax
    shr edi, cl
    and edi, ebx
    imul edi, edi, 075h
    add dword ptr [eax*4+Dca0dc], edi
    jmp L68136
L680f9::
    mov cl, ch
    mov esi, 01h
    shl esi, cl
    dec esi
    mov edi, eax
    and edi, esi
    imul edi, edi, 075h
    add dword ptr [eax*4+Dc9cdc], edi
    mov cl, byte ptr [edx+08h]
    mov edi, eax
    shr edi, cl
    imul edi, edi, 075h
    add dword ptr [eax*4+Dca0dc], edi
    jmp L68136
L68124::
    neg cl
    mov edi, eax
    shr edi, cl
    and edi, ebx
    imul edi, edi, 075h
    add dword ptr [eax*4+Dc9cdc], edi
L68136::
    shr dword ptr [eax*4+Dc9cdc], 09h
    shr dword ptr [eax*4+Dca0dc], 09h
    inc al
    jne L67fd4
    xor eax, eax
L68150::
    mov ebx, eax
    mov cl, 05h
    sub cl, byte ptr [edx+05h]
    jns L6815f
    neg cl
    shl ebx, cl
    jmp L68161
L6815f::
    shr ebx, cl
L68161::
    mov cl, byte ptr [edx+04h]
    shl ebx, cl
    mov esi, ebx
    mov ebx, eax
    mov cl, 05h
    sub cl, byte ptr [edx+07h]
    jns L68177
    neg cl
    shl ebx, cl
    jmp L68179
L68177::
    shr ebx, cl
L68179::
    mov cl, byte ptr [edx+06h]
    shl ebx, cl
    or esi, ebx
    mov ebx, eax
    mov cl, 05h
    sub cl, byte ptr [edx+09h]
    jns L6818f
    neg cl
    shl ebx, cl
    jmp L68191
L6818f::
    shr ebx, cl
L68191::
    mov cl, byte ptr [edx+08h]
    shl ebx, cl
    or esi, ebx
    mov dword ptr [eax*8+Dca4dc], esi
    mov dword ptr [eax*8+Dca4e0], esi
    inc al
    cmp al, 020h
    jb L68150
    popa
    mov al, byte ptr [edx+04h]
    mov byte ptr [Dc9afe], al
    mov al, byte ptr [edx+06h]
    mov byte ptr [Dc9b02], al
    mov al, byte ptr [edx+08h]
    mov byte ptr [Dc9b00], al
    mov al, byte ptr [edx+05h]
    mov byte ptr [Dc9afd], al
    mov al, byte ptr [edx+07h]
    mov byte ptr [Dc9b01], al
    mov al, byte ptr [edx+09h]
    mov byte ptr [Dc9aff], al
    pusha
    mov edi, offset Dc9c40
    mov ebp, dword ptr [blue_mask]
    and ebp, 0ffffh
    mov ecx, 01fh
    xor ebx, ebx
L681f6::
    mov eax, ebx
    add eax, 010h
    shr eax, 05h
    and eax, ebp
    mov dword ptr [edi+ecx*4], eax
    add ebx, ebp
    dec ecx
    jns L681f6
    mov ebp, dword ptr [red_mask]
    and ebp, 0ffffh
    mov ecx, 0ffffffe0h
    xor ebx, ebx
L6821b::
    mov eax, ebx
    add eax, 010h
    shr eax, 05h
    and eax, ebp
    or dword ptr [edi+ecx*4+080h], eax
    add ebx, ebp
    inc ecx
    jne L6821b
    mov ebp, dword ptr [green_mask]
    and ebp, 0ffffh
    mov ecx, 0fh
    xor esi, esi
    xor ebx, ebx
L68246::
    mov eax, ebx
    add eax, 08h
    shr eax, 04h
    and eax, ebp
    or dword ptr [edi+ecx*4+040h], eax
    or dword ptr [edi+esi*4], eax
    add ebx, ebp
    inc esi
    dec ecx
    jns L68246
    popa
    mov eax, dword ptr [ebp+040h]
    mov dword ptr [edi+014h], eax
    cmp eax, 0bh
    jge L6826e
    cmp eax, 01h
    jne L68280
L6826e::
    mov edx, dword ptr [Dc9cd0]
    xchg dword ptr [Dc9ccc], edx
    mov dword ptr [Dc9cd0], edx
L68280::
    add edi, 034h
    mov dword ptr [ebp+02ch], edi
    sar dword ptr [ebp+018h], 03h
    sar dword ptr [ebp+01ch], 03h
    shr dword ptr [ebp+020h], 03h
    shr dword ptr [ebp+024h], 03h
    mov edx, dword ptr [ebp+020h]
    or edx, edx
    jne L682a2
    mov edx, dword ptr [ebp-04h]
    jmp L682a5
L682a2::
    add edx, dword ptr [ebp+018h]
L682a5::
    mov dword ptr [ebp+020h], edx
    mov edx, dword ptr [ebp+024h]
    or edx, edx
    jne L682b4
    mov edx, dword ptr [ebp-010h]
    jmp L682b7
L682b4::
    add edx, dword ptr [ebp+01ch]
L682b7::
    mov dword ptr [ebp+024h], edx
    mov eax, dword ptr [ebp+010h]
    mov esi, dword ptr [ebp+014h]
    xor ecx, ecx
L682c2::
    xor edx, edx
L682c4::
    mov word ptr [edi], dx
    add word ptr [edi], ax
    mov word ptr [edi+02h], cx
    add word ptr [edi+02h], si
    add edi, 014h
    inc edx
    cmp edx, dword ptr [ebp+08h]
    jne L682c4
    inc ecx
    cmp ecx, dword ptr [ebp+0ch]
    jne L682c2
    mov edi, dword ptr [ebp+08h]
    mov edx, dword ptr [ebp+0ch]
    imul edi, edx
    dec edi
    lea edi, [edi+edi*4]
    shl edi, 02h
    add edi, dword ptr [ebp+02ch]
    mov edx, 0fffffffeh
L682f9::
    movsx eax, word ptr [edi]
    cmp eax, dword ptr [ebp-04h]
    jae L68374
    movsx esi, word ptr [edi+02h]
    cmp esi, dword ptr [ebp-010h]
    jae L68374
    test byte ptr [ebp+028h], 01h
    je L68326
    cmp eax, dword ptr [ebp+018h]
    jl L68374
    cmp eax, dword ptr [ebp+020h]
    jge L68374
    cmp esi, dword ptr [ebp+01ch]
    jl L68374
    cmp esi, dword ptr [ebp+024h]
    jge L68374
    jmp L6833a
L68326::
    cmp eax, dword ptr [ebp+018h]
    jl L6833a
    cmp eax, dword ptr [ebp+020h]
    jge L6833a
    cmp esi, dword ptr [ebp+01ch]
    jl L6833a
    cmp esi, dword ptr [ebp+024h]
    jl L68374
L6833a::
    mov dword ptr [edi+0ch], eax
    mov dword ptr [edi+010h], esi
    imul esi, dword ptr [ebp-0ch]
    shl eax, 04h
    add eax, esi
    mov dword ptr [edi], eax
    test byte ptr [ebp+028h], 04h
    je L68370
    add eax, dword ptr [ebp+038h]
    push edx
    mov edx, dword ptr [Dc9cd0]
    mov cl, 08h
L6835d::
    mov dword ptr [eax], edx
    mov dword ptr [eax+04h], edx
    mov dword ptr [eax+08h], edx
    mov dword ptr [eax+0ch], edx
    add eax, dword ptr [ebp-08h]
    dec cl
    jne L6835d
    pop edx
L68370::
    mov dl, 0ffh
    jmp L68376
L68374::
    mov dword ptr [edi], edx
L68376::
    sub edi, 014h
    cmp edi, dword ptr [ebp+02ch]
    jae L682f9
    pop edx
    pop ecx
    pop ebx
    pop eax
    pop edi
    pop esi
    leave
    ret
L6838a::
    test byte ptr [edx+01h], 040h
    je L683ff
    cmp byte ptr [edx+01h], 043h
    jb L683ad
    je L683ec
    cmp byte ptr [edx+01h], 07fh
    ja L683bd
    and ebx, dword ptr [Dc9cc0]
    shr ebx, 011h
    mov word ptr [edi+02h], bx
    jmp L683f6
L683ad::
    mov ebx, dword ptr [Dc9c30]
    mov bx, word ptr [ebx+02h]
    mov word ptr [edi+02h], bx
    jmp L683f6
L683bd::
    push ecx
    xor ecx, ecx
    mov cl, byte ptr [edi+03h]
    mov ebx, dword ptr [ecx*4+Dc9cdc]
    mov cl, byte ptr [edi+02h]
    add ebx, dword ptr [ecx*4+Dca0dc]
    mov ebx, dword ptr [ebx*4+Dca4dc]
    mov cl, byte ptr [edx+01h]
    call dword ptr [ecx*4+colour_ops-0b0h*4]
    mov word ptr [edi+02h], bx
    pop ecx
    jmp L683f6
L683ec::
    mov ebx, dword ptr [Dc9cc4]
    xor word ptr [edi+02h], bx
L683f6::
    test byte ptr [edx], 040h
    je L5ee01
L683ff::
    cmp byte ptr [edx], 043h
    jb L6841d
    je L6845c
    cmp byte ptr [edx], 07fh
    ja L6842d
    mov ebx, dword ptr [edi]
    and ebx, dword ptr [Dc9cc0]
    shr ebx, 1
    mov word ptr [edi], bx
    jmp L5ee01
L6841d::
    mov ebx, dword ptr [Dc9c30]
    mov ebx, dword ptr [ebx]
    mov word ptr [edi], bx
    jmp L5ee01
L6842d::
    push ecx
    xor ecx, ecx
    mov cl, byte ptr [edi+01h]
    mov ebx, dword ptr [ecx*4+Dc9cdc]
    mov cl, byte ptr [edi]
    add ebx, dword ptr [ecx*4+Dca0dc]
    mov ebx, dword ptr [ebx*4+Dca4dc]
    mov cl, byte ptr [edx]
    call dword ptr [ecx*4+colour_ops-0b0h*4]
    mov word ptr [edi], bx
    pop ecx
    jmp L5ee01
L6845c::
    mov ebx, dword ptr [Dc9cc4]
    xor word ptr [edi], bx
    jmp L5ee01
L6846a::
    test byte ptr [edx+03h], 040h
    je L684ec
    cmp byte ptr [edx+03h], 043h
    jb L6848e
    je L684d7
    cmp byte ptr [edx+03h], 07fh
    ja L684a5
    and ebx, dword ptr [Dc9cc0]
    shr ebx, 011h
    mov word ptr [eax+edi*1+02h], bx
    jmp L684e2
L6848e::
    mov ebx, dword ptr [Dc9c30]
    add ebx, dword ptr [Dc9c3c]
    mov bx, word ptr [ebx+02h]
    mov word ptr [eax+edi*1+02h], bx
    jmp L684e2
L684a5::
    push ecx
    xor ecx, ecx
    mov cl, byte ptr [eax+edi*1+03h]
    mov ebx, dword ptr [ecx*4+Dc9cdc]
    mov cl, byte ptr [eax+edi*1+02h]
    add ebx, dword ptr [ecx*4+Dca0dc]
    mov ebx, dword ptr [ebx*4+Dca4dc]
    mov cl, byte ptr [edx+03h]
    call dword ptr [ecx*4+colour_ops-0b0h*4]
    mov word ptr [eax+edi*1+02h], bx
    pop ecx
    jmp L684e2
L684d7::
    mov ebx, dword ptr [Dc9cc4]
    xor word ptr [eax+edi*1+02h], bx
L684e2::
    test byte ptr [edx+02h], 040h
    je L5ee13
L684ec::
    cmp byte ptr [edx+02h], 043h
    jb L6850e
    je L68558
    cmp byte ptr [edx+02h], 07fh
    ja L68525
    mov ebx, dword ptr [eax+edi*1]
    and ebx, dword ptr [Dc9cc0]
    shr ebx, 1
    mov word ptr [eax+edi*1], bx
    jmp L5ee13
L6850e::
    mov ebx, dword ptr [Dc9c30]
    add ebx, dword ptr [Dc9c3c]
    mov ebx, dword ptr [ebx]
    mov word ptr [eax+edi*1], bx
    jmp L5ee13
L68525::
    push ecx
    xor ecx, ecx
    mov cl, byte ptr [eax+edi*1+01h]
    mov ebx, dword ptr [ecx*4+Dc9cdc]
    mov cl, byte ptr [eax+edi*1]
    add ebx, dword ptr [ecx*4+Dca0dc]
    mov ebx, dword ptr [ebx*4+Dca4dc]
    mov cl, byte ptr [edx+02h]
    call dword ptr [ecx*4+colour_ops-0b0h*4]
    mov word ptr [eax+edi*1], bx
    pop ecx
    jmp L5ee13
L68558::
    mov ebx, dword ptr [Dc9cc4]
    xor word ptr [eax+edi*1], bx
    jmp L5ee13
L68567::
    test byte ptr [edx+05h], 040h
    je L685dd
    cmp byte ptr [edx+05h], 043h
    jb L6858a
    je L685c9
    cmp byte ptr [edx+05h], 07fh
    ja L6859a
    and ebx, dword ptr [Dc9cc0]
    shr ebx, 011h
    mov word ptr [edi+06h], bx
    jmp L685d3
L6858a::
    mov ebx, dword ptr [Dc9c30]
    mov bx, word ptr [ebx+06h]
    mov word ptr [edi+06h], bx
    jmp L685d3
L6859a::
    push ecx
    xor ecx, ecx
    mov cl, byte ptr [edi+07h]
    mov ebx, dword ptr [ecx*4+Dc9cdc]
    mov cl, byte ptr [edi+06h]
    add ebx, dword ptr [ecx*4+Dca0dc]
    mov ebx, dword ptr [ebx*4+Dca4dc]
    mov cl, byte ptr [edx+05h]
    call dword ptr [ecx*4+colour_ops-0b0h*4]
    mov word ptr [edi+06h], bx
    pop ecx
    jmp L685d3
L685c9::
    mov ebx, dword ptr [Dc9cc4]
    xor word ptr [edi+06h], bx
L685d3::
    test byte ptr [edx+04h], 040h
    je L5ee26
L685dd::
    cmp byte ptr [edx+04h], 043h
    jb L685ff
    je L68643
    cmp byte ptr [edx+04h], 07fh
    ja L68611
    mov ebx, dword ptr [edi+04h]
    and ebx, dword ptr [Dc9cc0]
    shr ebx, 1
    mov word ptr [edi+04h], bx
    jmp L5ee26
L685ff::
    mov ebx, dword ptr [Dc9c30]
    mov ebx, dword ptr [ebx+04h]
    mov word ptr [edi+04h], bx
    jmp L5ee26
L68611::
    push ecx
    xor ecx, ecx
    mov cl, byte ptr [edi+05h]
    mov ebx, dword ptr [ecx*4+Dc9cdc]
    mov cl, byte ptr [edi+04h]
    add ebx, dword ptr [ecx*4+Dca0dc]
    mov ebx, dword ptr [ebx*4+Dca4dc]
    mov cl, byte ptr [edx+04h]
    call dword ptr [ecx*4+colour_ops-0b0h*4]
    mov word ptr [edi+04h], bx
    pop ecx
    jmp L5ee26
L68643::
    mov ebx, dword ptr [Dc9cc4]
    xor word ptr [edi+04h], bx
    jmp L5ee26
L68652::
    test byte ptr [edx+07h], 040h
    je L686d4
    cmp byte ptr [edx+07h], 043h
    jb L68676
    je L686bf
    cmp byte ptr [edx+07h], 07fh
    ja L6868d
    and ebx, dword ptr [Dc9cc0]
    shr ebx, 011h
    mov word ptr [eax+edi*1+06h], bx
    jmp L686ca
L68676::
    mov ebx, dword ptr [Dc9c30]
    add ebx, dword ptr [Dc9c3c]
    mov bx, word ptr [ebx+06h]
    mov word ptr [eax+edi*1+06h], bx
    jmp L686ca
L6868d::
    push ecx
    xor ecx, ecx
    mov cl, byte ptr [eax+edi*1+07h]
    mov ebx, dword ptr [ecx*4+Dc9cdc]
    mov cl, byte ptr [eax+edi*1+06h]
    add ebx, dword ptr [ecx*4+Dca0dc]
    mov ebx, dword ptr [ebx*4+Dca4dc]
    mov cl, byte ptr [edx+07h]
    call dword ptr [ecx*4+colour_ops-0b0h*4]
    mov word ptr [eax+edi*1+06h], bx
    pop ecx
    jmp L686ca
L686bf::
    mov ebx, dword ptr [Dc9cc4]
    xor word ptr [eax+edi*1+06h], bx
L686ca::
    test byte ptr [edx+06h], 040h
    je L5ee3a
L686d4::
    cmp byte ptr [edx+06h], 043h
    jb L686f8
    je L68746
    cmp byte ptr [edx+06h], 07fh
    ja L68711
    mov ebx, dword ptr [eax+edi*1+04h]
    and ebx, dword ptr [Dc9cc0]
    shr ebx, 1
    mov word ptr [eax+edi*1+04h], bx
    jmp L5ee3a
L686f8::
    mov ebx, dword ptr [Dc9c30]
    add ebx, dword ptr [Dc9c3c]
    mov ebx, dword ptr [ebx+04h]
    mov word ptr [eax+edi*1+04h], bx
    jmp L5ee3a
L68711::
    push ecx
    xor ecx, ecx
    mov cl, byte ptr [eax+edi*1+05h]
    mov ebx, dword ptr [ecx*4+Dc9cdc]
    mov cl, byte ptr [eax+edi*1+04h]
    add ebx, dword ptr [ecx*4+Dca0dc]
    mov ebx, dword ptr [ebx*4+Dca4dc]
    mov cl, byte ptr [edx+06h]
    call dword ptr [ecx*4+colour_ops-0b0h*4]
    mov word ptr [eax+edi*1+04h], bx
    pop ecx
    jmp L5ee3a
L68746::
    mov ebx, dword ptr [Dc9cc4]
    xor word ptr [eax+edi*1+04h], bx
    jmp L5ee3a
L68756::
    test byte ptr [edx+09h], 040h
    je L687cc
    cmp byte ptr [edx+09h], 043h
    jb L68779
    je L687b8
    cmp byte ptr [edx+09h], 07fh
    ja L68789
    and ebx, dword ptr [Dc9cc0]
    shr ebx, 011h
    mov word ptr [edi+0ah], bx
    jmp L687c2
L68779::
    mov ebx, dword ptr [Dc9c30]
    mov bx, word ptr [ebx+0ah]
    mov word ptr [edi+0ah], bx
    jmp L687c2
L68789::
    push ecx
    xor ecx, ecx
    mov cl, byte ptr [edi+0bh]
    mov ebx, dword ptr [ecx*4+Dc9cdc]
    mov cl, byte ptr [edi+0ah]
    add ebx, dword ptr [ecx*4+Dca0dc]
    mov ebx, dword ptr [ebx*4+Dca4dc]
    mov cl, byte ptr [edx+09h]
    call dword ptr [ecx*4+colour_ops-0b0h*4]
    mov word ptr [edi+0ah], bx
    pop ecx
    jmp L687c2
L687b8::
    mov ebx, dword ptr [Dc9cc4]
    xor word ptr [edi+0ah], bx
L687c2::
    test byte ptr [edx+08h], 040h
    je L5ee4d
L687cc::
    cmp byte ptr [edx+08h], 043h
    jb L687ee
    je L68832
    cmp byte ptr [edx+08h], 07fh
    ja L68800
    mov ebx, dword ptr [edi+08h]
    and ebx, dword ptr [Dc9cc0]
    shr ebx, 1
    mov word ptr [edi+08h], bx
    jmp L5ee4d
L687ee::
    mov ebx, dword ptr [Dc9c30]
    mov ebx, dword ptr [ebx+08h]
    mov word ptr [edi+08h], bx
    jmp L5ee4d
L68800::
    push ecx
    xor ecx, ecx
    mov cl, byte ptr [edi+09h]
    mov ebx, dword ptr [ecx*4+Dc9cdc]
    mov cl, byte ptr [edi+08h]
    add ebx, dword ptr [ecx*4+Dca0dc]
    mov ebx, dword ptr [ebx*4+Dca4dc]
    mov cl, byte ptr [edx+08h]
    call dword ptr [ecx*4+colour_ops-0b0h*4]
    mov word ptr [edi+08h], bx
    pop ecx
    jmp L5ee4d
L68832::
    mov ebx, dword ptr [Dc9cc4]
    xor word ptr [edi+08h], bx
    jmp L5ee4d
L68841::
    test byte ptr [edx+0bh], 040h
    je L688c3
    cmp byte ptr [edx+0bh], 043h
    jb L68865
    je L688ae
    cmp byte ptr [edx+0bh], 07fh
    ja L6887c
    and ebx, dword ptr [Dc9cc0]
    shr ebx, 011h
    mov word ptr [eax+edi*1+0ah], bx
    jmp L688b9
L68865::
    mov ebx, dword ptr [Dc9c30]
    add ebx, dword ptr [Dc9c3c]
    mov bx, word ptr [ebx+0ah]
    mov word ptr [eax+edi*1+0ah], bx
    jmp L688b9
L6887c::
    push ecx
    xor ecx, ecx
    mov cl, byte ptr [eax+edi*1+0bh]
    mov ebx, dword ptr [ecx*4+Dc9cdc]
    mov cl, byte ptr [eax+edi*1+0ah]
    add ebx, dword ptr [ecx*4+Dca0dc]
    mov ebx, dword ptr [ebx*4+Dca4dc]
    mov cl, byte ptr [edx+0bh]
    call dword ptr [ecx*4+colour_ops-0b0h*4]
    mov word ptr [eax+edi*1+0ah], bx
    pop ecx
    jmp L688b9
L688ae::
    mov ebx, dword ptr [Dc9cc4]
    xor word ptr [eax+edi*1+0ah], bx
L688b9::
    test byte ptr [edx+0ah], 040h
    je L5ee61
L688c3::
    cmp byte ptr [edx+0ah], 043h
    jb L688e7
    je L68935
    cmp byte ptr [edx+0ah], 07fh
    ja L68900
    mov ebx, dword ptr [eax+edi*1+08h]
    and ebx, dword ptr [Dc9cc0]
    shr ebx, 1
    mov word ptr [eax+edi*1+08h], bx
    jmp L5ee61
L688e7::
    mov ebx, dword ptr [Dc9c30]
    add ebx, dword ptr [Dc9c3c]
    mov ebx, dword ptr [ebx+08h]
    mov word ptr [eax+edi*1+08h], bx
    jmp L5ee61
L68900::
    push ecx
    xor ecx, ecx
    mov cl, byte ptr [eax+edi*1+09h]
    mov ebx, dword ptr [ecx*4+Dc9cdc]
    mov cl, byte ptr [eax+edi*1+08h]
    add ebx, dword ptr [ecx*4+Dca0dc]
    mov ebx, dword ptr [ebx*4+Dca4dc]
    mov cl, byte ptr [edx+0ah]
    call dword ptr [ecx*4+colour_ops-0b0h*4]
    mov word ptr [eax+edi*1+08h], bx
    pop ecx
    jmp L5ee61
L68935::
    mov ebx, dword ptr [Dc9cc4]
    xor word ptr [eax+edi*1+08h], bx
    jmp L5ee61
L68945::
    test byte ptr [edx+0dh], 040h
    je L689bb
    cmp byte ptr [edx+0dh], 043h
    jb L68968
    je L689a7
    cmp byte ptr [edx+0dh], 07fh
    ja L68978
    and ebx, dword ptr [Dc9cc0]
    shr ebx, 011h
    mov word ptr [edi+0eh], bx
    jmp L689b1
L68968::
    mov ebx, dword ptr [Dc9c30]
    mov bx, word ptr [ebx+0eh]
    mov word ptr [edi+0eh], bx
    jmp L689b1
L68978::
    push ecx
    xor ecx, ecx
    mov cl, byte ptr [edi+0fh]
    mov ebx, dword ptr [ecx*4+Dc9cdc]
    mov cl, byte ptr [edi+0eh]
    add ebx, dword ptr [ecx*4+Dca0dc]
    mov ebx, dword ptr [ebx*4+Dca4dc]
    mov cl, byte ptr [edx+0dh]
    call dword ptr [ecx*4+colour_ops-0b0h*4]
    mov word ptr [edi+0eh], bx
    pop ecx
    jmp L689b1
L689a7::
    mov ebx, dword ptr [Dc9cc4]
    xor word ptr [edi+0eh], bx
L689b1::
    test byte ptr [edx+0ch], 040h
    je L5ee74
L689bb::
    cmp byte ptr [edx+0ch], 043h
    jb L689dd
    je L68a21
    cmp byte ptr [edx+0ch], 07fh
    ja L689ef
    mov ebx, dword ptr [edi+0ch]
    and ebx, dword ptr [Dc9cc0]
    shr ebx, 1
    mov word ptr [edi+0ch], bx
    jmp L5ee74
L689dd::
    mov ebx, dword ptr [Dc9c30]
    mov ebx, dword ptr [ebx+0ch]
    mov word ptr [edi+0ch], bx
    jmp L5ee74
L689ef::
    push ecx
    xor ecx, ecx
    mov cl, byte ptr [edi+0dh]
    mov ebx, dword ptr [ecx*4+Dc9cdc]
    mov cl, byte ptr [edi+0ch]
    add ebx, dword ptr [ecx*4+Dca0dc]
    mov ebx, dword ptr [ebx*4+Dca4dc]
    mov cl, byte ptr [edx+0ch]
    call dword ptr [ecx*4+colour_ops-0b0h*4]
    mov word ptr [edi+0ch], bx
    pop ecx
    jmp L5ee74
L68a21::
    mov ebx, dword ptr [Dc9cc4]
    xor word ptr [edi+0ch], bx
    jmp L5ee74
L68a30::
    test byte ptr [edx+0fh], 040h
    je L68ab2
    cmp byte ptr [edx+0fh], 043h
    jb L68a54
    je L68a9d
    cmp byte ptr [edx+0fh], 07fh
    ja L68a6b
    and ebx, dword ptr [Dc9cc0]
    shr ebx, 011h
    mov word ptr [eax+edi*1+0eh], bx
    jmp L68aa8
L68a54::
    mov ebx, dword ptr [Dc9c30]
    add ebx, dword ptr [Dc9c3c]
    mov bx, word ptr [ebx+0eh]
    mov word ptr [eax+edi*1+0eh], bx
    jmp L68aa8
L68a6b::
    push ecx
    xor ecx, ecx
    mov cl, byte ptr [eax+edi*1+0fh]
    mov ebx, dword ptr [ecx*4+Dc9cdc]
    mov cl, byte ptr [eax+edi*1+0eh]
    add ebx, dword ptr [ecx*4+Dca0dc]
    mov ebx, dword ptr [ebx*4+Dca4dc]
    mov cl, byte ptr [edx+0fh]
    call dword ptr [ecx*4+colour_ops-0b0h*4]
    mov word ptr [eax+edi*1+0eh], bx
    pop ecx
    jmp L68aa8
L68a9d::
    mov ebx, dword ptr [Dc9cc4]
    xor word ptr [eax+edi*1+0eh], bx
L68aa8::
    test byte ptr [edx+0eh], 040h
    je L5ee88
L68ab2::
    cmp byte ptr [edx+0eh], 043h
    jb L68ad6
    je L68b24
    cmp byte ptr [edx+0eh], 07fh
    ja L68aef
    mov ebx, dword ptr [eax+edi*1+0ch]
    and ebx, dword ptr [Dc9cc0]
    shr ebx, 1
    mov word ptr [eax+edi*1+0ch], bx
    jmp L5ee88
L68ad6::
    mov ebx, dword ptr [Dc9c30]
    add ebx, dword ptr [Dc9c3c]
    mov ebx, dword ptr [ebx+0ch]
    mov word ptr [eax+edi*1+0ch], bx
    jmp L5ee88
L68aef::
    push ecx
    xor ecx, ecx
    mov cl, byte ptr [eax+edi*1+0dh]
    mov ebx, dword ptr [ecx*4+Dc9cdc]
    mov cl, byte ptr [eax+edi*1+0ch]
    add ebx, dword ptr [ecx*4+Dca0dc]
    mov ebx, dword ptr [ebx*4+Dca4dc]
    mov cl, byte ptr [edx+0eh]
    call dword ptr [ecx*4+colour_ops-0b0h*4]
    mov word ptr [eax+edi*1+0ch], bx
    pop ecx
    jmp L5ee88
L68b24::
    mov ebx, dword ptr [Dc9cc4]
    xor word ptr [eax+edi*1+0ch], bx
    jmp L5ee88
L68b34::
    test byte ptr [edx+011h], 040h
    je L68baa
    cmp byte ptr [edx+011h], 043h
    jb L68b57
    je L68b96
    cmp byte ptr [edx+011h], 07fh
    ja L68b67
    and ebx, dword ptr [Dc9cc0]
    shr ebx, 011h
    mov word ptr [edi+02h], bx
    jmp L68ba0
L68b57::
    mov ebx, dword ptr [Dc9c30]
    mov bx, word ptr [ebx+02h]
    mov word ptr [edi+02h], bx
    jmp L68ba0
L68b67::
    push ecx
    xor ecx, ecx
    mov cl, byte ptr [edi+03h]
    mov ebx, dword ptr [ecx*4+Dc9cdc]
    mov cl, byte ptr [edi+02h]
    add ebx, dword ptr [ecx*4+Dca0dc]
    mov ebx, dword ptr [ebx*4+Dca4dc]
    mov cl, byte ptr [edx+011h]
    call dword ptr [ecx*4+colour_ops-0b0h*4]
    mov word ptr [edi+02h], bx
    pop ecx
    jmp L68ba0
L68b96::
    mov ebx, dword ptr [Dc9cc4]
    xor word ptr [edi+02h], bx
L68ba0::
    test byte ptr [edx+010h], 040h
    je L5eea6
L68baa::
    cmp byte ptr [edx+010h], 043h
    jb L68bca
    je L68c0a
    cmp byte ptr [edx+010h], 07fh
    ja L68bda
    mov ebx, dword ptr [edi]
    and ebx, dword ptr [Dc9cc0]
    shr ebx, 1
    mov word ptr [edi], bx
    jmp L5eea6
L68bca::
    mov ebx, dword ptr [Dc9c30]
    mov ebx, dword ptr [ebx]
    mov word ptr [edi], bx
    jmp L5eea6
L68bda::
    push ecx
    xor ecx, ecx
    mov cl, byte ptr [edi+01h]
    mov ebx, dword ptr [ecx*4+Dc9cdc]
    mov cl, byte ptr [edi]
    add ebx, dword ptr [ecx*4+Dca0dc]
    mov ebx, dword ptr [ebx*4+Dca4dc]
    mov cl, byte ptr [edx+010h]
    call dword ptr [ecx*4+colour_ops-0b0h*4]
    mov word ptr [edi], bx
    pop ecx
    jmp L5eea6
L68c0a::
    mov ebx, dword ptr [Dc9cc4]
    xor word ptr [edi], bx
    jmp L5eea6
L68c18::
    test byte ptr [edx+013h], 040h
    je L68c9a
    cmp byte ptr [edx+013h], 043h
    jb L68c3c
    je L68c85
    cmp byte ptr [edx+013h], 07fh
    ja L68c53
    and ebx, dword ptr [Dc9cc0]
    shr ebx, 011h
    mov word ptr [eax+edi*1+02h], bx
    jmp L68c90
L68c3c::
    mov ebx, dword ptr [Dc9c30]
    add ebx, dword ptr [Dc9c3c]
    mov bx, word ptr [ebx+02h]
    mov word ptr [eax+edi*1+02h], bx
    jmp L68c90
L68c53::
    push ecx
    xor ecx, ecx
    mov cl, byte ptr [eax+edi*1+03h]
    mov ebx, dword ptr [ecx*4+Dc9cdc]
    mov cl, byte ptr [eax+edi*1+02h]
    add ebx, dword ptr [ecx*4+Dca0dc]
    mov ebx, dword ptr [ebx*4+Dca4dc]
    mov cl, byte ptr [edx+013h]
    call dword ptr [ecx*4+colour_ops-0b0h*4]
    mov word ptr [eax+edi*1+02h], bx
    pop ecx
    jmp L68c90
L68c85::
    mov ebx, dword ptr [Dc9cc4]
    xor word ptr [eax+edi*1+02h], bx
L68c90::
    test byte ptr [edx+012h], 040h
    je L5eeb9
L68c9a::
    cmp byte ptr [edx+012h], 043h
    jb L68cbc
    je L68d06
    cmp byte ptr [edx+012h], 07fh
    ja L68cd3
    mov ebx, dword ptr [eax+edi*1]
    and ebx, dword ptr [Dc9cc0]
    shr ebx, 1
    mov word ptr [eax+edi*1], bx
    jmp L5eeb9
L68cbc::
    mov ebx, dword ptr [Dc9c30]
    add ebx, dword ptr [Dc9c3c]
    mov ebx, dword ptr [ebx]
    mov word ptr [eax+edi*1], bx
    jmp L5eeb9
L68cd3::
    push ecx
    xor ecx, ecx
    mov cl, byte ptr [eax+edi*1+01h]
    mov ebx, dword ptr [ecx*4+Dc9cdc]
    mov cl, byte ptr [eax+edi*1]
    add ebx, dword ptr [ecx*4+Dca0dc]
    mov ebx, dword ptr [ebx*4+Dca4dc]
    mov cl, byte ptr [edx+012h]
    call dword ptr [ecx*4+colour_ops-0b0h*4]
    mov word ptr [eax+edi*1], bx
    pop ecx
    jmp L5eeb9
L68d06::
    mov ebx, dword ptr [Dc9cc4]
    xor word ptr [eax+edi*1], bx
    jmp L5eeb9
L68d15::
    test byte ptr [edx+015h], 040h
    je L68d8b
    cmp byte ptr [edx+015h], 043h
    jb L68d38
    je L68d77
    cmp byte ptr [edx+015h], 07fh
    ja L68d48
    and ebx, dword ptr [Dc9cc0]
    shr ebx, 011h
    mov word ptr [edi+06h], bx
    jmp L68d81
L68d38::
    mov ebx, dword ptr [Dc9c30]
    mov bx, word ptr [ebx+06h]
    mov word ptr [edi+06h], bx
    jmp L68d81
L68d48::
    push ecx
    xor ecx, ecx
    mov cl, byte ptr [edi+07h]
    mov ebx, dword ptr [ecx*4+Dc9cdc]
    mov cl, byte ptr [edi+06h]
    add ebx, dword ptr [ecx*4+Dca0dc]
    mov ebx, dword ptr [ebx*4+Dca4dc]
    mov cl, byte ptr [edx+015h]
    call dword ptr [ecx*4+colour_ops-0b0h*4]
    mov word ptr [edi+06h], bx
    pop ecx
    jmp L68d81
L68d77::
    mov ebx, dword ptr [Dc9cc4]
    xor word ptr [edi+06h], bx
L68d81::
    test byte ptr [edx+014h], 040h
    je L5eecc
L68d8b::
    cmp byte ptr [edx+014h], 043h
    jb L68dad
    je L68df1
    cmp byte ptr [edx+014h], 07fh
    ja L68dbf
    mov ebx, dword ptr [edi+04h]
    and ebx, dword ptr [Dc9cc0]
    shr ebx, 1
    mov word ptr [edi+04h], bx
    jmp L5eecc
L68dad::
    mov ebx, dword ptr [Dc9c30]
    mov ebx, dword ptr [ebx+04h]
    mov word ptr [edi+04h], bx
    jmp L5eecc
L68dbf::
    push ecx
    xor ecx, ecx
    mov cl, byte ptr [edi+05h]
    mov ebx, dword ptr [ecx*4+Dc9cdc]
    mov cl, byte ptr [edi+04h]
    add ebx, dword ptr [ecx*4+Dca0dc]
    mov ebx, dword ptr [ebx*4+Dca4dc]
    mov cl, byte ptr [edx+014h]
    call dword ptr [ecx*4+colour_ops-0b0h*4]
    mov word ptr [edi+04h], bx
    pop ecx
    jmp L5eecc
L68df1::
    mov ebx, dword ptr [Dc9cc4]
    xor word ptr [edi+04h], bx
    jmp L5eecc
L68e00::
    test byte ptr [edx+017h], 040h
    je L68e82
    cmp byte ptr [edx+017h], 043h
    jb L68e24
    je L68e6d
    cmp byte ptr [edx+017h], 07fh
    ja L68e3b
    and ebx, dword ptr [Dc9cc0]
    shr ebx, 011h
    mov word ptr [eax+edi*1+06h], bx
    jmp L68e78
L68e24::
    mov ebx, dword ptr [Dc9c30]
    add ebx, dword ptr [Dc9c3c]
    mov bx, word ptr [ebx+06h]
    mov word ptr [eax+edi*1+06h], bx
    jmp L68e78
L68e3b::
    push ecx
    xor ecx, ecx
    mov cl, byte ptr [eax+edi*1+07h]
    mov ebx, dword ptr [ecx*4+Dc9cdc]
    mov cl, byte ptr [eax+edi*1+06h]
    add ebx, dword ptr [ecx*4+Dca0dc]
    mov ebx, dword ptr [ebx*4+Dca4dc]
    mov cl, byte ptr [edx+017h]
    call dword ptr [ecx*4+colour_ops-0b0h*4]
    mov word ptr [eax+edi*1+06h], bx
    pop ecx
    jmp L68e78
L68e6d::
    mov ebx, dword ptr [Dc9cc4]
    xor word ptr [eax+edi*1+06h], bx
L68e78::
    test byte ptr [edx+016h], 040h
    je L5eee0
L68e82::
    cmp byte ptr [edx+016h], 043h
    jb L68ea6
    je L68ef4
    cmp byte ptr [edx+016h], 07fh
    ja L68ebf
    mov ebx, dword ptr [eax+edi*1+04h]
    and ebx, dword ptr [Dc9cc0]
    shr ebx, 1
    mov word ptr [eax+edi*1+04h], bx
    jmp L5eee0
L68ea6::
    mov ebx, dword ptr [Dc9c30]
    add ebx, dword ptr [Dc9c3c]
    mov ebx, dword ptr [ebx+04h]
    mov word ptr [eax+edi*1+04h], bx
    jmp L5eee0
L68ebf::
    push ecx
    xor ecx, ecx
    mov cl, byte ptr [eax+edi*1+05h]
    mov ebx, dword ptr [ecx*4+Dc9cdc]
    mov cl, byte ptr [eax+edi*1+04h]
    add ebx, dword ptr [ecx*4+Dca0dc]
    mov ebx, dword ptr [ebx*4+Dca4dc]
    mov cl, byte ptr [edx+016h]
    call dword ptr [ecx*4+colour_ops-0b0h*4]
    mov word ptr [eax+edi*1+04h], bx
    pop ecx
    jmp L5eee0
L68ef4::
    mov ebx, dword ptr [Dc9cc4]
    xor word ptr [eax+edi*1+04h], bx
    jmp L5eee0
L68f04::
    test byte ptr [edx+019h], 040h
    je L68f7a
    cmp byte ptr [edx+019h], 043h
    jb L68f27
    je L68f66
    cmp byte ptr [edx+019h], 07fh
    ja L68f37
    and ebx, dword ptr [Dc9cc0]
    shr ebx, 011h
    mov word ptr [edi+0ah], bx
    jmp L68f70
L68f27::
    mov ebx, dword ptr [Dc9c30]
    mov bx, word ptr [ebx+0ah]
    mov word ptr [edi+0ah], bx
    jmp L68f70
L68f37::
    push ecx
    xor ecx, ecx
    mov cl, byte ptr [edi+0bh]
    mov ebx, dword ptr [ecx*4+Dc9cdc]
    mov cl, byte ptr [edi+0ah]
    add ebx, dword ptr [ecx*4+Dca0dc]
    mov ebx, dword ptr [ebx*4+Dca4dc]
    mov cl, byte ptr [edx+019h]
    call dword ptr [ecx*4+colour_ops-0b0h*4]
    mov word ptr [edi+0ah], bx
    pop ecx
    jmp L68f70
L68f66::
    mov ebx, dword ptr [Dc9cc4]
    xor word ptr [edi+0ah], bx
L68f70::
    test byte ptr [edx+018h], 040h
    je L5eef3
L68f7a::
    cmp byte ptr [edx+018h], 043h
    jb L68f9c
    je L68fe0
    cmp byte ptr [edx+018h], 07fh
    ja L68fae
    mov ebx, dword ptr [edi+08h]
    and ebx, dword ptr [Dc9cc0]
    shr ebx, 1
    mov word ptr [edi+08h], bx
    jmp L5eef3
L68f9c::
    mov ebx, dword ptr [Dc9c30]
    mov ebx, dword ptr [ebx+08h]
    mov word ptr [edi+08h], bx
    jmp L5eef3
L68fae::
    push ecx
    xor ecx, ecx
    mov cl, byte ptr [edi+09h]
    mov ebx, dword ptr [ecx*4+Dc9cdc]
    mov cl, byte ptr [edi+08h]
    add ebx, dword ptr [ecx*4+Dca0dc]
    mov ebx, dword ptr [ebx*4+Dca4dc]
    mov cl, byte ptr [edx+018h]
    call dword ptr [ecx*4+colour_ops-0b0h*4]
    mov word ptr [edi+08h], bx
    pop ecx
    jmp L5eef3
L68fe0::
    mov ebx, dword ptr [Dc9cc4]
    xor word ptr [edi+08h], bx
    jmp L5eef3
L68fef::
    test byte ptr [edx+01bh], 040h
    je L69071
    cmp byte ptr [edx+01bh], 043h
    jb L69013
    je L6905c
    cmp byte ptr [edx+01bh], 07fh
    ja L6902a
    and ebx, dword ptr [Dc9cc0]
    shr ebx, 011h
    mov word ptr [eax+edi*1+0ah], bx
    jmp L69067
L69013::
    mov ebx, dword ptr [Dc9c30]
    add ebx, dword ptr [Dc9c3c]
    mov bx, word ptr [ebx+0ah]
    mov word ptr [eax+edi*1+0ah], bx
    jmp L69067
L6902a::
    push ecx
    xor ecx, ecx
    mov cl, byte ptr [eax+edi*1+0bh]
    mov ebx, dword ptr [ecx*4+Dc9cdc]
    mov cl, byte ptr [eax+edi*1+0ah]
    add ebx, dword ptr [ecx*4+Dca0dc]
    mov ebx, dword ptr [ebx*4+Dca4dc]
    mov cl, byte ptr [edx+01bh]
    call dword ptr [ecx*4+colour_ops-0b0h*4]
    mov word ptr [eax+edi*1+0ah], bx
    pop ecx
    jmp L69067
L6905c::
    mov ebx, dword ptr [Dc9cc4]
    xor word ptr [eax+edi*1+0ah], bx
L69067::
    test byte ptr [edx+01ah], 040h
    je L5ef07
L69071::
    cmp byte ptr [edx+01ah], 043h
    jb L69095
    je L690e3
    cmp byte ptr [edx+01ah], 07fh
    ja L690ae
    mov ebx, dword ptr [eax+edi*1+08h]
    and ebx, dword ptr [Dc9cc0]
    shr ebx, 1
    mov word ptr [eax+edi*1+08h], bx
    jmp L5ef07
L69095::
    mov ebx, dword ptr [Dc9c30]
    add ebx, dword ptr [Dc9c3c]
    mov ebx, dword ptr [ebx+08h]
    mov word ptr [eax+edi*1+08h], bx
    jmp L5ef07
L690ae::
    push ecx
    xor ecx, ecx
    mov cl, byte ptr [eax+edi*1+09h]
    mov ebx, dword ptr [ecx*4+Dc9cdc]
    mov cl, byte ptr [eax+edi*1+08h]
    add ebx, dword ptr [ecx*4+Dca0dc]
    mov ebx, dword ptr [ebx*4+Dca4dc]
    mov cl, byte ptr [edx+01ah]
    call dword ptr [ecx*4+colour_ops-0b0h*4]
    mov word ptr [eax+edi*1+08h], bx
    pop ecx
    jmp L5ef07
L690e3::
    mov ebx, dword ptr [Dc9cc4]
    xor word ptr [eax+edi*1+08h], bx
    jmp L5ef07
L690f3::
    test byte ptr [edx+01dh], 040h
    je L69169
    cmp byte ptr [edx+01dh], 043h
    jb L69116
    je L69155
    cmp byte ptr [edx+01dh], 07fh
    ja L69126
    and ebx, dword ptr [Dc9cc0]
    shr ebx, 011h
    mov word ptr [edi+0eh], bx
    jmp L6915f
L69116::
    mov ebx, dword ptr [Dc9c30]
    mov bx, word ptr [ebx+0eh]
    mov word ptr [edi+0eh], bx
    jmp L6915f
L69126::
    push ecx
    xor ecx, ecx
    mov cl, byte ptr [edi+0fh]
    mov ebx, dword ptr [ecx*4+Dc9cdc]
    mov cl, byte ptr [edi+0eh]
    add ebx, dword ptr [ecx*4+Dca0dc]
    mov ebx, dword ptr [ebx*4+Dca4dc]
    mov cl, byte ptr [edx+01dh]
    call dword ptr [ecx*4+colour_ops-0b0h*4]
    mov word ptr [edi+0eh], bx
    pop ecx
    jmp L6915f
L69155::
    mov ebx, dword ptr [Dc9cc4]
    xor word ptr [edi+0eh], bx
L6915f::
    test byte ptr [edx+01ch], 040h
    je L5ef1a
L69169::
    cmp byte ptr [edx+01ch], 043h
    jb L6918b
    je L691cf
    cmp byte ptr [edx+01ch], 07fh
    ja L6919d
    mov ebx, dword ptr [edi+0ch]
    and ebx, dword ptr [Dc9cc0]
    shr ebx, 1
    mov word ptr [edi+0ch], bx
    jmp L5ef1a
L6918b::
    mov ebx, dword ptr [Dc9c30]
    mov ebx, dword ptr [ebx+0ch]
    mov word ptr [edi+0ch], bx
    jmp L5ef1a
L6919d::
    push ecx
    xor ecx, ecx
    mov cl, byte ptr [edi+0dh]
    mov ebx, dword ptr [ecx*4+Dc9cdc]
    mov cl, byte ptr [edi+0ch]
    add ebx, dword ptr [ecx*4+Dca0dc]
    mov ebx, dword ptr [ebx*4+Dca4dc]
    mov cl, byte ptr [edx+01ch]
    call dword ptr [ecx*4+colour_ops-0b0h*4]
    mov word ptr [edi+0ch], bx
    pop ecx
    jmp L5ef1a
L691cf::
    mov ebx, dword ptr [Dc9cc4]
    xor word ptr [edi+0ch], bx
    jmp L5ef1a
L691de::
    test byte ptr [edx+01fh], 040h
    je L69260
    cmp byte ptr [edx+01fh], 043h
    jb L69202
    je L6924b
    cmp byte ptr [edx+01fh], 07fh
    ja L69219
    and ebx, dword ptr [Dc9cc0]
    shr ebx, 011h
    mov word ptr [eax+edi*1+0eh], bx
    jmp L69256
L69202::
    mov ebx, dword ptr [Dc9c30]
    add ebx, dword ptr [Dc9c3c]
    mov bx, word ptr [ebx+0eh]
    mov word ptr [eax+edi*1+0eh], bx
    jmp L69256
L69219::
    push ecx
    xor ecx, ecx
    mov cl, byte ptr [eax+edi*1+0fh]
    mov ebx, dword ptr [ecx*4+Dc9cdc]
    mov cl, byte ptr [eax+edi*1+0eh]
    add ebx, dword ptr [ecx*4+Dca0dc]
    mov ebx, dword ptr [ebx*4+Dca4dc]
    mov cl, byte ptr [edx+01fh]
    call dword ptr [ecx*4+colour_ops-0b0h*4]
    mov word ptr [eax+edi*1+0eh], bx
    pop ecx
    jmp L69256
L6924b::
    mov ebx, dword ptr [Dc9cc4]
    xor word ptr [eax+edi*1+0eh], bx
L69256::
    test byte ptr [edx+01eh], 040h
    je L5ef2e
L69260::
    cmp byte ptr [edx+01eh], 043h
    jb L69284
    je L692d2
    cmp byte ptr [edx+01eh], 07fh
    ja L6929d
    mov ebx, dword ptr [eax+edi*1+0ch]
    and ebx, dword ptr [Dc9cc0]
    shr ebx, 1
    mov word ptr [eax+edi*1+0ch], bx
    jmp L5ef2e
L69284::
    mov ebx, dword ptr [Dc9c30]
    add ebx, dword ptr [Dc9c3c]
    mov ebx, dword ptr [ebx+0ch]
    mov word ptr [eax+edi*1+0ch], bx
    jmp L5ef2e
L6929d::
    push ecx
    xor ecx, ecx
    mov cl, byte ptr [eax+edi*1+0dh]
    mov ebx, dword ptr [ecx*4+Dc9cdc]
    mov cl, byte ptr [eax+edi*1+0ch]
    add ebx, dword ptr [ecx*4+Dca0dc]
    mov ebx, dword ptr [ebx*4+Dca4dc]
    mov cl, byte ptr [edx+01eh]
    call dword ptr [ecx*4+colour_ops-0b0h*4]
    mov word ptr [eax+edi*1+0ch], bx
    pop ecx
    jmp L5ef2e
L692d2::
    mov ebx, dword ptr [Dc9cc4]
    xor word ptr [eax+edi*1+0ch], bx
    jmp L5ef2e
L692e2::
    test byte ptr [edx+021h], 040h
    je L69358
    cmp byte ptr [edx+021h], 043h
    jb L69305
    je L69344
    cmp byte ptr [edx+021h], 07fh
    ja L69315
    and ebx, dword ptr [Dc9cc0]
    shr ebx, 011h
    mov word ptr [edi+02h], bx
    jmp L6934e
L69305::
    mov ebx, dword ptr [Dc9c30]
    mov bx, word ptr [ebx+02h]
    mov word ptr [edi+02h], bx
    jmp L6934e
L69315::
    push ecx
    xor ecx, ecx
    mov cl, byte ptr [edi+03h]
    mov ebx, dword ptr [ecx*4+Dc9cdc]
    mov cl, byte ptr [edi+02h]
    add ebx, dword ptr [ecx*4+Dca0dc]
    mov ebx, dword ptr [ebx*4+Dca4dc]
    mov cl, byte ptr [edx+021h]
    call dword ptr [ecx*4+colour_ops-0b0h*4]
    mov word ptr [edi+02h], bx
    pop ecx
    jmp L6934e
L69344::
    mov ebx, dword ptr [Dc9cc4]
    xor word ptr [edi+02h], bx
L6934e::
    test byte ptr [edx+020h], 040h
    je L5ef4c
L69358::
    cmp byte ptr [edx+020h], 043h
    jb L69378
    je L693b8
    cmp byte ptr [edx+020h], 07fh
    ja L69388
    mov ebx, dword ptr [edi]
    and ebx, dword ptr [Dc9cc0]
    shr ebx, 1
    mov word ptr [edi], bx
    jmp L5ef4c
L69378::
    mov ebx, dword ptr [Dc9c30]
    mov ebx, dword ptr [ebx]
    mov word ptr [edi], bx
    jmp L5ef4c
L69388::
    push ecx
    xor ecx, ecx
    mov cl, byte ptr [edi+01h]
    mov ebx, dword ptr [ecx*4+Dc9cdc]
    mov cl, byte ptr [edi]
    add ebx, dword ptr [ecx*4+Dca0dc]
    mov ebx, dword ptr [ebx*4+Dca4dc]
    mov cl, byte ptr [edx+020h]
    call dword ptr [ecx*4+colour_ops-0b0h*4]
    mov word ptr [edi], bx
    pop ecx
    jmp L5ef4c
L693b8::
    mov ebx, dword ptr [Dc9cc4]
    xor word ptr [edi], bx
    jmp L5ef4c
L693c6::
    test byte ptr [edx+023h], 040h
    je L69448
    cmp byte ptr [edx+023h], 043h
    jb L693ea
    je L69433
    cmp byte ptr [edx+023h], 07fh
    ja L69401
    and ebx, dword ptr [Dc9cc0]
    shr ebx, 011h
    mov word ptr [eax+edi*1+02h], bx
    jmp L6943e
L693ea::
    mov ebx, dword ptr [Dc9c30]
    add ebx, dword ptr [Dc9c3c]
    mov bx, word ptr [ebx+02h]
    mov word ptr [eax+edi*1+02h], bx
    jmp L6943e
L69401::
    push ecx
    xor ecx, ecx
    mov cl, byte ptr [eax+edi*1+03h]
    mov ebx, dword ptr [ecx*4+Dc9cdc]
    mov cl, byte ptr [eax+edi*1+02h]
    add ebx, dword ptr [ecx*4+Dca0dc]
    mov ebx, dword ptr [ebx*4+Dca4dc]
    mov cl, byte ptr [edx+023h]
    call dword ptr [ecx*4+colour_ops-0b0h*4]
    mov word ptr [eax+edi*1+02h], bx
    pop ecx
    jmp L6943e
L69433::
    mov ebx, dword ptr [Dc9cc4]
    xor word ptr [eax+edi*1+02h], bx
L6943e::
    test byte ptr [edx+022h], 040h
    je L5ef5f
L69448::
    cmp byte ptr [edx+022h], 043h
    jb L6946a
    je L694b4
    cmp byte ptr [edx+022h], 07fh
    ja L69481
    mov ebx, dword ptr [eax+edi*1]
    and ebx, dword ptr [Dc9cc0]
    shr ebx, 1
    mov word ptr [eax+edi*1], bx
    jmp L5ef5f
L6946a::
    mov ebx, dword ptr [Dc9c30]
    add ebx, dword ptr [Dc9c3c]
    mov ebx, dword ptr [ebx]
    mov word ptr [eax+edi*1], bx
    jmp L5ef5f
L69481::
    push ecx
    xor ecx, ecx
    mov cl, byte ptr [eax+edi*1+01h]
    mov ebx, dword ptr [ecx*4+Dc9cdc]
    mov cl, byte ptr [eax+edi*1]
    add ebx, dword ptr [ecx*4+Dca0dc]
    mov ebx, dword ptr [ebx*4+Dca4dc]
    mov cl, byte ptr [edx+022h]
    call dword ptr [ecx*4+colour_ops-0b0h*4]
    mov word ptr [eax+edi*1], bx
    pop ecx
    jmp L5ef5f
L694b4::
    mov ebx, dword ptr [Dc9cc4]
    xor word ptr [eax+edi*1], bx
    jmp L5ef5f
L694c3::
    test byte ptr [edx+025h], 040h
    je L69539
    cmp byte ptr [edx+025h], 043h
    jb L694e6
    je L69525
    cmp byte ptr [edx+025h], 07fh
    ja L694f6
    and ebx, dword ptr [Dc9cc0]
    shr ebx, 011h
    mov word ptr [edi+06h], bx
    jmp L6952f
L694e6::
    mov ebx, dword ptr [Dc9c30]
    mov bx, word ptr [ebx+06h]
    mov word ptr [edi+06h], bx
    jmp L6952f
L694f6::
    push ecx
    xor ecx, ecx
    mov cl, byte ptr [edi+07h]
    mov ebx, dword ptr [ecx*4+Dc9cdc]
    mov cl, byte ptr [edi+06h]
    add ebx, dword ptr [ecx*4+Dca0dc]
    mov ebx, dword ptr [ebx*4+Dca4dc]
    mov cl, byte ptr [edx+025h]
    call dword ptr [ecx*4+colour_ops-0b0h*4]
    mov word ptr [edi+06h], bx
    pop ecx
    jmp L6952f
L69525::
    mov ebx, dword ptr [Dc9cc4]
    xor word ptr [edi+06h], bx
L6952f::
    test byte ptr [edx+024h], 040h
    je L5ef72
L69539::
    cmp byte ptr [edx+024h], 043h
    jb L6955b
    je L6959f
    cmp byte ptr [edx+024h], 07fh
    ja L6956d
    mov ebx, dword ptr [edi+04h]
    and ebx, dword ptr [Dc9cc0]
    shr ebx, 1
    mov word ptr [edi+04h], bx
    jmp L5ef72
L6955b::
    mov ebx, dword ptr [Dc9c30]
    mov ebx, dword ptr [ebx+04h]
    mov word ptr [edi+04h], bx
    jmp L5ef72
L6956d::
    push ecx
    xor ecx, ecx
    mov cl, byte ptr [edi+05h]
    mov ebx, dword ptr [ecx*4+Dc9cdc]
    mov cl, byte ptr [edi+04h]
    add ebx, dword ptr [ecx*4+Dca0dc]
    mov ebx, dword ptr [ebx*4+Dca4dc]
    mov cl, byte ptr [edx+024h]
    call dword ptr [ecx*4+colour_ops-0b0h*4]
    mov word ptr [edi+04h], bx
    pop ecx
    jmp L5ef72
L6959f::
    mov ebx, dword ptr [Dc9cc4]
    xor word ptr [edi+04h], bx
    jmp L5ef72
L695ae::
    test byte ptr [edx+027h], 040h
    je L69630
    cmp byte ptr [edx+027h], 043h
    jb L695d2
    je L6961b
    cmp byte ptr [edx+027h], 07fh
    ja L695e9
    and ebx, dword ptr [Dc9cc0]
    shr ebx, 011h
    mov word ptr [eax+edi*1+06h], bx
    jmp L69626
L695d2::
    mov ebx, dword ptr [Dc9c30]
    add ebx, dword ptr [Dc9c3c]
    mov bx, word ptr [ebx+06h]
    mov word ptr [eax+edi*1+06h], bx
    jmp L69626
L695e9::
    push ecx
    xor ecx, ecx
    mov cl, byte ptr [eax+edi*1+07h]
    mov ebx, dword ptr [ecx*4+Dc9cdc]
    mov cl, byte ptr [eax+edi*1+06h]
    add ebx, dword ptr [ecx*4+Dca0dc]
    mov ebx, dword ptr [ebx*4+Dca4dc]
    mov cl, byte ptr [edx+027h]
    call dword ptr [ecx*4+colour_ops-0b0h*4]
    mov word ptr [eax+edi*1+06h], bx
    pop ecx
    jmp L69626
L6961b::
    mov ebx, dword ptr [Dc9cc4]
    xor word ptr [eax+edi*1+06h], bx
L69626::
    test byte ptr [edx+026h], 040h
    je L5ef86
L69630::
    cmp byte ptr [edx+026h], 043h
    jb L69654
    je L696a2
    cmp byte ptr [edx+026h], 07fh
    ja L6966d
    mov ebx, dword ptr [eax+edi*1+04h]
    and ebx, dword ptr [Dc9cc0]
    shr ebx, 1
    mov word ptr [eax+edi*1+04h], bx
    jmp L5ef86
L69654::
    mov ebx, dword ptr [Dc9c30]
    add ebx, dword ptr [Dc9c3c]
    mov ebx, dword ptr [ebx+04h]
    mov word ptr [eax+edi*1+04h], bx
    jmp L5ef86
L6966d::
    push ecx
    xor ecx, ecx
    mov cl, byte ptr [eax+edi*1+05h]
    mov ebx, dword ptr [ecx*4+Dc9cdc]
    mov cl, byte ptr [eax+edi*1+04h]
    add ebx, dword ptr [ecx*4+Dca0dc]
    mov ebx, dword ptr [ebx*4+Dca4dc]
    mov cl, byte ptr [edx+026h]
    call dword ptr [ecx*4+colour_ops-0b0h*4]
    mov word ptr [eax+edi*1+04h], bx
    pop ecx
    jmp L5ef86
L696a2::
    mov ebx, dword ptr [Dc9cc4]
    xor word ptr [eax+edi*1+04h], bx
    jmp L5ef86
L696b2::
    test byte ptr [edx+029h], 040h
    je L69728
    cmp byte ptr [edx+029h], 043h
    jb L696d5
    je L69714
    cmp byte ptr [edx+029h], 07fh
    ja L696e5
    and ebx, dword ptr [Dc9cc0]
    shr ebx, 011h
    mov word ptr [edi+0ah], bx
    jmp L6971e
L696d5::
    mov ebx, dword ptr [Dc9c30]
    mov bx, word ptr [ebx+0ah]
    mov word ptr [edi+0ah], bx
    jmp L6971e
L696e5::
    push ecx
    xor ecx, ecx
    mov cl, byte ptr [edi+0bh]
    mov ebx, dword ptr [ecx*4+Dc9cdc]
    mov cl, byte ptr [edi+0ah]
    add ebx, dword ptr [ecx*4+Dca0dc]
    mov ebx, dword ptr [ebx*4+Dca4dc]
    mov cl, byte ptr [edx+029h]
    call dword ptr [ecx*4+colour_ops-0b0h*4]
    mov word ptr [edi+0ah], bx
    pop ecx
    jmp L6971e
L69714::
    mov ebx, dword ptr [Dc9cc4]
    xor word ptr [edi+0ah], bx
L6971e::
    test byte ptr [edx+028h], 040h
    je L5ef99
L69728::
    cmp byte ptr [edx+028h], 043h
    jb L6974a
    je L6978e
    cmp byte ptr [edx+028h], 07fh
    ja L6975c
    mov ebx, dword ptr [edi+08h]
    and ebx, dword ptr [Dc9cc0]
    shr ebx, 1
    mov word ptr [edi+08h], bx
    jmp L5ef99
L6974a::
    mov ebx, dword ptr [Dc9c30]
    mov ebx, dword ptr [ebx+08h]
    mov word ptr [edi+08h], bx
    jmp L5ef99
L6975c::
    push ecx
    xor ecx, ecx
    mov cl, byte ptr [edi+09h]
    mov ebx, dword ptr [ecx*4+Dc9cdc]
    mov cl, byte ptr [edi+08h]
    add ebx, dword ptr [ecx*4+Dca0dc]
    mov ebx, dword ptr [ebx*4+Dca4dc]
    mov cl, byte ptr [edx+028h]
    call dword ptr [ecx*4+colour_ops-0b0h*4]
    mov word ptr [edi+08h], bx
    pop ecx
    jmp L5ef99
L6978e::
    mov ebx, dword ptr [Dc9cc4]
    xor word ptr [edi+08h], bx
    jmp L5ef99
L6979d::
    test byte ptr [edx+02bh], 040h
    je L6981f
    cmp byte ptr [edx+02bh], 043h
    jb L697c1
    je L6980a
    cmp byte ptr [edx+02bh], 07fh
    ja L697d8
    and ebx, dword ptr [Dc9cc0]
    shr ebx, 011h
    mov word ptr [eax+edi*1+0ah], bx
    jmp L69815
L697c1::
    mov ebx, dword ptr [Dc9c30]
    add ebx, dword ptr [Dc9c3c]
    mov bx, word ptr [ebx+0ah]
    mov word ptr [eax+edi*1+0ah], bx
    jmp L69815
L697d8::
    push ecx
    xor ecx, ecx
    mov cl, byte ptr [eax+edi*1+0bh]
    mov ebx, dword ptr [ecx*4+Dc9cdc]
    mov cl, byte ptr [eax+edi*1+0ah]
    add ebx, dword ptr [ecx*4+Dca0dc]
    mov ebx, dword ptr [ebx*4+Dca4dc]
    mov cl, byte ptr [edx+02bh]
    call dword ptr [ecx*4+colour_ops-0b0h*4]
    mov word ptr [eax+edi*1+0ah], bx
    pop ecx
    jmp L69815
L6980a::
    mov ebx, dword ptr [Dc9cc4]
    xor word ptr [eax+edi*1+0ah], bx
L69815::
    test byte ptr [edx+02ah], 040h
    je L5efad
L6981f::
    cmp byte ptr [edx+02ah], 043h
    jb L69843
    je L69891
    cmp byte ptr [edx+02ah], 07fh
    ja L6985c
    mov ebx, dword ptr [eax+edi*1+08h]
    and ebx, dword ptr [Dc9cc0]
    shr ebx, 1
    mov word ptr [eax+edi*1+08h], bx
    jmp L5efad
L69843::
    mov ebx, dword ptr [Dc9c30]
    add ebx, dword ptr [Dc9c3c]
    mov ebx, dword ptr [ebx+08h]
    mov word ptr [eax+edi*1+08h], bx
    jmp L5efad
L6985c::
    push ecx
    xor ecx, ecx
    mov cl, byte ptr [eax+edi*1+09h]
    mov ebx, dword ptr [ecx*4+Dc9cdc]
    mov cl, byte ptr [eax+edi*1+08h]
    add ebx, dword ptr [ecx*4+Dca0dc]
    mov ebx, dword ptr [ebx*4+Dca4dc]
    mov cl, byte ptr [edx+02ah]
    call dword ptr [ecx*4+colour_ops-0b0h*4]
    mov word ptr [eax+edi*1+08h], bx
    pop ecx
    jmp L5efad
L69891::
    mov ebx, dword ptr [Dc9cc4]
    xor word ptr [eax+edi*1+08h], bx
    jmp L5efad
L698a1::
    test byte ptr [edx+02dh], 040h
    je L69917
    cmp byte ptr [edx+02dh], 043h
    jb L698c4
    je L69903
    cmp byte ptr [edx+02dh], 07fh
    ja L698d4
    and ebx, dword ptr [Dc9cc0]
    shr ebx, 011h
    mov word ptr [edi+0eh], bx
    jmp L6990d
L698c4::
    mov ebx, dword ptr [Dc9c30]
    mov bx, word ptr [ebx+0eh]
    mov word ptr [edi+0eh], bx
    jmp L6990d
L698d4::
    push ecx
    xor ecx, ecx
    mov cl, byte ptr [edi+0fh]
    mov ebx, dword ptr [ecx*4+Dc9cdc]
    mov cl, byte ptr [edi+0eh]
    add ebx, dword ptr [ecx*4+Dca0dc]
    mov ebx, dword ptr [ebx*4+Dca4dc]
    mov cl, byte ptr [edx+02dh]
    call dword ptr [ecx*4+colour_ops-0b0h*4]
    mov word ptr [edi+0eh], bx
    pop ecx
    jmp L6990d
L69903::
    mov ebx, dword ptr [Dc9cc4]
    xor word ptr [edi+0eh], bx
L6990d::
    test byte ptr [edx+02ch], 040h
    je L5efc0
L69917::
    cmp byte ptr [edx+02ch], 043h
    jb L69939
    je L6997d
    cmp byte ptr [edx+02ch], 07fh
    ja L6994b
    mov ebx, dword ptr [edi+0ch]
    and ebx, dword ptr [Dc9cc0]
    shr ebx, 1
    mov word ptr [edi+0ch], bx
    jmp L5efc0
L69939::
    mov ebx, dword ptr [Dc9c30]
    mov ebx, dword ptr [ebx+0ch]
    mov word ptr [edi+0ch], bx
    jmp L5efc0
L6994b::
    push ecx
    xor ecx, ecx
    mov cl, byte ptr [edi+0dh]
    mov ebx, dword ptr [ecx*4+Dc9cdc]
    mov cl, byte ptr [edi+0ch]
    add ebx, dword ptr [ecx*4+Dca0dc]
    mov ebx, dword ptr [ebx*4+Dca4dc]
    mov cl, byte ptr [edx+02ch]
    call dword ptr [ecx*4+colour_ops-0b0h*4]
    mov word ptr [edi+0ch], bx
    pop ecx
    jmp L5efc0
L6997d::
    mov ebx, dword ptr [Dc9cc4]
    xor word ptr [edi+0ch], bx
    jmp L5efc0
L6998c::
    test byte ptr [edx+02fh], 040h
    je L69a0e
    cmp byte ptr [edx+02fh], 043h
    jb L699b0
    je L699f9
    cmp byte ptr [edx+02fh], 07fh
    ja L699c7
    and ebx, dword ptr [Dc9cc0]
    shr ebx, 011h
    mov word ptr [eax+edi*1+0eh], bx
    jmp L69a04
L699b0::
    mov ebx, dword ptr [Dc9c30]
    add ebx, dword ptr [Dc9c3c]
    mov bx, word ptr [ebx+0eh]
    mov word ptr [eax+edi*1+0eh], bx
    jmp L69a04
L699c7::
    push ecx
    xor ecx, ecx
    mov cl, byte ptr [eax+edi*1+0fh]
    mov ebx, dword ptr [ecx*4+Dc9cdc]
    mov cl, byte ptr [eax+edi*1+0eh]
    add ebx, dword ptr [ecx*4+Dca0dc]
    mov ebx, dword ptr [ebx*4+Dca4dc]
    mov cl, byte ptr [edx+02fh]
    call dword ptr [ecx*4+colour_ops-0b0h*4]
    mov word ptr [eax+edi*1+0eh], bx
    pop ecx
    jmp L69a04
L699f9::
    mov ebx, dword ptr [Dc9cc4]
    xor word ptr [eax+edi*1+0eh], bx
L69a04::
    test byte ptr [edx+02eh], 040h
    je L5efd4
L69a0e::
    cmp byte ptr [edx+02eh], 043h
    jb L69a32
    je L69a80
    cmp byte ptr [edx+02eh], 07fh
    ja L69a4b
    mov ebx, dword ptr [eax+edi*1+0ch]
    and ebx, dword ptr [Dc9cc0]
    shr ebx, 1
    mov word ptr [eax+edi*1+0ch], bx
    jmp L5efd4
L69a32::
    mov ebx, dword ptr [Dc9c30]
    add ebx, dword ptr [Dc9c3c]
    mov ebx, dword ptr [ebx+0ch]
    mov word ptr [eax+edi*1+0ch], bx
    jmp L5efd4
L69a4b::
    push ecx
    xor ecx, ecx
    mov cl, byte ptr [eax+edi*1+0dh]
    mov ebx, dword ptr [ecx*4+Dc9cdc]
    mov cl, byte ptr [eax+edi*1+0ch]
    add ebx, dword ptr [ecx*4+Dca0dc]
    mov ebx, dword ptr [ebx*4+Dca4dc]
    mov cl, byte ptr [edx+02eh]
    call dword ptr [ecx*4+colour_ops-0b0h*4]
    mov word ptr [eax+edi*1+0ch], bx
    pop ecx
    jmp L5efd4
L69a80::
    mov ebx, dword ptr [Dc9cc4]
    xor word ptr [eax+edi*1+0ch], bx
    jmp L5efd4
L69a90::
    test byte ptr [edx+031h], 040h
    je L69b06
    cmp byte ptr [edx+031h], 043h
    jb L69ab3
    je L69af2
    cmp byte ptr [edx+031h], 07fh
    ja L69ac3
    and ebx, dword ptr [Dc9cc0]
    shr ebx, 011h
    mov word ptr [edi+02h], bx
    jmp L69afc
L69ab3::
    mov ebx, dword ptr [Dc9c30]
    mov bx, word ptr [ebx+02h]
    mov word ptr [edi+02h], bx
    jmp L69afc
L69ac3::
    push ecx
    xor ecx, ecx
    mov cl, byte ptr [edi+03h]
    mov ebx, dword ptr [ecx*4+Dc9cdc]
    mov cl, byte ptr [edi+02h]
    add ebx, dword ptr [ecx*4+Dca0dc]
    mov ebx, dword ptr [ebx*4+Dca4dc]
    mov cl, byte ptr [edx+031h]
    call dword ptr [ecx*4+colour_ops-0b0h*4]
    mov word ptr [edi+02h], bx
    pop ecx
    jmp L69afc
L69af2::
    mov ebx, dword ptr [Dc9cc4]
    xor word ptr [edi+02h], bx
L69afc::
    test byte ptr [edx+030h], 040h
    je L5eff2
L69b06::
    cmp byte ptr [edx+030h], 043h
    jb L69b26
    je L69b66
    cmp byte ptr [edx+030h], 07fh
    ja L69b36
    mov ebx, dword ptr [edi]
    and ebx, dword ptr [Dc9cc0]
    shr ebx, 1
    mov word ptr [edi], bx
    jmp L5eff2
L69b26::
    mov ebx, dword ptr [Dc9c30]
    mov ebx, dword ptr [ebx]
    mov word ptr [edi], bx
    jmp L5eff2
L69b36::
    push ecx
    xor ecx, ecx
    mov cl, byte ptr [edi+01h]
    mov ebx, dword ptr [ecx*4+Dc9cdc]
    mov cl, byte ptr [edi]
    add ebx, dword ptr [ecx*4+Dca0dc]
    mov ebx, dword ptr [ebx*4+Dca4dc]
    mov cl, byte ptr [edx+030h]
    call dword ptr [ecx*4+colour_ops-0b0h*4]
    mov word ptr [edi], bx
    pop ecx
    jmp L5eff2
L69b66::
    mov ebx, dword ptr [Dc9cc4]
    xor word ptr [edi], bx
    jmp L5eff2
L69b74::
    test byte ptr [edx+033h], 040h
    je L69bf6
    cmp byte ptr [edx+033h], 043h
    jb L69b98
    je L69be1
    cmp byte ptr [edx+033h], 07fh
    ja L69baf
    and ebx, dword ptr [Dc9cc0]
    shr ebx, 011h
    mov word ptr [eax+edi*1+02h], bx
    jmp L69bec
L69b98::
    mov ebx, dword ptr [Dc9c30]
    add ebx, dword ptr [Dc9c3c]
    mov bx, word ptr [ebx+02h]
    mov word ptr [eax+edi*1+02h], bx
    jmp L69bec
L69baf::
    push ecx
    xor ecx, ecx
    mov cl, byte ptr [eax+edi*1+03h]
    mov ebx, dword ptr [ecx*4+Dc9cdc]
    mov cl, byte ptr [eax+edi*1+02h]
    add ebx, dword ptr [ecx*4+Dca0dc]
    mov ebx, dword ptr [ebx*4+Dca4dc]
    mov cl, byte ptr [edx+033h]
    call dword ptr [ecx*4+colour_ops-0b0h*4]
    mov word ptr [eax+edi*1+02h], bx
    pop ecx
    jmp L69bec
L69be1::
    mov ebx, dword ptr [Dc9cc4]
    xor word ptr [eax+edi*1+02h], bx
L69bec::
    test byte ptr [edx+032h], 040h
    je L5f005
L69bf6::
    cmp byte ptr [edx+032h], 043h
    jb L69c18
    je L69c62
    cmp byte ptr [edx+032h], 07fh
    ja L69c2f
    mov ebx, dword ptr [eax+edi*1]
    and ebx, dword ptr [Dc9cc0]
    shr ebx, 1
    mov word ptr [eax+edi*1], bx
    jmp L5f005
L69c18::
    mov ebx, dword ptr [Dc9c30]
    add ebx, dword ptr [Dc9c3c]
    mov ebx, dword ptr [ebx]
    mov word ptr [eax+edi*1], bx
    jmp L5f005
L69c2f::
    push ecx
    xor ecx, ecx
    mov cl, byte ptr [eax+edi*1+01h]
    mov ebx, dword ptr [ecx*4+Dc9cdc]
    mov cl, byte ptr [eax+edi*1]
    add ebx, dword ptr [ecx*4+Dca0dc]
    mov ebx, dword ptr [ebx*4+Dca4dc]
    mov cl, byte ptr [edx+032h]
    call dword ptr [ecx*4+colour_ops-0b0h*4]
    mov word ptr [eax+edi*1], bx
    pop ecx
    jmp L5f005
L69c62::
    mov ebx, dword ptr [Dc9cc4]
    xor word ptr [eax+edi*1], bx
    jmp L5f005
L69c71::
    test byte ptr [edx+035h], 040h
    je L69ce7
    cmp byte ptr [edx+035h], 043h
    jb L69c94
    je L69cd3
    cmp byte ptr [edx+035h], 07fh
    ja L69ca4
    and ebx, dword ptr [Dc9cc0]
    shr ebx, 011h
    mov word ptr [edi+06h], bx
    jmp L69cdd
L69c94::
    mov ebx, dword ptr [Dc9c30]
    mov bx, word ptr [ebx+06h]
    mov word ptr [edi+06h], bx
    jmp L69cdd
L69ca4::
    push ecx
    xor ecx, ecx
    mov cl, byte ptr [edi+07h]
    mov ebx, dword ptr [ecx*4+Dc9cdc]
    mov cl, byte ptr [edi+06h]
    add ebx, dword ptr [ecx*4+Dca0dc]
    mov ebx, dword ptr [ebx*4+Dca4dc]
    mov cl, byte ptr [edx+035h]
    call dword ptr [ecx*4+colour_ops-0b0h*4]
    mov word ptr [edi+06h], bx
    pop ecx
    jmp L69cdd
L69cd3::
    mov ebx, dword ptr [Dc9cc4]
    xor word ptr [edi+06h], bx
L69cdd::
    test byte ptr [edx+034h], 040h
    je L5f018
L69ce7::
    cmp byte ptr [edx+034h], 043h
    jb L69d09
    je L69d4d
    cmp byte ptr [edx+034h], 07fh
    ja L69d1b
    mov ebx, dword ptr [edi+04h]
    and ebx, dword ptr [Dc9cc0]
    shr ebx, 1
    mov word ptr [edi+04h], bx
    jmp L5f018
L69d09::
    mov ebx, dword ptr [Dc9c30]
    mov ebx, dword ptr [ebx+04h]
    mov word ptr [edi+04h], bx
    jmp L5f018
L69d1b::
    push ecx
    xor ecx, ecx
    mov cl, byte ptr [edi+05h]
    mov ebx, dword ptr [ecx*4+Dc9cdc]
    mov cl, byte ptr [edi+04h]
    add ebx, dword ptr [ecx*4+Dca0dc]
    mov ebx, dword ptr [ebx*4+Dca4dc]
    mov cl, byte ptr [edx+034h]
    call dword ptr [ecx*4+colour_ops-0b0h*4]
    mov word ptr [edi+04h], bx
    pop ecx
    jmp L5f018
L69d4d::
    mov ebx, dword ptr [Dc9cc4]
    xor word ptr [edi+04h], bx
    jmp L5f018
L69d5c::
    test byte ptr [edx+037h], 040h
    je L69dde
    cmp byte ptr [edx+037h], 043h
    jb L69d80
    je L69dc9
    cmp byte ptr [edx+037h], 07fh
    ja L69d97
    and ebx, dword ptr [Dc9cc0]
    shr ebx, 011h
    mov word ptr [eax+edi*1+06h], bx
    jmp L69dd4
L69d80::
    mov ebx, dword ptr [Dc9c30]
    add ebx, dword ptr [Dc9c3c]
    mov bx, word ptr [ebx+06h]
    mov word ptr [eax+edi*1+06h], bx
    jmp L69dd4
L69d97::
    push ecx
    xor ecx, ecx
    mov cl, byte ptr [eax+edi*1+07h]
    mov ebx, dword ptr [ecx*4+Dc9cdc]
    mov cl, byte ptr [eax+edi*1+06h]
    add ebx, dword ptr [ecx*4+Dca0dc]
    mov ebx, dword ptr [ebx*4+Dca4dc]
    mov cl, byte ptr [edx+037h]
    call dword ptr [ecx*4+colour_ops-0b0h*4]
    mov word ptr [eax+edi*1+06h], bx
    pop ecx
    jmp L69dd4
L69dc9::
    mov ebx, dword ptr [Dc9cc4]
    xor word ptr [eax+edi*1+06h], bx
L69dd4::
    test byte ptr [edx+036h], 040h
    je L5f02c
L69dde::
    cmp byte ptr [edx+036h], 043h
    jb L69e02
    je L69e50
    cmp byte ptr [edx+036h], 07fh
    ja L69e1b
    mov ebx, dword ptr [eax+edi*1+04h]
    and ebx, dword ptr [Dc9cc0]
    shr ebx, 1
    mov word ptr [eax+edi*1+04h], bx
    jmp L5f02c
L69e02::
    mov ebx, dword ptr [Dc9c30]
    add ebx, dword ptr [Dc9c3c]
    mov ebx, dword ptr [ebx+04h]
    mov word ptr [eax+edi*1+04h], bx
    jmp L5f02c
L69e1b::
    push ecx
    xor ecx, ecx
    mov cl, byte ptr [eax+edi*1+05h]
    mov ebx, dword ptr [ecx*4+Dc9cdc]
    mov cl, byte ptr [eax+edi*1+04h]
    add ebx, dword ptr [ecx*4+Dca0dc]
    mov ebx, dword ptr [ebx*4+Dca4dc]
    mov cl, byte ptr [edx+036h]
    call dword ptr [ecx*4+colour_ops-0b0h*4]
    mov word ptr [eax+edi*1+04h], bx
    pop ecx
    jmp L5f02c
L69e50::
    mov ebx, dword ptr [Dc9cc4]
    xor word ptr [eax+edi*1+04h], bx
    jmp L5f02c
L69e60::
    test byte ptr [edx+039h], 040h
    je L69ed6
    cmp byte ptr [edx+039h], 043h
    jb L69e83
    je L69ec2
    cmp byte ptr [edx+039h], 07fh
    ja L69e93
    and ebx, dword ptr [Dc9cc0]
    shr ebx, 011h
    mov word ptr [edi+0ah], bx
    jmp L69ecc
L69e83::
    mov ebx, dword ptr [Dc9c30]
    mov bx, word ptr [ebx+0ah]
    mov word ptr [edi+0ah], bx
    jmp L69ecc
L69e93::
    push ecx
    xor ecx, ecx
    mov cl, byte ptr [edi+0bh]
    mov ebx, dword ptr [ecx*4+Dc9cdc]
    mov cl, byte ptr [edi+0ah]
    add ebx, dword ptr [ecx*4+Dca0dc]
    mov ebx, dword ptr [ebx*4+Dca4dc]
    mov cl, byte ptr [edx+039h]
    call dword ptr [ecx*4+colour_ops-0b0h*4]
    mov word ptr [edi+0ah], bx
    pop ecx
    jmp L69ecc
L69ec2::
    mov ebx, dword ptr [Dc9cc4]
    xor word ptr [edi+0ah], bx
L69ecc::
    test byte ptr [edx+038h], 040h
    je L5f03f
L69ed6::
    cmp byte ptr [edx+038h], 043h
    jb L69ef8
    je L69f3c
    cmp byte ptr [edx+038h], 07fh
    ja L69f0a
    mov ebx, dword ptr [edi+08h]
    and ebx, dword ptr [Dc9cc0]
    shr ebx, 1
    mov word ptr [edi+08h], bx
    jmp L5f03f
L69ef8::
    mov ebx, dword ptr [Dc9c30]
    mov ebx, dword ptr [ebx+08h]
    mov word ptr [edi+08h], bx
    jmp L5f03f
L69f0a::
    push ecx
    xor ecx, ecx
    mov cl, byte ptr [edi+09h]
    mov ebx, dword ptr [ecx*4+Dc9cdc]
    mov cl, byte ptr [edi+08h]
    add ebx, dword ptr [ecx*4+Dca0dc]
    mov ebx, dword ptr [ebx*4+Dca4dc]
    mov cl, byte ptr [edx+038h]
    call dword ptr [ecx*4+colour_ops-0b0h*4]
    mov word ptr [edi+08h], bx
    pop ecx
    jmp L5f03f
L69f3c::
    mov ebx, dword ptr [Dc9cc4]
    xor word ptr [edi+08h], bx
    jmp L5f03f
L69f4b::
    test byte ptr [edx+03bh], 040h
    je L69fcd
    cmp byte ptr [edx+03bh], 043h
    jb L69f6f
    je L69fb8
    cmp byte ptr [edx+03bh], 07fh
    ja L69f86
    and ebx, dword ptr [Dc9cc0]
    shr ebx, 011h
    mov word ptr [eax+edi*1+0ah], bx
    jmp L69fc3
L69f6f::
    mov ebx, dword ptr [Dc9c30]
    add ebx, dword ptr [Dc9c3c]
    mov bx, word ptr [ebx+0ah]
    mov word ptr [eax+edi*1+0ah], bx
    jmp L69fc3
L69f86::
    push ecx
    xor ecx, ecx
    mov cl, byte ptr [eax+edi*1+0bh]
    mov ebx, dword ptr [ecx*4+Dc9cdc]
    mov cl, byte ptr [eax+edi*1+0ah]
    add ebx, dword ptr [ecx*4+Dca0dc]
    mov ebx, dword ptr [ebx*4+Dca4dc]
    mov cl, byte ptr [edx+03bh]
    call dword ptr [ecx*4+colour_ops-0b0h*4]
    mov word ptr [eax+edi*1+0ah], bx
    pop ecx
    jmp L69fc3
L69fb8::
    mov ebx, dword ptr [Dc9cc4]
    xor word ptr [eax+edi*1+0ah], bx
L69fc3::
    test byte ptr [edx+03ah], 040h
    je L5f053
L69fcd::
    cmp byte ptr [edx+03ah], 043h
    jb L69ff1
    je L6a03f
    cmp byte ptr [edx+03ah], 07fh
    ja L6a00a
    mov ebx, dword ptr [eax+edi*1+08h]
    and ebx, dword ptr [Dc9cc0]
    shr ebx, 1
    mov word ptr [eax+edi*1+08h], bx
    jmp L5f053
L69ff1::
    mov ebx, dword ptr [Dc9c30]
    add ebx, dword ptr [Dc9c3c]
    mov ebx, dword ptr [ebx+08h]
    mov word ptr [eax+edi*1+08h], bx
    jmp L5f053
L6a00a::
    push ecx
    xor ecx, ecx
    mov cl, byte ptr [eax+edi*1+09h]
    mov ebx, dword ptr [ecx*4+Dc9cdc]
    mov cl, byte ptr [eax+edi*1+08h]
    add ebx, dword ptr [ecx*4+Dca0dc]
    mov ebx, dword ptr [ebx*4+Dca4dc]
    mov cl, byte ptr [edx+03ah]
    call dword ptr [ecx*4+colour_ops-0b0h*4]
    mov word ptr [eax+edi*1+08h], bx
    pop ecx
    jmp L5f053
L6a03f::
    mov ebx, dword ptr [Dc9cc4]
    xor word ptr [eax+edi*1+08h], bx
    jmp L5f053
L6a04f::
    test byte ptr [edx+03dh], 040h
    je L6a0c5
    cmp byte ptr [edx+03dh], 043h
    jb L6a072
    je L6a0b1
    cmp byte ptr [edx+03dh], 07fh
    ja L6a082
    and ebx, dword ptr [Dc9cc0]
    shr ebx, 011h
    mov word ptr [edi+0eh], bx
    jmp L6a0bb
L6a072::
    mov ebx, dword ptr [Dc9c30]
    mov bx, word ptr [ebx+0eh]
    mov word ptr [edi+0eh], bx
    jmp L6a0bb
L6a082::
    push ecx
    xor ecx, ecx
    mov cl, byte ptr [edi+0fh]
    mov ebx, dword ptr [ecx*4+Dc9cdc]
    mov cl, byte ptr [edi+0eh]
    add ebx, dword ptr [ecx*4+Dca0dc]
    mov ebx, dword ptr [ebx*4+Dca4dc]
    mov cl, byte ptr [edx+03dh]
    call dword ptr [ecx*4+colour_ops-0b0h*4]
    mov word ptr [edi+0eh], bx
    pop ecx
    jmp L6a0bb
L6a0b1::
    mov ebx, dword ptr [Dc9cc4]
    xor word ptr [edi+0eh], bx
L6a0bb::
    test byte ptr [edx+03ch], 040h
    je L5f066
L6a0c5::
    cmp byte ptr [edx+03ch], 043h
    jb L6a0e7
    je L6a12b
    cmp byte ptr [edx+03ch], 07fh
    ja L6a0f9
    mov ebx, dword ptr [edi+0ch]
    and ebx, dword ptr [Dc9cc0]
    shr ebx, 1
    mov word ptr [edi+0ch], bx
    jmp L5f066
L6a0e7::
    mov ebx, dword ptr [Dc9c30]
    mov ebx, dword ptr [ebx+0ch]
    mov word ptr [edi+0ch], bx
    jmp L5f066
L6a0f9::
    push ecx
    xor ecx, ecx
    mov cl, byte ptr [edi+0dh]
    mov ebx, dword ptr [ecx*4+Dc9cdc]
    mov cl, byte ptr [edi+0ch]
    add ebx, dword ptr [ecx*4+Dca0dc]
    mov ebx, dword ptr [ebx*4+Dca4dc]
    mov cl, byte ptr [edx+03ch]
    call dword ptr [ecx*4+colour_ops-0b0h*4]
    mov word ptr [edi+0ch], bx
    pop ecx
    jmp L5f066
L6a12b::
    mov ebx, dword ptr [Dc9cc4]
    xor word ptr [edi+0ch], bx
    jmp L5f066
L6a13a::
    test byte ptr [edx+03fh], 040h
    je L6a1bc
    cmp byte ptr [edx+03fh], 043h
    jb L6a15e
    je L6a1a7
    cmp byte ptr [edx+03fh], 07fh
    ja L6a175
    and ebx, dword ptr [Dc9cc0]
    shr ebx, 011h
    mov word ptr [eax+edi*1+0eh], bx
    jmp L6a1b2
L6a15e::
    mov ebx, dword ptr [Dc9c30]
    add ebx, dword ptr [Dc9c3c]
    mov bx, word ptr [ebx+0eh]
    mov word ptr [eax+edi*1+0eh], bx
    jmp L6a1b2
L6a175::
    push ecx
    xor ecx, ecx
    mov cl, byte ptr [eax+edi*1+0fh]
    mov ebx, dword ptr [ecx*4+Dc9cdc]
    mov cl, byte ptr [eax+edi*1+0eh]
    add ebx, dword ptr [ecx*4+Dca0dc]
    mov ebx, dword ptr [ebx*4+Dca4dc]
    mov cl, byte ptr [edx+03fh]
    call dword ptr [ecx*4+colour_ops-0b0h*4]
    mov word ptr [eax+edi*1+0eh], bx
    pop ecx
    jmp L6a1b2
L6a1a7::
    mov ebx, dword ptr [Dc9cc4]
    xor word ptr [eax+edi*1+0eh], bx
L6a1b2::
    test byte ptr [edx+03eh], 040h
    je L5f07a
L6a1bc::
    cmp byte ptr [edx+03eh], 043h
    jb L6a1e0
    je L6a22e
    cmp byte ptr [edx+03eh], 07fh
    ja L6a1f9
    mov ebx, dword ptr [eax+edi*1+0ch]
    and ebx, dword ptr [Dc9cc0]
    shr ebx, 1
    mov word ptr [eax+edi*1+0ch], bx
    jmp L5f07a
L6a1e0::
    mov ebx, dword ptr [Dc9c30]
    add ebx, dword ptr [Dc9c3c]
    mov ebx, dword ptr [ebx+0ch]
    mov word ptr [eax+edi*1+0ch], bx
    jmp L5f07a
L6a1f9::
    push ecx
    xor ecx, ecx
    mov cl, byte ptr [eax+edi*1+0dh]
    mov ebx, dword ptr [ecx*4+Dc9cdc]
    mov cl, byte ptr [eax+edi*1+0ch]
    add ebx, dword ptr [ecx*4+Dca0dc]
    mov ebx, dword ptr [ebx*4+Dca4dc]
    mov cl, byte ptr [edx+03eh]
    call dword ptr [ecx*4+colour_ops-0b0h*4]
    mov word ptr [eax+edi*1+0ch], bx
    pop ecx
    jmp L5f07a
L6a22e::
    mov ebx, dword ptr [Dc9cc4]
    xor word ptr [eax+edi*1+0ch], bx
    jmp L5f07a
L6a23e::
    test byte ptr [Dc9b1d], 040h
    je L6a2d2
    cmp byte ptr [Dc9b1d], 043h
    jb L6a2c1
    je L6a2ab
    cmp byte ptr [Dc9b1d], 07fh
    ja L6a270
    push ebp
    and ebp, dword ptr [Dc9cc0]
    shr ebp, 011h
    mov word ptr [edi+02h], bp
    pop ebp
    jmp L6a2c1
L6a270::
    push esi
    push ecx
    mov ecx, ebp
    shr ecx, 018h
    mov esi, dword ptr [ecx*4+Dc9cdc]
    shld ecx, ebp, 010h
    and ecx, 0ffh
    add esi, dword ptr [ecx*4+Dca0dc]
    mov esi, dword ptr [esi*4+Dca4dc]
    mov cl, byte ptr [Dc9b1d]
    call dword ptr [ecx*4+colour_ops-0c0h*4]
    mov word ptr [edi+02h], si
    pop ecx
    pop esi
    jmp L6a2c1
L6a2ab::
    ror ebp, 010h
    xor ebp, dword ptr [Dc9cc4]
    mov word ptr [edi+02h], bp
    xor ebp, dword ptr [Dc9cc4]
    ror ebp, 010h
L6a2c1::
    test byte ptr [Dc9b1c], 040h
    jne L6a2dc
    mov word ptr [edi], bp
    jmp L61448
L6a2d2::
    ror ebp, 010h
    mov word ptr [edi+02h], bp
    ror ebp, 010h
L6a2dc::
    cmp byte ptr [Dc9b1c], 043h
    jb L61448
    je L6a346
    cmp byte ptr [Dc9b1c], 07fh
    ja L6a306
    push ebp
    and ebp, dword ptr [Dc9cc0]
    shr ebp, 1
    mov word ptr [edi], bp
    pop ebp
    jmp L61448
L6a306::
    push esi
    push ecx
    shld ecx, ebp, 018h
    and ecx, 0ffh
    mov esi, dword ptr [ecx*4+Dc9cdc]
    mov ecx, ebp
    and ecx, 0ffh
    add esi, dword ptr [ecx*4+Dca0dc]
    mov esi, dword ptr [esi*4+Dca4dc]
    mov cl, byte ptr [Dc9b1c]
    call dword ptr [ecx*4+colour_ops-0c0h*4]
    mov word ptr [edi], si
    pop ecx
    pop esi
    jmp L61448
L6a346::
    xor ebp, dword ptr [Dc9cc4]
    mov word ptr [edi], bp
    xor ebp, dword ptr [Dc9cc4]
    jmp L61448
L6a35a::
    test byte ptr [Dc9b1f], 040h
    je L6a3f2
    cmp byte ptr [Dc9b1f], 043h
    jb L6a3e0
    je L6a3c9
    cmp byte ptr [Dc9b1f], 07fh
    ja L6a38d
    push ebx
    and ebx, dword ptr [Dc9cc0]
    shr ebx, 011h
    mov word ptr [edx+edi*1+02h], bx
    pop ebx
    jmp L6a3e0
L6a38d::
    push esi
    push ecx
    mov ecx, ebx
    shr ecx, 018h
    mov esi, dword ptr [ecx*4+Dc9cdc]
    shld ecx, ebx, 010h
    and ecx, 0ffh
    add esi, dword ptr [ecx*4+Dca0dc]
    mov esi, dword ptr [esi*4+Dca4dc]
    mov cl, byte ptr [Dc9b1f]
    call dword ptr [ecx*4+colour_ops-0c0h*4]
    mov word ptr [edx+edi*1+02h], si
    pop ecx
    pop esi
    jmp L6a3e0
L6a3c9::
    ror ebx, 010h
    xor ebx, dword ptr [Dc9cc4]
    mov word ptr [edx+edi*1+02h], bx
    xor ebx, dword ptr [Dc9cc4]
    ror ebx, 010h
L6a3e0::
    test byte ptr [Dc9b1e], 040h
    jne L6a3fd
    mov word ptr [edx+edi*1], bx
    jmp L61461
L6a3f2::
    ror ebx, 010h
    mov word ptr [edx+edi*1+02h], bx
    ror ebx, 010h
L6a3fd::
    cmp byte ptr [Dc9b1e], 043h
    jb L61461
    je L6a469
    cmp byte ptr [Dc9b1e], 07fh
    ja L6a428
    push ebx
    and ebx, dword ptr [Dc9cc0]
    shr ebx, 1
    mov word ptr [edx+edi*1], bx
    pop ebx
    jmp L61461
L6a428::
    push esi
    push ecx
    shld ecx, ebx, 018h
    and ecx, 0ffh
    mov esi, dword ptr [ecx*4+Dc9cdc]
    mov ecx, ebx
    and ecx, 0ffh
    add esi, dword ptr [ecx*4+Dca0dc]
    mov esi, dword ptr [esi*4+Dca4dc]
    mov cl, byte ptr [Dc9b1e]
    call dword ptr [ecx*4+colour_ops-0c0h*4]
    mov word ptr [edx+edi*1], si
    pop ecx
    pop esi
    jmp L61461
L6a469::
    xor ebx, dword ptr [Dc9cc4]
    mov word ptr [edx+edi*1], bx
    xor ebx, dword ptr [Dc9cc4]
    jmp L61461
L6a47e::
    test byte ptr [Dc9b21], 040h
    je L6a513
    cmp byte ptr [Dc9b21], 043h
    jb L6a501
    je L6a4eb
    cmp byte ptr [Dc9b21], 07fh
    ja L6a4b0
    push ebp
    and ebp, dword ptr [Dc9cc0]
    shr ebp, 011h
    mov word ptr [edi+06h], bp
    pop ebp
    jmp L6a501
L6a4b0::
    push esi
    push ecx
    mov ecx, ebp
    shr ecx, 018h
    mov esi, dword ptr [ecx*4+Dc9cdc]
    shld ecx, ebp, 010h
    and ecx, 0ffh
    add esi, dword ptr [ecx*4+Dca0dc]
    mov esi, dword ptr [esi*4+Dca4dc]
    mov cl, byte ptr [Dc9b21]
    call dword ptr [ecx*4+colour_ops-0c0h*4]
    mov word ptr [edi+06h], si
    pop ecx
    pop esi
    jmp L6a501
L6a4eb::
    ror ebp, 010h
    xor ebp, dword ptr [Dc9cc4]
    mov word ptr [edi+06h], bp
    xor ebp, dword ptr [Dc9cc4]
    ror ebp, 010h
L6a501::
    test byte ptr [Dc9b20], 040h
    jne L6a51d
    mov word ptr [edi+04h], bp
    jmp L61482
L6a513::
    ror ebp, 010h
    mov word ptr [edi+06h], bp
    ror ebp, 010h
L6a51d::
    cmp byte ptr [Dc9b20], 043h
    jb L61482
    je L6a589
    cmp byte ptr [Dc9b20], 07fh
    ja L6a548
    push ebp
    and ebp, dword ptr [Dc9cc0]
    shr ebp, 1
    mov word ptr [edi+04h], bp
    pop ebp
    jmp L61482
L6a548::
    push esi
    push ecx
    shld ecx, ebp, 018h
    and ecx, 0ffh
    mov esi, dword ptr [ecx*4+Dc9cdc]
    mov ecx, ebp
    and ecx, 0ffh
    add esi, dword ptr [ecx*4+Dca0dc]
    mov esi, dword ptr [esi*4+Dca4dc]
    mov cl, byte ptr [Dc9b20]
    call dword ptr [ecx*4+colour_ops-0c0h*4]
    mov word ptr [edi+04h], si
    pop ecx
    pop esi
    jmp L61482
L6a589::
    xor ebp, dword ptr [Dc9cc4]
    mov word ptr [edi+04h], bp
    xor ebp, dword ptr [Dc9cc4]
    jmp L61482
L6a59e::
    test byte ptr [Dc9b23], 040h
    je L6a637
    cmp byte ptr [Dc9b23], 043h
    jb L6a624
    je L6a60d
    cmp byte ptr [Dc9b23], 07fh
    ja L6a5d1
    push ebx
    and ebx, dword ptr [Dc9cc0]
    shr ebx, 011h
    mov word ptr [edx+edi*1+06h], bx
    pop ebx
    jmp L6a624
L6a5d1::
    push esi
    push ecx
    mov ecx, ebx
    shr ecx, 018h
    mov esi, dword ptr [ecx*4+Dc9cdc]
    shld ecx, ebx, 010h
    and ecx, 0ffh
    add esi, dword ptr [ecx*4+Dca0dc]
    mov esi, dword ptr [esi*4+Dca4dc]
    mov cl, byte ptr [Dc9b23]
    call dword ptr [ecx*4+colour_ops-0c0h*4]
    mov word ptr [edx+edi*1+06h], si
    pop ecx
    pop esi
    jmp L6a624
L6a60d::
    ror ebx, 010h
    xor ebx, dword ptr [Dc9cc4]
    mov word ptr [edx+edi*1+06h], bx
    xor ebx, dword ptr [Dc9cc4]
    ror ebx, 010h
L6a624::
    test byte ptr [Dc9b22], 040h
    jne L6a642
    mov word ptr [edx+edi*1+04h], bx
    jmp L6149c
L6a637::
    ror ebx, 010h
    mov word ptr [edx+edi*1+06h], bx
    ror ebx, 010h
L6a642::
    cmp byte ptr [Dc9b22], 043h
    jb L6149c
    je L6a6b0
    cmp byte ptr [Dc9b22], 07fh
    ja L6a66e
    push ebx
    and ebx, dword ptr [Dc9cc0]
    shr ebx, 1
    mov word ptr [edx+edi*1+04h], bx
    pop ebx
    jmp L6149c
L6a66e::
    push esi
    push ecx
    shld ecx, ebx, 018h
    and ecx, 0ffh
    mov esi, dword ptr [ecx*4+Dc9cdc]
    mov ecx, ebx
    and ecx, 0ffh
    add esi, dword ptr [ecx*4+Dca0dc]
    mov esi, dword ptr [esi*4+Dca4dc]
    mov cl, byte ptr [Dc9b22]
    call dword ptr [ecx*4+colour_ops-0c0h*4]
    mov word ptr [edx+edi*1+04h], si
    pop ecx
    pop esi
    jmp L6149c
L6a6b0::
    xor ebx, dword ptr [Dc9cc4]
    mov word ptr [edx+edi*1+04h], bx
    xor ebx, dword ptr [Dc9cc4]
    jmp L6149c
L6a6c6::
    test byte ptr [Dc9b25], 040h
    je L6a75b
    cmp byte ptr [Dc9b25], 043h
    jb L6a749
    je L6a733
    cmp byte ptr [Dc9b25], 07fh
    ja L6a6f8
    push ebp
    and ebp, dword ptr [Dc9cc0]
    shr ebp, 011h
    mov word ptr [edi+0ah], bp
    pop ebp
    jmp L6a749
L6a6f8::
    push esi
    push ecx
    mov ecx, ebp
    shr ecx, 018h
    mov esi, dword ptr [ecx*4+Dc9cdc]
    shld ecx, ebp, 010h
    and ecx, 0ffh
    add esi, dword ptr [ecx*4+Dca0dc]
    mov esi, dword ptr [esi*4+Dca4dc]
    mov cl, byte ptr [Dc9b25]
    call dword ptr [ecx*4+colour_ops-0c0h*4]
    mov word ptr [edi+0ah], si
    pop ecx
    pop esi
    jmp L6a749
L6a733::
    ror ebp, 010h
    xor ebp, dword ptr [Dc9cc4]
    mov word ptr [edi+0ah], bp
    xor ebp, dword ptr [Dc9cc4]
    ror ebp, 010h
L6a749::
    test byte ptr [Dc9b24], 040h
    jne L6a765
    mov word ptr [edi+08h], bp
    jmp L614bd
L6a75b::
    ror ebp, 010h
    mov word ptr [edi+0ah], bp
    ror ebp, 010h
L6a765::
    cmp byte ptr [Dc9b24], 043h
    jb L614bd
    je L6a7d1
    cmp byte ptr [Dc9b24], 07fh
    ja L6a790
    push ebp
    and ebp, dword ptr [Dc9cc0]
    shr ebp, 1
    mov word ptr [edi+08h], bp
    pop ebp
    jmp L614bd
L6a790::
    push esi
    push ecx
    shld ecx, ebp, 018h
    and ecx, 0ffh
    mov esi, dword ptr [ecx*4+Dc9cdc]
    mov ecx, ebp
    and ecx, 0ffh
    add esi, dword ptr [ecx*4+Dca0dc]
    mov esi, dword ptr [esi*4+Dca4dc]
    mov cl, byte ptr [Dc9b24]
    call dword ptr [ecx*4+colour_ops-0c0h*4]
    mov word ptr [edi+08h], si
    pop ecx
    pop esi
    jmp L614bd
L6a7d1::
    xor ebp, dword ptr [Dc9cc4]
    mov word ptr [edi+08h], bp
    xor ebp, dword ptr [Dc9cc4]
    jmp L614bd
L6a7e6::
    test byte ptr [Dc9b27], 040h
    je L6a87f
    cmp byte ptr [Dc9b27], 043h
    jb L6a86c
    je L6a855
    cmp byte ptr [Dc9b27], 07fh
    ja L6a819
    push ebx
    and ebx, dword ptr [Dc9cc0]
    shr ebx, 011h
    mov word ptr [edx+edi*1+0ah], bx
    pop ebx
    jmp L6a86c
L6a819::
    push esi
    push ecx
    mov ecx, ebx
    shr ecx, 018h
    mov esi, dword ptr [ecx*4+Dc9cdc]
    shld ecx, ebx, 010h
    and ecx, 0ffh
    add esi, dword ptr [ecx*4+Dca0dc]
    mov esi, dword ptr [esi*4+Dca4dc]
    mov cl, byte ptr [Dc9b27]
    call dword ptr [ecx*4+colour_ops-0c0h*4]
    mov word ptr [edx+edi*1+0ah], si
    pop ecx
    pop esi
    jmp L6a86c
L6a855::
    ror ebx, 010h
    xor ebx, dword ptr [Dc9cc4]
    mov word ptr [edx+edi*1+0ah], bx
    xor ebx, dword ptr [Dc9cc4]
    ror ebx, 010h
L6a86c::
    test byte ptr [Dc9b26], 040h
    jne L6a88a
    mov word ptr [edx+edi*1+08h], bx
    jmp L614d7
L6a87f::
    ror ebx, 010h
    mov word ptr [edx+edi*1+0ah], bx
    ror ebx, 010h
L6a88a::
    cmp byte ptr [Dc9b26], 043h
    jb L614d7
    je L6a8f8
    cmp byte ptr [Dc9b26], 07fh
    ja L6a8b6
    push ebx
    and ebx, dword ptr [Dc9cc0]
    shr ebx, 1
    mov word ptr [edx+edi*1+08h], bx
    pop ebx
    jmp L614d7
L6a8b6::
    push esi
    push ecx
    shld ecx, ebx, 018h
    and ecx, 0ffh
    mov esi, dword ptr [ecx*4+Dc9cdc]
    mov ecx, ebx
    and ecx, 0ffh
    add esi, dword ptr [ecx*4+Dca0dc]
    mov esi, dword ptr [esi*4+Dca4dc]
    mov cl, byte ptr [Dc9b26]
    call dword ptr [ecx*4+colour_ops-0c0h*4]
    mov word ptr [edx+edi*1+08h], si
    pop ecx
    pop esi
    jmp L614d7
L6a8f8::
    xor ebx, dword ptr [Dc9cc4]
    mov word ptr [edx+edi*1+08h], bx
    xor ebx, dword ptr [Dc9cc4]
    jmp L614d7
L6a90e::
    test byte ptr [Dc9b29], 040h
    je L6a9a3
    cmp byte ptr [Dc9b29], 043h
    jb L6a991
    je L6a97b
    cmp byte ptr [Dc9b29], 07fh
    ja L6a940
    push ebp
    and ebp, dword ptr [Dc9cc0]
    shr ebp, 011h
    mov word ptr [edi+0eh], bp
    pop ebp
    jmp L6a991
L6a940::
    push esi
    push ecx
    mov ecx, ebp
    shr ecx, 018h
    mov esi, dword ptr [ecx*4+Dc9cdc]
    shld ecx, ebp, 010h
    and ecx, 0ffh
    add esi, dword ptr [ecx*4+Dca0dc]
    mov esi, dword ptr [esi*4+Dca4dc]
    mov cl, byte ptr [Dc9b29]
    call dword ptr [ecx*4+colour_ops-0c0h*4]
    mov word ptr [edi+0eh], si
    pop ecx
    pop esi
    jmp L6a991
L6a97b::
    ror ebp, 010h
    xor ebp, dword ptr [Dc9cc4]
    mov word ptr [edi+0eh], bp
    xor ebp, dword ptr [Dc9cc4]
    ror ebp, 010h
L6a991::
    test byte ptr [Dc9b28], 040h
    jne L6a9ad
    mov word ptr [edi+0ch], bp
    jmp L614f8
L6a9a3::
    ror ebp, 010h
    mov word ptr [edi+0eh], bp
    ror ebp, 010h
L6a9ad::
    cmp byte ptr [Dc9b28], 043h
    jb L614f8
    je L6aa19
    cmp byte ptr [Dc9b28], 07fh
    ja L6a9d8
    push ebp
    and ebp, dword ptr [Dc9cc0]
    shr ebp, 1
    mov word ptr [edi+0ch], bp
    pop ebp
    jmp L614f8
L6a9d8::
    push esi
    push ecx
    shld ecx, ebp, 018h
    and ecx, 0ffh
    mov esi, dword ptr [ecx*4+Dc9cdc]
    mov ecx, ebp
    and ecx, 0ffh
    add esi, dword ptr [ecx*4+Dca0dc]
    mov esi, dword ptr [esi*4+Dca4dc]
    mov cl, byte ptr [Dc9b28]
    call dword ptr [ecx*4+colour_ops-0c0h*4]
    mov word ptr [edi+0ch], si
    pop ecx
    pop esi
    jmp L614f8
L6aa19::
    xor ebp, dword ptr [Dc9cc4]
    mov word ptr [edi+0ch], bp
    xor ebp, dword ptr [Dc9cc4]
    jmp L614f8
L6aa2e::
    test byte ptr [Dc9b2b], 040h
    je L6aac7
    cmp byte ptr [Dc9b2b], 043h
    jb L6aab4
    je L6aa9d
    cmp byte ptr [Dc9b2b], 07fh
    ja L6aa61
    push ebx
    and ebx, dword ptr [Dc9cc0]
    shr ebx, 011h
    mov word ptr [edx+edi*1+0eh], bx
    pop ebx
    jmp L6aab4
L6aa61::
    push esi
    push ecx
    mov ecx, ebx
    shr ecx, 018h
    mov esi, dword ptr [ecx*4+Dc9cdc]
    shld ecx, ebx, 010h
    and ecx, 0ffh
    add esi, dword ptr [ecx*4+Dca0dc]
    mov esi, dword ptr [esi*4+Dca4dc]
    mov cl, byte ptr [Dc9b2b]
    call dword ptr [ecx*4+colour_ops-0c0h*4]
    mov word ptr [edx+edi*1+0eh], si
    pop ecx
    pop esi
    jmp L6aab4
L6aa9d::
    ror ebx, 010h
    xor ebx, dword ptr [Dc9cc4]
    mov word ptr [edx+edi*1+0eh], bx
    xor ebx, dword ptr [Dc9cc4]
    ror ebx, 010h
L6aab4::
    test byte ptr [Dc9b2a], 040h
    jne L6aad2
    mov word ptr [edx+edi*1+0ch], bx
    jmp L61512
L6aac7::
    ror ebx, 010h
    mov word ptr [edx+edi*1+0eh], bx
    ror ebx, 010h
L6aad2::
    cmp byte ptr [Dc9b2a], 043h
    jb L61512
    je L6ab40
    cmp byte ptr [Dc9b2a], 07fh
    ja L6aafe
    push ebx
    and ebx, dword ptr [Dc9cc0]
    shr ebx, 1
    mov word ptr [edx+edi*1+0ch], bx
    pop ebx
    jmp L61512
L6aafe::
    push esi
    push ecx
    shld ecx, ebx, 018h
    and ecx, 0ffh
    mov esi, dword ptr [ecx*4+Dc9cdc]
    mov ecx, ebx
    and ecx, 0ffh
    add esi, dword ptr [ecx*4+Dca0dc]
    mov esi, dword ptr [esi*4+Dca4dc]
    mov cl, byte ptr [Dc9b2a]
    call dword ptr [ecx*4+colour_ops-0c0h*4]
    mov word ptr [edx+edi*1+0ch], si
    pop ecx
    pop esi
    jmp L61512
L6ab40::
    xor ebx, dword ptr [Dc9cc4]
    mov word ptr [edx+edi*1+0ch], bx
    xor ebx, dword ptr [Dc9cc4]
    jmp L61512
L6ab56::
    test byte ptr [Dc9b2d], 040h
    je L6abea
    cmp byte ptr [Dc9b2d], 043h
    jb L6abd9
    je L6abc3
    cmp byte ptr [Dc9b2d], 07fh
    ja L6ab88
    push ebp
    and ebp, dword ptr [Dc9cc0]
    shr ebp, 011h
    mov word ptr [edi+02h], bp
    pop ebp
    jmp L6abd9
L6ab88::
    push esi
    push ecx
    mov ecx, ebp
    shr ecx, 018h
    mov esi, dword ptr [ecx*4+Dc9cdc]
    shld ecx, ebp, 010h
    and ecx, 0ffh
    add esi, dword ptr [ecx*4+Dca0dc]
    mov esi, dword ptr [esi*4+Dca4dc]
    mov cl, byte ptr [Dc9b2d]
    call dword ptr [ecx*4+colour_ops-0c0h*4]
    mov word ptr [edi+02h], si
    pop ecx
    pop esi
    jmp L6abd9
L6abc3::
    ror ebp, 010h
    xor ebp, dword ptr [Dc9cc4]
    mov word ptr [edi+02h], bp
    xor ebp, dword ptr [Dc9cc4]
    ror ebp, 010h
L6abd9::
    test byte ptr [Dc9b2c], 040h
    jne L6abf4
    mov word ptr [edi], bp
    jmp L61538
L6abea::
    ror ebp, 010h
    mov word ptr [edi+02h], bp
    ror ebp, 010h
L6abf4::
    cmp byte ptr [Dc9b2c], 043h
    jb L61538
    je L6ac5e
    cmp byte ptr [Dc9b2c], 07fh
    ja L6ac1e
    push ebp
    and ebp, dword ptr [Dc9cc0]
    shr ebp, 1
    mov word ptr [edi], bp
    pop ebp
    jmp L61538
L6ac1e::
    push esi
    push ecx
    shld ecx, ebp, 018h
    and ecx, 0ffh
    mov esi, dword ptr [ecx*4+Dc9cdc]
    mov ecx, ebp
    and ecx, 0ffh
    add esi, dword ptr [ecx*4+Dca0dc]
    mov esi, dword ptr [esi*4+Dca4dc]
    mov cl, byte ptr [Dc9b2c]
    call dword ptr [ecx*4+colour_ops-0c0h*4]
    mov word ptr [edi], si
    pop ecx
    pop esi
    jmp L61538
L6ac5e::
    xor ebp, dword ptr [Dc9cc4]
    mov word ptr [edi], bp
    xor ebp, dword ptr [Dc9cc4]
    jmp L61538
L6ac72::
    test byte ptr [Dc9b2f], 040h
    je L6ad0a
    cmp byte ptr [Dc9b2f], 043h
    jb L6acf8
    je L6ace1
    cmp byte ptr [Dc9b2f], 07fh
    ja L6aca5
    push ebx
    and ebx, dword ptr [Dc9cc0]
    shr ebx, 011h
    mov word ptr [edx+edi*1+02h], bx
    pop ebx
    jmp L6acf8
L6aca5::
    push esi
    push ecx
    mov ecx, ebx
    shr ecx, 018h
    mov esi, dword ptr [ecx*4+Dc9cdc]
    shld ecx, ebx, 010h
    and ecx, 0ffh
    add esi, dword ptr [ecx*4+Dca0dc]
    mov esi, dword ptr [esi*4+Dca4dc]
    mov cl, byte ptr [Dc9b2f]
    call dword ptr [ecx*4+colour_ops-0c0h*4]
    mov word ptr [edx+edi*1+02h], si
    pop ecx
    pop esi
    jmp L6acf8
L6ace1::
    ror ebx, 010h
    xor ebx, dword ptr [Dc9cc4]
    mov word ptr [edx+edi*1+02h], bx
    xor ebx, dword ptr [Dc9cc4]
    ror ebx, 010h
L6acf8::
    test byte ptr [Dc9b2e], 040h
    jne L6ad15
    mov word ptr [edx+edi*1], bx
    jmp L61551
L6ad0a::
    ror ebx, 010h
    mov word ptr [edx+edi*1+02h], bx
    ror ebx, 010h
L6ad15::
    cmp byte ptr [Dc9b2e], 043h
    jb L61551
    je L6ad81
    cmp byte ptr [Dc9b2e], 07fh
    ja L6ad40
    push ebx
    and ebx, dword ptr [Dc9cc0]
    shr ebx, 1
    mov word ptr [edx+edi*1], bx
    pop ebx
    jmp L61551
L6ad40::
    push esi
    push ecx
    shld ecx, ebx, 018h
    and ecx, 0ffh
    mov esi, dword ptr [ecx*4+Dc9cdc]
    mov ecx, ebx
    and ecx, 0ffh
    add esi, dword ptr [ecx*4+Dca0dc]
    mov esi, dword ptr [esi*4+Dca4dc]
    mov cl, byte ptr [Dc9b2e]
    call dword ptr [ecx*4+colour_ops-0c0h*4]
    mov word ptr [edx+edi*1], si
    pop ecx
    pop esi
    jmp L61551
L6ad81::
    xor ebx, dword ptr [Dc9cc4]
    mov word ptr [edx+edi*1], bx
    xor ebx, dword ptr [Dc9cc4]
    jmp L61551
L6ad96::
    test byte ptr [Dc9b31], 040h
    je L6ae2b
    cmp byte ptr [Dc9b31], 043h
    jb L6ae19
    je L6ae03
    cmp byte ptr [Dc9b31], 07fh
    ja L6adc8
    push ebp
    and ebp, dword ptr [Dc9cc0]
    shr ebp, 011h
    mov word ptr [edi+06h], bp
    pop ebp
    jmp L6ae19
L6adc8::
    push esi
    push ecx
    mov ecx, ebp
    shr ecx, 018h
    mov esi, dword ptr [ecx*4+Dc9cdc]
    shld ecx, ebp, 010h
    and ecx, 0ffh
    add esi, dword ptr [ecx*4+Dca0dc]
    mov esi, dword ptr [esi*4+Dca4dc]
    mov cl, byte ptr [Dc9b31]
    call dword ptr [ecx*4+colour_ops-0c0h*4]
    mov word ptr [edi+06h], si
    pop ecx
    pop esi
    jmp L6ae19
L6ae03::
    ror ebp, 010h
    xor ebp, dword ptr [Dc9cc4]
    mov word ptr [edi+06h], bp
    xor ebp, dword ptr [Dc9cc4]
    ror ebp, 010h
L6ae19::
    test byte ptr [Dc9b30], 040h
    jne L6ae35
    mov word ptr [edi+04h], bp
    jmp L61572
L6ae2b::
    ror ebp, 010h
    mov word ptr [edi+06h], bp
    ror ebp, 010h
L6ae35::
    cmp byte ptr [Dc9b30], 043h
    jb L61572
    je L6aea1
    cmp byte ptr [Dc9b30], 07fh
    ja L6ae60
    push ebp
    and ebp, dword ptr [Dc9cc0]
    shr ebp, 1
    mov word ptr [edi+04h], bp
    pop ebp
    jmp L61572
L6ae60::
    push esi
    push ecx
    shld ecx, ebp, 018h
    and ecx, 0ffh
    mov esi, dword ptr [ecx*4+Dc9cdc]
    mov ecx, ebp
    and ecx, 0ffh
    add esi, dword ptr [ecx*4+Dca0dc]
    mov esi, dword ptr [esi*4+Dca4dc]
    mov cl, byte ptr [Dc9b30]
    call dword ptr [ecx*4+colour_ops-0c0h*4]
    mov word ptr [edi+04h], si
    pop ecx
    pop esi
    jmp L61572
L6aea1::
    xor ebp, dword ptr [Dc9cc4]
    mov word ptr [edi+04h], bp
    xor ebp, dword ptr [Dc9cc4]
    jmp L61572
L6aeb6::
    test byte ptr [Dc9b33], 040h
    je L6af4f
    cmp byte ptr [Dc9b33], 043h
    jb L6af3c
    je L6af25
    cmp byte ptr [Dc9b33], 07fh
    ja L6aee9
    push ebx
    and ebx, dword ptr [Dc9cc0]
    shr ebx, 011h
    mov word ptr [edx+edi*1+06h], bx
    pop ebx
    jmp L6af3c
L6aee9::
    push esi
    push ecx
    mov ecx, ebx
    shr ecx, 018h
    mov esi, dword ptr [ecx*4+Dc9cdc]
    shld ecx, ebx, 010h
    and ecx, 0ffh
    add esi, dword ptr [ecx*4+Dca0dc]
    mov esi, dword ptr [esi*4+Dca4dc]
    mov cl, byte ptr [Dc9b33]
    call dword ptr [ecx*4+colour_ops-0c0h*4]
    mov word ptr [edx+edi*1+06h], si
    pop ecx
    pop esi
    jmp L6af3c
L6af25::
    ror ebx, 010h
    xor ebx, dword ptr [Dc9cc4]
    mov word ptr [edx+edi*1+06h], bx
    xor ebx, dword ptr [Dc9cc4]
    ror ebx, 010h
L6af3c::
    test byte ptr [Dc9b32], 040h
    jne L6af5a
    mov word ptr [edx+edi*1+04h], bx
    jmp L6158c
L6af4f::
    ror ebx, 010h
    mov word ptr [edx+edi*1+06h], bx
    ror ebx, 010h
L6af5a::
    cmp byte ptr [Dc9b32], 043h
    jb L6158c
    je L6afc8
    cmp byte ptr [Dc9b32], 07fh
    ja L6af86
    push ebx
    and ebx, dword ptr [Dc9cc0]
    shr ebx, 1
    mov word ptr [edx+edi*1+04h], bx
    pop ebx
    jmp L6158c
L6af86::
    push esi
    push ecx
    shld ecx, ebx, 018h
    and ecx, 0ffh
    mov esi, dword ptr [ecx*4+Dc9cdc]
    mov ecx, ebx
    and ecx, 0ffh
    add esi, dword ptr [ecx*4+Dca0dc]
    mov esi, dword ptr [esi*4+Dca4dc]
    mov cl, byte ptr [Dc9b32]
    call dword ptr [ecx*4+colour_ops-0c0h*4]
    mov word ptr [edx+edi*1+04h], si
    pop ecx
    pop esi
    jmp L6158c
L6afc8::
    xor ebx, dword ptr [Dc9cc4]
    mov word ptr [edx+edi*1+04h], bx
    xor ebx, dword ptr [Dc9cc4]
    jmp L6158c
L6afde::
    test byte ptr [Dc9b35], 040h
    je L6b073
    cmp byte ptr [Dc9b35], 043h
    jb L6b061
    je L6b04b
    cmp byte ptr [Dc9b35], 07fh
    ja L6b010
    push ebp
    and ebp, dword ptr [Dc9cc0]
    shr ebp, 011h
    mov word ptr [edi+0ah], bp
    pop ebp
    jmp L6b061
L6b010::
    push esi
    push ecx
    mov ecx, ebp
    shr ecx, 018h
    mov esi, dword ptr [ecx*4+Dc9cdc]
    shld ecx, ebp, 010h
    and ecx, 0ffh
    add esi, dword ptr [ecx*4+Dca0dc]
    mov esi, dword ptr [esi*4+Dca4dc]
    mov cl, byte ptr [Dc9b35]
    call dword ptr [ecx*4+colour_ops-0c0h*4]
    mov word ptr [edi+0ah], si
    pop ecx
    pop esi
    jmp L6b061
L6b04b::
    ror ebp, 010h
    xor ebp, dword ptr [Dc9cc4]
    mov word ptr [edi+0ah], bp
    xor ebp, dword ptr [Dc9cc4]
    ror ebp, 010h
L6b061::
    test byte ptr [Dc9b34], 040h
    jne L6b07d
    mov word ptr [edi+08h], bp
    jmp L615ad
L6b073::
    ror ebp, 010h
    mov word ptr [edi+0ah], bp
    ror ebp, 010h
L6b07d::
    cmp byte ptr [Dc9b34], 043h
    jb L615ad
    je L6b0e9
    cmp byte ptr [Dc9b34], 07fh
    ja L6b0a8
    push ebp
    and ebp, dword ptr [Dc9cc0]
    shr ebp, 1
    mov word ptr [edi+08h], bp
    pop ebp
    jmp L615ad
L6b0a8::
    push esi
    push ecx
    shld ecx, ebp, 018h
    and ecx, 0ffh
    mov esi, dword ptr [ecx*4+Dc9cdc]
    mov ecx, ebp
    and ecx, 0ffh
    add esi, dword ptr [ecx*4+Dca0dc]
    mov esi, dword ptr [esi*4+Dca4dc]
    mov cl, byte ptr [Dc9b34]
    call dword ptr [ecx*4+colour_ops-0c0h*4]
    mov word ptr [edi+08h], si
    pop ecx
    pop esi
    jmp L615ad
L6b0e9::
    xor ebp, dword ptr [Dc9cc4]
    mov word ptr [edi+08h], bp
    xor ebp, dword ptr [Dc9cc4]
    jmp L615ad
L6b0fe::
    test byte ptr [Dc9b37], 040h
    je L6b197
    cmp byte ptr [Dc9b37], 043h
    jb L6b184
    je L6b16d
    cmp byte ptr [Dc9b37], 07fh
    ja L6b131
    push ebx
    and ebx, dword ptr [Dc9cc0]
    shr ebx, 011h
    mov word ptr [edx+edi*1+0ah], bx
    pop ebx
    jmp L6b184
L6b131::
    push esi
    push ecx
    mov ecx, ebx
    shr ecx, 018h
    mov esi, dword ptr [ecx*4+Dc9cdc]
    shld ecx, ebx, 010h
    and ecx, 0ffh
    add esi, dword ptr [ecx*4+Dca0dc]
    mov esi, dword ptr [esi*4+Dca4dc]
    mov cl, byte ptr [Dc9b37]
    call dword ptr [ecx*4+colour_ops-0c0h*4]
    mov word ptr [edx+edi*1+0ah], si
    pop ecx
    pop esi
    jmp L6b184
L6b16d::
    ror ebx, 010h
    xor ebx, dword ptr [Dc9cc4]
    mov word ptr [edx+edi*1+0ah], bx
    xor ebx, dword ptr [Dc9cc4]
    ror ebx, 010h
L6b184::
    test byte ptr [Dc9b36], 040h
    jne L6b1a2
    mov word ptr [edx+edi*1+08h], bx
    jmp L615c7
L6b197::
    ror ebx, 010h
    mov word ptr [edx+edi*1+0ah], bx
    ror ebx, 010h
L6b1a2::
    cmp byte ptr [Dc9b36], 043h
    jb L615c7
    je L6b210
    cmp byte ptr [Dc9b36], 07fh
    ja L6b1ce
    push ebx
    and ebx, dword ptr [Dc9cc0]
    shr ebx, 1
    mov word ptr [edx+edi*1+08h], bx
    pop ebx
    jmp L615c7
L6b1ce::
    push esi
    push ecx
    shld ecx, ebx, 018h
    and ecx, 0ffh
    mov esi, dword ptr [ecx*4+Dc9cdc]
    mov ecx, ebx
    and ecx, 0ffh
    add esi, dword ptr [ecx*4+Dca0dc]
    mov esi, dword ptr [esi*4+Dca4dc]
    mov cl, byte ptr [Dc9b36]
    call dword ptr [ecx*4+colour_ops-0c0h*4]
    mov word ptr [edx+edi*1+08h], si
    pop ecx
    pop esi
    jmp L615c7
L6b210::
    xor ebx, dword ptr [Dc9cc4]
    mov word ptr [edx+edi*1+08h], bx
    xor ebx, dword ptr [Dc9cc4]
    jmp L615c7
L6b226::
    test byte ptr [Dc9b39], 040h
    je L6b2bb
    cmp byte ptr [Dc9b39], 043h
    jb L6b2a9
    je L6b293
    cmp byte ptr [Dc9b39], 07fh
    ja L6b258
    push ebp
    and ebp, dword ptr [Dc9cc0]
    shr ebp, 011h
    mov word ptr [edi+0eh], bp
    pop ebp
    jmp L6b2a9
L6b258::
    push esi
    push ecx
    mov ecx, ebp
    shr ecx, 018h
    mov esi, dword ptr [ecx*4+Dc9cdc]
    shld ecx, ebp, 010h
    and ecx, 0ffh
    add esi, dword ptr [ecx*4+Dca0dc]
    mov esi, dword ptr [esi*4+Dca4dc]
    mov cl, byte ptr [Dc9b39]
    call dword ptr [ecx*4+colour_ops-0c0h*4]
    mov word ptr [edi+0eh], si
    pop ecx
    pop esi
    jmp L6b2a9
L6b293::
    ror ebp, 010h
    xor ebp, dword ptr [Dc9cc4]
    mov word ptr [edi+0eh], bp
    xor ebp, dword ptr [Dc9cc4]
    ror ebp, 010h
L6b2a9::
    test byte ptr [Dc9b38], 040h
    jne L6b2c5
    mov word ptr [edi+0ch], bp
    jmp L615e8
L6b2bb::
    ror ebp, 010h
    mov word ptr [edi+0eh], bp
    ror ebp, 010h
L6b2c5::
    cmp byte ptr [Dc9b38], 043h
    jb L615e8
    je L6b331
    cmp byte ptr [Dc9b38], 07fh
    ja L6b2f0
    push ebp
    and ebp, dword ptr [Dc9cc0]
    shr ebp, 1
    mov word ptr [edi+0ch], bp
    pop ebp
    jmp L615e8
L6b2f0::
    push esi
    push ecx
    shld ecx, ebp, 018h
    and ecx, 0ffh
    mov esi, dword ptr [ecx*4+Dc9cdc]
    mov ecx, ebp
    and ecx, 0ffh
    add esi, dword ptr [ecx*4+Dca0dc]
    mov esi, dword ptr [esi*4+Dca4dc]
    mov cl, byte ptr [Dc9b38]
    call dword ptr [ecx*4+colour_ops-0c0h*4]
    mov word ptr [edi+0ch], si
    pop ecx
    pop esi
    jmp L615e8
L6b331::
    xor ebp, dword ptr [Dc9cc4]
    mov word ptr [edi+0ch], bp
    xor ebp, dword ptr [Dc9cc4]
    jmp L615e8
L6b346::
    test byte ptr [Dc9b3b], 040h
    je L6b3df
    cmp byte ptr [Dc9b3b], 043h
    jb L6b3cc
    je L6b3b5
    cmp byte ptr [Dc9b3b], 07fh
    ja L6b379
    push ebx
    and ebx, dword ptr [Dc9cc0]
    shr ebx, 011h
    mov word ptr [edx+edi*1+0eh], bx
    pop ebx
    jmp L6b3cc
L6b379::
    push esi
    push ecx
    mov ecx, ebx
    shr ecx, 018h
    mov esi, dword ptr [ecx*4+Dc9cdc]
    shld ecx, ebx, 010h
    and ecx, 0ffh
    add esi, dword ptr [ecx*4+Dca0dc]
    mov esi, dword ptr [esi*4+Dca4dc]
    mov cl, byte ptr [Dc9b3b]
    call dword ptr [ecx*4+colour_ops-0c0h*4]
    mov word ptr [edx+edi*1+0eh], si
    pop ecx
    pop esi
    jmp L6b3cc
L6b3b5::
    ror ebx, 010h
    xor ebx, dword ptr [Dc9cc4]
    mov word ptr [edx+edi*1+0eh], bx
    xor ebx, dword ptr [Dc9cc4]
    ror ebx, 010h
L6b3cc::
    test byte ptr [Dc9b3a], 040h
    jne L6b3ea
    mov word ptr [edx+edi*1+0ch], bx
    jmp L61602
L6b3df::
    ror ebx, 010h
    mov word ptr [edx+edi*1+0eh], bx
    ror ebx, 010h
L6b3ea::
    cmp byte ptr [Dc9b3a], 043h
    jb L61602
    je L6b458
    cmp byte ptr [Dc9b3a], 07fh
    ja L6b416
    push ebx
    and ebx, dword ptr [Dc9cc0]
    shr ebx, 1
    mov word ptr [edx+edi*1+0ch], bx
    pop ebx
    jmp L61602
L6b416::
    push esi
    push ecx
    shld ecx, ebx, 018h
    and ecx, 0ffh
    mov esi, dword ptr [ecx*4+Dc9cdc]
    mov ecx, ebx
    and ecx, 0ffh
    add esi, dword ptr [ecx*4+Dca0dc]
    mov esi, dword ptr [esi*4+Dca4dc]
    mov cl, byte ptr [Dc9b3a]
    call dword ptr [ecx*4+colour_ops-0c0h*4]
    mov word ptr [edx+edi*1+0ch], si
    pop ecx
    pop esi
    jmp L61602
L6b458::
    xor ebx, dword ptr [Dc9cc4]
    mov word ptr [edx+edi*1+0ch], bx
    xor ebx, dword ptr [Dc9cc4]
    jmp L61602
L6b46e::
    test byte ptr [Dc9b3d], 040h
    je L6b502
    cmp byte ptr [Dc9b3d], 043h
    jb L6b4f1
    je L6b4db
    cmp byte ptr [Dc9b3d], 07fh
    ja L6b4a0
    push ebp
    and ebp, dword ptr [Dc9cc0]
    shr ebp, 011h
    mov word ptr [edi+02h], bp
    pop ebp
    jmp L6b4f1
L6b4a0::
    push esi
    push ecx
    mov ecx, ebp
    shr ecx, 018h
    mov esi, dword ptr [ecx*4+Dc9cdc]
    shld ecx, ebp, 010h
    and ecx, 0ffh
    add esi, dword ptr [ecx*4+Dca0dc]
    mov esi, dword ptr [esi*4+Dca4dc]
    mov cl, byte ptr [Dc9b3d]
    call dword ptr [ecx*4+colour_ops-0c0h*4]
    mov word ptr [edi+02h], si
    pop ecx
    pop esi
    jmp L6b4f1
L6b4db::
    ror ebp, 010h
    xor ebp, dword ptr [Dc9cc4]
    mov word ptr [edi+02h], bp
    xor ebp, dword ptr [Dc9cc4]
    ror ebp, 010h
L6b4f1::
    test byte ptr [Dc9b3c], 040h
    jne L6b50c
    mov word ptr [edi], bp
    jmp L61629
L6b502::
    ror ebp, 010h
    mov word ptr [edi+02h], bp
    ror ebp, 010h
L6b50c::
    cmp byte ptr [Dc9b3c], 043h
    jb L61629
    je L6b576
    cmp byte ptr [Dc9b3c], 07fh
    ja L6b536
    push ebp
    and ebp, dword ptr [Dc9cc0]
    shr ebp, 1
    mov word ptr [edi], bp
    pop ebp
    jmp L61629
L6b536::
    push esi
    push ecx
    shld ecx, ebp, 018h
    and ecx, 0ffh
    mov esi, dword ptr [ecx*4+Dc9cdc]
    mov ecx, ebp
    and ecx, 0ffh
    add esi, dword ptr [ecx*4+Dca0dc]
    mov esi, dword ptr [esi*4+Dca4dc]
    mov cl, byte ptr [Dc9b3c]
    call dword ptr [ecx*4+colour_ops-0c0h*4]
    mov word ptr [edi], si
    pop ecx
    pop esi
    jmp L61629
L6b576::
    xor ebp, dword ptr [Dc9cc4]
    mov word ptr [edi], bp
    xor ebp, dword ptr [Dc9cc4]
    jmp L61629
L6b58a::
    test byte ptr [Dc9b3f], 040h
    je L6b622
    cmp byte ptr [Dc9b3f], 043h
    jb L6b610
    je L6b5f9
    cmp byte ptr [Dc9b3f], 07fh
    ja L6b5bd
    push ebx
    and ebx, dword ptr [Dc9cc0]
    shr ebx, 011h
    mov word ptr [edx+edi*1+02h], bx
    pop ebx
    jmp L6b610
L6b5bd::
    push esi
    push ecx
    mov ecx, ebx
    shr ecx, 018h
    mov esi, dword ptr [ecx*4+Dc9cdc]
    shld ecx, ebx, 010h
    and ecx, 0ffh
    add esi, dword ptr [ecx*4+Dca0dc]
    mov esi, dword ptr [esi*4+Dca4dc]
    mov cl, byte ptr [Dc9b3f]
    call dword ptr [ecx*4+colour_ops-0c0h*4]
    mov word ptr [edx+edi*1+02h], si
    pop ecx
    pop esi
    jmp L6b610
L6b5f9::
    ror ebx, 010h
    xor ebx, dword ptr [Dc9cc4]
    mov word ptr [edx+edi*1+02h], bx
    xor ebx, dword ptr [Dc9cc4]
    ror ebx, 010h
L6b610::
    test byte ptr [colour_op], 040h
    jne L6b62d
    mov word ptr [edx+edi*1], bx
    jmp L61642
L6b622::
    ror ebx, 010h
    mov word ptr [edx+edi*1+02h], bx
    ror ebx, 010h
L6b62d::
    cmp byte ptr [colour_op], 043h
    jb L61642
    je L6b699
    cmp byte ptr [colour_op], 07fh
    ja L6b658
    push ebx
    and ebx, dword ptr [Dc9cc0]
    shr ebx, 1
    mov word ptr [edx+edi*1], bx
    pop ebx
    jmp L61642
L6b658::
    push esi
    push ecx
    shld ecx, ebx, 018h
    and ecx, 0ffh
    mov esi, dword ptr [ecx*4+Dc9cdc]
    mov ecx, ebx
    and ecx, 0ffh
    add esi, dword ptr [ecx*4+Dca0dc]
    mov esi, dword ptr [esi*4+Dca4dc]
    mov cl, byte ptr [colour_op]
    call dword ptr [ecx*4+colour_ops-0c0h*4]
    mov word ptr [edx+edi*1], si
    pop ecx
    pop esi
    jmp L61642
L6b699::
    xor ebx, dword ptr [Dc9cc4]
    mov word ptr [edx+edi*1], bx
    xor ebx, dword ptr [Dc9cc4]
    jmp L61642
L6b6ae::
    test byte ptr [Dc9b41], 040h
    je L6b743
    cmp byte ptr [Dc9b41], 043h
    jb L6b731
    je L6b71b
    cmp byte ptr [Dc9b41], 07fh
    ja L6b6e0
    push ebp
    and ebp, dword ptr [Dc9cc0]
    shr ebp, 011h
    mov word ptr [edi+06h], bp
    pop ebp
    jmp L6b731
L6b6e0::
    push esi
    push ecx
    mov ecx, ebp
    shr ecx, 018h
    mov esi, dword ptr [ecx*4+Dc9cdc]
    shld ecx, ebp, 010h
    and ecx, 0ffh
    add esi, dword ptr [ecx*4+Dca0dc]
    mov esi, dword ptr [esi*4+Dca4dc]
    mov cl, byte ptr [Dc9b41]
    call dword ptr [ecx*4+colour_ops-0c0h*4]
    mov word ptr [edi+06h], si
    pop ecx
    pop esi
    jmp L6b731
L6b71b::
    ror ebp, 010h
    xor ebp, dword ptr [Dc9cc4]
    mov word ptr [edi+06h], bp
    xor ebp, dword ptr [Dc9cc4]
    ror ebp, 010h
L6b731::
    test byte ptr [Dc9b40], 040h
    jne L6b74d
    mov word ptr [edi+04h], bp
    jmp L61664
L6b743::
    ror ebp, 010h
    mov word ptr [edi+06h], bp
    ror ebp, 010h
L6b74d::
    cmp byte ptr [Dc9b40], 043h
    jb L61664
    je L6b7b9
    cmp byte ptr [Dc9b40], 07fh
    ja L6b778
    push ebp
    and ebp, dword ptr [Dc9cc0]
    shr ebp, 1
    mov word ptr [edi+04h], bp
    pop ebp
    jmp L61664
L6b778::
    push esi
    push ecx
    shld ecx, ebp, 018h
    and ecx, 0ffh
    mov esi, dword ptr [ecx*4+Dc9cdc]
    mov ecx, ebp
    and ecx, 0ffh
    add esi, dword ptr [ecx*4+Dca0dc]
    mov esi, dword ptr [esi*4+Dca4dc]
    mov cl, byte ptr [Dc9b40]
    call dword ptr [ecx*4+colour_ops-0c0h*4]
    mov word ptr [edi+04h], si
    pop ecx
    pop esi
    jmp L61664
L6b7b9::
    xor ebp, dword ptr [Dc9cc4]
    mov word ptr [edi+04h], bp
    xor ebp, dword ptr [Dc9cc4]
    jmp L61664
L6b7ce::
    test byte ptr [Dc9b43], 040h
    je L6b867
    cmp byte ptr [Dc9b43], 043h
    jb L6b854
    je L6b83d
    cmp byte ptr [Dc9b43], 07fh
    ja L6b801
    push ebx
    and ebx, dword ptr [Dc9cc0]
    shr ebx, 011h
    mov word ptr [edx+edi*1+06h], bx
    pop ebx
    jmp L6b854
L6b801::
    push esi
    push ecx
    mov ecx, ebx
    shr ecx, 018h
    mov esi, dword ptr [ecx*4+Dc9cdc]
    shld ecx, ebx, 010h
    and ecx, 0ffh
    add esi, dword ptr [ecx*4+Dca0dc]
    mov esi, dword ptr [esi*4+Dca4dc]
    mov cl, byte ptr [Dc9b43]
    call dword ptr [ecx*4+colour_ops-0c0h*4]
    mov word ptr [edx+edi*1+06h], si
    pop ecx
    pop esi
    jmp L6b854
L6b83d::
    ror ebx, 010h
    xor ebx, dword ptr [Dc9cc4]
    mov word ptr [edx+edi*1+06h], bx
    xor ebx, dword ptr [Dc9cc4]
    ror ebx, 010h
L6b854::
    test byte ptr [Dc9b42], 040h
    jne L6b872
    mov word ptr [edx+edi*1+04h], bx
    jmp L6167e
L6b867::
    ror ebx, 010h
    mov word ptr [edx+edi*1+06h], bx
    ror ebx, 010h
L6b872::
    cmp byte ptr [Dc9b42], 043h
    jb L6167e
    je L6b8e0
    cmp byte ptr [Dc9b42], 07fh
    ja L6b89e
    push ebx
    and ebx, dword ptr [Dc9cc0]
    shr ebx, 1
    mov word ptr [edx+edi*1+04h], bx
    pop ebx
    jmp L6167e
L6b89e::
    push esi
    push ecx
    shld ecx, ebx, 018h
    and ecx, 0ffh
    mov esi, dword ptr [ecx*4+Dc9cdc]
    mov ecx, ebx
    and ecx, 0ffh
    add esi, dword ptr [ecx*4+Dca0dc]
    mov esi, dword ptr [esi*4+Dca4dc]
    mov cl, byte ptr [Dc9b42]
    call dword ptr [ecx*4+colour_ops-0c0h*4]
    mov word ptr [edx+edi*1+04h], si
    pop ecx
    pop esi
    jmp L6167e
L6b8e0::
    xor ebx, dword ptr [Dc9cc4]
    mov word ptr [edx+edi*1+04h], bx
    xor ebx, dword ptr [Dc9cc4]
    jmp L6167e
L6b8f6::
    test byte ptr [Dc9b45], 040h
    je L6b98b
    cmp byte ptr [Dc9b45], 043h
    jb L6b979
    je L6b963
    cmp byte ptr [Dc9b45], 07fh
    ja L6b928
    push ebp
    and ebp, dword ptr [Dc9cc0]
    shr ebp, 011h
    mov word ptr [edi+0ah], bp
    pop ebp
    jmp L6b979
L6b928::
    push esi
    push ecx
    mov ecx, ebp
    shr ecx, 018h
    mov esi, dword ptr [ecx*4+Dc9cdc]
    shld ecx, ebp, 010h
    and ecx, 0ffh
    add esi, dword ptr [ecx*4+Dca0dc]
    mov esi, dword ptr [esi*4+Dca4dc]
    mov cl, byte ptr [Dc9b45]
    call dword ptr [ecx*4+colour_ops-0c0h*4]
    mov word ptr [edi+0ah], si
    pop ecx
    pop esi
    jmp L6b979
L6b963::
    ror ebp, 010h
    xor ebp, dword ptr [Dc9cc4]
    mov word ptr [edi+0ah], bp
    xor ebp, dword ptr [Dc9cc4]
    ror ebp, 010h
L6b979::
    test byte ptr [Dc9b44], 040h
    jne L6b995
    mov word ptr [edi+08h], bp
    jmp L616a0
L6b98b::
    ror ebp, 010h
    mov word ptr [edi+0ah], bp
    ror ebp, 010h
L6b995::
    cmp byte ptr [Dc9b44], 043h
    jb L616a0
    je L6ba01
    cmp byte ptr [Dc9b44], 07fh
    ja L6b9c0
    push ebp
    and ebp, dword ptr [Dc9cc0]
    shr ebp, 1
    mov word ptr [edi+08h], bp
    pop ebp
    jmp L616a0
L6b9c0::
    push esi
    push ecx
    shld ecx, ebp, 018h
    and ecx, 0ffh
    mov esi, dword ptr [ecx*4+Dc9cdc]
    mov ecx, ebp
    and ecx, 0ffh
    add esi, dword ptr [ecx*4+Dca0dc]
    mov esi, dword ptr [esi*4+Dca4dc]
    mov cl, byte ptr [Dc9b44]
    call dword ptr [ecx*4+colour_ops-0c0h*4]
    mov word ptr [edi+08h], si
    pop ecx
    pop esi
    jmp L616a0
L6ba01::
    xor ebp, dword ptr [Dc9cc4]
    mov word ptr [edi+08h], bp
    xor ebp, dword ptr [Dc9cc4]
    jmp L616a0
L6ba16::
    test byte ptr [Dc9b47], 040h
    je L6baaf
    cmp byte ptr [Dc9b47], 043h
    jb L6ba9c
    je L6ba85
    cmp byte ptr [Dc9b47], 07fh
    ja L6ba49
    push ebx
    and ebx, dword ptr [Dc9cc0]
    shr ebx, 011h
    mov word ptr [edx+edi*1+0ah], bx
    pop ebx
    jmp L6ba9c
L6ba49::
    push esi
    push ecx
    mov ecx, ebx
    shr ecx, 018h
    mov esi, dword ptr [ecx*4+Dc9cdc]
    shld ecx, ebx, 010h
    and ecx, 0ffh
    add esi, dword ptr [ecx*4+Dca0dc]
    mov esi, dword ptr [esi*4+Dca4dc]
    mov cl, byte ptr [Dc9b47]
    call dword ptr [ecx*4+colour_ops-0c0h*4]
    mov word ptr [edx+edi*1+0ah], si
    pop ecx
    pop esi
    jmp L6ba9c
L6ba85::
    ror ebx, 010h
    xor ebx, dword ptr [Dc9cc4]
    mov word ptr [edx+edi*1+0ah], bx
    xor ebx, dword ptr [Dc9cc4]
    ror ebx, 010h
L6ba9c::
    test byte ptr [Dc9b46], 040h
    jne L6baba
    mov word ptr [edx+edi*1+08h], bx
    jmp L616ba
L6baaf::
    ror ebx, 010h
    mov word ptr [edx+edi*1+0ah], bx
    ror ebx, 010h
L6baba::
    cmp byte ptr [Dc9b46], 043h
    jb L616ba
    je L6bb28
    cmp byte ptr [Dc9b46], 07fh
    ja L6bae6
    push ebx
    and ebx, dword ptr [Dc9cc0]
    shr ebx, 1
    mov word ptr [edx+edi*1+08h], bx
    pop ebx
    jmp L616ba
L6bae6::
    push esi
    push ecx
    shld ecx, ebx, 018h
    and ecx, 0ffh
    mov esi, dword ptr [ecx*4+Dc9cdc]
    mov ecx, ebx
    and ecx, 0ffh
    add esi, dword ptr [ecx*4+Dca0dc]
    mov esi, dword ptr [esi*4+Dca4dc]
    mov cl, byte ptr [Dc9b46]
    call dword ptr [ecx*4+colour_ops-0c0h*4]
    mov word ptr [edx+edi*1+08h], si
    pop ecx
    pop esi
    jmp L616ba
L6bb28::
    xor ebx, dword ptr [Dc9cc4]
    mov word ptr [edx+edi*1+08h], bx
    xor ebx, dword ptr [Dc9cc4]
    jmp L616ba
L6bb3e::
    test byte ptr [Dc9b49], 040h
    je L6bbd3
    cmp byte ptr [Dc9b49], 043h
    jb L6bbc1
    je L6bbab
    cmp byte ptr [Dc9b49], 07fh
    ja L6bb70
    push ebp
    and ebp, dword ptr [Dc9cc0]
    shr ebp, 011h
    mov word ptr [edi+0eh], bp
    pop ebp
    jmp L6bbc1
L6bb70::
    push esi
    push ecx
    mov ecx, ebp
    shr ecx, 018h
    mov esi, dword ptr [ecx*4+Dc9cdc]
    shld ecx, ebp, 010h
    and ecx, 0ffh
    add esi, dword ptr [ecx*4+Dca0dc]
    mov esi, dword ptr [esi*4+Dca4dc]
    mov cl, byte ptr [Dc9b49]
    call dword ptr [ecx*4+colour_ops-0c0h*4]
    mov word ptr [edi+0eh], si
    pop ecx
    pop esi
    jmp L6bbc1
L6bbab::
    ror ebp, 010h
    xor ebp, dword ptr [Dc9cc4]
    mov word ptr [edi+0eh], bp
    xor ebp, dword ptr [Dc9cc4]
    ror ebp, 010h
L6bbc1::
    test byte ptr [Dc9b48], 040h
    jne L6bbdd
    mov word ptr [edi+0ch], bp
    jmp L616dc
L6bbd3::
    ror ebp, 010h
    mov word ptr [edi+0eh], bp
    ror ebp, 010h
L6bbdd::
    cmp byte ptr [Dc9b48], 043h
    jb L616dc
    je L6bc49
    cmp byte ptr [Dc9b48], 07fh
    ja L6bc08
    push ebp
    and ebp, dword ptr [Dc9cc0]
    shr ebp, 1
    mov word ptr [edi+0ch], bp
    pop ebp
    jmp L616dc
L6bc08::
    push esi
    push ecx
    shld ecx, ebp, 018h
    and ecx, 0ffh
    mov esi, dword ptr [ecx*4+Dc9cdc]
    mov ecx, ebp
    and ecx, 0ffh
    add esi, dword ptr [ecx*4+Dca0dc]
    mov esi, dword ptr [esi*4+Dca4dc]
    mov cl, byte ptr [Dc9b48]
    call dword ptr [ecx*4+colour_ops-0c0h*4]
    mov word ptr [edi+0ch], si
    pop ecx
    pop esi
    jmp L616dc
L6bc49::
    xor ebp, dword ptr [Dc9cc4]
    mov word ptr [edi+0ch], bp
    xor ebp, dword ptr [Dc9cc4]
    jmp L616dc
L6bc5e::
    test byte ptr [Dc9b4b], 040h
    je L6bcf7
    cmp byte ptr [Dc9b4b], 043h
    jb L6bce4
    je L6bccd
    cmp byte ptr [Dc9b4b], 07fh
    ja L6bc91
    push ebx
    and ebx, dword ptr [Dc9cc0]
    shr ebx, 011h
    mov word ptr [edx+edi*1+0eh], bx
    pop ebx
    jmp L6bce4
L6bc91::
    push esi
    push ecx
    mov ecx, ebx
    shr ecx, 018h
    mov esi, dword ptr [ecx*4+Dc9cdc]
    shld ecx, ebx, 010h
    and ecx, 0ffh
    add esi, dword ptr [ecx*4+Dca0dc]
    mov esi, dword ptr [esi*4+Dca4dc]
    mov cl, byte ptr [Dc9b4b]
    call dword ptr [ecx*4+colour_ops-0c0h*4]
    mov word ptr [edx+edi*1+0eh], si
    pop ecx
    pop esi
    jmp L6bce4
L6bccd::
    ror ebx, 010h
    xor ebx, dword ptr [Dc9cc4]
    mov word ptr [edx+edi*1+0eh], bx
    xor ebx, dword ptr [Dc9cc4]
    ror ebx, 010h
L6bce4::
    test byte ptr [Dc9b4a], 040h
    jne L6bd02
    mov word ptr [edx+edi*1+0ch], bx
    jmp L616f6
L6bcf7::
    ror ebx, 010h
    mov word ptr [edx+edi*1+0eh], bx
    ror ebx, 010h
L6bd02::
    cmp byte ptr [Dc9b4a], 043h
    jb L616f6
    je L6bd70
    cmp byte ptr [Dc9b4a], 07fh
    ja L6bd2e
    push ebx
    and ebx, dword ptr [Dc9cc0]
    shr ebx, 1
    mov word ptr [edx+edi*1+0ch], bx
    pop ebx
    jmp L616f6
L6bd2e::
    push esi
    push ecx
    shld ecx, ebx, 018h
    and ecx, 0ffh
    mov esi, dword ptr [ecx*4+Dc9cdc]
    mov ecx, ebx
    and ecx, 0ffh
    add esi, dword ptr [ecx*4+Dca0dc]
    mov esi, dword ptr [esi*4+Dca4dc]
    mov cl, byte ptr [Dc9b4a]
    call dword ptr [ecx*4+colour_ops-0c0h*4]
    mov word ptr [edx+edi*1+0ch], si
    pop ecx
    pop esi
    jmp L616f6
L6bd70::
    xor ebx, dword ptr [Dc9cc4]
    mov word ptr [edx+edi*1+0ch], bx
    xor ebx, dword ptr [Dc9cc4]
    jmp L616f6
L6bd86::
    test byte ptr [Dc9b4d], 040h
    je L6be1a
    cmp byte ptr [Dc9b4d], 043h
    jb L6be09
    je L6bdf3
    cmp byte ptr [Dc9b4d], 07fh
    ja L6bdb8
    push ebp
    and ebp, dword ptr [Dc9cc0]
    shr ebp, 011h
    mov word ptr [edi+02h], bp
    pop ebp
    jmp L6be09
L6bdb8::
    push esi
    push ecx
    mov ecx, ebp
    shr ecx, 018h
    mov esi, dword ptr [ecx*4+Dc9cdc]
    shld ecx, ebp, 010h
    and ecx, 0ffh
    add esi, dword ptr [ecx*4+Dca0dc]
    mov esi, dword ptr [esi*4+Dca4dc]
    mov cl, byte ptr [Dc9b4d]
    call dword ptr [ecx*4+colour_ops-0c0h*4]
    mov word ptr [edi+02h], si
    pop ecx
    pop esi
    jmp L6be09
L6bdf3::
    ror ebp, 010h
    xor ebp, dword ptr [Dc9cc4]
    mov word ptr [edi+02h], bp
    xor ebp, dword ptr [Dc9cc4]
    ror ebp, 010h
L6be09::
    test byte ptr [Dc9b4c], 040h
    jne L6be24
    mov word ptr [edi], bp
    jmp L6171d
L6be1a::
    ror ebp, 010h
    mov word ptr [edi+02h], bp
    ror ebp, 010h
L6be24::
    cmp byte ptr [Dc9b4c], 043h
    jb L6171d
    je L6be8e
    cmp byte ptr [Dc9b4c], 07fh
    ja L6be4e
    push ebp
    and ebp, dword ptr [Dc9cc0]
    shr ebp, 1
    mov word ptr [edi], bp
    pop ebp
    jmp L6171d
L6be4e::
    push esi
    push ecx
    shld ecx, ebp, 018h
    and ecx, 0ffh
    mov esi, dword ptr [ecx*4+Dc9cdc]
    mov ecx, ebp
    and ecx, 0ffh
    add esi, dword ptr [ecx*4+Dca0dc]
    mov esi, dword ptr [esi*4+Dca4dc]
    mov cl, byte ptr [Dc9b4c]
    call dword ptr [ecx*4+colour_ops-0c0h*4]
    mov word ptr [edi], si
    pop ecx
    pop esi
    jmp L6171d
L6be8e::
    xor ebp, dword ptr [Dc9cc4]
    mov word ptr [edi], bp
    xor ebp, dword ptr [Dc9cc4]
    jmp L6171d
L6bea2::
    test byte ptr [Dc9b4f], 040h
    je L6bf3a
    cmp byte ptr [Dc9b4f], 043h
    jb L6bf28
    je L6bf11
    cmp byte ptr [Dc9b4f], 07fh
    ja L6bed5
    push ebx
    and ebx, dword ptr [Dc9cc0]
    shr ebx, 011h
    mov word ptr [edx+edi*1+02h], bx
    pop ebx
    jmp L6bf28
L6bed5::
    push esi
    push ecx
    mov ecx, ebx
    shr ecx, 018h
    mov esi, dword ptr [ecx*4+Dc9cdc]
    shld ecx, ebx, 010h
    and ecx, 0ffh
    add esi, dword ptr [ecx*4+Dca0dc]
    mov esi, dword ptr [esi*4+Dca4dc]
    mov cl, byte ptr [Dc9b4f]
    call dword ptr [ecx*4+colour_ops-0c0h*4]
    mov word ptr [edx+edi*1+02h], si
    pop ecx
    pop esi
    jmp L6bf28
L6bf11::
    ror ebx, 010h
    xor ebx, dword ptr [Dc9cc4]
    mov word ptr [edx+edi*1+02h], bx
    xor ebx, dword ptr [Dc9cc4]
    ror ebx, 010h
L6bf28::
    test byte ptr [Dc9b4e], 040h
    jne L6bf45
    mov word ptr [edx+edi*1], bx
    jmp L61736
L6bf3a::
    ror ebx, 010h
    mov word ptr [edx+edi*1+02h], bx
    ror ebx, 010h
L6bf45::
    cmp byte ptr [Dc9b4e], 043h
    jb L61736
    je L6bfb1
    cmp byte ptr [Dc9b4e], 07fh
    ja L6bf70
    push ebx
    and ebx, dword ptr [Dc9cc0]
    shr ebx, 1
    mov word ptr [edx+edi*1], bx
    pop ebx
    jmp L61736
L6bf70::
    push esi
    push ecx
    shld ecx, ebx, 018h
    and ecx, 0ffh
    mov esi, dword ptr [ecx*4+Dc9cdc]
    mov ecx, ebx
    and ecx, 0ffh
    add esi, dword ptr [ecx*4+Dca0dc]
    mov esi, dword ptr [esi*4+Dca4dc]
    mov cl, byte ptr [Dc9b4e]
    call dword ptr [ecx*4+colour_ops-0c0h*4]
    mov word ptr [edx+edi*1], si
    pop ecx
    pop esi
    jmp L61736
L6bfb1::
    xor ebx, dword ptr [Dc9cc4]
    mov word ptr [edx+edi*1], bx
    xor ebx, dword ptr [Dc9cc4]
    jmp L61736
L6bfc6::
    test byte ptr [Dc9b51], 040h
    je L6c05b
    cmp byte ptr [Dc9b51], 043h
    jb L6c049
    je L6c033
    cmp byte ptr [Dc9b51], 07fh
    ja L6bff8
    push ebp
    and ebp, dword ptr [Dc9cc0]
    shr ebp, 011h
    mov word ptr [edi+06h], bp
    pop ebp
    jmp L6c049
L6bff8::
    push esi
    push ecx
    mov ecx, ebp
    shr ecx, 018h
    mov esi, dword ptr [ecx*4+Dc9cdc]
    shld ecx, ebp, 010h
    and ecx, 0ffh
    add esi, dword ptr [ecx*4+Dca0dc]
    mov esi, dword ptr [esi*4+Dca4dc]
    mov cl, byte ptr [Dc9b51]
    call dword ptr [ecx*4+colour_ops-0c0h*4]
    mov word ptr [edi+06h], si
    pop ecx
    pop esi
    jmp L6c049
L6c033::
    ror ebp, 010h
    xor ebp, dword ptr [Dc9cc4]
    mov word ptr [edi+06h], bp
    xor ebp, dword ptr [Dc9cc4]
    ror ebp, 010h
L6c049::
    test byte ptr [Dc9b50], 040h
    jne L6c065
    mov word ptr [edi+04h], bp
    jmp L61758
L6c05b::
    ror ebp, 010h
    mov word ptr [edi+06h], bp
    ror ebp, 010h
L6c065::
    cmp byte ptr [Dc9b50], 043h
    jb L61758
    je L6c0d1
    cmp byte ptr [Dc9b50], 07fh
    ja L6c090
    push ebp
    and ebp, dword ptr [Dc9cc0]
    shr ebp, 1
    mov word ptr [edi+04h], bp
    pop ebp
    jmp L61758
L6c090::
    push esi
    push ecx
    shld ecx, ebp, 018h
    and ecx, 0ffh
    mov esi, dword ptr [ecx*4+Dc9cdc]
    mov ecx, ebp
    and ecx, 0ffh
    add esi, dword ptr [ecx*4+Dca0dc]
    mov esi, dword ptr [esi*4+Dca4dc]
    mov cl, byte ptr [Dc9b50]
    call dword ptr [ecx*4+colour_ops-0c0h*4]
    mov word ptr [edi+04h], si
    pop ecx
    pop esi
    jmp L61758
L6c0d1::
    xor ebp, dword ptr [Dc9cc4]
    mov word ptr [edi+04h], bp
    xor ebp, dword ptr [Dc9cc4]
    jmp L61758
L6c0e6::
    test byte ptr [Dc9b53], 040h
    je L6c17f
    cmp byte ptr [Dc9b53], 043h
    jb L6c16c
    je L6c155
    cmp byte ptr [Dc9b53], 07fh
    ja L6c119
    push ebx
    and ebx, dword ptr [Dc9cc0]
    shr ebx, 011h
    mov word ptr [edx+edi*1+06h], bx
    pop ebx
    jmp L6c16c
L6c119::
    push esi
    push ecx
    mov ecx, ebx
    shr ecx, 018h
    mov esi, dword ptr [ecx*4+Dc9cdc]
    shld ecx, ebx, 010h
    and ecx, 0ffh
    add esi, dword ptr [ecx*4+Dca0dc]
    mov esi, dword ptr [esi*4+Dca4dc]
    mov cl, byte ptr [Dc9b53]
    call dword ptr [ecx*4+colour_ops-0c0h*4]
    mov word ptr [edx+edi*1+06h], si
    pop ecx
    pop esi
    jmp L6c16c
L6c155::
    ror ebx, 010h
    xor ebx, dword ptr [Dc9cc4]
    mov word ptr [edx+edi*1+06h], bx
    xor ebx, dword ptr [Dc9cc4]
    ror ebx, 010h
L6c16c::
    test byte ptr [Dc9b52], 040h
    jne L6c18a
    mov word ptr [edx+edi*1+04h], bx
    jmp L61772
L6c17f::
    ror ebx, 010h
    mov word ptr [edx+edi*1+06h], bx
    ror ebx, 010h
L6c18a::
    cmp byte ptr [Dc9b52], 043h
    jb L61772
    je L6c1f8
    cmp byte ptr [Dc9b52], 07fh
    ja L6c1b6
    push ebx
    and ebx, dword ptr [Dc9cc0]
    shr ebx, 1
    mov word ptr [edx+edi*1+04h], bx
    pop ebx
    jmp L61772
L6c1b6::
    push esi
    push ecx
    shld ecx, ebx, 018h
    and ecx, 0ffh
    mov esi, dword ptr [ecx*4+Dc9cdc]
    mov ecx, ebx
    and ecx, 0ffh
    add esi, dword ptr [ecx*4+Dca0dc]
    mov esi, dword ptr [esi*4+Dca4dc]
    mov cl, byte ptr [Dc9b52]
    call dword ptr [ecx*4+colour_ops-0c0h*4]
    mov word ptr [edx+edi*1+04h], si
    pop ecx
    pop esi
    jmp L61772
L6c1f8::
    xor ebx, dword ptr [Dc9cc4]
    mov word ptr [edx+edi*1+04h], bx
    xor ebx, dword ptr [Dc9cc4]
    jmp L61772
L6c20e::
    test byte ptr [Dc9b55], 040h
    je L6c2a3
    cmp byte ptr [Dc9b55], 043h
    jb L6c291
    je L6c27b
    cmp byte ptr [Dc9b55], 07fh
    ja L6c240
    push ebp
    and ebp, dword ptr [Dc9cc0]
    shr ebp, 011h
    mov word ptr [edi+0ah], bp
    pop ebp
    jmp L6c291
L6c240::
    push esi
    push ecx
    mov ecx, ebp
    shr ecx, 018h
    mov esi, dword ptr [ecx*4+Dc9cdc]
    shld ecx, ebp, 010h
    and ecx, 0ffh
    add esi, dword ptr [ecx*4+Dca0dc]
    mov esi, dword ptr [esi*4+Dca4dc]
    mov cl, byte ptr [Dc9b55]
    call dword ptr [ecx*4+colour_ops-0c0h*4]
    mov word ptr [edi+0ah], si
    pop ecx
    pop esi
    jmp L6c291
L6c27b::
    ror ebp, 010h
    xor ebp, dword ptr [Dc9cc4]
    mov word ptr [edi+0ah], bp
    xor ebp, dword ptr [Dc9cc4]
    ror ebp, 010h
L6c291::
    test byte ptr [Dc9b54], 040h
    jne L6c2ad
    mov word ptr [edi+08h], bp
    jmp L61794
L6c2a3::
    ror ebp, 010h
    mov word ptr [edi+0ah], bp
    ror ebp, 010h
L6c2ad::
    cmp byte ptr [Dc9b54], 043h
    jb L61794
    je L6c319
    cmp byte ptr [Dc9b54], 07fh
    ja L6c2d8
    push ebp
    and ebp, dword ptr [Dc9cc0]
    shr ebp, 1
    mov word ptr [edi+08h], bp
    pop ebp
    jmp L61794
L6c2d8::
    push esi
    push ecx
    shld ecx, ebp, 018h
    and ecx, 0ffh
    mov esi, dword ptr [ecx*4+Dc9cdc]
    mov ecx, ebp
    and ecx, 0ffh
    add esi, dword ptr [ecx*4+Dca0dc]
    mov esi, dword ptr [esi*4+Dca4dc]
    mov cl, byte ptr [Dc9b54]
    call dword ptr [ecx*4+colour_ops-0c0h*4]
    mov word ptr [edi+08h], si
    pop ecx
    pop esi
    jmp L61794
L6c319::
    xor ebp, dword ptr [Dc9cc4]
    mov word ptr [edi+08h], bp
    xor ebp, dword ptr [Dc9cc4]
    jmp L61794
L6c32e::
    test byte ptr [Dc9b57], 040h
    je L6c3c7
    cmp byte ptr [Dc9b57], 043h
    jb L6c3b4
    je L6c39d
    cmp byte ptr [Dc9b57], 07fh
    ja L6c361
    push ebx
    and ebx, dword ptr [Dc9cc0]
    shr ebx, 011h
    mov word ptr [edx+edi*1+0ah], bx
    pop ebx
    jmp L6c3b4
L6c361::
    push esi
    push ecx
    mov ecx, ebx
    shr ecx, 018h
    mov esi, dword ptr [ecx*4+Dc9cdc]
    shld ecx, ebx, 010h
    and ecx, 0ffh
    add esi, dword ptr [ecx*4+Dca0dc]
    mov esi, dword ptr [esi*4+Dca4dc]
    mov cl, byte ptr [Dc9b57]
    call dword ptr [ecx*4+colour_ops-0c0h*4]
    mov word ptr [edx+edi*1+0ah], si
    pop ecx
    pop esi
    jmp L6c3b4
L6c39d::
    ror ebx, 010h
    xor ebx, dword ptr [Dc9cc4]
    mov word ptr [edx+edi*1+0ah], bx
    xor ebx, dword ptr [Dc9cc4]
    ror ebx, 010h
L6c3b4::
    test byte ptr [Dc9b56], 040h
    jne L6c3d2
    mov word ptr [edx+edi*1+08h], bx
    jmp L617ae
L6c3c7::
    ror ebx, 010h
    mov word ptr [edx+edi*1+0ah], bx
    ror ebx, 010h
L6c3d2::
    cmp byte ptr [Dc9b56], 043h
    jb L617ae
    je L6c440
    cmp byte ptr [Dc9b56], 07fh
    ja L6c3fe
    push ebx
    and ebx, dword ptr [Dc9cc0]
    shr ebx, 1
    mov word ptr [edx+edi*1+08h], bx
    pop ebx
    jmp L617ae
L6c3fe::
    push esi
    push ecx
    shld ecx, ebx, 018h
    and ecx, 0ffh
    mov esi, dword ptr [ecx*4+Dc9cdc]
    mov ecx, ebx
    and ecx, 0ffh
    add esi, dword ptr [ecx*4+Dca0dc]
    mov esi, dword ptr [esi*4+Dca4dc]
    mov cl, byte ptr [Dc9b56]
    call dword ptr [ecx*4+colour_ops-0c0h*4]
    mov word ptr [edx+edi*1+08h], si
    pop ecx
    pop esi
    jmp L617ae
L6c440::
    xor ebx, dword ptr [Dc9cc4]
    mov word ptr [edx+edi*1+08h], bx
    xor ebx, dword ptr [Dc9cc4]
    jmp L617ae
L6c456::
    test byte ptr [Dc9b59], 040h
    je L6c4eb
    cmp byte ptr [Dc9b59], 043h
    jb L6c4d9
    je L6c4c3
    cmp byte ptr [Dc9b59], 07fh
    ja L6c488
    push ebp
    and ebp, dword ptr [Dc9cc0]
    shr ebp, 011h
    mov word ptr [edi+0eh], bp
    pop ebp
    jmp L6c4d9
L6c488::
    push esi
    push ecx
    mov ecx, ebp
    shr ecx, 018h
    mov esi, dword ptr [ecx*4+Dc9cdc]
    shld ecx, ebp, 010h
    and ecx, 0ffh
    add esi, dword ptr [ecx*4+Dca0dc]
    mov esi, dword ptr [esi*4+Dca4dc]
    mov cl, byte ptr [Dc9b59]
    call dword ptr [ecx*4+colour_ops-0c0h*4]
    mov word ptr [edi+0eh], si
    pop ecx
    pop esi
    jmp L6c4d9
L6c4c3::
    ror ebp, 010h
    xor ebp, dword ptr [Dc9cc4]
    mov word ptr [edi+0eh], bp
    xor ebp, dword ptr [Dc9cc4]
    ror ebp, 010h
L6c4d9::
    test byte ptr [Dc9b58], 040h
    jne L6c4f5
    mov word ptr [edi+0ch], bp
    jmp L617cc
L6c4eb::
    ror ebp, 010h
    mov word ptr [edi+0eh], bp
    ror ebp, 010h
L6c4f5::
    cmp byte ptr [Dc9b58], 043h
    jb L617cc
    je L6c561
    cmp byte ptr [Dc9b58], 07fh
    ja L6c520
    push ebp
    and ebp, dword ptr [Dc9cc0]
    shr ebp, 1
    mov word ptr [edi+0ch], bp
    pop ebp
    jmp L617cc
L6c520::
    push esi
    push ecx
    shld ecx, ebp, 018h
    and ecx, 0ffh
    mov esi, dword ptr [ecx*4+Dc9cdc]
    mov ecx, ebp
    and ecx, 0ffh
    add esi, dword ptr [ecx*4+Dca0dc]
    mov esi, dword ptr [esi*4+Dca4dc]
    mov cl, byte ptr [Dc9b58]
    call dword ptr [ecx*4+colour_ops-0c0h*4]
    mov word ptr [edi+0ch], si
    pop ecx
    pop esi
    jmp L617cc
L6c561::
    xor ebp, dword ptr [Dc9cc4]
    mov word ptr [edi+0ch], bp
    xor ebp, dword ptr [Dc9cc4]
    jmp L617cc
L6c576::
    test byte ptr [Dc9b5b], 040h
    je L6c60f
    cmp byte ptr [Dc9b5b], 043h
    jb L6c5fc
    je L6c5e5
    cmp byte ptr [Dc9b5b], 07fh
    ja L6c5a9
    push ebx
    and ebx, dword ptr [Dc9cc0]
    shr ebx, 011h
    mov word ptr [edx+edi*1+0eh], bx
    pop ebx
    jmp L6c5fc
L6c5a9::
    push esi
    push ecx
    mov ecx, ebx
    shr ecx, 018h
    mov esi, dword ptr [ecx*4+Dc9cdc]
    shld ecx, ebx, 010h
    and ecx, 0ffh
    add esi, dword ptr [ecx*4+Dca0dc]
    mov esi, dword ptr [esi*4+Dca4dc]
    mov cl, byte ptr [Dc9b5b]
    call dword ptr [ecx*4+colour_ops-0c0h*4]
    mov word ptr [edx+edi*1+0eh], si
    pop ecx
    pop esi
    jmp L6c5fc
L6c5e5::
    ror ebx, 010h
    xor ebx, dword ptr [Dc9cc4]
    mov word ptr [edx+edi*1+0eh], bx
    xor ebx, dword ptr [Dc9cc4]
    ror ebx, 010h
L6c5fc::
    test byte ptr [Dc9b5a], 040h
    jne L6c61a
    mov word ptr [edx+edi*1+0ch], bx
    jmp L617e6
L6c60f::
    ror ebx, 010h
    mov word ptr [edx+edi*1+0eh], bx
    ror ebx, 010h
L6c61a::
    cmp byte ptr [Dc9b5a], 043h
    jb L617e6
    je L6c688
    cmp byte ptr [Dc9b5a], 07fh
    ja L6c646
    push ebx
    and ebx, dword ptr [Dc9cc0]
    shr ebx, 1
    mov word ptr [edx+edi*1+0ch], bx
    pop ebx
    jmp L617e6
L6c646::
    push esi
    push ecx
    shld ecx, ebx, 018h
    and ecx, 0ffh
    mov esi, dword ptr [ecx*4+Dc9cdc]
    mov ecx, ebx
    and ecx, 0ffh
    add esi, dword ptr [ecx*4+Dca0dc]
    mov esi, dword ptr [esi*4+Dca4dc]
    mov cl, byte ptr [Dc9b5a]
    call dword ptr [ecx*4+colour_ops-0c0h*4]
    mov word ptr [edx+edi*1+0ch], si
    pop ecx
    pop esi
    jmp L617e6
L6c688::
    xor ebx, dword ptr [Dc9cc4]
    mov word ptr [edx+edi*1+0ch], bx
    xor ebx, dword ptr [Dc9cc4]
    jmp L617e6
L6c69e::
    test byte ptr [Dc9b1d], 040h
    je L6c732
    cmp byte ptr [Dc9b1d], 043h
    jb L6c721
    je L6c70b
    cmp byte ptr [Dc9b1d], 07fh
    ja L6c6d0
    push eax
    and eax, dword ptr [Dc9cc0]
    shr eax, 011h
    mov word ptr [edi+02h], ax
    pop eax
    jmp L6c721
L6c6d0::
    push esi
    push ecx
    mov ecx, eax
    shr ecx, 018h
    mov esi, dword ptr [ecx*4+Dc9cdc]
    shld ecx, eax, 010h
    and ecx, 0ffh
    add esi, dword ptr [ecx*4+Dca0dc]
    mov esi, dword ptr [esi*4+Dca4dc]
    mov cl, byte ptr [Dc9b1d]
    call dword ptr [ecx*4+colour_ops-0c0h*4]
    mov word ptr [edi+02h], si
    pop ecx
    pop esi
    jmp L6c721
L6c70b::
    ror eax, 010h
    xor eax, dword ptr [Dc9cc4]
    mov word ptr [edi+02h], ax
    xor eax, dword ptr [Dc9cc4]
    ror eax, 010h
L6c721::
    test byte ptr [Dc9b1c], 040h
    jne L6c73c
    mov word ptr [edi], ax
    jmp L61b05
L6c732::
    ror eax, 010h
    mov word ptr [edi+02h], ax
    ror eax, 010h
L6c73c::
    cmp byte ptr [Dc9b1c], 043h
    jb L61b05
    je L6c7a6
    cmp byte ptr [Dc9b1c], 07fh
    ja L6c766
    push eax
    and eax, dword ptr [Dc9cc0]
    shr eax, 1
    mov word ptr [edi], ax
    pop eax
    jmp L61b05
L6c766::
    push esi
    push ecx
    shld ecx, eax, 018h
    and ecx, 0ffh
    mov esi, dword ptr [ecx*4+Dc9cdc]
    mov ecx, eax
    and ecx, 0ffh
    add esi, dword ptr [ecx*4+Dca0dc]
    mov esi, dword ptr [esi*4+Dca4dc]
    mov cl, byte ptr [Dc9b1c]
    call dword ptr [ecx*4+colour_ops-0c0h*4]
    mov word ptr [edi], si
    pop ecx
    pop esi
    jmp L61b05
L6c7a6::
    xor eax, dword ptr [Dc9cc4]
    mov word ptr [edi], ax
    xor eax, dword ptr [Dc9cc4]
    jmp L61b05
L6c7ba::
    test byte ptr [Dc9b1f], 040h
    je L6c852
    cmp byte ptr [Dc9b1f], 043h
    jb L6c840
    je L6c829
    cmp byte ptr [Dc9b1f], 07fh
    ja L6c7ed
    push eax
    and eax, dword ptr [Dc9cc0]
    shr eax, 011h
    mov word ptr [edx+edi*1+02h], ax
    pop eax
    jmp L6c840
L6c7ed::
    push esi
    push ecx
    mov ecx, eax
    shr ecx, 018h
    mov esi, dword ptr [ecx*4+Dc9cdc]
    shld ecx, eax, 010h
    and ecx, 0ffh
    add esi, dword ptr [ecx*4+Dca0dc]
    mov esi, dword ptr [esi*4+Dca4dc]
    mov cl, byte ptr [Dc9b1f]
    call dword ptr [ecx*4+colour_ops-0c0h*4]
    mov word ptr [edx+edi*1+02h], si
    pop ecx
    pop esi
    jmp L6c840
L6c829::
    ror eax, 010h
    xor eax, dword ptr [Dc9cc4]
    mov word ptr [edx+edi*1+02h], ax
    xor eax, dword ptr [Dc9cc4]
    ror eax, 010h
L6c840::
    test byte ptr [Dc9b1e], 040h
    jne L6c85d
    mov word ptr [edx+edi*1], ax
    jmp L61b26
L6c852::
    ror eax, 010h
    mov word ptr [edx+edi*1+02h], ax
    ror eax, 010h
L6c85d::
    cmp byte ptr [Dc9b1e], 043h
    jb L61b26
    je L6c8c9
    cmp byte ptr [Dc9b1e], 07fh
    ja L6c888
    push eax
    and eax, dword ptr [Dc9cc0]
    shr eax, 1
    mov word ptr [edx+edi*1], ax
    pop eax
    jmp L61b26
L6c888::
    push esi
    push ecx
    shld ecx, eax, 018h
    and ecx, 0ffh
    mov esi, dword ptr [ecx*4+Dc9cdc]
    mov ecx, eax
    and ecx, 0ffh
    add esi, dword ptr [ecx*4+Dca0dc]
    mov esi, dword ptr [esi*4+Dca4dc]
    mov cl, byte ptr [Dc9b1e]
    call dword ptr [ecx*4+colour_ops-0c0h*4]
    mov word ptr [edx+edi*1], si
    pop ecx
    pop esi
    jmp L61b26
L6c8c9::
    xor eax, dword ptr [Dc9cc4]
    mov word ptr [edx+edi*1], ax
    xor eax, dword ptr [Dc9cc4]
    jmp L61b26
L6c8de::
    test byte ptr [Dc9b21], 040h
    je L6c973
    cmp byte ptr [Dc9b21], 043h
    jb L6c961
    je L6c94b
    cmp byte ptr [Dc9b21], 07fh
    ja L6c910
    push eax
    and eax, dword ptr [Dc9cc0]
    shr eax, 011h
    mov word ptr [edi+06h], ax
    pop eax
    jmp L6c961
L6c910::
    push esi
    push ecx
    mov ecx, eax
    shr ecx, 018h
    mov esi, dword ptr [ecx*4+Dc9cdc]
    shld ecx, eax, 010h
    and ecx, 0ffh
    add esi, dword ptr [ecx*4+Dca0dc]
    mov esi, dword ptr [esi*4+Dca4dc]
    mov cl, byte ptr [Dc9b21]
    call dword ptr [ecx*4+colour_ops-0c0h*4]
    mov word ptr [edi+06h], si
    pop ecx
    pop esi
    jmp L6c961
L6c94b::
    ror eax, 010h
    xor eax, dword ptr [Dc9cc4]
    mov word ptr [edi+06h], ax
    xor eax, dword ptr [Dc9cc4]
    ror eax, 010h
L6c961::
    test byte ptr [Dc9b20], 040h
    jne L6c97d
    mov word ptr [edi+04h], ax
    jmp L61bf9
L6c973::
    ror eax, 010h
    mov word ptr [edi+06h], ax
    ror eax, 010h
L6c97d::
    cmp byte ptr [Dc9b20], 043h
    jb L61bf9
    je L6c9e9
    cmp byte ptr [Dc9b20], 07fh
    ja L6c9a8
    push eax
    and eax, dword ptr [Dc9cc0]
    shr eax, 1
    mov word ptr [edi+04h], ax
    pop eax
    jmp L61bf9
L6c9a8::
    push esi
    push ecx
    shld ecx, eax, 018h
    and ecx, 0ffh
    mov esi, dword ptr [ecx*4+Dc9cdc]
    mov ecx, eax
    and ecx, 0ffh
    add esi, dword ptr [ecx*4+Dca0dc]
    mov esi, dword ptr [esi*4+Dca4dc]
    mov cl, byte ptr [Dc9b20]
    call dword ptr [ecx*4+colour_ops-0c0h*4]
    mov word ptr [edi+04h], si
    pop ecx
    pop esi
    jmp L61bf9
L6c9e9::
    xor eax, dword ptr [Dc9cc4]
    mov word ptr [edi+04h], ax
    xor eax, dword ptr [Dc9cc4]
    jmp L61bf9
L6c9fe::
    test byte ptr [Dc9b23], 040h
    je L6ca97
    cmp byte ptr [Dc9b23], 043h
    jb L6ca84
    je L6ca6d
    cmp byte ptr [Dc9b23], 07fh
    ja L6ca31
    push eax
    and eax, dword ptr [Dc9cc0]
    shr eax, 011h
    mov word ptr [edx+edi*1+06h], ax
    pop eax
    jmp L6ca84
L6ca31::
    push esi
    push ecx
    mov ecx, eax
    shr ecx, 018h
    mov esi, dword ptr [ecx*4+Dc9cdc]
    shld ecx, eax, 010h
    and ecx, 0ffh
    add esi, dword ptr [ecx*4+Dca0dc]
    mov esi, dword ptr [esi*4+Dca4dc]
    mov cl, byte ptr [Dc9b23]
    call dword ptr [ecx*4+colour_ops-0c0h*4]
    mov word ptr [edx+edi*1+06h], si
    pop ecx
    pop esi
    jmp L6ca84
L6ca6d::
    ror eax, 010h
    xor eax, dword ptr [Dc9cc4]
    mov word ptr [edx+edi*1+06h], ax
    xor eax, dword ptr [Dc9cc4]
    ror eax, 010h
L6ca84::
    test byte ptr [Dc9b22], 040h
    jne L6caa2
    mov word ptr [edx+edi*1+04h], ax
    jmp L61c1b
L6ca97::
    ror eax, 010h
    mov word ptr [edx+edi*1+06h], ax
    ror eax, 010h
L6caa2::
    cmp byte ptr [Dc9b22], 043h
    jb L61c1b
    je L6cb10
    cmp byte ptr [Dc9b22], 07fh
    ja L6cace
    push eax
    and eax, dword ptr [Dc9cc0]
    shr eax, 1
    mov word ptr [edx+edi*1+04h], ax
    pop eax
    jmp L61c1b
L6cace::
    push esi
    push ecx
    shld ecx, eax, 018h
    and ecx, 0ffh
    mov esi, dword ptr [ecx*4+Dc9cdc]
    mov ecx, eax
    and ecx, 0ffh
    add esi, dword ptr [ecx*4+Dca0dc]
    mov esi, dword ptr [esi*4+Dca4dc]
    mov cl, byte ptr [Dc9b22]
    call dword ptr [ecx*4+colour_ops-0c0h*4]
    mov word ptr [edx+edi*1+04h], si
    pop ecx
    pop esi
    jmp L61c1b
L6cb10::
    xor eax, dword ptr [Dc9cc4]
    mov word ptr [edx+edi*1+04h], ax
    xor eax, dword ptr [Dc9cc4]
    jmp L61c1b
L6cb26::
    test byte ptr [Dc9b25], 040h
    je L6cbbb
    cmp byte ptr [Dc9b25], 043h
    jb L6cba9
    je L6cb93
    cmp byte ptr [Dc9b25], 07fh
    ja L6cb58
    push eax
    and eax, dword ptr [Dc9cc0]
    shr eax, 011h
    mov word ptr [edi+0ah], ax
    pop eax
    jmp L6cba9
L6cb58::
    push esi
    push ecx
    mov ecx, eax
    shr ecx, 018h
    mov esi, dword ptr [ecx*4+Dc9cdc]
    shld ecx, eax, 010h
    and ecx, 0ffh
    add esi, dword ptr [ecx*4+Dca0dc]
    mov esi, dword ptr [esi*4+Dca4dc]
    mov cl, byte ptr [Dc9b25]
    call dword ptr [ecx*4+colour_ops-0c0h*4]
    mov word ptr [edi+0ah], si
    pop ecx
    pop esi
    jmp L6cba9
L6cb93::
    ror eax, 010h
    xor eax, dword ptr [Dc9cc4]
    mov word ptr [edi+0ah], ax
    xor eax, dword ptr [Dc9cc4]
    ror eax, 010h
L6cba9::
    test byte ptr [Dc9b24], 040h
    jne L6cbc5
    mov word ptr [edi+08h], ax
    jmp L61cee
L6cbbb::
    ror eax, 010h
    mov word ptr [edi+0ah], ax
    ror eax, 010h
L6cbc5::
    cmp byte ptr [Dc9b24], 043h
    jb L61cee
    je L6cc31
    cmp byte ptr [Dc9b24], 07fh
    ja L6cbf0
    push eax
    and eax, dword ptr [Dc9cc0]
    shr eax, 1
    mov word ptr [edi+08h], ax
    pop eax
    jmp L61cee
L6cbf0::
    push esi
    push ecx
    shld ecx, eax, 018h
    and ecx, 0ffh
    mov esi, dword ptr [ecx*4+Dc9cdc]
    mov ecx, eax
    and ecx, 0ffh
    add esi, dword ptr [ecx*4+Dca0dc]
    mov esi, dword ptr [esi*4+Dca4dc]
    mov cl, byte ptr [Dc9b24]
    call dword ptr [ecx*4+colour_ops-0c0h*4]
    mov word ptr [edi+08h], si
    pop ecx
    pop esi
    jmp L61cee
L6cc31::
    xor eax, dword ptr [Dc9cc4]
    mov word ptr [edi+08h], ax
    xor eax, dword ptr [Dc9cc4]
    jmp L61cee
L6cc46::
    test byte ptr [Dc9b27], 040h
    je L6ccdf
    cmp byte ptr [Dc9b27], 043h
    jb L6cccc
    je L6ccb5
    cmp byte ptr [Dc9b27], 07fh
    ja L6cc79
    push eax
    and eax, dword ptr [Dc9cc0]
    shr eax, 011h
    mov word ptr [edx+edi*1+0ah], ax
    pop eax
    jmp L6cccc
L6cc79::
    push esi
    push ecx
    mov ecx, eax
    shr ecx, 018h
    mov esi, dword ptr [ecx*4+Dc9cdc]
    shld ecx, eax, 010h
    and ecx, 0ffh
    add esi, dword ptr [ecx*4+Dca0dc]
    mov esi, dword ptr [esi*4+Dca4dc]
    mov cl, byte ptr [Dc9b27]
    call dword ptr [ecx*4+colour_ops-0c0h*4]
    mov word ptr [edx+edi*1+0ah], si
    pop ecx
    pop esi
    jmp L6cccc
L6ccb5::
    ror eax, 010h
    xor eax, dword ptr [Dc9cc4]
    mov word ptr [edx+edi*1+0ah], ax
    xor eax, dword ptr [Dc9cc4]
    ror eax, 010h
L6cccc::
    test byte ptr [Dc9b26], 040h
    jne L6ccea
    mov word ptr [edx+edi*1+08h], ax
    jmp L61d10
L6ccdf::
    ror eax, 010h
    mov word ptr [edx+edi*1+0ah], ax
    ror eax, 010h
L6ccea::
    cmp byte ptr [Dc9b26], 043h
    jb L61d10
    je L6cd58
    cmp byte ptr [Dc9b26], 07fh
    ja L6cd16
    push eax
    and eax, dword ptr [Dc9cc0]
    shr eax, 1
    mov word ptr [edx+edi*1+08h], ax
    pop eax
    jmp L61d10
L6cd16::
    push esi
    push ecx
    shld ecx, eax, 018h
    and ecx, 0ffh
    mov esi, dword ptr [ecx*4+Dc9cdc]
    mov ecx, eax
    and ecx, 0ffh
    add esi, dword ptr [ecx*4+Dca0dc]
    mov esi, dword ptr [esi*4+Dca4dc]
    mov cl, byte ptr [Dc9b26]
    call dword ptr [ecx*4+colour_ops-0c0h*4]
    mov word ptr [edx+edi*1+08h], si
    pop ecx
    pop esi
    jmp L61d10
L6cd58::
    xor eax, dword ptr [Dc9cc4]
    mov word ptr [edx+edi*1+08h], ax
    xor eax, dword ptr [Dc9cc4]
    jmp L61d10
L6cd6e::
    test byte ptr [Dc9b29], 040h
    je L6ce03
    cmp byte ptr [Dc9b29], 043h
    jb L6cdf1
    je L6cddb
    cmp byte ptr [Dc9b29], 07fh
    ja L6cda0
    push eax
    and eax, dword ptr [Dc9cc0]
    shr eax, 011h
    mov word ptr [edi+0eh], ax
    pop eax
    jmp L6cdf1
L6cda0::
    push esi
    push ecx
    mov ecx, eax
    shr ecx, 018h
    mov esi, dword ptr [ecx*4+Dc9cdc]
    shld ecx, eax, 010h
    and ecx, 0ffh
    add esi, dword ptr [ecx*4+Dca0dc]
    mov esi, dword ptr [esi*4+Dca4dc]
    mov cl, byte ptr [Dc9b29]
    call dword ptr [ecx*4+colour_ops-0c0h*4]
    mov word ptr [edi+0eh], si
    pop ecx
    pop esi
    jmp L6cdf1
L6cddb::
    ror eax, 010h
    xor eax, dword ptr [Dc9cc4]
    mov word ptr [edi+0eh], ax
    xor eax, dword ptr [Dc9cc4]
    ror eax, 010h
L6cdf1::
    test byte ptr [Dc9b28], 040h
    jne L6ce0d
    mov word ptr [edi+0ch], ax
    jmp L61de3
L6ce03::
    ror eax, 010h
    mov word ptr [edi+0eh], ax
    ror eax, 010h
L6ce0d::
    cmp byte ptr [Dc9b28], 043h
    jb L61de3
    je L6ce79
    cmp byte ptr [Dc9b28], 07fh
    ja L6ce38
    push eax
    and eax, dword ptr [Dc9cc0]
    shr eax, 1
    mov word ptr [edi+0ch], ax
    pop eax
    jmp L61de3
L6ce38::
    push esi
    push ecx
    shld ecx, eax, 018h
    and ecx, 0ffh
    mov esi, dword ptr [ecx*4+Dc9cdc]
    mov ecx, eax
    and ecx, 0ffh
    add esi, dword ptr [ecx*4+Dca0dc]
    mov esi, dword ptr [esi*4+Dca4dc]
    mov cl, byte ptr [Dc9b28]
    call dword ptr [ecx*4+colour_ops-0c0h*4]
    mov word ptr [edi+0ch], si
    pop ecx
    pop esi
    jmp L61de3
L6ce79::
    xor eax, dword ptr [Dc9cc4]
    mov word ptr [edi+0ch], ax
    xor eax, dword ptr [Dc9cc4]
    jmp L61de3
L6ce8e::
    test byte ptr [Dc9b2b], 040h
    je L6cf27
    cmp byte ptr [Dc9b2b], 043h
    jb L6cf14
    je L6cefd
    cmp byte ptr [Dc9b2b], 07fh
    ja L6cec1
    push eax
    and eax, dword ptr [Dc9cc0]
    shr eax, 011h
    mov word ptr [edx+edi*1+0eh], ax
    pop eax
    jmp L6cf14
L6cec1::
    push esi
    push ecx
    mov ecx, eax
    shr ecx, 018h
    mov esi, dword ptr [ecx*4+Dc9cdc]
    shld ecx, eax, 010h
    and ecx, 0ffh
    add esi, dword ptr [ecx*4+Dca0dc]
    mov esi, dword ptr [esi*4+Dca4dc]
    mov cl, byte ptr [Dc9b2b]
    call dword ptr [ecx*4+colour_ops-0c0h*4]
    mov word ptr [edx+edi*1+0eh], si
    pop ecx
    pop esi
    jmp L6cf14
L6cefd::
    ror eax, 010h
    xor eax, dword ptr [Dc9cc4]
    mov word ptr [edx+edi*1+0eh], ax
    xor eax, dword ptr [Dc9cc4]
    ror eax, 010h
L6cf14::
    test byte ptr [Dc9b2a], 040h
    jne L6cf32
    mov word ptr [edx+edi*1+0ch], ax
    jmp L61e05
L6cf27::
    ror eax, 010h
    mov word ptr [edx+edi*1+0eh], ax
    ror eax, 010h
L6cf32::
    cmp byte ptr [Dc9b2a], 043h
    jb L61e05
    je L6cfa0
    cmp byte ptr [Dc9b2a], 07fh
    ja L6cf5e
    push eax
    and eax, dword ptr [Dc9cc0]
    shr eax, 1
    mov word ptr [edx+edi*1+0ch], ax
    pop eax
    jmp L61e05
L6cf5e::
    push esi
    push ecx
    shld ecx, eax, 018h
    and ecx, 0ffh
    mov esi, dword ptr [ecx*4+Dc9cdc]
    mov ecx, eax
    and ecx, 0ffh
    add esi, dword ptr [ecx*4+Dca0dc]
    mov esi, dword ptr [esi*4+Dca4dc]
    mov cl, byte ptr [Dc9b2a]
    call dword ptr [ecx*4+colour_ops-0c0h*4]
    mov word ptr [edx+edi*1+0ch], si
    pop ecx
    pop esi
    jmp L61e05
L6cfa0::
    xor eax, dword ptr [Dc9cc4]
    mov word ptr [edx+edi*1+0ch], ax
    xor eax, dword ptr [Dc9cc4]
    jmp L61e05
L6cfb6::
    test byte ptr [Dc9b2d], 040h
    je L6d04a
    cmp byte ptr [Dc9b2d], 043h
    jb L6d039
    je L6d023
    cmp byte ptr [Dc9b2d], 07fh
    ja L6cfe8
    push eax
    and eax, dword ptr [Dc9cc0]
    shr eax, 011h
    mov word ptr [edi+02h], ax
    pop eax
    jmp L6d039
L6cfe8::
    push esi
    push ecx
    mov ecx, eax
    shr ecx, 018h
    mov esi, dword ptr [ecx*4+Dc9cdc]
    shld ecx, eax, 010h
    and ecx, 0ffh
    add esi, dword ptr [ecx*4+Dca0dc]
    mov esi, dword ptr [esi*4+Dca4dc]
    mov cl, byte ptr [Dc9b2d]
    call dword ptr [ecx*4+colour_ops-0c0h*4]
    mov word ptr [edi+02h], si
    pop ecx
    pop esi
    jmp L6d039
L6d023::
    ror eax, 010h
    xor eax, dword ptr [Dc9cc4]
    mov word ptr [edi+02h], ax
    xor eax, dword ptr [Dc9cc4]
    ror eax, 010h
L6d039::
    test byte ptr [Dc9b2c], 040h
    jne L6d054
    mov word ptr [edi], ax
    jmp L61edd
L6d04a::
    ror eax, 010h
    mov word ptr [edi+02h], ax
    ror eax, 010h
L6d054::
    cmp byte ptr [Dc9b2c], 043h
    jb L61edd
    je L6d0be
    cmp byte ptr [Dc9b2c], 07fh
    ja L6d07e
    push eax
    and eax, dword ptr [Dc9cc0]
    shr eax, 1
    mov word ptr [edi], ax
    pop eax
    jmp L61edd
L6d07e::
    push esi
    push ecx
    shld ecx, eax, 018h
    and ecx, 0ffh
    mov esi, dword ptr [ecx*4+Dc9cdc]
    mov ecx, eax
    and ecx, 0ffh
    add esi, dword ptr [ecx*4+Dca0dc]
    mov esi, dword ptr [esi*4+Dca4dc]
    mov cl, byte ptr [Dc9b2c]
    call dword ptr [ecx*4+colour_ops-0c0h*4]
    mov word ptr [edi], si
    pop ecx
    pop esi
    jmp L61edd
L6d0be::
    xor eax, dword ptr [Dc9cc4]
    mov word ptr [edi], ax
    xor eax, dword ptr [Dc9cc4]
    jmp L61edd
L6d0d2::
    test byte ptr [Dc9b2f], 040h
    je L6d16a
    cmp byte ptr [Dc9b2f], 043h
    jb L6d158
    je L6d141
    cmp byte ptr [Dc9b2f], 07fh
    ja L6d105
    push eax
    and eax, dword ptr [Dc9cc0]
    shr eax, 011h
    mov word ptr [edx+edi*1+02h], ax
    pop eax
    jmp L6d158
L6d105::
    push esi
    push ecx
    mov ecx, eax
    shr ecx, 018h
    mov esi, dword ptr [ecx*4+Dc9cdc]
    shld ecx, eax, 010h
    and ecx, 0ffh
    add esi, dword ptr [ecx*4+Dca0dc]
    mov esi, dword ptr [esi*4+Dca4dc]
    mov cl, byte ptr [Dc9b2f]
    call dword ptr [ecx*4+colour_ops-0c0h*4]
    mov word ptr [edx+edi*1+02h], si
    pop ecx
    pop esi
    jmp L6d158
L6d141::
    ror eax, 010h
    xor eax, dword ptr [Dc9cc4]
    mov word ptr [edx+edi*1+02h], ax
    xor eax, dword ptr [Dc9cc4]
    ror eax, 010h
L6d158::
    test byte ptr [Dc9b2e], 040h
    jne L6d175
    mov word ptr [edx+edi*1], ax
    jmp L61efe
L6d16a::
    ror eax, 010h
    mov word ptr [edx+edi*1+02h], ax
    ror eax, 010h
L6d175::
    cmp byte ptr [Dc9b2e], 043h
    jb L61efe
    je L6d1e1
    cmp byte ptr [Dc9b2e], 07fh
    ja L6d1a0
    push eax
    and eax, dword ptr [Dc9cc0]
    shr eax, 1
    mov word ptr [edx+edi*1], ax
    pop eax
    jmp L61efe
L6d1a0::
    push esi
    push ecx
    shld ecx, eax, 018h
    and ecx, 0ffh
    mov esi, dword ptr [ecx*4+Dc9cdc]
    mov ecx, eax
    and ecx, 0ffh
    add esi, dword ptr [ecx*4+Dca0dc]
    mov esi, dword ptr [esi*4+Dca4dc]
    mov cl, byte ptr [Dc9b2e]
    call dword ptr [ecx*4+colour_ops-0c0h*4]
    mov word ptr [edx+edi*1], si
    pop ecx
    pop esi
    jmp L61efe
L6d1e1::
    xor eax, dword ptr [Dc9cc4]
    mov word ptr [edx+edi*1], ax
    xor eax, dword ptr [Dc9cc4]
    jmp L61efe
L6d1f6::
    test byte ptr [Dc9b31], 040h
    je L6d28b
    cmp byte ptr [Dc9b31], 043h
    jb L6d279
    je L6d263
    cmp byte ptr [Dc9b31], 07fh
    ja L6d228
    push eax
    and eax, dword ptr [Dc9cc0]
    shr eax, 011h
    mov word ptr [edi+06h], ax
    pop eax
    jmp L6d279
L6d228::
    push esi
    push ecx
    mov ecx, eax
    shr ecx, 018h
    mov esi, dword ptr [ecx*4+Dc9cdc]
    shld ecx, eax, 010h
    and ecx, 0ffh
    add esi, dword ptr [ecx*4+Dca0dc]
    mov esi, dword ptr [esi*4+Dca4dc]
    mov cl, byte ptr [Dc9b31]
    call dword ptr [ecx*4+colour_ops-0c0h*4]
    mov word ptr [edi+06h], si
    pop ecx
    pop esi
    jmp L6d279
L6d263::
    ror eax, 010h
    xor eax, dword ptr [Dc9cc4]
    mov word ptr [edi+06h], ax
    xor eax, dword ptr [Dc9cc4]
    ror eax, 010h
L6d279::
    test byte ptr [Dc9b30], 040h
    jne L6d295
    mov word ptr [edi+04h], ax
    jmp L61fd1
L6d28b::
    ror eax, 010h
    mov word ptr [edi+06h], ax
    ror eax, 010h
L6d295::
    cmp byte ptr [Dc9b30], 043h
    jb L61fd1
    je L6d301
    cmp byte ptr [Dc9b30], 07fh
    ja L6d2c0
    push eax
    and eax, dword ptr [Dc9cc0]
    shr eax, 1
    mov word ptr [edi+04h], ax
    pop eax
    jmp L61fd1
L6d2c0::
    push esi
    push ecx
    shld ecx, eax, 018h
    and ecx, 0ffh
    mov esi, dword ptr [ecx*4+Dc9cdc]
    mov ecx, eax
    and ecx, 0ffh
    add esi, dword ptr [ecx*4+Dca0dc]
    mov esi, dword ptr [esi*4+Dca4dc]
    mov cl, byte ptr [Dc9b30]
    call dword ptr [ecx*4+colour_ops-0c0h*4]
    mov word ptr [edi+04h], si
    pop ecx
    pop esi
    jmp L61fd1
L6d301::
    xor eax, dword ptr [Dc9cc4]
    mov word ptr [edi+04h], ax
    xor eax, dword ptr [Dc9cc4]
    jmp L61fd1
L6d316::
    test byte ptr [Dc9b33], 040h
    je L6d3af
    cmp byte ptr [Dc9b33], 043h
    jb L6d39c
    je L6d385
    cmp byte ptr [Dc9b33], 07fh
    ja L6d349
    push eax
    and eax, dword ptr [Dc9cc0]
    shr eax, 011h
    mov word ptr [edx+edi*1+06h], ax
    pop eax
    jmp L6d39c
L6d349::
    push esi
    push ecx
    mov ecx, eax
    shr ecx, 018h
    mov esi, dword ptr [ecx*4+Dc9cdc]
    shld ecx, eax, 010h
    and ecx, 0ffh
    add esi, dword ptr [ecx*4+Dca0dc]
    mov esi, dword ptr [esi*4+Dca4dc]
    mov cl, byte ptr [Dc9b33]
    call dword ptr [ecx*4+colour_ops-0c0h*4]
    mov word ptr [edx+edi*1+06h], si
    pop ecx
    pop esi
    jmp L6d39c
L6d385::
    ror eax, 010h
    xor eax, dword ptr [Dc9cc4]
    mov word ptr [edx+edi*1+06h], ax
    xor eax, dword ptr [Dc9cc4]
    ror eax, 010h
L6d39c::
    test byte ptr [Dc9b32], 040h
    jne L6d3ba
    mov word ptr [edx+edi*1+04h], ax
    jmp L61ff3
L6d3af::
    ror eax, 010h
    mov word ptr [edx+edi*1+06h], ax
    ror eax, 010h
L6d3ba::
    cmp byte ptr [Dc9b32], 043h
    jb L61ff3
    je L6d428
    cmp byte ptr [Dc9b32], 07fh
    ja L6d3e6
    push eax
    and eax, dword ptr [Dc9cc0]
    shr eax, 1
    mov word ptr [edx+edi*1+04h], ax
    pop eax
    jmp L61ff3
L6d3e6::
    push esi
    push ecx
    shld ecx, eax, 018h
    and ecx, 0ffh
    mov esi, dword ptr [ecx*4+Dc9cdc]
    mov ecx, eax
    and ecx, 0ffh
    add esi, dword ptr [ecx*4+Dca0dc]
    mov esi, dword ptr [esi*4+Dca4dc]
    mov cl, byte ptr [Dc9b32]
    call dword ptr [ecx*4+colour_ops-0c0h*4]
    mov word ptr [edx+edi*1+04h], si
    pop ecx
    pop esi
    jmp L61ff3
L6d428::
    xor eax, dword ptr [Dc9cc4]
    mov word ptr [edx+edi*1+04h], ax
    xor eax, dword ptr [Dc9cc4]
    jmp L61ff3
L6d43e::
    test byte ptr [Dc9b35], 040h
    je L6d4d3
    cmp byte ptr [Dc9b35], 043h
    jb L6d4c1
    je L6d4ab
    cmp byte ptr [Dc9b35], 07fh
    ja L6d470
    push eax
    and eax, dword ptr [Dc9cc0]
    shr eax, 011h
    mov word ptr [edi+0ah], ax
    pop eax
    jmp L6d4c1
L6d470::
    push esi
    push ecx
    mov ecx, eax
    shr ecx, 018h
    mov esi, dword ptr [ecx*4+Dc9cdc]
    shld ecx, eax, 010h
    and ecx, 0ffh
    add esi, dword ptr [ecx*4+Dca0dc]
    mov esi, dword ptr [esi*4+Dca4dc]
    mov cl, byte ptr [Dc9b35]
    call dword ptr [ecx*4+colour_ops-0c0h*4]
    mov word ptr [edi+0ah], si
    pop ecx
    pop esi
    jmp L6d4c1
L6d4ab::
    ror eax, 010h
    xor eax, dword ptr [Dc9cc4]
    mov word ptr [edi+0ah], ax
    xor eax, dword ptr [Dc9cc4]
    ror eax, 010h
L6d4c1::
    test byte ptr [Dc9b34], 040h
    jne L6d4dd
    mov word ptr [edi+08h], ax
    jmp L620c6
L6d4d3::
    ror eax, 010h
    mov word ptr [edi+0ah], ax
    ror eax, 010h
L6d4dd::
    cmp byte ptr [Dc9b34], 043h
    jb L620c6
    je L6d549
    cmp byte ptr [Dc9b34], 07fh
    ja L6d508
    push eax
    and eax, dword ptr [Dc9cc0]
    shr eax, 1
    mov word ptr [edi+08h], ax
    pop eax
    jmp L620c6
L6d508::
    push esi
    push ecx
    shld ecx, eax, 018h
    and ecx, 0ffh
    mov esi, dword ptr [ecx*4+Dc9cdc]
    mov ecx, eax
    and ecx, 0ffh
    add esi, dword ptr [ecx*4+Dca0dc]
    mov esi, dword ptr [esi*4+Dca4dc]
    mov cl, byte ptr [Dc9b34]
    call dword ptr [ecx*4+colour_ops-0c0h*4]
    mov word ptr [edi+08h], si
    pop ecx
    pop esi
    jmp L620c6
L6d549::
    xor eax, dword ptr [Dc9cc4]
    mov word ptr [edi+08h], ax
    xor eax, dword ptr [Dc9cc4]
    jmp L620c6
L6d55e::
    test byte ptr [Dc9b37], 040h
    je L6d5f7
    cmp byte ptr [Dc9b37], 043h
    jb L6d5e4
    je L6d5cd
    cmp byte ptr [Dc9b37], 07fh
    ja L6d591
    push eax
    and eax, dword ptr [Dc9cc0]
    shr eax, 011h
    mov word ptr [edx+edi*1+0ah], ax
    pop eax
    jmp L6d5e4
L6d591::
    push esi
    push ecx
    mov ecx, eax
    shr ecx, 018h
    mov esi, dword ptr [ecx*4+Dc9cdc]
    shld ecx, eax, 010h
    and ecx, 0ffh
    add esi, dword ptr [ecx*4+Dca0dc]
    mov esi, dword ptr [esi*4+Dca4dc]
    mov cl, byte ptr [Dc9b37]
    call dword ptr [ecx*4+colour_ops-0c0h*4]
    mov word ptr [edx+edi*1+0ah], si
    pop ecx
    pop esi
    jmp L6d5e4
L6d5cd::
    ror eax, 010h
    xor eax, dword ptr [Dc9cc4]
    mov word ptr [edx+edi*1+0ah], ax
    xor eax, dword ptr [Dc9cc4]
    ror eax, 010h
L6d5e4::
    test byte ptr [Dc9b36], 040h
    jne L6d602
    mov word ptr [edx+edi*1+08h], ax
    jmp L620e8
L6d5f7::
    ror eax, 010h
    mov word ptr [edx+edi*1+0ah], ax
    ror eax, 010h
L6d602::
    cmp byte ptr [Dc9b36], 043h
    jb L620e8
    je L6d670
    cmp byte ptr [Dc9b36], 07fh
    ja L6d62e
    push eax
    and eax, dword ptr [Dc9cc0]
    shr eax, 1
    mov word ptr [edx+edi*1+08h], ax
    pop eax
    jmp L620e8
L6d62e::
    push esi
    push ecx
    shld ecx, eax, 018h
    and ecx, 0ffh
    mov esi, dword ptr [ecx*4+Dc9cdc]
    mov ecx, eax
    and ecx, 0ffh
    add esi, dword ptr [ecx*4+Dca0dc]
    mov esi, dword ptr [esi*4+Dca4dc]
    mov cl, byte ptr [Dc9b36]
    call dword ptr [ecx*4+colour_ops-0c0h*4]
    mov word ptr [edx+edi*1+08h], si
    pop ecx
    pop esi
    jmp L620e8
L6d670::
    xor eax, dword ptr [Dc9cc4]
    mov word ptr [edx+edi*1+08h], ax
    xor eax, dword ptr [Dc9cc4]
    jmp L620e8
L6d686::
    test byte ptr [Dc9b39], 040h
    je L6d71b
    cmp byte ptr [Dc9b39], 043h
    jb L6d709
    je L6d6f3
    cmp byte ptr [Dc9b39], 07fh
    ja L6d6b8
    push eax
    and eax, dword ptr [Dc9cc0]
    shr eax, 011h
    mov word ptr [edi+0eh], ax
    pop eax
    jmp L6d709
L6d6b8::
    push esi
    push ecx
    mov ecx, eax
    shr ecx, 018h
    mov esi, dword ptr [ecx*4+Dc9cdc]
    shld ecx, eax, 010h
    and ecx, 0ffh
    add esi, dword ptr [ecx*4+Dca0dc]
    mov esi, dword ptr [esi*4+Dca4dc]
    mov cl, byte ptr [Dc9b39]
    call dword ptr [ecx*4+colour_ops-0c0h*4]
    mov word ptr [edi+0eh], si
    pop ecx
    pop esi
    jmp L6d709
L6d6f3::
    ror eax, 010h
    xor eax, dword ptr [Dc9cc4]
    mov word ptr [edi+0eh], ax
    xor eax, dword ptr [Dc9cc4]
    ror eax, 010h
L6d709::
    test byte ptr [Dc9b38], 040h
    jne L6d725
    mov word ptr [edi+0ch], ax
    jmp L621bb
L6d71b::
    ror eax, 010h
    mov word ptr [edi+0eh], ax
    ror eax, 010h
L6d725::
    cmp byte ptr [Dc9b38], 043h
    jb L621bb
    je L6d791
    cmp byte ptr [Dc9b38], 07fh
    ja L6d750
    push eax
    and eax, dword ptr [Dc9cc0]
    shr eax, 1
    mov word ptr [edi+0ch], ax
    pop eax
    jmp L621bb
L6d750::
    push esi
    push ecx
    shld ecx, eax, 018h
    and ecx, 0ffh
    mov esi, dword ptr [ecx*4+Dc9cdc]
    mov ecx, eax
    and ecx, 0ffh
    add esi, dword ptr [ecx*4+Dca0dc]
    mov esi, dword ptr [esi*4+Dca4dc]
    mov cl, byte ptr [Dc9b38]
    call dword ptr [ecx*4+colour_ops-0c0h*4]
    mov word ptr [edi+0ch], si
    pop ecx
    pop esi
    jmp L621bb
L6d791::
    xor eax, dword ptr [Dc9cc4]
    mov word ptr [edi+0ch], ax
    xor eax, dword ptr [Dc9cc4]
    jmp L621bb
L6d7a6::
    test byte ptr [Dc9b3b], 040h
    je L6d83f
    cmp byte ptr [Dc9b3b], 043h
    jb L6d82c
    je L6d815
    cmp byte ptr [Dc9b3b], 07fh
    ja L6d7d9
    push eax
    and eax, dword ptr [Dc9cc0]
    shr eax, 011h
    mov word ptr [edx+edi*1+0eh], ax
    pop eax
    jmp L6d82c
L6d7d9::
    push esi
    push ecx
    mov ecx, eax
    shr ecx, 018h
    mov esi, dword ptr [ecx*4+Dc9cdc]
    shld ecx, eax, 010h
    and ecx, 0ffh
    add esi, dword ptr [ecx*4+Dca0dc]
    mov esi, dword ptr [esi*4+Dca4dc]
    mov cl, byte ptr [Dc9b3b]
    call dword ptr [ecx*4+colour_ops-0c0h*4]
    mov word ptr [edx+edi*1+0eh], si
    pop ecx
    pop esi
    jmp L6d82c
L6d815::
    ror eax, 010h
    xor eax, dword ptr [Dc9cc4]
    mov word ptr [edx+edi*1+0eh], ax
    xor eax, dword ptr [Dc9cc4]
    ror eax, 010h
L6d82c::
    test byte ptr [Dc9b3a], 040h
    jne L6d84a
    mov word ptr [edx+edi*1+0ch], ax
    jmp L621dd
L6d83f::
    ror eax, 010h
    mov word ptr [edx+edi*1+0eh], ax
    ror eax, 010h
L6d84a::
    cmp byte ptr [Dc9b3a], 043h
    jb L621dd
    je L6d8b8
    cmp byte ptr [Dc9b3a], 07fh
    ja L6d876
    push eax
    and eax, dword ptr [Dc9cc0]
    shr eax, 1
    mov word ptr [edx+edi*1+0ch], ax
    pop eax
    jmp L621dd
L6d876::
    push esi
    push ecx
    shld ecx, eax, 018h
    and ecx, 0ffh
    mov esi, dword ptr [ecx*4+Dc9cdc]
    mov ecx, eax
    and ecx, 0ffh
    add esi, dword ptr [ecx*4+Dca0dc]
    mov esi, dword ptr [esi*4+Dca4dc]
    mov cl, byte ptr [Dc9b3a]
    call dword ptr [ecx*4+colour_ops-0c0h*4]
    mov word ptr [edx+edi*1+0ch], si
    pop ecx
    pop esi
    jmp L621dd
L6d8b8::
    xor eax, dword ptr [Dc9cc4]
    mov word ptr [edx+edi*1+0ch], ax
    xor eax, dword ptr [Dc9cc4]
    jmp L621dd
L6d8ce::
    test byte ptr [Dc9b3d], 040h
    je L6d962
    cmp byte ptr [Dc9b3d], 043h
    jb L6d951
    je L6d93b
    cmp byte ptr [Dc9b3d], 07fh
    ja L6d900
    push eax
    and eax, dword ptr [Dc9cc0]
    shr eax, 011h
    mov word ptr [edi+02h], ax
    pop eax
    jmp L6d951
L6d900::
    push esi
    push ecx
    mov ecx, eax
    shr ecx, 018h
    mov esi, dword ptr [ecx*4+Dc9cdc]
    shld ecx, eax, 010h
    and ecx, 0ffh
    add esi, dword ptr [ecx*4+Dca0dc]
    mov esi, dword ptr [esi*4+Dca4dc]
    mov cl, byte ptr [Dc9b3d]
    call dword ptr [ecx*4+colour_ops-0c0h*4]
    mov word ptr [edi+02h], si
    pop ecx
    pop esi
    jmp L6d951
L6d93b::
    ror eax, 010h
    xor eax, dword ptr [Dc9cc4]
    mov word ptr [edi+02h], ax
    xor eax, dword ptr [Dc9cc4]
    ror eax, 010h
L6d951::
    test byte ptr [Dc9b3c], 040h
    jne L6d96c
    mov word ptr [edi], ax
    jmp L622b5
L6d962::
    ror eax, 010h
    mov word ptr [edi+02h], ax
    ror eax, 010h
L6d96c::
    cmp byte ptr [Dc9b3c], 043h
    jb L622b5
    je L6d9d6
    cmp byte ptr [Dc9b3c], 07fh
    ja L6d996
    push eax
    and eax, dword ptr [Dc9cc0]
    shr eax, 1
    mov word ptr [edi], ax
    pop eax
    jmp L622b5
L6d996::
    push esi
    push ecx
    shld ecx, eax, 018h
    and ecx, 0ffh
    mov esi, dword ptr [ecx*4+Dc9cdc]
    mov ecx, eax
    and ecx, 0ffh
    add esi, dword ptr [ecx*4+Dca0dc]
    mov esi, dword ptr [esi*4+Dca4dc]
    mov cl, byte ptr [Dc9b3c]
    call dword ptr [ecx*4+colour_ops-0c0h*4]
    mov word ptr [edi], si
    pop ecx
    pop esi
    jmp L622b5
L6d9d6::
    xor eax, dword ptr [Dc9cc4]
    mov word ptr [edi], ax
    xor eax, dword ptr [Dc9cc4]
    jmp L622b5
L6d9ea::
    test byte ptr [Dc9b3f], 040h
    je L6da82
    cmp byte ptr [Dc9b3f], 043h
    jb L6da70
    je L6da59
    cmp byte ptr [Dc9b3f], 07fh
    ja L6da1d
    push eax
    and eax, dword ptr [Dc9cc0]
    shr eax, 011h
    mov word ptr [edx+edi*1+02h], ax
    pop eax
    jmp L6da70
L6da1d::
    push esi
    push ecx
    mov ecx, eax
    shr ecx, 018h
    mov esi, dword ptr [ecx*4+Dc9cdc]
    shld ecx, eax, 010h
    and ecx, 0ffh
    add esi, dword ptr [ecx*4+Dca0dc]
    mov esi, dword ptr [esi*4+Dca4dc]
    mov cl, byte ptr [Dc9b3f]
    call dword ptr [ecx*4+colour_ops-0c0h*4]
    mov word ptr [edx+edi*1+02h], si
    pop ecx
    pop esi
    jmp L6da70
L6da59::
    ror eax, 010h
    xor eax, dword ptr [Dc9cc4]
    mov word ptr [edx+edi*1+02h], ax
    xor eax, dword ptr [Dc9cc4]
    ror eax, 010h
L6da70::
    test byte ptr [colour_op], 040h
    jne L6da8d
    mov word ptr [edx+edi*1], ax
    jmp L622d6
L6da82::
    ror eax, 010h
    mov word ptr [edx+edi*1+02h], ax
    ror eax, 010h
L6da8d::
    cmp byte ptr [colour_op], 043h
    jb L622d6
    je L6daf9
    cmp byte ptr [colour_op], 07fh
    ja L6dab8
    push eax
    and eax, dword ptr [Dc9cc0]
    shr eax, 1
    mov word ptr [edx+edi*1], ax
    pop eax
    jmp L622d6
L6dab8::
    push esi
    push ecx
    shld ecx, eax, 018h
    and ecx, 0ffh
    mov esi, dword ptr [ecx*4+Dc9cdc]
    mov ecx, eax
    and ecx, 0ffh
    add esi, dword ptr [ecx*4+Dca0dc]
    mov esi, dword ptr [esi*4+Dca4dc]
    mov cl, byte ptr [colour_op]
    call dword ptr [ecx*4+colour_ops-0c0h*4]
    mov word ptr [edx+edi*1], si
    pop ecx
    pop esi
    jmp L622d6
L6daf9::
    xor eax, dword ptr [Dc9cc4]
    mov word ptr [edx+edi*1], ax
    xor eax, dword ptr [Dc9cc4]
    jmp L622d6
L6db0e::
    test byte ptr [Dc9b41], 040h
    je L6dba3
    cmp byte ptr [Dc9b41], 043h
    jb L6db91
    je L6db7b
    cmp byte ptr [Dc9b41], 07fh
    ja L6db40
    push eax
    and eax, dword ptr [Dc9cc0]
    shr eax, 011h
    mov word ptr [edi+06h], ax
    pop eax
    jmp L6db91
L6db40::
    push esi
    push ecx
    mov ecx, eax
    shr ecx, 018h
    mov esi, dword ptr [ecx*4+Dc9cdc]
    shld ecx, eax, 010h
    and ecx, 0ffh
    add esi, dword ptr [ecx*4+Dca0dc]
    mov esi, dword ptr [esi*4+Dca4dc]
    mov cl, byte ptr [Dc9b41]
    call dword ptr [ecx*4+colour_ops-0c0h*4]
    mov word ptr [edi+06h], si
    pop ecx
    pop esi
    jmp L6db91
L6db7b::
    ror eax, 010h
    xor eax, dword ptr [Dc9cc4]
    mov word ptr [edi+06h], ax
    xor eax, dword ptr [Dc9cc4]
    ror eax, 010h
L6db91::
    test byte ptr [Dc9b40], 040h
    jne L6dbad
    mov word ptr [edi+04h], ax
    jmp L623a9
L6dba3::
    ror eax, 010h
    mov word ptr [edi+06h], ax
    ror eax, 010h
L6dbad::
    cmp byte ptr [Dc9b40], 043h
    jb L623a9
    je L6dc19
    cmp byte ptr [Dc9b40], 07fh
    ja L6dbd8
    push eax
    and eax, dword ptr [Dc9cc0]
    shr eax, 1
    mov word ptr [edi+04h], ax
    pop eax
    jmp L623a9
L6dbd8::
    push esi
    push ecx
    shld ecx, eax, 018h
    and ecx, 0ffh
    mov esi, dword ptr [ecx*4+Dc9cdc]
    mov ecx, eax
    and ecx, 0ffh
    add esi, dword ptr [ecx*4+Dca0dc]
    mov esi, dword ptr [esi*4+Dca4dc]
    mov cl, byte ptr [Dc9b40]
    call dword ptr [ecx*4+colour_ops-0c0h*4]
    mov word ptr [edi+04h], si
    pop ecx
    pop esi
    jmp L623a9
L6dc19::
    xor eax, dword ptr [Dc9cc4]
    mov word ptr [edi+04h], ax
    xor eax, dword ptr [Dc9cc4]
    jmp L623a9
L6dc2e::
    test byte ptr [Dc9b43], 040h
    je L6dcc7
    cmp byte ptr [Dc9b43], 043h
    jb L6dcb4
    je L6dc9d
    cmp byte ptr [Dc9b43], 07fh
    ja L6dc61
    push eax
    and eax, dword ptr [Dc9cc0]
    shr eax, 011h
    mov word ptr [edx+edi*1+06h], ax
    pop eax
    jmp L6dcb4
L6dc61::
    push esi
    push ecx
    mov ecx, eax
    shr ecx, 018h
    mov esi, dword ptr [ecx*4+Dc9cdc]
    shld ecx, eax, 010h
    and ecx, 0ffh
    add esi, dword ptr [ecx*4+Dca0dc]
    mov esi, dword ptr [esi*4+Dca4dc]
    mov cl, byte ptr [Dc9b43]
    call dword ptr [ecx*4+colour_ops-0c0h*4]
    mov word ptr [edx+edi*1+06h], si
    pop ecx
    pop esi
    jmp L6dcb4
L6dc9d::
    ror eax, 010h
    xor eax, dword ptr [Dc9cc4]
    mov word ptr [edx+edi*1+06h], ax
    xor eax, dword ptr [Dc9cc4]
    ror eax, 010h
L6dcb4::
    test byte ptr [Dc9b42], 040h
    jne L6dcd2
    mov word ptr [edx+edi*1+04h], ax
    jmp L623cb
L6dcc7::
    ror eax, 010h
    mov word ptr [edx+edi*1+06h], ax
    ror eax, 010h
L6dcd2::
    cmp byte ptr [Dc9b42], 043h
    jb L623cb
    je L6dd40
    cmp byte ptr [Dc9b42], 07fh
    ja L6dcfe
    push eax
    and eax, dword ptr [Dc9cc0]
    shr eax, 1
    mov word ptr [edx+edi*1+04h], ax
    pop eax
    jmp L623cb
L6dcfe::
    push esi
    push ecx
    shld ecx, eax, 018h
    and ecx, 0ffh
    mov esi, dword ptr [ecx*4+Dc9cdc]
    mov ecx, eax
    and ecx, 0ffh
    add esi, dword ptr [ecx*4+Dca0dc]
    mov esi, dword ptr [esi*4+Dca4dc]
    mov cl, byte ptr [Dc9b42]
    call dword ptr [ecx*4+colour_ops-0c0h*4]
    mov word ptr [edx+edi*1+04h], si
    pop ecx
    pop esi
    jmp L623cb
L6dd40::
    xor eax, dword ptr [Dc9cc4]
    mov word ptr [edx+edi*1+04h], ax
    xor eax, dword ptr [Dc9cc4]
    jmp L623cb
L6dd56::
    test byte ptr [Dc9b45], 040h
    je L6ddeb
    cmp byte ptr [Dc9b45], 043h
    jb L6ddd9
    je L6ddc3
    cmp byte ptr [Dc9b45], 07fh
    ja L6dd88
    push eax
    and eax, dword ptr [Dc9cc0]
    shr eax, 011h
    mov word ptr [edi+0ah], ax
    pop eax
    jmp L6ddd9
L6dd88::
    push esi
    push ecx
    mov ecx, eax
    shr ecx, 018h
    mov esi, dword ptr [ecx*4+Dc9cdc]
    shld ecx, eax, 010h
    and ecx, 0ffh
    add esi, dword ptr [ecx*4+Dca0dc]
    mov esi, dword ptr [esi*4+Dca4dc]
    mov cl, byte ptr [Dc9b45]
    call dword ptr [ecx*4+colour_ops-0c0h*4]
    mov word ptr [edi+0ah], si
    pop ecx
    pop esi
    jmp L6ddd9
L6ddc3::
    ror eax, 010h
    xor eax, dword ptr [Dc9cc4]
    mov word ptr [edi+0ah], ax
    xor eax, dword ptr [Dc9cc4]
    ror eax, 010h
L6ddd9::
    test byte ptr [Dc9b44], 040h
    jne L6ddf5
    mov word ptr [edi+08h], ax
    jmp L6249e
L6ddeb::
    ror eax, 010h
    mov word ptr [edi+0ah], ax
    ror eax, 010h
L6ddf5::
    cmp byte ptr [Dc9b44], 043h
    jb L6249e
    je L6de61
    cmp byte ptr [Dc9b44], 07fh
    ja L6de20
    push eax
    and eax, dword ptr [Dc9cc0]
    shr eax, 1
    mov word ptr [edi+08h], ax
    pop eax
    jmp L6249e
L6de20::
    push esi
    push ecx
    shld ecx, eax, 018h
    and ecx, 0ffh
    mov esi, dword ptr [ecx*4+Dc9cdc]
    mov ecx, eax
    and ecx, 0ffh
    add esi, dword ptr [ecx*4+Dca0dc]
    mov esi, dword ptr [esi*4+Dca4dc]
    mov cl, byte ptr [Dc9b44]
    call dword ptr [ecx*4+colour_ops-0c0h*4]
    mov word ptr [edi+08h], si
    pop ecx
    pop esi
    jmp L6249e
L6de61::
    xor eax, dword ptr [Dc9cc4]
    mov word ptr [edi+08h], ax
    xor eax, dword ptr [Dc9cc4]
    jmp L6249e
L6de76::
    test byte ptr [Dc9b47], 040h
    je L6df0f
    cmp byte ptr [Dc9b47], 043h
    jb L6defc
    je L6dee5
    cmp byte ptr [Dc9b47], 07fh
    ja L6dea9
    push eax
    and eax, dword ptr [Dc9cc0]
    shr eax, 011h
    mov word ptr [edx+edi*1+0ah], ax
    pop eax
    jmp L6defc
L6dea9::
    push esi
    push ecx
    mov ecx, eax
    shr ecx, 018h
    mov esi, dword ptr [ecx*4+Dc9cdc]
    shld ecx, eax, 010h
    and ecx, 0ffh
    add esi, dword ptr [ecx*4+Dca0dc]
    mov esi, dword ptr [esi*4+Dca4dc]
    mov cl, byte ptr [Dc9b47]
    call dword ptr [ecx*4+colour_ops-0c0h*4]
    mov word ptr [edx+edi*1+0ah], si
    pop ecx
    pop esi
    jmp L6defc
L6dee5::
    ror eax, 010h
    xor eax, dword ptr [Dc9cc4]
    mov word ptr [edx+edi*1+0ah], ax
    xor eax, dword ptr [Dc9cc4]
    ror eax, 010h
L6defc::
    test byte ptr [Dc9b46], 040h
    jne L6df1a
    mov word ptr [edx+edi*1+08h], ax
    jmp L624c0
L6df0f::
    ror eax, 010h
    mov word ptr [edx+edi*1+0ah], ax
    ror eax, 010h
L6df1a::
    cmp byte ptr [Dc9b46], 043h
    jb L624c0
    je L6df88
    cmp byte ptr [Dc9b46], 07fh
    ja L6df46
    push eax
    and eax, dword ptr [Dc9cc0]
    shr eax, 1
    mov word ptr [edx+edi*1+08h], ax
    pop eax
    jmp L624c0
L6df46::
    push esi
    push ecx
    shld ecx, eax, 018h
    and ecx, 0ffh
    mov esi, dword ptr [ecx*4+Dc9cdc]
    mov ecx, eax
    and ecx, 0ffh
    add esi, dword ptr [ecx*4+Dca0dc]
    mov esi, dword ptr [esi*4+Dca4dc]
    mov cl, byte ptr [Dc9b46]
    call dword ptr [ecx*4+colour_ops-0c0h*4]
    mov word ptr [edx+edi*1+08h], si
    pop ecx
    pop esi
    jmp L624c0
L6df88::
    xor eax, dword ptr [Dc9cc4]
    mov word ptr [edx+edi*1+08h], ax
    xor eax, dword ptr [Dc9cc4]
    jmp L624c0
L6df9e::
    test byte ptr [Dc9b49], 040h
    je L6e033
    cmp byte ptr [Dc9b49], 043h
    jb L6e021
    je L6e00b
    cmp byte ptr [Dc9b49], 07fh
    ja L6dfd0
    push eax
    and eax, dword ptr [Dc9cc0]
    shr eax, 011h
    mov word ptr [edi+0eh], ax
    pop eax
    jmp L6e021
L6dfd0::
    push esi
    push ecx
    mov ecx, eax
    shr ecx, 018h
    mov esi, dword ptr [ecx*4+Dc9cdc]
    shld ecx, eax, 010h
    and ecx, 0ffh
    add esi, dword ptr [ecx*4+Dca0dc]
    mov esi, dword ptr [esi*4+Dca4dc]
    mov cl, byte ptr [Dc9b49]
    call dword ptr [ecx*4+colour_ops-0c0h*4]
    mov word ptr [edi+0eh], si
    pop ecx
    pop esi
    jmp L6e021
L6e00b::
    ror eax, 010h
    xor eax, dword ptr [Dc9cc4]
    mov word ptr [edi+0eh], ax
    xor eax, dword ptr [Dc9cc4]
    ror eax, 010h
L6e021::
    test byte ptr [Dc9b48], 040h
    jne L6e03d
    mov word ptr [edi+0ch], ax
    jmp L62593
L6e033::
    ror eax, 010h
    mov word ptr [edi+0eh], ax
    ror eax, 010h
L6e03d::
    cmp byte ptr [Dc9b48], 043h
    jb L62593
    je L6e0a9
    cmp byte ptr [Dc9b48], 07fh
    ja L6e068
    push eax
    and eax, dword ptr [Dc9cc0]
    shr eax, 1
    mov word ptr [edi+0ch], ax
    pop eax
    jmp L62593
L6e068::
    push esi
    push ecx
    shld ecx, eax, 018h
    and ecx, 0ffh
    mov esi, dword ptr [ecx*4+Dc9cdc]
    mov ecx, eax
    and ecx, 0ffh
    add esi, dword ptr [ecx*4+Dca0dc]
    mov esi, dword ptr [esi*4+Dca4dc]
    mov cl, byte ptr [Dc9b48]
    call dword ptr [ecx*4+colour_ops-0c0h*4]
    mov word ptr [edi+0ch], si
    pop ecx
    pop esi
    jmp L62593
L6e0a9::
    xor eax, dword ptr [Dc9cc4]
    mov word ptr [edi+0ch], ax
    xor eax, dword ptr [Dc9cc4]
    jmp L62593
L6e0be::
    test byte ptr [Dc9b4b], 040h
    je L6e157
    cmp byte ptr [Dc9b4b], 043h
    jb L6e144
    je L6e12d
    cmp byte ptr [Dc9b4b], 07fh
    ja L6e0f1
    push eax
    and eax, dword ptr [Dc9cc0]
    shr eax, 011h
    mov word ptr [edx+edi*1+0eh], ax
    pop eax
    jmp L6e144
L6e0f1::
    push esi
    push ecx
    mov ecx, eax
    shr ecx, 018h
    mov esi, dword ptr [ecx*4+Dc9cdc]
    shld ecx, eax, 010h
    and ecx, 0ffh
    add esi, dword ptr [ecx*4+Dca0dc]
    mov esi, dword ptr [esi*4+Dca4dc]
    mov cl, byte ptr [Dc9b4b]
    call dword ptr [ecx*4+colour_ops-0c0h*4]
    mov word ptr [edx+edi*1+0eh], si
    pop ecx
    pop esi
    jmp L6e144
L6e12d::
    ror eax, 010h
    xor eax, dword ptr [Dc9cc4]
    mov word ptr [edx+edi*1+0eh], ax
    xor eax, dword ptr [Dc9cc4]
    ror eax, 010h
L6e144::
    test byte ptr [Dc9b4a], 040h
    jne L6e162
    mov word ptr [edx+edi*1+0ch], ax
    jmp L625b5
L6e157::
    ror eax, 010h
    mov word ptr [edx+edi*1+0eh], ax
    ror eax, 010h
L6e162::
    cmp byte ptr [Dc9b4a], 043h
    jb L625b5
    je L6e1d0
    cmp byte ptr [Dc9b4a], 07fh
    ja L6e18e
    push eax
    and eax, dword ptr [Dc9cc0]
    shr eax, 1
    mov word ptr [edx+edi*1+0ch], ax
    pop eax
    jmp L625b5
L6e18e::
    push esi
    push ecx
    shld ecx, eax, 018h
    and ecx, 0ffh
    mov esi, dword ptr [ecx*4+Dc9cdc]
    mov ecx, eax
    and ecx, 0ffh
    add esi, dword ptr [ecx*4+Dca0dc]
    mov esi, dword ptr [esi*4+Dca4dc]
    mov cl, byte ptr [Dc9b4a]
    call dword ptr [ecx*4+colour_ops-0c0h*4]
    mov word ptr [edx+edi*1+0ch], si
    pop ecx
    pop esi
    jmp L625b5
L6e1d0::
    xor eax, dword ptr [Dc9cc4]
    mov word ptr [edx+edi*1+0ch], ax
    xor eax, dword ptr [Dc9cc4]
    jmp L625b5
L6e1e6::
    test byte ptr [Dc9b4d], 040h
    je L6e27a
    cmp byte ptr [Dc9b4d], 043h
    jb L6e269
    je L6e253
    cmp byte ptr [Dc9b4d], 07fh
    ja L6e218
    push eax
    and eax, dword ptr [Dc9cc0]
    shr eax, 011h
    mov word ptr [edi+02h], ax
    pop eax
    jmp L6e269
L6e218::
    push esi
    push ecx
    mov ecx, eax
    shr ecx, 018h
    mov esi, dword ptr [ecx*4+Dc9cdc]
    shld ecx, eax, 010h
    and ecx, 0ffh
    add esi, dword ptr [ecx*4+Dca0dc]
    mov esi, dword ptr [esi*4+Dca4dc]
    mov cl, byte ptr [Dc9b4d]
    call dword ptr [ecx*4+colour_ops-0c0h*4]
    mov word ptr [edi+02h], si
    pop ecx
    pop esi
    jmp L6e269
L6e253::
    ror eax, 010h
    xor eax, dword ptr [Dc9cc4]
    mov word ptr [edi+02h], ax
    xor eax, dword ptr [Dc9cc4]
    ror eax, 010h
L6e269::
    test byte ptr [Dc9b4c], 040h
    jne L6e284
    mov word ptr [edi], ax
    jmp L6268d
L6e27a::
    ror eax, 010h
    mov word ptr [edi+02h], ax
    ror eax, 010h
L6e284::
    cmp byte ptr [Dc9b4c], 043h
    jb L6268d
    je L6e2ee
    cmp byte ptr [Dc9b4c], 07fh
    ja L6e2ae
    push eax
    and eax, dword ptr [Dc9cc0]
    shr eax, 1
    mov word ptr [edi], ax
    pop eax
    jmp L6268d
L6e2ae::
    push esi
    push ecx
    shld ecx, eax, 018h
    and ecx, 0ffh
    mov esi, dword ptr [ecx*4+Dc9cdc]
    mov ecx, eax
    and ecx, 0ffh
    add esi, dword ptr [ecx*4+Dca0dc]
    mov esi, dword ptr [esi*4+Dca4dc]
    mov cl, byte ptr [Dc9b4c]
    call dword ptr [ecx*4+colour_ops-0c0h*4]
    mov word ptr [edi], si
    pop ecx
    pop esi
    jmp L6268d
L6e2ee::
    xor eax, dword ptr [Dc9cc4]
    mov word ptr [edi], ax
    xor eax, dword ptr [Dc9cc4]
    jmp L6268d
L6e302::
    test byte ptr [Dc9b4f], 040h
    je L6e39a
    cmp byte ptr [Dc9b4f], 043h
    jb L6e388
    je L6e371
    cmp byte ptr [Dc9b4f], 07fh
    ja L6e335
    push eax
    and eax, dword ptr [Dc9cc0]
    shr eax, 011h
    mov word ptr [edx+edi*1+02h], ax
    pop eax
    jmp L6e388
L6e335::
    push esi
    push ecx
    mov ecx, eax
    shr ecx, 018h
    mov esi, dword ptr [ecx*4+Dc9cdc]
    shld ecx, eax, 010h
    and ecx, 0ffh
    add esi, dword ptr [ecx*4+Dca0dc]
    mov esi, dword ptr [esi*4+Dca4dc]
    mov cl, byte ptr [Dc9b4f]
    call dword ptr [ecx*4+colour_ops-0c0h*4]
    mov word ptr [edx+edi*1+02h], si
    pop ecx
    pop esi
    jmp L6e388
L6e371::
    ror eax, 010h
    xor eax, dword ptr [Dc9cc4]
    mov word ptr [edx+edi*1+02h], ax
    xor eax, dword ptr [Dc9cc4]
    ror eax, 010h
L6e388::
    test byte ptr [Dc9b4e], 040h
    jne L6e3a5
    mov word ptr [edx+edi*1], ax
    jmp L626ae
L6e39a::
    ror eax, 010h
    mov word ptr [edx+edi*1+02h], ax
    ror eax, 010h
L6e3a5::
    cmp byte ptr [Dc9b4e], 043h
    jb L626ae
    je L6e411
    cmp byte ptr [Dc9b4e], 07fh
    ja L6e3d0
    push eax
    and eax, dword ptr [Dc9cc0]
    shr eax, 1
    mov word ptr [edx+edi*1], ax
    pop eax
    jmp L626ae
L6e3d0::
    push esi
    push ecx
    shld ecx, eax, 018h
    and ecx, 0ffh
    mov esi, dword ptr [ecx*4+Dc9cdc]
    mov ecx, eax
    and ecx, 0ffh
    add esi, dword ptr [ecx*4+Dca0dc]
    mov esi, dword ptr [esi*4+Dca4dc]
    mov cl, byte ptr [Dc9b4e]
    call dword ptr [ecx*4+colour_ops-0c0h*4]
    mov word ptr [edx+edi*1], si
    pop ecx
    pop esi
    jmp L626ae
L6e411::
    xor eax, dword ptr [Dc9cc4]
    mov word ptr [edx+edi*1], ax
    xor eax, dword ptr [Dc9cc4]
    jmp L626ae
L6e426::
    test byte ptr [Dc9b51], 040h
    je L6e4bb
    cmp byte ptr [Dc9b51], 043h
    jb L6e4a9
    je L6e493
    cmp byte ptr [Dc9b51], 07fh
    ja L6e458
    push eax
    and eax, dword ptr [Dc9cc0]
    shr eax, 011h
    mov word ptr [edi+06h], ax
    pop eax
    jmp L6e4a9
L6e458::
    push esi
    push ecx
    mov ecx, eax
    shr ecx, 018h
    mov esi, dword ptr [ecx*4+Dc9cdc]
    shld ecx, eax, 010h
    and ecx, 0ffh
    add esi, dword ptr [ecx*4+Dca0dc]
    mov esi, dword ptr [esi*4+Dca4dc]
    mov cl, byte ptr [Dc9b51]
    call dword ptr [ecx*4+colour_ops-0c0h*4]
    mov word ptr [edi+06h], si
    pop ecx
    pop esi
    jmp L6e4a9
L6e493::
    ror eax, 010h
    xor eax, dword ptr [Dc9cc4]
    mov word ptr [edi+06h], ax
    xor eax, dword ptr [Dc9cc4]
    ror eax, 010h
L6e4a9::
    test byte ptr [Dc9b50], 040h
    jne L6e4c5
    mov word ptr [edi+04h], ax
    jmp L62781
L6e4bb::
    ror eax, 010h
    mov word ptr [edi+06h], ax
    ror eax, 010h
L6e4c5::
    cmp byte ptr [Dc9b50], 043h
    jb L62781
    je L6e531
    cmp byte ptr [Dc9b50], 07fh
    ja L6e4f0
    push eax
    and eax, dword ptr [Dc9cc0]
    shr eax, 1
    mov word ptr [edi+04h], ax
    pop eax
    jmp L62781
L6e4f0::
    push esi
    push ecx
    shld ecx, eax, 018h
    and ecx, 0ffh
    mov esi, dword ptr [ecx*4+Dc9cdc]
    mov ecx, eax
    and ecx, 0ffh
    add esi, dword ptr [ecx*4+Dca0dc]
    mov esi, dword ptr [esi*4+Dca4dc]
    mov cl, byte ptr [Dc9b50]
    call dword ptr [ecx*4+colour_ops-0c0h*4]
    mov word ptr [edi+04h], si
    pop ecx
    pop esi
    jmp L62781
L6e531::
    xor eax, dword ptr [Dc9cc4]
    mov word ptr [edi+04h], ax
    xor eax, dword ptr [Dc9cc4]
    jmp L62781
L6e546::
    test byte ptr [Dc9b53], 040h
    je L6e5df
    cmp byte ptr [Dc9b53], 043h
    jb L6e5cc
    je L6e5b5
    cmp byte ptr [Dc9b53], 07fh
    ja L6e579
    push eax
    and eax, dword ptr [Dc9cc0]
    shr eax, 011h
    mov word ptr [edx+edi*1+06h], ax
    pop eax
    jmp L6e5cc
L6e579::
    push esi
    push ecx
    mov ecx, eax
    shr ecx, 018h
    mov esi, dword ptr [ecx*4+Dc9cdc]
    shld ecx, eax, 010h
    and ecx, 0ffh
    add esi, dword ptr [ecx*4+Dca0dc]
    mov esi, dword ptr [esi*4+Dca4dc]
    mov cl, byte ptr [Dc9b53]
    call dword ptr [ecx*4+colour_ops-0c0h*4]
    mov word ptr [edx+edi*1+06h], si
    pop ecx
    pop esi
    jmp L6e5cc
L6e5b5::
    ror eax, 010h
    xor eax, dword ptr [Dc9cc4]
    mov word ptr [edx+edi*1+06h], ax
    xor eax, dword ptr [Dc9cc4]
    ror eax, 010h
L6e5cc::
    test byte ptr [Dc9b52], 040h
    jne L6e5ea
    mov word ptr [edx+edi*1+04h], ax
    jmp L627a3
L6e5df::
    ror eax, 010h
    mov word ptr [edx+edi*1+06h], ax
    ror eax, 010h
L6e5ea::
    cmp byte ptr [Dc9b52], 043h
    jb L627a3
    je L6e658
    cmp byte ptr [Dc9b52], 07fh
    ja L6e616
    push eax
    and eax, dword ptr [Dc9cc0]
    shr eax, 1
    mov word ptr [edx+edi*1+04h], ax
    pop eax
    jmp L627a3
L6e616::
    push esi
    push ecx
    shld ecx, eax, 018h
    and ecx, 0ffh
    mov esi, dword ptr [ecx*4+Dc9cdc]
    mov ecx, eax
    and ecx, 0ffh
    add esi, dword ptr [ecx*4+Dca0dc]
    mov esi, dword ptr [esi*4+Dca4dc]
    mov cl, byte ptr [Dc9b52]
    call dword ptr [ecx*4+colour_ops-0c0h*4]
    mov word ptr [edx+edi*1+04h], si
    pop ecx
    pop esi
    jmp L627a3
L6e658::
    xor eax, dword ptr [Dc9cc4]
    mov word ptr [edx+edi*1+04h], ax
    xor eax, dword ptr [Dc9cc4]
    jmp L627a3
L6e66e::
    test byte ptr [Dc9b55], 040h
    je L6e703
    cmp byte ptr [Dc9b55], 043h
    jb L6e6f1
    je L6e6db
    cmp byte ptr [Dc9b55], 07fh
    ja L6e6a0
    push eax
    and eax, dword ptr [Dc9cc0]
    shr eax, 011h
    mov word ptr [edi+0ah], ax
    pop eax
    jmp L6e6f1
L6e6a0::
    push esi
    push ecx
    mov ecx, eax
    shr ecx, 018h
    mov esi, dword ptr [ecx*4+Dc9cdc]
    shld ecx, eax, 010h
    and ecx, 0ffh
    add esi, dword ptr [ecx*4+Dca0dc]
    mov esi, dword ptr [esi*4+Dca4dc]
    mov cl, byte ptr [Dc9b55]
    call dword ptr [ecx*4+colour_ops-0c0h*4]
    mov word ptr [edi+0ah], si
    pop ecx
    pop esi
    jmp L6e6f1
L6e6db::
    ror eax, 010h
    xor eax, dword ptr [Dc9cc4]
    mov word ptr [edi+0ah], ax
    xor eax, dword ptr [Dc9cc4]
    ror eax, 010h
L6e6f1::
    test byte ptr [Dc9b54], 040h
    jne L6e70d
    mov word ptr [edi+08h], ax
    jmp L62876
L6e703::
    ror eax, 010h
    mov word ptr [edi+0ah], ax
    ror eax, 010h
L6e70d::
    cmp byte ptr [Dc9b54], 043h
    jb L62876
    je L6e779
    cmp byte ptr [Dc9b54], 07fh
    ja L6e738
    push eax
    and eax, dword ptr [Dc9cc0]
    shr eax, 1
    mov word ptr [edi+08h], ax
    pop eax
    jmp L62876
L6e738::
    push esi
    push ecx
    shld ecx, eax, 018h
    and ecx, 0ffh
    mov esi, dword ptr [ecx*4+Dc9cdc]
    mov ecx, eax
    and ecx, 0ffh
    add esi, dword ptr [ecx*4+Dca0dc]
    mov esi, dword ptr [esi*4+Dca4dc]
    mov cl, byte ptr [Dc9b54]
    call dword ptr [ecx*4+colour_ops-0c0h*4]
    mov word ptr [edi+08h], si
    pop ecx
    pop esi
    jmp L62876
L6e779::
    xor eax, dword ptr [Dc9cc4]
    mov word ptr [edi+08h], ax
    xor eax, dword ptr [Dc9cc4]
    jmp L62876
L6e78e::
    test byte ptr [Dc9b57], 040h
    je L6e827
    cmp byte ptr [Dc9b57], 043h
    jb L6e814
    je L6e7fd
    cmp byte ptr [Dc9b57], 07fh
    ja L6e7c1
    push eax
    and eax, dword ptr [Dc9cc0]
    shr eax, 011h
    mov word ptr [edx+edi*1+0ah], ax
    pop eax
    jmp L6e814
L6e7c1::
    push esi
    push ecx
    mov ecx, eax
    shr ecx, 018h
    mov esi, dword ptr [ecx*4+Dc9cdc]
    shld ecx, eax, 010h
    and ecx, 0ffh
    add esi, dword ptr [ecx*4+Dca0dc]
    mov esi, dword ptr [esi*4+Dca4dc]
    mov cl, byte ptr [Dc9b57]
    call dword ptr [ecx*4+colour_ops-0c0h*4]
    mov word ptr [edx+edi*1+0ah], si
    pop ecx
    pop esi
    jmp L6e814
L6e7fd::
    ror eax, 010h
    xor eax, dword ptr [Dc9cc4]
    mov word ptr [edx+edi*1+0ah], ax
    xor eax, dword ptr [Dc9cc4]
    ror eax, 010h
L6e814::
    test byte ptr [Dc9b56], 040h
    jne L6e832
    mov word ptr [edx+edi*1+08h], ax
    jmp L62898
L6e827::
    ror eax, 010h
    mov word ptr [edx+edi*1+0ah], ax
    ror eax, 010h
L6e832::
    cmp byte ptr [Dc9b56], 043h
    jb L62898
    je L6e8a0
    cmp byte ptr [Dc9b56], 07fh
    ja L6e85e
    push eax
    and eax, dword ptr [Dc9cc0]
    shr eax, 1
    mov word ptr [edx+edi*1+08h], ax
    pop eax
    jmp L62898
L6e85e::
    push esi
    push ecx
    shld ecx, eax, 018h
    and ecx, 0ffh
    mov esi, dword ptr [ecx*4+Dc9cdc]
    mov ecx, eax
    and ecx, 0ffh
    add esi, dword ptr [ecx*4+Dca0dc]
    mov esi, dword ptr [esi*4+Dca4dc]
    mov cl, byte ptr [Dc9b56]
    call dword ptr [ecx*4+colour_ops-0c0h*4]
    mov word ptr [edx+edi*1+08h], si
    pop ecx
    pop esi
    jmp L62898
L6e8a0::
    xor eax, dword ptr [Dc9cc4]
    mov word ptr [edx+edi*1+08h], ax
    xor eax, dword ptr [Dc9cc4]
    jmp L62898
L6e8b6::
    test byte ptr [Dc9b59], 040h
    je L6e94b
    cmp byte ptr [Dc9b59], 043h
    jb L6e939
    je L6e923
    cmp byte ptr [Dc9b59], 07fh
    ja L6e8e8
    push eax
    and eax, dword ptr [Dc9cc0]
    shr eax, 011h
    mov word ptr [edi+0eh], ax
    pop eax
    jmp L6e939
L6e8e8::
    push esi
    push ecx
    mov ecx, eax
    shr ecx, 018h
    mov esi, dword ptr [ecx*4+Dc9cdc]
    shld ecx, eax, 010h
    and ecx, 0ffh
    add esi, dword ptr [ecx*4+Dca0dc]
    mov esi, dword ptr [esi*4+Dca4dc]
    mov cl, byte ptr [Dc9b59]
    call dword ptr [ecx*4+colour_ops-0c0h*4]
    mov word ptr [edi+0eh], si
    pop ecx
    pop esi
    jmp L6e939
L6e923::
    ror eax, 010h
    xor eax, dword ptr [Dc9cc4]
    mov word ptr [edi+0eh], ax
    xor eax, dword ptr [Dc9cc4]
    ror eax, 010h
L6e939::
    test byte ptr [Dc9b58], 040h
    jne L6e955
    mov word ptr [edi+0ch], ax
    jmp L6296b
L6e94b::
    ror eax, 010h
    mov word ptr [edi+0eh], ax
    ror eax, 010h
L6e955::
    cmp byte ptr [Dc9b58], 043h
    jb L6296b
    je L6e9c1
    cmp byte ptr [Dc9b58], 07fh
    ja L6e980
    push eax
    and eax, dword ptr [Dc9cc0]
    shr eax, 1
    mov word ptr [edi+0ch], ax
    pop eax
    jmp L6296b
L6e980::
    push esi
    push ecx
    shld ecx, eax, 018h
    and ecx, 0ffh
    mov esi, dword ptr [ecx*4+Dc9cdc]
    mov ecx, eax
    and ecx, 0ffh
    add esi, dword ptr [ecx*4+Dca0dc]
    mov esi, dword ptr [esi*4+Dca4dc]
    mov cl, byte ptr [Dc9b58]
    call dword ptr [ecx*4+colour_ops-0c0h*4]
    mov word ptr [edi+0ch], si
    pop ecx
    pop esi
    jmp L6296b
L6e9c1::
    xor eax, dword ptr [Dc9cc4]
    mov word ptr [edi+0ch], ax
    xor eax, dword ptr [Dc9cc4]
    jmp L6296b
L6e9d6::
    test byte ptr [Dc9b5b], 040h
    je L6ea6f
    cmp byte ptr [Dc9b5b], 043h
    jb L6ea5c
    je L6ea45
    cmp byte ptr [Dc9b5b], 07fh
    ja L6ea09
    push eax
    and eax, dword ptr [Dc9cc0]
    shr eax, 011h
    mov word ptr [edx+edi*1+0eh], ax
    pop eax
    jmp L6ea5c
L6ea09::
    push esi
    push ecx
    mov ecx, eax
    shr ecx, 018h
    mov esi, dword ptr [ecx*4+Dc9cdc]
    shld ecx, eax, 010h
    and ecx, 0ffh
    add esi, dword ptr [ecx*4+Dca0dc]
    mov esi, dword ptr [esi*4+Dca4dc]
    mov cl, byte ptr [Dc9b5b]
    call dword ptr [ecx*4+colour_ops-0c0h*4]
    mov word ptr [edx+edi*1+0eh], si
    pop ecx
    pop esi
    jmp L6ea5c
L6ea45::
    ror eax, 010h
    xor eax, dword ptr [Dc9cc4]
    mov word ptr [edx+edi*1+0eh], ax
    xor eax, dword ptr [Dc9cc4]
    ror eax, 010h
L6ea5c::
    test byte ptr [Dc9b5a], 040h
    jne L6ea7a
    mov word ptr [edx+edi*1+0ch], ax
    jmp L6298d
L6ea6f::
    ror eax, 010h
    mov word ptr [edx+edi*1+0eh], ax
    ror eax, 010h
L6ea7a::
    cmp byte ptr [Dc9b5a], 043h
    jb L6298d
    je L6eae8
    cmp byte ptr [Dc9b5a], 07fh
    ja L6eaa6
    push eax
    and eax, dword ptr [Dc9cc0]
    shr eax, 1
    mov word ptr [edx+edi*1+0ch], ax
    pop eax
    jmp L6298d
L6eaa6::
    push esi
    push ecx
    shld ecx, eax, 018h
    and ecx, 0ffh
    mov esi, dword ptr [ecx*4+Dc9cdc]
    mov ecx, eax
    and ecx, 0ffh
    add esi, dword ptr [ecx*4+Dca0dc]
    mov esi, dword ptr [esi*4+Dca4dc]
    mov cl, byte ptr [Dc9b5a]
    call dword ptr [ecx*4+colour_ops-0c0h*4]
    mov word ptr [edx+edi*1+0ch], si
    pop ecx
    pop esi
    jmp L6298d
L6eae8::
    xor eax, dword ptr [Dc9cc4]
    mov word ptr [edx+edi*1+0ch], ax
    xor eax, dword ptr [Dc9cc4]
    jmp L6298d
L6eafe::
    test byte ptr [eax*4+Dc9b1d], 040h
    je L6eb9c
    cmp byte ptr [eax*4+Dc9b1d], 043h
    jb L6eb88
    je L6eb71
    cmp byte ptr [eax*4+Dc9b1d], 07fh
    ja L6eb34
    push ebx
    and ebx, dword ptr [Dc9cc0]
    shr ebx, 011h
    mov word ptr [ebp+edi*1+02h], bx
    pop ebx
    jmp L6eb88
L6eb34::
    push esi
    push ecx
    mov ecx, ebx
    shr ecx, 018h
    mov esi, dword ptr [ecx*4+Dc9cdc]
    shld ecx, ebx, 010h
    and ecx, 0ffh
    add esi, dword ptr [ecx*4+Dca0dc]
    mov esi, dword ptr [esi*4+Dca4dc]
    mov cl, byte ptr [eax*4+Dc9b1d]
    call dword ptr [ecx*4+colour_ops-0c0h*4]
    mov word ptr [ebp+edi*1+02h], si
    pop ecx
    pop esi
    jmp L6eb88
L6eb71::
    ror ebx, 010h
    xor ebx, dword ptr [Dc9cc4]
    mov word ptr [ebp+edi*1+02h], bx
    xor ebx, dword ptr [Dc9cc4]
    ror ebx, 010h
L6eb88::
    test byte ptr [eax*4+Dc9b1c], 040h
    jne L6eba7
    mov word ptr [ebp+edi*1+00h], bx
    jmp L62aa0
L6eb9c::
    ror ebx, 010h
    mov word ptr [ebp+edi*1+02h], bx
    ror ebx, 010h
L6eba7::
    cmp byte ptr [eax*4+Dc9b1c], 043h
    jb L62aa0
    je L6ec18
    cmp byte ptr [eax*4+Dc9b1c], 07fh
    ja L6ebd5
    push ebx
    and ebx, dword ptr [Dc9cc0]
    shr ebx, 1
    mov word ptr [ebp+edi*1+00h], bx
    pop ebx
    jmp L62aa0
L6ebd5::
    push esi
    push ecx
    shld ecx, ebx, 018h
    and ecx, 0ffh
    mov esi, dword ptr [ecx*4+Dc9cdc]
    mov ecx, ebx
    and ecx, 0ffh
    add esi, dword ptr [ecx*4+Dca0dc]
    mov esi, dword ptr [esi*4+Dca4dc]
    mov cl, byte ptr [eax*4+Dc9b1c]
    call dword ptr [ecx*4+colour_ops-0c0h*4]
    mov word ptr [ebp+edi*1+00h], si
    pop ecx
    pop esi
    jmp L62aa0
L6ec18::
    xor ebx, dword ptr [Dc9cc4]
    mov word ptr [ebp+edi*1+00h], bx
    xor ebx, dword ptr [Dc9cc4]
    jmp L62aa0
L6ec2e::
    test byte ptr [eax*4+Dc9b1f], 040h
    je L6eccc
    cmp byte ptr [eax*4+Dc9b1f], 043h
    jb L6ecb8
    je L6eca1
    cmp byte ptr [eax*4+Dc9b1f], 07fh
    ja L6ec64
    push ebx
    and ebx, dword ptr [Dc9cc0]
    shr ebx, 011h
    mov word ptr [ebp+edi*1+02h], bx
    pop ebx
    jmp L6ecb8
L6ec64::
    push esi
    push ecx
    mov ecx, ebx
    shr ecx, 018h
    mov esi, dword ptr [ecx*4+Dc9cdc]
    shld ecx, ebx, 010h
    and ecx, 0ffh
    add esi, dword ptr [ecx*4+Dca0dc]
    mov esi, dword ptr [esi*4+Dca4dc]
    mov cl, byte ptr [eax*4+Dc9b1f]
    call dword ptr [ecx*4+colour_ops-0c0h*4]
    mov word ptr [ebp+edi*1+02h], si
    pop ecx
    pop esi
    jmp L6ecb8
L6eca1::
    ror ebx, 010h
    xor ebx, dword ptr [Dc9cc4]
    mov word ptr [ebp+edi*1+02h], bx
    xor ebx, dword ptr [Dc9cc4]
    ror ebx, 010h
L6ecb8::
    test byte ptr [eax*4+Dc9b1e], 040h
    jne L6ecd7
    mov word ptr [ebp+edi*1+00h], bx
    jmp L62ac5
L6eccc::
    ror ebx, 010h
    mov word ptr [ebp+edi*1+02h], bx
    ror ebx, 010h
L6ecd7::
    cmp byte ptr [eax*4+Dc9b1e], 043h
    jb L62ac5
    je L6ed48
    cmp byte ptr [eax*4+Dc9b1e], 07fh
    ja L6ed05
    push ebx
    and ebx, dword ptr [Dc9cc0]
    shr ebx, 1
    mov word ptr [ebp+edi*1+00h], bx
    pop ebx
    jmp L62ac5
L6ed05::
    push esi
    push ecx
    shld ecx, ebx, 018h
    and ecx, 0ffh
    mov esi, dword ptr [ecx*4+Dc9cdc]
    mov ecx, ebx
    and ecx, 0ffh
    add esi, dword ptr [ecx*4+Dca0dc]
    mov esi, dword ptr [esi*4+Dca4dc]
    mov cl, byte ptr [eax*4+Dc9b1e]
    call dword ptr [ecx*4+colour_ops-0c0h*4]
    mov word ptr [ebp+edi*1+00h], si
    pop ecx
    pop esi
    jmp L62ac5
L6ed48::
    xor ebx, dword ptr [Dc9cc4]
    mov word ptr [ebp+edi*1+00h], bx
    xor ebx, dword ptr [Dc9cc4]
    jmp L62ac5
L6ed5e::
    add esi, 04h
    or cl, 0e0h
    jmp L5d281
L6ed69::
    add esi, 04h
    or cl, 0e0h
    jmp L60190
L6ed74::
    add esi, 04h
    or cl, 0e0h
    jmp L601cc
L6ed7f::
    add esi, 04h
    or cl, 0e0h
    jmp L6041d
L6ed8a::
    add esi, 04h
    or cl, 0e0h
    jmp L60436
L6ed95::
    add esi, 04h
    or cl, 0e0h
    mov edx, dword ptr [esi+04h]
    jmp L6044e
L6eda3::
    add esi, 04h
    or cl, 0e0h
    jmp L60466
L6edae::
    add esi, 04h
    or cl, 0e0h
    mov ebx, dword ptr [esi+04h]
    jmp L604cd
L6edbc::
    add esi, 04h
    or cl, 0e0h
    mov ebx, dword ptr [esi+04h]
    jmp L604e1
L6edca::
    add esi, 04h
    or cl, 0e0h
    mov ebx, dword ptr [esi+04h]
    jmp L604fe
L6edd8::
    add esi, 04h
    or cl, 0e0h
    mov ebx, dword ptr [esi+04h]
    jmp L60578
L6ede6::
    add esi, 04h
    or cl, 0e0h
    mov ebx, dword ptr [esi+04h]
    jmp L6058e
L6edf4::
    add esi, 04h
    or cl, 0e0h
    mov ebx, dword ptr [esi+04h]
    jmp L60600
L6ee02::
    add esi, 04h
    or cl, 0e0h
    mov ebx, dword ptr [esi+04h]
    jmp L6061a
L6ee10::
    add esi, 04h
    or cl, 0e0h
    mov ebx, dword ptr [esi+04h]
    jmp L60637
L6ee1e::
    add esi, 04h
    or cl, 0e0h
    mov ebx, dword ptr [esi+04h]
    jmp L60650
L6ee2c::
    add esi, 04h
    or cl, 0e0h
    mov ebx, dword ptr [esi+04h]
    jmp L6066b
L6ee3a::
    add esi, 04h
    or cl, 0e0h
    mov ebx, dword ptr [esi+04h]
    jmp L6068b
L6ee48::
    add esi, 04h
    or cl, 0e0h
    mov ebx, dword ptr [esi+04h]
    jmp L606a7
L6ee56::
    add esi, 04h
    or cl, 0e0h
    mov ebx, dword ptr [esi+04h]
    jmp L606c4
L6ee64::
    add esi, 04h
    or cl, 0e0h
    mov ebx, dword ptr [esi+04h]
    jmp L606dc
L6ee72::
    add esi, 04h
    or cl, 0e0h
    mov ebx, dword ptr [esi+04h]
    jmp L606f6
L6ee80::
    add esi, 04h
    or cl, 0e0h
    mov ebx, dword ptr [esi+04h]
    jmp L60712
L6ee8e::
    add esi, 04h
    or cl, 0e0h
    mov ebx, dword ptr [esi+04h]
    jmp L6072b
L6ee9c::
    add esi, 04h
    or cl, 0e0h
    mov ebx, dword ptr [esi+04h]
    jmp L6073f
L6eeaa::
    add esi, 04h
    or cl, 0e0h
    mov ebx, dword ptr [esi+04h]
    jmp L60759
L6eeb8::
    add esi, 04h
    or cl, 0e0h
    mov ebx, dword ptr [esi+04h]
    jmp L60784
L6eec6::
    add esi, 04h
    or cl, 0e0h
    mov ebx, dword ptr [esi+04h]
    jmp L607a1
L6eed4::
    add esi, 04h
    or cl, 0e0h
    mov ebx, dword ptr [esi+04h]
    jmp L60803
L6eee2::
    add esi, 04h
    or cl, 0e0h
    mov ebx, dword ptr [esi+04h]
    jmp L60820
L6eef0::
    add esi, 04h
    or cl, 0e0h
    mov ebx, dword ptr [esi+04h]
    jmp L60882
L6eefe::
    add esi, 04h
    or cl, 0e0h
    mov ebx, dword ptr [esi+04h]
    jmp L6089f
L6ef0c::
    add esi, 04h
    or cl, 0e0h
    mov ebx, dword ptr [esi+04h]
    jmp L60901
L6ef1a::
    add esi, 04h
    or cl, 0e0h
    mov ebx, dword ptr [esi+04h]
    jmp L6091e
L6ef28::
    add esi, 04h
    or cl, 0e0h
    mov ebx, dword ptr [esi+04h]
    jmp L60980
L6ef36::
    add esi, 04h
    or cl, 0e0h
    mov ebx, dword ptr [esi+04h]
    jmp L6099d
L6ef44::
    add esi, 04h
    or cl, 0e0h
    mov ebx, dword ptr [esi+04h]
    jmp L609ff
L6ef52::
    add esi, 04h
    or cl, 0e0h
    mov ebx, dword ptr [esi+04h]
    jmp L60a1c
L6ef60::
    add esi, 04h
    or cl, 0e0h
    mov ebx, dword ptr [esi+04h]
    jmp L60a7e
L6ef6e::
    add esi, 04h
    or cl, 0e0h
    mov ebx, dword ptr [esi+04h]
    jmp L60a9b
L6ef7c::
    add esi, 04h
    or cl, 0e0h
    mov ebx, dword ptr [esi+04h]
    jmp L60afd
L6ef8a::
    add esi, 04h
    or cl, 0e0h
    mov ebx, dword ptr [esi+04h]
    jmp L60b1a
L6ef98::
    add esi, 04h
    or cl, 0e0h
    mov ebx, dword ptr [esi+04h]
    jmp L60b7c
L6efa6::
    add esi, 04h
    or cl, 0e0h
    mov ebx, dword ptr [esi+04h]
    jmp L60b99
L6efb4::
    add esi, 04h
    or cl, 0e0h
    mov ebx, dword ptr [esi+04h]
    jmp L60bfb
L6efc2::
    add esi, 04h
    or cl, 0e0h
    mov ebx, dword ptr [esi+04h]
    jmp L60c18
L6efd0::
    add esi, 04h
    or cl, 0e0h
    mov ebx, dword ptr [esi+04h]
    jmp L60c7a
L6efde::
    add esi, 04h
    or cl, 0e0h
    mov ebx, dword ptr [esi+04h]
    jmp L60c97
L6efec::
    add esi, 04h
    or cl, 0e0h
    mov ebx, dword ptr [esi+04h]
    jmp L60cf9
L6effa::
    add esi, 04h
    or cl, 0e0h
    mov ebx, dword ptr [esi+04h]
    jmp L60d16
L6f008::
    add esi, 04h
    or cl, 0e0h
    mov ebx, dword ptr [esi+04h]
    jmp L60d78
L6f016::
    add esi, 04h
    or cl, 0e0h
    mov ebx, dword ptr [esi+04h]
    jmp L60d95
L6f024::
    add esi, 04h
    or cl, 0e0h
    mov ebx, dword ptr [esi+04h]
    jmp L60df7
L6f032::
    add esi, 04h
    or cl, 0e0h
    mov ebx, dword ptr [esi+04h]
    jmp L60e14
L6f040::
    add esi, 04h
    or cl, 0e0h
    mov ebx, dword ptr [esi+04h]
    jmp L60e76
L6f04e::
    add esi, 04h
    or cl, 0e0h
    mov ebx, dword ptr [esi+04h]
    jmp L60e93
L6f05c::
    add esi, 04h
    or cl, 0e0h
    mov ebx, dword ptr [esi+04h]
    jmp L60ef5
L6f06a::
    add esi, 04h
    or cl, 0e0h
    mov ebx, dword ptr [esi+04h]
    jmp L60f12
L6f078::
    add esi, 04h
    or cl, 0e0h
    mov ebx, dword ptr [esi+04h]
    jmp L60f81
L6f086::
    add esi, 04h
    or cl, 0e0h
    mov ebx, dword ptr [esi+04h]
    jmp L60f95
L6f094::
    add esi, 04h
    or cl, 0e0h
    mov ebx, dword ptr [esi+04h]
    jmp L60fb2
L6f0a2::
    add esi, 04h
    or cl, 0e0h
    mov ebx, dword ptr [esi+04h]
    jmp L6100e
L6f0b0::
    add esi, 04h
    or cl, 0e0h
    jmp L612b6
L6f0bb::
    add esi, 04h
    or cl, 0e0h
    jmp L612ca
L6f0c6::
    add esi, 04h
    or cl, 0e0h
    jmp L612e7
L6f0d1::
    add esi, 04h
    or cl, 0e0h
    jmp L61809
L6f0dc::
    add esi, 04h
    or cl, 0e0h
    jmp L61828
L6f0e7::
    add esi, 04h
    or cl, 0e0h
    jmp L6189d
L6f0f2::
    add esi, 04h
    or cl, 0e0h
    jmp L618ba
L6f0fd::
    add esi, 04h
    or cl, 0e0h
    jmp L618da
L6f108::
    add esi, 04h
    or cl, 0e0h
    jmp L618f6
L6f113::
    add esi, 04h
    or cl, 0e0h
    jmp L61914
L6f11e::
    add esi, 04h
    or cl, 0e0h
    jmp L61937
L6f129::
    add esi, 04h
    or cl, 0e0h
    jmp L61956
L6f134::
    add esi, 04h
    or cl, 0e0h
    jmp L61976
L6f13f::
    add esi, 04h
    or cl, 0e0h
    jmp L61991
L6f14a::
    add esi, 04h
    or cl, 0e0h
    jmp L619b1
L6f155::
    add esi, 04h
    or cl, 0e0h
    jmp L619d0
L6f160::
    add esi, 04h
    or cl, 0e0h
    jmp L619ec
L6f16b::
    add esi, 04h
    or cl, 0e0h
    jmp L61a03
L6f176::
    add esi, 04h
    or cl, 0e0h
    jmp L61a20
L6f181::
    add esi, 04h
    or cl, 0e0h
    jmp L61a50
L6f18c::
    add esi, 04h
    or cl, 0e0h
    jmp L61a6d
L6f197::
    add esi, 04h
    or cl, 0e0h
    jmp L61b43
L6f1a2::
    add esi, 04h
    or cl, 0e0h
    jmp L61b60
L6f1ad::
    add esi, 04h
    or cl, 0e0h
    jmp L61c38
L6f1b8::
    add esi, 04h
    or cl, 0e0h
    jmp L61c55
L6f1c3::
    add esi, 04h
    or cl, 0e0h
    jmp L61d2d
L6f1ce::
    add esi, 04h
    or cl, 0e0h
    jmp L61d4a
L6f1d9::
    add esi, 04h
    or cl, 0e0h
    jmp L61e28
L6f1e4::
    add esi, 04h
    or cl, 0e0h
    jmp L61e45
L6f1ef::
    add esi, 04h
    or cl, 0e0h
    jmp L61f1b
L6f1fa::
    add esi, 04h
    or cl, 0e0h
    jmp L61f38
L6f205::
    add esi, 04h
    or cl, 0e0h
    jmp L62010
L6f210::
    add esi, 04h
    or cl, 0e0h
    jmp L6202d
L6f21b::
    add esi, 04h
    or cl, 0e0h
    jmp L62105
L6f226::
    add esi, 04h
    or cl, 0e0h
    jmp L62122
L6f231::
    add esi, 04h
    or cl, 0e0h
    jmp L62200
L6f23c::
    add esi, 04h
    or cl, 0e0h
    jmp L6221d
L6f247::
    add esi, 04h
    or cl, 0e0h
    jmp L622f3
L6f252::
    add esi, 04h
    or cl, 0e0h
    jmp L62310
L6f25d::
    add esi, 04h
    or cl, 0e0h
    jmp L623e8
L6f268::
    add esi, 04h
    or cl, 0e0h
    jmp L62405
L6f273::
    add esi, 04h
    or cl, 0e0h
    jmp L624dd
L6f27e::
    add esi, 04h
    or cl, 0e0h
    jmp L624fa
L6f289::
    add esi, 04h
    or cl, 0e0h
    jmp L625d8
L6f294::
    add esi, 04h
    or cl, 0e0h
    jmp L625f5
L6f29f::
    add esi, 04h
    or cl, 0e0h
    jmp L626cb
L6f2aa::
    add esi, 04h
    or cl, 0e0h
    jmp L626e8
L6f2b5::
    add esi, 04h
    or cl, 0e0h
    jmp L627c0
L6f2c0::
    add esi, 04h
    or cl, 0e0h
    jmp L627dd
L6f2cb::
    add esi, 04h
    or cl, 0e0h
    jmp L628b5
L6f2d6::
    add esi, 04h
    or cl, 0e0h
    jmp L628d2
L6f2e1::
    add esi, 04h
    or cl, 0e0h
    jmp L629b9
L6f2ec::
    add esi, 04h
    or cl, 0e0h
    jmp L629cd
L6f2f7::
    add esi, 04h
    or cl, 0e0h
    jmp L629ea
L6f302::
    add esi, 04h
    or cl, 0e0h
    jmp L62a7f
    align 4
L6f310::
    add esi, 04h
    or cl, 0e0h
    jmp L6136b
    align 4
L6f31c::
    add esi, 04h
    or cl, 0e0h
    jmp L61af1
    align 4
L6f328::
    add esi, 04h
    or cl, 0e0h
    jmp L61be4
    align 4
L6f334::
    add esi, 04h
    or cl, 0e0h
    jmp L61cd9
    align 4
L6f340::
    add esi, 04h
    or cl, 0e0h
    jmp L61dce
    align 4
L6f34c::
    add esi, 04h
    or cl, 0e0h
    jmp L61ec9
    align 4
L6f358::
    add esi, 04h
    or cl, 0e0h
    jmp L61fbc
    align 4
L6f364::
    add esi, 04h
    or cl, 0e0h
    jmp L620b1
    align 4
L6f370::
    add esi, 04h
    or cl, 0e0h
    jmp L621a6
    align 4
L6f37c::
    add esi, 04h
    or cl, 0e0h
    jmp L622a1
    align 4
L6f388::
    add esi, 04h
    or cl, 0e0h
    jmp L62394
    align 4
L6f394::
    add esi, 04h
    or cl, 0e0h
    jmp L62489
    align 4
L6f3a0::
    add esi, 04h
    or cl, 0e0h
    jmp L6257e
    align 4
L6f3ac::
    add esi, 04h
    or cl, 0e0h
    jmp L62679
    align 4
L6f3b8::
    add esi, 04h
    or cl, 0e0h
    jmp L6276c
    align 4
L6f3c4::
    add esi, 04h
    or cl, 0e0h
    jmp L62861
    align 4
L6f3d0::
    add esi, 04h
    or cl, 0e0h
    jmp L62956
    align 4
L6f3dc::
    add esi, 04h
    or cl, 0e0h
    jmp L62a6e
    align 4
L6f3e8::
    add esi, 04h
    or cl, 0e0h
    jmp L6136b
    align 4
L6f3f4::
    add esi, 04h
    or cl, 0e0h
    jmp L6136b
    align 4
L6f400::
    add esi, 04h
    or cl, 0e0h
    jmp L61af1
    align 4
L6f40c::
    add esi, 04h
    or cl, 0e0h
    jmp L61af1
    align 4
L6f418::
    add esi, 04h
    or cl, 0e0h
    jmp L61be4
    align 4
L6f424::
    add esi, 04h
    or cl, 0e0h
    jmp L61be4
    align 4
L6f430::
    add esi, 04h
    or cl, 0e0h
    jmp L61cd9
    align 4
L6f43c::
    add esi, 04h
    or cl, 0e0h
    jmp L61cd9
    align 4
L6f448::
    add esi, 04h
    or cl, 0e0h
    jmp L61dce
    align 4
L6f454::
    add esi, 04h
    or cl, 0e0h
    jmp L61dce
    align 4
L6f460::
    add esi, 04h
    or cl, 0e0h
    jmp L61ec9
    align 4
L6f46c::
    add esi, 04h
    or cl, 0e0h
    jmp L61ec9
    align 4
L6f478::
    add esi, 04h
    or cl, 0e0h
    jmp L61fbc
    align 4
L6f484::
    add esi, 04h
    or cl, 0e0h
    jmp L61fbc
    align 4
L6f490::
    add esi, 04h
    or cl, 0e0h
    jmp L620b1
    align 4
L6f49c::
    add esi, 04h
    or cl, 0e0h
    jmp L620b1
    align 4
L6f4a8::
    add esi, 04h
    or cl, 0e0h
    jmp L621a6
    align 4
L6f4b4::
    add esi, 04h
    or cl, 0e0h
    jmp L621a6
    align 4
L6f4c0::
    add esi, 04h
    or cl, 0e0h
    jmp L622a1
    align 4
L6f4cc::
    add esi, 04h
    or cl, 0e0h
    jmp L622a1
    align 4
L6f4d8::
    add esi, 04h
    or cl, 0e0h
    jmp L62394
    align 4
L6f4e4::
    add esi, 04h
    or cl, 0e0h
    jmp L62394
    align 4
L6f4f0::
    add esi, 04h
    or cl, 0e0h
    jmp L62489
    align 4
L6f4fc::
    add esi, 04h
    or cl, 0e0h
    jmp L62489
    align 4
L6f508::
    add esi, 04h
    or cl, 0e0h
    jmp L6257e
    align 4
L6f514::
    add esi, 04h
    or cl, 0e0h
    jmp L6257e
    align 4
L6f520::
    add esi, 04h
    or cl, 0e0h
    jmp L62679
    align 4
L6f52c::
    add esi, 04h
    or cl, 0e0h
    jmp L62679
    align 4
L6f538::
    add esi, 04h
    or cl, 0e0h
    jmp L6276c
    align 4
L6f544::
    add esi, 04h
    or cl, 0e0h
    jmp L6276c
    align 4
L6f550::
    add esi, 04h
    or cl, 0e0h
    jmp L62861
    align 4
L6f55c::
    add esi, 04h
    or cl, 0e0h
    jmp L62861
    align 4
L6f568::
    add esi, 04h
    or cl, 0e0h
    jmp L62956
    align 4
L6f574::
    add esi, 04h
    or cl, 0e0h
    jmp L62956
    align 4
L6f580::
    add esi, 04h
    or cl, 0e0h
    jmp L62a6e
    align 4
L6f58c::
    add esi, 04h
    or cl, 0e0h
    jmp L62a6e
draw_frame endp
_TEXT ends

_DATA segment
id_string label byte
    db "$Id: 124_DATA.INC 1.13 1996/08/14 10:05:39 MDV Exp $"
    db 000h, 000h, 000h, 000h
Dc8a68 dword 1024 dup(0)
Dc9a68 dword 0
Dc9a6c dword 0
Dc9a70 dword 0
Dc9a74 dword 0
Dc9a78 dword 0
Dc9a7c dword 0
Dc9a80 dword 0
Dc9a84 dword 0
Dc9a88 dword 0
Dc9a8c dword 0
Dc9a90 dword 0
Dc9a94 dword 0
Dc9a98 dword 0
Dc9a9c dword 0
Dc9aa0 dword 0
Dc9aa4 dword 0
Dc9aa8 dword 0
Dc9aac dword 0
Dc9ab0 dword 2 dup(0)
Dc9ab8 dword 0
Dc9abc dword 0
Dc9ac0 dword 0
Dc9ac4 dword 0
Dc9ac8 dword 0
Dc9acc dword 0
Dc9ad0 dword 0
Dc9ad4 dword 0
Dc9ad8 dword 0
Dc9adc dword 0
Dc9ae0 dword 0
Dc9ae4 dword 0
Dc9ae8 dword 0
Dc9aec dword 0
Dc9af0 dword 0
Dc9af4 dword 0
Dc9af8 byte 0
Dc9af9 byte 0
Dc9afa byte 0
Dc9afb byte 0
Dc9afc byte 0
Dc9afd byte 0
Dc9afe byte 0
Dc9aff byte 0
Dc9b00 byte 0
Dc9b01 byte 0
Dc9b02 word 3 dup(0)
Dc9b08 dword 0
Dc9b0c dword 0
Dc9b10 dword 0
Dc9b14 dword 2 dup(0)
Dc9b1c byte 0
Dc9b1d byte 0
Dc9b1e byte 0
Dc9b1f byte 0
Dc9b20 byte 0
Dc9b21 byte 0
Dc9b22 byte 0
Dc9b23 byte 0
Dc9b24 byte 0
Dc9b25 byte 0
Dc9b26 byte 0
Dc9b27 byte 0
Dc9b28 byte 0
Dc9b29 byte 0
Dc9b2a byte 0
Dc9b2b byte 0
Dc9b2c byte 0
Dc9b2d byte 0
Dc9b2e byte 0
Dc9b2f byte 0
Dc9b30 byte 0
Dc9b31 byte 0
Dc9b32 byte 0
Dc9b33 byte 0
Dc9b34 byte 0
Dc9b35 byte 0
Dc9b36 byte 0
Dc9b37 byte 0
Dc9b38 byte 0
Dc9b39 byte 0
Dc9b3a byte 0
Dc9b3b byte 0
Dc9b3c byte 0
Dc9b3d byte 0
colour_op byte 0
Dc9b3f byte 0
Dc9b40 byte 0
Dc9b41 byte 0
Dc9b42 byte 0
Dc9b43 byte 0
Dc9b44 byte 0
Dc9b45 byte 0
Dc9b46 byte 0
Dc9b47 byte 0
Dc9b48 byte 0
Dc9b49 byte 0
Dc9b4a byte 0
Dc9b4b byte 0
Dc9b4c byte 0
Dc9b4d byte 0
Dc9b4e byte 0
Dc9b4f byte 0
Dc9b50 byte 0
Dc9b51 byte 0
Dc9b52 byte 0
Dc9b53 byte 0
Dc9b54 byte 0
Dc9b55 byte 0
Dc9b56 byte 0
Dc9b57 byte 0
Dc9b58 byte 0
Dc9b59 byte 0
Dc9b5a byte 0
Dc9b5b byte 0
Dc9b5c dword 0
Dc9b60 dword 0
Dc9b64 dword 0
Dc9b68 dword 0
Dc9b6c dword 0
Dc9b70 dword 0
Dc9b74 dword 0
Dc9b78 dword 0
Dc9b7c dword 0
Dc9b80 dword 0
Dc9b84 dword 0
Dc9b88 dword 0
Dc9b8c dword 0
Dc9b90 dword 0
Dc9b94 dword 0
Dc9b98 dword 0
Dc9b9c dword 0
Dc9ba0 dword 0
Dc9ba4 dword 0
Dc9ba8 dword 0
Dc9bac dword 0
Dc9bb0 dword 0
Dc9bb4 dword 0
Dc9bb8 dword 0
Dc9bbc dword 0
Dc9bc0 dword 0
Dc9bc4 dword 0
Dc9bc8 dword 0
Dc9bcc dword 0
Dc9bd0 dword 0
Dc9bd4 dword 0
Dc9bd8 dword 3 dup(0)
Dc9be4 dword 0
Dc9be8 dword 0
Dc9bec dword 0
Dc9bf0 dword 0
Dc9bf4 dword 0
red_mask dword 0
green_mask dword 0
blue_mask dword 0
Dc9c04 dword 0
Dc9c08 dword 0
Dc9c0c dword 0
Dc9c10 dword 0
Dc9c14 dword 0
Dc9c18 dword 0
Dc9c1c dword 0
Dc9c20 dword 0
Dc9c24 dword 0
Dc9c28 dword 0
Dc9c2c dword 0
Dc9c30 dword 0
Dc9c34 dword 0
Dc9c38 dword 0
Dc9c3c dword 0
Dc9c40 dword 32 dup(0)
Dc9cc0 dword 0
Dc9cc4 dword 0
Dc9cc8 dword 0
Dc9ccc dword 0
Dc9cd0 dword 0
Dc9cd4 dword 0
Dc9cd8 dword 0
Dc9cdc dword 256 dup(0)
Dca0dc dword 256 dup(0)
Dca4dc dword 0
Dca4e0 dword 132 dup(0)
_DATA ends

OBJ4 segment
bit_masks dword 01h, 02h, 04h, 08h, 010h, 020h, 040h, 080h
    dword 0100h, 0200h, 0400h, 0800h, 01000h, 02000h, 04000h, 08000h
    dword 010000h, 020000h, 040000h, 080000h, 0100000h, 0200000h, 0400000h, 0800000h
    dword 01000000h, 02000000h, 04000000h, 08000000h, 010000000h, 020000000h, 040000000h, 080000000h
Db0080 dword 0, 09h, 012h, 01ch, 0, 09h, 013h, 01ch
    dword 01h, 0ah, 013h, 01dh, 01h, 0bh, 014h, 01dh
    dword 02h, 0bh, 015h, 01eh, 02h, 0ch, 015h, 01fh
    dword 03h, 0ch, 016h, 01fh, 04h, 0dh, 016h, 020h
    dword 04h, 0eh, 017h, 020h, 05h, 0eh, 018h, 021h
    dword 05h, 0fh, 018h, 022h, 06h, 0fh, 019h, 022h
    dword 07h, 010h, 019h, 023h, 07h, 011h, 01ah, 023h
    dword 08h, 011h, 01bh, 024h, 08h, 012h, 01bh, 025h
    dword 09h, 012h, 01ch, 025h, 0ah, 013h, 01ch, 026h
    dword 0ah, 014h, 01dh, 026h, 0bh, 014h, 01eh, 027h
    dword 0bh, 015h, 01eh, 028h, 0ch, 015h, 01fh, 028h
    dword 0dh, 016h, 01fh, 029h, 0dh, 017h, 020h, 029h
    dword 0eh, 017h, 021h, 02ah, 0eh, 018h, 021h, 02bh
    dword 0fh, 018h, 022h, 02bh, 010h, 019h, 022h, 02ch
    dword 010h, 01ah, 023h, 02ch, 011h, 01ah, 024h, 02dh
    dword 011h, 01bh, 024h, 02eh, 012h, 01bh, 025h, 02eh
    dword 0, 09h, 012h, 01ch, 0, 09h, 013h, 01ch
    dword 01h, 0ah, 013h, 01dh, 01h, 0bh, 014h, 01dh
    dword 02h, 0bh, 015h, 01eh, 02h, 0ch, 015h, 01fh
    dword 03h, 0ch, 016h, 01fh, 04h, 0dh, 016h, 020h
    dword 04h, 0eh, 017h, 020h, 05h, 0eh, 018h, 021h
    dword 05h, 0fh, 018h, 022h, 06h, 0fh, 019h, 022h
    dword 07h, 010h, 019h, 023h, 07h, 011h, 01ah, 023h
    dword 08h, 011h, 01bh, 024h, 08h, 012h, 01bh, 025h
    dword 09h, 012h, 01ch, 025h, 0ah, 013h, 01ch, 026h
    dword 0ah, 014h, 01dh, 026h, 0bh, 014h, 01eh, 027h
    dword 0bh, 015h, 01eh, 028h, 0ch, 015h, 01fh, 028h
    dword 0dh, 016h, 01fh, 029h, 0dh, 017h, 020h, 029h
    dword 0eh, 017h, 021h, 02ah, 0eh, 018h, 021h, 02bh
    dword 0fh, 018h, 022h, 02bh, 010h, 019h, 022h, 02ch
    dword 010h, 01ah, 023h, 02ch, 011h, 01ah, 024h, 02dh
    dword 011h, 01bh, 024h, 02eh, 012h, 01bh, 025h, 02eh
Db0480 dword 0, 0, 0, 0, 0, 01h, 01h, 01h
    dword 01h, 02h, 02h, 02h, 02h, 02h, 03h, 03h
    dword 03h, 03h, 04h, 04h, 04h, 04h, 05h, 05h
    dword 05h, 05h, 05h, 06h, 06h, 06h, 06h, 07h
    dword 01h, 01h, 01h, 01h, 02h, 02h, 02h, 02h
    dword 02h, 03h, 03h, 03h, 03h, 04h, 04h, 04h
    dword 04h, 05h, 05h, 05h, 05h, 05h, 06h, 06h
    dword 06h, 06h, 07h, 07h, 07h, 07h, 08h, 08h
    dword 02h, 02h, 02h, 03h, 03h, 03h, 03h, 03h
    dword 04h, 04h, 04h, 04h, 05h, 05h, 05h, 05h
    dword 05h, 06h, 06h, 06h, 06h, 07h, 07h, 07h
    dword 07h, 08h, 08h, 08h, 08h, 08h, 09h, 09h
    dword 03h, 03h, 03h, 04h, 04h, 04h, 04h, 05h
    dword 05h, 05h, 05h, 06h, 06h, 06h, 06h, 06h
    dword 07h, 07h, 07h, 07h, 08h, 08h, 08h, 08h
    dword 08h, 09h, 09h, 09h, 09h, 0ah, 0ah, 0ah
    dword 04h, 04h, 05h, 05h, 05h, 05h, 06h, 06h
    dword 06h, 06h, 06h, 07h, 07h, 07h, 07h, 08h
    dword 08h, 08h, 08h, 09h, 09h, 09h, 09h, 09h
    dword 0ah, 0ah, 0ah, 0ah, 0bh, 0bh, 0bh, 0bh
    dword 05h, 06h, 06h, 06h, 06h, 07h, 07h, 07h
    dword 07h, 07h, 08h, 08h, 08h, 08h, 09h, 09h
    dword 09h, 09h, 09h, 0ah, 0ah, 0ah, 0ah, 0bh
    dword 0bh, 0bh, 0bh, 0ch, 0ch, 0ch, 0ch, 0ch
    dword 07h, 07h, 07h, 07h, 07h, 08h, 08h, 08h
    dword 08h, 09h, 09h, 09h, 09h, 0ah, 0ah, 0ah
    dword 0ah, 0ah, 0bh, 0bh, 0bh, 0bh, 0ch, 0ch
    dword 0ch, 0ch, 0ch, 0dh, 0dh, 0dh, 0dh, 0eh
    dword 08h, 08h, 08h, 08h, 09h, 09h, 09h, 09h
    dword 0ah, 0ah, 0ah, 0ah, 0ah, 0bh, 0bh, 0bh
    dword 0bh, 0ch, 0ch, 0ch, 0ch, 0dh, 0dh, 0dh
    dword 0dh, 0dh, 0eh, 0eh, 0eh, 0eh, 0fh, 0fh
Db0880 dword 0, 0, 0421h, 0421h, 0842h, 0842h, 0c63h, 0c63h
    dword 01084h, 01084h, 014a5h, 014a5h, 018c6h, 018c6h, 01ce7h, 01ce7h
    dword 02108h, 02108h, 02529h, 02529h, 0294ah, 0294ah, 02d6bh, 02d6bh
    dword 0318ch, 0318ch, 035adh, 035adh, 039ceh, 039ceh, 03defh, 03defh
    dword 04210h, 04210h, 04631h, 04631h, 04a52h, 04a52h, 04e73h, 04e73h
    dword 05294h, 05294h, 056b5h, 056b5h, 05ad6h, 05ad6h, 05ef7h, 05ef7h
    dword 06318h, 06318h, 06739h, 06739h, 06b5ah, 06b5ah, 06f7bh, 06f7bh
    dword 0739ch, 0739ch, 077bdh, 077bdh, 07bdeh, 07bdeh, 07fffh, 07fffh
    dword 08420h, 08420h, 08841h, 08841h, 08c62h, 08c62h, 09083h, 09083h
    dword 094a4h, 094a4h, 098c5h, 098c5h, 09ce6h, 09ce6h, 0a107h, 0a107h
    dword 0a528h, 0a528h, 0a949h, 0a949h, 0ad6ah, 0ad6ah, 0b18bh, 0b18bh
    dword 0b5ach, 0b5ach, 0b9cdh, 0b9cdh, 0bdeeh, 0bdeeh, 0c20fh, 0c20fh
    dword 0c630h, 0c630h, 0ca51h, 0ca51h, 0ce72h, 0ce72h, 0d293h, 0d293h
    dword 0d6b4h, 0d6b4h, 0dad5h, 0dad5h, 0def6h, 0def6h, 0e317h, 0e317h
    dword 0e738h, 0e738h, 0eb59h, 0eb59h, 0ef7ah, 0ef7ah, 0f39bh, 0f39bh
    dword 0f7bch, 0f7bch, 0fbddh, 0fbddh, 0fffeh, 0fffeh, 01041fh, 01041fh
colour_ops dword offset Func5e35c_
    dword offset Func5e323_
    dword offset Func5e32a_
    dword offset Func5e331_
    dword offset Func5e338_
    dword offset Func5e33f_
    dword offset Func5e346_
    dword offset Func5e34d_
    dword offset Func5e356_
    dword offset Func5e35d_
    dword offset Func5e366_
    dword offset Func5e36f_
    dword offset Func5e378_
    dword offset Func5e381_
    dword offset Func5e38a_
    dword offset Func5e393_
    dword offset Func5e2e1_
    dword offset Func5e2a8_
    dword offset Func5e2af_
    dword offset Func5e2b6_
    dword offset Func5e2bd_
    dword offset Func5e2c4_
    dword offset Func5e2cb_
    dword offset Func5e2d2_
    dword offset Func5e2db_
    dword offset Func5e2e2_
    dword offset Func5e2eb_
    dword offset Func5e2f4_
    dword offset Func5e2fd_
    dword offset Func5e306_
    dword offset Func5e30f_
    dword offset Func5e318_
blend_ops dword offset Func5f33c_
    dword offset Func5f33d_
    dword offset Func5f39e_
    dword offset Func5f402_
    dword offset Func5f46c_
    dword offset Func5f4d0_
    dword offset Func5f53d_
    dword offset Func5f5aa_
    dword offset Func5f614_
    dword offset Func5f684_
    dword offset Func5f6ee_
    dword offset Func5f75b_
    dword offset Func5f7c8_
    dword offset Func5f841_
    dword offset Func5f8ae_
    dword offset Func5f91b_
    dword offset Func5f985_
    dword offset Func5f9a2_
    dword offset Func5fa0c_
    dword offset Func5fa79_
    dword offset Func5fae6_
    dword offset Func5fb5f_
    dword offset Func5fbcc_
    dword offset Func5fc39_
    dword offset Func5fca3_
    dword offset Func5fd13_
    dword offset Func5fd7d_
    dword offset Func5fdea_
    dword offset Func5fe57_
    dword offset Func5febb_
    dword offset Func5ff25_
    dword offset Func5ff89_
    dword offset Func5ffea_
    dword offset Func5ff89_
    dword offset Func5ff25_
    dword offset Func5febb_
    dword offset Func5fe57_
    dword offset Func5fdea_
    dword offset Func5fd7d_
    dword offset Func5fd13_
    dword offset Func5fca3_
    dword offset Func5fc39_
    dword offset Func5fbcc_
    dword offset Func5fb5f_
    dword offset Func5fae6_
    dword offset Func5fa79_
    dword offset Func5fa0c_
    dword offset Func5f9a2_
    dword offset Func5f985_
    dword offset Func5f91b_
    dword offset Func5f8ae_
    dword offset Func5f841_
    dword offset Func5f7c8_
    dword offset Func5f75b_
    dword offset Func5f6ee_
    dword offset Func5f684_
    dword offset Func5f614_
    dword offset Func5f5aa_
    dword offset Func5f53d_
    dword offset Func5f4d0_
    dword offset Func5f46c_
    dword offset Func5f402_
    dword offset Func5f39e_
    dword offset Func5f33d_
OBJ4 ends

    end

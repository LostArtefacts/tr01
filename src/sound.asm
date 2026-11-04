    .586p

_TEXT segment para public use32 'CODE'
_TEXT ends
_DATA segment dword public use32 'DATA'
_DATA ends
CONST segment dword public use32 'DATA'
CONST ends
_BSS segment dword public use32 'BSS'
_BSS ends

    assume cs:FLAT, ds:FLAT, es:FLAT, ss:FLAT

    extrn FileLoad_:near
    extrn Func4d170_:near
    extrn Func4d224_:near
    extrn Func4d258_:near
    extrn Func4d7d8_:near
    extrn Func4dc8f_:near
    extrn Func4dceb_:near
    extrn Func4dd52_:near
    extrn Func4e1b5_:near
    extrn Func4e6b6_:near
    extrn Func4e836_:near
    extrn Func4e982_:near
    extrn Func4eb6c_:near
    extrn Func4ec68_:near
    extrn Func4ecee_:near
    extrn Func4edda_:near
    extrn Func4eec8_:near
    extrn Func4ef0a_:near
    extrn _file_len:byte
    extrn _nfree_:near
    extrn _nmalloc_:near
    extrn fclose_:near
    extrn fopen_:near
    extrn fread_:near
    extrn fseek_:near
    extrn ftell_:near
    extrn memset_:near
    extrn sosTIMERRegisterEvent_:near
    extrn sosTIMERRemoveEvent_:near

    public Func48300_
    public SoundInit_
    public SoundExit_
    public Func48538_
    public Func485bc_
    public Func487f8_
    public SoundLoadSamples_
    public Func488fc_
    public SoundPlaySample_
    public SoundPlaySampleLooped_
    public SoundStopAllSamples_
    public SoundStopSample_
    public Func48bd8_
    public SoundSetSampleVolume_
    public Func48c60_
    public Func48ca4_
    public SoundSetPan_
    public Func48cfc_
    public SoundSampleIsPlaying_
    public Func48d60_
    public Func48dbc_
    public Func48e14_
    public Func48ea4_
    public SoundGetSOSHandle_
    public SoundGetSOSDriver_

_TEXT segment
Func48300_ proc near
    push ebx
    push ecx
    push edx
    push esi
    push edi
    sub esp, 013ch
    db 089h, 0c2h
    mov ebx, 0ffffffffh
    lea edi, [esp+0ach]
    mov esi, dword ptr [Dc66c8]
    mov dword ptr [B12ff40], ebx
    push edi
L48326:
    mov al, byte ptr [esi]
    mov byte ptr [edi], al
    cmp al, 00h
    je short L4833e
    mov al, byte ptr [esi+01h]
    add esi, 02h
    mov byte ptr [edi+01h], al
    add edi, 02h
    cmp al, 00h
    jne short L48326
L4833e:
    pop edi
    lea edi, [esp+0ach]
    db 089h, 0d6h
    mov ebx, 010ch
    push edi
    sub ecx, ecx
    dec ecx
    mov al, 00h
    db 0f2h, 0aeh
    dec edi
L48356:
    mov al, byte ptr [esi]
    mov byte ptr [edi], al
    cmp al, 00h
    je short L4836e
    mov al, byte ptr [esi+01h]
    add esi, 02h
    mov byte ptr [edi+01h], al
    add edi, 02h
    cmp al, 00h
    jne short L48356
L4836e:
    pop edi
    mov eax, offset B12fe30
    db 031h, 0d2h
    call memset_
    lea edx, [esp+0ach]
    db 089h, 0e0h
    call Func4d170_
    test eax, eax
    je near ptr L4840c
    mov edx, offset Dc101c
    db 089h, 0e0h
    call Func4d258_
    test eax, eax
    je short L483f5
    mov ebx, offset B12ff40
    mov edx, offset Dc1024
    db 089h, 0e0h
    call Func4d7d8_
    test eax, eax
    je short L483f5
    mov ebx, offset B12fe8c
    mov edx, offset Dc1030
    db 089h, 0e0h
    call Func4d7d8_
    test eax, eax
    je short L483f5
    mov ebx, offset B12fe94
    mov edx, offset Dc103c
    db 089h, 0e0h
    call Func4d7d8_
    test eax, eax
    je short L483f5
    mov ebx, offset B12fe90
    mov edx, offset Dc1048
    db 089h, 0e0h
    call Func4d7d8_
    test eax, eax
    jne short L48400
L483f5:
    db 089h, 0e0h
    call Func4d224_
    db 031h, 0c0h
    jmp short L4840c
L48400:
    db 089h, 0e0h
    call Func4d224_
    mov eax, 01h
L4840c:
    add esp, 013ch
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
Func48300_ endp
SoundInit_ proc near
    push ebx
    push edx
    push edi
    push ebp
    db 031h, 0d2h
    mov dword ptr [Dc66c0], edx
    mov dword ptr [B12ff58], edx
    mov dword ptr [B12ff54], edx
    test al, 02h
    sete al
    and eax, 0ffh
    db 089h, 0c3h
    je near ptr L484ea
    mov eax, offset Dc1054
    call Func48300_
    cmp dword ptr [B12ff40], 0ffffffffh
    jne short L48457
    db 031h, 0dbh
L48457:
    test ebx, ebx
    jne short L48462
    db 031h, 0c0h
    pop ebp
    pop edi
    pop edx
    pop ebx
    ret
L48462:
    mov edi, 05622h
    db 031h, 0d2h
    db 031h, 0c0h
    mov ebp, 01000h
    call Func4dc8f_
    mov dword ptr [B12fe34], edi
    mov dword ptr [B12fe74], ebp
    test ebx, ebx
    je short L484e0
    mov eax, dword ptr [B12ff40]
    mov edx, offset B12ff44
    mov dword ptr [B12ff34], eax
    mov eax, offset B12fe30
    call Func4dd52_
    test eax, eax
    jne short L484e0
    mov eax, 01h
    mov ebx, offset B12ff50
    mov edx, dword ptr [B12ff38]
    mov dword ptr [Dc66c0], eax
    mov eax, 078h
    call sosTIMERRegisterEvent_
    cmp dword ptr [B12fe3c], 010h
    jne short L484d6
    mov dword ptr [B12ff48], 02h
    jmp short L484e0
L484d6:
    mov dword ptr [B12ff48], 04h
L484e0:
    mov eax, dword ptr [Dc66c0]
    mov dword ptr [B12ff54], eax
L484ea:
    pop ebp
    pop edi
    pop edx
    pop ebx
    ret
SoundInit_ endp
    db 090h
SoundExit_ proc near
    push ebx
    push ecx
    push edx
    cmp dword ptr [Dc66c0], 00h
    je short L48524
    call Func488fc_
    mov eax, dword ptr [B12ff50]
    mov ebx, 01h
    call sosTIMERRemoveEvent_
    mov eax, dword ptr [B12ff44]
    db 089h, 0dah
    call Func4e1b5_
    db 031h, 0dbh
    mov dword ptr [Dc66c0], ebx
L48524:
    db 031h, 0c9h
    call Func4dceb_
    mov dword ptr [B12ff54], ecx
    pop edx
    pop ecx
    pop ebx
    ret
SoundExit_ endp
    db 08dh, 040h, 000h
Func48538_ proc near
    push ebx
    push ecx
    push edx
    push esi
    push edi
    db 089h, 0c6h
    mov edx, dword ptr [eax+0b8h]
    cmp edx, 08000h
    jae short L4855b
    db 089h, 0d7h
    mov dword ptr [eax+0c0h], 00h
    jmp short L4856a
L4855b:
    mov edi, 08000h
    mov dword ptr [eax+0c0h], 01h
L4856a:
    mov edx, dword ptr [esi+0c4h]
    mov eax, dword ptr [esi+0b0h]
    db 031h, 0dbh
    call fseek_
    mov ebx, 01h
    db 089h, 0fah
    mov ecx, dword ptr [esi+0b0h]
    mov eax, dword ptr [esi+0a8h]
    call fread_
    mov dword ptr [esi+0b4h], 00h
    mov dword ptr [esi+0bch], 00h
    mov eax, dword ptr [esi+0a8h]
    mov dword ptr [esi+0ch], edi
    mov dword ptr [esi], eax
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
Func48538_ endp
    db 08bh, 0c0h
Func485bc_ proc near
    push ebx
    push ecx
    push esi
    push edi
    push ebp
    sub esp, 014h
    mov edi, dword ptr [_file_len]
    db 089h, 0c1h
    mov dword ptr [esp], edx
    cmp byte ptr [eax], 07eh
    jne short L485e1
    mov ebx, 01h
    mov dword ptr [esp+04h], ebx
    db 001h, 0d9h
    jmp short L485e7
L485e1:
    db 031h, 0d2h
    mov dword ptr [esp+04h], edx
L485e7:
    mov ebp, dword ptr [esp]
    db 031h, 0f6h
    mov dword ptr [_file_len], edi
    mov dword ptr [esp+08h], esi
    test ebp, ebp
    jne near ptr L486bd
    cmp byte ptr [ecx], 02ah
    jne near ptr L4869f
    mov eax, 010000h
    mov edx, offset Dc1060
    inc ecx
    call _nmalloc_
    db 089h, 0c5h
    db 089h, 0c6h
    db 089h, 0c8h
    call fopen_
    db 089h, 0c1h
    mov dword ptr [esp+010h], eax
    test eax, eax
    je near ptr L487e7
    mov ebx, 02h
    db 031h, 0d2h
    call fseek_
    test eax, eax
    jne short L4867a
    db 089h, 0c8h
    call ftell_
    cmp eax, 0ffffffffh
    je short L4867a
    db 089h, 0c8h
    db 031h, 0dbh
    db 031h, 0d2h
    call fseek_
    test eax, eax
    jne short L4867a
    mov ebx, 01h
    mov edx, 02ch
    db 089h, 0e8h
    call fread_
    cmp eax, 01h
    je short L48691
    cmp dword ptr [ebp+00h], 046464952h
    jne short L48691
L4867a:
    mov eax, dword ptr [esp+010h]
    call fclose_
    db 089h, 0f0h
    call _nfree_
    db 031h, 0c0h
    jmp near ptr L487e7
L48691:
    mov dword ptr [esp+08h], 01h
    mov dword ptr [esp+0ch], esi
    jmp short L486ca
L4869f:
    mov ebx, 01h
    db 089h, 0c8h
    db 031h, 0d2h
    call FileLoad_
    db 089h, 0c6h
    test eax, eax
    je near ptr L487e7
    mov dword ptr [esp+0ch], esi
    jmp short L486ca
L486bd:
    db 089h, 0c8h
    call dword ptr [esp]
    db 089h, 0c6h
    db 031h, 0c0h
    mov dword ptr [esp+0ch], eax
L486ca:
    mov eax, 0f0h
    mov ebx, 0f0h
    call _nmalloc_
    db 031h, 0d2h
    db 089h, 0c1h
    db 089h, 0c5h
    call memset_
    mov eax, dword ptr [esp+0ch]
    mov dword ptr [ecx+0a8h], eax
    cmp dword ptr [esi], 046464952h
    jne short L4874e
    db 089h, 0f2h
    lea eax, [esi+02ch]
    mov dword ptr [ecx], eax
    mov eax, dword ptr [esi+028h]
    sub eax, 02ch
    mov dword ptr [ecx+0ch], eax
    mov eax, dword ptr [esi+020h]
    sar eax, 010h
    mov dword ptr [ecx+038h], eax
    mov eax, dword ptr [esi+014h]
    sar eax, 010h
    mov dword ptr [ecx+03ch], eax
    mov bx, word ptr [esi+022h]
    mov edi, dword ptr [_file_len]
    cmp bx, 08h
    jne short L48734
    mov dword ptr [ecx+040h], 08000h
    mov eax, dword ptr [ecx+03ch]
    jmp short L48740
L48734:
    mov eax, dword ptr [ecx+03ch]
    mov dword ptr [ecx+040h], 00h
    db 001h, 0c0h
L48740:
    mov dword ptr [ecx+0ach], eax
    mov eax, dword ptr [edx+018h]
    mov dword ptr [ebp+034h], eax
    jmp short L4879d
L4874e:
    mov dword ptr [ecx+038h], 08h
    mov dword ptr [ecx+03ch], 01h
    mov dword ptr [ecx+040h], 08000h
    mov dword ptr [ecx+034h], 02b11h
    mov dword ptr [ecx+0ach], 01h
    mov edi, dword ptr [_file_len]
    mov dword ptr [ecx], esi
    mov edx, dword ptr [esp+04h]
    mov dword ptr [ecx+0ch], edi
    test edx, edx
    je short L4879d
    db 031h, 0d2h
    test edi, edi
    jle short L4879d
    db 089h, 0f0h
L4878f:
    mov bl, byte ptr [eax]
    inc eax
    xor bl, 080h
    inc edx
    mov byte ptr [eax-01h], bl
    db 039h, 0fah
    jl short L4878f
L4879d:
    mov ebx, dword ptr [esp+08h]
    mov dword ptr [ebp+044h], 08000h
    mov dword ptr [_file_len], edi
    mov dword ptr [ebp+02ch], 07fff7fffh
    test ebx, ebx
    je short L487e5
    mov eax, dword ptr [esp+010h]
    mov dword ptr [ebp+0b0h], eax
    mov eax, dword ptr [ebp+0ch]
    mov dword ptr [ebp+0b8h], eax
    mov eax, dword ptr [ebp+00h]
    db 029h, 0f0h
    mov dword ptr [ebp+0c4h], eax
    db 089h, 0e8h
    mov dword ptr [ebp+05ch], offset Func48e14_
    call Func48538_
L487e5:
    db 089h, 0e8h
L487e7:
    mov edi, dword ptr [_file_len]
    add esp, 014h
    pop ebp
    pop edi
    pop esi
    pop ecx
    pop ebx
    ret
Func485bc_ endp
    db 08bh, 0c0h
Func487f8_ proc near
    push ebx
    push ecx
    push edx
    db 089h, 0c3h
    test eax, eax
    je short L4883d
    test byte ptr [eax+021h], 020h
    jne short L48814
    mov eax, dword ptr [B12ff44]
    mov edx, dword ptr [ebx+028h]
    call Func4e836_
L48814:
    mov edx, dword ptr [ebx+0a8h]
    test edx, edx
    je short L48825
    db 089h, 0d0h
    call _nfree_
L48825:
    mov ecx, dword ptr [ebx+0b0h]
    test ecx, ecx
    je short L48836
    db 089h, 0c8h
    call fclose_
L48836:
    db 089h, 0d8h
    call _nfree_
L4883d:
    pop edx
    pop ecx
    pop ebx
    ret
Func487f8_ endp
    db 08dh, 040h, 000h
SoundLoadSamples_ proc near
    push ebx
    push ecx
    push esi
    push edi
    push ebp
    db 089h, 0c1h
    cmp dword ptr [Dc66c0], 00h
    je near ptr L488f6
    cmp dword ptr [B12ff4c], 00h
    je short L48866
    call Func488fc_
L48866:
    test edx, edx
    jge short L4887c
    db 089h, 0d7h
    mov dword ptr [B12ff3c], edx
    neg edi
    mov dword ptr [B12ff3c], edi
    jmp short L48882
L4887c:
    mov dword ptr [B12ff3c], edx
L48882:
    mov eax, dword ptr [B12ff3c]
    shl eax, 02h
    call _nmalloc_
    mov dword ptr [B12ff4c], eax
    test edx, edx
    jge short L488c9
    mov eax, dword ptr [B12ff3c]
    mov esi, dword ptr [ecx]
    db 031h, 0dbh
    test eax, eax
    jle short L488f6
L488a5:
    db 089h, 0f2h
    mov eax, dword ptr [ecx+04h]
    call Func485bc_
    inc ebx
    mov edx, dword ptr [B12ff4c]
    add ecx, 04h
    mov edi, dword ptr [B12ff3c]
    mov dword ptr [edx+ebx*4-04h], eax
    db 039h, 0fbh
    jge short L488f6
    jmp short L488a5
L488c9:
    mov ebp, dword ptr [B12ff3c]
    db 031h, 0dbh
    test ebp, ebp
    jle short L488f6
L488d5:
    mov eax, dword ptr [ecx]
    db 031h, 0d2h
    call Func485bc_
    inc ebx
    mov esi, dword ptr [B12ff4c]
    add ecx, 04h
    mov edx, dword ptr [B12ff3c]
    mov dword ptr [esi+ebx*4-04h], eax
    db 039h, 0d3h
    jl short L488d5
L488f6:
    pop ebp
    pop edi
    pop esi
    pop ecx
    pop ebx
    ret
SoundLoadSamples_ endp
Func488fc_ proc near
    push ebx
    push ecx
    push edx
    push esi
    call SoundStopAllSamples_
    cmp dword ptr [B12ff4c], 00h
    je short L4894f
    mov ebx, dword ptr [B12ff3c]
    db 031h, 0d2h
    test ebx, ebx
    jle short L48937
    db 031h, 0dbh
L4891c:
    mov eax, dword ptr [B12ff4c]
    mov eax, dword ptr [ebx+eax*1]
    inc edx
    call Func487f8_
    mov ecx, dword ptr [B12ff3c]
    add ebx, 04h
    db 039h, 0cah
    jl short L4891c
L48937:
    mov eax, dword ptr [B12ff4c]
    db 031h, 0f6h
    call _nfree_
    mov dword ptr [B12ff4c], esi
    mov dword ptr [B12ff3c], esi
L4894f:
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
Func488fc_ endp
SoundPlaySample_ proc near
    push esi
    push edi
    push ebp
    sub esp, 0f0h
    db 089h, 0c5h
    db 089h, 0d8h
    db 089h, 0cbh
    cmp dword ptr [Dc66c0], 00h
    je short L48975
    cmp dword ptr [B12ff54], 00h
    jne short L4897c
L48975:
    db 031h, 0c0h
    jmp near ptr L48a26
L4897c:
    mov esi, dword ptr [B12ff4c]
    mov esi, dword ptr [esi+ebp*4]
    test esi, esi
    jne short L48995
    db 031h, 0c0h
    add esp, 0f0h
    pop ebp
    pop edi
    pop esi
    ret
L48995:
    mov ecx, 03ch
    db 089h, 0e7h
    rep movs dword ptr es:[edi], dword ptr ds:[esi]
    cmp dword ptr [esp], 00h
    jne short L489b0
    db 031h, 0c0h
    add esp, 0f0h
    pop ebp
    pop edi
    pop esi
    ret
L489b0:
    cmp dx, 07fffh
    jbe short L489bc
    mov edx, 07fffh
L489bc:
    movsx edx, dx
    db 089h, 0d1h
    shl ecx, 010h
    db 009h, 0d1h
    movsx edx, ax
    mov dword ptr [esp+02ch], ecx
    cmp edx, 0ffffffffh
    je short L489e7
    mov edx, dword ptr [esp+034h]
    cwde
    imul eax, edx
    mov esi, 064h
    db 031h, 0d2h
    div esi
    mov dword ptr [esp+034h], eax
L489e7:
    movsx eax, bx
    cmp eax, 0ffffffffh
    je short L489f6
    movsx eax, bx
    mov dword ptr [esp+044h], eax
L489f6:
    mov eax, dword ptr [B12ff4c]
    mov eax, dword ptr [eax+ebp*4]
    mov ebx, dword ptr [esp+0b0h]
    mov dword ptr [esp+01ch], eax
    test ebx, ebx
    je short L48a14
    db 089h, 0e0h
    call Func48538_
L48a14:
    cli
    db 089h, 0e2h
    mov eax, dword ptr [B12ff44]
    call Func4e6b6_
    db 089h, 0c6h
    sti
    db 089h, 0f0h
L48a26:
    add esp, 0f0h
    pop ebp
    pop edi
    pop esi
    ret
SoundPlaySample_ endp
SoundPlaySampleLooped_ proc near
    push esi
    push edi
    push ebp
    sub esp, 0f0h
    db 089h, 0c5h
    db 089h, 0d8h
    db 089h, 0cbh
    cmp dword ptr [Dc66c0], 00h
    je short L48a51
    cmp dword ptr [B12ff54], 00h
    jne short L48a58
L48a51:
    db 031h, 0c0h
    jmp near ptr L48b71
L48a58:
    mov ecx, dword ptr [B12ff4c]
    mov esi, dword ptr [ecx+ebp*4]
    test esi, esi
    jne short L48a73
    db 031h, 0c0h
    add esp, 0f0h
    pop ebp
    pop edi
    pop esi
    ret 0ch
L48a73:
    mov ecx, 03ch
    db 089h, 0e7h
    rep movs dword ptr es:[edi], dword ptr ds:[esi]
    cmp dword ptr [esp], 00h
    jne short L48a90
    db 031h, 0c0h
    add esp, 0f0h
    pop ebp
    pop edi
    pop esi
    ret 0ch
L48a90:
    cmp dx, 07fffh
    jbe short L48a9c
    mov edx, 07fffh
L48a9c:
    movsx edx, dx
    db 089h, 0d6h
    shl esi, 010h
    db 009h, 0d6h
    movsx edx, ax
    mov dword ptr [esp+02ch], esi
    cmp edx, 0ffffffffh
    je short L48ac7
    mov edx, dword ptr [esp+034h]
    cwde
    imul eax, edx
    mov esi, 064h
    db 031h, 0d2h
    div esi
    mov dword ptr [esp+034h], eax
L48ac7:
    movsx eax, bx
    cmp eax, 0ffffffffh
    je short L48ad6
    movsx eax, bx
    mov dword ptr [esp+044h], eax
L48ad6:
    mov eax, dword ptr [esp+0ach]
    imul eax, dword ptr [esp+0104h]
    mov ecx, dword ptr [esp+0ch]
    db 039h, 0c8h
    jb short L48afb
    db 031h, 0c0h
    add esp, 0f0h
    pop ebp
    pop edi
    pop esi
    ret 0ch
L48afb:
    mov esi, dword ptr [esp]
    db 001h, 0c6h
    mov edi, dword ptr [esp+0108h]
    mov dword ptr [esp], esi
    cmp edi, 0ffffffffh
    jne short L48b13
    db 089h, 0ceh
    jmp short L48b1d
L48b13:
    mov esi, dword ptr [esp+0ach]
    imul esi, edi
L48b1d:
    mov ebx, dword ptr [esp+0ch]
    lea edx, [eax+esi*1]
    db 039h, 0dah
    jbe short L48b32
    db 089h, 0dah
    db 029h, 0c2h
    mov dword ptr [esp+010h], edx
    jmp short L48b36
L48b32:
    mov dword ptr [esp+010h], esi
L48b36:
    mov eax, dword ptr [esp+0100h]
    mov dword ptr [esp+030h], eax
    mov eax, dword ptr [B12ff4c]
    mov eax, dword ptr [eax+ebp*4]
    mov ecx, dword ptr [esp+0b0h]
    mov dword ptr [esp+01ch], eax
    test ecx, ecx
    je short L48b5f
    db 089h, 0e0h
    call Func48538_
L48b5f:
    cli
    db 089h, 0e2h
    mov eax, dword ptr [B12ff44]
    call Func4e6b6_
    db 089h, 0c2h
    sti
    db 089h, 0d0h
L48b71:
    add esp, 0f0h
    pop ebp
    pop edi
    pop esi
    ret 0ch
SoundPlaySampleLooped_ endp
    db 08dh, 040h, 000h
SoundStopAllSamples_ proc near
    push ebx
    push edx
    cmp dword ptr [Dc66c0], 00h
    je short L48baf
    mov eax, dword ptr [B12ff44]
    call Func4eec8_
    test eax, eax
    je short L48baf
    db 031h, 0dbh
L48b9b:
    cli
    mov eax, dword ptr [B12ff44]
    db 089h, 0dah
    call Func4e836_
    inc ebx
    sti
    cmp ebx, 020h
    jb short L48b9b
L48baf:
    pop edx
    pop ebx
    ret
SoundStopAllSamples_ endp
    db 08bh, 0c0h
SoundStopSample_ proc near
    push edx
    db 089h, 0c2h
    cmp dword ptr [Dc66c0], 00h
    je short L48bd5
    cmp dword ptr [B12ff54], 00h
    je short L48bd5
    cli
    mov eax, dword ptr [B12ff44]
    call Func4e836_
    sti
L48bd5:
    pop edx
    ret
SoundStopSample_ endp
    db 090h
Func48bd8_ proc near
    push ebx
    push ecx
    push esi
    db 089h, 0c1h
    db 089h, 0d3h
    cmp dword ptr [Dc66c0], 00h
    je short L48c2e
    cmp dword ptr [B12ff54], 00h
    je short L48c2e
    test bx, bx
    jbe short L48c2e
    cmp bx, 0190h
    jae short L48c2e
    mov eax, dword ptr [B12ff44]
    db 089h, 0cah
    db 031h, 0f6h
    call Func4edda_
    db 066h, 089h, 0deh
    mov eax, dword ptr [eax+034h]
    imul eax, esi
    db 031h, 0d2h
    mov esi, 064h
    div esi
    mov esi, dword ptr [B12ff44]
    db 089h, 0c3h
    db 089h, 0cah
    db 089h, 0f0h
    call Func4ec68_
L48c2e:
    pop esi
    pop ecx
    pop ebx
    ret
Func48bd8_ endp
    db 08bh, 0c0h
SoundSetSampleVolume_ proc near
    push ebx
    push ecx
    cmp dx, 07fffh
    jbe short L48c42
    mov edx, 07fffh
L48c42:
    movsx edx, dx
    db 089h, 0d3h
    shl ebx, 010h
    mov ecx, dword ptr [B12ff44]
    db 009h, 0d3h
    db 089h, 0c2h
    db 089h, 0c8h
    call Func4e982_
    pop ecx
    pop ebx
    ret
SoundSetSampleVolume_ endp
    db 08bh, 0c0h
Func48c60_ proc near
    push ebx
    push ecx
    push edx
    push esi
    db 089h, 0c1h
    cmp dword ptr [Dc66c0], 00h
    je short L48c78
    cmp dword ptr [B12ff54], 00h
    jne short L48c7f
L48c78:
    db 031h, 0c0h
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
L48c7f:
    mov eax, dword ptr [B12ff44]
    db 089h, 0cah
    call Func4ecee_
    db 031h, 0dbh
    db 089h, 0c6h
    db 089h, 0cah
    mov eax, dword ptr [B12ff44]
    call Func4ec68_
    db 089h, 0f0h
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
Func48c60_ endp
    db 08bh, 0c0h
Func48ca4_ proc near
    push ebx
    push ecx
    cmp dword ptr [Dc66c0], 00h
    je short L48cc9
    cmp dword ptr [B12ff54], 00h
    je short L48cc9
    mov ecx, dword ptr [B12ff44]
    db 089h, 0d3h
    db 089h, 0c2h
    db 089h, 0c8h
    call Func4ec68_
L48cc9:
    pop ecx
    pop ebx
    nop
    ret
Func48ca4_ endp
    db 08dh, 040h, 000h
SoundSetPan_ proc near
    push ebx
    push ecx
    cmp dword ptr [Dc66c0], 00h
    je short L48cf8
    cmp dword ptr [B12ff54], 00h
    je short L48cf8
    db 031h, 0dbh
    mov ecx, dword ptr [B12ff44]
    db 066h, 089h, 0d3h
    db 089h, 0c2h
    db 089h, 0c8h
    call Func4eb6c_
L48cf8:
    pop ecx
    pop ebx
    ret
SoundSetPan_ endp
    db 090h
Func48cfc_ proc near
    push ebx
    push edx
    db 089h, 0c3h
    cmp dword ptr [Dc66c0], 00h
    je short L48d22
    cmp dword ptr [B12ff54], 00h
    je short L48d22
L48d12:
    mov eax, dword ptr [B12ff44]
    db 089h, 0dah
    call Func4ef0a_
    test eax, eax
    je short L48d12
L48d22:
    pop edx
    pop ebx
    ret
Func48cfc_ endp
    db 08dh, 040h, 000h
SoundSampleIsPlaying_ proc near
    push ebx
    push edx
    cmp dword ptr [Dc66c0], 00h
    je short L48d3c
    cmp dword ptr [B12ff54], 00h
    jne short L48d41
L48d3c:
    db 031h, 0c0h
    pop edx
    pop ebx
    ret
L48d41:
    mov ebx, dword ptr [B12ff44]
    db 089h, 0c2h
    db 089h, 0d8h
    call Func4ef0a_
    test eax, eax
    sete al
    and eax, 0ffh
    pop edx
    pop ebx
SoundSampleIsPlaying_ endp
    db 0c3h, 08dh, 040h, 000h
Func48d60_ proc near
    push ebx
    push ecx
    push edx
    push esi
    push edi
    cmp dword ptr [Dc66c0], 00h
    je short L48d77
    cmp dword ptr [B12ff54], 00h
    jne short L48d7b
L48d77:
    db 031h, 0c0h
    jmp short L48db4
L48d7b:
    db 089h, 0c3h
    shl eax, 04h
    db 029h, 0d8h
    mov ebx, dword ptr [B12fe88]
    shl eax, 04h
    db 001h, 0c3h
    test byte ptr [ebx+021h], 080h
    jne short L48d9b
    db 031h, 0c0h
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
L48d9b:
    mov eax, dword ptr [ebx+04h]
    mov ecx, dword ptr [ebx]
    mov esi, dword ptr [ebx+0bch]
    mov edi, dword ptr [ebx+0ach]
    db 029h, 0c8h
    db 031h, 0d2h
    db 001h, 0f0h
    div edi
L48db4:
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
Func48d60_ endp
    db 08bh, 0c0h
Func48dbc_ proc near
    push ebx
    push ecx
    push esi
    db 089h, 0d3h
    cmp dword ptr [Dc66c0], 00h
    je short L48dce
    test ebx, ebx
    jne short L48dd4
L48dce:
    db 031h, 0c0h
    pop esi
    pop ecx
    pop ebx
    ret
L48dd4:
    mov ecx, dword ptr [B12ff4c]
    mov ecx, dword ptr [ecx+eax*4]
    mov eax, dword ptr [ecx]
    mov dword ptr [ebx], eax
    mov eax, dword ptr [ecx+0ch]
    mov dword ptr [ebx+04h], eax
    mov eax, dword ptr [ecx+0ach]
    mov dword ptr [ebx+0ch], eax
    db 031h, 0d2h
    mov eax, dword ptr [ebx+04h]
    mov esi, dword ptr [ebx+0ch]
    div esi
    mov dword ptr [ebx+08h], eax
    mov eax, dword ptr [ecx+038h]
    mov dword ptr [ebx+010h], eax
    mov eax, dword ptr [ecx+03ch]
    mov dword ptr [ebx+014h], eax
    mov eax, 01h
    pop esi
    pop ecx
    pop ebx
    ret
Func48dbc_ endp
    db 08bh, 0c0h
Func48e14_ proc near
    push ebx
    push edi
    mov eax, dword ptr [esp+0ch]
    mov edx, dword ptr [eax+0ch]
    mov ebx, dword ptr [eax+0bch]
    db 001h, 0d3h
    mov ecx, dword ptr [eax+0b8h]
    mov dword ptr [eax+0bch], ebx
    db 039h, 0cbh
    jb short L48e42
    mov dword ptr [eax+0c0h], 00h
    pop edi
    pop ebx
    ret
L48e42:
    cmp dword ptr [eax+0b4h], 00h
    je short L48e5d
    mov edx, dword ptr [eax+0a8h]
    mov dword ptr [eax+0b4h], 00h
    jmp short L48e73
L48e5d:
    mov edx, dword ptr [eax+0a8h]
    mov dword ptr [eax+0b4h], 01h
    add edx, 08000h
L48e73:
    mov dword ptr [eax], edx
    mov edx, dword ptr [eax+0b8h]
    mov edi, dword ptr [eax+0bch]
    db 029h, 0fah
    mov dword ptr [eax+0ch], edx
    cmp edx, 08000h
    jbe short L48e95
    mov dword ptr [eax+0ch], 08000h
L48e95:
    mov dword ptr [eax+0c0h], 01h
    pop edi
    pop ebx
    ret
Func48e14_ endp
    db 08bh, 0c0h
Func48ea4_ proc near
    push ebx
    push ecx
    push edx
    push esi
    push edi
    push ebp
    cmp dword ptr [Dc66c0], 00h
    je near ptr L48f29
    cmp dword ptr [B12ff54], 00h
    je short L48f29
    db 089h, 0c6h
    shl esi, 04h
    db 029h, 0c6h
    mov eax, dword ptr [B12fe88]
    shl esi, 04h
    db 001h, 0c6h
    cmp dword ptr [esi+0c0h], 00h
    je short L48f29
    mov eax, dword ptr [esi+0b8h]
    sub eax, dword ptr [esi+0bch]
    cmp eax, 08000h
    jbe short L48ef2
    mov eax, 08000h
L48ef2:
    mov ebx, 01h
    mov ebp, dword ptr [esi+0b4h]
    mov ecx, dword ptr [esi+0b0h]
    test ebp, ebp
    je short L48f0b
    db 031h, 0ffh
    jmp short L48f10
L48f0b:
    mov edi, 08000h
L48f10:
    add edi, dword ptr [esi+0a8h]
    db 089h, 0c2h
    db 089h, 0f8h
    call fread_
    mov dword ptr [esi+0c0h], 00h
L48f29:
    pop ebp
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
Func48ea4_ endp
SoundGetSOSHandle_ proc near
    mov eax, dword ptr [B12ff44]
    ret
SoundGetSOSHandle_ endp
    db 08bh, 0c0h
SoundGetSOSDriver_ proc near
    cmp dword ptr [Dc66c0], 00h
    jne short L48f47
    mov eax, 0ffffffffh
    ret
L48f47:
    mov eax, offset B12fe30
    ret
SoundGetSOSDriver_ endp
_TEXT ends

_DATA segment
    db 000h, 000h, 000h, 000h
Dc66c0 label byte
    db 000h, 000h, 000h, 000h
Dc66c4 label byte
    db 000h, 000h, 000h, 000h
Dc66c8 label byte
    dd offset Dc66c4
_DATA ends

CONST segment
Dc101c label byte
    db "DIGITAL"
    db 000h
Dc1024 label byte
    db "DeviceID"
    db 000h, 000h, 000h, 000h
Dc1030 label byte
    db "DevicePort"
    db 000h, 000h
Dc103c label byte
    db "DeviceDMA"
    db 000h, 000h, 000h
Dc1048 label byte
    db "DeviceIRQ"
    db 000h, 000h, 000h
Dc1054 label byte
    db "hmiset.cfg"
    db 000h, 000h
Dc1060 label byte
    db 072h, 062h, 000h, 000h
CONST ends

_BSS segment
    db 12 dup(?)
B12fe30 label byte
    db 4 dup(?)
B12fe34 label byte
    db 8 dup(?)
B12fe3c label byte
    db 56 dup(?)
B12fe74 label byte
    db 20 dup(?)
B12fe88 label byte
    db 4 dup(?)
B12fe8c label byte
    db 4 dup(?)
B12fe90 label byte
    db 4 dup(?)
B12fe94 label byte
    db 160 dup(?)
B12ff34 label byte
    db 4 dup(?)
B12ff38 label byte
    db 4 dup(?)
B12ff3c label byte
    db 4 dup(?)
B12ff40 label byte
    db 4 dup(?)
B12ff44 label byte
    db 4 dup(?)
B12ff48 label byte
    db 4 dup(?)
B12ff4c label byte
    db 4 dup(?)
B12ff50 label byte
    db 4 dup(?)
B12ff54 label byte
    db 4 dup(?)
B12ff58 label byte
    db 8 dup(?)
_BSS ends

    end

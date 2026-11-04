    .586p

_TEXT segment para public use32 'CODE'
_TEXT ends
CONST segment dword public use32 'DATA'
CONST ends

    assume cs:FLAT, ds:FLAT, es:FLAT, ss:FLAT

    extrn Func5eac6_:near
    extrn Func5f0ab_:near
    extrn Func5f2ce_:near
    extrn Func5f305_:near
    extrn Func5ffed_:near
    extrn Func67e27_:near
    extrn Func70d17_:near
    extrn Func75e12_:near
    extrn Func75e4b_:near
    extrn Func78e07_:near
    extrn Func7df02_:near
    extrn Func7df3b_:near
    extrn __CHP:near
    extrn _lseek_:near
    extrn _nfree_:near
    extrn _nmalloc_:near
    extrn _strdup_:near
    extrn atol_:near
    extrn calloc_:near
    extrn close_:near
    extrn fclose_:near
    extrn fgets_:near
    extrn fopen_:near
    extrn fseek_:near
    extrn open_:near
    extrn read_:near
    extrn strncmp_:near
    extrn strtod_:near
    extrn tell_:near

    public Func57a00_
    public Func57b74_
    public Func57c10_
    public Func57c20_
    public Func57c4c_
    public Func57c5c_
    public Func57c6c_
    public Func57cc4_
    public Func57cf0_
    public Func57d44_
    public Func57d78_
    public Func57dac_
    public Func57e00_
    public Func57e08_
    public Func57e14_
    public Func57eb0_
    public Func57ee8_
    public Func57f6c_
    public Func58264_
    public Func58398_
    public Func583b8_
    public Func583dc_
    public Func583e4_
    public Func58444_
    public Func584a0_
    public Func584b0_
    public Func584c0_
    public Func584d0_
    public Func584e0_
    public Func58514_

_TEXT segment
Func57a00_ proc near
    push ebx
    push ecx
    push esi
    push edi
    push ebp
    sub esp, 04h
    db 089h, 0c3h
    test dl, 010h
    je short L57a23
    mov ecx, 08000h
    mov edi, 025800h
    mov esi, 080000h
    mov dword ptr [esp], ecx
    jmp short L57a35
L57a23::
    mov edx, 04000h
    mov edi, 012c00h
    mov esi, 040000h
    mov dword ptr [esp], edx
L57a35::
    mov edx, 08h
    mov eax, 01h
    call calloc_
    mov dword ptr [ebx], eax
    test eax, eax
    jne short L57a54
    mov eax, 0ch
    jmp near ptr L57b6b
L57a54::
    mov edx, 076h
    mov eax, 01h
    call calloc_
    mov edx, dword ptr [ebx]
    mov dword ptr [edx], eax
    test eax, eax
    jne short L57a80
    mov eax, dword ptr [ebx]
    call Func57b74_
    mov eax, 0ch
    add esp, 04h
    pop ebp
    pop edi
    pop esi
    pop ecx
    pop ebx
    ret
L57a80::
    mov edx, 04h
    mov eax, dword ptr [esp]
    call calloc_
    db 089h, 0c2h
    mov eax, dword ptr [ebx]
    mov eax, dword ptr [eax]
    mov dword ptr [eax+066h], edx
    db 089h, 0d0h
    test eax, eax
    jne short L57ab1
    mov eax, dword ptr [ebx]
    call Func57b74_
    mov eax, 0ch
    add esp, 04h
    pop ebp
    pop edi
    pop esi
    pop ecx
    pop ebx
    ret
L57ab1::
    mov ebp, dword ptr [esp]
    db 031h, 0d2h
    test ebp, ebp
    jbe short L57ad5
    db 031h, 0c0h
L57abc::
    mov ecx, dword ptr [ebx]
    mov ecx, dword ptr [ecx]
    mov ecx, dword ptr [ecx+066h]
    inc edx
    mov dword ptr [ecx+eax*1], 0ffffh
    mov ecx, dword ptr [esp]
    add eax, 04h
    db 039h, 0cah
    jb short L57abc
L57ad5::
    mov edx, 04h
    db 089h, 0f8h
    call calloc_
    mov edx, dword ptr [ebx]
    mov edx, dword ptr [edx]
    mov dword ptr [edx+06ah], eax
    test eax, eax
    jne short L57b01
    mov eax, dword ptr [ebx]
    call Func57b74_
    mov eax, 0ch
    add esp, 04h
    pop ebp
    pop edi
    pop esi
    pop ecx
    pop ebx
    ret
L57b01::
    db 031h, 0c0h
    test edi, edi
    jbe short L57b1f
    db 031h, 0d2h
L57b09::
    mov ecx, dword ptr [ebx]
    mov ecx, dword ptr [ecx]
    mov ecx, dword ptr [ecx+06ah]
    inc eax
    mov dword ptr [ecx+edx*1], 0ffffh
    add edx, 04h
    db 039h, 0f8h
    jb short L57b09
L57b1f::
    mov edx, 04h
    db 089h, 0f0h
    call calloc_
    mov edx, dword ptr [ebx]
    mov edx, dword ptr [edx]
    mov dword ptr [edx+06eh], eax
    test eax, eax
    jne short L57b4b
    mov eax, dword ptr [ebx]
    call Func57b74_
    mov eax, 0ch
    add esp, 04h
    pop ebp
    pop edi
    pop esi
    pop ecx
    pop ebx
    ret
L57b4b::
    db 031h, 0c0h
    test esi, esi
    jbe short L57b69
    db 031h, 0d2h
L57b53::
    mov ecx, dword ptr [ebx]
    mov ecx, dword ptr [ecx]
    mov ecx, dword ptr [ecx+06eh]
    inc eax
    mov dword ptr [ecx+edx*1], 0ffffh
    add edx, 04h
    db 039h, 0f0h
    jb short L57b53
L57b69::
    db 031h, 0c0h
L57b6b::
    add esp, 04h
    pop ebp
    pop edi
    pop esi
    pop ecx
    pop ebx
    ret
Func57a00_ endp
Func57b74_ proc near
    push ebx
    push ecx
    push edx
    push esi
    push edi
    push ebp
    db 089h, 0c2h
    test eax, eax
    je near ptr L57c06
    mov ebx, dword ptr [eax]
    test ebx, ebx
    je near ptr L57bff
    mov ecx, dword ptr [ebx+04ah]
    db 089h, 0d8h
    test ecx, ecx
    je short L57ba7
    db 089h, 0c8h
    call _nfree_
    mov eax, dword ptr [edx]
    mov dword ptr [eax+04ah], 00h
L57ba7::
    mov eax, dword ptr [edx]
    mov esi, dword ptr [eax+066h]
    test esi, esi
    je short L57bc0
    db 089h, 0f0h
    call _nfree_
    mov eax, dword ptr [edx]
    mov dword ptr [eax+066h], 00h
L57bc0::
    mov eax, dword ptr [edx]
    mov edi, dword ptr [eax+06ah]
    test edi, edi
    je short L57bd9
    db 089h, 0f8h
    call _nfree_
    mov eax, dword ptr [edx]
    mov dword ptr [eax+06ah], 00h
L57bd9::
    mov eax, dword ptr [edx]
    mov ebp, dword ptr [eax+06eh]
    test ebp, ebp
    je short L57bf2
    db 089h, 0e8h
    call _nfree_
    mov eax, dword ptr [edx]
    mov dword ptr [eax+06eh], 00h
L57bf2::
    mov eax, dword ptr [edx]
    call _nfree_
    mov dword ptr [edx], 00h
L57bff::
    db 089h, 0d0h
    call _nfree_
L57c06::
    pop ebp
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
Func57b74_ endp
    db 000h, 000h, 000h
Func57c10_ proc near
    push ecx
    push ebx
    push edx
    push eax
    call Func5f305_
    add esp, 010h
    ret
Func57c10_ endp
    db 08dh, 040h, 000h
Func57c20_ proc near
    push esi
    push edi
    push ebp
    mov esi, dword ptr [esp+01ch]
    push esi
    mov edi, dword ptr [esp+01ch]
    push edi
    mov ebp, dword ptr [esp+01ch]
    push ebp
    mov esi, dword ptr [esp+01ch]
    push esi
    push ecx
    push ebx
    push edx
    push eax
    call Func5eac6_
    add esp, 020h
    pop ebp
    pop edi
    pop esi
    ret 010h
Func57c20_ endp
    db 08dh, 040h, 000h
Func57c4c_ proc near
    push ecx
    push ebx
    push edx
    push eax
    call Func5f0ab_
    add esp, 0ch
    pop ecx
    ret
Func57c4c_ endp
    db 08bh, 0c0h
Func57c5c_ proc near
    push ecx
    push ebx
    push edx
    push eax
    call Func5f2ce_
    add esp, 010h
    ret
Func57c5c_ endp
    db 08dh, 040h, 000h
Func57c6c_ proc near
    push esi
    push edi
    push ebp
    mov esi, dword ptr [esp+040h]
    push esi
    mov edi, dword ptr [esp+040h]
    push edi
    mov ebp, dword ptr [esp+040h]
    push ebp
    mov esi, dword ptr [esp+040h]
    push esi
    mov edi, dword ptr [esp+040h]
    push edi
    mov ebp, dword ptr [esp+040h]
    push ebp
    mov esi, dword ptr [esp+040h]
    push esi
    mov edi, dword ptr [esp+040h]
    push edi
    mov ebp, dword ptr [esp+040h]
    push ebp
    mov esi, dword ptr [esp+040h]
    push esi
    mov edi, dword ptr [esp+040h]
    push edi
    mov ebp, dword ptr [esp+040h]
    push ebp
    mov esi, dword ptr [esp+040h]
    push esi
    push ecx
    push ebx
    push edx
    push eax
    call Func67e27_
    add esp, 044h
    pop ebp
    pop edi
    pop esi
    ret 034h
Func57c6c_ endp
    db 08bh, 0c0h
Func57cc4_ proc near
    push esi
    push edi
    push ebp
    mov esi, dword ptr [esp+01ch]
    push esi
    mov edi, dword ptr [esp+01ch]
    push edi
    mov ebp, dword ptr [esp+01ch]
    push ebp
    mov esi, dword ptr [esp+01ch]
    push esi
    push ecx
    push ebx
    push edx
    push eax
    call Func5ffed_
    add esp, 020h
    pop ebp
    pop edi
    pop esi
    ret 010h
Func57cc4_ endp
    db 000h, 000h, 000h
Func57cf0_ proc near
    push ebx
    push ecx
    db 089h, 0c1h
    db 089h, 0d0h
    mov edx, offset Dc1494
    call fopen_
    db 089h, 0c3h
    test eax, eax
    jne short L57d0e
    mov eax, 013h
    pop ecx
    pop ebx
    ret
L57d0e::
    db 089h, 0cah
    call Func57e14_
    test eax, eax
    jne short L57d22
    db 089h, 0d8h
    call fclose_
    jmp short L57d3b
L57d22::
    db 089h, 0d8h
    call fclose_
    cmp dword ptr [ecx+010h], 07ch
    jne short L57d34
    db 031h, 0c0h
    pop ecx
    pop ebx
    ret
L57d34::
    db 089h, 0c8h
    call Func57ee8_
L57d3b::
    mov eax, 014h
    pop ecx
    pop ebx
    ret
Func57cf0_ endp
    db 090h
Func57d44_ proc near
    push ebx
    push ecx
    push edx
    db 089h, 0c1h
    mov ebx, dword ptr [eax+015ch]
    mov edx, dword ptr [eax+0b4h]
    mov eax, dword ptr [eax+04h]
    mov eax, dword ptr [eax]
    call read_
    cmp eax, dword ptr [ecx+015ch]
    mov eax, dword ptr [ecx+0160h]
    call dword ptr [ecx+014ch]
    db 031h, 0c0h
    pop edx
    pop ecx
    pop ebx
    ret
Func57d44_ endp
    db 090h
Func57d78_ proc near
    push ebx
    push ecx
    push edx
    db 089h, 0c1h
    mov ebx, dword ptr [eax+012ch]
    mov edx, dword ptr [eax+0b4h]
    mov eax, dword ptr [eax+04h]
    mov eax, dword ptr [eax]
    call read_
    cmp eax, dword ptr [ecx+012ch]
    mov eax, dword ptr [ecx+0160h]
    call dword ptr [ecx+014ch]
    db 031h, 0c0h
    pop edx
    pop ecx
    pop ebx
    ret
Func57d78_ endp
    db 090h
Func57dac_ proc near
    push ecx
    push esi
    push edi
    db 089h, 0c6h
    db 089h, 0d1h
    db 089h, 0dfh
    db 031h, 0dbh
    call _lseek_
    cmp eax, 0ffffffffh
    jne short L57dca
    mov eax, 017h
    pop edi
    pop esi
    pop ecx
    ret
L57dca::
    mov ebx, 0800h
    db 089h, 0cah
    db 089h, 0c8h
    sar edx, 01fh
    idiv ebx
    db 089h, 0d9h
    db 029h, 0d1h
    db 089h, 0f0h
    db 089h, 0cbh
    mov edx, dword ptr [edi]
    call read_
    db 039h, 0c8h
    je short L57df4
    mov eax, 019h
    pop edi
    pop esi
    pop ecx
    ret
L57df4::
    mov edx, dword ptr [edi]
    db 001h, 0cah
    db 031h, 0c8h
    mov dword ptr [edi], edx
    pop edi
    pop esi
    pop ecx
    ret
Func57dac_ endp
Func57e00_ proc near
    jmp near ptr tell_
Func57e00_ endp
    db 08dh, 040h, 000h
Func57e08_ proc near
    push ebx
    db 031h, 0dbh
    call _lseek_
    pop ebx
    ret
Func57e08_ endp
    db 08bh, 0c0h
Func57e14_ proc near
    push ebx
    push ecx
    push esi
    sub esp, 04h
    db 089h, 0c1h
    db 089h, 0d3h
    db 031h, 0f6h
    test edx, edx
    je short L57e28
    test eax, eax
    jne short L57e2f
L57e28::
    db 031h, 0c0h
    jmp near ptr L57ea6
L57e2f::
    test edx, edx
    je short L57e4b
    mov dword ptr [edx+04ch], 09f82c384h
    mov dword ptr [edx], esi
    mov dword ptr [edx+04h], esi
    mov dword ptr [edx+0ch], esi
    mov dword ptr [edx+08h], esi
    mov dword ptr [edx+058h], esi
    mov dword ptr [edx+030h], esi
L57e4b::
    db 089h, 0dah
    db 089h, 0c8h
    call Func57f6c_
    test eax, eax
    jne short L57e5d
    mov esi, 01h
L57e5d::
    test esi, esi
    jne short L57e73
    db 089h, 0dah
    db 089h, 0c8h
    call Func58264_
    test eax, eax
    jne short L57e73
    mov esi, 01h
L57e73::
    test esi, esi
    jne short L57e8d
    fild dword ptr [ebx+020h]
    fdiv dword ptr [ebx+054h]
    call __CHP
    fistp dword ptr [esp]
    mov eax, dword ptr [esp]
    and al, 0fch
    mov dword ptr [ebx+050h], eax
L57e8d::
    test esi, esi
    je short L57ea1
    db 089h, 0d8h
    call Func57ee8_
    db 031h, 0c0h
    add esp, 04h
    pop esi
    pop ecx
    pop ebx
    ret
L57ea1::
    mov eax, 01h
L57ea6::
    add esp, 04h
    pop esi
    pop ecx
    pop ebx
    ret
Func57e14_ endp
    db 08dh, 040h, 000h
Func57eb0_ proc near
    test eax, eax
    je short L57ee4
    mov dword ptr [eax+04ch], 09f82c384h
    mov dword ptr [eax], 00h
    mov dword ptr [eax+04h], 00h
    mov dword ptr [eax+0ch], 00h
    mov dword ptr [eax+08h], 00h
    mov dword ptr [eax+058h], 00h
    mov dword ptr [eax+030h], 00h
L57ee4::
    ret
Func57eb0_ endp
    db 08dh, 040h, 000h
Func57ee8_ proc near
    push ecx
    push edx
    push esi
    push edi
    push ebp
    db 089h, 0c2h
    test eax, eax
    je near ptr L57f65
    cmp dword ptr [eax+04ch], 09f82c384h
    jne short L57f65
    mov ecx, dword ptr [eax]
    test ecx, ecx
    je short L57f13
    db 089h, 0c8h
    call _nfree_
    mov dword ptr [edx], 00h
L57f13::
    mov esi, dword ptr [edx+04h]
    test esi, esi
    je short L57f28
    db 089h, 0f0h
    call _nfree_
    mov dword ptr [edx+04h], 00h
L57f28::
    mov edi, dword ptr [edx+0ch]
    test edi, edi
    je short L57f3d
    db 089h, 0f8h
    call _nfree_
    mov dword ptr [edx+0ch], 00h
L57f3d::
    mov ebp, dword ptr [edx+08h]
    test ebp, ebp
    je short L57f52
    db 089h, 0e8h
    call _nfree_
    mov dword ptr [edx+08h], 00h
L57f52::
    mov eax, dword ptr [edx+058h]
    test eax, eax
    je short L57f65
    call _nfree_
    mov dword ptr [edx+058h], 00h
L57f65::
    pop ebp
    pop edi
    pop esi
    pop edx
    pop ecx
    ret
Func57ee8_ endp
    db 090h
Func57f6c_ proc near
    push ebx
    push ecx
    push esi
    sub esp, 0100h
    db 089h, 0c1h
    db 089h, 0d6h
    db 031h, 0dbh
    db 031h, 0d2h
    call fseek_
    test eax, eax
    je short L57f8d
    db 031h, 0c0h
    jmp near ptr L5825a
L57f8d::
    mov edx, 0100h
    db 089h, 0e0h
    db 089h, 0cbh
    call fgets_
    test eax, eax
    je near ptr L5825a
    mov ebx, 07h
    mov edx, offset Dc1498
    db 089h, 0e0h
    call strncmp_
    test eax, eax
    je short L57fc4
    db 031h, 0c0h
    add esp, 0100h
    pop esi
    pop ecx
    pop ebx
    ret
L57fc4::
    mov edx, 0100h
    db 089h, 0e0h
    db 089h, 0cbh
    call fgets_
    test eax, eax
    je near ptr L5825a
    db 089h, 0e0h
    call _strdup_
    mov dword ptr [esi], eax
    test eax, eax
    je near ptr L5825a
    mov edx, 0100h
    db 089h, 0e0h
    db 089h, 0cbh
    call fgets_
    test eax, eax
    je near ptr L5825a
    db 089h, 0e0h
    call _strdup_
    mov dword ptr [esi+04h], eax
    test eax, eax
    je near ptr L5825a
    mov edx, 0100h
    db 089h, 0e0h
    db 089h, 0cbh
    call fgets_
    test eax, eax
    je near ptr L5825a
    db 089h, 0e0h
    call _strdup_
    mov dword ptr [esi+0ch], eax
    test eax, eax
    je near ptr L5825a
    mov edx, 0100h
    db 089h, 0e0h
    db 089h, 0cbh
    call fgets_
    test eax, eax
    je near ptr L5825a
    db 089h, 0e0h
    mov edx, 0100h
    call atol_
    db 089h, 0cbh
    mov dword ptr [esi+010h], eax
    db 089h, 0e0h
    call fgets_
    test eax, eax
    je near ptr L5825a
    db 089h, 0e0h
    mov edx, 0100h
    call atol_
    db 089h, 0cbh
    mov dword ptr [esi+014h], eax
    db 089h, 0e0h
    call fgets_
    test eax, eax
    je near ptr L5825a
    db 089h, 0e0h
    mov edx, 0100h
    call atol_
    db 089h, 0cbh
    mov dword ptr [esi+018h], eax
    db 089h, 0e0h
    call fgets_
    test eax, eax
    je near ptr L5825a
    db 089h, 0e0h
    mov edx, 0100h
    call atol_
    db 089h, 0cbh
    mov dword ptr [esi+01ch], eax
    db 089h, 0e0h
    call fgets_
    test eax, eax
    je near ptr L5825a
    db 089h, 0e0h
    db 031h, 0d2h
    call strtod_
    db 089h, 0cbh
    mov edx, 0100h
    db 089h, 0e0h
    fstp dword ptr [esi+054h]
    call fgets_
    test eax, eax
    je near ptr L5825a
    db 089h, 0e0h
    call _strdup_
    mov dword ptr [esi+08h], eax
    test eax, eax
    je near ptr L5825a
    mov edx, 0100h
    db 089h, 0e0h
    db 089h, 0cbh
    call fgets_
    test eax, eax
    je near ptr L5825a
    db 089h, 0e0h
    mov edx, 0100h
    call atol_
    db 089h, 0cbh
    mov dword ptr [esi+020h], eax
    db 089h, 0e0h
    call fgets_
    test eax, eax
    je near ptr L5825a
    db 089h, 0e0h
    mov edx, 0100h
    call atol_
    db 089h, 0cbh
    mov dword ptr [esi+024h], eax
    db 089h, 0e0h
    call fgets_
    test eax, eax
    je near ptr L5825a
    db 089h, 0e0h
    mov edx, 0100h
    call atol_
    db 089h, 0cbh
    mov dword ptr [esi+028h], eax
    db 089h, 0e0h
    call fgets_
    test eax, eax
    je near ptr L5825a
    db 089h, 0e0h
    mov edx, 0100h
    call atol_
    db 089h, 0cbh
    mov dword ptr [esi+02ch], eax
    db 089h, 0e0h
    call fgets_
    test eax, eax
    je near ptr L5825a
    db 089h, 0e0h
    mov edx, 0100h
    call atol_
    db 089h, 0cbh
    mov dword ptr [esi+030h], eax
    db 089h, 0e0h
    call fgets_
    test eax, eax
    je near ptr L5825a
    db 089h, 0e0h
    mov edx, 0100h
    call atol_
    db 089h, 0cbh
    mov dword ptr [esi+034h], eax
    db 089h, 0e0h
    call fgets_
    test eax, eax
    je near ptr L5825a
    db 089h, 0e0h
    mov edx, 0100h
    call atol_
    db 089h, 0cbh
    mov dword ptr [esi+038h], eax
    db 089h, 0e0h
    call fgets_
    test eax, eax
    je short L5825a
    db 089h, 0e0h
    mov edx, 0100h
    call atol_
    db 089h, 0cbh
    mov dword ptr [esi+03ch], eax
    db 089h, 0e0h
    call fgets_
    test eax, eax
    je short L5825a
    db 089h, 0e0h
    mov edx, 0100h
    call atol_
    db 089h, 0cbh
    mov dword ptr [esi+040h], eax
    db 089h, 0e0h
    call fgets_
    test eax, eax
    je short L5825a
    db 089h, 0e0h
    mov edx, 0100h
    call atol_
    db 089h, 0cbh
    mov dword ptr [esi+044h], eax
    db 089h, 0e0h
    call fgets_
    test eax, eax
    je short L5825a
    db 089h, 0e0h
    call atol_
    mov dword ptr [esi+048h], eax
    mov eax, 01h
L5825a::
    add esp, 0100h
    pop esi
    pop ecx
    pop ebx
    ret
Func57f6c_ endp
Func58264_ proc near
    push ebx
    push ecx
    push esi
    push edi
    push ebp
    sub esp, 0104h
    mov dword ptr [esp+0100h], eax
    db 089h, 0d7h
    cmp dword ptr [edx+030h], 00h
    jl short L58285
    mov ebx, dword ptr [edi+03ch]
    test ebx, ebx
    jge short L5828c
L58285::
    db 031h, 0c0h
    jmp near ptr L5838a
L5828c::
    db 089h, 0dah
    db 031h, 0dbh
    call fseek_
    test eax, eax
    je short L582a7
    db 031h, 0c0h
    add esp, 0104h
    pop ebp
    pop edi
    pop esi
    pop ecx
    pop ebx
    ret
L582a7::
    mov edx, dword ptr [edi+030h]
    inc edx
    lea eax, [edx*4+00h]
    db 029h, 0d0h
    shl eax, 02h
    call _nmalloc_
    mov dword ptr [edi+058h], eax
    test eax, eax
    je near ptr L5838a
    mov esi, dword ptr [edi+030h]
    db 031h, 0edh
    test esi, esi
    jl near ptr L58385
    db 031h, 0c9h
L582d6::
    mov ebx, dword ptr [esp+0100h]
    mov edx, 0100h
    db 089h, 0e0h
    call fgets_
    test eax, eax
    je near ptr L5838a
    db 089h, 0e0h
    call atol_
    mov esi, dword ptr [edi+058h]
    mov dl, 02ch
    mov dword ptr [ecx+esi*1], eax
    db 089h, 0e6h
L58302::
    mov al, byte ptr [esi]
    db 03ah, 0c2h
    je short L5831a
    cmp al, 00h
    je short L58318
    inc esi
    mov al, byte ptr [esi]
    db 03ah, 0c2h
    je short L5831a
    inc esi
    cmp al, 00h
    jne short L58302
L58318::
    sub esi, esi
L5831a::
    test esi, esi
    jne short L5832c
    db 031h, 0c0h
    add esp, 0104h
    pop ebp
    pop edi
    pop esi
    pop ecx
    pop ebx
    ret
L5832c::
    lea eax, [esi+01h]
    call atol_
    mov edx, dword ptr [edi+058h]
    mov dword ptr [ecx+edx*1+04h], eax
    mov dl, 03bh
L5833d::
    mov al, byte ptr [esi]
    db 03ah, 0c2h
    je short L58355
    cmp al, 00h
    je short L58353
    inc esi
    mov al, byte ptr [esi]
    db 03ah, 0c2h
    je short L58355
    inc esi
    cmp al, 00h
    jne short L5833d
L58353::
    sub esi, esi
L58355::
    test esi, esi
    jne short L58367
    db 031h, 0c0h
    add esp, 0104h
    pop ebp
    pop edi
    pop esi
    pop ecx
    pop ebx
    ret
L58367::
    lea eax, [esi+01h]
    call atol_
    mov edx, dword ptr [edi+058h]
    mov dword ptr [ecx+edx*1+08h], eax
    inc ebp
    mov eax, dword ptr [edi+030h]
    add ecx, 0ch
    db 039h, 0c5h
    jle near ptr L582d6
L58385::
    mov eax, 01h
L5838a::
    add esp, 0104h
    pop ebp
    pop edi
    pop esi
    pop ecx
    pop ebx
    ret
Func58264_ endp
    db 08bh, 0c0h
Func58398_ proc near
    push ebx
    db 089h, 0d3h
    mov edx, 01h
    call calloc_
    mov dword ptr [ebx], eax
    test eax, eax
    jne short L583b2
    mov eax, 0eh
    pop ebx
    ret
L583b2::
    db 031h, 0c0h
    pop ebx
    ret
Func58398_ endp
    db 08bh, 0c0h
Func583b8_ proc near
    push ebx
    db 089h, 0c3h
    push 0200h
    push edx
    call open_
    add esp, 08h
    mov dword ptr [ebx], eax
    cmp eax, 0ffffffffh
    jne short L583d7
    mov eax, 011h
    pop ebx
    ret
L583d7::
    db 031h, 0c0h
    pop ebx
    ret
Func583b8_ endp
    db 090h
Func583dc_ proc near
    jmp near ptr close_
Func583dc_ endp
    db 08dh, 040h, 000h
Func583e4_ proc near
    push ebx
    push ecx
    push esi
    push edi
    db 089h, 0c6h
    mov ecx, dword ptr [edx]
    test ecx, ecx
    je short L58402
    mov edi, dword ptr [ecx+04h]
    db 089h, 0cbh
    test edi, edi
    je short L58402
L583f9::
    mov ebx, dword ptr [ebx+04h]
    cmp dword ptr [ebx+04h], 00h
    jne short L583f9
L58402::
    mov eax, 09h
    call _nmalloc_
    db 089h, 0c1h
    test eax, eax
    jne short L5841c
    mov eax, 011h
    pop edi
    pop esi
    pop ecx
    pop ebx
    ret
L5841c::
    cmp dword ptr [edx], 00h
    jne short L58425
    mov dword ptr [edx], eax
    jmp short L58428
L58425::
    mov dword ptr [ebx+04h], eax
L58428::
    mov dword ptr [ecx+04h], 00h
    mov eax, dword ptr [esi+0160h]
    mov dword ptr [ecx], eax
    db 031h, 0c0h
    mov dword ptr [esi+0148h], ecx
    pop edi
    pop esi
    pop ecx
    pop ebx
    ret
Func583e4_ endp
Func58444_ proc near
    push ebx
    push ecx
    push esi
    push edi
    db 089h, 0c3h
    db 089h, 0d1h
    mov eax, dword ptr [edx]
    mov esi, dword ptr [ebx+0148h]
    cmp esi, dword ptr [eax+04h]
    jne short L58469
    jmp short L5846f
L5845b::
    mov eax, dword ptr [eax+04h]
    mov edi, dword ptr [ebx+0148h]
    cmp edi, dword ptr [eax+04h]
    je short L5846f
L58469::
    cmp dword ptr [eax+04h], 00h
    jne short L5845b
L5846f::
    mov edx, dword ptr [ebx+0148h]
    mov edx, dword ptr [edx+04h]
    mov dword ptr [eax+04h], edx
    mov eax, dword ptr [ebx+0148h]
    cmp eax, dword ptr [ecx]
    jne short L5848b
    mov dword ptr [ecx], 00h
L5848b::
    mov eax, dword ptr [ebx+0148h]
    call _nfree_
    db 031h, 0c0h
    pop edi
    pop esi
    pop ecx
    pop ebx
    ret
Func58444_ endp
    db 000h, 000h, 000h
Func584a0_ proc near
    push ecx
    push ebx
    push edx
    push eax
    call Func70d17_
    add esp, 010h
    ret
Func584a0_ endp
    db 08dh, 040h, 000h
Func584b0_ proc near
    push ecx
    push ebx
    push edx
    push eax
    call Func78e07_
    add esp, 010h
    ret
Func584b0_ endp
    db 08dh, 040h, 000h
Func584c0_ proc near
    push ecx
    push edx
    push eax
    call Func75e12_
    add esp, 08h
    pop ecx
    ret
Func584c0_ endp
    db 08dh, 040h, 000h
Func584d0_ proc near
    push ecx
    push edx
    push eax
    call Func7df02_
    add esp, 08h
    pop ecx
    ret
Func584d0_ endp
    db 08dh, 040h, 000h
Func584e0_ proc near
    push esi
    push edi
    push ebp
    mov esi, dword ptr [esp+024h]
    push esi
    mov edi, dword ptr [esp+024h]
    push edi
    mov ebp, dword ptr [esp+024h]
    push ebp
    mov esi, dword ptr [esp+024h]
    push esi
    mov edi, dword ptr [esp+024h]
    push edi
    mov ebp, dword ptr [esp+024h]
    push ebp
    push ecx
    push ebx
    push edx
    push eax
    call Func75e4b_
    add esp, 028h
    pop ebp
    pop edi
    pop esi
    ret 018h
Func584e0_ endp
    db 090h
Func58514_ proc near
    push esi
    push edi
    push ebp
    mov esi, dword ptr [esp+024h]
    push esi
    mov edi, dword ptr [esp+024h]
    push edi
    mov ebp, dword ptr [esp+024h]
    push ebp
    mov esi, dword ptr [esp+024h]
    push esi
    mov edi, dword ptr [esp+024h]
    push edi
    mov ebp, dword ptr [esp+024h]
    push ebp
    push ecx
    push ebx
    push edx
    push eax
    call Func7df3b_
    add esp, 028h
    pop ebp
    pop edi
    pop esi
    ret 018h
Func58514_ endp
_TEXT ends

CONST segment
Dc1494 label byte
    db 072h, 062h, 000h, 000h
Dc1498 label byte
    db "ARMovie"
    db 000h
CONST ends

    end

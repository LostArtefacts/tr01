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

    extrn Func4efa0_:near
    extrn Func4f620_:near
    extrn Func4fbf4_:near
    extrn Func5056c_:near
    extrn Func50d04_:near
    extrn _Data1300e8:byte
    extrn __CHP:near
    extrn _nmalloc_:near
    extrn calloc_:near
    extrn memset_:near

    public Player_InitPlaybackMode_
    public Func48f7c_
    public Player_InitVideo_
    public Player_ShutDownVideo_
    public Player_InitMovie_
    public Player_ShutDownMovie_
    public Player_InitPlaybackSystem_
    public Func492e0_
    public Player_InitSound_
    public Player_StartSound_
    public Func495c4_
    public Func495f8_
    public Player_ShutDownPlaybackSystem_
    public Player_ShutDownSound_
    public Player_StartTimer_
    public Func49808_
    public Func49854_
    public Player_InitMoviePlayback_
    public Func498bc_
    public Player_Playframe_
    public Player_MapVideo_
    public Player_StopSound_
    public Func49cbc_
    public Func49ce8_
    public Func49d10_
    public Func49d60_
    public Func49db0_
    public Func49e1c_
    public Func49ebc_

_TEXT segment
Player_InitPlaybackMode_ proc near
    push ebx
    push ecx
    push edx
    push esi
    push edi
    push ebp
    db 089h, 0e5h
    db 081h, 0ech, 004h, 000h, 000h, 000h
    db 0c7h, 005h
    dd offset Dc66d0
    db 010h, 001h, 000h, 000h
    db 0e8h, 07fh, 064h, 000h, 000h
    db 089h, 045h, 0fch
    db 08bh, 045h, 0fch
    db 089h, 0ech
    db 05dh
    db 05fh
    db 05eh
    db 05ah
    db 059h
    db 05bh
    db 0c3h
Player_InitPlaybackMode_ endp
Func48f7c_ proc near
    db 053h
    db 051h
    db 052h
    db 056h
    db 057h
    db 055h
    db 089h, 0e5h
    db 081h, 0ech, 004h, 000h, 000h, 000h
    db 0c7h, 005h
    dd offset Dc66d0
    db 001h, 000h, 000h, 000h
    db 0e8h, 07fh, 064h, 000h, 000h
    db 089h, 045h, 0fch
    db 08bh, 045h, 0fch
    db 089h, 0ech
    db 05dh
    db 05fh
    db 05eh
    db 05ah
    db 059h
    db 05bh
    db 0c3h
Func48f7c_ endp
Player_InitVideo_ proc near
    db 056h
    db 057h
    db 055h
    db 089h, 0e5h
    db 081h, 0ech, 020h, 000h, 000h, 000h
    db 089h, 045h, 0e0h
    db 089h, 055h, 0e4h
    db 089h, 05dh, 0e8h
    db 089h, 04dh, 0ech
    db 083h, 07dh, 024h, 000h
    db 075h, 009h
    db 0f7h, "E( "
    db 000h, 000h, 000h
    db 075h, 002h
L48fce:
    db 0ebh, 00ch
L48fd0:
    db 0c7h, 045h, 0fch, 0ffh, 003h, 000h, 000h
    db 0e9h, 02dh, 001h, 000h, 000h
L48fdc:
    db 083h, 07dh, 024h, 000h
    je short L48fe6
    or dword ptr [ebp+028h], 020h
L48fe6:
    lea eax, [ebp-08h]
    push eax
    lea eax, [ebp-0ch]
    push eax
    mov eax, dword ptr [ebp+028h]
    push eax
    mov eax, dword ptr [ebp+020h]
    push eax
    mov eax, dword ptr [ebp+01ch]
    push eax
    mov eax, dword ptr [ebp+018h]
    push eax
    mov eax, dword ptr [ebp+014h]
    push eax
    mov eax, dword ptr [ebp+010h]
    push eax
    mov ecx, dword ptr [ebp-014h]
    mov ebx, dword ptr [ebp-018h]
    mov edx, dword ptr [ebp-01ch]
    mov eax, dword ptr [ebp-020h]
    call Func4efa0_
    mov dword ptr [ebp-010h], eax
    cmp dword ptr [ebp-010h], 00h
    je short L4902b
    mov eax, dword ptr [ebp-010h]
    mov dword ptr [ebp-04h], eax
    jmp near ptr L49109
L4902b:
    mov eax, dword ptr [ebp-020h]
    mov eax, dword ptr [eax]
    mov edx, dword ptr [eax]
    mov eax, dword ptr [ebp-0ch]
    mov dword ptr [edx+02eh], eax
    mov eax, dword ptr [ebp-020h]
    mov eax, dword ptr [eax]
    mov edx, dword ptr [eax]
    mov eax, dword ptr [ebp-08h]
    mov dword ptr [edx+032h], eax
    mov edx, 08h
    mov eax, 01h
    call calloc_
    db 089h, 0c2h
    mov eax, dword ptr [ebp-020h]
    mov eax, dword ptr [eax]
    mov dword ptr [eax+04h], edx
    mov eax, dword ptr [eax+04h]
    test eax, eax
    jne short L4907b
    mov eax, dword ptr [ebp-020h]
    mov eax, dword ptr [eax]
    call Player_ShutDownVideo_
    mov dword ptr [ebp-04h], 03e9h
    jmp near ptr L49109
L4907b:
    mov edx, 04h
    mov eax, 01h
    call calloc_
    mov edx, dword ptr [ebp-020h]
    mov edx, dword ptr [edx]
    mov edx, dword ptr [edx+04h]
    mov dword ptr [edx+04h], eax
    mov eax, dword ptr [edx+04h]
    test eax, eax
    jne short L490af
    mov eax, dword ptr [ebp-020h]
    mov eax, dword ptr [eax]
    call Player_ShutDownVideo_
    mov dword ptr [ebp-04h], 03e9h
    jmp short L49109
L490af:
    mov eax, dword ptr [ebp-020h]
    mov eax, dword ptr [eax]
    mov edx, dword ptr [eax+04h]
    mov eax, dword ptr [ebp+024h]
    mov dword ptr [edx], eax
    mov eax, dword ptr [ebp-020h]
    mov eax, dword ptr [eax]
    mov eax, dword ptr [eax+04h]
    cmp dword ptr [eax], 00h
    je short L49102
    mov edx, 01h
    mov eax, dword ptr [ebp-0ch]
    imul eax, dword ptr [ebp-08h]
    db 001h, 0c0h
    call calloc_
    mov edx, dword ptr [ebp-020h]
    mov edx, dword ptr [edx]
    mov edx, dword ptr [edx+04h]
    mov edx, dword ptr [edx+04h]
    mov dword ptr [edx], eax
    mov eax, dword ptr [ebp-020h]
    mov eax, dword ptr [eax]
    mov eax, dword ptr [eax+04h]
    mov eax, dword ptr [eax+04h]
    cmp dword ptr [eax], 00h
    jne short L49102
    mov dword ptr [ebp-04h], 03e9h
    jmp short L49109
L49102:
    mov dword ptr [ebp-04h], 00h
L49109:
    mov eax, dword ptr [ebp-04h]
    db 089h, 0ech
    pop ebp
    pop edi
    pop esi
    ret 01ch
Player_InitVideo_ endp
Player_ShutDownVideo_ proc near
    push ebx
    push ecx
    push edx
    push esi
    push edi
    push ebp
    db 089h, 0e5h
    db 081h, 0ech, 008h, 000h, 000h, 000h
    db 089h, 045h, 0f8h
    db 083h, 07dh, 0f8h, 000h
    db 074h, 051h
    db 08bh, 045h, 0f8h
    db 083h, 078h, 004h, 000h
    db 074h, 040h
    db 08bh, 045h, 0f8h
    db 08bh, 040h, 004h
    db 083h, 078h, 004h, 000h
    db 074h, 029h
    db 08bh, 045h, 0f8h
    db 08bh, 040h, 004h
    db 083h, 038h, 000h
    db 074h, 010h
    db 08bh, 045h, 0f8h
    mov eax, dword ptr [eax+04h]
    db 08bh, 040h, 004h
    mov eax, dword ptr [eax]
    db 0e8h, 0a7h, 00dh, 000h, 000h
L4915b:
    db 08bh, 045h, 0f8h
    mov eax, dword ptr [eax+04h]
    db 08bh, 040h, 004h
    db 0e8h, 099h, 00dh, 000h, 000h
L49169:
    db 08bh, 045h, 0f8h
    db 08bh, 040h, 004h
    db 0e8h, 08eh, 00dh, 000h, 000h
L49174:
    db 08bh, 045h, 0f8h
    db 0e8h, 094h, 064h, 000h, 000h
L4917c:
    db 0c7h, 045h, 0fch, 000h, 000h, 000h, 000h
    db 08bh, 045h, 0fch
    db 089h, 0ech
    db 05dh
    db 05fh
    db 05eh
    db 05ah
    db 059h
    db 05bh
    db 0c3h
Player_ShutDownVideo_ endp
    db 090h
Player_InitMovie_ proc near
    db 056h
    db 057h
    db 055h
    db 089h, 0e5h
    db 081h, 0ech, 014h, 000h, 000h, 000h
    db 089h, 045h, 0ech
    db 089h, 055h, 0f0h
    db 089h, 05dh, 0f4h
    db 089h, 04dh, 0f8h
    db 08bh, 045h, 010h
    push eax
    mov ecx, dword ptr [ebp-08h]
    mov ebx, dword ptr [ebp-0ch]
    mov edx, dword ptr [ebp-010h]
    mov eax, dword ptr [ebp-014h]
    call Func4f620_
    test eax, eax
    je short L491cc
    mov dword ptr [ebp-04h], 03fah
    jmp near ptr L4925a
L491cc:
    mov eax, dword ptr [ebp-014h]
    mov eax, dword ptr [eax]
    mov dword ptr [eax+0e0h], 00h
    mov eax, dword ptr [ebp-014h]
    mov eax, dword ptr [eax]
    mov dword ptr [eax+0138h], 00h
    mov eax, dword ptr [ebp-014h]
    mov eax, dword ptr [eax]
    mov dword ptr [eax+0e4h], 00h
    mov eax, dword ptr [ebp-014h]
    mov eax, dword ptr [eax]
    mov dword ptr [eax+0e8h], 00h
    mov eax, dword ptr [ebp-014h]
    mov eax, dword ptr [eax]
    mov dword ptr [eax+0ech], 00h
    mov eax, dword ptr [ebp-014h]
    mov eax, dword ptr [eax]
    mov dword ptr [eax+0f0h], 00h
    mov eax, dword ptr [ebp-014h]
    mov eax, dword ptr [eax]
    mov dword ptr [eax+0f4h], 00h
    mov eax, dword ptr [ebp-014h]
    mov eax, dword ptr [eax]
    mov dword ptr [eax+0164h], 00h
    mov eax, dword ptr [ebp-014h]
    mov eax, dword ptr [eax]
    mov dword ptr [eax+0134h], 01h
    mov dword ptr [ebp-04h], 00h
L4925a:
    mov eax, dword ptr [ebp-04h]
    db 089h, 0ech
    pop ebp
    pop edi
    pop esi
    ret 04h
Player_InitMovie_ endp
    db 08dh, 040h, 000h
Player_ShutDownMovie_ proc near
    push ebx
    push ecx
    push edx
    push esi
    push edi
    push ebp
    db 089h, 0e5h
    db 081h, 0ech, 008h, 000h, 000h, 000h
    db 089h, 045h, 0f8h
    db 08bh, 045h, 0f8h
    db 0e8h, 09bh, 065h, 000h, 000h
    db 0c7h, 045h, 0fch, 000h, 000h, 000h, 000h
    db 08bh, 045h, 0fch
    db 089h, 0ech
    db 05dh
    db 05fh
    db 05eh
    db 05ah
    db 059h
    db 05bh
    db 0c3h
Player_ShutDownMovie_ endp
Player_InitPlaybackSystem_ proc near
    db 053h
    db 051h
    db 056h
    db 057h
    db 055h
    db 089h, 0e5h
    db 081h, 0ech, 00ch, 000h, 000h, 000h
    db 089h, 045h, 0f4h
    db 089h, 055h, 0f8h
    db 08bh, 045h, 0f4h
    db 0a3h
    dd offset B12ff64
    db 08bh, 045h, 0f8h
    mov dword ptr [B12ff68], eax
    mov ebx, offset B12ff6c
    db 0bah
    dd offset Func492e0_
    db 0b8h, 0c8h, 000h, 000h, 000h
    db 0e8h, 0b7h, 018h, 000h, 000h
    db 0c7h, 045h, 0fch, 000h, 000h, 000h, 000h
    db 08bh, 045h, 0fch
    db 089h, 0ech
    db 05dh
    db 05fh
    db 05eh
    db 059h
    db 05bh
    db 0c3h
Player_InitPlaybackSystem_ endp
    db 08dh, 040h, 000h
Func492e0_ proc near
    db 053h
    db 051h
    db 052h
    db 056h
    db 057h
    db 055h
    db 089h, 0e5h
    db 081h, 0ech, 000h, 000h, 000h, 000h
    mov eax, dword ptr [Dc66cc]
    db 0ffh, 005h
    dd offset Dc66cc
    db 05dh
    db 05fh
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
Func492e0_ endp
Player_InitSound_ proc near
    push esi
    push edi
    push ebp
    db 089h, 0e5h
    db 081h, 0ech, 038h, 000h, 000h, 000h
    db 089h, 045h, 0d4h
    db 089h, 055h, 0d8h
    db 089h, 05dh, 0dch
    db 089h, 04dh, 0e0h
    db 08bh, 045h, 014h
    db 050h
    db 08bh, 045h, 010h
    db 050h
    db 08bh, 045h, 0e0h
    db 050h
    db 08bh, 04dh, 0dch
    db 08bh, 05dh, 0d8h
    db 08bh, 055h, 0d4h
    mov eax, offset Func495c4_
    db 0e8h, 01ah, 061h, 000h, 000h
    db 089h, 045h, 0e4h
    db 083h, 07dh, 0e4h, 000h
    db 074h, 00bh
    db 08bh, 045h, 0e4h
    db 089h, 045h, 0fch
    db 0e9h, 01ch, 002h, 000h, 000h
L4934a:
    db 0bah, 03ch, 000h, 000h, 000h
    db 0b8h, 001h, 000h, 000h, 000h
    db 0e8h, 0d1h, 060h, 000h, 000h
    db 08bh, 055h, 0d4h
    db 08bh, 012h
    db 089h, 042h, 004h
    db 08bh, 042h, 004h
    db 085h, 0c0h
    db 075h, 016h
    db 08bh, 045h, 0d4h
    db 08bh, 000h
    db 0e8h, 032h, 003h, 000h, 000h
    db 0c7h, 045h, 0fch, 0f7h, 003h, 000h, 000h
    db 0e9h, 0e8h, 001h, 000h, 000h
L4937e:
    db 0bah, 00ch, 000h, 000h, 000h
    db 0b8h, 001h, 000h, 000h, 000h
    db 0e8h, 09dh, 060h, 000h, 000h
    db 08bh, 055h, 0d4h
    db 08bh, 012h
    db 08bh, 052h, 004h
    db 089h, 042h, 038h
    db 08bh, 042h, 038h
    db 085h, 0c0h
    db 075h, 016h
    db 08bh, 045h, 0d4h
    db 08bh, 000h
    db 0e8h, 0fbh, 002h, 000h, 000h
    db 0c7h, 045h, 0fch, 0f7h, 003h, 000h, 000h
    jmp near ptr L49566
L493b5:
    mov edx, dword ptr [ebp-028h]
    mov eax, 01h
    call calloc_
    mov edx, dword ptr [ebp-02ch]
    mov edx, dword ptr [edx]
    mov edx, dword ptr [edx]
    mov dword ptr [edx+04ch], eax
    mov eax, dword ptr [edx+04ch]
    test eax, eax
    jne short L493e9
    mov eax, dword ptr [ebp-02ch]
    mov eax, dword ptr [eax]
    db 0e8h, 0c7h, 002h, 000h, 000h
    mov dword ptr [ebp-04h], 022h
    jmp near ptr L49566
L493e9:
    mov edx, dword ptr [ebp-028h]
    mov eax, 01h
    call calloc_
    mov edx, dword ptr [ebp-02ch]
    mov edx, dword ptr [edx]
    mov edx, dword ptr [edx]
    mov dword ptr [edx+050h], eax
    mov eax, dword ptr [edx+050h]
    test eax, eax
    jne short L4941d
    mov eax, dword ptr [ebp-02ch]
    mov eax, dword ptr [eax]
    db 0e8h, 093h, 002h, 000h, 000h
    mov dword ptr [ebp-04h], 022h
    jmp near ptr L49566
L4941d:
    mov eax, dword ptr [ebp-02ch]
    mov eax, dword ptr [eax]
    mov eax, dword ptr [eax+04h]
    mov dword ptr [eax+0ch], 00h
    mov dword ptr [ebp-018h], 043480000h
    mov eax, dword ptr [ebp-02ch]
    mov eax, dword ptr [eax]
    mov eax, dword ptr [eax]
    fild dword ptr [eax+014h]
    fstp dword ptr [ebp-014h]
    fild dword ptr [ebp+018h]
    fstp dword ptr [ebp-010h]
    mov eax, dword ptr [ebp+01ch]
    mov dword ptr [ebp-034h], eax
    mov dword ptr [ebp-030h], 00h
    fild qword ptr [ebp-034h]
    fmul dword ptr [Dc1064]
    fstp dword ptr [ebp-0ch]
    fld dword ptr [ebp-010h]
    fmul dword ptr [ebp-0ch]
    fdivr dword ptr [ebp-014h]
    fmul dword ptr [ebp-018h]
    fmul dword ptr [Dc1068]
    mov eax, dword ptr [ebp-02ch]
    mov eax, dword ptr [eax]
    mov eax, dword ptr [eax+04h]
    fstp dword ptr [eax+030h]
    mov eax, dword ptr [ebp-02ch]
    mov eax, dword ptr [eax]
    mov eax, dword ptr [eax+04h]
    mov dword ptr [eax+010h], 01h
    mov eax, 0f0h
    call _nmalloc_
    mov dword ptr [ebp-08h], eax
    cmp dword ptr [ebp-08h], 00h
    jne short L494aa
    mov dword ptr [ebp-04h], 03f0h
    jmp near ptr L49566
L494aa:
    mov eax, dword ptr [ebp-02ch]
    mov eax, dword ptr [eax]
    mov edx, dword ptr [eax+04h]
    mov edx, dword ptr [edx+038h]
    mov eax, dword ptr [ebp-08h]
    mov dword ptr [edx], eax
    mov ebx, 0f0h
    db 031h, 0d2h
    mov eax, dword ptr [ebp-08h]
    call memset_
    mov eax, dword ptr [ebp+01ch]
    mov edx, dword ptr [ebp-08h]
    mov dword ptr [edx+038h], eax
    mov eax, dword ptr [ebp+014h]
    mov edx, dword ptr [ebp-08h]
    mov dword ptr [edx+03ch], eax
    cmp dword ptr [ebp+01ch], 08h
    jne short L494ea
    mov dword ptr [ebp-038h], 08000h
    jmp short L494f1
L494ea:
    mov dword ptr [ebp-038h], 00h
L494f1:
    mov eax, dword ptr [ebp-038h]
    mov edx, dword ptr [ebp-08h]
    mov dword ptr [edx+040h], eax
    mov eax, dword ptr [ebp+018h]
    mov edx, dword ptr [ebp-08h]
    mov dword ptr [edx+034h], eax
    mov eax, dword ptr [ebp-08h]
    mov dword ptr [eax+044h], 08000h
    mov eax, dword ptr [ebp-08h]
    mov dword ptr [eax+02ch], 07fff7fffh
    mov eax, dword ptr [ebp-08h]
    mov dword ptr [eax+05ch], offset Func495f8_
    mov eax, dword ptr [ebp-02ch]
    mov eax, dword ptr [eax]
    mov edx, dword ptr [eax]
    mov edx, dword ptr [edx+04ch]
    mov eax, dword ptr [ebp-08h]
    mov dword ptr [eax+0a8h], edx
    mov eax, dword ptr [ebp-02ch]
    mov eax, dword ptr [eax]
    mov edx, dword ptr [eax]
    mov edx, dword ptr [edx+050h]
    mov eax, dword ptr [ebp-08h]
    mov dword ptr [eax+0ach], edx
    mov eax, dword ptr [ebp-02ch]
    mov eax, dword ptr [eax]
    mov edx, dword ptr [eax]
    mov edx, dword ptr [edx+04ch]
    mov eax, dword ptr [ebp-08h]
    mov dword ptr [eax], edx
    mov eax, dword ptr [ebp-028h]
    mov edx, dword ptr [ebp-08h]
    mov dword ptr [edx+0ch], eax
    mov dword ptr [ebp-04h], 00h
L49566:
    mov eax, dword ptr [ebp-04h]
    db 089h, 0ech
    pop ebp
    pop edi
    pop esi
    ret 010h
Player_InitSound_ endp
    db 08dh, 040h, 000h
Player_StartSound_ proc near
    push ebx
    push ecx
    push edx
    push esi
    push edi
    push ebp
    db 089h, 0e5h
    db 081h, 0ech, 008h, 000h, 000h, 000h
    db 089h, 045h, 0f8h
    db 08bh, 045h, 0f8h
    db 08bh, 040h, 004h
    db 08bh, 050h, 038h
    mov edx, dword ptr [edx]
    mov eax, dword ptr [B12ff64]
    db 0e8h, 01ch, 051h, 000h, 000h
    db 08bh, 055h, 0f8h
    db 08bh, 052h, 004h
    db 08bh, 052h, 038h
    db 089h, 042h, 008h
    db 08bh, 045h, 0f8h
    mov dword ptr [B12ff60], eax
    db 0c7h, 045h, 0fch, 000h, 000h, 000h, 000h
    db 08bh, 045h, 0fch
    db 089h, 0ech
    db 05dh
    db 05fh
    db 05eh
    db 05ah
    db 059h
    db 05bh
    db 0c3h
Player_StartSound_ endp
    db 08dh, 040h, 000h
Func495c4_ proc near
    db 053h
    db 051h
    db 052h
    db 056h
    db 057h
    db 055h
    db 089h, 0e5h
    db 081h, 0ech, 004h, 000h, 000h, 000h
    db 089h, 045h, 0fch
    db 08bh, 045h, 0fch
    db 08bh, 010h
    db 08bh, 045h, 0fch
    db 08bh, 000h
    db 08bh, 052h, 03ch
    db 089h, 050h, 018h
    db 08bh, 045h, 0fch
    db 08bh, 040h, 004h
    db 0ffh, 040h, 00ch
    db 089h, 0ech
    db 05dh
    db 05fh
    db 05eh
    db 05ah
    db 059h
    pop ebx
    ret
Func495c4_ endp
    db 090h
Func495f8_ proc near
    push ebx
    push esi
    push edi
    push ebp
    db 089h, 0e5h
    db 081h, 0ech, 008h, 000h, 000h, 000h
    db 08bh, 045h, 014h
    db 08bh, 080h, 0ach, 000h, 000h, 000h
    db 089h, 045h, 0fch
    db 08bh, 045h, 014h
    db 08bh, 090h, 0a8h, 000h, 000h, 000h
    db 08bh, 045h, 014h
    db 089h, 090h, 0ach, 000h, 000h, 000h
    db 08bh, 045h, 0fch
    db 08bh, 055h, 014h
    db 089h, 082h, 0a8h, 000h, 000h, 000h
    db 08bh, 045h, 0fch
    db 08bh, 055h, 014h
    mov dword ptr [edx], eax
    mov eax, dword ptr [B12ff60]
    db 08bh, 010h
    db 08bh, 052h, 014h
    db 08bh, 045h, 014h
    db 089h, 050h, 00ch
    mov eax, dword ptr [B12ff60]
    db 08bh, 000h
    db 083h, 078h, 018h, 000h
    db 075h, 009h
    db 0c7h, 045h, 0f8h, 001h, 000h, 000h, 000h
    db 0ebh, 007h
L4965c:
    db 0c7h, 045h, 0f8h, 000h, 000h, 000h, 000h
L49663:
    db 08bh, 055h, 0f8h
    mov eax, dword ptr [B12ff60]
    db 0e8h, 0d8h, 05eh, 000h, 000h
    db 089h, 0ech
    db 05dh
    db 05fh
    db 05eh
    db 05bh
    db 0c3h
Func495f8_ endp
    db 090h
Player_ShutDownPlaybackSystem_ proc near
    db 053h
    db 051h
    db 052h
    db 056h
    db 057h
    db 055h
    db 089h, 0e5h
    db 081h, 0ech, 004h, 000h, 000h, 000h
    mov eax, dword ptr [B12ff6c]
    db 0e8h, 048h, 018h, 000h, 000h
    db 0c7h, 045h, 0fch, 000h, 000h, 000h, 000h
    db 08bh, 045h, 0fch
    db 089h, 0ech
    db 05dh
    db 05fh
    db 05eh
    db 05ah
    db 059h
    db 05bh
    ret
Player_ShutDownPlaybackSystem_ endp
    db 090h
Player_ShutDownSound_ proc near
    push ebx
    push ecx
    push edx
    push esi
    push edi
    push ebp
    db 089h, 0e5h
    db 081h, 0ech, 004h, 000h, 000h, 000h
    db 089h, 045h, 0fch
    db 083h, 07dh, 0fch, 000h
    db 00fh, 084h, 084h, 000h, 000h, 000h
    db 08bh, 045h, 0fch
    db 083h, 078h, 004h, 000h
    db 074h, 043h
    db 08bh, 045h, 0fch
    db 08bh, 040h, 004h
    db 083h, 078h, 038h, 000h
    db 074h, 02ch
    db 08bh, 045h, 0fch
    db 08bh, 040h, 004h
    db 08bh, 040h, 038h
    db 083h, 038h, 000h
    db 074h, 010h
    db 08bh, 045h, 0fch
    db 08bh, 040h, 004h
    db 08bh, 040h, 038h
    mov eax, dword ptr [eax]
    db 0e8h, 010h, 008h, 000h, 000h
L496f2:
    db 08bh, 045h, 0fch
    db 08bh, 040h, 004h
    db 08bh, 040h, 038h
    db 0e8h, 002h, 008h, 000h, 000h
L49700:
    db 08bh, 045h, 0fch
    db 08bh, 040h, 004h
    db 0e8h, 0f7h, 007h, 000h, 000h
L4970b:
    db 08bh, 045h, 0fch
    db 08bh, 000h
    db 083h, 078h, 04ch, 000h
    db 074h, 00dh
    db 08bh, 045h, 0fch
    db 08bh, 000h
    db 08bh, 040h, 04ch
    db 0e8h, 0dfh, 007h, 000h, 000h
L49723:
    db 08bh, 045h, 0fch
    db 08bh, 000h
    db 083h, 078h, 050h, 000h
    db 074h, 00dh
    db 08bh, 045h, 0fch
    db 08bh, 000h
    db 08bh, 040h, 050h
    db 0e8h, 0c7h, 007h, 000h, 000h
L4973b:
    db 08bh, 045h, 0fch
    db 0e8h, 06dh, 05eh, 000h, 000h
L49743:
    db 089h, 0ech
    db 05dh
    db 05fh
    db 05eh
    db 05ah
    pop ecx
    pop ebx
    ret
Player_ShutDownSound_ endp
Player_StartTimer_ proc near
    push ebx
    push ecx
    push edx
    push esi
    push edi
    push ebp
    db 089h, 0e5h
    db 081h, 0ech, 008h, 000h, 000h, 000h
    db 089h, 045h, 0f8h
    db 08bh, 045h, 0f8h
    db 083h, 0b8h, 034h, 001h, 000h, 000h, 000h
    db 00fh, 084h, 085h, 000h, 000h, 000h
    db 08bh, 045h, 0f8h
    db 083h, 0b8h, 064h, 001h, 000h, 000h, 000h
    db 075h, 040h
    mov edx, dword ptr [Dc66cc]
    db 08bh, 045h, 0f8h
    db 089h, 090h, 0e0h, 000h, 000h, 000h
    db 08bh, 045h, 0f8h
    db 08bh, 090h, 0e0h, 000h, 000h, 000h
    db 08bh, 045h, 0f8h
    db 089h, 090h, 0ech, 000h, 000h, 000h
    db 08bh, 045h, 0f8h
    db 08bh, 090h, 0ech, 000h, 000h, 000h
    db 08bh, 045h, 0f8h
    db 089h, 090h, 0f0h, 000h, 000h, 000h
    db 08bh, 045h, 0f8h
    db 0c7h, 080h, 064h, 001h, 000h, 000h, 001h, 000h, 000h, 000h
L497b9:
    db 08bh, 045h, 0f8h
    db 08bh, 080h, 0f0h, 000h, 000h, 000h
    db 08bh, 055h, 0f8h
    db 02bh, 082h, 0ech, 000h, 000h, 000h
    db 089h, 0c2h
    db 08bh, 045h, 0f8h
    db 001h, 090h, 0e8h, 000h, 000h, 000h
    mov edx, dword ptr [Dc66cc]
    db 08bh, 045h, 0f8h
    db 089h, 090h, 0ech, 000h, 000h, 000h
    db 08bh, 045h, 0f8h
    db 0c7h, 080h, 034h, 001h, 000h, 000h, 000h, 000h, 000h, 000h
L497f2:
    db 0c7h, 045h, 0fch, 000h, 000h, 000h, 000h
    db 08bh, 045h, 0fch
    db 089h, 0ech
    db 05dh
    db 05fh
    db 05eh
    db 05ah
    db 059h
    db 05bh
    db 0c3h
Player_StartTimer_ endp
    db 08dh, 040h, 000h
Func49808_ proc near
    db 053h
    db 051h
    db 052h
    db 056h
    db 057h
    db 055h
    db 089h, 0e5h
    db 081h, 0ech, 008h, 000h, 000h, 000h
    mov dword ptr [ebp-08h], eax
    mov eax, dword ptr [ebp-08h]
    cmp dword ptr [eax+0134h], 00h
    jne short L49841
    mov eax, dword ptr [ebp-08h]
    mov dword ptr [eax+0134h], 01h
    mov edx, dword ptr [Dc66cc]
    mov eax, dword ptr [ebp-08h]
    mov dword ptr [eax+0f0h], edx
L49841:
    mov dword ptr [ebp-04h], 00h
    mov eax, dword ptr [ebp-04h]
    db 089h, 0ech
    pop ebp
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
Func49808_ endp
Func49854_ proc near
    push ebx
    push ecx
    push esi
    push edi
    push ebp
    db 089h, 0e5h
    db 081h, 0ech, 00ch, 000h, 000h, 000h
    db 089h, 045h, 0f4h
    db 089h, 055h, 0f8h
    db 08bh, 045h, 0f8h
    db 08bh, 055h, 0f4h
    db 001h, 082h, 0e8h, 000h, 000h, 000h
    db 0c7h, 045h, 0fch, 000h, 000h, 000h, 000h
    db 08bh, 045h, 0fch
    db 089h, 0ech
    db 05dh
    db 05fh
    db 05eh
    db 059h
    db 05bh
    db 0c3h
Func49854_ endp
    db 08dh, 040h, 000h
Player_InitMoviePlayback_ proc near
    db 051h
    db 056h
    db 057h
    db 055h
    db 089h, 0e5h
    db 081h, 0ech, 010h, 000h, 000h, 000h
    db 089h, 045h, 0f0h
    db 089h, 055h, 0f4h
    db 089h, 05dh, 0f8h
    db 08bh, 05dh, 0f8h
    db 08bh, 055h, 0f4h
    db 08bh, 045h, 0f0h
    db 0e8h, 049h, 061h, 000h, 000h
    db 0c7h, 045h, 0fch, 000h, 000h, 000h, 000h
    db 08bh, 045h, 0fch
    db 089h, 0ech
    db 05dh
    db 05fh
    db 05eh
    db 059h
    db 0c3h
Player_InitMoviePlayback_ endp
Func498bc_ proc near
    db 053h
    db 051h
    db 052h
    db 056h
    db 057h
    db 055h
    db 089h, 0e5h
    db 081h, 0ech, 00ch, 000h, 000h, 000h
    db 089h, 045h, 0f4h
    db 0a1h
    dd offset B12ff68
    db 069h, 055h, 0f4h, 0f0h, 000h, 000h, 000h
    db 08bh, 040h, 058h
    db 001h, 0d0h
    mov dword ptr [ebp-08h], eax
    mov eax, dword ptr [ebp-08h]
    mov eax, dword ptr [eax+04h]
    mov edx, dword ptr [ebp-08h]
    sub eax, dword ptr [edx]
    mov dword ptr [ebp-04h], eax
    mov eax, dword ptr [ebp-04h]
    db 089h, 0ech
    pop ebp
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
Func498bc_ endp
    db 090h
Player_Playframe_ proc near
    push esi
    push edi
    push ebp
    db 089h, 0e5h
    db 081h, 0ech, 048h, 000h, 000h, 000h
    db 089h, 045h, 0dch
    db 089h, 055h, 0e0h
    db 089h, 05dh, 0e4h
    db 089h, 04dh, 0e8h
    db 0c7h, 045h, 0f4h, 000h, 000h, 000h, 000h
    db 083h, 07dh, 0e0h, 000h
    db 00fh, 084h, 09dh, 001h, 000h, 000h
    db 08bh, 045h, 0dch
    db 089h, 045h, 0d0h
    db 08bh, 045h, 0d0h
    db 089h, 045h, 0d4h
    db 08bh, 045h, 0d4h
    db 083h, 0b8h, 034h, 001h, 000h, 000h, 000h
    db 074h, 024h
    db 08bh, 045h, 0d4h
    db 08bh, 080h, 0f0h, 000h, 000h, 000h
    db 08bh, 055h, 0d4h
    db 02bh, 082h, 0ech, 000h, 000h, 000h
    db 089h, 0c2h
    db 08bh, 045h, 0d4h
    db 08bh, 080h, 0e8h, 000h, 000h, 000h
    db 001h, 0d0h
    db 089h, 045h, 0d8h
    jmp short L4997e
L49960:
    mov eax, dword ptr [Dc66cc]
    db 08bh, 055h, 0d4h
    db 02bh, 082h, 0ech, 000h, 000h, 000h
    db 089h, 0c2h
    db 08bh, 045h, 0d4h
    db 08bh, 080h, 0e8h, 000h, 000h, 000h
    db 001h, 0d0h
    db 089h, 045h, 0d8h
L4997e:
    db 0dbh, 045h, 0d8h
    db 08bh, 045h, 0dch
    db 0d8h, 048h, 05ch
    fmul dword ptr [Dc106c]
    db 08bh, 045h, 0dch
    db 0dbh, 080h, 004h, 001h, 000h, 000h
    db 0deh, 0d9h
    db 0dfh, 0e0h
    db 09eh
    db 00fh, 083h, 0feh, 000h, 000h, 000h
    db 08bh, 045h, 0e0h
    db 08bh, 040h, 004h
    db 083h, 038h, 000h
    db 00fh, 084h, 0c9h, 000h, 000h, 000h
    db 08bh, 045h, 01ch
    db 050h
    db 08bh, 045h, 018h
    db 050h
    mov eax, dword ptr [ebp-020h]
    mov eax, dword ptr [eax+04h]
    mov eax, dword ptr [eax+04h]
    push dword ptr [eax]
    push 01h
    mov ecx, dword ptr [ebp-018h]
    mov ebx, dword ptr [ebp-01ch]
    mov edx, dword ptr [ebp-020h]
    mov eax, dword ptr [ebp-024h]
    call Func4fbf4_
    mov dword ptr [ebp-0ch], eax
    mov eax, dword ptr [ebp-020h]
    mov eax, dword ptr [eax]
    test byte ptr [eax+03ah], 08h
    je short L49a12
    push 02h
    mov eax, dword ptr [ebp+014h]
    push eax
    mov eax, dword ptr [ebp+010h]
    push eax
    mov eax, dword ptr [ebp-020h]
    mov ecx, dword ptr [eax]
    mov ecx, dword ptr [ecx+032h]
    mov eax, dword ptr [ebp-020h]
    mov ebx, dword ptr [eax]
    mov ebx, dword ptr [ebx+02eh]
    mov eax, dword ptr [ebp-020h]
    mov eax, dword ptr [eax+04h]
    mov edx, dword ptr [eax+04h]
    mov edx, dword ptr [edx]
    db 031h, 0c0h
    call Func50d04_
    jmp short L49a77
L49a12:
    mov eax, dword ptr [ebp-020h]
    mov eax, dword ptr [eax]
    test byte ptr [eax+03ah], 040h
    je short L49a4b
    push 01h
    mov eax, dword ptr [ebp+014h]
    push eax
    mov eax, dword ptr [ebp+010h]
    push eax
    mov eax, dword ptr [ebp-020h]
    mov ecx, dword ptr [eax]
    mov ecx, dword ptr [ecx+032h]
    mov eax, dword ptr [ebp-020h]
    mov ebx, dword ptr [eax]
    mov ebx, dword ptr [ebx+02eh]
    mov eax, dword ptr [ebp-020h]
    mov eax, dword ptr [eax+04h]
    mov edx, dword ptr [eax+04h]
    mov edx, dword ptr [edx]
    db 031h, 0c0h
    call Func50d04_
    jmp short L49a77
L49a4b:
    push 00h
    mov eax, dword ptr [ebp+014h]
    push eax
    mov eax, dword ptr [ebp+010h]
    push eax
    mov eax, dword ptr [ebp-020h]
    mov ecx, dword ptr [eax]
    mov ecx, dword ptr [ecx+032h]
    mov eax, dword ptr [ebp-020h]
    mov ebx, dword ptr [eax]
    mov ebx, dword ptr [ebx+02eh]
    mov eax, dword ptr [ebp-020h]
    mov eax, dword ptr [eax+04h]
    mov edx, dword ptr [eax+04h]
    mov edx, dword ptr [edx]
    db 031h, 0c0h
    call Func50d04_
L49a77:
    jmp short L49a9d
L49a79:
    mov eax, dword ptr [ebp+01ch]
    push eax
    mov eax, dword ptr [ebp+018h]
    push eax
    push dword ptr [_Data1300e8]
    push 01h
    mov ecx, dword ptr [ebp-018h]
    mov ebx, dword ptr [ebp-01ch]
    mov edx, dword ptr [ebp-020h]
    mov eax, dword ptr [ebp-024h]
    call Func4fbf4_
    mov dword ptr [ebp-0ch], eax
L49a9d:
    jmp short L49abf
L49a9f:
    mov eax, dword ptr [ebp+01ch]
    push eax
    mov eax, dword ptr [ebp+018h]
    push eax
    push 00h
    push 00h
    mov ecx, dword ptr [ebp-018h]
    mov ebx, dword ptr [ebp-01ch]
    mov edx, dword ptr [ebp-020h]
    mov eax, dword ptr [ebp-024h]
    call Func4fbf4_
    mov dword ptr [ebp-0ch], eax
L49abf:
    jmp short L49ae1
L49ac1:
    mov eax, dword ptr [ebp+01ch]
    push eax
    mov eax, dword ptr [ebp+018h]
    push eax
    push 00h
    push 00h
    mov ecx, dword ptr [ebp-018h]
    mov ebx, dword ptr [ebp-01ch]
    mov edx, dword ptr [ebp-020h]
    mov eax, dword ptr [ebp-024h]
    call Func4fbf4_
    mov dword ptr [ebp-0ch], eax
L49ae1:
    cmp dword ptr [ebp-01ch], 00h
    je near ptr L49c00
    mov eax, dword ptr [ebp-01ch]
    mov eax, dword ptr [eax]
    cmp dword ptr [eax+03ch], 0ffffffffh
    jne near ptr L49c00
    mov eax, dword ptr [ebp-01ch]
    mov eax, dword ptr [eax+04h]
    mov eax, dword ptr [eax+038h]
    mov eax, dword ptr [eax+08h]
    mov dword ptr [ebp-040h], eax
    mov eax, dword ptr [ebp-040h]
    mov dword ptr [ebp-03ch], eax
    mov eax, dword ptr [B12ff68]
    imul edx, dword ptr [ebp-03ch], 0f0h
    mov eax, dword ptr [eax+058h]
    db 001h, 0d0h
    mov dword ptr [ebp-038h], eax
    mov eax, dword ptr [ebp-038h]
    mov eax, dword ptr [eax+04h]
    mov edx, dword ptr [ebp-038h]
    sub eax, dword ptr [edx]
    mov dword ptr [ebp-034h], eax
    mov eax, dword ptr [ebp-034h]
    mov dword ptr [ebp-08h], eax
    mov eax, dword ptr [ebp-01ch]
    mov ebx, dword ptr [eax]
    mov eax, dword ptr [ebp-08h]
    mov edx, dword ptr [ebp-08h]
    sar edx, 01fh
    idiv dword ptr [ebx+014h]
    mov dword ptr [ebp-044h], edx
    fild dword ptr [ebp-044h]
    mov eax, dword ptr [ebp-01ch]
    mov eax, dword ptr [eax]
    fild dword ptr [eax+014h]
    fdivp st(1), st
    mov eax, dword ptr [ebp-01ch]
    mov eax, dword ptr [eax+04h]
    fild dword ptr [eax+0ch]
    faddp st(1), st
    mov eax, dword ptr [ebp-01ch]
    mov eax, dword ptr [eax+04h]
    fmul dword ptr [eax+030h]
    fstp dword ptr [ebp-014h]
    mov eax, dword ptr [ebp-024h]
    mov eax, dword ptr [eax+034h]
    mov edx, dword ptr [ebp-024h]
    imul eax, dword ptr [edx+038h]
    mov dword ptr [ebp-044h], eax
    fild dword ptr [ebp-044h]
    mov eax, dword ptr [ebp-024h]
    fdiv dword ptr [eax+05ch]
    fstp dword ptr [ebp-010h]
    fld dword ptr [ebp-014h]
    fmul qword ptr [Dc1070]
    fld dword ptr [ebp-010h]
    fcompp
    fnstsw ax
    sahf
    ja short L49baa
    mov dword ptr [ebp-04h], 03fch
    jmp near ptr L49c1b
L49baa:
    mov eax, dword ptr [ebp-024h]
    db 0e8h, 0feh, 001h, 000h, 000h
    fld dword ptr [ebp-014h]
    call __CHP
    fistp dword ptr [ebp-044h]
    cmp eax, dword ptr [ebp-044h]
    jge short L49bd6
    mov eax, dword ptr [ebp-01ch]
    mov edx, dword ptr [eax+04h]
    mov edx, dword ptr [edx+010h]
    mov eax, dword ptr [ebp-024h]
    add dword ptr [eax+0e8h], edx
    jmp short L49c00
L49bd6:
    mov eax, dword ptr [ebp-024h]
    db 0e8h, 0d2h, 001h, 000h, 000h
    fld dword ptr [ebp-014h]
    call __CHP
    fistp dword ptr [ebp-044h]
    cmp eax, dword ptr [ebp-044h]
    jle short L49c00
    mov eax, dword ptr [ebp-01ch]
    mov edx, dword ptr [eax+04h]
    mov edx, dword ptr [edx+010h]
    mov eax, dword ptr [ebp-024h]
    sub dword ptr [eax+0e8h], edx
L49c00:
    cmp dword ptr [ebp-0ch], 00h
    jne short L49c0f
    mov dword ptr [ebp-048h], 00h
    jmp short L49c15
L49c0f:
    mov eax, dword ptr [ebp-0ch]
    mov dword ptr [ebp-048h], eax
L49c15:
    mov eax, dword ptr [ebp-048h]
    mov dword ptr [ebp-04h], eax
L49c1b:
    mov eax, dword ptr [ebp-04h]
    db 089h, 0ech
    pop ebp
    pop edi
    pop esi
    ret 010h
Player_Playframe_ endp
    db 08bh, 0c0h
Player_MapVideo_ proc near
    push ebx
    push ecx
    push esi
    push edi
    push ebp
    db 089h, 0e5h
    db 081h, 0ech, 00ch, 000h, 000h, 000h
    db 089h, 045h, 0f4h
    db 089h, 055h, 0f8h
    db 08bh, 045h, 0f4h
    db 08bh, 040h, 004h
    db 083h, 038h, 000h
    db 074h, 01bh
    db 08bh, 05dh, 0f8h
    db 08bh, 045h, 0f4h
    db 08bh, 040h, 004h
    db 08bh, 050h, 004h
    db 08bh, 012h
    db 08bh, 045h, 0f4h
    db 0e8h, 0e4h, 054h, 000h, 000h
    db 089h, 045h, 0fch
    db 0ebh, 014h
L49c61:
    db 08bh, 05dh, 0f8h
    mov edx, dword ptr [_Data1300e8]
    db 08bh, 045h, 0f4h
    db 0e8h, 0ceh, 054h, 000h, 000h
    db 089h, 045h, 0fch
L49c75:
    db 08bh, 045h, 0fch
    db 089h, 0ech
    db 05dh
    db 05fh
    db 05eh
    db 059h
    db 05bh
    db 0c3h
Player_MapVideo_ endp
Player_StopSound_ proc near
    db 053h
    db 051h
    db 052h
    db 056h
    db 057h
    db 055h
    db 089h, 0e5h
    db 081h, 0ech, 008h, 000h, 000h, 000h
    db 089h, 045h, 0f8h
    db 08bh, 045h, 0f8h
    db 08bh, 040h, 004h
    db 08bh, 050h, 038h
    db 08bh, 052h, 008h
    mov eax, dword ptr [B12ff64]
    db 0e8h, 08fh, 04bh, 000h, 000h
    db 0c7h, 045h, 0fch, 000h, 000h, 000h, 000h
    mov eax, dword ptr [ebp-04h]
    db 089h, 0ech
    pop ebp
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
Player_StopSound_ endp
    db 08bh, 0c0h
Func49cbc_ proc near
    push ebx
    push ecx
    push edx
    push esi
    push edi
    push ebp
    db 089h, 0e5h
    db 081h, 0ech, 008h, 000h, 000h, 000h
    db 089h, 045h, 0f8h
    db 08bh, 045h, 0f8h
    mov dword ptr [B12ff60], eax
    db 0c7h, 045h, 0fch, 000h, 000h, 000h, 000h
    db 08bh, 045h, 0fch
    db 089h, 0ech
    db 05dh
    db 05fh
    db 05eh
    db 05ah
    db 059h
    db 05bh
    db 0c3h
Func49cbc_ endp
Func49ce8_ proc near
    db 053h
    db 051h
    db 056h
    db 057h
    db 055h
    db 089h, 0e5h
    db 081h, 0ech, 00ch, 000h, 000h, 000h
    db 089h, 045h, 0f4h
    db 089h, 055h, 0f8h
    db 0c7h, 045h, 0fch, 000h, 000h, 000h, 000h
    db 08bh, 045h, 0fch
    db 089h, 0ech
    db 05dh
    db 05fh
    db 05eh
    db 059h
    db 05bh
    db 0c3h
Func49ce8_ endp
    db 08dh, 040h, 000h
Func49d10_ proc near
    db 053h
    db 051h
    db 056h
    db 057h
    db 055h
    db 089h, 0e5h
    db 081h, 0ech, 00ch, 000h, 000h, 000h
    db 089h, 045h, 0f4h
    db 089h, 055h, 0f8h
    db 08bh, 045h, 0f4h
    db 08bh, 040h, 004h
    db 083h, 038h, 000h
    db 075h, 009h
    db 0c7h, 045h, 0fch, 0ebh, 003h, 000h, 000h
    db 0ebh, 01dh
L49d37:
    db 08bh, 045h, 0f4h
    db 08bh, 040h, 004h
    mov ebx, dword ptr [eax+04h]
    mov ebx, dword ptr [ebx]
    mov edx, dword ptr [ebp-08h]
    mov eax, dword ptr [ebp-0ch]
    call Func5056c_
    mov dword ptr [ebp-04h], 00h
L49d54:
    mov eax, dword ptr [ebp-04h]
    db 089h, 0ech
    pop ebp
    pop edi
    pop esi
    pop ecx
    pop ebx
    ret
Func49d10_ endp
    db 090h
Func49d60_ proc near
    push ebx
    push ecx
    push esi
    push edi
    push ebp
    db 089h, 0e5h
    db 081h, 0ech, 00ch, 000h, 000h, 000h
    db 089h, 045h, 0f4h
    db 089h, 055h, 0f8h
    db 08bh, 045h, 0f4h
    db 08bh, 040h, 004h
    db 083h, 038h, 000h
    db 075h, 009h
    db 0c7h, 045h, 0fch, 0ebh, 003h, 000h, 000h
    db 0ebh, 01dh
L49d87:
    db 08bh, 045h, 0f4h
    db 08bh, 040h, 004h
    db 08bh, 058h, 004h
    db 08bh, 01bh
    db 08bh, 055h, 0f8h
    db 08bh, 045h, 0f4h
    db 0e8h, 03bh, 068h, 000h, 000h
    db 0c7h, 045h, 0fch, 000h, 000h, 000h, 000h
L49da4:
    db 08bh, 045h, 0fch
    db 089h, 0ech
    db 05dh
    db 05fh
    db 05eh
    db 059h
    db 05bh
    db 0c3h
Func49d60_ endp
    db 090h
Func49db0_ proc near
    db 053h
    db 051h
    db 052h
    db 056h
    db 057h
    db 055h
    db 089h, 0e5h
    db 081h, 0ech, 008h, 000h, 000h, 000h
    db 089h, 045h, 0f8h
    db 08bh, 045h, 0f8h
    db 083h, 0b8h, 034h, 001h, 000h, 000h, 000h
    db 074h, 024h
    db 08bh, 045h, 0f8h
    db 08bh, 080h, 0f0h, 000h, 000h, 000h
    db 08bh, 055h, 0f8h
    db 02bh, 082h, 0ech, 000h, 000h, 000h
    db 089h, 0c2h
    db 08bh, 045h, 0f8h
    db 08bh, 080h, 0e8h, 000h, 000h, 000h
    db 001h, 0d0h
    mov dword ptr [ebp-04h], eax
    db 0ebh, 01eh
L49df1:
    db 0a1h
    dd offset Dc66cc
    db 08bh, 055h, 0f8h
    sub eax, dword ptr [edx+0ech]
    db 089h, 0c2h
    mov eax, dword ptr [ebp-08h]
    mov eax, dword ptr [eax+0e8h]
    db 001h, 0d0h
    mov dword ptr [ebp-04h], eax
L49e0f:
    mov eax, dword ptr [ebp-04h]
    db 089h, 0ech
    pop ebp
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
Func49db0_ endp
    db 090h
Func49e1c_ proc near
    push ebx
    push ecx
    push edx
    push esi
    push edi
    push ebp
    db 089h, 0e5h
    db 081h, 0ech, 018h, 000h, 000h, 000h
    db 089h, 045h, 0f8h
    db 08bh, 045h, 0f8h
    db 089h, 045h, 0ech
    db 08bh, 045h, 0ech
    db 089h, 045h, 0f0h
    db 08bh, 045h, 0f0h
    db 083h, 0b8h, 034h, 001h, 000h, 000h, 000h
    db 074h, 024h
    db 08bh, 045h, 0f0h
    db 08bh, 080h, 0f0h, 000h, 000h, 000h
    db 08bh, 055h, 0f0h
    db 02bh, 082h, 0ech, 000h, 000h, 000h
    db 089h, 0c2h
    db 08bh, 045h, 0f0h
    db 08bh, 080h, 0e8h, 000h, 000h, 000h
    db 001h, 0d0h
    db 089h, 045h, 0f4h
    jmp short L49e87
L49e69:
    mov eax, dword ptr [Dc66cc]
    db 08bh, 055h, 0f0h
    db 02bh, 082h, 0ech, 000h, 000h, 000h
    db 089h, 0c2h
    db 08bh, 045h, 0f0h
    db 08bh, 080h, 0e8h, 000h, 000h, 000h
    db 001h, 0d0h
    db 089h, 045h, 0f4h
L49e87:
    db 0dbh, 045h, 0f4h
    db 08bh, 045h, 0f8h
    db 0d8h, 048h, 05ch
    fmul dword ptr [Dc1078]
    db 0e8h, 0b3h, 0cfh, 0ffh, 0ffh
    db 0dbh, 05dh, 0e8h
    db 08bh, 045h, 0f8h
    db 08bh, 080h, 004h, 001h, 000h, 000h
    db 02bh, 045h, 0e8h
    db 089h, 045h, 0fch
    db 08bh, 045h, 0fch
    db 089h, 0ech
    db 05dh
    db 05fh
    db 05eh
    db 05ah
    db 059h
    db 05bh
    db 0c3h
Func49e1c_ endp
    db 08dh, 040h, 000h
Func49ebc_ proc near
    db 056h
    db 057h
    db 055h
    db 089h, 0e5h
    db 081h, 0ech, 014h, 000h, 000h, 000h
    db 089h, 045h, 0ech
    db 089h, 055h, 0f0h
    db 089h, 05dh, 0f4h
    db 089h, 04dh, 0f8h
    db 08bh, 045h, 01ch
    db 050h
    db 08bh, 045h, 018h
    db 050h
    db 08bh, 045h, 014h
    db 050h
    db 08bh, 045h, 010h
    db 050h
    db 08bh, 04dh, 0f8h
    db 08bh, 05dh, 0f4h
    db 08bh, 055h, 0f0h
    db 08bh, 045h, 0ech
    db 0e8h, 024h, 066h, 000h, 000h
    db 089h, 045h, 0fch
    db 08bh, 045h, 0fch
    db 089h, 0ech
    db 05dh
    db 05fh
    db 05eh
    db 0c2h, 010h, 000h
Func49ebc_ endp
_TEXT ends

_DATA segment
Dc66cc label byte
    db 000h, 000h, 000h, 000h
Dc66d0 label byte
    db 001h, 000h, 000h, 000h
_DATA ends

CONST segment
Dc1064 label byte
    db 000h, 000h, 000h, 03eh
Dc1068 label byte
    db 000h, 000h, 000h, 03fh
Dc106c label byte
    db 00ah, 0d7h, 0a3h, 03bh
Dc1070 label byte
    db 07bh, 014h, 0aeh, 047h, 0e1h, "zt?"
Dc1078 label byte
    db 00ah, 0d7h, 0a3h, 03bh
CONST ends

_BSS segment
B12ff60 label byte
    db 4 dup(?)
B12ff64 label byte
    db 4 dup(?)
B12ff68 label byte
    db 4 dup(?)
B12ff6c label byte
    db 4 dup(?)
_BSS ends

    end

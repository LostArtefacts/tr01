    .586p

_TEXT segment para public use32 'CODE'
_TEXT ends
_DATA segment dword public use32 'DATA'
_DATA ends
CONST segment dword public use32 'DATA'
CONST ends

    assume cs:FLAT, ds:FLAT, es:FLAT, ss:FLAT

    extrn FileLoad_:near
    extrn FileSave_:near
    extrn FileSize_:near
    extrn _itoa_:near
    extrn _nfree_:near
    extrn _nmalloc_:near
    extrn _stricmp_:near
    extrn atoi_:near
    extrn memmove_:near

    public Func4d170_
    public Func4d224_
    public Func4d258_
    public Func4d2e4_
    public Func4d3a0_
    public Func4d454_
    public Func4d4f0_
    public Func4d580_
    public Func4d6b0_
    public Func4d794_
    public Func4d7d8_
    public Func4d7f8_
    public Func4d820_
    public Func4d85c_
    public Func4d8bc_
    public Func4d930_
    public Func4d9e0_
    public Func4dae4_
    public Func4dc00_
    public Func4dc4c_

_TEXT segment
Func4d170_ proc near
    push ebx
    push ecx
    push esi
    push edi
    push ebp
    db 089h, 0c1h
    db 089h, 0d5h
    lea edi, [eax+04h]
    db 089h, 0d6h
    push edi
L4d17f:
    mov al, byte ptr [esi]
    mov byte ptr [edi], al
    cmp al, 00h
    je short L4d197
    mov al, byte ptr [esi+01h]
    add esi, 02h
    mov byte ptr [edi+01h], al
    add edi, 02h
    cmp al, 00h
    jne short L4d17f
L4d197:
    pop edi
    db 089h, 0d0h
    call FileSize_
    cmp eax, 0ffffffffh
    jne short L4d1a8
    db 031h, 0c0h
    jmp short L4d21b
L4d1a8:
    mov dword ptr [ecx+088h], eax
    add eax, 0400h
    db 031h, 0dbh
    mov dword ptr [ecx+08ch], eax
    call _nmalloc_
    db 089h, 0c2h
    mov dword ptr [ecx+084h], eax
    db 089h, 0e8h
    call FileLoad_
    mov dword ptr [ecx+094h], 00h
    mov dword ptr [ecx+0a0h], 00h
    mov dword ptr [ecx+0a4h], 00h
    mov eax, dword ptr [ecx+084h]
    mov dword ptr [ecx+09ch], 00h
    mov dword ptr [ecx+090h], eax
    mov ah, byte ptr [ecx+01h]
    mov dword ptr [ecx+0a8h], 00h
    and ah, 07fh
    mov byte ptr [ecx+01h], ah
    mov eax, 01h
L4d21b:
    pop ebp
    pop edi
    pop esi
    pop ecx
    pop ebx
    ret
Func4d170_ endp
    db 08dh, 040h, 000h
Func4d224_ proc near
    push ebx
    push ecx
    push edx
    db 089h, 0c1h
    test byte ptr [eax+01h], 080h
    je short L4d243
    lea eax, [ecx+04h]
    mov ebx, dword ptr [ecx+088h]
    mov edx, dword ptr [ecx+084h]
    call FileSave_
L4d243:
    mov eax, dword ptr [ecx+084h]
    call _nfree_
    mov eax, 01h
    pop edx
    pop ecx
    pop ebx
    ret
Func4d224_ endp
    db 090h
Func4d258_ proc near
    push ebx
    push ecx
    push esi
    push edi
    push ebp
    sub esp, 04h
    db 089h, 0c6h
    db 089h, 0d5h
    mov ch, 0ah
    mov eax, dword ptr [eax+084h]
    db 031h, 0ffh
    db 031h, 0d2h
L4d270:
    cmp byte ptr [eax], 05bh
    jne short L4d2cb
    mov dword ptr [esp], eax
    db 089h, 0ebh
    mov cl, byte ptr [eax+01h]
    inc eax
    cmp cl, byte ptr [ebp+00h]
    jne short L4d295
L4d283:
    cmp edx, dword ptr [esi+088h]
    jae short L4d295
    inc ebx
    mov cl, byte ptr [eax+01h]
    inc eax
    inc edx
    cmp cl, byte ptr [ebx]
    je short L4d283
L4d295:
    cmp byte ptr [eax], 05dh
    jne short L4d2cb
    cmp byte ptr [ebx], 00h
    jne short L4d2cb
    mov edi, 01h
L4d2a4:
    db 089h, 0c3h
    mov cl, byte ptr [ebx]
    inc eax
    cmp ch, cl
    je short L4d2b0
    inc eax
    jmp short L4d2a4
L4d2b0:
    mov dword ptr [esi+0a8h], eax
    mov dword ptr [esi+090h], eax
    mov ebx, dword ptr [esp]
    mov dword ptr [esi+094h], edx
    mov dword ptr [esi+098h], ebx
L4d2cb:
    inc eax
    inc edx
    test edi, edi
    jne short L4d2d9
    cmp edx, dword ptr [esi+088h]
    jb short L4d270
L4d2d9:
    db 089h, 0f8h
    add esp, 04h
    pop ebp
    pop edi
    pop esi
    pop ecx
    pop ebx
    ret
Func4d258_ endp
Func4d2e4_ proc near
    push ebx
    push ecx
    push esi
    push edi
    push ebp
    sub esp, 08h
    db 089h, 0c6h
    mov dword ptr [esp+04h], edx
    mov ebp, dword ptr [esp+04h]
    mov eax, dword ptr [eax+090h]
    mov edx, dword ptr [esi+094h]
    db 031h, 0ffh
    inc ebp
L4d305:
    mov ecx, dword ptr [esp+04h]
    mov bl, byte ptr [eax]
    cmp bl, byte ptr [ecx]
    jne near ptr L4d37e
    mov dword ptr [esp], eax
    db 089h, 0ebh
    mov cl, byte ptr [eax+01h]
    inc edx
    mov ch, byte ptr [ebp+00h]
    inc eax
    cmp cl, ch
    jne short L4d338
L4d324:
    cmp edx, dword ptr [esi+088h]
    jae short L4d338
    inc ebx
    mov cl, byte ptr [eax+01h]
    inc eax
    mov ch, byte ptr [ebx]
    inc edx
    cmp cl, ch
    je short L4d324
L4d338:
    cmp byte ptr [ebx], 00h
    jne short L4d37e
L4d33d:
    mov ch, byte ptr [eax]
    cmp ch, 03dh
    je short L4d34d
    cmp ch, 0dh
    je short L4d34d
    inc eax
    inc edx
    jmp short L4d33d
L4d34d:
    cmp byte ptr [eax], 03dh
    jne short L4d35c
    inc eax
    inc edx
    mov dword ptr [esi+0a0h], eax
    jmp short L4d366
L4d35c:
    mov dword ptr [esi+0a0h], 00h
L4d366:
    mov ebx, dword ptr [esp]
    mov dword ptr [esi+0a4h], 00h
    mov edi, 01h
    mov dword ptr [esi+09ch], ebx
L4d37e:
    inc eax
    inc edx
    test edi, edi
    jne short L4d395
    cmp edx, dword ptr [esi+088h]
    jae short L4d395
    cmp byte ptr [eax], 05bh
    jne near ptr L4d305
L4d395:
    db 089h, 0f8h
    add esp, 08h
    pop ebp
    pop edi
    pop esi
    pop ecx
    pop ebx
    ret
Func4d2e4_ endp
Func4d3a0_ proc near
    push ebx
    push ecx
    push esi
    sub esp, 020h
    db 089h, 0c1h
    db 089h, 0d6h
    mov edx, dword ptr [eax+0a4h]
    test edx, edx
    je short L4d3b8
    db 089h, 0d0h
    jmp short L4d3be
L4d3b8:
    mov eax, dword ptr [eax+0a0h]
L4d3be:
    test eax, eax
    je near ptr L4d44c
L4d3c6:
    mov dl, byte ptr [eax]
    cmp dl, 020h
    jne short L4d3d0
    inc eax
    jmp short L4d3c6
L4d3d0:
    cmp dl, 0dh
    jne short L4d3dc
    db 031h, 0c0h
    jmp near ptr L4d44c
L4d3dc:
    mov bl, byte ptr [eax]
    db 031h, 0d2h
    cmp bl, 0dh
    je short L4d3ff
L4d3e5:
    mov bl, byte ptr [eax]
    cmp bl, 02ch
    je short L4d3ff
    cmp bl, 020h
    je short L4d3ff
    mov bl, byte ptr [eax]
    inc eax
    mov byte ptr [esp+edx*1], bl
    mov bh, byte ptr [eax]
    inc edx
    cmp bh, 0dh
    jne short L4d3e5
L4d3ff:
    db 030h, 0dbh
    mov byte ptr [esp+edx*1], bl
    test edx, edx
    jne short L4d411
    db 031h, 0c0h
    add esp, 020h
    pop esi
    pop ecx
    pop ebx
    ret
L4d411:
    mov bh, byte ptr [eax]
    lea edx, [eax+01h]
    cmp bh, 020h
    jne short L4d41f
    db 089h, 0d0h
    jmp short L4d411
L4d41f:
    cmp bh, 02ch
    jne short L4d426
    db 089h, 0d0h
L4d426:
    mov dword ptr [ecx+0a4h], eax
    cmp byte ptr [esp+01h], 078h
    jne short L4d43e
    lea eax, [esp+02h]
    call Func4dc00_
    jmp short L4d445
L4d43e:
    db 089h, 0e0h
    call atoi_
L4d445:
    mov dword ptr [esi], eax
    mov eax, 01h
L4d44c:
    add esp, 020h
    pop esi
    pop ecx
    pop ebx
    ret
Func4d3a0_ endp
    db 090h
Func4d454_ proc near
    push ecx
    push esi
    push edi
    push ebp
    sub esp, 08h
    mov dword ptr [esp], eax
    db 089h, 0d7h
    mov dword ptr [esp+04h], ebx
    mov edx, dword ptr [eax+0a4h]
    test edx, edx
    je short L4d472
    db 089h, 0d0h
    jmp short L4d478
L4d472:
    mov eax, dword ptr [eax+0a0h]
L4d478:
    test eax, eax
    je near ptr L4d4e6
    mov bl, byte ptr [eax]
    db 031h, 0d2h
    cmp bl, 020h
    jne short L4d492
L4d489:
    mov bh, byte ptr [eax+01h]
    inc eax
    cmp bh, 020h
    je short L4d489
L4d492:
    mov ebp, dword ptr [esp+04h]
    dec ebp
L4d497:
    mov cl, byte ptr [eax]
    cmp cl, 0dh
    je short L4d4b6
    cmp cl, 02ch
    je short L4d4b6
    db 039h, 0eah
    jae short L4d4b6
    db 089h, 0c6h
    db 089h, 0d3h
    inc eax
    lea ecx, [edi+ebx*1]
    mov bl, byte ptr [esi]
    inc edx
    mov byte ptr [ecx], bl
    jmp short L4d497
L4d4b6:
    mov ebx, dword ptr [esp+04h]
    dec ebx
    mov byte ptr [edx+edi*1], 00h
    db 039h, 0dah
    jne short L4d4d2
L4d4c3:
    mov dl, byte ptr [eax]
    cmp dl, 0dh
    je short L4d4d2
    cmp dl, 02ch
    je short L4d4d2
    inc eax
    jmp short L4d4c3
L4d4d2:
    cmp byte ptr [eax], 02ch
    jne short L4d4d8
    inc eax
L4d4d8:
    mov edx, dword ptr [esp]
    mov dword ptr [edx+0a4h], eax
    mov eax, 01h
L4d4e6:
    add esp, 08h
    pop ebp
    pop edi
    pop esi
    pop ecx
    ret
Func4d454_ endp
    db 08bh, 0c0h
Func4d4f0_ proc near
    push ecx
    push esi
    push edi
    push ebp
    sub esp, 04h
    db 089h, 0c5h
    db 089h, 0d6h
    mov eax, dword ptr [eax+0a8h]
    test eax, eax
    je short L4d511
    mov dl, byte ptr [eax]
    cmp dl, 05bh
    je short L4d511
    cmp dl, 0dh
    jne short L4d515
L4d511:
    db 031h, 0c0h
    jmp short L4d578
L4d515:
    db 089h, 0eah
    db 089h, 0e9h
    mov edx, dword ptr [edx+084h]
    mov ecx, dword ptr [ecx+088h]
    db 001h, 0d1h
    mov dword ptr [esp], ecx
    mov cl, byte ptr [eax]
    db 031h, 0d2h
    cmp cl, 020h
    jne short L4d53c
L4d533:
    mov ch, byte ptr [eax+01h]
    inc eax
    cmp ch, 020h
    je short L4d533
L4d53c:
    lea edi, [ebx-01h]
L4d53f:
    cmp byte ptr [eax], 0dh
    je short L4d555
    db 039h, 0fah
    jae short L4d555
    db 089h, 0c3h
    db 089h, 0d1h
    inc eax
    mov bl, byte ptr [ebx]
    inc edx
    mov byte ptr [ecx+esi*1], bl
    jmp short L4d53f
L4d555:
    add eax, 02h
    mov byte ptr [edx+esi*1], 00h
    cmp eax, dword ptr [esp]
    jb short L4d56d
    mov dword ptr [ebp+0a8h], 00h
    jmp short L4d573
L4d56d:
    mov dword ptr [ebp+0a8h], eax
L4d573:
    mov eax, 01h
L4d578:
    add esp, 04h
    pop ebp
    pop edi
    pop esi
    pop ecx
    ret
Func4d4f0_ endp
Func4d580_ proc near
    push ebx
    push ecx
    push esi
    push edi
    push ebp
    sub esp, 024h
    mov dword ptr [esp+020h], eax
    db 089h, 0d1h
    mov edx, dword ptr [eax+0a0h]
    test edx, edx
    jne short L4d59f
    db 031h, 0c0h
    jmp near ptr L4d6a4
L4d59f:
    db 089h, 0d0h
    cmp byte ptr [edx], 020h
    jne short L4d5af
L4d5a6:
    mov dh, byte ptr [eax+01h]
    inc eax
    cmp dh, 020h
    je short L4d5a6
L4d5af:
    db 089h, 0c6h
    mov bl, byte ptr [eax]
    db 031h, 0edh
    cmp bl, 0dh
    je short L4d5c8
L4d5ba:
    mov dl, byte ptr [eax]
    inc eax
    mov byte ptr [esp+ebp*1], dl
    mov bh, byte ptr [eax]
    inc ebp
    cmp bh, 0dh
    jne short L4d5ba
L4d5c8:
    db 030h, 0c0h
    mov byte ptr [esp+ebp*1], al
    cmp byte ptr [esp+01h], 078h
    jne short L4d5df
    mov ebx, 010h
    lea edx, [esp+02h]
    jmp short L4d5e6
L4d5df:
    mov ebx, 0ah
    db 089h, 0e2h
L4d5e6:
    db 089h, 0c8h
    call _itoa_
    db 089h, 0e7h
    db 029h, 0c9h
    dec ecx
    db 031h, 0c0h
    db 0f2h, 0aeh
    not ecx
    dec ecx
    db 089h, 0c8h
    db 039h, 0e9h
    jae short L4d632
    mov edx, dword ptr [esp+020h]
    mov ebx, dword ptr [esp+020h]
    mov edx, dword ptr [edx+084h]
    mov ecx, dword ptr [ebx+088h]
    lea ebx, [edx+ecx*1]
    db 029h, 0c5h
    db 029h, 0f3h
    lea edx, [esi+ebp*1]
    db 029h, 0ebh
    db 089h, 0f0h
    call memmove_
    mov eax, dword ptr [esp+020h]
    sub dword ptr [eax+088h], ebp
    jmp short L4d680
L4d632:
    jbe short L4d680
    mov eax, dword ptr [esp+020h]
    mov edx, dword ptr [esp+020h]
    db 029h, 0e9h
    mov eax, dword ptr [eax+088h]
    mov ebx, dword ptr [edx+08ch]
    db 001h, 0c8h
    db 039h, 0d8h
    jbe short L4d65b
    db 031h, 0c0h
    add esp, 024h
    pop ebp
    pop edi
    pop esi
    pop ecx
    pop ebx
    ret
L4d65b:
    mov eax, dword ptr [edx+084h]
    add eax, dword ptr [edx+088h]
    db 029h, 0f0h
    lea ebx, [eax+ecx*1]
    lea eax, [esi+ecx*1]
    db 089h, 0f2h
    call memmove_
    mov eax, dword ptr [esp+020h]
    add dword ptr [eax+088h], ecx
L4d680:
    mov dl, byte ptr [esp]
    db 031h, 0c0h
    test dl, dl
    je short L4d697
L4d689:
    mov dl, byte ptr [esp+eax*1]
    inc eax
    mov byte ptr [esi], dl
    mov dh, byte ptr [esp+eax*1]
    inc esi
    test dh, dh
    jne short L4d689
L4d697:
    mov eax, dword ptr [esp+020h]
    or byte ptr [eax+01h], 080h
    mov eax, 01h
L4d6a4:
    add esp, 024h
    pop ebp
    pop edi
    pop esi
    pop ecx
    pop ebx
    ret
Func4d580_ endp
    db 08dh, 040h, 000h
Func4d6b0_ proc near
    push ebx
    push ecx
    push esi
    push edi
    push ebp
    sub esp, 04h
    mov dword ptr [esp], eax
    db 089h, 0d6h
    mov eax, dword ptr [eax+0a0h]
    test eax, eax
    je near ptr L4d78b
    mov bl, byte ptr [eax]
    db 031h, 0d2h
    cmp bl, 020h
    jne short L4d6dd
L4d6d4:
    mov bh, byte ptr [eax+01h]
    inc eax
    cmp bh, 020h
    je short L4d6d4
L4d6dd:
    db 089h, 0c5h
L4d6df:
    db 089h, 0c3h
    mov cl, byte ptr [ebx]
    inc eax
    cmp cl, 0dh
    je short L4d6ec
    inc edx
    jmp short L4d6df
L4d6ec:
    db 089h, 0f7h
    db 029h, 0c9h
    dec ecx
    db 031h, 0c0h
    db 0f2h, 0aeh
    not ecx
    dec ecx
    db 089h, 0c8h
    db 039h, 0d1h
    jae short L4d72f
    mov ebx, dword ptr [esp]
    mov ecx, dword ptr [esp]
    mov ebx, dword ptr [ebx+084h]
    mov edi, dword ptr [ecx+088h]
    db 089h, 0d1h
    db 001h, 0fbh
    db 029h, 0c1h
    db 029h, 0ebh
    lea edx, [ecx+ebp*1]
    db 029h, 0cbh
    db 089h, 0e8h
    call memmove_
    mov eax, dword ptr [esp]
    sub dword ptr [eax+088h], ecx
    jmp short L4d772
L4d72f:
    jbe short L4d772
    mov eax, dword ptr [esp]
    db 029h, 0d1h
    mov edx, dword ptr [esp]
    mov eax, dword ptr [eax+088h]
    mov ebx, dword ptr [edx+08ch]
    db 001h, 0c8h
    db 039h, 0d8h
    jbe short L4d74f
    db 031h, 0c0h
    jmp short L4d78b
L4d74f:
    mov ebx, dword ptr [edx+084h]
    add ebx, dword ptr [edx+088h]
    db 029h, 0ebh
    lea eax, [ecx+ebp*1]
    db 001h, 0cbh
    db 089h, 0eah
    call memmove_
    mov eax, dword ptr [esp]
    add dword ptr [eax+088h], ecx
L4d772:
    mov ch, byte ptr [esi]
    test ch, ch
    je short L4d77f
    inc ebp
    inc esi
    mov byte ptr [ebp-01h], ch
    jmp short L4d772
L4d77f:
    mov eax, dword ptr [esp]
    or byte ptr [eax+01h], 080h
    mov eax, 01h
L4d78b:
    add esp, 04h
    pop ebp
    pop edi
    pop esi
    pop ecx
    pop ebx
    ret
Func4d6b0_ endp
Func4d794_ proc near
    push ebx
    push ecx
    sub esp, 020h
    db 089h, 0c1h
    call Func4d2e4_
    test eax, eax
    je short L4d7cf
    mov ebx, 020h
    db 089h, 0e2h
    db 089h, 0c8h
    call Func4d454_
    test eax, eax
    je short L4d7cf
    mov edx, offset Dc11e0
    db 089h, 0e0h
    call _stricmp_
    test eax, eax
    jne short L4d7cd
    mov eax, 01h
    jmp short L4d7cf
L4d7cd:
    db 031h, 0c0h
L4d7cf:
    add esp, 020h
    pop ecx
    pop ebx
    ret
Func4d794_ endp
    db 08dh, 040h, 000h
Func4d7d8_ proc near
    push ecx
    db 089h, 0c1h
    call Func4d2e4_
    test eax, eax
    je short L4d7f6
    db 089h, 0dah
    db 089h, 0c8h
    call Func4d3a0_
    test eax, eax
    je short L4d7f6
    mov eax, 01h
L4d7f6:
    pop ecx
    ret
Func4d7d8_ endp
Func4d7f8_ proc near
    push esi
    push edi
    db 089h, 0c6h
    db 089h, 0dfh
    db 089h, 0cbh
    call Func4d2e4_
    test eax, eax
    je short L4d81b
    db 089h, 0fah
    db 089h, 0f0h
    call Func4d454_
    test eax, eax
    je short L4d81b
    mov eax, 01h
L4d81b:
    pop edi
    pop esi
    ret
Func4d7f8_ endp
    db 08bh, 0c0h
Func4d820_ proc near
    push ecx
    db 089h, 0c1h
    call Func4d2e4_
    test eax, eax
    je short L4d857
    test ebx, ebx
    je short L4d842
    mov edx, offset Dc11e4
    db 089h, 0c8h
    call Func4d6b0_
    test eax, eax
    jne short L4d852
    pop ecx
    ret
L4d842:
    mov edx, offset Dc11e8
    db 089h, 0c8h
    call Func4d6b0_
    test eax, eax
    je short L4d857
L4d852:
    mov eax, 01h
L4d857:
    pop ecx
    ret
Func4d820_ endp
    db 08dh, 040h, 000h
Func4d85c_ proc near
    push ebx
    push ecx
    push esi
    push edi
    db 089h, 0c6h
    call Func4d2e4_
    db 031h, 0c9h
    test eax, eax
    je short L4d8b4
    mov edi, dword ptr [esi+09ch]
    db 089h, 0f8h
L4d875:
    mov dl, byte ptr [eax]
    inc ecx
    cmp dl, 0ah
    je short L4d880
    inc eax
    jmp short L4d875
L4d880:
    mov ebx, dword ptr [esi+084h]
    add ebx, dword ptr [esi+088h]
    lea edx, [edi+ecx*1]
    db 089h, 0f8h
    db 029h, 0d3h
    call memmove_
    mov ebx, dword ptr [esi+088h]
    mov dh, byte ptr [esi+01h]
    db 029h, 0cbh
    or dh, 080h
    mov dword ptr [esi+088h], ebx
    mov eax, 01h
    mov byte ptr [esi+01h], dh
L4d8b4:
    pop edi
    pop esi
    pop ecx
    pop ebx
    ret
Func4d85c_ endp
    db 08dh, 040h, 000h
Func4d8bc_ proc near
    push ebx
    push ecx
    push esi
    push edi
    db 089h, 0c6h
    call Func4d258_
    test eax, eax
    je short L4d928
    mov ecx, 01h
    mov edx, dword ptr [esi+084h]
    mov ebx, dword ptr [esi+088h]
    mov edi, dword ptr [esi+098h]
    db 001h, 0dah
    lea ebx, [edi+ecx*1]
    db 089h, 0d8h
    cmp byte ptr [ebx], 05bh
    je short L4d8fc
L4d8ee:
    db 039h, 0d0h
    jae short L4d8fc
    mov bl, byte ptr [eax+01h]
    inc eax
    inc ecx
    cmp bl, 05bh
    jne short L4d8ee
L4d8fc:
    lea eax, [edi+ecx*1]
    db 089h, 0d3h
    db 089h, 0c2h
    db 029h, 0c3h
    db 089h, 0f8h
    call memmove_
    mov edi, dword ptr [esi+088h]
    mov bh, byte ptr [esi+01h]
    db 029h, 0cfh
    or bh, 080h
    mov dword ptr [esi+088h], edi
    mov eax, 01h
    mov byte ptr [esi+01h], bh
L4d928:
    pop edi
    pop esi
    pop ecx
    pop ebx
    ret
Func4d8bc_ endp
    db 08dh, 040h, 000h
Func4d930_ proc near
    push ebx
    push ecx
    push esi
    push edi
    push ebp
    db 089h, 0c6h
    db 089h, 0d3h
    call Func4d258_
    test eax, eax
    je short L4d949
    db 031h, 0c0h
    jmp near ptr L4d9d8
L4d949:
    mov edx, dword ptr [esi+084h]
    mov ecx, dword ptr [esi+088h]
    db 089h, 0dfh
    db 001h, 0cah
    db 029h, 0c9h
    dec ecx
    db 031h, 0c0h
    db 0f2h, 0aeh
    not ecx
    dec ecx
    add ecx, 06h
    mov eax, dword ptr [esi+088h]
    mov edi, dword ptr [esi+08ch]
    db 001h, 0c8h
    db 039h, 0f8h
    jbe short L4d980
    db 031h, 0c0h
    pop ebp
    pop edi
    pop esi
    pop ecx
    pop ebx
    ret
L4d980:
    mov byte ptr [edx], 0dh
    inc edx
    mov byte ptr [edx], 0ah
    inc edx
    mov dword ptr [esi+098h], edx
    mov byte ptr [edx], 05bh
    mov ah, byte ptr [ebx]
    inc edx
    test ah, ah
    je short L4d9a4
L4d998:
    mov al, byte ptr [ebx]
    inc ebx
    mov byte ptr [edx], al
    mov al, byte ptr [ebx]
    inc edx
    test al, al
    jne short L4d998
L4d9a4:
    mov byte ptr [edx], 05dh
    inc edx
    mov byte ptr [edx], 0dh
    inc edx
    mov byte ptr [edx], 0ah
    inc edx
    mov ebp, dword ptr [esi+088h]
    mov ah, byte ptr [esi+01h]
    mov dword ptr [esi+0a8h], edx
    db 001h, 0cdh
    mov dword ptr [esi+090h], edx
    or ah, 080h
    mov dword ptr [esi+088h], ebp
    mov byte ptr [esi+01h], ah
    mov eax, 01h
L4d9d8:
    pop ebp
    pop edi
    pop esi
    pop ecx
    pop ebx
    ret
Func4d930_ endp
    db 08bh, 0c0h
Func4d9e0_ proc near
    push esi
    push edi
    push ebp
    sub esp, 0ch
    mov dword ptr [esp], eax
    mov dword ptr [esp+04h], edx
    mov dword ptr [esp+08h], ebx
    db 089h, 0cdh
    call Func4d2e4_
    test eax, eax
    je short L4da0b
    mov eax, dword ptr [esp]
    db 089h, 0dah
    call Func4d6b0_
    jmp near ptr L4dad8
L4da0b:
    mov esi, dword ptr [esp]
    db 089h, 0dfh
    mov esi, dword ptr [esi+090h]
    db 029h, 0c9h
    dec ecx
    db 031h, 0c0h
    db 0f2h, 0aeh
    not ecx
    dec ecx
    lea eax, [ebp+04h]
    db 001h, 0c1h
    mov eax, dword ptr [esp]
    mov ebx, dword ptr [esp]
    mov eax, dword ptr [eax+088h]
    mov edx, dword ptr [ebx+08ch]
    db 001h, 0c8h
    db 039h, 0d0h
    jbe short L4da44
    db 031h, 0c0h
    jmp near ptr L4dadd
L4da44:
    mov eax, dword ptr [ebx+084h]
    mov edi, dword ptr [ebx+088h]
    lea ebx, [eax+edi*1]
    db 029h, 0f3h
    lea eax, [esi+ecx*1]
    db 089h, 0f2h
    call memmove_
    mov eax, dword ptr [esp+04h]
    cmp byte ptr [eax], 00h
    je short L4da81
L4da68:
    mov eax, dword ptr [esp+04h]
    mov al, byte ptr [eax]
    mov byte ptr [esi], al
    mov eax, dword ptr [esp+04h]
    inc eax
    inc esi
    dec ebp
    mov dh, byte ptr [eax]
    mov dword ptr [esp+04h], eax
    test dh, dh
    jne short L4da68
L4da81:
    dec ebp
    cmp ebp, 0ffffffffh
    je short L4da8d
    mov byte ptr [esi], 020h
    inc esi
    jmp short L4da81
L4da8d:
    mov byte ptr [esi], 03dh
    inc esi
    mov eax, dword ptr [esp+08h]
    mov byte ptr [esi], 020h
    mov bl, byte ptr [eax]
    inc esi
    test bl, bl
    je short L4dab7
L4da9f:
    mov eax, dword ptr [esp+08h]
    mov edx, dword ptr [esp+08h]
    mov al, byte ptr [eax]
    inc edx
    mov byte ptr [esi], al
    inc esi
    mov bh, byte ptr [edx]
    mov dword ptr [esp+08h], edx
    test bh, bh
    jne short L4da9f
L4dab7:
    mov byte ptr [esi], 0dh
    inc esi
    mov eax, dword ptr [esp]
    mov byte ptr [esi], 0ah
    mov ebx, dword ptr [eax+088h]
    db 001h, 0cbh
    mov cl, byte ptr [eax+01h]
    mov dword ptr [eax+088h], ebx
    or cl, 080h
    mov byte ptr [eax+01h], cl
L4dad8:
    mov eax, 01h
L4dadd:
    add esp, 0ch
    pop ebp
    pop edi
    pop esi
    ret
Func4d9e0_ endp
Func4dae4_ proc near
    push esi
    push edi
    push ebp
    sub esp, 028h
    mov dword ptr [esp+024h], eax
    mov dword ptr [esp+020h], edx
    db 089h, 0deh
    db 089h, 0cdh
    call Func4d2e4_
    test eax, eax
    je short L4db0f
    mov eax, dword ptr [esp+024h]
    db 089h, 0dah
    call Func4d580_
    jmp near ptr L4dbf0
L4db0f:
    cmp dword ptr [esp+038h], 010h
    jne short L4db2c
    mov ah, 030h
    mov dl, 078h
    mov ebx, 010h
    mov byte ptr [esp], ah
    mov byte ptr [esp+01h], dl
    lea edx, [esp+02h]
    jmp short L4db33
L4db2c:
    mov ebx, 0ah
    db 089h, 0e2h
L4db33:
    db 089h, 0f0h
    call _itoa_
    mov esi, dword ptr [esp+024h]
    db 089h, 0e7h
    mov esi, dword ptr [esi+090h]
    db 029h, 0c9h
    dec ecx
    db 031h, 0c0h
    db 0f2h, 0aeh
    not ecx
    dec ecx
    lea eax, [ebp+04h]
    db 001h, 0c1h
    mov eax, dword ptr [esp+024h]
    mov edx, dword ptr [esp+024h]
    mov eax, dword ptr [eax+088h]
    mov ebx, dword ptr [edx+08ch]
    db 001h, 0c8h
    db 039h, 0d8h
    jbe short L4db76
    db 031h, 0c0h
    jmp near ptr L4dbf5
L4db76:
    mov ebx, dword ptr [edx+084h]
    add ebx, dword ptr [edx+088h]
    db 029h, 0f3h
    lea eax, [esi+ecx*1]
    db 089h, 0f2h
    call memmove_
    mov eax, dword ptr [esp+020h]
    cmp byte ptr [eax], 00h
    je short L4dbb0
L4db97:
    mov eax, dword ptr [esp+020h]
    mov al, byte ptr [eax]
    mov byte ptr [esi], al
    mov eax, dword ptr [esp+020h]
    inc eax
    inc esi
    dec ebp
    mov bl, byte ptr [eax]
    mov dword ptr [esp+020h], eax
    test bl, bl
    jne short L4db97
L4dbb0:
    dec ebp
    cmp ebp, 0ffffffffh
    je short L4dbbc
    mov byte ptr [esi], 020h
    inc esi
    jmp short L4dbb0
L4dbbc:
    mov byte ptr [esi], 03dh
    inc esi
    mov byte ptr [esi], 020h
    db 031h, 0edh
    mov bh, byte ptr [esp]
    inc esi
    test bh, bh
    je short L4dbdb
L4dbcd:
    mov al, byte ptr [esp+ebp*1]
    inc ebp
    mov byte ptr [esi], al
    mov al, byte ptr [esp+ebp*1]
    inc esi
    test al, al
    jne short L4dbcd
L4dbdb:
    mov byte ptr [esi], 0dh
    inc esi
    mov eax, dword ptr [esp+024h]
    mov byte ptr [esi], 0ah
    add dword ptr [eax+088h], ecx
    or byte ptr [eax+01h], 080h
L4dbf0:
    mov eax, 01h
L4dbf5:
    add esp, 028h
    pop ebp
    pop edi
    pop esi
    ret 04h
Func4dae4_ endp
    db 08bh, 0c0h
Func4dc00_ proc near
    push ebx
    push ecx
    push edx
    push esi
    push edi
    push ebp
    db 089h, 0c5h
    db 089h, 0c7h
    db 029h, 0c9h
    dec ecx
    db 031h, 0c0h
    db 0f2h, 0aeh
    not ecx
    dec ecx
    db 031h, 0dbh
    db 031h, 0f6h
    lea edx, [ecx*4+00h]
L4dc1f:
    db 089h, 0d8h
    inc ebx
    mov al, byte ptr [eax+ebp*1]
    and eax, 0ffh
    call Func4dc4c_
    imul eax, dword ptr [edx+Dc6d28]
    sub edx, 04h
    dec ecx
    db 001h, 0c6h
    test ecx, ecx
    ja short L4dc1f
    db 089h, 0f0h
    pop ebp
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
Func4dc00_ endp
    db 08dh, 040h, 000h
Func4dc4c_ proc near
    push ebx
    push ecx
    push edx
    mov ecx, dword ptr [Dc6d28]
    db 088h, 0c3h
    db 031h, 0c0h
L4dc59:
    lea edx, [ecx+eax*1]
    cmp bl, byte ptr [edx]
    je short L4dc70
    cmp bl, byte ptr [edx+010h]
    je short L4dc70
    inc eax
    cmp eax, 010h
    jb short L4dc59
    mov eax, 0ffffffffh
L4dc70:
    mov dword ptr [Dc6d28], ecx
    pop edx
    pop ecx
    pop ebx
    ret
Func4dc4c_ endp
_TEXT ends

_DATA segment
Dc6d28 label byte
    dd offset Dc11bc
    db 001h, 000h, 000h, 000h, 010h, 000h, 000h, 000h, 000h, 001h, 000h, 000h, 000h, 010h, 000h, 000h
    db 000h, 000h, 001h, 000h, 000h, 000h, 010h, 000h, 000h, 000h, 000h, 001h, 000h, 000h, 000h, 010h
_DATA ends

CONST segment
Dc11bc label byte
    db "0123456789ABCDEF0123456789abcdef"
    db 000h, 000h, 000h, 000h
Dc11e0 label byte
    db "YES"
    db 000h
Dc11e4 label byte
    db "Yes"
    db 000h
Dc11e8 label byte
    db 04eh, 06fh, 000h, 000h
CONST ends

    end

    .586p

_TEXT segment dword public use32 'CODE'
_TEXT ends

    assume cs:FLAT, ds:FLAT, es:FLAT, ss:FLAT

    extrn _Data5a835:near
    extrn _Data5c779:near
    extrn _Datac85c0:byte
    extrn _Datac85c4:byte
    extrn _Datac85c8:byte
    extrn _Datac85cc:byte
    extrn _Datac85d0:byte
    extrn _Datac85d4:byte
    extrn _Datac85d8:byte
    extrn _Datac85dc:byte
    extrn _Datac85e0:byte
    extrn _Datac85e4:byte
    extrn _Datac85ec:byte
    extrn _Datac85f0:byte
    extrn _Datac85f4:byte
    extrn _Datac85fc:byte

    public Func57538_
    public Func57539_
    public Func579d3_

_TEXT segment
Func57538_ proc near
    ret
Func57538_ endp
Func57539_ proc near
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
    je short L57572
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
    jne short L575bc
    nop
    nop
    nop
    nop
    jmp near ptr L579cb
L57572:
    xor eax, eax
    mov edx, 0ch
    out dx, al
    jmp short L5757c
L5757c:
    mov edx, dword ptr [ebp+018h]
    in al, dx
    jmp short L57582
L57582:
    db 086h, 0c4h
    in al, dx
    jmp short L57587
L57587:
    db 086h, 0c4h
    inc eax
    cmp edx, 07h
    jbe short L57591
    add eax, eax
L57591:
    cmp eax, dword ptr [ebp+044h]
    jbe short L575b1
    xor eax, eax
    mov edx, 0ch
    out dx, al
    jmp short L575a0
L575a0:
    mov eax, dword ptr [ebp+044h]
    dec eax
    mov edx, dword ptr [ebp+018h]
    out dx, al
    jmp short L575aa
L575aa:
    db 086h, 0c4h
    out dx, al
    jmp short L575af
L575af:
    db 086h, 0c4h
L575b1:
    mov ebx, dword ptr [ebp+044h]
    sub ebx, eax
    and ebx, 0fffch
L575bc:
    or ebx, ebx
    jne short L575c3
    add ebx, 020h
L575c3:
    cmp ebx, dword ptr [ebp+020h]
    je near ptr L579cb
    mov dword ptr [ebp+01ch], ebx
    mov eax, dword ptr [ebp+01ch]
    sub eax, dword ptr [ebp+020h]
    jae short L575e0
    mov eax, dword ptr [ebp+044h]
    sub eax, dword ptr [ebp+020h]
    add eax, dword ptr [ebp+01ch]
L575e0:
    mov dword ptr [ebp+024h], eax
    cmp dword ptr [ebp+0ch], 010h
    je short L575eb
    shl eax, 1
L575eb:
    shl eax, 1
    mov dword ptr [_Datac85c8], eax
    add eax, dword ptr [ebp+048h]
    dec eax
    mov dword ptr [ebp+04ch], eax
    mov dword ptr [_Datac85c4], eax
    mov edi, dword ptr [ebp+048h]
    mov ecx, dword ptr [_Datac85c8]
    add ecx, 020h
    xor eax, eax
    push ecx
    shr ecx, 02h
    db 0f3h, 0abh
    pop ecx
    and ecx, 03h
    db 0f3h, 0aah
    mov eax, dword ptr [ebp+01ch]
    mov dword ptr [ebp+020h], eax
    mov dword ptr [ebp+054h], 00h
    mov dword ptr [_Datac85d0], 00h
    mov esi, dword ptr [ebp+030h]
    or esi, esi
    je near ptr L578e1
L5763a:
    mov dword ptr [_Datac85c0], esi
    test dword ptr [esi+020h], 04000h
    jne near ptr L5784d
    inc dword ptr [ebp+054h]
    mov edi, dword ptr [ebp+048h]
L57653:
    mov dword ptr [_Datac85e4], 00h
    test dword ptr [esi+040h], 08000h
    je short L57671
    nop
    nop
    nop
    nop
    or dword ptr [_Datac85e4], 01h
L57671:
    test dword ptr [esi+040h], 04000h
    je short L57685
    nop
    nop
    nop
    nop
    or dword ptr [_Datac85e4], 040h
L57685:
    cmp dword ptr [esi+044h], 08000h
    jne short L576ad
    mov eax, dword ptr [esi+02ch]
    and eax, 07fffh
    mov dword ptr [_Datac85f0], eax
    mov eax, dword ptr [esi+02ch]
    shr eax, 010h
    and eax, 07fffh
    mov dword ptr [_Datac85f4], eax
    jmp short L576ed
L576ad:
    mov ebx, 07fffh
    mov ecx, 07fffh
    test dword ptr [esi+044h], 08000h
    jne short L576c5
    mov ecx, dword ptr [esi+044h]
    jmp short L576cd
L576c5:
    mov ebx, 0ffffh
    sub ebx, dword ptr [esi+044h]
L576cd:
    xor edx, edx
    mov eax, dword ptr [esi+02ch]
    imul bx
    add edx, edx
    mov dword ptr [_Datac85f0], edx
    xor edx, edx
    mov eax, dword ptr [esi+02ch]
    imul cx
    add edx, edx
    mov dword ptr [_Datac85f4], edx
L576ed:
    cmp dword ptr [_Datac85f0], 07ff0h
    jb short L57705
    cmp dword ptr [_Datac85f4], 07ff0h
    jae short L5770c
L57705:
    or dword ptr [_Datac85e4], 020h
L5770c:
    cmp dword ptr [esi+038h], 08h
    je short L57719
    or dword ptr [_Datac85e4], 02h
L57719:
    cmp dword ptr [esi+03ch], 01h
    je short L57726
    or dword ptr [_Datac85e4], 08h
L57726:
    cmp dword ptr [ebp+08h], 01h
    je short L57733
    or dword ptr [_Datac85e4], 04h
L57733:
    xor eax, eax
    mov edx, dword ptr [esi+034h]
    cmp edx, dword ptr [ebp+04h]
    je short L5778d
    mov ecx, dword ptr [ebp+04h]
    shl ecx, 010h
    div ecx
    mov ebx, eax
    shr ebx, 010h
    shl eax, 010h
    mov dword ptr [_Datac85d8], eax
    mov eax, ebx
    inc ebx
    test dword ptr [_Datac85e4], 08h
    je short L57765
    shl eax, 1
    shl ebx, 1
L57765:
    test dword ptr [_Datac85e4], 02h
    je short L57779
    nop
    nop
    nop
    nop
    shl eax, 1
    shl ebx, 1
L57779:
    mov word ptr [_Datac85dc], ax
    mov word ptr [_Datac85e0], bx
    or dword ptr [_Datac85e4], 010h
L5778d:
    mov eax, dword ptr [_Datac85e4]
    shl eax, 02h
    add eax, offset _Data5a835
    mov eax, dword ptr [eax]
    mov dword ptr [_Datac85fc], eax
    mov eax, dword ptr [esi]
    add eax, dword ptr [esi+0ch]
    mov dword ptr [_Datac85d4], eax
    mov esi, dword ptr [esi+04h]
    mov ecx, 080000000h
    push ebp
    xor eax, eax
    xor ebx, ebx
    call dword ptr [_Datac85fc]
    pop ebp
    mov dword ptr [_Datac85cc], edi
    mov edi, esi
    mov esi, dword ptr [_Datac85c0]
    mov eax, edi
    sub eax, dword ptr [esi+04h]
    add dword ptr [esi+04h], eax
    mov eax, dword ptr [_Datac85cc]
    sub eax, dword ptr [ebp+048h]
    shr eax, 02h
    add dword ptr [esi+058h], eax
    mov eax, dword ptr [esi+04h]
    cmp eax, dword ptr [_Datac85d4]
    jb near ptr L578c1
    cmp dword ptr [esi+030h], 0ffffffffh
    je near ptr L578ad
    cmp dword ptr [esi+030h], 00h
    je short L5780e
    nop
    nop
    nop
    nop
    dec dword ptr [esi+030h]
    jmp near ptr L578ad
L5780e:
    or dword ptr [esi+020h], 04000h
    cmp dword ptr [esi+05ch], 00h
    je near ptr L578c1
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
    je near ptr L578c1
    and dword ptr [esi+020h], 0ffffbfffh
    jmp short L578ad
    nop
    nop
    nop
L5784d:
    mov dword ptr [esi+020h], 00h
    cmp dword ptr [esi+060h], 00h
    je short L57871
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
L57871:
    and dword ptr [esi+020h], 0ffff7fffh
    or dword ptr [esi+020h], 02000h
    cmp dword ptr [_Datac85d0], 00h
    jne short L57896
    mov eax, dword ptr [esi+0ech]
    mov dword ptr [ebp+030h], eax
    jmp short L578d3
    nop
    nop
    nop
L57896:
    mov eax, dword ptr [esi+0ech]
    mov edi, dword ptr [_Datac85d0]
    mov dword ptr [edi+0ech], eax
    jmp short L578d3
    nop
    nop
    nop
L578ad:
    mov eax, dword ptr [esi]
    mov dword ptr [esi+04h], eax
    mov edi, dword ptr [_Datac85cc]
    cmp edi, dword ptr [ebp+04ch]
    jb near ptr L57653
L578c1:
    mov eax, dword ptr [ebp+054h]
    cmp eax, dword ptr [ebp+014h]
    jae short L578e1
    nop
    nop
    nop
    nop
    mov dword ptr [_Datac85d0], esi
L578d3:
    mov esi, dword ptr [esi+0ech]
    or esi, esi
    jne near ptr L5763a
L578e1:
    xor eax, eax
    test dword ptr [ebp+010h], 08000h
    je short L578f3
    nop
    nop
    nop
    nop
    or eax, 02h
L578f3:
    test dword ptr [ebp+010h], 04000h
    je short L57903
    nop
    nop
    nop
    nop
    or eax, 08h
L57903:
    cmp dword ptr [ebp+0ch], 08h
    je short L5790f
    and eax, 0fffffffdh
    or eax, 01h
L5790f:
    cmp dword ptr [ebp+08h], 01h
    je short L57918
    or eax, 04h
L57918:
    cmp dword ptr [ebp+054h], 01h
    jbe short L57921
    or eax, 010h
L57921:
    mov dword ptr [_Datac85ec], eax
    shl eax, 02h
    add eax, offset _Data5c779
    mov eax, dword ptr [eax]
    mov dword ptr [_Datac85fc], eax
    mov edi, dword ptr [ebp+028h]
    mov esi, dword ptr [ebp+048h]
    mov ecx, dword ptr [_Datac85c8]
    shr ecx, 02h
    mov edx, ecx
    cmp dword ptr [ebp+08h], 01h
    je short L5794e
    shr ecx, 1
L5794e:
    cmp dword ptr [ebp+0ch], 010h
    jne short L57956
    shl edx, 1
L57956:
    mov eax, edi
    add eax, edx
    cmp eax, dword ptr [ebp+040h]
    jb short L579a4
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
    je short L57976
    shr ecx, 1
L57976:
    cmp dword ptr [ebp+08h], 01h
    je short L5797e
    shr ecx, 1
L5797e:
    call dword ptr [_Datac85fc]
    pop ecx
    mov edi, dword ptr [ebp+03ch]
    or ecx, ecx
    je short L579aa
    cmp dword ptr [ebp+0ch], 08h
    je short L57994
    shr ecx, 1
L57994:
    cmp dword ptr [ebp+08h], 01h
    je short L5799c
    shr ecx, 1
L5799c:
    call dword ptr [_Datac85fc]
    jmp short L579aa
L579a4:
    call dword ptr [_Datac85fc]
L579aa:
    mov dword ptr [ebp+028h], edi
    cmp dword ptr [ebp+054h], 00h
    jne short L579cb
    mov eax, dword ptr [ebp+03ch]
    add eax, dword ptr [ebp+01ch]
    add eax, dword ptr [ebp+02ch]
    cmp eax, dword ptr [ebp+040h]
    jb short L579c8
    nop
    nop
    nop
    nop
    sub eax, dword ptr [ebp+044h]
L579c8:
    mov dword ptr [ebp+028h], eax
L579cb:
    pop ebp
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    pop ebp
    ret
Func57539_ endp
Func579d3_ proc near
    ret
Func579d3_ endp
_TEXT ends

    end

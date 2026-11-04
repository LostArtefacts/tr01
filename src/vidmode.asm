    .586p

_TEXT segment para public use32 'CODE'
_TEXT ends
_DATA segment dword public use32 'DATA'
_DATA ends
_BSS segment dword public use32 'BSS'
_BSS ends

    assume cs:FLAT, ds:FLAT, es:FLAT, ss:FLAT

    extrn Func4f5c4_:near
    extrn Func50784_:near
    extrn Func50be0_:near
    extrn Func57a00_:near
    extrn Func57b74_:near
    extrn Func57c5c_:near
    extrn Func57c6c_:near
    extrn Func57cc4_:near
    extrn Func58398_:near
    extrn Func584a0_:near
    extrn Func584b0_:near
    extrn Func584c0_:near
    extrn Func584d0_:near
    extrn Func584e0_:near
    extrn Func58514_:near
    extrn Func58550_:near
    extrn Func58560_:near
    extrn Func58570_:near
    extrn Func58580_:near
    extrn Func58590_:near
    extrn Func585c4_:near
    extrn Func58674_:near

    public Func4efa0_
    public Func4f140_
    public Func4f344_
    public Func4f3ec_
    public Func4f418_
    public _Data1300e8

_TEXT segment
Func4efa0_ proc near
    push esi
    push edi
    push ebp
    sub esp, 08h
    mov ebp, dword ptr [esp+030h]
    db 089h, 0c6h
    db 089h, 0d7h
    mov edx, dword ptr [esp+02ch]
    call Func57a00_
    test eax, eax
    jne near ptr L4f136
    mov eax, dword ptr [Dc6d50]
    mov dword ptr [esp], eax
    mov eax, dword ptr [esi]
    mov eax, dword ptr [eax]
    mov edx, dword ptr [esp]
    mov dword ptr [eax+02ah], edx
    mov eax, dword ptr [esi]
    mov eax, dword ptr [eax]
    mov dword ptr [eax+04eh], 00h
    mov eax, dword ptr [esi]
    mov eax, dword ptr [eax]
    mov dword ptr [eax+072h], 00h
    mov eax, dword ptr [esi]
    mov eax, dword ptr [eax]
    mov dword ptr [eax+0ah], edi
    mov eax, dword ptr [esi]
    mov eax, dword ptr [eax]
    mov dword ptr [eax+0eh], ebx
    mov eax, dword ptr [esi]
    mov eax, dword ptr [eax]
    mov edx, dword ptr [esp+028h]
    mov dword ptr [eax+032h], edx
    mov eax, dword ptr [esi]
    mov eax, dword ptr [eax]
    mov edx, dword ptr [esp+018h]
    mov dword ptr [eax+012h], edx
    mov eax, dword ptr [esi]
    mov eax, dword ptr [eax]
    mov dword ptr [eax+016h], ecx
    mov eax, dword ptr [esi]
    mov eax, dword ptr [eax]
    mov edx, dword ptr [esp+020h]
    mov dword ptr [eax+01ah], edx
    mov eax, dword ptr [esi]
    mov eax, dword ptr [eax]
    mov edx, dword ptr [esp+01ch]
    mov dword ptr [eax+01eh], edx
    mov eax, dword ptr [esi]
    mov eax, dword ptr [eax]
    mov edx, dword ptr [esp+024h]
    mov dword ptr [eax+022h], edx
    mov eax, dword ptr [esi]
    mov eax, dword ptr [eax]
    mov edx, dword ptr [esp+028h]
    mov dword ptr [eax+026h], edx
    mov eax, dword ptr [esi]
    mov eax, dword ptr [eax]
    mov dword ptr [eax+05ah], 00h
    mov eax, dword ptr [esi]
    mov eax, dword ptr [eax]
    mov dword ptr [eax+056h], 00h
    mov eax, dword ptr [esi]
    mov eax, dword ptr [eax]
    mov edx, dword ptr [esp+02ch]
    mov dword ptr [eax+03ah], edx
    mov edx, dword ptr [esp]
    mov eax, dword ptr [esi]
    inc edx
    mov eax, dword ptr [eax]
    mov dword ptr [Dc6d50], edx
    mov dl, byte ptr [eax+03ah]
    test dl, 020h
    jne short L4f08a
    test dl, 08h
    je short L4f08a
    db 088h, 0d1h
    and cl, 0f7h
    mov byte ptr [eax+03ah], cl
    mov eax, dword ptr [esi]
    mov eax, dword ptr [eax]
    or byte ptr [eax+03ah], 040h
L4f08a:
    mov eax, dword ptr [esi]
    mov eax, dword ptr [eax]
    test byte ptr [eax+03ah], 020h
    je short L4f0b2
    mov dword ptr [eax+05eh], 01h
    mov eax, dword ptr [esi]
    mov eax, dword ptr [eax]
    mov ecx, dword ptr [esp+034h]
    db 089h, 0ebh
    mov edx, dword ptr [eax+0eh]
    mov eax, dword ptr [eax+0ah]
    call Func57c5c_
    jmp short L4f10d
L4f0b2:
    db 089h, 0f9h
    and ecx, 07h
    db 089h, 0dah
    db 001h, 0f9h
    and edx, 07h
    mov dword ptr [esp+04h], ecx
    mov cl, byte ptr [eax+03ah]
    db 001h, 0dah
    test cl, 040h
    je short L4f0ef
    shr edi, 02h
    shr ebx, 02h
    imul ebx, edi
    mov eax, dword ptr [esp+04h]
    db 001h, 0c0h
    mov dword ptr [ebp+00h], eax
    mov eax, dword ptr [esp+034h]
    db 001h, 0d2h
    mov dword ptr [eax], edx
    lea eax, [ebx*4+00h]
    jmp short L4f10a
L4f0ef:
    mov eax, dword ptr [esp+04h]
    mov dword ptr [ebp+00h], eax
    mov eax, dword ptr [esp+034h]
    mov dword ptr [eax], edx
    db 089h, 0d8h
    shr edi, 03h
    shr eax, 03h
    imul eax, edi
    shl eax, 02h
L4f10a:
    add eax, 08h
L4f10d:
    mov edx, dword ptr [esi]
    mov edx, dword ptr [edx]
    add edx, 04ah
    call Func58398_
    db 089h, 0c3h
    test eax, eax
    je short L4f126
    mov eax, dword ptr [esi]
    call Func57b74_
L4f126:
    mov eax, dword ptr [esi]
    mov edx, dword ptr [esp+02ch]
    mov eax, dword ptr [eax]
    and edx, 0fh
    mov dword ptr [eax+036h], edx
    db 089h, 0d8h
L4f136:
    add esp, 08h
    pop ebp
    pop edi
    pop esi
    ret 020h
Func4efa0_ endp
    db 090h
Func4f140_ proc near
    push ecx
    push esi
    push edi
    push ebp
    db 089h, 0c6h
    db 089h, 0d5h
    db 089h, 0dfh
    cmp dword ptr [Dc6d4c], 01h
    jne short L4f15d
    mov eax, 023h
    pop ebp
    pop edi
    pop esi
    pop ecx
    ret
L4f15d:
    mov eax, dword ptr [eax]
    cmp dword ptr [eax+05eh], 00h
    je near ptr L4f1ee
    mov ecx, dword ptr [eax+056h]
    test ecx, ecx
    jne short L4f1ab
    mov dword ptr [eax+056h], 01h
    cmp dword ptr [B130115], 0fh
    jne short L4f192
    push 05h
    push ecx
    push 05h
    push 05h
    push 05h
    mov edx, 010h
    push 0ah
    jmp short L4f1a2
L4f192:
    push 05h
    push ecx
    push 06h
    push 05h
    push 05h
    mov edx, 010h
    push 0bh
L4f1a2:
    db 089h, 0f0h
    db 031h, 0dbh
    call Func4f5c4_
L4f1ab:
    push 00h
    push 00h
    push edi
    mov edx, dword ptr [esi]
    push edx
    push ebp
    mov ebx, dword ptr [edx+032h]
    push ebx
    mov ecx, dword ptr [edx+02eh]
    push ecx
    mov esi, dword ptr [edx+04ah]
    push esi
    mov edi, dword ptr [edx+036h]
    push edi
    mov ebp, dword ptr [edx+026h]
    push ebp
    db 089h, 0d0h
    mov edx, dword ptr [edx+022h]
    push edx
    mov ebx, dword ptr [eax+01ah]
    push ebx
    mov ecx, dword ptr [eax+01eh]
    mov edx, dword ptr [eax+0eh]
    push ecx
    mov ebx, dword ptr [eax+016h]
    mov ecx, dword ptr [eax+012h]
    mov eax, dword ptr [eax+0ah]
    call Func57c6c_
    db 031h, 0c0h
    pop ebp
    pop edi
    pop esi
    pop ecx
    ret
L4f1ee:
    cmp dword ptr [eax+056h], 00h
    jne short L4f25c
    mov edi, dword ptr [B130115]
    mov dword ptr [eax+056h], 01h
    cmp edi, 0fh
    jne short L4f232
    mov eax, dword ptr [esi]
    test byte ptr [eax+03ah], 040h
    je short L4f220
    mov edx, dword ptr [B1300f0]
    mov eax, dword ptr [B130108]
    call Func584c0_
    jmp short L4f25c
L4f220:
    mov edx, dword ptr [B1300f0]
    mov eax, dword ptr [B130108]
    call Func58570_
    jmp short L4f25c
L4f232:
    mov eax, dword ptr [esi]
    test byte ptr [eax+03ah], 040h
    je short L4f24c
    mov edx, dword ptr [B1300f0]
    mov eax, dword ptr [B130108]
    call Func584d0_
    jmp short L4f25c
L4f24c:
    mov edx, dword ptr [B1300f0]
    mov eax, dword ptr [B130108]
    call Func58580_
L4f25c:
    cmp dword ptr [B130115], 0fh
    jne short L4f2d3
    mov eax, dword ptr [esi]
    test byte ptr [eax+03ah], 040h
    je short L4f2a0
    mov esi, dword ptr [eax+04ah]
    mov edx, dword ptr [eax+03ah]
    push esi
    and edx, 01h
    push edx
    mov edi, dword ptr [eax+026h]
    push edi
    mov ebp, dword ptr [eax+022h]
    push ebp
    mov edx, dword ptr [eax+01ah]
    push edx
    mov ebx, dword ptr [eax+01eh]
    mov ecx, dword ptr [eax+012h]
    push ebx
    mov edx, dword ptr [eax+0eh]
    mov ebx, dword ptr [eax+016h]
    mov eax, dword ptr [eax+0ah]
    call Func584e0_
    db 031h, 0c0h
    pop ebp
    pop edi
    pop esi
    pop ecx
    ret
L4f2a0:
    mov edi, dword ptr [eax+04ah]
    mov edx, dword ptr [eax+03ah]
    push edi
    and edx, 01h
    push edx
    mov ebp, dword ptr [eax+026h]
    push ebp
    mov edx, dword ptr [eax+022h]
    push edx
    mov ebx, dword ptr [eax+01ah]
    push ebx
    mov ecx, dword ptr [eax+01eh]
    mov edx, dword ptr [eax+0eh]
    push ecx
    mov ebx, dword ptr [eax+016h]
    mov ecx, dword ptr [eax+012h]
    mov eax, dword ptr [eax+0ah]
    call Func58590_
    db 031h, 0c0h
    pop ebp
    pop edi
    pop esi
    pop ecx
    ret
L4f2d3:
    mov eax, dword ptr [esi]
    test byte ptr [eax+03ah], 040h
    je short L4f30e
    mov ebp, dword ptr [eax+04ah]
    mov edx, dword ptr [eax+03ah]
    push ebp
    and edx, 01h
    push edx
    mov edx, dword ptr [eax+026h]
    push edx
    mov ebx, dword ptr [eax+022h]
    push ebx
    mov ecx, dword ptr [eax+01ah]
    mov esi, dword ptr [eax+01eh]
    push ecx
    mov edx, dword ptr [eax+0eh]
    mov ebx, dword ptr [eax+016h]
    push esi
    mov ecx, dword ptr [eax+012h]
    mov eax, dword ptr [eax+0ah]
    call Func58514_
    db 031h, 0c0h
    pop ebp
    pop edi
    pop esi
    pop ecx
    ret
L4f30e:
    mov edx, dword ptr [eax+04ah]
    push edx
    mov edx, dword ptr [eax+03ah]
    and edx, 01h
    push edx
    mov ebx, dword ptr [eax+026h]
    push ebx
    mov ecx, dword ptr [eax+022h]
    push ecx
    mov esi, dword ptr [eax+01ah]
    mov edi, dword ptr [eax+01eh]
    push esi
    mov edx, dword ptr [eax+0eh]
    mov ebx, dword ptr [eax+016h]
    push edi
    mov ecx, dword ptr [eax+012h]
    mov eax, dword ptr [eax+0ah]
    call Func585c4_
    db 031h, 0c0h
    pop ebp
    pop edi
    pop esi
    pop ecx
    ret
Func4f140_ endp
    db 08dh, 040h, 000h
Func4f344_ proc near
    push esi
    push edi
    push ebp
    db 089h, 0c6h
    db 089h, 0d7h
    db 089h, 0dah
    mov eax, dword ptr [eax]
    cmp dword ptr [eax+05eh], 00h
    je short L4f37a
    push 00h
    mov ebp, dword ptr [esp+014h]
    push ebp
    push ecx
    db 089h, 0f8h
    call Func58674_
    push eax
    mov eax, dword ptr [esi]
    lea ebx, [eax+066h]
    mov ecx, dword ptr [eax+04ah]
    mov eax, dword ptr [eax+046h]
    add eax, 08h
    call Func57cc4_
    jmp short L4f3e4
L4f37a:
    mov ecx, dword ptr [B130115]
    lea ebx, [eax+066h]
    cmp ecx, 0fh
    jne short L4f3ba
    test byte ptr [eax+03ah], 040h
    je short L4f3a4
    mov ecx, dword ptr [eax+04ah]
    mov eax, dword ptr [eax+046h]
    add eax, 08h
    call Func584a0_
    db 031h, 0c0h
    pop ebp
    pop edi
    pop esi
    ret 04h
L4f3a4:
    mov ecx, dword ptr [eax+04ah]
    mov eax, dword ptr [eax+046h]
    add eax, 08h
    call Func58550_
    db 031h, 0c0h
    pop ebp
    pop edi
    pop esi
    ret 04h
L4f3ba:
    test byte ptr [eax+03ah], 040h
    je short L4f3d6
    mov ecx, dword ptr [eax+04ah]
    mov eax, dword ptr [eax+046h]
    add eax, 08h
    call Func584b0_
    db 031h, 0c0h
    pop ebp
    pop edi
    pop esi
    ret 04h
L4f3d6:
    mov ecx, dword ptr [eax+04ah]
    mov eax, dword ptr [eax+046h]
    add eax, 08h
    call Func58560_
L4f3e4:
    db 031h, 0c0h
    pop ebp
    pop edi
    pop esi
    ret 04h
Func4f344_ endp
Func4f3ec_ proc near
    push edx
    mov edx, 0110h
    mov eax, offset B1300e0
    call Func50784_
    test al, al
    jne short L4f407
    mov eax, 0dh
    pop edx
    ret
L4f407:
    mov edx, 0110h
    db 031h, 0c0h
    mov dword ptr [Dc6d4c], edx
    pop edx
    ret
Func4f3ec_ endp
    db 08bh, 0c0h
Func4f418_ proc near
    mov dword ptr [Dc6d4c], 01h
    call Func50be0_
    db 031h, 0c0h
    ret
Func4f418_ endp
_TEXT ends

_DATA segment
Dc6d4c label byte
    db 001h, 000h, 000h, 000h
Dc6d50 label byte
    db 000h, 000h, 000h, 000h
_DATA ends

_BSS segment
    db 4 dup(?)
B1300e0 label byte
    db 8 dup(?)
_Data1300e8 label byte
    db 8 dup(?)
B1300f0 label byte
    db 24 dup(?)
B130108 label byte
    db 13 dup(?)
B130115 label byte
    db 11 dup(?)
_BSS ends

    end

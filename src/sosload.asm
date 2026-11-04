    .586p

_TEXT segment word public use32 'CODE'
_TEXT ends
CONST segment dword public use32 'DATA'
CONST ends

    assume cs:FLAT, ds:FLAT, es:FLAT, ss:FLAT

    extrn Func56d2d_:near
    extrn Func56da7_:near
    extrn Func56e89_:near
    extrn Func56f81_:near
    extrn _Datac7e54:byte
    extrn _Datac7ed4:byte
    extrn _Datac7f54:byte
    extrn _Datac7f78:byte
    extrn _Datac7f98:byte
    extrn _Datac7fa4:byte
    extrn _Datac7fc8:byte
    extrn _Datac7fcc:byte
    extrn _Datac7fd1:byte
    extrn _Datac7fd4:byte
    extrn _Datac7fd8:byte
    extrn _dos_read_:near
    extrn _lseek_:near
    extrn close_:near
    extrn read_:near

    public Func568ce_
    public Func568e3_
    public Func56ac5_
    public Func56b8b_
    public Func56ba0_
    public Func56bb5_
    public Func56bf2_
    public Func56c26_
    public Func56c46_
    public Func56c66_
    public Func56c7b_
    public Func56c90_
    public Func56d15_

_TEXT segment
Func568ce_ proc near
    push ebx
    push ecx
    push edx
    push esi
    push edi
    push ebp
    db 089h, 0e5h
    db 081h, 0ech, 000h, 000h, 000h, 000h
    db 05dh
    db 05fh
    db 05eh
    db 05ah
    db 059h
    db 05bh
    db 0c3h
Func568ce_ endp
Func568e3_ proc near
    db 056h
    db 057h
    db 055h
    db 089h, 0e5h
    db 081h, 0ech, 024h, 000h, 000h, 000h
    db 089h, 045h, 0dch
    db 089h, 055h, 0e0h
    db 089h, 05dh, 0e4h
    db 089h, 04dh, 0e8h
    db 0c7h, 045h, 0f8h, 000h, 000h, 000h, 000h
    db 0c7h, 045h, 0f4h, 000h, 000h, 000h, 000h
    db 083h, 07dh, 0e0h, 005h
    db 076h, 00ch
    db 0c7h, 045h, 0ech, 00ah, 000h, 000h, 000h
    db 0e9h, 0a2h, 001h, 000h, 000h
L5691a:
    db 081h, 07dh, 0dch, 000h, 0e0h, 000h, 000h
    db 072h, 009h
    db 081h, 07dh, 0dch, 000h, 0e2h, 000h, 000h
    db 076h, 00ch
L5692c:
    db 0c7h, 045h, 0ech, 006h, 000h, 000h, 000h
    db 0e9h, 084h, 001h, 000h, 000h
L56938:
    mov edx, offset _Datac7e54
    mov eax, offset _Datac7ed4
    db 0e8h, 068h, 0ffh, 0ffh, 0ffh
    mov edx, offset Dc1488
    mov eax, offset _Datac7ed4
    db 0e8h, 08ch, 067h, 000h, 000h
    db 068h, 000h, 002h, 000h, 000h
    db 0b8h
    dd offset _Datac7ed4
    db 050h
    db 0e8h, 06eh, 054h, 0ffh, 0ffh
    db 083h, 0c4h, 008h
    db 089h, 045h, 0fch
    db 083h, 07dh, 0fch, 0ffh
    db 075h, 00ch
    db 0c7h, 045h, 0ech, 00fh, 000h, 000h, 000h
    db 0e9h, 03eh, 001h, 000h, 000h
L5697e:
    db 0bbh, 02ch, 000h, 000h, 000h
    db 0bah
    dd offset _Datac7f78
    db 08bh, 045h, 0fch
    db 0e8h, 085h, 067h, 000h, 000h
L56990:
    mov eax, dword ptr [ebp-08h]
    db 03bh, 005h
    dd offset _Datac7f98
    db 077h, 006h
    db 083h, 07dh, 0f4h, 000h
    db 074h, 005h
L569a1:
    db 0e9h, 007h, 001h, 000h, 000h
L569a6:
    mov ebx, 030h
    mov edx, offset _Datac7fa4
    mov eax, dword ptr [ebp-04h]
    call read_
    mov eax, dword ptr [_Datac7fcc]
    cmp eax, dword ptr [ebp-024h]
    jne short L569cb
    test byte ptr [_Datac7fd1], 080h
    jne short L569d0
L569cb:
    jmp near ptr L56a92
L569d0:
    mov dword ptr [ebp-0ch], 01h
    push dword ptr [ebp+018h]
    push dword ptr [ebp+010h]
    push dword ptr [_Datac7fc8]
    call Func56da7_
    db 089h, 0d3h
    db 089h, 0c1h
    add esp, 0ch
    mov eax, dword ptr [ebp-018h]
    mov word ptr [eax+04h], bx
    mov eax, dword ptr [ebp-018h]
    mov dword ptr [eax], ecx
    mov eax, dword ptr [ebp-018h]
    mov ax, word ptr [eax+04h]
    mov ecx, dword ptr [ebp-018h]
    mov edx, dword ptr [ecx]
    test edx, edx
    jne short L56a1c
    test ax, ax
    jne short L56a1c
    mov dword ptr [ebp-014h], 05h
    jmp near ptr L56abc
L56a1c:
    mov eax, dword ptr [ebp-018h]
    movzx eax, word ptr [eax+04h]
    push eax
    mov eax, dword ptr [ebp-018h]
    push dword ptr [eax]
    call Func56e89_
    db 089h, 0d3h
    db 089h, 0c1h
    add esp, 08h
    mov eax, dword ptr [ebp-01ch]
    mov word ptr [eax+04h], bx
    mov eax, dword ptr [ebp-01ch]
    mov dword ptr [eax], ecx
    push dword ptr [_Datac7fc8]
    mov ecx, dword ptr [ebp+018h]
    push dword ptr [ecx]
    call Func56d2d_
    add esp, 08h
    test eax, eax
    je short L56a61
    mov dword ptr [ebp-014h], 05h
    jmp short L56abc
L56a61:
    lea eax, [ebp-010h]
    push eax
    mov edx, dword ptr [_Datac7fc8]
    mov ebx, dword ptr [ebp-018h]
    mov bx, word ptr [ebx+04h]
    mov eax, dword ptr [ebp-018h]
    mov eax, dword ptr [eax]
    mov esi, dword ptr [ebp-04h]
    db 089h, 0d9h
    db 089h, 0c3h
    db 089h, 0f0h
    call _dos_read_
    mov dl, byte ptr [_Datac7fc8]
    mov eax, dword ptr [ebp+014h]
    mov byte ptr [eax], dl
    jmp short L56aa5
L56a92:
    mov ebx, 01h
    mov edx, dword ptr [_Datac7fc8]
    mov eax, dword ptr [ebp-04h]
    call _lseek_
L56aa5:
    inc dword ptr [ebp-08h]
    jmp near ptr L56990
L56aad:
    mov eax, dword ptr [ebp-04h]
    call close_
    mov dword ptr [ebp-014h], 00h
L56abc:
    mov eax, dword ptr [ebp-014h]
    leave
    pop edi
    pop esi
    ret 0ch
Func568e3_ endp
Func56ac5_ proc near
    push ebx
    push ecx
    push edx
    push esi
    push edi
    push ebp
    db 089h, 0e5h
    db 081h, 0ech, 00ch, 000h, 000h, 000h
    db 089h, 045h, 0f4h
    db 083h, 07dh, 0f4h, 005h
    db 076h, 00ch
    db 0c7h, 045h, 0f8h, 00ah, 000h, 000h, 000h
    db 0e9h, 099h, 000h, 000h, 000h
L56ae8:
    db 08bh, 045h, 0f4h
    db 0c1h, 0e0h, 002h
    mov eax, dword ptr [eax+_Datac7f54]
    db 089h, 045h, 0fch
    db 083h, 07dh, 0fch, 000h
    db 075h, 00ch
    db 0c7h, 045h, 0f8h, 00ah, 000h, 000h, 000h
    db 0e9h, 078h, 000h, 000h, 000h
L56b09:
    db 08bh, 045h, 0fch
    db 0ffh, 0b0h, 0e8h, 000h, 000h, 000h
    db 08bh, 045h, 0fch
    db 0ffh, 0b0h, 0ech, 000h, 000h, 000h
    db 0e8h, 04ah, 002h, 000h, 000h
    db 083h, 0c4h, 008h
    db 085h, 0c0h
    db 074h, 009h
    db 0c7h, 045h, 0f8h, 005h, 000h, 000h, 000h
    db 0ebh, 051h
L56b30:
    db 08bh, 045h, 0fch
    db 0ffh, 0b0h, 0fch, 000h, 000h, 000h
    db 08bh, 045h, 0fch
    db 00fh, 0b7h, 080h, 0dch, 000h, 000h, 000h
    db 050h
    db 08bh, 045h, 0fch
    db 0ffh, 0b0h, 0d8h, 000h, 000h, 000h
    db 0e8h, 001h, 003h, 000h, 000h
    db 083h, 0c4h, 00ch
    db 08bh, 045h, 0fch
    db 0ffh, 0b0h, 0fch, 000h, 000h, 000h
    db 08bh, 045h, 0fch
    db 00fh, 0b7h, 080h, 0e4h, 000h, 000h, 000h
    db 050h
    db 08bh, 045h, 0fch
    db 0ffh, 0b0h, 0e0h, 000h, 000h, 000h
    db 0e8h, 0dch, 002h, 000h, 000h
    db 083h, 0c4h, 00ch
    db 0c7h, 045h, 0f8h, 000h, 000h, 000h, 000h
L56b81:
    db 08bh, 045h, 0f8h
    leave
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
Func56ac5_ endp
Func56b8b_ proc near
    push ebx
    push ecx
    push edx
    push esi
    push edi
    push ebp
    db 089h, 0e5h
    db 081h, 0ech, 000h, 000h, 000h, 000h
    db 05dh
    db 05fh
    db 05eh
    db 05ah
    db 059h
    db 05bh
    db 0c3h
Func56b8b_ endp
Func56ba0_ proc near
    db 053h
    db 051h
    db 052h
    db 056h
    db 057h
    db 055h
    db 089h, 0e5h
    db 081h, 0ech, 000h, 000h, 000h, 000h
    db 05dh
    db 05fh
    db 05eh
    db 05ah
    db 059h
    db 05bh
    db 0c3h
Func56ba0_ endp
Func56bb5_ proc near
    db 053h
    db 051h
    db 052h
    db 056h
    db 057h
    db 055h
    db 089h, 0e5h
    db 081h, 0ech, 008h, 000h, 000h, 000h
    db 089h, 045h, 0f8h
    db 083h, 03dh
    dd offset _Datac7fd4
    db 000h
    je short L56bdd
    db 08bh, 045h, 0f8h
    db 0ffh, 015h
    dd offset _Datac7fd4
    mov dword ptr [ebp-04h], eax
    db 0ebh, 00bh
L56bdd:
    db 08bh, 045h, 0f8h
    db 0e8h, 0d8h, 00dh, 0ffh, 0ffh
    db 089h, 045h, 0fch
L56be8:
    db 08bh, 045h, 0fch
    db 0c9h
    db 05fh
    db 05eh
    db 05ah
    db 059h
    db 05bh
    db 0c3h
Func56bb5_ endp
Func56bf2_ proc near
    db 053h
    db 051h
    db 052h
    push esi
    push edi
    push ebp
    db 089h, 0e5h
    db 081h, 0ech, 004h, 000h, 000h, 000h
    db 089h, 045h, 0fch
    db 083h, 03dh
    dd offset _Datac7fd4
    db 000h
    db 074h, 00bh
    db 08bh, 045h, 0fch
    call dword ptr [_Datac7fd8]
    db 0ebh, 008h
L56c17:
    db 08bh, 045h, 0fch
    db 0e8h, 0e3h, 032h, 0ffh, 0ffh
L56c1f:
    db 0c9h
    db 05fh
    db 05eh
    db 05ah
    db 059h
    db 05bh
    db 0c3h
Func56bf2_ endp
Func56c26_ proc near
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
    db 0a3h
    dd offset _Datac7fd4
    db 0c9h
    db 05fh
    db 05eh
    db 05ah
    db 059h
    db 05bh
    db 0c3h
Func56c26_ endp
Func56c46_ proc near
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
    db 0a3h
    dd offset _Datac7fd8
    db 0c9h
    db 05fh
    db 05eh
    db 05ah
    db 059h
    db 05bh
    ret
Func56c46_ endp
Func56c66_ proc near
    push ebx
    push ecx
    push edx
    push esi
    push edi
    push ebp
    db 089h, 0e5h
    db 081h, 0ech, 000h, 000h, 000h, 000h
    db 05dh
    db 05fh
    db 05eh
    db 05ah
    db 059h
    db 05bh
    db 0c3h
Func56c66_ endp
Func56c7b_ proc near
    db 053h
    db 051h
    db 052h
    db 056h
    db 057h
    db 055h
    db 089h, 0e5h
    db 081h, 0ech, 000h, 000h, 000h, 000h
    db 05dh
    db 05fh
    db 05eh
    db 05ah
    db 059h
    db 05bh
    db 0c3h
Func56c7b_ endp
Func56c90_ proc near
    db 053h
    db 051h
    db 056h
    db 057h
    db 055h
    db 089h, 0e5h
    db 081h, 0ech, 010h, 000h, 000h, 000h
    db 089h, 045h, 0f0h
    db 089h, 055h, 0f4h
    mov eax, dword ptr [ebp-010h]
    db 0c1h, 0e0h, 002h
    db 08bh, 080h
    dd offset _Datac7f54
    db 089h, 045h, 0fch
    db 083h, 07dh, 0fch, 000h
    db 075h, 009h
    db 0c7h, 045h, 0f8h, 001h, 000h, 000h, 000h
    db 0ebh, 04bh
L56cc1:
    db 083h, 07dh, 0f4h, 000h
    db 074h, 035h
    db 0ffh, 075h, 0f4h
    db 08bh, 045h, 0fch
    db 00fh, 0b7h, 080h, 0dch, 000h, 000h, 000h
    db 050h
    mov eax, dword ptr [ebp-04h]
    db 0ffh, 0b0h, 0d8h, 000h, 000h, 000h
    db 08bh, 045h, 0fch
    db 00fh, 0b7h, 080h, 0e4h, 000h, 000h, 000h
    db 050h
    db 08bh, 045h, 0fch
    push dword ptr [eax+0e0h]
    call Func56f81_
    add esp, 014h
    jmp short L56d05
L56cfc:
    mov dword ptr [ebp-08h], 02h
    jmp short L56d0c
L56d05:
    mov dword ptr [ebp-08h], 00h
L56d0c:
    mov eax, dword ptr [ebp-08h]
    leave
    pop edi
    pop esi
    pop ecx
    pop ebx
    ret
Func56c90_ endp
Func56d15_ proc near
    push ebx
    push ecx
    push edx
    push esi
    push edi
    push ebp
    db 089h, 0e5h
    db 081h, 0ech, 000h, 000h, 000h, 000h
    db 05dh
    db 05fh
    db 05eh
    db 05ah
    db 059h
    db 05bh
    db 0c3h
Func56d15_ endp
_TEXT ends

CONST segment
Dc1488 label byte
    db "hmidrv.386"
    db 000h, 000h
CONST ends

    end

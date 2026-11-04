    .586p

_TEXT segment para public use32 'CODE'
_TEXT ends
_BSS segment dword public use32 'BSS'
_BSS ends

    assume cs:FLAT, ds:FLAT, es:FLAT, ss:FLAT

    extrn Func58f34_:near
    extrn Func58f48_:near
    extrn Func59064_:near
    extrn Func591ac_:near
    extrn Func59228_:near
    extrn _Dataa0000:byte

    public Func59290_
    public Func59338_
    public Func593e8_
    public Func5941c_
    public Func59458_
    public Func5949c_
    public Func594e0_
    public Func59526_
    public Func5954a_
    public Func59577_
    public Func59588_
    public Func59597_
    public Func595a4_
    public Func595b1_
    public Func595f3_
    public Func59604_
    public Func596c9_
    public Func5978e_
    public Func59885_
    public Func59891_
    public Func598b1_

_TEXT segment
    db "$Id: VESA.C 1.5 1995/06/15 11:50:08 MFC Exp $"
    db 000h, 08bh, 0c0h
Func59290_ proc near
    push ebx
    push ecx
    push edx
    push esi
    push edi
    sub esp, 08h
    db 089h, 0c7h
    lea ebx, [esp+04h]
    db 089h, 0e2h
    mov eax, 0200h
    call Func591ac_
    test al, al
    je near ptr L5932e
    mov eax, dword ptr [esp+04h]
    mov ecx, 04f00h
    mov ebx, offset B1304ac
    db 031h, 0d2h
    mov word ptr [B1304a0], ax
    mov word ptr [B1304c0], dx
    mov word ptr [B1304a6], dx
    mov word ptr [B1304ac], cx
    mov ecx, offset B1304a0
    mov eax, 010h
    db 089h, 0dah
    call Func59064_
    db 031h, 0c0h
    db 031h, 0d2h
    mov ax, word ptr [esp+04h]
    mov ecx, 0200h
    call Func58f34_
    db 089h, 0c6h
    push edi
    db 089h, 0c8h
    shr ecx, 02h
    db 0f2h, 0a5h
    mov cl, al
    and cl, 03h
    db 0f2h, 0a4h
    pop edi
    db 031h, 0c0h
    mov ax, word ptr [esp]
    call Func59228_
    cmp word ptr [B1304ac], 04fh
    je short L5932c
    db 030h, 0c0h
    jmp short L5932e
L5932c::
    mov al, 01h
L5932e::
    add esp, 08h
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
Func59290_ endp
    db 090h
Func59338_ proc near
    push ebx
    push ecx
    push esi
    push edi
    sub esp, 08h
    db 089h, 0c1h
    db 089h, 0d7h
    db 089h, 0e3h
    lea edx, [esp+04h]
    mov eax, 0200h
    call Func591ac_
    test al, al
    je near ptr L593dd
    mov eax, dword ptr [esp]
    mov esi, 04f01h
    mov ebx, offset B1304ac
    mov word ptr [B1304b4], cx
    db 031h, 0d2h
    mov ecx, offset B1304a0
    mov word ptr [B1304a0], ax
    mov word ptr [B1304c0], dx
    mov word ptr [B1304a6], dx
    mov eax, 010h
    db 089h, 0dah
    mov word ptr [B1304ac], si
    call Func59064_
    db 031h, 0c0h
    db 031h, 0d2h
    mov ax, word ptr [esp]
    mov ecx, 0200h
    call Func58f34_
    db 089h, 0c6h
    push edi
    db 089h, 0c8h
    shr ecx, 02h
    db 0f2h, 0a5h
    mov cl, al
    and cl, 03h
    db 0f2h, 0a4h
    pop edi
    db 031h, 0c0h
    mov ax, word ptr [esp+04h]
    call Func59228_
    cmp word ptr [B1304ac], 04fh
    je short L593db
    db 030h, 0c0h
    jmp short L593dd
L593db::
    mov al, 01h
L593dd::
    add esp, 08h
    pop edi
    pop esi
    pop ecx
    pop ebx
    ret
Func59338_ endp
    db 08dh, 040h, 000h
Func593e8_ proc near
    push ebx
    push edx
    mov edx, 04f02h
    mov ebx, offset B1304ac
    mov word ptr [B1304b0], ax
    mov eax, 010h
    mov word ptr [B1304ac], dx
    db 089h, 0dah
    call Func58f48_
    cmp word ptr [B1304ac], 04fh
    sete al
    pop edx
    pop ebx
    ret
Func593e8_ endp
    db 090h
Func5941c_ proc near
    push ebx
    push ecx
    push edx
    db 089h, 0c1h
    mov edx, 04f03h
    mov ebx, offset B1304ac
    mov eax, 010h
    mov word ptr [B1304ac], dx
    db 089h, 0dah
    call Func58f48_
    mov ax, word ptr [B1304b0]
    mov word ptr [ecx], ax
    cmp word ptr [B1304ac], 04fh
    sete al
    pop edx
    pop ecx
    pop ebx
    ret
Func5941c_ endp
    db 08bh, 0c0h
Func59458_ proc near
    push ebx
    push edx
    mov edx, 04f05h
    mov ebx, offset B1304ac
    mov word ptr [B1304b8], ax
    mov word ptr [B1304ac], dx
    db 030h, 0d2h
    mov eax, 010h
    mov byte ptr [B1304b1], dl
    mov byte ptr [B1304b0], dl
    db 089h, 0dah
    call Func58f48_
    cmp word ptr [B1304ac], 04fh
    sete al
    pop edx
    pop ebx
    ret
Func59458_ endp
    db 08dh, 040h, 000h
Func5949c_ proc near
    push ebx
    push edx
    mov edx, 04f05h
    mov ebx, offset B1304ac
    mov word ptr [B1304ac], dx
    db 030h, 0d2h
    mov word ptr [B1304b8], ax
    mov byte ptr [B1304b1], dl
    mov dh, 01h
    mov eax, 010h
    mov byte ptr [B1304b0], dh
    db 089h, 0dah
    call Func58f48_
    cmp word ptr [B1304ac], 04fh
    sete al
    pop edx
    pop ebx
    ret
Func5949c_ endp
    db 090h
Func594e0_ proc near
    push ebx
    mov ebx, 04f07h
    mov word ptr [B1304b4], ax
    mov word ptr [B1304ac], bx
    db 030h, 0dbh
    mov word ptr [B1304b8], dx
    mov byte ptr [B1304b1], bl
    mov byte ptr [B1304b0], bl
    mov ebx, offset B1304ac
    mov eax, 010h
    db 089h, 0dah
    call Func58f48_
    cmp word ptr [B1304ac], 04fh
    sete al
    pop ebx
    ret
Func594e0_ endp
Func59526_ proc near
    pusha
    mov dx, 03c8h
    mov al, 00h
    out dx, al
    mov cx, 0100h
    mov dx, 03c9h
L59536::
    mov al, byte ptr [esi]
    out dx, al
    mov al, byte ptr [esi+01h]
    out dx, al
    mov al, byte ptr [esi+02h]
    out dx, al
    add esi, 03h
    dec cx
    jne short L59536
    popa
    ret
Func59526_ endp
Func5954a_ proc near
    pusha
    mov dx, 03dah
L5954f::
    in al, dx
    and al, 08h
    jne short L5954f
    mov dx, 03c8h
    mov al, 00h
    out dx, al
    mov cx, 0100h
    mov dx, 03c9h
L59563::
    mov al, byte ptr [esi]
    out dx, al
    mov al, byte ptr [esi+01h]
    out dx, al
    mov al, byte ptr [esi+02h]
    out dx, al
    add esi, 03h
    dec cx
    jne short L59563
    popa
    ret
Func5954a_ endp
Func59577_ proc near
    cli
    mov dx, 03dah
L5957c::
    in al, dx
    and al, 08h
    jne short L5957c
L59581::
    in al, dx
    and al, 08h
    je short L59581
    sti
    ret
Func59577_ endp
Func59588_ proc near
    pusha
    in al, 061h
    db 088h, 0c4h
    or al, 080h
    out 061h, al
    db 086h, 0c4h
    out 061h, al
    popa
    ret
Func59588_ endp
Func59597_ proc near
    mov dx, 03dah
    in al, dx
    mov dx, 03c0h
    mov al, 00h
    out dx, al
    ret
Func59597_ endp
Func595a4_ proc near
    mov dx, 03dah
    in al, dx
    mov dx, 03c0h
    mov al, 020h
    out dx, al
    ret
Func595a4_ endp
Func595b1_ proc near
    pusha
    mov dx, 03ceh
    mov al, 05h
    out dx, al
    inc dx
    in al, dx
    and al, 0efh
    out dx, al
    dec dx
    mov al, 06h
    out dx, al
    inc dx
    in al, dx
    and al, 0fdh
    out dx, al
    mov dx, 03c4h
    mov al, 04h
    out dx, al
    inc dx
    in al, dx
    and al, 0f7h
    or al, 04h
    out dx, al
    mov dx, 03d4h
    mov al, 014h
    out dx, al
    inc dx
    in al, dx
    and al, 0bfh
    out dx, al
    dec dx
    mov al, 017h
    out dx, al
    inc dx
    in al, dx
    or al, 040h
    out dx, al
    popa
    ret
Func595b1_ endp
Func595f3_ proc near
    pusha
    mov cl, 040h
    mul cl
    db 088h, 0c4h
    mov dx, 03d4h
    mov al, 0ch
    out dx, ax
    popa
    ret
Func595f3_ endp
Func59604_ proc near
    pusha
    mov dword ptr [_Dataa0000+4], ebx
    cld
    db 089h, 0f5h
    mov ah, 01h
    mov al, 02h
    mov dx, 03c4h
    out dx, ax
    mov edi, 0a0000h
    add edi, dword ptr [_Dataa0000+4]
    mov ecx, 0fa0h
L59628::
    movs byte ptr es:[edi], byte ptr ds:[esi]
    add esi, 03h
    movs byte ptr es:[edi], byte ptr ds:[esi]
    add esi, 03h
    movs byte ptr es:[edi], byte ptr ds:[esi]
    add esi, 03h
    movs byte ptr es:[edi], byte ptr ds:[esi]
    add esi, 03h
    loop L59628
    inc ebp
    db 089h, 0eeh
    mov ah, 02h
    mov al, 02h
    mov dx, 03c4h
    out dx, ax
    mov edi, 0a0000h
    add edi, dword ptr [_Dataa0000+4]
    mov ecx, 0fa0h
L59657::
    movs byte ptr es:[edi], byte ptr ds:[esi]
    add esi, 03h
    movs byte ptr es:[edi], byte ptr ds:[esi]
    add esi, 03h
    movs byte ptr es:[edi], byte ptr ds:[esi]
    add esi, 03h
    movs byte ptr es:[edi], byte ptr ds:[esi]
    add esi, 03h
    loop L59657
    inc ebp
    db 089h, 0eeh
    mov ah, 04h
    mov al, 02h
    mov dx, 03c4h
    out dx, ax
    mov edi, 0a0000h
    add edi, dword ptr [_Dataa0000+4]
    mov ecx, 0fa0h
L59686::
    movs byte ptr es:[edi], byte ptr ds:[esi]
    add esi, 03h
    movs byte ptr es:[edi], byte ptr ds:[esi]
    add esi, 03h
    movs byte ptr es:[edi], byte ptr ds:[esi]
    add esi, 03h
    movs byte ptr es:[edi], byte ptr ds:[esi]
    add esi, 03h
    loop L59686
    inc ebp
    db 089h, 0eeh
    mov ah, 08h
    mov al, 02h
    mov dx, 03c4h
    out dx, ax
    mov edi, 0a0000h
    add edi, dword ptr [_Dataa0000+4]
    mov ecx, 0fa0h
L596b5::
    movs byte ptr es:[edi], byte ptr ds:[esi]
    add esi, 03h
    movs byte ptr es:[edi], byte ptr ds:[esi]
    add esi, 03h
    movs byte ptr es:[edi], byte ptr ds:[esi]
    add esi, 03h
    movs byte ptr es:[edi], byte ptr ds:[esi]
    add esi, 03h
    loop L596b5
    popa
    ret
Func59604_ endp
Func596c9_ proc near
    pusha
    mov dword ptr [_Dataa0000+4], ebx
    cld
    db 089h, 0f5h
    mov ah, 01h
    mov al, 02h
    mov dx, 03c4h
    out dx, ax
    mov edi, 0a0000h
    add edi, dword ptr [_Dataa0000+4]
    mov ecx, 012c0h
L596ed::
    movs byte ptr es:[edi], byte ptr ds:[esi]
    add esi, 03h
    movs byte ptr es:[edi], byte ptr ds:[esi]
    add esi, 03h
    movs byte ptr es:[edi], byte ptr ds:[esi]
    add esi, 03h
    movs byte ptr es:[edi], byte ptr ds:[esi]
    add esi, 03h
    loop L596ed
    inc ebp
    db 089h, 0eeh
    mov ah, 02h
    mov al, 02h
    mov dx, 03c4h
    out dx, ax
    mov edi, 0a0000h
    add edi, dword ptr [_Dataa0000+4]
    mov ecx, 012c0h
L5971c::
    movs byte ptr es:[edi], byte ptr ds:[esi]
    add esi, 03h
    movs byte ptr es:[edi], byte ptr ds:[esi]
    add esi, 03h
    movs byte ptr es:[edi], byte ptr ds:[esi]
    add esi, 03h
    movs byte ptr es:[edi], byte ptr ds:[esi]
    add esi, 03h
    loop L5971c
    inc ebp
    db 089h, 0eeh
    mov ah, 04h
    mov al, 02h
    mov dx, 03c4h
    out dx, ax
    mov edi, 0a0000h
    add edi, dword ptr [_Dataa0000+4]
    mov ecx, 012c0h
L5974b::
    movs byte ptr es:[edi], byte ptr ds:[esi]
    add esi, 03h
    movs byte ptr es:[edi], byte ptr ds:[esi]
    add esi, 03h
    movs byte ptr es:[edi], byte ptr ds:[esi]
    add esi, 03h
    movs byte ptr es:[edi], byte ptr ds:[esi]
    add esi, 03h
    loop L5974b
    inc ebp
    db 089h, 0eeh
    mov ah, 08h
    mov al, 02h
    mov dx, 03c4h
    out dx, ax
    mov edi, 0a0000h
    add edi, dword ptr [_Dataa0000+4]
    mov ecx, 012c0h
L5977a::
    movs byte ptr es:[edi], byte ptr ds:[esi]
    add esi, 03h
    movs byte ptr es:[edi], byte ptr ds:[esi]
    add esi, 03h
    movs byte ptr es:[edi], byte ptr ds:[esi]
    add esi, 03h
    movs byte ptr es:[edi], byte ptr ds:[esi]
    add esi, 03h
    loop L5977a
    popa
    ret
Func596c9_ endp
Func5978e_ proc near
    pusha
    mov dword ptr [_Dataa0000+4], ebx
    cld
    add esi, 03020h
    db 089h, 0f5h
    mov ah, 01h
    mov al, 02h
    mov dx, 03c4h
    out dx, ax
    mov edi, 0a0000h
    add edi, dword ptr [_Dataa0000+4]
    mov dx, 0c8h
L597b7::
    mov ecx, 014h
L597bc::
    movs byte ptr es:[edi], byte ptr ds:[esi]
    add esi, 03h
    movs byte ptr es:[edi], byte ptr ds:[esi]
    add esi, 03h
    movs byte ptr es:[edi], byte ptr ds:[esi]
    add esi, 03h
    movs byte ptr es:[edi], byte ptr ds:[esi]
    add esi, 03h
    loop L597bc
    add esi, 040h
    dec dx
    jne short L597b7
    inc ebp
    db 089h, 0eeh
    mov ah, 02h
    mov al, 02h
    mov dx, 03c4h
    out dx, ax
    mov edi, 0a0000h
    add edi, dword ptr [_Dataa0000+4]
    mov dx, 0c8h
L597f1::
    mov ecx, 014h
L597f6::
    movs byte ptr es:[edi], byte ptr ds:[esi]
    add esi, 03h
    movs byte ptr es:[edi], byte ptr ds:[esi]
    add esi, 03h
    movs byte ptr es:[edi], byte ptr ds:[esi]
    add esi, 03h
    movs byte ptr es:[edi], byte ptr ds:[esi]
    add esi, 03h
    loop L597f6
    add esi, 040h
    dec dx
    jne short L597f1
    inc ebp
    db 089h, 0eeh
    mov ah, 04h
    mov al, 02h
    mov dx, 03c4h
    out dx, ax
    mov edi, 0a0000h
    add edi, dword ptr [_Dataa0000+4]
    mov dx, 0c8h
L5982b::
    mov ecx, 014h
L59830::
    movs byte ptr es:[edi], byte ptr ds:[esi]
    add esi, 03h
    movs byte ptr es:[edi], byte ptr ds:[esi]
    add esi, 03h
    movs byte ptr es:[edi], byte ptr ds:[esi]
    add esi, 03h
    movs byte ptr es:[edi], byte ptr ds:[esi]
    add esi, 03h
    loop L59830
    add esi, 040h
    dec dx
    jne short L5982b
    inc ebp
    db 089h, 0eeh
    mov ah, 08h
    mov al, 02h
    mov dx, 03c4h
    out dx, ax
    mov edi, 0a0000h
    add edi, dword ptr [_Dataa0000+4]
    mov dx, 0c8h
L59865::
    mov ecx, 014h
L5986a::
    movs byte ptr es:[edi], byte ptr ds:[esi]
    add esi, 03h
    movs byte ptr es:[edi], byte ptr ds:[esi]
    add esi, 03h
    movs byte ptr es:[edi], byte ptr ds:[esi]
    add esi, 03h
    movs byte ptr es:[edi], byte ptr ds:[esi]
    add esi, 03h
    loop L5986a
    add esi, 040h
    dec dx
    jne short L59865
    popa
    ret
Func5978e_ endp
Func59885_ proc near
    pusha
L59886::
    mov dx, 03dah
    in al, dx
    and al, 08h
    je short L59886
    popa
    ret
Func59885_ endp
Func59891_ proc near
    pusha
    cld
    db 089h, 0fah
    neg edx
    add edx, 0a0000h
    mov ecx, 03e80h
L598a2::
    repz cmps dword ptr ds:[esi], dword ptr es:[edi]
    mov eax, dword ptr [esi-04h]
    mov dword ptr [edi+edx*1-04h], eax
    jecxz L598af
    jmp short L598a2
L598af::
    popa
    ret
Func59891_ endp
Func598b1_ proc near
    pusha
    cld
    add esi, 03020h
    add edi, 03020h
    db 089h, 0fah
    neg edx
    add edx, 0a0000h
    mov ebp, 0c8h
L598ce::
    mov ecx, 050h
L598d3::
    repz cmps dword ptr ds:[esi], dword ptr es:[edi]
    mov eax, dword ptr [esi-04h]
    mov dword ptr [edi+edx*1-04h], eax
    jecxz L598e0
    jmp short L598d3
L598e0::
    add esi, 040h
    add edi, 040h
    sub edx, 040h
    dec ebp
    jne short L598ce
    popa
    ret
Func598b1_ endp
_TEXT ends

_BSS segment
B1304a0 label byte
    db 6 dup(?)
B1304a6 label byte
    db 6 dup(?)
B1304ac label byte
    db 4 dup(?)
B1304b0 label byte
    db 1 dup(?)
B1304b1 label byte
    db 3 dup(?)
B1304b4 label byte
    db 4 dup(?)
B1304b8 label byte
    db 8 dup(?)
B1304c0 label byte
    db 8 dup(?)
_BSS ends

    end

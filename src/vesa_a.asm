    .386p

_TEXT segment byte public use32 'CODE'
_TEXT ends
OBJ3 segment para public use32 'OBJ3DATA'
OBJ3 ends

    .model flat

    assume cs:FLAT, ds:FLAT, es:FLAT, ss:FLAT

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
    public _Dataa0000

_TEXT segment
Func59526_ proc near
    pushad
    mov dx, 03c8h
    mov al, 00h
    out dx, al
    mov cx, 0100h
    mov dx, 03c9h
L59536:
    mov al, byte ptr [esi]
    out dx, al
    mov al, byte ptr [esi+01h]
    out dx, al
    mov al, byte ptr [esi+02h]
    out dx, al
    add esi, 03h
    dec cx
    jne short L59536
    popad
    ret
Func59526_ endp
Func5954a_ proc near
    pushad
    mov dx, 03dah
L5954f:
    in al, dx
    and al, 08h
    jne short L5954f
    mov dx, 03c8h
    mov al, 00h
    out dx, al
    mov cx, 0100h
    mov dx, 03c9h
L59563:
    mov al, byte ptr [esi]
    out dx, al
    mov al, byte ptr [esi+01h]
    out dx, al
    mov al, byte ptr [esi+02h]
    out dx, al
    add esi, 03h
    dec cx
    jne short L59563
    popad
    ret
Func5954a_ endp
Func59577_ proc near
    cli
    mov dx, 03dah
L5957c:
    in al, dx
    and al, 08h
    jne short L5957c
L59581:
    in al, dx
    and al, 08h
    je short L59581
    sti
    ret
Func59577_ endp
Func59588_ proc near
    pushad
    in al, 061h
    mov ah,al
    or al, 080h
    out 061h, al
    xchg ah,al
    out 061h, al
    popad
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
    pushad
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
    popad
    ret
Func595b1_ endp
Func595f3_ proc near
    pushad
    mov cl, 040h
    mul cl
    mov ah,al
    mov dx, 03d4h
    mov al, 0ch
    out dx, ax
    popad
    ret
Func595f3_ endp
Func59604_ proc near
    pushad
    mov dword ptr [Da0004], ebx
    cld
    mov ebp,esi
    mov ah, 01h
    mov al, 02h
    mov dx, 03c4h
    out dx, ax
    mov edi, 0a0000h
    add edi, dword ptr [Da0004]
    mov ecx, 0fa0h
L59628:
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
    mov esi,ebp
    mov ah, 02h
    mov al, 02h
    mov dx, 03c4h
    out dx, ax
    mov edi, 0a0000h
    add edi, dword ptr [Da0004]
    mov ecx, 0fa0h
L59657:
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
    mov esi,ebp
    mov ah, 04h
    mov al, 02h
    mov dx, 03c4h
    out dx, ax
    mov edi, 0a0000h
    add edi, dword ptr [Da0004]
    mov ecx, 0fa0h
L59686:
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
    mov esi,ebp
    mov ah, 08h
    mov al, 02h
    mov dx, 03c4h
    out dx, ax
    mov edi, 0a0000h
    add edi, dword ptr [Da0004]
    mov ecx, 0fa0h
L596b5:
    movs byte ptr es:[edi], byte ptr ds:[esi]
    add esi, 03h
    movs byte ptr es:[edi], byte ptr ds:[esi]
    add esi, 03h
    movs byte ptr es:[edi], byte ptr ds:[esi]
    add esi, 03h
    movs byte ptr es:[edi], byte ptr ds:[esi]
    add esi, 03h
    loop L596b5
    popad
    ret
Func59604_ endp
Func596c9_ proc near
    pushad
    mov dword ptr [Da0004], ebx
    cld
    mov ebp,esi
    mov ah, 01h
    mov al, 02h
    mov dx, 03c4h
    out dx, ax
    mov edi, 0a0000h
    add edi, dword ptr [Da0004]
    mov ecx, 012c0h
L596ed:
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
    mov esi,ebp
    mov ah, 02h
    mov al, 02h
    mov dx, 03c4h
    out dx, ax
    mov edi, 0a0000h
    add edi, dword ptr [Da0004]
    mov ecx, 012c0h
L5971c:
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
    mov esi,ebp
    mov ah, 04h
    mov al, 02h
    mov dx, 03c4h
    out dx, ax
    mov edi, 0a0000h
    add edi, dword ptr [Da0004]
    mov ecx, 012c0h
L5974b:
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
    mov esi,ebp
    mov ah, 08h
    mov al, 02h
    mov dx, 03c4h
    out dx, ax
    mov edi, 0a0000h
    add edi, dword ptr [Da0004]
    mov ecx, 012c0h
L5977a:
    movs byte ptr es:[edi], byte ptr ds:[esi]
    add esi, 03h
    movs byte ptr es:[edi], byte ptr ds:[esi]
    add esi, 03h
    movs byte ptr es:[edi], byte ptr ds:[esi]
    add esi, 03h
    movs byte ptr es:[edi], byte ptr ds:[esi]
    add esi, 03h
    loop L5977a
    popad
    ret
Func596c9_ endp
Func5978e_ proc near
    pushad
    mov dword ptr [Da0004], ebx
    cld
    add esi, 03020h
    mov ebp,esi
    mov ah, 01h
    mov al, 02h
    mov dx, 03c4h
    out dx, ax
    mov edi, 0a0000h
    add edi, dword ptr [Da0004]
    mov dx, 0c8h
L597b7:
    mov ecx, 014h
L597bc:
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
    mov esi,ebp
    mov ah, 02h
    mov al, 02h
    mov dx, 03c4h
    out dx, ax
    mov edi, 0a0000h
    add edi, dword ptr [Da0004]
    mov dx, 0c8h
L597f1:
    mov ecx, 014h
L597f6:
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
    mov esi,ebp
    mov ah, 04h
    mov al, 02h
    mov dx, 03c4h
    out dx, ax
    mov edi, 0a0000h
    add edi, dword ptr [Da0004]
    mov dx, 0c8h
L5982b:
    mov ecx, 014h
L59830:
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
    mov esi,ebp
    mov ah, 08h
    mov al, 02h
    mov dx, 03c4h
    out dx, ax
    mov edi, 0a0000h
    add edi, dword ptr [Da0004]
    mov dx, 0c8h
L59865:
    mov ecx, 014h
L5986a:
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
    popad
    ret
Func5978e_ endp
Func59885_ proc near
    pushad
L59886:
    mov dx, 03dah
    in al, dx
    and al, 08h
    je short L59886
    popad
    ret
Func59885_ endp
Func59891_ proc near
    pushad
    cld
    mov edx,edi
    neg edx
    add edx, 0a0000h
    mov ecx, 03e80h
L598a2:
    repe cmpsd
    mov eax, dword ptr [esi-04h]
    mov dword ptr [edi+edx*1-04h], eax
    jecxz L598af
    jmp short L598a2
L598af:
    popad
    ret
Func59891_ endp
Func598b1_ proc near
    pushad
    cld
    add esi, 03020h
    add edi, 03020h
    mov edx,edi
    neg edx
    add edx, 0a0000h
    mov ebp, 0c8h
L598ce:
    mov ecx, 050h
L598d3:
    repe cmpsd
    mov eax, dword ptr [esi-04h]
    mov dword ptr [edi+edx*1-04h], eax
    jecxz L598e0
    jmp short L598d3
L598e0:
    add esi, 040h
    add edi, 040h
    sub edx, 040h
    dec ebp
    jne short L598ce
    popad
    ret
Func598b1_ endp
_TEXT ends

OBJ3 segment
_Dataa0000 dd 0
Da0004 dd 0
OBJ3 ends

    end

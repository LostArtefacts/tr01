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
    extrn memset_:near

    public Func58b10_
    public Func58b34_
    public Func58b58_
    public Func58c38_
    public Func58c6c_
    public Func58cb4_
    public Func58d18_
    public Func58d4c_
    public Func58d78_
    public Func58da8_
    public Func58de8_
    public Func58e28_
    public Func58e78_
    public Func58ecc_

_TEXT segment
    db "$Id: VGA.C 1.8 1995/10/25 14:57:33 MFC Exp $"
    db 000h, 08dh, 040h, 000h
Func58b10_ proc near
    push ebx
    push edx
    mov edx, 013h
    mov ebx, offset B13041c
    mov eax, 010h
    mov word ptr [B13041c], dx
    db 089h, 0dah
    call Func58f48_
    pop edx
    pop ebx
    ret
Func58b10_ endp
    db 08bh, 0c0h
Func58b34_ proc near
    push ebx
    push edx
    mov edx, 03h
    mov ebx, offset B13041c
    mov eax, 010h
    mov word ptr [B13041c], dx
    db 089h, 0dah
    call Func58f48_
    pop edx
    pop ebx
    ret
Func58b34_ endp
    db 08bh, 0c0h
Func58b58_ proc near
    push ecx
    push esi
    push edi
    sub esp, 08h
    db 089h, 0c6h
    mov dword ptr [esp+04h], edx
    mov dword ptr [esp], ebx
    cmp ebx, 0100h
    jge short L58b73
    db 089h, 0d9h
    jmp short L58b78
L58b73::
    mov ecx, 0100h
L58b78::
    lea eax, [ecx*4+00h]
    db 029h, 0c8h
    mov ebx, offset B130438
    db 089h, 0c1h
    db 031h, 0c0h
    mov edx, offset B13043a
    db 066h, 089h, 0c8h
    call Func591ac_
    test al, al
    je near ptr L58c30
    db 031h, 0c0h
    db 031h, 0d2h
    mov ax, word ptr [B130438]
    call Func58f34_
    db 089h, 0c7h
    mov ebx, dword ptr [esp]
    push edi
    db 089h, 0c8h
    shr ecx, 02h
    db 0f2h, 0a5h
    mov cl, al
    and cl, 03h
    db 0f2h, 0a4h
    pop edi
    db 031h, 0d2h
    mov ax, word ptr [B130438]
    mov word ptr [B130428], dx
    mov word ptr [B130410], ax
    cmp ebx, 0100h
    jge short L58be4
    db 089h, 0d8h
    jmp short L58be9
L58be4::
    mov eax, 0100h
L58be9::
    mov ebx, 01012h
    mov ecx, offset B130410
    mov dword ptr [esp], eax
    mov eax, dword ptr [esp+04h]
    mov word ptr [B13041c], bx
    mov ebx, offset B13041c
    mov word ptr [B130420], ax
    mov eax, dword ptr [esp]
    db 089h, 0dah
    mov word ptr [B130424], ax
    mov eax, 010h
    call Func59064_
    db 031h, 0c0h
    mov ax, word ptr [B13043a]
    call Func59228_
    mov al, 01h
L58c30::
    add esp, 08h
    pop edi
    pop esi
    pop ecx
    ret
Func58b58_ endp
    db 090h
Func58c38_ proc near
    mov ah, 02h
    mov byte ptr [B130429], bl
    db 030h, 0f6h
    mov ebx, offset B13041c
    mov byte ptr [B13041d], ah
    mov byte ptr [B13041c], dh
    mov byte ptr [B130421], al
    mov byte ptr [B130428], dl
    mov eax, 010h
    db 089h, 0dah
    jmp near ptr Func58f48_
Func58c38_ endp
    db 08bh, 0c0h
Func58c6c_ proc near
    push ecx
    push esi
    db 089h, 0d6h
    db 089h, 0d9h
    mov ah, 03h
    mov ebx, offset B13041c
    db 030h, 0d2h
    mov byte ptr [B13041d], ah
    mov byte ptr [B13041c], dl
    mov byte ptr [B130421], al
    mov eax, 010h
    db 089h, 0dah
    call Func58f48_
    test ecx, ecx
    je short L58ca3
    mov al, byte ptr [B130429]
    mov byte ptr [ecx], al
L58ca3::
    test esi, esi
    je short L58cae
    mov al, byte ptr [B130428]
    mov byte ptr [esi], al
L58cae::
    pop esi
    pop ecx
    ret
Func58c6c_ endp
    db 08dh, 040h, 000h
Func58cb4_ proc near
    test al, al
    jl short L58cc7
    mov bh, 06h
    mov byte ptr [B13041c], al
    mov byte ptr [B13041d], bh
    jmp short L58cde
L58cc7::
    mov ah, 07h
    db 088h, 0c6h
    mov byte ptr [B13041c], al
    neg dh
    mov byte ptr [B13041d], ah
    mov byte ptr [B13041c], dh
L58cde::
    mov al, byte ptr [esp+04h]
    mov byte ptr [B130421], dl
    mov byte ptr [B130425], bl
    mov ebx, offset B13041c
    mov byte ptr [B130429], al
    mov al, byte ptr [esp+08h]
    db 089h, 0dah
    mov byte ptr [B130428], al
    mov eax, 010h
    mov byte ptr [B130424], cl
    call Func58f48_
    ret 08h
Func58cb4_ endp
    db 08bh, 0c0h
Func58d18_ proc near
    mov ah, 09h
    mov byte ptr [B130421], dl
    mov byte ptr [B130420], bl
    mov ebx, offset B13041c
    mov byte ptr [B13041d], ah
    mov byte ptr [B13041c], al
    mov eax, 010h
    db 089h, 0dah
    mov word ptr [B130424], cx
    jmp near ptr Func58f48_
Func58d18_ endp
    db 08dh, 040h, 000h
Func58d4c_ proc near
    mov ah, 0eh
    mov byte ptr [B130421], dl
    mov byte ptr [B130420], bl
    mov ebx, offset B13041c
    mov byte ptr [B13041d], ah
    mov byte ptr [B13041c], al
    mov eax, 010h
    db 089h, 0dah
    jmp near ptr Func58f48_
Func58d4c_ endp
    db 08bh, 0c0h
Func58d78_ proc near
    push ebx
    mov ebx, 0101bh
    db 030h, 0e4h
    mov word ptr [B13041c], bx
    mov word ptr [B130420], ax
    db 088h, 0d0h
    mov ebx, offset B13041c
    mov word ptr [B130424], ax
    db 089h, 0dah
    mov eax, 010h
    call Func58f48_
    pop ebx
    ret
Func58d78_ endp
Func58da8_ proc near
    push ebx
    push edx
    mov ah, 012h
    mov dl, 033h
    mov byte ptr [B13041d], ah
    mov byte ptr [B130420], dl
    test al, al
    setne al
    and eax, 0ffh
    mov ebx, offset B13041c
    mov byte ptr [B13041c], al
    db 089h, 0dah
    mov eax, 010h
    call Func58f48_
    cmp byte ptr [B13041c], 012h
    sete al
    pop edx
    pop ebx
    ret
Func58da8_ endp
    db 090h
Func58de8_ proc near
    push ebx
    push edx
    mov ah, 012h
    mov dl, 034h
    mov byte ptr [B13041d], ah
    mov byte ptr [B130420], dl
    test al, al
    setne al
    and eax, 0ffh
    mov ebx, offset B13041c
    mov byte ptr [B13041c], al
    db 089h, 0dah
    mov eax, 010h
    call Func58f48_
    cmp byte ptr [B13041c], 012h
    sete al
    pop edx
    pop ebx
    ret
Func58de8_ endp
    db 090h
Func58e28_ proc near
    push edx
    call Func58e78_
    mov al, 0e3h
    mov edx, 03c2h
    out dx, al
    mov eax, 02c11h
    mov edx, 03d4h
    out dx, ax
    mov eax, 0d06h
    out dx, ax
    mov eax, 03e07h
    out dx, ax
    mov eax, 0ea10h
    out dx, ax
    mov eax, 0ac11h
    out dx, ax
    mov eax, 0df12h
    out dx, ax
    mov eax, 0e715h
    out dx, ax
    mov eax, 0616h
    out dx, ax
    pop edx
    ret
Func58e28_ endp
    db 08dh, 040h, 000h
Func58e78_ proc near
    push ebx
    push ecx
    push edx
    mov eax, 0a000h
    db 031h, 0d2h
    call Func58f34_
    mov edx, 03c4h
    db 089h, 0c1h
    mov eax, 0604h
    out dx, ax
    mov eax, 0e317h
    mov edx, 03d4h
    out dx, ax
    mov eax, 014h
    out dx, ax
    mov eax, 0f02h
    mov edx, 03c4h
    mov ebx, 0ffffh
    out dx, ax
    lea eax, [ecx+01h]
    db 031h, 0d2h
    call memset_
    mov byte ptr [ecx], 00h
    pop edx
    pop ecx
    pop ebx
    ret
Func58e78_ endp
    db 08bh, 0c0h
Func58ecc_ proc near
    push ebx
    push edx
    db 089h, 0c3h
    mov al, 0ch
    mov edx, 03d4h
    out dx, al
    db 089h, 0d8h
    mov edx, 03d5h
    shr eax, 08h
    out dx, al
    mov al, 0dh
    mov edx, 03d4h
    out dx, al
    db 089h, 0d8h
    mov edx, 03d5h
    and eax, 0ffh
    out dx, al
    pop edx
    pop ebx
    ret
Func58ecc_ endp
_TEXT ends

_BSS segment
    db 8 dup(?)
B130410 label byte
    db 12 dup(?)
B13041c label byte
    db 1 dup(?)
B13041d label byte
    db 3 dup(?)
B130420 label byte
    db 1 dup(?)
B130421 label byte
    db 3 dup(?)
B130424 label byte
    db 1 dup(?)
B130425 label byte
    db 3 dup(?)
B130428 label byte
    db 1 dup(?)
B130429 label byte
    db 15 dup(?)
B130438 label byte
    db 2 dup(?)
B13043a label byte
    db 6 dup(?)
_BSS ends

    end

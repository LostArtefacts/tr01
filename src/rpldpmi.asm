    .586p

_TEXT segment para public use32 'CODE'
_TEXT ends
_BSS segment dword public use32 'BSS'
_BSS ends

    assume cs:FLAT, ds:FLAT, es:FLAT, ss:FLAT

    extrn int386_:near
    extrn int386x_:near
    extrn memset_:near

    public Func58f34_
    public Func58f48_
    public Func59064_
    public Func591ac_
    public Func59228_

_TEXT segment
    db "$Id: RPLDPMI.C 1.4 1995/06/15 11:50:08 MFC Exp $"
    db 000h, 08dh, 040h, 000h
Func58f34_ proc near
    push ecx
    db 031h, 0c9h
    db 066h, 089h, 0d1h
    and eax, 0ffffh
    add ecx, 04h
    shl eax, cl
    pop ecx
    ret
Func58f34_ endp
    db 08bh, 0c0h
Func58f48_ proc near
    push ecx
    push esi
    sub esp, 04h
    mov dword ptr [esp], eax
    db 089h, 0d1h
    db 089h, 0deh
    mov ebx, 032h
    mov eax, offset B130468
    db 031h, 0d2h
    call memset_
    db 031h, 0c0h
    mov ax, word ptr [ecx]
    mov dword ptr [B130484], eax
    db 031h, 0c0h
    mov ax, word ptr [ecx+04h]
    mov dword ptr [B130478], eax
    db 031h, 0c0h
    mov ax, word ptr [ecx+08h]
    mov dword ptr [B130480], eax
    db 031h, 0c0h
    mov ax, word ptr [ecx+0ch]
    mov dword ptr [B13047c], eax
    db 031h, 0c0h
    mov ax, word ptr [ecx+014h]
    mov edx, 0300h
    mov dword ptr [B130468], eax
    db 031h, 0c0h
    db 031h, 0dbh
    mov ax, word ptr [ecx+010h]
    mov word ptr [B130440], dx
    mov dword ptr [B13046c], eax
    mov ax, word ptr [ecx+018h]
    mov word ptr [B130448], bx
    mov word ptr [B130488], ax
    mov al, byte ptr [esp]
    mov ebx, offset B130440
    mov byte ptr [B130444], al
    db 030h, 0e4h
    mov edx, ds
    mov byte ptr [B130445], ah
    mov eax, offset B130468
    mov ecx, offset B13045c
    mov word ptr [B13045c], dx
    mov edx, offset B130468
    mov eax, 031h
    mov dword ptr [B130454], edx
    db 089h, 0dah
    call int386x_
    mov ax, word ptr [B130484]
    mov word ptr [esi], ax
    mov ax, word ptr [B130478]
    mov word ptr [esi+04h], ax
    mov ax, word ptr [B130480]
    mov word ptr [esi+08h], ax
    mov ax, word ptr [B13047c]
    mov word ptr [esi+0ch], ax
    mov ax, word ptr [B130468]
    mov word ptr [esi+014h], ax
    mov ax, word ptr [B13046c]
    mov word ptr [esi+010h], ax
    mov eax, dword ptr [B130486]
    sar eax, 010h
    mov dword ptr [esi+018h], eax
    test byte ptr [B130458], 01h
    je short L59057
    or byte ptr [esi+018h], 01h
L59057::
    db 031h, 0c0h
    mov ax, word ptr [esi]
    add esp, 04h
    pop esi
    pop ecx
    ret
Func58f48_ endp
    db 08bh, 0c0h
Func59064_ proc near
    push esi
    push edi
    push ebp
    sub esp, 04h
    mov dword ptr [esp], eax
    db 089h, 0d7h
    db 089h, 0deh
    db 089h, 0cdh
    mov ebx, 032h
    mov eax, offset B130468
    db 031h, 0d2h
    call memset_
    db 031h, 0c0h
    mov ax, word ptr [edi]
    mov dword ptr [B130484], eax
    db 031h, 0c0h
    mov ax, word ptr [edi+04h]
    mov dword ptr [B130478], eax
    db 031h, 0c0h
    mov ax, word ptr [edi+08h]
    mov dword ptr [B130480], eax
    db 031h, 0c0h
    mov ax, word ptr [edi+0ch]
    mov dword ptr [B13047c], eax
    db 031h, 0c0h
    mov ax, word ptr [edi+014h]
    mov dword ptr [B130468], eax
    db 031h, 0c0h
    mov ax, word ptr [edi+010h]
    mov edx, 0300h
    mov dword ptr [B13046c], eax
    mov ax, word ptr [edi+018h]
    db 031h, 0dbh
    mov word ptr [B130488], ax
    mov ax, word ptr [ecx+06h]
    mov word ptr [B130440], dx
    mov word ptr [B13048c], ax
    mov ax, word ptr [ecx]
    mov word ptr [B130448], bx
    mov word ptr [B13048a], ax
    mov al, byte ptr [esp]
    mov ebx, offset B130440
    mov byte ptr [B130444], al
    db 030h, 0e4h
    mov edx, ds
    mov byte ptr [B130445], ah
    mov eax, offset B130468
    mov ecx, offset B13045c
    mov word ptr [B13045c], dx
    mov edx, offset B130468
    mov eax, 031h
    mov dword ptr [B130454], edx
    db 089h, 0dah
    call int386x_
    mov ax, word ptr [B130484]
    mov word ptr [esi], ax
    mov ax, word ptr [B130478]
    mov word ptr [esi+04h], ax
    mov ax, word ptr [B130480]
    mov word ptr [esi+08h], ax
    mov ax, word ptr [B13047c]
    mov word ptr [esi+0ch], ax
    mov ax, word ptr [B130468]
    mov word ptr [esi+014h], ax
    mov ax, word ptr [B13046c]
    mov word ptr [esi+010h], ax
    mov eax, dword ptr [B130486]
    sar eax, 010h
    mov dword ptr [esi+018h], eax
    mov ax, word ptr [B13048c]
    mov word ptr [ebp+06h], ax
    mov ax, word ptr [B13048a]
    mov word ptr [ebp+00h], ax
    test byte ptr [B130458], 01h
    je short L5919d
    or byte ptr [esi+018h], 01h
L5919d::
    db 031h, 0c0h
    mov ax, word ptr [esi]
    add esp, 04h
    pop ebp
    pop edi
    pop esi
    ret
Func59064_ endp
    db 08dh, 040h, 000h
Func591ac_ proc near
    push ecx
    push esi
    push edi
    db 089h, 0c1h
    db 089h, 0d7h
    db 089h, 0deh
    mov word ptr [B130440], 0100h
    db 031h, 0d2h
    db 066h, 089h, 0c2h
    mov ebx, 010h
    db 089h, 0d0h
    sar edx, 01fh
    idiv ebx
    test edx, edx
    setne al
    db 031h, 0d2h
    db 066h, 089h, 0cah
    db 089h, 0c3h
    db 089h, 0d0h
    sar edx, 01fh
    shl edx, 04h
    sbb eax, edx
    sar eax, 04h
    and ebx, 0ffh
    db 001h, 0d8h
    mov ebx, offset B130440
    mov word ptr [B130444], ax
    mov eax, 031h
    db 089h, 0dah
    call int386_
    mov ax, word ptr [B130440]
    mov word ptr [esi], ax
    mov ax, word ptr [B13044c]
    mov word ptr [edi], ax
    test byte ptr [B130458], 01h
    sete al
    pop edi
    pop esi
    pop ecx
    ret
Func591ac_ endp
    db 090h
Func59228_ proc near
    push ebx
    push edx
    mov edx, 0101h
    mov ebx, offset B130440
    mov word ptr [B13044c], ax
    mov eax, 031h
    mov word ptr [B130440], dx
    db 089h, 0dah
    call int386_
    test byte ptr [B130458], 01h
    sete al
    pop edx
    pop ebx
    ret
Func59228_ endp
_TEXT ends

_BSS segment
B130440 label byte
    db 4 dup(?)
B130444 label byte
    db 1 dup(?)
B130445 label byte
    db 3 dup(?)
B130448 label byte
    db 4 dup(?)
B13044c label byte
    db 8 dup(?)
B130454 label byte
    db 4 dup(?)
B130458 label byte
    db 4 dup(?)
B13045c label byte
    db 12 dup(?)
B130468 label byte
    db 4 dup(?)
B13046c label byte
    db 12 dup(?)
B130478 label byte
    db 4 dup(?)
B13047c label byte
    db 4 dup(?)
B130480 label byte
    db 4 dup(?)
B130484 label byte
    db 2 dup(?)
B130486 label byte
    db 2 dup(?)
B130488 label byte
    db 2 dup(?)
B13048a label byte
    db 2 dup(?)
B13048c label byte
    db 20 dup(?)
_BSS ends

    end

    .586p

OBJ2 segment para public use16 'OBJ2CODE'
    assume cs:OBJ2, ds:OBJ2

    public _key_real_code
    public _key_real_code_end

_key_real_code label byte
    db 336 dup(0)

    push ax
    push bx
    push cx
    push ds
    mov ax, cs
    db 02dh, 015h, 000h
    mov ds, ax
    xor ax, ax
    xor bx, bx
    in al, 60h
    mov bl, al
    db 067h, 0a0h, 043h, 001h, 000h, 000h
    mov cx, bx
    test al, al
    jne L901b3
    inc al
    cmp bl, 0e0h
    je L90217
    inc al
    cmp bl, 0e1h
    je L90217
    test bl, 80h
    jne L9019d
    mov al, byte ptr [bx]
    test al, al
    mov al, bh
    jne L9021d
    db 067h, 0feh, 005h, 045h, 001h, 000h, 000h
    mov byte ptr [bx], 1h
    jmp L9021d
L9019d:
    and bl, 7fh
    mov al, byte ptr [bx]
    test al, al
    je L9021d
    mov al, bh
    db 067h, 0feh, 00dh, 045h, 001h, 000h, 000h
    mov byte ptr [bx], al
    jmp L9021d
L901b3:
    dec al
    jne L901df
    test bl, 80h
    jne L901d0
    or bl, 80h
    or al, byte ptr [bx]
    jne L90215
    inc al
    db 067h, 0feh, 005h, 045h, 001h, 000h, 000h
    mov byte ptr [bx], al
    jmp L90215
L901d0:
    or al, byte ptr [bx]
    je L90217
    db 067h, 0feh, 00dh, 045h, 001h, 000h, 000h
    mov byte ptr [bx], bh
    jmp L90215
L901df:
    add al, 2h
    cmp al, 3h
    je L90217
    inc ch
    cmp bl, 45h
    jne L90215
    db 067h, 0a0h, 0c5h, 000h, 000h, 000h
    test al, al
    jne L90207
    inc al
    db 067h, 0feh, 005h, 045h, 001h, 000h, 000h
    db 067h, 0a2h, 0c5h, 000h, 000h, 000h
    jmp L90215
L90207:
    db 067h, 0feh, 00dh, 045h, 001h, 000h, 000h
    db 067h, 088h, 03dh, 0c5h, 000h, 000h, 000h
L90215:
    xor al, al
L90217:
    db 067h, 0a2h, 043h, 001h, 000h, 000h
L9021d:
    or al, ch
    jne L9025f
    test cl, 80h
    jne L9025f
    cmp bl, 0aah
    je L9025f
    db 067h, 08ah, 00dh, 042h, 001h, 000h, 000h
    cmp cl, 40h
    je L9025f
    inc cl
    mov al, bl
    db 067h, 08ah, 01dh, 040h, 001h, 000h, 000h
    db 067h, 0a2h, 044h, 001h, 000h, 000h
    db 067h, 088h, 00dh, 042h, 001h, 000h, 000h
    mov byte ptr [bx+100h], al
    inc bl
    and bl, 3fh
    db 067h, 088h, 01dh, 040h, 001h, 000h, 000h
L9025f:
    mov al, 20h
    out 20h, al
    pop ds
    pop cx
    pop bx
    pop ax
    iret
_key_real_code_end label byte

OBJ2 ends

    end

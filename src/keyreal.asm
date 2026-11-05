    .386p

KEYSTUFF struct
keymap      db 256 dup(?)
keybuf      db 64 dup(?)
bufin       db ?
bufout      db ?
bufchars    db ?
extended    db ?
last_key    db ?
keys_held   db ?
KEYSTUFF ends

KEYDATA segment use32 at 0
KEYDATA ends

OBJ2 segment para public use16 'OBJ2CODE'
    assume cs:OBJ2, ds:KEYDATA

    public _key_real_code
    public _key_real_code_end

_key_real_code KEYSTUFF <>
    org 150h

key_handler:
    push ax
    push bx
    push cx
    push ds
    mov ax, cs
    sub ax, (key_handler - _key_real_code) shr 4
    mov ds, ax
    xor ax, ax
    xor bx, bx
    in al, 60h
    mov bl, al
    mov al, ds:[KEYSTUFF.extended]
    mov cx, bx
    test al, al
    jne prefixed_code
    inc al
    cmp bl, 0e0h
    je set_prefix
    inc al
    cmp bl, 0e1h
    je set_prefix
    test bl, 80h
    jne key_released
    mov al, byte ptr [bx]
    test al, al
    mov al, bh
    jne buffer_key
    inc ds:[KEYSTUFF.keys_held]
    mov byte ptr [bx], 1h
    jmp buffer_key
key_released:
    and bl, 7fh
    mov al, byte ptr [bx]
    test al, al
    je buffer_key
    mov al, bh
    dec ds:[KEYSTUFF.keys_held]
    mov byte ptr [bx], al
    jmp buffer_key
prefixed_code:
    dec al
    jne pause_sequence
    test bl, 80h
    jne prefixed_release
    or bl, 80h
    or al, byte ptr [bx]
    jne end_prefix
    inc al
    inc ds:[KEYSTUFF.keys_held]
    mov byte ptr [bx], al
    jmp end_prefix
prefixed_release:
    or al, byte ptr [bx]
    je set_prefix
    dec ds:[KEYSTUFF.keys_held]
    mov byte ptr [bx], bh
    jmp end_prefix
pause_sequence:
    add al, 2h
    cmp al, 3h
    je set_prefix
    inc ch
    cmp bl, 45h
    jne end_prefix
    mov al, ds:[KEYSTUFF.keymap+0c5h]
    test al, al
    jne pause_released
    inc al
    inc ds:[KEYSTUFF.keys_held]
    mov ds:[KEYSTUFF.keymap+0c5h], al
    jmp end_prefix
pause_released:
    dec ds:[KEYSTUFF.keys_held]
    mov ds:[KEYSTUFF.keymap+0c5h], bh
end_prefix:
    xor al, al
set_prefix:
    mov ds:[KEYSTUFF.extended], al
buffer_key:
    or al, ch
    jne acknowledge
    test cl, 80h
    jne acknowledge
    cmp bl, 0aah
    je acknowledge
    mov cl, ds:[KEYSTUFF.bufchars]
    cmp cl, 40h
    je acknowledge
    inc cl
    mov al, bl
    mov bl, ds:[KEYSTUFF.bufin]
    mov ds:[KEYSTUFF.last_key], al
    mov ds:[KEYSTUFF.bufchars], cl
    mov [bx].KEYSTUFF.keybuf, al
    inc bl
    and bl, 3fh
    mov ds:[KEYSTUFF.bufin], bl
acknowledge:
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

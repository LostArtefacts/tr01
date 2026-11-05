    .386p
    .model flat

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

    extrn _brkdata:dword
    extrn _critdata:dword
    extrn _keydata:dword

    public KeyHandler_
    public BreakHandler_
    public CritHandler_
    public TimerReadCount_
    public BcdToBin_
    public TimeRestore_

    .code
KeyHandler_ proc near
    push eax
    push ebx
    push ecx
    push edi
    push ds
    mov ax, 00h
    mov ds, ax
    xor eax, eax
    xor ebx, ebx
    mov edi, dword ptr [_keydata]
    in al, 060h
    mov bl, al
    mov al, byte ptr [edi].KEYSTUFF.extended
    mov ecx, ebx
    test al, al
    jne prefixed_code
    inc al
    cmp bl, 0e0h
    je set_prefix
    inc al
    cmp bl, 0e1h
    je set_prefix
    test bl, 080h
    jne key_released
    mov al, byte ptr [ebx+edi*1]
    test al, al
    mov al, bh
    jne buffer_key
    inc byte ptr [edi].KEYSTUFF.keys_held
    mov byte ptr [ebx+edi*1], 01h
    jmp buffer_key
key_released:
    and bl, 07fh
    mov al, byte ptr [ebx+edi*1]
    test al, al
    je buffer_key
    mov al, bh
    dec byte ptr [edi].KEYSTUFF.keys_held
    mov byte ptr [ebx+edi*1], al
    jmp buffer_key
prefixed_code:
    dec al
    jne pause_sequence
    test bl, 080h
    jne prefixed_release
    or bl, 080h
    or al, byte ptr [ebx+edi*1]
    jne end_prefix
    inc al
    inc byte ptr [edi].KEYSTUFF.keys_held
    mov byte ptr [ebx+edi*1], al
    jmp end_prefix
prefixed_release:
    or al, byte ptr [ebx+edi*1]
    je set_prefix
    dec byte ptr [edi].KEYSTUFF.keys_held
    mov byte ptr [ebx+edi*1], ah
    jmp end_prefix
pause_sequence:
    add al, 02h
    cmp al, 03h
    je set_prefix
    inc ch
    cmp bl, 045h
    jne end_prefix
    mov al, byte ptr [edi].KEYSTUFF.keymap+0c5h
    test al, al
    jne pause_released
    inc al
    inc byte ptr [edi].KEYSTUFF.keys_held
    mov byte ptr [edi].KEYSTUFF.keymap+0c5h, al
    jmp end_prefix
pause_released:
    dec byte ptr [edi].KEYSTUFF.keys_held
    mov byte ptr [edi].KEYSTUFF.keymap+0c5h, bh
end_prefix:
    xor al, al
set_prefix:
    mov byte ptr [edi].KEYSTUFF.extended, al
buffer_key:
    or al, ch
    jne acknowledge
    test cl, 080h
    jne acknowledge
    cmp bl, 0aah
    je acknowledge
    mov cl, byte ptr [edi].KEYSTUFF.bufchars
    cmp cl, 040h
    je acknowledge
    inc cl
    mov al, bl
    mov bl, byte ptr [edi].KEYSTUFF.bufin
    mov byte ptr [edi].KEYSTUFF.last_key, al
    mov byte ptr [edi].KEYSTUFF.bufchars, cl
    mov byte ptr [ebx+edi*1].KEYSTUFF.keybuf, al
    inc bl
    and bl, 03fh
    mov byte ptr [edi].KEYSTUFF.bufin, bl
acknowledge:
    mov al, 020h
    out 020h, al
    pop ds
    pop edi
    pop ecx
    pop ebx
    pop eax
    iretd
KeyHandler_ endp
BreakHandler_ proc near
    push eax
    push ds
    mov ax, 00h
    mov ds, ax
    mov eax, dword ptr [_brkdata]
    inc byte ptr [eax]
    pop ds
    pop eax
    iretd
BreakHandler_ endp
CritHandler_ proc near
    push eax
    push ebx
    push ds
    mov ax, 00h
    mov ds, ax
    mov ax, di
    inc al
    xor ah, ah
    mov ebx, dword ptr [_critdata]
    mov byte ptr [ebx], al
    pop ds
    pop ebx
    pop eax
    mov al, 03h
    iretd
CritHandler_ endp
TimerReadCount_ proc near
    xor al, al
    out 043h, al
    in al, 040h
    mov ah, al
    in al, 040h
    xchg al, ah
    ret
TimerReadCount_ endp
BcdToBin_ proc near
    push ebp
    mov ebp, esp
    add esp, -4
    pusha
    mov word ptr [ebp-04h], 01h
    mov word ptr [ebp-02h], 00h
    mov bx, ax
    mov cx, 02h
next_digit:
    mov ax, bx
    and ax, 0fh
    mul word ptr [ebp-04h]
    add word ptr [ebp-02h], ax
    mov ax, word ptr [ebp-04h]
    mov dx, 0ah
    mul dx
    mov word ptr [ebp-04h], ax
    sar bx, 04h
    dec cx
    jne next_digit
    popa
    mov ax, word ptr [ebp-02h]
    leave
    ret
BcdToBin_ endp
TimeRestore_ proc near
    pusha
    mov ah, 02h
    int 01ah
    mov al, ch
    call BcdToBin_
    mov ch, al
    mov al, cl
    call BcdToBin_
    mov cl, al
    mov al, dh
    call BcdToBin_
    mov dh, al
    xor dl, dl
    mov ax, 02d00h
    int 021h
    mov ah, 04h
    int 01ah
    mov al, ch
    call BcdToBin_
    push dx
    mov bx, 064h
    mul bx
    pop dx
    xchg cx, ax
    call BcdToBin_
    add cx, ax
    mov al, dh
    call BcdToBin_
    mov dh, al
    mov al, dl
    call BcdToBin_
    mov dl, al
    mov ax, 02b00h
    int 021h
    popa
    ret
TimeRestore_ endp

    end

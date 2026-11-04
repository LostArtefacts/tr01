    .586p

_TEXT segment dword public use32 'CODE'
_TEXT ends
_DATA segment dword public use32 'DATA'
_DATA ends
_BSS segment dword public use32 'BSS'
_BSS ends

    assume cs:FLAT, ds:FLAT, es:FLAT, ss:FLAT

    extrn _gamedata:byte
    extrn _keydata:byte

    public KeyGet_
    public MouseInit_
    public MouseRead_
    public JoyReadAxes_
    public _joy_x_raw
    public _joy_y_raw
    public _joy_z_raw
    public _joy_r_raw
    public _joy_fire
    public _txt_screen
    public _txt_width
    public _txt_pitch
    public _txt_col

_TEXT segment
KeyGet_ proc near
    push edi
    push ebx
    mov edi, dword ptr [_keydata]
    xor eax, eax
    mov al, byte ptr [edi+0142h]
    test al, al
    je short L4a20a
    dec al
    mov byte ptr [edi+0142h], al
    xor ebx, ebx
    mov bl, byte ptr [edi+0141h]
    mov al, byte ptr [ebx+edi*1+0100h]
    inc bl
    and bl, 03fh
    mov byte ptr [edi+0141h], bl
L4a20a:
    pop ebx
    pop edi
    ret
KeyGet_ endp
MouseInit_ proc near
    push es
    pusha
    mov edi, dword ptr [_gamedata]
    mov eax, 03533h
    int 021h
    xor eax, eax
    mov word ptr [esp+01ch], ax
    test ebx, ebx
    db 00fh, 084h, 09ch, 000h, 000h, 000h
    cmp byte ptr es:[ebx], 0cfh
    db 00fh, 084h, 092h, 000h, 000h, 000h
    db 08eh, "D$ "
    db 033h, 0c0h
    db 066h, 0a3h
    dd offset B12ffa2
    db 066h, 0a3h
    dd offset B12ffa6
    db 066h, 0a3h
    dd offset B12ff9a
    db 066h, 0a3h
    dd offset B12ff9c
    db 066h, 0a3h
    dd offset B12ff98
    mov al, byte ptr [Dc66d4]
    db 084h, 0c0h
    db 075h, 013h
    db 0cdh, 033h
    db 066h, 085h, 0c0h
    db 074h, 05eh
    db 066h, 089h, 05ch, 024h, 01ch
    db 0c6h, 005h
    dd offset Dc66d4
    db 001h
L4a275:
    db 066h, 0b8h, 01ch, 000h
    db 066h, 0bbh, 002h, 000h
    db 0cdh, 033h
    db 0b8h, 007h, 000h, 000h, 000h
    db 033h, 0c9h
    db 066h, 08bh, 017h
    db 066h, 04ah
    db 066h, 089h, 015h
    dd offset B12ffa4
    db 066h, 081h, 03fh, 040h, 001h
    db 07fh, 003h
    db 066h, 0d1h, 0e2h
L4a29c:
    db 0cdh, 033h
    db 0b8h, 008h, 000h, 000h, 000h
    db 033h, 0c9h
    db 066h, 08bh, 057h, 002h
    db 066h, 04ah
    db 066h, 089h, 015h
    dd offset B12ffa8
    db 0cdh, 033h
    db 0b8h, 01ah, 000h, 000h, 000h
    db 066h, 08bh, 05fh, 004h
    db 066h, 08bh, 04fh, 006h
    db 066h, 08bh, 057h, 008h
    db 0cdh, 033h
L4a2c7:
    db 061h
    db 007h
    db 0c3h
MouseInit_ endp
MouseRead_ proc near
    db 01eh
    db 006h
    db 00fh, 0a0h
    db 00fh, 0a8h
    db 060h
    db 033h, 0c0h
    db 0a0h
    dd offset Dc66d4
    db 084h, 0c0h
    db 075h, 020h
    mov word ptr [B12ff98], ax
    mov word ptr [B12ff9e], ax
    mov word ptr [B12ffa0], ax
    mov word ptr [B12ff9a], ax
    mov word ptr [B12ff9c], ax
    jmp short L4a363
L4a2fc:
    mov ax, 03h
    int 033h
    mov word ptr [B12ff98], bx
    mov ax, 0bh
    int 033h
    mov word ptr [B12ff9e], cx
    mov word ptr [B12ffa0], dx
    mov ax, word ptr [B12ff9a]
    add ax, cx
    jns short L4a32b
    xor ax, ax
L4a32b:
    cmp ax, word ptr [B12ffa4]
    jb short L4a33a
    mov ax, word ptr [B12ffa4]
L4a33a:
    mov word ptr [B12ff9a], ax
    mov ax, word ptr [B12ff9c]
    add ax, dx
    jns short L4a34e
    xor ax, ax
L4a34e:
    cmp ax, word ptr [B12ffa8]
    jb short L4a35d
    mov ax, word ptr [B12ffa8]
L4a35d:
    mov word ptr [B12ff9c], ax
L4a363:
    popa
    pop gs
    pop fs
    pop es
    pop ds
    ret
MouseRead_ endp
JoyReadAxes_ proc near
    pusha
    cli
    xor ebx, ebx
    mov edx, 0201h
    mov ah, al
    mov al, 0ffh
    out dx, al
    xor ecx, ecx
    xor esi, esi
    xor edi, edi
    xor ebp, ebp
L4a381:
    in al, dx
    test al, 01h
    je short L4a388
    mov ecx, ebx
L4a388:
    test al, 02h
    je short L4a38e
    mov esi, ebx
L4a38e:
    test al, 04h
    je short L4a394
    mov edi, ebx
L4a394:
    test al, 08h
    je short L4a39a
    mov ebp, ebx
L4a39a:
    inc ebx
    cmp ebx, 07d0h
    jae short L4a3d9
    db 084h, 0c4h
    jne short L4a381
    not al
    shr al, 04h
    mov byte ptr [_joy_fire], al
    mov word ptr [_joy_x_raw], cx
    mov word ptr [_joy_y_raw], si
    mov word ptr [_joy_z_raw], di
    mov word ptr [_joy_r_raw], bp
    mov eax, 01h
    mov dword ptr [esp+01ch], eax
    sti
    popa
    ret
L4a3d9:
    xor eax, eax
    mov word ptr [_joy_x_raw], ax
    mov word ptr [_joy_y_raw], ax
    mov word ptr [_joy_z_raw], ax
    mov word ptr [_joy_r_raw], ax
    mov byte ptr [_joy_fire], al
    mov dword ptr [esp+01ch], eax
    sti
    popa
    ret
JoyReadAxes_ endp
_TEXT ends

_DATA segment
Dc66d4 label byte
    db 000h, 000h, 000h, 000h
_DATA ends

_BSS segment
B12ff98 label byte
    db 2 dup(?)
B12ff9a label byte
    db 2 dup(?)
B12ff9c label byte
    db 2 dup(?)
B12ff9e label byte
    db 2 dup(?)
B12ffa0 label byte
    db 2 dup(?)
B12ffa2 label byte
    db 2 dup(?)
B12ffa4 label byte
    db 2 dup(?)
B12ffa6 label byte
    db 2 dup(?)
B12ffa8 label byte
    db 2 dup(?)
_joy_x_raw label byte
    db 2 dup(?)
_joy_y_raw label byte
    db 2 dup(?)
_joy_z_raw label byte
    db 2 dup(?)
_joy_r_raw label byte
    db 2 dup(?)
_joy_fire label byte
    db 2 dup(?)
_txt_screen label byte
    db 4 dup(?)
_txt_width label byte
    db 4 dup(?)
_txt_pitch label byte
    db 4 dup(?)
_txt_col label byte
    db 264 dup(?)
_BSS ends

    end

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

    extrn _gamedata:dword
    extrn _keydata:dword

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

    .code
KeyGet_ proc near
    push edi
    push ebx
    mov edi, dword ptr [_keydata]
    xor eax, eax
    mov al, byte ptr [edi].KEYSTUFF.bufchars
    test al, al
    je key_done
    dec al
    mov byte ptr [edi].KEYSTUFF.bufchars, al
    xor ebx, ebx
    mov bl, byte ptr [edi].KEYSTUFF.bufout
    mov al, byte ptr [ebx+edi*1].KEYSTUFF.keybuf
    inc bl
    and bl, 03fh
    mov byte ptr [edi].KEYSTUFF.bufout, bl
key_done:
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
    je mouse_init_done
    cmp byte ptr es:[ebx], 0cfh
    je mouse_init_done
    mov es, dword ptr [esp+020h]
    xor eax, eax
    mov word ptr [mouse_min_x], ax
    mov word ptr [mouse_min_y], ax
    mov word ptr [mouse_x], ax
    mov word ptr [mouse_y], ax
    mov word ptr [mouse_buttons], ax
    mov al, byte ptr [mouse_ready]
    test al, al
    jne driver_ready
    int 033h
    test ax, ax
    je mouse_init_done
    mov word ptr [esp+01ch], bx
    mov byte ptr [mouse_ready], 01h
driver_ready:
    mov ax, 01ch
    mov bx, 02h
    int 033h
    mov eax, 07h
    xor ecx, ecx
    mov dx, word ptr [edi]
    dec dx
    mov word ptr [mouse_max_x], dx
    cmp word ptr [edi], 0140h
    jg set_x_range
    shl dx, 1
set_x_range:
    int 033h
    mov eax, 08h
    xor ecx, ecx
    mov dx, word ptr [edi+02h]
    dec dx
    mov word ptr [mouse_max_y], dx
    int 033h
    mov eax, 01ah
    mov bx, word ptr [edi+04h]
    mov cx, word ptr [edi+06h]
    mov dx, word ptr [edi+08h]
    int 033h
mouse_init_done:
    popa
    pop es
    ret
MouseInit_ endp
MouseRead_ proc near
    push ds
    push es
    push fs
    push gs
    pusha
    xor eax, eax
    mov al, byte ptr [mouse_ready]
    test al, al
    jne read_mouse
    mov word ptr [mouse_buttons], ax
    mov word ptr [mouse_dx], ax
    mov word ptr [mouse_dy], ax
    mov word ptr [mouse_x], ax
    mov word ptr [mouse_y], ax
    jmp mouse_read_done
read_mouse:
    mov ax, 03h
    int 033h
    mov word ptr [mouse_buttons], bx
    mov ax, 0bh
    int 033h
    mov word ptr [mouse_dx], cx
    mov word ptr [mouse_dy], dx
    mov ax, word ptr [mouse_x]
    add ax, cx
    jns x_not_negative
    xor ax, ax
x_not_negative:
    cmp ax, word ptr [mouse_max_x]
    jb store_x
    mov ax, word ptr [mouse_max_x]
store_x:
    mov word ptr [mouse_x], ax
    mov ax, word ptr [mouse_y]
    add ax, dx
    jns y_not_negative
    xor ax, ax
y_not_negative:
    cmp ax, word ptr [mouse_max_y]
    jb store_y
    mov ax, word ptr [mouse_max_y]
store_y:
    mov word ptr [mouse_y], ax
mouse_read_done:
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
poll_axes:
    in al, dx
    test al, 01h
    je check_y
    mov ecx, ebx
check_y:
    test al, 02h
    je check_z
    mov esi, ebx
check_z:
    test al, 04h
    je check_r
    mov edi, ebx
check_r:
    test al, 08h
    je next_poll
    mov ebp, ebx
next_poll:
    inc ebx
    cmp ebx, 07d0h
    jae timed_out
    test al, ah
    jne poll_axes
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
timed_out:
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

    .data
mouse_ready dd 0

    .data?
mouse_buttons dw ?
mouse_x dw ?
mouse_y dw ?
mouse_dx dw ?
mouse_dy dw ?
mouse_min_x dw ?
mouse_max_x dw ?
mouse_min_y dw ?
mouse_max_y dw ?
_joy_x_raw dw ?
_joy_y_raw dw ?
_joy_z_raw dw ?
_joy_r_raw dw ?
_joy_fire db ?
    db ?
_txt_screen dd ?
_txt_width dd ?
_txt_pitch dd ?
_txt_col db ?
    db 263 dup(?)

    end

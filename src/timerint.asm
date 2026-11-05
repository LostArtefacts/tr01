    .386p
    .model flat

    extrn _Datac6e14:byte
    extrn _Datac6e18:byte
    extrn _Datac6e20:byte
    extrn _Datac6e24:byte
    extrn _Datac6e26:byte
    extrn _Datac6e2a:byte
    extrn _Datac6e2e:byte
    extrn _Datac6e32:byte
    extrn _Datac7e36:byte
    extrn _Datac7e3a:byte
    extrn _Datac7e3e:byte
    extrn _Datac7e40:byte
    extrn _Datac7e44:byte
    extrn ___GETDSStart_:near

    public Func52118_
    public Func52119_
    public Func52180_
    public Func521c6_
    public Func52281_
    public Func522ad_
    public Func522d9_
    public Func52355_
    public Func523ae_

    .code
Func52118_ proc near
    ret
Func52118_ endp
Func52119_ proc near
    push ds
    call ___GETDSStart_
    cmp word ptr [_Datac7e3e], 01h
    je short handler_busy
    nop
    nop
    nop
    nop
    push ax
    mov ax, 020h
    out 020h, al
    pop ax
    mov word ptr [_Datac7e3e], 01h
    mov dword ptr [_Datac6e2e], esp
    mov word ptr [_Datac6e32], ss
    lss esp, fword ptr [_Datac6e26]
    pusha
    push es
    push fs
    push gs
    push ds
    pop es
    mov dword ptr [_Datac7e36], esp
    call dword ptr [_Datac6e20]
    pop gs
    pop fs
    pop es
    popa
    lss esp, fword ptr [_Datac6e2e]
    mov word ptr [_Datac7e3e], 00h
handler_busy:
    pop ds
    iretd
Func52119_ endp
Func52180_ proc near
    push ebp
    mov ebp, esp
    push esi
    push edi
    push ebx
    push ecx
    push fs
    push gs
    push es
    cmp dword ptr [_Datac7e40], 00h
    je short set_rate_done
    nop
    nop
    nop
    nop
    mov dx, 021h
    in al, dx
    or al, 01h
    out dx, al
    mov dx, 043h
    mov al, 036h
    out dx, al
    mov dx, 040h
    mov eax, dword ptr [ebp+08h]
    out dx, al
    mov al, ah
    out dx, al
    mov dx, 021h
    in al, dx
    and al, 0feh
    out dx, al
set_rate_done:
    pop es
    pop gs
    pop fs
    pop ecx
    pop ebx
    pop edi
    pop esi
    pop ebp
    ret
Func52180_ endp
Func521c6_ proc near
    push ebp
    mov ebp, esp
    push esi
    push edi
    push ebx
    push ecx
    push fs
    push gs
    push es
    mov edi, dword ptr [ebp+0ch]
    mov dword ptr [_Datac6e20], edi
    mov word ptr [_Datac6e24], ds
    mov word ptr [_Datac6e2a], ds
    cmp dword ptr [_Datac7e40], 00h
    je install_done
    mov dx, 021h
    in al, dx
    or al, 01h
    out dx, al
    cmp dword ptr [_Datac7e44], 00h
    je short install_dos
    nop
    nop
    nop
    nop
    mov ax, 0204h
    mov bl, 08h
    int 031h
    mov dword ptr [_Datac6e14], edx
    mov word ptr [_Datac6e18], cx
    mov ax, 0205h
    mov bl, 08h
    mov edx, offset Func52119_
    mov cx, cs
    int 031h
    jmp short program_timer
    nop
    nop
    nop
install_dos:
    mov ax, 03508h
    int 021h
    mov dword ptr [_Datac6e14], ebx
    mov word ptr [_Datac6e18], es
    push ds
    xor ax, ax
    mov es, eax
    mov ax, 02508h
    mov edx, offset Func52119_
    push cs
    pop ds
    int 021h
    pop ds
program_timer:
    mov dx, 043h
    mov al, 036h
    out dx, al
    mov dx, 040h
    mov eax, dword ptr [ebp+08h]
    out dx, al
    mov al, ah
    out dx, al
    mov dx, 021h
    in al, dx
    and al, 0feh
    out dx, al
install_done:
    pop es
    pop gs
    pop fs
    pop ecx
    pop ebx
    pop edi
    pop esi
    pop ebp
    ret
Func521c6_ endp
Func52281_ proc near
    push ebp
    mov ebp, esp
    push esi
    push edi
    push ebx
    push ecx
    push fs
    push gs
    push es
    cmp dword ptr [_Datac7e40], 00h
    je short mask_done
    nop
    nop
    nop
    nop
    mov dx, 021h
    in al, dx
    or al, 01h
    out dx, al
mask_done:
    pop es
    pop gs
    pop fs
    pop ecx
    pop ebx
    pop edi
    pop esi
    pop ebp
    ret
Func52281_ endp
Func522ad_ proc near
    push ebp
    mov ebp, esp
    push esi
    push edi
    push ebx
    push ecx
    push fs
    push gs
    push es
    cmp dword ptr [_Datac7e40], 00h
    je short unmask_done
    nop
    nop
    nop
    nop
    mov dx, 021h
    in al, dx
    and al, 0feh
    out dx, al
unmask_done:
    pop es
    pop gs
    pop fs
    pop ecx
    pop ebx
    pop edi
    pop esi
    pop ebp
    ret
Func522ad_ endp
Func522d9_ proc near
    push ebp
    mov ebp, esp
    push esi
    push edi
    push ebx
    push ecx
    push fs
    push gs
    push es
    cmp dword ptr [_Datac7e40], 00h
    je short remove_done
    nop
    nop
    nop
    nop
    mov dx, 021h
    in al, dx
    or al, 01h
    out dx, al
    cmp dword ptr [_Datac7e44], 00h
    je short restore_dos
    nop
    nop
    nop
    nop
    mov ax, 0205h
    mov bl, 08h
    mov cx, word ptr [_Datac6e18]
    mov edx, dword ptr [_Datac6e14]
    int 031h
    jmp short reset_timer
    nop
    nop
    nop
restore_dos:
    push ds
    mov ax, 02508h
    mov cx, word ptr [_Datac6e18]
    mov edx, dword ptr [_Datac6e14]
    mov ds, ecx
    int 021h
    pop ds
reset_timer:
    mov dx, 040h
    mov ax, 00h
    out dx, al
    out dx, al
    mov dx, 021h
    in al, dx
    and al, 0feh
    out dx, al
remove_done:
    pop es
    pop gs
    pop fs
    pop ecx
    pop ebx
    pop edi
    pop esi
    pop ebp
    ret
Func522d9_ endp
Func52355_ proc near
    cmp dword ptr [_Datac7e40], 00h
    je short no_timer
    nop
    nop
    nop
    nop
    mov word ptr [_Datac7e3e], 00h
    mov esp, dword ptr [_Datac7e36]
    pop gs
    pop fs
    pop es
    popa
    lss esp, fword ptr [_Datac6e2e]
    mov dword ptr [_Datac7e3a], eax
    pop eax
    mov word ptr [_Datac7e36], ax
    push eax
    push eax
    mov eax, dword ptr [_Datac6e14]
    mov dword ptr [esp], eax
    mov eax, dword ptr [_Datac6e18]
    mov dword ptr [esp+04h], eax
    mov eax, dword ptr [_Datac7e3a]
    push eax
    mov ax, word ptr [_Datac7e36]
    mov ds, eax
    pop eax
    retf
no_timer:
    ret
Func52355_ endp
Func523ae_ proc near
    ret
Func523ae_ endp

    end

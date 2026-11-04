    .586p

_TEXT segment dword public use32 'CODE'
_TEXT ends

    assume cs:FLAT, ds:FLAT, es:FLAT, ss:FLAT

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

_TEXT segment
Func52118_ proc near
    ret
Func52118_ endp
Func52119_ proc near
    push ds
    call ___GETDSStart_
    cmp word ptr [_Datac7e3e], 01h
    je short L5217e
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
    db 066h, 08ch, 015h
    dd offset _Datac6e32
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
L5217e:
    pop ds
    db 0cfh
Func52119_ endp
Func52180_ proc near
    db 055h
    db 08bh, 0ech
    db 056h
    db 057h
    db 053h
    db 051h
    db 00fh, 0a0h
    db 00fh, 0a8h
    db 006h
    db 083h, 03dh
    dd offset _Datac7e40
    db 000h
    db 074h, 026h
    db 090h
    nop
    nop
    nop
    db 066h, 0bah, 021h, 000h
    db 0ech
    db 00ch, 001h
    db 0eeh
    db 066h, 0bah, 043h, 000h
    db 0b0h, 036h
    db 0eeh
    db 066h, 0bah, 040h, 000h
    db 08bh, 045h, 008h
    db 0eeh
    db 08ah, 0c4h
    db 0eeh
    db 066h, 0bah, 021h, 000h
    db 0ech
    db 024h, 0feh
    db 0eeh
L521bb:
    db 007h
    db 00fh, 0a9h
    db 00fh, 0a1h
    db 059h
    db 05bh
    db 05fh
    db 05eh
    db 05dh
    db 0c3h
Func52180_ endp
Func521c6_ proc near
    db 055h
    db 08bh, 0ech
    db 056h
    db 057h
    db 053h
    db 051h
    db 00fh, 0a0h
    db 00fh, 0a8h
    db 006h
    db 08bh, 07dh, 00ch
    db 089h, 03dh
    dd offset _Datac6e20
    db 066h, 08ch, 01dh
    dd offset _Datac6e24
    db 066h, 08ch, 01dh
    dd offset _Datac6e2a
    cmp dword ptr [_Datac7e40], 00h
    je near ptr L52276
    mov dx, 021h
    in al, dx
    or al, 01h
    out dx, al
    cmp dword ptr [_Datac7e44], 00h
    je short L52235
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
    jmp short L5225c
    nop
    nop
    nop
L52235:
    mov ax, 03508h
    int 021h
    mov dword ptr [_Datac6e14], ebx
    db 066h, 08ch, 005h
    dd offset _Datac6e18
    push ds
    xor ax, ax
    mov es, eax
    mov ax, 02508h
    mov edx, offset Func52119_
    push cs
    pop ds
    int 021h
    pop ds
L5225c:
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
L52276:
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
    je short L522a2
    nop
    nop
    nop
    nop
    mov dx, 021h
    in al, dx
    or al, 01h
    out dx, al
L522a2:
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
    je short L522ce
    nop
    nop
    nop
    nop
    mov dx, 021h
    in al, dx
    and al, 0feh
    out dx, al
L522ce:
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
    je short L5234a
    nop
    nop
    nop
    nop
    mov dx, 021h
    in al, dx
    or al, 01h
    out dx, al
    cmp dword ptr [_Datac7e44], 00h
    je short L52321
    nop
    nop
    nop
    nop
    mov ax, 0205h
    mov bl, 08h
    mov cx, word ptr [_Datac6e18]
    mov edx, dword ptr [_Datac6e14]
    int 031h
    jmp short L52338
    nop
    nop
    nop
L52321:
    push ds
    mov ax, 02508h
    mov cx, word ptr [_Datac6e18]
    mov edx, dword ptr [_Datac6e14]
    mov ds, ecx
    int 021h
    pop ds
L52338:
    mov dx, 040h
    mov ax, 00h
    out dx, al
    out dx, al
    mov dx, 021h
    in al, dx
    and al, 0feh
    out dx, al
L5234a:
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
    je short L523ad
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
L523ad:
    ret
Func52355_ endp
Func523ae_ proc near
    ret
Func523ae_ endp
_TEXT ends

    end

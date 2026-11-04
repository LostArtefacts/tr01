    .586p

_TEXT segment dword public use32 'CODE'
_TEXT ends

    assume cs:FLAT, ds:FLAT, es:FLAT, ss:FLAT

    extrn _Datac84c4:byte
    extrn _Datac8514:byte
    extrn _Datac8518:byte
    extrn _Datac851c:byte
    extrn _Datac8520:byte
    extrn _Datac8524:byte
    extrn _Datac8554:byte
    extrn _Datac85a4:byte
    extrn _Datac85a8:byte
    extrn _Datac85ac:byte
    extrn _Datac85b0:byte
    extrn _Datac85b4:byte

    public Func56d2c_
    public Func56d2d_
    public Func56d6a_
    public Func56da7_
    public Func56e53_
    public Func56e89_
    public Func56ee6_
    public Func56f1c_
    public Func56f47_
    public Func56f81_
    public Func56fdd_
    public Func57000_
    public Func57023_
    public Func57067_
    public Func570bd_
    public Func570ed_
    public Func57110_
    public Func57145_
    public Func5716e_
    public Func57194_
    public Func571bb_
    public Func571e5_
    public Func5721a_
    public Func5724f_
    public Func5728e_
    public Func572d8_
    public Func5730e_
    public Func57339_
    public Func57356_
    public Func57397_
    public Func573c5_
    public Func57431_
    public Func5747e_
    public Func574b4_
    public Func574de_
    public Func57504_
    public Func57508_
    public Func5750c_

_TEXT segment
Func56d2c_ proc near
    ret
Func56d2c_ endp
Func56d2d_ proc near
    push ebp
    mov ebp, esp
    push esi
    push edi
    push ebx
    push ecx
    push fs
    push gs
    push es
    mov cx, word ptr [ebp+08h]
    mov bx, word ptr [ebp+0ah]
    mov di, word ptr [ebp+0ch]
    mov si, word ptr [ebp+0eh]
    mov ax, 0600h
    int 031h
    mov eax, 00h
    jae short L56d5f
    nop
    nop
    nop
    nop
    mov eax, 01h
L56d5f:
    pop es
    pop gs
    pop fs
    pop ecx
    pop ebx
    pop edi
    pop esi
    pop ebp
    ret
Func56d2d_ endp
Func56d6a_ proc near
    push ebp
    mov ebp, esp
    push esi
    push edi
    push ebx
    push ecx
    push fs
    push gs
    push es
    mov cx, word ptr [ebp+08h]
    mov bx, word ptr [ebp+0ah]
    mov di, word ptr [ebp+0ch]
    mov si, word ptr [ebp+0eh]
    mov ax, 0601h
    int 031h
    mov eax, 00h
    jae short L56d9c
    nop
    nop
    nop
    nop
    mov eax, 01h
L56d9c:
    pop es
    pop gs
    pop fs
    pop ecx
    pop ebx
    pop edi
    pop esi
    pop ebp
    ret
Func56d6a_ endp
Func56da7_ proc near
    push ebp
    mov ebp, esp
    push esi
    push edi
    push ebx
    push ecx
    push fs
    push gs
    push es
    mov ax, 00h
    mov cx, 01h
    int 031h
    push eax
    mov word ptr [_Datac85b4], ax
    push eax
    mov bx, ax
    mov ax, 08h
    xor cx, cx
    mov edx, dword ptr [ebp+08h]
    int 031h
    pop eax
    mov ax, 0501h
    xor ebx, ebx
    mov ecx, dword ptr [ebp+08h]
    add cx, 050h
    int 031h
    jae short L56dfa
    nop
    nop
    nop
    nop
    pop eax
    mov eax, 00h
    mov edx, 00h
    jmp short L56e48
    nop
    nop
    nop
L56dfa:
    push ebx
    mov ebx, dword ptr [ebp+0ch]
    mov word ptr [ebx], si
    mov word ptr [ebx+02h], di
    pop ebx
    pop eax
    push eax
    mov esi, dword ptr [ebp+010h]
    mov word ptr [esi], cx
    mov word ptr [esi+02h], bx
    mov dx, cx
    mov cx, bx
    mov bx, ax
    mov ax, 07h
    int 031h
    movzx ecx, word ptr [_Datac85b4]
    lar ecx, ecx
    shr ecx, 08h
    or cx, 04000h
    mov bx, word ptr [_Datac85b4]
    mov ax, 09h
    int 031h
    pop eax
    xor edx, edx
    mov dx, ax
    xor eax, eax
L56e48:
    pop es
    pop gs
    pop fs
    pop ecx
    pop ebx
    pop edi
    pop esi
    pop ebp
    ret
Func56da7_ endp
Func56e53_ proc near
    push eax
    mov ax, ds
    mov gs, eax
    pop eax
    push ebp
    mov ebp, esp
    push esi
    push edi
    push ebx
    push ecx
    push fs
    push gs
    push es
    mov si, word ptr [ebp+010h]
    mov di, word ptr [ebp+012h]
    mov ax, 0502h
    int 031h
    mov ax, 01h
    mov bx, word ptr [ebp+0ch]
    int 031h
    pop es
    pop gs
    pop fs
    pop ecx
    pop ebx
    pop edi
    pop esi
    pop ebp
    ret
Func56e53_ endp
Func56e89_ proc near
    push ebp
    mov ebp, esp
    push esi
    push edi
    push ebx
    push ecx
    push fs
    push gs
    push es
    mov ax, 00h
    mov cx, 01h
    int 031h
    push eax
    push eax
    push eax
    push eax
    mov bx, word ptr [ebp+0ch]
    mov ax, 06h
    int 031h
    pop ebx
    mov ax, 07h
    int 031h
    xor ebx, ebx
    mov bx, word ptr [ebp+0ch]
    lsl edx, ebx
    mov ax, 08h
    pop ebx
    xor ecx, ecx
    int 031h
    mov ax, 09h
    pop ebx
    lar ecx, ebx
    shr ecx, 08h
    or cx, 04008h
    int 031h
    pop edx
    xor eax, eax
    pop es
    pop gs
    pop fs
    pop ecx
    pop ebx
    pop edi
    pop esi
    pop ebp
    ret
Func56e89_ endp
Func56ee6_ proc near
    push ebp
    mov ebp, esp
    push esi
    push edi
    push ebx
    push ecx
    push fs
    push gs
    push es
    xor eax, eax
    mov ax, 0100h
    mov ebx, dword ptr [ebp+08h]
    add ebx, 0100h
    int 031h
    mov esi, dword ptr [ebp+0ch]
    shl eax, 04h
    mov dword ptr [esi], eax
    mov esi, dword ptr [ebp+010h]
    mov word ptr [esi], dx
    pop es
    pop gs
    pop fs
    pop ecx
    pop ebx
    pop edi
    pop esi
    pop ebp
    ret
Func56ee6_ endp
Func56f1c_ proc near
    mov ax, ds
    mov gs, eax
    mov es, eax
    mov fs, eax
    push ebp
    mov ebp, esp
    push esi
    push edi
    push ebx
    push ecx
    push fs
    push gs
    push es
    xor eax, eax
    mov ax, 0101h
    mov edx, dword ptr [ebp+08h]
    int 031h
    pop es
    pop gs
    pop fs
    pop ecx
    pop ebx
    pop edi
    pop esi
    pop ebp
    ret
Func56f1c_ endp
Func56f47_ proc near
    push ebp
    mov ebp, esp
    push esi
    push edi
    push ebx
    push ecx
    push fs
    push gs
    push es
    mov eax, 08h
    lfs edi, fword ptr [ebp+010h]
    mov dx, ds
    call fword ptr [ebp+08h]
    push ds
    push ds
    pop es
    mov edi, dword ptr [ebp+018h]
    lds esi, fword ptr [ebp+010h]
    mov esi, edx
    mov ecx, 06ah
    cld
    rep movs byte ptr es:[edi], byte ptr ds:[esi]
    pop ds
    pop es
    pop gs
    pop fs
    pop ecx
    pop ebx
    pop edi
    pop esi
    pop ebp
    ret
Func56f47_ endp
Func56f81_ proc near
    push ebp
    mov ebp, esp
    push esi
    push edi
    push ebx
    push ecx
    push fs
    push gs
    push es
    mov eax, 08h
    lfs edi, fword ptr [ebp+010h]
    mov dx, ds
    call fword ptr [ebp+08h]
    push ds
    push es
    push ds
    pop es
    mov edi, dword ptr [ebp+018h]
    lds esi, fword ptr [ebp+010h]
    mov esi, edx
    mov ecx, 06ah
    cld
    rep movs byte ptr es:[edi], byte ptr ds:[esi]
    pop es
    pop ds
    push ds
    push es
    push ds
    pop es
    mov edi, dword ptr [ebp+018h]
    db 08eh, 05dh, 014h
    db 066h, 026h, 08ch, 05fh, 044h
    db 066h, 026h, 08ch, 05fh, 04ch
    db 066h, 026h, 08ch, 05fh, 054h
    db 066h, 026h, 08ch, 05fh, 05ch
    db 007h
    db 01fh
    db 007h
    db 00fh, 0a9h
    db 00fh, 0a1h
    db 059h
    db 05bh
    db 05fh
    db 05eh
    db 05dh
    db 0c3h
Func56f81_ endp
Func56fdd_ proc near
    db 055h
    db 08bh, 0ech
    db 056h
    db 057h
    db 053h
    db 051h
    db 00fh, 0a0h
    db 00fh, 0a8h
    db 006h
    db 0b8h, 005h, 000h, 000h, 000h
    db 00fh, 0b4h, 07dh, 010h
    db 0ffh, 05dh, 008h
    db 007h
    db 00fh, 0a9h
    db 00fh, 0a1h
    db 059h
    db 05bh
    db 05fh
    db 05eh
    db 05dh
    db 0c3h
Func56fdd_ endp
Func57000_ proc near
    db 055h
    db 08bh, 0ech
    db 056h
    db 057h
    db 053h
    db 051h
    db 00fh, 0a0h
    db 00fh, 0a8h
    db 006h
    db 0b8h, 000h, 000h, 000h, 000h
    db 00fh, 0b4h, 07dh, 010h
    db 0ffh, 05dh, 008h
    db 007h
    db 00fh, 0a9h
    pop fs
    pop ecx
    pop ebx
    pop edi
    pop esi
    pop ebp
    ret
Func57000_ endp
Func57023_ proc near
    push ebp
    mov ebp, esp
    push esi
    push edi
    push ebx
    push ecx
    push fs
    push gs
    push es
    mov eax, 01h
    lfs edi, fword ptr [ebp+010h]
    call fword ptr [ebp+08h]
    mov word ptr [_Datac85a4], ax
    mov al, ch
    cbw
    mov word ptr [_Datac85ac], ax
    mov al, cl
    cbw
    mov word ptr [_Datac85a8], ax
    mov word ptr [_Datac85b0], dx
    pop es
    pop gs
    pop fs
    pop ecx
    pop ebx
    pop edi
    pop esi
    pop ebp
    ret
Func57023_ endp
Func57067_ proc near
    push ebp
    mov ebp, esp
    push esi
    push edi
    push ebx
    push ecx
    push fs
    push gs
    push es
    push es
    mov eax, 02h
    lfs edi, fword ptr [ebp+010h]
    call fword ptr [ebp+08h]
    push ds
    push ds
    pop es
    mov edi, dword ptr [ebp+018h]
    lds esi, fword ptr [ebp+010h]
    mov esi, edx
    mov ecx, 06ah
    cld
    rep movs byte ptr es:[edi], byte ptr ds:[esi]
    pop es
    pop ds
    push ds
    push es
    push ds
    pop es
    mov edi, dword ptr [ebp+018h]
    db 066h, 026h, 08ch, 05fh, 044h
    db 066h, 026h, 08ch, 05fh, 04ch
    db 066h, 026h, 08ch, 05fh, 054h
    db 066h, 026h, 08ch, 05fh, 05ch
    pop ds
    pop es
    pop es
    pop gs
    pop fs
    pop ecx
    pop ebx
    pop edi
    pop esi
    pop ebp
    ret
Func57067_ endp
Func570bd_ proc near
    push ebp
    mov ebp, esp
    push esi
    push edi
    push ebx
    push ecx
    push fs
    push gs
    push es
    mov ebx, dword ptr [ebp+010h]
    mov eax, dword ptr [ebp+014h]
    mov ch, al
    mov eax, dword ptr [ebp+018h]
    mov cl, al
    mov eax, 03h
    lfs edi, fword ptr [ebp+01ch]
    call fword ptr [ebp+08h]
    pop es
    pop gs
    pop fs
    pop ecx
    pop ebx
    pop edi
    pop esi
    pop ebp
    ret
Func570bd_ endp
Func570ed_ proc near
    push ebp
    mov ebp, esp
    push esi
    push edi
    push ebx
    push ecx
    push fs
    push gs
    push es
    mov eax, 01h
    lfs edi, fword ptr [ebp+010h]
    call fword ptr [ebp+08h]
    pop es
    pop gs
    pop fs
    pop ecx
    pop ebx
    pop edi
    pop esi
    pop ebp
    ret
Func570ed_ endp
Func57110_ proc near
    push ebp
    mov ebp, esp
    push esi
    push edi
    push ebx
    push ecx
    push fs
    push gs
    push es
    lfs edi, fword ptr [ebp+010h]
    mov eax, 00h
    mov bx, word ptr [ebp+018h]
    mov cx, word ptr [ebp+01ch]
    mov dx, word ptr [ebp+020h]
    mov ch, dl
    mov si, word ptr [ebp+02ch]
    call fword ptr [ebp+08h]
    pop es
    pop gs
    pop fs
    pop ecx
    pop ebx
    pop edi
    pop esi
    pop ebp
    ret
Func57110_ endp
Func57145_ proc near
    push ebp
    mov ebp, esp
    push esi
    push edi
    push ebx
    push ecx
    push fs
    push gs
    push es
    lfs edi, fword ptr [ebp+010h]
    mov eax, 04h
    mov ecx, dword ptr [ebp+01ch]
    mov edi, dword ptr [ebp+018h]
    call fword ptr [ebp+08h]
    pop es
    pop gs
    pop fs
    pop ecx
    pop ebx
    pop edi
    pop esi
    pop ebp
    ret
Func57145_ endp
Func5716e_ proc near
    push ebp
    mov ebp, esp
    push esi
    push edi
    push ebx
    push ecx
    push fs
    push gs
    push es
    lfs edi, fword ptr [ebp+010h]
    mov eax, 02h
    mov ebx, dword ptr [ebp+018h]
    call fword ptr [ebp+08h]
    pop es
    pop gs
    pop fs
    pop ecx
    pop ebx
    pop edi
    pop esi
    pop ebp
    ret
Func5716e_ endp
Func57194_ proc near
    push ebp
    mov ebp, esp
    push esi
    push edi
    push ebx
    push ecx
    push fs
    push gs
    push es
    lfs edi, fword ptr [ebp+010h]
    mov eax, 03h
    mov bx, 08h
    call fword ptr [ebp+08h]
    pop es
    pop gs
    pop fs
    pop ecx
    pop ebx
    pop edi
    pop esi
    pop ebp
    ret
Func57194_ endp
Func571bb_ proc near
    push ebp
    mov ebp, esp
    push esi
    push edi
    push ebx
    push ecx
    push fs
    push gs
    push es
    mov ax, 01600h
    int 02fh
    cmp ax, 0a03h
    mov eax, dword ptr [ebp+014h]
    jne short L571da
    nop
    nop
    nop
    nop
L571da:
    pop es
    pop gs
    pop fs
    pop ecx
    pop ebx
    pop edi
    pop esi
    pop ebp
    ret
Func571bb_ endp
Func571e5_ proc near
    push ebp
    mov ebp, esp
    push esi
    push edi
    push ebx
    push ecx
    push fs
    push gs
    push es
    mov ax, 01600h
    int 02fh
    cmp al, 03h
    jne short L5720f
    nop
    nop
    nop
    nop
    mov ah, 081h
    mov al, 0bh
    mov ebx, dword ptr [ebp+08h]
    xor dx, dx
    int 04bh
    mov ax, 00h
L5720f:
    pop es
    pop gs
    pop fs
    pop ecx
    pop ebx
    pop edi
    pop esi
    pop ebp
    ret
Func571e5_ endp
Func5721a_ proc near
    push ebp
    mov ebp, esp
    push esi
    push edi
    push ebx
    push ecx
    push fs
    push gs
    push es
    mov ax, 01600h
    int 02fh
    cmp al, 03h
    jne short L57244
    nop
    nop
    nop
    nop
    mov ah, 081h
    mov al, 0ch
    mov ebx, dword ptr [ebp+08h]
    xor dx, dx
    int 04bh
    mov ax, 00h
L57244:
    pop es
    pop gs
    pop fs
    pop ecx
    pop ebx
    pop edi
    pop esi
    pop ebp
    ret
Func5721a_ endp
Func5724f_ proc near
    push ebp
    mov ebp, esp
    push esi
    push edi
    push ebx
    push ecx
    push fs
    push gs
    push es
    lfs edi, fword ptr [ebp+010h]
    mov eax, 04h
    call fword ptr [ebp+08h]
    mov dword ptr [_Datac8514], esi
    mov dword ptr [_Datac851c], edi
    mov ax, word ptr [ebp+014h]
    mov word ptr [_Datac8518], ax
    mov word ptr [_Datac8520], ax
    pop es
    pop gs
    pop fs
    pop ecx
    pop ebx
    pop edi
    pop esi
    pop ebp
    ret
Func5724f_ endp
Func5728e_ proc near
    push ebp
    mov ebp, esp
    push esi
    push edi
    push ebx
    push ecx
    push fs
    push gs
    push es
    push ds
    push ds
    pop es
    mov edi, offset _Datac84c4
    mov ebx, dword ptr [ebp+08h]
    lds esi, fword ptr [_Datac8514]
    mov esi, dword ptr [esi+ebx*4]
    cmp esi, 0ffffffffh
    jne short L572bf
    nop
    nop
    nop
    nop
    xor eax, eax
    pop ds
    jmp short L572cd
    nop
    nop
    nop
L572bf:
    mov ecx, 050h
    cld
    db 0f2h, 0a4h
    pop ds
    mov eax, offset _Datac84c4
L572cd:
    pop es
    pop gs
    pop fs
    pop ecx
    pop ebx
    pop edi
    pop esi
    pop ebp
    ret
Func5728e_ endp
Func572d8_ proc near
    push ebp
    mov ebp, esp
    push esi
    push edi
    push ebx
    push ecx
    push fs
    push gs
    push es
    les esi, fword ptr [_Datac851c]
    mov eax, dword ptr [ebp+08h]
    mov ebx, eax
    shl eax, 1
    shl ebx, 02h
    add ebx, eax
    mov eax, dword ptr [ebp+0ch]
    mov dword ptr es:[esi+ebx*1], eax
    db 066h, 026h, 08ch, 05ch, 01eh, 004h
    pop es
    pop gs
    pop fs
    pop ecx
    pop ebx
    pop edi
    pop esi
    pop ebp
    ret
Func572d8_ endp
Func5730e_ proc near
    push ebp
    mov ebp, esp
    push esi
    push edi
    push ebx
    push ecx
    push fs
    push gs
    push es
    mov ax, 0500h
    int 031h
    push ds
    pop es
    mov edi, offset _Datac8524
    int 031h
    mov eax, dword ptr [_Datac8524]
    pop es
    pop gs
    pop fs
    pop ecx
    pop ebx
    pop edi
    pop esi
    pop ebp
    ret
Func5730e_ endp
Func57339_ proc near
    push ebp
    mov ebp, esp
    push esi
    push edi
    push ebx
    push ecx
    push fs
    push gs
    push es
    mov ax, 01600h
    int 02fh
    pop es
    pop gs
    pop fs
    pop ecx
    pop ebx
    pop edi
    pop esi
    pop ebp
    ret
Func57339_ endp
Func57356_ proc near
    push ebp
    mov ebp, esp
    push esi
    push edi
    push ebx
    push ecx
    push fs
    push gs
    push es
    mov ax, 0100h
    mov ebx, dword ptr [ebp+08h]
    int 031h
    jae short L5737b
    nop
    nop
    nop
    nop
    mov eax, 01h
    jmp short L5738c
    nop
    nop
    nop
L5737b:
    mov esi, dword ptr [ebp+0ch]
    mov word ptr [esi], dx
    mov esi, dword ptr [ebp+010h]
    mov word ptr [esi], ax
    mov eax, 00h
L5738c:
    pop es
    pop gs
    pop fs
    pop ecx
    pop ebx
    pop edi
    pop esi
    pop ebp
    ret
Func57356_ endp
Func57397_ proc near
    mov ax, ds
    mov gs, eax
    mov fs, eax
    mov es, eax
    push ebp
    mov ebp, esp
    push esi
    push edi
    push ebx
    push ecx
    push fs
    push gs
    push es
    mov ax, 0101h
    mov dx, word ptr [ebp+08h]
    int 031h
    mov ax, 00h
    pop es
    pop gs
    pop fs
    pop ecx
    pop ebx
    pop edi
    pop esi
    pop ebp
    ret
Func57397_ endp
Func573c5_ proc near
    push ebp
    mov ebp, esp
    push esi
    push edi
    push ebx
    push ecx
    push fs
    push gs
    push es
    mov esi, offset _Datac8554
    mov dword ptr [esi+01ch], 08107h
    mov dword ptr [esi+014h], 00h
    mov ax, word ptr [ebp+08h]
    mov word ptr [esi+022h], ax
    mov dword ptr [esi], 00h
    mov ax, 0300h
    mov bl, 04bh
    mov bh, 00h
    mov cx, 00h
    mov edi, offset _Datac8554
    push ds
    pop es
    int 031h
    mov esi, offset _Datac8554
    and word ptr [esi+020h], 01h
    jne short L57421
    nop
    nop
    nop
    nop
    mov eax, 00h
    jmp short L57426
    nop
    nop
    nop
L57421:
    mov eax, 01h
L57426:
    pop es
    pop gs
    pop fs
    pop ecx
    pop ebx
    pop edi
    pop esi
    pop ebp
    ret
Func573c5_ endp
Func57431_ proc near
    push ebp
    mov ebp, esp
    push esi
    push edi
    push ebx
    push ecx
    push fs
    push gs
    push es
    mov esi, offset _Datac8554
    mov dword ptr [esi+01ch], 08108h
    mov dword ptr [esi+014h], 00h
    mov ax, word ptr [ebp+08h]
    mov word ptr [esi+022h], ax
    mov dword ptr [esi], 00h
    mov ax, 0300h
    mov bl, 04bh
    mov bh, 00h
    mov cx, 00h
    mov edi, offset _Datac8554
    push ds
    pop es
    int 031h
    pop es
    pop gs
    pop fs
    pop ecx
    pop ebx
    pop edi
    pop esi
    pop ebp
    ret
Func57431_ endp
Func5747e_ proc near
    push ebp
    mov ebp, esp
    push esi
    push edi
    push ebx
    push ecx
    push fs
    push gs
    push es
    mov ax, 0800h
    mov bx, word ptr [ebp+0ah]
    mov cx, word ptr [ebp+08h]
    mov si, 00h
    mov di, 04000h
    int 031h
    mov ax, bx
    shl eax, 010h
    mov ax, cx
    pop es
    pop gs
    pop fs
    pop ecx
    pop ebx
    pop edi
    pop esi
    pop ebp
    ret
Func5747e_ endp
Func574b4_ proc near
    mov ax, ds
    mov gs, eax
    mov fs, eax
    mov es, eax
    push ebp
    mov ebp, esp
    push esi
    push edi
    push ebx
    push ecx
    push fs
    push gs
    push es
    mov ax, 01h
    mov bx, word ptr [ebp+08h]
    int 031h
    pop es
    pop gs
    pop fs
    pop ecx
    pop ebx
    pop edi
    pop esi
    pop ebp
    ret
Func574b4_ endp
Func574de_ proc near
    push ebp
    mov ebp, esp
    push esi
    push edi
    push ebx
    push ecx
    push fs
    push gs
    push es
    push esi
    push es
    mov ax, 0bh
    lfs edi, fword ptr [ebp+010h]
    call fword ptr [ebp+08h]
    pop es
    pop esi
    pop es
    pop gs
    pop fs
    pop ecx
    pop ebx
    pop edi
    pop esi
    pop ebp
    ret
Func574de_ endp
Func57504_ proc near
    mov ax, ds
    ret
Func57504_ endp
Func57508_ proc near
    mov ax, cs
    ret
Func57508_ endp
Func5750c_ proc near
    ret
Func5750c_ endp
_TEXT ends

    end

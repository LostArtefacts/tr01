.intel_syntax noprefix
.code32
.arch pentium

.text
.balign 4

.extern _Datac84c4
.extern _Datac8514
.extern _Datac8518
.extern _Datac851c
.extern _Datac8520
.extern _Datac8524
.extern _Datac8554
.extern _Datac85a4
.extern _Datac85a8
.extern _Datac85ac
.extern _Datac85b0
.extern _Datac85b4

.global Func56d2c_
.global Func56d2d_
.global Func56d6a_
.global Func56da7_
.global Func56e53_
.global Func56e89_
.global Func56ee6_
.global Func56f1c_
.global Func56f47_
.global Func56f81_
.global Func56fdd_
.global Func57000_
.global Func57023_
.global Func57067_
.global Func570bd_
.global Func570ed_
.global Func57110_
.global Func57145_
.global Func5716e_
.global Func57194_
.global Func571bb_
.global Func571e5_
.global Func5721a_
.global Func5724f_
.global Func5728e_
.global Func572d8_
.global Func5730e_
.global Func57339_
.global Func57356_
.global Func57397_
.global Func573c5_
.global Func57431_
.global Func5747e_
.global Func574b4_
.global Func574de_
.global Func57504_
.global Func57508_
.global Func5750c_

Func56d2c_:
    ret
Func56d2d_:
    push ebp
    {load} mov ebp, esp
    push esi
    push edi
    push ebx
    push ecx
    push fs
    push gs
    push es
    mov cx, word ptr [ebp+0x08]
    mov bx, word ptr [ebp+0x0a]
    mov di, word ptr [ebp+0x0c]
    mov si, word ptr [ebp+0x0e]
    mov ax, 0x0600
    int 0x031
    mov eax, 0x00
    jae short .Llock_done
    nop
    nop
    nop
    nop
    mov eax, 0x01
.Llock_done:
    pop es
    pop gs
    pop fs
    pop ecx
    pop ebx
    pop edi
    pop esi
    pop ebp
    ret
Func56d6a_:
    push ebp
    {load} mov ebp, esp
    push esi
    push edi
    push ebx
    push ecx
    push fs
    push gs
    push es
    mov cx, word ptr [ebp+0x08]
    mov bx, word ptr [ebp+0x0a]
    mov di, word ptr [ebp+0x0c]
    mov si, word ptr [ebp+0x0e]
    mov ax, 0x0601
    int 0x031
    mov eax, 0x00
    jae short .Lunlock_done
    nop
    nop
    nop
    nop
    mov eax, 0x01
.Lunlock_done:
    pop es
    pop gs
    pop fs
    pop ecx
    pop ebx
    pop edi
    pop esi
    pop ebp
    ret
Func56da7_:
    push ebp
    {load} mov ebp, esp
    push esi
    push edi
    push ebx
    push ecx
    push fs
    push gs
    push es
    mov ax, 0x00
    mov cx, 0x01
    int 0x031
    push eax
    mov word ptr [_Datac85b4], ax
    push eax
    {load} mov bx, ax
    mov ax, 0x08
    {load} xor cx, cx
    mov edx, dword ptr [ebp+0x08]
    int 0x031
    pop eax
    mov ax, 0x0501
    {load} xor ebx, ebx
    mov ecx, dword ptr [ebp+0x08]
    add cx, 0x050
    int 0x031
    jae short .Lalloc_ok
    nop
    nop
    nop
    nop
    pop eax
    mov eax, 0x00
    mov edx, 0x00
    jmp short .Lalloc_done
    nop
    nop
    nop
.Lalloc_ok:
    push ebx
    mov ebx, dword ptr [ebp+0x0c]
    mov word ptr [ebx], si
    mov word ptr [ebx+0x02], di
    pop ebx
    pop eax
    push eax
    mov esi, dword ptr [ebp+0x010]
    mov word ptr [esi], cx
    mov word ptr [esi+0x02], bx
    {load} mov dx, cx
    {load} mov cx, bx
    {load} mov bx, ax
    mov ax, 0x07
    int 0x031
    movzx ecx, word ptr [_Datac85b4]
    lar ecx, ecx
    shr ecx, 0x08
    or cx, 0x04000
    mov bx, word ptr [_Datac85b4]
    mov ax, 0x09
    int 0x031
    pop eax
    {load} xor edx, edx
    {load} mov dx, ax
    {load} xor eax, eax
.Lalloc_done:
    pop es
    pop gs
    pop fs
    pop ecx
    pop ebx
    pop edi
    pop esi
    pop ebp
    ret
Func56e53_:
    push eax
    mov ax, ds
    mov gs, eax
    pop eax
    push ebp
    {load} mov ebp, esp
    push esi
    push edi
    push ebx
    push ecx
    push fs
    push gs
    push es
    mov si, word ptr [ebp+0x010]
    mov di, word ptr [ebp+0x012]
    mov ax, 0x0502
    int 0x031
    mov ax, 0x01
    mov bx, word ptr [ebp+0x0c]
    int 0x031
    pop es
    pop gs
    pop fs
    pop ecx
    pop ebx
    pop edi
    pop esi
    pop ebp
    ret
Func56e89_:
    push ebp
    {load} mov ebp, esp
    push esi
    push edi
    push ebx
    push ecx
    push fs
    push gs
    push es
    mov ax, 0x00
    mov cx, 0x01
    int 0x031
    push eax
    push eax
    push eax
    push eax
    mov bx, word ptr [ebp+0x0c]
    mov ax, 0x06
    int 0x031
    pop ebx
    mov ax, 0x07
    int 0x031
    {load} xor ebx, ebx
    mov bx, word ptr [ebp+0x0c]
    lsl edx, ebx
    mov ax, 0x08
    pop ebx
    {load} xor ecx, ecx
    int 0x031
    mov ax, 0x09
    pop ebx
    lar ecx, ebx
    shr ecx, 0x08
    or cx, 0x04008
    int 0x031
    pop edx
    {load} xor eax, eax
    pop es
    pop gs
    pop fs
    pop ecx
    pop ebx
    pop edi
    pop esi
    pop ebp
    ret
Func56ee6_:
    push ebp
    {load} mov ebp, esp
    push esi
    push edi
    push ebx
    push ecx
    push fs
    push gs
    push es
    {load} xor eax, eax
    mov ax, 0x0100
    mov ebx, dword ptr [ebp+0x08]
    add ebx, 0x0100
    int 0x031
    mov esi, dword ptr [ebp+0x0c]
    shl eax, 0x04
    mov dword ptr [esi], eax
    mov esi, dword ptr [ebp+0x010]
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
Func56f1c_:
    mov ax, ds
    mov gs, eax
    {load} mov es, eax
    mov fs, eax
    push ebp
    {load} mov ebp, esp
    push esi
    push edi
    push ebx
    push ecx
    push fs
    push gs
    push es
    {load} xor eax, eax
    mov ax, 0x0101
    mov edx, dword ptr [ebp+0x08]
    int 0x031
    pop es
    pop gs
    pop fs
    pop ecx
    pop ebx
    pop edi
    pop esi
    pop ebp
    ret
Func56f47_:
    push ebp
    {load} mov ebp, esp
    push esi
    push edi
    push ebx
    push ecx
    push fs
    push gs
    push es
    mov eax, 0x08
    lfs edi, fword ptr [ebp+0x010]
    mov dx, ds
    call fword ptr [ebp+0x08]
    push ds
    push ds
    pop es
    mov edi, dword ptr [ebp+0x018]
    lds esi, fword ptr [ebp+0x010]
    {load} mov esi, edx
    mov ecx, 0x06a
    cld
    rep movsb
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
Func56f81_:
    push ebp
    {load} mov ebp, esp
    push esi
    push edi
    push ebx
    push ecx
    push fs
    push gs
    push es
    mov eax, 0x08
    lfs edi, fword ptr [ebp+0x010]
    mov dx, ds
    call fword ptr [ebp+0x08]
    push ds
    push es
    push ds
    pop es
    mov edi, dword ptr [ebp+0x018]
    lds esi, fword ptr [ebp+0x010]
    {load} mov esi, edx
    mov ecx, 0x06a
    cld
    rep movsb
    pop es
    pop ds
    push ds
    push es
    push ds
    pop es
    mov edi, dword ptr [ebp+0x018]
    mov ds, word ptr [ebp+0x014]
    data16
    mov word ptr es:[edi+0x044], ds
    data16
    mov word ptr es:[edi+0x04c], ds
    data16
    mov word ptr es:[edi+0x054], ds
    data16
    mov word ptr es:[edi+0x05c], ds
    pop es
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
Func56fdd_:
    push ebp
    {load} mov ebp, esp
    push esi
    push edi
    push ebx
    push ecx
    push fs
    push gs
    push es
    mov eax,0x05
    lfs edi,fword ptr [ebp+0x010]
    call fword ptr [ebp+0x08]
    pop es
    pop gs
    pop fs
    pop ecx
    pop ebx
    pop edi
    pop esi
    pop ebp
    ret
Func57000_:
    push ebp
    {load} mov ebp, esp
    push esi
    push edi
    push ebx
    push ecx
    push fs
    push gs
    push es
    mov eax,0x00
    lfs edi,fword ptr [ebp+0x010]
    call fword ptr [ebp+0x08]
    pop es
    pop gs
    pop fs
    pop ecx
    pop ebx
    pop edi
    pop esi
    pop ebp
    ret
Func57023_:
    push ebp
    {load} mov ebp, esp
    push esi
    push edi
    push ebx
    push ecx
    push fs
    push gs
    push es
    mov eax, 0x01
    lfs edi, fword ptr [ebp+0x010]
    call fword ptr [ebp+0x08]
    mov word ptr [_Datac85a4], ax
    {load} mov al, ch
    cbw
    mov word ptr [_Datac85ac], ax
    {load} mov al, cl
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
Func57067_:
    push ebp
    {load} mov ebp, esp
    push esi
    push edi
    push ebx
    push ecx
    push fs
    push gs
    push es
    push es
    mov eax, 0x02
    lfs edi, fword ptr [ebp+0x010]
    call fword ptr [ebp+0x08]
    push ds
    push ds
    pop es
    mov edi, dword ptr [ebp+0x018]
    lds esi, fword ptr [ebp+0x010]
    {load} mov esi, edx
    mov ecx, 0x06a
    cld
    rep movsb
    pop es
    pop ds
    push ds
    push es
    push ds
    pop es
    mov edi, dword ptr [ebp+0x018]
    data16
    mov word ptr es:[edi+0x044], ds
    data16
    mov word ptr es:[edi+0x04c], ds
    data16
    mov word ptr es:[edi+0x054], ds
    data16
    mov word ptr es:[edi+0x05c], ds
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
Func570bd_:
    push ebp
    {load} mov ebp, esp
    push esi
    push edi
    push ebx
    push ecx
    push fs
    push gs
    push es
    mov ebx, dword ptr [ebp+0x010]
    mov eax, dword ptr [ebp+0x014]
    {load} mov ch, al
    mov eax, dword ptr [ebp+0x018]
    {load} mov cl, al
    mov eax, 0x03
    lfs edi, fword ptr [ebp+0x01c]
    call fword ptr [ebp+0x08]
    pop es
    pop gs
    pop fs
    pop ecx
    pop ebx
    pop edi
    pop esi
    pop ebp
    ret
Func570ed_:
    push ebp
    {load} mov ebp, esp
    push esi
    push edi
    push ebx
    push ecx
    push fs
    push gs
    push es
    mov eax, 0x01
    lfs edi, fword ptr [ebp+0x010]
    call fword ptr [ebp+0x08]
    pop es
    pop gs
    pop fs
    pop ecx
    pop ebx
    pop edi
    pop esi
    pop ebp
    ret
Func57110_:
    push ebp
    {load} mov ebp, esp
    push esi
    push edi
    push ebx
    push ecx
    push fs
    push gs
    push es
    lfs edi, fword ptr [ebp+0x010]
    mov eax, 0x00
    mov bx, word ptr [ebp+0x018]
    mov cx, word ptr [ebp+0x01c]
    mov dx, word ptr [ebp+0x020]
    {load} mov ch, dl
    mov si, word ptr [ebp+0x02c]
    call fword ptr [ebp+0x08]
    pop es
    pop gs
    pop fs
    pop ecx
    pop ebx
    pop edi
    pop esi
    pop ebp
    ret
Func57145_:
    push ebp
    {load} mov ebp, esp
    push esi
    push edi
    push ebx
    push ecx
    push fs
    push gs
    push es
    lfs edi, fword ptr [ebp+0x010]
    mov eax, 0x04
    mov ecx, dword ptr [ebp+0x01c]
    mov edi, dword ptr [ebp+0x018]
    call fword ptr [ebp+0x08]
    pop es
    pop gs
    pop fs
    pop ecx
    pop ebx
    pop edi
    pop esi
    pop ebp
    ret
Func5716e_:
    push ebp
    {load} mov ebp, esp
    push esi
    push edi
    push ebx
    push ecx
    push fs
    push gs
    push es
    lfs edi, fword ptr [ebp+0x010]
    mov eax, 0x02
    mov ebx, dword ptr [ebp+0x018]
    call fword ptr [ebp+0x08]
    pop es
    pop gs
    pop fs
    pop ecx
    pop ebx
    pop edi
    pop esi
    pop ebp
    ret
Func57194_:
    push ebp
    {load} mov ebp, esp
    push esi
    push edi
    push ebx
    push ecx
    push fs
    push gs
    push es
    lfs edi, fword ptr [ebp+0x010]
    mov eax, 0x03
    mov bx, 0x08
    call fword ptr [ebp+0x08]
    pop es
    pop gs
    pop fs
    pop ecx
    pop ebx
    pop edi
    pop esi
    pop ebp
    ret
Func571bb_:
    push ebp
    {load} mov ebp, esp
    push esi
    push edi
    push ebx
    push ecx
    push fs
    push gs
    push es
    mov ax, 0x01600
    int 0x02f
    cmp ax, 0x0a03
    mov eax, dword ptr [ebp+0x014]
    jne short .Lwindows_done
    nop
    nop
    nop
    nop
.Lwindows_done:
    pop es
    pop gs
    pop fs
    pop ecx
    pop ebx
    pop edi
    pop esi
    pop ebp
    ret
Func571e5_:
    push ebp
    {load} mov ebp, esp
    push esi
    push edi
    push ebx
    push ecx
    push fs
    push gs
    push es
    mov ax, 0x01600
    int 0x02f
    cmp al, 0x03
    jne short .Lvds_lock_done
    nop
    nop
    nop
    nop
    mov ah, 0x081
    mov al, 0x0b
    mov ebx, dword ptr [ebp+0x08]
    {load} xor dx, dx
    int 0x04b
    mov ax, 0x00
.Lvds_lock_done:
    pop es
    pop gs
    pop fs
    pop ecx
    pop ebx
    pop edi
    pop esi
    pop ebp
    ret
Func5721a_:
    push ebp
    {load} mov ebp, esp
    push esi
    push edi
    push ebx
    push ecx
    push fs
    push gs
    push es
    mov ax, 0x01600
    int 0x02f
    cmp al, 0x03
    jne short .Lvds_unlock_done
    nop
    nop
    nop
    nop
    mov ah, 0x081
    mov al, 0x0c
    mov ebx, dword ptr [ebp+0x08]
    {load} xor dx, dx
    int 0x04b
    mov ax, 0x00
.Lvds_unlock_done:
    pop es
    pop gs
    pop fs
    pop ecx
    pop ebx
    pop edi
    pop esi
    pop ebp
    ret
Func5724f_:
    push ebp
    {load} mov ebp, esp
    push esi
    push edi
    push ebx
    push ecx
    push fs
    push gs
    push es
    lfs edi, fword ptr [ebp+0x010]
    mov eax, 0x04
    call fword ptr [ebp+0x08]
    mov dword ptr [_Datac8514], esi
    mov dword ptr [_Datac851c], edi
    mov ax, word ptr [ebp+0x014]
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
Func5728e_:
    push ebp
    {load} mov ebp, esp
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
    mov ebx, dword ptr [ebp+0x08]
    lds esi, fword ptr [_Datac8514]
    mov esi, dword ptr [esi+ebx*4]
    cmp esi, 0x0ffffffff
    jne short .Lcopy_name
    nop
    nop
    nop
    nop
    {load} xor eax, eax
    pop ds
    jmp short .Lname_done
    nop
    nop
    nop
.Lcopy_name:
    mov ecx, 0x050
    cld
    repne movsb
    pop ds
    mov eax, offset _Datac84c4
.Lname_done:
    pop es
    pop gs
    pop fs
    pop ecx
    pop ebx
    pop edi
    pop esi
    pop ebp
    ret
Func572d8_:
    push ebp
    {load} mov ebp, esp
    push esi
    push edi
    push ebx
    push ecx
    push fs
    push gs
    push es
    les esi, fword ptr [_Datac851c]
    mov eax, dword ptr [ebp+0x08]
    {load} mov ebx, eax
    shl eax, 1
    shl ebx, 0x02
    {load} add ebx, eax
    mov eax, dword ptr [ebp+0x0c]
    mov dword ptr es:[esi+ebx*1], eax
    data16
    mov word ptr es:[esi+ebx*1+0x04], ds
    pop es
    pop gs
    pop fs
    pop ecx
    pop ebx
    pop edi
    pop esi
    pop ebp
    ret
Func5730e_:
    push ebp
    {load} mov ebp, esp
    push esi
    push edi
    push ebx
    push ecx
    push fs
    push gs
    push es
    mov ax, 0x0500
    int 0x031
    push ds
    pop es
    mov edi, offset _Datac8524
    int 0x031
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
Func57339_:
    push ebp
    {load} mov ebp, esp
    push esi
    push edi
    push ebx
    push ecx
    push fs
    push gs
    push es
    mov ax, 0x01600
    int 0x02f
    pop es
    pop gs
    pop fs
    pop ecx
    pop ebx
    pop edi
    pop esi
    pop ebp
    ret
Func57356_:
    push ebp
    {load} mov ebp, esp
    push esi
    push edi
    push ebx
    push ecx
    push fs
    push gs
    push es
    mov ax, 0x0100
    mov ebx, dword ptr [ebp+0x08]
    int 0x031
    jae short .Ldos_alloc_ok
    nop
    nop
    nop
    nop
    mov eax, 0x01
    jmp short .Ldos_alloc_done
    nop
    nop
    nop
.Ldos_alloc_ok:
    mov esi, dword ptr [ebp+0x0c]
    mov word ptr [esi], dx
    mov esi, dword ptr [ebp+0x010]
    mov word ptr [esi], ax
    mov eax, 0x00
.Ldos_alloc_done:
    pop es
    pop gs
    pop fs
    pop ecx
    pop ebx
    pop edi
    pop esi
    pop ebp
    ret
Func57397_:
    mov ax, ds
    mov gs, eax
    mov fs, eax
    {load} mov es, eax
    push ebp
    {load} mov ebp, esp
    push esi
    push edi
    push ebx
    push ecx
    push fs
    push gs
    push es
    mov ax, 0x0101
    mov dx, word ptr [ebp+0x08]
    int 0x031
    mov ax, 0x00
    pop es
    pop gs
    pop fs
    pop ecx
    pop ebx
    pop edi
    pop esi
    pop ebp
    ret
Func573c5_:
    push ebp
    {load} mov ebp, esp
    push esi
    push edi
    push ebx
    push ecx
    push fs
    push gs
    push es
    mov esi, offset _Datac8554
    mov dword ptr [esi+0x01c], 0x08107
    mov dword ptr [esi+0x014], 0x00
    mov ax, word ptr [ebp+0x08]
    mov word ptr [esi+0x022], ax
    mov dword ptr [esi], 0x00
    mov ax, 0x0300
    mov bl, 0x04b
    mov bh, 0x00
    mov cx, 0x00
    mov edi, offset _Datac8554
    push ds
    pop es
    int 0x031
    mov esi, offset _Datac8554
    and word ptr [esi+0x020], 0x01
    jne short .Lvds_failed
    nop
    nop
    nop
    nop
    mov eax, 0x00
    jmp short .Lvds_done
    nop
    nop
    nop
.Lvds_failed:
    mov eax, 0x01
.Lvds_done:
    pop es
    pop gs
    pop fs
    pop ecx
    pop ebx
    pop edi
    pop esi
    pop ebp
    ret
Func57431_:
    push ebp
    {load} mov ebp, esp
    push esi
    push edi
    push ebx
    push ecx
    push fs
    push gs
    push es
    mov esi, offset _Datac8554
    mov dword ptr [esi+0x01c], 0x08108
    mov dword ptr [esi+0x014], 0x00
    mov ax, word ptr [ebp+0x08]
    mov word ptr [esi+0x022], ax
    mov dword ptr [esi], 0x00
    mov ax, 0x0300
    mov bl, 0x04b
    mov bh, 0x00
    mov cx, 0x00
    mov edi, offset _Datac8554
    push ds
    pop es
    int 0x031
    pop es
    pop gs
    pop fs
    pop ecx
    pop ebx
    pop edi
    pop esi
    pop ebp
    ret
Func5747e_:
    push ebp
    {load} mov ebp, esp
    push esi
    push edi
    push ebx
    push ecx
    push fs
    push gs
    push es
    mov ax, 0x0800
    mov bx, word ptr [ebp+0x0a]
    mov cx, word ptr [ebp+0x08]
    mov si, 0x00
    mov di, 0x04000
    int 0x031
    {load} mov ax, bx
    shl eax, 0x010
    {load} mov ax, cx
    pop es
    pop gs
    pop fs
    pop ecx
    pop ebx
    pop edi
    pop esi
    pop ebp
    ret
Func574b4_:
    mov ax, ds
    mov gs, eax
    mov fs, eax
    {load} mov es, eax
    push ebp
    {load} mov ebp, esp
    push esi
    push edi
    push ebx
    push ecx
    push fs
    push gs
    push es
    mov ax, 0x01
    mov bx, word ptr [ebp+0x08]
    int 0x031
    pop es
    pop gs
    pop fs
    pop ecx
    pop ebx
    pop edi
    pop esi
    pop ebp
    ret
Func574de_:
    push ebp
    {load} mov ebp, esp
    push esi
    push edi
    push ebx
    push ecx
    push fs
    push gs
    push es
    push esi
    push es
    mov ax, 0x0b
    lfs edi, fword ptr [ebp+0x010]
    call fword ptr [ebp+0x08]
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
Func57504_:
    mov ax, ds
    ret
Func57508_:
    mov ax, cs
    ret
Func5750c_:
    ret


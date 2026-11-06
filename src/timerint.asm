    .386p
    .model flat

    extrn _sos_timer_previous_offset:byte
    extrn _sos_timer_previous_selector:byte
    extrn _sos_timer_irq_callback:byte
    extrn _sos_timer_callback_selector:byte
    extrn _sos_timer_private_stack_pointer:byte
    extrn _sos_timer_private_stack_selector:byte
    extrn _sos_timer_saved_esp:byte
    extrn _sos_timer_saved_ss_and_stack:byte
    extrn _sos_timer_dispatch_esp:byte
    extrn _sos_timer_chain_eax:byte
    extrn _sos_timer_irq_busy:byte
    extrn _sos_timer_irq_enabled:byte
    extrn _sos_timer_use_dpmi_vector:byte
    extrn ___GETDSStart_:near

    public sosTIMERInterruptCodeStart_
    public sosTIMERInterruptHandler_
    public sosTIMERProgramPIT_
    public sosTIMERInstallInterrupt_
    public sosTIMERMaskInterrupt_
    public sosTIMERUnmaskInterrupt_
    public sosTIMERRestoreInterrupt_
    public sosTIMERChainInterrupt_
    public sosTIMERInterruptCodeEnd_

    .code
sosTIMERInterruptCodeStart_ proc near
    ret
sosTIMERInterruptCodeStart_ endp
sosTIMERInterruptHandler_ proc near
    push ds
    call ___GETDSStart_
    cmp word ptr [_sos_timer_irq_busy], 01h
    je short handler_busy
    nop
    nop
    nop
    nop
    push ax
    mov ax, 020h
    out 020h, al
    pop ax
    mov word ptr [_sos_timer_irq_busy], 01h
    mov dword ptr [_sos_timer_saved_esp], esp
    mov word ptr [_sos_timer_saved_ss_and_stack], ss
    lss esp, fword ptr [_sos_timer_private_stack_pointer]
    pusha
    push es
    push fs
    push gs
    push ds
    pop es
    mov dword ptr [_sos_timer_dispatch_esp], esp
    call dword ptr [_sos_timer_irq_callback]
    pop gs
    pop fs
    pop es
    popa
    lss esp, fword ptr [_sos_timer_saved_esp]
    mov word ptr [_sos_timer_irq_busy], 00h
handler_busy:
    pop ds
    iretd
sosTIMERInterruptHandler_ endp
sosTIMERProgramPIT_ proc near
    push ebp
    mov ebp, esp
    push esi
    push edi
    push ebx
    push ecx
    push fs
    push gs
    push es
    cmp dword ptr [_sos_timer_irq_enabled], 00h
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
sosTIMERProgramPIT_ endp
sosTIMERInstallInterrupt_ proc near
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
    mov dword ptr [_sos_timer_irq_callback], edi
    mov word ptr [_sos_timer_callback_selector], ds
    mov word ptr [_sos_timer_private_stack_selector], ds
    cmp dword ptr [_sos_timer_irq_enabled], 00h
    je install_done
    mov dx, 021h
    in al, dx
    or al, 01h
    out dx, al
    cmp dword ptr [_sos_timer_use_dpmi_vector], 00h
    je short install_dos
    nop
    nop
    nop
    nop
    mov ax, 0204h
    mov bl, 08h
    int 031h
    mov dword ptr [_sos_timer_previous_offset], edx
    mov word ptr [_sos_timer_previous_selector], cx
    mov ax, 0205h
    mov bl, 08h
    mov edx, offset sosTIMERInterruptHandler_
    mov cx, cs
    int 031h
    jmp short program_timer
    nop
    nop
    nop
install_dos:
    mov ax, 03508h
    int 021h
    mov dword ptr [_sos_timer_previous_offset], ebx
    mov word ptr [_sos_timer_previous_selector], es
    push ds
    xor ax, ax
    mov es, eax
    mov ax, 02508h
    mov edx, offset sosTIMERInterruptHandler_
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
sosTIMERInstallInterrupt_ endp
sosTIMERMaskInterrupt_ proc near
    push ebp
    mov ebp, esp
    push esi
    push edi
    push ebx
    push ecx
    push fs
    push gs
    push es
    cmp dword ptr [_sos_timer_irq_enabled], 00h
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
sosTIMERMaskInterrupt_ endp
sosTIMERUnmaskInterrupt_ proc near
    push ebp
    mov ebp, esp
    push esi
    push edi
    push ebx
    push ecx
    push fs
    push gs
    push es
    cmp dword ptr [_sos_timer_irq_enabled], 00h
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
sosTIMERUnmaskInterrupt_ endp
sosTIMERRestoreInterrupt_ proc near
    push ebp
    mov ebp, esp
    push esi
    push edi
    push ebx
    push ecx
    push fs
    push gs
    push es
    cmp dword ptr [_sos_timer_irq_enabled], 00h
    je short remove_done
    nop
    nop
    nop
    nop
    mov dx, 021h
    in al, dx
    or al, 01h
    out dx, al
    cmp dword ptr [_sos_timer_use_dpmi_vector], 00h
    je short restore_dos
    nop
    nop
    nop
    nop
    mov ax, 0205h
    mov bl, 08h
    mov cx, word ptr [_sos_timer_previous_selector]
    mov edx, dword ptr [_sos_timer_previous_offset]
    int 031h
    jmp short reset_timer
    nop
    nop
    nop
restore_dos:
    push ds
    mov ax, 02508h
    mov cx, word ptr [_sos_timer_previous_selector]
    mov edx, dword ptr [_sos_timer_previous_offset]
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
sosTIMERRestoreInterrupt_ endp
sosTIMERChainInterrupt_ proc near
    cmp dword ptr [_sos_timer_irq_enabled], 00h
    je short no_timer
    nop
    nop
    nop
    nop
    mov word ptr [_sos_timer_irq_busy], 00h
    mov esp, dword ptr [_sos_timer_dispatch_esp]
    pop gs
    pop fs
    pop es
    popa
    lss esp, fword ptr [_sos_timer_saved_esp]
    mov dword ptr [_sos_timer_chain_eax], eax
    pop eax
    mov word ptr [_sos_timer_dispatch_esp], ax
    push eax
    push eax
    mov eax, dword ptr [_sos_timer_previous_offset]
    mov dword ptr [esp], eax
    mov eax, dword ptr [_sos_timer_previous_selector]
    mov dword ptr [esp+04h], eax
    mov eax, dword ptr [_sos_timer_chain_eax]
    push eax
    mov ax, word ptr [_sos_timer_dispatch_esp]
    mov ds, eax
    pop eax
    retf
no_timer:
    ret
sosTIMERChainInterrupt_ endp
sosTIMERInterruptCodeEnd_ proc near
    ret
sosTIMERInterruptCodeEnd_ endp

    end

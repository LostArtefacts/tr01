.intel_syntax noprefix
.code32
.arch pentium

.text
.balign 4

.extern _sos_detect_environment_name
.extern _sos_detect_environment_names_offset
.extern _sos_detect_environment_names_selector
.extern _sos_detect_environment_values_offset
.extern _sos_detect_environment_values_selector
.extern _sos_dpmi_memory_info
.extern _sos_dpmi_real_registers
.extern _sos_detect_port
.extern _sos_detect_dma
.extern _sos_detect_irq
.extern _sos_detect_hardware
.extern _sos_dpmi_allocated_selector

.global sosDPMICodeStart_
.global sosDPMILockMemory_
.global sosDPMIUnlockMemory_
.global sosDPMIAllocateLinearMemory_
.global sosDPMIFreeLinearMemory_
.global sosDPMICreateCodeAlias_
.global sosDPMIAllocateDOSBuffer_
.global sosDPMIFreeDOSBuffer_
.global sosDRIVERCopyInfo_
.global sosDRIVERGetConfig_
.global sosDRIVERStop_
.global sosDETECTProbe_
.global sosDETECTProbeSettings_
.global sosDETECTGetDriverInfo_
.global sosDETECTTestSettings_
.global sosDRIVERUninit_
.global sosDRIVERInit_
.global sosDRIVERSetBuffer_
.global sosDRIVERSetRate_
.global sosDRIVERSetSampleSize_
.global sosWindowsCompatibilityStub_
.global sosVDSDisableDMATranslation_
.global sosVDSEnableDMATranslation_
.global sosDETECTGetEnvironmentTables_
.global sosDETECTGetEnvironmentName_
.global sosDETECTSetEnvironmentValue_
.global sosDPMIGetFreeMemory_
.global sosGetWindowsVersion_
.global sosDPMIAllocateDOSMemory_
.global sosDPMIFreeDOSMemory_
.global sosVDSLockBuffer_
.global sosVDSUnlockBuffer_
.global sosDPMIMapPhysicalMemory_
.global sosDPMIFreeSelector_
.global sosDRIVERGetDMAPositionCallback_
.global sosGetDataSelector_
.global sosGetCodeSelector_
.global sosDPMICodeEnd_

sosDPMICodeStart_:
    ret
sosDPMILockMemory_:
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
sosDPMIUnlockMemory_:
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
sosDPMIAllocateLinearMemory_:
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
    mov word ptr [_sos_dpmi_allocated_selector], ax
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
    movzx ecx, word ptr [_sos_dpmi_allocated_selector]
    lar ecx, ecx
    shr ecx, 0x08
    or cx, 0x04000
    mov bx, word ptr [_sos_dpmi_allocated_selector]
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
sosDPMIFreeLinearMemory_:
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
sosDPMICreateCodeAlias_:
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
sosDPMIAllocateDOSBuffer_:
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
sosDPMIFreeDOSBuffer_:
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
sosDRIVERCopyInfo_:
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
sosDRIVERGetConfig_:
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
sosDRIVERStop_:
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
sosDETECTProbe_:
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
sosDETECTProbeSettings_:
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
    mov word ptr [_sos_detect_port], ax
    {load} mov al, ch
    cbw
    mov word ptr [_sos_detect_irq], ax
    {load} mov al, cl
    cbw
    mov word ptr [_sos_detect_dma], ax
    mov word ptr [_sos_detect_hardware], dx
    pop es
    pop gs
    pop fs
    pop ecx
    pop ebx
    pop edi
    pop esi
    pop ebp
    ret
sosDETECTGetDriverInfo_:
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
sosDETECTTestSettings_:
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
sosDRIVERUninit_:
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
sosDRIVERInit_:
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
sosDRIVERSetBuffer_:
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
sosDRIVERSetRate_:
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
sosDRIVERSetSampleSize_:
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
sosWindowsCompatibilityStub_:
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
sosVDSDisableDMATranslation_:
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
sosVDSEnableDMATranslation_:
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
sosDETECTGetEnvironmentTables_:
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
    mov dword ptr [_sos_detect_environment_names_offset], esi
    mov dword ptr [_sos_detect_environment_values_offset], edi
    mov ax, word ptr [ebp+0x014]
    mov word ptr [_sos_detect_environment_names_selector], ax
    mov word ptr [_sos_detect_environment_values_selector], ax
    pop es
    pop gs
    pop fs
    pop ecx
    pop ebx
    pop edi
    pop esi
    pop ebp
    ret
sosDETECTGetEnvironmentName_:
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
    mov edi, offset _sos_detect_environment_name
    mov ebx, dword ptr [ebp+0x08]
    lds esi, fword ptr [_sos_detect_environment_names_offset]
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
    mov eax, offset _sos_detect_environment_name
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
sosDETECTSetEnvironmentValue_:
    push ebp
    {load} mov ebp, esp
    push esi
    push edi
    push ebx
    push ecx
    push fs
    push gs
    push es
    les esi, fword ptr [_sos_detect_environment_values_offset]
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
sosDPMIGetFreeMemory_:
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
    mov edi, offset _sos_dpmi_memory_info
    int 0x031
    mov eax, dword ptr [_sos_dpmi_memory_info]
    pop es
    pop gs
    pop fs
    pop ecx
    pop ebx
    pop edi
    pop esi
    pop ebp
    ret
sosGetWindowsVersion_:
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
sosDPMIAllocateDOSMemory_:
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
sosDPMIFreeDOSMemory_:
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
sosVDSLockBuffer_:
    push ebp
    {load} mov ebp, esp
    push esi
    push edi
    push ebx
    push ecx
    push fs
    push gs
    push es
    mov esi, offset _sos_dpmi_real_registers
    mov dword ptr [esi+0x01c], 0x08107
    mov dword ptr [esi+0x014], 0x00
    mov ax, word ptr [ebp+0x08]
    mov word ptr [esi+0x022], ax
    mov dword ptr [esi], 0x00
    mov ax, 0x0300
    mov bl, 0x04b
    mov bh, 0x00
    mov cx, 0x00
    mov edi, offset _sos_dpmi_real_registers
    push ds
    pop es
    int 0x031
    mov esi, offset _sos_dpmi_real_registers
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
sosVDSUnlockBuffer_:
    push ebp
    {load} mov ebp, esp
    push esi
    push edi
    push ebx
    push ecx
    push fs
    push gs
    push es
    mov esi, offset _sos_dpmi_real_registers
    mov dword ptr [esi+0x01c], 0x08108
    mov dword ptr [esi+0x014], 0x00
    mov ax, word ptr [ebp+0x08]
    mov word ptr [esi+0x022], ax
    mov dword ptr [esi], 0x00
    mov ax, 0x0300
    mov bl, 0x04b
    mov bh, 0x00
    mov cx, 0x00
    mov edi, offset _sos_dpmi_real_registers
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
sosDPMIMapPhysicalMemory_:
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
sosDPMIFreeSelector_:
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
sosDRIVERGetDMAPositionCallback_:
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
sosGetDataSelector_:
    mov ax, ds
    ret
sosGetCodeSelector_:
    mov ax, cs
    ret
sosDPMICodeEnd_:
    ret


    .586p

_TEXT segment dword public use32 'CODE'
_TEXT ends
_DATA segment dword public use32 'DATA'
_DATA ends

    assume cs:FLAT, ds:FLAT, es:FLAT, ss:FLAT

    extrn Func522ad_:near
    extrn _Datac7e40:byte
    extrn _Datac7e44:byte
    extrn _Datac7fdc:byte
    extrn _Datac7fe0:byte
    extrn _Datac7fe4:byte
    extrn _Datac8020:byte
    extrn _Datac8024:byte
    extrn _Datac8060:byte
    extrn _Datac8064:byte
    extrn _Datac80a0:byte
    extrn _Datac80a4:byte
    extrn _Datac80a6:byte
    extrn _Datac80e4:byte
    extrn _Datac8124:byte

    public Func4aa5c_
    public sosTIMERInitSystem_
    public sosTIMERUninitSystem_
    public sosTIMERRegisterEvent_
    public Func4ad70_
    public sosTIMERRemoveEvent_
    public Func4b070_
    public Func4b09a_
    public Func4b0cf_
    public Func4b16f_
    public Func4b189_
    public _Datac66e8

_TEXT segment
Func4aa5c_ proc near
    push ebx
    push ecx
    push edx
    push esi
    push edi
    push ebp
    db 089h, 0e5h
    db 081h, 0ech, 000h, 000h, 000h, 000h
    db 05dh
    db 05fh
    db 05eh
    db 05ah
    db 059h
    db 05bh
    db 0c3h
Func4aa5c_ endp
sosTIMERInitSystem_ proc near
    db 053h
    db 051h
    db 056h
    db 057h
    db 055h
    db 089h, 0e5h
    db 081h, 0ech, 010h, 000h, 000h, 000h
    db 089h, 045h, 0f0h
    db 089h, 055h, 0f4h
    db 0f6h, 045h, 0f4h, 002h
    je short L4aa93
    db 0c6h, 005h
    dd offset _Datac7e44
    db 001h
    jmp short L4aa9a
L4aa93:
    db 0c6h, 005h
    dd offset _Datac7e44
    db 000h
L4aa9a:
    db 0f6h, 045h, 0f4h, 001h
    jne short L4aacd
    db 0c6h, 005h
    dd offset _Datac7e40
    db 001h
    db 080h, 00dh
    dd offset _Datac7fdc
    db 001h
    db 0e8h, 0ceh, 077h, 000h, 000h
    db 0b8h
    dd offset Func4b0cf_
    db 050h
    db 068h, 0ffh, 0ffh, 000h, 000h
    db 0e8h, 003h, 077h, 000h, 000h
    db 083h, 0c4h, 008h
    db 0e8h, 0e2h, 077h, 000h, 000h
    jmp short L4aad4
L4aacd:
    db 080h, 025h
    dd offset _Datac7fdc
    db 0feh
L4aad4:
    db 083h, 07dh, 0f0h, 000h
    db 074h, 006h
    db 0f6h, 045h, 0f4h, 001h
    db 074h, 002h
L4aae0:
    db 0ebh, 04ch
L4aae2:
    db 081h, 07dh, 0f0h, 000h, 0ffh, 000h, 000h
    db 075h, 016h
    db 0b8h, 0ffh, 0ffh, 000h, 000h
    db 0e8h, 0a5h, 005h, 000h, 000h
    db 0c7h, 005h
    dd offset _Datac8060
    db 000h, 0ffh, 000h, 000h
    db 0ebh, 017h
L4ab01:
    db 031h, 0d2h
    db 0b8h, 0dch, 034h, 012h, 000h
    db 0f7h, 075h, 0f0h
    db 0e8h, 08ah, 005h, 000h, 000h
    db 08bh, 045h, 0f0h
    db 0a3h
    dd offset _Datac8060
L4ab18:
    mov dword ptr [_Datac8020], offset Func4b16f_
    db 0c7h, 005h
    dd offset _Datac80a0
    db 000h, 000h, 001h, 000h
    jmp short L4ab38
L4ab2e:
    db 0c7h, 005h
    dd offset _Datac7fe0
    db 0ffh, 0ffh, 000h, 000h
L4ab38:
    mov dword ptr [ebp-08h], 00h
    mov eax, dword ptr [ebp-08h]
    leave
    pop edi
    pop esi
    pop ecx
    pop ebx
    ret
sosTIMERInitSystem_ endp
sosTIMERUninitSystem_ proc near
    push ebx
    push ecx
    push edx
    push esi
    push edi
    push ebp
    db 089h, 0e5h
    db 081h, 0ech, 008h, 000h, 000h, 000h
    db 089h, 045h, 0f8h
    db 0f6h, 005h
    dd offset _Datac7fdc
    db 001h
    je short L4ab71
    db 0e8h, 01ah, 077h, 000h, 000h
    db 0e8h, 06dh, 077h, 000h, 000h
    db 0e8h, 03ch, 077h, 000h, 000h
L4ab71:
    db 0c7h, 045h, 0fch, 000h, 000h, 000h, 000h
    db 08bh, 045h, 0fch
    db 0c9h
    db 05fh
    db 05eh
    db 05ah
    db 059h
    db 05bh
    db 0c3h
sosTIMERUninitSystem_ endp
sosTIMERRegisterEvent_ proc near
    db 051h
    db 056h
    db 057h
    db 055h
    db 089h, 0e5h
    db 081h, 0ech, 020h, 000h, 000h, 000h
    db 089h, 045h, 0e0h
    db 089h, 055h, 0e4h
    db 089h, 05dh, 0e8h
    db 0c7h, 045h, 0f4h, 000h, 000h, 000h, 000h
    db 0c7h, 045h, 0fch, 000h, 000h, 000h, 000h
L4aba5:
    db 083h, 07dh, 0fch, 010h
    db 072h, 007h
    db 0ebh, 014h
L4abad:
    db 0ffh, 045h, 0fch
    db 0ebh, 0f3h
L4abb2:
    db 08bh, 045h, 0fch
    shl eax, 02h
    db 083h, 0b8h
    dd offset _Datac7fe4
    db 000h
    db 075h, 0ech
L4abc1:
    db 083h, 07dh, 0fch, 010h
    db 072h, 00ch
    db 0c7h, 045h, 0ech, 00bh, 000h, 000h, 000h
    db 0e9h, 095h, 001h, 000h, 000h
L4abd3:
    db 0f6h, 005h
    dd offset _Datac7fdc
    db 001h
    db 074h, 005h
    db 0e8h, 0a0h, 076h, 000h, 000h
L4abe1:
    db 08bh, 045h, 0fch
    db 089h, 045h, 0f8h
    db 08bh, 055h, 0fch
    db 0c1h, 0e2h, 002h
    mov eax, dword ptr [ebp-01ch]
    db 089h, 082h
    dd offset _Datac7fe4
    db 08bh, 055h, 0fch
    db 0c1h, 0e2h, 002h
    mov eax, dword ptr [ebp-020h]
    db 089h, 082h
    dd offset _Datac8024
    db 031h, 0d2h
    mov eax, 01234dch
    div dword ptr [ebp-020h]
    cmp eax, dword ptr [_Datac7fe0]
    jae short L4ac44
    db 031h, 0d2h
    mov eax, 01234dch
    div dword ptr [ebp-020h]
    db 0e8h, 074h, 004h, 000h, 000h
    mov ecx, dword ptr [_Datac7fe0]
    shl ecx, 010h
    db 031h, 0d2h
    mov eax, 01234dch
    div dword ptr [ebp-020h]
    db 089h, 0c3h
    db 031h, 0d2h
    db 089h, 0c8h
    div ebx
    mov dword ptr [ebp-0ch], eax
L4ac44:
    mov dword ptr [ebp-04h], 00h
L4ac4b:
    cmp dword ptr [ebp-04h], 010h
    jb short L4ac5b
    jmp near ptr L4ad4b
L4ac56:
    inc dword ptr [ebp-04h]
    jmp short L4ac4b
L4ac5b:
    mov eax, dword ptr [ebp-04h]
    shl eax, 02h
    cmp dword ptr [eax+_Datac7fe4], 00h
    je near ptr L4ad46
    mov eax, dword ptr [ebp-04h]
    shl eax, 02h
    cmp dword ptr [eax+_Datac8024], 0ff00h
    jne short L4acc6
    cmp dword ptr [_Datac7fe0], 0ffffh
    jne short L4ac9e
    mov eax, dword ptr [ebp-04h]
    shl eax, 02h
    mov dword ptr [eax+_Datac8064], 010000h
    jmp short L4acc4
L4ac9e:
    db 031h, 0d2h
    mov eax, 01234dch
    div dword ptr [_Datac7fe0]
    db 089h, 0c3h
    db 031h, 0d2h
    mov eax, 0123333h
    div ebx
    db 089h, 0c3h
    mov eax, dword ptr [ebp-04h]
    shl eax, 02h
    mov dword ptr [eax+_Datac8064], ebx
L4acc4:
    jmp short L4acf8
L4acc6:
    mov eax, dword ptr [ebp-04h]
    shl eax, 02h
    mov ecx, dword ptr [eax+_Datac8024]
    shl ecx, 010h
    db 031h, 0d2h
    mov eax, 01234dch
    div dword ptr [_Datac7fe0]
    db 089h, 0c3h
    db 031h, 0d2h
    db 089h, 0c8h
    div ebx
    db 089h, 0c3h
    mov eax, dword ptr [ebp-04h]
    shl eax, 02h
    mov dword ptr [eax+_Datac8064], ebx
L4acf8:
    cmp dword ptr [ebp-0ch], 00h
    je short L4ad46
    mov eax, dword ptr [ebp-04h]
    shl eax, 02h
    mov edx, dword ptr [ebp-0ch]
    and edx, 0ffffh
    mov eax, dword ptr [eax+_Datac80a4]
    imul eax, edx
    shr eax, 010h
    mov dword ptr [ebp-010h], eax
    mov eax, dword ptr [ebp-04h]
    shl eax, 02h
    mov edx, dword ptr [ebp-0ch]
    shr edx, 010h
    mov eax, dword ptr [eax+_Datac80a4]
    imul eax, edx
    shr eax, 010h
    add dword ptr [ebp-010h], eax
    mov edx, dword ptr [ebp-04h]
    shl edx, 02h
    mov eax, dword ptr [ebp-010h]
    mov dword ptr [edx+_Datac80a4], eax
L4ad46:
    jmp near ptr L4ac56
L4ad4b:
    test byte ptr [_Datac7fdc], 01h
    je short L4ad59
    call Func522ad_
L4ad59:
    mov eax, dword ptr [ebp-08h]
    mov edx, dword ptr [ebp-018h]
    mov dword ptr [edx], eax
    mov dword ptr [ebp-014h], 00h
L4ad68:
    mov eax, dword ptr [ebp-014h]
    leave
    pop edi
    pop esi
    pop ecx
    ret
sosTIMERRegisterEvent_ endp
Func4ad70_ proc near
    push ebx
    push ecx
    push esi
    push edi
    push ebp
    db 089h, 0e5h
    db 081h, 0ech, 010h, 000h, 000h, 000h
    db 089h, 045h, 0f0h
    db 089h, 055h, 0f4h
    db 083h, 07dh, 0f0h, 010h
    db 072h, 00ch
    db 0c7h, 045h, 0f8h, 00ah, 000h, 000h, 000h
    db 0e9h, 03ah, 001h, 000h, 000h
L4ad95:
    db 08bh, 045h, 0f0h
    db 0c1h, 0e0h, 002h
    db 083h, 0b8h
    dd offset _Datac7fe4
    db 000h
    db 00fh, 084h, 017h, 001h, 000h, 000h
    db 0f6h, 005h
    dd offset _Datac7fdc
    db 001h
    je short L4adb6
    db 0e8h, 0cbh, 074h, 000h, 000h
L4adb6:
    db 08bh, 055h, 0f0h
    db 0c1h, 0e2h, 002h
    db 08bh, 045h, 0f4h
    mov dword ptr [edx+_Datac8024], eax
    db 031h, 0d2h
    db 0b8h, 0dch, 034h, 012h, 000h
    db 0f7h, 075h, 0f4h
    cmp eax, dword ptr [_Datac7fe0]
    db 073h, 00fh
    db 031h, 0d2h
    db 0b8h, 0dch, 034h, 012h, 000h
    db 0f7h, 075h, 0f4h
    db 0e8h, 0b4h, 002h, 000h, 000h
L4ade6:
    db 0c7h, 045h, 0fch, 000h, 000h, 000h, 000h
L4aded:
    db 083h, 07dh, 0fch, 010h
    db 072h, 00ah
    db 0e9h, 0b7h, 000h, 000h, 000h
L4adf8:
    db 0ffh, 045h, 0fch
    db 0ebh, 0f0h
L4adfd:
    db 08bh, 045h, 0fch
    db 0c1h, 0e0h, 002h
    db 083h, 0b8h
    dd offset _Datac7fe4
    db 000h
    db 00fh, 084h, 09ah, 000h, 000h, 000h
    db 08bh, 045h, 0fch
    shl eax, 02h
    cmp dword ptr [eax+_Datac8024], 0ff00h
    jne short L4ae68
    cmp dword ptr [_Datac7fe0], 0ffffh
    jne short L4ae40
    mov eax, dword ptr [ebp-04h]
    shl eax, 02h
    mov dword ptr [eax+_Datac8064], 010000h
    jmp short L4ae66
L4ae40:
    db 031h, 0d2h
    mov eax, 01234dch
    div dword ptr [_Datac7fe0]
    db 089h, 0c3h
    db 031h, 0d2h
    mov eax, 0123333h
    div ebx
    db 089h, 0c3h
    mov eax, dword ptr [ebp-04h]
    shl eax, 02h
    mov dword ptr [eax+_Datac8064], ebx
L4ae66:
    jmp short L4ae9a
L4ae68:
    mov eax, dword ptr [ebp-04h]
    shl eax, 02h
    mov ecx, dword ptr [eax+_Datac8024]
    shl ecx, 010h
    db 031h, 0d2h
    mov eax, 01234dch
    div dword ptr [_Datac7fe0]
    db 089h, 0c3h
    db 031h, 0d2h
    db 089h, 0c8h
    div ebx
    db 089h, 0c3h
    mov eax, dword ptr [ebp-04h]
    shl eax, 02h
    mov dword ptr [eax+_Datac8064], ebx
L4ae9a:
    mov eax, dword ptr [ebp-04h]
    shl eax, 02h
    mov dword ptr [eax+_Datac80a4], 00h
L4aeaa:
    jmp near ptr L4adf8
L4aeaf:
    test byte ptr [_Datac7fdc], 01h
    je short L4aebd
    call Func522ad_
L4aebd:
    jmp short L4aec8
L4aebf:
    mov dword ptr [ebp-08h], 0ah
    jmp short L4aecf
L4aec8:
    mov dword ptr [ebp-08h], 00h
L4aecf:
    mov eax, dword ptr [ebp-08h]
    leave
    pop edi
    pop esi
    pop ecx
    pop ebx
    ret
Func4ad70_ endp
sosTIMERRemoveEvent_ proc near
    push ebx
    push ecx
    push edx
    push esi
    push edi
    push ebp
    db 089h, 0e5h
    db 081h, 0ech, 010h, 000h, 000h, 000h
    db 089h, 045h, 0f0h
    db 0c7h, 045h, 0f8h, 000h, 000h, 000h, 000h
    db 08bh, 045h, 0f0h
    db 0c1h, 0e0h, 002h
    db 0c7h, 080h
    dd offset _Datac7fe4
    db 000h, 000h, 000h, 000h
    db 0c7h, 045h, 0fch, 000h, 000h, 000h, 000h
L4af07:
    db 083h, 07dh, 0fch, 010h
    db 072h, 007h
    db 0ebh, 04ah
L4af0f:
    db 0ffh, 045h, 0fch
    db 0ebh, 0f3h
L4af14:
    db 08bh, 045h, 0fch
    db 0c1h, 0e0h, 002h
    db 083h, 0b8h
    dd offset _Datac7fe4
    db 000h
    db 074h, 034h
    db 08bh, 045h, 0fch
    db 0c1h, 0e0h, 002h
    mov eax, dword ptr [eax+_Datac8024]
    db 03bh, 045h, 0f8h
    db 076h, 012h
    db 08bh, 045h, 0fch
    db 0c1h, 0e0h, 002h
    db 081h, 0b8h
    dd offset _Datac8024
    db 000h, 0ffh, 000h, 000h
    db 075h, 002h
L4af46:
    db 0ebh, 00fh
L4af48:
    db 08bh, 045h, 0fch
    db 0c1h, 0e0h, 002h
    mov eax, dword ptr [eax+_Datac8024]
    db 089h, 045h, 0f8h
L4af57:
    db 0ebh, 0b6h
L4af59:
    db 083h, 07dh, 0f8h, 000h
    db 074h, 011h
    db 031h, 0d2h
    db 0b8h, 0dch, 034h, 012h, 000h
    db 0f7h, 075h, 0f8h
    db 0e8h, 02ch, 001h, 000h, 000h
    db 0ebh, 00ah
L4af70:
    db 0b8h, 0ffh, 0ffh, 000h, 000h
    db 0e8h, 020h, 001h, 000h, 000h
L4af7a:
    db 0f6h, 005h
    dd offset _Datac7fdc
    db 001h
    je short L4af88
    db 0e8h, 0f9h, 072h, 000h, 000h
L4af88:
    db 0c7h, 045h, 0fch, 000h, 000h, 000h, 000h
L4af8f:
    cmp dword ptr [ebp-04h], 010h
    jb short L4af9f
    jmp near ptr L4b051
L4af9a:
    inc dword ptr [ebp-04h]
    jmp short L4af8f
L4af9f:
    mov eax, dword ptr [ebp-04h]
    shl eax, 02h
    cmp dword ptr [eax+_Datac7fe4], 00h
    je near ptr L4b04c
    mov eax, dword ptr [ebp-04h]
    shl eax, 02h
    cmp dword ptr [eax+_Datac8024], 0ff00h
    jne short L4b00a
    cmp dword ptr [_Datac7fe0], 0ffffh
    jne short L4afe2
    mov eax, dword ptr [ebp-04h]
    shl eax, 02h
    mov dword ptr [eax+_Datac8064], 010000h
    jmp short L4b008
L4afe2:
    db 031h, 0d2h
    mov eax, 01234dch
    div dword ptr [_Datac7fe0]
    db 089h, 0c3h
    db 031h, 0d2h
    mov eax, 0123333h
    div ebx
    db 089h, 0c3h
    mov eax, dword ptr [ebp-04h]
    shl eax, 02h
    mov dword ptr [eax+_Datac8064], ebx
L4b008:
    jmp short L4b03c
L4b00a:
    mov eax, dword ptr [ebp-04h]
    shl eax, 02h
    mov ecx, dword ptr [eax+_Datac8024]
    shl ecx, 010h
    db 031h, 0d2h
    mov eax, 01234dch
    div dword ptr [_Datac7fe0]
    db 089h, 0c3h
    db 031h, 0d2h
    db 089h, 0c8h
    div ebx
    db 089h, 0c3h
    mov eax, dword ptr [ebp-04h]
    shl eax, 02h
    mov dword ptr [eax+_Datac8064], ebx
L4b03c:
    mov eax, dword ptr [ebp-04h]
    shl eax, 02h
    mov dword ptr [eax+_Datac80a4], 00h
L4b04c:
    jmp near ptr L4af9a
L4b051:
    test byte ptr [_Datac7fdc], 01h
    je short L4b05f
    call Func522ad_
L4b05f:
    mov dword ptr [ebp-0ch], 00h
    mov eax, dword ptr [ebp-0ch]
    leave
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
sosTIMERRemoveEvent_ endp
Func4b070_ proc near
    push ebx
    push ecx
    push edx
    push esi
    push edi
    push ebp
    db 089h, 0e5h
    db 081h, 0ech, 008h, 000h, 000h, 000h
    db 089h, 045h, 0f8h
    db 08bh, 045h, 0f8h
    db 0c1h, 0e0h, 002h
    mov eax, dword ptr [eax+_Datac8024]
    db 089h, 045h, 0fch
    db 08bh, 045h, 0fch
    db 0c9h
    db 05fh
    db 05eh
    db 05ah
    db 059h
    db 05bh
    db 0c3h
Func4b070_ endp
Func4b09a_ proc near
    db 053h
    db 051h
    db 052h
    db 056h
    db 057h
    db 055h
    db 089h, 0e5h
    db 081h, 0ech, 008h, 000h, 000h, 000h
    db 089h, 045h, 0f8h
    db 08bh, 045h, 0f8h
    db 0a3h
    dd offset _Datac7fe0
    db 0ffh, 075h, 0f8h
    db 0e8h, 0c5h, 070h, 000h, 000h
    db 083h, 0c4h, 004h
    db 0c7h, 045h, 0fch, 000h, 000h, 000h, 000h
    db 08bh, 045h, 0fch
    db 0c9h
    db 05fh
    db 05eh
    db 05ah
    db 059h
    db 05bh
    db 0c3h
Func4b09a_ endp
Func4b0cf_ proc near
    db 053h
    db 051h
    db 052h
    db 056h
    db 057h
    push ebp
    db 089h, 0e5h
    db 081h, 0ech, 004h, 000h, 000h, 000h
    db 0c7h, 045h, 0fch, 000h, 000h, 000h, 000h
L4b0e4:
    db 083h, 07dh, 0fch, 010h
    db 072h, 00ah
    db 0e9h, 079h, 000h, 000h, 000h
L4b0ef:
    db 0ffh, 045h, 0fch
    db 0ebh, 0f0h
L4b0f4:
    db 08bh, 045h, 0fch
    db 0c1h, 0e0h, 002h
    db 083h, 0b8h
    dd offset _Datac7fe4
    db 000h
    db 074h, 063h
    db 08bh, 045h, 0fch
    db 0c1h, 0e0h, 002h
    db 08bh, 055h, 0fch
    db 0c1h, 0e2h, 002h
    mov edx, dword ptr [edx+_Datac8064]
    add dword ptr [eax+_Datac80a4], edx
    db 08bh, 045h, 0fch
    db 0c1h, 0e0h, 002h
    db 0f6h, 080h
    dd offset _Datac80a6
    db 001h
    db 074h, 03ch
    db 08bh, 045h, 0fch
    db 0c1h, 0e0h, 002h
    db 066h, 0c7h, 080h
    dd offset _Datac80a6
    db 000h, 000h
    db 08bh, 045h, 0fch
    db 0c1h, 0e0h, 002h
    db 080h, 0b8h
    dd offset _Datac80e4
    db 0ffh
    db 074h, 012h
    db 08bh, 045h, 0fch
    db 0c1h, 0e0h, 002h
    movzx eax, byte ptr [eax+_Datac80e4]
    mov dword ptr [_Datac8124], eax
L4b15a:
    db 08bh, 045h, 0fch
    db 0c1h, 0e0h, 002h
    call dword ptr [eax+_Datac7fe4]
L4b166:
    db 0ebh, 087h
L4b168:
    db 0c9h
    db 05fh
    db 05eh
    db 05ah
    db 059h
    db 05bh
    db 0c3h
Func4b0cf_ endp
Func4b16f_ proc near
    db 053h
    db 051h
    db 052h
    db 056h
    db 057h
    db 055h
    db 089h, 0e5h
    db 081h, 0ech, 000h, 000h, 000h, 000h
    db 0e8h, 0d3h, 071h, 000h, 000h
    db 05dh
    db 05fh
    db 05eh
    pop edx
    pop ecx
    pop ebx
    ret
Func4b16f_ endp
Func4b189_ proc near
    push ebx
    push ecx
    push edx
    push esi
    push edi
    push ebp
    db 089h, 0e5h
    db 081h, 0ech, 000h, 000h, 000h, 000h
    db 05dh
    db 05fh
    db 05eh
    db 05ah
    db 059h
    db 05bh
    db 0c3h
Func4b189_ endp
_TEXT ends

_DATA segment
_Datac66e8 label byte
    db 002h, "@@@@@"
    db 000h, 040h, 000h, 004h, 050h, 050h, 0a0h, 000h, 000h, 000h, 000h, 000h, 005h, 050h, 050h, 0f8h
    db 050h, 0f8h, 050h, 050h, 000h, 005h, 020h, 078h, 0a0h, 070h, 028h, 0f0h, 020h, 000h, 005h, 000h
    db 088h, 010h, 020h, 040h, 088h, 000h, 000h, 006h, "0XPh"
    db 090h, 088h, 074h, 000h, 002h, 040h, 040h, 080h, 000h, 000h, 000h, 000h, 000h, 003h, 020h, 040h
    db 080h, 080h, 080h, 040h, 020h, 000h, 003h, 080h, "@   @"
    db 080h, 000h, 004h, 090h, 060h, 0f0h, 060h, 090h, 000h, 000h, 000h, 005h, 020h, 020h, 0f8h, 020h
    db 020h, 000h, 000h, 000h, 002h, 000h, 000h, 000h, 000h, 000h, 040h, 040h, 080h, 005h, 000h, 000h
    db 000h, 0f8h, 000h, 000h, 000h, 000h, 001h, 000h, 000h, 000h, 000h, 000h, 000h, 080h, 000h, 004h
    db 010h, 010h, "  @@"
    db 080h, 000h, 005h, 070h, 088h, 088h, 088h, 088h, 088h, 070h, 000h, 003h, 040h, 0c0h, "@@@@"
    db 0e0h, 000h, 005h, 070h, 088h, 010h, 020h, 040h, 088h, 0f8h, 000h, 005h, 070h, 088h, 008h, 030h
    db 008h, 088h, 070h, 000h, 005h, 010h, 030h, 050h, 090h, 0f8h, 010h, 010h, 000h, 005h, 0f8h, 080h
    db 0f0h, 008h, 008h, 088h, 070h, 000h, 005h, 030h, 040h, 080h, 0f0h, 088h, 088h, 070h, 000h, 005h
    db 0f8h, 088h, 008h, 010h, "   "
    db 000h, 005h, 070h, 088h, 088h, 070h, 088h, 088h, 070h, 000h, 005h, 070h, 088h, 088h, 078h, 008h
    db 010h, 060h, 000h, 001h, 000h, 000h, 080h, 000h, 000h, 080h, 000h, 000h, 002h, 000h, 000h, 040h
    db 000h, 000h, 040h, 040h, 080h, 004h, 000h, 010h, 020h, 040h, 080h, 040h, 020h, 010h, 004h, 000h
    db 000h, 0f0h, 000h, 000h, 0f0h, 000h, 000h, 004h, 000h, 080h, 040h, 020h, 010h, 020h, 040h, 080h
    db 005h, 070h, 088h, 088h, 010h, 020h, 000h, 020h, 000h, 004h, 060h, 090h, 0b0h, 0b0h, 080h, 080h
    db 070h, 000h, 005h, "  PPp"
    db 088h, 088h, 000h, 004h, 0e0h, 090h, 090h, 0e0h, 090h, 090h, 0e0h, 000h, 004h, 020h, 050h, 080h
    db 080h, 080h, 050h, 020h, 000h, 004h, 0c0h, 0a0h, 090h, 090h, 090h, 0a0h, 0c0h, 000h, 004h, 0f0h
    db 080h, 080h, 0e0h, 080h, 080h, 0f0h, 000h, 004h, 0f0h, 080h, 080h, 0e0h, 080h, 080h, 080h, 000h
    db 005h, 030h, 048h, 080h, 098h, 088h, 048h, 030h, 000h, 004h, 090h, 090h, 090h, 0f0h, 090h, 090h
    db 090h, 000h, 003h, 0e0h, "@@@@@"
    db 0e0h, 000h, 004h, 010h, 010h, 010h, 010h, 090h, 090h, 060h, 000h, 004h, 090h, 090h, 0a0h, 0c0h
    db 0a0h, 090h, 090h, 000h, 004h, 080h, 080h, 080h, 080h, 080h, 080h, 0f0h, 000h, 005h, 088h, 0d8h
    db 0a8h, 088h, 088h, 088h, 088h, 000h, 005h, 088h, 088h, 0c8h, 0a8h, 098h, 088h, 088h, 000h, 004h
    db 060h, 090h, 090h, 090h, 090h, 090h, 060h, 000h, 004h, 0e0h, 090h, 090h, 0e0h, 080h, 080h, 080h
    db 000h, 004h, 060h, 090h, 090h, 090h, 090h, 090h, 060h, 010h, 004h, 0e0h, 090h, 090h, 0e0h, 0a0h
    db 090h, 090h, 000h, 004h, 060h, 090h, 080h, 040h, 020h, 090h, 060h, 000h, 003h, 0e0h, "@@@@@@"
    db 000h, 004h, 090h, 090h, 090h, 090h, 090h, 090h, 060h, 000h, 005h, 088h, 088h, 088h, "PP  "
    db 000h, 005h, 088h, 088h, 088h, 088h, 0a8h, 0d8h, 088h, 000h, 005h, 088h, "PP PP"
    db 088h, 000h, 005h, 088h, 088h, "P    "
    db 000h, 004h, 0f0h, 010h, 020h, 040h, 080h, 080h, 0f0h, 000h, 003h, 0e0h, 080h, 080h, 080h, 080h
    db 080h, 0e0h, 000h, 004h, 080h, 080h, "@@  "
    db 010h, 000h, 003h, 0e0h, "     "
    db 0e0h, 000h, 005h, 020h, 050h, 088h, 000h, 000h, 000h, 000h, 000h, 005h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 0f8h, 002h, 080h, 080h, 040h, 000h, 000h, 000h, 000h, 000h, 004h, 000h, 000h
    db 060h, 010h, 070h, 090h, 060h, 000h, 004h, 080h, 080h, 080h, 0e0h, 090h, 090h, 0e0h, 000h, 004h
    db 000h, 000h, 060h, 090h, 080h, 090h, 060h, 000h, 004h, 010h, 010h, 010h, 070h, 090h, 090h, 070h
    db 000h, 004h, 000h, 000h, 060h, 090h, 0e0h, 080h, 070h, 000h, 004h, "0@@"
    db 0e0h, "@@@"
    db 000h, 004h, 000h, 000h, " PP "
    db 090h, 060h, 004h, 080h, 080h, 080h, 0e0h, 090h, 090h, 090h, 000h, 003h, 040h, 000h, "@@@@"
    db 0e0h, 000h, 004h, 010h, 000h, 010h, 010h, 010h, 010h, 090h, 060h, 004h, 080h, 080h, 090h, 0a0h
    db 0c0h, 0a0h, 090h, 000h, 001h, 080h, 080h, 080h, 080h, 080h, 080h, 080h, 000h, 005h, 000h, 000h
    db 050h, 0a8h, 088h, 088h, 088h, 000h, 004h, 000h, 000h, 060h, 090h, 090h, 090h, 090h, 000h, 004h
    db 000h, 000h, 060h, 090h, 090h, 090h, 060h, 000h, 004h, 000h, 000h, 0e0h, 090h, 090h, 0e0h, 080h
    db 080h, 004h, 000h, 000h, 070h, 090h, 090h, 070h, 010h, 010h, 004h, 000h, 000h, 0e0h, 090h, 080h
    db 080h, 080h, 000h, 004h, 000h, 000h, 070h, 080h, 060h, 010h, 0e0h, 000h, 003h, 000h, 040h, 0e0h
    db "@@@@"
    db 000h, 004h, 000h, 000h, 090h, 090h, 090h, 090h, 060h, 000h, 005h, 000h, 000h, 088h, 088h, 088h
    db 050h, 020h, 000h, 005h, 000h, 000h, 088h, 0a8h, 0a8h, 050h, 050h, 000h, 005h, 000h, 000h, 088h
    db "P P"
    db 088h, 000h, 004h, 000h, 000h, 090h, 090h, 090h, 060h, 040h, 080h, 004h, 000h, 000h, 0f0h, 010h
    db 060h, 080h, 0f0h, 000h, 006h, 0fch, 0fch, 0fch, 0fch, 0fch, 0fch, 0fch, 0fch, 006h, 0fch, 0fch
    db 0fch, 0fch, 0fch, 0fch, 0fch, 0fch, 006h, 0fch, 0fch, 0fch, 0fch, 0fch, 0fch, 0fch, 0fch, 006h
    db 0fch, 0fch, 0fch, 0fch, 0fch, 0fch, 0fch, 0fch, 006h, 0fch, 0fch, 0fch, 0fch, 0fch, 0fch, 0fch
    db 0fch, 000h
_DATA ends

    end

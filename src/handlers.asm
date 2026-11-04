    .586p

_TEXT segment dword public use32 'CODE'
_TEXT ends

    assume cs:FLAT, ds:FLAT, es:FLAT, ss:FLAT

    extrn _brkdata:byte
    extrn _critdata:byte
    extrn _keydata:byte

    public KeyHandler_
    public BreakHandler_
    public CritHandler_
    public TimerReadCount_
    public BcdToBin_
    public TimeRestore_

_TEXT segment
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
    mov al, byte ptr [edi+0143h]
    mov ecx, ebx
    test al, al
    jne short L4a8c0
    inc al
    cmp bl, 0e0h
    je near ptr L4a923
    inc al
    cmp bl, 0e1h
    je near ptr L4a923
    test bl, 080h
    jne short L4a8a9
    mov al, byte ptr [ebx+edi*1]
    test al, al
    mov al, bh
    jne near ptr L4a929
    inc byte ptr [edi+0145h]
    mov byte ptr [ebx+edi*1], 01h
    jmp near ptr L4a929
L4a8a9:
    and bl, 07fh
    mov al, byte ptr [ebx+edi*1]
    test al, al
    je short L4a929
    mov al, bh
    dec byte ptr [edi+0145h]
    mov byte ptr [ebx+edi*1], al
    jmp short L4a929
L4a8c0:
    dec al
    jne short L4a8ee
    test bl, 080h
    jne short L4a8de
    or bl, 080h
    or al, byte ptr [ebx+edi*1]
    jne short L4a921
    inc al
    inc byte ptr [edi+0145h]
    mov byte ptr [ebx+edi*1], al
    jmp short L4a921
L4a8de:
    or al, byte ptr [ebx+edi*1]
    je short L4a923
    dec byte ptr [edi+0145h]
    mov byte ptr [ebx+edi*1], ah
    jmp short L4a921
L4a8ee:
    add al, 02h
    cmp al, 03h
    je short L4a923
    inc ch
    cmp bl, 045h
    jne short L4a921
    mov al, byte ptr [edi+0c5h]
    test al, al
    jne short L4a915
    inc al
    inc byte ptr [edi+0145h]
    mov byte ptr [edi+0c5h], al
    jmp short L4a921
L4a915:
    dec byte ptr [edi+0145h]
    mov byte ptr [edi+0c5h], bh
L4a921:
    xor al, al
L4a923:
    mov byte ptr [edi+0143h], al
L4a929:
    or al, ch
    jne short L4a96a
    test cl, 080h
    jne short L4a96a
    cmp bl, 0aah
    je short L4a96a
    mov cl, byte ptr [edi+0142h]
    cmp cl, 040h
    je short L4a96a
    inc cl
    mov al, bl
    mov bl, byte ptr [edi+0140h]
    mov byte ptr [edi+0144h], al
    mov byte ptr [edi+0142h], cl
    mov byte ptr [ebx+edi*1+0100h], al
    inc bl
    and bl, 03fh
    mov byte ptr [edi+0140h], bl
L4a96a:
    mov al, 020h
    out 020h, al
    pop ds
    pop edi
    pop ecx
    pop ebx
    pop eax
    db 0cfh
KeyHandler_ endp
BreakHandler_ proc near
    db 050h
    db 01eh
    db 066h, 0b8h, 000h, 000h
    db 066h, 08eh, 0d8h
    db 0a1h
    dd offset _brkdata
    db 0feh, 000h
    db 01fh
    db 058h
    db 0cfh
BreakHandler_ endp
CritHandler_ proc near
    db 050h
    db 053h
    db 01eh
    db 066h, 0b8h, 000h, 000h
    db 066h, 08eh, 0d8h
    db 066h, 08bh, 0c7h
    db 0feh, 0c0h
    db 032h, 0e4h
    db 08bh, 01dh
    dd offset _critdata
    mov byte ptr [ebx], al
    db 01fh
    db 05bh
    db 058h
    db 0b0h, 003h
    db 0cfh
CritHandler_ endp
TimerReadCount_ proc near
    db 032h, 0c0h
    db 0e6h, 043h
    db 0e4h, 040h
    db 08ah, 0e0h
    db 0e4h, 040h
    db 086h, 0c4h
    db 0c3h
TimerReadCount_ endp
BcdToBin_ proc near
    db 055h
    db 08bh, 0ech
    db 083h, 0c4h, 0fch
    db 060h
    db 066h, 0c7h, 045h, 0fch, 001h, 000h
    db 066h, 0c7h, 045h, 0feh, 000h, 000h
    db 066h, 08bh, 0d8h
    db 066h, 0b9h, 002h, 000h
L4a9cd:
    db 066h, 08bh, 0c3h
    db 066h, 083h, 0e0h, 00fh
    db 066h, 0f7h, 065h, 0fch
    db 066h, 001h, 045h, 0feh
    db 066h, 08bh, 045h, 0fch
    db 066h, 0bah, 00ah, 000h
    db 066h, 0f7h, 0e2h
    db 066h, 089h, 045h, 0fch
    db 066h, 0c1h, 0fbh, 004h
    db 066h, 049h
    db 075h, 0dah
    db 061h
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
_TEXT ends

    end

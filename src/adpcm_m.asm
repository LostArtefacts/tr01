    .586p

_TEXT segment para public use32 'CODE'
_TEXT ends
_DATA segment dword public use32 'DATA'
_DATA ends

    assume cs:FLAT, ds:FLAT, es:FLAT, ss:FLAT

    public Func588e0_

_TEXT segment
Func588e0_ proc near
    push ebp
    mov ebp, esp
    push eax
    push ebx
    push ecx
    push edx
    push esi
    push edi
    mov esi, dword ptr [ebp+08h]
    mov edi, dword ptr [ebp+0ch]
    mov ecx, dword ptr [ebp+010h]
    push ebp
    mov ebp, ecx
L588f5::
    xor eax, eax
    mov al, byte ptr [esi]
    shr al, 04h
    and al, 0fh
    xor ecx, ecx
    mov cl, byte ptr [Dc89dc]
    mov edx, dword ptr [ecx*4+Dc8840]
    add ecx, dword ptr [eax*4+Dc8800]
    cmp ecx, 0ffffffffh
    jg short L58920
    mov ecx, 00h
    jmp short L5892a
L58920::
    cmp ecx, 059h
    jl short L5892a
    mov ecx, 058h
L5892a::
    mov byte ptr [Dc89dc], cl
    mov ebx, 00h
    test eax, 04h
    je short L58941
    mov ebx, edx
    shl ebx, 02h
L58941::
    test eax, 02h
    je short L5894e
    mov ecx, edx
    add ecx, ecx
    add ebx, ecx
L5894e::
    test eax, 01h
    je short L58957
    add ebx, edx
L58957::
    shr ebx, 02h
    mov cx, word ptr [Dc89d7]
    movsx ecx, cx
    test eax, 08h
    je short L5896f
    sub ecx, ebx
    jmp short L58971
L5896f::
    add ecx, ebx
L58971::
    cmp ecx, 08000h
    jl short L58980
    mov ecx, 07fffh
    jmp short L5898d
L58980::
    cmp ecx, 0ffff7fffh
    jg short L5898d
    mov ecx, 0ffff8000h
L5898d::
    mov word ptr [Dc89d7], cx
    mov word ptr [edi], cx
    add edi, 02h
    xor eax, eax
    mov al, byte ptr [esi]
    inc esi
    and al, 0fh
    xor ecx, ecx
    mov cl, byte ptr [Dc89dc]
    mov edx, dword ptr [ecx*4+Dc8840]
    add ecx, dword ptr [eax*4+Dc8800]
    cmp ecx, 0ffffffffh
    jg short L589c3
    mov ecx, 00h
    jmp short L589cd
L589c3::
    cmp ecx, 059h
    jl short L589cd
    mov ecx, 058h
L589cd::
    mov byte ptr [Dc89dc], cl
    mov ebx, 00h
    test eax, 04h
    je short L589e4
    mov ebx, edx
    shl ebx, 02h
L589e4::
    test eax, 02h
    je short L589f1
    mov ecx, edx
    add ecx, ecx
    add ebx, ecx
L589f1::
    test eax, 01h
    je short L589fa
    add ebx, edx
L589fa::
    shr ebx, 02h
    mov cx, word ptr [Dc89d7]
    movsx ecx, cx
    test eax, 08h
    je short L58a12
    sub ecx, ebx
    jmp short L58a14
L58a12::
    add ecx, ebx
L58a14::
    cmp ecx, 08000h
    jl short L58a23
    mov ecx, 07fffh
    jmp short L58a30
L58a23::
    cmp ecx, 0ffff7fffh
    jg short L58a30
    mov ecx, 0ffff8000h
L58a30::
    mov word ptr [Dc89d7], cx
    mov word ptr [edi], cx
    add edi, 02h
    dec ebp
    jne near ptr L588f5
    pop ebp
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    pop eax
    leave
    ret
Func588e0_ endp
_TEXT ends

_DATA segment
Dc8800 label byte
    db 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh
    db 002h, 000h, 000h, 000h, 004h, 000h, 000h, 000h, 006h, 000h, 000h, 000h, 008h, 000h, 000h, 000h
    db 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh
    db 002h, 000h, 000h, 000h, 004h, 000h, 000h, 000h, 006h, 000h, 000h, 000h, 008h, 000h, 000h, 000h
Dc8840 label byte
    db 007h, 000h, 000h, 000h, 008h, 000h, 000h, 000h, 009h, 000h, 000h, 000h, 00ah, 000h, 000h, 000h
    db 00bh, 000h, 000h, 000h, 00ch, 000h, 000h, 000h, 00dh, 000h, 000h, 000h, 00eh, 000h, 000h, 000h
    db 010h, 000h, 000h, 000h, 011h, 000h, 000h, 000h, 013h, 000h, 000h, 000h, 015h, 000h, 000h, 000h
    db 017h, 000h, 000h, 000h, 019h, 000h, 000h, 000h, 01ch, 000h, 000h, 000h, 01fh, 000h, 000h, 000h
    db 022h, 000h, 000h, 000h, 025h, 000h, 000h, 000h, 029h, 000h, 000h, 000h, 02dh, 000h, 000h, 000h
    db 032h, 000h, 000h, 000h, 037h, 000h, 000h, 000h, 03ch, 000h, 000h, 000h, 042h, 000h, 000h, 000h
    db 049h, 000h, 000h, 000h, 050h, 000h, 000h, 000h, 058h, 000h, 000h, 000h, 061h, 000h, 000h, 000h
    db 06bh, 000h, 000h, 000h, 076h, 000h, 000h, 000h, 082h, 000h, 000h, 000h, 08fh, 000h, 000h, 000h
    db 09dh, 000h, 000h, 000h, 0adh, 000h, 000h, 000h, 0beh, 000h, 000h, 000h, 0d1h, 000h, 000h, 000h
    db 0e6h, 000h, 000h, 000h, 0fdh, 000h, 000h, 000h, 017h, 001h, 000h, 000h, 033h, 001h, 000h, 000h
    db 051h, 001h, 000h, 000h, 073h, 001h, 000h, 000h, 098h, 001h, 000h, 000h, 0c1h, 001h, 000h, 000h
    db 0eeh, 001h, 000h, 000h, 020h, 002h, 000h, 000h, 056h, 002h, 000h, 000h, 092h, 002h, 000h, 000h
    db 0d4h, 002h, 000h, 000h, 01ch, 003h, 000h, 000h, 06ch, 003h, 000h, 000h, 0c3h, 003h, 000h, 000h
    db 024h, 004h, 000h, 000h, 08eh, 004h, 000h, 000h, 002h, 005h, 000h, 000h, 083h, 005h, 000h, 000h
    db 010h, 006h, 000h, 000h, 0abh, 006h, 000h, 000h, 056h, 007h, 000h, 000h, 012h, 008h, 000h, 000h
    db 0e0h, 008h, 000h, 000h, 0c3h, 009h, 000h, 000h, 0bdh, 00ah, 000h, 000h, 0d0h, 00bh, 000h, 000h
    db 0ffh, 00ch, 000h, 000h, 04ch, 00eh, 000h, 000h, 0bah, 00fh, 000h, 000h, 04ch, 011h, 000h, 000h
    db 007h, 013h, 000h, 000h, 0eeh, 014h, 000h, 000h, 006h, 017h, 000h, 000h, 054h, 019h, 000h, 000h
    db 0dch, 01bh, 000h, 000h, 0a5h, 01eh, 000h, 000h, 0b6h, 021h, 000h, 000h, 015h, 025h, 000h, 000h
    db 0cah, 028h, 000h, 000h, 0dfh, 02ch, 000h, 000h, 05bh, 031h, 000h, 000h, 04bh, 036h, 000h, 000h
    db 0b9h, 03bh, 000h, 000h, 0b2h, 041h, 000h, 000h, 044h, 048h, 000h, 000h, 07eh, 04fh, 000h, 000h
    db 071h, 057h, 000h, 000h, 02fh, 060h, 000h, 000h, 0ceh, 069h, 000h, 000h, 062h, 074h, 000h, 000h
    db 0ffh, 07fh, 000h, 000h, "$Id: ADPCM_M.ASM 1.1 1995/08/10 16:51:23 MFC Exp $"
    db 000h
Dc89d7 label byte
    db 000h, 000h, 000h, 000h, 000h
Dc89dc label byte
    db 000h, 000h, 000h, 000h
_DATA ends

    end

    .586p

_TEXT segment para public use32 'CODE'
_TEXT ends
_DATA segment dword public use32 'DATA'
_DATA ends

    assume cs:FLAT, ds:FLAT, es:FLAT, ss:FLAT

    public Func58770_

_TEXT segment
Func58770_ proc near
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
L58785::
    xor eax, eax
    mov al, byte ptr [esi]
    shr al, 04h
    and al, 0fh
    xor ecx, ecx
    mov cl, byte ptr [Dc87ec]
    mov edx, dword ptr [ecx*4+Dc8650]
    add ecx, dword ptr [eax*4+Dc8610]
    cmp ecx, 0ffffffffh
    jg short L587b0
    mov ecx, 00h
    jmp short L587ba
L587b0::
    cmp ecx, 059h
    jl short L587ba
    mov ecx, 058h
L587ba::
    mov byte ptr [Dc87ec], cl
    mov ebx, 00h
    test eax, 04h
    je short L587d1
    mov ebx, edx
    shl ebx, 02h
L587d1::
    test eax, 02h
    je short L587de
    mov ecx, edx
    add ecx, ecx
    add ebx, ecx
L587de::
    test eax, 01h
    je short L587e7
    add ebx, edx
L587e7::
    shr ebx, 02h
    mov cx, word ptr [Dc87e7]
    movsx ecx, cx
    test eax, 08h
    je short L587ff
    sub ecx, ebx
    jmp short L58801
L587ff::
    add ecx, ebx
L58801::
    cmp ecx, 08000h
    jl short L58810
    mov ecx, 07fffh
    jmp short L5881d
L58810::
    cmp ecx, 0ffff7fffh
    jg short L5881d
    mov ecx, 0ffff8000h
L5881d::
    mov word ptr [Dc87e7], cx
    mov word ptr [edi], cx
    add edi, 02h
    xor eax, eax
    mov al, byte ptr [esi]
    inc esi
    and al, 0fh
    xor ecx, ecx
    mov cl, byte ptr [Dc87f4]
    mov edx, dword ptr [ecx*4+Dc8650]
    add ecx, dword ptr [eax*4+Dc8610]
    cmp ecx, 0ffffffffh
    jg short L58853
    mov ecx, 00h
    jmp short L5885d
L58853::
    cmp ecx, 059h
    jl short L5885d
    mov ecx, 058h
L5885d::
    mov byte ptr [Dc87f4], cl
    mov ebx, 00h
    test eax, 04h
    je short L58874
    mov ebx, edx
    shl ebx, 02h
L58874::
    test eax, 02h
    je short L58881
    mov ecx, edx
    add ecx, ecx
    add ebx, ecx
L58881::
    test eax, 01h
    je short L5888a
    add ebx, edx
L5888a::
    shr ebx, 02h
    mov cx, word ptr [Dc87f0]
    movsx ecx, cx
    test eax, 08h
    je short L588a2
    sub ecx, ebx
    jmp short L588a4
L588a2::
    add ecx, ebx
L588a4::
    cmp ecx, 08000h
    jl short L588b3
    mov ecx, 07fffh
    jmp short L588c0
L588b3::
    cmp ecx, 0ffff7fffh
    jg short L588c0
    mov ecx, 0ffff8000h
L588c0::
    mov word ptr [Dc87f0], cx
    mov word ptr [edi], cx
    add edi, 02h
    dec ebp
    jne near ptr L58785
    pop ebp
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    pop eax
    leave
    ret
Func58770_ endp
_TEXT ends

_DATA segment
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
Dc8610 label byte
    db 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh
    db 002h, 000h, 000h, 000h, 004h, 000h, 000h, 000h, 006h, 000h, 000h, 000h, 008h, 000h, 000h, 000h
    db 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh
    db 002h, 000h, 000h, 000h, 004h, 000h, 000h, 000h, 006h, 000h, 000h, 000h, 008h, 000h, 000h, 000h
Dc8650 label byte
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
    db 0ffh, 07fh, 000h, 000h, "$Id: ADPCM_S.ASM 1.2 1995/08/10 16:46:37 MFC Exp $"
    db 000h
Dc87e7 label byte
    db 000h, 000h, 000h, 000h, 000h
Dc87ec label byte
    db 000h, 000h, 000h, 000h
Dc87f0 label byte
    db 000h, 000h, 000h, 000h
Dc87f4 label byte
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
_DATA ends

    end

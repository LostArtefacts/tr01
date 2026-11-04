    .586p

_TEXT segment para public use32 'CODE'
_TEXT ends
_DATA segment dword public use32 'DATA'
_DATA ends
_BSS segment dword public use32 'BSS'
_BSS ends

    assume cs:FLAT, ds:FLAT, es:FLAT, ss:FLAT

    extrn Func58b10_:near
    extrn Func58b34_:near
    extrn Func58e28_:near
    extrn Func58ecc_:near
    extrn Func58f34_:near
    extrn Func59338_:near
    extrn Func593e8_:near
    extrn Func5941c_:near
    extrn Func59458_:near
    extrn Func5949c_:near
    extrn Func594e0_:near
    extrn Func59604_:near
    extrn Func596c9_:near
    extrn calloc_:near
    extrn memset_:near

    public Func50784_
    public Func50be0_
    public Func50c2c_
    public Func50d04_
    public Func511a0_
    public Func511fc_
    public _Datac6d58

_TEXT segment
    db "$Id: RPLGRAPH.C 1.17 1995/08/21 16:17:41 MFC Exp $"
    db 000h, 090h
Func50784_ proc near
    push ebx
    push ecx
    push esi
    push edi
    push ebp
    sub esp, 04h
    db 089h, 0c7h
    db 089h, 0d3h
    db 031h, 0d2h
    mov dword ptr [B13034d], edx
    mov dword ptr [B130351], edx
    cmp bx, 013h
    jne near ptr L5086d
    call Func58b10_
    mov eax, 0c8h
    mov ebp, 0140h
    mov dword ptr [B130324], eax
    mov eax, 0a000h
    mov dword ptr [B130320], ebp
    call Func58f34_
    mov dword ptr [B130328], eax
    mov eax, dword ptr [B130320]
    mov ebp, dword ptr [B130324]
    mov dword ptr [B130340], eax
    imul eax, ebp
    mov ebx, 01h
    mov cl, 01h
    mov edx, 010000h
    mov dword ptr [B130330], ebx
    mov dword ptr [B130338], ebx
    mov dword ptr [B13033c], ebx
    mov dword ptr [B130334], ebx
    mov byte ptr [Dc6d5e], cl
    mov bh, 02h
    mov dword ptr [B13032c], edx
    db 031h, 0d2h
    mov byte ptr [B13034c], bh
    mov dword ptr [B130348], edx
    mov dword ptr [B130344], eax
L50829::
    mov ebx, 02710h
    db 031h, 0c0h
    mov dword ptr [Dc6d64], ebx
    mov dword ptr [Dc6d60], ebx
    call Func511fc_
    db 031h, 0c0h
    db 031h, 0d2h
    call Func511a0_
    db 031h, 0c0h
    call Func50c2c_
    test edi, edi
    je short L50862
    mov ecx, 0eh
    mov esi, offset B130320
    rep movs dword ptr es:[edi], dword ptr ds:[esi]
    movs byte ptr es:[edi], byte ptr ds:[esi]
L50862::
    mov al, 01h
L50864::
    add esp, 04h
    pop ebp
    pop edi
    pop esi
    pop ecx
    pop ebx
    ret
L5086d::
    movsx eax, bx
    cmp eax, 0ffffffffh
    jne short L508f1
    call Func58b10_
    call Func58e28_
    mov eax, 0140h
    mov edx, 0f0h
    mov ecx, 010000h
    mov esi, 01h
    db 031h, 0dbh
    mov dword ptr [B130320], eax
    mov dword ptr [B130324], edx
    mov dword ptr [B130328], ebx
    mov dword ptr [B13032c], ecx
    mov dword ptr [B130330], esi
    mov dword ptr [B130338], esi
    mov dword ptr [B13033c], esi
    mov dword ptr [B130340], eax
    mov ebx, 012c00h
    mov dh, 03h
    db 031h, 0c9h
    mov dword ptr [B130344], ebx
    mov dword ptr [B130334], ecx
    mov dword ptr [B130348], ecx
    mov bl, 01h
    mov byte ptr [B13034c], dh
    mov byte ptr [Dc6d5e], bl
    jmp near ptr L50829
L508f1::
    test bx, bx
    jne short L508fb
    mov ebx, 0110h
L508fb::
    mov byte ptr [B13034c], 01h
    cmp bx, 0110h
    jne near ptr L50983
    db 089h, 0e0h
    call Func5941c_
    test al, al
    je short L5093f
    mov edx, offset B130120
    movsx eax, bx
    call Func59338_
    test al, al
    je short L5093f
    cmp word ptr [B130120], 00h
    sete al
    and eax, 0ffh
    je near ptr L50a39
L5093f::
    db 089h, 0e0h
    mov ebx, 0111h
    call Func5941c_
    test al, al
    je short L50978
    mov edx, offset B130120
    mov eax, 0111h
    call Func59338_
    test al, al
    je short L50978
    cmp word ptr [B130120], 00h
    sete al
    and eax, 0ffh
    je near ptr L50a39
L50978::
    db 030h, 0c0h
    add esp, 04h
    pop ebp
    pop edi
    pop esi
    pop ecx
    pop ebx
    ret
L50983::
    cmp bx, 0111h
    jne near ptr L50a00
    db 089h, 0e0h
    call Func5941c_
    test al, al
    je short L509c0
    mov edx, offset B130120
    movsx eax, bx
    call Func59338_
    test al, al
    je short L509c0
    cmp word ptr [B130120], 00h
    sete al
    and eax, 0ffh
    je near ptr L50a39
L509c0::
    db 089h, 0e0h
    mov ebx, 0110h
    call Func5941c_
    test al, al
    je short L509f5
    mov edx, offset B130120
    mov eax, 0110h
    call Func59338_
    test al, al
    je short L509f5
    cmp word ptr [B130120], 00h
    sete al
    and eax, 0ffh
    je short L50a39
L509f5::
    db 030h, 0c0h
    add esp, 04h
    pop ebp
    pop edi
    pop esi
    pop ecx
    pop ebx
    ret
L50a00::
    db 089h, 0e0h
    call Func5941c_
    test al, al
    je short L50a2e
    mov edx, offset B130120
    movsx eax, bx
    call Func59338_
    test al, al
    je short L50a2e
    cmp word ptr [B130120], 00h
    sete al
    and eax, 0ffh
    je short L50a39
L50a2e::
    db 030h, 0c0h
    add esp, 04h
    pop ebp
    pop edi
    pop esi
    pop ecx
    pop ebx
    ret
L50a39::
    cmp bx, 0111h
    sete al
    and eax, 0ffh
    add eax, 0fh
    mov dl, byte ptr [B130122]
    mov dword ptr [B130355], eax
    test dl, 01h
    je short L50a7f
    test dl, 04h
    je short L50a7f
    db 031h, 0c0h
    db 031h, 0d2h
    mov ax, word ptr [B130128]
    mov ebp, 01h
    call Func58f34_
    mov dword ptr [B130328], eax
    mov dword ptr [B130348], ebp
    jmp short L50ab9
L50a7f::
    mov cl, byte ptr [B130123]
    test cl, 01h
    je short L50a8f
    test cl, 04h
    jne short L50a9a
L50a8f::
    db 030h, 0c0h
    add esp, 04h
    pop ebp
    pop edi
    pop esi
    pop ecx
    pop ebx
    ret
L50a9a::
    db 031h, 0c0h
    db 031h, 0d2h
    mov ax, word ptr [B13012a]
    mov esi, 01h
    call Func58f34_
    mov dword ptr [B130328], eax
    mov dword ptr [B130348], esi
L50ab9::
    mov byte ptr [Dc6d5e], 01h
    mov eax, dword ptr [Dc6d5a]
    sar eax, 010h
    cmp eax, 0ffffffffh
    jne short L50ad6
    mov eax, dword ptr [esp]
    mov word ptr [Dc6d5c], ax
L50ad6::
    db 031h, 0c0h
    mov ax, word ptr [B130132]
    mov dword ptr [B130320], eax
    db 031h, 0c0h
    mov ax, word ptr [B130134]
    mov dword ptr [B130324], eax
    cmp byte ptr [B13013d], 00h
    je short L50b07
    db 031h, 0c0h
    mov al, byte ptr [B13013d]
    mov dword ptr [B130334], eax
    jmp short L50b11
L50b07::
    mov dword ptr [B130334], 01h
L50b11::
    db 031h, 0c0h
    mov ax, word ptr [B130130]
    db 031h, 0d2h
    mov dword ptr [B130340], eax
    db 031h, 0c0h
    mov dx, word ptr [B130134]
    mov ax, word ptr [B130130]
    imul eax, edx
    mov dword ptr [B130344], eax
    mov al, byte ptr [B130139]
    cmp al, 08h
    jb short L50b64
    jbe short L50b4c
    cmp al, 0fh
    jb short L50b64
    cmp al, 010h
    jbe short L50b58
    jmp short L50b64
L50b4c::
    mov dword ptr [B130338], 01h
    jmp short L50b6c
L50b58::
    mov dword ptr [B130338], 02h
    jmp short L50b6c
L50b64::
    db 031h, 0f6h
    mov dword ptr [B130338], esi
L50b6c::
    db 031h, 0c9h
    mov cl, byte ptr [B130139]
    db 089h, 0cah
    db 089h, 0c8h
    sar edx, 01fh
    shl edx, 03h
    sbb eax, edx
    sar eax, 03h
    mov esi, 08h
    mov dword ptr [B13033c], eax
    db 089h, 0cah
    db 089h, 0c8h
    sar edx, 01fh
    idiv esi
    test edx, edx
    je short L50ba0
    inc dword ptr [B13033c]
L50ba0::
    db 031h, 0c0h
    mov ax, word ptr [B130124]
    shl eax, 0ah
    mov dword ptr [B130330], eax
    db 031h, 0c0h
    mov ax, word ptr [B130126]
    shl eax, 0ah
    mov dword ptr [B13032c], eax
    movsx eax, bx
    call Func593e8_
    test al, al
    jne near ptr L50829
    mov byte ptr [Dc6d5e], al
    add esp, 04h
    pop ebp
    pop edi
    pop esi
    pop ecx
    pop ebx
    ret
Func50784_ endp
    db 08bh, 0c0h
Func50be0_ proc near
    push edx
    cmp byte ptr [Dc6d5e], 00h
    je short L50c27
    db 030h, 0d2h
    mov byte ptr [Dc6d5e], dl
    mov dh, byte ptr [B13034c]
    cmp dh, 02h
    je short L50c02
    cmp dh, 03h
    jne short L50c09
L50c02::
    call Func58b34_
    pop edx
    ret
L50c09::
    mov eax, dword ptr [Dc6d5a]
    sar eax, 010h
    cmp eax, 0ffffffffh
    jle short L50c27
    mov edx, 0ffffffffh
    call Func593e8_
    mov word ptr [Dc6d5c], dx
L50c27::
    pop edx
    ret
Func50be0_ endp
    db 08dh, 040h, 000h
Func50c2c_ proc near
    push ebx
    push ecx
    push esi
    push edi
    push ebp
    sub esp, 04h
    db 089h, 0c3h
    mov byte ptr [esp], dl
    cmp byte ptr [Dc6d5e], 00h
    je near ptr L50864
    cmp ebx, dword ptr [B130334]
    ja near ptr L50864
    cmp byte ptr [B13034c], 03h
    jne short L50c9e
    cmp dword ptr [Dc6d68], 00h
    jne short L50c80
    mov edx, 01h
    mov eax, dword ptr [B130344]
    call calloc_
    mov dword ptr [Dc6d68], eax
    test eax, eax
    je near ptr L50864
L50c80::
    imul ebx, dword ptr [B130344]
    mov esi, dword ptr [Dc6d68]
    shr ebx, 02h
    call Func59604_
    add esp, 04h
    pop ebp
    pop edi
    pop esi
    pop ecx
    pop ebx
    ret
L50c9e::
    mov ecx, dword ptr [B130344]
    imul ebx, ecx
    lea esi, [ecx+ebx*1]
L50caa::
    mov ebp, dword ptr [B130330]
    db 089h, 0dah
    db 089h, 0d8h
    sar edx, 01fh
    idiv ebp
    db 089h, 0c1h
    db 089h, 0dah
    db 089h, 0d8h
    sar edx, 01fh
    idiv ebp
    db 089h, 0c8h
    mov edi, dword ptr [B130328]
    call Func511a0_
    imul ecx, dword ptr [B130330]
    add ecx, dword ptr [B13032c]
    db 001h, 0d7h
    db 039h, 0f1h
    jb short L50ce6
    db 089h, 0f1h
L50ce6::
    db 089h, 0c8h
    db 031h, 0d2h
    db 029h, 0d8h
    mov dl, byte ptr [esp]
    db 089h, 0c3h
    db 089h, 0f8h
    call memset_
    db 039h, 0f1h
    jge near ptr L50864
    db 089h, 0cbh
    jmp short L50caa
Func50c2c_ endp
Func50d04_ proc near
    push esi
    push edi
    push ebp
    sub esp, 030h
    mov dword ptr [esp+02ch], edx
    db 089h, 0deh
    mov ebx, dword ptr [esp+040h]
    mov edx, dword ptr [esp+044h]
    cmp byte ptr [B13034c], 03h
    jne short L50d3b
    mov ebx, dword ptr [B130344]
    imul ebx, eax
    mov esi, dword ptr [esp+02ch]
    shr ebx, 02h
    call Func596c9_
    jmp near ptr L51195
L50d3b::
    mov edi, dword ptr [esp+048h]
    cmp edi, 01h
    je short L50d49
    cmp edi, 02h
    jne short L50d4d
L50d49::
    db 001h, 0f6h
    db 001h, 0c9h
L50d4d::
    mov edi, dword ptr [B130324]
    db 001h, 0d1h
    db 039h, 0f9h
    jbe short L50d5b
    db 089h, 0f9h
L50d5b::
    test edx, edx
    jge short L50d63
    db 031h, 0ffh
    jmp short L50d65
L50d63::
    db 089h, 0d7h
L50d65::
    db 029h, 0f9h
    test ecx, ecx
    jge short L50d6d
    db 031h, 0c9h
L50d6d::
    mov ebp, dword ptr [B130320]
    mov dword ptr [esp+08h], ecx
    lea ecx, [ebx+esi*1]
    db 039h, 0e9h
    jbe short L50d82
    db 089h, 0efh
    jmp short L50d84
L50d82::
    db 089h, 0cfh
L50d84::
    test ebx, ebx
    jge short L50d8c
    db 031h, 0c9h
    jmp short L50d8e
L50d8c::
    db 089h, 0d9h
L50d8e::
    db 029h, 0cfh
    db 089h, 0f9h
    imul ecx, dword ptr [B13033c]
    test ecx, ecx
    jge short L50d9f
    db 031h, 0c9h
L50d9f::
    mov dword ptr [esp+01ch], ecx
    mov ecx, dword ptr [B13033c]
    imul ecx, esi
    mov dword ptr [esp+010h], ecx
    test edx, edx
    jge short L50dbf
    neg edx
    imul edx, ecx
    add dword ptr [esp+02ch], edx
    db 031h, 0d2h
L50dbf::
    test ebx, ebx
    jge short L50dd4
    mov esi, dword ptr [B13033c]
    neg ebx
    imul ebx, esi
    add dword ptr [esp+02ch], ebx
    db 031h, 0dbh
L50dd4::
    imul edx, dword ptr [B130340]
    imul eax, dword ptr [B130344]
    imul ebx, dword ptr [B13033c]
    db 001h, 0d0h
    db 001h, 0d8h
    db 089h, 0c2h
    mov edi, dword ptr [B130330]
    sar edx, 01fh
    mov dword ptr [esp+024h], eax
    idiv edi
    db 089h, 0c3h
    mov eax, dword ptr [esp+024h]
    db 089h, 0c2h
    sar edx, 01fh
    idiv edi
    mov eax, dword ptr [B130328]
    db 001h, 0d0h
    mov dword ptr [esp+028h], eax
    db 089h, 0d8h
    call Func511a0_
    imul ebx, dword ptr [B130330]
    db 089h, 0fdh
    mov eax, dword ptr [B13032c]
    db 031h, 0fdh
    db 001h, 0d8h
    mov edx, dword ptr [esp+08h]
    mov dword ptr [esp+018h], eax
    test edx, edx
    jle near ptr L51195
    mov eax, dword ptr [esp+010h]
    sar eax, 1
    mov dword ptr [esp+0ch], eax
    mov eax, dword ptr [esp+01ch]
    sar eax, 1
    mov dword ptr [esp], eax
    mov eax, dword ptr [esp+01ch]
    sar eax, 02h
    mov dword ptr [esp+04h], eax
L50e5d::
    mov edx, dword ptr [esp+018h]
    mov esi, dword ptr [esp+01ch]
    mov edi, dword ptr [esp+024h]
    db 029h, 0f2h
    db 039h, 0fah
    jle near ptr L50f62
    mov edx, dword ptr [esp+048h]
    cmp edx, 01h
    je short L50e85
    cmp edx, 02h
    jne near ptr L50f22
L50e85::
    cmp dword ptr [esp+048h], 02h
    je short L50e9e
    mov ebx, 02h
    db 089h, 0eah
    db 089h, 0e8h
    sar edx, 01fh
    idiv ebx
    test edx, edx
    je short L50f0a
L50e9e::
    mov edi, dword ptr [B13033c]
    cmp edi, 01h
    jne short L50ec6
    mov ecx, dword ptr [esp]
    mov esi, dword ptr [esp+02ch]
    mov edi, dword ptr [esp+028h]
    jecxz L50ec4
L50eb6::
    mov al, byte ptr [esi]
    db 088h, 0c4h
    mov word ptr [edi], ax
    inc esi
    add edi, 02h
    dec ecx
    jne short L50eb6
L50ec4::
    jmp short L50f0a
L50ec6::
    cmp edi, 02h
    jne short L50f0a
    mov ecx, dword ptr [esp+04h]
    mov esi, dword ptr [esp+02ch]
    mov edi, dword ptr [esp+028h]
    shr ecx, 1
    jae short L50eeb
    mov ax, word ptr [esi]
    mov word ptr [edi], ax
    mov word ptr [edi+02h], ax
    add esi, 02h
    add edi, 04h
L50eeb::
    jecxz L50f0a
    mov ebx, dword ptr [esi-02h]
L50ef0::
    mov eax, dword ptr [esi]
    db 066h, 089h, 0c3h
    add edi, 08h
    mov dword ptr [edi-08h], ebx
    mov ebx, dword ptr [esi+02h]
    db 066h, 089h, 0d8h
    add esi, 04h
    mov dword ptr [edi-04h], eax
    dec ecx
    jne short L50ef0
L50f0a::
    mov ebx, 02h
    db 089h, 0eah
    db 089h, 0e8h
    sar edx, 01fh
    idiv ebx
    test edx, edx
    je short L50f44
    mov eax, dword ptr [esp+0ch]
    jmp short L50f40
L50f22::
    mov edi, dword ptr [esp+028h]
    db 089h, 0f1h
    mov esi, dword ptr [esp+02ch]
    push edi
    db 089h, 0c8h
    shr ecx, 02h
    db 0f2h, 0a5h
    mov cl, al
    and cl, 03h
    db 0f2h, 0a4h
    pop edi
    mov eax, dword ptr [esp+010h]
L50f40::
    add dword ptr [esp+02ch], eax
L50f44::
    mov ebx, dword ptr [esp+024h]
    mov eax, dword ptr [B130340]
    mov ecx, dword ptr [esp+028h]
    db 001h, 0c3h
    db 001h, 0c1h
    mov dword ptr [esp+024h], ebx
    mov dword ptr [esp+028h], ecx
    jmp near ptr L51188
L50f62::
    mov ecx, dword ptr [esp+018h]
    db 029h, 0f9h
    test ecx, ecx
    jg short L50f6e
    db 031h, 0c9h
L50f6e::
    mov dword ptr [esp+020h], ecx
    test ecx, ecx
    jle near ptr L51035
    mov edx, dword ptr [esp+048h]
    cmp edx, 01h
    je short L50f8c
    cmp edx, 02h
    jne near ptr L5101d
L50f8c::
    cmp dword ptr [esp+048h], 02h
    je short L50fa9
    mov ebx, 02h
    db 089h, 0eah
    db 089h, 0e8h
    sar edx, 01fh
    idiv ebx
    test edx, edx
    je near ptr L51035
L50fa9::
    mov esi, dword ptr [B13033c]
    cmp esi, 01h
    jne short L50fd4
    mov ecx, dword ptr [esp+020h]
    mov esi, dword ptr [esp+02ch]
    mov edi, dword ptr [esp+028h]
    sar ecx, 1
    jecxz L50fd2
L50fc4::
    mov al, byte ptr [esi]
    db 088h, 0c4h
    mov word ptr [edi], ax
    inc esi
    add edi, 02h
    dec ecx
    jne short L50fc4
L50fd2::
    jmp short L51035
L50fd4::
    cmp esi, 02h
    jne short L51035
    mov ecx, dword ptr [esp+020h]
    mov esi, dword ptr [esp+02ch]
    mov edi, dword ptr [esp+028h]
    sar ecx, 02h
    shr ecx, 1
    jae short L50ffc
    mov ax, word ptr [esi]
    mov word ptr [edi], ax
    mov word ptr [edi+02h], ax
    add esi, 02h
    add edi, 04h
L50ffc::
    jecxz L5101b
    mov ebx, dword ptr [esi-02h]
L51001::
    mov eax, dword ptr [esi]
    db 066h, 089h, 0c3h
    add edi, 08h
    mov dword ptr [edi-08h], ebx
    mov ebx, dword ptr [esi+02h]
    db 066h, 089h, 0d8h
    add esi, 04h
    mov dword ptr [edi-04h], eax
    dec ecx
    jne short L51001
L5101b::
    jmp short L51035
L5101d::
    mov esi, dword ptr [esp+02ch]
    mov edi, dword ptr [esp+028h]
    push edi
    db 089h, 0c8h
    shr ecx, 02h
    db 0f2h, 0a5h
    mov cl, al
    and cl, 03h
    db 0f2h, 0a4h
    pop edi
L51035::
    mov ebx, dword ptr [esp+024h]
    add ebx, dword ptr [esp+020h]
    mov ecx, dword ptr [B130330]
    db 089h, 0dah
    db 089h, 0d8h
    sar edx, 01fh
    idiv ecx
    mov dword ptr [esp+014h], eax
    db 089h, 0dah
    db 089h, 0d8h
    sar edx, 01fh
    idiv ecx
    mov eax, dword ptr [esp+014h]
    mov edi, dword ptr [B130328]
    call Func511a0_
    mov eax, dword ptr [esp+048h]
    db 001h, 0d7h
    cmp eax, 01h
    je short L5107c
    cmp eax, 02h
    jne near ptr L5111d
L5107c::
    cmp dword ptr [esp+048h], 02h
    je short L51095
    mov ebx, 02h
    db 089h, 0eah
    db 089h, 0e8h
    sar edx, 01fh
    idiv ebx
    test edx, edx
    je short L51101
L51095::
    mov ecx, dword ptr [esp+01ch]
    mov esi, dword ptr [esp+020h]
    mov eax, dword ptr [esp+02ch]
    db 029h, 0f1h
    sar esi, 1
    mov edx, dword ptr [B13033c]
    db 001h, 0c6h
    cmp edx, 01h
    jne short L510c6
    sar ecx, 1
    jecxz L510c4
L510b6::
    mov al, byte ptr [esi]
    db 088h, 0c4h
    mov word ptr [edi], ax
    inc esi
    add edi, 02h
    dec ecx
    jne short L510b6
L510c4::
    jmp short L51101
L510c6::
    cmp edx, 02h
    jne short L51101
    sar ecx, 02h
    shr ecx, 1
    jae short L510e2
    mov ax, word ptr [esi]
    mov word ptr [edi], ax
    mov word ptr [edi+02h], ax
    add esi, 02h
    add edi, 04h
L510e2::
    jecxz L51101
    mov ebx, dword ptr [esi-02h]
L510e7::
    mov eax, dword ptr [esi]
    db 066h, 089h, 0c3h
    add edi, 08h
    mov dword ptr [edi-08h], ebx
    mov ebx, dword ptr [esi+02h]
    db 066h, 089h, 0d8h
    add esi, 04h
    mov dword ptr [edi-04h], eax
    dec ecx
    jne short L510e7
L51101::
    mov ebx, 02h
    db 089h, 0eah
    db 089h, 0e8h
    sar edx, 01fh
    idiv ebx
    test edx, edx
    je short L5114b
    mov eax, dword ptr [esp+0ch]
    add dword ptr [esp+02ch], eax
    jmp short L5114b
L5111d::
    mov ecx, dword ptr [esp+01ch]
    mov ebx, dword ptr [esp+020h]
    mov esi, dword ptr [esp+02ch]
    db 029h, 0d9h
    db 001h, 0deh
    mov edx, dword ptr [esp+02ch]
    push edi
    db 089h, 0c8h
    shr ecx, 02h
    db 0f2h, 0a5h
    mov cl, al
    and cl, 03h
    db 0f2h, 0a4h
    pop edi
    mov eax, dword ptr [esp+010h]
    db 001h, 0c2h
    mov dword ptr [esp+02ch], edx
L5114b::
    mov esi, dword ptr [esp+024h]
    add esi, dword ptr [B130340]
    mov edi, dword ptr [B130330]
    db 089h, 0f2h
    db 089h, 0f0h
    sar edx, 01fh
    idiv edi
    mov ebx, dword ptr [B130328]
    mov eax, dword ptr [esp+014h]
    db 001h, 0d3h
    db 089h, 0fah
    imul edx, eax
    mov eax, dword ptr [B13032c]
    mov dword ptr [esp+024h], esi
    db 001h, 0d0h
    mov dword ptr [esp+028h], ebx
    mov dword ptr [esp+018h], eax
L51188::
    mov ecx, dword ptr [esp+08h]
    inc ebp
    db 039h, 0cdh
    jl near ptr L50e5d
L51195::
    add esp, 030h
    pop ebp
    pop edi
    pop esi
    ret 0ch
Func50d04_ endp
    db 08bh, 0c0h
Func511a0_ proc near
    push ebx
    push edx
    cmp byte ptr [Dc6d5e], 00h
    jne short L511b0
    db 030h, 0c0h
    pop edx
    pop ebx
    ret
L511b0::
    mov dh, byte ptr [B13034c]
    cmp dh, 02h
    je short L511c0
    cmp dh, 03h
    jne short L511c5
L511c0::
    mov al, 01h
    pop edx
    pop ebx
    ret
L511c5::
    cmp eax, dword ptr [Dc6d6c]
    jne short L511d2
    mov al, 01h
    pop edx
    pop ebx
    ret
L511d2::
    mov ebx, dword ptr [B130348]
    mov dword ptr [Dc6d6c], eax
    test ebx, ebx
    je short L511ee
    and eax, 0ffffh
    call Func59458_
    pop edx
    pop ebx
    ret
L511ee::
    and eax, 0ffffh
    call Func5949c_
    pop edx
    pop ebx
    ret
Func511a0_ endp
    db 090h
Func511fc_ proc near
    push ebx
    push edx
    cmp byte ptr [Dc6d5e], 00h
    jne short L5120c
    db 030h, 0c0h
    pop edx
    pop ebx
    ret
L5120c::
    cmp byte ptr [B13034c], 02h
    jne short L5121a
    db 030h, 0c0h
    pop edx
    pop ebx
    ret
L5121a::
    cmp eax, dword ptr [Dc6d64]
    jne short L51227
    mov al, 01h
    pop edx
    pop ebx
    ret
L51227::
    mov bl, byte ptr [B13034c]
    mov dword ptr [Dc6d64], eax
    cmp bl, 03h
    jne short L5124b
    imul eax, dword ptr [B130344]
    shr eax, 02h
    call Func58ecc_
    mov al, 01h
    pop edx
    pop ebx
    ret
L5124b::
    imul ax, word ptr [B130324]
    db 031h, 0d2h
    db 066h, 089h, 0c2h
    db 031h, 0c0h
    call Func594e0_
    pop edx
    pop ebx
    ret
Func511fc_ endp
_TEXT ends

_DATA segment
_Datac6d58 label byte
    db 000h, 000h
Dc6d5a label byte
    db 000h, 000h
Dc6d5c label byte
    db 0ffh, 0ffh
Dc6d5e label byte
    db 000h, 000h
Dc6d60 label byte
    db 000h, 000h, 000h, 000h
Dc6d64 label byte
    db 000h, 000h, 000h, 000h
Dc6d68 label byte
    db 000h, 000h, 000h, 000h
Dc6d6c label byte
    db 010h, 027h, 000h, 000h
_DATA ends

_BSS segment
B130120 label byte
    db 2 dup(?)
B130122 label byte
    db 1 dup(?)
B130123 label byte
    db 1 dup(?)
B130124 label byte
    db 2 dup(?)
B130126 label byte
    db 2 dup(?)
B130128 label byte
    db 2 dup(?)
B13012a label byte
    db 6 dup(?)
B130130 label byte
    db 2 dup(?)
B130132 label byte
    db 2 dup(?)
B130134 label byte
    db 5 dup(?)
B130139 label byte
    db 4 dup(?)
B13013d label byte
    db 483 dup(?)
B130320 label byte
    db 4 dup(?)
B130324 label byte
    db 4 dup(?)
B130328 label byte
    db 4 dup(?)
B13032c label byte
    db 4 dup(?)
B130330 label byte
    db 4 dup(?)
B130334 label byte
    db 4 dup(?)
B130338 label byte
    db 4 dup(?)
B13033c label byte
    db 4 dup(?)
B130340 label byte
    db 4 dup(?)
B130344 label byte
    db 4 dup(?)
B130348 label byte
    db 4 dup(?)
B13034c label byte
    db 1 dup(?)
B13034d label byte
    db 4 dup(?)
B130351 label byte
    db 4 dup(?)
B130355 label byte
    db 4 dup(?)
_BSS ends

    end

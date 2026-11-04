    .586p

_TEXT segment word public use32 'CODE'
_TEXT ends

    assume cs:FLAT, ds:FLAT, es:FLAT, ss:FLAT

    extrn Func568e3_:near
    extrn Func56ac5_:near
    extrn Func56bb5_:near
    extrn Func56bf2_:near
    extrn Func56c90_:near
    extrn Func56ee6_:near
    extrn Func56f1c_:near
    extrn Func57110_:near
    extrn Func57145_:near
    extrn Func5716e_:near
    extrn Func57194_:near
    extrn Func571e5_:near
    extrn Func5721a_:near
    extrn Func57339_:near
    extrn Func5747e_:near
    extrn Func574de_:near
    extrn _Datac7e50:byte
    extrn _Datac7e54:byte
    extrn _Datac7f54:byte
    extrn _Datac7f58:byte
    extrn _Datac7f5c:byte
    extrn _Datac7f60:byte
    extrn _Datac7f64:byte
    extrn _Datac7f68:byte
    extrn _Datac7f74:byte
    extrn _Datac837c:byte
    extrn _Datac839c:byte
    extrn memcpy_:near
    extrn memset_:near

    public Func4dc7a_
    public Func4dc8f_
    public Func4dceb_
    public Func4dd28_
    public Func4dd3d_
    public Func4dd52_
    public Func4e1b5_
    public Func4e387_
    public Func4e450_
    public Func4e56c_
    public Func4e5dd_
    public Func4e600_
    public Func4e623_
    public Func4e646_
    public Func4e669_
    public Func4e68c_
    public Func4e6a1_
    public Func4e6b6_
    public Func4e836_
    public Func4e8a8_
    public Func4e916_
    public Func4e92b_
    public Func4e940_
    public Func4e982_
    public Func4ea0a_
    public Func4ea80_
    public Func4eaf6_
    public Func4eb6c_
    public Func4ebf2_
    public Func4ec68_
    public Func4ecee_
    public Func4ed64_
    public Func4edda_
    public Func4ee3e_
    public Func4eec8_
    public Func4ef0a_
    public Func4ef84_

_TEXT segment
Func4dc7a_ proc near
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
Func4dc7a_ endp
Func4dc8f_ proc near
    db 053h
    db 051h
    db 056h
    db 057h
    db 055h
    db 089h, 0e5h
    db 081h, 0ech, 010h, 000h, 000h, 000h
    db 089h, 045h, 0f0h
    db 089h, 055h, 0f4h
    db 0e8h, 00fh, 085h, 000h, 000h
    db 089h, 045h, 0fch
    db 083h, 07dh, 0fch, 000h
    db 074h, 008h
    db 08bh, 045h, 0fch
    db 089h, 045h, 0f8h
    jmp short L4dce2
L4dcb8:
    db 080h, 00dh
    dd offset _Datac7e50
    db 001h
    db 083h, 07dh, 0f0h, 000h
    je short L4dcd4
    db 08bh, 055h, 0f0h
    mov eax, offset _Datac7e54
    db 0e8h, 0ddh, 08bh, 000h, 000h
    jmp short L4dcdb
L4dcd4:
    db 0c6h, 005h
    dd offset _Datac7e54
    db 000h
L4dcdb:
    db 0c7h, 045h, 0f8h, 000h, 000h, 000h, 000h
L4dce2:
    db 08bh, 045h, 0f8h
    db 0c9h
    db 05fh
    db 05eh
    db 059h
    db 05bh
    db 0c3h
Func4dc8f_ endp
Func4dceb_ proc near
    db 053h
    db 051h
    db 052h
    db 056h
    db 057h
    db 055h
    db 089h, 0e5h
    db 081h, 0ech, 008h, 000h, 000h, 000h
    db 0e8h, 02ah, 088h, 000h, 000h
    db 089h, 045h, 0fch
    db 083h, 07dh, 0fch, 000h
    db 074h, 009h
    db 0c7h, 045h, 0f8h, 000h, 000h, 000h, 000h
    db 0ebh, 00eh
L4dd10:
    db 080h, 025h
    dd offset _Datac7e50
    db 0feh
    mov dword ptr [ebp-08h], 00h
L4dd1e:
    mov eax, dword ptr [ebp-08h]
    leave
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
Func4dceb_ endp
Func4dd28_ proc near
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
Func4dd28_ endp
Func4dd3d_ proc near
    db 053h
    db 051h
    db 052h
    db 056h
    db 057h
    db 055h
    db 089h, 0e5h
    db 081h, 0ech, 000h, 000h, 000h, 000h
    db 05dh
    db 05fh
    db 05eh
    db 05ah
    db 059h
    db 05bh
    db 0c3h
Func4dd3d_ endp
Func4dd52_ proc near
    db 053h
    db 051h
    db 056h
    db 057h
    db 055h
    db 089h, 0e5h
    db 081h, 0ech, 018h, 000h, 000h, 000h
    db 089h, 045h, 0e8h
    db 089h, 055h, 0ech
    db 0c7h, 045h, 0fch, 000h, 000h, 000h, 000h
L4dd6c:
    db 083h, 07dh, 0fch, 005h
    db 072h, 007h
    db 0ebh, 014h
L4dd74:
    db 0ffh, 045h, 0fch
    db 0ebh, 0f3h
L4dd79:
    mov eax, dword ptr [ebp-04h]
    db 0c1h, 0e0h, 002h
    db 083h, 0b8h
    dd offset _Datac7f54
    db 000h
    db 075h, 0ech
L4dd88:
    db 083h, 07dh, 0fch, 006h
    db 075h, 00ch
    db 0c7h, 045h, 0f0h, 00bh, 000h, 000h, 000h
    db 0e9h, 012h, 004h, 000h, 000h
L4dd9a:
    db 08bh, 055h, 0fch
    shl edx, 02h
    mov eax, dword ptr [ebp-018h]
    db 089h, 082h
    dd offset _Datac7f54
    db 08bh, 045h, 0e8h
    db 083h, 0b8h, 0d8h, 000h, 000h, 000h, 000h
    jne near ptr L4de46
    mov eax, dword ptr [ebp-018h]
    cmp word ptr [eax+0dch], 00h
    jne near ptr L4de46
    mov eax, dword ptr [ebp-018h]
    add eax, 0ech
    push eax
    mov eax, dword ptr [ebp-018h]
    add eax, 0e8h
    push eax
    mov eax, dword ptr [ebp-018h]
    add eax, 0fch
    push eax
    mov ecx, dword ptr [ebp-018h]
    add ecx, 0d8h
    mov ebx, dword ptr [ebp-018h]
    add ebx, 0e0h
    mov edx, dword ptr [ebp-04h]
    mov eax, dword ptr [ebp-018h]
    mov eax, dword ptr [eax+0104h]
    call Func568e3_
    mov dword ptr [ebp-0ch], eax
    cmp dword ptr [ebp-0ch], 00h
    je short L4de1c
    mov eax, dword ptr [ebp-0ch]
    mov dword ptr [ebp-010h], eax
    jmp near ptr L4e1ac
L4de1c:
    mov eax, 01e00h
    call Func56bb5_
    db 089h, 0c2h
    mov eax, dword ptr [ebp-018h]
    mov dword ptr [eax+058h], edx
    mov eax, 04000h
    call Func56bb5_
    db 089h, 0c2h
    mov eax, dword ptr [ebp-018h]
    mov dword ptr [eax+048h], edx
    mov eax, dword ptr [ebp-018h]
    or byte ptr [eax], 02h
L4de46:
    mov ebx, 01e00h
    db 031h, 0d2h
    mov eax, dword ptr [ebp-018h]
    mov eax, dword ptr [eax+058h]
    call memset_
    mov edx, dword ptr [ebp-018h]
    add edx, 06ch
    mov eax, dword ptr [ebp-04h]
    call Func56c90_
    mov dword ptr [ebp-0ch], eax
    cmp dword ptr [ebp-0ch], 00h
    je short L4de7a
    mov eax, dword ptr [ebp-0ch]
    mov dword ptr [ebp-010h], eax
    jmp near ptr L4e1ac
L4de7a:
    mov eax, dword ptr [ebp-018h]
    cmp dword ptr [eax+03ch], 00h
    jne near ptr L4df6e
    mov eax, dword ptr [ebp-018h]
    or byte ptr [eax], 04h
    mov ecx, dword ptr [ebp-018h]
    add ecx, 0f4h
    mov ebx, dword ptr [ebp-018h]
    add ebx, 0100h
    mov edx, dword ptr [ebp-018h]
    add edx, 0f0h
    mov eax, dword ptr [ebp-018h]
    mov eax, dword ptr [eax+044h]
    db 0e8h, 0d4h, 004h, 000h, 000h
    db 089h, 0c2h
    mov eax, dword ptr [ebp-018h]
    mov dword ptr [eax+03ch], edx
    mov eax, dword ptr [ebp-018h]
    mov eax, dword ptr [eax+03ch]
    test eax, eax
    jne short L4ded9
    mov eax, dword ptr [ebp-04h]
    call Func56ac5_
    mov dword ptr [ebp-010h], 05h
    jmp near ptr L4e1ac
L4ded9:
    mov eax, dword ptr [ebp-018h]
    cmp dword ptr [eax+090h], 08h
    jne near ptr L4df47
    mov eax, dword ptr [ebp-018h]
    test byte ptr [eax+0a9h], 080h
    je short L4df1e
    mov dword ptr [ebp-08h], 00h
L4defc:
    mov eax, dword ptr [ebp-08h]
    mov edx, dword ptr [ebp-018h]
    cmp eax, dword ptr [edx+044h]
    jb short L4df0e
    jmp short L4df1c
L4df09:
    inc dword ptr [ebp-08h]
    jmp short L4defc
L4df0e:
    mov eax, dword ptr [ebp-018h]
    mov eax, dword ptr [eax+03ch]
    add eax, dword ptr [ebp-08h]
    mov byte ptr [eax], 00h
    jmp short L4df09
L4df1c:
    jmp short L4df45
L4df1e:
    mov dword ptr [ebp-08h], 00h
L4df25:
    mov eax, dword ptr [ebp-08h]
    mov edx, dword ptr [ebp-018h]
    cmp eax, dword ptr [edx+044h]
    jb short L4df37
    jmp short L4df45
L4df32:
    inc dword ptr [ebp-08h]
    jmp short L4df25
L4df37:
    mov eax, dword ptr [ebp-018h]
    mov eax, dword ptr [eax+03ch]
    add eax, dword ptr [ebp-08h]
    mov byte ptr [eax], 080h
    jmp short L4df32
L4df45:
    jmp short L4df6e
L4df47:
    mov dword ptr [ebp-08h], 00h
L4df4e:
    mov eax, dword ptr [ebp-08h]
    mov edx, dword ptr [ebp-018h]
    cmp eax, dword ptr [edx+044h]
    jb short L4df60
    jmp short L4df6e
L4df5b:
    inc dword ptr [ebp-08h]
    jmp short L4df4e
L4df60:
    mov eax, dword ptr [ebp-018h]
    mov eax, dword ptr [eax+03ch]
    add eax, dword ptr [ebp-08h]
    mov byte ptr [eax], 00h
    jmp short L4df5b
L4df6e:
    mov eax, dword ptr [ebp-018h]
    mov edx, dword ptr [eax+03ch]
    mov eax, dword ptr [ebp-018h]
    mov ebx, dword ptr [eax+044h]
    mov eax, dword ptr [ebp-018h]
    db 001h, 0dah
    mov dword ptr [eax+040h], edx
    mov eax, dword ptr [ebp-018h]
    mov eax, dword ptr [eax+064h]
    shl eax, 02h
    mov edx, dword ptr [eax+_Datac837c]
    mov eax, dword ptr [ebp-018h]
    mov dword ptr [eax+018h], edx
    mov eax, dword ptr [ebp-018h]
    mov edx, dword ptr [eax+03ch]
    mov eax, dword ptr [ebp-018h]
    mov dword ptr [eax+028h], edx
    mov eax, dword ptr [ebp-018h]
    mov edx, dword ptr [eax+048h]
    mov eax, dword ptr [ebp-018h]
    add edx, 04000h
    mov dword ptr [eax+04ch], edx
    mov eax, dword ptr [ebp-018h]
    mov dword ptr [eax+050h], 04000h
    mov eax, dword ptr [ebp-018h]
    mov dword ptr [eax+030h], 00h
    mov eax, dword ptr [ebp-018h]
    mov dword ptr [eax+054h], 0ffffffffh
    mov eax, dword ptr [ebp-018h]
    mov dword ptr [eax+02ch], 0400h
    mov eax, dword ptr [ebp-018h]
    mov dword ptr [eax+014h], 020h
    mov eax, dword ptr [ebp-018h]
    mov edx, dword ptr [eax+090h]
    mov eax, dword ptr [ebp-018h]
    mov dword ptr [eax+0ch], edx
    mov eax, dword ptr [ebp-018h]
    mov edx, dword ptr [eax+094h]
    inc edx
    mov eax, dword ptr [ebp-018h]
    mov dword ptr [eax+08h], edx
    mov eax, dword ptr [ebp-018h]
    mov dword ptr [eax+010h], 08000h
    mov eax, dword ptr [ebp-04h]
    shl eax, 02h
    mov edx, dword ptr [eax+_Datac839c]
    mov eax, dword ptr [ebp-018h]
    mov dword ptr [eax+0108h], edx
    mov eax, dword ptr [ebp-018h]
    mov dword ptr [eax+01ch], 00h
    mov eax, dword ptr [ebp-018h]
    mov dword ptr [eax+020h], 00h
    mov eax, dword ptr [ebp-018h]
    mov dword ptr [eax+024h], 00h
    mov eax, dword ptr [ebp-018h]
    test byte ptr [eax+0a9h], 02h
    je short L4e090
    mov eax, dword ptr [ebp-018h]
    movzx eax, word ptr [eax+0dch]
    push eax
    mov eax, dword ptr [ebp-018h]
    push dword ptr [eax+0d8h]
    mov eax, dword ptr [ebp-018h]
    movzx eax, word ptr [eax+0e4h]
    push eax
    mov eax, dword ptr [ebp-018h]
    push dword ptr [eax+0e0h]
    call Func574de_
    db 089h, 0d3h
    db 089h, 0c1h
    add esp, 010h
    mov eax, dword ptr [ebp-018h]
    mov word ptr [eax+038h], bx
    mov eax, dword ptr [ebp-018h]
    mov dword ptr [eax+034h], ecx
L4e090:
    mov eax, dword ptr [ebp-018h]
    push dword ptr [eax+064h]
    call Func571e5_
    add esp, 04h
    mov eax, dword ptr [ebp-018h]
    push dword ptr [eax+068h]
    mov eax, dword ptr [ebp-018h]
    push dword ptr [eax+068h]
    mov eax, dword ptr [ebp-018h]
    push dword ptr [eax+068h]
    mov eax, dword ptr [ebp-018h]
    push dword ptr [eax+064h]
    mov eax, dword ptr [ebp-018h]
    push dword ptr [eax+060h]
    mov eax, dword ptr [ebp-018h]
    push dword ptr [eax+05ch]
    mov eax, dword ptr [ebp-018h]
    movzx eax, word ptr [eax+0dch]
    push eax
    mov eax, dword ptr [ebp-018h]
    push dword ptr [eax+0d8h]
    mov eax, dword ptr [ebp-018h]
    movzx eax, word ptr [eax+0e4h]
    push eax
    mov eax, dword ptr [ebp-018h]
    push dword ptr [eax+0e0h]
    call Func57110_
    add esp, 028h
    mov eax, dword ptr [ebp-018h]
    movzx eax, word ptr [eax+0dch]
    push eax
    mov eax, dword ptr [ebp-018h]
    push dword ptr [eax+0d8h]
    mov eax, dword ptr [ebp-018h]
    movzx eax, word ptr [eax+0e4h]
    push eax
    mov eax, dword ptr [ebp-018h]
    push dword ptr [eax+0e0h]
    call Func57194_
    add esp, 010h
    mov eax, dword ptr [ebp-018h]
    push dword ptr [eax+04h]
    mov eax, dword ptr [ebp-018h]
    movzx eax, word ptr [eax+0dch]
    push eax
    mov eax, dword ptr [ebp-018h]
    push dword ptr [eax+0d8h]
    mov eax, dword ptr [ebp-018h]
    movzx eax, word ptr [eax+0e4h]
    push eax
    mov eax, dword ptr [ebp-018h]
    push dword ptr [eax+0e0h]
    call Func5716e_
    add esp, 014h
    mov eax, dword ptr [ebp-018h]
    push dword ptr [eax+044h]
    mov eax, dword ptr [ebp-018h]
    push dword ptr [eax+0f0h]
    mov eax, dword ptr [ebp-018h]
    movzx eax, word ptr [eax+0dch]
    push eax
    mov eax, dword ptr [ebp-018h]
    push dword ptr [eax+0d8h]
    mov eax, dword ptr [ebp-018h]
    movzx eax, word ptr [eax+0e4h]
    push eax
    mov eax, dword ptr [ebp-018h]
    push dword ptr [eax+0e0h]
    call Func57145_
    add esp, 018h
    mov eax, dword ptr [ebp-018h]
    or byte ptr [eax], 01h
    mov eax, dword ptr [ebp-04h]
    mov edx, dword ptr [ebp-014h]
    mov dword ptr [edx], eax
    mov dword ptr [ebp-010h], 00h
L4e1ac:
    mov eax, dword ptr [ebp-010h]
    leave
    pop edi
    pop esi
    pop ecx
    pop ebx
    ret
Func4dd52_ endp
Func4e1b5_ proc near
    push ecx
    push esi
    push edi
    push ebp
    db 089h, 0e5h
    db 081h, 0ech, 014h, 000h, 000h, 000h
    db 089h, 045h, 0ech
    db 089h, 055h, 0f0h
    db 089h, 05dh, 0f4h
    db 08bh, 045h, 0ech
    db 0c1h, 0e0h, 002h
    mov eax, dword ptr [eax+_Datac7f54]
    db 089h, 045h, 0fch
    db 083h, 07dh, 0fch, 000h
    db 075h, 00ch
    db 0c7h, 045h, 0f8h, 00ah, 000h, 000h, 000h
    db 0e9h, 094h, 001h, 000h, 000h
L4e1eb:
    db 08bh, 045h, 0fch
    db 0f6h, 000h, 002h
    db 075h, 00ch
    db 0c7h, 045h, 0f8h, 001h, 000h, 000h, 000h
    db 0e9h, 080h, 001h, 000h, 000h
L4e1ff:
    db 08bh, 045h, 0fch
    db 0c7h, 040h, 030h, 000h, 000h, 000h, 000h
    db 08bh, 045h, 0fch
    db 00fh, 0b7h, 080h, 0dch, 000h, 000h, 000h
    db 050h
    db 08bh, 045h, 0fch
    db 0ffh, 0b0h, 0d8h, 000h, 000h, 000h
    db 08bh, 045h, 0fch
    db 00fh, 0b7h, 080h, 0e4h, 000h, 000h, 000h
    db 050h
    db 08bh, 045h, 0fch
    db 0ffh, 0b0h, 0e0h, 000h, 000h, 000h
    db 0e8h, 0a7h, 08dh, 000h, 000h
    db 083h, 0c4h, 010h
    db 08bh, 045h, 0fch
    db 00fh, 0b7h, 080h, 0dch, 000h, 000h, 000h
    db 050h
    db 08bh, 045h, 0fch
    db 0ffh, 0b0h, 0d8h, 000h, 000h, 000h
    db 08bh, 045h, 0fch
    db 00fh, 0b7h, 080h, 0e4h, 000h, 000h, 000h
    db 050h
    db 08bh, 045h, 0fch
    db 0ffh, 0b0h, 0e0h, 000h, 000h, 000h
    db 0e8h, 087h, 08eh, 000h, 000h
    db 083h, 0c4h, 010h
    mov eax, dword ptr [ebp-04h]
    push dword ptr [eax+064h]
    call Func5721a_
    add esp, 04h
    mov eax, dword ptr [ebp-04h]
    test byte ptr [eax], 04h
    je short L4e285
    cmp dword ptr [ebp-010h], 00h
    jne short L4e287
L4e285:
    jmp short L4e2fc
L4e287:
    mov eax, dword ptr [ebp-04h]
    and byte ptr [eax], 0fbh
    call Func57339_
    and eax, 0ffh
    cmp eax, 03h
    jne short L4e2d3
    mov eax, dword ptr [ebp-04h]
    mov ecx, dword ptr [eax+0f0h]
    mov eax, dword ptr [ebp-04h]
    mov esi, dword ptr [eax+0100h]
    mov eax, dword ptr [ebp-04h]
    mov ax, word ptr [eax+0f8h]
    mov ebx, dword ptr [ebp-04h]
    mov ebx, dword ptr [ebx+0f4h]
    db 089h, 0c2h
    db 089h, 0d8h
    movzx eax, dx
    db 089h, 0cbh
    db 089h, 0f2h
    db 0e8h, 09bh, 002h, 000h, 000h
    jmp short L4e2fc
L4e2d3:
    mov eax, dword ptr [ebp-04h]
    mov ax, word ptr [eax+0f8h]
    mov ebx, dword ptr [ebp-04h]
    mov ebx, dword ptr [ebx+0f4h]
    db 089h, 0c2h
    db 089h, 0d8h
    movzx eax, dx
    push eax
    call Func56f1c_
    add esp, 04h
    mov eax, dword ptr [ebp-04h]
    and byte ptr [eax], 0fbh
L4e2fc:
    mov eax, dword ptr [ebp-04h]
    test byte ptr [eax], 02h
    je short L4e30a
    cmp dword ptr [ebp-0ch], 00h
    jne short L4e30c
L4e30a:
    jmp short L4e362
L4e30c:
    mov eax, dword ptr [ebp-014h]
    call Func56ac5_
    mov eax, dword ptr [ebp-04h]
    mov word ptr [eax+0dch], 00h
    mov eax, dword ptr [ebp-04h]
    mov dword ptr [eax+0d8h], 00h
    mov eax, dword ptr [ebp-04h]
    mov word ptr [eax+0e4h], 00h
    mov eax, dword ptr [ebp-04h]
    mov dword ptr [eax+0e0h], 00h
    mov eax, dword ptr [ebp-04h]
    mov eax, dword ptr [eax+048h]
    call Func56bf2_
    mov eax, dword ptr [ebp-04h]
    mov eax, dword ptr [eax+058h]
    call Func56bf2_
    mov eax, dword ptr [ebp-04h]
    and byte ptr [eax], 0fdh
L4e362:
    mov eax, dword ptr [ebp-014h]
    shl eax, 02h
    mov dword ptr [eax+_Datac7f54], 00h
    mov eax, dword ptr [ebp-04h]
    and byte ptr [eax], 0feh
    mov dword ptr [ebp-08h], 00h
L4e37f:
    mov eax, dword ptr [ebp-08h]
    leave
    pop edi
    pop esi
    pop ecx
    ret
Func4e1b5_ endp
Func4e387_ proc near
    push esi
    push edi
    push ebp
    db 089h, 0e5h
    db 081h, 0ech, 018h, 000h, 000h, 000h
    db 089h, 045h, 0e8h
    db 089h, 055h, 0ech
    db 089h, 05dh, 0f0h
    db 089h, 04dh, 0f4h
    db 0e8h, 096h, 08fh, 000h, 000h
    db 025h, 0ffh, 000h, 000h, 000h
    db 083h, 0f8h, 003h
    db 075h, 038h
    db 08bh, 05dh, 0ech
    db 08bh, 055h, 0f0h
    db 08bh, 045h, 0f4h
    db 0e8h, 095h, 000h, 000h, 000h
    db 085h, 0c0h
    db 074h, 00ch
    db 0c7h, 045h, 0f8h, 000h, 000h, 000h, 000h
    db 0e9h, 07eh, 000h, 000h, 000h
L4e3cb:
    db 0ffh, 075h, 0e8h
    db 08bh, 045h, 0f4h
    push dword ptr [eax]
    db 0e8h, 055h, 089h, 000h, 000h
    db 083h, 0c4h, 008h
    db 08bh, 045h, 0f4h
    db 08bh, 000h
    db 089h, 045h, 0f8h
    db 0ebh, 064h
L4e3e5:
    db 08dh, 045h, 0fch
    db 050h
    db 0ffh, 075h, 0ech
    db 08bh, 045h, 0e8h
    db 0c1h, 0e8h, 004h
    db 083h, 0c0h, 004h
    push eax
    db 0e8h, 0ebh, 08ah, 000h, 000h
    db 083h, 0c4h, 00ch
L4e3fe:
    db 08bh, 045h, 0ech
    db 08bh, 010h
    db 081h, 0e2h, 0ffh, 0ffh, 000h, 000h
    db 0b8h, 0ffh, 0ffh, 000h, 000h
    db 02bh, 045h, 0e8h
    db 039h, 0c2h
    db 076h, 01bh
    db 08dh, 045h, 0fch
    db 050h
    db 0ffh, 075h, 0ech
    mov eax, dword ptr [ebp-018h]
    shr eax, 04h
    add eax, 04h
    push eax
    call Func56ee6_
    add esp, 0ch
    jmp short L4e3fe
L4e430:
    db 031h, 0dbh
    mov edx, dword ptr [ebp-04h]
    mov eax, dword ptr [ebp-0ch]
    mov word ptr [eax+04h], dx
    mov eax, dword ptr [ebp-0ch]
    mov dword ptr [eax], ebx
    mov eax, dword ptr [ebp-014h]
    mov eax, dword ptr [eax]
    mov dword ptr [ebp-08h], eax
L4e449:
    mov eax, dword ptr [ebp-08h]
    leave
    pop edi
    pop esi
    ret
Func4e387_ endp
Func4e450_ proc near
    push ecx
    push esi
    push edi
    push ebp
    db 089h, 0e5h
    db 081h, 0ech, 030h, 000h, 000h, 000h
    db 089h, 045h, 0d8h
    db 089h, 055h, 0dch
    db 089h, 05dh, 0f0h
    db 0c7h, 045h, 0ech, 000h, 000h, 000h, 000h
    db 0c7h, 045h, 0e8h, 000h, 000h, 000h, 000h
    db 08bh, 045h, 0d8h
    db 066h, 0c7h, 040h, 004h, 000h, 000h
    db 08bh, 045h, 0d8h
    db 0c7h, 000h, 000h, 000h, 000h, 000h
    db 08bh, 045h, 0dch
    db 0c7h, 000h, 000h, 000h, 000h, 000h
    db 08bh, 045h, 0f0h
    db 0c7h, 000h, 000h, 000h, 000h, 000h
    db 0c7h, 045h, 0fch, 000h, 000h, 000h, 000h
    db 08dh, 045h, 0fch
    db 050h
    db 08dh, 045h, 0f4h
    db 050h
    push 020h
    db 0e8h, 0a9h, 08eh, 000h, 000h
    db 083h, 0c4h, 00ch
    db 085h, 0c0h
    db 074h, 00ch
    db 0c7h, 045h, 0e0h, 000h, 000h, 000h, 000h
    db 0e9h, 0a4h, 000h, 000h, 000h
L4e4c0:
    db 031h, 0d2h
    db 08bh, 045h, 0f4h
    db 066h, 089h, 045h, 0d4h
    db 089h, 055h, 0d0h
    db 00fh, 0b5h, 055h, 0d0h
    db 065h, 0c7h, 002h, 000h, 010h, 000h, 000h
    db 0ffh, 075h, 0fch
    db 0e8h, 0e6h, 08eh, 000h, 000h
    db 083h, 0c4h, 004h
    db 089h, 045h, 0e8h
    db 06ah, 010h
    db 08bh, 05dh, 0d4h
    db 08bh, 055h, 0d0h
    mov esi, ds
    mov ecx, offset _Datac7f68
    db 089h, 0f0h
    db 089h, 0ceh
    db 089h, 0d9h
    db 089h, 0d3h
    db 089h, 0c2h
    db 089h, 0f0h
    db 0e8h, 008h, 090h, 000h, 000h
    db 0ffh, 075h, 0fch
    db 0ffh, 075h, 0f4h
    db 0e8h, 087h, 08eh, 000h, 000h
    db 083h, 0c4h, 008h
    db 083h, 07dh, 0e8h, 000h
    jne short L4e55d
    and word ptr [_Datac7f74], 0f000h
    push dword ptr [_Datac7f74]
    call Func5747e_
    add esp, 04h
    mov dword ptr [ebp-01ch], eax
    mov eax, dword ptr [_Datac7f74]
    mov dword ptr [ebp-014h], eax
    mov ebx, dword ptr [ebp-01ch]
    db 031h, 0d2h
    mov eax, dword ptr [ebp-028h]
    mov word ptr [eax+04h], dx
    mov eax, dword ptr [ebp-028h]
    mov dword ptr [eax], ebx
    mov eax, dword ptr [ebp-014h]
    mov edx, dword ptr [ebp-010h]
    mov dword ptr [edx], eax
    mov dword ptr [ebp-020h], 00h
    jmp short L4e564
L4e55d:
    mov dword ptr [ebp-020h], 05h
L4e564:
    mov eax, dword ptr [ebp-020h]
    leave
    pop edi
    pop esi
    pop ecx
    ret
Func4e450_ endp
Func4e56c_ proc near
    push ecx
    push esi
    push edi
    push ebp
    db 089h, 0e5h
    db 081h, 0ech, 01ch, 000h, 000h, 000h
    db 089h, 045h, 0f0h
    db 089h, 055h, 0ech
    db 089h, 05dh, 0fch
    db 08dh, 055h, 0f4h
    db 052h
    db 08dh, 055h, 0f8h
    db 052h
    push 020h
    db 0e8h, 0c6h, 08dh, 000h, 000h
    db 083h, 0c4h, 00ch
    db 031h, 0d2h
    db 08bh, 045h, 0f8h
    db 066h, 089h, 045h, 0e8h
    db 089h, 055h, 0e4h
    db 06ah, 010h
    mov edx, ds
    mov esi, offset _Datac7f68
    db 089h, 0d3h
    db 089h, 0f2h
    db 08bh, 045h, 0e8h
    db 08bh, 075h, 0e4h
    db 089h, 0d9h
    db 089h, 0d3h
    db 089h, 0c2h
    db 089h, 0f0h
    db 0e8h, 04eh, 08fh, 000h, 000h
    db 0ffh, 075h, 0f4h
    db 0e8h, 06ah, 08eh, 000h, 000h
    db 083h, 0c4h, 004h
    db 0ffh, 075h, 0f4h
    db 0ffh, 075h, 0f8h
    db 0e8h, 0c2h, 08dh, 000h, 000h
    db 083h, 0c4h, 008h
    db 0c9h
    db 05fh
    db 05eh
    db 059h
    db 0c3h
Func4e56c_ endp
Func4e5dd_ proc near
    db 053h
    db 051h
    db 052h
    db 056h
    db 057h
    db 055h
    db 089h, 0e5h
    db 081h, 0ech, 000h, 000h, 000h, 000h
    db 0ffh, 035h
    dd offset _Datac7f54
    db 0e8h, 043h, 08fh, 000h, 000h
    db 083h, 0c4h, 004h
    db 05dh
    db 05fh
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
Func4e5dd_ endp
Func4e600_ proc near
    push ebx
    push ecx
    push edx
    push esi
    push edi
    push ebp
    db 089h, 0e5h
    db 081h, 0ech, 000h, 000h, 000h, 000h
    push dword ptr [_Datac7f58]
    db 0e8h, 020h, 08fh, 000h, 000h
    db 083h, 0c4h, 004h
    db 05dh
    db 05fh
    db 05eh
    db 05ah
    db 059h
    db 05bh
    db 0c3h
Func4e600_ endp
Func4e623_ proc near
    db 053h
    db 051h
    db 052h
    db 056h
    db 057h
    db 055h
    db 089h, 0e5h
    db 081h, 0ech, 000h, 000h, 000h, 000h
    db 0ffh, 035h
    dd offset _Datac7f5c
    db 0e8h, 0fdh, 08eh, 000h, 000h
    db 083h, 0c4h, 004h
    db 05dh
    db 05fh
    db 05eh
    db 05ah
    db 059h
    db 05bh
    db 0c3h
Func4e623_ endp
Func4e646_ proc near
    db 053h
    db 051h
    db 052h
    db 056h
    db 057h
    db 055h
    db 089h, 0e5h
    db 081h, 0ech, 000h, 000h, 000h, 000h
    push dword ptr [_Datac7f60]
    db 0e8h, 0dah, 08eh, 000h, 000h
    db 083h, 0c4h, 004h
    db 05dh
    db 05fh
    db 05eh
    db 05ah
    db 059h
    db 05bh
    db 0c3h
Func4e646_ endp
Func4e669_ proc near
    db 053h
    db 051h
    db 052h
    db 056h
    push edi
    push ebp
    db 089h, 0e5h
    db 081h, 0ech, 000h, 000h, 000h, 000h
    push dword ptr [_Datac7f64]
    db 0e8h, 0b7h, 08eh, 000h, 000h
    db 083h, 0c4h, 004h
    db 05dh
    db 05fh
    db 05eh
    db 05ah
    db 059h
    db 05bh
    db 0c3h
Func4e669_ endp
Func4e68c_ proc near
    db 053h
    db 051h
    db 052h
    db 056h
    db 057h
    db 055h
    db 089h, 0e5h
    db 081h, 0ech, 000h, 000h, 000h, 000h
    db 05dh
    db 05fh
    db 05eh
    db 05ah
    db 059h
    db 05bh
    db 0c3h
Func4e68c_ endp
Func4e6a1_ proc near
    db 053h
    db 051h
    db 052h
    db 056h
    db 057h
    db 055h
    db 089h, 0e5h
    db 081h, 0ech, 000h, 000h, 000h, 000h
    db 05dh
    db 05fh
    db 05eh
    db 05ah
    db 059h
    db 05bh
    db 0c3h
Func4e6a1_ endp
Func4e6b6_ proc near
    db 053h
    db 051h
    db 056h
    db 057h
    db 055h
    db 089h, 0e5h
    db 081h, 0ech, 018h, 000h, 000h, 000h
    db 089h, 045h, 0e8h
    mov dword ptr [ebp-014h], edx
    db 08bh, 045h, 0e8h
    db 0c1h, 0e0h, 002h
    mov eax, dword ptr [eax+_Datac7f54]
    mov dword ptr [ebp-0ch], eax
    cmp dword ptr [ebp-0ch], 00h
    jne short L4e6ea
    mov dword ptr [ebp-010h], 0ah
    jmp near ptr L4e82d
L4e6ea:
    mov dword ptr [ebp-04h], 00h
L4e6f1:
    mov eax, dword ptr [ebp-04h]
    mov edx, dword ptr [ebp-0ch]
    cmp eax, dword ptr [edx+014h]
    jb short L4e703
    jmp short L4e718
L4e6fe:
    inc dword ptr [ebp-04h]
    jmp short L4e6f1
L4e703:
    imul edx, dword ptr [ebp-04h], 0f0h
    mov eax, dword ptr [ebp-0ch]
    mov eax, dword ptr [eax+058h]
    db 001h, 0d0h
    test byte ptr [eax+021h], 080h
    jne short L4e6fe
L4e718:
    mov eax, dword ptr [ebp-04h]
    mov edx, dword ptr [ebp-0ch]
    cmp eax, dword ptr [edx+014h]
    jne short L4e72f
    mov dword ptr [ebp-010h], 0ffffffffh
    jmp near ptr L4e82d
L4e72f:
    mov ebx, 0f0h
    mov edx, dword ptr [ebp-014h]
    imul ecx, dword ptr [ebp-04h], 0f0h
    mov eax, dword ptr [ebp-0ch]
    mov eax, dword ptr [eax+058h]
    db 001h, 0c8h
    call memcpy_
    imul ebx, dword ptr [ebp-04h], 0f0h
    mov eax, dword ptr [ebp-0ch]
    mov edx, dword ptr [eax+058h]
    db 001h, 0dah
    mov eax, dword ptr [ebp-014h]
    mov eax, dword ptr [eax]
    mov dword ptr [edx+04h], eax
    imul edx, dword ptr [ebp-04h], 0f0h
    mov eax, dword ptr [ebp-0ch]
    mov eax, dword ptr [eax+058h]
    db 001h, 0c2h
    mov eax, dword ptr [ebp-04h]
    mov dword ptr [edx+028h], eax
    mov eax, dword ptr [ebp-0ch]
    mov eax, dword ptr [eax+030h]
    mov dword ptr [ebp-08h], eax
    cmp dword ptr [ebp-08h], 00h
    jne short L4e7c9
    imul edx, dword ptr [ebp-04h], 0f0h
    mov eax, dword ptr [ebp-0ch]
    mov eax, dword ptr [eax+058h]
    db 001h, 0d0h
    mov dword ptr [eax+0ech], 00h
    imul edx, dword ptr [ebp-04h], 0f0h
    mov eax, dword ptr [ebp-0ch]
    mov eax, dword ptr [eax+058h]
    db 001h, 0d0h
    or byte ptr [eax+021h], 080h
    imul edx, dword ptr [ebp-04h], 0f0h
    mov eax, dword ptr [ebp-0ch]
    mov ebx, dword ptr [eax+058h]
    mov eax, dword ptr [ebp-0ch]
    db 001h, 0d3h
    mov dword ptr [eax+030h], ebx
    jmp short L4e827
L4e7c9:
    mov eax, dword ptr [ebp-08h]
    cmp dword ptr [eax+0ech], 00h
    je short L4e7e3
    mov eax, dword ptr [ebp-08h]
    mov eax, dword ptr [eax+0ech]
    mov dword ptr [ebp-08h], eax
    jmp short L4e7c9
L4e7e3:
    imul edx, dword ptr [ebp-04h], 0f0h
    mov eax, dword ptr [ebp-0ch]
    mov eax, dword ptr [eax+058h]
    db 001h, 0d0h
    mov dword ptr [eax+0ech], 00h
    imul edx, dword ptr [ebp-04h], 0f0h
    mov eax, dword ptr [ebp-0ch]
    mov eax, dword ptr [eax+058h]
    db 001h, 0d0h
    or byte ptr [eax+021h], 080h
    imul edx, dword ptr [ebp-04h], 0f0h
    mov eax, dword ptr [ebp-0ch]
    mov ebx, dword ptr [eax+058h]
    mov eax, dword ptr [ebp-08h]
    db 001h, 0d3h
    mov dword ptr [eax+0ech], ebx
L4e827:
    mov eax, dword ptr [ebp-04h]
    mov dword ptr [ebp-010h], eax
L4e82d:
    mov eax, dword ptr [ebp-010h]
    leave
    pop edi
    pop esi
    pop ecx
    pop ebx
    ret
Func4e6b6_ endp
Func4e836_ proc near
    push ebx
    push ecx
    push esi
    push edi
    push ebp
    db 089h, 0e5h
    db 081h, 0ech, 010h, 000h, 000h, 000h
    db 089h, 045h, 0f0h
    db 089h, 055h, 0f4h
    db 08bh, 045h, 0f0h
    db 0c1h, 0e0h, 002h
    mov eax, dword ptr [eax+_Datac7f54]
    db 089h, 045h, 0fch
    db 083h, 07dh, 0fch, 000h
    db 075h, 009h
    db 0c7h, 045h, 0f8h, 00ah, 000h, 000h, 000h
    db 0ebh, 038h
L4e867:
    db 069h, 055h, 0f4h, 0f0h, 000h, 000h, 000h
    db 08bh, 045h, 0fch
    db 08bh, 040h, 058h
    db 001h, 0d0h
    db 0f6h, 040h, 021h, 080h
    db 075h, 009h
    db 0c7h, 045h, 0f8h, 000h, 000h, 000h, 000h
    db 0ebh, 01ah
L4e885:
    db 069h, 055h, 0f4h, 0f0h, 000h, 000h, 000h
    db 08bh, 045h, 0fch
    db 08bh, 040h, 058h
    db 001h, 0d0h
    db 080h, "H!@"
    db 0c7h, 045h, 0f8h, 000h, 000h, 000h, 000h
L4e89f:
    db 08bh, 045h, 0f8h
    db 0c9h
    db 05fh
    db 05eh
    db 059h
    db 05bh
    db 0c3h
Func4e836_ endp
Func4e8a8_ proc near
    db 053h
    db 051h
    db 052h
    db 056h
    db 057h
    db 055h
    db 089h, 0e5h
    db 081h, 0ech, 010h, 000h, 000h, 000h
    db 089h, 045h, 0f0h
    mov eax, dword ptr [ebp-010h]
    shl eax, 02h
    mov eax, dword ptr [eax+_Datac7f54]
    mov dword ptr [ebp-04h], eax
    cmp dword ptr [ebp-04h], 00h
    jne short L4e8d7
    mov dword ptr [ebp-0ch], 0ah
    jmp short L4e90c
L4e8d7:
    mov dword ptr [ebp-08h], 00h
L4e8de:
    mov eax, dword ptr [ebp-08h]
    mov edx, dword ptr [ebp-04h]
    cmp eax, dword ptr [edx+014h]
    jb short L4e8f0
    jmp short L4e905
L4e8eb:
    inc dword ptr [ebp-08h]
    jmp short L4e8de
L4e8f0:
    imul edx, dword ptr [ebp-08h], 0f0h
    mov eax, dword ptr [ebp-04h]
    mov eax, dword ptr [eax+058h]
    db 001h, 0d0h
    or byte ptr [eax+021h], 040h
    jmp short L4e8eb
L4e905:
    mov dword ptr [ebp-0ch], 00h
L4e90c:
    mov eax, dword ptr [ebp-0ch]
    leave
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
Func4e8a8_ endp
Func4e916_ proc near
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
Func4e916_ endp
Func4e92b_ proc near
    db 053h
    db 051h
    db 052h
    db 056h
    db 057h
    db 055h
    db 089h, 0e5h
    db 081h, 0ech, 000h, 000h, 000h, 000h
    db 05dh
    db 05fh
    db 05eh
    db 05ah
    db 059h
    db 05bh
    db 0c3h
Func4e92b_ endp
Func4e940_ proc near
    db 053h
    db 051h
    db 052h
    db 056h
    db 057h
    db 055h
    db 089h, 0e5h
    db 081h, 0ech, 00ch, 000h, 000h, 000h
    db 089h, 045h, 0f4h
    mov eax, dword ptr [ebp-0ch]
    db 0c1h, 0e0h, 002h
    db 08bh, 080h
    dd offset _Datac7f54
    db 089h, 045h, 0fch
    db 083h, 07dh, 0fch, 000h
    db 075h, 009h
    db 0c7h, 045h, 0f8h, 00ah, 000h, 000h, 000h
    db 0ebh, 009h
L4e96f:
    db 08bh, 045h, 0fch
    db 08bh, 040h, 01ch
    db 089h, 045h, 0f8h
L4e978:
    db 08bh, 045h, 0f8h
    db 0c9h
    db 05fh
    db 05eh
    db 05ah
    db 059h
    db 05bh
    ret
Func4e940_ endp
Func4e982_ proc near
    push ecx
    push esi
    push edi
    push ebp
    db 089h, 0e5h
    db 081h, 0ech, 01ch, 000h, 000h, 000h
    db 089h, 045h, 0e4h
    db 089h, 055h, 0e8h
    db 089h, 05dh, 0ech
    db 08bh, 045h, 0e4h
    db 0c1h, 0e0h, 002h
    mov eax, dword ptr [eax+_Datac7f54]
    db 089h, 045h, 0fch
    db 083h, 07dh, 0fch, 000h
    db 075h, 009h
    db 0c7h, 045h, 0f0h, 00ah, 000h, 000h, 000h
    db 0ebh, 04dh
L4e9b5:
    db 069h, 055h, 0e8h, 0f0h, 000h, 000h, 000h
    db 08bh, 045h, 0fch
    db 08bh, 040h, 058h
    db 001h, 0d0h
    db 089h, 045h, 0f8h
    db 083h, 07dh, 0f8h, 000h
    db 075h, 009h
    db 0c7h, 045h, 0f0h, 00ah, 000h, 000h, 000h
    db 0ebh, 02ch
L4e9d6:
    db 08bh, 045h, 0f8h
    db 0f6h, 040h, 021h, 080h
    db 074h, 014h
    db 08bh, 045h, 0f8h
    db 08bh, 040h, 02ch
    db 089h, 045h, 0f4h
    db 08bh, 045h, 0ech
    db 08bh, 055h, 0f8h
    db 089h, 042h, 02ch
    db 0ebh, 009h
L4e9f3:
    db 0c7h, 045h, 0f0h, 00ah, 000h, 000h, 000h
    db 0ebh, 006h
L4e9fc:
    db 08bh, 045h, 0f4h
    db 089h, 045h, 0f0h
L4ea02:
    db 08bh, 045h, 0f0h
    db 0c9h
    db 05fh
    db 05eh
    db 059h
    db 0c3h
Func4e982_ endp
Func4ea0a_ proc near
    db 053h
    db 051h
    db 056h
    db 057h
    db 055h
    db 089h, 0e5h
    db 081h, 0ech, 014h, 000h, 000h, 000h
    db 089h, 045h, 0ech
    db 089h, 055h, 0f0h
    db 08bh, 045h, 0ech
    shl eax, 02h
    mov eax, dword ptr [eax+_Datac7f54]
    mov dword ptr [ebp-04h], eax
    cmp dword ptr [ebp-04h], 00h
    jne short L4ea3b
    mov dword ptr [ebp-0ch], 0ah
    jmp short L4ea77
L4ea3b:
    imul edx, dword ptr [ebp-010h], 0f0h
    mov eax, dword ptr [ebp-04h]
    mov eax, dword ptr [eax+058h]
    db 001h, 0d0h
    mov dword ptr [ebp-08h], eax
    cmp dword ptr [ebp-08h], 00h
    jne short L4ea5c
    mov dword ptr [ebp-0ch], 0ah
    jmp short L4ea77
L4ea5c:
    mov eax, dword ptr [ebp-08h]
    test byte ptr [eax+021h], 080h
    je short L4ea70
    mov eax, dword ptr [ebp-08h]
    mov eax, dword ptr [eax+02ch]
    mov dword ptr [ebp-0ch], eax
    jmp short L4ea77
L4ea70:
    mov dword ptr [ebp-0ch], 0ah
L4ea77:
    mov eax, dword ptr [ebp-0ch]
    leave
    pop edi
    pop esi
    pop ecx
    pop ebx
    ret
Func4ea0a_ endp
Func4ea80_ proc near
    push ebx
    push ecx
    push esi
    push edi
    push ebp
    db 089h, 0e5h
    db 081h, 0ech, 014h, 000h, 000h, 000h
    db 089h, 045h, 0ech
    db 089h, 055h, 0f0h
    db 08bh, 045h, 0ech
    db 0c1h, 0e0h, 002h
    mov eax, dword ptr [eax+_Datac7f54]
    db 089h, 045h, 0fch
    db 083h, 07dh, 0fch, 000h
    db 075h, 009h
    db 0c7h, 045h, 0f4h, 00ah, 000h, 000h, 000h
    db 0ebh, 03ch
L4eab1:
    db 069h, 055h, 0f0h, 0f0h, 000h, 000h, 000h
    db 08bh, 045h, 0fch
    db 08bh, 040h, 058h
    db 001h, 0d0h
    db 089h, 045h, 0f8h
    db 083h, 07dh, 0f8h, 000h
    db 075h, 009h
    db 0c7h, 045h, 0f4h, 00ah, 000h, 000h, 000h
    db 0ebh, 01bh
L4ead2:
    db 08bh, 045h, 0f8h
    db 0f6h, 040h, 021h, 080h
    db 074h, 00bh
    db 08bh, 045h, 0f8h
    db 08bh, 040h, 058h
    db 089h, 045h, 0f4h
    db 0ebh, 007h
L4eae6:
    db 0c7h, 045h, 0f4h, 00ah, 000h, 000h, 000h
L4eaed:
    db 08bh, 045h, 0f4h
    db 0c9h
    db 05fh
    db 05eh
    db 059h
    db 05bh
    db 0c3h
Func4ea80_ endp
Func4eaf6_ proc near
    db 053h
    db 051h
    db 056h
    db 057h
    db 055h
    db 089h, 0e5h
    db 081h, 0ech, 014h, 000h, 000h, 000h
    db 089h, 045h, 0ech
    db 089h, 055h, 0f0h
    db 08bh, 045h, 0ech
    shl eax, 02h
    db 08bh, 080h
    dd offset _Datac7f54
    db 089h, 045h, 0fch
    db 083h, 07dh, 0fch, 000h
    db 075h, 009h
    db 0c7h, 045h, 0f4h, 00ah, 000h, 000h, 000h
    jmp short L4eb63
L4eb27:
    imul edx, dword ptr [ebp-010h], 0f0h
    mov eax, dword ptr [ebp-04h]
    mov eax, dword ptr [eax+058h]
    db 001h, 0d0h
    mov dword ptr [ebp-08h], eax
    cmp dword ptr [ebp-08h], 00h
    jne short L4eb48
    mov dword ptr [ebp-0ch], 0ah
    jmp short L4eb63
L4eb48:
    mov eax, dword ptr [ebp-08h]
    test byte ptr [eax+021h], 080h
    je short L4eb5c
    mov eax, dword ptr [ebp-08h]
    mov eax, dword ptr [eax+030h]
    mov dword ptr [ebp-0ch], eax
    jmp short L4eb63
L4eb5c:
    mov dword ptr [ebp-0ch], 0ah
L4eb63:
    mov eax, dword ptr [ebp-0ch]
    leave
    pop edi
    pop esi
    pop ecx
    pop ebx
    ret
Func4eaf6_ endp
Func4eb6c_ proc near
    push ecx
    push esi
    push edi
    push ebp
    db 089h, 0e5h
    db 081h, 0ech, 01ch, 000h, 000h, 000h
    db 089h, 045h, 0e4h
    db 089h, 055h, 0e8h
    db 089h, 05dh, 0ech
    db 08bh, 045h, 0e4h
    db 0c1h, 0e0h, 002h
    mov eax, dword ptr [eax+_Datac7f54]
    db 089h, 045h, 0fch
    db 083h, 07dh, 0fch, 000h
    db 075h, 009h
    db 0c7h, 045h, 0f0h, 00ah, 000h, 000h, 000h
    db 0ebh, 04bh
L4eb9f:
    db 069h, 055h, 0e8h, 0f0h, 000h, 000h, 000h
    db 08bh, 045h, 0fch
    db 08bh, 040h, 058h
    db 001h, 0d0h
    db 089h, 045h, 0f8h
    db 083h, 07dh, 0f8h, 000h
    db 075h, 009h
    db 0c7h, 045h, 0f0h, 00ah, 000h, 000h, 000h
    db 0ebh, 02ah
L4ebc0:
    db 08bh, 045h, 0f8h
    db 0f6h, 040h, 021h, 080h
    db 074h, 01ah
    db 08bh, 045h, 0f8h
    db 08bh, 040h, 044h
    db 089h, 045h, 0f4h
    db 08bh, 045h, 0ech
    db 08bh, 055h, 0f8h
    db 089h, 042h, 044h
    db 08bh, 045h, 0f4h
    db 089h, 045h, 0f0h
    db 0ebh, 007h
L4ebe3:
    db 0c7h, 045h, 0f0h, 00ah, 000h, 000h, 000h
L4ebea:
    db 08bh, 045h, 0f0h
    db 0c9h
    db 05fh
    db 05eh
    db 059h
    db 0c3h
Func4eb6c_ endp
Func4ebf2_ proc near
    db 053h
    db 051h
    db 056h
    db 057h
    db 055h
    db 089h, 0e5h
    db 081h, 0ech, 014h, 000h, 000h, 000h
    db 089h, 045h, 0ech
    db 089h, 055h, 0f0h
    db 08bh, 045h, 0ech
    shl eax, 02h
    mov eax, dword ptr [eax+_Datac7f54]
    mov dword ptr [ebp-04h], eax
    cmp dword ptr [ebp-04h], 00h
    jne short L4ec23
    mov dword ptr [ebp-0ch], 0ah
    jmp short L4ec5f
L4ec23:
    imul edx, dword ptr [ebp-010h], 0f0h
    mov eax, dword ptr [ebp-04h]
    mov eax, dword ptr [eax+058h]
    db 001h, 0d0h
    mov dword ptr [ebp-08h], eax
    cmp dword ptr [ebp-08h], 00h
    jne short L4ec44
    mov dword ptr [ebp-0ch], 0ah
    jmp short L4ec5f
L4ec44:
    mov eax, dword ptr [ebp-08h]
    test byte ptr [eax+021h], 080h
    je short L4ec58
    mov eax, dword ptr [ebp-08h]
    mov eax, dword ptr [eax+044h]
    mov dword ptr [ebp-0ch], eax
    jmp short L4ec5f
L4ec58:
    mov dword ptr [ebp-0ch], 0ah
L4ec5f:
    mov eax, dword ptr [ebp-0ch]
    leave
    pop edi
    pop esi
    pop ecx
    pop ebx
    ret
Func4ebf2_ endp
Func4ec68_ proc near
    push ecx
    push esi
    push edi
    push ebp
    db 089h, 0e5h
    db 081h, 0ech, 01ch, 000h, 000h, 000h
    db 089h, 045h, 0e4h
    db 089h, 055h, 0e8h
    db 089h, 05dh, 0ech
    db 08bh, 045h, 0e4h
    db 0c1h, 0e0h, 002h
    mov eax, dword ptr [eax+_Datac7f54]
    db 089h, 045h, 0fch
    db 083h, 07dh, 0fch, 000h
    db 075h, 009h
    db 0c7h, 045h, 0f0h, 00ah, 000h, 000h, 000h
    db 0ebh, 04bh
L4ec9b:
    db 069h, 055h, 0e8h, 0f0h, 000h, 000h, 000h
    db 08bh, 045h, 0fch
    db 08bh, 040h, 058h
    db 001h, 0d0h
    db 089h, 045h, 0f8h
    db 083h, 07dh, 0f8h, 000h
    db 075h, 009h
    db 0c7h, 045h, 0f0h, 00ah, 000h, 000h, 000h
    db 0ebh, 02ah
L4ecbc:
    db 08bh, 045h, 0f8h
    db 0f6h, 040h, 021h, 080h
    db 074h, 01ah
    db 08bh, 045h, 0f8h
    db 08bh, 040h, 034h
    db 089h, 045h, 0f4h
    db 08bh, 045h, 0ech
    db 08bh, 055h, 0f8h
    db 089h, 042h, 034h
    db 08bh, 045h, 0f4h
    db 089h, 045h, 0f0h
    db 0ebh, 007h
L4ecdf:
    db 0c7h, 045h, 0f0h, 00ah, 000h, 000h, 000h
L4ece6:
    db 08bh, 045h, 0f0h
    db 0c9h
    db 05fh
    db 05eh
    db 059h
    db 0c3h
Func4ec68_ endp
Func4ecee_ proc near
    db 053h
    db 051h
    db 056h
    db 057h
    db 055h
    db 089h, 0e5h
    db 081h, 0ech, 014h, 000h, 000h, 000h
    db 089h, 045h, 0ech
    db 089h, 055h, 0f0h
    db 08bh, 045h, 0ech
    shl eax, 02h
    mov eax, dword ptr [eax+_Datac7f54]
    mov dword ptr [ebp-04h], eax
    cmp dword ptr [ebp-04h], 00h
    jne short L4ed1f
    mov dword ptr [ebp-0ch], 0ah
    jmp short L4ed5b
L4ed1f:
    imul edx, dword ptr [ebp-010h], 0f0h
    mov eax, dword ptr [ebp-04h]
    mov eax, dword ptr [eax+058h]
    db 001h, 0d0h
    mov dword ptr [ebp-08h], eax
    cmp dword ptr [ebp-08h], 00h
    jne short L4ed40
    mov dword ptr [ebp-0ch], 0ah
    jmp short L4ed5b
L4ed40:
    mov eax, dword ptr [ebp-08h]
    test byte ptr [eax+021h], 080h
    je short L4ed54
    mov eax, dword ptr [ebp-08h]
    mov eax, dword ptr [eax+034h]
    mov dword ptr [ebp-0ch], eax
    jmp short L4ed5b
L4ed54:
    mov dword ptr [ebp-0ch], 0ah
L4ed5b:
    mov eax, dword ptr [ebp-0ch]
    leave
    pop edi
    pop esi
    pop ecx
    pop ebx
    ret
Func4ecee_ endp
Func4ed64_ proc near
    push ebx
    push ecx
    push esi
    push edi
    push ebp
    db 089h, 0e5h
    db 081h, 0ech, 014h, 000h, 000h, 000h
    db 089h, 045h, 0ech
    db 089h, 055h, 0f0h
    db 08bh, 045h, 0ech
    db 0c1h, 0e0h, 002h
    mov eax, dword ptr [eax+_Datac7f54]
    db 089h, 045h, 0fch
    db 083h, 07dh, 0fch, 000h
    db 075h, 009h
    db 0c7h, 045h, 0f4h, 00ah, 000h, 000h, 000h
    db 0ebh, 03ch
L4ed95:
    db 069h, 055h, 0f0h, 0f0h, 000h, 000h, 000h
    db 08bh, 045h, 0fch
    db 08bh, 040h, 058h
    db 001h, 0d0h
    db 089h, 045h, 0f8h
    db 083h, 07dh, 0f8h, 000h
    db 075h, 009h
    db 0c7h, 045h, 0f4h, 00ah, 000h, 000h, 000h
    db 0ebh, 01bh
L4edb6:
    db 08bh, 045h, 0f8h
    db 0f6h, 040h, 021h, 080h
    db 074h, 00bh
    db 08bh, 045h, 0f8h
    db 08bh, 040h, 048h
    db 089h, 045h, 0f4h
    db 0ebh, 007h
L4edca:
    db 0c7h, 045h, 0f4h, 00ah, 000h, 000h, 000h
L4edd1:
    db 08bh, 045h, 0f4h
    db 0c9h
    db 05fh
    db 05eh
    db 059h
    db 05bh
    db 0c3h
Func4ed64_ endp
Func4edda_ proc near
    db 053h
    db 051h
    db 056h
    db 057h
    db 055h
    db 089h, 0e5h
    db 081h, 0ech, 014h, 000h, 000h, 000h
    db 089h, 045h, 0ech
    db 089h, 055h, 0f0h
    db 08bh, 045h, 0ech
    shl eax, 02h
    db 08bh, 080h
    dd offset _Datac7f54
    db 089h, 045h, 0fch
    db 083h, 07dh, 0fch, 000h
    db 075h, 009h
    db 0c7h, 045h, 0f4h, 00ah, 000h, 000h, 000h
    jmp short L4ee35
L4ee0b:
    imul edx, dword ptr [ebp-010h], 0f0h
    mov eax, dword ptr [ebp-04h]
    mov eax, dword ptr [eax+058h]
    db 001h, 0d0h
    mov dword ptr [ebp-08h], eax
    cmp dword ptr [ebp-08h], 00h
    jne short L4ee2c
    mov dword ptr [ebp-0ch], 0ah
    jmp short L4ee35
L4ee2c:
    mov eax, dword ptr [ebp-08h]
    mov eax, dword ptr [eax+01ch]
    mov dword ptr [ebp-0ch], eax
L4ee35:
    mov eax, dword ptr [ebp-0ch]
    leave
    pop edi
    pop esi
    pop ecx
    pop ebx
    ret
Func4edda_ endp
Func4ee3e_ proc near
    push ebx
    push ecx
    push esi
    push edi
    push ebp
    db 089h, 0e5h
    db 081h, 0ech, 014h, 000h, 000h, 000h
    db 089h, 045h, 0ech
    db 089h, 055h, 0f0h
    db 08bh, 045h, 0ech
    db 0c1h, 0e0h, 002h
    mov eax, dword ptr [eax+_Datac7f54]
    db 089h, 045h, 0fch
    db 083h, 07dh, 0fch, 000h
    db 075h, 009h
    db 0c7h, 045h, 0f4h, 00ah, 000h, 000h, 000h
    db 0ebh, 050h
L4ee6f:
    db 0c7h, 045h, 0f8h, 000h, 000h, 000h, 000h
L4ee76:
    db 08bh, 045h, 0f8h
    db 08bh, 055h, 0fch
    db 03bh, 042h, 014h
    db 072h, 007h
    db 0ebh, 035h
L4ee83:
    db 0ffh, 045h, 0f8h
    db 0ebh, 0eeh
L4ee88:
    db 069h, 055h, 0f8h, 0f0h, 000h, 000h, 000h
    db 08bh, 045h, 0fch
    db 08bh, 040h, 058h
    db 001h, 0d0h
    db 08bh, 040h, 01ch
    db 03bh, 045h, 0f0h
    db 074h, 017h
    db 069h, 055h, 0f8h, 0f0h, 000h, 000h, 000h
    db 08bh, 045h, 0fch
    db 08bh, 040h, 058h
    db 001h, 0d0h
    db 08bh, 040h, 028h
    db 089h, 045h, 0f4h
    db 0ebh, 009h
L4eeb6:
    db 0ebh, 0cbh
L4eeb8:
    db 0c7h, 045h, 0f4h, 0ffh, 0ffh, 0ffh, 0ffh
L4eebf:
    db 08bh, 045h, 0f4h
    db 0c9h
    db 05fh
    db 05eh
    db 059h
    db 05bh
    db 0c3h
Func4ee3e_ endp
Func4eec8_ proc near
    db 053h
    db 051h
    db 052h
    db 056h
    db 057h
    db 055h
    db 089h, 0e5h
    db 081h, 0ech, 00ch, 000h, 000h, 000h
    mov dword ptr [ebp-0ch], eax
    mov eax, dword ptr [ebp-0ch]
    shl eax, 02h
    mov eax, dword ptr [eax+_Datac7f54]
    mov dword ptr [ebp-04h], eax
    cmp dword ptr [ebp-04h], 00h
    jne short L4eef7
    mov dword ptr [ebp-08h], 0ah
    jmp short L4ef00
L4eef7:
    mov eax, dword ptr [ebp-04h]
    mov eax, dword ptr [eax+054h]
    mov dword ptr [ebp-08h], eax
L4ef00:
    mov eax, dword ptr [ebp-08h]
    leave
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
Func4eec8_ endp
Func4ef0a_ proc near
    push ebx
    push ecx
    push esi
    push edi
    push ebp
    db 089h, 0e5h
    db 081h, 0ech, 018h, 000h, 000h, 000h
    db 089h, 045h, 0ech
    db 089h, 055h, 0f0h
    db 08bh, 045h, 0ech
    db 0c1h, 0e0h, 002h
    db 08bh, 080h
    dd offset _Datac7f54
    db 089h, 045h, 0fch
    db 083h, 07dh, 0fch, 000h
    db 075h, 009h
    db 0c7h, 045h, 0f4h, 00ah, 000h, 000h, 000h
    db 0ebh, 040h
L4ef3b:
    db 069h, 055h, 0f0h, 0f0h, 000h, 000h, 000h
    db 08bh, 045h, 0fch
    db 08bh, 040h, 058h
    db 001h, 0d0h
    db 089h, 045h, 0f8h
    db 083h, 07dh, 0f8h, 000h
    db 075h, 009h
    db 0c7h, 045h, 0f4h, 00ah, 000h, 000h, 000h
    db 0ebh, 01fh
L4ef5c:
    db 08bh, 045h, 0f8h
    db 0f6h, 040h, 021h, 080h
    db 075h, 009h
    db 0c7h, 045h, 0e8h, 001h, 000h, 000h, 000h
    db 0ebh, 007h
L4ef6e:
    db 0c7h, 045h, 0e8h, 000h, 000h, 000h, 000h
L4ef75:
    db 08bh, 045h, 0e8h
    db 089h, 045h, 0f4h
L4ef7b:
    db 08bh, 045h, 0f4h
    db 0c9h
    db 05fh
    db 05eh
    db 059h
    db 05bh
    db 0c3h
Func4ef0a_ endp
Func4ef84_ proc near
    db 053h
    db 051h
    db 052h
    db 056h
    db 057h
    db 055h
    db 089h, 0e5h
    db 081h, 0ech, 000h, 000h, 000h, 000h
    db 05dh
    db 05fh
    db 05eh
    db 05ah
    db 059h
    db 05bh
    db 0c3h
Func4ef84_ endp
_TEXT ends

    end

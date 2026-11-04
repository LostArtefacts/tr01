    .586p

_TEXT segment para public use32 'CODE'
_TEXT ends
_DATA segment dword public use32 'DATA'
_DATA ends

    assume cs:FLAT, ds:FLAT, es:FLAT, ss:FLAT

    extrn Func4f344_:near
    extrn Func57b74_:near
    extrn Func57c20_:near
    extrn Func57c4c_:near
    extrn Func57cf0_:near
    extrn Func57d44_:near
    extrn Func57d78_:near
    extrn Func57dac_:near
    extrn Func57ee8_:near
    extrn Func583b8_:near
    extrn Func583dc_:near
    extrn Func583e4_:near
    extrn Func58444_:near
    extrn Func58674_:near
    extrn Func58698_:near
    extrn Func586a4_:near
    extrn Func586a8_:near
    extrn Func586ac_:near
    extrn Func586d0_:near
    extrn Func58720_:near
    extrn Func58748_:near
    extrn Func58770_:near
    extrn Func588e0_:near
    extrn Func58aa0_:near
    extrn _Datac6d58:byte
    extrn memset_:near

    public Func4f450_
    public Func4f548_
    public Func4f55c_
    public Func4f5b0_
    public Func4f5c4_
    public Func4f610_
    public Func4f620_
    public Func4f81c_
    public Func4f850_
    public Func4f86c_
    public Func4f9f4_
    public Func4fbf4_
    public Func502d0_
    public Func503cc_
    public Func50518_
    public Func50564_
    public Func5056c_
    public Func505d8_
    public Func50624_
    public Func5062c_
    public Func50634_
    public Func5063c_
    public Func50644_
    public Func5064c_
    public Func50654_
    public Func5065c_
    public Func50664_
    public Func5066c_
    public Func50674_
    public Func5067c_
    public Func50684_
    public Func5068c_
    public Func506a0_
    public Func506b0_
    public Func506c4_
    public Func506d0_
    public Func506ec_
    public Func506f8_
    public Func50704_
    public Func5070c_
    public Func50714_

_TEXT segment
Func4f450_ proc near
    push esi
    push ebp
    db 089h, 0c6h
    call Func586d0_
    mov dword ptr [edx], eax
    test eax, eax
    jne short L4f469
    mov eax, 03h
    pop ebp
    pop esi
    ret 0ch
L4f469::
    cmp dword ptr [esp+0ch], 00h
    je short L4f475
    mov ecx, 01h
L4f475::
    mov eax, dword ptr [edx]
    mov eax, dword ptr [eax]
    mov dword ptr [eax+010h], ecx
    mov ecx, dword ptr [edx]
    mov ecx, dword ptr [ecx]
    mov eax, dword ptr [esp+010h]
    mov dword ptr [ecx+04h], eax
    mov ecx, dword ptr [edx]
    mov ecx, dword ptr [ecx]
    mov dword ptr [ecx], eax
    mov eax, dword ptr [edx]
    mov eax, dword ptr [eax]
    mov dword ptr [eax+01ch], ebx
    mov eax, dword ptr [edx]
    mov eax, dword ptr [eax]
    mov dword ptr [eax+014h], ebx
    mov eax, dword ptr [edx]
    mov eax, dword ptr [eax]
    mov ebx, dword ptr [eax]
    mov ebp, dword ptr [eax+010h]
    imul ebx, ebp
    mov dword ptr [eax+08h], ebx
    mov eax, dword ptr [edx]
    mov eax, dword ptr [eax]
    mov ebx, dword ptr [esp+0ch]
    mov dword ptr [eax+0ch], ebx
    mov eax, dword ptr [edx]
    mov eax, dword ptr [eax]
    mov dword ptr [eax+03ch], 00h
    mov eax, dword ptr [edx]
    mov eax, dword ptr [eax]
    mov dword ptr [eax+040h], 01h
    mov eax, dword ptr [edx]
    mov eax, dword ptr [eax]
    mov ebx, dword ptr [esp+014h]
    mov dword ptr [eax+020h], ebx
    mov eax, dword ptr [edx]
    mov eax, dword ptr [eax]
    mov dword ptr [eax+024h], 00h
    mov eax, dword ptr [edx]
    mov eax, dword ptr [eax]
    mov dword ptr [eax+028h], 00h
    mov eax, dword ptr [edx]
    mov eax, dword ptr [eax]
    mov dword ptr [eax+02ch], 00h
    mov eax, dword ptr [edx]
    mov eax, dword ptr [eax]
    mov dword ptr [eax+030h], 00h
    mov eax, dword ptr [edx]
    mov eax, dword ptr [eax]
    mov dword ptr [eax+034h], 00h
    mov eax, dword ptr [edx]
    mov eax, dword ptr [eax]
    mov dword ptr [eax+038h], 00h
    mov eax, dword ptr [edx]
    mov eax, dword ptr [eax]
    mov dword ptr [eax+018h], 01h
    test esi, esi
    jne short L4f538
    mov eax, dword ptr [edx]
    call Func58720_
    mov eax, 01bh
    pop ebp
    pop esi
    ret 0ch
L4f538::
    mov eax, dword ptr [edx]
    mov eax, dword ptr [eax]
    mov dword ptr [eax+054h], esi
    db 031h, 0c0h
    pop ebp
    pop esi
    ret 0ch
Func4f450_ endp
    db 08bh, 0c0h
Func4f548_ proc near
    test eax, eax
    je short L4f554
    mov eax, dword ptr [eax]
    mov dword ptr [eax+03ch], edx
    db 031h, 0c0h
    ret
L4f554::
    mov eax, 026h
    ret
Func4f548_ endp
    db 08bh, 0c0h
Func4f55c_ proc near
    push ebx
    push ecx
    push edx
    push esi
    push edi
    push ebp
    mov eax, dword ptr [eax]
    cmp dword ptr [eax+0ch], 00h
    je short L4f579
    mov ebx, dword ptr [eax]
    mov edx, dword ptr [eax+044h]
    mov eax, dword ptr [eax+048h]
    call Func58748_
    jmp short L4f5a4
L4f579::
    cmp dword ptr [eax+020h], 01h
    jle short L4f591
    mov ebp, dword ptr [eax]
    push ebp
    mov edx, dword ptr [eax+048h]
    push edx
    mov ebx, dword ptr [eax+044h]
    push ebx
    call Func58770_
    jmp short L4f5a1
L4f591::
    mov ecx, dword ptr [eax]
    push ecx
    mov esi, dword ptr [eax+048h]
    push esi
    mov edi, dword ptr [eax+044h]
    push edi
    call Func588e0_
L4f5a1::
    add esp, 0ch
L4f5a4::
    db 031h, 0c0h
    pop ebp
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
Func4f55c_ endp
    db 08dh, 040h, 000h
Func4f5b0_ proc near
    test eax, eax
    je short L4f5bc
    call Func58720_
    db 031h, 0c0h
    ret
L4f5bc::
    mov eax, 026h
    ret
Func4f5b0_ endp
    db 08bh, 0c0h
Func4f5c4_ proc near
    push esi
    mov esi, dword ptr [eax]
    mov word ptr [esi], dx
    mov edx, dword ptr [eax]
    mov byte ptr [edx+02h], bl
    mov edx, dword ptr [eax]
    mov byte ptr [edx+03h], cl
    mov edx, dword ptr [eax]
    mov bl, byte ptr [esp+08h]
    mov byte ptr [edx+04h], bl
    mov edx, dword ptr [eax]
    mov bl, byte ptr [esp+0ch]
    mov byte ptr [edx+05h], bl
    mov edx, dword ptr [eax]
    mov bl, byte ptr [esp+010h]
    mov byte ptr [edx+06h], bl
    mov edx, dword ptr [eax]
    mov bl, byte ptr [esp+014h]
    mov byte ptr [edx+07h], bl
    mov edx, dword ptr [eax]
    mov bl, byte ptr [esp+018h]
    mov byte ptr [edx+08h], bl
    mov eax, dword ptr [eax]
    mov dl, byte ptr [esp+01ch]
    mov byte ptr [eax+09h], dl
    db 031h, 0c0h
    pop esi
    ret 018h
Func4f5c4_ endp
Func4f610_ proc near
    test eax, eax
    db 074h, 008h
    call Func57b74_
    db 08dh, 040h, 000h
L4f61c::
    db 031h, 0c0h
    db 0c3h
Func4f610_ endp
    db 090h
Func4f620_ proc near
    db 056h
    db 057h
    db 055h
    db 08bh, 074h, 024h, 010h
    db 089h, 0c5h
    db 089h, 0f0h
    db 0e8h, 020h, 094h, 000h, 000h
    db 089h, 045h, 000h
    db 085h, 0c0h
    db 075h, 00ah
    db 0b8h, 00fh, 000h, 000h, 000h
    db 0e9h, 0d4h, 001h, 000h, 000h
L4f641::
    db 0c7h, 080h, 05ch, 001h, 000h, 000h, 000h, 020h, 000h, 000h
    db 08bh, 07dh, 000h
    mov eax, dword ptr [_Datac6d58]
    db 089h, 087h, 060h, 001h, 000h, 000h
    db 08bh, 07dh, 000h
    db 0c7h, 087h, 054h, 001h, 000h, 000h, 002h, 000h, 000h, 000h
    db 08bh, 07dh, 000h
    db 0c7h, 087h, 068h, 001h, 000h, 000h, 000h, 000h, 000h, 000h
    db 08bh, 07dh, 000h
    db 0c7h, 087h, 0fch, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 08bh, 07dh, 000h
    db 0c7h, 087h, 000h, 001h, 000h, 000h, 000h, 000h, 000h, 000h
    db 08bh, 07dh, 000h
    db 0c7h, 087h, 004h, 001h, 000h, 000h, 000h, 000h, 000h, 000h
    db 08bh, 07dh, 000h
    db 0c7h, 087h, 008h, 001h, 000h, 000h, 000h, 000h, 000h, 000h
    db 08bh, 07dh, 000h
    db 0c7h, 087h, 00ch, 001h, 000h, 000h, 000h, 000h, 000h, 000h
    db 08bh, 07dh, 000h
    db 0c7h, 087h, 010h, 001h, 000h, 000h, 000h, 000h, 000h, 000h
    db 08bh, 07dh, 000h
    db 0c7h, 087h, 024h, 001h, 000h, 000h, 000h, 000h, 000h, 000h
    db 08bh, 07dh, 000h
    db 089h, 0b7h, 028h, 001h, 000h, 000h
    db 08bh, 07dh, 000h
    db 089h, 09fh, 014h, 001h, 000h, 000h
    db 08bh, 07dh, 000h
    db 089h, 09fh, 018h, 001h, 000h, 000h
    db 08bh, 05dh, 000h
    mov dword ptr [ebx+0150h], edx
    mov edx, dword ptr [ebp+00h]
    mov dword ptr [edx+014ch], offset Func4f850_
    inc eax
    mov edi, dword ptr [ebp+00h]
    db 089h, 0ceh
    add edi, 064h
    mov dword ptr [_Datac6d58], eax
    push edi
L4f70e::
    mov al, byte ptr [esi]
    mov byte ptr [edi], al
    cmp al, 00h
    je short L4f726
    mov al, byte ptr [esi+01h]
    add esi, 02h
    mov byte ptr [edi+01h], al
    add edi, 02h
    cmp al, 00h
    jne short L4f70e
L4f726::
    pop edi
    mov eax, dword ptr [ebp+00h]
    lea edx, [eax+064h]
    add eax, 08h
    call Func57cf0_
    test eax, eax
    je short L4f753
    mov eax, dword ptr [ebp+00h]
    call Func58aa0_
    mov eax, 011h
    mov dword ptr [ebp+00h], 00h
    pop ebp
    pop edi
    pop esi
    ret 04h
L4f753::
    mov edi, dword ptr [ebp+00h]
    mov edi, dword ptr [edi+08h]
    db 029h, 0c9h
    dec ecx
    db 031h, 0c0h
    db 0f2h, 0aeh
    not ecx
    dec ecx
    mov eax, dword ptr [ebp+00h]
    mov eax, dword ptr [eax+08h]
    mov byte ptr [ecx+eax*1-01h], 00h
    mov edi, dword ptr [ebp+00h]
    mov edi, dword ptr [edi+014h]
    db 029h, 0c9h
    dec ecx
    db 031h, 0c0h
    db 0f2h, 0aeh
    not ecx
    dec ecx
    mov eax, dword ptr [ebp+00h]
    mov eax, dword ptr [eax+014h]
    mov byte ptr [ecx+eax*1-01h], 00h
    mov edi, dword ptr [ebp+00h]
    mov edi, dword ptr [edi+0ch]
    db 029h, 0c9h
    dec ecx
    db 031h, 0c0h
    db 0f2h, 0aeh
    not ecx
    dec ecx
    mov eax, dword ptr [ebp+00h]
    mov eax, dword ptr [eax+0ch]
    mov byte ptr [ecx+eax*1-01h], 00h
    mov edi, dword ptr [ebp+00h]
    mov edi, dword ptr [edi+010h]
    db 029h, 0c9h
    dec ecx
    db 031h, 0c0h
    db 0f2h, 0aeh
    not ecx
    dec ecx
    mov eax, dword ptr [ebp+00h]
    mov eax, dword ptr [eax+010h]
    mov byte ptr [ecx+eax*1-01h], 00h
    mov eax, dword ptr [ebp+00h]
    mov dword ptr [eax+0144h], 00h
    lea edx, [eax+064h]
    mov eax, dword ptr [eax+04h]
    call Func583b8_
    mov edx, offset Dc6d54
    mov eax, dword ptr [ebp+00h]
    call Func583e4_
    mov eax, dword ptr [ebp+00h]
    mov eax, dword ptr [eax+0148h]
    mov byte ptr [eax+08h], 00h
    mov eax, dword ptr [ebp+00h]
    mov edx, dword ptr [eax+04h]
    cmp dword ptr [edx], 0ffffffffh
    jne short L4f813
    call Func58aa0_
    mov eax, 011h
    mov dword ptr [ebp+00h], 00h
    pop ebp
    pop edi
    pop esi
    ret 04h
L4f813::
    db 031h, 0c0h
L4f815::
    pop ebp
    pop edi
    pop esi
    ret 04h
Func4f620_ endp
    db 090h
Func4f81c_ proc near
    push ebx
    push edx
    db 089h, 0c3h
    test eax, eax
    je short L4f84b
    mov eax, dword ptr [eax+04h]
    mov eax, dword ptr [eax]
    mov edx, offset Dc6d54
    call Func583dc_
    db 089h, 0d8h
    call Func58444_
    lea eax, [ebx+08h]
    call Func57ee8_
    db 089h, 0d8h
    call Func58aa0_
    db 031h, 0c0h
L4f84b::
    pop edx
    pop ebx
    ret
Func4f81c_ endp
    db 08bh, 0c0h
Func4f850_ proc near
    push edx
    db 089h, 0c2h
    mov eax, dword ptr [Dc6d54]
    cmp edx, dword ptr [eax]
    je short L4f863
L4f85c::
    mov eax, dword ptr [eax+04h]
    cmp edx, dword ptr [eax]
    jne short L4f85c
L4f863::
    mov byte ptr [eax+08h], 01h
    pop edx
    ret
Func4f850_ endp
    db 08dh, 040h, 000h
Func4f86c_ proc near
    push esi
    push edi
    push ebp
    sub esp, 010h
    mov edi, dword ptr [esp+020h]
    db 089h, 0c6h
    db 089h, 0d5h
    mov dword ptr [esp+0ch], ebx
    db 031h, 0d2h
    mov dword ptr [esp+08h], edx
    mov dword ptr [esp+04h], edx
L4f888::
    mov edx, dword ptr [esi]
    mov ebx, dword ptr [esp+08h]
    mov dword ptr [edx+03ch], ebx
    mov ebx, dword ptr [esp+04h]
    mov ebx, dword ptr [edx+ebx*1+04ch]
    mov dword ptr [edx+048h], ebx
    mov edx, dword ptr [esi]
    mov ebx, dword ptr [edx+01ch]
    mov dword ptr [edx+014h], ebx
    mov edx, dword ptr [esi]
    mov ebx, dword ptr [edx+04h]
    mov dword ptr [edx], ebx
    mov eax, dword ptr [esp+0ch]
    cmp eax, dword ptr [ecx]
    jle near ptr L4f9b7
L4f8b7::
    mov edx, dword ptr [esi]
    cmp dword ptr [edx+014h], 00h
    jle near ptr L4f9b7
    mov ebx, dword ptr [ebp+00h]
    add ebx, dword ptr [ebp+0128h]
    cmp ebx, dword ptr [edx+044h]
    jbe near ptr L4f9b7
    mov ebx, dword ptr [edi]
    cmp ebx, dword ptr [edx]
    jle short L4f927
    db 089h, 0f0h
    call Func4f55c_
    mov edx, dword ptr [esi]
    mov ebx, dword ptr [edx]
    imul ebx, dword ptr [edx+010h]
    add dword ptr [edx+048h], ebx
    mov edx, dword ptr [esi]
    mov ebx, dword ptr [edx]
    add dword ptr [edx+044h], ebx
    mov edx, dword ptr [esi]
    mov ebx, dword ptr [edx]
    imul ebx, dword ptr [edx+010h]
    sub dword ptr [edx+014h], ebx
    mov edx, dword ptr [esi]
    mov ebx, dword ptr [edi]
    mov edx, dword ptr [edx]
    db 029h, 0d3h
    mov dword ptr [edi], ebx
    mov ebx, dword ptr [esi]
    mov edx, dword ptr [ebx+014h]
    db 089h, 0d0h
    sar edx, 01fh
    idiv dword ptr [ebx+010h]
    db 089h, 0c2h
    cmp edx, dword ptr [ebx]
    jge near ptr L4f9ab
    mov dword ptr [ebx], edx
    jmp near ptr L4f9ab
L4f927::
    db 089h, 0f0h
    mov dword ptr [edx], ebx
    call Func4f55c_
    mov edx, dword ptr [esi]
    mov ebx, dword ptr [edx]
    imul ebx, dword ptr [edx+010h]
    sub dword ptr [edx+014h], ebx
    mov edx, dword ptr [esi]
    mov ebx, dword ptr [edi]
    imul ebx, dword ptr [edx+010h]
    add dword ptr [edx+048h], ebx
    inc dword ptr [ecx]
    mov ebx, dword ptr [esi]
    mov edx, dword ptr [ebx+014h]
    db 089h, 0d0h
    sar edx, 01fh
    idiv dword ptr [ebx+010h]
    db 089h, 0c2h
    mov eax, dword ptr [ebx+04h]
    db 039h, 0c2h
    jle short L4f962
    mov dword ptr [ebx], eax
    jmp short L4f964
L4f962::
    mov dword ptr [ebx], edx
L4f964::
    mov ebx, dword ptr [ecx]
    lea edx, [ebx-01h]
    imul edx, edx, 0ch
    imul ebx, ebx, 0ch
    mov dword ptr [esp], edx
    mov eax, dword ptr [esp]
    mov edx, dword ptr [ebp+060h]
    db 001h, 0d0h
    mov edx, dword ptr [edx+ebx*1]
    mov eax, dword ptr [eax]
    mov ebx, dword ptr [esp+024h]
    db 029h, 0c2h
    add dword ptr [ebx], edx
    imul ebx, dword ptr [ecx], 0ch
    mov edx, dword ptr [ebp+060h]
    mov edx, dword ptr [edx+ebx*1+08h]
    mov dword ptr [edi], edx
    imul edx, dword ptr [ecx], 0ch
    mov ebx, dword ptr [ebp+060h]
    db 001h, 0d3h
    mov edx, dword ptr [esp+024h]
    mov eax, dword ptr [ebx+04h]
    mov edx, dword ptr [edx]
    mov ebx, dword ptr [esi]
    db 001h, 0c2h
    mov dword ptr [ebx+044h], edx
L4f9ab::
    mov ebx, dword ptr [esp+0ch]
    cmp ebx, dword ptr [ecx]
    jg near ptr L4f8b7
L4f9b7::
    mov eax, dword ptr [esp+04h]
    mov edx, dword ptr [esp+08h]
    add eax, 04h
    inc edx
    mov dword ptr [esp+04h], eax
    mov dword ptr [esp+08h], edx
    cmp edx, 02h
    jl near ptr L4f888
    mov edx, dword ptr [esi]
    mov ebx, dword ptr [edx+04ch]
    mov dword ptr [edx+048h], ebx
    mov edx, dword ptr [esi]
    mov ebx, dword ptr [edx+01ch]
    mov dword ptr [edx+014h], ebx
    mov edx, dword ptr [esi]
    mov ebx, dword ptr [edx+04h]
    mov dword ptr [edx], ebx
    add esp, 010h
    pop ebp
    pop edi
    pop esi
    ret 08h
Func4f86c_ endp
Func4f9f4_ proc near
    push ecx
    push esi
    push edi
    push ebp
    db 089h, 0c6h
    db 089h, 0d5h
    db 089h, 0dfh
    mov edx, dword ptr [eax]
    mov eax, dword ptr [eax+0128h]
    db 001h, 0c2h
    mov eax, dword ptr [esi]
    mov dword ptr [esi+0cch], edx
    mov dword ptr [esi+0b4h], eax
    mov dword ptr [esi+0b8h], eax
    mov dword ptr [esi+0bch], eax
    mov dword ptr [esi+0c4h], eax
    mov dword ptr [esi+0d4h], eax
    mov eax, dword ptr [esi+0cch]
    mov dword ptr [esi+0dch], eax
    mov dword ptr [esi+0d8h], eax
    mov eax, dword ptr [esi+038h]
    mov edx, dword ptr [esi+034h]
    inc eax
    imul eax, edx
    dec eax
    mov dword ptr [esi+011ch], eax
    mov edx, dword ptr [esi+060h]
    mov eax, dword ptr [esi+044h]
    mov ebx, dword ptr [edx]
    db 029h, 0d8h
    mov dword ptr [esi+0130h], eax
    mov dword ptr [esi+012ch], eax
    mov edx, dword ptr [esi+060h]
    mov eax, dword ptr [esi+04h]
    lea ebx, [esi+0b4h]
    mov edx, dword ptr [edx]
    mov eax, dword ptr [eax]
    call Func57dac_
    db 031h, 0dbh
L4fa7e::
    mov edx, dword ptr [esi+0b4h]
    mov eax, dword ptr [esi+015ch]
    mov ecx, dword ptr [esi+0cch]
    db 001h, 0d0h
    db 039h, 0c8h
    jae near ptr L4fb50
    mov eax, dword ptr [esi+0148h]
    cmp bl, byte ptr [eax+08h]
    jne short L4fabe
    mov byte ptr [eax+08h], 02h
    db 089h, 0f0h
    call Func57d44_
    test eax, eax
    je short L4fabe
    mov eax, 019h
    pop ebp
    pop edi
    pop esi
    pop ecx
    ret
L4fabe::
    mov eax, dword ptr [esi+0148h]
    cmp byte ptr [eax+08h], 01h
    jne short L4fa7e
    mov eax, dword ptr [esi+015ch]
    mov edx, dword ptr [esi+0b4h]
    db 001h, 0c2h
    mov eax, dword ptr [esi+0148h]
    mov dword ptr [esi+0b4h], edx
    mov byte ptr [eax+08h], bl
    mov eax, dword ptr [esi+015ch]
    mov ecx, dword ptr [esi+012ch]
    db 029h, 0c1h
    mov eax, dword ptr [esi+0114h]
    mov dword ptr [esi+012ch], ecx
    db 039h, 0c3h
    je near ptr L4fa7e
    cmp ebx, dword ptr [esi+0150h]
    je near ptr L4fa7e
    mov eax, dword ptr [esi+015ch]
    mov ecx, dword ptr [esi+0118h]
    db 029h, 0c1h
    mov edx, dword ptr [esi+015ch]
    mov dword ptr [esi+0118h], ecx
    db 039h, 0d1h
    jge near ptr L4fa7e
    mov eax, dword ptr [esi+0114h]
    db 001h, 0c1h
    mov dword ptr [esi+0118h], ecx
    call dword ptr [esi+0150h]
    jmp near ptr L4fa7e
L4fb50::
    lea eax, [esi+0b8h]
    push eax
    lea eax, [esi+0bch]
    lea ecx, [esi+0100h]
    lea ebx, [esi+0108h]
    push eax
    db 089h, 0f0h
    call Func502d0_
    test edi, edi
    je short L4fbca
    mov eax, dword ptr [esi]
    mov dword ptr [esi+0c8h], eax
    mov eax, dword ptr [esi+060h]
    mov edx, dword ptr [esi+0c8h]
    mov eax, dword ptr [eax+04h]
    db 001h, 0d0h
    mov edx, dword ptr [edi]
    mov dword ptr [edx+044h], eax
    mov eax, dword ptr [esi+060h]
    mov eax, dword ptr [eax+08h]
    mov dword ptr [esi+0124h], eax
    lea eax, [esi+0c8h]
    push eax
    lea eax, [esi+0124h]
    mov ebx, dword ptr [esi+0108h]
    lea ecx, [esi+010ch]
    push eax
    db 089h, 0f2h
    db 089h, 0f8h
    call Func4f86c_
    mov eax, dword ptr [edi]
    mov dword ptr [eax+03ch], 0ffffffffh
    jmp short L4fbd4
L4fbca::
    mov dword ptr [esi+010ch], 0f423fh
L4fbd4::
    test ebp, ebp
    jne short L4fbe4
    mov dword ptr [esi+0110h], 0f423fh
    jmp short L4fbec
L4fbe4::
    mov edx, dword ptr [ebp+00h]
    mov eax, dword ptr [esi]
    mov dword ptr [edx+046h], eax
L4fbec::
    db 031h, 0c0h
    pop ebp
    pop edi
    pop esi
    pop ecx
    ret
Func4f9f4_ endp
    db 090h
Func4fbf4_ proc near
    push esi
    push edi
    push ebp
    sub esp, 020h
    db 089h, 0c5h
    mov dword ptr [esp+014h], edx
    mov dword ptr [esp+018h], ebx
    mov dword ptr [esp+04h], ecx
    mov edx, dword ptr [esp+030h]
    mov eax, dword ptr [eax+0104h]
    mov dword ptr [ebp+0158h], 01h
    db 001h, 0d0h
    mov dword ptr [ebp+0120h], eax
    test edx, edx
    jne short L4fc42
    test ebx, ebx
    je short L4fc38
    mov dword ptr [ebp+0154h], 03h
    jmp short L4fc42
L4fc38::
    mov dword ptr [ebp+0154h], 01h
L4fc42::
    lea eax, [ebp+0b8h]
    mov dword ptr [esp+0ch], eax
    lea eax, [ebp+0bch]
    mov dword ptr [esp+08h], eax
    lea eax, [ebp+0100h]
    mov esi, dword ptr [esp+014h]
    mov dword ptr [esp+010h], eax
    lea eax, [ebp+0108h]
    test esi, esi
    sete byte ptr [esp+01ch]
    mov dword ptr [esp], eax
L4fc74::
    cmp dword ptr [ebp+0158h], 00h
    je near ptr L502c3
    mov eax, dword ptr [ebp+010ch]
    cmp eax, dword ptr [ebp+0110h]
    jge short L4fc9a
    mov eax, dword ptr [esp+018h]
    mov eax, dword ptr [eax]
    mov eax, dword ptr [eax+044h]
    jmp short L4fca3
L4fc9a::
    mov eax, dword ptr [esp+014h]
    mov eax, dword ptr [eax]
    mov eax, dword ptr [eax+046h]
L4fca3::
    mov dword ptr [ebp+0d4h], eax
    mov eax, dword ptr [ebp+0154h]
    cmp eax, 02h
    jb short L4fcc5
    jbe near ptr L4febe
    cmp eax, 03h
    je near ptr L50060
    jmp short L4fc74
L4fcc5::
    cmp eax, 01h
    jne short L4fc74
    cmp dword ptr [ebp+012ch], 00h
    jbe near ptr L4fe97
    mov ecx, dword ptr [ebp+0b4h]
    mov eax, dword ptr [ebp+015ch]
    mov esi, dword ptr [ebp+0cch]
    db 001h, 0c8h
    db 039h, 0f0h
    jae near ptr L4fde3
    mov edx, dword ptr [ebp+0d4h]
    db 039h, 0d0h
    jb short L4fd11
    db 039h, 0d1h
    ja short L4fd11
    mov eax, dword ptr [ebp+0148h]
    cmp byte ptr [eax+08h], 01h
    jne near ptr L4fe97
L4fd11::
    mov eax, dword ptr [ebp+0148h]
    cmp byte ptr [eax+08h], 00h
    jne short L4fd59
    mov byte ptr [eax+08h], 02h
    mov eax, dword ptr [ebp+012ch]
    cmp eax, dword ptr [ebp+015ch]
    jbe short L4fd44
    db 089h, 0e8h
    call Func57d44_
    test eax, eax
    je short L4fd59
    mov eax, 019h
    jmp near ptr L502c5
L4fd44::
    db 089h, 0e8h
    call Func57d78_
    test eax, eax
    je short L4fd59
    mov eax, 019h
    jmp near ptr L502c5
L4fd59::
    mov eax, dword ptr [ebp+0148h]
    cmp byte ptr [eax+08h], 01h
    jne near ptr L4fe97
    mov eax, dword ptr [ebp+012ch]
    mov esi, dword ptr [ebp+015ch]
    db 039h, 0f0h
    jbe short L4fd9d
    mov edx, dword ptr [ebp+0b4h]
    mov eax, dword ptr [ebp+015ch]
    mov ebx, dword ptr [ebp+012ch]
    db 001h, 0f2h
    db 029h, 0c3h
    mov dword ptr [ebp+0b4h], edx
    mov dword ptr [ebp+012ch], ebx
    jmp short L4fdb5
L4fd9d::
    mov edi, dword ptr [ebp+0b4h]
    mov dword ptr [ebp+012ch], 00h
    db 001h, 0c7h
    mov dword ptr [ebp+0b4h], edi
L4fdb5::
    mov ecx, dword ptr [esp+0ch]
    mov esi, dword ptr [esp+08h]
    push ecx
    mov ebx, dword ptr [esp+04h]
    db 089h, 0e8h
    push esi
    mov edx, dword ptr [ebp+0b4h]
    mov ecx, dword ptr [esp+018h]
    call Func502d0_
    mov eax, dword ptr [ebp+0148h]
    mov byte ptr [eax+08h], 00h
    jmp near ptr L4fe97
L4fde3::
    mov edi, dword ptr [ebp+0d4h]
    db 039h, 0f9h
    jbe near ptr L4fe97
    mov eax, dword ptr [ebp+0b8h]
    mov edx, dword ptr [ebp+00h]
    db 029h, 0c1h
    db 089h, 0f8h
    db 029h, 0d0h
    db 039h, 0c1h
    jge near ptr L4fe97
    mov edx, dword ptr [ebp+0b8h]
    mov ebx, dword ptr [ebp+0bch]
    mov eax, dword ptr [ebp+00h]
    db 029h, 0dah
    db 029h, 0d0h
    mov dword ptr [ebp+0bch], eax
    mov ecx, dword ptr [ebp+0108h]
    mov dword ptr [ebp+0d0h], eax
    imul eax, ecx, 0ch
    mov edx, dword ptr [ebp+060h]
    db 001h, 0d0h
    mov edi, dword ptr [ebp+00h]
    mov edx, dword ptr [ebp+0bch]
    mov eax, dword ptr [eax+04h]
    mov ecx, dword ptr [ebp+0b4h]
    db 001h, 0c2h
    mov eax, dword ptr [ebp+0b8h]
    mov dword ptr [ebp+0c0h], edx
    db 089h, 0c6h
    mov dword ptr [ebp+0d8h], eax
    db 029h, 0c1h
    mov dword ptr [ebp+0dch], eax
    push edi
    db 089h, 0c8h
    shr ecx, 02h
    db 0f2h, 0a5h
    mov cl, al
    and cl, 03h
    db 0f2h, 0a4h
    pop edi
    mov eax, dword ptr [ebp+0b4h]
    mov edi, dword ptr [ebp+0b8h]
    mov edx, dword ptr [ebp+00h]
    db 029h, 0f8h
    db 001h, 0c2h
    mov eax, dword ptr [ebp+00h]
    mov dword ptr [ebp+0b4h], edx
    mov dword ptr [ebp+0b8h], eax
L4fe97::
    mov edi, dword ptr [esp+030h]
    test edi, edi
    jne short L4feaa
    mov dword ptr [ebp+0158h], edi
    jmp near ptr L4fc74
L4feaa::
    db 031h, 0c0h
    mov al, byte ptr [esp+01ch]
    add eax, 02h
    mov dword ptr [ebp+0154h], eax
    jmp near ptr L4fc74
L4febe::
    cmp dword ptr [esp+018h], 00h
    je short L4fecc
    mov eax, 03h
    jmp short L4fed1
L4fecc::
    mov eax, 01h
L4fed1::
    mov dword ptr [ebp+0154h], eax
    mov eax, dword ptr [ebp+0100h]
    mov edi, dword ptr [ebp+0104h]
    dec eax
    db 039h, 0f8h
    jg short L4fefc
    mov edx, dword ptr [ebp+0100h]
    mov ebx, dword ptr [ebp+011ch]
    db 039h, 0dah
    jl near ptr L50042
L4fefc::
    mov eax, dword ptr [ebp+011ch]
    mov edi, dword ptr [ebp+0104h]
    dec eax
    db 039h, 0f8h
    jg short L4ff1b
    mov eax, 020h
    add esp, 020h
    pop ebp
    pop edi
    pop esi
    ret 010h
L4ff1b::
    mov eax, dword ptr [esp+014h]
    mov eax, dword ptr [eax]
    mov eax, dword ptr [eax+046h]
    test word ptr [eax], 0114h
    je short L4ff45
    mov eax, dword ptr [esp+03ch]
    mov ecx, dword ptr [esp+038h]
    mov ebx, dword ptr [esp+034h]
    push eax
    mov edx, dword ptr [esp+08h]
    mov eax, dword ptr [esp+018h]
    call Func4f344_
L4ff45::
    mov eax, dword ptr [esp+014h]
    mov eax, dword ptr [eax]
    mov edx, dword ptr [eax+046h]
    mov ebx, dword ptr [edx+04h]
    db 001h, 0dah
    mov dword ptr [eax+046h], edx
    mov edx, dword ptr [ebp+0104h]
    inc edx
    mov ebx, dword ptr [ebp+0120h]
    mov dword ptr [ebp+0104h], edx
    db 039h, 0dah
    jne short L4ff77
    mov dword ptr [ebp+0158h], 00h
L4ff77::
    mov ecx, dword ptr [ebp+0fch]
    inc ecx
    mov esi, dword ptr [ebp+034h]
    mov dword ptr [ebp+0fch], ecx
    db 039h, 0f1h
    je short L4ffad
    imul edx, dword ptr [ebp+0110h], 0ch
    mov eax, dword ptr [ebp+060h]
    db 001h, 0c2h
    mov eax, dword ptr [ebp+0c4h]
    mov edx, dword ptr [edx+04h]
    db 001h, 0c2h
    mov eax, dword ptr [esp+014h]
    mov eax, dword ptr [eax]
    cmp edx, dword ptr [eax+046h]
    ja short L5000a
L4ffad::
    mov eax, dword ptr [ebp+0110h]
    cmp eax, dword ptr [ebp+038h]
    jl short L4ffc6
    mov eax, 020h
    add esp, 020h
    pop ebp
    pop edi
    pop esi
    ret 010h
L4ffc6::
    lea esi, [eax+01h]
    mov dword ptr [ebp+0110h], esi
    lea ebx, [esi-01h]
    imul ebx, ebx, 0ch
    imul eax, esi, 0ch
    mov edx, dword ptr [ebp+060h]
    mov eax, dword ptr [edx+eax*1]
    mov edi, dword ptr [edx+ebx*1]
    mov edx, dword ptr [ebp+0c4h]
    db 029h, 0f8h
    db 001h, 0c2h
    mov dword ptr [ebp+0c4h], edx
    mov edx, dword ptr [esp+014h]
    mov edx, dword ptr [edx]
    mov eax, dword ptr [ebp+0c4h]
    mov dword ptr [edx+046h], eax
    mov dword ptr [ebp+0fch], 00h
L5000a::
    mov eax, dword ptr [esp+014h]
    mov eax, dword ptr [eax]
    mov ebx, dword ptr [ebp+0d8h]
    cmp ebx, dword ptr [eax+046h]
    ja near ptr L4fc74
    mov edx, dword ptr [ebp+00h]
    mov dword ptr [eax+046h], edx
    mov eax, dword ptr [ebp+0d0h]
    mov dword ptr [ebp+0c4h], eax
    mov eax, dword ptr [ebp+0cch]
    mov dword ptr [ebp+0d8h], eax
    jmp near ptr L4fc74
L50042::
    db 039h, 0f8h
    jg near ptr L4fc74
    db 039h, 0dah
    jge near ptr L4fc74
    mov eax, 01dh
    add esp, 020h
    pop ebp
    pop edi
    pop esi
    ret 010h
L50060::
    mov eax, dword ptr [esp+018h]
    mov eax, dword ptr [eax]
    cmp dword ptr [eax+03ch], 0ffffffffh
    je near ptr L50270
    mov edx, dword ptr [ebp+010ch]
    mov ecx, dword ptr [ebp+0108h]
    db 039h, 0cah
    jle short L50089
    cmp ecx, dword ptr [ebp+038h]
    jne near ptr L5027f
L50089::
    mov eax, dword ptr [esp+018h]
    mov eax, dword ptr [eax]
    mov edx, dword ptr [ebp+0124h]
    cmp edx, dword ptr [eax]
    jle short L50108
    mov eax, dword ptr [esp+018h]
    mov edx, dword ptr [esp+018h]
    call Func4f55c_
    mov edx, dword ptr [edx]
    mov eax, dword ptr [edx]
    imul eax, dword ptr [edx+010h]
    mov esi, dword ptr [edx+048h]
    db 001h, 0c6h
    mov eax, dword ptr [esp+018h]
    mov dword ptr [edx+048h], esi
    mov eax, dword ptr [eax]
    mov edx, dword ptr [eax]
    add dword ptr [eax+044h], edx
    mov eax, dword ptr [esp+018h]
    mov eax, dword ptr [eax]
    mov edx, dword ptr [eax]
    imul edx, dword ptr [eax+010h]
    sub dword ptr [eax+014h], edx
    mov eax, dword ptr [esp+018h]
    mov eax, dword ptr [eax]
    mov esi, dword ptr [ebp+0124h]
    sub esi, dword ptr [eax]
    mov ebx, dword ptr [esp+018h]
    mov dword ptr [ebp+0124h], esi
    mov ebx, dword ptr [ebx]
    mov edx, dword ptr [ebx+014h]
    mov edi, dword ptr [ebx+010h]
    db 089h, 0d0h
    sar edx, 01fh
    idiv edi
    db 089h, 0c2h
    cmp edx, dword ptr [ebx]
    jge near ptr L501e3
    mov dword ptr [ebx], edx
    jmp near ptr L501e3
L50108::
    test edx, edx
    jle short L5016d
    mov dword ptr [eax], edx
    mov eax, dword ptr [esp+018h]
    call Func4f55c_
    mov eax, dword ptr [esp+018h]
    mov eax, dword ptr [eax]
    mov edx, dword ptr [eax]
    imul edx, dword ptr [eax+010h]
    mov edi, dword ptr [eax+014h]
    db 029h, 0d7h
    mov edx, dword ptr [esp+018h]
    mov dword ptr [eax+014h], edi
    mov edx, dword ptr [edx]
    mov eax, dword ptr [ebp+0124h]
    imul eax, dword ptr [edx+010h]
    add dword ptr [edx+048h], eax
    mov esi, dword ptr [ebp+010ch]
    inc esi
    mov ebx, dword ptr [esp+018h]
    mov dword ptr [ebp+010ch], esi
    mov ebx, dword ptr [ebx]
    mov edx, dword ptr [ebx+014h]
    mov edi, dword ptr [ebx+010h]
    db 089h, 0d0h
    sar edx, 01fh
    idiv edi
    db 089h, 0c2h
    mov eax, dword ptr [ebx+04h]
    db 039h, 0c2h
    jle short L5016b
    mov dword ptr [ebx], eax
    jmp short L5016d
L5016b::
    mov dword ptr [ebx], edx
L5016d::
    mov eax, dword ptr [ebp+010ch]
    cmp eax, dword ptr [ebp+038h]
    jle short L50185
    mov eax, dword ptr [esp+018h]
    mov eax, dword ptr [eax]
    mov dword ptr [eax+014h], 00h
L50185::
    mov eax, dword ptr [ebp+010ch]
    lea edx, [eax-01h]
    imul ebx, edx, 0ch
    imul eax, eax, 0ch
    mov edx, dword ptr [ebp+060h]
    mov eax, dword ptr [edx+eax*1]
    mov ecx, dword ptr [edx+ebx*1]
    mov esi, dword ptr [ebp+0c8h]
    db 029h, 0c8h
    mov edi, dword ptr [ebp+010ch]
    db 001h, 0c6h
    imul eax, edi, 0ch
    mov edx, dword ptr [ebp+060h]
    mov dword ptr [ebp+0c8h], esi
    mov eax, dword ptr [edx+eax*1+08h]
    mov dword ptr [ebp+0124h], eax
    imul edx, dword ptr [ebp+010ch], 0ch
    mov eax, dword ptr [ebp+060h]
    db 001h, 0d0h
    mov ebx, dword ptr [eax+04h]
    mov eax, dword ptr [esp+018h]
    mov edx, dword ptr [ebp+0c8h]
    mov eax, dword ptr [eax]
    db 001h, 0dah
    mov dword ptr [eax+044h], edx
L501e3::
    mov eax, dword ptr [esp+018h]
    mov eax, dword ptr [eax]
    mov edx, dword ptr [ebp+0dch]
    cmp edx, dword ptr [eax+044h]
    ja short L5021b
    mov eax, dword ptr [ebp+0cch]
    mov edx, dword ptr [esp+018h]
    mov dword ptr [ebp+0dch], eax
    mov edx, dword ptr [edx]
    mov eax, dword ptr [ebp+0c0h]
    mov dword ptr [edx+044h], eax
    mov eax, dword ptr [ebp+0d0h]
    mov dword ptr [ebp+0c8h], eax
L5021b::
    mov eax, dword ptr [esp+018h]
    mov eax, dword ptr [eax]
    cmp dword ptr [eax+014h], 00h
    jne near ptr L50270
    mov edx, dword ptr [eax+01ch]
    mov dword ptr [eax+014h], edx
    mov eax, dword ptr [esp+018h]
    mov eax, dword ptr [eax]
    mov edx, dword ptr [eax+04h]
    mov dword ptr [eax], edx
    mov eax, dword ptr [esp+018h]
    mov eax, dword ptr [eax]
    cmp dword ptr [eax+03ch], 00h
    sete dl
    and edx, 0ffh
    mov edx, dword ptr [eax+edx*4+04ch]
    mov dword ptr [eax+048h], edx
    mov edx, dword ptr [esp+018h]
    mov edx, dword ptr [edx]
    mov eax, dword ptr [esp+018h]
    call dword ptr [edx+054h]
    mov eax, dword ptr [esp+018h]
    mov eax, dword ptr [eax]
    mov dword ptr [eax+03ch], 0ffffffffh
L50270::
    mov dword ptr [ebp+0154h], 01h
    jmp near ptr L4fc74
L5027f::
    mov ebx, dword ptr [eax+014h]
    mov edx, dword ptr [eax+03ch]
    mov eax, dword ptr [eax+edx*4+04ch]
    db 031h, 0d2h
    call memset_
    mov edx, dword ptr [esp+018h]
    mov edx, dword ptr [edx]
    mov eax, dword ptr [esp+018h]
    call dword ptr [edx+054h]
    mov eax, dword ptr [esp+018h]
    mov eax, dword ptr [eax]
    mov dword ptr [eax+03ch], 0ffffffffh
    mov eax, dword ptr [ebp+010ch]
    cmp eax, dword ptr [ebp+038h]
    jle short L50270
    mov eax, 021h
    add esp, 020h
    pop ebp
    pop edi
    pop esi
    ret 010h
L502c3::
    db 031h, 0c0h
L502c5::
    add esp, 020h
    pop ebp
    pop edi
    pop esi
    ret 010h
Func4fbf4_ endp
    db 08bh, 0c0h
Func502d0_ proc near
    push esi
    push edi
    push ebp
    sub esp, 08h
    db 089h, 0c6h
    db 089h, 0d7h
    mov dword ptr [esp+04h], ecx
    mov eax, dword ptr [ebx]
    mov ecx, dword ptr [esi+038h]
    db 031h, 0d2h
    db 039h, 0c8h
    jne short L50303
    mov ecx, dword ptr [ebx]
    lea eax, [ecx*4+00h]
    db 029h, 0c8h
    shl eax, 02h
    mov ecx, dword ptr [esi+060h]
    db 001h, 0c1h
    mov eax, dword ptr [esi+044h]
    sub eax, dword ptr [ecx]
    jmp short L50332
L50303::
    db 089h, 0c1h
    inc eax
    mov dword ptr [esp], eax
    mov ebp, dword ptr [esp]
    shl eax, 02h
    db 029h, 0e8h
    shl eax, 02h
    mov ebp, dword ptr [esi+060h]
    db 001h, 0e8h
    mov dword ptr [esp], eax
    db 089h, 0c8h
    shl eax, 02h
    db 029h, 0c8h
    shl eax, 02h
    db 001h, 0c5h
    mov eax, dword ptr [esp]
    mov ecx, dword ptr [ebp+00h]
    mov eax, dword ptr [eax]
    db 029h, 0c8h
L50332::
    mov ecx, dword ptr [esp+018h]
    mov ecx, dword ptr [ecx]
    db 001h, 0c8h
    db 039h, 0f8h
    jae short L5036d
    mov ecx, dword ptr [ebx]
    cmp ecx, dword ptr [esi+038h]
    jg short L5036d
    mov ecx, dword ptr [esp+018h]
    mov dword ptr [ecx], eax
    mov eax, dword ptr [ebx]
    inc eax
    db 089h, 0c1h
    imul ecx, ecx, 0ch
    mov dword ptr [ebx], eax
    inc eax
    imul eax, eax, 0ch
    mov dword ptr [esp], eax
    mov ebp, dword ptr [esp]
    mov eax, dword ptr [esi+060h]
    db 001h, 0c5h
    db 001h, 0c1h
    mov eax, dword ptr [ebp+00h]
    sub eax, dword ptr [ecx]
    jmp short L50332
L5036d::
    mov eax, dword ptr [esp+018h]
    mov ecx, dword ptr [esp+01ch]
    mov eax, dword ptr [eax]
    mov dword ptr [ecx], eax
    mov eax, dword ptr [ebx]
    imul eax, dword ptr [esi+034h]
    mov ebx, dword ptr [esp+04h]
    mov dword ptr [ebx], eax
    mov eax, dword ptr [esp+018h]
    mov ecx, dword ptr [esi]
    cmp ecx, dword ptr [eax]
    jae short L503c0
    mov ebx, dword ptr [esp+018h]
    db 089h, 0f8h
    sub eax, dword ptr [ebx]
    cmp eax, 010h
    jl short L503c0
L5039c::
    mov eax, dword ptr [esp+01ch]
    mov eax, dword ptr [eax]
    add eax, dword ptr [eax+04h]
    lea ebx, [eax+010h]
    db 039h, 0fbh
    jae short L503c0
    inc edx
    cmp edx, dword ptr [esi+034h]
    jge short L503c0
    mov ebx, dword ptr [esp+01ch]
    mov dword ptr [ebx], eax
    mov eax, dword ptr [esp+04h]
    inc dword ptr [eax]
    jmp short L5039c
L503c0::
    add esp, 08h
    pop ebp
    pop edi
    pop esi
    ret 08h
Func502d0_ endp
    db 08dh, 040h, 000h
Func503cc_ proc near
    push ecx
    push esi
    push edi
    push ebp
    db 089h, 0c6h
    db 089h, 0d5h
    db 089h, 0dfh
    mov dword ptr [eax+0154h], 02h
    mov dword ptr [eax+0168h], 00h
    mov dword ptr [eax+0fch], 00h
    mov dword ptr [eax+0104h], 00h
    mov dword ptr [eax+010ch], 00h
    mov ebx, dword ptr [eax+0148h]
    mov dword ptr [eax+0110h], 00h
    mov byte ptr [ebx+08h], 02h
    mov ebx, dword ptr [eax]
    mov dword ptr [eax+0b8h], ebx
    mov dword ptr [eax+0bch], ebx
    mov dword ptr [eax+0c4h], ebx
    mov dword ptr [eax+0d4h], ebx
    test edi, edi
    je near ptr L504ef
    mov ebx, dword ptr [edi]
    mov ecx, dword ptr [ebx+04h]
    mov dword ptr [ebx], ecx
    mov ebx, dword ptr [edi]
    mov ecx, dword ptr [ebx+01ch]
    mov dword ptr [ebx+014h], ecx
    mov ebx, dword ptr [edi]
    mov dword ptr [ebx+03ch], 00h
    mov dword ptr [ebx+040h], 01h
    mov dword ptr [ebx+024h], 00h
    mov ebx, dword ptr [edi]
    mov dword ptr [ebx+028h], 00h
    mov ebx, dword ptr [edi]
    mov dword ptr [ebx+02ch], 00h
    mov ebx, dword ptr [edi]
    mov dword ptr [ebx+030h], 00h
    mov ebx, dword ptr [edi]
    mov dword ptr [ebx+034h], 00h
    mov ebx, dword ptr [edi]
    mov dword ptr [ebx+038h], 00h
    mov ebx, dword ptr [edi]
    mov dword ptr [ebx+018h], 01h
    mov ebx, dword ptr [eax]
    mov dword ptr [eax+0c8h], ebx
    mov ebx, dword ptr [eax+060h]
    mov ebx, dword ptr [ebx+08h]
    mov dword ptr [eax+0124h], ebx
    mov ebx, dword ptr [eax+060h]
    mov ecx, dword ptr [eax+0c8h]
    mov edx, dword ptr [ebx+04h]
    mov ebx, dword ptr [edi]
    db 001h, 0d1h
    mov dword ptr [ebx+044h], ecx
    lea ebx, [eax+0c8h]
    push ebx
    lea ebx, [eax+0124h]
    lea ecx, [eax+010ch]
    push ebx
    db 089h, 0c2h
    mov ebx, dword ptr [eax+0108h]
    db 089h, 0f8h
    call Func4f86c_
    mov ebx, dword ptr [edi]
    mov dword ptr [ebx+03ch], 0ffffffffh
    jmp short L504f9
L504ef::
    mov dword ptr [eax+010ch], 0f423fh
L504f9::
    test ebp, ebp
    jne short L50509
    mov dword ptr [esi+0110h], 0f423fh
    jmp short L50511
L50509::
    mov ebx, dword ptr [ebp+00h]
    mov ecx, dword ptr [esi]
    mov dword ptr [ebx+046h], ecx
L50511::
    db 031h, 0c0h
    pop ebp
    pop edi
    pop esi
    pop ecx
    ret
Func503cc_ endp
Func50518_ proc near
    push esi
    push edi
    mov esi, dword ptr [eax]
    mov edi, dword ptr [esp+014h]
    mov dword ptr [esi+032h], edi
    mov esi, dword ptr [eax]
    mov dword ptr [esi+012h], ebx
    mov ebx, dword ptr [eax]
    mov dword ptr [ebx+016h], edx
    mov edx, dword ptr [eax]
    mov ebx, dword ptr [esp+0ch]
    mov dword ptr [edx+01ah], ebx
    mov edx, dword ptr [eax]
    mov dword ptr [edx+01eh], ecx
    mov edx, dword ptr [eax]
    mov ebx, dword ptr [esp+010h]
    mov dword ptr [edx+022h], ebx
    mov edx, dword ptr [eax]
    mov dword ptr [edx+026h], edi
    mov edx, dword ptr [eax]
    mov ebx, dword ptr [esp+018h]
    mov dword ptr [edx+03ah], ebx
    db 089h, 0dah
    mov eax, dword ptr [eax]
    and edx, 0fh
    mov dword ptr [eax+036h], edx
    db 031h, 0c0h
    pop edi
    pop esi
    ret 010h
Func50518_ endp
    db 090h
Func50564_ proc near
    mov eax, dword ptr [eax]
    mov eax, dword ptr [eax+03ch]
    ret
Func50564_ endp
    db 08bh, 0c0h
Func5056c_ proc near
    push ecx
    push esi
    push edi
    db 089h, 0c6h
    mov eax, dword ptr [eax]
    cmp dword ptr [eax+05eh], 00h
    jne short L50582
    mov eax, 01fh
    pop edi
    pop esi
    pop ecx
    ret
L50582::
    cmp dword ptr [edx], 00h
    je short L505d0
    cmp dword ptr [eax+05ah], 00h
    jne short L505d0
    mov eax, dword ptr [edx+04h]
    push eax
    db 089h, 0d0h
    call Func586ac_
    push eax
    db 089h, 0d0h
    call Func586a8_
    push eax
    db 089h, 0d0h
    call Func586a4_
    push eax
    db 089h, 0d0h
    call Func58698_
    db 089h, 0c1h
    db 089h, 0d0h
    call Func58674_
    mov edi, dword ptr [esi]
    mov edi, dword ptr [edi+04ah]
    db 089h, 0c2h
    db 089h, 0f8h
    call Func57c20_
    mov eax, dword ptr [esi]
    mov dword ptr [eax+05ah], 01h
L505d0::
    db 031h, 0c0h
    pop edi
    pop esi
    pop ecx
    ret
Func5056c_ endp
    db 08bh, 0c0h
Func505d8_ proc near
    push ecx
    push esi
    db 089h, 0c1h
    mov eax, dword ptr [eax]
    cmp dword ptr [eax+05eh], 00h
    jne short L505ec
    mov eax, 01fh
    pop esi
    pop ecx
    ret
L505ec::
    db 089h, 0d0h
    call Func58674_
    test eax, eax
    je short L5061d
    mov eax, dword ptr [ecx]
    cmp dword ptr [eax+05ah], 00h
    je short L5061d
    db 089h, 0d0h
    call Func58674_
    mov esi, dword ptr [ecx]
    mov esi, dword ptr [esi+04ah]
    db 089h, 0c2h
    db 089h, 0f0h
    call Func57c4c_
    mov eax, dword ptr [ecx]
    mov dword ptr [eax+05ah], 00h
L5061d::
    db 031h, 0c0h
    pop esi
    pop ecx
    ret
Func505d8_ endp
    db 08bh, 0c0h
Func50624_ proc near
    test eax, eax
    je short L5062b
    mov eax, dword ptr [eax+08h]
L5062b::
    ret
Func50624_ endp
Func5062c_ proc near
    test eax, eax
    je short L50633
    mov eax, dword ptr [eax+0ch]
L50633::
    ret
Func5062c_ endp
Func50634_ proc near
    test eax, eax
    je short L5063b
    mov eax, dword ptr [eax+010h]
L5063b::
    ret
Func50634_ endp
Func5063c_ proc near
    test eax, eax
    je short L50643
    mov eax, dword ptr [eax+014h]
L50643::
    ret
Func5063c_ endp
Func50644_ proc near
    test eax, eax
    je short L5064b
    mov eax, dword ptr [eax+018h]
L5064b::
    ret
Func50644_ endp
Func5064c_ proc near
    test eax, eax
    je short L50653
    mov eax, dword ptr [eax+024h]
L50653::
    ret
Func5064c_ endp
Func50654_ proc near
    test eax, eax
    je short L5065b
    mov eax, dword ptr [eax+01ch]
L5065b::
    ret
Func50654_ endp
Func5065c_ proc near
    test eax, eax
    je short L50663
    mov eax, dword ptr [eax+020h]
L50663::
    ret
Func5065c_ endp
Func50664_ proc near
    test eax, eax
    je short L5066b
    mov eax, dword ptr [eax+028h]
L5066b::
    ret
Func50664_ endp
Func5066c_ proc near
    test eax, eax
    je short L50673
    mov eax, dword ptr [eax+030h]
L50673::
    ret
Func5066c_ endp
Func50674_ proc near
    test eax, eax
    je short L5067b
    mov eax, dword ptr [eax+02ch]
L5067b::
    ret
Func50674_ endp
Func5067c_ proc near
    test eax, eax
    je short L50683
    mov eax, dword ptr [eax+038h]
L50683::
    ret
Func5067c_ endp
Func50684_ proc near
    test eax, eax
    je short L5068b
    mov eax, dword ptr [eax+034h]
L5068b::
    ret
Func50684_ endp
Func5068c_ proc near
    sub esp, 04h
    test eax, eax
    je short L50696
    mov eax, dword ptr [eax+05ch]
L50696::
    mov dword ptr [esp], eax
    fld dword ptr [esp]
    add esp, 04h
    ret
Func5068c_ endp
Func506a0_ proc near
    push edx
    test eax, eax
    je short L506ac
    mov edx, dword ptr [esp+08h]
    mov dword ptr [eax+05ch], edx
L506ac::
    pop edx
    ret 04h
Func506a0_ endp
Func506b0_ proc near
    push edx
    test eax, eax
    je short L506bf
    mov edx, dword ptr [eax+038h]
    inc edx
    mov eax, dword ptr [eax+034h]
    imul eax, edx
L506bf::
    pop edx
    ret
Func506b0_ endp
    db 08dh, 040h, 000h
Func506c4_ proc near
    test eax, eax
    je short L506ce
    mov eax, dword ptr [eax+0104h]
L506ce::
    ret
Func506c4_ endp
    db 090h
Func506d0_ proc near
    push edx
    test eax, eax
    je short L506e5
    mov edx, dword ptr [eax+0100h]
    sub edx, dword ptr [eax+0104h]
    db 089h, 0d0h
    pop edx
    ret
L506e5::
    db 031h, 0d2h
    db 089h, 0d0h
    pop edx
    ret
Func506d0_ endp
    db 090h
Func506ec_ proc near
    test eax, eax
    je short L506f6
    mov eax, dword ptr [eax+0110h]
L506f6::
    ret
Func506ec_ endp
    db 090h
Func506f8_ proc near
    test eax, eax
    je short L50702
    mov eax, dword ptr [eax+010ch]
L50702::
    ret
Func506f8_ endp
    db 090h
Func50704_ proc near
    mov eax, dword ptr [eax+04h]
    mov dword ptr [eax+010h], edx
    ret
Func50704_ endp
    db 090h
Func5070c_ proc near
    mov eax, dword ptr [eax+04h]
    mov eax, dword ptr [eax+010h]
    ret
Func5070c_ endp
    db 090h
Func50714_ proc near
    push ebx
    push edx
    sub esp, 08h
    test eax, eax
    je short L50736
    mov edx, dword ptr [eax+038h]
    mov ebx, dword ptr [eax+034h]
    inc edx
    imul ebx, edx
    mov dword ptr [esp], ebx
    fild dword ptr [esp]
    fdiv dword ptr [eax+05ch]
    fstp dword ptr [esp+04h]
    jmp short L5073a
L50736::
    mov dword ptr [esp+04h], eax
L5073a::
    fld dword ptr [esp+04h]
    add esp, 08h
    pop edx
    pop ebx
    ret
Func50714_ endp
_TEXT ends

_DATA segment
Dc6d54 label byte
    db 000h, 000h, 000h, 000h
_DATA ends

    end

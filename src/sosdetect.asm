    .586p

_TEXT segment byte public use32 'CODE'
_TEXT ends
CONST segment dword public use32 'DATA'
CONST ends

    assume cs:FLAT, ds:FLAT, es:FLAT, ss:FLAT

    extrn Func56d2d_:near
    extrn Func56e89_:near
    extrn Func57000_:near
    extrn Func57067_:near
    extrn Func5721a_:near
    extrn Func5724f_:near
    extrn Func5728e_:near
    extrn Func572d8_:near
    extrn _Datac8128:byte
    extrn _Datac81ac:byte
    extrn _Datac822c:byte
    extrn _Datac824c:byte
    extrn _Datac8258:byte
    extrn _Datac827c:byte
    extrn _Datac8280:byte
    extrn _Datac8285:byte
    extrn _Datac8288:byte
    extrn _Datac82c5:byte
    extrn _Datac82f4:byte
    extrn _Datac82f8:byte
    extrn _Datac82fc:byte
    extrn _Datac8300:byte
    extrn _Datac8304:byte
    extrn _Datac8308:byte
    extrn _Datac830c:byte
    extrn _Datac8310:byte
    extrn _Datac8314:byte
    extrn _Datac8318:byte
    extrn _Datac831c:byte
    extrn _Datac85a4:byte
    extrn _Datac85a8:byte
    extrn _Datac85ac:byte
    extrn _Datac85b0:byte
    extrn _dos_read_:near
    extrn _lseek_:near
    extrn getenv_:near
    extrn read_:near

    public Func59b67_
    public Func59b7c_
    public Func59cc9_
    public Func59d51_
    public Func59fc8_
    public Func5a142_
    public Func5a37f_
    public Func5a590_
    public Func5a710_
    public Func5a7cb_
    public Func5a7e0_
    public Func5a7f5_
    public Func5a81f_

_TEXT segment
Func59b67_ proc near
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
Func59b67_ endp
Func59b7c_ proc near
    db 053h
    db 051h
    db 052h
    db 056h
    db 057h
    db 055h
    db 089h, 0e5h
    db 081h, 0ech, 010h, 000h, 000h, 000h
    mov dword ptr [ebp-010h], eax
    db 0f6h, 005h
    dd offset _Datac8128
    db 001h
    db 074h, 00ch
    db 0c7h, 045h, 0f4h, 003h, 000h, 000h, 000h
    db 0e9h, 01dh, 001h, 000h, 000h
L59ba2::
    db 083h, 07dh, 0f0h, 000h
    je short L59bc6
    db 08bh, 055h, 0f0h
    mov eax, offset _Datac81ac
    db 0e8h, 0fah, 0cch, 0ffh, 0ffh
    mov edx, offset Dc14a0
    mov eax, offset _Datac81ac
    db 0e8h, 01eh, 035h, 000h, 000h
    db 0ebh, 00fh
L59bc6::
    mov edx, offset Dc14a0
    mov eax, offset _Datac81ac
    db 0e8h, 0dah, 0cch, 0ffh, 0ffh
L59bd5::
    db 068h, 000h, 002h, 000h, 000h
    db 0b8h
    dd offset _Datac81ac
    db 050h
    db 0e8h, 0efh, 021h, 0ffh, 0ffh
    db 083h, 0c4h, 008h
    db 0a3h
    dd offset _Datac8308
    db 083h, 03dh
    dd offset _Datac8308
    db 0ffh
    db 075h, 00ch
    db 0c7h, 045h, 0f4h, 00fh, 000h, 000h, 000h
    db 0e9h, 0bdh, 000h, 000h, 000h
L59c02::
    db 0bbh, 02ch, 000h, 000h, 000h
    mov edx, offset _Datac822c
    mov eax, dword ptr [_Datac8308]
    db 0e8h, 0ffh, 034h, 000h, 000h
    mov eax, offset _Datac8318
    push eax
    db 0b8h
    dd offset _Datac8314
    db 050h
    db 068h, 000h, 010h, 000h, 000h
    db 0e8h, 07bh, 0d1h, 0ffh, 0ffh
    db 089h, 0d3h
    db 089h, 0c1h
    add esp, 0ch
    db 066h, 089h, 01dh
    dd offset _Datac82fc
    db 089h, 00dh
    dd offset _Datac82f8
    db 083h, 03dh
    dd offset _Datac82f8
    db 000h
    jne short L59c5c
    db 066h, 083h, 03dh
    dd offset _Datac82fc
    db 000h
    db 075h, 009h
    db 0c7h, 045h, 0f4h, 005h, 000h, 000h, 000h
    jmp short L59cbf
L59c5c::
    movzx eax, word ptr [_Datac82fc]
    push eax
    push dword ptr [_Datac82f8]
    call Func56e89_
    db 089h, 0d3h
    db 089h, 0c1h
    add esp, 08h
    mov word ptr [_Datac8304], bx
    mov dword ptr [_Datac8300], ecx
    push 01000h
    push dword ptr [_Datac8318]
    call Func56d2d_
    add esp, 08h
    test eax, eax
    je short L59ca3
    mov dword ptr [ebp-0ch], 05h
    jmp short L59cbf
L59ca3::
    db 031h, 0dbh
    db 031h, 0d2h
    mov eax, dword ptr [_Datac8308]
    call _lseek_
    or byte ptr [_Datac8128], 01h
    mov dword ptr [ebp-0ch], 00h
L59cbf::
    mov eax, dword ptr [ebp-0ch]
    leave
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
Func59b7c_ endp
Func59cc9_ proc near
    push ebx
    push ecx
    push edx
    push esi
    push edi
    push ebp
    db 089h, 0e5h
    db 081h, 0ech, 004h, 000h, 000h, 000h
    and byte ptr [_Datac8128], 0feh
    mov eax, dword ptr [_Datac8308]
    db 0e8h, 059h, 035h, 000h, 000h
    db 068h, 000h, 010h, 000h, 000h
    push dword ptr [_Datac8318]
    db 0e8h, 072h, 0d0h, 0ffh, 0ffh
    db 083h, 0c4h, 008h
    db 085h, 0c0h
    db 074h, 009h
    db 0c7h, 045h, 0fch, 005h, 000h, 000h, 000h
    db 0ebh, 03fh
L59d08::
    push dword ptr [_Datac8314]
    movzx eax, word ptr [_Datac82fc]
    push eax
    push dword ptr [_Datac82f8]
    db 0e8h, 032h, 0d1h, 0ffh, 0ffh
    db 083h, 0c4h, 00ch
    push dword ptr [_Datac8314]
    movzx eax, word ptr [_Datac8304]
    push eax
    push dword ptr [_Datac8300]
    db 0e8h, 016h, 0d1h, 0ffh, 0ffh
    db 083h, 0c4h, 00ch
    db 0c7h, 045h, 0fch, 000h, 000h, 000h, 000h
L59d47::
    db 08bh, 045h, 0fch
    db 0c9h
    db 05fh
    db 05eh
    db 05ah
    db 059h
    db 05bh
    db 0c3h
Func59cc9_ endp
Func59d51_ proc near
    db 053h
    db 051h
    db 056h
    db 057h
    db 055h
    db 089h, 0e5h
    db 081h, 0ech, 028h, 000h, 000h, 000h
    db 089h, 045h, 0d8h
    db 089h, 055h, 0dch
    db 0c7h, 045h, 0fch, 000h, 000h, 000h, 000h
    db 0c7h, 045h, 0f8h, 000h, 000h, 000h, 000h
    db 0c7h, 045h, 0e8h, 000h, 000h, 000h, 000h
    db 0c7h, 045h, 0e4h, 000h, 000h, 000h, 000h
    db 083h, 07dh, 0dch, 000h
    db 075h, 00ch
    db 0c7h, 045h, 0e0h, 002h, 000h, 000h, 000h
    db 0e9h, 02dh, 002h, 000h, 000h
L59d92::
    db 081h, 07dh, 0d8h, 000h, 0e0h, 000h, 000h
    db 072h, 009h
    db 081h, 07dh, 0d8h, 000h, 0e2h, 000h, 000h
    db 076h, 00ch
L59da4::
    db 0c7h, 045h, 0e0h, 006h, 000h, 000h, 000h
    db 0e9h, 00fh, 002h, 000h, 000h
L59db0::
    db 0c7h, 005h
    dd offset _Datac8310
    db 000h, 000h, 000h, 000h
    db 031h, 0dbh
    db 031h, 0d2h
    mov eax, dword ptr [_Datac8308]
    call _lseek_
    mov ebx, 02ch
    mov edx, offset _Datac822c
    mov eax, dword ptr [_Datac8308]
    call read_
L59ddc::
    mov eax, dword ptr [_Datac8310]
    cmp eax, dword ptr [_Datac824c]
    ja short L59def
    cmp dword ptr [ebp-04h], 00h
    je short L59df4
L59def::
    jmp near ptr L59e83
L59df4::
    mov ebx, 01h
    db 031h, 0d2h
    mov eax, dword ptr [_Datac8308]
    call _lseek_
    mov dword ptr [ebp-0ch], eax
    mov ebx, 030h
    mov edx, offset _Datac8258
    mov eax, dword ptr [_Datac8308]
    call read_
    mov eax, dword ptr [_Datac827c]
    mov dword ptr [ebp-014h], eax
    mov eax, dword ptr [_Datac8280]
    cmp eax, dword ptr [ebp-028h]
    jne short L59e37
    test byte ptr [_Datac8285], 080h
    jne short L59e39
L59e37::
    jmp short L59e66
L59e39::
    mov dword ptr [ebp-04h], 01h
    lea eax, [ebp-010h]
    push eax
    mov edx, dword ptr [ebp-014h]
    mov bx, word ptr [_Datac82fc]
    mov eax, dword ptr [_Datac82f8]
    mov esi, dword ptr [_Datac8308]
    db 089h, 0d9h
    db 089h, 0c3h
    db 089h, 0f0h
    call _dos_read_
    jmp short L59e78
L59e66::
    mov ebx, 01h
    mov edx, dword ptr [ebp-014h]
    mov eax, dword ptr [_Datac8308]
    call _lseek_
L59e78::
    inc dword ptr [_Datac8310]
    jmp near ptr L59ddc
L59e83::
    cmp dword ptr [ebp-04h], 00h
    je near ptr L59fb8
    mov eax, offset _Datac8288
    push eax
    movzx eax, word ptr [_Datac82fc]
    push eax
    push dword ptr [_Datac82f8]
    movzx eax, word ptr [_Datac8304]
    push eax
    push dword ptr [_Datac8300]
    call Func57067_
    add esp, 014h
    test byte ptr [_Datac82c5], 01h
    je short L59f20
    movzx eax, word ptr [_Datac82fc]
    push eax
    push dword ptr [_Datac82f8]
    movzx eax, word ptr [_Datac8304]
    push eax
    push dword ptr [_Datac8300]
    call Func5724f_
    add esp, 010h
    mov dword ptr [ebp-018h], 00h
L59eeb::
    push dword ptr [ebp-018h]
    call Func5728e_
    add esp, 04h
    test eax, eax
    je short L59f20
    push dword ptr [ebp-018h]
    call Func5728e_
    add esp, 04h
    call getenv_
    mov dword ptr [ebp-01ch], eax
    push dword ptr [ebp-01ch]
    push dword ptr [ebp-018h]
    call Func572d8_
    add esp, 08h
    inc dword ptr [ebp-018h]
    jmp short L59eeb
L59f20::
    movzx eax, word ptr [_Datac82fc]
    push eax
    push dword ptr [_Datac82f8]
    movzx eax, word ptr [_Datac8304]
    push eax
    push dword ptr [_Datac8300]
    call Func57000_
    add esp, 010h
    mov dword ptr [ebp-08h], eax
    cmp dword ptr [ebp-08h], 00h
    je short L59faf
    mov eax, dword ptr [ebp-024h]
    add eax, 06ch
    push eax
    movzx eax, word ptr [_Datac82fc]
    push eax
    push dword ptr [_Datac82f8]
    movzx eax, word ptr [_Datac8304]
    push eax
    push dword ptr [_Datac8300]
    call Func57067_
    add esp, 014h
    mov eax, dword ptr [ebp-024h]
    add eax, 06ch
    mov dword ptr [_Datac82f4], eax
    mov eax, dword ptr [ebp-08h]
    mov edx, dword ptr [ebp-024h]
    mov dword ptr [edx+05ch], eax
    mov eax, dword ptr [ebp-024h]
    mov edx, dword ptr [eax+0d0h]
    mov eax, dword ptr [ebp-024h]
    mov dword ptr [eax+0104h], edx
    mov eax, dword ptr [ebp-0ch]
    mov dword ptr [_Datac830c], eax
    mov dword ptr [ebp-020h], 00h
    jmp short L59fbf
L59faf::
    mov dword ptr [ebp-020h], 08h
    jmp short L59fbf
L59fb8::
    mov dword ptr [ebp-020h], 07h
L59fbf::
    mov eax, dword ptr [ebp-020h]
    leave
    pop edi
    pop esi
    pop ecx
    pop ebx
    ret
Func59d51_ endp
Func59fc8_ proc near
    push ebx
    push ecx
    push esi
    push edi
    push ebp
    db 089h, 0e5h
    db 081h, 0ech, 01ch, 000h, 000h, 000h
    db 089h, 045h, 0e4h
    db 089h, 055h, 0e8h
    db 0c7h, 045h, 0f8h, 000h, 000h, 000h, 000h
    db 083h, 07dh, 0e8h, 000h
    db 075h, 00ch
    db 0c7h, 045h, 0ech, 002h, 000h, 000h, 000h
    db 0e9h, 045h, 001h, 000h, 000h
L59ff4::
    db 081h, 07dh, 0e4h, 000h, 0e0h, 000h, 000h
    db 072h, 009h
    db 081h, 07dh, 0e4h, 000h, 0e2h, 000h, 000h
    db 076h, 00ch
L5a006::
    db 0c7h, 045h, 0ech, 006h, 000h, 000h, 000h
    db 0e9h, 027h, 001h, 000h, 000h
L5a012::
    db 0c7h, 005h
    dd offset _Datac8310
    db 000h, 000h, 000h, 000h
    db 031h, 0dbh
    db 031h, 0d2h
    mov eax, dword ptr [_Datac8308]
    db 0e8h, 001h, 030h, 0ffh, 0ffh
    db 0bbh, 02ch, 000h, 000h, 000h
    mov edx, offset _Datac822c
    mov eax, dword ptr [_Datac8308]
    db 0e8h, 0d7h, 030h, 000h, 000h
L5a03e::
    mov eax, dword ptr [_Datac8310]
    cmp eax, dword ptr [_Datac824c]
    db 077h, 006h
    db 083h, 07dh, 0f8h, 000h
    db 074h, 005h
L5a051::
    db 0e9h, 08fh, 000h, 000h, 000h
L5a056::
    db 0bbh, 001h, 000h, 000h, 000h
    db 031h, 0d2h
    mov eax, dword ptr [_Datac8308]
    db 0e8h, 0c4h, 02fh, 0ffh, 0ffh
    db 089h, 045h, 0f4h
    db 0bbh, 030h, 000h, 000h, 000h
    mov edx, offset _Datac8258
    mov eax, dword ptr [_Datac8308]
    db 0e8h, 097h, 030h, 000h, 000h
    mov eax, dword ptr [_Datac827c]
    db 089h, 045h, 0fch
    mov eax, dword ptr [_Datac8280]
    db 03bh, 045h, 0e4h
    db 075h, 009h
    db 0f6h, 005h
    dd offset _Datac8285
    db 080h
    db 075h, 002h
L5a099::
    db 0ebh, 02dh
L5a09b::
    db 0c7h, 045h, 0f8h, 001h, 000h, 000h, 000h
    db 08dh, 045h, 0f0h
    db 050h
    db 08bh, 055h, 0fch
    mov bx, word ptr [_Datac82fc]
    mov eax, dword ptr [_Datac82f8]
    mov esi, dword ptr [_Datac8308]
    db 089h, 0d9h
    db 089h, 0c3h
    db 089h, 0f0h
    db 0e8h, 04ah, 031h, 000h, 000h
    db 0ebh, 012h
L5a0c8::
    db 0bbh, 001h, 000h, 000h, 000h
    db 08bh, 055h, 0fch
    mov eax, dword ptr [_Datac8308]
    call _lseek_
L5a0da::
    inc dword ptr [_Datac8310]
    jmp near ptr L5a03e
L5a0e5::
    cmp dword ptr [ebp-08h], 00h
    je short L5a132
    mov eax, dword ptr [ebp-018h]
    add eax, 06ch
    push eax
    movzx eax, word ptr [_Datac82fc]
    push eax
    push dword ptr [_Datac82f8]
    movzx eax, word ptr [_Datac8304]
    push eax
    push dword ptr [_Datac8300]
    call Func57067_
    add esp, 014h
    mov eax, dword ptr [ebp-018h]
    add eax, 06ch
    mov dword ptr [_Datac82f4], eax
    mov eax, dword ptr [ebp-0ch]
    mov dword ptr [_Datac830c], eax
    mov dword ptr [ebp-014h], 00h
    jmp short L5a139
L5a132::
    mov dword ptr [ebp-014h], 07h
L5a139::
    mov eax, dword ptr [ebp-014h]
    leave
    pop edi
    pop esi
    pop ecx
    pop ebx
    ret
Func59fc8_ endp
Func5a142_ proc near
    push ebx
    push ecx
    push edx
    push esi
    push edi
    push ebp
    db 089h, 0e5h
    db 081h, 0ech, 024h, 000h, 000h, 000h
    db 089h, 045h, 0dch
    db 0c7h, 045h, 0f8h, 000h, 000h, 000h, 000h
    db 0c7h, 045h, 0f4h, 000h, 000h, 000h, 000h
    db 0c7h, 045h, 0e8h, 000h, 000h, 000h, 000h
    db 0c7h, 045h, 0e4h, 000h, 000h, 000h, 000h
    db 083h, 07dh, 0dch, 000h
    db 075h, 00ch
    db 0c7h, 045h, 0e0h, 002h, 000h, 000h, 000h
    db 0e9h, 0f4h, 001h, 000h, 000h
L5a181::
    db 0c7h, 045h, 0f4h, 000h, 000h, 000h, 000h
    db 0c7h, 005h
    dd offset _Datac8310
    db 000h, 000h, 000h, 000h
    db 031h, 0dbh
    db 031h, 0d2h
    mov eax, dword ptr [_Datac8308]
    db 0e8h, 08bh, 02eh, 0ffh, 0ffh
    db 0bbh, 02ch, 000h, 000h, 000h
    mov edx, offset _Datac822c
    mov eax, dword ptr [_Datac8308]
    db 0e8h, 061h, 02fh, 000h, 000h
L5a1b4::
    mov eax, dword ptr [_Datac8310]
    cmp eax, dword ptr [_Datac824c]
    db 077h, 006h
    db 083h, 07dh, 0f8h, 000h
    db 074h, 005h
L5a1c7::
    db 0e9h, 0a2h, 001h, 000h, 000h
L5a1cc::
    db 0bbh, 001h, 000h, 000h, 000h
    db 031h, 0d2h
    mov eax, dword ptr [_Datac8308]
    db 0e8h, 04eh, 02eh, 0ffh, 0ffh
    db 089h, 045h, 0f0h
    db 0bbh, 030h, 000h, 000h, 000h
    mov edx, offset _Datac8258
    mov eax, dword ptr [_Datac8308]
    db 0e8h, 021h, 02fh, 000h, 000h
    mov eax, dword ptr [_Datac827c]
    db 089h, 045h, 0fch
    db 0f6h, 005h
    dd offset _Datac8285
    db 080h
    db 00fh, 084h, 048h, 001h, 000h, 000h
    db 08dh, 045h, 0ech
    db 050h
    db 08bh, 055h, 0fch
    mov bx, word ptr [_Datac82fc]
    mov eax, dword ptr [_Datac82f8]
    mov esi, dword ptr [_Datac8308]
    db 089h, 0d9h
    db 089h, 0c3h
    db 089h, 0f0h
    db 0e8h, 0e3h, 02fh, 000h, 000h
    mov eax, offset _Datac8288
    db 050h
    movzx eax, word ptr [_Datac82fc]
    push eax
    push dword ptr [_Datac82f8]
    movzx eax, word ptr [_Datac8304]
    push eax
    push dword ptr [_Datac8300]
    db 0e8h, 013h, 0ceh, 0ffh, 0ffh
    db 083h, 0c4h, 014h
    db 0f6h, 005h
    dd offset _Datac82c5
    db 001h
    db 074h, 060h
    movzx eax, word ptr [_Datac82fc]
    push eax
    push dword ptr [_Datac82f8]
    movzx eax, word ptr [_Datac8304]
    push eax
    push dword ptr [_Datac8300]
    db 0e8h, 0ceh, 0cfh, 0ffh, 0ffh
    db 083h, 0c4h, 010h
    db 0c7h, 045h, 0e8h, 000h, 000h, 000h, 000h
L5a28b::
    db 0ffh, 075h, 0e8h
    db 0e8h, 0fbh, 0cfh, 0ffh, 0ffh
    db 083h, 0c4h, 004h
    db 085h, 0c0h
    db 074h, 026h
    push dword ptr [ebp-018h]
    call Func5728e_
    add esp, 04h
    call getenv_
    mov dword ptr [ebp-01ch], eax
    push dword ptr [ebp-01ch]
    push dword ptr [ebp-018h]
    call Func572d8_
    add esp, 08h
    inc dword ptr [ebp-018h]
    jmp short L5a28b
L5a2c0::
    movzx eax, word ptr [_Datac82fc]
    push eax
    push dword ptr [_Datac82f8]
    movzx eax, word ptr [_Datac8304]
    push eax
    push dword ptr [_Datac8300]
    call Func57000_
    add esp, 010h
    mov dword ptr [ebp-0ch], eax
    cmp dword ptr [ebp-0ch], 00h
    je short L5a34f
    mov eax, dword ptr [ebp-010h]
    mov dword ptr [_Datac830c], eax
    mov eax, dword ptr [ebp-024h]
    add eax, 06ch
    push eax
    movzx eax, word ptr [_Datac82fc]
    push eax
    push dword ptr [_Datac82f8]
    movzx eax, word ptr [_Datac8304]
    push eax
    push dword ptr [_Datac8300]
    call Func57067_
    add esp, 014h
    mov eax, dword ptr [ebp-024h]
    add eax, 06ch
    mov dword ptr [_Datac82f4], eax
    mov eax, dword ptr [ebp-0ch]
    mov edx, dword ptr [ebp-024h]
    mov dword ptr [edx+05ch], eax
    mov eax, dword ptr [ebp-024h]
    mov edx, dword ptr [eax+0d0h]
    mov eax, dword ptr [ebp-024h]
    mov dword ptr [eax+0104h], edx
    mov dword ptr [ebp-020h], 00h
    jmp short L5a375
L5a34f::
    jmp short L5a363
L5a351::
    mov ebx, 01h
    mov edx, dword ptr [ebp-04h]
    mov eax, dword ptr [_Datac8308]
    call _lseek_
L5a363::
    inc dword ptr [_Datac8310]
    jmp near ptr L5a1b4
L5a36e::
    mov dword ptr [ebp-020h], 07h
L5a375::
    mov eax, dword ptr [ebp-020h]
    leave
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
Func5a142_ endp
Func5a37f_ proc near
    push ebx
    push ecx
    push edx
    push esi
    push edi
    push ebp
    db 089h, 0e5h
    db 081h, 0ech, 024h, 000h, 000h, 000h
    db 089h, 045h, 0dch
    db 0c7h, 045h, 0f8h, 000h, 000h, 000h, 000h
    db 0c7h, 045h, 0f4h, 000h, 000h, 000h, 000h
    db 0c7h, 045h, 0e8h, 000h, 000h, 000h, 000h
    db 0c7h, 045h, 0e4h, 000h, 000h, 000h, 000h
    db 083h, 07dh, 0dch, 000h
    db 075h, 00ch
    db 0c7h, 045h, 0e0h, 002h, 000h, 000h, 000h
    db 0e9h, 0c8h, 001h, 000h, 000h
L5a3be::
    db 0c7h, 045h, 0f4h, 000h, 000h, 000h, 000h
L5a3c5::
    mov eax, dword ptr [_Datac8310]
    cmp eax, dword ptr [_Datac824c]
    db 077h, 006h
    db 083h, 07dh, 0f8h, 000h
    db 074h, 005h
L5a3d8::
    db 0e9h, 0a2h, 001h, 000h, 000h
L5a3dd::
    db 0bbh, 001h, 000h, 000h, 000h
    db 031h, 0d2h
    mov eax, dword ptr [_Datac8308]
    db 0e8h, 03dh, 02ch, 0ffh, 0ffh
    db 089h, 045h, 0f0h
    db 0bbh, 030h, 000h, 000h, 000h
    mov edx, offset _Datac8258
    mov eax, dword ptr [_Datac8308]
    db 0e8h, 010h, 02dh, 000h, 000h
    mov eax, dword ptr [_Datac827c]
    db 089h, 045h, 0fch
    db 0f6h, 005h
    dd offset _Datac8285
    db 080h
    db 00fh, 084h, 048h, 001h, 000h, 000h
    db 08dh, 045h, 0ech
    db 050h
    db 08bh, 055h, 0fch
    mov bx, word ptr [_Datac82fc]
    mov eax, dword ptr [_Datac82f8]
    mov esi, dword ptr [_Datac8308]
    db 089h, 0d9h
    db 089h, 0c3h
    db 089h, 0f0h
    db 0e8h, 0d2h, 02dh, 000h, 000h
    mov eax, offset _Datac8288
    db 050h
    movzx eax, word ptr [_Datac82fc]
    push eax
    push dword ptr [_Datac82f8]
    movzx eax, word ptr [_Datac8304]
    push eax
    push dword ptr [_Datac8300]
    db 0e8h, 002h, 0cch, 0ffh, 0ffh
    db 083h, 0c4h, 014h
    db 0f6h, 005h
    dd offset _Datac82c5
    db 001h
    db 074h, 060h
    movzx eax, word ptr [_Datac82fc]
    push eax
    push dword ptr [_Datac82f8]
    movzx eax, word ptr [_Datac8304]
    push eax
    push dword ptr [_Datac8300]
    db 0e8h, 0bdh, 0cdh, 0ffh, 0ffh
    db 083h, 0c4h, 010h
    db 0c7h, 045h, 0e8h, 000h, 000h, 000h, 000h
L5a49c::
    db 0ffh, 075h, 0e8h
    db 0e8h, 0eah, 0cdh, 0ffh, 0ffh
    db 083h, 0c4h, 004h
    db 085h, 0c0h
    db 074h, 026h
    db 0ffh, 075h, 0e8h
    db 0e8h, 0dbh, 0cdh, 0ffh, 0ffh
    db 083h, 0c4h, 004h
    db 0e8h, 08ah, 0f5h, 0ffh, 0ffh
    db 089h, 045h, 0e4h
    push dword ptr [ebp-01ch]
    push dword ptr [ebp-018h]
    call Func572d8_
    add esp, 08h
    inc dword ptr [ebp-018h]
    jmp short L5a49c
L5a4d1::
    movzx eax, word ptr [_Datac82fc]
    push eax
    push dword ptr [_Datac82f8]
    movzx eax, word ptr [_Datac8304]
    push eax
    push dword ptr [_Datac8300]
    call Func57000_
    add esp, 010h
    mov dword ptr [ebp-0ch], eax
    cmp dword ptr [ebp-0ch], 00h
    je short L5a560
    mov eax, dword ptr [ebp-010h]
    mov dword ptr [_Datac830c], eax
    mov eax, dword ptr [ebp-024h]
    add eax, 06ch
    push eax
    movzx eax, word ptr [_Datac82fc]
    push eax
    push dword ptr [_Datac82f8]
    movzx eax, word ptr [_Datac8304]
    push eax
    push dword ptr [_Datac8300]
    call Func57067_
    add esp, 014h
    mov eax, dword ptr [ebp-024h]
    add eax, 06ch
    mov dword ptr [_Datac82f4], eax
    mov eax, dword ptr [ebp-0ch]
    mov edx, dword ptr [ebp-024h]
    mov dword ptr [edx+05ch], eax
    mov eax, dword ptr [ebp-024h]
    mov edx, dword ptr [eax+0d0h]
    mov eax, dword ptr [ebp-024h]
    mov dword ptr [eax+0104h], edx
    mov dword ptr [ebp-020h], 00h
    jmp short L5a586
L5a560::
    jmp short L5a574
L5a562::
    mov ebx, 01h
    mov edx, dword ptr [ebp-04h]
    mov eax, dword ptr [_Datac8308]
    call _lseek_
L5a574::
    inc dword ptr [_Datac8310]
    jmp near ptr L5a3c5
L5a57f::
    mov dword ptr [ebp-020h], 07h
L5a586::
    mov eax, dword ptr [ebp-020h]
    leave
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
Func5a37f_ endp
Func5a590_ proc near
    push ebx
    push ecx
    push edx
    push esi
    push edi
    push ebp
    db 089h, 0e5h
    db 081h, 0ech, 00ch, 000h, 000h, 000h
    db 089h, 045h, 0f4h
    db 083h, 07dh, 0f4h, 000h
    db 075h, 00ch
    db 0c7h, 045h, 0f8h, 002h, 000h, 000h, 000h
    db 0e9h, 053h, 001h, 000h, 000h
L5a5b3::
    db 031h, 0dbh
    mov edx, dword ptr [_Datac830c]
    mov eax, dword ptr [_Datac8308]
    db 0e8h, 066h, 02ah, 0ffh, 0ffh
    db 0c7h, 045h, 0fch, 000h, 000h, 000h, 000h
L5a5cc::
    db 08bh, 04dh, 0fch
    db 001h, 0c9h
    db 08bh, 045h, 0f4h
    db 066h, 08bh, 090h, 0b8h, 000h, 000h, 000h
    db 08bh, 045h, 0f4h
    db 08bh, 098h, 0b4h, 000h, 000h, 000h
    db 08eh, 0eah
    db 08dh, 004h, 00bh
    db 066h, 065h, 083h, 038h, 0ffh
    db 074h, 02fh
    db 08bh, 04dh, 0fch
    db 001h, 0c9h
    db 08bh, 045h, 0f4h
    db 066h, 08bh, 090h, 0b8h, 000h, 000h, 000h
    db 08bh, 045h, 0f4h
    db 08bh, 098h, 0b4h, 000h, 000h, 000h
    db 08eh, 0eah
    db 08dh, 004h, 00bh
    db 065h, 00fh, 0bfh, 000h
    push eax
    db 0e8h, 0ceh, 0cbh, 0ffh, 0ffh
    db 083h, 0c4h, 004h
    db 0ffh, 045h, 0fch
    db 0ebh, 0adh
L5a61f::
    movzx eax, word ptr [_Datac82fc]
    push eax
    push dword ptr [_Datac82f8]
    movzx eax, word ptr [_Datac8304]
    push eax
    push dword ptr [_Datac8300]
    db 0e8h, 0e3h, 0c9h, 0ffh, 0ffh
    db 083h, 0c4h, 010h
    db 0c7h, 045h, 0fch, 000h, 000h, 000h, 000h
L5a64a::
    db 08bh, 04dh, 0fch
    db 001h, 0c9h
    db 08bh, 045h, 0f4h
    db 066h, 08bh, 090h, 0b8h, 000h, 000h, 000h
    db 08bh, 045h, 0f4h
    db 08bh, 098h, 0b4h, 000h, 000h, 000h
    db 08eh, 0eah
    db 08dh, 004h, 00bh
    db 066h, 065h, 083h, 038h, 0ffh
    db 074h, 02fh
    db 08bh, 04dh, 0fch
    db 001h, 0c9h
    db 08bh, 045h, 0f4h
    mov dx, word ptr [eax+0b8h]
    mov eax, dword ptr [ebp-0ch]
    mov ebx, dword ptr [eax+0b4h]
    mov gs, edx
    lea eax, [ebx+ecx*1]
    movsx eax, word ptr gs:[eax]
    push eax
    call Func5721a_
    add esp, 04h
    inc dword ptr [ebp-04h]
    jmp short L5a64a
L5a69d::
    mov edx, dword ptr [_Datac85a4]
    mov eax, dword ptr [ebp-0ch]
    mov dword ptr [eax+05ch], edx
    mov edx, dword ptr [_Datac85a8]
    mov eax, dword ptr [ebp-0ch]
    mov dword ptr [eax+064h], edx
    mov edx, dword ptr [_Datac85ac]
    mov eax, dword ptr [ebp-0ch]
    mov dword ptr [eax+060h], edx
    mov edx, dword ptr [_Datac85b0]
    mov eax, dword ptr [ebp-0ch]
    mov dword ptr [eax+068h], edx
    mov eax, dword ptr [ebp-0ch]
    test byte ptr [eax+0a8h], 01h
    jne short L5a6ff
    cmp dword ptr [_Datac85ac], 01h
    jbe short L5a6eb
    cmp dword ptr [_Datac85ac], 010h
    jb short L5a6ed
L5a6eb::
    jmp short L5a6f6
L5a6ed::
    mov dword ptr [ebp-08h], 00h
    jmp short L5a706
L5a6f6::
    mov dword ptr [ebp-08h], 011h
    jmp short L5a706
L5a6ff::
    mov dword ptr [ebp-08h], 00h
L5a706::
    mov eax, dword ptr [ebp-08h]
    leave
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
Func5a590_ endp
Func5a710_ proc near
    push ebx
    push ecx
    push edx
    push esi
    push edi
    push ebp
    db 089h, 0e5h
    db 081h, 0ech, 020h, 000h, 000h, 000h
    db 089h, 045h, 0e0h
    db 083h, 07dh, 0e0h, 000h
    db 075h, 00ch
    db 0c7h, 045h, 0e4h, 002h, 000h, 000h, 000h
    db 0e9h, 08eh, 000h, 000h, 000h
L5a733::
    db 08bh, 045h, 0e0h
    db 08bh, 040h, 05ch
    db 089h, 045h, 0fch
    db 08bh, 045h, 0e0h
    db 08bh, 040h, 064h
    db 089h, 045h, 0f4h
    db 08bh, 045h, 0e0h
    db 08bh, 040h, 060h
    db 089h, 045h, 0f8h
    db 08bh, 045h, 0e0h
    db 0f6h, 080h, 0a8h, 000h, 000h, 000h, 001h
    db 075h, 015h
    db 083h, 07dh, 0f8h, 002h
    db 072h, 006h
    db 083h, 07dh, 0f8h, 00fh
    db 076h, 009h
L5a766::
    db 0c7h, 045h, 0e4h, 011h, 000h, 000h, 000h
    db 0ebh, 052h
L5a76f::
    db 08bh, 045h, 0e0h
    db 0ffh, 070h, 064h
    db 0e8h, 06bh, 0cah, 0ffh, 0ffh
    db 083h, 0c4h, 004h
    movzx eax, word ptr [_Datac82fc]
    push eax
    push dword ptr [_Datac82f8]
    db 0ffh, 075h, 0f4h
    db 0ffh, 075h, 0f8h
    db 0ffh, 075h, 0fch
    movzx eax, word ptr [_Datac8304]
    push eax
    push dword ptr [_Datac8300]
    db 0e8h, 016h, 0c9h, 0ffh, 0ffh
    db 083h, 0c4h, 01ch
    db 089h, 045h, 0e8h
    db 08bh, 045h, 0e0h
    db 0ffh, 070h, 064h
    db 0e8h, 062h, 0cah, 0ffh, 0ffh
    db 083h, 0c4h, 004h
    db 08bh, 045h, 0e8h
    db 089h, 045h, 0e4h
L5a7c1::
    db 08bh, 045h, 0e4h
    db 0c9h
    db 05fh
    db 05eh
    db 05ah
    db 059h
    db 05bh
    db 0c3h
Func5a710_ endp
Func5a7cb_ proc near
    db 053h
    db 051h
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
Func5a7cb_ endp
Func5a7e0_ proc near
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
Func5a7e0_ endp
Func5a7f5_ proc near
    db 053h
    db 051h
    db 052h
    db 056h
    db 057h
    db 055h
    db 089h, 0e5h
    db 081h, 0ech, 008h, 000h, 000h, 000h
    db 089h, 045h, 0f8h
    mov eax, dword ptr [ebp-08h]
    db 0c1h, 0e0h, 002h
    db 08bh, 080h
    dd offset _Datac831c
    db 089h, 045h, 0fch
    db 08bh, 045h, 0fch
    db 0c9h
    db 05fh
    db 05eh
    db 05ah
    db 059h
    db 05bh
    db 0c3h
Func5a7f5_ endp
Func5a81f_ proc near
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
Func5a81f_ endp
_TEXT ends

CONST segment
Dc14a0 label byte
    db "hmidet.386"
    db 000h, 000h
CONST ends

    end

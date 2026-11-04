    .586p

_TEXT segment para public use32 'CODE'
_TEXT ends

    assume cs:FLAT, ds:FLAT, es:FLAT, ss:FLAT

    extrn _nfree_:near
    extrn _nmalloc_:near

    public Func586d0_
    public Func58714_
    public Func58720_
    public Func58748_

_TEXT segment
Func586d0_ proc near
    push ebx
    push ecx
    push edx
    mov eax, 08h
    call _nmalloc_
    db 089h, 0c2h
    db 089h, 0c1h
    test eax, eax
    je short L5870d
    mov eax, 058h
    call _nmalloc_
    mov dword ptr [edx], eax
    test eax, eax
    jne short L5870b
    db 089h, 0d3h
    je short L58704
    call _nfree_
    mov dword ptr [edx], 00h
L58704::
    db 089h, 0d8h
    call _nfree_
L5870b::
    db 089h, 0c8h
L5870d::
    pop edx
    pop ecx
    pop ebx
    ret
Func586d0_ endp
    db 08dh, 040h, 000h
Func58714_ proc near
    mov eax, 03ch
    jmp near ptr _nmalloc_
Func58714_ endp
    db 08bh, 0c0h
Func58720_ proc near
    push ebx
    push edx
    db 089h, 0c2h
    test eax, eax
    je short L58742
    mov ebx, dword ptr [eax]
    test ebx, ebx
    je short L5873b
    db 089h, 0d8h
    call _nfree_
    mov dword ptr [edx], 00h
L5873b::
    db 089h, 0d0h
    call _nfree_
L58742::
    pop edx
    pop ebx
    ret
Func58720_ endp
    db 08dh, 040h, 000h
Func58748_ proc near
    push ecx
    push esi
    push edi
    db 089h, 0d9h
    db 089h, 0d6h
    db 089h, 0c7h
    push edi
    db 089h, 0c8h
    shr ecx, 02h
    db 0f2h, 0a5h
    mov cl, al
    and cl, 03h
    db 0f2h, 0a4h
    pop edi
    pop edi
    pop esi
    pop ecx
    ret
Func58748_ endp
_TEXT ends

    end

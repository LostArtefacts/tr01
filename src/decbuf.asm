    .586p

_TEXT segment para public use32 'CODE'
_TEXT ends

    assume cs:FLAT, ds:FLAT, es:FLAT, ss:FLAT

    extrn Func57c10_:near
    extrn _nfree_:near
    extrn calloc_:near

    public Func58600_
    public Func58658_
    public Func58674_
    public Func5867c_
    public Func58690_
    public Func58698_
    public Func5869c_
    public Func586a4_
    public Func586a8_
    public Func586ac_
    public Func586b0_

_TEXT segment
Func58600_ proc near
    push ebx
    push ecx
    push esi
    db 089h, 0c1h
    db 089h, 0d3h
    mov edx, 020h
    mov eax, 01h
    call calloc_
    db 089h, 0c6h
    test eax, eax
    je short L58654
    mov dword ptr [eax+010h], ecx
    lea ecx, [eax+01ch]
    mov dword ptr [eax+014h], ebx
    lea ebx, [eax+018h]
    mov edx, dword ptr [eax+014h]
    mov eax, dword ptr [eax+010h]
    call Func57c10_
    db 089h, 0c2h
    mov eax, 01h
    call calloc_
    mov dword ptr [esi], eax
    test eax, eax
    jne short L58652
    db 089h, 0f0h
    call _nfree_
    db 031h, 0c0h
    pop esi
    pop ecx
    pop ebx
    ret
L58652::
    db 089h, 0f0h
L58654::
    pop esi
    pop ecx
    pop ebx
    ret
Func58600_ endp
Func58658_ proc near
    push edx
    db 089h, 0c2h
    test eax, eax
    je short L5866f
    je short L58663
    mov eax, dword ptr [eax]
L58663::
    call _nfree_
    db 089h, 0d0h
    call _nfree_
L5866f::
    pop edx
    ret
Func58658_ endp
    db 08dh, 040h, 000h
Func58674_ proc near
    test eax, eax
    jne short L58679
    ret
L58679::
    mov eax, dword ptr [eax]
    ret
Func58674_ endp
Func5867c_ proc near
    push edx
    test eax, eax
    je short L5868c
    mov edx, dword ptr [eax+018h]
    call Func586ac_
    imul eax, edx
L5868c::
    pop edx
    ret
Func5867c_ endp
    db 08bh, 0c0h
Func58690_ proc near
    test eax, eax
    je short L58697
    mov dword ptr [eax+08h], edx
L58697::
    ret
Func58690_ endp
Func58698_ proc near
    mov eax, dword ptr [eax+08h]
    ret
Func58698_ endp
Func5869c_ proc near
    test eax, eax
    je short L586a3
    mov dword ptr [eax+0ch], edx
L586a3::
    ret
Func5869c_ endp
Func586a4_ proc near
    mov eax, dword ptr [eax+0ch]
    ret
Func586a4_ endp
Func586a8_ proc near
    mov eax, dword ptr [eax+018h]
    ret
Func586a8_ endp
Func586ac_ proc near
    mov eax, dword ptr [eax+01ch]
    ret
Func586ac_ endp
Func586b0_ proc near
    push ebx
    push ecx
    push edx
    lea ecx, [eax+01ch]
    lea ebx, [eax+018h]
    mov edx, dword ptr [eax+014h]
    mov eax, dword ptr [eax+010h]
    call Func57c10_
    pop edx
    pop ecx
    pop ebx
    ret
Func586b0_ endp
_TEXT ends

    end

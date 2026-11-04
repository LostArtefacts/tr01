    .586p

_TEXT segment para public use32 'CODE'
_TEXT ends

    assume cs:FLAT, ds:FLAT, es:FLAT, ss:FLAT

    extrn Func80bcd_:near
    extrn Func8537e_:near
    extrn Func853b7_:near
    extrn Func879bd_:near
    extrn Func8c16e_:near
    extrn Func8c1a7_:near

    public Func58550_
    public Func58560_
    public Func58570_
    public Func58580_
    public Func58590_
    public Func585c4_

_TEXT segment
Func58550_ proc near
    push ecx
    push ebx
    push edx
    push eax
    call Func80bcd_
    add esp, 010h
    ret
Func58550_ endp
    db 08dh, 040h, 000h
Func58560_ proc near
    push ecx
    push ebx
    push edx
    push eax
    call Func879bd_
    add esp, 010h
    ret
Func58560_ endp
    db 08dh, 040h, 000h
Func58570_ proc near
    push ecx
    push edx
    push eax
    call Func8537e_
    add esp, 08h
    pop ecx
    ret
Func58570_ endp
    db 08dh, 040h, 000h
Func58580_ proc near
    push ecx
    push edx
    push eax
    call Func8c16e_
    add esp, 08h
    pop ecx
    ret
Func58580_ endp
    db 08dh, 040h, 000h
Func58590_ proc near
    push esi
    push edi
    push ebp
    mov esi, dword ptr [esp+024h]
    push esi
    mov edi, dword ptr [esp+024h]
    push edi
    mov ebp, dword ptr [esp+024h]
    push ebp
    mov esi, dword ptr [esp+024h]
    push esi
    mov edi, dword ptr [esp+024h]
    push edi
    mov ebp, dword ptr [esp+024h]
    push ebp
    push ecx
    push ebx
    push edx
    push eax
    call Func853b7_
    add esp, 028h
    pop ebp
    pop edi
    pop esi
    ret 018h
Func58590_ endp
    db 090h
Func585c4_ proc near
    push esi
    push edi
    push ebp
    mov esi, dword ptr [esp+024h]
    push esi
    mov edi, dword ptr [esp+024h]
    push edi
    mov ebp, dword ptr [esp+024h]
    push ebp
    mov esi, dword ptr [esp+024h]
    push esi
    mov edi, dword ptr [esp+024h]
    push edi
    mov ebp, dword ptr [esp+024h]
    push ebp
    push ecx
    push ebx
    push edx
    push eax
    call Func8c1a7_
    add esp, 028h
    pop ebp
    pop edi
    pop esi
    ret 018h
Func585c4_ endp
_TEXT ends

    end

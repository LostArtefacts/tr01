    .586p

_TEXT segment para public use32 'CODE'
_TEXT ends
_DATA segment dword public use32 'DATA'
_DATA ends

    assume cs:FLAT, ds:FLAT, es:FLAT, ss:FLAT

    extrn _nfree_:near
    extrn _nmalloc_:near

    public Func58a50_
    public Func58aa0_
    public _Datac89e0

_TEXT segment
Func58a50_ proc near
    push ebx
    push edx
    db 089h, 0c3h
    mov eax, 016ch
    call _nmalloc_
    db 089h, 0c2h
    test eax, eax
    je short L58a9c
    mov eax, 04h
    call _nmalloc_
    mov dword ptr [edx+04h], eax
    test eax, eax
    jne short L58a81
    db 089h, 0d0h
    call _nfree_
    db 031h, 0c0h
    pop edx
    pop ebx
    ret
L58a81::
    db 089h, 0d8h
    call _nmalloc_
    mov dword ptr [edx], eax
    test eax, eax
    jne short L58a9a
    db 089h, 0d0h
    call Func58aa0_
    db 031h, 0c0h
    pop edx
    pop ebx
    ret
L58a9a::
    db 089h, 0d0h
L58a9c::
    pop edx
    pop ebx
    ret
Func58a50_ endp
    db 090h
Func58aa0_ proc near
    push ebx
    push ecx
    push edx
    db 089h, 0c2h
    test eax, eax
    je short L58ad8
    mov ebx, dword ptr [eax]
    test ebx, ebx
    je short L58abc
    db 089h, 0d8h
    call _nfree_
    mov dword ptr [edx], 00h
L58abc::
    mov ecx, dword ptr [edx+04h]
    test ecx, ecx
    je short L58ad1
    db 089h, 0c8h
    call _nfree_
    mov dword ptr [edx+04h], 00h
L58ad1::
    db 089h, 0d0h
    call _nfree_
L58ad8::
    pop edx
    pop ecx
    pop ebx
    ret
Func58aa0_ endp
_TEXT ends

_DATA segment
_Datac89e0 label byte
    db "$Id: VIDEO_A.ASM 1.4 1995/08/14 10:01:03 MFC Exp $"
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
_DATA ends

    end

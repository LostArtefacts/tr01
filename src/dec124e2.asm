    .586p

_TEXT segment para public use32 'CODE'
_TEXT ends
_DATA segment dword public use32 'DATA'
_DATA ends

    assume cs:FLAT, ds:FLAT, es:FLAT, ss:FLAT

    public Func779a0_
    public Func78656_
    public Func78e07_
    public Func795b2_
    public Func7ae74_
    public Func7c2ac_
    public Func7c9ce_
    public Func7df02_
    public Func7df3b_
    public Func7e06c_
    public _Data7f148
    public _Dataca740

_TEXT segment
Func779a0_ proc near
    add eax, eax
    shr ax, 1
    mov dx, ax
    ror eax, 010h
    mov ecx, eax
    mov esi, eax
    mov ebp, eax
    mov ebx, eax
    mov cx, dx
    mov bx, dx
    mov si, dx
    mov bp, dx
    ret
L779c0::
    add eax, eax
    shr ax, 1
    mov ecx, eax
    and ecx, 01f001fh
    add eax, eax
    and eax, 0ffe0ffe0h
    or eax, ecx
    mov dx, ax
    ror eax, 010h
    mov ecx, eax
    mov esi, eax
    mov ebp, eax
    mov ebx, eax
    mov cx, dx
    mov bx, dx
    mov si, dx
    mov bp, dx
    ret
L779f1::
    add cl, 0fh
    jb near ptr L7f098
L779fa::
    mov eax, dword ptr [esi]
    shrd eax, edx, cl
    add cl, 0fh
    jb near ptr L7f0a8
L77a08::
    and eax, 07fffh
    mov word ptr [edi], ax
    mov word ptr [edi+02h], ax
    add edi, 08h
    mov word ptr [edi-04h], ax
    mov word ptr [edi-02h], ax
    ret
L77a20::
    add cl, 0fh
    jb near ptr L7f0b8
L77a29::
    mov eax, dword ptr [esi]
    shrd eax, edx, cl
    add cl, 0fh
    jb near ptr L7f0c8
L77a37::
    and eax, 07fffh
    bswap ecx
    mov cl, al
    add ax, ax
    and al, 0c0h
    and cl, 01fh
    or al, cl
    bswap ecx
    mov word ptr [edi], ax
    mov word ptr [edi+02h], ax
    add edi, 08h
    mov word ptr [edi-04h], ax
    mov word ptr [edi-02h], ax
    ret
L77a5f::
    add eax, eax
    shr ax, 1
    mov ebx, eax
    mov dx, ax
    ror eax, 010h
    mov bx, ax
    mov ecx, eax
    mov esi, eax
    mov ebp, eax
    mov cx, dx
    mov si, dx
    mov bp, dx
    ret
L77a7f::
    add eax, eax
    shr ax, 1
    mov ecx, eax
    and ecx, 01f001fh
    add eax, eax
    and eax, 0ffe0ffe0h
    or eax, ecx
    mov ebx, eax
    mov dx, ax
    ror eax, 010h
    mov bx, ax
    mov ecx, eax
    mov esi, eax
    mov ebp, eax
    mov cx, dx
    mov si, dx
    mov bp, dx
    ret
L77ab0::
    mov eax, dword ptr [esi]
    shrd eax, edx, cl
    add cl, 01eh
    jae short L77ac3
    add esi, 04h
    or cl, 0e0h
    mov edx, dword ptr [esi+04h]
L77ac3::
    and eax, 03fffffffh
    add eax, eax
    shr ax, 1
    mov word ptr [edi+04h], ax
    mov word ptr [edi+06h], ax
    rol eax, 010h
    mov dword ptr [edi], eax
    add edi, 08h
    ret
L77ade::
    mov eax, dword ptr [esi]
    shrd eax, edx, cl
    add cl, 01eh
    jae short L77af1
    add esi, 04h
    or cl, 0e0h
    mov edx, dword ptr [esi+04h]
L77af1::
    and eax, 03fffffffh
    add eax, eax
    shr ax, 1
    mov ebx, eax
    and ebx, 01f001fh
    add eax, eax
    and eax, 0ffe0ffe0h
    or eax, ebx
    mov word ptr [edi+04h], ax
    mov word ptr [edi+06h], ax
    rol eax, 010h
    mov dword ptr [edi], eax
    add edi, 08h
    ret
L77b1d::
    add eax, eax
    shr ax, 1
    mov ecx, eax
    mov dx, ax
    ror eax, 010h
    mov cx, ax
    mov ebx, eax
    mov esi, eax
    mov ebp, eax
    mov bx, dx
    mov si, dx
    mov bp, dx
    ret
L77b3d::
    add eax, eax
    shr ax, 1
    mov ecx, eax
    and ecx, 01f001fh
    add eax, eax
    and eax, 0ffe0ffe0h
    or eax, ecx
    mov ecx, eax
    mov dx, ax
    ror eax, 010h
    mov cx, ax
    mov ebx, eax
    mov esi, eax
    mov ebp, eax
    mov bx, dx
    mov si, dx
    mov bp, dx
    ret
L77b6e::
    mov eax, dword ptr [esi]
    shrd eax, edx, cl
    add cl, 01eh
    jae short L77b81
    add esi, 04h
    or cl, 0e0h
    mov edx, dword ptr [esi+04h]
L77b81::
    and eax, 03fffffffh
    add eax, eax
    shr ax, 1
    mov dword ptr [edi], eax
    add edi, 08h
    mov word ptr [edi-04h], ax
    mov word ptr [edi-02h], ax
    ret
L77b99::
    mov eax, dword ptr [esi]
    shrd eax, edx, cl
    add cl, 01eh
    jae short L77bac
    add esi, 04h
    or cl, 0e0h
    mov edx, dword ptr [esi+04h]
L77bac::
    and eax, 03fffffffh
    add eax, eax
    shr ax, 1
    mov ebx, eax
    and ebx, 01f001fh
    add eax, eax
    and eax, 0ffe0ffe0h
    or eax, ebx
    mov dword ptr [edi], eax
    mov word ptr [edi+04h], ax
    add edi, 08h
    mov word ptr [edi-02h], ax
    ret
L77bd5::
    add eax, eax
    shr ax, 1
    mov ebx, eax
    mov ecx, eax
    mov dx, ax
    ror eax, 010h
    mov bx, ax
    mov cx, ax
    mov ebp, eax
    mov esi, eax
    mov bp, dx
    mov si, dx
    ret
L77bf5::
    add eax, eax
    shr ax, 1
    mov ecx, eax
    and ecx, 01f001fh
    add eax, eax
    and eax, 0ffe0ffe0h
    or eax, ecx
    mov ebx, eax
    mov ecx, eax
    mov dx, ax
    ror eax, 010h
    mov bx, ax
    mov cx, ax
    mov ebp, eax
    mov esi, eax
    mov bp, dx
    mov si, dx
    ret
L77c26::
    mov eax, dword ptr [esi]
    shrd eax, edx, cl
    add cl, 01eh
    jae short L77c39
    add esi, 04h
    or cl, 0e0h
    mov edx, dword ptr [esi+04h]
L77c39::
    and eax, 03fffffffh
    add eax, eax
    shr ax, 1
    mov word ptr [edi+04h], ax
    mov word ptr [edi+06h], ax
    rol eax, 010h
    mov word ptr [edi], ax
    add edi, 08h
    mov word ptr [edi-06h], ax
    ret
L77c59::
    mov eax, dword ptr [esi]
    shrd eax, edx, cl
    add cl, 01eh
    jae short L77c6c
    add esi, 04h
    or cl, 0e0h
    mov edx, dword ptr [esi+04h]
L77c6c::
    and eax, 03fffffffh
    add eax, eax
    shr ax, 1
    mov ebx, eax
    and ebx, 01f001fh
    add eax, eax
    and eax, 0ffe0ffe0h
    or eax, ebx
    mov word ptr [edi+04h], ax
    mov word ptr [edi+06h], ax
    rol eax, 010h
    mov word ptr [edi], ax
    add edi, 08h
    mov word ptr [edi-06h], ax
    ret
L77c9d::
    add eax, eax
    shr ax, 1
    mov esi, eax
    mov dx, ax
    ror eax, 010h
    mov si, ax
    mov ebx, eax
    mov ecx, eax
    mov ebp, eax
    mov bx, dx
    mov cx, dx
    mov bp, dx
    ret
L77cbd::
    add eax, eax
    shr ax, 1
    mov ecx, eax
    and ecx, 01f001fh
    add eax, eax
    and eax, 0ffe0ffe0h
    or eax, ecx
    mov esi, eax
    mov dx, ax
    ror eax, 010h
    mov si, ax
    mov ebx, eax
    mov ecx, eax
    mov ebp, eax
    mov bx, dx
    mov cx, dx
    mov bp, dx
    ret
L77cee::
    mov eax, dword ptr [esi]
    shrd eax, edx, cl
    add cl, 01eh
    jae short L77d01
    add esi, 04h
    or cl, 0e0h
    mov edx, dword ptr [esi+04h]
L77d01::
    and eax, 03fffffffh
    add eax, eax
    shr ax, 1
    mov word ptr [edi], ax
    mov word ptr [edi+02h], ax
    rol eax, 010h
    add edi, 08h
    mov dword ptr [edi-04h], eax
    ret
L77d1c::
    mov eax, dword ptr [esi]
    shrd eax, edx, cl
    add cl, 01eh
    jae short L77d2f
    add esi, 04h
    or cl, 0e0h
    mov edx, dword ptr [esi+04h]
L77d2f::
    and eax, 03fffffffh
    add eax, eax
    shr ax, 1
    mov ebx, eax
    and ebx, 01f001fh
    add eax, eax
    and eax, 0ffe0ffe0h
    or eax, ebx
    mov word ptr [edi], ax
    mov word ptr [edi+02h], ax
    rol eax, 010h
    add edi, 08h
    mov dword ptr [edi-04h], eax
    ret
L77d5b::
    add eax, eax
    shr ax, 1
    mov ebx, eax
    mov esi, eax
    mov dx, ax
    ror eax, 010h
    mov bx, ax
    mov si, ax
    mov ebp, eax
    mov ecx, eax
    mov bp, dx
    mov cx, dx
    ret
L77d7b::
    add eax, eax
    shr ax, 1
    mov ecx, eax
    and ecx, 01f001fh
    add eax, eax
    and eax, 0ffe0ffe0h
    or eax, ecx
    mov ebx, eax
    mov esi, eax
    mov dx, ax
    ror eax, 010h
    mov bx, ax
    mov si, ax
    mov ebp, eax
    mov ecx, eax
    mov bp, dx
    mov cx, dx
    ret
L77dac::
    mov eax, dword ptr [esi]
    shrd eax, edx, cl
    add cl, 01eh
    jae short L77dbf
    add esi, 04h
    or cl, 0e0h
    mov edx, dword ptr [esi+04h]
L77dbf::
    and eax, 03fffffffh
    add eax, eax
    shr ax, 1
    rol eax, 010h
    mov dword ptr [edi], eax
    add edi, 08h
    mov dword ptr [edi-04h], eax
    ret
L77dd5::
    mov eax, dword ptr [esi]
    shrd eax, edx, cl
    add cl, 01eh
    jae short L77de8
    add esi, 04h
    or cl, 0e0h
    mov edx, dword ptr [esi+04h]
L77de8::
    and eax, 03fffffffh
    add eax, eax
    shr ax, 1
    mov ebx, eax
    and ebx, 01f001fh
    add eax, eax
    and eax, 0ffe0ffe0h
    or eax, ebx
    rol eax, 010h
    mov dword ptr [edi], eax
    add edi, 08h
    mov dword ptr [edi-04h], eax
    ret
L77e0f::
    add eax, eax
    shr ax, 1
    mov esi, eax
    mov ecx, eax
    mov dx, ax
    ror eax, 010h
    mov si, ax
    mov cx, ax
    mov ebp, eax
    mov ebx, eax
    mov bp, dx
    mov bx, dx
    ret
L77e2f::
    add eax, eax
    shr ax, 1
    mov ecx, eax
    and ecx, 01f001fh
    add eax, eax
    and eax, 0ffe0ffe0h
    or eax, ecx
    mov esi, eax
    mov ecx, eax
    mov dx, ax
    ror eax, 010h
    mov si, ax
    mov cx, ax
    mov ebp, eax
    mov ebx, eax
    mov bp, dx
    mov bx, dx
    ret
L77e60::
    mov eax, dword ptr [esi]
    shrd eax, edx, cl
    add cl, 01eh
    jae short L77e73
    add esi, 04h
    or cl, 0e0h
    mov edx, dword ptr [esi+04h]
L77e73::
    and eax, 03fffffffh
    add eax, eax
    shr ax, 1
    mov dword ptr [edi], eax
    rol eax, 010h
    add edi, 08h
    mov dword ptr [edi-04h], eax
    ret
L77e89::
    mov eax, dword ptr [esi]
    shrd eax, edx, cl
    add cl, 01eh
    jae short L77e9c
    add esi, 04h
    or cl, 0e0h
    mov edx, dword ptr [esi+04h]
L77e9c::
    and eax, 03fffffffh
    add eax, eax
    shr ax, 1
    mov ebx, eax
    and ebx, 01f001fh
    add eax, eax
    and eax, 0ffe0ffe0h
    or eax, ebx
    mov dword ptr [edi], eax
    rol eax, 010h
    add edi, 08h
    mov dword ptr [edi-04h], eax
    ret
L77ec3::
    add eax, eax
    shr ax, 1
    mov esi, eax
    mov ecx, eax
    mov ebx, eax
    mov dx, ax
    ror eax, 010h
    mov si, ax
    mov cx, ax
    mov bx, ax
    mov ebp, eax
    mov bp, dx
    ret
L77ee3::
    add eax, eax
    shr ax, 1
    mov ecx, eax
    and ecx, 01f001fh
    add eax, eax
    and eax, 0ffe0ffe0h
    or eax, ecx
    mov esi, eax
    mov ecx, eax
    mov ebx, eax
    mov dx, ax
    ror eax, 010h
    mov si, ax
    mov cx, ax
    mov bx, ax
    mov ebp, eax
    mov bp, dx
    ret
L77f14::
    mov eax, dword ptr [esi]
    shrd eax, edx, cl
    add cl, 01eh
    jae short L77f27
    add esi, 04h
    or cl, 0e0h
    mov edx, dword ptr [esi+04h]
L77f27::
    and eax, 03fffffffh
    add eax, eax
    shr ax, 1
    rol eax, 010h
    mov dword ptr [edi+04h], eax
    mov word ptr [edi], ax
    add edi, 08h
    mov word ptr [edi-06h], ax
    ret
L77f42::
    mov eax, dword ptr [esi]
    shrd eax, edx, cl
    add cl, 01eh
    jae short L77f55
    add esi, 04h
    or cl, 0e0h
    mov edx, dword ptr [esi+04h]
L77f55::
    and eax, 03fffffffh
    add eax, eax
    shr ax, 1
    mov ebx, eax
    and ebx, 01f001fh
    add eax, eax
    and eax, 0ffe0ffe0h
    or eax, ebx
    rol eax, 010h
    mov dword ptr [edi+04h], eax
    mov word ptr [edi], ax
    add edi, 08h
    mov word ptr [edi-06h], ax
    ret
L77f81::
    add eax, eax
    shr ax, 1
    mov ebp, eax
    mov dx, ax
    ror eax, 010h
    mov bp, ax
    mov ebx, eax
    mov ecx, eax
    mov esi, eax
    mov bx, dx
    mov cx, dx
    mov si, dx
    ret
L77fa1::
    add eax, eax
    shr ax, 1
    mov ecx, eax
    and ecx, 01f001fh
    add eax, eax
    and eax, 0ffe0ffe0h
    or eax, ecx
    mov ebp, eax
    mov dx, ax
    ror eax, 010h
    mov bp, ax
    mov ebx, eax
    mov ecx, eax
    mov esi, eax
    mov bx, dx
    mov cx, dx
    mov si, dx
    ret
L77fd2::
    mov eax, dword ptr [esi]
    shrd eax, edx, cl
    add cl, 01eh
    jae short L77fe5
    add esi, 04h
    or cl, 0e0h
    mov edx, dword ptr [esi+04h]
L77fe5::
    and eax, 03fffffffh
    add eax, eax
    shr ax, 1
    mov dword ptr [edi+04h], eax
    mov word ptr [edi], ax
    add edi, 08h
    mov word ptr [edi-06h], ax
    ret
L77ffd::
    mov eax, dword ptr [esi]
    shrd eax, edx, cl
    add cl, 01eh
    jae short L78010
    add esi, 04h
    or cl, 0e0h
    mov edx, dword ptr [esi+04h]
L78010::
    and eax, 03fffffffh
    add eax, eax
    shr ax, 1
    mov ebx, eax
    and ebx, 01f001fh
    add eax, eax
    and eax, 0ffe0ffe0h
    or eax, ebx
    mov dword ptr [edi+04h], eax
    mov word ptr [edi], ax
    add edi, 08h
    mov word ptr [edi-06h], ax
    ret
L78039::
    add eax, eax
    shr ax, 1
    mov ebp, eax
    mov ebx, eax
    mov dx, ax
    ror eax, 010h
    mov bp, ax
    mov bx, ax
    mov ecx, eax
    mov esi, eax
    mov cx, dx
    mov si, dx
    ret
L78059::
    add eax, eax
    shr ax, 1
    mov ecx, eax
    and ecx, 01f001fh
    add eax, eax
    and eax, 0ffe0ffe0h
    or eax, ecx
    mov ebp, eax
    mov ebx, eax
    mov dx, ax
    ror eax, 010h
    mov bp, ax
    mov bx, ax
    mov ecx, eax
    mov esi, eax
    mov cx, dx
    mov si, dx
    ret
L7808a::
    mov eax, dword ptr [esi]
    shrd eax, edx, cl
    add cl, 01eh
    jae short L7809d
    add esi, 04h
    or cl, 0e0h
    mov edx, dword ptr [esi+04h]
L7809d::
    and eax, 03fffffffh
    add eax, eax
    shr ax, 1
    mov dword ptr [edi+04h], eax
    rol eax, 010h
    mov dword ptr [edi], eax
    add edi, 08h
    ret
L780b3::
    mov eax, dword ptr [esi]
    shrd eax, edx, cl
    add cl, 01eh
    jae short L780c6
    add esi, 04h
    or cl, 0e0h
    mov edx, dword ptr [esi+04h]
L780c6::
    and eax, 03fffffffh
    add eax, eax
    shr ax, 1
    mov ebx, eax
    and ebx, 01f001fh
    add eax, eax
    and eax, 0ffe0ffe0h
    or eax, ebx
    mov dword ptr [edi+04h], eax
    rol eax, 010h
    mov dword ptr [edi], eax
    add edi, 08h
    ret
L780ed::
    add eax, eax
    shr ax, 1
    mov ecx, eax
    mov ebp, eax
    mov dx, ax
    ror eax, 010h
    mov cx, ax
    mov bp, ax
    mov esi, eax
    mov ebx, eax
    mov si, dx
    mov bx, dx
    ret
L7810d::
    add eax, eax
    shr ax, 1
    mov ecx, eax
    and ecx, 01f001fh
    add eax, eax
    and eax, 0ffe0ffe0h
    or eax, ecx
    mov ecx, eax
    mov ebp, eax
    mov dx, ax
    ror eax, 010h
    mov cx, ax
    mov bp, ax
    mov esi, eax
    mov ebx, eax
    mov si, dx
    mov bx, dx
    ret
L7813e::
    mov eax, dword ptr [esi]
    shrd eax, edx, cl
    add cl, 01eh
    jae short L78151
    add esi, 04h
    or cl, 0e0h
    mov edx, dword ptr [esi+04h]
L78151::
    and eax, 03fffffffh
    add eax, eax
    shr ax, 1
    mov dword ptr [edi], eax
    add edi, 08h
    mov dword ptr [edi-04h], eax
    ret
L78164::
    mov eax, dword ptr [esi]
    shrd eax, edx, cl
    add cl, 01eh
    jae short L78177
    add esi, 04h
    or cl, 0e0h
    mov edx, dword ptr [esi+04h]
L78177::
    and eax, 03fffffffh
    add eax, eax
    shr ax, 1
    mov ebx, eax
    and ebx, 01f001fh
    add eax, eax
    and eax, 0ffe0ffe0h
    or eax, ebx
    mov dword ptr [edi], eax
    add edi, 08h
    mov dword ptr [edi-04h], eax
    ret
L7819b::
    add eax, eax
    shr ax, 1
    mov ebp, eax
    mov ecx, eax
    mov ebx, eax
    mov dx, ax
    ror eax, 010h
    mov bp, ax
    mov cx, ax
    mov bx, ax
    mov esi, eax
    mov si, dx
    ret
L781bb::
    add eax, eax
    shr ax, 1
    mov ecx, eax
    and ecx, 01f001fh
    add eax, eax
    and eax, 0ffe0ffe0h
    or eax, ecx
    mov ebp, eax
    mov ecx, eax
    mov ebx, eax
    mov dx, ax
    ror eax, 010h
    mov bp, ax
    mov cx, ax
    mov bx, ax
    mov esi, eax
    mov si, dx
    ret
L781ec::
    mov eax, dword ptr [esi]
    shrd eax, edx, cl
    add cl, 01eh
    jae short L781ff
    add esi, 04h
    or cl, 0e0h
    mov edx, dword ptr [esi+04h]
L781ff::
    and eax, 03fffffffh
    add eax, eax
    shr ax, 1
    mov dword ptr [edi+04h], eax
    rol eax, 010h
    mov word ptr [edi+02h], ax
    mov word ptr [edi], ax
    add edi, 08h
    ret
L7821a::
    mov eax, dword ptr [esi]
    shrd eax, edx, cl
    add cl, 01eh
    jae short L7822d
    add esi, 04h
    or cl, 0e0h
    mov edx, dword ptr [esi+04h]
L7822d::
    and eax, 03fffffffh
    add eax, eax
    shr ax, 1
    mov ebx, eax
    and ebx, 01f001fh
    add eax, eax
    and eax, 0ffe0ffe0h
    or eax, ebx
    mov dword ptr [edi+04h], eax
    rol eax, 010h
    mov word ptr [edi+02h], ax
    mov word ptr [edi], ax
    add edi, 08h
    ret
L78259::
    add eax, eax
    shr ax, 1
    mov ebp, eax
    mov esi, eax
    mov dx, ax
    ror eax, 010h
    mov bp, ax
    mov si, ax
    mov ecx, eax
    mov ebx, eax
    mov cx, dx
    mov bx, dx
    ret
L78279::
    add eax, eax
    shr ax, 1
    mov ecx, eax
    and ecx, 01f001fh
    add eax, eax
    and eax, 0ffe0ffe0h
    or eax, ecx
    mov ebp, eax
    mov esi, eax
    mov dx, ax
    ror eax, 010h
    mov bp, ax
    mov si, ax
    mov ecx, eax
    mov ebx, eax
    mov cx, dx
    mov bx, dx
    ret
L782aa::
    mov eax, dword ptr [esi]
    shrd eax, edx, cl
    add cl, 01eh
    jae short L782bd
    add esi, 04h
    or cl, 0e0h
    mov edx, dword ptr [esi+04h]
L782bd::
    and eax, 03fffffffh
    add eax, eax
    shr ax, 1
    mov word ptr [edi], ax
    mov word ptr [edi+02h], ax
    rol eax, 010h
    add edi, 08h
    mov word ptr [edi-04h], ax
    mov word ptr [edi-02h], ax
    ret
L782dd::
    mov eax, dword ptr [esi]
    shrd eax, edx, cl
    add cl, 01eh
    jae short L782f0
    add esi, 04h
    or cl, 0e0h
    mov edx, dword ptr [esi+04h]
L782f0::
    and eax, 03fffffffh
    add eax, eax
    shr ax, 1
    mov ebx, eax
    and ebx, 01f001fh
    add eax, eax
    and eax, 0ffe0ffe0h
    or eax, ebx
    mov word ptr [edi], ax
    mov word ptr [edi+02h], ax
    rol eax, 010h
    add edi, 08h
    mov word ptr [edi-04h], ax
    mov word ptr [edi-02h], ax
    ret
L78321::
    add eax, eax
    shr ax, 1
    mov ebp, eax
    mov esi, eax
    mov ebx, eax
    mov dx, ax
    ror eax, 010h
    mov bp, ax
    mov si, ax
    mov bx, ax
    mov ecx, eax
    mov cx, dx
    ret
L78341::
    add eax, eax
    shr ax, 1
    mov ecx, eax
    and ecx, 01f001fh
    add eax, eax
    and eax, 0ffe0ffe0h
    or eax, ecx
    mov ebp, eax
    mov esi, eax
    mov ebx, eax
    mov dx, ax
    ror eax, 010h
    mov bp, ax
    mov si, ax
    mov bx, ax
    mov ecx, eax
    mov cx, dx
    ret
L78372::
    mov eax, dword ptr [esi]
    shrd eax, edx, cl
    add cl, 01eh
    jae short L78385
    add esi, 04h
    or cl, 0e0h
    mov edx, dword ptr [esi+04h]
L78385::
    and eax, 03fffffffh
    add eax, eax
    shr ax, 1
    rol eax, 010h
    mov dword ptr [edi], eax
    add edi, 08h
    mov word ptr [edi-04h], ax
    mov word ptr [edi-02h], ax
    ret
L783a0::
    mov eax, dword ptr [esi]
    shrd eax, edx, cl
    add cl, 01eh
    jae short L783b3
    add esi, 04h
    or cl, 0e0h
    mov edx, dword ptr [esi+04h]
L783b3::
    and eax, 03fffffffh
    add eax, eax
    shr ax, 1
    mov ebx, eax
    and ebx, 01f001fh
    add eax, eax
    and eax, 0ffe0ffe0h
    or eax, ebx
    rol eax, 010h
    mov dword ptr [edi], eax
    add edi, 08h
    mov word ptr [edi-04h], ax
    mov word ptr [edi-02h], ax
    ret
L783df::
    add eax, eax
    shr ax, 1
    mov ebp, eax
    mov esi, eax
    mov ecx, eax
    mov dx, ax
    ror eax, 010h
    mov bp, ax
    mov si, ax
    mov cx, ax
    mov ebx, eax
    mov bx, dx
    ret
L783ff::
    add eax, eax
    shr ax, 1
    mov ecx, eax
    and ecx, 01f001fh
    add eax, eax
    and eax, 0ffe0ffe0h
    or eax, ecx
    mov ebp, eax
    mov esi, eax
    mov ecx, eax
    mov dx, ax
    ror eax, 010h
    mov bp, ax
    mov si, ax
    mov cx, ax
    mov ebx, eax
    mov bx, dx
    ret
L78430::
    mov eax, dword ptr [esi]
    shrd eax, edx, cl
    add cl, 01eh
    jae short L78443
    add esi, 04h
    or cl, 0e0h
    mov edx, dword ptr [esi+04h]
L78443::
    and eax, 03fffffffh
    add eax, eax
    shr ax, 1
    mov dword ptr [edi], eax
    rol eax, 010h
    add edi, 08h
    mov word ptr [edi-02h], ax
    mov word ptr [edi-04h], ax
    ret
L7845e::
    mov eax, dword ptr [esi]
    shrd eax, edx, cl
    add cl, 01eh
    jae short L78471
    add esi, 04h
    or cl, 0e0h
    mov edx, dword ptr [esi+04h]
L78471::
    and eax, 03fffffffh
    add eax, eax
    shr ax, 1
    mov ebx, eax
    and ebx, 01f001fh
    add eax, eax
    and eax, 0ffe0ffe0h
    or eax, ebx
    mov dword ptr [edi], eax
    rol eax, 010h
    add edi, 08h
    mov word ptr [edi-02h], ax
    mov word ptr [edi-04h], ax
    ret
L7849d::
    add eax, eax
    shr ax, 1
    mov ebx, eax
    mov ecx, eax
    mov esi, eax
    mov ebp, eax
    ror eax, 010h
    mov bx, ax
    mov cx, ax
    mov si, ax
    mov bp, ax
    ret
L784ba::
    add eax, eax
    shr ax, 1
    mov ecx, eax
    and ecx, 01f001fh
    add eax, eax
    and eax, 0ffe0ffe0h
    or eax, ecx
    mov ebx, eax
    mov ecx, eax
    mov esi, eax
    mov ebp, eax
    ror eax, 010h
    mov bx, ax
    mov cx, ax
    mov si, ax
    mov bp, ax
    ret
L784e8::
    mov eax, dword ptr [esi]
    shrd eax, edx, cl
    add cl, 0fh
    jb near ptr L7f0d8
L784f6::
    and eax, 07fffh
    add cl, 0fh
    jb near ptr L7f0e8
L78504::
    mov word ptr [edi+04h], ax
    mov word ptr [edi+06h], ax
    mov word ptr [edi], ax
    add edi, 08h
    mov word ptr [edi-06h], ax
    ret
L78517::
    mov eax, dword ptr [esi]
    shrd eax, edx, cl
    add cl, 0fh
    jb near ptr L7f0f8
L78525::
    and eax, 07fffh
    bswap ecx
    mov cl, al
    add ax, ax
    and al, 0c0h
    and cl, 01fh
    or al, cl
    bswap ecx
    add cl, 0fh
    jb near ptr L7f108
L78543::
    mov word ptr [edi+04h], ax
    mov word ptr [edi+06h], ax
    mov word ptr [edi], ax
    add edi, 08h
    mov word ptr [edi-06h], ax
    ret
Func779a0_ endp
    dd offset L779f1
    dd offset L77ab0
    dd offset L77b6e
    dd offset L77c26
    dd offset L77cee
    dd offset L77dac
    dd offset L77e60
    dd offset L77f14
    dd offset L77fd2
    dd offset L7808a
    dd offset L7813e
    dd offset L781ec
    dd offset L782aa
    dd offset L78372
    dd offset L78430
    dd offset L784e8
L78596 label byte
    dd offset L77a20
    dd offset L77ade
    dd offset L77b99
    dd offset L77c59
    dd offset L77d1c
    dd offset L77dd5
    dd offset L77e89
    dd offset L77f42
    dd offset L77ffd
    dd offset L780b3
    dd offset L78164
    dd offset L7821a
    dd offset L782dd
    dd offset L783a0
    dd offset L7845e
    dd offset L78517
    dd offset Func779a0_
    dd offset L77a5f
    dd offset L77b1d
    dd offset L77bd5
    dd offset L77c9d
    dd offset L77d5b
    dd offset L77e0f
    dd offset L77ec3
    dd offset L77f81
    dd offset L78039
    dd offset L780ed
    dd offset L7819b
    dd offset L78259
    dd offset L78321
    dd offset L783df
    dd offset L7849d
    dd offset L779c0
    dd offset L77a7f
    dd offset L77b3d
    dd offset L77bf5
    dd offset L77cbd
    dd offset L77d7b
    dd offset L77e2f
    dd offset L77ee3
    dd offset L77fa1
    dd offset L78059
    dd offset L7810d
    dd offset L781bb
    dd offset L78279
    dd offset L78341
    dd offset L783ff
    dd offset L784ba
Func78656_ proc near
    mov dword ptr [edi], ebx
    mov dword ptr [edi+04h], ecx
    mov dword ptr [edi+0a00h], esi
    mov dword ptr [edi+0a04h], ebp
    ret
L78668::
    mov dword ptr [edi+08h], ebx
    mov dword ptr [edi+0ch], ecx
    mov dword ptr [edi+0a08h], esi
    mov dword ptr [edi+0a0ch], ebp
    ret
L7867b::
    mov dword ptr [edi+010h], ebx
    mov dword ptr [edi+014h], ecx
    mov dword ptr [edi+0a10h], esi
    mov dword ptr [edi+0a14h], ebp
    ret
L7868e::
    mov dword ptr [edi+018h], ebx
    mov dword ptr [edi+01ch], ecx
    mov dword ptr [edi+0a18h], esi
    mov dword ptr [edi+0a1ch], ebp
    ret
L786a1::
    mov dword ptr [edi+01400h], ebx
    mov dword ptr [edi+01404h], ecx
    mov dword ptr [edi+01e00h], esi
    mov dword ptr [edi+01e04h], ebp
    ret
L786ba::
    mov dword ptr [edi+01408h], ebx
    mov dword ptr [edi+0140ch], ecx
    mov dword ptr [edi+01e08h], esi
    mov dword ptr [edi+01e0ch], ebp
    ret
L786d3::
    mov dword ptr [edi+01410h], ebx
    mov dword ptr [edi+01414h], ecx
    mov dword ptr [edi+01e10h], esi
    mov dword ptr [edi+01e14h], ebp
    ret
L786ec::
    mov dword ptr [edi+01418h], ebx
    mov dword ptr [edi+0141ch], ecx
    mov dword ptr [edi+01e18h], esi
    mov dword ptr [edi+01e1ch], ebp
    ret
L78705::
    mov dword ptr [edi+02800h], ebx
    mov dword ptr [edi+02804h], ecx
    mov dword ptr [edi+03200h], esi
    mov dword ptr [edi+03204h], ebp
    ret
L7871e::
    mov dword ptr [edi+02808h], ebx
    mov dword ptr [edi+0280ch], ecx
    mov dword ptr [edi+03208h], esi
    mov dword ptr [edi+0320ch], ebp
    ret
L78737::
    mov dword ptr [edi+02810h], ebx
    mov dword ptr [edi+02814h], ecx
    mov dword ptr [edi+03210h], esi
    mov dword ptr [edi+03214h], ebp
    ret
L78750::
    mov dword ptr [edi+02818h], ebx
    mov dword ptr [edi+0281ch], ecx
    mov dword ptr [edi+03218h], esi
    mov dword ptr [edi+0321ch], ebp
    ret
L78769::
    mov dword ptr [edi+03c00h], ebx
    mov dword ptr [edi+03c04h], ecx
    mov dword ptr [edi+04600h], esi
    mov dword ptr [edi+04604h], ebp
    ret
L78782::
    mov dword ptr [edi+03c08h], ebx
    mov dword ptr [edi+03c0ch], ecx
    mov dword ptr [edi+04608h], esi
    mov dword ptr [edi+0460ch], ebp
    ret
L7879b::
    mov dword ptr [edi+03c10h], ebx
    mov dword ptr [edi+03c14h], ecx
    mov dword ptr [edi+04610h], esi
    mov dword ptr [edi+04614h], ebp
    ret
L787b4::
    mov dword ptr [edi+03c18h], ebx
    mov dword ptr [edi+03c1ch], ecx
    mov dword ptr [edi+04618h], esi
    mov dword ptr [edi+0461ch], ebp
    ret
L787cd::
    mov dword ptr [edi], ebx
    mov dword ptr [edi+04h], ecx
    cmp di, 0f600h
    jae short L787e5
    mov dword ptr [edi+0a00h], esi
    mov dword ptr [edi+0a04h], ebp
L787e5::
    ret
L787e6::
    cmp di, 0fff8h
    jae short L78805
    mov dword ptr [edi+08h], ebx
    mov dword ptr [edi+0ch], ecx
    cmp di, 0f5f8h
    jae short L78805
    mov dword ptr [edi+0a08h], esi
    mov dword ptr [edi+0a0ch], ebp
L78805::
    ret
L78806::
    cmp di, 0fff0h
    jae short L78825
    mov dword ptr [edi+010h], ebx
    mov dword ptr [edi+014h], ecx
    cmp di, 0f5f0h
    jae short L78825
    mov dword ptr [edi+0a10h], esi
    mov dword ptr [edi+0a14h], ebp
L78825::
    ret
L78826::
    cmp di, 0ffe8h
    jae short L78845
    mov dword ptr [edi+018h], ebx
    mov dword ptr [edi+01ch], ecx
    cmp di, 0f5e8h
    jae short L78845
    mov dword ptr [edi+0a18h], esi
    mov dword ptr [edi+0a1ch], ebp
L78845::
    ret
L78846::
    cmp di, 0ec00h
    jae short L7886c
    mov dword ptr [edi+01400h], ebx
    mov dword ptr [edi+01404h], ecx
    cmp di, 0e200h
    jae short L7886c
    mov dword ptr [edi+01e00h], esi
    mov dword ptr [edi+01e04h], ebp
L7886c::
    ret
L7886d::
    cmp di, 0ebf8h
    jae short L78893
    mov dword ptr [edi+01408h], ebx
    mov dword ptr [edi+0140ch], ecx
    cmp di, 0e1f8h
    jae short L78893
    mov dword ptr [edi+01e08h], esi
    mov dword ptr [edi+01e0ch], ebp
L78893::
    ret
L78894::
    cmp di, 0ebf0h
    jae short L788ba
    mov dword ptr [edi+01410h], ebx
    mov dword ptr [edi+01414h], ecx
    cmp di, 0e1f0h
    jae short L788ba
    mov dword ptr [edi+01e10h], esi
    mov dword ptr [edi+01e14h], ebp
L788ba::
    ret
L788bb::
    cmp di, 0ebe8h
    jae short L788e1
    mov dword ptr [edi+01418h], ebx
    mov dword ptr [edi+0141ch], ecx
    cmp di, 0e1e8h
    jae short L788e1
    mov dword ptr [edi+01e18h], esi
    mov dword ptr [edi+01e1ch], ebp
L788e1::
    ret
L788e2::
    cmp di, 0d800h
    jae short L78908
    mov dword ptr [edi+02800h], ebx
    mov dword ptr [edi+02804h], ecx
    cmp di, 0ce00h
    jae short L78908
    mov dword ptr [edi+03200h], esi
    mov dword ptr [edi+03204h], ebp
L78908::
    ret
L78909::
    cmp di, 0d7f8h
    jae short L7892f
    mov dword ptr [edi+02808h], ebx
    mov dword ptr [edi+0280ch], ecx
    cmp di, 0cdf8h
    jae short L7892f
    mov dword ptr [edi+03208h], esi
    mov dword ptr [edi+0320ch], ebp
L7892f::
    ret
L78930::
    cmp di, 0d7f0h
    jae short L78956
    mov dword ptr [edi+02810h], ebx
    mov dword ptr [edi+02814h], ecx
    cmp di, 0cdf0h
    jae short L78956
    mov dword ptr [edi+03210h], esi
    mov dword ptr [edi+03214h], ebp
L78956::
    ret
L78957::
    cmp di, 0d7e8h
    jae short L7897d
    mov dword ptr [edi+02818h], ebx
    mov dword ptr [edi+0281ch], ecx
    cmp di, 0cde8h
    jae short L7897d
    mov dword ptr [edi+03218h], esi
    mov dword ptr [edi+0321ch], ebp
L7897d::
    ret
L7897e::
    cmp di, 0c400h
    jae short L789a4
    mov dword ptr [edi+03c00h], ebx
    mov dword ptr [edi+03c04h], ecx
    cmp di, 0ba00h
    jae short L789a4
    mov dword ptr [edi+04600h], esi
    mov dword ptr [edi+04604h], ebp
L789a4::
    ret
L789a5::
    cmp di, 0c3f8h
    jae short L789cb
    mov dword ptr [edi+03c08h], ebx
    mov dword ptr [edi+03c0ch], ecx
    cmp di, 0b9f8h
    jae short L789cb
    mov dword ptr [edi+04608h], esi
    mov dword ptr [edi+0460ch], ebp
L789cb::
    ret
L789cc::
    cmp di, 0c3f0h
    jae short L789f2
    mov dword ptr [edi+03c10h], ebx
    mov dword ptr [edi+03c14h], ecx
    cmp di, 0b9f0h
    jae short L789f2
    mov dword ptr [edi+04610h], esi
    mov dword ptr [edi+04614h], ebp
L789f2::
    ret
L789f3::
    cmp di, 0c3e8h
    jae short L78a19
    mov dword ptr [edi+03c18h], ebx
    mov dword ptr [edi+03c1ch], ecx
    cmp di, 0b9e8h
    jae short L78a19
    mov dword ptr [edi+04618h], esi
    mov dword ptr [edi+0461ch], ebp
L78a19::
    ret
L78a1a::
    sub edi, 010000h
    cmp di, 0f600h
    jae short L78a2e
    jmp short L78a3a
    mov dword ptr [edi], ebx
    mov dword ptr [edi+04h], ecx
L78a2e::
    mov dword ptr [edi+0a00h], esi
    mov dword ptr [edi+0a04h], ebp
L78a3a::
    add edi, 010000h
    ret
L78a41::
    sub edi, 010000h
    cmp di, 0fff8h
    jae short L78a56
    cmp di, 0f5f8h
    jae short L78a5c
    jmp short L78a68
L78a56::
    mov dword ptr [edi+08h], ebx
    mov dword ptr [edi+0ch], ecx
L78a5c::
    mov dword ptr [edi+0a08h], esi
    mov dword ptr [edi+0a0ch], ebp
L78a68::
    add edi, 010000h
    ret
L78a6f::
    sub edi, 010000h
    cmp di, 0fff0h
    jae short L78a84
    cmp di, 0f5f0h
    jae short L78a8a
    jmp short L78a96
L78a84::
    mov dword ptr [edi+010h], ebx
    mov dword ptr [edi+014h], ecx
L78a8a::
    mov dword ptr [edi+0a10h], esi
    mov dword ptr [edi+0a14h], ebp
L78a96::
    add edi, 010000h
    ret
L78a9d::
    sub edi, 010000h
    cmp di, 0ffe8h
    jae short L78ab2
    cmp di, 0f5e8h
    jae short L78ab8
    jmp short L78ac4
L78ab2::
    mov dword ptr [edi+018h], ebx
    mov dword ptr [edi+01ch], ecx
L78ab8::
    mov dword ptr [edi+0a18h], esi
    mov dword ptr [edi+0a1ch], ebp
L78ac4::
    add edi, 010000h
    ret
L78acb::
    sub edi, 010000h
    cmp di, 0ec00h
    jae short L78ae1
    cmp di, 0e200h
    jae short L78aed
    jmp short L78af9
L78ae1::
    mov dword ptr [edi+01400h], ebx
    mov dword ptr [edi+01404h], ecx
L78aed::
    mov dword ptr [edi+01e00h], esi
    mov dword ptr [edi+01e04h], ebp
L78af9::
    add edi, 010000h
    ret
L78b00::
    sub edi, 010000h
    cmp di, 0ebf8h
    jae short L78b16
    cmp di, 0e1f8h
    jae short L78b22
    jmp short L78b2e
L78b16::
    mov dword ptr [edi+01408h], ebx
    mov dword ptr [edi+0140ch], ecx
L78b22::
    mov dword ptr [edi+01e08h], esi
    mov dword ptr [edi+01e0ch], ebp
L78b2e::
    add edi, 010000h
    ret
L78b35::
    sub edi, 010000h
    cmp di, 0ebf0h
    jae short L78b4b
    cmp di, 0e1f0h
    jae short L78b57
    jmp short L78b63
L78b4b::
    mov dword ptr [edi+01410h], ebx
    mov dword ptr [edi+01414h], ecx
L78b57::
    mov dword ptr [edi+01e10h], esi
    mov dword ptr [edi+01e14h], ebp
L78b63::
    add edi, 010000h
    ret
L78b6a::
    sub edi, 010000h
    cmp di, 0ebe8h
    jae short L78b80
    cmp di, 0e1e8h
    jae short L78b8c
    jmp short L78b98
L78b80::
    mov dword ptr [edi+01418h], ebx
    mov dword ptr [edi+0141ch], ecx
L78b8c::
    mov dword ptr [edi+01e18h], esi
    mov dword ptr [edi+01e1ch], ebp
L78b98::
    add edi, 010000h
    ret
L78b9f::
    sub edi, 010000h
    cmp di, 0d800h
    jae short L78bb5
    cmp di, 0ce00h
    jae short L78bc1
    jmp short L78bcd
L78bb5::
    mov dword ptr [edi+02800h], ebx
    mov dword ptr [edi+02804h], ecx
L78bc1::
    mov dword ptr [edi+03200h], esi
    mov dword ptr [edi+03204h], ebp
L78bcd::
    add edi, 010000h
    ret
L78bd4::
    sub edi, 010000h
    cmp di, 0d7f8h
    jae short L78bea
    cmp di, 0cdf8h
    jae short L78bf6
    jmp short L78c02
L78bea::
    mov dword ptr [edi+02808h], ebx
    mov dword ptr [edi+0280ch], ecx
L78bf6::
    mov dword ptr [edi+03208h], esi
    mov dword ptr [edi+0320ch], ebp
L78c02::
    add edi, 010000h
    ret
L78c09::
    sub edi, 010000h
    cmp di, 0d7f0h
    jae short L78c1f
    cmp di, 0cdf0h
    jae short L78c2b
    jmp short L78c37
L78c1f::
    mov dword ptr [edi+02810h], ebx
    mov dword ptr [edi+02814h], ecx
L78c2b::
    mov dword ptr [edi+03210h], esi
    mov dword ptr [edi+03214h], ebp
L78c37::
    add edi, 010000h
    ret
L78c3e::
    sub edi, 010000h
    cmp di, 0d7e8h
    jae short L78c54
    cmp di, 0cde8h
    jae short L78c60
    jmp short L78c6c
L78c54::
    mov dword ptr [edi+02818h], ebx
    mov dword ptr [edi+0281ch], ecx
L78c60::
    mov dword ptr [edi+03218h], esi
    mov dword ptr [edi+0321ch], ebp
L78c6c::
    add edi, 010000h
    ret
L78c73::
    sub edi, 010000h
    cmp di, 0c400h
    jae short L78c89
    cmp di, 0ba00h
    jae short L78c95
    jmp short L78ca1
L78c89::
    mov dword ptr [edi+03c00h], ebx
    mov dword ptr [edi+03c04h], ecx
L78c95::
    mov dword ptr [edi+04600h], esi
    mov dword ptr [edi+04604h], ebp
L78ca1::
    add edi, 010000h
    ret
L78ca8::
    sub edi, 010000h
    cmp di, 0c3f8h
    jae short L78cbe
    cmp di, 0b9f8h
    jae short L78cca
    jmp short L78cd6
L78cbe::
    mov dword ptr [edi+03c08h], ebx
    mov dword ptr [edi+03c0ch], ecx
L78cca::
    mov dword ptr [edi+04608h], esi
    mov dword ptr [edi+0460ch], ebp
L78cd6::
    add edi, 010000h
    ret
L78cdd::
    sub edi, 010000h
    cmp di, 0c3f0h
    jae short L78cf3
    cmp di, 0b9f0h
    jae short L78cff
    jmp short L78d0b
L78cf3::
    mov dword ptr [edi+03c10h], ebx
    mov dword ptr [edi+03c14h], ecx
L78cff::
    mov dword ptr [edi+04610h], esi
    mov dword ptr [edi+04614h], ebp
L78d0b::
    add edi, 010000h
    ret
L78d12::
    sub edi, 010000h
    cmp di, 0c3e8h
    jae short L78d28
    cmp di, 0b9e8h
    jae short L78d34
    jmp short L78d40
L78d28::
    mov dword ptr [edi+03c18h], ebx
    mov dword ptr [edi+03c1ch], ecx
L78d34::
    mov dword ptr [edi+04618h], esi
    mov dword ptr [edi+0461ch], ebp
L78d40::
    add edi, 010000h
    ret
Func78656_ endp
L78d47 label byte
    dd offset Func78656_
    dd offset L78668
    dd offset L7867b
    dd offset L7868e
    dd offset L786a1
    dd offset L786ba
    dd offset L786d3
    dd offset L786ec
    dd offset L78705
    dd offset L7871e
    dd offset L78737
    dd offset L78750
    dd offset L78769
    dd offset L78782
    dd offset L7879b
    dd offset L787b4
L78d87 label byte
    dd offset L787cd
    dd offset L787e6
    dd offset L78806
    dd offset L78826
    dd offset L78846
    dd offset L7886d
    dd offset L78894
    dd offset L788bb
    dd offset L788e2
    dd offset L78909
    dd offset L78930
    dd offset L78957
    dd offset L7897e
    dd offset L789a5
    dd offset L789cc
    dd offset L789f3
L78dc7 label byte
    dd offset L78a1a
    dd offset L78a41
    dd offset L78a6f
    dd offset L78a9d
    dd offset L78acb
    dd offset L78b00
    dd offset L78b35
    dd offset L78b6a
    dd offset L78b9f
    dd offset L78bd4
    dd offset L78c09
    dd offset L78c3e
    dd offset L78c73
    dd offset L78ca8
    dd offset L78cdd
    dd offset L78d12
Func78e07_ proc near
    push ebp
    mov ebp, esp
    push esi
    push edi
    push eax
    push ebx
    push ecx
    push edx
    mov esi, dword ptr [ebp+08h]
    mov eax, dword ptr [esi-08h]
    mov dword ptr [L7f244], eax
    mov edi, dword ptr [ebp+014h]
    mov eax, dword ptr [edi]
    imul eax, dword ptr [edi+04h]
    add edi, 08h
    mov dword ptr [ebp+014h], edi
    mov dword ptr [L7f1ac], eax
    mov edi, dword ptr [ebp+010h]
    mov eax, dword ptr [edi]
    mov dword ptr [L7f19c], eax
    mov eax, dword ptr [edi+04h]
    mov dword ptr [L7f1a0], eax
    mov eax, dword ptr [edi+08h]
    mov dword ptr [L7f1a4], eax
    mov al, byte ptr [edi+0ch]
    mov byte ptr [L7f284], al
    mov al, byte ptr [edi+0dh]
    mov byte ptr [L7f285], al
    mov al, byte ptr [edi+0eh]
    mov byte ptr [L7f286], al
    mov edi, dword ptr [ebp+0ch]
    mov dword ptr [L7f1a8], edi
    mov byte ptr [L7f240], 00h
    test dword ptr [L7f244], 07800000h
    je near ptr L7defa
    mov esi, dword ptr [ebp+08h]
    mov dword ptr [L7f248], 00h
    mov dword ptr [L7f23c], 00h
    mov dword ptr [L7f1b0], 00h
    mov dword ptr [L7f238], 00h
    mov ecx, 0e0h
    mov edx, dword ptr [L7f244]
    test edx, 020000h
    je short L78f19
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 04h
    jb near ptr L7e0a8
L78ed0::
    and eax, 0fh
    mov byte ptr [L7f284], al
    mov eax, dword ptr [eax*4+L7f1b8]
    mov dword ptr [L7f1b0], eax
    cmp eax, 00h
    je short L78f13
    mov edi, dword ptr [L7f19c]
    mov edx, dword ptr [esi+04h]
L78ef2::
    mov eax, dword ptr [esi]
    shrd eax, edx, cl
    add cl, 04h
    jb near ptr L7f118
L78f00::
    and eax, 0fh
    call dword ptr [eax*4+L78596]
    sub dword ptr [L7f1b0], 01h
    jne short L78ef2
L78f13::
    mov edx, dword ptr [L7f244]
L78f19::
    test edx, 040000h
    je short L78f81
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 04h
    jb near ptr L7e0b4
L78f32::
    and eax, 0fh
    mov byte ptr [L7f285], al
    mov eax, dword ptr [eax*4+L7f1b8]
    mul dword ptr [L7f1ac]
    mov dword ptr [L7f1b0], eax
    cmp eax, 00h
    je short L78f7b
    mov edi, dword ptr [L7f1a0]
    mov edx, dword ptr [esi+04h]
L78f5a::
    mov eax, dword ptr [esi]
    shrd eax, edx, cl
    add cl, 04h
    jb near ptr L7f128
L78f68::
    and eax, 0fh
    call dword ptr [eax*4+L78596]
    sub dword ptr [L7f1b0], 01h
    jne short L78f5a
L78f7b::
    mov edx, dword ptr [L7f244]
L78f81::
    test edx, 080000h
    je short L78feb
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 014h
    jae short L78f9c
    add esi, 04h
    or cl, 0e0h
L78f9c::
    and eax, 0fffffh
    mov dword ptr [L7f1b0], eax
    cmp eax, 00h
    je short L78feb
    bswap ecx
    mov cl, 00h
    sub eax, 01h
L78fb2::
    add cl, 01h
    shr eax, 1
    jne short L78fb2
    mov byte ptr [L7f286], cl
    bswap ecx
    mov edi, dword ptr [L7f1a4]
    mov edx, dword ptr [esi+04h]
L78fca::
    mov eax, dword ptr [esi]
    shrd eax, edx, cl
    add cl, 04h
    jb near ptr L7f138
L78fd8::
    and eax, 0fh
    call dword ptr [eax*4+L78596]
    sub dword ptr [L7f1b0], 01h
    jne short L78fca
L78feb::
    mov edx, dword ptr [L7f1a0]
    mov dword ptr [L7f238], edx
    bswap ecx
    mov edx, dword ptr [ebp+010h]
    mov cl, byte ptr [L7f284]
    mov byte ptr [edx+0ch], cl
    mov eax, 01h
    shl eax, cl
    dec eax
    mov dword ptr [L7f280], eax
    mov cl, byte ptr [L7f286]
    mov byte ptr [edx+0eh], cl
    mov eax, 01h
    shl eax, cl
    dec eax
    mov dword ptr [L7f27c], eax
    mov cl, byte ptr [L7f285]
    mov byte ptr [edx+0dh], cl
    mov eax, 01h
    shl eax, cl
    dec eax
    mov dword ptr [L7f278], eax
    add cl, 03h
    mov byte ptr [L7f287], cl
    bswap ecx
    xor edx, edx
    mov word ptr [L7f17c], 0ffffh
L79054::
    mov dword ptr [L7f260], esi
    mov dword ptr [L7f264], ecx
    mov dword ptr [L7f268], edx
    mov al, byte ptr [L7f240]
    mov byte ptr [L7f274], al
    mov eax, dword ptr [L7f23c]
    mov dword ptr [L7f270], eax
    mov eax, dword ptr [L7f238]
    mov dword ptr [L7f26c], eax
L79084::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb near ptr L7e0c0
L79091::
    and eax, 01h
    je short L790e7
    add edx, 01h
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 03h
    jb near ptr L7e0cc
L790aa::
    and eax, 07h
    add edx, eax
    cmp eax, 07h
    jl short L790e7
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 07h
    jb near ptr L7e0d8
L790c5::
    and eax, 07fh
    add edx, eax
    cmp eax, 07fh
    jl short L790e7
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 0ch
    jb near ptr L7e0e4
L790e0::
    and eax, 0fffh
    add edx, eax
L790e7::
    bswap ecx
    mov cl, byte ptr [L7f287]
    mov ebx, edx
    shl ebx, cl
    add dword ptr [L7f238], ebx
    bswap ecx
    add edx, dword ptr [L7f23c]
    cmp edx, dword ptr [L7f1ac]
    jae near ptr L7c259
    mov dword ptr [L7f23c], edx
    shl edx, 02h
    add edx, dword ptr [ebp+014h]
    mov edi, dword ptr [edx]
    cmp edi, 0ffffffffh
    je near ptr L7a8c1
    cmp edi, 0fffffffeh
    je near ptr L7c259
    shld ebx, edi, 010h
    cmp di, 0b4f2h
    ja near ptr L7a8d2
    cmp bx, word ptr [L7f17c]
    jne near ptr L7c27c
L79149::
    mov word ptr [L7f17c], bx
    mov dword ptr [L7f198], edi
    and edi, 0ffffh
    or edi, dword ptr [L7f1a8]
L79162::
    mov dword ptr [L7f1b4], 00h
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb near ptr L7e0f0
L79179::
    test al, 01h
    jne near ptr L79542
L79181::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb near ptr L7e0fc
L7918e::
    and eax, 01h
    jne short L7919a
    mov al, byte ptr [L7f240]
    jmp short L791be
L7919a::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb near ptr L7e108
L791a7::
    and eax, 01h
    mov al, byte ptr [L7f240]
    je short L791b3
    inc al
L791b3::
    sub al, 02h
    sbb al, 00h
    and al, 03h
    mov byte ptr [L7f240], al
L791be::
    or al, al
    je near ptr L79255
    test al, 02h
    jne short L791ec
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L7f284]
    jb near ptr L7e114
L791de::
    and eax, dword ptr [L7f280]
    mov edx, dword ptr [L7f19c]
    jmp short L7920c
L791ec::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L7f286]
    jb near ptr L7e120
L79200::
    and eax, dword ptr [L7f27c]
    mov edx, dword ptr [L7f1a4]
L7920c::
    shl eax, 03h
    add edx, eax
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 011h
    jae short L79224
    add esi, 04h
    or cl, 0e0h
L79224::
    and eax, 01ffffh
    mov ebx, dword ptr [edx-02h]
    mov dword ptr [L7f18c], ecx
    mov ecx, dword ptr [edx]
    mov bx, cx
    mov dword ptr [L7f190], ebp
    mov dword ptr [L7f188], esi
    mov esi, dword ptr [edx+02h]
    mov cx, si
    mov ebp, dword ptr [edx+04h]
    mov si, bp
    mov bp, word ptr [edx+06h]
    jmp short L792bc
L79255::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L7f285]
    jb near ptr L7e12c
L79269::
    and eax, dword ptr [L7f278]
    mov edx, dword ptr [L7f238]
    shl eax, 03h
    add edx, eax
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 011h
    jae short L7928d
    add esi, 04h
    or cl, 0e0h
L7928d::
    and eax, 01ffffh
    mov ebx, dword ptr [edx-02h]
    mov dword ptr [L7f18c], ecx
    mov ecx, dword ptr [edx]
    mov bx, cx
    mov dword ptr [L7f190], ebp
    mov dword ptr [L7f188], esi
    mov esi, dword ptr [edx+02h]
    mov cx, si
    mov ebp, dword ptr [edx+04h]
    mov si, bp
    mov bp, word ptr [edx+06h]
L792bc::
    or dword ptr [L7f1b4], eax
    test al, al
    je near ptr L793db
    test al, 01h
    je near ptr L793a7
L792d2::
    mov dword ptr [edi], ebx
    mov dword ptr [edi+04h], ecx
    mov dword ptr [edi+0a00h], esi
    mov dword ptr [edi+0a04h], ebp
    test al, 02h
    je near ptr L793af
L792eb::
    mov dword ptr [edi+08h], ebx
    mov dword ptr [edi+0ch], ecx
    mov dword ptr [edi+0a08h], esi
    mov dword ptr [edi+0a0ch], ebp
    test al, 010h
    je near ptr L793b7
L79305::
    mov dword ptr [edi+010h], ebx
    mov dword ptr [edi+014h], ecx
    mov dword ptr [edi+0a10h], esi
    mov dword ptr [edi+0a14h], ebp
    test al, 020h
    je near ptr L793bf
L7931f::
    mov dword ptr [edi+018h], ebx
    mov dword ptr [edi+01ch], ecx
    mov dword ptr [edi+0a18h], esi
    mov dword ptr [edi+0a1ch], ebp
    test al, 04h
    je near ptr L793c7
L79339::
    mov dword ptr [edi+01400h], ebx
    mov dword ptr [edi+01404h], ecx
    mov dword ptr [edi+01e00h], esi
    mov dword ptr [edi+01e04h], ebp
    test al, 08h
    je short L793cf
L79355::
    mov dword ptr [edi+01408h], ebx
    mov dword ptr [edi+0140ch], ecx
    mov dword ptr [edi+01e08h], esi
    mov dword ptr [edi+01e0ch], ebp
    test al, 040h
    je short L793d3
L79371::
    mov dword ptr [edi+01410h], ebx
    mov dword ptr [edi+01414h], ecx
    mov dword ptr [edi+01e10h], esi
    mov dword ptr [edi+01e14h], ebp
    test al, 080h
    je short L793d7
L7938d::
    mov dword ptr [edi+01418h], ebx
    mov dword ptr [edi+0141ch], ecx
    mov dword ptr [edi+01e18h], esi
    mov dword ptr [edi+01e1ch], ebp
    jmp short L793db
L793a7::
    test al, 01h
    jne near ptr L792d2
L793af::
    test al, 02h
    jne near ptr L792eb
L793b7::
    test al, 010h
    jne near ptr L79305
L793bf::
    test al, 020h
    jne near ptr L7931f
L793c7::
    test al, 04h
    jne near ptr L79339
L793cf::
    test al, 08h
    jne short L79355
L793d3::
    test al, 040h
    jne short L79371
L793d7::
    test al, 080h
    jne short L7938d
L793db::
    test ah, ah
    je near ptr L79525
    test ah, 01h
    je near ptr L794e5
L793ec::
    mov dword ptr [edi+02800h], ebx
    mov dword ptr [edi+02804h], ecx
    mov dword ptr [edi+03200h], esi
    mov dword ptr [edi+03204h], ebp
    test ah, 02h
    je near ptr L794ee
L7940d::
    mov dword ptr [edi+02808h], ebx
    mov dword ptr [edi+0280ch], ecx
    mov dword ptr [edi+03208h], esi
    mov dword ptr [edi+0320ch], ebp
    test ah, 010h
    je near ptr L794f7
L7942e::
    mov dword ptr [edi+02810h], ebx
    mov dword ptr [edi+02814h], ecx
    mov dword ptr [edi+03210h], esi
    mov dword ptr [edi+03214h], ebp
    test ah, 020h
    je near ptr L79500
L7944f::
    mov dword ptr [edi+02818h], ebx
    mov dword ptr [edi+0281ch], ecx
    mov dword ptr [edi+03218h], esi
    mov dword ptr [edi+0321ch], ebp
    test ah, 04h
    je near ptr L79509
L79470::
    mov dword ptr [edi+03c00h], ebx
    mov dword ptr [edi+03c04h], ecx
    mov dword ptr [edi+04600h], esi
    mov dword ptr [edi+04604h], ebp
    test ah, 08h
    je near ptr L79512
L79491::
    mov dword ptr [edi+03c08h], ebx
    mov dword ptr [edi+03c0ch], ecx
    mov dword ptr [edi+04608h], esi
    mov dword ptr [edi+0460ch], ebp
    test ah, 040h
    je short L7951b
L794ae::
    mov dword ptr [edi+03c10h], ebx
    mov dword ptr [edi+03c14h], ecx
    mov dword ptr [edi+04610h], esi
    mov dword ptr [edi+04614h], ebp
    test ah, 080h
    je short L79520
L794cb::
    mov dword ptr [edi+03c18h], ebx
    mov dword ptr [edi+03c1ch], ecx
    mov dword ptr [edi+04618h], esi
    mov dword ptr [edi+0461ch], ebp
    jmp short L79525
L794e5::
    test ah, 01h
    jne near ptr L793ec
L794ee::
    test ah, 02h
    jne near ptr L7940d
L794f7::
    test ah, 010h
    jne near ptr L7942e
L79500::
    test ah, 020h
    jne near ptr L7944f
L79509::
    test ah, 04h
    jne near ptr L79470
L79512::
    test ah, 08h
    jne near ptr L79491
L7951b::
    test ah, 040h
    jne short L794ae
L79520::
    test ah, 080h
    jne short L794cb
L79525::
    mov esi, dword ptr [L7f188]
    mov ecx, dword ptr [L7f18c]
    mov ebp, dword ptr [L7f190]
    and eax, 010000h
    je near ptr L79181
L79542::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb near ptr L7e138
L7954f::
    test al, 01h
    jne near ptr L7a73b
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 04h
    jb near ptr L7e144
L79568::
    and eax, 0fh
    jmp dword ptr [eax*4+L79572]
Func78e07_ endp
L79572 label byte
    dd offset Func795b2_
    dd offset L795d0
    dd offset L795f1
    dd offset L79615
    dd offset L79635
    dd offset L79657
    dd offset L7967e
    dd offset L796a1
    dd offset L796c5
    dd offset L796e4
    dd offset L79708
    dd offset L7972e
    dd offset L7974e
    dd offset L79769
    dd offset L7978a
    dd offset L797a8
Func795b2_ proc near
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 010h
    jae short L795c5
    add esi, 04h
    or cl, 0e0h
L795c5::
    xor dword ptr [L7f1b4], eax
    jmp near ptr L797ae
L795d0::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 0ch
    jb near ptr L7e150
L795e1::
    shl eax, 04h
    or al, 0fh
    xor dword ptr [L7f1b4], eax
    jmp near ptr L797ae
L795f1::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 0ch
    jb near ptr L7e15c
L79602::
    shl eax, 04h
    shr al, 04h
    or al, 0f0h
    xor dword ptr [L7f1b4], eax
    jmp near ptr L797ae
L79615::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 08h
    jb near ptr L7e168
L79626::
    mov ah, al
    mov al, 0ffh
    xor dword ptr [L7f1b4], eax
    jmp near ptr L797ae
L79635::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 0ch
    jb near ptr L7e174
L79646::
    shl ah, 04h
    or ah, 0fh
    xor dword ptr [L7f1b4], eax
    jmp near ptr L797ae
L79657::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 08h
    jb near ptr L7e180
L79668::
    shl eax, 04h
    shl ah, 04h
    or eax, 0f0fh
    xor dword ptr [L7f1b4], eax
    jmp near ptr L797ae
L7967e::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 08h
    jb near ptr L7e18c
L7968f::
    mov ah, al
    or eax, 0ff0h
    xor dword ptr [L7f1b4], eax
    jmp near ptr L797ae
L796a1::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 04h
    jb near ptr L7e198
L796b2::
    shl eax, 0ch
    or eax, 0fffh
    xor dword ptr [L7f1b4], eax
    jmp near ptr L797ae
L796c5::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 0ch
    jb near ptr L7e1a4
L796d6::
    or ah, 0f0h
    xor dword ptr [L7f1b4], eax
    jmp near ptr L797ae
L796e4::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 08h
    jb near ptr L7e1b0
L796f5::
    shl eax, 04h
    or eax, 0f00fh
    xor dword ptr [L7f1b4], eax
    jmp near ptr L797ae
L79708::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 08h
    jb near ptr L7e1bc
L79719::
    mov ah, al
    ror ah, 04h
    or eax, 0f0f0h
    xor dword ptr [L7f1b4], eax
    jmp near ptr L797ae
L7972e::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 04h
    jb near ptr L7e1c8
L7973f::
    mov ah, al
    or eax, 0f0ffh
    xor dword ptr [L7f1b4], eax
    jmp short L797ae
L7974e::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 08h
    jb near ptr L7e1d4
L7975f::
    mov ah, 0ffh
    xor dword ptr [L7f1b4], eax
    jmp short L797ae
L79769::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 04h
    jb near ptr L7e1e0
L7977a::
    or eax, 0fff0h
    rol al, 04h
    xor dword ptr [L7f1b4], eax
    jmp short L797ae
L7978a::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 04h
    jb near ptr L7e1ec
L7979b::
    or eax, 0fff0h
    xor dword ptr [L7f1b4], eax
    jmp short L797ae
L797a8::
    not dword ptr [L7f1b4]
L797ae::
    test byte ptr [L7f1b4], 0ffh
    je near ptr L79f64
    test byte ptr [L7f1b4], 01h
    je near ptr L79efc
L797c8::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb near ptr L7e1f8
L797d5::
    and eax, 01h
    jne short L797e1
    mov al, byte ptr [L7f240]
    jmp short L79805
L797e1::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb near ptr L7e204
L797ee::
    and eax, 01h
    mov al, byte ptr [L7f240]
    je short L797fa
    inc al
L797fa::
    sub al, 02h
    sbb al, 00h
    and al, 03h
    mov byte ptr [L7f240], al
L79805::
    or al, al
    je short L79851
    test al, 02h
    jne short L7982f
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L7f284]
    jb near ptr L7e210
L79821::
    and eax, dword ptr [L7f280]
    mov edx, dword ptr [L7f19c]
    jmp short L79871
L7982f::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L7f286]
    jb near ptr L7e21c
L79843::
    and eax, dword ptr [L7f27c]
    mov edx, dword ptr [L7f1a4]
    jmp short L79871
L79851::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L7f285]
    jb near ptr L7e228
L79865::
    and eax, dword ptr [L7f278]
    mov edx, dword ptr [L7f238]
L79871::
    shl eax, 03h
    add edx, eax
    mov ebx, dword ptr [edx-02h]
    mov eax, dword ptr [edx]
    mov bx, ax
    mov dword ptr [edi], ebx
    mov ebx, dword ptr [edx+02h]
    mov ax, bx
    mov dword ptr [edi+04h], eax
    mov eax, dword ptr [edx+04h]
    mov bx, ax
    mov ax, word ptr [edx+06h]
    mov dword ptr [edi+0a00h], ebx
    mov dword ptr [edi+0a04h], eax
    test byte ptr [L7f1b4], 02h
    je near ptr L79f09
L798ac::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb near ptr L7e234
L798b9::
    and eax, 01h
    jne short L798c5
    mov al, byte ptr [L7f240]
    jmp short L798e9
L798c5::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb near ptr L7e240
L798d2::
    and eax, 01h
    mov al, byte ptr [L7f240]
    je short L798de
    inc al
L798de::
    sub al, 02h
    sbb al, 00h
    and al, 03h
    mov byte ptr [L7f240], al
L798e9::
    or al, al
    je short L79935
    test al, 02h
    jne short L79913
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L7f284]
    jb near ptr L7e24c
L79905::
    and eax, dword ptr [L7f280]
    mov edx, dword ptr [L7f19c]
    jmp short L79955
L79913::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L7f286]
    jb near ptr L7e258
L79927::
    and eax, dword ptr [L7f27c]
    mov edx, dword ptr [L7f1a4]
    jmp short L79955
L79935::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L7f285]
    jb near ptr L7e264
L79949::
    and eax, dword ptr [L7f278]
    mov edx, dword ptr [L7f238]
L79955::
    shl eax, 03h
    add edx, eax
    mov ebx, dword ptr [edx-02h]
    mov eax, dword ptr [edx]
    mov bx, ax
    mov dword ptr [edi+08h], ebx
    mov ebx, dword ptr [edx+02h]
    mov ax, bx
    mov dword ptr [edi+0ch], eax
    mov eax, dword ptr [edx+04h]
    mov bx, ax
    mov ax, word ptr [edx+06h]
    mov dword ptr [edi+0a08h], ebx
    mov dword ptr [edi+0a0ch], eax
    test byte ptr [L7f1b4], 010h
    je near ptr L79f16
L79991::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb near ptr L7e270
L7999e::
    and eax, 01h
    jne short L799aa
    mov al, byte ptr [L7f240]
    jmp short L799ce
L799aa::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb near ptr L7e27c
L799b7::
    and eax, 01h
    mov al, byte ptr [L7f240]
    je short L799c3
    inc al
L799c3::
    sub al, 02h
    sbb al, 00h
    and al, 03h
    mov byte ptr [L7f240], al
L799ce::
    or al, al
    je short L79a1a
    test al, 02h
    jne short L799f8
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L7f284]
    jb near ptr L7e288
L799ea::
    and eax, dword ptr [L7f280]
    mov edx, dword ptr [L7f19c]
    jmp short L79a3a
L799f8::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L7f286]
    jb near ptr L7e294
L79a0c::
    and eax, dword ptr [L7f27c]
    mov edx, dword ptr [L7f1a4]
    jmp short L79a3a
L79a1a::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L7f285]
    jb near ptr L7e2a0
L79a2e::
    and eax, dword ptr [L7f278]
    mov edx, dword ptr [L7f238]
L79a3a::
    shl eax, 03h
    add edx, eax
    mov ebx, dword ptr [edx-02h]
    mov eax, dword ptr [edx]
    mov bx, ax
    mov dword ptr [edi+010h], ebx
    mov ebx, dword ptr [edx+02h]
    mov ax, bx
    mov dword ptr [edi+014h], eax
    mov eax, dword ptr [edx+04h]
    mov bx, ax
    mov ax, word ptr [edx+06h]
    mov dword ptr [edi+0a10h], ebx
    mov dword ptr [edi+0a14h], eax
    test byte ptr [L7f1b4], 020h
    je near ptr L79f23
L79a76::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb near ptr L7e2ac
L79a83::
    and eax, 01h
    jne short L79a8f
    mov al, byte ptr [L7f240]
    jmp short L79ab3
L79a8f::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb near ptr L7e2b8
L79a9c::
    and eax, 01h
    mov al, byte ptr [L7f240]
    je short L79aa8
    inc al
L79aa8::
    sub al, 02h
    sbb al, 00h
    and al, 03h
    mov byte ptr [L7f240], al
L79ab3::
    or al, al
    je short L79aff
    test al, 02h
    jne short L79add
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L7f284]
    jb near ptr L7e2c4
L79acf::
    and eax, dword ptr [L7f280]
    mov edx, dword ptr [L7f19c]
    jmp short L79b1f
L79add::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L7f286]
    jb near ptr L7e2d0
L79af1::
    and eax, dword ptr [L7f27c]
    mov edx, dword ptr [L7f1a4]
    jmp short L79b1f
L79aff::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L7f285]
    jb near ptr L7e2dc
L79b13::
    and eax, dword ptr [L7f278]
    mov edx, dword ptr [L7f238]
L79b1f::
    shl eax, 03h
    add edx, eax
    mov ebx, dword ptr [edx-02h]
    mov eax, dword ptr [edx]
    mov bx, ax
    mov dword ptr [edi+018h], ebx
    mov ebx, dword ptr [edx+02h]
    mov ax, bx
    mov dword ptr [edi+01ch], eax
    mov eax, dword ptr [edx+04h]
    mov bx, ax
    mov ax, word ptr [edx+06h]
    mov dword ptr [edi+0a18h], ebx
    mov dword ptr [edi+0a1ch], eax
    test byte ptr [L7f1b4], 04h
    je near ptr L79f30
L79b5b::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb near ptr L7e2e8
L79b68::
    and eax, 01h
    jne short L79b74
    mov al, byte ptr [L7f240]
    jmp short L79b98
L79b74::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb near ptr L7e2f4
L79b81::
    and eax, 01h
    mov al, byte ptr [L7f240]
    je short L79b8d
    inc al
L79b8d::
    sub al, 02h
    sbb al, 00h
    and al, 03h
    mov byte ptr [L7f240], al
L79b98::
    or al, al
    je short L79be4
    test al, 02h
    jne short L79bc2
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L7f284]
    jb near ptr L7e300
L79bb4::
    and eax, dword ptr [L7f280]
    mov edx, dword ptr [L7f19c]
    jmp short L79c04
L79bc2::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L7f286]
    jb near ptr L7e30c
L79bd6::
    and eax, dword ptr [L7f27c]
    mov edx, dword ptr [L7f1a4]
    jmp short L79c04
L79be4::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L7f285]
    jb near ptr L7e318
L79bf8::
    and eax, dword ptr [L7f278]
    mov edx, dword ptr [L7f238]
L79c04::
    shl eax, 03h
    add edx, eax
    mov ebx, dword ptr [edx-02h]
    mov eax, dword ptr [edx]
    mov bx, ax
    mov dword ptr [edi+01400h], ebx
    mov ebx, dword ptr [edx+02h]
    mov ax, bx
    mov dword ptr [edi+01404h], eax
    mov eax, dword ptr [edx+04h]
    mov bx, ax
    mov ax, word ptr [edx+06h]
    mov dword ptr [edi+01e00h], ebx
    mov dword ptr [edi+01e04h], eax
    test byte ptr [L7f1b4], 08h
    je near ptr L79f3d
L79c46::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb near ptr L7e324
L79c53::
    and eax, 01h
    jne short L79c5f
    mov al, byte ptr [L7f240]
    jmp short L79c83
L79c5f::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb near ptr L7e330
L79c6c::
    and eax, 01h
    mov al, byte ptr [L7f240]
    je short L79c78
    inc al
L79c78::
    sub al, 02h
    sbb al, 00h
    and al, 03h
    mov byte ptr [L7f240], al
L79c83::
    or al, al
    je short L79ccf
    test al, 02h
    jne short L79cad
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L7f284]
    jb near ptr L7e33c
L79c9f::
    and eax, dword ptr [L7f280]
    mov edx, dword ptr [L7f19c]
    jmp short L79cef
L79cad::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L7f286]
    jb near ptr L7e348
L79cc1::
    and eax, dword ptr [L7f27c]
    mov edx, dword ptr [L7f1a4]
    jmp short L79cef
L79ccf::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L7f285]
    jb near ptr L7e354
L79ce3::
    and eax, dword ptr [L7f278]
    mov edx, dword ptr [L7f238]
L79cef::
    shl eax, 03h
    add edx, eax
    mov ebx, dword ptr [edx-02h]
    mov eax, dword ptr [edx]
    mov bx, ax
    mov dword ptr [edi+01408h], ebx
    mov ebx, dword ptr [edx+02h]
    mov ax, bx
    mov dword ptr [edi+0140ch], eax
    mov eax, dword ptr [edx+04h]
    mov bx, ax
    mov ax, word ptr [edx+06h]
    mov dword ptr [edi+01e08h], ebx
    mov dword ptr [edi+01e0ch], eax
    test byte ptr [L7f1b4], 040h
    je near ptr L79f4a
L79d31::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb near ptr L7e360
L79d3e::
    and eax, 01h
    jne short L79d4a
    mov al, byte ptr [L7f240]
    jmp short L79d6e
L79d4a::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb near ptr L7e36c
L79d57::
    and eax, 01h
    mov al, byte ptr [L7f240]
    je short L79d63
    inc al
L79d63::
    sub al, 02h
    sbb al, 00h
    and al, 03h
    mov byte ptr [L7f240], al
L79d6e::
    or al, al
    je short L79dba
    test al, 02h
    jne short L79d98
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L7f284]
    jb near ptr L7e378
L79d8a::
    and eax, dword ptr [L7f280]
    mov edx, dword ptr [L7f19c]
    jmp short L79dda
L79d98::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L7f286]
    jb near ptr L7e384
L79dac::
    and eax, dword ptr [L7f27c]
    mov edx, dword ptr [L7f1a4]
    jmp short L79dda
L79dba::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L7f285]
    jb near ptr L7e390
L79dce::
    and eax, dword ptr [L7f278]
    mov edx, dword ptr [L7f238]
L79dda::
    shl eax, 03h
    add edx, eax
    mov ebx, dword ptr [edx-02h]
    mov eax, dword ptr [edx]
    mov bx, ax
    mov dword ptr [edi+01410h], ebx
    mov ebx, dword ptr [edx+02h]
    mov ax, bx
    mov dword ptr [edi+01414h], eax
    mov eax, dword ptr [edx+04h]
    mov bx, ax
    mov ax, word ptr [edx+06h]
    mov dword ptr [edi+01e10h], ebx
    mov dword ptr [edi+01e14h], eax
    test byte ptr [L7f1b4], 080h
    je near ptr L79f57
L79e1c::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb near ptr L7e39c
L79e29::
    and eax, 01h
    jne short L79e35
    mov al, byte ptr [L7f240]
    jmp short L79e59
L79e35::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb near ptr L7e3a8
L79e42::
    and eax, 01h
    mov al, byte ptr [L7f240]
    je short L79e4e
    inc al
L79e4e::
    sub al, 02h
    sbb al, 00h
    and al, 03h
    mov byte ptr [L7f240], al
L79e59::
    or al, al
    je short L79ea5
    test al, 02h
    jne short L79e83
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L7f284]
    jb near ptr L7e3b4
L79e75::
    and eax, dword ptr [L7f280]
    mov edx, dword ptr [L7f19c]
    jmp short L79ec5
L79e83::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L7f286]
    jb near ptr L7e3c0
L79e97::
    and eax, dword ptr [L7f27c]
    mov edx, dword ptr [L7f1a4]
    jmp short L79ec5
L79ea5::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L7f285]
    jb near ptr L7e3cc
L79eb9::
    and eax, dword ptr [L7f278]
    mov edx, dword ptr [L7f238]
L79ec5::
    shl eax, 03h
    add edx, eax
    mov ebx, dword ptr [edx-02h]
    mov eax, dword ptr [edx]
    mov bx, ax
    mov dword ptr [edi+01418h], ebx
    mov ebx, dword ptr [edx+02h]
    mov ax, bx
    mov dword ptr [edi+0141ch], eax
    mov eax, dword ptr [edx+04h]
    mov bx, ax
    mov ax, word ptr [edx+06h]
    mov dword ptr [edi+01e18h], ebx
    mov dword ptr [edi+01e1ch], eax
    jmp short L79f64
L79efc::
    test byte ptr [L7f1b4], 01h
    jne near ptr L797c8
L79f09::
    test byte ptr [L7f1b4], 02h
    jne near ptr L798ac
L79f16::
    test byte ptr [L7f1b4], 010h
    jne near ptr L79991
L79f23::
    test byte ptr [L7f1b4], 020h
    jne near ptr L79a76
L79f30::
    test byte ptr [L7f1b4], 04h
    jne near ptr L79b5b
L79f3d::
    test byte ptr [L7f1b4], 08h
    jne near ptr L79c46
L79f4a::
    test byte ptr [L7f1b4], 040h
    jne near ptr L79d31
L79f57::
    test byte ptr [L7f1b4], 080h
    jne near ptr L79e1c
L79f64::
    test byte ptr [L7f1b5], 0ffh
    je near ptr L7a8b1
    test byte ptr [L7f1b5], 01h
    je near ptr L7a6ce
L79f7e::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb near ptr L7e3d8
L79f8b::
    and eax, 01h
    jne short L79f97
    mov al, byte ptr [L7f240]
    jmp short L79fbb
L79f97::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb near ptr L7e3e4
L79fa4::
    and eax, 01h
    mov al, byte ptr [L7f240]
    je short L79fb0
    inc al
L79fb0::
    sub al, 02h
    sbb al, 00h
    and al, 03h
    mov byte ptr [L7f240], al
L79fbb::
    or al, al
    je short L7a007
    test al, 02h
    jne short L79fe5
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L7f284]
    jb near ptr L7e3f0
L79fd7::
    and eax, dword ptr [L7f280]
    mov edx, dword ptr [L7f19c]
    jmp short L7a027
L79fe5::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L7f286]
    jb near ptr L7e3fc
L79ff9::
    and eax, dword ptr [L7f27c]
    mov edx, dword ptr [L7f1a4]
    jmp short L7a027
L7a007::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L7f285]
    jb near ptr L7e408
L7a01b::
    and eax, dword ptr [L7f278]
    mov edx, dword ptr [L7f238]
L7a027::
    shl eax, 03h
    add edx, eax
    mov ebx, dword ptr [edx-02h]
    mov eax, dword ptr [edx]
    mov bx, ax
    mov dword ptr [edi+02800h], ebx
    mov ebx, dword ptr [edx+02h]
    mov ax, bx
    mov dword ptr [edi+02804h], eax
    mov eax, dword ptr [edx+04h]
    mov bx, ax
    mov ax, word ptr [edx+06h]
    mov dword ptr [edi+03200h], ebx
    mov dword ptr [edi+03204h], eax
    test byte ptr [L7f1b5], 02h
    je near ptr L7a6db
L7a069::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb near ptr L7e414
L7a076::
    and eax, 01h
    jne short L7a082
    mov al, byte ptr [L7f240]
    jmp short L7a0a6
L7a082::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb near ptr L7e420
L7a08f::
    and eax, 01h
    mov al, byte ptr [L7f240]
    je short L7a09b
    inc al
L7a09b::
    sub al, 02h
    sbb al, 00h
    and al, 03h
    mov byte ptr [L7f240], al
L7a0a6::
    or al, al
    je short L7a0f2
    test al, 02h
    jne short L7a0d0
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L7f284]
    jb near ptr L7e42c
L7a0c2::
    and eax, dword ptr [L7f280]
    mov edx, dword ptr [L7f19c]
    jmp short L7a112
L7a0d0::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L7f286]
    jb near ptr L7e438
L7a0e4::
    and eax, dword ptr [L7f27c]
    mov edx, dword ptr [L7f1a4]
    jmp short L7a112
L7a0f2::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L7f285]
    jb near ptr L7e444
L7a106::
    and eax, dword ptr [L7f278]
    mov edx, dword ptr [L7f238]
L7a112::
    shl eax, 03h
    add edx, eax
    mov ebx, dword ptr [edx-02h]
    mov eax, dword ptr [edx]
    mov bx, ax
    mov dword ptr [edi+02808h], ebx
    mov ebx, dword ptr [edx+02h]
    mov ax, bx
    mov dword ptr [edi+0280ch], eax
    mov eax, dword ptr [edx+04h]
    mov bx, ax
    mov ax, word ptr [edx+06h]
    mov dword ptr [edi+03208h], ebx
    mov dword ptr [edi+0320ch], eax
    test byte ptr [L7f1b5], 010h
    je near ptr L7a6e8
L7a154::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb near ptr L7e450
L7a161::
    and eax, 01h
    jne short L7a16d
    mov al, byte ptr [L7f240]
    jmp short L7a191
L7a16d::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb near ptr L7e45c
L7a17a::
    and eax, 01h
    mov al, byte ptr [L7f240]
    je short L7a186
    inc al
L7a186::
    sub al, 02h
    sbb al, 00h
    and al, 03h
    mov byte ptr [L7f240], al
L7a191::
    or al, al
    je short L7a1dd
    test al, 02h
    jne short L7a1bb
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L7f284]
    jb near ptr L7e468
L7a1ad::
    and eax, dword ptr [L7f280]
    mov edx, dword ptr [L7f19c]
    jmp short L7a1fd
L7a1bb::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L7f286]
    jb near ptr L7e474
L7a1cf::
    and eax, dword ptr [L7f27c]
    mov edx, dword ptr [L7f1a4]
    jmp short L7a1fd
L7a1dd::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L7f285]
    jb near ptr L7e480
L7a1f1::
    and eax, dword ptr [L7f278]
    mov edx, dword ptr [L7f238]
L7a1fd::
    shl eax, 03h
    add edx, eax
    mov ebx, dword ptr [edx-02h]
    mov eax, dword ptr [edx]
    mov bx, ax
    mov dword ptr [edi+02810h], ebx
    mov ebx, dword ptr [edx+02h]
    mov ax, bx
    mov dword ptr [edi+02814h], eax
    mov eax, dword ptr [edx+04h]
    mov bx, ax
    mov ax, word ptr [edx+06h]
    mov dword ptr [edi+03210h], ebx
    mov dword ptr [edi+03214h], eax
    test byte ptr [L7f1b5], 020h
    je near ptr L7a6f5
L7a23f::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb near ptr L7e48c
L7a24c::
    and eax, 01h
    jne short L7a258
    mov al, byte ptr [L7f240]
    jmp short L7a27c
L7a258::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb near ptr L7e498
L7a265::
    and eax, 01h
    mov al, byte ptr [L7f240]
    je short L7a271
    inc al
L7a271::
    sub al, 02h
    sbb al, 00h
    and al, 03h
    mov byte ptr [L7f240], al
L7a27c::
    or al, al
    je short L7a2c8
    test al, 02h
    jne short L7a2a6
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L7f284]
    jb near ptr L7e4a4
L7a298::
    and eax, dword ptr [L7f280]
    mov edx, dword ptr [L7f19c]
    jmp short L7a2e8
L7a2a6::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L7f286]
    jb near ptr L7e4b0
L7a2ba::
    and eax, dword ptr [L7f27c]
    mov edx, dword ptr [L7f1a4]
    jmp short L7a2e8
L7a2c8::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L7f285]
    jb near ptr L7e4bc
L7a2dc::
    and eax, dword ptr [L7f278]
    mov edx, dword ptr [L7f238]
L7a2e8::
    shl eax, 03h
    add edx, eax
    mov ebx, dword ptr [edx-02h]
    mov eax, dword ptr [edx]
    mov bx, ax
    mov dword ptr [edi+02818h], ebx
    mov ebx, dword ptr [edx+02h]
    mov ax, bx
    mov dword ptr [edi+0281ch], eax
    mov eax, dword ptr [edx+04h]
    mov bx, ax
    mov ax, word ptr [edx+06h]
    mov dword ptr [edi+03218h], ebx
    mov dword ptr [edi+0321ch], eax
    test byte ptr [L7f1b5], 04h
    je near ptr L7a702
L7a32a::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb near ptr L7e4c8
L7a337::
    and eax, 01h
    jne short L7a343
    mov al, byte ptr [L7f240]
    jmp short L7a367
L7a343::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb near ptr L7e4d4
L7a350::
    and eax, 01h
    mov al, byte ptr [L7f240]
    je short L7a35c
    inc al
L7a35c::
    sub al, 02h
    sbb al, 00h
    and al, 03h
    mov byte ptr [L7f240], al
L7a367::
    or al, al
    je short L7a3b3
    test al, 02h
    jne short L7a391
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L7f284]
    jb near ptr L7e4e0
L7a383::
    and eax, dword ptr [L7f280]
    mov edx, dword ptr [L7f19c]
    jmp short L7a3d3
L7a391::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L7f286]
    jb near ptr L7e4ec
L7a3a5::
    and eax, dword ptr [L7f27c]
    mov edx, dword ptr [L7f1a4]
    jmp short L7a3d3
L7a3b3::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L7f285]
    jb near ptr L7e4f8
L7a3c7::
    and eax, dword ptr [L7f278]
    mov edx, dword ptr [L7f238]
L7a3d3::
    shl eax, 03h
    add edx, eax
    mov ebx, dword ptr [edx-02h]
    mov eax, dword ptr [edx]
    mov bx, ax
    mov dword ptr [edi+03c00h], ebx
    mov ebx, dword ptr [edx+02h]
    mov ax, bx
    mov dword ptr [edi+03c04h], eax
    mov eax, dword ptr [edx+04h]
    mov bx, ax
    mov ax, word ptr [edx+06h]
    mov dword ptr [edi+04600h], ebx
    mov dword ptr [edi+04604h], eax
    test byte ptr [L7f1b5], 08h
    je near ptr L7a70f
L7a415::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb near ptr L7e504
L7a422::
    and eax, 01h
    jne short L7a42e
    mov al, byte ptr [L7f240]
    jmp short L7a452
L7a42e::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb near ptr L7e510
L7a43b::
    and eax, 01h
    mov al, byte ptr [L7f240]
    je short L7a447
    inc al
L7a447::
    sub al, 02h
    sbb al, 00h
    and al, 03h
    mov byte ptr [L7f240], al
L7a452::
    or al, al
    je short L7a49e
    test al, 02h
    jne short L7a47c
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L7f284]
    jb near ptr L7e51c
L7a46e::
    and eax, dword ptr [L7f280]
    mov edx, dword ptr [L7f19c]
    jmp short L7a4be
L7a47c::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L7f286]
    jb near ptr L7e528
L7a490::
    and eax, dword ptr [L7f27c]
    mov edx, dword ptr [L7f1a4]
    jmp short L7a4be
L7a49e::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L7f285]
    jb near ptr L7e534
L7a4b2::
    and eax, dword ptr [L7f278]
    mov edx, dword ptr [L7f238]
L7a4be::
    shl eax, 03h
    add edx, eax
    mov ebx, dword ptr [edx-02h]
    mov eax, dword ptr [edx]
    mov bx, ax
    mov dword ptr [edi+03c08h], ebx
    mov ebx, dword ptr [edx+02h]
    mov ax, bx
    mov dword ptr [edi+03c0ch], eax
    mov eax, dword ptr [edx+04h]
    mov bx, ax
    mov ax, word ptr [edx+06h]
    mov dword ptr [edi+04608h], ebx
    mov dword ptr [edi+0460ch], eax
    test byte ptr [L7f1b5], 040h
    je near ptr L7a71c
L7a500::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb near ptr L7e540
L7a50d::
    and eax, 01h
    jne short L7a519
    mov al, byte ptr [L7f240]
    jmp short L7a53d
L7a519::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb near ptr L7e54c
L7a526::
    and eax, 01h
    mov al, byte ptr [L7f240]
    je short L7a532
    inc al
L7a532::
    sub al, 02h
    sbb al, 00h
    and al, 03h
    mov byte ptr [L7f240], al
L7a53d::
    or al, al
    je short L7a589
    test al, 02h
    jne short L7a567
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L7f284]
    jb near ptr L7e558
L7a559::
    and eax, dword ptr [L7f280]
    mov edx, dword ptr [L7f19c]
    jmp short L7a5a9
L7a567::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L7f286]
    jb near ptr L7e564
L7a57b::
    and eax, dword ptr [L7f27c]
    mov edx, dword ptr [L7f1a4]
    jmp short L7a5a9
L7a589::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L7f285]
    jb near ptr L7e570
L7a59d::
    and eax, dword ptr [L7f278]
    mov edx, dword ptr [L7f238]
L7a5a9::
    shl eax, 03h
    add edx, eax
    mov ebx, dword ptr [edx-02h]
    mov eax, dword ptr [edx]
    mov bx, ax
    mov dword ptr [edi+03c10h], ebx
    mov ebx, dword ptr [edx+02h]
    mov ax, bx
    mov dword ptr [edi+03c14h], eax
    mov eax, dword ptr [edx+04h]
    mov bx, ax
    mov ax, word ptr [edx+06h]
    mov dword ptr [edi+04610h], ebx
    mov dword ptr [edi+04614h], eax
    test byte ptr [L7f1b5], 080h
    je near ptr L7a729
L7a5eb::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb near ptr L7e57c
L7a5f8::
    and eax, 01h
    jne short L7a604
    mov al, byte ptr [L7f240]
    jmp short L7a628
L7a604::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb near ptr L7e588
L7a611::
    and eax, 01h
    mov al, byte ptr [L7f240]
    je short L7a61d
    inc al
L7a61d::
    sub al, 02h
    sbb al, 00h
    and al, 03h
    mov byte ptr [L7f240], al
L7a628::
    or al, al
    je short L7a674
    test al, 02h
    jne short L7a652
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L7f284]
    jb near ptr L7e594
L7a644::
    and eax, dword ptr [L7f280]
    mov edx, dword ptr [L7f19c]
    jmp short L7a694
L7a652::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L7f286]
    jb near ptr L7e5a0
L7a666::
    and eax, dword ptr [L7f27c]
    mov edx, dword ptr [L7f1a4]
    jmp short L7a694
L7a674::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L7f285]
    jb near ptr L7e5ac
L7a688::
    and eax, dword ptr [L7f278]
    mov edx, dword ptr [L7f238]
L7a694::
    shl eax, 03h
    add edx, eax
    mov ebx, dword ptr [edx-02h]
    mov eax, dword ptr [edx]
    mov bx, ax
    mov dword ptr [edi+03c18h], ebx
    mov ebx, dword ptr [edx+02h]
    mov ax, bx
    mov dword ptr [edi+03c1ch], eax
    mov eax, dword ptr [edx+04h]
    mov bx, ax
    mov ax, word ptr [edx+06h]
    mov dword ptr [edi+04618h], ebx
    mov dword ptr [edi+0461ch], eax
    jmp near ptr L7a8b1
L7a6ce::
    test byte ptr [L7f1b5], 01h
    jne near ptr L79f7e
L7a6db::
    test byte ptr [L7f1b5], 02h
    jne near ptr L7a069
L7a6e8::
    test byte ptr [L7f1b5], 010h
    jne near ptr L7a154
L7a6f5::
    test byte ptr [L7f1b5], 020h
    jne near ptr L7a23f
L7a702::
    test byte ptr [L7f1b5], 04h
    jne near ptr L7a32a
L7a70f::
    test byte ptr [L7f1b5], 08h
    jne near ptr L7a415
L7a71c::
    test byte ptr [L7f1b5], 040h
    jne near ptr L7a500
L7a729::
    test byte ptr [L7f1b5], 080h
    jne near ptr L7a5eb
    jmp near ptr L7a8b1
L7a73b::
    test dword ptr [L7f244], 010000h
    jne near ptr L7a89c
    jmp near ptr L7a8b1
L7a750::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb near ptr L7e5b8
L7a75d::
    and eax, 01h
    jne short L7a769
    mov al, byte ptr [L7f240]
    jmp short L7a78d
L7a769::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb near ptr L7e5c4
L7a776::
    and eax, 01h
    mov al, byte ptr [L7f240]
    je short L7a782
    inc al
L7a782::
    sub al, 02h
    sbb al, 00h
    and al, 03h
    mov byte ptr [L7f240], al
L7a78d::
    or al, al
    je near ptr L7a820
    test al, 02h
    jne short L7a7bb
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L7f284]
    jb near ptr L7e5d0
L7a7ad::
    and eax, dword ptr [L7f280]
    mov edx, dword ptr [L7f19c]
    jmp short L7a7db
L7a7bb::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L7f286]
    jb near ptr L7e5dc
L7a7cf::
    and eax, dword ptr [L7f27c]
    mov edx, dword ptr [L7f1a4]
L7a7db::
    shl eax, 03h
    add edx, eax
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 04h
    jb near ptr L7e5e8
L7a7f1::
    and eax, 0fh
    mov ebx, dword ptr [edx-02h]
    mov dword ptr [L7f18c], ecx
    mov ecx, dword ptr [edx]
    mov bx, cx
    mov dword ptr [L7f190], ebp
    mov dword ptr [L7f188], esi
    mov esi, dword ptr [edx+02h]
    mov cx, si
    mov ebp, dword ptr [edx+04h]
    mov si, bp
    mov bp, word ptr [edx+06h]
    jmp short L7a883
L7a820::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L7f285]
    jb near ptr L7e5f4
L7a834::
    and eax, dword ptr [L7f278]
    mov edx, dword ptr [L7f238]
    shl eax, 03h
    add edx, eax
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 04h
    jb near ptr L7e600
L7a856::
    and eax, 0fh
    mov ebx, dword ptr [edx-02h]
    mov dword ptr [L7f18c], ecx
    mov ecx, dword ptr [edx]
    mov bx, cx
    mov dword ptr [L7f190], ebp
    mov dword ptr [L7f188], esi
    mov esi, dword ptr [edx+02h]
    mov cx, si
    mov ebp, dword ptr [edx+04h]
    mov si, bp
    mov bp, word ptr [edx+06h]
L7a883::
    call dword ptr [eax*4+L78d47]
    mov esi, dword ptr [L7f188]
    mov ecx, dword ptr [L7f18c]
    mov ebp, dword ptr [L7f190]
L7a89c::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb near ptr L7e60c
L7a8a9::
    test al, 01h
    je near ptr L7a750
L7a8b1::
    mov edx, 01h
    mov edi, dword ptr [L7f198]
    jmp near ptr L79054
L7a8c1::
    mov dword ptr [L7f198], edi
    lea edi, [L7f288]
    jmp near ptr L79162
L7a8d2::
    cmp bx, word ptr [L7f17c]
    jne near ptr L7dec0
L7a8df::
    cmp dword ptr [L7f248], 00h
    jne short L7a924
    mov eax, dword ptr [L7f260]
    mov dword ptr [L7f248], eax
    mov eax, dword ptr [L7f264]
    mov dword ptr [L7f24c], eax
    mov eax, dword ptr [L7f268]
    mov dword ptr [L7f250], eax
    mov al, byte ptr [L7f274]
    mov byte ptr [L7f25c], al
    mov eax, dword ptr [L7f270]
    mov dword ptr [L7f258], eax
    mov eax, dword ptr [L7f26c]
    mov dword ptr [L7f254], eax
L7a924::
    mov dword ptr [L7f198], edi
    and edi, 0ffffh
    or edi, dword ptr [L7f1a8]
    mov dword ptr [L7f1b4], 00h
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb near ptr L7e618
L7a94d::
    test al, 01h
    jne near ptr L7ae04
L7a955::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb near ptr L7e624
L7a962::
    and eax, 01h
    jne short L7a96e
    mov al, byte ptr [L7f240]
    jmp short L7a992
L7a96e::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb near ptr L7e630
L7a97b::
    and eax, 01h
    mov al, byte ptr [L7f240]
    je short L7a987
    inc al
L7a987::
    sub al, 02h
    sbb al, 00h
    and al, 03h
    mov byte ptr [L7f240], al
L7a992::
    or al, al
    je near ptr L7aa29
    test al, 02h
    jne short L7a9c0
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L7f284]
    jb near ptr L7e63c
L7a9b2::
    and eax, dword ptr [L7f280]
    mov edx, dword ptr [L7f19c]
    jmp short L7a9e0
L7a9c0::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L7f286]
    jb near ptr L7e648
L7a9d4::
    and eax, dword ptr [L7f27c]
    mov edx, dword ptr [L7f1a4]
L7a9e0::
    shl eax, 03h
    add edx, eax
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 011h
    jae short L7a9f8
    add esi, 04h
    or cl, 0e0h
L7a9f8::
    and eax, 01ffffh
    mov ebx, dword ptr [edx-02h]
    mov dword ptr [L7f18c], ecx
    mov ecx, dword ptr [edx]
    mov bx, cx
    mov dword ptr [L7f190], ebp
    mov dword ptr [L7f188], esi
    mov esi, dword ptr [edx+02h]
    mov cx, si
    mov ebp, dword ptr [edx+04h]
    mov si, bp
    mov bp, word ptr [edx+06h]
    jmp short L7aa90
L7aa29::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L7f285]
    jb near ptr L7e654
L7aa3d::
    and eax, dword ptr [L7f278]
    mov edx, dword ptr [L7f238]
    shl eax, 03h
    add edx, eax
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 011h
    jae short L7aa61
    add esi, 04h
    or cl, 0e0h
L7aa61::
    and eax, 01ffffh
    mov ebx, dword ptr [edx-02h]
    mov dword ptr [L7f18c], ecx
    mov ecx, dword ptr [edx]
    mov bx, cx
    mov dword ptr [L7f190], ebp
    mov dword ptr [L7f188], esi
    mov esi, dword ptr [edx+02h]
    mov cx, si
    mov ebp, dword ptr [edx+04h]
    mov si, bp
    mov bp, word ptr [edx+06h]
L7aa90::
    or dword ptr [L7f1b4], eax
    test al, al
    je near ptr L7ac25
    test al, 01h
    je near ptr L7abe9
L7aaa6::
    mov dword ptr [edi], ebx
    mov dword ptr [edi+04h], ecx
    cmp di, 0f600h
    jae short L7aabe
    mov dword ptr [edi+0a00h], esi
    mov dword ptr [edi+0a04h], ebp
L7aabe::
    test al, 02h
    je near ptr L7abf1
L7aac6::
    cmp di, 0fff8h
    jae short L7aae5
    mov dword ptr [edi+08h], ebx
    mov dword ptr [edi+0ch], ecx
    cmp di, 0f5f8h
    jae short L7aae5
    mov dword ptr [edi+0a08h], esi
    mov dword ptr [edi+0a0ch], ebp
L7aae5::
    test al, 010h
    je near ptr L7abf9
L7aaed::
    cmp di, 0fff0h
    jae short L7ab0c
    mov dword ptr [edi+010h], ebx
    mov dword ptr [edi+014h], ecx
    cmp di, 0f5f0h
    jae short L7ab0c
    mov dword ptr [edi+0a10h], esi
    mov dword ptr [edi+0a14h], ebp
L7ab0c::
    test al, 020h
    je near ptr L7ac01
L7ab14::
    cmp di, 0ffe8h
    jae short L7ab33
    mov dword ptr [edi+018h], ebx
    mov dword ptr [edi+01ch], ecx
    cmp di, 0f5e8h
    jae short L7ab33
    mov dword ptr [edi+0a18h], esi
    mov dword ptr [edi+0a1ch], ebp
L7ab33::
    test al, 04h
    je near ptr L7ac09
L7ab3b::
    cmp di, 0ec00h
    jae short L7ab61
    mov dword ptr [edi+01400h], ebx
    mov dword ptr [edi+01404h], ecx
    cmp di, 0e200h
    jae short L7ab61
    mov dword ptr [edi+01e00h], esi
    mov dword ptr [edi+01e04h], ebp
L7ab61::
    test al, 08h
    je near ptr L7ac11
L7ab69::
    cmp di, 0ebf8h
    jae short L7ab8f
    mov dword ptr [edi+01408h], ebx
    mov dword ptr [edi+0140ch], ecx
    cmp di, 0e1f8h
    jae short L7ab8f
    mov dword ptr [edi+01e08h], esi
    mov dword ptr [edi+01e0ch], ebp
L7ab8f::
    test al, 040h
    je near ptr L7ac19
L7ab97::
    cmp di, 0ebf0h
    jae short L7abbd
    mov dword ptr [edi+01410h], ebx
    mov dword ptr [edi+01414h], ecx
    cmp di, 0e1f0h
    jae short L7abbd
    mov dword ptr [edi+01e10h], esi
    mov dword ptr [edi+01e14h], ebp
L7abbd::
    test al, 080h
    je short L7ac21
L7abc1::
    cmp di, 0ebe8h
    jae short L7abe7
    mov dword ptr [edi+01418h], ebx
    mov dword ptr [edi+0141ch], ecx
    cmp di, 0e1e8h
    jae short L7abe7
    mov dword ptr [edi+01e18h], esi
    mov dword ptr [edi+01e1ch], ebp
L7abe7::
    jmp short L7ac25
L7abe9::
    test al, 01h
    jne near ptr L7aaa6
L7abf1::
    test al, 02h
    jne near ptr L7aac6
L7abf9::
    test al, 010h
    jne near ptr L7aaed
L7ac01::
    test al, 020h
    jne near ptr L7ab14
L7ac09::
    test al, 04h
    jne near ptr L7ab3b
L7ac11::
    test al, 08h
    jne near ptr L7ab69
L7ac19::
    test al, 040h
    jne near ptr L7ab97
L7ac21::
    test al, 080h
    jne short L7abc1
L7ac25::
    test ah, ah
    je near ptr L7ade7
    test ah, 01h
    je near ptr L7ada3
L7ac36::
    cmp di, 0d800h
    jae short L7ac5c
    mov dword ptr [edi+02800h], ebx
    mov dword ptr [edi+02804h], ecx
    cmp di, 0ce00h
    jae short L7ac5c
    mov dword ptr [edi+03200h], esi
    mov dword ptr [edi+03204h], ebp
L7ac5c::
    test ah, 02h
    je near ptr L7adac
L7ac65::
    cmp di, 0d7f8h
    jae short L7ac8b
    mov dword ptr [edi+02808h], ebx
    mov dword ptr [edi+0280ch], ecx
    cmp di, 0cdf8h
    jae short L7ac8b
    mov dword ptr [edi+03208h], esi
    mov dword ptr [edi+0320ch], ebp
L7ac8b::
    test ah, 010h
    je near ptr L7adb5
L7ac94::
    cmp di, 0d7f0h
    jae short L7acba
    mov dword ptr [edi+02810h], ebx
    mov dword ptr [edi+02814h], ecx
    cmp di, 0cdf0h
    jae short L7acba
    mov dword ptr [edi+03210h], esi
    mov dword ptr [edi+03214h], ebp
L7acba::
    test ah, 020h
    je near ptr L7adbe
L7acc3::
    cmp di, 0d7e8h
    jae short L7ace9
    mov dword ptr [edi+02818h], ebx
    mov dword ptr [edi+0281ch], ecx
    cmp di, 0cde8h
    jae short L7ace9
    mov dword ptr [edi+03218h], esi
    mov dword ptr [edi+0321ch], ebp
L7ace9::
    test ah, 04h
    je near ptr L7adc7
L7acf2::
    cmp di, 0c400h
    jae short L7ad18
    mov dword ptr [edi+03c00h], ebx
    mov dword ptr [edi+03c04h], ecx
    cmp di, 0ba00h
    jae short L7ad18
    mov dword ptr [edi+04600h], esi
    mov dword ptr [edi+04604h], ebp
L7ad18::
    test ah, 08h
    je near ptr L7add0
L7ad21::
    cmp di, 0c3f8h
    jae short L7ad47
    mov dword ptr [edi+03c08h], ebx
    mov dword ptr [edi+03c0ch], ecx
    cmp di, 0b9f8h
    jae short L7ad47
    mov dword ptr [edi+04608h], esi
    mov dword ptr [edi+0460ch], ebp
L7ad47::
    test ah, 040h
    je near ptr L7add9
L7ad50::
    cmp di, 0c3f0h
    jae short L7ad76
    mov dword ptr [edi+03c10h], ebx
    mov dword ptr [edi+03c14h], ecx
    cmp di, 0b9f0h
    jae short L7ad76
    mov dword ptr [edi+04610h], esi
    mov dword ptr [edi+04614h], ebp
L7ad76::
    test ah, 080h
    je short L7ade2
L7ad7b::
    cmp di, 0c3e8h
    jae short L7ada1
    mov dword ptr [edi+03c18h], ebx
    mov dword ptr [edi+03c1ch], ecx
    cmp di, 0b9e8h
    jae short L7ada1
    mov dword ptr [edi+04618h], esi
    mov dword ptr [edi+0461ch], ebp
L7ada1::
    jmp short L7ade7
L7ada3::
    test ah, 01h
    jne near ptr L7ac36
L7adac::
    test ah, 02h
    jne near ptr L7ac65
L7adb5::
    test ah, 010h
    jne near ptr L7ac94
L7adbe::
    test ah, 020h
    jne near ptr L7acc3
L7adc7::
    test ah, 04h
    jne near ptr L7acf2
L7add0::
    test ah, 08h
    jne near ptr L7ad21
L7add9::
    test ah, 040h
    jne near ptr L7ad50
L7ade2::
    test ah, 080h
    jne short L7ad7b
L7ade7::
    mov esi, dword ptr [L7f188]
    mov ecx, dword ptr [L7f18c]
    mov ebp, dword ptr [L7f190]
    and eax, 010000h
    je near ptr L7a955
L7ae04::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb near ptr L7e660
L7ae11::
    test al, 01h
    jne near ptr L7c0d3
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 04h
    jb near ptr L7e66c
L7ae2a::
    and eax, 0fh
    jmp dword ptr [eax*4+L7ae34]
Func795b2_ endp
L7ae34 label byte
    dd offset Func7ae74_
    dd offset L7ae92
    dd offset L7aeb3
    dd offset L7aed7
    dd offset L7aef7
    dd offset L7af19
    dd offset L7af40
    dd offset L7af63
    dd offset L7af87
    dd offset L7afa6
    dd offset L7afca
    dd offset L7aff0
    dd offset L7b010
    dd offset L7b02b
    dd offset L7b04c
    dd offset L7b06a
Func7ae74_ proc near
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 010h
    jae short L7ae87
    add esi, 04h
    or cl, 0e0h
L7ae87::
    xor dword ptr [L7f1b4], eax
    jmp near ptr L7b070
L7ae92::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 0ch
    jb near ptr L7e678
L7aea3::
    shl eax, 04h
    or al, 0fh
    xor dword ptr [L7f1b4], eax
    jmp near ptr L7b070
L7aeb3::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 0ch
    jb near ptr L7e684
L7aec4::
    shl eax, 04h
    shr al, 04h
    or al, 0f0h
    xor dword ptr [L7f1b4], eax
    jmp near ptr L7b070
L7aed7::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 08h
    jb near ptr L7e690
L7aee8::
    mov ah, al
    mov al, 0ffh
    xor dword ptr [L7f1b4], eax
    jmp near ptr L7b070
L7aef7::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 0ch
    jb near ptr L7e69c
L7af08::
    shl ah, 04h
    or ah, 0fh
    xor dword ptr [L7f1b4], eax
    jmp near ptr L7b070
L7af19::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 08h
    jb near ptr L7e6a8
L7af2a::
    shl eax, 04h
    shl ah, 04h
    or eax, 0f0fh
    xor dword ptr [L7f1b4], eax
    jmp near ptr L7b070
L7af40::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 08h
    jb near ptr L7e6b4
L7af51::
    mov ah, al
    or eax, 0ff0h
    xor dword ptr [L7f1b4], eax
    jmp near ptr L7b070
L7af63::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 04h
    jb near ptr L7e6c0
L7af74::
    shl eax, 0ch
    or eax, 0fffh
    xor dword ptr [L7f1b4], eax
    jmp near ptr L7b070
L7af87::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 0ch
    jb near ptr L7e6cc
L7af98::
    or ah, 0f0h
    xor dword ptr [L7f1b4], eax
    jmp near ptr L7b070
L7afa6::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 08h
    jb near ptr L7e6d8
L7afb7::
    shl eax, 04h
    or eax, 0f00fh
    xor dword ptr [L7f1b4], eax
    jmp near ptr L7b070
L7afca::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 08h
    jb near ptr L7e6e4
L7afdb::
    mov ah, al
    ror ah, 04h
    or eax, 0f0f0h
    xor dword ptr [L7f1b4], eax
    jmp near ptr L7b070
L7aff0::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 04h
    jb near ptr L7e6f0
L7b001::
    mov ah, al
    or eax, 0f0ffh
    xor dword ptr [L7f1b4], eax
    jmp short L7b070
L7b010::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 08h
    jb near ptr L7e6fc
L7b021::
    mov ah, 0ffh
    xor dword ptr [L7f1b4], eax
    jmp short L7b070
L7b02b::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 04h
    jb near ptr L7e708
L7b03c::
    or eax, 0fff0h
    rol al, 04h
    xor dword ptr [L7f1b4], eax
    jmp short L7b070
L7b04c::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 04h
    jb near ptr L7e714
L7b05d::
    or eax, 0fff0h
    xor dword ptr [L7f1b4], eax
    jmp short L7b070
L7b06a::
    not dword ptr [L7f1b4]
L7b070::
    test byte ptr [L7f1b4], 0ffh
    je near ptr L7b88c
    test byte ptr [L7f1b4], 01h
    je near ptr L7b824
L7b08a::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb near ptr L7e720
L7b097::
    and eax, 01h
    jne short L7b0a3
    mov al, byte ptr [L7f240]
    jmp short L7b0c7
L7b0a3::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb near ptr L7e72c
L7b0b0::
    and eax, 01h
    mov al, byte ptr [L7f240]
    je short L7b0bc
    inc al
L7b0bc::
    sub al, 02h
    sbb al, 00h
    and al, 03h
    mov byte ptr [L7f240], al
L7b0c7::
    or al, al
    je short L7b113
    test al, 02h
    jne short L7b0f1
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L7f284]
    jb near ptr L7e738
L7b0e3::
    and eax, dword ptr [L7f280]
    mov edx, dword ptr [L7f19c]
    jmp short L7b133
L7b0f1::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L7f286]
    jb near ptr L7e744
L7b105::
    and eax, dword ptr [L7f27c]
    mov edx, dword ptr [L7f1a4]
    jmp short L7b133
L7b113::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L7f285]
    jb near ptr L7e750
L7b127::
    and eax, dword ptr [L7f278]
    mov edx, dword ptr [L7f238]
L7b133::
    shl eax, 03h
    add edx, eax
    mov ebx, dword ptr [edx-02h]
    mov eax, dword ptr [edx]
    mov bx, ax
    mov dword ptr [edi], ebx
    mov ebx, dword ptr [edx+02h]
    mov ax, bx
    cmp di, 0f600h
    mov dword ptr [edi+04h], eax
    jae short L7b168
    mov eax, dword ptr [edx+04h]
    mov bx, ax
    mov ax, word ptr [edx+06h]
    mov dword ptr [edi+0a00h], ebx
    mov dword ptr [edi+0a04h], eax
L7b168::
    test byte ptr [L7f1b4], 02h
    je near ptr L7b831
L7b175::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb near ptr L7e75c
L7b182::
    and eax, 01h
    jne short L7b18e
    mov al, byte ptr [L7f240]
    jmp short L7b1b2
L7b18e::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb near ptr L7e768
L7b19b::
    and eax, 01h
    mov al, byte ptr [L7f240]
    je short L7b1a7
    inc al
L7b1a7::
    sub al, 02h
    sbb al, 00h
    and al, 03h
    mov byte ptr [L7f240], al
L7b1b2::
    or al, al
    je short L7b1fe
    test al, 02h
    jne short L7b1dc
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L7f284]
    jb near ptr L7e774
L7b1ce::
    and eax, dword ptr [L7f280]
    mov edx, dword ptr [L7f19c]
    jmp short L7b21e
L7b1dc::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L7f286]
    jb near ptr L7e780
L7b1f0::
    and eax, dword ptr [L7f27c]
    mov edx, dword ptr [L7f1a4]
    jmp short L7b21e
L7b1fe::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L7f285]
    jb near ptr L7e78c
L7b212::
    and eax, dword ptr [L7f278]
    mov edx, dword ptr [L7f238]
L7b21e::
    shl eax, 03h
    add edx, eax
    cmp di, 0fff8h
    jae short L7b25a
    mov ebx, dword ptr [edx-02h]
    mov eax, dword ptr [edx]
    mov bx, ax
    mov dword ptr [edi+08h], ebx
    mov ebx, dword ptr [edx+02h]
    mov ax, bx
    cmp di, 0f5f8h
    mov dword ptr [edi+0ch], eax
    jae short L7b25a
    mov eax, dword ptr [edx+04h]
    mov bx, ax
    mov ax, word ptr [edx+06h]
    mov dword ptr [edi+0a08h], ebx
    mov dword ptr [edi+0a0ch], eax
L7b25a::
    test byte ptr [L7f1b4], 010h
    je near ptr L7b83e
L7b267::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb near ptr L7e798
L7b274::
    and eax, 01h
    jne short L7b280
    mov al, byte ptr [L7f240]
    jmp short L7b2a4
L7b280::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb near ptr L7e7a4
L7b28d::
    and eax, 01h
    mov al, byte ptr [L7f240]
    je short L7b299
    inc al
L7b299::
    sub al, 02h
    sbb al, 00h
    and al, 03h
    mov byte ptr [L7f240], al
L7b2a4::
    or al, al
    je short L7b2f0
    test al, 02h
    jne short L7b2ce
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L7f284]
    jb near ptr L7e7b0
L7b2c0::
    and eax, dword ptr [L7f280]
    mov edx, dword ptr [L7f19c]
    jmp short L7b310
L7b2ce::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L7f286]
    jb near ptr L7e7bc
L7b2e2::
    and eax, dword ptr [L7f27c]
    mov edx, dword ptr [L7f1a4]
    jmp short L7b310
L7b2f0::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L7f285]
    jb near ptr L7e7c8
L7b304::
    and eax, dword ptr [L7f278]
    mov edx, dword ptr [L7f238]
L7b310::
    shl eax, 03h
    add edx, eax
    cmp di, 0fff0h
    jae short L7b34c
    mov ebx, dword ptr [edx-02h]
    mov eax, dword ptr [edx]
    mov bx, ax
    mov dword ptr [edi+010h], ebx
    mov ebx, dword ptr [edx+02h]
    mov ax, bx
    cmp di, 0f5f0h
    mov dword ptr [edi+014h], eax
    jae short L7b34c
    mov eax, dword ptr [edx+04h]
    mov bx, ax
    mov ax, word ptr [edx+06h]
    mov dword ptr [edi+0a10h], ebx
    mov dword ptr [edi+0a14h], eax
L7b34c::
    test byte ptr [L7f1b4], 020h
    je near ptr L7b84b
L7b359::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb near ptr L7e7d4
L7b366::
    and eax, 01h
    jne short L7b372
    mov al, byte ptr [L7f240]
    jmp short L7b396
L7b372::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb near ptr L7e7e0
L7b37f::
    and eax, 01h
    mov al, byte ptr [L7f240]
    je short L7b38b
    inc al
L7b38b::
    sub al, 02h
    sbb al, 00h
    and al, 03h
    mov byte ptr [L7f240], al
L7b396::
    or al, al
    je short L7b3e2
    test al, 02h
    jne short L7b3c0
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L7f284]
    jb near ptr L7e7ec
L7b3b2::
    and eax, dword ptr [L7f280]
    mov edx, dword ptr [L7f19c]
    jmp short L7b402
L7b3c0::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L7f286]
    jb near ptr L7e7f8
L7b3d4::
    and eax, dword ptr [L7f27c]
    mov edx, dword ptr [L7f1a4]
    jmp short L7b402
L7b3e2::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L7f285]
    jb near ptr L7e804
L7b3f6::
    and eax, dword ptr [L7f278]
    mov edx, dword ptr [L7f238]
L7b402::
    shl eax, 03h
    add edx, eax
    cmp di, 0ffe8h
    jae short L7b43e
    mov ebx, dword ptr [edx-02h]
    mov eax, dword ptr [edx]
    mov bx, ax
    mov dword ptr [edi+018h], ebx
    mov ebx, dword ptr [edx+02h]
    mov ax, bx
    cmp di, 0f5e8h
    mov dword ptr [edi+01ch], eax
    jae short L7b43e
    mov eax, dword ptr [edx+04h]
    mov bx, ax
    mov ax, word ptr [edx+06h]
    mov dword ptr [edi+0a18h], ebx
    mov dword ptr [edi+0a1ch], eax
L7b43e::
    test byte ptr [L7f1b4], 04h
    je near ptr L7b858
L7b44b::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb near ptr L7e810
L7b458::
    and eax, 01h
    jne short L7b464
    mov al, byte ptr [L7f240]
    jmp short L7b488
L7b464::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb near ptr L7e81c
L7b471::
    and eax, 01h
    mov al, byte ptr [L7f240]
    je short L7b47d
    inc al
L7b47d::
    sub al, 02h
    sbb al, 00h
    and al, 03h
    mov byte ptr [L7f240], al
L7b488::
    or al, al
    je short L7b4d4
    test al, 02h
    jne short L7b4b2
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L7f284]
    jb near ptr L7e828
L7b4a4::
    and eax, dword ptr [L7f280]
    mov edx, dword ptr [L7f19c]
    jmp short L7b4f4
L7b4b2::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L7f286]
    jb near ptr L7e834
L7b4c6::
    and eax, dword ptr [L7f27c]
    mov edx, dword ptr [L7f1a4]
    jmp short L7b4f4
L7b4d4::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L7f285]
    jb near ptr L7e840
L7b4e8::
    and eax, dword ptr [L7f278]
    mov edx, dword ptr [L7f238]
L7b4f4::
    shl eax, 03h
    add edx, eax
    cmp di, 0ec00h
    jae short L7b537
    mov ebx, dword ptr [edx-02h]
    mov eax, dword ptr [edx]
    mov bx, ax
    mov dword ptr [edi+01400h], ebx
    mov ebx, dword ptr [edx+02h]
    mov ax, bx
    cmp di, 0e200h
    mov dword ptr [edi+01404h], eax
    jae short L7b537
    mov eax, dword ptr [edx+04h]
    mov bx, ax
    mov ax, word ptr [edx+06h]
    mov dword ptr [edi+01e00h], ebx
    mov dword ptr [edi+01e04h], eax
L7b537::
    test byte ptr [L7f1b4], 08h
    je near ptr L7b865
L7b544::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb near ptr L7e84c
L7b551::
    and eax, 01h
    jne short L7b55d
    mov al, byte ptr [L7f240]
    jmp short L7b581
L7b55d::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb near ptr L7e858
L7b56a::
    and eax, 01h
    mov al, byte ptr [L7f240]
    je short L7b576
    inc al
L7b576::
    sub al, 02h
    sbb al, 00h
    and al, 03h
    mov byte ptr [L7f240], al
L7b581::
    or al, al
    je short L7b5cd
    test al, 02h
    jne short L7b5ab
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L7f284]
    jb near ptr L7e864
L7b59d::
    and eax, dword ptr [L7f280]
    mov edx, dword ptr [L7f19c]
    jmp short L7b5ed
L7b5ab::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L7f286]
    jb near ptr L7e870
L7b5bf::
    and eax, dword ptr [L7f27c]
    mov edx, dword ptr [L7f1a4]
    jmp short L7b5ed
L7b5cd::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L7f285]
    jb near ptr L7e87c
L7b5e1::
    and eax, dword ptr [L7f278]
    mov edx, dword ptr [L7f238]
L7b5ed::
    shl eax, 03h
    add edx, eax
    cmp di, 0ebf8h
    jae short L7b630
    mov ebx, dword ptr [edx-02h]
    mov eax, dword ptr [edx]
    mov bx, ax
    mov dword ptr [edi+01408h], ebx
    mov ebx, dword ptr [edx+02h]
    mov ax, bx
    cmp di, 0e1f8h
    mov dword ptr [edi+0140ch], eax
    jae short L7b630
    mov eax, dword ptr [edx+04h]
    mov bx, ax
    mov ax, word ptr [edx+06h]
    mov dword ptr [edi+01e08h], ebx
    mov dword ptr [edi+01e0ch], eax
L7b630::
    test byte ptr [L7f1b4], 040h
    je near ptr L7b872
L7b63d::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb near ptr L7e888
L7b64a::
    and eax, 01h
    jne short L7b656
    mov al, byte ptr [L7f240]
    jmp short L7b67a
L7b656::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb near ptr L7e894
L7b663::
    and eax, 01h
    mov al, byte ptr [L7f240]
    je short L7b66f
    inc al
L7b66f::
    sub al, 02h
    sbb al, 00h
    and al, 03h
    mov byte ptr [L7f240], al
L7b67a::
    or al, al
    je short L7b6c6
    test al, 02h
    jne short L7b6a4
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L7f284]
    jb near ptr L7e8a0
L7b696::
    and eax, dword ptr [L7f280]
    mov edx, dword ptr [L7f19c]
    jmp short L7b6e6
L7b6a4::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L7f286]
    jb near ptr L7e8ac
L7b6b8::
    and eax, dword ptr [L7f27c]
    mov edx, dword ptr [L7f1a4]
    jmp short L7b6e6
L7b6c6::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L7f285]
    jb near ptr L7e8b8
L7b6da::
    and eax, dword ptr [L7f278]
    mov edx, dword ptr [L7f238]
L7b6e6::
    shl eax, 03h
    add edx, eax
    cmp di, 0ebf0h
    jae short L7b729
    mov ebx, dword ptr [edx-02h]
    mov eax, dword ptr [edx]
    mov bx, ax
    mov dword ptr [edi+01410h], ebx
    mov ebx, dword ptr [edx+02h]
    mov ax, bx
    cmp di, 0e1f0h
    mov dword ptr [edi+01414h], eax
    jae short L7b729
    mov eax, dword ptr [edx+04h]
    mov bx, ax
    mov ax, word ptr [edx+06h]
    mov dword ptr [edi+01e10h], ebx
    mov dword ptr [edi+01e14h], eax
L7b729::
    test byte ptr [L7f1b4], 080h
    je near ptr L7b87f
L7b736::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb near ptr L7e8c4
L7b743::
    and eax, 01h
    jne short L7b74f
    mov al, byte ptr [L7f240]
    jmp short L7b773
L7b74f::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb near ptr L7e8d0
L7b75c::
    and eax, 01h
    mov al, byte ptr [L7f240]
    je short L7b768
    inc al
L7b768::
    sub al, 02h
    sbb al, 00h
    and al, 03h
    mov byte ptr [L7f240], al
L7b773::
    or al, al
    je short L7b7bf
    test al, 02h
    jne short L7b79d
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L7f284]
    jb near ptr L7e8dc
L7b78f::
    and eax, dword ptr [L7f280]
    mov edx, dword ptr [L7f19c]
    jmp short L7b7df
L7b79d::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L7f286]
    jb near ptr L7e8e8
L7b7b1::
    and eax, dword ptr [L7f27c]
    mov edx, dword ptr [L7f1a4]
    jmp short L7b7df
L7b7bf::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L7f285]
    jb near ptr L7e8f4
L7b7d3::
    and eax, dword ptr [L7f278]
    mov edx, dword ptr [L7f238]
L7b7df::
    shl eax, 03h
    add edx, eax
    cmp di, 0ebe8h
    jae short L7b822
    mov ebx, dword ptr [edx-02h]
    mov eax, dword ptr [edx]
    mov bx, ax
    mov dword ptr [edi+01418h], ebx
    mov ebx, dword ptr [edx+02h]
    mov ax, bx
    cmp di, 0e1e8h
    mov dword ptr [edi+0141ch], eax
    jae short L7b822
    mov eax, dword ptr [edx+04h]
    mov bx, ax
    mov ax, word ptr [edx+06h]
    mov dword ptr [edi+01e18h], ebx
    mov dword ptr [edi+01e1ch], eax
L7b822::
    jmp short L7b88c
L7b824::
    test byte ptr [L7f1b4], 01h
    jne near ptr L7b08a
L7b831::
    test byte ptr [L7f1b4], 02h
    jne near ptr L7b175
L7b83e::
    test byte ptr [L7f1b4], 010h
    jne near ptr L7b267
L7b84b::
    test byte ptr [L7f1b4], 020h
    jne near ptr L7b359
L7b858::
    test byte ptr [L7f1b4], 04h
    jne near ptr L7b44b
L7b865::
    test byte ptr [L7f1b4], 08h
    jne near ptr L7b544
L7b872::
    test byte ptr [L7f1b4], 040h
    jne near ptr L7b63d
L7b87f::
    test byte ptr [L7f1b4], 080h
    jne near ptr L7b736
L7b88c::
    test byte ptr [L7f1b5], 0ffh
    je near ptr L7c249
    test byte ptr [L7f1b5], 01h
    je near ptr L7c066
L7b8a6::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb near ptr L7e900
L7b8b3::
    and eax, 01h
    jne short L7b8bf
    mov al, byte ptr [L7f240]
    jmp short L7b8e3
L7b8bf::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb near ptr L7e90c
L7b8cc::
    and eax, 01h
    mov al, byte ptr [L7f240]
    je short L7b8d8
    inc al
L7b8d8::
    sub al, 02h
    sbb al, 00h
    and al, 03h
    mov byte ptr [L7f240], al
L7b8e3::
    or al, al
    je short L7b92f
    test al, 02h
    jne short L7b90d
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L7f284]
    jb near ptr L7e918
L7b8ff::
    and eax, dword ptr [L7f280]
    mov edx, dword ptr [L7f19c]
    jmp short L7b94f
L7b90d::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L7f286]
    jb near ptr L7e924
L7b921::
    and eax, dword ptr [L7f27c]
    mov edx, dword ptr [L7f1a4]
    jmp short L7b94f
L7b92f::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L7f285]
    jb near ptr L7e930
L7b943::
    and eax, dword ptr [L7f278]
    mov edx, dword ptr [L7f238]
L7b94f::
    shl eax, 03h
    add edx, eax
    cmp di, 0d800h
    jae short L7b992
    mov ebx, dword ptr [edx-02h]
    mov eax, dword ptr [edx]
    mov bx, ax
    mov dword ptr [edi+02800h], ebx
    mov ebx, dword ptr [edx+02h]
    mov ax, bx
    cmp di, 0ce00h
    mov dword ptr [edi+02804h], eax
    jae short L7b992
    mov eax, dword ptr [edx+04h]
    mov bx, ax
    mov ax, word ptr [edx+06h]
    mov dword ptr [edi+03200h], ebx
    mov dword ptr [edi+03204h], eax
L7b992::
    test byte ptr [L7f1b5], 02h
    je near ptr L7c073
L7b99f::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb near ptr L7e93c
L7b9ac::
    and eax, 01h
    jne short L7b9b8
    mov al, byte ptr [L7f240]
    jmp short L7b9dc
L7b9b8::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb near ptr L7e948
L7b9c5::
    and eax, 01h
    mov al, byte ptr [L7f240]
    je short L7b9d1
    inc al
L7b9d1::
    sub al, 02h
    sbb al, 00h
    and al, 03h
    mov byte ptr [L7f240], al
L7b9dc::
    or al, al
    je short L7ba28
    test al, 02h
    jne short L7ba06
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L7f284]
    jb near ptr L7e954
L7b9f8::
    and eax, dword ptr [L7f280]
    mov edx, dword ptr [L7f19c]
    jmp short L7ba48
L7ba06::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L7f286]
    jb near ptr L7e960
L7ba1a::
    and eax, dword ptr [L7f27c]
    mov edx, dword ptr [L7f1a4]
    jmp short L7ba48
L7ba28::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L7f285]
    jb near ptr L7e96c
L7ba3c::
    and eax, dword ptr [L7f278]
    mov edx, dword ptr [L7f238]
L7ba48::
    shl eax, 03h
    add edx, eax
    cmp di, 0d7f8h
    jae short L7ba8b
    mov ebx, dword ptr [edx-02h]
    mov eax, dword ptr [edx]
    mov bx, ax
    mov dword ptr [edi+02808h], ebx
    mov ebx, dword ptr [edx+02h]
    mov ax, bx
    cmp di, 0cdf8h
    mov dword ptr [edi+0280ch], eax
    jae short L7ba8b
    mov eax, dword ptr [edx+04h]
    mov bx, ax
    mov ax, word ptr [edx+06h]
    mov dword ptr [edi+03208h], ebx
    mov dword ptr [edi+0320ch], eax
L7ba8b::
    test byte ptr [L7f1b5], 010h
    je near ptr L7c080
L7ba98::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb near ptr L7e978
L7baa5::
    and eax, 01h
    jne short L7bab1
    mov al, byte ptr [L7f240]
    jmp short L7bad5
L7bab1::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb near ptr L7e984
L7babe::
    and eax, 01h
    mov al, byte ptr [L7f240]
    je short L7baca
    inc al
L7baca::
    sub al, 02h
    sbb al, 00h
    and al, 03h
    mov byte ptr [L7f240], al
L7bad5::
    or al, al
    je short L7bb21
    test al, 02h
    jne short L7baff
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L7f284]
    jb near ptr L7e990
L7baf1::
    and eax, dword ptr [L7f280]
    mov edx, dword ptr [L7f19c]
    jmp short L7bb41
L7baff::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L7f286]
    jb near ptr L7e99c
L7bb13::
    and eax, dword ptr [L7f27c]
    mov edx, dword ptr [L7f1a4]
    jmp short L7bb41
L7bb21::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L7f285]
    jb near ptr L7e9a8
L7bb35::
    and eax, dword ptr [L7f278]
    mov edx, dword ptr [L7f238]
L7bb41::
    shl eax, 03h
    add edx, eax
    cmp di, 0d7f0h
    jae short L7bb84
    mov ebx, dword ptr [edx-02h]
    mov eax, dword ptr [edx]
    mov bx, ax
    mov dword ptr [edi+02810h], ebx
    mov ebx, dword ptr [edx+02h]
    mov ax, bx
    cmp di, 0cdf0h
    mov dword ptr [edi+02814h], eax
    jae short L7bb84
    mov eax, dword ptr [edx+04h]
    mov bx, ax
    mov ax, word ptr [edx+06h]
    mov dword ptr [edi+03210h], ebx
    mov dword ptr [edi+03214h], eax
L7bb84::
    test byte ptr [L7f1b5], 020h
    je near ptr L7c08d
L7bb91::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb near ptr L7e9b4
L7bb9e::
    and eax, 01h
    jne short L7bbaa
    mov al, byte ptr [L7f240]
    jmp short L7bbce
L7bbaa::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb near ptr L7e9c0
L7bbb7::
    and eax, 01h
    mov al, byte ptr [L7f240]
    je short L7bbc3
    inc al
L7bbc3::
    sub al, 02h
    sbb al, 00h
    and al, 03h
    mov byte ptr [L7f240], al
L7bbce::
    or al, al
    je short L7bc1a
    test al, 02h
    jne short L7bbf8
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L7f284]
    jb near ptr L7e9cc
L7bbea::
    and eax, dword ptr [L7f280]
    mov edx, dword ptr [L7f19c]
    jmp short L7bc3a
L7bbf8::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L7f286]
    jb near ptr L7e9d8
L7bc0c::
    and eax, dword ptr [L7f27c]
    mov edx, dword ptr [L7f1a4]
    jmp short L7bc3a
L7bc1a::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L7f285]
    jb near ptr L7e9e4
L7bc2e::
    and eax, dword ptr [L7f278]
    mov edx, dword ptr [L7f238]
L7bc3a::
    shl eax, 03h
    add edx, eax
    cmp di, 0d7e8h
    jae short L7bc7d
    mov ebx, dword ptr [edx-02h]
    mov eax, dword ptr [edx]
    mov bx, ax
    mov dword ptr [edi+02818h], ebx
    mov ebx, dword ptr [edx+02h]
    mov ax, bx
    cmp di, 0cde8h
    mov dword ptr [edi+0281ch], eax
    jae short L7bc7d
    mov eax, dword ptr [edx+04h]
    mov bx, ax
    mov ax, word ptr [edx+06h]
    mov dword ptr [edi+03218h], ebx
    mov dword ptr [edi+0321ch], eax
L7bc7d::
    test byte ptr [L7f1b5], 04h
    je near ptr L7c09a
L7bc8a::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb near ptr L7e9f0
L7bc97::
    and eax, 01h
    jne short L7bca3
    mov al, byte ptr [L7f240]
    jmp short L7bcc7
L7bca3::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb near ptr L7e9fc
L7bcb0::
    and eax, 01h
    mov al, byte ptr [L7f240]
    je short L7bcbc
    inc al
L7bcbc::
    sub al, 02h
    sbb al, 00h
    and al, 03h
    mov byte ptr [L7f240], al
L7bcc7::
    or al, al
    je short L7bd13
    test al, 02h
    jne short L7bcf1
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L7f284]
    jb near ptr L7ea08
L7bce3::
    and eax, dword ptr [L7f280]
    mov edx, dword ptr [L7f19c]
    jmp short L7bd33
L7bcf1::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L7f286]
    jb near ptr L7ea14
L7bd05::
    and eax, dword ptr [L7f27c]
    mov edx, dword ptr [L7f1a4]
    jmp short L7bd33
L7bd13::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L7f285]
    jb near ptr L7ea20
L7bd27::
    and eax, dword ptr [L7f278]
    mov edx, dword ptr [L7f238]
L7bd33::
    shl eax, 03h
    add edx, eax
    cmp di, 0c400h
    jae short L7bd76
    mov ebx, dword ptr [edx-02h]
    mov eax, dword ptr [edx]
    mov bx, ax
    mov dword ptr [edi+03c00h], ebx
    mov ebx, dword ptr [edx+02h]
    mov ax, bx
    cmp di, 0ba00h
    mov dword ptr [edi+03c04h], eax
    jae short L7bd76
    mov eax, dword ptr [edx+04h]
    mov bx, ax
    mov ax, word ptr [edx+06h]
    mov dword ptr [edi+04600h], ebx
    mov dword ptr [edi+04604h], eax
L7bd76::
    test byte ptr [L7f1b5], 08h
    je near ptr L7c0a7
L7bd83::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb near ptr L7ea2c
L7bd90::
    and eax, 01h
    jne short L7bd9c
    mov al, byte ptr [L7f240]
    jmp short L7bdc0
L7bd9c::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb near ptr L7ea38
L7bda9::
    and eax, 01h
    mov al, byte ptr [L7f240]
    je short L7bdb5
    inc al
L7bdb5::
    sub al, 02h
    sbb al, 00h
    and al, 03h
    mov byte ptr [L7f240], al
L7bdc0::
    or al, al
    je short L7be0c
    test al, 02h
    jne short L7bdea
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L7f284]
    jb near ptr L7ea44
L7bddc::
    and eax, dword ptr [L7f280]
    mov edx, dword ptr [L7f19c]
    jmp short L7be2c
L7bdea::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L7f286]
    jb near ptr L7ea50
L7bdfe::
    and eax, dword ptr [L7f27c]
    mov edx, dword ptr [L7f1a4]
    jmp short L7be2c
L7be0c::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L7f285]
    jb near ptr L7ea5c
L7be20::
    and eax, dword ptr [L7f278]
    mov edx, dword ptr [L7f238]
L7be2c::
    shl eax, 03h
    add edx, eax
    cmp di, 0c3f8h
    jae short L7be6f
    mov ebx, dword ptr [edx-02h]
    mov eax, dword ptr [edx]
    mov bx, ax
    mov dword ptr [edi+03c08h], ebx
    mov ebx, dword ptr [edx+02h]
    mov ax, bx
    cmp di, 0b9f8h
    mov dword ptr [edi+03c0ch], eax
    jae short L7be6f
    mov eax, dword ptr [edx+04h]
    mov bx, ax
    mov ax, word ptr [edx+06h]
    mov dword ptr [edi+04608h], ebx
    mov dword ptr [edi+0460ch], eax
L7be6f::
    test byte ptr [L7f1b5], 040h
    je near ptr L7c0b4
L7be7c::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb near ptr L7ea68
L7be89::
    and eax, 01h
    jne short L7be95
    mov al, byte ptr [L7f240]
    jmp short L7beb9
L7be95::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb near ptr L7ea74
L7bea2::
    and eax, 01h
    mov al, byte ptr [L7f240]
    je short L7beae
    inc al
L7beae::
    sub al, 02h
    sbb al, 00h
    and al, 03h
    mov byte ptr [L7f240], al
L7beb9::
    or al, al
    je short L7bf05
    test al, 02h
    jne short L7bee3
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L7f284]
    jb near ptr L7ea80
L7bed5::
    and eax, dword ptr [L7f280]
    mov edx, dword ptr [L7f19c]
    jmp short L7bf25
L7bee3::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L7f286]
    jb near ptr L7ea8c
L7bef7::
    and eax, dword ptr [L7f27c]
    mov edx, dword ptr [L7f1a4]
    jmp short L7bf25
L7bf05::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L7f285]
    jb near ptr L7ea98
L7bf19::
    and eax, dword ptr [L7f278]
    mov edx, dword ptr [L7f238]
L7bf25::
    shl eax, 03h
    add edx, eax
    cmp di, 0c3f0h
    jae short L7bf68
    mov ebx, dword ptr [edx-02h]
    mov eax, dword ptr [edx]
    mov bx, ax
    mov dword ptr [edi+03c10h], ebx
    mov ebx, dword ptr [edx+02h]
    mov ax, bx
    cmp di, 0b9f0h
    mov dword ptr [edi+03c14h], eax
    jae short L7bf68
    mov eax, dword ptr [edx+04h]
    mov bx, ax
    mov ax, word ptr [edx+06h]
    mov dword ptr [edi+04610h], ebx
    mov dword ptr [edi+04614h], eax
L7bf68::
    test byte ptr [L7f1b5], 080h
    je near ptr L7c0c1
L7bf75::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb near ptr L7eaa4
L7bf82::
    and eax, 01h
    jne short L7bf8e
    mov al, byte ptr [L7f240]
    jmp short L7bfb2
L7bf8e::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb near ptr L7eab0
L7bf9b::
    and eax, 01h
    mov al, byte ptr [L7f240]
    je short L7bfa7
    inc al
L7bfa7::
    sub al, 02h
    sbb al, 00h
    and al, 03h
    mov byte ptr [L7f240], al
L7bfb2::
    or al, al
    je short L7bffe
    test al, 02h
    jne short L7bfdc
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L7f284]
    jb near ptr L7eabc
L7bfce::
    and eax, dword ptr [L7f280]
    mov edx, dword ptr [L7f19c]
    jmp short L7c01e
L7bfdc::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L7f286]
    jb near ptr L7eac8
L7bff0::
    and eax, dword ptr [L7f27c]
    mov edx, dword ptr [L7f1a4]
    jmp short L7c01e
L7bffe::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L7f285]
    jb near ptr L7ead4
L7c012::
    and eax, dword ptr [L7f278]
    mov edx, dword ptr [L7f238]
L7c01e::
    shl eax, 03h
    add edx, eax
    cmp di, 0c3e8h
    jae short L7c061
    mov ebx, dword ptr [edx-02h]
    mov eax, dword ptr [edx]
    mov bx, ax
    mov dword ptr [edi+03c18h], ebx
    mov ebx, dword ptr [edx+02h]
    mov ax, bx
    cmp di, 0b9e8h
    mov dword ptr [edi+03c1ch], eax
    jae short L7c061
    mov eax, dword ptr [edx+04h]
    mov bx, ax
    mov ax, word ptr [edx+06h]
    mov dword ptr [edi+04618h], ebx
    mov dword ptr [edi+0461ch], eax
L7c061::
    jmp near ptr L7c249
L7c066::
    test byte ptr [L7f1b5], 01h
    jne near ptr L7b8a6
L7c073::
    test byte ptr [L7f1b5], 02h
    jne near ptr L7b99f
L7c080::
    test byte ptr [L7f1b5], 010h
    jne near ptr L7ba98
L7c08d::
    test byte ptr [L7f1b5], 020h
    jne near ptr L7bb91
L7c09a::
    test byte ptr [L7f1b5], 04h
    jne near ptr L7bc8a
L7c0a7::
    test byte ptr [L7f1b5], 08h
    jne near ptr L7bd83
L7c0b4::
    test byte ptr [L7f1b5], 040h
    jne near ptr L7be7c
L7c0c1::
    test byte ptr [L7f1b5], 080h
    jne near ptr L7bf75
    jmp near ptr L7c249
L7c0d3::
    test dword ptr [L7f244], 010000h
    jne near ptr L7c234
    jmp near ptr L7c249
L7c0e8::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb near ptr L7eae0
L7c0f5::
    and eax, 01h
    jne short L7c101
    mov al, byte ptr [L7f240]
    jmp short L7c125
L7c101::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb near ptr L7eaec
L7c10e::
    and eax, 01h
    mov al, byte ptr [L7f240]
    je short L7c11a
    inc al
L7c11a::
    sub al, 02h
    sbb al, 00h
    and al, 03h
    mov byte ptr [L7f240], al
L7c125::
    or al, al
    je near ptr L7c1b8
    test al, 02h
    jne short L7c153
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L7f284]
    jb near ptr L7eaf8
L7c145::
    and eax, dword ptr [L7f280]
    mov edx, dword ptr [L7f19c]
    jmp short L7c173
L7c153::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L7f286]
    jb near ptr L7eb04
L7c167::
    and eax, dword ptr [L7f27c]
    mov edx, dword ptr [L7f1a4]
L7c173::
    shl eax, 03h
    add edx, eax
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 04h
    jb near ptr L7eb10
L7c189::
    and eax, 0fh
    mov ebx, dword ptr [edx-02h]
    mov dword ptr [L7f18c], ecx
    mov ecx, dword ptr [edx]
    mov bx, cx
    mov dword ptr [L7f190], ebp
    mov dword ptr [L7f188], esi
    mov esi, dword ptr [edx+02h]
    mov cx, si
    mov ebp, dword ptr [edx+04h]
    mov si, bp
    mov bp, word ptr [edx+06h]
    jmp short L7c21b
L7c1b8::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L7f285]
    jb near ptr L7eb1c
L7c1cc::
    and eax, dword ptr [L7f278]
    mov edx, dword ptr [L7f238]
    shl eax, 03h
    add edx, eax
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 04h
    jb near ptr L7eb28
L7c1ee::
    and eax, 0fh
    mov ebx, dword ptr [edx-02h]
    mov dword ptr [L7f18c], ecx
    mov ecx, dword ptr [edx]
    mov bx, cx
    mov dword ptr [L7f190], ebp
    mov dword ptr [L7f188], esi
    mov esi, dword ptr [edx+02h]
    mov cx, si
    mov ebp, dword ptr [edx+04h]
    mov si, bp
    mov bp, word ptr [edx+06h]
L7c21b::
    call dword ptr [eax*4+L78d87]
    mov esi, dword ptr [L7f188]
    mov ecx, dword ptr [L7f18c]
    mov ebp, dword ptr [L7f190]
L7c234::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb near ptr L7eb34
L7c241::
    test al, 01h
    je near ptr L7c0e8
L7c249::
    mov edx, 01h
    mov edi, dword ptr [L7f198]
    jmp near ptr L79084
L7c259::
    cmp dword ptr [L7f248], 00h
    jne short L7c26a
    pop edx
    pop ecx
    pop ebx
    pop eax
    pop edi
    pop esi
    leave
    ret
L7c26a::
    call Func7c2ac_
    pop edx
    pop ecx
    pop ebx
    pop eax
    pop edi
    pop esi
    leave
    ret
    nop
    add byte ptr [eax], al
    mov eax, eax
L7c27c::
    cmp dword ptr [L7f248], 00h
    je short L7c297
    call Func7c2ac_
    cmp bx, word ptr [L7f17c]
    je near ptr L79149
L7c297::
    pusha
    mov ax, bx
    call Func7e06c_
    popa
    jmp near ptr L79149
Func7ae74_ endp
    db 08bh, 0c0h, 000h, 000h, 08bh, 0c0h
Func7c2ac_ proc near
    mov al, byte ptr [L7f25c]
    mov byte ptr [L7f240], al
    mov esi, 00h
    xchg dword ptr [L7f248], esi
    mov ecx, dword ptr [L7f24c]
    mov edx, dword ptr [L7f250]
    mov eax, dword ptr [L7f258]
    mov dword ptr [L7f23c], eax
L7c2d7::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb near ptr L7eb40
L7c2e4::
    and eax, 01h
    je short L7c33a
    add edx, 01h
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 03h
    jb near ptr L7eb4c
L7c2fd::
    and eax, 07h
    add edx, eax
    cmp eax, 07h
    jl short L7c33a
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 07h
    jb near ptr L7eb58
L7c318::
    and eax, 07fh
    add edx, eax
    cmp eax, 07fh
    jl short L7c33a
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 0ch
    jb near ptr L7eb64
L7c333::
    and eax, 0fffh
    add edx, eax
L7c33a::
    bswap ecx
    mov cl, byte ptr [L7f287]
    mov ebx, edx
    shl ebx, cl
    add dword ptr [L7f254], ebx
    bswap ecx
    add edx, dword ptr [L7f23c]
    cmp edx, dword ptr [L7f1ac]
    jae near ptr L7c259
    mov dword ptr [L7f23c], edx
    shl edx, 02h
    add edx, dword ptr [ebp+014h]
    mov edi, dword ptr [edx]
    cmp edi, 0ffffffffh
    je near ptr L7dea3
    cmp edi, 0fffffffeh
    je near ptr L7c259
    shld ebx, edi, 010h
    cmp di, 0b4f2h
    jbe near ptr L7deb4
    inc bx
    cmp bx, word ptr [L7f17c]
    jne near ptr L7dedc
L7c39e::
    mov dword ptr [L7f198], edi
    and edi, 0ffffh
    or edi, dword ptr [L7f1a8]
L7c3b0::
    mov dword ptr [L7f1b4], 00h
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb near ptr L7eb70
L7c3c7::
    test al, 01h
    jne near ptr L7c95e
L7c3cf::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb near ptr L7eb7c
L7c3dc::
    and eax, 01h
    jne short L7c3e8
    mov al, byte ptr [L7f240]
    jmp short L7c40c
L7c3e8::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb near ptr L7eb88
L7c3f5::
    and eax, 01h
    mov al, byte ptr [L7f240]
    je short L7c401
    inc al
L7c401::
    sub al, 02h
    sbb al, 00h
    and al, 03h
    mov byte ptr [L7f240], al
L7c40c::
    or al, al
    je near ptr L7c4a3
    test al, 02h
    jne short L7c43a
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L7f284]
    jb near ptr L7eb94
L7c42c::
    and eax, dword ptr [L7f280]
    mov edx, dword ptr [L7f19c]
    jmp short L7c45a
L7c43a::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L7f286]
    jb near ptr L7eba0
L7c44e::
    and eax, dword ptr [L7f27c]
    mov edx, dword ptr [L7f1a4]
L7c45a::
    shl eax, 03h
    add edx, eax
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 011h
    jae short L7c472
    add esi, 04h
    or cl, 0e0h
L7c472::
    and eax, 01ffffh
    mov ebx, dword ptr [edx-02h]
    mov dword ptr [L7f18c], ecx
    mov ecx, dword ptr [edx]
    mov bx, cx
    mov dword ptr [L7f190], ebp
    mov dword ptr [L7f188], esi
    mov esi, dword ptr [edx+02h]
    mov cx, si
    mov ebp, dword ptr [edx+04h]
    mov si, bp
    mov bp, word ptr [edx+06h]
    jmp short L7c50a
L7c4a3::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L7f285]
    jb near ptr L7ebac
L7c4b7::
    and eax, dword ptr [L7f278]
    mov edx, dword ptr [L7f254]
    shl eax, 03h
    add edx, eax
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 011h
    jae short L7c4db
    add esi, 04h
    or cl, 0e0h
L7c4db::
    and eax, 01ffffh
    mov ebx, dword ptr [edx-02h]
    mov dword ptr [L7f18c], ecx
    mov ecx, dword ptr [edx]
    mov bx, cx
    mov dword ptr [L7f190], ebp
    mov dword ptr [L7f188], esi
    mov esi, dword ptr [edx+02h]
    mov cx, si
    mov ebp, dword ptr [edx+04h]
    mov si, bp
    mov bp, word ptr [edx+06h]
L7c50a::
    or dword ptr [L7f1b4], eax
    test al, al
    je near ptr L7c70f
    test al, 01h
    je near ptr L7c6d3
L7c520::
    sub edi, 010000h
    cmp di, 0f600h
    jae short L7c534
    jmp short L7c540
    mov dword ptr [edi], ebx
    mov dword ptr [edi+04h], ecx
L7c534::
    mov dword ptr [edi+0a00h], esi
    mov dword ptr [edi+0a04h], ebp
L7c540::
    add edi, 010000h
    test al, 02h
    je near ptr L7c6db
L7c54e::
    sub edi, 010000h
    cmp di, 0fff8h
    jae short L7c563
    cmp di, 0f5f8h
    jae short L7c569
    jmp short L7c575
L7c563::
    mov dword ptr [edi+08h], ebx
    mov dword ptr [edi+0ch], ecx
L7c569::
    mov dword ptr [edi+0a08h], esi
    mov dword ptr [edi+0a0ch], ebp
L7c575::
    add edi, 010000h
    test al, 010h
    je near ptr L7c6e3
L7c583::
    sub edi, 010000h
    cmp di, 0fff0h
    jae short L7c598
    cmp di, 0f5f0h
    jae short L7c59e
    jmp short L7c5aa
L7c598::
    mov dword ptr [edi+010h], ebx
    mov dword ptr [edi+014h], ecx
L7c59e::
    mov dword ptr [edi+0a10h], esi
    mov dword ptr [edi+0a14h], ebp
L7c5aa::
    add edi, 010000h
    test al, 020h
    je near ptr L7c6eb
L7c5b8::
    sub edi, 010000h
    cmp di, 0ffe8h
    jae short L7c5cd
    cmp di, 0f5e8h
    jae short L7c5d3
    jmp short L7c5df
L7c5cd::
    mov dword ptr [edi+018h], ebx
    mov dword ptr [edi+01ch], ecx
L7c5d3::
    mov dword ptr [edi+0a18h], esi
    mov dword ptr [edi+0a1ch], ebp
L7c5df::
    add edi, 010000h
    test al, 04h
    je near ptr L7c6f3
L7c5ed::
    sub edi, 010000h
    cmp di, 0ec00h
    jae short L7c603
    cmp di, 0e200h
    jae short L7c60f
    jmp short L7c61b
L7c603::
    mov dword ptr [edi+01400h], ebx
    mov dword ptr [edi+01404h], ecx
L7c60f::
    mov dword ptr [edi+01e00h], esi
    mov dword ptr [edi+01e04h], ebp
L7c61b::
    add edi, 010000h
    test al, 08h
    je near ptr L7c6fb
L7c629::
    sub edi, 010000h
    cmp di, 0ebf8h
    jae short L7c63f
    cmp di, 0e1f8h
    jae short L7c64b
    jmp short L7c657
L7c63f::
    mov dword ptr [edi+01408h], ebx
    mov dword ptr [edi+0140ch], ecx
L7c64b::
    mov dword ptr [edi+01e08h], esi
    mov dword ptr [edi+01e0ch], ebp
L7c657::
    add edi, 010000h
    test al, 040h
    je near ptr L7c703
L7c665::
    sub edi, 010000h
    cmp di, 0ebf0h
    jae short L7c67b
    cmp di, 0e1f0h
    jae short L7c687
    jmp short L7c693
L7c67b::
    mov dword ptr [edi+01410h], ebx
    mov dword ptr [edi+01414h], ecx
L7c687::
    mov dword ptr [edi+01e10h], esi
    mov dword ptr [edi+01e14h], ebp
L7c693::
    add edi, 010000h
    test al, 080h
    je short L7c70b
L7c69d::
    sub edi, 010000h
    cmp di, 0ebe8h
    jae short L7c6b3
    cmp di, 0e1e8h
    jae short L7c6bf
    jmp short L7c6cb
L7c6b3::
    mov dword ptr [edi+01418h], ebx
    mov dword ptr [edi+0141ch], ecx
L7c6bf::
    mov dword ptr [edi+01e18h], esi
    mov dword ptr [edi+01e1ch], ebp
L7c6cb::
    add edi, 010000h
    jmp short L7c70f
L7c6d3::
    test al, 01h
    jne near ptr L7c520
L7c6db::
    test al, 02h
    jne near ptr L7c54e
L7c6e3::
    test al, 010h
    jne near ptr L7c583
L7c6eb::
    test al, 020h
    jne near ptr L7c5b8
L7c6f3::
    test al, 04h
    jne near ptr L7c5ed
L7c6fb::
    test al, 08h
    jne near ptr L7c629
L7c703::
    test al, 040h
    jne near ptr L7c665
L7c70b::
    test al, 080h
    jne short L7c69d
L7c70f::
    test ah, ah
    je near ptr L7c941
    test ah, 01h
    je near ptr L7c8fd
L7c720::
    sub edi, 010000h
    cmp di, 0d800h
    jae short L7c736
    cmp di, 0ce00h
    jae short L7c742
    jmp short L7c74e
L7c736::
    mov dword ptr [edi+02800h], ebx
    mov dword ptr [edi+02804h], ecx
L7c742::
    mov dword ptr [edi+03200h], esi
    mov dword ptr [edi+03204h], ebp
L7c74e::
    add edi, 010000h
    test ah, 02h
    je near ptr L7c906
L7c75d::
    sub edi, 010000h
    cmp di, 0d7f8h
    jae short L7c773
    cmp di, 0cdf8h
    jae short L7c77f
    jmp short L7c78b
L7c773::
    mov dword ptr [edi+02808h], ebx
    mov dword ptr [edi+0280ch], ecx
L7c77f::
    mov dword ptr [edi+03208h], esi
    mov dword ptr [edi+0320ch], ebp
L7c78b::
    add edi, 010000h
    test ah, 010h
    je near ptr L7c90f
L7c79a::
    sub edi, 010000h
    cmp di, 0d7f0h
    jae short L7c7b0
    cmp di, 0cdf0h
    jae short L7c7bc
    jmp short L7c7c8
L7c7b0::
    mov dword ptr [edi+02810h], ebx
    mov dword ptr [edi+02814h], ecx
L7c7bc::
    mov dword ptr [edi+03210h], esi
    mov dword ptr [edi+03214h], ebp
L7c7c8::
    add edi, 010000h
    test ah, 020h
    je near ptr L7c918
L7c7d7::
    sub edi, 010000h
    cmp di, 0d7e8h
    jae short L7c7ed
    cmp di, 0cde8h
    jae short L7c7f9
    jmp short L7c805
L7c7ed::
    mov dword ptr [edi+02818h], ebx
    mov dword ptr [edi+0281ch], ecx
L7c7f9::
    mov dword ptr [edi+03218h], esi
    mov dword ptr [edi+0321ch], ebp
L7c805::
    add edi, 010000h
    test ah, 04h
    je near ptr L7c921
L7c814::
    sub edi, 010000h
    cmp di, 0c400h
    jae short L7c82a
    cmp di, 0ba00h
    jae short L7c836
    jmp short L7c842
L7c82a::
    mov dword ptr [edi+03c00h], ebx
    mov dword ptr [edi+03c04h], ecx
L7c836::
    mov dword ptr [edi+04600h], esi
    mov dword ptr [edi+04604h], ebp
L7c842::
    add edi, 010000h
    test ah, 08h
    je near ptr L7c92a
L7c851::
    sub edi, 010000h
    cmp di, 0c3f8h
    jae short L7c867
    cmp di, 0b9f8h
    jae short L7c873
    jmp short L7c87f
L7c867::
    mov dword ptr [edi+03c08h], ebx
    mov dword ptr [edi+03c0ch], ecx
L7c873::
    mov dword ptr [edi+04608h], esi
    mov dword ptr [edi+0460ch], ebp
L7c87f::
    add edi, 010000h
    test ah, 040h
    je near ptr L7c933
L7c88e::
    sub edi, 010000h
    cmp di, 0c3f0h
    jae short L7c8a4
    cmp di, 0b9f0h
    jae short L7c8b0
    jmp short L7c8bc
L7c8a4::
    mov dword ptr [edi+03c10h], ebx
    mov dword ptr [edi+03c14h], ecx
L7c8b0::
    mov dword ptr [edi+04610h], esi
    mov dword ptr [edi+04614h], ebp
L7c8bc::
    add edi, 010000h
    test ah, 080h
    je short L7c93c
L7c8c7::
    sub edi, 010000h
    cmp di, 0c3e8h
    jae short L7c8dd
    cmp di, 0b9e8h
    jae short L7c8e9
    jmp short L7c8f5
L7c8dd::
    mov dword ptr [edi+03c18h], ebx
    mov dword ptr [edi+03c1ch], ecx
L7c8e9::
    mov dword ptr [edi+04618h], esi
    mov dword ptr [edi+0461ch], ebp
L7c8f5::
    add edi, 010000h
    jmp short L7c941
L7c8fd::
    test ah, 01h
    jne near ptr L7c720
L7c906::
    test ah, 02h
    jne near ptr L7c75d
L7c90f::
    test ah, 010h
    jne near ptr L7c79a
L7c918::
    test ah, 020h
    jne near ptr L7c7d7
L7c921::
    test ah, 04h
    jne near ptr L7c814
L7c92a::
    test ah, 08h
    jne near ptr L7c851
L7c933::
    test ah, 040h
    jne near ptr L7c88e
L7c93c::
    test ah, 080h
    jne short L7c8c7
L7c941::
    mov esi, dword ptr [L7f188]
    mov ecx, dword ptr [L7f18c]
    mov ebp, dword ptr [L7f190]
    and eax, 010000h
    je near ptr L7c3cf
L7c95e::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb near ptr L7ebb8
L7c96b::
    test al, 01h
    jne near ptr L7dd1d
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 04h
    jb near ptr L7ebc4
L7c984::
    and eax, 0fh
    jmp dword ptr [eax*4+L7c98e]
Func7c2ac_ endp
L7c98e label byte
    dd offset Func7c9ce_
    dd offset L7c9ec
    dd offset L7ca0d
    dd offset L7ca31
    dd offset L7ca51
    dd offset L7ca73
    dd offset L7ca9a
    dd offset L7cabd
    dd offset L7cae1
    dd offset L7cb00
    dd offset L7cb24
    dd offset L7cb4a
    dd offset L7cb6a
    dd offset L7cb85
    dd offset L7cba6
    dd offset L7cbc4
Func7c9ce_ proc near
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 010h
    jae short L7c9e1
    add esi, 04h
    or cl, 0e0h
L7c9e1::
    xor dword ptr [L7f1b4], eax
    jmp near ptr L7cbca
L7c9ec::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 0ch
    jb near ptr L7ebd0
L7c9fd::
    shl eax, 04h
    or al, 0fh
    xor dword ptr [L7f1b4], eax
    jmp near ptr L7cbca
L7ca0d::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 0ch
    jb near ptr L7ebdc
L7ca1e::
    shl eax, 04h
    shr al, 04h
    or al, 0f0h
    xor dword ptr [L7f1b4], eax
    jmp near ptr L7cbca
L7ca31::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 08h
    jb near ptr L7ebe8
L7ca42::
    mov ah, al
    mov al, 0ffh
    xor dword ptr [L7f1b4], eax
    jmp near ptr L7cbca
L7ca51::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 0ch
    jb near ptr L7ebf4
L7ca62::
    shl ah, 04h
    or ah, 0fh
    xor dword ptr [L7f1b4], eax
    jmp near ptr L7cbca
L7ca73::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 08h
    jb near ptr L7ec00
L7ca84::
    shl eax, 04h
    shl ah, 04h
    or eax, 0f0fh
    xor dword ptr [L7f1b4], eax
    jmp near ptr L7cbca
L7ca9a::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 08h
    jb near ptr L7ec0c
L7caab::
    mov ah, al
    or eax, 0ff0h
    xor dword ptr [L7f1b4], eax
    jmp near ptr L7cbca
L7cabd::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 04h
    jb near ptr L7ec18
L7cace::
    shl eax, 0ch
    or eax, 0fffh
    xor dword ptr [L7f1b4], eax
    jmp near ptr L7cbca
L7cae1::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 0ch
    jb near ptr L7ec24
L7caf2::
    or ah, 0f0h
    xor dword ptr [L7f1b4], eax
    jmp near ptr L7cbca
L7cb00::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 08h
    jb near ptr L7ec30
L7cb11::
    shl eax, 04h
    or eax, 0f00fh
    xor dword ptr [L7f1b4], eax
    jmp near ptr L7cbca
L7cb24::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 08h
    jb near ptr L7ec3c
L7cb35::
    mov ah, al
    ror ah, 04h
    or eax, 0f0f0h
    xor dword ptr [L7f1b4], eax
    jmp near ptr L7cbca
L7cb4a::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 04h
    jb near ptr L7ec48
L7cb5b::
    mov ah, al
    or eax, 0f0ffh
    xor dword ptr [L7f1b4], eax
    jmp short L7cbca
L7cb6a::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 08h
    jb near ptr L7ec54
L7cb7b::
    mov ah, 0ffh
    xor dword ptr [L7f1b4], eax
    jmp short L7cbca
L7cb85::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 04h
    jb near ptr L7ec60
L7cb96::
    or eax, 0fff0h
    rol al, 04h
    xor dword ptr [L7f1b4], eax
    jmp short L7cbca
L7cba6::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 04h
    jb near ptr L7ec6c
L7cbb7::
    or eax, 0fff0h
    xor dword ptr [L7f1b4], eax
    jmp short L7cbca
L7cbc4::
    not dword ptr [L7f1b4]
L7cbca::
    test byte ptr [L7f1b4], 0ffh
    je near ptr L7d45e
    test byte ptr [L7f1b4], 01h
    je near ptr L7d3f6
L7cbe4::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb near ptr L7ec78
L7cbf1::
    and eax, 01h
    jne short L7cbfd
    mov al, byte ptr [L7f240]
    jmp short L7cc21
L7cbfd::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb near ptr L7ec84
L7cc0a::
    and eax, 01h
    mov al, byte ptr [L7f240]
    je short L7cc16
    inc al
L7cc16::
    sub al, 02h
    sbb al, 00h
    and al, 03h
    mov byte ptr [L7f240], al
L7cc21::
    or al, al
    je short L7cc6d
    test al, 02h
    jne short L7cc4b
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L7f284]
    jb near ptr L7ec90
L7cc3d::
    and eax, dword ptr [L7f280]
    mov edx, dword ptr [L7f19c]
    jmp short L7cc8d
L7cc4b::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L7f286]
    jb near ptr L7ec9c
L7cc5f::
    and eax, dword ptr [L7f27c]
    mov edx, dword ptr [L7f1a4]
    jmp short L7cc8d
L7cc6d::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L7f285]
    jb near ptr L7eca8
L7cc81::
    and eax, dword ptr [L7f278]
    mov edx, dword ptr [L7f254]
L7cc8d::
    shl eax, 03h
    add edx, eax
    sub edi, 010000h
    cmp di, 0f600h
    jae short L7ccb2
    jmp short L7cccb
    mov ebx, dword ptr [edx-02h]
    mov eax, dword ptr [edx]
    mov bx, ax
    mov ax, word ptr [edx+02h]
    mov dword ptr [edi], ebx
    mov dword ptr [edi+04h], eax
L7ccb2::
    mov ebx, dword ptr [edx+02h]
    mov eax, dword ptr [edx+04h]
    mov bx, ax
    mov ax, word ptr [edx+06h]
    mov dword ptr [edi+0a00h], ebx
    mov dword ptr [edi+0a04h], eax
L7cccb::
    add edi, 010000h
    test byte ptr [L7f1b4], 02h
    je near ptr L7d403
L7ccde::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb near ptr L7ecb4
L7cceb::
    and eax, 01h
    jne short L7ccf7
    mov al, byte ptr [L7f240]
    jmp short L7cd1b
L7ccf7::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb near ptr L7ecc0
L7cd04::
    and eax, 01h
    mov al, byte ptr [L7f240]
    je short L7cd10
    inc al
L7cd10::
    sub al, 02h
    sbb al, 00h
    and al, 03h
    mov byte ptr [L7f240], al
L7cd1b::
    or al, al
    je short L7cd67
    test al, 02h
    jne short L7cd45
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L7f284]
    jb near ptr L7eccc
L7cd37::
    and eax, dword ptr [L7f280]
    mov edx, dword ptr [L7f19c]
    jmp short L7cd87
L7cd45::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L7f286]
    jb near ptr L7ecd8
L7cd59::
    and eax, dword ptr [L7f27c]
    mov edx, dword ptr [L7f1a4]
    jmp short L7cd87
L7cd67::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L7f285]
    jb near ptr L7ece4
L7cd7b::
    and eax, dword ptr [L7f278]
    mov edx, dword ptr [L7f254]
L7cd87::
    shl eax, 03h
    add edx, eax
    sub edi, 010000h
    cmp di, 0fff8h
    jae short L7cda1
    cmp di, 0f5f8h
    jae short L7cdb3
    jmp short L7cdcc
L7cda1::
    mov ebx, dword ptr [edx-02h]
    mov eax, dword ptr [edx]
    mov bx, ax
    mov ax, word ptr [edx+02h]
    mov dword ptr [edi+08h], ebx
    mov dword ptr [edi+0ch], eax
L7cdb3::
    mov ebx, dword ptr [edx+02h]
    mov eax, dword ptr [edx+04h]
    mov bx, ax
    mov ax, word ptr [edx+06h]
    mov dword ptr [edi+0a08h], ebx
    mov dword ptr [edi+0a0ch], eax
L7cdcc::
    add edi, 010000h
    test byte ptr [L7f1b4], 010h
    je near ptr L7d410
L7cddf::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb near ptr L7ecf0
L7cdec::
    and eax, 01h
    jne short L7cdf8
    mov al, byte ptr [L7f240]
    jmp short L7ce1c
L7cdf8::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb near ptr L7ecfc
L7ce05::
    and eax, 01h
    mov al, byte ptr [L7f240]
    je short L7ce11
    inc al
L7ce11::
    sub al, 02h
    sbb al, 00h
    and al, 03h
    mov byte ptr [L7f240], al
L7ce1c::
    or al, al
    je short L7ce68
    test al, 02h
    jne short L7ce46
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L7f284]
    jb near ptr L7ed08
L7ce38::
    and eax, dword ptr [L7f280]
    mov edx, dword ptr [L7f19c]
    jmp short L7ce88
L7ce46::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L7f286]
    jb near ptr L7ed14
L7ce5a::
    and eax, dword ptr [L7f27c]
    mov edx, dword ptr [L7f1a4]
    jmp short L7ce88
L7ce68::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L7f285]
    jb near ptr L7ed20
L7ce7c::
    and eax, dword ptr [L7f278]
    mov edx, dword ptr [L7f254]
L7ce88::
    shl eax, 03h
    add edx, eax
    sub edi, 010000h
    cmp di, 0fff0h
    jae short L7cea2
    cmp di, 0f5f0h
    jae short L7ceb4
    jmp short L7cecd
L7cea2::
    mov ebx, dword ptr [edx-02h]
    mov eax, dword ptr [edx]
    mov bx, ax
    mov ax, word ptr [edx+02h]
    mov dword ptr [edi+010h], ebx
    mov dword ptr [edi+014h], eax
L7ceb4::
    mov ebx, dword ptr [edx+02h]
    mov eax, dword ptr [edx+04h]
    mov bx, ax
    mov ax, word ptr [edx+06h]
    mov dword ptr [edi+0a10h], ebx
    mov dword ptr [edi+0a14h], eax
L7cecd::
    add edi, 010000h
    test byte ptr [L7f1b4], 020h
    je near ptr L7d41d
L7cee0::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb near ptr L7ed2c
L7ceed::
    and eax, 01h
    jne short L7cef9
    mov al, byte ptr [L7f240]
    jmp short L7cf1d
L7cef9::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb near ptr L7ed38
L7cf06::
    and eax, 01h
    mov al, byte ptr [L7f240]
    je short L7cf12
    inc al
L7cf12::
    sub al, 02h
    sbb al, 00h
    and al, 03h
    mov byte ptr [L7f240], al
L7cf1d::
    or al, al
    je short L7cf69
    test al, 02h
    jne short L7cf47
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L7f284]
    jb near ptr L7ed44
L7cf39::
    and eax, dword ptr [L7f280]
    mov edx, dword ptr [L7f19c]
    jmp short L7cf89
L7cf47::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L7f286]
    jb near ptr L7ed50
L7cf5b::
    and eax, dword ptr [L7f27c]
    mov edx, dword ptr [L7f1a4]
    jmp short L7cf89
L7cf69::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L7f285]
    jb near ptr L7ed5c
L7cf7d::
    and eax, dword ptr [L7f278]
    mov edx, dword ptr [L7f254]
L7cf89::
    shl eax, 03h
    add edx, eax
    sub edi, 010000h
    cmp di, 0ffe8h
    jae short L7cfa3
    cmp di, 0f5e8h
    jae short L7cfb5
    jmp short L7cfce
L7cfa3::
    mov ebx, dword ptr [edx-02h]
    mov eax, dword ptr [edx]
    mov bx, ax
    mov ax, word ptr [edx+02h]
    mov dword ptr [edi+018h], ebx
    mov dword ptr [edi+01ch], eax
L7cfb5::
    mov ebx, dword ptr [edx+02h]
    mov eax, dword ptr [edx+04h]
    mov bx, ax
    mov ax, word ptr [edx+06h]
    mov dword ptr [edi+0a18h], ebx
    mov dword ptr [edi+0a1ch], eax
L7cfce::
    add edi, 010000h
    test byte ptr [L7f1b4], 04h
    je near ptr L7d42a
L7cfe1::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb near ptr L7ed68
L7cfee::
    and eax, 01h
    jne short L7cffa
    mov al, byte ptr [L7f240]
    jmp short L7d01e
L7cffa::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb near ptr L7ed74
L7d007::
    and eax, 01h
    mov al, byte ptr [L7f240]
    je short L7d013
    inc al
L7d013::
    sub al, 02h
    sbb al, 00h
    and al, 03h
    mov byte ptr [L7f240], al
L7d01e::
    or al, al
    je short L7d06a
    test al, 02h
    jne short L7d048
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L7f284]
    jb near ptr L7ed80
L7d03a::
    and eax, dword ptr [L7f280]
    mov edx, dword ptr [L7f19c]
    jmp short L7d08a
L7d048::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L7f286]
    jb near ptr L7ed8c
L7d05c::
    and eax, dword ptr [L7f27c]
    mov edx, dword ptr [L7f1a4]
    jmp short L7d08a
L7d06a::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L7f285]
    jb near ptr L7ed98
L7d07e::
    and eax, dword ptr [L7f278]
    mov edx, dword ptr [L7f254]
L7d08a::
    shl eax, 03h
    add edx, eax
    sub edi, 010000h
    cmp di, 0ec00h
    jae short L7d0a5
    cmp di, 0e200h
    jae short L7d0bd
    jmp short L7d0d6
L7d0a5::
    mov ebx, dword ptr [edx-02h]
    mov eax, dword ptr [edx]
    mov bx, ax
    mov ax, word ptr [edx+02h]
    mov dword ptr [edi+01400h], ebx
    mov dword ptr [edi+01404h], eax
L7d0bd::
    mov ebx, dword ptr [edx+02h]
    mov eax, dword ptr [edx+04h]
    mov bx, ax
    mov ax, word ptr [edx+06h]
    mov dword ptr [edi+01e00h], ebx
    mov dword ptr [edi+01e04h], eax
L7d0d6::
    add edi, 010000h
    test byte ptr [L7f1b4], 08h
    je near ptr L7d437
L7d0e9::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb near ptr L7eda4
L7d0f6::
    and eax, 01h
    jne short L7d102
    mov al, byte ptr [L7f240]
    jmp short L7d126
L7d102::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb near ptr L7edb0
L7d10f::
    and eax, 01h
    mov al, byte ptr [L7f240]
    je short L7d11b
    inc al
L7d11b::
    sub al, 02h
    sbb al, 00h
    and al, 03h
    mov byte ptr [L7f240], al
L7d126::
    or al, al
    je short L7d172
    test al, 02h
    jne short L7d150
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L7f284]
    jb near ptr L7edbc
L7d142::
    and eax, dword ptr [L7f280]
    mov edx, dword ptr [L7f19c]
    jmp short L7d192
L7d150::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L7f286]
    jb near ptr L7edc8
L7d164::
    and eax, dword ptr [L7f27c]
    mov edx, dword ptr [L7f1a4]
    jmp short L7d192
L7d172::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L7f285]
    jb near ptr L7edd4
L7d186::
    and eax, dword ptr [L7f278]
    mov edx, dword ptr [L7f254]
L7d192::
    shl eax, 03h
    add edx, eax
    sub edi, 010000h
    cmp di, 0ebf8h
    jae short L7d1ad
    cmp di, 0e1f8h
    jae short L7d1c5
    jmp short L7d1de
L7d1ad::
    mov ebx, dword ptr [edx-02h]
    mov eax, dword ptr [edx]
    mov bx, ax
    mov ax, word ptr [edx+02h]
    mov dword ptr [edi+01408h], ebx
    mov dword ptr [edi+0140ch], eax
L7d1c5::
    mov ebx, dword ptr [edx+02h]
    mov eax, dword ptr [edx+04h]
    mov bx, ax
    mov ax, word ptr [edx+06h]
    mov dword ptr [edi+01e08h], ebx
    mov dword ptr [edi+01e0ch], eax
L7d1de::
    add edi, 010000h
    test byte ptr [L7f1b4], 040h
    je near ptr L7d444
L7d1f1::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb near ptr L7ede0
L7d1fe::
    and eax, 01h
    jne short L7d20a
    mov al, byte ptr [L7f240]
    jmp short L7d22e
L7d20a::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb near ptr L7edec
L7d217::
    and eax, 01h
    mov al, byte ptr [L7f240]
    je short L7d223
    inc al
L7d223::
    sub al, 02h
    sbb al, 00h
    and al, 03h
    mov byte ptr [L7f240], al
L7d22e::
    or al, al
    je short L7d27a
    test al, 02h
    jne short L7d258
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L7f284]
    jb near ptr L7edf8
L7d24a::
    and eax, dword ptr [L7f280]
    mov edx, dword ptr [L7f19c]
    jmp short L7d29a
L7d258::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L7f286]
    jb near ptr L7ee04
L7d26c::
    and eax, dword ptr [L7f27c]
    mov edx, dword ptr [L7f1a4]
    jmp short L7d29a
L7d27a::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L7f285]
    jb near ptr L7ee10
L7d28e::
    and eax, dword ptr [L7f278]
    mov edx, dword ptr [L7f254]
L7d29a::
    shl eax, 03h
    add edx, eax
    sub edi, 010000h
    cmp di, 0ebf0h
    jae short L7d2b5
    cmp di, 0e1f0h
    jae short L7d2cd
    jmp short L7d2e6
L7d2b5::
    mov ebx, dword ptr [edx-02h]
    mov eax, dword ptr [edx]
    mov bx, ax
    mov ax, word ptr [edx+02h]
    mov dword ptr [edi+01410h], ebx
    mov dword ptr [edi+01414h], eax
L7d2cd::
    mov ebx, dword ptr [edx+02h]
    mov eax, dword ptr [edx+04h]
    mov bx, ax
    mov ax, word ptr [edx+06h]
    mov dword ptr [edi+01e10h], ebx
    mov dword ptr [edi+01e14h], eax
L7d2e6::
    add edi, 010000h
    test byte ptr [L7f1b4], 080h
    je near ptr L7d451
L7d2f9::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb near ptr L7ee1c
L7d306::
    and eax, 01h
    jne short L7d312
    mov al, byte ptr [L7f240]
    jmp short L7d336
L7d312::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb near ptr L7ee28
L7d31f::
    and eax, 01h
    mov al, byte ptr [L7f240]
    je short L7d32b
    inc al
L7d32b::
    sub al, 02h
    sbb al, 00h
    and al, 03h
    mov byte ptr [L7f240], al
L7d336::
    or al, al
    je short L7d382
    test al, 02h
    jne short L7d360
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L7f284]
    jb near ptr L7ee34
L7d352::
    and eax, dword ptr [L7f280]
    mov edx, dword ptr [L7f19c]
    jmp short L7d3a2
L7d360::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L7f286]
    jb near ptr L7ee40
L7d374::
    and eax, dword ptr [L7f27c]
    mov edx, dword ptr [L7f1a4]
    jmp short L7d3a2
L7d382::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L7f285]
    jb near ptr L7ee4c
L7d396::
    and eax, dword ptr [L7f278]
    mov edx, dword ptr [L7f254]
L7d3a2::
    shl eax, 03h
    add edx, eax
    sub edi, 010000h
    cmp di, 0ebe8h
    jae short L7d3bd
    cmp di, 0e1e8h
    jae short L7d3d5
    jmp short L7d3ee
L7d3bd::
    mov ebx, dword ptr [edx-02h]
    mov eax, dword ptr [edx]
    mov bx, ax
    mov ax, word ptr [edx+02h]
    mov dword ptr [edi+01418h], ebx
    mov dword ptr [edi+0141ch], eax
L7d3d5::
    mov ebx, dword ptr [edx+02h]
    mov eax, dword ptr [edx+04h]
    mov bx, ax
    mov ax, word ptr [edx+06h]
    mov dword ptr [edi+01e18h], ebx
    mov dword ptr [edi+01e1ch], eax
L7d3ee::
    add edi, 010000h
    jmp short L7d45e
L7d3f6::
    test byte ptr [L7f1b4], 01h
    jne near ptr L7cbe4
L7d403::
    test byte ptr [L7f1b4], 02h
    jne near ptr L7ccde
L7d410::
    test byte ptr [L7f1b4], 010h
    jne near ptr L7cddf
L7d41d::
    test byte ptr [L7f1b4], 020h
    jne near ptr L7cee0
L7d42a::
    test byte ptr [L7f1b4], 04h
    jne near ptr L7cfe1
L7d437::
    test byte ptr [L7f1b4], 08h
    jne near ptr L7d0e9
L7d444::
    test byte ptr [L7f1b4], 040h
    jne near ptr L7d1f1
L7d451::
    test byte ptr [L7f1b4], 080h
    jne near ptr L7d2f9
L7d45e::
    test byte ptr [L7f1b5], 0ffh
    je near ptr L7de93
    test byte ptr [L7f1b5], 01h
    je near ptr L7dcb0
L7d478::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb near ptr L7ee58
L7d485::
    and eax, 01h
    jne short L7d491
    mov al, byte ptr [L7f240]
    jmp short L7d4b5
L7d491::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb near ptr L7ee64
L7d49e::
    and eax, 01h
    mov al, byte ptr [L7f240]
    je short L7d4aa
    inc al
L7d4aa::
    sub al, 02h
    sbb al, 00h
    and al, 03h
    mov byte ptr [L7f240], al
L7d4b5::
    or al, al
    je short L7d501
    test al, 02h
    jne short L7d4df
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L7f284]
    jb near ptr L7ee70
L7d4d1::
    and eax, dword ptr [L7f280]
    mov edx, dword ptr [L7f19c]
    jmp short L7d521
L7d4df::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L7f286]
    jb near ptr L7ee7c
L7d4f3::
    and eax, dword ptr [L7f27c]
    mov edx, dword ptr [L7f1a4]
    jmp short L7d521
L7d501::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L7f285]
    jb near ptr L7ee88
L7d515::
    and eax, dword ptr [L7f278]
    mov edx, dword ptr [L7f254]
L7d521::
    shl eax, 03h
    add edx, eax
    sub edi, 010000h
    cmp di, 0d800h
    jae short L7d53c
    cmp di, 0ce00h
    jae short L7d554
    jmp short L7d56d
L7d53c::
    mov ebx, dword ptr [edx-02h]
    mov eax, dword ptr [edx]
    mov bx, ax
    mov ax, word ptr [edx+02h]
    mov dword ptr [edi+02800h], ebx
    mov dword ptr [edi+02804h], eax
L7d554::
    mov ebx, dword ptr [edx+02h]
    mov eax, dword ptr [edx+04h]
    mov bx, ax
    mov ax, word ptr [edx+06h]
    mov dword ptr [edi+03200h], ebx
    mov dword ptr [edi+03204h], eax
L7d56d::
    add edi, 010000h
    test byte ptr [L7f1b5], 02h
    je near ptr L7dcbd
L7d580::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb near ptr L7ee94
L7d58d::
    and eax, 01h
    jne short L7d599
    mov al, byte ptr [L7f240]
    jmp short L7d5bd
L7d599::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb near ptr L7eea0
L7d5a6::
    and eax, 01h
    mov al, byte ptr [L7f240]
    je short L7d5b2
    inc al
L7d5b2::
    sub al, 02h
    sbb al, 00h
    and al, 03h
    mov byte ptr [L7f240], al
L7d5bd::
    or al, al
    je short L7d609
    test al, 02h
    jne short L7d5e7
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L7f284]
    jb near ptr L7eeac
L7d5d9::
    and eax, dword ptr [L7f280]
    mov edx, dword ptr [L7f19c]
    jmp short L7d629
L7d5e7::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L7f286]
    jb near ptr L7eeb8
L7d5fb::
    and eax, dword ptr [L7f27c]
    mov edx, dword ptr [L7f1a4]
    jmp short L7d629
L7d609::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L7f285]
    jb near ptr L7eec4
L7d61d::
    and eax, dword ptr [L7f278]
    mov edx, dword ptr [L7f254]
L7d629::
    shl eax, 03h
    add edx, eax
    sub edi, 010000h
    cmp di, 0d7f8h
    jae short L7d644
    cmp di, 0cdf8h
    jae short L7d65c
    jmp short L7d675
L7d644::
    mov ebx, dword ptr [edx-02h]
    mov eax, dword ptr [edx]
    mov bx, ax
    mov ax, word ptr [edx+02h]
    mov dword ptr [edi+02808h], ebx
    mov dword ptr [edi+0280ch], eax
L7d65c::
    mov ebx, dword ptr [edx+02h]
    mov eax, dword ptr [edx+04h]
    mov bx, ax
    mov ax, word ptr [edx+06h]
    mov dword ptr [edi+03208h], ebx
    mov dword ptr [edi+0320ch], eax
L7d675::
    add edi, 010000h
    test byte ptr [L7f1b5], 010h
    je near ptr L7dcca
L7d688::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb near ptr L7eed0
L7d695::
    and eax, 01h
    jne short L7d6a1
    mov al, byte ptr [L7f240]
    jmp short L7d6c5
L7d6a1::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb near ptr L7eedc
L7d6ae::
    and eax, 01h
    mov al, byte ptr [L7f240]
    je short L7d6ba
    inc al
L7d6ba::
    sub al, 02h
    sbb al, 00h
    and al, 03h
    mov byte ptr [L7f240], al
L7d6c5::
    or al, al
    je short L7d711
    test al, 02h
    jne short L7d6ef
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L7f284]
    jb near ptr L7eee8
L7d6e1::
    and eax, dword ptr [L7f280]
    mov edx, dword ptr [L7f19c]
    jmp short L7d731
L7d6ef::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L7f286]
    jb near ptr L7eef4
L7d703::
    and eax, dword ptr [L7f27c]
    mov edx, dword ptr [L7f1a4]
    jmp short L7d731
L7d711::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L7f285]
    jb near ptr L7ef00
L7d725::
    and eax, dword ptr [L7f278]
    mov edx, dword ptr [L7f254]
L7d731::
    shl eax, 03h
    add edx, eax
    sub edi, 010000h
    cmp di, 0d7f0h
    jae short L7d74c
    cmp di, 0cdf0h
    jae short L7d764
    jmp short L7d77d
L7d74c::
    mov ebx, dword ptr [edx-02h]
    mov eax, dword ptr [edx]
    mov bx, ax
    mov ax, word ptr [edx+02h]
    mov dword ptr [edi+02810h], ebx
    mov dword ptr [edi+02814h], eax
L7d764::
    mov ebx, dword ptr [edx+02h]
    mov eax, dword ptr [edx+04h]
    mov bx, ax
    mov ax, word ptr [edx+06h]
    mov dword ptr [edi+03210h], ebx
    mov dword ptr [edi+03214h], eax
L7d77d::
    add edi, 010000h
    test byte ptr [L7f1b5], 020h
    je near ptr L7dcd7
L7d790::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb near ptr L7ef0c
L7d79d::
    and eax, 01h
    jne short L7d7a9
    mov al, byte ptr [L7f240]
    jmp short L7d7cd
L7d7a9::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb near ptr L7ef18
L7d7b6::
    and eax, 01h
    mov al, byte ptr [L7f240]
    je short L7d7c2
    inc al
L7d7c2::
    sub al, 02h
    sbb al, 00h
    and al, 03h
    mov byte ptr [L7f240], al
L7d7cd::
    or al, al
    je short L7d819
    test al, 02h
    jne short L7d7f7
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L7f284]
    jb near ptr L7ef24
L7d7e9::
    and eax, dword ptr [L7f280]
    mov edx, dword ptr [L7f19c]
    jmp short L7d839
L7d7f7::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L7f286]
    jb near ptr L7ef30
L7d80b::
    and eax, dword ptr [L7f27c]
    mov edx, dword ptr [L7f1a4]
    jmp short L7d839
L7d819::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L7f285]
    jb near ptr L7ef3c
L7d82d::
    and eax, dword ptr [L7f278]
    mov edx, dword ptr [L7f254]
L7d839::
    shl eax, 03h
    add edx, eax
    sub edi, 010000h
    cmp di, 0d7e8h
    jae short L7d854
    cmp di, 0cde8h
    jae short L7d86c
    jmp short L7d885
L7d854::
    mov ebx, dword ptr [edx-02h]
    mov eax, dword ptr [edx]
    mov bx, ax
    mov ax, word ptr [edx+02h]
    mov dword ptr [edi+02818h], ebx
    mov dword ptr [edi+0281ch], eax
L7d86c::
    mov ebx, dword ptr [edx+02h]
    mov eax, dword ptr [edx+04h]
    mov bx, ax
    mov ax, word ptr [edx+06h]
    mov dword ptr [edi+03218h], ebx
    mov dword ptr [edi+0321ch], eax
L7d885::
    add edi, 010000h
    test byte ptr [L7f1b5], 04h
    je near ptr L7dce4
L7d898::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb near ptr L7ef48
L7d8a5::
    and eax, 01h
    jne short L7d8b1
    mov al, byte ptr [L7f240]
    jmp short L7d8d5
L7d8b1::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb near ptr L7ef54
L7d8be::
    and eax, 01h
    mov al, byte ptr [L7f240]
    je short L7d8ca
    inc al
L7d8ca::
    sub al, 02h
    sbb al, 00h
    and al, 03h
    mov byte ptr [L7f240], al
L7d8d5::
    or al, al
    je short L7d921
    test al, 02h
    jne short L7d8ff
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L7f284]
    jb near ptr L7ef60
L7d8f1::
    and eax, dword ptr [L7f280]
    mov edx, dword ptr [L7f19c]
    jmp short L7d941
L7d8ff::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L7f286]
    jb near ptr L7ef6c
L7d913::
    and eax, dword ptr [L7f27c]
    mov edx, dword ptr [L7f1a4]
    jmp short L7d941
L7d921::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L7f285]
    jb near ptr L7ef78
L7d935::
    and eax, dword ptr [L7f278]
    mov edx, dword ptr [L7f254]
L7d941::
    shl eax, 03h
    add edx, eax
    sub edi, 010000h
    cmp di, 0c400h
    jae short L7d95c
    cmp di, 0ba00h
    jae short L7d974
    jmp short L7d98d
L7d95c::
    mov ebx, dword ptr [edx-02h]
    mov eax, dword ptr [edx]
    mov bx, ax
    mov ax, word ptr [edx+02h]
    mov dword ptr [edi+03c00h], ebx
    mov dword ptr [edi+03c04h], eax
L7d974::
    mov ebx, dword ptr [edx+02h]
    mov eax, dword ptr [edx+04h]
    mov bx, ax
    mov ax, word ptr [edx+06h]
    mov dword ptr [edi+04600h], ebx
    mov dword ptr [edi+04604h], eax
L7d98d::
    add edi, 010000h
    test byte ptr [L7f1b5], 08h
    je near ptr L7dcf1
L7d9a0::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb near ptr L7ef84
L7d9ad::
    and eax, 01h
    jne short L7d9b9
    mov al, byte ptr [L7f240]
    jmp short L7d9dd
L7d9b9::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb near ptr L7ef90
L7d9c6::
    and eax, 01h
    mov al, byte ptr [L7f240]
    je short L7d9d2
    inc al
L7d9d2::
    sub al, 02h
    sbb al, 00h
    and al, 03h
    mov byte ptr [L7f240], al
L7d9dd::
    or al, al
    je short L7da29
    test al, 02h
    jne short L7da07
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L7f284]
    jb near ptr L7ef9c
L7d9f9::
    and eax, dword ptr [L7f280]
    mov edx, dword ptr [L7f19c]
    jmp short L7da49
L7da07::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L7f286]
    jb near ptr L7efa8
L7da1b::
    and eax, dword ptr [L7f27c]
    mov edx, dword ptr [L7f1a4]
    jmp short L7da49
L7da29::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L7f285]
    jb near ptr L7efb4
L7da3d::
    and eax, dword ptr [L7f278]
    mov edx, dword ptr [L7f254]
L7da49::
    shl eax, 03h
    add edx, eax
    sub edi, 010000h
    cmp di, 0c3f8h
    jae short L7da64
    cmp di, 0b9f8h
    jae short L7da7c
    jmp short L7da95
L7da64::
    mov ebx, dword ptr [edx-02h]
    mov eax, dword ptr [edx]
    mov bx, ax
    mov ax, word ptr [edx+02h]
    mov dword ptr [edi+03c08h], ebx
    mov dword ptr [edi+03c0ch], eax
L7da7c::
    mov ebx, dword ptr [edx+02h]
    mov eax, dword ptr [edx+04h]
    mov bx, ax
    mov ax, word ptr [edx+06h]
    mov dword ptr [edi+04608h], ebx
    mov dword ptr [edi+0460ch], eax
L7da95::
    add edi, 010000h
    test byte ptr [L7f1b5], 040h
    je near ptr L7dcfe
L7daa8::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb near ptr L7efc0
L7dab5::
    and eax, 01h
    jne short L7dac1
    mov al, byte ptr [L7f240]
    jmp short L7dae5
L7dac1::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb near ptr L7efcc
L7dace::
    and eax, 01h
    mov al, byte ptr [L7f240]
    je short L7dada
    inc al
L7dada::
    sub al, 02h
    sbb al, 00h
    and al, 03h
    mov byte ptr [L7f240], al
L7dae5::
    or al, al
    je short L7db31
    test al, 02h
    jne short L7db0f
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L7f284]
    jb near ptr L7efd8
L7db01::
    and eax, dword ptr [L7f280]
    mov edx, dword ptr [L7f19c]
    jmp short L7db51
L7db0f::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L7f286]
    jb near ptr L7efe4
L7db23::
    and eax, dword ptr [L7f27c]
    mov edx, dword ptr [L7f1a4]
    jmp short L7db51
L7db31::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L7f285]
    jb near ptr L7eff0
L7db45::
    and eax, dword ptr [L7f278]
    mov edx, dword ptr [L7f254]
L7db51::
    shl eax, 03h
    add edx, eax
    sub edi, 010000h
    cmp di, 0c3f0h
    jae short L7db6c
    cmp di, 0b9f0h
    jae short L7db84
    jmp short L7db9d
L7db6c::
    mov ebx, dword ptr [edx-02h]
    mov eax, dword ptr [edx]
    mov bx, ax
    mov ax, word ptr [edx+02h]
    mov dword ptr [edi+03c10h], ebx
    mov dword ptr [edi+03c14h], eax
L7db84::
    mov ebx, dword ptr [edx+02h]
    mov eax, dword ptr [edx+04h]
    mov bx, ax
    mov ax, word ptr [edx+06h]
    mov dword ptr [edi+04610h], ebx
    mov dword ptr [edi+04614h], eax
L7db9d::
    add edi, 010000h
    test byte ptr [L7f1b5], 080h
    je near ptr L7dd0b
L7dbb0::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb near ptr L7effc
L7dbbd::
    and eax, 01h
    jne short L7dbc9
    mov al, byte ptr [L7f240]
    jmp short L7dbed
L7dbc9::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb near ptr L7f008
L7dbd6::
    and eax, 01h
    mov al, byte ptr [L7f240]
    je short L7dbe2
    inc al
L7dbe2::
    sub al, 02h
    sbb al, 00h
    and al, 03h
    mov byte ptr [L7f240], al
L7dbed::
    or al, al
    je short L7dc39
    test al, 02h
    jne short L7dc17
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L7f284]
    jb near ptr L7f014
L7dc09::
    and eax, dword ptr [L7f280]
    mov edx, dword ptr [L7f19c]
    jmp short L7dc59
L7dc17::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L7f286]
    jb near ptr L7f020
L7dc2b::
    and eax, dword ptr [L7f27c]
    mov edx, dword ptr [L7f1a4]
    jmp short L7dc59
L7dc39::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L7f285]
    jb near ptr L7f02c
L7dc4d::
    and eax, dword ptr [L7f278]
    mov edx, dword ptr [L7f254]
L7dc59::
    shl eax, 03h
    add edx, eax
    sub edi, 010000h
    cmp di, 0c3e8h
    jae short L7dc74
    cmp di, 0b9e8h
    jae short L7dc8c
    jmp short L7dca5
L7dc74::
    mov ebx, dword ptr [edx-02h]
    mov eax, dword ptr [edx]
    mov bx, ax
    mov ax, word ptr [edx+02h]
    mov dword ptr [edi+03c18h], ebx
    mov dword ptr [edi+03c1ch], eax
L7dc8c::
    mov ebx, dword ptr [edx+02h]
    mov eax, dword ptr [edx+04h]
    mov bx, ax
    mov ax, word ptr [edx+06h]
    mov dword ptr [edi+04618h], ebx
    mov dword ptr [edi+0461ch], eax
L7dca5::
    add edi, 010000h
    jmp near ptr L7de93
L7dcb0::
    test byte ptr [L7f1b5], 01h
    jne near ptr L7d478
L7dcbd::
    test byte ptr [L7f1b5], 02h
    jne near ptr L7d580
L7dcca::
    test byte ptr [L7f1b5], 010h
    jne near ptr L7d688
L7dcd7::
    test byte ptr [L7f1b5], 020h
    jne near ptr L7d790
L7dce4::
    test byte ptr [L7f1b5], 04h
    jne near ptr L7d898
L7dcf1::
    test byte ptr [L7f1b5], 08h
    jne near ptr L7d9a0
L7dcfe::
    test byte ptr [L7f1b5], 040h
    jne near ptr L7daa8
L7dd0b::
    test byte ptr [L7f1b5], 080h
    jne near ptr L7dbb0
    jmp near ptr L7de93
L7dd1d::
    test dword ptr [L7f244], 010000h
    jne near ptr L7de7e
    jmp near ptr L7de93
L7dd32::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb near ptr L7f038
L7dd3f::
    and eax, 01h
    jne short L7dd4b
    mov al, byte ptr [L7f240]
    jmp short L7dd6f
L7dd4b::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb near ptr L7f044
L7dd58::
    and eax, 01h
    mov al, byte ptr [L7f240]
    je short L7dd64
    inc al
L7dd64::
    sub al, 02h
    sbb al, 00h
    and al, 03h
    mov byte ptr [L7f240], al
L7dd6f::
    or al, al
    je near ptr L7de02
    test al, 02h
    jne short L7dd9d
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L7f284]
    jb near ptr L7f050
L7dd8f::
    and eax, dword ptr [L7f280]
    mov edx, dword ptr [L7f19c]
    jmp short L7ddbd
L7dd9d::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L7f286]
    jb near ptr L7f05c
L7ddb1::
    and eax, dword ptr [L7f27c]
    mov edx, dword ptr [L7f1a4]
L7ddbd::
    shl eax, 03h
    add edx, eax
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 04h
    jb near ptr L7f068
L7ddd3::
    and eax, 0fh
    mov ebx, dword ptr [edx-02h]
    mov dword ptr [L7f18c], ecx
    mov ecx, dword ptr [edx]
    mov bx, cx
    mov dword ptr [L7f190], ebp
    mov dword ptr [L7f188], esi
    mov esi, dword ptr [edx+02h]
    mov cx, si
    mov ebp, dword ptr [edx+04h]
    mov si, bp
    mov bp, word ptr [edx+06h]
    jmp short L7de65
L7de02::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L7f285]
    jb near ptr L7f074
L7de16::
    and eax, dword ptr [L7f278]
    mov edx, dword ptr [L7f254]
    shl eax, 03h
    add edx, eax
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 04h
    jb near ptr L7f080
L7de38::
    and eax, 0fh
    mov ebx, dword ptr [edx-02h]
    mov dword ptr [L7f18c], ecx
    mov ecx, dword ptr [edx]
    mov bx, cx
    mov dword ptr [L7f190], ebp
    mov dword ptr [L7f188], esi
    mov esi, dword ptr [edx+02h]
    mov cx, si
    mov ebp, dword ptr [edx+04h]
    mov si, bp
    mov bp, word ptr [edx+06h]
L7de65::
    call dword ptr [eax*4+L78dc7]
    mov esi, dword ptr [L7f188]
    mov ecx, dword ptr [L7f18c]
    mov ebp, dword ptr [L7f190]
L7de7e::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb near ptr L7f08c
L7de8b::
    test al, 01h
    je near ptr L7dd32
L7de93::
    mov edx, 01h
    mov edi, dword ptr [L7f198]
    jmp near ptr L7c2d7
L7dea3::
    mov dword ptr [L7f198], edi
    lea edi, [L7f288]
    jmp near ptr L7c3b0
L7deb4::
    shld ebx, edi, 010h
    ret
    db 02eh, 08bh, 0c0h
    add byte ptr [eax], al
    mov eax, eax
L7dec0::
    pusha
    mov ax, bx
    call Func7e06c_
    popa
    mov word ptr [L7f17c], bx
    jmp near ptr L7a8df
    mov eax, eax
    add byte ptr [eax], al
    mov eax, eax
L7dedc::
    pusha
    mov ax, bx
    call Func7e06c_
    popa
    mov word ptr [L7f17c], bx
    jmp near ptr L7c39e
    pop edx
    pop ecx
    pop ebx
    pop eax
    pop edi
    pop esi
    leave
    ret
L7defa::
    pop edx
    pop ecx
    pop ebx
    pop eax
    pop edi
    pop esi
    leave
    ret
Func7c9ce_ endp
Func7df02_ proc near
    push ebp
    mov ebp, esp
    push esi
    push edi
    push eax
    push ebx
    push ecx
    push edx
    mov ax, word ptr [ebp+08h]
    or ax, ax
    je short L7df18
    mov ax, 01h
L7df18::
    xor ax, 01h
    mov word ptr [L7f184], ax
    mov eax, dword ptr [ebp+0ch]
    bsr ebx, eax
    sub ebx, 010h
    neg ebx
    mov byte ptr [L7fa88], bl
    pop edx
    pop ecx
    pop ebx
    pop eax
    pop edi
    pop esi
    leave
    ret
Func7df02_ endp
Func7df3b_ proc near
    push ebp
    mov ebp, esp
    push esi
    push edi
    push eax
    push ebx
    push ecx
    push edx
    mov eax, dword ptr [ebp+010h]
    sar eax, 03h
    inc eax
    and al, 0feh
    mov dword ptr [ebp+010h], eax
    mov eax, dword ptr [ebp+014h]
    add eax, 0fh
    sar eax, 03h
    inc eax
    and al, 0feh
    mov dword ptr [ebp+014h], eax
    mov edi, dword ptr [ebp+02ch]
    mov eax, dword ptr [ebp+0ch]
    shr eax, 03h
    mov dword ptr [edi+04h], eax
    mov dword ptr [ebp+0ch], eax
    mov eax, dword ptr [ebp+08h]
    shr eax, 03h
    mov dword ptr [edi], eax
    mov dword ptr [ebp+08h], eax
    add edi, 08h
    mov dword ptr [ebp+02ch], edi
    sar dword ptr [ebp+018h], 03h
    sar dword ptr [ebp+01ch], 03h
    shr dword ptr [ebp+020h], 03h
    shr dword ptr [ebp+024h], 03h
    mov edx, dword ptr [ebp+020h]
    or edx, edx
    jne short L7df9b
    mov edx, 028h
L7df9b::
    add edx, dword ptr [ebp+018h]
    mov dword ptr [ebp+020h], edx
    mov edx, dword ptr [ebp+024h]
    or edx, edx
    jne short L7dfad
    mov edx, 01eh
L7dfad::
    add edx, dword ptr [ebp+01ch]
    mov dword ptr [ebp+024h], edx
    mov ecx, 00h
L7dfb8::
    mov edx, 00h
L7dfbd::
    mov word ptr [edi], dx
    mov word ptr [edi+02h], cx
    add edi, 04h
    inc edx
    cmp edx, dword ptr [ebp+08h]
    jne short L7dfbd
    inc ecx
    cmp ecx, dword ptr [ebp+0ch]
    jne short L7dfb8
    mov edi, dword ptr [ebp+08h]
    mov edx, dword ptr [ebp+0ch]
    imul edi, edx
    dec edi
    shl edi, 02h
    add edi, dword ptr [ebp+02ch]
    mov edx, 0fffffffeh
L7dfe8::
    movsx eax, word ptr [edi]
    add eax, eax
    add eax, dword ptr [ebp+010h]
    cmp eax, 050h
    jae short L7e055
    movsx esi, word ptr [edi+02h]
    add esi, esi
    add esi, dword ptr [ebp+014h]
    cmp esi, 03ch
    jae short L7e055
    test dword ptr [ebp+028h], 01h
    je short L7e022
    cmp eax, dword ptr [ebp+018h]
    jl short L7e055
    cmp eax, dword ptr [ebp+020h]
    jge short L7e055
    cmp esi, dword ptr [ebp+01ch]
    jl short L7e055
    cmp esi, dword ptr [ebp+024h]
    jge short L7e055
    jmp short L7e036
L7e022::
    cmp eax, dword ptr [ebp+018h]
    jl short L7e036
    cmp eax, dword ptr [ebp+020h]
    jge short L7e036
    cmp esi, dword ptr [ebp+01ch]
    jl short L7e036
    cmp esi, dword ptr [ebp+024h]
    jl short L7e055
L7e036::
    imul esi, esi, 02800h
    shl eax, 04h
    add eax, esi
    mov dword ptr [edi], eax
    mov dl, 0ffh
    sub edi, 04h
    cmp edi, dword ptr [ebp+02ch]
    jae short L7dfe8
    pop edx
    pop ecx
    pop ebx
    pop eax
    pop edi
    pop esi
    leave
    ret
L7e055::
    mov dword ptr [edi], edx
    sub edi, 04h
    cmp edi, dword ptr [ebp+02ch]
    jae short L7dfe8
    pop edx
    pop ecx
    pop ebx
    pop eax
    pop edi
    pop esi
    leave
    ret
Func7df3b_ endp
    db 090h, 000h, 000h, 08bh, 0c0h
Func7e06c_ proc near
    mov dword ptr [L7f164], 04f05h
    mov cl, byte ptr [L7fa88]
    shl eax, cl
    mov dword ptr [L7f15c], eax
    mov ax, word ptr [L7f184]
    mov dword ptr [L7f158], eax
    mov ax, ds
    mov es, ax
    mov ax, 0300h
    lea edi, [_Data7f148]
    mov bx, 010h
    xor cx, cx
    int 031h
    ret
L7e0a8::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L78ed0
    nop
L7e0b4::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L78f32
    nop
L7e0c0::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L79091
    nop
L7e0cc::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L790aa
    nop
L7e0d8::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L790c5
    nop
L7e0e4::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L790e0
    nop
L7e0f0::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L79179
    nop
L7e0fc::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L7918e
    nop
L7e108::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L791a7
    nop
L7e114::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L791de
    nop
L7e120::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L79200
    nop
L7e12c::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L79269
    nop
L7e138::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L7954f
    nop
L7e144::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L79568
    nop
L7e150::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L795e1
    nop
L7e15c::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L79602
    nop
L7e168::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L79626
    nop
L7e174::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L79646
    nop
L7e180::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L79668
    nop
L7e18c::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L7968f
    nop
L7e198::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L796b2
    nop
L7e1a4::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L796d6
    nop
L7e1b0::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L796f5
    nop
L7e1bc::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L79719
    nop
L7e1c8::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L7973f
    nop
L7e1d4::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L7975f
    nop
L7e1e0::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L7977a
    nop
L7e1ec::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L7979b
    nop
L7e1f8::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L797d5
    nop
L7e204::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L797ee
    nop
L7e210::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L79821
    nop
L7e21c::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L79843
    nop
L7e228::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L79865
    nop
L7e234::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L798b9
    nop
L7e240::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L798d2
    nop
L7e24c::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L79905
    nop
L7e258::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L79927
    nop
L7e264::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L79949
    nop
L7e270::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L7999e
    nop
L7e27c::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L799b7
    nop
L7e288::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L799ea
    nop
L7e294::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L79a0c
    nop
L7e2a0::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L79a2e
    nop
L7e2ac::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L79a83
    nop
L7e2b8::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L79a9c
    nop
L7e2c4::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L79acf
    nop
L7e2d0::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L79af1
    nop
L7e2dc::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L79b13
    nop
L7e2e8::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L79b68
    nop
L7e2f4::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L79b81
    nop
L7e300::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L79bb4
    nop
L7e30c::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L79bd6
    nop
L7e318::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L79bf8
    nop
L7e324::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L79c53
    nop
L7e330::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L79c6c
    nop
L7e33c::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L79c9f
    nop
L7e348::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L79cc1
    nop
L7e354::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L79ce3
    nop
L7e360::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L79d3e
    nop
L7e36c::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L79d57
    nop
L7e378::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L79d8a
    nop
L7e384::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L79dac
    nop
L7e390::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L79dce
    nop
L7e39c::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L79e29
    nop
L7e3a8::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L79e42
    nop
L7e3b4::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L79e75
    nop
L7e3c0::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L79e97
    nop
L7e3cc::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L79eb9
    nop
L7e3d8::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L79f8b
    nop
L7e3e4::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L79fa4
    nop
L7e3f0::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L79fd7
    nop
L7e3fc::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L79ff9
    nop
L7e408::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L7a01b
    nop
L7e414::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L7a076
    nop
L7e420::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L7a08f
    nop
L7e42c::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L7a0c2
    nop
L7e438::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L7a0e4
    nop
L7e444::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L7a106
    nop
L7e450::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L7a161
    nop
L7e45c::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L7a17a
    nop
L7e468::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L7a1ad
    nop
L7e474::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L7a1cf
    nop
L7e480::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L7a1f1
    nop
L7e48c::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L7a24c
    nop
L7e498::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L7a265
    nop
L7e4a4::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L7a298
    nop
L7e4b0::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L7a2ba
    nop
L7e4bc::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L7a2dc
    nop
L7e4c8::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L7a337
    nop
L7e4d4::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L7a350
    nop
L7e4e0::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L7a383
    nop
L7e4ec::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L7a3a5
    nop
L7e4f8::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L7a3c7
    nop
L7e504::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L7a422
    nop
L7e510::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L7a43b
    nop
L7e51c::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L7a46e
    nop
L7e528::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L7a490
    nop
L7e534::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L7a4b2
    nop
L7e540::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L7a50d
    nop
L7e54c::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L7a526
    nop
L7e558::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L7a559
    nop
L7e564::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L7a57b
    nop
L7e570::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L7a59d
    nop
L7e57c::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L7a5f8
    nop
L7e588::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L7a611
    nop
L7e594::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L7a644
    nop
L7e5a0::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L7a666
    nop
L7e5ac::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L7a688
    nop
L7e5b8::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L7a75d
    nop
L7e5c4::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L7a776
    nop
L7e5d0::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L7a7ad
    nop
L7e5dc::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L7a7cf
    nop
L7e5e8::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L7a7f1
    nop
L7e5f4::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L7a834
    nop
L7e600::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L7a856
    nop
L7e60c::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L7a8a9
    nop
L7e618::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L7a94d
    nop
L7e624::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L7a962
    nop
L7e630::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L7a97b
    nop
L7e63c::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L7a9b2
    nop
L7e648::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L7a9d4
    nop
L7e654::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L7aa3d
    nop
L7e660::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L7ae11
    nop
L7e66c::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L7ae2a
    nop
L7e678::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L7aea3
    nop
L7e684::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L7aec4
    nop
L7e690::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L7aee8
    nop
L7e69c::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L7af08
    nop
L7e6a8::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L7af2a
    nop
L7e6b4::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L7af51
    nop
L7e6c0::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L7af74
    nop
L7e6cc::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L7af98
    nop
L7e6d8::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L7afb7
    nop
L7e6e4::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L7afdb
    nop
L7e6f0::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L7b001
    nop
L7e6fc::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L7b021
    nop
L7e708::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L7b03c
    nop
L7e714::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L7b05d
    nop
L7e720::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L7b097
    nop
L7e72c::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L7b0b0
    nop
L7e738::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L7b0e3
    nop
L7e744::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L7b105
    nop
L7e750::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L7b127
    nop
L7e75c::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L7b182
    nop
L7e768::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L7b19b
    nop
L7e774::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L7b1ce
    nop
L7e780::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L7b1f0
    nop
L7e78c::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L7b212
    nop
L7e798::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L7b274
    nop
L7e7a4::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L7b28d
    nop
L7e7b0::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L7b2c0
    nop
L7e7bc::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L7b2e2
    nop
L7e7c8::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L7b304
    nop
L7e7d4::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L7b366
    nop
L7e7e0::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L7b37f
    nop
L7e7ec::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L7b3b2
    nop
L7e7f8::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L7b3d4
    nop
L7e804::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L7b3f6
    nop
L7e810::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L7b458
    nop
L7e81c::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L7b471
    nop
L7e828::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L7b4a4
    nop
L7e834::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L7b4c6
    nop
L7e840::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L7b4e8
    nop
L7e84c::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L7b551
    nop
L7e858::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L7b56a
    nop
L7e864::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L7b59d
    nop
L7e870::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L7b5bf
    nop
L7e87c::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L7b5e1
    nop
L7e888::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L7b64a
    nop
L7e894::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L7b663
    nop
L7e8a0::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L7b696
    nop
L7e8ac::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L7b6b8
    nop
L7e8b8::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L7b6da
    nop
L7e8c4::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L7b743
    nop
L7e8d0::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L7b75c
    nop
L7e8dc::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L7b78f
    nop
L7e8e8::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L7b7b1
    nop
L7e8f4::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L7b7d3
    nop
L7e900::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L7b8b3
    nop
L7e90c::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L7b8cc
    nop
L7e918::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L7b8ff
    nop
L7e924::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L7b921
    nop
L7e930::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L7b943
    nop
L7e93c::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L7b9ac
    nop
L7e948::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L7b9c5
    nop
L7e954::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L7b9f8
    nop
L7e960::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L7ba1a
    nop
L7e96c::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L7ba3c
    nop
L7e978::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L7baa5
    nop
L7e984::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L7babe
    nop
L7e990::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L7baf1
    nop
L7e99c::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L7bb13
    nop
L7e9a8::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L7bb35
    nop
L7e9b4::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L7bb9e
    nop
L7e9c0::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L7bbb7
    nop
L7e9cc::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L7bbea
    nop
L7e9d8::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L7bc0c
    nop
L7e9e4::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L7bc2e
    nop
L7e9f0::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L7bc97
    nop
L7e9fc::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L7bcb0
    nop
L7ea08::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L7bce3
    nop
L7ea14::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L7bd05
    nop
L7ea20::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L7bd27
    nop
L7ea2c::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L7bd90
    nop
L7ea38::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L7bda9
    nop
L7ea44::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L7bddc
    nop
L7ea50::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L7bdfe
    nop
L7ea5c::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L7be20
    nop
L7ea68::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L7be89
    nop
L7ea74::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L7bea2
    nop
L7ea80::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L7bed5
    nop
L7ea8c::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L7bef7
    nop
L7ea98::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L7bf19
    nop
L7eaa4::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L7bf82
    nop
L7eab0::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L7bf9b
    nop
L7eabc::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L7bfce
    nop
L7eac8::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L7bff0
    nop
L7ead4::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L7c012
    nop
L7eae0::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L7c0f5
    nop
L7eaec::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L7c10e
    nop
L7eaf8::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L7c145
    nop
L7eb04::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L7c167
    nop
L7eb10::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L7c189
    nop
L7eb1c::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L7c1cc
    nop
L7eb28::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L7c1ee
    nop
L7eb34::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L7c241
    nop
L7eb40::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L7c2e4
    nop
L7eb4c::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L7c2fd
    nop
L7eb58::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L7c318
    nop
L7eb64::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L7c333
    nop
L7eb70::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L7c3c7
    nop
L7eb7c::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L7c3dc
    nop
L7eb88::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L7c3f5
    nop
L7eb94::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L7c42c
    nop
L7eba0::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L7c44e
    nop
L7ebac::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L7c4b7
    nop
L7ebb8::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L7c96b
    nop
L7ebc4::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L7c984
    nop
L7ebd0::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L7c9fd
    nop
L7ebdc::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L7ca1e
    nop
L7ebe8::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L7ca42
    nop
L7ebf4::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L7ca62
    nop
L7ec00::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L7ca84
    nop
L7ec0c::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L7caab
    nop
L7ec18::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L7cace
    nop
L7ec24::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L7caf2
    nop
L7ec30::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L7cb11
    nop
L7ec3c::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L7cb35
    nop
L7ec48::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L7cb5b
    nop
L7ec54::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L7cb7b
    nop
L7ec60::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L7cb96
    nop
L7ec6c::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L7cbb7
    nop
L7ec78::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L7cbf1
    nop
L7ec84::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L7cc0a
    nop
L7ec90::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L7cc3d
    nop
L7ec9c::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L7cc5f
    nop
L7eca8::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L7cc81
    nop
L7ecb4::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L7cceb
    nop
L7ecc0::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L7cd04
    nop
L7eccc::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L7cd37
    nop
L7ecd8::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L7cd59
    nop
L7ece4::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L7cd7b
    nop
L7ecf0::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L7cdec
    nop
L7ecfc::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L7ce05
    nop
L7ed08::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L7ce38
    nop
L7ed14::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L7ce5a
    nop
L7ed20::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L7ce7c
    nop
L7ed2c::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L7ceed
    nop
L7ed38::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L7cf06
    nop
L7ed44::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L7cf39
    nop
L7ed50::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L7cf5b
    nop
L7ed5c::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L7cf7d
    nop
L7ed68::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L7cfee
    nop
L7ed74::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L7d007
    nop
L7ed80::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L7d03a
    nop
L7ed8c::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L7d05c
    nop
L7ed98::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L7d07e
    nop
L7eda4::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L7d0f6
    nop
L7edb0::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L7d10f
    nop
L7edbc::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L7d142
    nop
L7edc8::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L7d164
    nop
L7edd4::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L7d186
    nop
L7ede0::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L7d1fe
    nop
L7edec::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L7d217
    nop
L7edf8::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L7d24a
    nop
L7ee04::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L7d26c
    nop
L7ee10::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L7d28e
    nop
L7ee1c::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L7d306
    nop
L7ee28::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L7d31f
    nop
L7ee34::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L7d352
    nop
L7ee40::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L7d374
    nop
L7ee4c::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L7d396
    nop
L7ee58::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L7d485
    nop
L7ee64::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L7d49e
    nop
L7ee70::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L7d4d1
    nop
L7ee7c::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L7d4f3
    nop
L7ee88::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L7d515
    nop
L7ee94::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L7d58d
    nop
L7eea0::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L7d5a6
    nop
L7eeac::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L7d5d9
    nop
L7eeb8::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L7d5fb
    nop
L7eec4::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L7d61d
    nop
L7eed0::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L7d695
    nop
L7eedc::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L7d6ae
    nop
L7eee8::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L7d6e1
    nop
L7eef4::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L7d703
    nop
L7ef00::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L7d725
    nop
L7ef0c::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L7d79d
    nop
L7ef18::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L7d7b6
    nop
L7ef24::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L7d7e9
    nop
L7ef30::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L7d80b
    nop
L7ef3c::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L7d82d
    nop
L7ef48::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L7d8a5
    nop
L7ef54::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L7d8be
    nop
L7ef60::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L7d8f1
    nop
L7ef6c::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L7d913
    nop
L7ef78::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L7d935
    nop
L7ef84::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L7d9ad
    nop
L7ef90::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L7d9c6
    nop
L7ef9c::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L7d9f9
    nop
L7efa8::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L7da1b
    nop
L7efb4::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L7da3d
    nop
L7efc0::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L7dab5
    nop
L7efcc::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L7dace
    nop
L7efd8::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L7db01
    nop
L7efe4::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L7db23
    nop
L7eff0::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L7db45
    nop
L7effc::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L7dbbd
    nop
L7f008::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L7dbd6
    nop
L7f014::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L7dc09
    nop
L7f020::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L7dc2b
    nop
L7f02c::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L7dc4d
    nop
L7f038::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L7dd3f
    nop
L7f044::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L7dd58
    nop
L7f050::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L7dd8f
    nop
L7f05c::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L7ddb1
    nop
L7f068::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L7ddd3
    nop
L7f074::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L7de16
    nop
L7f080::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L7de38
    nop
L7f08c::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L7de8b
    nop
L7f098::
    add esi, 04h
    mov edx, dword ptr [esi+04h]
    or cl, 0e0h
    jmp near ptr L779fa
    mov eax, eax
L7f0a8::
    add esi, 04h
    mov edx, dword ptr [esi+04h]
    or cl, 0e0h
    jmp near ptr L77a08
    mov eax, eax
L7f0b8::
    add esi, 04h
    mov edx, dword ptr [esi+04h]
    or cl, 0e0h
    jmp near ptr L77a29
    mov eax, eax
L7f0c8::
    add esi, 04h
    mov edx, dword ptr [esi+04h]
    or cl, 0e0h
    jmp near ptr L77a37
    mov eax, eax
L7f0d8::
    add esi, 04h
    mov edx, dword ptr [esi+04h]
    or cl, 0e0h
    jmp near ptr L784f6
    mov eax, eax
L7f0e8::
    add esi, 04h
    mov edx, dword ptr [esi+04h]
    or cl, 0e0h
    jmp near ptr L78504
    mov eax, eax
L7f0f8::
    add esi, 04h
    mov edx, dword ptr [esi+04h]
    or cl, 0e0h
    jmp near ptr L78525
    mov eax, eax
L7f108::
    add esi, 04h
    mov edx, dword ptr [esi+04h]
    or cl, 0e0h
    jmp near ptr L78543
    mov eax, eax
L7f118::
    add esi, 04h
    mov edx, dword ptr [esi+04h]
    or cl, 0e0h
    jmp near ptr L78f00
    mov eax, eax
L7f128::
    add esi, 04h
    mov edx, dword ptr [esi+04h]
    or cl, 0e0h
    jmp near ptr L78f68
    mov eax, eax
L7f138::
    add esi, 04h
    mov edx, dword ptr [esi+04h]
    or cl, 0e0h
    jmp near ptr L78fd8
Func7e06c_ endp
    db 08bh, 0c0h
_Data7f148 label byte
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
L7f158 label byte
    db 000h, 000h, 000h, 000h
L7f15c label byte
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
L7f164 label byte
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 08bh, 0c0h
L7f17c label byte
    db 000h, 000h, 08bh, 0c0h, 000h, 000h, 08bh, 0c0h
L7f184 label byte
    db 000h, 000h, 08bh, 0c0h
L7f188 label byte
    db 000h, 000h, 000h, 000h
L7f18c label byte
    db 000h, 000h, 000h, 000h
L7f190 label byte
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
L7f198 label byte
    db 000h, 000h, 000h, 000h
L7f19c label byte
    db 000h, 000h, 000h, 000h
L7f1a0 label byte
    db 000h, 000h, 000h, 000h
L7f1a4 label byte
    db 000h, 000h, 000h, 000h
L7f1a8 label byte
    db 000h, 000h, 000h, 000h
L7f1ac label byte
    db 000h, 000h, 000h, 000h
L7f1b0 label byte
    db 000h, 000h, 000h, 000h
L7f1b4 label byte
    db 000h
L7f1b5 label byte
    db 000h, 000h, 000h
L7f1b8 label byte
    db 001h, 000h, 000h, 000h, 002h, 000h, 000h, 000h, 004h, 000h, 000h, 000h, 008h, 000h, 000h, 000h
    db 010h, 000h, 000h, 000h, 020h, 000h, 000h, 000h, 040h, 000h, 000h, 000h, 080h, 000h, 000h, 000h
    db 000h, 001h, 000h, 000h, 000h, 002h, 000h, 000h, 000h, 004h, 000h, 000h, 000h, 008h, 000h, 000h
    db 000h, 010h, 000h, 000h, 000h, 020h, 000h, 000h, 000h, 040h, 000h, 000h, 000h, 080h, 000h, 000h
    db 000h, 000h, 001h, 000h, 000h, 000h, 002h, 000h, 000h, 000h, 004h, 000h, 000h, 000h, 008h, 000h
    db 000h, 000h, 010h, 000h, 000h, 000h, 020h, 000h, 000h, 000h, 040h, 000h, 000h, 000h, 080h, 000h
    db 000h, 000h, 000h, 001h, 000h, 000h, 000h, 002h, 000h, 000h, 000h, 004h, 000h, 000h, 000h, 008h
    db 000h, 000h, 000h, 010h, 000h, 000h, 000h, 020h, 000h, 000h, 000h, 040h, 000h, 000h, 000h, 080h
L7f238 label byte
    db 000h, 000h, 000h, 000h
L7f23c label byte
    db 000h, 000h, 000h, 000h
L7f240 label byte
    db 000h, 02eh, 08bh, 0c0h
L7f244 label byte
    db 000h, 000h, 000h, 000h
L7f248 label byte
    db 000h, 000h, 000h, 000h
L7f24c label byte
    db 000h, 000h, 000h, 000h
L7f250 label byte
    db 000h, 000h, 000h, 000h
L7f254 label byte
    db 000h, 000h, 000h, 000h
L7f258 label byte
    db 000h, 000h, 000h, 000h
L7f25c label byte
    db 000h, 02eh, 08bh, 0c0h
L7f260 label byte
    db 000h, 000h, 000h, 000h
L7f264 label byte
    db 000h, 000h, 000h, 000h
L7f268 label byte
    db 000h, 000h, 000h, 000h
L7f26c label byte
    db 000h, 000h, 000h, 000h
L7f270 label byte
    db 000h, 000h, 000h, 000h
L7f274 label byte
    db 000h, 02eh, 08bh, 0c0h
L7f278 label byte
    db 000h, 000h, 000h, 000h
L7f27c label byte
    db 000h, 000h, 000h, 000h
L7f280 label byte
    db 000h, 000h, 000h, 000h
L7f284 label byte
    db 000h
L7f285 label byte
    db 000h
L7f286 label byte
    db 000h
L7f287 label byte
    db 000h
L7f288 label byte
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
L7fa88 label byte
    db 000h, 02eh, 08bh, 0c0h
_TEXT ends

_DATA segment
_Dataca740 label byte
    db "$Id: 124D_E.ASM 1.13 1995/12/15 15:05:59 MDV Exp $"
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
_DATA ends

    end

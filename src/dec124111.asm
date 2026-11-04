    .586p

_TEXT segment para public use32 'CODE'
_TEXT ends
_DATA segment dword public use32 'DATA'
_DATA ends

    assume cs:FLAT, ds:FLAT, es:FLAT, ss:FLAT

    public Func86880_
    public Func87428_
    public Func879bd_
    public Func88031_
    public Func895ed_
    public Func8a818_
    public Func8ae58_
    public Func8c16e_
    public Func8c1a7_
    public Func8c2cc_
    public _Data8d328
    public _Dataca7e0

_TEXT segment
Func86880_ proc near
    add eax, eax
    shr ax, 1
    mov dx, ax
    ror eax, 010h
    mov esi, eax
    mov ebx, eax
    mov si, dx
    mov bx, dx
    ret
L86896::
    add eax, eax
    shr ax, 1
    mov ecx, eax
    and ecx, 01f001fh
    add eax, eax
    and eax, 0ffe0ffe0h
    or eax, ecx
    mov dx, ax
    ror eax, 010h
    mov esi, eax
    mov ebx, eax
    mov si, dx
    mov bx, dx
    ret
L868bd::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 01eh
    jae short L868d0
    add esi, 04h
    or cl, 0e0h
L868d0::
    and eax, 03fffffffh
    add eax, eax
    shr ax, 1
    push esi
    mov dx, ax
    ror eax, 010h
    mov esi, eax
    mov ebx, eax
    mov si, dx
    mov bx, dx
    mov dword ptr [edi], ebx
    mov dword ptr [edi+04h], esi
    add edi, 08h
    pop esi
    ret
L868f5::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 01eh
    jae short L86908
    add esi, 04h
    or cl, 0e0h
L86908::
    and eax, 03fffffffh
    add eax, eax
    shr ax, 1
    mov ebx, eax
    and ebx, 01f001fh
    add eax, eax
    and eax, 0ffe0ffe0h
    or eax, ebx
    push esi
    mov dx, ax
    ror eax, 010h
    mov esi, eax
    mov ebx, eax
    mov si, dx
    mov bx, dx
    mov dword ptr [edi], ebx
    mov dword ptr [edi+04h], esi
    add edi, 08h
    pop esi
    ret
L8693e::
    add eax, eax
    shr ax, 1
    mov ebx, eax
    mov dx, ax
    ror ebx, 010h
    mov esi, ebx
    mov si, dx
    ret
L86951::
    add eax, eax
    shr ax, 1
    mov ecx, eax
    and ecx, 01f001fh
    add eax, eax
    and eax, 0ffe0ffe0h
    or eax, ecx
    mov ebx, eax
    mov dx, ax
    ror ebx, 010h
    mov esi, ebx
    mov si, dx
    ret
L86975::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 01eh
    jae short L86988
    add esi, 04h
    or cl, 0e0h
L86988::
    and eax, 03fffffffh
    add eax, eax
    shr ax, 1
    push esi
    mov ebx, eax
    mov dx, ax
    ror ebx, 010h
    mov esi, ebx
    mov si, dx
    mov dword ptr [edi], ebx
    mov dword ptr [edi+04h], esi
    add edi, 08h
    pop esi
    ret
L869aa::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 01eh
    jae short L869bd
    add esi, 04h
    or cl, 0e0h
L869bd::
    and eax, 03fffffffh
    add eax, eax
    shr ax, 1
    mov ebx, eax
    and ebx, 01f001fh
    add eax, eax
    and eax, 0ffe0ffe0h
    or eax, ebx
    push esi
    mov ebx, eax
    mov dx, ax
    ror ebx, 010h
    mov esi, ebx
    mov si, dx
    mov dword ptr [edi], ebx
    mov dword ptr [edi+04h], esi
    add edi, 08h
    pop esi
    ret
L869f0::
    add eax, eax
    shr ax, 1
    mov ebx, eax
    mov dx, ax
    ror eax, 010h
    mov esi, eax
    mov si, dx
    ret
L86a03::
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
    mov esi, eax
    mov si, dx
    ret
L86a27::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 01eh
    jae short L86a3a
    add esi, 04h
    or cl, 0e0h
L86a3a::
    and eax, 03fffffffh
    add eax, eax
    shr ax, 1
    push esi
    mov ebx, eax
    mov dx, ax
    ror eax, 010h
    mov esi, eax
    mov si, dx
    mov dword ptr [edi], ebx
    mov dword ptr [edi+04h], esi
    add edi, 08h
    pop esi
    ret
L86a5c::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 01eh
    jae short L86a6f
    add esi, 04h
    or cl, 0e0h
L86a6f::
    and eax, 03fffffffh
    add eax, eax
    shr ax, 1
    mov ebx, eax
    and ebx, 01f001fh
    add eax, eax
    and eax, 0ffe0ffe0h
    or eax, ebx
    push esi
    mov ebx, eax
    mov dx, ax
    ror eax, 010h
    mov esi, eax
    mov si, dx
    mov dword ptr [edi], ebx
    mov dword ptr [edi+04h], esi
    add edi, 08h
    pop esi
    ret
L86aa2::
    add eax, eax
    shr ax, 1
    mov ebx, eax
    mov dx, ax
    ror eax, 010h
    mov bx, ax
    mov esi, eax
    mov si, dx
    ret
L86ab8::
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
    mov esi, eax
    mov si, dx
    ret
L86adf::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 01eh
    jae short L86af2
    add esi, 04h
    or cl, 0e0h
L86af2::
    and eax, 03fffffffh
    add eax, eax
    shr ax, 1
    push esi
    mov ebx, eax
    mov dx, ax
    ror eax, 010h
    mov bx, ax
    mov esi, eax
    mov si, dx
    mov dword ptr [edi], ebx
    mov dword ptr [edi+04h], esi
    add edi, 08h
    pop esi
    ret
L86b17::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 01eh
    jae short L86b2a
    add esi, 04h
    or cl, 0e0h
L86b2a::
    and eax, 03fffffffh
    add eax, eax
    shr ax, 1
    mov ebx, eax
    and ebx, 01f001fh
    add eax, eax
    and eax, 0ffe0ffe0h
    or eax, ebx
    push esi
    mov ebx, eax
    mov dx, ax
    ror eax, 010h
    mov bx, ax
    mov esi, eax
    mov si, dx
    mov dword ptr [edi], ebx
    mov dword ptr [edi+04h], esi
    add edi, 08h
    pop esi
    ret
L86b60::
    add eax, eax
    shr ax, 1
    mov esi, eax
    mov dx, ax
    ror esi, 010h
    mov ebx, esi
    mov bx, dx
    ret
L86b73::
    add eax, eax
    shr ax, 1
    mov ecx, eax
    and ecx, 01f001fh
    add eax, eax
    and eax, 0ffe0ffe0h
    or eax, ecx
    mov esi, eax
    mov dx, ax
    ror esi, 010h
    mov ebx, esi
    mov bx, dx
    ret
L86b97::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 01eh
    jae short L86baa
    add esi, 04h
    or cl, 0e0h
L86baa::
    and eax, 03fffffffh
    add eax, eax
    shr ax, 1
    push esi
    mov esi, eax
    mov dx, ax
    ror esi, 010h
    mov ebx, esi
    mov bx, dx
    mov dword ptr [edi], ebx
    mov dword ptr [edi+04h], esi
    add edi, 08h
    pop esi
    ret
L86bcc::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 01eh
    jae short L86bdf
    add esi, 04h
    or cl, 0e0h
L86bdf::
    and eax, 03fffffffh
    add eax, eax
    shr ax, 1
    mov ebx, eax
    and ebx, 01f001fh
    add eax, eax
    and eax, 0ffe0ffe0h
    or eax, ebx
    push esi
    mov esi, eax
    mov dx, ax
    ror esi, 010h
    mov ebx, esi
    mov bx, dx
    mov dword ptr [edi], ebx
    mov dword ptr [edi+04h], esi
    add edi, 08h
    pop esi
    ret
L86c12::
    add eax, eax
    shr ax, 1
    ror eax, 010h
    mov esi, eax
    mov ebx, eax
    ret
L86c1f::
    add eax, eax
    shr ax, 1
    mov ecx, eax
    and ecx, 01f001fh
    add eax, eax
    and eax, 0ffe0ffe0h
    or eax, ecx
    ror eax, 010h
    mov esi, eax
    mov ebx, eax
    ret
L86c3d::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 01eh
    jae short L86c50
    add esi, 04h
    or cl, 0e0h
L86c50::
    and eax, 03fffffffh
    add eax, eax
    shr ax, 1
    push esi
    ror eax, 010h
    mov esi, eax
    mov ebx, eax
    mov dword ptr [edi], ebx
    mov dword ptr [edi+04h], esi
    add edi, 08h
    pop esi
    ret
L86c6c::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 01eh
    jae short L86c7f
    add esi, 04h
    or cl, 0e0h
L86c7f::
    and eax, 03fffffffh
    add eax, eax
    shr ax, 1
    mov ebx, eax
    and ebx, 01f001fh
    add eax, eax
    and eax, 0ffe0ffe0h
    or eax, ebx
    push esi
    ror eax, 010h
    mov esi, eax
    mov ebx, eax
    mov dword ptr [edi], ebx
    mov dword ptr [edi+04h], esi
    add edi, 08h
    pop esi
    ret
L86cac::
    add eax, eax
    shr ax, 1
    mov ebx, eax
    ror eax, 010h
    mov esi, eax
    ret
L86cb9::
    add eax, eax
    shr ax, 1
    mov ecx, eax
    and ecx, 01f001fh
    add eax, eax
    and eax, 0ffe0ffe0h
    or eax, ecx
    mov ebx, eax
    ror eax, 010h
    mov esi, eax
    ret
L86cd7::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 01eh
    jae short L86cea
    add esi, 04h
    or cl, 0e0h
L86cea::
    and eax, 03fffffffh
    add eax, eax
    shr ax, 1
    push esi
    mov ebx, eax
    ror eax, 010h
    mov esi, eax
    mov dword ptr [edi], ebx
    mov dword ptr [edi+04h], esi
    add edi, 08h
    pop esi
    ret
L86d06::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 01eh
    jae short L86d19
    add esi, 04h
    or cl, 0e0h
L86d19::
    and eax, 03fffffffh
    add eax, eax
    shr ax, 1
    mov ebx, eax
    and ebx, 01f001fh
    add eax, eax
    and eax, 0ffe0ffe0h
    or eax, ebx
    push esi
    mov ebx, eax
    ror eax, 010h
    mov esi, eax
    mov dword ptr [edi], ebx
    mov dword ptr [edi+04h], esi
    add edi, 08h
    pop esi
    ret
L86d46::
    add eax, eax
    shr ax, 1
    mov ebx, eax
    ror eax, 010h
    mov bx, ax
    mov esi, eax
    ret
L86d56::
    add eax, eax
    shr ax, 1
    mov ecx, eax
    and ecx, 01f001fh
    add eax, eax
    and eax, 0ffe0ffe0h
    or eax, ecx
    mov ebx, eax
    ror eax, 010h
    mov bx, ax
    mov esi, eax
    ret
L86d77::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 01eh
    jae short L86d8a
    add esi, 04h
    or cl, 0e0h
L86d8a::
    and eax, 03fffffffh
    add eax, eax
    shr ax, 1
    push esi
    mov ebx, eax
    ror eax, 010h
    mov bx, ax
    mov esi, eax
    mov dword ptr [edi], ebx
    mov dword ptr [edi+04h], esi
    add edi, 08h
    pop esi
    ret
L86da9::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 01eh
    jae short L86dbc
    add esi, 04h
    or cl, 0e0h
L86dbc::
    and eax, 03fffffffh
    add eax, eax
    shr ax, 1
    mov ebx, eax
    and ebx, 01f001fh
    add eax, eax
    and eax, 0ffe0ffe0h
    or eax, ebx
    push esi
    mov ebx, eax
    ror eax, 010h
    mov bx, ax
    mov esi, eax
    mov dword ptr [edi], ebx
    mov dword ptr [edi+04h], esi
    add edi, 08h
    pop esi
    ret
L86dec::
    add eax, eax
    shr ax, 1
    mov esi, eax
    mov dx, ax
    ror eax, 010h
    mov ebx, eax
    mov bx, dx
    ret
L86dff::
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
    mov ebx, eax
    mov bx, dx
    ret
L86e23::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 01eh
    jae short L86e36
    add esi, 04h
    or cl, 0e0h
L86e36::
    and eax, 03fffffffh
    add eax, eax
    shr ax, 1
    push esi
    mov esi, eax
    mov dx, ax
    ror eax, 010h
    mov ebx, eax
    mov bx, dx
    mov dword ptr [edi], ebx
    mov dword ptr [edi+04h], esi
    add edi, 08h
    pop esi
    ret
L86e58::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 01eh
    jae short L86e6b
    add esi, 04h
    or cl, 0e0h
L86e6b::
    and eax, 03fffffffh
    add eax, eax
    shr ax, 1
    mov ebx, eax
    and ebx, 01f001fh
    add eax, eax
    and eax, 0ffe0ffe0h
    or eax, ebx
    push esi
    mov esi, eax
    mov dx, ax
    ror eax, 010h
    mov ebx, eax
    mov bx, dx
    mov dword ptr [edi], ebx
    mov dword ptr [edi+04h], esi
    add edi, 08h
    pop esi
    ret
L86e9e::
    add eax, eax
    shr ax, 1
    mov esi, eax
    ror eax, 010h
    mov ebx, eax
    ret
L86eab::
    add eax, eax
    shr ax, 1
    mov ecx, eax
    and ecx, 01f001fh
    add eax, eax
    and eax, 0ffe0ffe0h
    or eax, ecx
    mov esi, eax
    ror eax, 010h
    mov ebx, eax
    ret
L86ec9::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 01eh
    jae short L86edc
    add esi, 04h
    or cl, 0e0h
L86edc::
    and eax, 03fffffffh
    add eax, eax
    shr ax, 1
    push esi
    mov esi, eax
    ror eax, 010h
    mov ebx, eax
    mov dword ptr [edi], ebx
    mov dword ptr [edi+04h], esi
    add edi, 08h
    pop esi
    ret
L86ef8::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 01eh
    jae short L86f0b
    add esi, 04h
    or cl, 0e0h
L86f0b::
    and eax, 03fffffffh
    add eax, eax
    shr ax, 1
    mov ebx, eax
    and ebx, 01f001fh
    add eax, eax
    and eax, 0ffe0ffe0h
    or eax, ebx
    push esi
    mov esi, eax
    ror eax, 010h
    mov ebx, eax
    mov dword ptr [edi], ebx
    mov dword ptr [edi+04h], esi
    add edi, 08h
    pop esi
    ret
L86f38::
    add eax, eax
    shr ax, 1
    mov esi, eax
    mov ebx, eax
    ret
L86f42::
    add eax, eax
    shr ax, 1
    mov ecx, eax
    and ecx, 01f001fh
    add eax, eax
    and eax, 0ffe0ffe0h
    or eax, ecx
    mov esi, eax
    mov ebx, eax
    ret
L86f5d::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 01eh
    jae short L86f70
    add esi, 04h
    or cl, 0e0h
L86f70::
    and eax, 03fffffffh
    add eax, eax
    shr ax, 1
    push esi
    mov esi, eax
    mov ebx, eax
    mov dword ptr [edi], ebx
    mov dword ptr [edi+04h], esi
    add edi, 08h
    pop esi
    ret
L86f89::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 01eh
    jae short L86f9c
    add esi, 04h
    or cl, 0e0h
L86f9c::
    and eax, 03fffffffh
    add eax, eax
    shr ax, 1
    mov ebx, eax
    and ebx, 01f001fh
    add eax, eax
    and eax, 0ffe0ffe0h
    or eax, ebx
    push esi
    mov esi, eax
    mov ebx, eax
    mov dword ptr [edi], ebx
    mov dword ptr [edi+04h], esi
    add edi, 08h
    pop esi
    ret
L86fc6::
    add eax, eax
    shr ax, 1
    mov esi, eax
    mov ebx, eax
    ror eax, 010h
    mov bx, ax
    ret
L86fd6::
    add eax, eax
    shr ax, 1
    mov ecx, eax
    and ecx, 01f001fh
    add eax, eax
    and eax, 0ffe0ffe0h
    or eax, ecx
    mov esi, eax
    mov ebx, eax
    ror eax, 010h
    mov bx, ax
    ret
L86ff7::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 01eh
    jae short L8700a
    add esi, 04h
    or cl, 0e0h
L8700a::
    and eax, 03fffffffh
    add eax, eax
    shr ax, 1
    push esi
    mov esi, eax
    mov ebx, eax
    ror eax, 010h
    mov bx, ax
    mov dword ptr [edi], ebx
    mov dword ptr [edi+04h], esi
    add edi, 08h
    pop esi
    ret
L87029::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 01eh
    jae short L8703c
    add esi, 04h
    or cl, 0e0h
L8703c::
    and eax, 03fffffffh
    add eax, eax
    shr ax, 1
    mov ebx, eax
    and ebx, 01f001fh
    add eax, eax
    and eax, 0ffe0ffe0h
    or eax, ebx
    push esi
    mov esi, eax
    mov ebx, eax
    ror eax, 010h
    mov bx, ax
    mov dword ptr [edi], ebx
    mov dword ptr [edi+04h], esi
    add edi, 08h
    pop esi
    ret
L8706c::
    add eax, eax
    shr ax, 1
    mov esi, eax
    mov dx, ax
    ror eax, 010h
    mov si, ax
    mov ebx, eax
    mov bx, dx
    ret
L87082::
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
    mov bx, dx
    ret
L870a9::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 01eh
    jae short L870bc
    add esi, 04h
    or cl, 0e0h
L870bc::
    and eax, 03fffffffh
    add eax, eax
    shr ax, 1
    push esi
    mov esi, eax
    mov dx, ax
    ror eax, 010h
    mov si, ax
    mov ebx, eax
    mov bx, dx
    mov dword ptr [edi], ebx
    mov dword ptr [edi+04h], esi
    add edi, 08h
    pop esi
    ret
L870e1::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 01eh
    jae short L870f4
    add esi, 04h
    or cl, 0e0h
L870f4::
    and eax, 03fffffffh
    add eax, eax
    shr ax, 1
    mov ebx, eax
    and ebx, 01f001fh
    add eax, eax
    and eax, 0ffe0ffe0h
    or eax, ebx
    push esi
    mov esi, eax
    mov dx, ax
    ror eax, 010h
    mov si, ax
    mov ebx, eax
    mov bx, dx
    mov dword ptr [edi], ebx
    mov dword ptr [edi+04h], esi
    add edi, 08h
    pop esi
    ret
L8712a::
    add eax, eax
    shr ax, 1
    mov esi, eax
    ror eax, 010h
    mov si, ax
    mov ebx, eax
    ret
L8713a::
    add eax, eax
    shr ax, 1
    mov ecx, eax
    and ecx, 01f001fh
    add eax, eax
    and eax, 0ffe0ffe0h
    or eax, ecx
    mov esi, eax
    ror eax, 010h
    mov si, ax
    mov ebx, eax
    ret
L8715b::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 01eh
    jae short L8716e
    add esi, 04h
    or cl, 0e0h
L8716e::
    and eax, 03fffffffh
    add eax, eax
    shr ax, 1
    push esi
    mov esi, eax
    ror eax, 010h
    mov si, ax
    mov ebx, eax
    mov dword ptr [edi], ebx
    mov dword ptr [edi+04h], esi
    add edi, 08h
    pop esi
    ret
L8718d::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 01eh
    jae short L871a0
    add esi, 04h
    or cl, 0e0h
L871a0::
    and eax, 03fffffffh
    add eax, eax
    shr ax, 1
    mov ebx, eax
    and ebx, 01f001fh
    add eax, eax
    and eax, 0ffe0ffe0h
    or eax, ebx
    push esi
    mov esi, eax
    ror eax, 010h
    mov si, ax
    mov ebx, eax
    mov dword ptr [edi], ebx
    mov dword ptr [edi+04h], esi
    add edi, 08h
    pop esi
    ret
L871d0::
    add eax, eax
    shr ax, 1
    mov esi, eax
    mov ebx, eax
    ror eax, 010h
    mov si, ax
    ret
L871e0::
    add eax, eax
    shr ax, 1
    mov ecx, eax
    and ecx, 01f001fh
    add eax, eax
    and eax, 0ffe0ffe0h
    or eax, ecx
    mov esi, eax
    mov ebx, eax
    ror eax, 010h
    mov si, ax
    ret
L87201::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 01eh
    jae short L87214
    add esi, 04h
    or cl, 0e0h
L87214::
    and eax, 03fffffffh
    add eax, eax
    shr ax, 1
    push esi
    mov esi, eax
    mov ebx, eax
    ror eax, 010h
    mov si, ax
    mov dword ptr [edi], ebx
    mov dword ptr [edi+04h], esi
    add edi, 08h
    pop esi
    ret
L87233::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 01eh
    jae short L87246
    add esi, 04h
    or cl, 0e0h
L87246::
    and eax, 03fffffffh
    add eax, eax
    shr ax, 1
    mov ebx, eax
    and ebx, 01f001fh
    add eax, eax
    and eax, 0ffe0ffe0h
    or eax, ebx
    push esi
    mov esi, eax
    mov ebx, eax
    ror eax, 010h
    mov si, ax
    mov dword ptr [edi], ebx
    mov dword ptr [edi+04h], esi
    add edi, 08h
    pop esi
    ret
L87276::
    add eax, eax
    shr ax, 1
    mov esi, eax
    mov ebx, eax
    ror eax, 010h
    mov si, ax
    mov bx, ax
    ret
L87289::
    add eax, eax
    shr ax, 1
    mov ecx, eax
    and ecx, 01f001fh
    add eax, eax
    and eax, 0ffe0ffe0h
    or eax, ecx
    mov esi, eax
    mov ebx, eax
    ror eax, 010h
    mov si, ax
    mov bx, ax
    ret
L872ad::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 01eh
    jae short L872c0
    add esi, 04h
    or cl, 0e0h
L872c0::
    and eax, 03fffffffh
    add eax, eax
    shr ax, 1
    push esi
    mov esi, eax
    mov ebx, eax
    ror eax, 010h
    mov si, ax
    mov bx, ax
    mov dword ptr [edi], ebx
    mov dword ptr [edi+04h], esi
    add edi, 08h
    pop esi
    ret
L872e2::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 01eh
    jae short L872f5
    add esi, 04h
    or cl, 0e0h
L872f5::
    and eax, 03fffffffh
    add eax, eax
    shr ax, 1
    mov ebx, eax
    and ebx, 01f001fh
    add eax, eax
    and eax, 0ffe0ffe0h
    or eax, ebx
    push esi
    mov esi, eax
    mov ebx, eax
    ror eax, 010h
    mov si, ax
    mov bx, ax
    mov dword ptr [edi], ebx
    mov dword ptr [edi+04h], esi
    add edi, 08h
    pop esi
    ret
Func86880_ endp
    dd offset L868bd
    dd offset L86975
    dd offset L86a27
    dd offset L86adf
    dd offset L86b97
    dd offset L86c3d
    dd offset L86cd7
    dd offset L86d77
    dd offset L86e23
    dd offset L86ec9
    dd offset L86f5d
    dd offset L86ff7
    dd offset L870a9
    dd offset L8715b
    dd offset L87201
    dd offset L872ad
L87368 label byte
    dd offset L868f5
    dd offset L869aa
    dd offset L86a5c
    dd offset L86b17
    dd offset L86bcc
    dd offset L86c6c
    dd offset L86d06
    dd offset L86da9
    dd offset L86e58
    dd offset L86ef8
    dd offset L86f89
    dd offset L87029
    dd offset L870e1
    dd offset L8718d
    dd offset L87233
    dd offset L872e2
    dd offset Func86880_
    dd offset L8693e
    dd offset L869f0
    dd offset L86aa2
    dd offset L86b60
    dd offset L86c12
    dd offset L86cac
    dd offset L86d46
    dd offset L86dec
    dd offset L86e9e
    dd offset L86f38
    dd offset L86fc6
    dd offset L8706c
    dd offset L8712a
    dd offset L871d0
    dd offset L87276
    dd offset L86896
    dd offset L86951
    dd offset L86a03
    dd offset L86ab8
    dd offset L86b73
    dd offset L86c1f
    dd offset L86cb9
    dd offset L86d56
    dd offset L86dff
    dd offset L86eab
    dd offset L86f42
    dd offset L86fd6
    dd offset L87082
    dd offset L8713a
    dd offset L871e0
    dd offset L87289
Func87428_ proc near
    mov dword ptr [edi], ebx
    mov dword ptr [edi+0500h], esi
    ret
L87431::
    mov dword ptr [edi+04h], ebx
    mov dword ptr [edi+0504h], esi
    ret
L8743b::
    mov dword ptr [edi+08h], ebx
    mov dword ptr [edi+0508h], esi
    ret
L87445::
    mov dword ptr [edi+0ch], ebx
    mov dword ptr [edi+050ch], esi
    ret
L8744f::
    mov dword ptr [edi+0a00h], ebx
    mov dword ptr [edi+0f00h], esi
    ret
L8745c::
    mov dword ptr [edi+0a04h], ebx
    mov dword ptr [edi+0f04h], esi
    ret
L87469::
    mov dword ptr [edi+0a08h], ebx
    mov dword ptr [edi+0f08h], esi
    ret
L87476::
    mov dword ptr [edi+0a0ch], ebx
    mov dword ptr [edi+0f0ch], esi
    ret
L87483::
    mov dword ptr [edi+01400h], ebx
    mov dword ptr [edi+01900h], esi
    ret
L87490::
    mov dword ptr [edi+01404h], ebx
    mov dword ptr [edi+01904h], esi
    ret
L8749d::
    mov dword ptr [edi+01408h], ebx
    mov dword ptr [edi+01908h], esi
    ret
L874aa::
    mov dword ptr [edi+0140ch], ebx
    mov dword ptr [edi+0190ch], esi
    ret
L874b7::
    mov dword ptr [edi+01e00h], ebx
    mov dword ptr [edi+02300h], esi
    ret
L874c4::
    mov dword ptr [edi+01e04h], ebx
    mov dword ptr [edi+02304h], esi
    ret
L874d1::
    mov dword ptr [edi+01e08h], ebx
    mov dword ptr [edi+02308h], esi
    ret
L874de::
    mov dword ptr [edi+01e0ch], ebx
    mov dword ptr [edi+0230ch], esi
    ret
L874eb::
    mov dword ptr [edi], ebx
    cmp di, 0fb00h
    jae short L874fa
    mov dword ptr [edi+0500h], esi
L874fa::
    ret
L874fb::
    cmp di, 0fffch
    jae short L87511
    mov dword ptr [edi+04h], ebx
    cmp di, 0fafch
    jae short L87511
    mov dword ptr [edi+0504h], esi
L87511::
    ret
L87512::
    cmp di, 0fff8h
    jae short L87528
    mov dword ptr [edi+08h], ebx
    cmp di, 0faf8h
    jae short L87528
    mov dword ptr [edi+0508h], esi
L87528::
    ret
L87529::
    cmp di, 0fff4h
    jae short L8753f
    mov dword ptr [edi+0ch], ebx
    cmp di, 0faf4h
    jae short L8753f
    mov dword ptr [edi+050ch], esi
L8753f::
    ret
L87540::
    cmp di, 0f600h
    jae short L8755a
    mov dword ptr [edi+0a00h], ebx
    cmp di, 0f100h
    jae short L8755a
    mov dword ptr [edi+0f00h], esi
L8755a::
    ret
L8755b::
    cmp di, 0f5fch
    jae short L87575
    mov dword ptr [edi+0a04h], ebx
    cmp di, 0f0fch
    jae short L87575
    mov dword ptr [edi+0f04h], esi
L87575::
    ret
L87576::
    cmp di, 0f5f8h
    jae short L87590
    mov dword ptr [edi+0a08h], ebx
    cmp di, 0f0f8h
    jae short L87590
    mov dword ptr [edi+0f08h], esi
L87590::
    ret
L87591::
    cmp di, 0f5f4h
    jae short L875ab
    mov dword ptr [edi+0a0ch], ebx
    cmp di, 0f0f4h
    jae short L875ab
    mov dword ptr [edi+0f0ch], esi
L875ab::
    ret
L875ac::
    cmp di, 0ec00h
    jae short L875c6
    mov dword ptr [edi+01400h], ebx
    cmp di, 0e700h
    jae short L875c6
    mov dword ptr [edi+01900h], esi
L875c6::
    ret
L875c7::
    cmp di, 0ebfch
    jae short L875e1
    mov dword ptr [edi+01404h], ebx
    cmp di, 0e6fch
    jae short L875e1
    mov dword ptr [edi+01904h], esi
L875e1::
    ret
L875e2::
    cmp di, 0ebf8h
    jae short L875fc
    mov dword ptr [edi+01408h], ebx
    cmp di, 0e6f8h
    jae short L875fc
    mov dword ptr [edi+01908h], esi
L875fc::
    ret
L875fd::
    cmp di, 0ebf4h
    jae short L87617
    mov dword ptr [edi+0140ch], ebx
    cmp di, 0e6f4h
    jae short L87617
    mov dword ptr [edi+0190ch], esi
L87617::
    ret
L87618::
    cmp di, 0e200h
    jae short L87632
    mov dword ptr [edi+01e00h], ebx
    cmp di, 0dd00h
    jae short L87632
    mov dword ptr [edi+02300h], esi
L87632::
    ret
L87633::
    cmp di, 0e1fch
    jae short L8764d
    mov dword ptr [edi+01e04h], ebx
    cmp di, 0dcfch
    jae short L8764d
    mov dword ptr [edi+02304h], esi
L8764d::
    ret
L8764e::
    cmp di, 0e1f8h
    jae short L87668
    mov dword ptr [edi+01e08h], ebx
    cmp di, 0dcf8h
    jae short L87668
    mov dword ptr [edi+02308h], esi
L87668::
    ret
L87669::
    cmp di, 0e1f4h
    jae short L87683
    mov dword ptr [edi+01e0ch], ebx
    cmp di, 0dcf4h
    jae short L87683
    mov dword ptr [edi+0230ch], esi
L87683::
    ret
L87684::
    sub edi, 010000h
    cmp di, 0fb00h
    jae short L87695
    jmp short L8769b
    mov dword ptr [edi], ebx
L87695::
    mov dword ptr [edi+0500h], esi
L8769b::
    add edi, 010000h
    ret
L876a2::
    sub edi, 010000h
    cmp di, 0fffch
    jae short L876b7
    cmp di, 0fafch
    jae short L876ba
    jmp short L876c0
L876b7::
    mov dword ptr [edi+04h], ebx
L876ba::
    mov dword ptr [edi+0504h], esi
L876c0::
    add edi, 010000h
    ret
L876c7::
    sub edi, 010000h
    cmp di, 0fff8h
    jae short L876dc
    cmp di, 0faf8h
    jae short L876df
    jmp short L876e5
L876dc::
    mov dword ptr [edi+08h], ebx
L876df::
    mov dword ptr [edi+0508h], esi
L876e5::
    add edi, 010000h
    ret
L876ec::
    sub edi, 010000h
    cmp di, 0fff4h
    jae short L87701
    cmp di, 0faf4h
    jae short L87704
    jmp short L8770a
L87701::
    mov dword ptr [edi+0ch], ebx
L87704::
    mov dword ptr [edi+050ch], esi
L8770a::
    add edi, 010000h
    ret
L87711::
    sub edi, 010000h
    cmp di, 0f600h
    jae short L87727
    cmp di, 0f100h
    jae short L8772d
    jmp short L87733
L87727::
    mov dword ptr [edi+0a00h], ebx
L8772d::
    mov dword ptr [edi+0f00h], esi
L87733::
    add edi, 010000h
    ret
L8773a::
    sub edi, 010000h
    cmp di, 0f5fch
    jae short L87750
    cmp di, 0f0fch
    jae short L87756
    jmp short L8775c
L87750::
    mov dword ptr [edi+0a04h], ebx
L87756::
    mov dword ptr [edi+0f04h], esi
L8775c::
    add edi, 010000h
    ret
L87763::
    sub edi, 010000h
    cmp di, 0f5f8h
    jae short L87779
    cmp di, 0f0f8h
    jae short L8777f
    jmp short L87785
L87779::
    mov dword ptr [edi+0a08h], ebx
L8777f::
    mov dword ptr [edi+0f08h], esi
L87785::
    add edi, 010000h
    ret
L8778c::
    sub edi, 010000h
    cmp di, 0f5f4h
    jae short L877a2
    cmp di, 0f0f4h
    jae short L877a8
    jmp short L877ae
L877a2::
    mov dword ptr [edi+0a0ch], ebx
L877a8::
    mov dword ptr [edi+0f0ch], esi
L877ae::
    add edi, 010000h
    ret
L877b5::
    sub edi, 010000h
    cmp di, 0ec00h
    jae short L877cb
    cmp di, 0e700h
    jae short L877d1
    jmp short L877d7
L877cb::
    mov dword ptr [edi+01400h], ebx
L877d1::
    mov dword ptr [edi+01900h], esi
L877d7::
    add edi, 010000h
    ret
L877de::
    sub edi, 010000h
    cmp di, 0ebfch
    jae short L877f4
    cmp di, 0e6fch
    jae short L877fa
    jmp short L87800
L877f4::
    mov dword ptr [edi+01404h], ebx
L877fa::
    mov dword ptr [edi+01904h], esi
L87800::
    add edi, 010000h
    ret
L87807::
    sub edi, 010000h
    cmp di, 0ebf8h
    jae short L8781d
    cmp di, 0e6f8h
    jae short L87823
    jmp short L87829
L8781d::
    mov dword ptr [edi+01408h], ebx
L87823::
    mov dword ptr [edi+01908h], esi
L87829::
    add edi, 010000h
    ret
L87830::
    sub edi, 010000h
    cmp di, 0ebf4h
    jae short L87846
    cmp di, 0e6f4h
    jae short L8784c
    jmp short L87852
L87846::
    mov dword ptr [edi+0140ch], ebx
L8784c::
    mov dword ptr [edi+0190ch], esi
L87852::
    add edi, 010000h
    ret
L87859::
    sub edi, 010000h
    cmp di, 0e200h
    jae short L8786f
    cmp di, 0dd00h
    jae short L87875
    jmp short L8787b
L8786f::
    mov dword ptr [edi+01e00h], ebx
L87875::
    mov dword ptr [edi+02300h], esi
L8787b::
    add edi, 010000h
    ret
L87882::
    sub edi, 010000h
    cmp di, 0e1fch
    jae short L87898
    cmp di, 0dcfch
    jae short L8789e
    jmp short L878a4
L87898::
    mov dword ptr [edi+01e04h], ebx
L8789e::
    mov dword ptr [edi+02304h], esi
L878a4::
    add edi, 010000h
    ret
L878ab::
    sub edi, 010000h
    cmp di, 0e1f8h
    jae short L878c1
    cmp di, 0dcf8h
    jae short L878c7
    jmp short L878cd
L878c1::
    mov dword ptr [edi+01e08h], ebx
L878c7::
    mov dword ptr [edi+02308h], esi
L878cd::
    add edi, 010000h
    ret
L878d4::
    sub edi, 010000h
    cmp di, 0e1f4h
    jae short L878ea
    cmp di, 0dcf4h
    jae short L878f0
    jmp short L878f6
L878ea::
    mov dword ptr [edi+01e0ch], ebx
L878f0::
    mov dword ptr [edi+0230ch], esi
L878f6::
    add edi, 010000h
    ret
Func87428_ endp
L878fd label byte
    dd offset Func87428_
    dd offset L87431
    dd offset L8743b
    dd offset L87445
    dd offset L8744f
    dd offset L8745c
    dd offset L87469
    dd offset L87476
    dd offset L87483
    dd offset L87490
    dd offset L8749d
    dd offset L874aa
    dd offset L874b7
    dd offset L874c4
    dd offset L874d1
    dd offset L874de
L8793d label byte
    dd offset L874eb
    dd offset L874fb
    dd offset L87512
    dd offset L87529
    dd offset L87540
    dd offset L8755b
    dd offset L87576
    dd offset L87591
    dd offset L875ac
    dd offset L875c7
    dd offset L875e2
    dd offset L875fd
    dd offset L87618
    dd offset L87633
    dd offset L8764e
    dd offset L87669
L8797d label byte
    dd offset L87684
    dd offset L876a2
    dd offset L876c7
    dd offset L876ec
    dd offset L87711
    dd offset L8773a
    dd offset L87763
    dd offset L8778c
    dd offset L877b5
    dd offset L877de
    dd offset L87807
    dd offset L87830
    dd offset L87859
    dd offset L87882
    dd offset L878ab
    dd offset L878d4
Func879bd_ proc near
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
    mov dword ptr [L8d424], eax
    mov edi, dword ptr [ebp+014h]
    mov eax, dword ptr [edi]
    imul eax, dword ptr [edi+04h]
    add edi, 08h
    mov dword ptr [ebp+014h], edi
    mov dword ptr [L8d38c], eax
    mov edi, dword ptr [ebp+010h]
    mov eax, dword ptr [edi]
    mov dword ptr [L8d37c], eax
    mov eax, dword ptr [edi+04h]
    mov dword ptr [L8d380], eax
    mov eax, dword ptr [edi+08h]
    mov dword ptr [L8d384], eax
    mov al, byte ptr [edi+0ch]
    mov byte ptr [L8d45c], al
    mov al, byte ptr [edi+0dh]
    mov byte ptr [L8d45d], al
    mov al, byte ptr [edi+0eh]
    mov byte ptr [L8d45e], al
    mov edi, dword ptr [ebp+0ch]
    mov dword ptr [L8d388], edi
    mov byte ptr [L8d420], 00h
    test dword ptr [L8d424], 07800000h
    je near ptr L8c166
    mov esi, dword ptr [ebp+08h]
    mov dword ptr [L8d428], 00h
    mov dword ptr [L8d41c], 00h
    mov dword ptr [L8d390], 00h
    mov dword ptr [L8d418], 00h
    mov ecx, 0e0h
    mov edx, dword ptr [L8d424]
    test edx, 020000h
    je short L87acc
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 04h
    jb near ptr L8c308
L87a86::
    and eax, 0fh
    mov byte ptr [L8d45c], al
    mov eax, dword ptr [eax*4+L8d398]
    mov dword ptr [L8d390], eax
    cmp eax, 00h
    je short L87ac6
    mov edi, dword ptr [L8d37c]
L87aa5::
    mov eax, dword ptr [esi]
    shrd eax, edx, cl
    add cl, 04h
    jb near ptr L8d2f8
L87ab3::
    and eax, 0fh
    call dword ptr [eax*4+L87368]
    sub dword ptr [L8d390], 01h
    jne short L87aa5
L87ac6::
    mov edx, dword ptr [L8d424]
L87acc::
    test edx, 040000h
    je short L87b31
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 04h
    jb near ptr L8c314
L87ae5::
    and eax, 0fh
    mov byte ptr [L8d45d], al
    mov eax, dword ptr [eax*4+L8d398]
    mul dword ptr [L8d38c]
    mov dword ptr [L8d390], eax
    cmp eax, 00h
    je short L87b2b
    mov edi, dword ptr [L8d380]
L87b0a::
    mov eax, dword ptr [esi]
    shrd eax, edx, cl
    add cl, 04h
    jb near ptr L8d308
L87b18::
    and eax, 0fh
    call dword ptr [eax*4+L87368]
    sub dword ptr [L8d390], 01h
    jne short L87b0a
L87b2b::
    mov edx, dword ptr [L8d424]
L87b31::
    test edx, 080000h
    je short L87b98
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 014h
    jae short L87b4c
    add esi, 04h
    or cl, 0e0h
L87b4c::
    and eax, 0fffffh
    mov dword ptr [L8d390], eax
    cmp eax, 00h
    je short L87b98
    bswap ecx
    mov cl, 00h
    sub eax, 01h
L87b62::
    add cl, 01h
    shr eax, 1
    jne short L87b62
    mov byte ptr [L8d45e], cl
    bswap ecx
    mov edi, dword ptr [L8d384]
L87b77::
    mov eax, dword ptr [esi]
    shrd eax, edx, cl
    add cl, 04h
    jb near ptr L8d318
L87b85::
    and eax, 0fh
    call dword ptr [eax*4+L87368]
    sub dword ptr [L8d390], 01h
    jne short L87b77
L87b98::
    mov edx, dword ptr [L8d380]
    mov dword ptr [L8d418], edx
    bswap ecx
    mov edx, dword ptr [ebp+010h]
    mov cl, byte ptr [L8d45c]
    mov byte ptr [edx+0ch], cl
    mov eax, 01h
    shl eax, cl
    dec eax
    mov dword ptr [L8d458], eax
    mov cl, byte ptr [L8d45e]
    mov byte ptr [edx+0eh], cl
    mov eax, 01h
    shl eax, cl
    dec eax
    mov dword ptr [L8d454], eax
    mov cl, byte ptr [L8d45d]
    mov byte ptr [edx+0dh], cl
    mov eax, 01h
    shl eax, cl
    dec eax
    mov dword ptr [L8d450], eax
    add cl, 03h
    mov byte ptr [L8d45f], cl
    bswap ecx
    xor edx, edx
    mov word ptr [L8d35c], 0ffffh
L87c01::
    mov dword ptr [L8d43c], esi
    mov dword ptr [L8d440], edx
    mov ch, byte ptr [L8d420]
    mov dword ptr [L8d44c], ecx
    mov eax, dword ptr [L8d41c]
    mov dword ptr [L8d448], eax
    mov eax, dword ptr [L8d418]
    mov dword ptr [L8d444], eax
L87c2d::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb near ptr L8c320
L87c3a::
    and eax, 01h
    je short L87c90
    add edx, 01h
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 03h
    jb near ptr L8c32c
L87c53::
    and eax, 07h
    add edx, eax
    cmp eax, 07h
    jl short L87c90
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 07h
    jb near ptr L8c338
L87c6e::
    and eax, 07fh
    add edx, eax
    cmp eax, 07fh
    jl short L87c90
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 0ch
    jb near ptr L8c344
L87c89::
    and eax, 0fffh
    add edx, eax
L87c90::
    bswap ecx
    mov cl, byte ptr [L8d45f]
    mov ebx, edx
    shl ebx, cl
    add dword ptr [L8d418], ebx
    bswap ecx
    add edx, dword ptr [L8d41c]
    cmp edx, dword ptr [L8d38c]
    jae near ptr L8a7c4
    mov dword ptr [L8d41c], edx
    shl edx, 02h
    add edx, dword ptr [ebp+014h]
    mov edi, dword ptr [edx]
    cmp edi, 0ffffffffh
    je near ptr L89132
    cmp edi, 0fffffffeh
    je near ptr L8a7c4
    shld ebx, edi, 010h
    cmp di, 0dcfah
    ja near ptr L89143
    cmp bx, word ptr [L8d35c]
    jne near ptr L8a7e8
L87cf2::
    mov word ptr [L8d35c], bx
    mov dword ptr [L8d378], edi
    and edi, 0ffffh
    or edi, dword ptr [L8d388]
L87d0b::
    mov dword ptr [L8d394], 00h
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb near ptr L8c350
L87d22::
    test al, 01h
    jne near ptr L87fc1
L87d2a::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb near ptr L8c35c
L87d37::
    and eax, 01h
    jne short L87d43
    mov al, byte ptr [L8d420]
    jmp short L87d67
L87d43::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb near ptr L8c368
L87d50::
    and eax, 01h
    mov al, byte ptr [L8d420]
    je short L87d5c
    inc al
L87d5c::
    sub al, 02h
    sbb al, 00h
    and al, 03h
    mov byte ptr [L8d420], al
L87d67::
    or al, al
    je short L87de7
    test al, 02h
    jne short L87d91
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L8d45c]
    jb near ptr L8c374
L87d83::
    and eax, dword ptr [L8d458]
    mov edx, dword ptr [L8d37c]
    jmp short L87db1
L87d91::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L8d45e]
    jb near ptr L8c380
L87da5::
    and eax, dword ptr [L8d454]
    mov edx, dword ptr [L8d384]
L87db1::
    shl eax, 03h
    add edx, eax
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 011h
    jae short L87dc9
    add esi, 04h
    or cl, 0e0h
L87dc9::
    and eax, 01ffffh
    mov dword ptr [L8d368], esi
    mov dword ptr [L8d370], ebp
    mov dword ptr [L8d36c], ecx
    mov ebx, dword ptr [edx]
    mov esi, dword ptr [edx+04h]
    jmp short L87e3b
L87de7::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L8d45d]
    jb near ptr L8c38c
L87dfb::
    and eax, dword ptr [L8d450]
    mov edx, dword ptr [L8d418]
    shl eax, 03h
    add edx, eax
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 011h
    jae short L87e1f
    add esi, 04h
    or cl, 0e0h
L87e1f::
    and eax, 01ffffh
    mov dword ptr [L8d368], esi
    mov dword ptr [L8d370], ebp
    mov dword ptr [L8d36c], ecx
    mov ebx, dword ptr [edx]
    mov esi, dword ptr [edx+04h]
L87e3b::
    or dword ptr [L8d394], eax
    test al, al
    je near ptr L87ede
    test al, 01h
    je short L87ebe
L87e4d::
    mov dword ptr [edi], ebx
    mov dword ptr [edi+0500h], esi
    test al, 02h
    je short L87ec2
L87e59::
    mov dword ptr [edi+04h], ebx
    mov dword ptr [edi+0504h], esi
    test al, 010h
    je short L87ec6
L87e66::
    mov dword ptr [edi+08h], ebx
    mov dword ptr [edi+0508h], esi
    test al, 020h
    je short L87eca
L87e73::
    mov dword ptr [edi+0ch], ebx
    mov dword ptr [edi+050ch], esi
    test al, 04h
    je short L87ece
L87e80::
    mov dword ptr [edi+0a00h], ebx
    mov dword ptr [edi+0f00h], esi
    test al, 08h
    je short L87ed2
L87e90::
    mov dword ptr [edi+0a04h], ebx
    mov dword ptr [edi+0f04h], esi
    test al, 040h
    je short L87ed6
L87ea0::
    mov dword ptr [edi+0a08h], ebx
    mov dword ptr [edi+0f08h], esi
    test al, 080h
    je short L87eda
L87eb0::
    mov dword ptr [edi+0a0ch], ebx
    mov dword ptr [edi+0f0ch], esi
    jmp short L87ede
L87ebe::
    test al, 01h
    jne short L87e4d
L87ec2::
    test al, 02h
    jne short L87e59
L87ec6::
    test al, 010h
    jne short L87e66
L87eca::
    test al, 020h
    jne short L87e73
L87ece::
    test al, 04h
    jne short L87e80
L87ed2::
    test al, 08h
    jne short L87e90
L87ed6::
    test al, 040h
    jne short L87ea0
L87eda::
    test al, 080h
    jne short L87eb0
L87ede::
    test ah, ah
    je near ptr L87fa4
    test ah, 01h
    je near ptr L87f74
L87eef::
    mov dword ptr [edi+01400h], ebx
    mov dword ptr [edi+01900h], esi
    test ah, 02h
    je short L87f7d
L87f00::
    mov dword ptr [edi+01404h], ebx
    mov dword ptr [edi+01904h], esi
    test ah, 010h
    je short L87f86
L87f11::
    mov dword ptr [edi+01408h], ebx
    mov dword ptr [edi+01908h], esi
    test ah, 020h
    je short L87f8b
L87f22::
    mov dword ptr [edi+0140ch], ebx
    mov dword ptr [edi+0190ch], esi
    test ah, 04h
    je short L87f90
L87f33::
    mov dword ptr [edi+01e00h], ebx
    mov dword ptr [edi+02300h], esi
    test ah, 08h
    je short L87f95
L87f44::
    mov dword ptr [edi+01e04h], ebx
    mov dword ptr [edi+02304h], esi
    test ah, 040h
    je short L87f9a
L87f55::
    mov dword ptr [edi+01e08h], ebx
    mov dword ptr [edi+02308h], esi
    test ah, 080h
    je short L87f9f
L87f66::
    mov dword ptr [edi+01e0ch], ebx
    mov dword ptr [edi+0230ch], esi
    jmp short L87fa4
L87f74::
    test ah, 01h
    jne near ptr L87eef
L87f7d::
    test ah, 02h
    jne near ptr L87f00
L87f86::
    test ah, 010h
    jne short L87f11
L87f8b::
    test ah, 020h
    jne short L87f22
L87f90::
    test ah, 04h
    jne short L87f33
L87f95::
    test ah, 08h
    jne short L87f44
L87f9a::
    test ah, 040h
    jne short L87f55
L87f9f::
    test ah, 080h
    jne short L87f66
L87fa4::
    mov esi, dword ptr [L8d368]
    mov ecx, dword ptr [L8d36c]
    mov ebp, dword ptr [L8d370]
    and eax, 010000h
    je near ptr L87d2a
L87fc1::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb near ptr L8c398
L87fce::
    test al, 01h
    jne near ptr L88fd6
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 04h
    jb near ptr L8c3a4
L87fe7::
    and eax, 0fh
    jmp dword ptr [eax*4+L87ff1]
Func879bd_ endp
L87ff1 label byte
    dd offset Func88031_
    dd offset L8804f
    dd offset L88070
    dd offset L88094
    dd offset L880b4
    dd offset L880d6
    dd offset L880fd
    dd offset L88120
    dd offset L88144
    dd offset L88163
    dd offset L88187
    dd offset L881ad
    dd offset L881cd
    dd offset L881e8
    dd offset L88209
    dd offset L88227
Func88031_ proc near
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 010h
    jae short L88044
    add esi, 04h
    or cl, 0e0h
L88044::
    xor dword ptr [L8d394], eax
    jmp near ptr L8822d
L8804f::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 0ch
    jb near ptr L8c3b0
L88060::
    shl eax, 04h
    or al, 0fh
    xor dword ptr [L8d394], eax
    jmp near ptr L8822d
L88070::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 0ch
    jb near ptr L8c3bc
L88081::
    shl eax, 04h
    shr al, 04h
    or al, 0f0h
    xor dword ptr [L8d394], eax
    jmp near ptr L8822d
L88094::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 08h
    jb near ptr L8c3c8
L880a5::
    mov ah, al
    mov al, 0ffh
    xor dword ptr [L8d394], eax
    jmp near ptr L8822d
L880b4::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 0ch
    jb near ptr L8c3d4
L880c5::
    shl ah, 04h
    or ah, 0fh
    xor dword ptr [L8d394], eax
    jmp near ptr L8822d
L880d6::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 08h
    jb near ptr L8c3e0
L880e7::
    shl eax, 04h
    shl ah, 04h
    or eax, 0f0fh
    xor dword ptr [L8d394], eax
    jmp near ptr L8822d
L880fd::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 08h
    jb near ptr L8c3ec
L8810e::
    mov ah, al
    or eax, 0ff0h
    xor dword ptr [L8d394], eax
    jmp near ptr L8822d
L88120::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 04h
    jb near ptr L8c3f8
L88131::
    shl eax, 0ch
    or eax, 0fffh
    xor dword ptr [L8d394], eax
    jmp near ptr L8822d
L88144::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 0ch
    jb near ptr L8c404
L88155::
    or ah, 0f0h
    xor dword ptr [L8d394], eax
    jmp near ptr L8822d
L88163::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 08h
    jb near ptr L8c410
L88174::
    shl eax, 04h
    or eax, 0f00fh
    xor dword ptr [L8d394], eax
    jmp near ptr L8822d
L88187::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 08h
    jb near ptr L8c41c
L88198::
    mov ah, al
    ror ah, 04h
    or eax, 0f0f0h
    xor dword ptr [L8d394], eax
    jmp near ptr L8822d
L881ad::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 04h
    jb near ptr L8c428
L881be::
    mov ah, al
    or eax, 0f0ffh
    xor dword ptr [L8d394], eax
    jmp short L8822d
L881cd::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 08h
    jb near ptr L8c434
L881de::
    mov ah, 0ffh
    xor dword ptr [L8d394], eax
    jmp short L8822d
L881e8::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 04h
    jb near ptr L8c440
L881f9::
    or eax, 0fff0h
    rol al, 04h
    xor dword ptr [L8d394], eax
    jmp short L8822d
L88209::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 04h
    jb near ptr L8c44c
L8821a::
    or eax, 0fff0h
    xor dword ptr [L8d394], eax
    jmp short L8822d
L88227::
    not dword ptr [L8d394]
L8822d::
    test byte ptr [L8d394], 0ffh
    je near ptr L888f7
    test byte ptr [L8d394], 01h
    je near ptr L8888f
L88247::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb near ptr L8c458
L88254::
    and eax, 01h
    jne short L88260
    mov al, byte ptr [L8d420]
    jmp short L88284
L88260::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb near ptr L8c464
L8826d::
    and eax, 01h
    mov al, byte ptr [L8d420]
    je short L88279
    inc al
L88279::
    sub al, 02h
    sbb al, 00h
    and al, 03h
    mov byte ptr [L8d420], al
L88284::
    or al, al
    je short L882d0
    test al, 02h
    jne short L882ae
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L8d45c]
    jb near ptr L8c470
L882a0::
    and eax, dword ptr [L8d458]
    mov edx, dword ptr [L8d37c]
    jmp short L882f0
L882ae::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L8d45e]
    jb near ptr L8c47c
L882c2::
    and eax, dword ptr [L8d454]
    mov edx, dword ptr [L8d384]
    jmp short L882f0
L882d0::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L8d45d]
    jb near ptr L8c488
L882e4::
    and eax, dword ptr [L8d450]
    mov edx, dword ptr [L8d418]
L882f0::
    shl eax, 03h
    add edx, eax
    mov eax, dword ptr [edx]
    mov dword ptr [edi], eax
    mov eax, dword ptr [edx+04h]
    mov dword ptr [edi+0500h], eax
    test byte ptr [L8d394], 02h
    je near ptr L8889c
L8830f::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb near ptr L8c494
L8831c::
    and eax, 01h
    jne short L88328
    mov al, byte ptr [L8d420]
    jmp short L8834c
L88328::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb near ptr L8c4a0
L88335::
    and eax, 01h
    mov al, byte ptr [L8d420]
    je short L88341
    inc al
L88341::
    sub al, 02h
    sbb al, 00h
    and al, 03h
    mov byte ptr [L8d420], al
L8834c::
    or al, al
    je short L88398
    test al, 02h
    jne short L88376
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L8d45c]
    jb near ptr L8c4ac
L88368::
    and eax, dword ptr [L8d458]
    mov edx, dword ptr [L8d37c]
    jmp short L883b8
L88376::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L8d45e]
    jb near ptr L8c4b8
L8838a::
    and eax, dword ptr [L8d454]
    mov edx, dword ptr [L8d384]
    jmp short L883b8
L88398::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L8d45d]
    jb near ptr L8c4c4
L883ac::
    and eax, dword ptr [L8d450]
    mov edx, dword ptr [L8d418]
L883b8::
    shl eax, 03h
    add edx, eax
    mov eax, dword ptr [edx]
    mov dword ptr [edi+04h], eax
    mov eax, dword ptr [edx+04h]
    mov dword ptr [edi+0504h], eax
    test byte ptr [L8d394], 010h
    je near ptr L888a9
L883d8::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb near ptr L8c4d0
L883e5::
    and eax, 01h
    jne short L883f1
    mov al, byte ptr [L8d420]
    jmp short L88415
L883f1::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb near ptr L8c4dc
L883fe::
    and eax, 01h
    mov al, byte ptr [L8d420]
    je short L8840a
    inc al
L8840a::
    sub al, 02h
    sbb al, 00h
    and al, 03h
    mov byte ptr [L8d420], al
L88415::
    or al, al
    je short L88461
    test al, 02h
    jne short L8843f
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L8d45c]
    jb near ptr L8c4e8
L88431::
    and eax, dword ptr [L8d458]
    mov edx, dword ptr [L8d37c]
    jmp short L88481
L8843f::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L8d45e]
    jb near ptr L8c4f4
L88453::
    and eax, dword ptr [L8d454]
    mov edx, dword ptr [L8d384]
    jmp short L88481
L88461::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L8d45d]
    jb near ptr L8c500
L88475::
    and eax, dword ptr [L8d450]
    mov edx, dword ptr [L8d418]
L88481::
    shl eax, 03h
    add edx, eax
    mov eax, dword ptr [edx]
    mov dword ptr [edi+08h], eax
    mov eax, dword ptr [edx+04h]
    mov dword ptr [edi+0508h], eax
    test byte ptr [L8d394], 020h
    je near ptr L888b6
L884a1::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb near ptr L8c50c
L884ae::
    and eax, 01h
    jne short L884ba
    mov al, byte ptr [L8d420]
    jmp short L884de
L884ba::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb near ptr L8c518
L884c7::
    and eax, 01h
    mov al, byte ptr [L8d420]
    je short L884d3
    inc al
L884d3::
    sub al, 02h
    sbb al, 00h
    and al, 03h
    mov byte ptr [L8d420], al
L884de::
    or al, al
    je short L8852a
    test al, 02h
    jne short L88508
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L8d45c]
    jb near ptr L8c524
L884fa::
    and eax, dword ptr [L8d458]
    mov edx, dword ptr [L8d37c]
    jmp short L8854a
L88508::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L8d45e]
    jb near ptr L8c530
L8851c::
    and eax, dword ptr [L8d454]
    mov edx, dword ptr [L8d384]
    jmp short L8854a
L8852a::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L8d45d]
    jb near ptr L8c53c
L8853e::
    and eax, dword ptr [L8d450]
    mov edx, dword ptr [L8d418]
L8854a::
    shl eax, 03h
    add edx, eax
    mov eax, dword ptr [edx]
    mov dword ptr [edi+0ch], eax
    mov eax, dword ptr [edx+04h]
    mov dword ptr [edi+050ch], eax
    test byte ptr [L8d394], 04h
    je near ptr L888c3
L8856a::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb near ptr L8c548
L88577::
    and eax, 01h
    jne short L88583
    mov al, byte ptr [L8d420]
    jmp short L885a7
L88583::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb near ptr L8c554
L88590::
    and eax, 01h
    mov al, byte ptr [L8d420]
    je short L8859c
    inc al
L8859c::
    sub al, 02h
    sbb al, 00h
    and al, 03h
    mov byte ptr [L8d420], al
L885a7::
    or al, al
    je short L885f3
    test al, 02h
    jne short L885d1
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L8d45c]
    jb near ptr L8c560
L885c3::
    and eax, dword ptr [L8d458]
    mov edx, dword ptr [L8d37c]
    jmp short L88613
L885d1::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L8d45e]
    jb near ptr L8c56c
L885e5::
    and eax, dword ptr [L8d454]
    mov edx, dword ptr [L8d384]
    jmp short L88613
L885f3::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L8d45d]
    jb near ptr L8c578
L88607::
    and eax, dword ptr [L8d450]
    mov edx, dword ptr [L8d418]
L88613::
    shl eax, 03h
    add edx, eax
    mov eax, dword ptr [edx]
    mov dword ptr [edi+0a00h], eax
    mov eax, dword ptr [edx+04h]
    mov dword ptr [edi+0f00h], eax
    test byte ptr [L8d394], 08h
    je near ptr L888d0
L88636::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb near ptr L8c584
L88643::
    and eax, 01h
    jne short L8864f
    mov al, byte ptr [L8d420]
    jmp short L88673
L8864f::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb near ptr L8c590
L8865c::
    and eax, 01h
    mov al, byte ptr [L8d420]
    je short L88668
    inc al
L88668::
    sub al, 02h
    sbb al, 00h
    and al, 03h
    mov byte ptr [L8d420], al
L88673::
    or al, al
    je short L886bf
    test al, 02h
    jne short L8869d
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L8d45c]
    jb near ptr L8c59c
L8868f::
    and eax, dword ptr [L8d458]
    mov edx, dword ptr [L8d37c]
    jmp short L886df
L8869d::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L8d45e]
    jb near ptr L8c5a8
L886b1::
    and eax, dword ptr [L8d454]
    mov edx, dword ptr [L8d384]
    jmp short L886df
L886bf::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L8d45d]
    jb near ptr L8c5b4
L886d3::
    and eax, dword ptr [L8d450]
    mov edx, dword ptr [L8d418]
L886df::
    shl eax, 03h
    add edx, eax
    mov eax, dword ptr [edx]
    mov dword ptr [edi+0a04h], eax
    mov eax, dword ptr [edx+04h]
    mov dword ptr [edi+0f04h], eax
    test byte ptr [L8d394], 040h
    je near ptr L888dd
L88702::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb near ptr L8c5c0
L8870f::
    and eax, 01h
    jne short L8871b
    mov al, byte ptr [L8d420]
    jmp short L8873f
L8871b::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb near ptr L8c5cc
L88728::
    and eax, 01h
    mov al, byte ptr [L8d420]
    je short L88734
    inc al
L88734::
    sub al, 02h
    sbb al, 00h
    and al, 03h
    mov byte ptr [L8d420], al
L8873f::
    or al, al
    je short L8878b
    test al, 02h
    jne short L88769
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L8d45c]
    jb near ptr L8c5d8
L8875b::
    and eax, dword ptr [L8d458]
    mov edx, dword ptr [L8d37c]
    jmp short L887ab
L88769::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L8d45e]
    jb near ptr L8c5e4
L8877d::
    and eax, dword ptr [L8d454]
    mov edx, dword ptr [L8d384]
    jmp short L887ab
L8878b::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L8d45d]
    jb near ptr L8c5f0
L8879f::
    and eax, dword ptr [L8d450]
    mov edx, dword ptr [L8d418]
L887ab::
    shl eax, 03h
    add edx, eax
    mov eax, dword ptr [edx]
    mov dword ptr [edi+0a08h], eax
    mov eax, dword ptr [edx+04h]
    mov dword ptr [edi+0f08h], eax
    test byte ptr [L8d394], 080h
    je near ptr L888ea
L887ce::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb near ptr L8c5fc
L887db::
    and eax, 01h
    jne short L887e7
    mov al, byte ptr [L8d420]
    jmp short L8880b
L887e7::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb near ptr L8c608
L887f4::
    and eax, 01h
    mov al, byte ptr [L8d420]
    je short L88800
    inc al
L88800::
    sub al, 02h
    sbb al, 00h
    and al, 03h
    mov byte ptr [L8d420], al
L8880b::
    or al, al
    je short L88857
    test al, 02h
    jne short L88835
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L8d45c]
    jb near ptr L8c614
L88827::
    and eax, dword ptr [L8d458]
    mov edx, dword ptr [L8d37c]
    jmp short L88877
L88835::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L8d45e]
    jb near ptr L8c620
L88849::
    and eax, dword ptr [L8d454]
    mov edx, dword ptr [L8d384]
    jmp short L88877
L88857::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L8d45d]
    jb near ptr L8c62c
L8886b::
    and eax, dword ptr [L8d450]
    mov edx, dword ptr [L8d418]
L88877::
    shl eax, 03h
    add edx, eax
    mov eax, dword ptr [edx]
    mov dword ptr [edi+0a0ch], eax
    mov eax, dword ptr [edx+04h]
    mov dword ptr [edi+0f0ch], eax
    jmp short L888f7
L8888f::
    test byte ptr [L8d394], 01h
    jne near ptr L88247
L8889c::
    test byte ptr [L8d394], 02h
    jne near ptr L8830f
L888a9::
    test byte ptr [L8d394], 010h
    jne near ptr L883d8
L888b6::
    test byte ptr [L8d394], 020h
    jne near ptr L884a1
L888c3::
    test byte ptr [L8d394], 04h
    jne near ptr L8856a
L888d0::
    test byte ptr [L8d394], 08h
    jne near ptr L88636
L888dd::
    test byte ptr [L8d394], 040h
    jne near ptr L88702
L888ea::
    test byte ptr [L8d394], 080h
    jne near ptr L887ce
L888f7::
    test byte ptr [L8d395], 0ffh
    je near ptr L89122
    test byte ptr [L8d395], 01h
    je near ptr L88f69
L88911::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb near ptr L8c638
L8891e::
    and eax, 01h
    jne short L8892a
    mov al, byte ptr [L8d420]
    jmp short L8894e
L8892a::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb near ptr L8c644
L88937::
    and eax, 01h
    mov al, byte ptr [L8d420]
    je short L88943
    inc al
L88943::
    sub al, 02h
    sbb al, 00h
    and al, 03h
    mov byte ptr [L8d420], al
L8894e::
    or al, al
    je short L8899a
    test al, 02h
    jne short L88978
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L8d45c]
    jb near ptr L8c650
L8896a::
    and eax, dword ptr [L8d458]
    mov edx, dword ptr [L8d37c]
    jmp short L889ba
L88978::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L8d45e]
    jb near ptr L8c65c
L8898c::
    and eax, dword ptr [L8d454]
    mov edx, dword ptr [L8d384]
    jmp short L889ba
L8899a::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L8d45d]
    jb near ptr L8c668
L889ae::
    and eax, dword ptr [L8d450]
    mov edx, dword ptr [L8d418]
L889ba::
    shl eax, 03h
    add edx, eax
    mov eax, dword ptr [edx]
    mov dword ptr [edi+01400h], eax
    mov eax, dword ptr [edx+04h]
    mov dword ptr [edi+01900h], eax
    test byte ptr [L8d395], 02h
    je near ptr L88f76
L889dd::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb near ptr L8c674
L889ea::
    and eax, 01h
    jne short L889f6
    mov al, byte ptr [L8d420]
    jmp short L88a1a
L889f6::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb near ptr L8c680
L88a03::
    and eax, 01h
    mov al, byte ptr [L8d420]
    je short L88a0f
    inc al
L88a0f::
    sub al, 02h
    sbb al, 00h
    and al, 03h
    mov byte ptr [L8d420], al
L88a1a::
    or al, al
    je short L88a66
    test al, 02h
    jne short L88a44
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L8d45c]
    jb near ptr L8c68c
L88a36::
    and eax, dword ptr [L8d458]
    mov edx, dword ptr [L8d37c]
    jmp short L88a86
L88a44::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L8d45e]
    jb near ptr L8c698
L88a58::
    and eax, dword ptr [L8d454]
    mov edx, dword ptr [L8d384]
    jmp short L88a86
L88a66::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L8d45d]
    jb near ptr L8c6a4
L88a7a::
    and eax, dword ptr [L8d450]
    mov edx, dword ptr [L8d418]
L88a86::
    shl eax, 03h
    add edx, eax
    mov eax, dword ptr [edx]
    mov dword ptr [edi+01404h], eax
    mov eax, dword ptr [edx+04h]
    mov dword ptr [edi+01904h], eax
    test byte ptr [L8d395], 010h
    je near ptr L88f83
L88aa9::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb near ptr L8c6b0
L88ab6::
    and eax, 01h
    jne short L88ac2
    mov al, byte ptr [L8d420]
    jmp short L88ae6
L88ac2::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb near ptr L8c6bc
L88acf::
    and eax, 01h
    mov al, byte ptr [L8d420]
    je short L88adb
    inc al
L88adb::
    sub al, 02h
    sbb al, 00h
    and al, 03h
    mov byte ptr [L8d420], al
L88ae6::
    or al, al
    je short L88b32
    test al, 02h
    jne short L88b10
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L8d45c]
    jb near ptr L8c6c8
L88b02::
    and eax, dword ptr [L8d458]
    mov edx, dword ptr [L8d37c]
    jmp short L88b52
L88b10::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L8d45e]
    jb near ptr L8c6d4
L88b24::
    and eax, dword ptr [L8d454]
    mov edx, dword ptr [L8d384]
    jmp short L88b52
L88b32::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L8d45d]
    jb near ptr L8c6e0
L88b46::
    and eax, dword ptr [L8d450]
    mov edx, dword ptr [L8d418]
L88b52::
    shl eax, 03h
    add edx, eax
    mov eax, dword ptr [edx]
    mov dword ptr [edi+01408h], eax
    mov eax, dword ptr [edx+04h]
    mov dword ptr [edi+01908h], eax
    test byte ptr [L8d395], 020h
    je near ptr L88f90
L88b75::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb near ptr L8c6ec
L88b82::
    and eax, 01h
    jne short L88b8e
    mov al, byte ptr [L8d420]
    jmp short L88bb2
L88b8e::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb near ptr L8c6f8
L88b9b::
    and eax, 01h
    mov al, byte ptr [L8d420]
    je short L88ba7
    inc al
L88ba7::
    sub al, 02h
    sbb al, 00h
    and al, 03h
    mov byte ptr [L8d420], al
L88bb2::
    or al, al
    je short L88bfe
    test al, 02h
    jne short L88bdc
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L8d45c]
    jb near ptr L8c704
L88bce::
    and eax, dword ptr [L8d458]
    mov edx, dword ptr [L8d37c]
    jmp short L88c1e
L88bdc::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L8d45e]
    jb near ptr L8c710
L88bf0::
    and eax, dword ptr [L8d454]
    mov edx, dword ptr [L8d384]
    jmp short L88c1e
L88bfe::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L8d45d]
    jb near ptr L8c71c
L88c12::
    and eax, dword ptr [L8d450]
    mov edx, dword ptr [L8d418]
L88c1e::
    shl eax, 03h
    add edx, eax
    mov eax, dword ptr [edx]
    mov dword ptr [edi+0140ch], eax
    mov eax, dword ptr [edx+04h]
    mov dword ptr [edi+0190ch], eax
    test byte ptr [L8d395], 04h
    je near ptr L88f9d
L88c41::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb near ptr L8c728
L88c4e::
    and eax, 01h
    jne short L88c5a
    mov al, byte ptr [L8d420]
    jmp short L88c7e
L88c5a::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb near ptr L8c734
L88c67::
    and eax, 01h
    mov al, byte ptr [L8d420]
    je short L88c73
    inc al
L88c73::
    sub al, 02h
    sbb al, 00h
    and al, 03h
    mov byte ptr [L8d420], al
L88c7e::
    or al, al
    je short L88cca
    test al, 02h
    jne short L88ca8
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L8d45c]
    jb near ptr L8c740
L88c9a::
    and eax, dword ptr [L8d458]
    mov edx, dword ptr [L8d37c]
    jmp short L88cea
L88ca8::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L8d45e]
    jb near ptr L8c74c
L88cbc::
    and eax, dword ptr [L8d454]
    mov edx, dword ptr [L8d384]
    jmp short L88cea
L88cca::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L8d45d]
    jb near ptr L8c758
L88cde::
    and eax, dword ptr [L8d450]
    mov edx, dword ptr [L8d418]
L88cea::
    shl eax, 03h
    add edx, eax
    mov eax, dword ptr [edx]
    mov dword ptr [edi+01e00h], eax
    mov eax, dword ptr [edx+04h]
    mov dword ptr [edi+02300h], eax
    test byte ptr [L8d395], 08h
    je near ptr L88faa
L88d0d::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb near ptr L8c764
L88d1a::
    and eax, 01h
    jne short L88d26
    mov al, byte ptr [L8d420]
    jmp short L88d4a
L88d26::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb near ptr L8c770
L88d33::
    and eax, 01h
    mov al, byte ptr [L8d420]
    je short L88d3f
    inc al
L88d3f::
    sub al, 02h
    sbb al, 00h
    and al, 03h
    mov byte ptr [L8d420], al
L88d4a::
    or al, al
    je short L88d96
    test al, 02h
    jne short L88d74
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L8d45c]
    jb near ptr L8c77c
L88d66::
    and eax, dword ptr [L8d458]
    mov edx, dword ptr [L8d37c]
    jmp short L88db6
L88d74::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L8d45e]
    jb near ptr L8c788
L88d88::
    and eax, dword ptr [L8d454]
    mov edx, dword ptr [L8d384]
    jmp short L88db6
L88d96::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L8d45d]
    jb near ptr L8c794
L88daa::
    and eax, dword ptr [L8d450]
    mov edx, dword ptr [L8d418]
L88db6::
    shl eax, 03h
    add edx, eax
    mov eax, dword ptr [edx]
    mov dword ptr [edi+01e04h], eax
    mov eax, dword ptr [edx+04h]
    mov dword ptr [edi+02304h], eax
    test byte ptr [L8d395], 040h
    je near ptr L88fb7
L88dd9::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb near ptr L8c7a0
L88de6::
    and eax, 01h
    jne short L88df2
    mov al, byte ptr [L8d420]
    jmp short L88e16
L88df2::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb near ptr L8c7ac
L88dff::
    and eax, 01h
    mov al, byte ptr [L8d420]
    je short L88e0b
    inc al
L88e0b::
    sub al, 02h
    sbb al, 00h
    and al, 03h
    mov byte ptr [L8d420], al
L88e16::
    or al, al
    je short L88e62
    test al, 02h
    jne short L88e40
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L8d45c]
    jb near ptr L8c7b8
L88e32::
    and eax, dword ptr [L8d458]
    mov edx, dword ptr [L8d37c]
    jmp short L88e82
L88e40::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L8d45e]
    jb near ptr L8c7c4
L88e54::
    and eax, dword ptr [L8d454]
    mov edx, dword ptr [L8d384]
    jmp short L88e82
L88e62::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L8d45d]
    jb near ptr L8c7d0
L88e76::
    and eax, dword ptr [L8d450]
    mov edx, dword ptr [L8d418]
L88e82::
    shl eax, 03h
    add edx, eax
    mov eax, dword ptr [edx]
    mov dword ptr [edi+01e08h], eax
    mov eax, dword ptr [edx+04h]
    mov dword ptr [edi+02308h], eax
    test byte ptr [L8d395], 080h
    je near ptr L88fc4
L88ea5::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb near ptr L8c7dc
L88eb2::
    and eax, 01h
    jne short L88ebe
    mov al, byte ptr [L8d420]
    jmp short L88ee2
L88ebe::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb near ptr L8c7e8
L88ecb::
    and eax, 01h
    mov al, byte ptr [L8d420]
    je short L88ed7
    inc al
L88ed7::
    sub al, 02h
    sbb al, 00h
    and al, 03h
    mov byte ptr [L8d420], al
L88ee2::
    or al, al
    je short L88f2e
    test al, 02h
    jne short L88f0c
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L8d45c]
    jb near ptr L8c7f4
L88efe::
    and eax, dword ptr [L8d458]
    mov edx, dword ptr [L8d37c]
    jmp short L88f4e
L88f0c::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L8d45e]
    jb near ptr L8c800
L88f20::
    and eax, dword ptr [L8d454]
    mov edx, dword ptr [L8d384]
    jmp short L88f4e
L88f2e::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L8d45d]
    jb near ptr L8c80c
L88f42::
    and eax, dword ptr [L8d450]
    mov edx, dword ptr [L8d418]
L88f4e::
    shl eax, 03h
    add edx, eax
    mov eax, dword ptr [edx]
    mov dword ptr [edi+01e0ch], eax
    mov eax, dword ptr [edx+04h]
    mov dword ptr [edi+0230ch], eax
    jmp near ptr L89122
L88f69::
    test byte ptr [L8d395], 01h
    jne near ptr L88911
L88f76::
    test byte ptr [L8d395], 02h
    jne near ptr L889dd
L88f83::
    test byte ptr [L8d395], 010h
    jne near ptr L88aa9
L88f90::
    test byte ptr [L8d395], 020h
    jne near ptr L88b75
L88f9d::
    test byte ptr [L8d395], 04h
    jne near ptr L88c41
L88faa::
    test byte ptr [L8d395], 08h
    jne near ptr L88d0d
L88fb7::
    test byte ptr [L8d395], 040h
    jne near ptr L88dd9
L88fc4::
    test byte ptr [L8d395], 080h
    jne near ptr L88ea5
    jmp near ptr L89122
L88fd6::
    test dword ptr [L8d424], 010000h
    jne near ptr L8910d
    jmp near ptr L89122
L88feb::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb near ptr L8c818
L88ff8::
    and eax, 01h
    jne short L89004
    mov al, byte ptr [L8d420]
    jmp short L89028
L89004::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb near ptr L8c824
L89011::
    and eax, 01h
    mov al, byte ptr [L8d420]
    je short L8901d
    inc al
L8901d::
    sub al, 02h
    sbb al, 00h
    and al, 03h
    mov byte ptr [L8d420], al
L89028::
    or al, al
    je short L890a4
    test al, 02h
    jne short L89052
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L8d45c]
    jb near ptr L8c830
L89044::
    and eax, dword ptr [L8d458]
    mov edx, dword ptr [L8d37c]
    jmp short L89072
L89052::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L8d45e]
    jb near ptr L8c83c
L89066::
    and eax, dword ptr [L8d454]
    mov edx, dword ptr [L8d384]
L89072::
    shl eax, 03h
    add edx, eax
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 04h
    jb near ptr L8c848
L89088::
    and eax, 0fh
    mov dword ptr [L8d368], esi
    mov dword ptr [L8d370], ebp
    mov dword ptr [L8d36c], ecx
    mov ebx, dword ptr [edx]
    mov esi, dword ptr [edx+04h]
    jmp short L890f4
L890a4::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L8d45d]
    jb near ptr L8c854
L890b8::
    and eax, dword ptr [L8d450]
    mov edx, dword ptr [L8d418]
    shl eax, 03h
    add edx, eax
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 04h
    jb near ptr L8c860
L890da::
    and eax, 0fh
    mov dword ptr [L8d368], esi
    mov dword ptr [L8d370], ebp
    mov dword ptr [L8d36c], ecx
    mov ebx, dword ptr [edx]
    mov esi, dword ptr [edx+04h]
L890f4::
    call dword ptr [eax*4+L878fd]
    mov esi, dword ptr [L8d368]
    mov ecx, dword ptr [L8d36c]
    mov ebp, dword ptr [L8d370]
L8910d::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb near ptr L8c86c
L8911a::
    test al, 01h
    je near ptr L88feb
L89122::
    mov edx, 01h
    mov edi, dword ptr [L8d378]
    jmp near ptr L87c01
L89132::
    mov dword ptr [L8d378], edi
    lea edi, [L8d464]
    jmp near ptr L87d0b
L89143::
    cmp bx, word ptr [L8d35c]
    jne near ptr L8c12c
L89150::
    cmp dword ptr [L8d428], 00h
    jne short L8918b
    mov eax, dword ptr [L8d43c]
    mov dword ptr [L8d428], eax
    mov eax, dword ptr [L8d44c]
    mov dword ptr [L8d438], eax
    mov eax, dword ptr [L8d440]
    mov dword ptr [L8d42c], eax
    mov eax, dword ptr [L8d448]
    mov dword ptr [L8d434], eax
    mov eax, dword ptr [L8d444]
    mov dword ptr [L8d430], eax
L8918b::
    mov dword ptr [L8d378], edi
    and edi, 0ffffh
    or edi, dword ptr [L8d388]
    mov dword ptr [L8d394], 00h
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb near ptr L8c878
L891b4::
    test al, 01h
    jne near ptr L8957d
L891bc::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb near ptr L8c884
L891c9::
    and eax, 01h
    jne short L891d5
    mov al, byte ptr [L8d420]
    jmp short L891f9
L891d5::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb near ptr L8c890
L891e2::
    and eax, 01h
    mov al, byte ptr [L8d420]
    je short L891ee
    inc al
L891ee::
    sub al, 02h
    sbb al, 00h
    and al, 03h
    mov byte ptr [L8d420], al
L891f9::
    or al, al
    je short L89279
    test al, 02h
    jne short L89223
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L8d45c]
    jb near ptr L8c89c
L89215::
    and eax, dword ptr [L8d458]
    mov edx, dword ptr [L8d37c]
    jmp short L89243
L89223::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L8d45e]
    jb near ptr L8c8a8
L89237::
    and eax, dword ptr [L8d454]
    mov edx, dword ptr [L8d384]
L89243::
    shl eax, 03h
    add edx, eax
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 011h
    jae short L8925b
    add esi, 04h
    or cl, 0e0h
L8925b::
    and eax, 01ffffh
    mov dword ptr [L8d368], esi
    mov dword ptr [L8d370], ebp
    mov dword ptr [L8d36c], ecx
    mov ebx, dword ptr [edx]
    mov esi, dword ptr [edx+04h]
    jmp short L892cd
L89279::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L8d45d]
    jb near ptr L8c8b4
L8928d::
    and eax, dword ptr [L8d450]
    mov edx, dword ptr [L8d418]
    shl eax, 03h
    add edx, eax
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 011h
    jae short L892b1
    add esi, 04h
    or cl, 0e0h
L892b1::
    and eax, 01ffffh
    mov dword ptr [L8d368], esi
    mov dword ptr [L8d370], ebp
    mov dword ptr [L8d36c], ecx
    mov ebx, dword ptr [edx]
    mov esi, dword ptr [edx+04h]
L892cd::
    or dword ptr [L8d394], eax
    test al, al
    je near ptr L89406
    test al, 01h
    je near ptr L893ce
L892e3::
    mov dword ptr [edi], ebx
    cmp di, 0fb00h
    jae short L892f2
    mov dword ptr [edi+0500h], esi
L892f2::
    test al, 02h
    je near ptr L893d6
L892fa::
    cmp di, 0fffch
    jae short L89310
    mov dword ptr [edi+04h], ebx
    cmp di, 0fafch
    jae short L89310
    mov dword ptr [edi+0504h], esi
L89310::
    test al, 010h
    je near ptr L893de
L89318::
    cmp di, 0fff8h
    jae short L8932e
    mov dword ptr [edi+08h], ebx
    cmp di, 0faf8h
    jae short L8932e
    mov dword ptr [edi+0508h], esi
L8932e::
    test al, 020h
    je near ptr L893e6
L89336::
    cmp di, 0fff4h
    jae short L8934c
    mov dword ptr [edi+0ch], ebx
    cmp di, 0faf4h
    jae short L8934c
    mov dword ptr [edi+050ch], esi
L8934c::
    test al, 04h
    je near ptr L893ee
L89354::
    cmp di, 0f600h
    jae short L8936e
    mov dword ptr [edi+0a00h], ebx
    cmp di, 0f100h
    jae short L8936e
    mov dword ptr [edi+0f00h], esi
L8936e::
    test al, 08h
    je near ptr L893f6
L89376::
    cmp di, 0f5fch
    jae short L89390
    mov dword ptr [edi+0a04h], ebx
    cmp di, 0f0fch
    jae short L89390
    mov dword ptr [edi+0f04h], esi
L89390::
    test al, 040h
    je short L893fe
L89394::
    cmp di, 0f5f8h
    jae short L893ae
    mov dword ptr [edi+0a08h], ebx
    cmp di, 0f0f8h
    jae short L893ae
    mov dword ptr [edi+0f08h], esi
L893ae::
    test al, 080h
    je short L89402
L893b2::
    cmp di, 0f5f4h
    jae short L893cc
    mov dword ptr [edi+0a0ch], ebx
    cmp di, 0f0f4h
    jae short L893cc
    mov dword ptr [edi+0f0ch], esi
L893cc::
    jmp short L89406
L893ce::
    test al, 01h
    jne near ptr L892e3
L893d6::
    test al, 02h
    jne near ptr L892fa
L893de::
    test al, 010h
    jne near ptr L89318
L893e6::
    test al, 020h
    jne near ptr L89336
L893ee::
    test al, 04h
    jne near ptr L89354
L893f6::
    test al, 08h
    jne near ptr L89376
L893fe::
    test al, 040h
    jne short L89394
L89402::
    test al, 080h
    jne short L893b2
L89406::
    test ah, ah
    je near ptr L89560
    test ah, 01h
    je near ptr L89520
L89417::
    cmp di, 0ec00h
    jae short L89431
    mov dword ptr [edi+01400h], ebx
    cmp di, 0e700h
    jae short L89431
    mov dword ptr [edi+01900h], esi
L89431::
    test ah, 02h
    je near ptr L89529
L8943a::
    cmp di, 0ebfch
    jae short L89454
    mov dword ptr [edi+01404h], ebx
    cmp di, 0e6fch
    jae short L89454
    mov dword ptr [edi+01904h], esi
L89454::
    test ah, 010h
    je near ptr L89532
L8945d::
    cmp di, 0ebf8h
    jae short L89477
    mov dword ptr [edi+01408h], ebx
    cmp di, 0e6f8h
    jae short L89477
    mov dword ptr [edi+01908h], esi
L89477::
    test ah, 020h
    je near ptr L8953b
L89480::
    cmp di, 0ebf4h
    jae short L8949a
    mov dword ptr [edi+0140ch], ebx
    cmp di, 0e6f4h
    jae short L8949a
    mov dword ptr [edi+0190ch], esi
L8949a::
    test ah, 04h
    je near ptr L89544
L894a3::
    cmp di, 0e200h
    jae short L894bd
    mov dword ptr [edi+01e00h], ebx
    cmp di, 0dd00h
    jae short L894bd
    mov dword ptr [edi+02300h], esi
L894bd::
    test ah, 08h
    je near ptr L8954d
L894c6::
    cmp di, 0e1fch
    jae short L894e0
    mov dword ptr [edi+01e04h], ebx
    cmp di, 0dcfch
    jae short L894e0
    mov dword ptr [edi+02304h], esi
L894e0::
    test ah, 040h
    je short L89556
L894e5::
    cmp di, 0e1f8h
    jae short L894ff
    mov dword ptr [edi+01e08h], ebx
    cmp di, 0dcf8h
    jae short L894ff
    mov dword ptr [edi+02308h], esi
L894ff::
    test ah, 080h
    je short L8955b
L89504::
    cmp di, 0e1f4h
    jae short L8951e
    mov dword ptr [edi+01e0ch], ebx
    cmp di, 0dcf4h
    jae short L8951e
    mov dword ptr [edi+0230ch], esi
L8951e::
    jmp short L89560
L89520::
    test ah, 01h
    jne near ptr L89417
L89529::
    test ah, 02h
    jne near ptr L8943a
L89532::
    test ah, 010h
    jne near ptr L8945d
L8953b::
    test ah, 020h
    jne near ptr L89480
L89544::
    test ah, 04h
    jne near ptr L894a3
L8954d::
    test ah, 08h
    jne near ptr L894c6
L89556::
    test ah, 040h
    jne short L894e5
L8955b::
    test ah, 080h
    jne short L89504
L89560::
    mov esi, dword ptr [L8d368]
    mov ecx, dword ptr [L8d36c]
    mov ebp, dword ptr [L8d370]
    and eax, 010000h
    je near ptr L891bc
L8957d::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb near ptr L8c8c0
L8958a::
    test al, 01h
    jne near ptr L8a668
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 04h
    jb near ptr L8c8cc
L895a3::
    and eax, 0fh
    jmp dword ptr [eax*4+L895ad]
Func88031_ endp
L895ad label byte
    dd offset Func895ed_
    dd offset L8960b
    dd offset L8962c
    dd offset L89650
    dd offset L89670
    dd offset L89692
    dd offset L896b9
    dd offset L896dc
    dd offset L89700
    dd offset L8971f
    dd offset L89743
    dd offset L89769
    dd offset L89789
    dd offset L897a4
    dd offset L897c5
    dd offset L897e3
Func895ed_ proc near
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 010h
    jae short L89600
    add esi, 04h
    or cl, 0e0h
L89600::
    xor dword ptr [L8d394], eax
    jmp near ptr L897e9
L8960b::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 0ch
    jb near ptr L8c8d8
L8961c::
    shl eax, 04h
    or al, 0fh
    xor dword ptr [L8d394], eax
    jmp near ptr L897e9
L8962c::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 0ch
    jb near ptr L8c8e4
L8963d::
    shl eax, 04h
    shr al, 04h
    or al, 0f0h
    xor dword ptr [L8d394], eax
    jmp near ptr L897e9
L89650::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 08h
    jb near ptr L8c8f0
L89661::
    mov ah, al
    mov al, 0ffh
    xor dword ptr [L8d394], eax
    jmp near ptr L897e9
L89670::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 0ch
    jb near ptr L8c8fc
L89681::
    shl ah, 04h
    or ah, 0fh
    xor dword ptr [L8d394], eax
    jmp near ptr L897e9
L89692::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 08h
    jb near ptr L8c908
L896a3::
    shl eax, 04h
    shl ah, 04h
    or eax, 0f0fh
    xor dword ptr [L8d394], eax
    jmp near ptr L897e9
L896b9::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 08h
    jb near ptr L8c914
L896ca::
    mov ah, al
    or eax, 0ff0h
    xor dword ptr [L8d394], eax
    jmp near ptr L897e9
L896dc::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 04h
    jb near ptr L8c920
L896ed::
    shl eax, 0ch
    or eax, 0fffh
    xor dword ptr [L8d394], eax
    jmp near ptr L897e9
L89700::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 0ch
    jb near ptr L8c92c
L89711::
    or ah, 0f0h
    xor dword ptr [L8d394], eax
    jmp near ptr L897e9
L8971f::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 08h
    jb near ptr L8c938
L89730::
    shl eax, 04h
    or eax, 0f00fh
    xor dword ptr [L8d394], eax
    jmp near ptr L897e9
L89743::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 08h
    jb near ptr L8c944
L89754::
    mov ah, al
    ror ah, 04h
    or eax, 0f0f0h
    xor dword ptr [L8d394], eax
    jmp near ptr L897e9
L89769::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 04h
    jb near ptr L8c950
L8977a::
    mov ah, al
    or eax, 0f0ffh
    xor dword ptr [L8d394], eax
    jmp short L897e9
L89789::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 08h
    jb near ptr L8c95c
L8979a::
    mov ah, 0ffh
    xor dword ptr [L8d394], eax
    jmp short L897e9
L897a4::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 04h
    jb near ptr L8c968
L897b5::
    or eax, 0fff0h
    rol al, 04h
    xor dword ptr [L8d394], eax
    jmp short L897e9
L897c5::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 04h
    jb near ptr L8c974
L897d6::
    or eax, 0fff0h
    xor dword ptr [L8d394], eax
    jmp short L897e9
L897e3::
    not dword ptr [L8d394]
L897e9::
    test byte ptr [L8d394], 0ffh
    je near ptr L89f19
    test byte ptr [L8d394], 01h
    je near ptr L89eb1
L89803::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb near ptr L8c980
L89810::
    and eax, 01h
    jne short L8981c
    mov al, byte ptr [L8d420]
    jmp short L89840
L8981c::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb near ptr L8c98c
L89829::
    and eax, 01h
    mov al, byte ptr [L8d420]
    je short L89835
    inc al
L89835::
    sub al, 02h
    sbb al, 00h
    and al, 03h
    mov byte ptr [L8d420], al
L89840::
    or al, al
    je short L8988c
    test al, 02h
    jne short L8986a
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L8d45c]
    jb near ptr L8c998
L8985c::
    and eax, dword ptr [L8d458]
    mov edx, dword ptr [L8d37c]
    jmp short L898ac
L8986a::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L8d45e]
    jb near ptr L8c9a4
L8987e::
    and eax, dword ptr [L8d454]
    mov edx, dword ptr [L8d384]
    jmp short L898ac
L8988c::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L8d45d]
    jb near ptr L8c9b0
L898a0::
    and eax, dword ptr [L8d450]
    mov edx, dword ptr [L8d418]
L898ac::
    shl eax, 03h
    add edx, eax
    mov eax, dword ptr [edx]
    mov dword ptr [edi], eax
    cmp di, 0fb00h
    jae short L898c5
    mov eax, dword ptr [edx+04h]
    mov dword ptr [edi+0500h], eax
L898c5::
    test byte ptr [L8d394], 02h
    je near ptr L89ebe
L898d2::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb near ptr L8c9bc
L898df::
    and eax, 01h
    jne short L898eb
    mov al, byte ptr [L8d420]
    jmp short L8990f
L898eb::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb near ptr L8c9c8
L898f8::
    and eax, 01h
    mov al, byte ptr [L8d420]
    je short L89904
    inc al
L89904::
    sub al, 02h
    sbb al, 00h
    and al, 03h
    mov byte ptr [L8d420], al
L8990f::
    or al, al
    je short L8995b
    test al, 02h
    jne short L89939
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L8d45c]
    jb near ptr L8c9d4
L8992b::
    and eax, dword ptr [L8d458]
    mov edx, dword ptr [L8d37c]
    jmp short L8997b
L89939::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L8d45e]
    jb near ptr L8c9e0
L8994d::
    and eax, dword ptr [L8d454]
    mov edx, dword ptr [L8d384]
    jmp short L8997b
L8995b::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L8d45d]
    jb near ptr L8c9ec
L8996f::
    and eax, dword ptr [L8d450]
    mov edx, dword ptr [L8d418]
L8997b::
    shl eax, 03h
    add edx, eax
    cmp di, 0fffch
    jae short L8999b
    mov eax, dword ptr [edx]
    mov dword ptr [edi+04h], eax
    cmp di, 0fafch
    jae short L8999b
    mov eax, dword ptr [edx+04h]
    mov dword ptr [edi+0504h], eax
L8999b::
    test byte ptr [L8d394], 010h
    je near ptr L89ecb
L899a8::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb near ptr L8c9f8
L899b5::
    and eax, 01h
    jne short L899c1
    mov al, byte ptr [L8d420]
    jmp short L899e5
L899c1::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb near ptr L8ca04
L899ce::
    and eax, 01h
    mov al, byte ptr [L8d420]
    je short L899da
    inc al
L899da::
    sub al, 02h
    sbb al, 00h
    and al, 03h
    mov byte ptr [L8d420], al
L899e5::
    or al, al
    je short L89a31
    test al, 02h
    jne short L89a0f
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L8d45c]
    jb near ptr L8ca10
L89a01::
    and eax, dword ptr [L8d458]
    mov edx, dword ptr [L8d37c]
    jmp short L89a51
L89a0f::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L8d45e]
    jb near ptr L8ca1c
L89a23::
    and eax, dword ptr [L8d454]
    mov edx, dword ptr [L8d384]
    jmp short L89a51
L89a31::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L8d45d]
    jb near ptr L8ca28
L89a45::
    and eax, dword ptr [L8d450]
    mov edx, dword ptr [L8d418]
L89a51::
    shl eax, 03h
    add edx, eax
    cmp di, 0fff8h
    jae short L89a71
    mov eax, dword ptr [edx]
    mov dword ptr [edi+08h], eax
    cmp di, 0faf8h
    jae short L89a71
    mov eax, dword ptr [edx+04h]
    mov dword ptr [edi+0508h], eax
L89a71::
    test byte ptr [L8d394], 020h
    je near ptr L89ed8
L89a7e::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb near ptr L8ca34
L89a8b::
    and eax, 01h
    jne short L89a97
    mov al, byte ptr [L8d420]
    jmp short L89abb
L89a97::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb near ptr L8ca40
L89aa4::
    and eax, 01h
    mov al, byte ptr [L8d420]
    je short L89ab0
    inc al
L89ab0::
    sub al, 02h
    sbb al, 00h
    and al, 03h
    mov byte ptr [L8d420], al
L89abb::
    or al, al
    je short L89b07
    test al, 02h
    jne short L89ae5
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L8d45c]
    jb near ptr L8ca4c
L89ad7::
    and eax, dword ptr [L8d458]
    mov edx, dword ptr [L8d37c]
    jmp short L89b27
L89ae5::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L8d45e]
    jb near ptr L8ca58
L89af9::
    and eax, dword ptr [L8d454]
    mov edx, dword ptr [L8d384]
    jmp short L89b27
L89b07::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L8d45d]
    jb near ptr L8ca64
L89b1b::
    and eax, dword ptr [L8d450]
    mov edx, dword ptr [L8d418]
L89b27::
    shl eax, 03h
    add edx, eax
    cmp di, 0fff4h
    jae short L89b47
    mov eax, dword ptr [edx]
    mov dword ptr [edi+0ch], eax
    cmp di, 0faf4h
    jae short L89b47
    mov eax, dword ptr [edx+04h]
    mov dword ptr [edi+050ch], eax
L89b47::
    test byte ptr [L8d394], 04h
    je near ptr L89ee5
L89b54::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb near ptr L8ca70
L89b61::
    and eax, 01h
    jne short L89b6d
    mov al, byte ptr [L8d420]
    jmp short L89b91
L89b6d::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb near ptr L8ca7c
L89b7a::
    and eax, 01h
    mov al, byte ptr [L8d420]
    je short L89b86
    inc al
L89b86::
    sub al, 02h
    sbb al, 00h
    and al, 03h
    mov byte ptr [L8d420], al
L89b91::
    or al, al
    je short L89bdd
    test al, 02h
    jne short L89bbb
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L8d45c]
    jb near ptr L8ca88
L89bad::
    and eax, dword ptr [L8d458]
    mov edx, dword ptr [L8d37c]
    jmp short L89bfd
L89bbb::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L8d45e]
    jb near ptr L8ca94
L89bcf::
    and eax, dword ptr [L8d454]
    mov edx, dword ptr [L8d384]
    jmp short L89bfd
L89bdd::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L8d45d]
    jb near ptr L8caa0
L89bf1::
    and eax, dword ptr [L8d450]
    mov edx, dword ptr [L8d418]
L89bfd::
    shl eax, 03h
    add edx, eax
    cmp di, 0f600h
    jae short L89c21
    mov eax, dword ptr [edx]
    mov dword ptr [edi+0a00h], eax
    cmp di, 0f100h
    jae short L89c21
    mov eax, dword ptr [edx+04h]
    mov dword ptr [edi+0f00h], eax
L89c21::
    test byte ptr [L8d394], 08h
    je near ptr L89ef2
L89c2e::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb near ptr L8caac
L89c3b::
    and eax, 01h
    jne short L89c47
    mov al, byte ptr [L8d420]
    jmp short L89c6b
L89c47::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb near ptr L8cab8
L89c54::
    and eax, 01h
    mov al, byte ptr [L8d420]
    je short L89c60
    inc al
L89c60::
    sub al, 02h
    sbb al, 00h
    and al, 03h
    mov byte ptr [L8d420], al
L89c6b::
    or al, al
    je short L89cb7
    test al, 02h
    jne short L89c95
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L8d45c]
    jb near ptr L8cac4
L89c87::
    and eax, dword ptr [L8d458]
    mov edx, dword ptr [L8d37c]
    jmp short L89cd7
L89c95::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L8d45e]
    jb near ptr L8cad0
L89ca9::
    and eax, dword ptr [L8d454]
    mov edx, dword ptr [L8d384]
    jmp short L89cd7
L89cb7::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L8d45d]
    jb near ptr L8cadc
L89ccb::
    and eax, dword ptr [L8d450]
    mov edx, dword ptr [L8d418]
L89cd7::
    shl eax, 03h
    add edx, eax
    cmp di, 0f5fch
    jae short L89cfb
    mov eax, dword ptr [edx]
    mov dword ptr [edi+0a04h], eax
    cmp di, 0f0fch
    jae short L89cfb
    mov eax, dword ptr [edx+04h]
    mov dword ptr [edi+0f04h], eax
L89cfb::
    test byte ptr [L8d394], 040h
    je near ptr L89eff
L89d08::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb near ptr L8cae8
L89d15::
    and eax, 01h
    jne short L89d21
    mov al, byte ptr [L8d420]
    jmp short L89d45
L89d21::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb near ptr L8caf4
L89d2e::
    and eax, 01h
    mov al, byte ptr [L8d420]
    je short L89d3a
    inc al
L89d3a::
    sub al, 02h
    sbb al, 00h
    and al, 03h
    mov byte ptr [L8d420], al
L89d45::
    or al, al
    je short L89d91
    test al, 02h
    jne short L89d6f
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L8d45c]
    jb near ptr L8cb00
L89d61::
    and eax, dword ptr [L8d458]
    mov edx, dword ptr [L8d37c]
    jmp short L89db1
L89d6f::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L8d45e]
    jb near ptr L8cb0c
L89d83::
    and eax, dword ptr [L8d454]
    mov edx, dword ptr [L8d384]
    jmp short L89db1
L89d91::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L8d45d]
    jb near ptr L8cb18
L89da5::
    and eax, dword ptr [L8d450]
    mov edx, dword ptr [L8d418]
L89db1::
    shl eax, 03h
    add edx, eax
    cmp di, 0f5f8h
    jae short L89dd5
    mov eax, dword ptr [edx]
    mov dword ptr [edi+0a08h], eax
    cmp di, 0f0f8h
    jae short L89dd5
    mov eax, dword ptr [edx+04h]
    mov dword ptr [edi+0f08h], eax
L89dd5::
    test byte ptr [L8d394], 080h
    je near ptr L89f0c
L89de2::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb near ptr L8cb24
L89def::
    and eax, 01h
    jne short L89dfb
    mov al, byte ptr [L8d420]
    jmp short L89e1f
L89dfb::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb near ptr L8cb30
L89e08::
    and eax, 01h
    mov al, byte ptr [L8d420]
    je short L89e14
    inc al
L89e14::
    sub al, 02h
    sbb al, 00h
    and al, 03h
    mov byte ptr [L8d420], al
L89e1f::
    or al, al
    je short L89e6b
    test al, 02h
    jne short L89e49
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L8d45c]
    jb near ptr L8cb3c
L89e3b::
    and eax, dword ptr [L8d458]
    mov edx, dword ptr [L8d37c]
    jmp short L89e8b
L89e49::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L8d45e]
    jb near ptr L8cb48
L89e5d::
    and eax, dword ptr [L8d454]
    mov edx, dword ptr [L8d384]
    jmp short L89e8b
L89e6b::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L8d45d]
    jb near ptr L8cb54
L89e7f::
    and eax, dword ptr [L8d450]
    mov edx, dword ptr [L8d418]
L89e8b::
    shl eax, 03h
    add edx, eax
    cmp di, 0f5f4h
    jae short L89eaf
    mov eax, dword ptr [edx]
    mov dword ptr [edi+0a0ch], eax
    cmp di, 0f0f4h
    jae short L89eaf
    mov eax, dword ptr [edx+04h]
    mov dword ptr [edi+0f0ch], eax
L89eaf::
    jmp short L89f19
L89eb1::
    test byte ptr [L8d394], 01h
    jne near ptr L89803
L89ebe::
    test byte ptr [L8d394], 02h
    jne near ptr L898d2
L89ecb::
    test byte ptr [L8d394], 010h
    jne near ptr L899a8
L89ed8::
    test byte ptr [L8d394], 020h
    jne near ptr L89a7e
L89ee5::
    test byte ptr [L8d394], 04h
    jne near ptr L89b54
L89ef2::
    test byte ptr [L8d394], 08h
    jne near ptr L89c2e
L89eff::
    test byte ptr [L8d394], 040h
    jne near ptr L89d08
L89f0c::
    test byte ptr [L8d394], 080h
    jne near ptr L89de2
L89f19::
    test byte ptr [L8d395], 0ffh
    je near ptr L8a7b4
    test byte ptr [L8d395], 01h
    je near ptr L8a5fb
L89f33::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb near ptr L8cb60
L89f40::
    and eax, 01h
    jne short L89f4c
    mov al, byte ptr [L8d420]
    jmp short L89f70
L89f4c::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb near ptr L8cb6c
L89f59::
    and eax, 01h
    mov al, byte ptr [L8d420]
    je short L89f65
    inc al
L89f65::
    sub al, 02h
    sbb al, 00h
    and al, 03h
    mov byte ptr [L8d420], al
L89f70::
    or al, al
    je short L89fbc
    test al, 02h
    jne short L89f9a
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L8d45c]
    jb near ptr L8cb78
L89f8c::
    and eax, dword ptr [L8d458]
    mov edx, dword ptr [L8d37c]
    jmp short L89fdc
L89f9a::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L8d45e]
    jb near ptr L8cb84
L89fae::
    and eax, dword ptr [L8d454]
    mov edx, dword ptr [L8d384]
    jmp short L89fdc
L89fbc::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L8d45d]
    jb near ptr L8cb90
L89fd0::
    and eax, dword ptr [L8d450]
    mov edx, dword ptr [L8d418]
L89fdc::
    shl eax, 03h
    add edx, eax
    cmp di, 0ec00h
    jae short L8a000
    mov eax, dword ptr [edx]
    mov dword ptr [edi+01400h], eax
    cmp di, 0e700h
    jae short L8a000
    mov eax, dword ptr [edx+04h]
    mov dword ptr [edi+01900h], eax
L8a000::
    test byte ptr [L8d395], 02h
    je near ptr L8a608
L8a00d::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb near ptr L8cb9c
L8a01a::
    and eax, 01h
    jne short L8a026
    mov al, byte ptr [L8d420]
    jmp short L8a04a
L8a026::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb near ptr L8cba8
L8a033::
    and eax, 01h
    mov al, byte ptr [L8d420]
    je short L8a03f
    inc al
L8a03f::
    sub al, 02h
    sbb al, 00h
    and al, 03h
    mov byte ptr [L8d420], al
L8a04a::
    or al, al
    je short L8a096
    test al, 02h
    jne short L8a074
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L8d45c]
    jb near ptr L8cbb4
L8a066::
    and eax, dword ptr [L8d458]
    mov edx, dword ptr [L8d37c]
    jmp short L8a0b6
L8a074::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L8d45e]
    jb near ptr L8cbc0
L8a088::
    and eax, dword ptr [L8d454]
    mov edx, dword ptr [L8d384]
    jmp short L8a0b6
L8a096::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L8d45d]
    jb near ptr L8cbcc
L8a0aa::
    and eax, dword ptr [L8d450]
    mov edx, dword ptr [L8d418]
L8a0b6::
    shl eax, 03h
    add edx, eax
    cmp di, 0ebfch
    jae short L8a0da
    mov eax, dword ptr [edx]
    mov dword ptr [edi+01404h], eax
    cmp di, 0e6fch
    jae short L8a0da
    mov eax, dword ptr [edx+04h]
    mov dword ptr [edi+01904h], eax
L8a0da::
    test byte ptr [L8d395], 010h
    je near ptr L8a615
L8a0e7::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb near ptr L8cbd8
L8a0f4::
    and eax, 01h
    jne short L8a100
    mov al, byte ptr [L8d420]
    jmp short L8a124
L8a100::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb near ptr L8cbe4
L8a10d::
    and eax, 01h
    mov al, byte ptr [L8d420]
    je short L8a119
    inc al
L8a119::
    sub al, 02h
    sbb al, 00h
    and al, 03h
    mov byte ptr [L8d420], al
L8a124::
    or al, al
    je short L8a170
    test al, 02h
    jne short L8a14e
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L8d45c]
    jb near ptr L8cbf0
L8a140::
    and eax, dword ptr [L8d458]
    mov edx, dword ptr [L8d37c]
    jmp short L8a190
L8a14e::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L8d45e]
    jb near ptr L8cbfc
L8a162::
    and eax, dword ptr [L8d454]
    mov edx, dword ptr [L8d384]
    jmp short L8a190
L8a170::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L8d45d]
    jb near ptr L8cc08
L8a184::
    and eax, dword ptr [L8d450]
    mov edx, dword ptr [L8d418]
L8a190::
    shl eax, 03h
    add edx, eax
    cmp di, 0ebf8h
    jae short L8a1b4
    mov eax, dword ptr [edx]
    mov dword ptr [edi+01408h], eax
    cmp di, 0e6f8h
    jae short L8a1b4
    mov eax, dword ptr [edx+04h]
    mov dword ptr [edi+01908h], eax
L8a1b4::
    test byte ptr [L8d395], 020h
    je near ptr L8a622
L8a1c1::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb near ptr L8cc14
L8a1ce::
    and eax, 01h
    jne short L8a1da
    mov al, byte ptr [L8d420]
    jmp short L8a1fe
L8a1da::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb near ptr L8cc20
L8a1e7::
    and eax, 01h
    mov al, byte ptr [L8d420]
    je short L8a1f3
    inc al
L8a1f3::
    sub al, 02h
    sbb al, 00h
    and al, 03h
    mov byte ptr [L8d420], al
L8a1fe::
    or al, al
    je short L8a24a
    test al, 02h
    jne short L8a228
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L8d45c]
    jb near ptr L8cc2c
L8a21a::
    and eax, dword ptr [L8d458]
    mov edx, dword ptr [L8d37c]
    jmp short L8a26a
L8a228::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L8d45e]
    jb near ptr L8cc38
L8a23c::
    and eax, dword ptr [L8d454]
    mov edx, dword ptr [L8d384]
    jmp short L8a26a
L8a24a::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L8d45d]
    jb near ptr L8cc44
L8a25e::
    and eax, dword ptr [L8d450]
    mov edx, dword ptr [L8d418]
L8a26a::
    shl eax, 03h
    add edx, eax
    cmp di, 0ebf4h
    jae short L8a28e
    mov eax, dword ptr [edx]
    mov dword ptr [edi+0140ch], eax
    cmp di, 0e6f4h
    jae short L8a28e
    mov eax, dword ptr [edx+04h]
    mov dword ptr [edi+0190ch], eax
L8a28e::
    test byte ptr [L8d395], 04h
    je near ptr L8a62f
L8a29b::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb near ptr L8cc50
L8a2a8::
    and eax, 01h
    jne short L8a2b4
    mov al, byte ptr [L8d420]
    jmp short L8a2d8
L8a2b4::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb near ptr L8cc5c
L8a2c1::
    and eax, 01h
    mov al, byte ptr [L8d420]
    je short L8a2cd
    inc al
L8a2cd::
    sub al, 02h
    sbb al, 00h
    and al, 03h
    mov byte ptr [L8d420], al
L8a2d8::
    or al, al
    je short L8a324
    test al, 02h
    jne short L8a302
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L8d45c]
    jb near ptr L8cc68
L8a2f4::
    and eax, dword ptr [L8d458]
    mov edx, dword ptr [L8d37c]
    jmp short L8a344
L8a302::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L8d45e]
    jb near ptr L8cc74
L8a316::
    and eax, dword ptr [L8d454]
    mov edx, dword ptr [L8d384]
    jmp short L8a344
L8a324::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L8d45d]
    jb near ptr L8cc80
L8a338::
    and eax, dword ptr [L8d450]
    mov edx, dword ptr [L8d418]
L8a344::
    shl eax, 03h
    add edx, eax
    cmp di, 0e200h
    jae short L8a368
    mov eax, dword ptr [edx]
    mov dword ptr [edi+01e00h], eax
    cmp di, 0dd00h
    jae short L8a368
    mov eax, dword ptr [edx+04h]
    mov dword ptr [edi+02300h], eax
L8a368::
    test byte ptr [L8d395], 08h
    je near ptr L8a63c
L8a375::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb near ptr L8cc8c
L8a382::
    and eax, 01h
    jne short L8a38e
    mov al, byte ptr [L8d420]
    jmp short L8a3b2
L8a38e::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb near ptr L8cc98
L8a39b::
    and eax, 01h
    mov al, byte ptr [L8d420]
    je short L8a3a7
    inc al
L8a3a7::
    sub al, 02h
    sbb al, 00h
    and al, 03h
    mov byte ptr [L8d420], al
L8a3b2::
    or al, al
    je short L8a3fe
    test al, 02h
    jne short L8a3dc
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L8d45c]
    jb near ptr L8cca4
L8a3ce::
    and eax, dword ptr [L8d458]
    mov edx, dword ptr [L8d37c]
    jmp short L8a41e
L8a3dc::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L8d45e]
    jb near ptr L8ccb0
L8a3f0::
    and eax, dword ptr [L8d454]
    mov edx, dword ptr [L8d384]
    jmp short L8a41e
L8a3fe::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L8d45d]
    jb near ptr L8ccbc
L8a412::
    and eax, dword ptr [L8d450]
    mov edx, dword ptr [L8d418]
L8a41e::
    shl eax, 03h
    add edx, eax
    cmp di, 0e1fch
    jae short L8a442
    mov eax, dword ptr [edx]
    mov dword ptr [edi+01e04h], eax
    cmp di, 0dcfch
    jae short L8a442
    mov eax, dword ptr [edx+04h]
    mov dword ptr [edi+02304h], eax
L8a442::
    test byte ptr [L8d395], 040h
    je near ptr L8a649
L8a44f::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb near ptr L8ccc8
L8a45c::
    and eax, 01h
    jne short L8a468
    mov al, byte ptr [L8d420]
    jmp short L8a48c
L8a468::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb near ptr L8ccd4
L8a475::
    and eax, 01h
    mov al, byte ptr [L8d420]
    je short L8a481
    inc al
L8a481::
    sub al, 02h
    sbb al, 00h
    and al, 03h
    mov byte ptr [L8d420], al
L8a48c::
    or al, al
    je short L8a4d8
    test al, 02h
    jne short L8a4b6
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L8d45c]
    jb near ptr L8cce0
L8a4a8::
    and eax, dword ptr [L8d458]
    mov edx, dword ptr [L8d37c]
    jmp short L8a4f8
L8a4b6::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L8d45e]
    jb near ptr L8ccec
L8a4ca::
    and eax, dword ptr [L8d454]
    mov edx, dword ptr [L8d384]
    jmp short L8a4f8
L8a4d8::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L8d45d]
    jb near ptr L8ccf8
L8a4ec::
    and eax, dword ptr [L8d450]
    mov edx, dword ptr [L8d418]
L8a4f8::
    shl eax, 03h
    add edx, eax
    cmp di, 0e1f8h
    jae short L8a51c
    mov eax, dword ptr [edx]
    mov dword ptr [edi+01e08h], eax
    cmp di, 0dcf8h
    jae short L8a51c
    mov eax, dword ptr [edx+04h]
    mov dword ptr [edi+02308h], eax
L8a51c::
    test byte ptr [L8d395], 080h
    je near ptr L8a656
L8a529::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb near ptr L8cd04
L8a536::
    and eax, 01h
    jne short L8a542
    mov al, byte ptr [L8d420]
    jmp short L8a566
L8a542::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb near ptr L8cd10
L8a54f::
    and eax, 01h
    mov al, byte ptr [L8d420]
    je short L8a55b
    inc al
L8a55b::
    sub al, 02h
    sbb al, 00h
    and al, 03h
    mov byte ptr [L8d420], al
L8a566::
    or al, al
    je short L8a5b2
    test al, 02h
    jne short L8a590
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L8d45c]
    jb near ptr L8cd1c
L8a582::
    and eax, dword ptr [L8d458]
    mov edx, dword ptr [L8d37c]
    jmp short L8a5d2
L8a590::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L8d45e]
    jb near ptr L8cd28
L8a5a4::
    and eax, dword ptr [L8d454]
    mov edx, dword ptr [L8d384]
    jmp short L8a5d2
L8a5b2::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L8d45d]
    jb near ptr L8cd34
L8a5c6::
    and eax, dword ptr [L8d450]
    mov edx, dword ptr [L8d418]
L8a5d2::
    shl eax, 03h
    add edx, eax
    cmp di, 0e1f4h
    jae short L8a5f6
    mov eax, dword ptr [edx]
    mov dword ptr [edi+01e0ch], eax
    cmp di, 0dcf4h
    jae short L8a5f6
    mov eax, dword ptr [edx+04h]
    mov dword ptr [edi+0230ch], eax
L8a5f6::
    jmp near ptr L8a7b4
L8a5fb::
    test byte ptr [L8d395], 01h
    jne near ptr L89f33
L8a608::
    test byte ptr [L8d395], 02h
    jne near ptr L8a00d
L8a615::
    test byte ptr [L8d395], 010h
    jne near ptr L8a0e7
L8a622::
    test byte ptr [L8d395], 020h
    jne near ptr L8a1c1
L8a62f::
    test byte ptr [L8d395], 04h
    jne near ptr L8a29b
L8a63c::
    test byte ptr [L8d395], 08h
    jne near ptr L8a375
L8a649::
    test byte ptr [L8d395], 040h
    jne near ptr L8a44f
L8a656::
    test byte ptr [L8d395], 080h
    jne near ptr L8a529
    jmp near ptr L8a7b4
L8a668::
    test dword ptr [L8d424], 010000h
    jne near ptr L8a79f
    jmp near ptr L8a7b4
L8a67d::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb near ptr L8cd40
L8a68a::
    and eax, 01h
    jne short L8a696
    mov al, byte ptr [L8d420]
    jmp short L8a6ba
L8a696::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb near ptr L8cd4c
L8a6a3::
    and eax, 01h
    mov al, byte ptr [L8d420]
    je short L8a6af
    inc al
L8a6af::
    sub al, 02h
    sbb al, 00h
    and al, 03h
    mov byte ptr [L8d420], al
L8a6ba::
    or al, al
    je short L8a736
    test al, 02h
    jne short L8a6e4
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L8d45c]
    jb near ptr L8cd58
L8a6d6::
    and eax, dword ptr [L8d458]
    mov edx, dword ptr [L8d37c]
    jmp short L8a704
L8a6e4::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L8d45e]
    jb near ptr L8cd64
L8a6f8::
    and eax, dword ptr [L8d454]
    mov edx, dword ptr [L8d384]
L8a704::
    shl eax, 03h
    add edx, eax
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 04h
    jb near ptr L8cd70
L8a71a::
    and eax, 0fh
    mov dword ptr [L8d368], esi
    mov dword ptr [L8d370], ebp
    mov dword ptr [L8d36c], ecx
    mov ebx, dword ptr [edx]
    mov esi, dword ptr [edx+04h]
    jmp short L8a786
L8a736::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L8d45d]
    jb near ptr L8cd7c
L8a74a::
    and eax, dword ptr [L8d450]
    mov edx, dword ptr [L8d418]
    shl eax, 03h
    add edx, eax
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 04h
    jb near ptr L8cd88
L8a76c::
    and eax, 0fh
    mov dword ptr [L8d368], esi
    mov dword ptr [L8d370], ebp
    mov dword ptr [L8d36c], ecx
    mov ebx, dword ptr [edx]
    mov esi, dword ptr [edx+04h]
L8a786::
    call dword ptr [eax*4+L8793d]
    mov esi, dword ptr [L8d368]
    mov ecx, dword ptr [L8d36c]
    mov ebp, dword ptr [L8d370]
L8a79f::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb near ptr L8cd94
L8a7ac::
    test al, 01h
    je near ptr L8a67d
L8a7b4::
    mov edx, 01h
    mov edi, dword ptr [L8d378]
    jmp near ptr L87c2d
L8a7c4::
    cmp dword ptr [L8d428], 00h
    jne short L8a7d5
    pop edx
    pop ecx
    pop ebx
    pop eax
    pop edi
    pop esi
    leave
    ret
L8a7d5::
    call Func8a818_
    pop edx
    pop ecx
    pop ebx
    pop eax
    pop edi
    pop esi
    leave
    ret
    mov eax, eax
    add byte ptr [eax], al
    mov eax, eax
L8a7e8::
    cmp dword ptr [L8d428], 00h
    je short L8a803
    call Func8a818_
    cmp bx, word ptr [L8d35c]
    je near ptr L87cf2
L8a803::
    pusha
    mov ax, bx
    call Func8c2cc_
    popa
    jmp near ptr L87cf2
Func895ed_ endp
    db 08bh, 0c0h, 000h, 000h, 08bh, 0c0h
Func8a818_ proc near
    mov esi, 00h
    xchg dword ptr [L8d428], esi
    mov ecx, dword ptr [L8d438]
    mov byte ptr [L8d420], ch
    mov edx, dword ptr [L8d42c]
    mov eax, dword ptr [L8d434]
    mov dword ptr [L8d41c], eax
L8a83f::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb near ptr L8cda0
L8a84c::
    and eax, 01h
    je short L8a8a2
    add edx, 01h
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 03h
    jb near ptr L8cdac
L8a865::
    and eax, 07h
    add edx, eax
    cmp eax, 07h
    jl short L8a8a2
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 07h
    jb near ptr L8cdb8
L8a880::
    and eax, 07fh
    add edx, eax
    cmp eax, 07fh
    jl short L8a8a2
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 0ch
    jb near ptr L8cdc4
L8a89b::
    and eax, 0fffh
    add edx, eax
L8a8a2::
    bswap ecx
    mov cl, byte ptr [L8d45f]
    mov ebx, edx
    shl ebx, cl
    add dword ptr [L8d430], ebx
    bswap ecx
    add edx, dword ptr [L8d41c]
    cmp edx, dword ptr [L8d38c]
    jae near ptr L8a7c4
    mov dword ptr [L8d41c], edx
    shl edx, 02h
    add edx, dword ptr [ebp+014h]
    mov edi, dword ptr [edx]
    cmp edi, 0ffffffffh
    je near ptr L8c10f
    cmp edi, 0fffffffeh
    je near ptr L8a7c4
    shld ebx, edi, 010h
    cmp di, 0dcfah
    jbe near ptr L8c120
    inc bx
    cmp bx, word ptr [L8d35c]
    jne near ptr L8c148
L8a906::
    mov dword ptr [L8d378], edi
    and edi, 0ffffh
    or edi, dword ptr [L8d388]
L8a918::
    mov dword ptr [L8d394], 00h
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb near ptr L8cdd0
L8a92f::
    test al, 01h
    jne near ptr L8ade8
L8a937::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb near ptr L8cddc
L8a944::
    and eax, 01h
    jne short L8a950
    mov al, byte ptr [L8d420]
    jmp short L8a974
L8a950::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb near ptr L8cde8
L8a95d::
    and eax, 01h
    mov al, byte ptr [L8d420]
    je short L8a969
    inc al
L8a969::
    sub al, 02h
    sbb al, 00h
    and al, 03h
    mov byte ptr [L8d420], al
L8a974::
    or al, al
    je short L8a9f4
    test al, 02h
    jne short L8a99e
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L8d45c]
    jb near ptr L8cdf4
L8a990::
    and eax, dword ptr [L8d458]
    mov edx, dword ptr [L8d37c]
    jmp short L8a9be
L8a99e::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L8d45e]
    jb near ptr L8ce00
L8a9b2::
    and eax, dword ptr [L8d454]
    mov edx, dword ptr [L8d384]
L8a9be::
    shl eax, 03h
    add edx, eax
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 011h
    jae short L8a9d6
    add esi, 04h
    or cl, 0e0h
L8a9d6::
    and eax, 01ffffh
    mov dword ptr [L8d368], esi
    mov dword ptr [L8d370], ebp
    mov dword ptr [L8d36c], ecx
    mov ebx, dword ptr [edx]
    mov esi, dword ptr [edx+04h]
    jmp short L8aa48
L8a9f4::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L8d45d]
    jb near ptr L8ce0c
L8aa08::
    and eax, dword ptr [L8d450]
    mov edx, dword ptr [L8d430]
    shl eax, 03h
    add edx, eax
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 011h
    jae short L8aa2c
    add esi, 04h
    or cl, 0e0h
L8aa2c::
    and eax, 01ffffh
    mov dword ptr [L8d368], esi
    mov dword ptr [L8d370], ebp
    mov dword ptr [L8d36c], ecx
    mov ebx, dword ptr [edx]
    mov esi, dword ptr [edx+04h]
L8aa48::
    or dword ptr [L8d394], eax
    test al, al
    je near ptr L8abf9
    test al, 01h
    je near ptr L8abbd
L8aa5e::
    sub edi, 010000h
    cmp di, 0fb00h
    jae short L8aa6f
    jmp short L8aa75
    mov dword ptr [edi], ebx
L8aa6f::
    mov dword ptr [edi+0500h], esi
L8aa75::
    add edi, 010000h
    test al, 02h
    je near ptr L8abc5
L8aa83::
    sub edi, 010000h
    cmp di, 0fffch
    jae short L8aa98
    cmp di, 0fafch
    jae short L8aa9b
    jmp short L8aaa1
L8aa98::
    mov dword ptr [edi+04h], ebx
L8aa9b::
    mov dword ptr [edi+0504h], esi
L8aaa1::
    add edi, 010000h
    test al, 010h
    je near ptr L8abcd
L8aaaf::
    sub edi, 010000h
    cmp di, 0fff8h
    jae short L8aac4
    cmp di, 0faf8h
    jae short L8aac7
    jmp short L8aacd
L8aac4::
    mov dword ptr [edi+08h], ebx
L8aac7::
    mov dword ptr [edi+0508h], esi
L8aacd::
    add edi, 010000h
    test al, 020h
    je near ptr L8abd5
L8aadb::
    sub edi, 010000h
    cmp di, 0fff4h
    jae short L8aaf0
    cmp di, 0faf4h
    jae short L8aaf3
    jmp short L8aaf9
L8aaf0::
    mov dword ptr [edi+0ch], ebx
L8aaf3::
    mov dword ptr [edi+050ch], esi
L8aaf9::
    add edi, 010000h
    test al, 04h
    je near ptr L8abdd
L8ab07::
    sub edi, 010000h
    cmp di, 0f600h
    jae short L8ab1d
    cmp di, 0f100h
    jae short L8ab23
    jmp short L8ab29
L8ab1d::
    mov dword ptr [edi+0a00h], ebx
L8ab23::
    mov dword ptr [edi+0f00h], esi
L8ab29::
    add edi, 010000h
    test al, 08h
    je near ptr L8abe5
L8ab37::
    sub edi, 010000h
    cmp di, 0f5fch
    jae short L8ab4d
    cmp di, 0f0fch
    jae short L8ab53
    jmp short L8ab59
L8ab4d::
    mov dword ptr [edi+0a04h], ebx
L8ab53::
    mov dword ptr [edi+0f04h], esi
L8ab59::
    add edi, 010000h
    test al, 040h
    je near ptr L8abed
L8ab67::
    sub edi, 010000h
    cmp di, 0f5f8h
    jae short L8ab7d
    cmp di, 0f0f8h
    jae short L8ab83
    jmp short L8ab89
L8ab7d::
    mov dword ptr [edi+0a08h], ebx
L8ab83::
    mov dword ptr [edi+0f08h], esi
L8ab89::
    add edi, 010000h
    test al, 080h
    je short L8abf5
L8ab93::
    sub edi, 010000h
    cmp di, 0f5f4h
    jae short L8aba9
    cmp di, 0f0f4h
    jae short L8abaf
    jmp short L8abb5
L8aba9::
    mov dword ptr [edi+0a0ch], ebx
L8abaf::
    mov dword ptr [edi+0f0ch], esi
L8abb5::
    add edi, 010000h
    jmp short L8abf9
L8abbd::
    test al, 01h
    jne near ptr L8aa5e
L8abc5::
    test al, 02h
    jne near ptr L8aa83
L8abcd::
    test al, 010h
    jne near ptr L8aaaf
L8abd5::
    test al, 020h
    jne near ptr L8aadb
L8abdd::
    test al, 04h
    jne near ptr L8ab07
L8abe5::
    test al, 08h
    jne near ptr L8ab37
L8abed::
    test al, 040h
    jne near ptr L8ab67
L8abf5::
    test al, 080h
    jne short L8ab93
L8abf9::
    test ah, ah
    je near ptr L8adcb
    test ah, 01h
    je near ptr L8ad87
L8ac0a::
    sub edi, 010000h
    cmp di, 0ec00h
    jae short L8ac20
    cmp di, 0e700h
    jae short L8ac26
    jmp short L8ac2c
L8ac20::
    mov dword ptr [edi+01400h], ebx
L8ac26::
    mov dword ptr [edi+01900h], esi
L8ac2c::
    add edi, 010000h
    test ah, 02h
    je near ptr L8ad90
L8ac3b::
    sub edi, 010000h
    cmp di, 0ebfch
    jae short L8ac51
    cmp di, 0e6fch
    jae short L8ac57
    jmp short L8ac5d
L8ac51::
    mov dword ptr [edi+01404h], ebx
L8ac57::
    mov dword ptr [edi+01904h], esi
L8ac5d::
    add edi, 010000h
    test ah, 010h
    je near ptr L8ad99
L8ac6c::
    sub edi, 010000h
    cmp di, 0ebf8h
    jae short L8ac82
    cmp di, 0e6f8h
    jae short L8ac88
    jmp short L8ac8e
L8ac82::
    mov dword ptr [edi+01408h], ebx
L8ac88::
    mov dword ptr [edi+01908h], esi
L8ac8e::
    add edi, 010000h
    test ah, 020h
    je near ptr L8ada2
L8ac9d::
    sub edi, 010000h
    cmp di, 0ebf4h
    jae short L8acb3
    cmp di, 0e6f4h
    jae short L8acb9
    jmp short L8acbf
L8acb3::
    mov dword ptr [edi+0140ch], ebx
L8acb9::
    mov dword ptr [edi+0190ch], esi
L8acbf::
    add edi, 010000h
    test ah, 04h
    je near ptr L8adab
L8acce::
    sub edi, 010000h
    cmp di, 0e200h
    jae short L8ace4
    cmp di, 0dd00h
    jae short L8acea
    jmp short L8acf0
L8ace4::
    mov dword ptr [edi+01e00h], ebx
L8acea::
    mov dword ptr [edi+02300h], esi
L8acf0::
    add edi, 010000h
    test ah, 08h
    je near ptr L8adb4
L8acff::
    sub edi, 010000h
    cmp di, 0e1fch
    jae short L8ad15
    cmp di, 0dcfch
    jae short L8ad1b
    jmp short L8ad21
L8ad15::
    mov dword ptr [edi+01e04h], ebx
L8ad1b::
    mov dword ptr [edi+02304h], esi
L8ad21::
    add edi, 010000h
    test ah, 040h
    je near ptr L8adbd
L8ad30::
    sub edi, 010000h
    cmp di, 0e1f8h
    jae short L8ad46
    cmp di, 0dcf8h
    jae short L8ad4c
    jmp short L8ad52
L8ad46::
    mov dword ptr [edi+01e08h], ebx
L8ad4c::
    mov dword ptr [edi+02308h], esi
L8ad52::
    add edi, 010000h
    test ah, 080h
    je short L8adc6
L8ad5d::
    sub edi, 010000h
    cmp di, 0e1f4h
    jae short L8ad73
    cmp di, 0dcf4h
    jae short L8ad79
    jmp short L8ad7f
L8ad73::
    mov dword ptr [edi+01e0ch], ebx
L8ad79::
    mov dword ptr [edi+0230ch], esi
L8ad7f::
    add edi, 010000h
    jmp short L8adcb
L8ad87::
    test ah, 01h
    jne near ptr L8ac0a
L8ad90::
    test ah, 02h
    jne near ptr L8ac3b
L8ad99::
    test ah, 010h
    jne near ptr L8ac6c
L8ada2::
    test ah, 020h
    jne near ptr L8ac9d
L8adab::
    test ah, 04h
    jne near ptr L8acce
L8adb4::
    test ah, 08h
    jne near ptr L8acff
L8adbd::
    test ah, 040h
    jne near ptr L8ad30
L8adc6::
    test ah, 080h
    jne short L8ad5d
L8adcb::
    mov esi, dword ptr [L8d368]
    mov ecx, dword ptr [L8d36c]
    mov ebp, dword ptr [L8d370]
    and eax, 010000h
    je near ptr L8a937
L8ade8::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb near ptr L8ce18
L8adf5::
    test al, 01h
    jne near ptr L8bfb3
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 04h
    jb near ptr L8ce24
L8ae0e::
    and eax, 0fh
    jmp dword ptr [eax*4+L8ae18]
Func8a818_ endp
L8ae18 label byte
    dd offset Func8ae58_
    dd offset L8ae76
    dd offset L8ae97
    dd offset L8aebb
    dd offset L8aedb
    dd offset L8aefd
    dd offset L8af24
    dd offset L8af47
    dd offset L8af6b
    dd offset L8af8a
    dd offset L8afae
    dd offset L8afd4
    dd offset L8aff4
    dd offset L8b00f
    dd offset L8b030
    dd offset L8b04e
Func8ae58_ proc near
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 010h
    jae short L8ae6b
    add esi, 04h
    or cl, 0e0h
L8ae6b::
    xor dword ptr [L8d394], eax
    jmp near ptr L8b054
L8ae76::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 0ch
    jb near ptr L8ce30
L8ae87::
    shl eax, 04h
    or al, 0fh
    xor dword ptr [L8d394], eax
    jmp near ptr L8b054
L8ae97::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 0ch
    jb near ptr L8ce3c
L8aea8::
    shl eax, 04h
    shr al, 04h
    or al, 0f0h
    xor dword ptr [L8d394], eax
    jmp near ptr L8b054
L8aebb::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 08h
    jb near ptr L8ce48
L8aecc::
    mov ah, al
    mov al, 0ffh
    xor dword ptr [L8d394], eax
    jmp near ptr L8b054
L8aedb::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 0ch
    jb near ptr L8ce54
L8aeec::
    shl ah, 04h
    or ah, 0fh
    xor dword ptr [L8d394], eax
    jmp near ptr L8b054
L8aefd::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 08h
    jb near ptr L8ce60
L8af0e::
    shl eax, 04h
    shl ah, 04h
    or eax, 0f0fh
    xor dword ptr [L8d394], eax
    jmp near ptr L8b054
L8af24::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 08h
    jb near ptr L8ce6c
L8af35::
    mov ah, al
    or eax, 0ff0h
    xor dword ptr [L8d394], eax
    jmp near ptr L8b054
L8af47::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 04h
    jb near ptr L8ce78
L8af58::
    shl eax, 0ch
    or eax, 0fffh
    xor dword ptr [L8d394], eax
    jmp near ptr L8b054
L8af6b::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 0ch
    jb near ptr L8ce84
L8af7c::
    or ah, 0f0h
    xor dword ptr [L8d394], eax
    jmp near ptr L8b054
L8af8a::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 08h
    jb near ptr L8ce90
L8af9b::
    shl eax, 04h
    or eax, 0f00fh
    xor dword ptr [L8d394], eax
    jmp near ptr L8b054
L8afae::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 08h
    jb near ptr L8ce9c
L8afbf::
    mov ah, al
    ror ah, 04h
    or eax, 0f0f0h
    xor dword ptr [L8d394], eax
    jmp near ptr L8b054
L8afd4::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 04h
    jb near ptr L8cea8
L8afe5::
    mov ah, al
    or eax, 0f0ffh
    xor dword ptr [L8d394], eax
    jmp short L8b054
L8aff4::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 08h
    jb near ptr L8ceb4
L8b005::
    mov ah, 0ffh
    xor dword ptr [L8d394], eax
    jmp short L8b054
L8b00f::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 04h
    jb near ptr L8cec0
L8b020::
    or eax, 0fff0h
    rol al, 04h
    xor dword ptr [L8d394], eax
    jmp short L8b054
L8b030::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 04h
    jb near ptr L8cecc
L8b041::
    or eax, 0fff0h
    xor dword ptr [L8d394], eax
    jmp short L8b054
L8b04e::
    not dword ptr [L8d394]
L8b054::
    test byte ptr [L8d394], 0ffh
    je near ptr L8b7f4
    test byte ptr [L8d394], 01h
    je near ptr L8b78c
L8b06e::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb near ptr L8ced8
L8b07b::
    and eax, 01h
    jne short L8b087
    mov al, byte ptr [L8d420]
    jmp short L8b0ab
L8b087::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb near ptr L8cee4
L8b094::
    and eax, 01h
    mov al, byte ptr [L8d420]
    je short L8b0a0
    inc al
L8b0a0::
    sub al, 02h
    sbb al, 00h
    and al, 03h
    mov byte ptr [L8d420], al
L8b0ab::
    or al, al
    je short L8b0f7
    test al, 02h
    jne short L8b0d5
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L8d45c]
    jb near ptr L8cef0
L8b0c7::
    and eax, dword ptr [L8d458]
    mov edx, dword ptr [L8d37c]
    jmp short L8b117
L8b0d5::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L8d45e]
    jb near ptr L8cefc
L8b0e9::
    and eax, dword ptr [L8d454]
    mov edx, dword ptr [L8d384]
    jmp short L8b117
L8b0f7::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L8d45d]
    jb near ptr L8cf08
L8b10b::
    and eax, dword ptr [L8d450]
    mov edx, dword ptr [L8d430]
L8b117::
    shl eax, 03h
    add edx, eax
    sub edi, 010000h
    cmp di, 0fb00h
    jae short L8b12f
    jmp short L8b138
    mov eax, dword ptr [edx]
    mov dword ptr [edi], eax
L8b12f::
    mov eax, dword ptr [edx+04h]
    mov dword ptr [edi+0500h], eax
L8b138::
    add edi, 010000h
    test byte ptr [L8d394], 02h
    je near ptr L8b799
L8b14b::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb near ptr L8cf14
L8b158::
    and eax, 01h
    jne short L8b164
    mov al, byte ptr [L8d420]
    jmp short L8b188
L8b164::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb near ptr L8cf20
L8b171::
    and eax, 01h
    mov al, byte ptr [L8d420]
    je short L8b17d
    inc al
L8b17d::
    sub al, 02h
    sbb al, 00h
    and al, 03h
    mov byte ptr [L8d420], al
L8b188::
    or al, al
    je short L8b1d4
    test al, 02h
    jne short L8b1b2
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L8d45c]
    jb near ptr L8cf2c
L8b1a4::
    and eax, dword ptr [L8d458]
    mov edx, dword ptr [L8d37c]
    jmp short L8b1f4
L8b1b2::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L8d45e]
    jb near ptr L8cf38
L8b1c6::
    and eax, dword ptr [L8d454]
    mov edx, dword ptr [L8d384]
    jmp short L8b1f4
L8b1d4::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L8d45d]
    jb near ptr L8cf44
L8b1e8::
    and eax, dword ptr [L8d450]
    mov edx, dword ptr [L8d430]
L8b1f4::
    shl eax, 03h
    add edx, eax
    sub edi, 010000h
    cmp di, 0fffch
    jae short L8b20e
    cmp di, 0fafch
    jae short L8b213
    jmp short L8b21c
L8b20e::
    mov eax, dword ptr [edx]
    mov dword ptr [edi+04h], eax
L8b213::
    mov eax, dword ptr [edx+04h]
    mov dword ptr [edi+0504h], eax
L8b21c::
    add edi, 010000h
    test byte ptr [L8d394], 010h
    je near ptr L8b7a6
L8b22f::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb near ptr L8cf50
L8b23c::
    and eax, 01h
    jne short L8b248
    mov al, byte ptr [L8d420]
    jmp short L8b26c
L8b248::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb near ptr L8cf5c
L8b255::
    and eax, 01h
    mov al, byte ptr [L8d420]
    je short L8b261
    inc al
L8b261::
    sub al, 02h
    sbb al, 00h
    and al, 03h
    mov byte ptr [L8d420], al
L8b26c::
    or al, al
    je short L8b2b8
    test al, 02h
    jne short L8b296
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L8d45c]
    jb near ptr L8cf68
L8b288::
    and eax, dword ptr [L8d458]
    mov edx, dword ptr [L8d37c]
    jmp short L8b2d8
L8b296::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L8d45e]
    jb near ptr L8cf74
L8b2aa::
    and eax, dword ptr [L8d454]
    mov edx, dword ptr [L8d384]
    jmp short L8b2d8
L8b2b8::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L8d45d]
    jb near ptr L8cf80
L8b2cc::
    and eax, dword ptr [L8d450]
    mov edx, dword ptr [L8d430]
L8b2d8::
    shl eax, 03h
    add edx, eax
    sub edi, 010000h
    cmp di, 0fff8h
    jae short L8b2f2
    cmp di, 0faf8h
    jae short L8b2f7
    jmp short L8b300
L8b2f2::
    mov eax, dword ptr [edx]
    mov dword ptr [edi+08h], eax
L8b2f7::
    mov eax, dword ptr [edx+04h]
    mov dword ptr [edi+0508h], eax
L8b300::
    add edi, 010000h
    test byte ptr [L8d394], 020h
    je near ptr L8b7b3
L8b313::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb near ptr L8cf8c
L8b320::
    and eax, 01h
    jne short L8b32c
    mov al, byte ptr [L8d420]
    jmp short L8b350
L8b32c::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb near ptr L8cf98
L8b339::
    and eax, 01h
    mov al, byte ptr [L8d420]
    je short L8b345
    inc al
L8b345::
    sub al, 02h
    sbb al, 00h
    and al, 03h
    mov byte ptr [L8d420], al
L8b350::
    or al, al
    je short L8b39c
    test al, 02h
    jne short L8b37a
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L8d45c]
    jb near ptr L8cfa4
L8b36c::
    and eax, dword ptr [L8d458]
    mov edx, dword ptr [L8d37c]
    jmp short L8b3bc
L8b37a::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L8d45e]
    jb near ptr L8cfb0
L8b38e::
    and eax, dword ptr [L8d454]
    mov edx, dword ptr [L8d384]
    jmp short L8b3bc
L8b39c::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L8d45d]
    jb near ptr L8cfbc
L8b3b0::
    and eax, dword ptr [L8d450]
    mov edx, dword ptr [L8d430]
L8b3bc::
    shl eax, 03h
    add edx, eax
    sub edi, 010000h
    cmp di, 0fff4h
    jae short L8b3d6
    cmp di, 0faf4h
    jae short L8b3db
    jmp short L8b3e4
L8b3d6::
    mov eax, dword ptr [edx]
    mov dword ptr [edi+0ch], eax
L8b3db::
    mov eax, dword ptr [edx+04h]
    mov dword ptr [edi+050ch], eax
L8b3e4::
    add edi, 010000h
    test byte ptr [L8d394], 04h
    je near ptr L8b7c0
L8b3f7::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb near ptr L8cfc8
L8b404::
    and eax, 01h
    jne short L8b410
    mov al, byte ptr [L8d420]
    jmp short L8b434
L8b410::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb near ptr L8cfd4
L8b41d::
    and eax, 01h
    mov al, byte ptr [L8d420]
    je short L8b429
    inc al
L8b429::
    sub al, 02h
    sbb al, 00h
    and al, 03h
    mov byte ptr [L8d420], al
L8b434::
    or al, al
    je short L8b480
    test al, 02h
    jne short L8b45e
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L8d45c]
    jb near ptr L8cfe0
L8b450::
    and eax, dword ptr [L8d458]
    mov edx, dword ptr [L8d37c]
    jmp short L8b4a0
L8b45e::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L8d45e]
    jb near ptr L8cfec
L8b472::
    and eax, dword ptr [L8d454]
    mov edx, dword ptr [L8d384]
    jmp short L8b4a0
L8b480::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L8d45d]
    jb near ptr L8cff8
L8b494::
    and eax, dword ptr [L8d450]
    mov edx, dword ptr [L8d430]
L8b4a0::
    shl eax, 03h
    add edx, eax
    sub edi, 010000h
    cmp di, 0f600h
    jae short L8b4bb
    cmp di, 0f100h
    jae short L8b4c3
    jmp short L8b4cc
L8b4bb::
    mov eax, dword ptr [edx]
    mov dword ptr [edi+0a00h], eax
L8b4c3::
    mov eax, dword ptr [edx+04h]
    mov dword ptr [edi+0f00h], eax
L8b4cc::
    add edi, 010000h
    test byte ptr [L8d394], 08h
    je near ptr L8b7cd
L8b4df::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb near ptr L8d004
L8b4ec::
    and eax, 01h
    jne short L8b4f8
    mov al, byte ptr [L8d420]
    jmp short L8b51c
L8b4f8::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb near ptr L8d010
L8b505::
    and eax, 01h
    mov al, byte ptr [L8d420]
    je short L8b511
    inc al
L8b511::
    sub al, 02h
    sbb al, 00h
    and al, 03h
    mov byte ptr [L8d420], al
L8b51c::
    or al, al
    je short L8b568
    test al, 02h
    jne short L8b546
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L8d45c]
    jb near ptr L8d01c
L8b538::
    and eax, dword ptr [L8d458]
    mov edx, dword ptr [L8d37c]
    jmp short L8b588
L8b546::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L8d45e]
    jb near ptr L8d028
L8b55a::
    and eax, dword ptr [L8d454]
    mov edx, dword ptr [L8d384]
    jmp short L8b588
L8b568::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L8d45d]
    jb near ptr L8d034
L8b57c::
    and eax, dword ptr [L8d450]
    mov edx, dword ptr [L8d430]
L8b588::
    shl eax, 03h
    add edx, eax
    sub edi, 010000h
    cmp di, 0f5fch
    jae short L8b5a3
    cmp di, 0f0fch
    jae short L8b5ab
    jmp short L8b5b4
L8b5a3::
    mov eax, dword ptr [edx]
    mov dword ptr [edi+0a04h], eax
L8b5ab::
    mov eax, dword ptr [edx+04h]
    mov dword ptr [edi+0f04h], eax
L8b5b4::
    add edi, 010000h
    test byte ptr [L8d394], 040h
    je near ptr L8b7da
L8b5c7::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb near ptr L8d040
L8b5d4::
    and eax, 01h
    jne short L8b5e0
    mov al, byte ptr [L8d420]
    jmp short L8b604
L8b5e0::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb near ptr L8d04c
L8b5ed::
    and eax, 01h
    mov al, byte ptr [L8d420]
    je short L8b5f9
    inc al
L8b5f9::
    sub al, 02h
    sbb al, 00h
    and al, 03h
    mov byte ptr [L8d420], al
L8b604::
    or al, al
    je short L8b650
    test al, 02h
    jne short L8b62e
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L8d45c]
    jb near ptr L8d058
L8b620::
    and eax, dword ptr [L8d458]
    mov edx, dword ptr [L8d37c]
    jmp short L8b670
L8b62e::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L8d45e]
    jb near ptr L8d064
L8b642::
    and eax, dword ptr [L8d454]
    mov edx, dword ptr [L8d384]
    jmp short L8b670
L8b650::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L8d45d]
    jb near ptr L8d070
L8b664::
    and eax, dword ptr [L8d450]
    mov edx, dword ptr [L8d430]
L8b670::
    shl eax, 03h
    add edx, eax
    sub edi, 010000h
    cmp di, 0f5f8h
    jae short L8b68b
    cmp di, 0f0f8h
    jae short L8b693
    jmp short L8b69c
L8b68b::
    mov eax, dword ptr [edx]
    mov dword ptr [edi+0a08h], eax
L8b693::
    mov eax, dword ptr [edx+04h]
    mov dword ptr [edi+0f08h], eax
L8b69c::
    add edi, 010000h
    test byte ptr [L8d394], 080h
    je near ptr L8b7e7
L8b6af::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb near ptr L8d07c
L8b6bc::
    and eax, 01h
    jne short L8b6c8
    mov al, byte ptr [L8d420]
    jmp short L8b6ec
L8b6c8::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb near ptr L8d088
L8b6d5::
    and eax, 01h
    mov al, byte ptr [L8d420]
    je short L8b6e1
    inc al
L8b6e1::
    sub al, 02h
    sbb al, 00h
    and al, 03h
    mov byte ptr [L8d420], al
L8b6ec::
    or al, al
    je short L8b738
    test al, 02h
    jne short L8b716
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L8d45c]
    jb near ptr L8d094
L8b708::
    and eax, dword ptr [L8d458]
    mov edx, dword ptr [L8d37c]
    jmp short L8b758
L8b716::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L8d45e]
    jb near ptr L8d0a0
L8b72a::
    and eax, dword ptr [L8d454]
    mov edx, dword ptr [L8d384]
    jmp short L8b758
L8b738::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L8d45d]
    jb near ptr L8d0ac
L8b74c::
    and eax, dword ptr [L8d450]
    mov edx, dword ptr [L8d430]
L8b758::
    shl eax, 03h
    add edx, eax
    sub edi, 010000h
    cmp di, 0f5f4h
    jae short L8b773
    cmp di, 0f0f4h
    jae short L8b77b
    jmp short L8b784
L8b773::
    mov eax, dword ptr [edx]
    mov dword ptr [edi+0a0ch], eax
L8b77b::
    mov eax, dword ptr [edx+04h]
    mov dword ptr [edi+0f0ch], eax
L8b784::
    add edi, 010000h
    jmp short L8b7f4
L8b78c::
    test byte ptr [L8d394], 01h
    jne near ptr L8b06e
L8b799::
    test byte ptr [L8d394], 02h
    jne near ptr L8b14b
L8b7a6::
    test byte ptr [L8d394], 010h
    jne near ptr L8b22f
L8b7b3::
    test byte ptr [L8d394], 020h
    jne near ptr L8b313
L8b7c0::
    test byte ptr [L8d394], 04h
    jne near ptr L8b3f7
L8b7cd::
    test byte ptr [L8d394], 08h
    jne near ptr L8b4df
L8b7da::
    test byte ptr [L8d394], 040h
    jne near ptr L8b5c7
L8b7e7::
    test byte ptr [L8d394], 080h
    jne near ptr L8b6af
L8b7f4::
    test byte ptr [L8d395], 0ffh
    je near ptr L8c0ff
    test byte ptr [L8d395], 01h
    je near ptr L8bf46
L8b80e::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb near ptr L8d0b8
L8b81b::
    and eax, 01h
    jne short L8b827
    mov al, byte ptr [L8d420]
    jmp short L8b84b
L8b827::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb near ptr L8d0c4
L8b834::
    and eax, 01h
    mov al, byte ptr [L8d420]
    je short L8b840
    inc al
L8b840::
    sub al, 02h
    sbb al, 00h
    and al, 03h
    mov byte ptr [L8d420], al
L8b84b::
    or al, al
    je short L8b897
    test al, 02h
    jne short L8b875
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L8d45c]
    jb near ptr L8d0d0
L8b867::
    and eax, dword ptr [L8d458]
    mov edx, dword ptr [L8d37c]
    jmp short L8b8b7
L8b875::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L8d45e]
    jb near ptr L8d0dc
L8b889::
    and eax, dword ptr [L8d454]
    mov edx, dword ptr [L8d384]
    jmp short L8b8b7
L8b897::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L8d45d]
    jb near ptr L8d0e8
L8b8ab::
    and eax, dword ptr [L8d450]
    mov edx, dword ptr [L8d430]
L8b8b7::
    shl eax, 03h
    add edx, eax
    sub edi, 010000h
    cmp di, 0ec00h
    jae short L8b8d2
    cmp di, 0e700h
    jae short L8b8da
    jmp short L8b8e3
L8b8d2::
    mov eax, dword ptr [edx]
    mov dword ptr [edi+01400h], eax
L8b8da::
    mov eax, dword ptr [edx+04h]
    mov dword ptr [edi+01900h], eax
L8b8e3::
    add edi, 010000h
    test byte ptr [L8d395], 02h
    je near ptr L8bf53
L8b8f6::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb near ptr L8d0f4
L8b903::
    and eax, 01h
    jne short L8b90f
    mov al, byte ptr [L8d420]
    jmp short L8b933
L8b90f::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb near ptr L8d100
L8b91c::
    and eax, 01h
    mov al, byte ptr [L8d420]
    je short L8b928
    inc al
L8b928::
    sub al, 02h
    sbb al, 00h
    and al, 03h
    mov byte ptr [L8d420], al
L8b933::
    or al, al
    je short L8b97f
    test al, 02h
    jne short L8b95d
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L8d45c]
    jb near ptr L8d10c
L8b94f::
    and eax, dword ptr [L8d458]
    mov edx, dword ptr [L8d37c]
    jmp short L8b99f
L8b95d::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L8d45e]
    jb near ptr L8d118
L8b971::
    and eax, dword ptr [L8d454]
    mov edx, dword ptr [L8d384]
    jmp short L8b99f
L8b97f::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L8d45d]
    jb near ptr L8d124
L8b993::
    and eax, dword ptr [L8d450]
    mov edx, dword ptr [L8d430]
L8b99f::
    shl eax, 03h
    add edx, eax
    sub edi, 010000h
    cmp di, 0ebfch
    jae short L8b9ba
    cmp di, 0e6fch
    jae short L8b9c2
    jmp short L8b9cb
L8b9ba::
    mov eax, dword ptr [edx]
    mov dword ptr [edi+01404h], eax
L8b9c2::
    mov eax, dword ptr [edx+04h]
    mov dword ptr [edi+01904h], eax
L8b9cb::
    add edi, 010000h
    test byte ptr [L8d395], 010h
    je near ptr L8bf60
L8b9de::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb near ptr L8d130
L8b9eb::
    and eax, 01h
    jne short L8b9f7
    mov al, byte ptr [L8d420]
    jmp short L8ba1b
L8b9f7::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb near ptr L8d13c
L8ba04::
    and eax, 01h
    mov al, byte ptr [L8d420]
    je short L8ba10
    inc al
L8ba10::
    sub al, 02h
    sbb al, 00h
    and al, 03h
    mov byte ptr [L8d420], al
L8ba1b::
    or al, al
    je short L8ba67
    test al, 02h
    jne short L8ba45
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L8d45c]
    jb near ptr L8d148
L8ba37::
    and eax, dword ptr [L8d458]
    mov edx, dword ptr [L8d37c]
    jmp short L8ba87
L8ba45::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L8d45e]
    jb near ptr L8d154
L8ba59::
    and eax, dword ptr [L8d454]
    mov edx, dword ptr [L8d384]
    jmp short L8ba87
L8ba67::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L8d45d]
    jb near ptr L8d160
L8ba7b::
    and eax, dword ptr [L8d450]
    mov edx, dword ptr [L8d430]
L8ba87::
    shl eax, 03h
    add edx, eax
    sub edi, 010000h
    cmp di, 0ebf8h
    jae short L8baa2
    cmp di, 0e6f8h
    jae short L8baaa
    jmp short L8bab3
L8baa2::
    mov eax, dword ptr [edx]
    mov dword ptr [edi+01408h], eax
L8baaa::
    mov eax, dword ptr [edx+04h]
    mov dword ptr [edi+01908h], eax
L8bab3::
    add edi, 010000h
    test byte ptr [L8d395], 020h
    je near ptr L8bf6d
L8bac6::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb near ptr L8d16c
L8bad3::
    and eax, 01h
    jne short L8badf
    mov al, byte ptr [L8d420]
    jmp short L8bb03
L8badf::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb near ptr L8d178
L8baec::
    and eax, 01h
    mov al, byte ptr [L8d420]
    je short L8baf8
    inc al
L8baf8::
    sub al, 02h
    sbb al, 00h
    and al, 03h
    mov byte ptr [L8d420], al
L8bb03::
    or al, al
    je short L8bb4f
    test al, 02h
    jne short L8bb2d
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L8d45c]
    jb near ptr L8d184
L8bb1f::
    and eax, dword ptr [L8d458]
    mov edx, dword ptr [L8d37c]
    jmp short L8bb6f
L8bb2d::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L8d45e]
    jb near ptr L8d190
L8bb41::
    and eax, dword ptr [L8d454]
    mov edx, dword ptr [L8d384]
    jmp short L8bb6f
L8bb4f::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L8d45d]
    jb near ptr L8d19c
L8bb63::
    and eax, dword ptr [L8d450]
    mov edx, dword ptr [L8d430]
L8bb6f::
    shl eax, 03h
    add edx, eax
    sub edi, 010000h
    cmp di, 0ebf4h
    jae short L8bb8a
    cmp di, 0e6f4h
    jae short L8bb92
    jmp short L8bb9b
L8bb8a::
    mov eax, dword ptr [edx]
    mov dword ptr [edi+0140ch], eax
L8bb92::
    mov eax, dword ptr [edx+04h]
    mov dword ptr [edi+0190ch], eax
L8bb9b::
    add edi, 010000h
    test byte ptr [L8d395], 04h
    je near ptr L8bf7a
L8bbae::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb near ptr L8d1a8
L8bbbb::
    and eax, 01h
    jne short L8bbc7
    mov al, byte ptr [L8d420]
    jmp short L8bbeb
L8bbc7::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb near ptr L8d1b4
L8bbd4::
    and eax, 01h
    mov al, byte ptr [L8d420]
    je short L8bbe0
    inc al
L8bbe0::
    sub al, 02h
    sbb al, 00h
    and al, 03h
    mov byte ptr [L8d420], al
L8bbeb::
    or al, al
    je short L8bc37
    test al, 02h
    jne short L8bc15
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L8d45c]
    jb near ptr L8d1c0
L8bc07::
    and eax, dword ptr [L8d458]
    mov edx, dword ptr [L8d37c]
    jmp short L8bc57
L8bc15::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L8d45e]
    jb near ptr L8d1cc
L8bc29::
    and eax, dword ptr [L8d454]
    mov edx, dword ptr [L8d384]
    jmp short L8bc57
L8bc37::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L8d45d]
    jb near ptr L8d1d8
L8bc4b::
    and eax, dword ptr [L8d450]
    mov edx, dword ptr [L8d430]
L8bc57::
    shl eax, 03h
    add edx, eax
    sub edi, 010000h
    cmp di, 0e200h
    jae short L8bc72
    cmp di, 0dd00h
    jae short L8bc7a
    jmp short L8bc83
L8bc72::
    mov eax, dword ptr [edx]
    mov dword ptr [edi+01e00h], eax
L8bc7a::
    mov eax, dword ptr [edx+04h]
    mov dword ptr [edi+02300h], eax
L8bc83::
    add edi, 010000h
    test byte ptr [L8d395], 08h
    je near ptr L8bf87
L8bc96::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb near ptr L8d1e4
L8bca3::
    and eax, 01h
    jne short L8bcaf
    mov al, byte ptr [L8d420]
    jmp short L8bcd3
L8bcaf::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb near ptr L8d1f0
L8bcbc::
    and eax, 01h
    mov al, byte ptr [L8d420]
    je short L8bcc8
    inc al
L8bcc8::
    sub al, 02h
    sbb al, 00h
    and al, 03h
    mov byte ptr [L8d420], al
L8bcd3::
    or al, al
    je short L8bd1f
    test al, 02h
    jne short L8bcfd
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L8d45c]
    jb near ptr L8d1fc
L8bcef::
    and eax, dword ptr [L8d458]
    mov edx, dword ptr [L8d37c]
    jmp short L8bd3f
L8bcfd::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L8d45e]
    jb near ptr L8d208
L8bd11::
    and eax, dword ptr [L8d454]
    mov edx, dword ptr [L8d384]
    jmp short L8bd3f
L8bd1f::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L8d45d]
    jb near ptr L8d214
L8bd33::
    and eax, dword ptr [L8d450]
    mov edx, dword ptr [L8d430]
L8bd3f::
    shl eax, 03h
    add edx, eax
    sub edi, 010000h
    cmp di, 0e1fch
    jae short L8bd5a
    cmp di, 0dcfch
    jae short L8bd62
    jmp short L8bd6b
L8bd5a::
    mov eax, dword ptr [edx]
    mov dword ptr [edi+01e04h], eax
L8bd62::
    mov eax, dword ptr [edx+04h]
    mov dword ptr [edi+02304h], eax
L8bd6b::
    add edi, 010000h
    test byte ptr [L8d395], 040h
    je near ptr L8bf94
L8bd7e::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb near ptr L8d220
L8bd8b::
    and eax, 01h
    jne short L8bd97
    mov al, byte ptr [L8d420]
    jmp short L8bdbb
L8bd97::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb near ptr L8d22c
L8bda4::
    and eax, 01h
    mov al, byte ptr [L8d420]
    je short L8bdb0
    inc al
L8bdb0::
    sub al, 02h
    sbb al, 00h
    and al, 03h
    mov byte ptr [L8d420], al
L8bdbb::
    or al, al
    je short L8be07
    test al, 02h
    jne short L8bde5
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L8d45c]
    jb near ptr L8d238
L8bdd7::
    and eax, dword ptr [L8d458]
    mov edx, dword ptr [L8d37c]
    jmp short L8be27
L8bde5::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L8d45e]
    jb near ptr L8d244
L8bdf9::
    and eax, dword ptr [L8d454]
    mov edx, dword ptr [L8d384]
    jmp short L8be27
L8be07::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L8d45d]
    jb near ptr L8d250
L8be1b::
    and eax, dword ptr [L8d450]
    mov edx, dword ptr [L8d430]
L8be27::
    shl eax, 03h
    add edx, eax
    sub edi, 010000h
    cmp di, 0e1f8h
    jae short L8be42
    cmp di, 0dcf8h
    jae short L8be4a
    jmp short L8be53
L8be42::
    mov eax, dword ptr [edx]
    mov dword ptr [edi+01e08h], eax
L8be4a::
    mov eax, dword ptr [edx+04h]
    mov dword ptr [edi+02308h], eax
L8be53::
    add edi, 010000h
    test byte ptr [L8d395], 080h
    je near ptr L8bfa1
L8be66::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb near ptr L8d25c
L8be73::
    and eax, 01h
    jne short L8be7f
    mov al, byte ptr [L8d420]
    jmp short L8bea3
L8be7f::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb near ptr L8d268
L8be8c::
    and eax, 01h
    mov al, byte ptr [L8d420]
    je short L8be98
    inc al
L8be98::
    sub al, 02h
    sbb al, 00h
    and al, 03h
    mov byte ptr [L8d420], al
L8bea3::
    or al, al
    je short L8beef
    test al, 02h
    jne short L8becd
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L8d45c]
    jb near ptr L8d274
L8bebf::
    and eax, dword ptr [L8d458]
    mov edx, dword ptr [L8d37c]
    jmp short L8bf0f
L8becd::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L8d45e]
    jb near ptr L8d280
L8bee1::
    and eax, dword ptr [L8d454]
    mov edx, dword ptr [L8d384]
    jmp short L8bf0f
L8beef::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L8d45d]
    jb near ptr L8d28c
L8bf03::
    and eax, dword ptr [L8d450]
    mov edx, dword ptr [L8d430]
L8bf0f::
    shl eax, 03h
    add edx, eax
    sub edi, 010000h
    cmp di, 0e1f4h
    jae short L8bf2a
    cmp di, 0dcf4h
    jae short L8bf32
    jmp short L8bf3b
L8bf2a::
    mov eax, dword ptr [edx]
    mov dword ptr [edi+01e0ch], eax
L8bf32::
    mov eax, dword ptr [edx+04h]
    mov dword ptr [edi+0230ch], eax
L8bf3b::
    add edi, 010000h
    jmp near ptr L8c0ff
L8bf46::
    test byte ptr [L8d395], 01h
    jne near ptr L8b80e
L8bf53::
    test byte ptr [L8d395], 02h
    jne near ptr L8b8f6
L8bf60::
    test byte ptr [L8d395], 010h
    jne near ptr L8b9de
L8bf6d::
    test byte ptr [L8d395], 020h
    jne near ptr L8bac6
L8bf7a::
    test byte ptr [L8d395], 04h
    jne near ptr L8bbae
L8bf87::
    test byte ptr [L8d395], 08h
    jne near ptr L8bc96
L8bf94::
    test byte ptr [L8d395], 040h
    jne near ptr L8bd7e
L8bfa1::
    test byte ptr [L8d395], 080h
    jne near ptr L8be66
    jmp near ptr L8c0ff
L8bfb3::
    test dword ptr [L8d424], 010000h
    jne near ptr L8c0ea
    jmp near ptr L8c0ff
L8bfc8::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb near ptr L8d298
L8bfd5::
    and eax, 01h
    jne short L8bfe1
    mov al, byte ptr [L8d420]
    jmp short L8c005
L8bfe1::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb near ptr L8d2a4
L8bfee::
    and eax, 01h
    mov al, byte ptr [L8d420]
    je short L8bffa
    inc al
L8bffa::
    sub al, 02h
    sbb al, 00h
    and al, 03h
    mov byte ptr [L8d420], al
L8c005::
    or al, al
    je short L8c081
    test al, 02h
    jne short L8c02f
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L8d45c]
    jb near ptr L8d2b0
L8c021::
    and eax, dword ptr [L8d458]
    mov edx, dword ptr [L8d37c]
    jmp short L8c04f
L8c02f::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L8d45e]
    jb near ptr L8d2bc
L8c043::
    and eax, dword ptr [L8d454]
    mov edx, dword ptr [L8d384]
L8c04f::
    shl eax, 03h
    add edx, eax
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 04h
    jb near ptr L8d2c8
L8c065::
    and eax, 0fh
    mov dword ptr [L8d368], esi
    mov dword ptr [L8d370], ebp
    mov dword ptr [L8d36c], ecx
    mov ebx, dword ptr [edx]
    mov esi, dword ptr [edx+04h]
    jmp short L8c0d1
L8c081::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L8d45d]
    jb near ptr L8d2d4
L8c095::
    and eax, dword ptr [L8d450]
    mov edx, dword ptr [L8d430]
    shl eax, 03h
    add edx, eax
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 04h
    jb near ptr L8d2e0
L8c0b7::
    and eax, 0fh
    mov dword ptr [L8d368], esi
    mov dword ptr [L8d370], ebp
    mov dword ptr [L8d36c], ecx
    mov ebx, dword ptr [edx]
    mov esi, dword ptr [edx+04h]
L8c0d1::
    call dword ptr [eax*4+L8797d]
    mov esi, dword ptr [L8d368]
    mov ecx, dword ptr [L8d36c]
    mov ebp, dword ptr [L8d370]
L8c0ea::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb near ptr L8d2ec
L8c0f7::
    test al, 01h
    je near ptr L8bfc8
L8c0ff::
    mov edx, 01h
    mov edi, dword ptr [L8d378]
    jmp near ptr L8a83f
L8c10f::
    mov dword ptr [L8d378], edi
    lea edi, [L8d464]
    jmp near ptr L8a918
L8c120::
    shld ebx, edi, 010h
    ret
    db 02eh, 08bh, 0c0h
    add byte ptr [eax], al
    mov eax, eax
L8c12c::
    pusha
    mov ax, bx
    call Func8c2cc_
    popa
    mov word ptr [L8d35c], bx
    jmp near ptr L89150
    mov eax, eax
    add byte ptr [eax], al
    mov eax, eax
L8c148::
    pusha
    mov ax, bx
    call Func8c2cc_
    popa
    mov word ptr [L8d35c], bx
    jmp near ptr L8a906
    pop edx
    pop ecx
    pop ebx
    pop eax
    pop edi
    pop esi
    leave
    ret
L8c166::
    pop edx
    pop ecx
    pop ebx
    pop eax
    pop edi
    pop esi
    leave
    ret
Func8ae58_ endp
Func8c16e_ proc near
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
    je short L8c184
    mov ax, 01h
L8c184::
    xor ax, 01h
    mov word ptr [L8d364], ax
    mov eax, dword ptr [ebp+0ch]
    bsr ebx, eax
    sub ebx, 010h
    neg ebx
    mov byte ptr [L8d664], bl
    pop edx
    pop ecx
    pop ebx
    pop eax
    pop edi
    pop esi
    leave
    ret
Func8c16e_ endp
Func8c1a7_ proc near
    push ebp
    mov ebp, esp
    push esi
    push edi
    push eax
    push ebx
    push ecx
    push edx
    shr dword ptr [ebp+010h], 03h
    shr dword ptr [ebp+014h], 03h
    mov edi, dword ptr [ebp+02ch]
    mov eax, dword ptr [ebp+0ch]
    sar eax, 03h
    mov dword ptr [edi+04h], eax
    mov dword ptr [ebp+0ch], eax
    mov eax, dword ptr [ebp+08h]
    sar eax, 03h
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
    jne short L8c1f4
    mov edx, 050h
L8c1f4::
    add edx, dword ptr [ebp+018h]
    mov dword ptr [ebp+020h], edx
    mov edx, dword ptr [ebp+024h]
    or edx, edx
    jne short L8c206
    mov edx, 03ch
L8c206::
    add edx, dword ptr [ebp+01ch]
    mov dword ptr [ebp+024h], edx
    mov ax, word ptr [ebp+010h]
    mov si, word ptr [ebp+014h]
    mov ecx, 00h
L8c219::
    mov edx, 00h
L8c21e::
    mov word ptr [edi], dx
    mov word ptr [edi+02h], cx
    add word ptr [edi], ax
    add word ptr [edi+02h], si
    add edi, 04h
    inc edx
    cmp edx, dword ptr [ebp+08h]
    jne short L8c21e
    inc ecx
    cmp ecx, dword ptr [ebp+0ch]
    jne short L8c219
    mov edi, dword ptr [ebp+08h]
    mov edx, dword ptr [ebp+0ch]
    imul edi, edx
    dec edi
    shl edi, 02h
    add edi, dword ptr [ebp+02ch]
    mov edx, 0fffffffeh
L8c250::
    movsx eax, word ptr [edi]
    cmp eax, 050h
    jae short L8c2b3
    movsx esi, word ptr [edi+02h]
    cmp esi, 03ch
    jae short L8c2b3
    test dword ptr [ebp+028h], 01h
    je short L8c280
    cmp eax, dword ptr [ebp+018h]
    jl short L8c2b3
    cmp eax, dword ptr [ebp+020h]
    jge short L8c2b3
    cmp esi, dword ptr [ebp+01ch]
    jl short L8c2b3
    cmp esi, dword ptr [ebp+024h]
    jge short L8c2b3
    jmp short L8c294
L8c280::
    cmp eax, dword ptr [ebp+018h]
    jl short L8c294
    cmp eax, dword ptr [ebp+020h]
    jge short L8c294
    cmp esi, dword ptr [ebp+01ch]
    jl short L8c294
    cmp esi, dword ptr [ebp+024h]
    jl short L8c2b3
L8c294::
    imul esi, esi, 02800h
    shl eax, 04h
    add eax, esi
    mov dword ptr [edi], eax
    mov dl, 0ffh
    sub edi, 04h
    cmp edi, dword ptr [ebp+02ch]
    jae short L8c250
    pop edx
    pop ecx
    pop ebx
    pop eax
    pop edi
    pop esi
    leave
    ret
L8c2b3::
    mov dword ptr [edi], edx
    sub edi, 04h
    cmp edi, dword ptr [ebp+02ch]
    jae short L8c250
    pop edx
    pop ecx
    pop ebx
    pop eax
    pop edi
    pop esi
    leave
    ret
Func8c1a7_ endp
    db 02eh, 08bh, 0c0h, 000h, 000h, 08bh, 0c0h
Func8c2cc_ proc near
    mov dword ptr [L8d344], 04f05h
    mov cl, byte ptr [L8d664]
    shl eax, cl
    mov dword ptr [L8d33c], eax
    mov ax, word ptr [L8d364]
    mov dword ptr [L8d338], eax
    mov ax, ds
    mov es, ax
    mov ax, 0300h
    lea edi, [_Data8d328]
    mov bx, 010h
    xor cx, cx
    int 031h
    ret
L8c308::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L87a86
    nop
L8c314::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L87ae5
    nop
L8c320::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L87c3a
    nop
L8c32c::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L87c53
    nop
L8c338::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L87c6e
    nop
L8c344::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L87c89
    nop
L8c350::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L87d22
    nop
L8c35c::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L87d37
    nop
L8c368::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L87d50
    nop
L8c374::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L87d83
    nop
L8c380::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L87da5
    nop
L8c38c::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L87dfb
    nop
L8c398::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L87fce
    nop
L8c3a4::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L87fe7
    nop
L8c3b0::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L88060
    nop
L8c3bc::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L88081
    nop
L8c3c8::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L880a5
    nop
L8c3d4::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L880c5
    nop
L8c3e0::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L880e7
    nop
L8c3ec::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L8810e
    nop
L8c3f8::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L88131
    nop
L8c404::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L88155
    nop
L8c410::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L88174
    nop
L8c41c::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L88198
    nop
L8c428::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L881be
    nop
L8c434::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L881de
    nop
L8c440::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L881f9
    nop
L8c44c::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L8821a
    nop
L8c458::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L88254
    nop
L8c464::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L8826d
    nop
L8c470::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L882a0
    nop
L8c47c::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L882c2
    nop
L8c488::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L882e4
    nop
L8c494::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L8831c
    nop
L8c4a0::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L88335
    nop
L8c4ac::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L88368
    nop
L8c4b8::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L8838a
    nop
L8c4c4::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L883ac
    nop
L8c4d0::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L883e5
    nop
L8c4dc::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L883fe
    nop
L8c4e8::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L88431
    nop
L8c4f4::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L88453
    nop
L8c500::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L88475
    nop
L8c50c::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L884ae
    nop
L8c518::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L884c7
    nop
L8c524::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L884fa
    nop
L8c530::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L8851c
    nop
L8c53c::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L8853e
    nop
L8c548::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L88577
    nop
L8c554::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L88590
    nop
L8c560::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L885c3
    nop
L8c56c::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L885e5
    nop
L8c578::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L88607
    nop
L8c584::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L88643
    nop
L8c590::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L8865c
    nop
L8c59c::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L8868f
    nop
L8c5a8::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L886b1
    nop
L8c5b4::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L886d3
    nop
L8c5c0::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L8870f
    nop
L8c5cc::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L88728
    nop
L8c5d8::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L8875b
    nop
L8c5e4::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L8877d
    nop
L8c5f0::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L8879f
    nop
L8c5fc::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L887db
    nop
L8c608::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L887f4
    nop
L8c614::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L88827
    nop
L8c620::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L88849
    nop
L8c62c::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L8886b
    nop
L8c638::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L8891e
    nop
L8c644::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L88937
    nop
L8c650::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L8896a
    nop
L8c65c::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L8898c
    nop
L8c668::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L889ae
    nop
L8c674::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L889ea
    nop
L8c680::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L88a03
    nop
L8c68c::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L88a36
    nop
L8c698::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L88a58
    nop
L8c6a4::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L88a7a
    nop
L8c6b0::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L88ab6
    nop
L8c6bc::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L88acf
    nop
L8c6c8::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L88b02
    nop
L8c6d4::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L88b24
    nop
L8c6e0::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L88b46
    nop
L8c6ec::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L88b82
    nop
L8c6f8::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L88b9b
    nop
L8c704::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L88bce
    nop
L8c710::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L88bf0
    nop
L8c71c::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L88c12
    nop
L8c728::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L88c4e
    nop
L8c734::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L88c67
    nop
L8c740::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L88c9a
    nop
L8c74c::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L88cbc
    nop
L8c758::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L88cde
    nop
L8c764::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L88d1a
    nop
L8c770::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L88d33
    nop
L8c77c::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L88d66
    nop
L8c788::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L88d88
    nop
L8c794::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L88daa
    nop
L8c7a0::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L88de6
    nop
L8c7ac::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L88dff
    nop
L8c7b8::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L88e32
    nop
L8c7c4::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L88e54
    nop
L8c7d0::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L88e76
    nop
L8c7dc::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L88eb2
    nop
L8c7e8::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L88ecb
    nop
L8c7f4::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L88efe
    nop
L8c800::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L88f20
    nop
L8c80c::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L88f42
    nop
L8c818::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L88ff8
    nop
L8c824::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L89011
    nop
L8c830::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L89044
    nop
L8c83c::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L89066
    nop
L8c848::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L89088
    nop
L8c854::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L890b8
    nop
L8c860::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L890da
    nop
L8c86c::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L8911a
    nop
L8c878::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L891b4
    nop
L8c884::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L891c9
    nop
L8c890::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L891e2
    nop
L8c89c::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L89215
    nop
L8c8a8::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L89237
    nop
L8c8b4::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L8928d
    nop
L8c8c0::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L8958a
    nop
L8c8cc::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L895a3
    nop
L8c8d8::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L8961c
    nop
L8c8e4::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L8963d
    nop
L8c8f0::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L89661
    nop
L8c8fc::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L89681
    nop
L8c908::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L896a3
    nop
L8c914::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L896ca
    nop
L8c920::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L896ed
    nop
L8c92c::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L89711
    nop
L8c938::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L89730
    nop
L8c944::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L89754
    nop
L8c950::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L8977a
    nop
L8c95c::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L8979a
    nop
L8c968::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L897b5
    nop
L8c974::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L897d6
    nop
L8c980::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L89810
    nop
L8c98c::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L89829
    nop
L8c998::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L8985c
    nop
L8c9a4::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L8987e
    nop
L8c9b0::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L898a0
    nop
L8c9bc::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L898df
    nop
L8c9c8::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L898f8
    nop
L8c9d4::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L8992b
    nop
L8c9e0::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L8994d
    nop
L8c9ec::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L8996f
    nop
L8c9f8::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L899b5
    nop
L8ca04::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L899ce
    nop
L8ca10::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L89a01
    nop
L8ca1c::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L89a23
    nop
L8ca28::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L89a45
    nop
L8ca34::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L89a8b
    nop
L8ca40::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L89aa4
    nop
L8ca4c::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L89ad7
    nop
L8ca58::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L89af9
    nop
L8ca64::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L89b1b
    nop
L8ca70::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L89b61
    nop
L8ca7c::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L89b7a
    nop
L8ca88::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L89bad
    nop
L8ca94::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L89bcf
    nop
L8caa0::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L89bf1
    nop
L8caac::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L89c3b
    nop
L8cab8::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L89c54
    nop
L8cac4::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L89c87
    nop
L8cad0::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L89ca9
    nop
L8cadc::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L89ccb
    nop
L8cae8::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L89d15
    nop
L8caf4::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L89d2e
    nop
L8cb00::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L89d61
    nop
L8cb0c::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L89d83
    nop
L8cb18::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L89da5
    nop
L8cb24::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L89def
    nop
L8cb30::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L89e08
    nop
L8cb3c::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L89e3b
    nop
L8cb48::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L89e5d
    nop
L8cb54::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L89e7f
    nop
L8cb60::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L89f40
    nop
L8cb6c::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L89f59
    nop
L8cb78::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L89f8c
    nop
L8cb84::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L89fae
    nop
L8cb90::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L89fd0
    nop
L8cb9c::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L8a01a
    nop
L8cba8::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L8a033
    nop
L8cbb4::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L8a066
    nop
L8cbc0::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L8a088
    nop
L8cbcc::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L8a0aa
    nop
L8cbd8::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L8a0f4
    nop
L8cbe4::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L8a10d
    nop
L8cbf0::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L8a140
    nop
L8cbfc::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L8a162
    nop
L8cc08::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L8a184
    nop
L8cc14::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L8a1ce
    nop
L8cc20::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L8a1e7
    nop
L8cc2c::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L8a21a
    nop
L8cc38::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L8a23c
    nop
L8cc44::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L8a25e
    nop
L8cc50::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L8a2a8
    nop
L8cc5c::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L8a2c1
    nop
L8cc68::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L8a2f4
    nop
L8cc74::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L8a316
    nop
L8cc80::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L8a338
    nop
L8cc8c::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L8a382
    nop
L8cc98::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L8a39b
    nop
L8cca4::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L8a3ce
    nop
L8ccb0::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L8a3f0
    nop
L8ccbc::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L8a412
    nop
L8ccc8::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L8a45c
    nop
L8ccd4::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L8a475
    nop
L8cce0::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L8a4a8
    nop
L8ccec::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L8a4ca
    nop
L8ccf8::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L8a4ec
    nop
L8cd04::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L8a536
    nop
L8cd10::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L8a54f
    nop
L8cd1c::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L8a582
    nop
L8cd28::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L8a5a4
    nop
L8cd34::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L8a5c6
    nop
L8cd40::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L8a68a
    nop
L8cd4c::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L8a6a3
    nop
L8cd58::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L8a6d6
    nop
L8cd64::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L8a6f8
    nop
L8cd70::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L8a71a
    nop
L8cd7c::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L8a74a
    nop
L8cd88::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L8a76c
    nop
L8cd94::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L8a7ac
    nop
L8cda0::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L8a84c
    nop
L8cdac::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L8a865
    nop
L8cdb8::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L8a880
    nop
L8cdc4::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L8a89b
    nop
L8cdd0::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L8a92f
    nop
L8cddc::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L8a944
    nop
L8cde8::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L8a95d
    nop
L8cdf4::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L8a990
    nop
L8ce00::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L8a9b2
    nop
L8ce0c::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L8aa08
    nop
L8ce18::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L8adf5
    nop
L8ce24::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L8ae0e
    nop
L8ce30::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L8ae87
    nop
L8ce3c::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L8aea8
    nop
L8ce48::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L8aecc
    nop
L8ce54::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L8aeec
    nop
L8ce60::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L8af0e
    nop
L8ce6c::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L8af35
    nop
L8ce78::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L8af58
    nop
L8ce84::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L8af7c
    nop
L8ce90::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L8af9b
    nop
L8ce9c::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L8afbf
    nop
L8cea8::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L8afe5
    nop
L8ceb4::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L8b005
    nop
L8cec0::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L8b020
    nop
L8cecc::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L8b041
    nop
L8ced8::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L8b07b
    nop
L8cee4::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L8b094
    nop
L8cef0::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L8b0c7
    nop
L8cefc::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L8b0e9
    nop
L8cf08::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L8b10b
    nop
L8cf14::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L8b158
    nop
L8cf20::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L8b171
    nop
L8cf2c::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L8b1a4
    nop
L8cf38::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L8b1c6
    nop
L8cf44::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L8b1e8
    nop
L8cf50::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L8b23c
    nop
L8cf5c::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L8b255
    nop
L8cf68::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L8b288
    nop
L8cf74::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L8b2aa
    nop
L8cf80::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L8b2cc
    nop
L8cf8c::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L8b320
    nop
L8cf98::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L8b339
    nop
L8cfa4::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L8b36c
    nop
L8cfb0::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L8b38e
    nop
L8cfbc::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L8b3b0
    nop
L8cfc8::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L8b404
    nop
L8cfd4::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L8b41d
    nop
L8cfe0::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L8b450
    nop
L8cfec::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L8b472
    nop
L8cff8::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L8b494
    nop
L8d004::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L8b4ec
    nop
L8d010::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L8b505
    nop
L8d01c::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L8b538
    nop
L8d028::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L8b55a
    nop
L8d034::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L8b57c
    nop
L8d040::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L8b5d4
    nop
L8d04c::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L8b5ed
    nop
L8d058::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L8b620
    nop
L8d064::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L8b642
    nop
L8d070::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L8b664
    nop
L8d07c::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L8b6bc
    nop
L8d088::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L8b6d5
    nop
L8d094::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L8b708
    nop
L8d0a0::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L8b72a
    nop
L8d0ac::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L8b74c
    nop
L8d0b8::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L8b81b
    nop
L8d0c4::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L8b834
    nop
L8d0d0::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L8b867
    nop
L8d0dc::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L8b889
    nop
L8d0e8::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L8b8ab
    nop
L8d0f4::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L8b903
    nop
L8d100::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L8b91c
    nop
L8d10c::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L8b94f
    nop
L8d118::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L8b971
    nop
L8d124::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L8b993
    nop
L8d130::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L8b9eb
    nop
L8d13c::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L8ba04
    nop
L8d148::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L8ba37
    nop
L8d154::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L8ba59
    nop
L8d160::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L8ba7b
    nop
L8d16c::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L8bad3
    nop
L8d178::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L8baec
    nop
L8d184::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L8bb1f
    nop
L8d190::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L8bb41
    nop
L8d19c::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L8bb63
    nop
L8d1a8::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L8bbbb
    nop
L8d1b4::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L8bbd4
    nop
L8d1c0::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L8bc07
    nop
L8d1cc::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L8bc29
    nop
L8d1d8::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L8bc4b
    nop
L8d1e4::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L8bca3
    nop
L8d1f0::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L8bcbc
    nop
L8d1fc::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L8bcef
    nop
L8d208::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L8bd11
    nop
L8d214::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L8bd33
    nop
L8d220::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L8bd8b
    nop
L8d22c::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L8bda4
    nop
L8d238::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L8bdd7
    nop
L8d244::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L8bdf9
    nop
L8d250::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L8be1b
    nop
L8d25c::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L8be73
    nop
L8d268::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L8be8c
    nop
L8d274::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L8bebf
    nop
L8d280::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L8bee1
    nop
L8d28c::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L8bf03
    nop
L8d298::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L8bfd5
    nop
L8d2a4::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L8bfee
    nop
L8d2b0::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L8c021
    nop
L8d2bc::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L8c043
    nop
L8d2c8::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L8c065
    nop
L8d2d4::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L8c095
    nop
L8d2e0::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L8c0b7
    nop
L8d2ec::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L8c0f7
    nop
L8d2f8::
    add esi, 04h
    mov edx, dword ptr [esi+04h]
    or cl, 0e0h
    jmp near ptr L87ab3
    mov eax, eax
L8d308::
    add esi, 04h
    mov edx, dword ptr [esi+04h]
    or cl, 0e0h
    jmp near ptr L87b18
    mov eax, eax
L8d318::
    add esi, 04h
    mov edx, dword ptr [esi+04h]
    or cl, 0e0h
    jmp near ptr L87b85
Func8c2cc_ endp
    db 08bh, 0c0h
_Data8d328 label byte
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
L8d338 label byte
    db 000h, 000h, 000h, 000h
L8d33c label byte
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
L8d344 label byte
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 08bh, 0c0h
L8d35c label byte
    db 000h, 000h, 08bh, 0c0h, 000h, 000h, 08bh, 0c0h
L8d364 label byte
    db 000h, 000h, 08bh, 0c0h
L8d368 label byte
    db 000h, 000h, 000h, 000h
L8d36c label byte
    db 000h, 000h, 000h, 000h
L8d370 label byte
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
L8d378 label byte
    db 000h, 000h, 000h, 000h
L8d37c label byte
    db 000h, 000h, 000h, 000h
L8d380 label byte
    db 000h, 000h, 000h, 000h
L8d384 label byte
    db 000h, 000h, 000h, 000h
L8d388 label byte
    db 000h, 000h, 000h, 000h
L8d38c label byte
    db 000h, 000h, 000h, 000h
L8d390 label byte
    db 000h, 000h, 000h, 000h
L8d394 label byte
    db 000h
L8d395 label byte
    db 000h, 000h, 000h
L8d398 label byte
    db 001h, 000h, 000h, 000h, 002h, 000h, 000h, 000h, 004h, 000h, 000h, 000h, 008h, 000h, 000h, 000h
    db 010h, 000h, 000h, 000h, 020h, 000h, 000h, 000h, 040h, 000h, 000h, 000h, 080h, 000h, 000h, 000h
    db 000h, 001h, 000h, 000h, 000h, 002h, 000h, 000h, 000h, 004h, 000h, 000h, 000h, 008h, 000h, 000h
    db 000h, 010h, 000h, 000h, 000h, 020h, 000h, 000h, 000h, 040h, 000h, 000h, 000h, 080h, 000h, 000h
    db 000h, 000h, 001h, 000h, 000h, 000h, 002h, 000h, 000h, 000h, 004h, 000h, 000h, 000h, 008h, 000h
    db 000h, 000h, 010h, 000h, 000h, 000h, 020h, 000h, 000h, 000h, 040h, 000h, 000h, 000h, 080h, 000h
    db 000h, 000h, 000h, 001h, 000h, 000h, 000h, 002h, 000h, 000h, 000h, 004h, 000h, 000h, 000h, 008h
    db 000h, 000h, 000h, 010h, 000h, 000h, 000h, 020h, 000h, 000h, 000h, 040h, 000h, 000h, 000h, 080h
L8d418 label byte
    db 000h, 000h, 000h, 000h
L8d41c label byte
    db 000h, 000h, 000h, 000h
L8d420 label byte
    db 000h, 02eh, 08bh, 0c0h
L8d424 label byte
    db 000h, 000h, 000h, 000h
L8d428 label byte
    db 000h, 000h, 000h, 000h
L8d42c label byte
    db 000h, 000h, 000h, 000h
L8d430 label byte
    db 000h, 000h, 000h, 000h
L8d434 label byte
    db 000h, 000h, 000h, 000h
L8d438 label byte
    db 000h, 000h, 000h, 000h
L8d43c label byte
    db 000h, 000h, 000h, 000h
L8d440 label byte
    db 000h, 000h, 000h, 000h
L8d444 label byte
    db 000h, 000h, 000h, 000h
L8d448 label byte
    db 000h, 000h, 000h, 000h
L8d44c label byte
    db 000h, 000h, 000h, 000h
L8d450 label byte
    db 000h, 000h, 000h, 000h
L8d454 label byte
    db 000h, 000h, 000h, 000h
L8d458 label byte
    db 000h, 000h, 000h, 000h
L8d45c label byte
    db 000h
L8d45d label byte
    db 000h
L8d45e label byte
    db 000h
L8d45f label byte
    db 000h, 000h, 000h, 000h, 000h
L8d464 label byte
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
L8d664 label byte
    db 000h, 02eh, 08bh, 0c0h
_TEXT ends

_DATA segment
_Dataca7e0 label byte
    db "$Id: 124_111.ASM 1.1 1996/02/28 15:45:38 MDV Exp $"
    db 000h, 000h
_DATA ends

    end

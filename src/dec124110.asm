    .586p

_TEXT segment para public use32 'CODE'
_TEXT ends
_DATA segment dword public use32 'DATA'
_DATA ends

    assume cs:FLAT, ds:FLAT, es:FLAT, ss:FLAT

    public Func7fa90_
    public Func80638_
    public Func80bcd_
    public Func81241_
    public Func827fd_
    public Func83a28_
    public Func84068_
    public Func8537e_
    public Func853b7_
    public Func854dc_
    public _Data86538
    public _Dataca790

_TEXT segment
Func7fa90_ proc near
    add eax, eax
    shr ax, 1
    mov dx, ax
    ror eax, 010h
    mov esi, eax
    mov ebx, eax
    mov si, dx
    mov bx, dx
    ret
L7faa6::
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
L7facd::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 01eh
    jae short L7fae0
    add esi, 04h
    or cl, 0e0h
L7fae0::
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
L7fb05::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 01eh
    jae short L7fb18
    add esi, 04h
    or cl, 0e0h
L7fb18::
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
L7fb4e::
    add eax, eax
    shr ax, 1
    mov ebx, eax
    mov dx, ax
    ror ebx, 010h
    mov esi, ebx
    mov si, dx
    ret
L7fb61::
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
L7fb85::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 01eh
    jae short L7fb98
    add esi, 04h
    or cl, 0e0h
L7fb98::
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
L7fbba::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 01eh
    jae short L7fbcd
    add esi, 04h
    or cl, 0e0h
L7fbcd::
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
L7fc00::
    add eax, eax
    shr ax, 1
    mov ebx, eax
    mov dx, ax
    ror eax, 010h
    mov esi, eax
    mov si, dx
    ret
L7fc13::
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
L7fc37::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 01eh
    jae short L7fc4a
    add esi, 04h
    or cl, 0e0h
L7fc4a::
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
L7fc6c::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 01eh
    jae short L7fc7f
    add esi, 04h
    or cl, 0e0h
L7fc7f::
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
L7fcb2::
    add eax, eax
    shr ax, 1
    mov ebx, eax
    mov dx, ax
    ror eax, 010h
    mov bx, ax
    mov esi, eax
    mov si, dx
    ret
L7fcc8::
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
L7fcef::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 01eh
    jae short L7fd02
    add esi, 04h
    or cl, 0e0h
L7fd02::
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
L7fd27::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 01eh
    jae short L7fd3a
    add esi, 04h
    or cl, 0e0h
L7fd3a::
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
L7fd70::
    add eax, eax
    shr ax, 1
    mov esi, eax
    mov dx, ax
    ror esi, 010h
    mov ebx, esi
    mov bx, dx
    ret
L7fd83::
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
L7fda7::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 01eh
    jae short L7fdba
    add esi, 04h
    or cl, 0e0h
L7fdba::
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
L7fddc::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 01eh
    jae short L7fdef
    add esi, 04h
    or cl, 0e0h
L7fdef::
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
L7fe22::
    add eax, eax
    shr ax, 1
    ror eax, 010h
    mov esi, eax
    mov ebx, eax
    ret
L7fe2f::
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
L7fe4d::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 01eh
    jae short L7fe60
    add esi, 04h
    or cl, 0e0h
L7fe60::
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
L7fe7c::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 01eh
    jae short L7fe8f
    add esi, 04h
    or cl, 0e0h
L7fe8f::
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
L7febc::
    add eax, eax
    shr ax, 1
    mov ebx, eax
    ror eax, 010h
    mov esi, eax
    ret
L7fec9::
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
L7fee7::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 01eh
    jae short L7fefa
    add esi, 04h
    or cl, 0e0h
L7fefa::
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
L7ff16::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 01eh
    jae short L7ff29
    add esi, 04h
    or cl, 0e0h
L7ff29::
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
L7ff56::
    add eax, eax
    shr ax, 1
    mov ebx, eax
    ror eax, 010h
    mov bx, ax
    mov esi, eax
    ret
L7ff66::
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
L7ff87::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 01eh
    jae short L7ff9a
    add esi, 04h
    or cl, 0e0h
L7ff9a::
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
L7ffb9::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 01eh
    jae short L7ffcc
    add esi, 04h
    or cl, 0e0h
L7ffcc::
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
L7fffc::
    add eax, eax
    shr ax, 1
    mov esi, eax
    mov dx, ax
    ror eax, 010h
    mov ebx, eax
    mov bx, dx
    ret
L8000f::
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
L80033::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 01eh
    jae short L80046
    add esi, 04h
    or cl, 0e0h
L80046::
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
L80068::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 01eh
    jae short L8007b
    add esi, 04h
    or cl, 0e0h
L8007b::
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
L800ae::
    add eax, eax
    shr ax, 1
    mov esi, eax
    ror eax, 010h
    mov ebx, eax
    ret
L800bb::
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
L800d9::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 01eh
    jae short L800ec
    add esi, 04h
    or cl, 0e0h
L800ec::
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
L80108::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 01eh
    jae short L8011b
    add esi, 04h
    or cl, 0e0h
L8011b::
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
L80148::
    add eax, eax
    shr ax, 1
    mov esi, eax
    mov ebx, eax
    ret
L80152::
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
L8016d::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 01eh
    jae short L80180
    add esi, 04h
    or cl, 0e0h
L80180::
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
L80199::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 01eh
    jae short L801ac
    add esi, 04h
    or cl, 0e0h
L801ac::
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
L801d6::
    add eax, eax
    shr ax, 1
    mov esi, eax
    mov ebx, eax
    ror eax, 010h
    mov bx, ax
    ret
L801e6::
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
L80207::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 01eh
    jae short L8021a
    add esi, 04h
    or cl, 0e0h
L8021a::
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
L80239::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 01eh
    jae short L8024c
    add esi, 04h
    or cl, 0e0h
L8024c::
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
L8027c::
    add eax, eax
    shr ax, 1
    mov esi, eax
    mov dx, ax
    ror eax, 010h
    mov si, ax
    mov ebx, eax
    mov bx, dx
    ret
L80292::
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
L802b9::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 01eh
    jae short L802cc
    add esi, 04h
    or cl, 0e0h
L802cc::
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
L802f1::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 01eh
    jae short L80304
    add esi, 04h
    or cl, 0e0h
L80304::
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
L8033a::
    add eax, eax
    shr ax, 1
    mov esi, eax
    ror eax, 010h
    mov si, ax
    mov ebx, eax
    ret
L8034a::
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
L8036b::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 01eh
    jae short L8037e
    add esi, 04h
    or cl, 0e0h
L8037e::
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
L8039d::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 01eh
    jae short L803b0
    add esi, 04h
    or cl, 0e0h
L803b0::
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
L803e0::
    add eax, eax
    shr ax, 1
    mov esi, eax
    mov ebx, eax
    ror eax, 010h
    mov si, ax
    ret
L803f0::
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
L80411::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 01eh
    jae short L80424
    add esi, 04h
    or cl, 0e0h
L80424::
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
L80443::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 01eh
    jae short L80456
    add esi, 04h
    or cl, 0e0h
L80456::
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
L80486::
    add eax, eax
    shr ax, 1
    mov esi, eax
    mov ebx, eax
    ror eax, 010h
    mov si, ax
    mov bx, ax
    ret
L80499::
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
L804bd::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 01eh
    jae short L804d0
    add esi, 04h
    or cl, 0e0h
L804d0::
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
L804f2::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 01eh
    jae short L80505
    add esi, 04h
    or cl, 0e0h
L80505::
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
Func7fa90_ endp
L80538 label byte
    dd offset L7facd
    dd offset L7fb85
    dd offset L7fc37
    dd offset L7fcef
    dd offset L7fda7
    dd offset L7fe4d
    dd offset L7fee7
    dd offset L7ff87
    dd offset L80033
    dd offset L800d9
    dd offset L8016d
    dd offset L80207
    dd offset L802b9
    dd offset L8036b
    dd offset L80411
    dd offset L804bd
    dd offset L7fb05
    dd offset L7fbba
    dd offset L7fc6c
    dd offset L7fd27
    dd offset L7fddc
    dd offset L7fe7c
    dd offset L7ff16
    dd offset L7ffb9
    dd offset L80068
    dd offset L80108
    dd offset L80199
    dd offset L80239
    dd offset L802f1
    dd offset L8039d
    dd offset L80443
    dd offset L804f2
    dd offset Func7fa90_
    dd offset L7fb4e
    dd offset L7fc00
    dd offset L7fcb2
    dd offset L7fd70
    dd offset L7fe22
    dd offset L7febc
    dd offset L7ff56
    dd offset L7fffc
    dd offset L800ae
    dd offset L80148
    dd offset L801d6
    dd offset L8027c
    dd offset L8033a
    dd offset L803e0
    dd offset L80486
    dd offset L7faa6
    dd offset L7fb61
    dd offset L7fc13
    dd offset L7fcc8
    dd offset L7fd83
    dd offset L7fe2f
    dd offset L7fec9
    dd offset L7ff66
    dd offset L8000f
    dd offset L800bb
    dd offset L80152
    dd offset L801e6
    dd offset L80292
    dd offset L8034a
    dd offset L803f0
    dd offset L80499
Func80638_ proc near
    mov dword ptr [edi], ebx
    mov dword ptr [edi+0500h], esi
    ret
L80641::
    mov dword ptr [edi+04h], ebx
    mov dword ptr [edi+0504h], esi
    ret
L8064b::
    mov dword ptr [edi+08h], ebx
    mov dword ptr [edi+0508h], esi
    ret
L80655::
    mov dword ptr [edi+0ch], ebx
    mov dword ptr [edi+050ch], esi
    ret
L8065f::
    mov dword ptr [edi+0a00h], ebx
    mov dword ptr [edi+0f00h], esi
    ret
L8066c::
    mov dword ptr [edi+0a04h], ebx
    mov dword ptr [edi+0f04h], esi
    ret
L80679::
    mov dword ptr [edi+0a08h], ebx
    mov dword ptr [edi+0f08h], esi
    ret
L80686::
    mov dword ptr [edi+0a0ch], ebx
    mov dword ptr [edi+0f0ch], esi
    ret
L80693::
    mov dword ptr [edi+01400h], ebx
    mov dword ptr [edi+01900h], esi
    ret
L806a0::
    mov dword ptr [edi+01404h], ebx
    mov dword ptr [edi+01904h], esi
    ret
L806ad::
    mov dword ptr [edi+01408h], ebx
    mov dword ptr [edi+01908h], esi
    ret
L806ba::
    mov dword ptr [edi+0140ch], ebx
    mov dword ptr [edi+0190ch], esi
    ret
L806c7::
    mov dword ptr [edi+01e00h], ebx
    mov dword ptr [edi+02300h], esi
    ret
L806d4::
    mov dword ptr [edi+01e04h], ebx
    mov dword ptr [edi+02304h], esi
    ret
L806e1::
    mov dword ptr [edi+01e08h], ebx
    mov dword ptr [edi+02308h], esi
    ret
L806ee::
    mov dword ptr [edi+01e0ch], ebx
    mov dword ptr [edi+0230ch], esi
    ret
L806fb::
    mov dword ptr [edi], ebx
    cmp di, 0fb00h
    jae short L8070a
    mov dword ptr [edi+0500h], esi
L8070a::
    ret
L8070b::
    cmp di, 0fffch
    jae short L80721
    mov dword ptr [edi+04h], ebx
    cmp di, 0fafch
    jae short L80721
    mov dword ptr [edi+0504h], esi
L80721::
    ret
L80722::
    cmp di, 0fff8h
    jae short L80738
    mov dword ptr [edi+08h], ebx
    cmp di, 0faf8h
    jae short L80738
    mov dword ptr [edi+0508h], esi
L80738::
    ret
L80739::
    cmp di, 0fff4h
    jae short L8074f
    mov dword ptr [edi+0ch], ebx
    cmp di, 0faf4h
    jae short L8074f
    mov dword ptr [edi+050ch], esi
L8074f::
    ret
L80750::
    cmp di, 0f600h
    jae short L8076a
    mov dword ptr [edi+0a00h], ebx
    cmp di, 0f100h
    jae short L8076a
    mov dword ptr [edi+0f00h], esi
L8076a::
    ret
L8076b::
    cmp di, 0f5fch
    jae short L80785
    mov dword ptr [edi+0a04h], ebx
    cmp di, 0f0fch
    jae short L80785
    mov dword ptr [edi+0f04h], esi
L80785::
    ret
L80786::
    cmp di, 0f5f8h
    jae short L807a0
    mov dword ptr [edi+0a08h], ebx
    cmp di, 0f0f8h
    jae short L807a0
    mov dword ptr [edi+0f08h], esi
L807a0::
    ret
L807a1::
    cmp di, 0f5f4h
    jae short L807bb
    mov dword ptr [edi+0a0ch], ebx
    cmp di, 0f0f4h
    jae short L807bb
    mov dword ptr [edi+0f0ch], esi
L807bb::
    ret
L807bc::
    cmp di, 0ec00h
    jae short L807d6
    mov dword ptr [edi+01400h], ebx
    cmp di, 0e700h
    jae short L807d6
    mov dword ptr [edi+01900h], esi
L807d6::
    ret
L807d7::
    cmp di, 0ebfch
    jae short L807f1
    mov dword ptr [edi+01404h], ebx
    cmp di, 0e6fch
    jae short L807f1
    mov dword ptr [edi+01904h], esi
L807f1::
    ret
L807f2::
    cmp di, 0ebf8h
    jae short L8080c
    mov dword ptr [edi+01408h], ebx
    cmp di, 0e6f8h
    jae short L8080c
    mov dword ptr [edi+01908h], esi
L8080c::
    ret
L8080d::
    cmp di, 0ebf4h
    jae short L80827
    mov dword ptr [edi+0140ch], ebx
    cmp di, 0e6f4h
    jae short L80827
    mov dword ptr [edi+0190ch], esi
L80827::
    ret
L80828::
    cmp di, 0e200h
    jae short L80842
    mov dword ptr [edi+01e00h], ebx
    cmp di, 0dd00h
    jae short L80842
    mov dword ptr [edi+02300h], esi
L80842::
    ret
L80843::
    cmp di, 0e1fch
    jae short L8085d
    mov dword ptr [edi+01e04h], ebx
    cmp di, 0dcfch
    jae short L8085d
    mov dword ptr [edi+02304h], esi
L8085d::
    ret
L8085e::
    cmp di, 0e1f8h
    jae short L80878
    mov dword ptr [edi+01e08h], ebx
    cmp di, 0dcf8h
    jae short L80878
    mov dword ptr [edi+02308h], esi
L80878::
    ret
L80879::
    cmp di, 0e1f4h
    jae short L80893
    mov dword ptr [edi+01e0ch], ebx
    cmp di, 0dcf4h
    jae short L80893
    mov dword ptr [edi+0230ch], esi
L80893::
    ret
L80894::
    sub edi, 010000h
    cmp di, 0fb00h
    jae short L808a5
    jmp short L808ab
    mov dword ptr [edi], ebx
L808a5::
    mov dword ptr [edi+0500h], esi
L808ab::
    add edi, 010000h
    ret
L808b2::
    sub edi, 010000h
    cmp di, 0fffch
    jae short L808c7
    cmp di, 0fafch
    jae short L808ca
    jmp short L808d0
L808c7::
    mov dword ptr [edi+04h], ebx
L808ca::
    mov dword ptr [edi+0504h], esi
L808d0::
    add edi, 010000h
    ret
L808d7::
    sub edi, 010000h
    cmp di, 0fff8h
    jae short L808ec
    cmp di, 0faf8h
    jae short L808ef
    jmp short L808f5
L808ec::
    mov dword ptr [edi+08h], ebx
L808ef::
    mov dword ptr [edi+0508h], esi
L808f5::
    add edi, 010000h
    ret
L808fc::
    sub edi, 010000h
    cmp di, 0fff4h
    jae short L80911
    cmp di, 0faf4h
    jae short L80914
    jmp short L8091a
L80911::
    mov dword ptr [edi+0ch], ebx
L80914::
    mov dword ptr [edi+050ch], esi
L8091a::
    add edi, 010000h
    ret
L80921::
    sub edi, 010000h
    cmp di, 0f600h
    jae short L80937
    cmp di, 0f100h
    jae short L8093d
    jmp short L80943
L80937::
    mov dword ptr [edi+0a00h], ebx
L8093d::
    mov dword ptr [edi+0f00h], esi
L80943::
    add edi, 010000h
    ret
L8094a::
    sub edi, 010000h
    cmp di, 0f5fch
    jae short L80960
    cmp di, 0f0fch
    jae short L80966
    jmp short L8096c
L80960::
    mov dword ptr [edi+0a04h], ebx
L80966::
    mov dword ptr [edi+0f04h], esi
L8096c::
    add edi, 010000h
    ret
L80973::
    sub edi, 010000h
    cmp di, 0f5f8h
    jae short L80989
    cmp di, 0f0f8h
    jae short L8098f
    jmp short L80995
L80989::
    mov dword ptr [edi+0a08h], ebx
L8098f::
    mov dword ptr [edi+0f08h], esi
L80995::
    add edi, 010000h
    ret
L8099c::
    sub edi, 010000h
    cmp di, 0f5f4h
    jae short L809b2
    cmp di, 0f0f4h
    jae short L809b8
    jmp short L809be
L809b2::
    mov dword ptr [edi+0a0ch], ebx
L809b8::
    mov dword ptr [edi+0f0ch], esi
L809be::
    add edi, 010000h
    ret
L809c5::
    sub edi, 010000h
    cmp di, 0ec00h
    jae short L809db
    cmp di, 0e700h
    jae short L809e1
    jmp short L809e7
L809db::
    mov dword ptr [edi+01400h], ebx
L809e1::
    mov dword ptr [edi+01900h], esi
L809e7::
    add edi, 010000h
    ret
L809ee::
    sub edi, 010000h
    cmp di, 0ebfch
    jae short L80a04
    cmp di, 0e6fch
    jae short L80a0a
    jmp short L80a10
L80a04::
    mov dword ptr [edi+01404h], ebx
L80a0a::
    mov dword ptr [edi+01904h], esi
L80a10::
    add edi, 010000h
    ret
L80a17::
    sub edi, 010000h
    cmp di, 0ebf8h
    jae short L80a2d
    cmp di, 0e6f8h
    jae short L80a33
    jmp short L80a39
L80a2d::
    mov dword ptr [edi+01408h], ebx
L80a33::
    mov dword ptr [edi+01908h], esi
L80a39::
    add edi, 010000h
    ret
L80a40::
    sub edi, 010000h
    cmp di, 0ebf4h
    jae short L80a56
    cmp di, 0e6f4h
    jae short L80a5c
    jmp short L80a62
L80a56::
    mov dword ptr [edi+0140ch], ebx
L80a5c::
    mov dword ptr [edi+0190ch], esi
L80a62::
    add edi, 010000h
    ret
L80a69::
    sub edi, 010000h
    cmp di, 0e200h
    jae short L80a7f
    cmp di, 0dd00h
    jae short L80a85
    jmp short L80a8b
L80a7f::
    mov dword ptr [edi+01e00h], ebx
L80a85::
    mov dword ptr [edi+02300h], esi
L80a8b::
    add edi, 010000h
    ret
L80a92::
    sub edi, 010000h
    cmp di, 0e1fch
    jae short L80aa8
    cmp di, 0dcfch
    jae short L80aae
    jmp short L80ab4
L80aa8::
    mov dword ptr [edi+01e04h], ebx
L80aae::
    mov dword ptr [edi+02304h], esi
L80ab4::
    add edi, 010000h
    ret
L80abb::
    sub edi, 010000h
    cmp di, 0e1f8h
    jae short L80ad1
    cmp di, 0dcf8h
    jae short L80ad7
    jmp short L80add
L80ad1::
    mov dword ptr [edi+01e08h], ebx
L80ad7::
    mov dword ptr [edi+02308h], esi
L80add::
    add edi, 010000h
    ret
L80ae4::
    sub edi, 010000h
    cmp di, 0e1f4h
    jae short L80afa
    cmp di, 0dcf4h
    jae short L80b00
    jmp short L80b06
L80afa::
    mov dword ptr [edi+01e0ch], ebx
L80b00::
    mov dword ptr [edi+0230ch], esi
L80b06::
    add edi, 010000h
    ret
Func80638_ endp
L80b0d label byte
    dd offset Func80638_
    dd offset L80641
    dd offset L8064b
    dd offset L80655
    dd offset L8065f
    dd offset L8066c
    dd offset L80679
    dd offset L80686
    dd offset L80693
    dd offset L806a0
    dd offset L806ad
    dd offset L806ba
    dd offset L806c7
    dd offset L806d4
    dd offset L806e1
    dd offset L806ee
L80b4d label byte
    dd offset L806fb
    dd offset L8070b
    dd offset L80722
    dd offset L80739
    dd offset L80750
    dd offset L8076b
    dd offset L80786
    dd offset L807a1
    dd offset L807bc
    dd offset L807d7
    dd offset L807f2
    dd offset L8080d
    dd offset L80828
    dd offset L80843
    dd offset L8085e
    dd offset L80879
L80b8d label byte
    dd offset L80894
    dd offset L808b2
    dd offset L808d7
    dd offset L808fc
    dd offset L80921
    dd offset L8094a
    dd offset L80973
    dd offset L8099c
    dd offset L809c5
    dd offset L809ee
    dd offset L80a17
    dd offset L80a40
    dd offset L80a69
    dd offset L80a92
    dd offset L80abb
    dd offset L80ae4
Func80bcd_ proc near
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
    mov dword ptr [L86634], eax
    mov edi, dword ptr [ebp+014h]
    mov eax, dword ptr [edi]
    imul eax, dword ptr [edi+04h]
    add edi, 08h
    mov dword ptr [ebp+014h], edi
    mov dword ptr [L8659c], eax
    mov edi, dword ptr [ebp+010h]
    mov eax, dword ptr [edi]
    mov dword ptr [L8658c], eax
    mov eax, dword ptr [edi+04h]
    mov dword ptr [L86590], eax
    mov eax, dword ptr [edi+08h]
    mov dword ptr [L86594], eax
    mov al, byte ptr [edi+0ch]
    mov byte ptr [L8666c], al
    mov al, byte ptr [edi+0dh]
    mov byte ptr [L8666d], al
    mov al, byte ptr [edi+0eh]
    mov byte ptr [L8666e], al
    mov edi, dword ptr [ebp+0ch]
    mov dword ptr [L86598], edi
    mov byte ptr [L86630], 00h
    test dword ptr [L86634], 07800000h
    je near ptr L85376
    mov esi, dword ptr [ebp+08h]
    mov dword ptr [L86638], 00h
    mov dword ptr [L8662c], 00h
    mov dword ptr [L865a0], 00h
    mov dword ptr [L86628], 00h
    mov ecx, 0e0h
    mov edx, dword ptr [L86634]
    test edx, 020000h
    je short L80cdc
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 04h
    jb near ptr L85518
L80c96::
    and eax, 0fh
    mov byte ptr [L8666c], al
    mov eax, dword ptr [eax*4+L865a8]
    mov dword ptr [L865a0], eax
    cmp eax, 00h
    je short L80cd6
    mov edi, dword ptr [L8658c]
L80cb5::
    mov eax, dword ptr [esi]
    shrd eax, edx, cl
    add cl, 04h
    jb near ptr L86508
L80cc3::
    and eax, 0fh
    call dword ptr [eax*4+L80538]
    sub dword ptr [L865a0], 01h
    jne short L80cb5
L80cd6::
    mov edx, dword ptr [L86634]
L80cdc::
    test edx, 040000h
    je short L80d41
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 04h
    jb near ptr L85524
L80cf5::
    and eax, 0fh
    mov byte ptr [L8666d], al
    mov eax, dword ptr [eax*4+L865a8]
    mul dword ptr [L8659c]
    mov dword ptr [L865a0], eax
    cmp eax, 00h
    je short L80d3b
    mov edi, dword ptr [L86590]
L80d1a::
    mov eax, dword ptr [esi]
    shrd eax, edx, cl
    add cl, 04h
    jb near ptr L86518
L80d28::
    and eax, 0fh
    call dword ptr [eax*4+L80538]
    sub dword ptr [L865a0], 01h
    jne short L80d1a
L80d3b::
    mov edx, dword ptr [L86634]
L80d41::
    test edx, 080000h
    je short L80da8
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 014h
    jae short L80d5c
    add esi, 04h
    or cl, 0e0h
L80d5c::
    and eax, 0fffffh
    mov dword ptr [L865a0], eax
    cmp eax, 00h
    je short L80da8
    bswap ecx
    mov cl, 00h
    sub eax, 01h
L80d72::
    add cl, 01h
    shr eax, 1
    jne short L80d72
    mov byte ptr [L8666e], cl
    bswap ecx
    mov edi, dword ptr [L86594]
L80d87::
    mov eax, dword ptr [esi]
    shrd eax, edx, cl
    add cl, 04h
    jb near ptr L86528
L80d95::
    and eax, 0fh
    call dword ptr [eax*4+L80538]
    sub dword ptr [L865a0], 01h
    jne short L80d87
L80da8::
    mov edx, dword ptr [L86590]
    mov dword ptr [L86628], edx
    bswap ecx
    mov edx, dword ptr [ebp+010h]
    mov cl, byte ptr [L8666c]
    mov byte ptr [edx+0ch], cl
    mov eax, 01h
    shl eax, cl
    dec eax
    mov dword ptr [L86668], eax
    mov cl, byte ptr [L8666e]
    mov byte ptr [edx+0eh], cl
    mov eax, 01h
    shl eax, cl
    dec eax
    mov dword ptr [L86664], eax
    mov cl, byte ptr [L8666d]
    mov byte ptr [edx+0dh], cl
    mov eax, 01h
    shl eax, cl
    dec eax
    mov dword ptr [L86660], eax
    add cl, 03h
    mov byte ptr [L8666f], cl
    bswap ecx
    xor edx, edx
    mov word ptr [L8656c], 0ffffh
L80e11::
    mov dword ptr [L8664c], esi
    mov dword ptr [L86650], edx
    mov ch, byte ptr [L86630]
    mov dword ptr [L8665c], ecx
    mov eax, dword ptr [L8662c]
    mov dword ptr [L86658], eax
    mov eax, dword ptr [L86628]
    mov dword ptr [L86654], eax
L80e3d::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb near ptr L85530
L80e4a::
    and eax, 01h
    je short L80ea0
    add edx, 01h
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 03h
    jb near ptr L8553c
L80e63::
    and eax, 07h
    add edx, eax
    cmp eax, 07h
    jl short L80ea0
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 07h
    jb near ptr L85548
L80e7e::
    and eax, 07fh
    add edx, eax
    cmp eax, 07fh
    jl short L80ea0
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 0ch
    jb near ptr L85554
L80e99::
    and eax, 0fffh
    add edx, eax
L80ea0::
    bswap ecx
    mov cl, byte ptr [L8666f]
    mov ebx, edx
    shl ebx, cl
    add dword ptr [L86628], ebx
    bswap ecx
    add edx, dword ptr [L8662c]
    cmp edx, dword ptr [L8659c]
    jae near ptr L839d4
    mov dword ptr [L8662c], edx
    shl edx, 02h
    add edx, dword ptr [ebp+014h]
    mov edi, dword ptr [edx]
    cmp edi, 0ffffffffh
    je near ptr L82342
    cmp edi, 0fffffffeh
    je near ptr L839d4
    shld ebx, edi, 010h
    cmp di, 0dcfah
    ja near ptr L82353
    cmp bx, word ptr [L8656c]
    jne near ptr L839f8
L80f02::
    mov word ptr [L8656c], bx
    mov dword ptr [L86588], edi
    and edi, 0ffffh
    or edi, dword ptr [L86598]
L80f1b::
    mov dword ptr [L865a4], 00h
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb near ptr L85560
L80f32::
    test al, 01h
    jne near ptr L811d1
L80f3a::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb near ptr L8556c
L80f47::
    and eax, 01h
    jne short L80f53
    mov al, byte ptr [L86630]
    jmp short L80f77
L80f53::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb near ptr L85578
L80f60::
    and eax, 01h
    mov al, byte ptr [L86630]
    je short L80f6c
    inc al
L80f6c::
    sub al, 02h
    sbb al, 00h
    and al, 03h
    mov byte ptr [L86630], al
L80f77::
    or al, al
    je short L80ff7
    test al, 02h
    jne short L80fa1
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L8666c]
    jb near ptr L85584
L80f93::
    and eax, dword ptr [L86668]
    mov edx, dword ptr [L8658c]
    jmp short L80fc1
L80fa1::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L8666e]
    jb near ptr L85590
L80fb5::
    and eax, dword ptr [L86664]
    mov edx, dword ptr [L86594]
L80fc1::
    shl eax, 03h
    add edx, eax
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 011h
    jae short L80fd9
    add esi, 04h
    or cl, 0e0h
L80fd9::
    and eax, 01ffffh
    mov dword ptr [L86578], esi
    mov dword ptr [L86580], ebp
    mov dword ptr [L8657c], ecx
    mov ebx, dword ptr [edx]
    mov esi, dword ptr [edx+04h]
    jmp short L8104b
L80ff7::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L8666d]
    jb near ptr L8559c
L8100b::
    and eax, dword ptr [L86660]
    mov edx, dword ptr [L86628]
    shl eax, 03h
    add edx, eax
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 011h
    jae short L8102f
    add esi, 04h
    or cl, 0e0h
L8102f::
    and eax, 01ffffh
    mov dword ptr [L86578], esi
    mov dword ptr [L86580], ebp
    mov dword ptr [L8657c], ecx
    mov ebx, dword ptr [edx]
    mov esi, dword ptr [edx+04h]
L8104b::
    or dword ptr [L865a4], eax
    test al, al
    je near ptr L810ee
    test al, 01h
    je short L810ce
L8105d::
    mov dword ptr [edi], ebx
    mov dword ptr [edi+0500h], esi
    test al, 02h
    je short L810d2
L81069::
    mov dword ptr [edi+04h], ebx
    mov dword ptr [edi+0504h], esi
    test al, 010h
    je short L810d6
L81076::
    mov dword ptr [edi+08h], ebx
    mov dword ptr [edi+0508h], esi
    test al, 020h
    je short L810da
L81083::
    mov dword ptr [edi+0ch], ebx
    mov dword ptr [edi+050ch], esi
    test al, 04h
    je short L810de
L81090::
    mov dword ptr [edi+0a00h], ebx
    mov dword ptr [edi+0f00h], esi
    test al, 08h
    je short L810e2
L810a0::
    mov dword ptr [edi+0a04h], ebx
    mov dword ptr [edi+0f04h], esi
    test al, 040h
    je short L810e6
L810b0::
    mov dword ptr [edi+0a08h], ebx
    mov dword ptr [edi+0f08h], esi
    test al, 080h
    je short L810ea
L810c0::
    mov dword ptr [edi+0a0ch], ebx
    mov dword ptr [edi+0f0ch], esi
    jmp short L810ee
L810ce::
    test al, 01h
    jne short L8105d
L810d2::
    test al, 02h
    jne short L81069
L810d6::
    test al, 010h
    jne short L81076
L810da::
    test al, 020h
    jne short L81083
L810de::
    test al, 04h
    jne short L81090
L810e2::
    test al, 08h
    jne short L810a0
L810e6::
    test al, 040h
    jne short L810b0
L810ea::
    test al, 080h
    jne short L810c0
L810ee::
    test ah, ah
    je near ptr L811b4
    test ah, 01h
    je near ptr L81184
L810ff::
    mov dword ptr [edi+01400h], ebx
    mov dword ptr [edi+01900h], esi
    test ah, 02h
    je short L8118d
L81110::
    mov dword ptr [edi+01404h], ebx
    mov dword ptr [edi+01904h], esi
    test ah, 010h
    je short L81196
L81121::
    mov dword ptr [edi+01408h], ebx
    mov dword ptr [edi+01908h], esi
    test ah, 020h
    je short L8119b
L81132::
    mov dword ptr [edi+0140ch], ebx
    mov dword ptr [edi+0190ch], esi
    test ah, 04h
    je short L811a0
L81143::
    mov dword ptr [edi+01e00h], ebx
    mov dword ptr [edi+02300h], esi
    test ah, 08h
    je short L811a5
L81154::
    mov dword ptr [edi+01e04h], ebx
    mov dword ptr [edi+02304h], esi
    test ah, 040h
    je short L811aa
L81165::
    mov dword ptr [edi+01e08h], ebx
    mov dword ptr [edi+02308h], esi
    test ah, 080h
    je short L811af
L81176::
    mov dword ptr [edi+01e0ch], ebx
    mov dword ptr [edi+0230ch], esi
    jmp short L811b4
L81184::
    test ah, 01h
    jne near ptr L810ff
L8118d::
    test ah, 02h
    jne near ptr L81110
L81196::
    test ah, 010h
    jne short L81121
L8119b::
    test ah, 020h
    jne short L81132
L811a0::
    test ah, 04h
    jne short L81143
L811a5::
    test ah, 08h
    jne short L81154
L811aa::
    test ah, 040h
    jne short L81165
L811af::
    test ah, 080h
    jne short L81176
L811b4::
    mov esi, dword ptr [L86578]
    mov ecx, dword ptr [L8657c]
    mov ebp, dword ptr [L86580]
    and eax, 010000h
    je near ptr L80f3a
L811d1::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb near ptr L855a8
L811de::
    test al, 01h
    jne near ptr L821e6
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 04h
    jb near ptr L855b4
L811f7::
    and eax, 0fh
    jmp dword ptr [eax*4+L81201]
Func80bcd_ endp
L81201 label byte
    dd offset Func81241_
    dd offset L8125f
    dd offset L81280
    dd offset L812a4
    dd offset L812c4
    dd offset L812e6
    dd offset L8130d
    dd offset L81330
    dd offset L81354
    dd offset L81373
    dd offset L81397
    dd offset L813bd
    dd offset L813dd
    dd offset L813f8
    dd offset L81419
    dd offset L81437
Func81241_ proc near
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 010h
    jae short L81254
    add esi, 04h
    or cl, 0e0h
L81254::
    xor dword ptr [L865a4], eax
    jmp near ptr L8143d
L8125f::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 0ch
    jb near ptr L855c0
L81270::
    shl eax, 04h
    or al, 0fh
    xor dword ptr [L865a4], eax
    jmp near ptr L8143d
L81280::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 0ch
    jb near ptr L855cc
L81291::
    shl eax, 04h
    shr al, 04h
    or al, 0f0h
    xor dword ptr [L865a4], eax
    jmp near ptr L8143d
L812a4::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 08h
    jb near ptr L855d8
L812b5::
    mov ah, al
    mov al, 0ffh
    xor dword ptr [L865a4], eax
    jmp near ptr L8143d
L812c4::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 0ch
    jb near ptr L855e4
L812d5::
    shl ah, 04h
    or ah, 0fh
    xor dword ptr [L865a4], eax
    jmp near ptr L8143d
L812e6::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 08h
    jb near ptr L855f0
L812f7::
    shl eax, 04h
    shl ah, 04h
    or eax, 0f0fh
    xor dword ptr [L865a4], eax
    jmp near ptr L8143d
L8130d::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 08h
    jb near ptr L855fc
L8131e::
    mov ah, al
    or eax, 0ff0h
    xor dword ptr [L865a4], eax
    jmp near ptr L8143d
L81330::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 04h
    jb near ptr L85608
L81341::
    shl eax, 0ch
    or eax, 0fffh
    xor dword ptr [L865a4], eax
    jmp near ptr L8143d
L81354::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 0ch
    jb near ptr L85614
L81365::
    or ah, 0f0h
    xor dword ptr [L865a4], eax
    jmp near ptr L8143d
L81373::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 08h
    jb near ptr L85620
L81384::
    shl eax, 04h
    or eax, 0f00fh
    xor dword ptr [L865a4], eax
    jmp near ptr L8143d
L81397::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 08h
    jb near ptr L8562c
L813a8::
    mov ah, al
    ror ah, 04h
    or eax, 0f0f0h
    xor dword ptr [L865a4], eax
    jmp near ptr L8143d
L813bd::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 04h
    jb near ptr L85638
L813ce::
    mov ah, al
    or eax, 0f0ffh
    xor dword ptr [L865a4], eax
    jmp short L8143d
L813dd::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 08h
    jb near ptr L85644
L813ee::
    mov ah, 0ffh
    xor dword ptr [L865a4], eax
    jmp short L8143d
L813f8::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 04h
    jb near ptr L85650
L81409::
    or eax, 0fff0h
    rol al, 04h
    xor dword ptr [L865a4], eax
    jmp short L8143d
L81419::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 04h
    jb near ptr L8565c
L8142a::
    or eax, 0fff0h
    xor dword ptr [L865a4], eax
    jmp short L8143d
L81437::
    not dword ptr [L865a4]
L8143d::
    test byte ptr [L865a4], 0ffh
    je near ptr L81b07
    test byte ptr [L865a4], 01h
    je near ptr L81a9f
L81457::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb near ptr L85668
L81464::
    and eax, 01h
    jne short L81470
    mov al, byte ptr [L86630]
    jmp short L81494
L81470::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb near ptr L85674
L8147d::
    and eax, 01h
    mov al, byte ptr [L86630]
    je short L81489
    inc al
L81489::
    sub al, 02h
    sbb al, 00h
    and al, 03h
    mov byte ptr [L86630], al
L81494::
    or al, al
    je short L814e0
    test al, 02h
    jne short L814be
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L8666c]
    jb near ptr L85680
L814b0::
    and eax, dword ptr [L86668]
    mov edx, dword ptr [L8658c]
    jmp short L81500
L814be::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L8666e]
    jb near ptr L8568c
L814d2::
    and eax, dword ptr [L86664]
    mov edx, dword ptr [L86594]
    jmp short L81500
L814e0::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L8666d]
    jb near ptr L85698
L814f4::
    and eax, dword ptr [L86660]
    mov edx, dword ptr [L86628]
L81500::
    shl eax, 03h
    add edx, eax
    mov eax, dword ptr [edx]
    mov dword ptr [edi], eax
    mov eax, dword ptr [edx+04h]
    mov dword ptr [edi+0500h], eax
    test byte ptr [L865a4], 02h
    je near ptr L81aac
L8151f::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb near ptr L856a4
L8152c::
    and eax, 01h
    jne short L81538
    mov al, byte ptr [L86630]
    jmp short L8155c
L81538::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb near ptr L856b0
L81545::
    and eax, 01h
    mov al, byte ptr [L86630]
    je short L81551
    inc al
L81551::
    sub al, 02h
    sbb al, 00h
    and al, 03h
    mov byte ptr [L86630], al
L8155c::
    or al, al
    je short L815a8
    test al, 02h
    jne short L81586
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L8666c]
    jb near ptr L856bc
L81578::
    and eax, dword ptr [L86668]
    mov edx, dword ptr [L8658c]
    jmp short L815c8
L81586::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L8666e]
    jb near ptr L856c8
L8159a::
    and eax, dword ptr [L86664]
    mov edx, dword ptr [L86594]
    jmp short L815c8
L815a8::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L8666d]
    jb near ptr L856d4
L815bc::
    and eax, dword ptr [L86660]
    mov edx, dword ptr [L86628]
L815c8::
    shl eax, 03h
    add edx, eax
    mov eax, dword ptr [edx]
    mov dword ptr [edi+04h], eax
    mov eax, dword ptr [edx+04h]
    mov dword ptr [edi+0504h], eax
    test byte ptr [L865a4], 010h
    je near ptr L81ab9
L815e8::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb near ptr L856e0
L815f5::
    and eax, 01h
    jne short L81601
    mov al, byte ptr [L86630]
    jmp short L81625
L81601::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb near ptr L856ec
L8160e::
    and eax, 01h
    mov al, byte ptr [L86630]
    je short L8161a
    inc al
L8161a::
    sub al, 02h
    sbb al, 00h
    and al, 03h
    mov byte ptr [L86630], al
L81625::
    or al, al
    je short L81671
    test al, 02h
    jne short L8164f
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L8666c]
    jb near ptr L856f8
L81641::
    and eax, dword ptr [L86668]
    mov edx, dword ptr [L8658c]
    jmp short L81691
L8164f::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L8666e]
    jb near ptr L85704
L81663::
    and eax, dword ptr [L86664]
    mov edx, dword ptr [L86594]
    jmp short L81691
L81671::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L8666d]
    jb near ptr L85710
L81685::
    and eax, dword ptr [L86660]
    mov edx, dword ptr [L86628]
L81691::
    shl eax, 03h
    add edx, eax
    mov eax, dword ptr [edx]
    mov dword ptr [edi+08h], eax
    mov eax, dword ptr [edx+04h]
    mov dword ptr [edi+0508h], eax
    test byte ptr [L865a4], 020h
    je near ptr L81ac6
L816b1::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb near ptr L8571c
L816be::
    and eax, 01h
    jne short L816ca
    mov al, byte ptr [L86630]
    jmp short L816ee
L816ca::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb near ptr L85728
L816d7::
    and eax, 01h
    mov al, byte ptr [L86630]
    je short L816e3
    inc al
L816e3::
    sub al, 02h
    sbb al, 00h
    and al, 03h
    mov byte ptr [L86630], al
L816ee::
    or al, al
    je short L8173a
    test al, 02h
    jne short L81718
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L8666c]
    jb near ptr L85734
L8170a::
    and eax, dword ptr [L86668]
    mov edx, dword ptr [L8658c]
    jmp short L8175a
L81718::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L8666e]
    jb near ptr L85740
L8172c::
    and eax, dword ptr [L86664]
    mov edx, dword ptr [L86594]
    jmp short L8175a
L8173a::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L8666d]
    jb near ptr L8574c
L8174e::
    and eax, dword ptr [L86660]
    mov edx, dword ptr [L86628]
L8175a::
    shl eax, 03h
    add edx, eax
    mov eax, dword ptr [edx]
    mov dword ptr [edi+0ch], eax
    mov eax, dword ptr [edx+04h]
    mov dword ptr [edi+050ch], eax
    test byte ptr [L865a4], 04h
    je near ptr L81ad3
L8177a::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb near ptr L85758
L81787::
    and eax, 01h
    jne short L81793
    mov al, byte ptr [L86630]
    jmp short L817b7
L81793::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb near ptr L85764
L817a0::
    and eax, 01h
    mov al, byte ptr [L86630]
    je short L817ac
    inc al
L817ac::
    sub al, 02h
    sbb al, 00h
    and al, 03h
    mov byte ptr [L86630], al
L817b7::
    or al, al
    je short L81803
    test al, 02h
    jne short L817e1
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L8666c]
    jb near ptr L85770
L817d3::
    and eax, dword ptr [L86668]
    mov edx, dword ptr [L8658c]
    jmp short L81823
L817e1::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L8666e]
    jb near ptr L8577c
L817f5::
    and eax, dword ptr [L86664]
    mov edx, dword ptr [L86594]
    jmp short L81823
L81803::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L8666d]
    jb near ptr L85788
L81817::
    and eax, dword ptr [L86660]
    mov edx, dword ptr [L86628]
L81823::
    shl eax, 03h
    add edx, eax
    mov eax, dword ptr [edx]
    mov dword ptr [edi+0a00h], eax
    mov eax, dword ptr [edx+04h]
    mov dword ptr [edi+0f00h], eax
    test byte ptr [L865a4], 08h
    je near ptr L81ae0
L81846::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb near ptr L85794
L81853::
    and eax, 01h
    jne short L8185f
    mov al, byte ptr [L86630]
    jmp short L81883
L8185f::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb near ptr L857a0
L8186c::
    and eax, 01h
    mov al, byte ptr [L86630]
    je short L81878
    inc al
L81878::
    sub al, 02h
    sbb al, 00h
    and al, 03h
    mov byte ptr [L86630], al
L81883::
    or al, al
    je short L818cf
    test al, 02h
    jne short L818ad
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L8666c]
    jb near ptr L857ac
L8189f::
    and eax, dword ptr [L86668]
    mov edx, dword ptr [L8658c]
    jmp short L818ef
L818ad::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L8666e]
    jb near ptr L857b8
L818c1::
    and eax, dword ptr [L86664]
    mov edx, dword ptr [L86594]
    jmp short L818ef
L818cf::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L8666d]
    jb near ptr L857c4
L818e3::
    and eax, dword ptr [L86660]
    mov edx, dword ptr [L86628]
L818ef::
    shl eax, 03h
    add edx, eax
    mov eax, dword ptr [edx]
    mov dword ptr [edi+0a04h], eax
    mov eax, dword ptr [edx+04h]
    mov dword ptr [edi+0f04h], eax
    test byte ptr [L865a4], 040h
    je near ptr L81aed
L81912::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb near ptr L857d0
L8191f::
    and eax, 01h
    jne short L8192b
    mov al, byte ptr [L86630]
    jmp short L8194f
L8192b::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb near ptr L857dc
L81938::
    and eax, 01h
    mov al, byte ptr [L86630]
    je short L81944
    inc al
L81944::
    sub al, 02h
    sbb al, 00h
    and al, 03h
    mov byte ptr [L86630], al
L8194f::
    or al, al
    je short L8199b
    test al, 02h
    jne short L81979
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L8666c]
    jb near ptr L857e8
L8196b::
    and eax, dword ptr [L86668]
    mov edx, dword ptr [L8658c]
    jmp short L819bb
L81979::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L8666e]
    jb near ptr L857f4
L8198d::
    and eax, dword ptr [L86664]
    mov edx, dword ptr [L86594]
    jmp short L819bb
L8199b::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L8666d]
    jb near ptr L85800
L819af::
    and eax, dword ptr [L86660]
    mov edx, dword ptr [L86628]
L819bb::
    shl eax, 03h
    add edx, eax
    mov eax, dword ptr [edx]
    mov dword ptr [edi+0a08h], eax
    mov eax, dword ptr [edx+04h]
    mov dword ptr [edi+0f08h], eax
    test byte ptr [L865a4], 080h
    je near ptr L81afa
L819de::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb near ptr L8580c
L819eb::
    and eax, 01h
    jne short L819f7
    mov al, byte ptr [L86630]
    jmp short L81a1b
L819f7::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb near ptr L85818
L81a04::
    and eax, 01h
    mov al, byte ptr [L86630]
    je short L81a10
    inc al
L81a10::
    sub al, 02h
    sbb al, 00h
    and al, 03h
    mov byte ptr [L86630], al
L81a1b::
    or al, al
    je short L81a67
    test al, 02h
    jne short L81a45
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L8666c]
    jb near ptr L85824
L81a37::
    and eax, dword ptr [L86668]
    mov edx, dword ptr [L8658c]
    jmp short L81a87
L81a45::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L8666e]
    jb near ptr L85830
L81a59::
    and eax, dword ptr [L86664]
    mov edx, dword ptr [L86594]
    jmp short L81a87
L81a67::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L8666d]
    jb near ptr L8583c
L81a7b::
    and eax, dword ptr [L86660]
    mov edx, dword ptr [L86628]
L81a87::
    shl eax, 03h
    add edx, eax
    mov eax, dword ptr [edx]
    mov dword ptr [edi+0a0ch], eax
    mov eax, dword ptr [edx+04h]
    mov dword ptr [edi+0f0ch], eax
    jmp short L81b07
L81a9f::
    test byte ptr [L865a4], 01h
    jne near ptr L81457
L81aac::
    test byte ptr [L865a4], 02h
    jne near ptr L8151f
L81ab9::
    test byte ptr [L865a4], 010h
    jne near ptr L815e8
L81ac6::
    test byte ptr [L865a4], 020h
    jne near ptr L816b1
L81ad3::
    test byte ptr [L865a4], 04h
    jne near ptr L8177a
L81ae0::
    test byte ptr [L865a4], 08h
    jne near ptr L81846
L81aed::
    test byte ptr [L865a4], 040h
    jne near ptr L81912
L81afa::
    test byte ptr [L865a4], 080h
    jne near ptr L819de
L81b07::
    test byte ptr [L865a5], 0ffh
    je near ptr L82332
    test byte ptr [L865a5], 01h
    je near ptr L82179
L81b21::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb near ptr L85848
L81b2e::
    and eax, 01h
    jne short L81b3a
    mov al, byte ptr [L86630]
    jmp short L81b5e
L81b3a::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb near ptr L85854
L81b47::
    and eax, 01h
    mov al, byte ptr [L86630]
    je short L81b53
    inc al
L81b53::
    sub al, 02h
    sbb al, 00h
    and al, 03h
    mov byte ptr [L86630], al
L81b5e::
    or al, al
    je short L81baa
    test al, 02h
    jne short L81b88
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L8666c]
    jb near ptr L85860
L81b7a::
    and eax, dword ptr [L86668]
    mov edx, dword ptr [L8658c]
    jmp short L81bca
L81b88::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L8666e]
    jb near ptr L8586c
L81b9c::
    and eax, dword ptr [L86664]
    mov edx, dword ptr [L86594]
    jmp short L81bca
L81baa::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L8666d]
    jb near ptr L85878
L81bbe::
    and eax, dword ptr [L86660]
    mov edx, dword ptr [L86628]
L81bca::
    shl eax, 03h
    add edx, eax
    mov eax, dword ptr [edx]
    mov dword ptr [edi+01400h], eax
    mov eax, dword ptr [edx+04h]
    mov dword ptr [edi+01900h], eax
    test byte ptr [L865a5], 02h
    je near ptr L82186
L81bed::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb near ptr L85884
L81bfa::
    and eax, 01h
    jne short L81c06
    mov al, byte ptr [L86630]
    jmp short L81c2a
L81c06::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb near ptr L85890
L81c13::
    and eax, 01h
    mov al, byte ptr [L86630]
    je short L81c1f
    inc al
L81c1f::
    sub al, 02h
    sbb al, 00h
    and al, 03h
    mov byte ptr [L86630], al
L81c2a::
    or al, al
    je short L81c76
    test al, 02h
    jne short L81c54
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L8666c]
    jb near ptr L8589c
L81c46::
    and eax, dword ptr [L86668]
    mov edx, dword ptr [L8658c]
    jmp short L81c96
L81c54::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L8666e]
    jb near ptr L858a8
L81c68::
    and eax, dword ptr [L86664]
    mov edx, dword ptr [L86594]
    jmp short L81c96
L81c76::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L8666d]
    jb near ptr L858b4
L81c8a::
    and eax, dword ptr [L86660]
    mov edx, dword ptr [L86628]
L81c96::
    shl eax, 03h
    add edx, eax
    mov eax, dword ptr [edx]
    mov dword ptr [edi+01404h], eax
    mov eax, dword ptr [edx+04h]
    mov dword ptr [edi+01904h], eax
    test byte ptr [L865a5], 010h
    je near ptr L82193
L81cb9::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb near ptr L858c0
L81cc6::
    and eax, 01h
    jne short L81cd2
    mov al, byte ptr [L86630]
    jmp short L81cf6
L81cd2::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb near ptr L858cc
L81cdf::
    and eax, 01h
    mov al, byte ptr [L86630]
    je short L81ceb
    inc al
L81ceb::
    sub al, 02h
    sbb al, 00h
    and al, 03h
    mov byte ptr [L86630], al
L81cf6::
    or al, al
    je short L81d42
    test al, 02h
    jne short L81d20
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L8666c]
    jb near ptr L858d8
L81d12::
    and eax, dword ptr [L86668]
    mov edx, dword ptr [L8658c]
    jmp short L81d62
L81d20::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L8666e]
    jb near ptr L858e4
L81d34::
    and eax, dword ptr [L86664]
    mov edx, dword ptr [L86594]
    jmp short L81d62
L81d42::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L8666d]
    jb near ptr L858f0
L81d56::
    and eax, dword ptr [L86660]
    mov edx, dword ptr [L86628]
L81d62::
    shl eax, 03h
    add edx, eax
    mov eax, dword ptr [edx]
    mov dword ptr [edi+01408h], eax
    mov eax, dword ptr [edx+04h]
    mov dword ptr [edi+01908h], eax
    test byte ptr [L865a5], 020h
    je near ptr L821a0
L81d85::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb near ptr L858fc
L81d92::
    and eax, 01h
    jne short L81d9e
    mov al, byte ptr [L86630]
    jmp short L81dc2
L81d9e::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb near ptr L85908
L81dab::
    and eax, 01h
    mov al, byte ptr [L86630]
    je short L81db7
    inc al
L81db7::
    sub al, 02h
    sbb al, 00h
    and al, 03h
    mov byte ptr [L86630], al
L81dc2::
    or al, al
    je short L81e0e
    test al, 02h
    jne short L81dec
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L8666c]
    jb near ptr L85914
L81dde::
    and eax, dword ptr [L86668]
    mov edx, dword ptr [L8658c]
    jmp short L81e2e
L81dec::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L8666e]
    jb near ptr L85920
L81e00::
    and eax, dword ptr [L86664]
    mov edx, dword ptr [L86594]
    jmp short L81e2e
L81e0e::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L8666d]
    jb near ptr L8592c
L81e22::
    and eax, dword ptr [L86660]
    mov edx, dword ptr [L86628]
L81e2e::
    shl eax, 03h
    add edx, eax
    mov eax, dword ptr [edx]
    mov dword ptr [edi+0140ch], eax
    mov eax, dword ptr [edx+04h]
    mov dword ptr [edi+0190ch], eax
    test byte ptr [L865a5], 04h
    je near ptr L821ad
L81e51::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb near ptr L85938
L81e5e::
    and eax, 01h
    jne short L81e6a
    mov al, byte ptr [L86630]
    jmp short L81e8e
L81e6a::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb near ptr L85944
L81e77::
    and eax, 01h
    mov al, byte ptr [L86630]
    je short L81e83
    inc al
L81e83::
    sub al, 02h
    sbb al, 00h
    and al, 03h
    mov byte ptr [L86630], al
L81e8e::
    or al, al
    je short L81eda
    test al, 02h
    jne short L81eb8
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L8666c]
    jb near ptr L85950
L81eaa::
    and eax, dword ptr [L86668]
    mov edx, dword ptr [L8658c]
    jmp short L81efa
L81eb8::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L8666e]
    jb near ptr L8595c
L81ecc::
    and eax, dword ptr [L86664]
    mov edx, dword ptr [L86594]
    jmp short L81efa
L81eda::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L8666d]
    jb near ptr L85968
L81eee::
    and eax, dword ptr [L86660]
    mov edx, dword ptr [L86628]
L81efa::
    shl eax, 03h
    add edx, eax
    mov eax, dword ptr [edx]
    mov dword ptr [edi+01e00h], eax
    mov eax, dword ptr [edx+04h]
    mov dword ptr [edi+02300h], eax
    test byte ptr [L865a5], 08h
    je near ptr L821ba
L81f1d::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb near ptr L85974
L81f2a::
    and eax, 01h
    jne short L81f36
    mov al, byte ptr [L86630]
    jmp short L81f5a
L81f36::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb near ptr L85980
L81f43::
    and eax, 01h
    mov al, byte ptr [L86630]
    je short L81f4f
    inc al
L81f4f::
    sub al, 02h
    sbb al, 00h
    and al, 03h
    mov byte ptr [L86630], al
L81f5a::
    or al, al
    je short L81fa6
    test al, 02h
    jne short L81f84
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L8666c]
    jb near ptr L8598c
L81f76::
    and eax, dword ptr [L86668]
    mov edx, dword ptr [L8658c]
    jmp short L81fc6
L81f84::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L8666e]
    jb near ptr L85998
L81f98::
    and eax, dword ptr [L86664]
    mov edx, dword ptr [L86594]
    jmp short L81fc6
L81fa6::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L8666d]
    jb near ptr L859a4
L81fba::
    and eax, dword ptr [L86660]
    mov edx, dword ptr [L86628]
L81fc6::
    shl eax, 03h
    add edx, eax
    mov eax, dword ptr [edx]
    mov dword ptr [edi+01e04h], eax
    mov eax, dword ptr [edx+04h]
    mov dword ptr [edi+02304h], eax
    test byte ptr [L865a5], 040h
    je near ptr L821c7
L81fe9::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb near ptr L859b0
L81ff6::
    and eax, 01h
    jne short L82002
    mov al, byte ptr [L86630]
    jmp short L82026
L82002::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb near ptr L859bc
L8200f::
    and eax, 01h
    mov al, byte ptr [L86630]
    je short L8201b
    inc al
L8201b::
    sub al, 02h
    sbb al, 00h
    and al, 03h
    mov byte ptr [L86630], al
L82026::
    or al, al
    je short L82072
    test al, 02h
    jne short L82050
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L8666c]
    jb near ptr L859c8
L82042::
    and eax, dword ptr [L86668]
    mov edx, dword ptr [L8658c]
    jmp short L82092
L82050::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L8666e]
    jb near ptr L859d4
L82064::
    and eax, dword ptr [L86664]
    mov edx, dword ptr [L86594]
    jmp short L82092
L82072::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L8666d]
    jb near ptr L859e0
L82086::
    and eax, dword ptr [L86660]
    mov edx, dword ptr [L86628]
L82092::
    shl eax, 03h
    add edx, eax
    mov eax, dword ptr [edx]
    mov dword ptr [edi+01e08h], eax
    mov eax, dword ptr [edx+04h]
    mov dword ptr [edi+02308h], eax
    test byte ptr [L865a5], 080h
    je near ptr L821d4
L820b5::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb near ptr L859ec
L820c2::
    and eax, 01h
    jne short L820ce
    mov al, byte ptr [L86630]
    jmp short L820f2
L820ce::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb near ptr L859f8
L820db::
    and eax, 01h
    mov al, byte ptr [L86630]
    je short L820e7
    inc al
L820e7::
    sub al, 02h
    sbb al, 00h
    and al, 03h
    mov byte ptr [L86630], al
L820f2::
    or al, al
    je short L8213e
    test al, 02h
    jne short L8211c
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L8666c]
    jb near ptr L85a04
L8210e::
    and eax, dword ptr [L86668]
    mov edx, dword ptr [L8658c]
    jmp short L8215e
L8211c::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L8666e]
    jb near ptr L85a10
L82130::
    and eax, dword ptr [L86664]
    mov edx, dword ptr [L86594]
    jmp short L8215e
L8213e::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L8666d]
    jb near ptr L85a1c
L82152::
    and eax, dword ptr [L86660]
    mov edx, dword ptr [L86628]
L8215e::
    shl eax, 03h
    add edx, eax
    mov eax, dword ptr [edx]
    mov dword ptr [edi+01e0ch], eax
    mov eax, dword ptr [edx+04h]
    mov dword ptr [edi+0230ch], eax
    jmp near ptr L82332
L82179::
    test byte ptr [L865a5], 01h
    jne near ptr L81b21
L82186::
    test byte ptr [L865a5], 02h
    jne near ptr L81bed
L82193::
    test byte ptr [L865a5], 010h
    jne near ptr L81cb9
L821a0::
    test byte ptr [L865a5], 020h
    jne near ptr L81d85
L821ad::
    test byte ptr [L865a5], 04h
    jne near ptr L81e51
L821ba::
    test byte ptr [L865a5], 08h
    jne near ptr L81f1d
L821c7::
    test byte ptr [L865a5], 040h
    jne near ptr L81fe9
L821d4::
    test byte ptr [L865a5], 080h
    jne near ptr L820b5
    jmp near ptr L82332
L821e6::
    test dword ptr [L86634], 010000h
    jne near ptr L8231d
    jmp near ptr L82332
L821fb::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb near ptr L85a28
L82208::
    and eax, 01h
    jne short L82214
    mov al, byte ptr [L86630]
    jmp short L82238
L82214::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb near ptr L85a34
L82221::
    and eax, 01h
    mov al, byte ptr [L86630]
    je short L8222d
    inc al
L8222d::
    sub al, 02h
    sbb al, 00h
    and al, 03h
    mov byte ptr [L86630], al
L82238::
    or al, al
    je short L822b4
    test al, 02h
    jne short L82262
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L8666c]
    jb near ptr L85a40
L82254::
    and eax, dword ptr [L86668]
    mov edx, dword ptr [L8658c]
    jmp short L82282
L82262::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L8666e]
    jb near ptr L85a4c
L82276::
    and eax, dword ptr [L86664]
    mov edx, dword ptr [L86594]
L82282::
    shl eax, 03h
    add edx, eax
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 04h
    jb near ptr L85a58
L82298::
    and eax, 0fh
    mov dword ptr [L86578], esi
    mov dword ptr [L86580], ebp
    mov dword ptr [L8657c], ecx
    mov ebx, dword ptr [edx]
    mov esi, dword ptr [edx+04h]
    jmp short L82304
L822b4::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L8666d]
    jb near ptr L85a64
L822c8::
    and eax, dword ptr [L86660]
    mov edx, dword ptr [L86628]
    shl eax, 03h
    add edx, eax
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 04h
    jb near ptr L85a70
L822ea::
    and eax, 0fh
    mov dword ptr [L86578], esi
    mov dword ptr [L86580], ebp
    mov dword ptr [L8657c], ecx
    mov ebx, dword ptr [edx]
    mov esi, dword ptr [edx+04h]
L82304::
    call dword ptr [eax*4+L80b0d]
    mov esi, dword ptr [L86578]
    mov ecx, dword ptr [L8657c]
    mov ebp, dword ptr [L86580]
L8231d::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb near ptr L85a7c
L8232a::
    test al, 01h
    je near ptr L821fb
L82332::
    mov edx, 01h
    mov edi, dword ptr [L86588]
    jmp near ptr L80e11
L82342::
    mov dword ptr [L86588], edi
    lea edi, [L86674]
    jmp near ptr L80f1b
L82353::
    cmp bx, word ptr [L8656c]
    jne near ptr L8533c
L82360::
    cmp dword ptr [L86638], 00h
    jne short L8239b
    mov eax, dword ptr [L8664c]
    mov dword ptr [L86638], eax
    mov eax, dword ptr [L8665c]
    mov dword ptr [L86648], eax
    mov eax, dword ptr [L86650]
    mov dword ptr [L8663c], eax
    mov eax, dword ptr [L86658]
    mov dword ptr [L86644], eax
    mov eax, dword ptr [L86654]
    mov dword ptr [L86640], eax
L8239b::
    mov dword ptr [L86588], edi
    and edi, 0ffffh
    or edi, dword ptr [L86598]
    mov dword ptr [L865a4], 00h
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb near ptr L85a88
L823c4::
    test al, 01h
    jne near ptr L8278d
L823cc::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb near ptr L85a94
L823d9::
    and eax, 01h
    jne short L823e5
    mov al, byte ptr [L86630]
    jmp short L82409
L823e5::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb near ptr L85aa0
L823f2::
    and eax, 01h
    mov al, byte ptr [L86630]
    je short L823fe
    inc al
L823fe::
    sub al, 02h
    sbb al, 00h
    and al, 03h
    mov byte ptr [L86630], al
L82409::
    or al, al
    je short L82489
    test al, 02h
    jne short L82433
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L8666c]
    jb near ptr L85aac
L82425::
    and eax, dword ptr [L86668]
    mov edx, dword ptr [L8658c]
    jmp short L82453
L82433::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L8666e]
    jb near ptr L85ab8
L82447::
    and eax, dword ptr [L86664]
    mov edx, dword ptr [L86594]
L82453::
    shl eax, 03h
    add edx, eax
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 011h
    jae short L8246b
    add esi, 04h
    or cl, 0e0h
L8246b::
    and eax, 01ffffh
    mov dword ptr [L86578], esi
    mov dword ptr [L86580], ebp
    mov dword ptr [L8657c], ecx
    mov ebx, dword ptr [edx]
    mov esi, dword ptr [edx+04h]
    jmp short L824dd
L82489::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L8666d]
    jb near ptr L85ac4
L8249d::
    and eax, dword ptr [L86660]
    mov edx, dword ptr [L86628]
    shl eax, 03h
    add edx, eax
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 011h
    jae short L824c1
    add esi, 04h
    or cl, 0e0h
L824c1::
    and eax, 01ffffh
    mov dword ptr [L86578], esi
    mov dword ptr [L86580], ebp
    mov dword ptr [L8657c], ecx
    mov ebx, dword ptr [edx]
    mov esi, dword ptr [edx+04h]
L824dd::
    or dword ptr [L865a4], eax
    test al, al
    je near ptr L82616
    test al, 01h
    je near ptr L825de
L824f3::
    mov dword ptr [edi], ebx
    cmp di, 0fb00h
    jae short L82502
    mov dword ptr [edi+0500h], esi
L82502::
    test al, 02h
    je near ptr L825e6
L8250a::
    cmp di, 0fffch
    jae short L82520
    mov dword ptr [edi+04h], ebx
    cmp di, 0fafch
    jae short L82520
    mov dword ptr [edi+0504h], esi
L82520::
    test al, 010h
    je near ptr L825ee
L82528::
    cmp di, 0fff8h
    jae short L8253e
    mov dword ptr [edi+08h], ebx
    cmp di, 0faf8h
    jae short L8253e
    mov dword ptr [edi+0508h], esi
L8253e::
    test al, 020h
    je near ptr L825f6
L82546::
    cmp di, 0fff4h
    jae short L8255c
    mov dword ptr [edi+0ch], ebx
    cmp di, 0faf4h
    jae short L8255c
    mov dword ptr [edi+050ch], esi
L8255c::
    test al, 04h
    je near ptr L825fe
L82564::
    cmp di, 0f600h
    jae short L8257e
    mov dword ptr [edi+0a00h], ebx
    cmp di, 0f100h
    jae short L8257e
    mov dword ptr [edi+0f00h], esi
L8257e::
    test al, 08h
    je near ptr L82606
L82586::
    cmp di, 0f5fch
    jae short L825a0
    mov dword ptr [edi+0a04h], ebx
    cmp di, 0f0fch
    jae short L825a0
    mov dword ptr [edi+0f04h], esi
L825a0::
    test al, 040h
    je short L8260e
L825a4::
    cmp di, 0f5f8h
    jae short L825be
    mov dword ptr [edi+0a08h], ebx
    cmp di, 0f0f8h
    jae short L825be
    mov dword ptr [edi+0f08h], esi
L825be::
    test al, 080h
    je short L82612
L825c2::
    cmp di, 0f5f4h
    jae short L825dc
    mov dword ptr [edi+0a0ch], ebx
    cmp di, 0f0f4h
    jae short L825dc
    mov dword ptr [edi+0f0ch], esi
L825dc::
    jmp short L82616
L825de::
    test al, 01h
    jne near ptr L824f3
L825e6::
    test al, 02h
    jne near ptr L8250a
L825ee::
    test al, 010h
    jne near ptr L82528
L825f6::
    test al, 020h
    jne near ptr L82546
L825fe::
    test al, 04h
    jne near ptr L82564
L82606::
    test al, 08h
    jne near ptr L82586
L8260e::
    test al, 040h
    jne short L825a4
L82612::
    test al, 080h
    jne short L825c2
L82616::
    test ah, ah
    je near ptr L82770
    test ah, 01h
    je near ptr L82730
L82627::
    cmp di, 0ec00h
    jae short L82641
    mov dword ptr [edi+01400h], ebx
    cmp di, 0e700h
    jae short L82641
    mov dword ptr [edi+01900h], esi
L82641::
    test ah, 02h
    je near ptr L82739
L8264a::
    cmp di, 0ebfch
    jae short L82664
    mov dword ptr [edi+01404h], ebx
    cmp di, 0e6fch
    jae short L82664
    mov dword ptr [edi+01904h], esi
L82664::
    test ah, 010h
    je near ptr L82742
L8266d::
    cmp di, 0ebf8h
    jae short L82687
    mov dword ptr [edi+01408h], ebx
    cmp di, 0e6f8h
    jae short L82687
    mov dword ptr [edi+01908h], esi
L82687::
    test ah, 020h
    je near ptr L8274b
L82690::
    cmp di, 0ebf4h
    jae short L826aa
    mov dword ptr [edi+0140ch], ebx
    cmp di, 0e6f4h
    jae short L826aa
    mov dword ptr [edi+0190ch], esi
L826aa::
    test ah, 04h
    je near ptr L82754
L826b3::
    cmp di, 0e200h
    jae short L826cd
    mov dword ptr [edi+01e00h], ebx
    cmp di, 0dd00h
    jae short L826cd
    mov dword ptr [edi+02300h], esi
L826cd::
    test ah, 08h
    je near ptr L8275d
L826d6::
    cmp di, 0e1fch
    jae short L826f0
    mov dword ptr [edi+01e04h], ebx
    cmp di, 0dcfch
    jae short L826f0
    mov dword ptr [edi+02304h], esi
L826f0::
    test ah, 040h
    je short L82766
L826f5::
    cmp di, 0e1f8h
    jae short L8270f
    mov dword ptr [edi+01e08h], ebx
    cmp di, 0dcf8h
    jae short L8270f
    mov dword ptr [edi+02308h], esi
L8270f::
    test ah, 080h
    je short L8276b
L82714::
    cmp di, 0e1f4h
    jae short L8272e
    mov dword ptr [edi+01e0ch], ebx
    cmp di, 0dcf4h
    jae short L8272e
    mov dword ptr [edi+0230ch], esi
L8272e::
    jmp short L82770
L82730::
    test ah, 01h
    jne near ptr L82627
L82739::
    test ah, 02h
    jne near ptr L8264a
L82742::
    test ah, 010h
    jne near ptr L8266d
L8274b::
    test ah, 020h
    jne near ptr L82690
L82754::
    test ah, 04h
    jne near ptr L826b3
L8275d::
    test ah, 08h
    jne near ptr L826d6
L82766::
    test ah, 040h
    jne short L826f5
L8276b::
    test ah, 080h
    jne short L82714
L82770::
    mov esi, dword ptr [L86578]
    mov ecx, dword ptr [L8657c]
    mov ebp, dword ptr [L86580]
    and eax, 010000h
    je near ptr L823cc
L8278d::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb near ptr L85ad0
L8279a::
    test al, 01h
    jne near ptr L83878
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 04h
    jb near ptr L85adc
L827b3::
    and eax, 0fh
    jmp dword ptr [eax*4+L827bd]
Func81241_ endp
L827bd label byte
    dd offset Func827fd_
    dd offset L8281b
    dd offset L8283c
    dd offset L82860
    dd offset L82880
    dd offset L828a2
    dd offset L828c9
    dd offset L828ec
    dd offset L82910
    dd offset L8292f
    dd offset L82953
    dd offset L82979
    dd offset L82999
    dd offset L829b4
    dd offset L829d5
    dd offset L829f3
Func827fd_ proc near
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 010h
    jae short L82810
    add esi, 04h
    or cl, 0e0h
L82810::
    xor dword ptr [L865a4], eax
    jmp near ptr L829f9
L8281b::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 0ch
    jb near ptr L85ae8
L8282c::
    shl eax, 04h
    or al, 0fh
    xor dword ptr [L865a4], eax
    jmp near ptr L829f9
L8283c::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 0ch
    jb near ptr L85af4
L8284d::
    shl eax, 04h
    shr al, 04h
    or al, 0f0h
    xor dword ptr [L865a4], eax
    jmp near ptr L829f9
L82860::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 08h
    jb near ptr L85b00
L82871::
    mov ah, al
    mov al, 0ffh
    xor dword ptr [L865a4], eax
    jmp near ptr L829f9
L82880::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 0ch
    jb near ptr L85b0c
L82891::
    shl ah, 04h
    or ah, 0fh
    xor dword ptr [L865a4], eax
    jmp near ptr L829f9
L828a2::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 08h
    jb near ptr L85b18
L828b3::
    shl eax, 04h
    shl ah, 04h
    or eax, 0f0fh
    xor dword ptr [L865a4], eax
    jmp near ptr L829f9
L828c9::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 08h
    jb near ptr L85b24
L828da::
    mov ah, al
    or eax, 0ff0h
    xor dword ptr [L865a4], eax
    jmp near ptr L829f9
L828ec::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 04h
    jb near ptr L85b30
L828fd::
    shl eax, 0ch
    or eax, 0fffh
    xor dword ptr [L865a4], eax
    jmp near ptr L829f9
L82910::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 0ch
    jb near ptr L85b3c
L82921::
    or ah, 0f0h
    xor dword ptr [L865a4], eax
    jmp near ptr L829f9
L8292f::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 08h
    jb near ptr L85b48
L82940::
    shl eax, 04h
    or eax, 0f00fh
    xor dword ptr [L865a4], eax
    jmp near ptr L829f9
L82953::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 08h
    jb near ptr L85b54
L82964::
    mov ah, al
    ror ah, 04h
    or eax, 0f0f0h
    xor dword ptr [L865a4], eax
    jmp near ptr L829f9
L82979::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 04h
    jb near ptr L85b60
L8298a::
    mov ah, al
    or eax, 0f0ffh
    xor dword ptr [L865a4], eax
    jmp short L829f9
L82999::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 08h
    jb near ptr L85b6c
L829aa::
    mov ah, 0ffh
    xor dword ptr [L865a4], eax
    jmp short L829f9
L829b4::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 04h
    jb near ptr L85b78
L829c5::
    or eax, 0fff0h
    rol al, 04h
    xor dword ptr [L865a4], eax
    jmp short L829f9
L829d5::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 04h
    jb near ptr L85b84
L829e6::
    or eax, 0fff0h
    xor dword ptr [L865a4], eax
    jmp short L829f9
L829f3::
    not dword ptr [L865a4]
L829f9::
    test byte ptr [L865a4], 0ffh
    je near ptr L83129
    test byte ptr [L865a4], 01h
    je near ptr L830c1
L82a13::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb near ptr L85b90
L82a20::
    and eax, 01h
    jne short L82a2c
    mov al, byte ptr [L86630]
    jmp short L82a50
L82a2c::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb near ptr L85b9c
L82a39::
    and eax, 01h
    mov al, byte ptr [L86630]
    je short L82a45
    inc al
L82a45::
    sub al, 02h
    sbb al, 00h
    and al, 03h
    mov byte ptr [L86630], al
L82a50::
    or al, al
    je short L82a9c
    test al, 02h
    jne short L82a7a
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L8666c]
    jb near ptr L85ba8
L82a6c::
    and eax, dword ptr [L86668]
    mov edx, dword ptr [L8658c]
    jmp short L82abc
L82a7a::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L8666e]
    jb near ptr L85bb4
L82a8e::
    and eax, dword ptr [L86664]
    mov edx, dword ptr [L86594]
    jmp short L82abc
L82a9c::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L8666d]
    jb near ptr L85bc0
L82ab0::
    and eax, dword ptr [L86660]
    mov edx, dword ptr [L86628]
L82abc::
    shl eax, 03h
    add edx, eax
    mov eax, dword ptr [edx]
    mov dword ptr [edi], eax
    cmp di, 0fb00h
    jae short L82ad5
    mov eax, dword ptr [edx+04h]
    mov dword ptr [edi+0500h], eax
L82ad5::
    test byte ptr [L865a4], 02h
    je near ptr L830ce
L82ae2::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb near ptr L85bcc
L82aef::
    and eax, 01h
    jne short L82afb
    mov al, byte ptr [L86630]
    jmp short L82b1f
L82afb::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb near ptr L85bd8
L82b08::
    and eax, 01h
    mov al, byte ptr [L86630]
    je short L82b14
    inc al
L82b14::
    sub al, 02h
    sbb al, 00h
    and al, 03h
    mov byte ptr [L86630], al
L82b1f::
    or al, al
    je short L82b6b
    test al, 02h
    jne short L82b49
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L8666c]
    jb near ptr L85be4
L82b3b::
    and eax, dword ptr [L86668]
    mov edx, dword ptr [L8658c]
    jmp short L82b8b
L82b49::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L8666e]
    jb near ptr L85bf0
L82b5d::
    and eax, dword ptr [L86664]
    mov edx, dword ptr [L86594]
    jmp short L82b8b
L82b6b::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L8666d]
    jb near ptr L85bfc
L82b7f::
    and eax, dword ptr [L86660]
    mov edx, dword ptr [L86628]
L82b8b::
    shl eax, 03h
    add edx, eax
    cmp di, 0fffch
    jae short L82bab
    mov eax, dword ptr [edx]
    mov dword ptr [edi+04h], eax
    cmp di, 0fafch
    jae short L82bab
    mov eax, dword ptr [edx+04h]
    mov dword ptr [edi+0504h], eax
L82bab::
    test byte ptr [L865a4], 010h
    je near ptr L830db
L82bb8::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb near ptr L85c08
L82bc5::
    and eax, 01h
    jne short L82bd1
    mov al, byte ptr [L86630]
    jmp short L82bf5
L82bd1::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb near ptr L85c14
L82bde::
    and eax, 01h
    mov al, byte ptr [L86630]
    je short L82bea
    inc al
L82bea::
    sub al, 02h
    sbb al, 00h
    and al, 03h
    mov byte ptr [L86630], al
L82bf5::
    or al, al
    je short L82c41
    test al, 02h
    jne short L82c1f
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L8666c]
    jb near ptr L85c20
L82c11::
    and eax, dword ptr [L86668]
    mov edx, dword ptr [L8658c]
    jmp short L82c61
L82c1f::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L8666e]
    jb near ptr L85c2c
L82c33::
    and eax, dword ptr [L86664]
    mov edx, dword ptr [L86594]
    jmp short L82c61
L82c41::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L8666d]
    jb near ptr L85c38
L82c55::
    and eax, dword ptr [L86660]
    mov edx, dword ptr [L86628]
L82c61::
    shl eax, 03h
    add edx, eax
    cmp di, 0fff8h
    jae short L82c81
    mov eax, dword ptr [edx]
    mov dword ptr [edi+08h], eax
    cmp di, 0faf8h
    jae short L82c81
    mov eax, dword ptr [edx+04h]
    mov dword ptr [edi+0508h], eax
L82c81::
    test byte ptr [L865a4], 020h
    je near ptr L830e8
L82c8e::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb near ptr L85c44
L82c9b::
    and eax, 01h
    jne short L82ca7
    mov al, byte ptr [L86630]
    jmp short L82ccb
L82ca7::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb near ptr L85c50
L82cb4::
    and eax, 01h
    mov al, byte ptr [L86630]
    je short L82cc0
    inc al
L82cc0::
    sub al, 02h
    sbb al, 00h
    and al, 03h
    mov byte ptr [L86630], al
L82ccb::
    or al, al
    je short L82d17
    test al, 02h
    jne short L82cf5
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L8666c]
    jb near ptr L85c5c
L82ce7::
    and eax, dword ptr [L86668]
    mov edx, dword ptr [L8658c]
    jmp short L82d37
L82cf5::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L8666e]
    jb near ptr L85c68
L82d09::
    and eax, dword ptr [L86664]
    mov edx, dword ptr [L86594]
    jmp short L82d37
L82d17::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L8666d]
    jb near ptr L85c74
L82d2b::
    and eax, dword ptr [L86660]
    mov edx, dword ptr [L86628]
L82d37::
    shl eax, 03h
    add edx, eax
    cmp di, 0fff4h
    jae short L82d57
    mov eax, dword ptr [edx]
    mov dword ptr [edi+0ch], eax
    cmp di, 0faf4h
    jae short L82d57
    mov eax, dword ptr [edx+04h]
    mov dword ptr [edi+050ch], eax
L82d57::
    test byte ptr [L865a4], 04h
    je near ptr L830f5
L82d64::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb near ptr L85c80
L82d71::
    and eax, 01h
    jne short L82d7d
    mov al, byte ptr [L86630]
    jmp short L82da1
L82d7d::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb near ptr L85c8c
L82d8a::
    and eax, 01h
    mov al, byte ptr [L86630]
    je short L82d96
    inc al
L82d96::
    sub al, 02h
    sbb al, 00h
    and al, 03h
    mov byte ptr [L86630], al
L82da1::
    or al, al
    je short L82ded
    test al, 02h
    jne short L82dcb
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L8666c]
    jb near ptr L85c98
L82dbd::
    and eax, dword ptr [L86668]
    mov edx, dword ptr [L8658c]
    jmp short L82e0d
L82dcb::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L8666e]
    jb near ptr L85ca4
L82ddf::
    and eax, dword ptr [L86664]
    mov edx, dword ptr [L86594]
    jmp short L82e0d
L82ded::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L8666d]
    jb near ptr L85cb0
L82e01::
    and eax, dword ptr [L86660]
    mov edx, dword ptr [L86628]
L82e0d::
    shl eax, 03h
    add edx, eax
    cmp di, 0f600h
    jae short L82e31
    mov eax, dword ptr [edx]
    mov dword ptr [edi+0a00h], eax
    cmp di, 0f100h
    jae short L82e31
    mov eax, dword ptr [edx+04h]
    mov dword ptr [edi+0f00h], eax
L82e31::
    test byte ptr [L865a4], 08h
    je near ptr L83102
L82e3e::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb near ptr L85cbc
L82e4b::
    and eax, 01h
    jne short L82e57
    mov al, byte ptr [L86630]
    jmp short L82e7b
L82e57::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb near ptr L85cc8
L82e64::
    and eax, 01h
    mov al, byte ptr [L86630]
    je short L82e70
    inc al
L82e70::
    sub al, 02h
    sbb al, 00h
    and al, 03h
    mov byte ptr [L86630], al
L82e7b::
    or al, al
    je short L82ec7
    test al, 02h
    jne short L82ea5
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L8666c]
    jb near ptr L85cd4
L82e97::
    and eax, dword ptr [L86668]
    mov edx, dword ptr [L8658c]
    jmp short L82ee7
L82ea5::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L8666e]
    jb near ptr L85ce0
L82eb9::
    and eax, dword ptr [L86664]
    mov edx, dword ptr [L86594]
    jmp short L82ee7
L82ec7::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L8666d]
    jb near ptr L85cec
L82edb::
    and eax, dword ptr [L86660]
    mov edx, dword ptr [L86628]
L82ee7::
    shl eax, 03h
    add edx, eax
    cmp di, 0f5fch
    jae short L82f0b
    mov eax, dword ptr [edx]
    mov dword ptr [edi+0a04h], eax
    cmp di, 0f0fch
    jae short L82f0b
    mov eax, dword ptr [edx+04h]
    mov dword ptr [edi+0f04h], eax
L82f0b::
    test byte ptr [L865a4], 040h
    je near ptr L8310f
L82f18::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb near ptr L85cf8
L82f25::
    and eax, 01h
    jne short L82f31
    mov al, byte ptr [L86630]
    jmp short L82f55
L82f31::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb near ptr L85d04
L82f3e::
    and eax, 01h
    mov al, byte ptr [L86630]
    je short L82f4a
    inc al
L82f4a::
    sub al, 02h
    sbb al, 00h
    and al, 03h
    mov byte ptr [L86630], al
L82f55::
    or al, al
    je short L82fa1
    test al, 02h
    jne short L82f7f
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L8666c]
    jb near ptr L85d10
L82f71::
    and eax, dword ptr [L86668]
    mov edx, dword ptr [L8658c]
    jmp short L82fc1
L82f7f::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L8666e]
    jb near ptr L85d1c
L82f93::
    and eax, dword ptr [L86664]
    mov edx, dword ptr [L86594]
    jmp short L82fc1
L82fa1::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L8666d]
    jb near ptr L85d28
L82fb5::
    and eax, dword ptr [L86660]
    mov edx, dword ptr [L86628]
L82fc1::
    shl eax, 03h
    add edx, eax
    cmp di, 0f5f8h
    jae short L82fe5
    mov eax, dword ptr [edx]
    mov dword ptr [edi+0a08h], eax
    cmp di, 0f0f8h
    jae short L82fe5
    mov eax, dword ptr [edx+04h]
    mov dword ptr [edi+0f08h], eax
L82fe5::
    test byte ptr [L865a4], 080h
    je near ptr L8311c
L82ff2::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb near ptr L85d34
L82fff::
    and eax, 01h
    jne short L8300b
    mov al, byte ptr [L86630]
    jmp short L8302f
L8300b::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb near ptr L85d40
L83018::
    and eax, 01h
    mov al, byte ptr [L86630]
    je short L83024
    inc al
L83024::
    sub al, 02h
    sbb al, 00h
    and al, 03h
    mov byte ptr [L86630], al
L8302f::
    or al, al
    je short L8307b
    test al, 02h
    jne short L83059
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L8666c]
    jb near ptr L85d4c
L8304b::
    and eax, dword ptr [L86668]
    mov edx, dword ptr [L8658c]
    jmp short L8309b
L83059::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L8666e]
    jb near ptr L85d58
L8306d::
    and eax, dword ptr [L86664]
    mov edx, dword ptr [L86594]
    jmp short L8309b
L8307b::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L8666d]
    jb near ptr L85d64
L8308f::
    and eax, dword ptr [L86660]
    mov edx, dword ptr [L86628]
L8309b::
    shl eax, 03h
    add edx, eax
    cmp di, 0f5f4h
    jae short L830bf
    mov eax, dword ptr [edx]
    mov dword ptr [edi+0a0ch], eax
    cmp di, 0f0f4h
    jae short L830bf
    mov eax, dword ptr [edx+04h]
    mov dword ptr [edi+0f0ch], eax
L830bf::
    jmp short L83129
L830c1::
    test byte ptr [L865a4], 01h
    jne near ptr L82a13
L830ce::
    test byte ptr [L865a4], 02h
    jne near ptr L82ae2
L830db::
    test byte ptr [L865a4], 010h
    jne near ptr L82bb8
L830e8::
    test byte ptr [L865a4], 020h
    jne near ptr L82c8e
L830f5::
    test byte ptr [L865a4], 04h
    jne near ptr L82d64
L83102::
    test byte ptr [L865a4], 08h
    jne near ptr L82e3e
L8310f::
    test byte ptr [L865a4], 040h
    jne near ptr L82f18
L8311c::
    test byte ptr [L865a4], 080h
    jne near ptr L82ff2
L83129::
    test byte ptr [L865a5], 0ffh
    je near ptr L839c4
    test byte ptr [L865a5], 01h
    je near ptr L8380b
L83143::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb near ptr L85d70
L83150::
    and eax, 01h
    jne short L8315c
    mov al, byte ptr [L86630]
    jmp short L83180
L8315c::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb near ptr L85d7c
L83169::
    and eax, 01h
    mov al, byte ptr [L86630]
    je short L83175
    inc al
L83175::
    sub al, 02h
    sbb al, 00h
    and al, 03h
    mov byte ptr [L86630], al
L83180::
    or al, al
    je short L831cc
    test al, 02h
    jne short L831aa
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L8666c]
    jb near ptr L85d88
L8319c::
    and eax, dword ptr [L86668]
    mov edx, dword ptr [L8658c]
    jmp short L831ec
L831aa::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L8666e]
    jb near ptr L85d94
L831be::
    and eax, dword ptr [L86664]
    mov edx, dword ptr [L86594]
    jmp short L831ec
L831cc::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L8666d]
    jb near ptr L85da0
L831e0::
    and eax, dword ptr [L86660]
    mov edx, dword ptr [L86628]
L831ec::
    shl eax, 03h
    add edx, eax
    cmp di, 0ec00h
    jae short L83210
    mov eax, dword ptr [edx]
    mov dword ptr [edi+01400h], eax
    cmp di, 0e700h
    jae short L83210
    mov eax, dword ptr [edx+04h]
    mov dword ptr [edi+01900h], eax
L83210::
    test byte ptr [L865a5], 02h
    je near ptr L83818
L8321d::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb near ptr L85dac
L8322a::
    and eax, 01h
    jne short L83236
    mov al, byte ptr [L86630]
    jmp short L8325a
L83236::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb near ptr L85db8
L83243::
    and eax, 01h
    mov al, byte ptr [L86630]
    je short L8324f
    inc al
L8324f::
    sub al, 02h
    sbb al, 00h
    and al, 03h
    mov byte ptr [L86630], al
L8325a::
    or al, al
    je short L832a6
    test al, 02h
    jne short L83284
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L8666c]
    jb near ptr L85dc4
L83276::
    and eax, dword ptr [L86668]
    mov edx, dword ptr [L8658c]
    jmp short L832c6
L83284::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L8666e]
    jb near ptr L85dd0
L83298::
    and eax, dword ptr [L86664]
    mov edx, dword ptr [L86594]
    jmp short L832c6
L832a6::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L8666d]
    jb near ptr L85ddc
L832ba::
    and eax, dword ptr [L86660]
    mov edx, dword ptr [L86628]
L832c6::
    shl eax, 03h
    add edx, eax
    cmp di, 0ebfch
    jae short L832ea
    mov eax, dword ptr [edx]
    mov dword ptr [edi+01404h], eax
    cmp di, 0e6fch
    jae short L832ea
    mov eax, dword ptr [edx+04h]
    mov dword ptr [edi+01904h], eax
L832ea::
    test byte ptr [L865a5], 010h
    je near ptr L83825
L832f7::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb near ptr L85de8
L83304::
    and eax, 01h
    jne short L83310
    mov al, byte ptr [L86630]
    jmp short L83334
L83310::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb near ptr L85df4
L8331d::
    and eax, 01h
    mov al, byte ptr [L86630]
    je short L83329
    inc al
L83329::
    sub al, 02h
    sbb al, 00h
    and al, 03h
    mov byte ptr [L86630], al
L83334::
    or al, al
    je short L83380
    test al, 02h
    jne short L8335e
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L8666c]
    jb near ptr L85e00
L83350::
    and eax, dword ptr [L86668]
    mov edx, dword ptr [L8658c]
    jmp short L833a0
L8335e::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L8666e]
    jb near ptr L85e0c
L83372::
    and eax, dword ptr [L86664]
    mov edx, dword ptr [L86594]
    jmp short L833a0
L83380::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L8666d]
    jb near ptr L85e18
L83394::
    and eax, dword ptr [L86660]
    mov edx, dword ptr [L86628]
L833a0::
    shl eax, 03h
    add edx, eax
    cmp di, 0ebf8h
    jae short L833c4
    mov eax, dword ptr [edx]
    mov dword ptr [edi+01408h], eax
    cmp di, 0e6f8h
    jae short L833c4
    mov eax, dword ptr [edx+04h]
    mov dword ptr [edi+01908h], eax
L833c4::
    test byte ptr [L865a5], 020h
    je near ptr L83832
L833d1::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb near ptr L85e24
L833de::
    and eax, 01h
    jne short L833ea
    mov al, byte ptr [L86630]
    jmp short L8340e
L833ea::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb near ptr L85e30
L833f7::
    and eax, 01h
    mov al, byte ptr [L86630]
    je short L83403
    inc al
L83403::
    sub al, 02h
    sbb al, 00h
    and al, 03h
    mov byte ptr [L86630], al
L8340e::
    or al, al
    je short L8345a
    test al, 02h
    jne short L83438
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L8666c]
    jb near ptr L85e3c
L8342a::
    and eax, dword ptr [L86668]
    mov edx, dword ptr [L8658c]
    jmp short L8347a
L83438::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L8666e]
    jb near ptr L85e48
L8344c::
    and eax, dword ptr [L86664]
    mov edx, dword ptr [L86594]
    jmp short L8347a
L8345a::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L8666d]
    jb near ptr L85e54
L8346e::
    and eax, dword ptr [L86660]
    mov edx, dword ptr [L86628]
L8347a::
    shl eax, 03h
    add edx, eax
    cmp di, 0ebf4h
    jae short L8349e
    mov eax, dword ptr [edx]
    mov dword ptr [edi+0140ch], eax
    cmp di, 0e6f4h
    jae short L8349e
    mov eax, dword ptr [edx+04h]
    mov dword ptr [edi+0190ch], eax
L8349e::
    test byte ptr [L865a5], 04h
    je near ptr L8383f
L834ab::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb near ptr L85e60
L834b8::
    and eax, 01h
    jne short L834c4
    mov al, byte ptr [L86630]
    jmp short L834e8
L834c4::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb near ptr L85e6c
L834d1::
    and eax, 01h
    mov al, byte ptr [L86630]
    je short L834dd
    inc al
L834dd::
    sub al, 02h
    sbb al, 00h
    and al, 03h
    mov byte ptr [L86630], al
L834e8::
    or al, al
    je short L83534
    test al, 02h
    jne short L83512
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L8666c]
    jb near ptr L85e78
L83504::
    and eax, dword ptr [L86668]
    mov edx, dword ptr [L8658c]
    jmp short L83554
L83512::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L8666e]
    jb near ptr L85e84
L83526::
    and eax, dword ptr [L86664]
    mov edx, dword ptr [L86594]
    jmp short L83554
L83534::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L8666d]
    jb near ptr L85e90
L83548::
    and eax, dword ptr [L86660]
    mov edx, dword ptr [L86628]
L83554::
    shl eax, 03h
    add edx, eax
    cmp di, 0e200h
    jae short L83578
    mov eax, dword ptr [edx]
    mov dword ptr [edi+01e00h], eax
    cmp di, 0dd00h
    jae short L83578
    mov eax, dword ptr [edx+04h]
    mov dword ptr [edi+02300h], eax
L83578::
    test byte ptr [L865a5], 08h
    je near ptr L8384c
L83585::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb near ptr L85e9c
L83592::
    and eax, 01h
    jne short L8359e
    mov al, byte ptr [L86630]
    jmp short L835c2
L8359e::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb near ptr L85ea8
L835ab::
    and eax, 01h
    mov al, byte ptr [L86630]
    je short L835b7
    inc al
L835b7::
    sub al, 02h
    sbb al, 00h
    and al, 03h
    mov byte ptr [L86630], al
L835c2::
    or al, al
    je short L8360e
    test al, 02h
    jne short L835ec
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L8666c]
    jb near ptr L85eb4
L835de::
    and eax, dword ptr [L86668]
    mov edx, dword ptr [L8658c]
    jmp short L8362e
L835ec::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L8666e]
    jb near ptr L85ec0
L83600::
    and eax, dword ptr [L86664]
    mov edx, dword ptr [L86594]
    jmp short L8362e
L8360e::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L8666d]
    jb near ptr L85ecc
L83622::
    and eax, dword ptr [L86660]
    mov edx, dword ptr [L86628]
L8362e::
    shl eax, 03h
    add edx, eax
    cmp di, 0e1fch
    jae short L83652
    mov eax, dword ptr [edx]
    mov dword ptr [edi+01e04h], eax
    cmp di, 0dcfch
    jae short L83652
    mov eax, dword ptr [edx+04h]
    mov dword ptr [edi+02304h], eax
L83652::
    test byte ptr [L865a5], 040h
    je near ptr L83859
L8365f::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb near ptr L85ed8
L8366c::
    and eax, 01h
    jne short L83678
    mov al, byte ptr [L86630]
    jmp short L8369c
L83678::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb near ptr L85ee4
L83685::
    and eax, 01h
    mov al, byte ptr [L86630]
    je short L83691
    inc al
L83691::
    sub al, 02h
    sbb al, 00h
    and al, 03h
    mov byte ptr [L86630], al
L8369c::
    or al, al
    je short L836e8
    test al, 02h
    jne short L836c6
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L8666c]
    jb near ptr L85ef0
L836b8::
    and eax, dword ptr [L86668]
    mov edx, dword ptr [L8658c]
    jmp short L83708
L836c6::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L8666e]
    jb near ptr L85efc
L836da::
    and eax, dword ptr [L86664]
    mov edx, dword ptr [L86594]
    jmp short L83708
L836e8::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L8666d]
    jb near ptr L85f08
L836fc::
    and eax, dword ptr [L86660]
    mov edx, dword ptr [L86628]
L83708::
    shl eax, 03h
    add edx, eax
    cmp di, 0e1f8h
    jae short L8372c
    mov eax, dword ptr [edx]
    mov dword ptr [edi+01e08h], eax
    cmp di, 0dcf8h
    jae short L8372c
    mov eax, dword ptr [edx+04h]
    mov dword ptr [edi+02308h], eax
L8372c::
    test byte ptr [L865a5], 080h
    je near ptr L83866
L83739::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb near ptr L85f14
L83746::
    and eax, 01h
    jne short L83752
    mov al, byte ptr [L86630]
    jmp short L83776
L83752::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb near ptr L85f20
L8375f::
    and eax, 01h
    mov al, byte ptr [L86630]
    je short L8376b
    inc al
L8376b::
    sub al, 02h
    sbb al, 00h
    and al, 03h
    mov byte ptr [L86630], al
L83776::
    or al, al
    je short L837c2
    test al, 02h
    jne short L837a0
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L8666c]
    jb near ptr L85f2c
L83792::
    and eax, dword ptr [L86668]
    mov edx, dword ptr [L8658c]
    jmp short L837e2
L837a0::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L8666e]
    jb near ptr L85f38
L837b4::
    and eax, dword ptr [L86664]
    mov edx, dword ptr [L86594]
    jmp short L837e2
L837c2::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L8666d]
    jb near ptr L85f44
L837d6::
    and eax, dword ptr [L86660]
    mov edx, dword ptr [L86628]
L837e2::
    shl eax, 03h
    add edx, eax
    cmp di, 0e1f4h
    jae short L83806
    mov eax, dword ptr [edx]
    mov dword ptr [edi+01e0ch], eax
    cmp di, 0dcf4h
    jae short L83806
    mov eax, dword ptr [edx+04h]
    mov dword ptr [edi+0230ch], eax
L83806::
    jmp near ptr L839c4
L8380b::
    test byte ptr [L865a5], 01h
    jne near ptr L83143
L83818::
    test byte ptr [L865a5], 02h
    jne near ptr L8321d
L83825::
    test byte ptr [L865a5], 010h
    jne near ptr L832f7
L83832::
    test byte ptr [L865a5], 020h
    jne near ptr L833d1
L8383f::
    test byte ptr [L865a5], 04h
    jne near ptr L834ab
L8384c::
    test byte ptr [L865a5], 08h
    jne near ptr L83585
L83859::
    test byte ptr [L865a5], 040h
    jne near ptr L8365f
L83866::
    test byte ptr [L865a5], 080h
    jne near ptr L83739
    jmp near ptr L839c4
L83878::
    test dword ptr [L86634], 010000h
    jne near ptr L839af
    jmp near ptr L839c4
L8388d::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb near ptr L85f50
L8389a::
    and eax, 01h
    jne short L838a6
    mov al, byte ptr [L86630]
    jmp short L838ca
L838a6::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb near ptr L85f5c
L838b3::
    and eax, 01h
    mov al, byte ptr [L86630]
    je short L838bf
    inc al
L838bf::
    sub al, 02h
    sbb al, 00h
    and al, 03h
    mov byte ptr [L86630], al
L838ca::
    or al, al
    je short L83946
    test al, 02h
    jne short L838f4
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L8666c]
    jb near ptr L85f68
L838e6::
    and eax, dword ptr [L86668]
    mov edx, dword ptr [L8658c]
    jmp short L83914
L838f4::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L8666e]
    jb near ptr L85f74
L83908::
    and eax, dword ptr [L86664]
    mov edx, dword ptr [L86594]
L83914::
    shl eax, 03h
    add edx, eax
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 04h
    jb near ptr L85f80
L8392a::
    and eax, 0fh
    mov dword ptr [L86578], esi
    mov dword ptr [L86580], ebp
    mov dword ptr [L8657c], ecx
    mov ebx, dword ptr [edx]
    mov esi, dword ptr [edx+04h]
    jmp short L83996
L83946::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L8666d]
    jb near ptr L85f8c
L8395a::
    and eax, dword ptr [L86660]
    mov edx, dword ptr [L86628]
    shl eax, 03h
    add edx, eax
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 04h
    jb near ptr L85f98
L8397c::
    and eax, 0fh
    mov dword ptr [L86578], esi
    mov dword ptr [L86580], ebp
    mov dword ptr [L8657c], ecx
    mov ebx, dword ptr [edx]
    mov esi, dword ptr [edx+04h]
L83996::
    call dword ptr [eax*4+L80b4d]
    mov esi, dword ptr [L86578]
    mov ecx, dword ptr [L8657c]
    mov ebp, dword ptr [L86580]
L839af::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb near ptr L85fa4
L839bc::
    test al, 01h
    je near ptr L8388d
L839c4::
    mov edx, 01h
    mov edi, dword ptr [L86588]
    jmp near ptr L80e3d
L839d4::
    cmp dword ptr [L86638], 00h
    jne short L839e5
    pop edx
    pop ecx
    pop ebx
    pop eax
    pop edi
    pop esi
    leave
    ret
L839e5::
    call Func83a28_
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
L839f8::
    cmp dword ptr [L86638], 00h
    je short L83a13
    call Func83a28_
    cmp bx, word ptr [L8656c]
    je near ptr L80f02
L83a13::
    pusha
    mov ax, bx
    call Func854dc_
    popa
    jmp near ptr L80f02
Func827fd_ endp
    db 08bh, 0c0h, 000h, 000h, 08bh, 0c0h
Func83a28_ proc near
    mov esi, 00h
    xchg dword ptr [L86638], esi
    mov ecx, dword ptr [L86648]
    mov byte ptr [L86630], ch
    mov edx, dword ptr [L8663c]
    mov eax, dword ptr [L86644]
    mov dword ptr [L8662c], eax
L83a4f::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb near ptr L85fb0
L83a5c::
    and eax, 01h
    je short L83ab2
    add edx, 01h
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 03h
    jb near ptr L85fbc
L83a75::
    and eax, 07h
    add edx, eax
    cmp eax, 07h
    jl short L83ab2
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 07h
    jb near ptr L85fc8
L83a90::
    and eax, 07fh
    add edx, eax
    cmp eax, 07fh
    jl short L83ab2
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 0ch
    jb near ptr L85fd4
L83aab::
    and eax, 0fffh
    add edx, eax
L83ab2::
    bswap ecx
    mov cl, byte ptr [L8666f]
    mov ebx, edx
    shl ebx, cl
    add dword ptr [L86640], ebx
    bswap ecx
    add edx, dword ptr [L8662c]
    cmp edx, dword ptr [L8659c]
    jae near ptr L839d4
    mov dword ptr [L8662c], edx
    shl edx, 02h
    add edx, dword ptr [ebp+014h]
    mov edi, dword ptr [edx]
    cmp edi, 0ffffffffh
    je near ptr L8531f
    cmp edi, 0fffffffeh
    je near ptr L839d4
    shld ebx, edi, 010h
    cmp di, 0dcfah
    jbe near ptr L85330
    inc bx
    cmp bx, word ptr [L8656c]
    jne near ptr L85358
L83b16::
    mov dword ptr [L86588], edi
    and edi, 0ffffh
    or edi, dword ptr [L86598]
L83b28::
    mov dword ptr [L865a4], 00h
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb near ptr L85fe0
L83b3f::
    test al, 01h
    jne near ptr L83ff8
L83b47::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb near ptr L85fec
L83b54::
    and eax, 01h
    jne short L83b60
    mov al, byte ptr [L86630]
    jmp short L83b84
L83b60::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb near ptr L85ff8
L83b6d::
    and eax, 01h
    mov al, byte ptr [L86630]
    je short L83b79
    inc al
L83b79::
    sub al, 02h
    sbb al, 00h
    and al, 03h
    mov byte ptr [L86630], al
L83b84::
    or al, al
    je short L83c04
    test al, 02h
    jne short L83bae
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L8666c]
    jb near ptr L86004
L83ba0::
    and eax, dword ptr [L86668]
    mov edx, dword ptr [L8658c]
    jmp short L83bce
L83bae::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L8666e]
    jb near ptr L86010
L83bc2::
    and eax, dword ptr [L86664]
    mov edx, dword ptr [L86594]
L83bce::
    shl eax, 03h
    add edx, eax
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 011h
    jae short L83be6
    add esi, 04h
    or cl, 0e0h
L83be6::
    and eax, 01ffffh
    mov dword ptr [L86578], esi
    mov dword ptr [L86580], ebp
    mov dword ptr [L8657c], ecx
    mov ebx, dword ptr [edx]
    mov esi, dword ptr [edx+04h]
    jmp short L83c58
L83c04::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L8666d]
    jb near ptr L8601c
L83c18::
    and eax, dword ptr [L86660]
    mov edx, dword ptr [L86640]
    shl eax, 03h
    add edx, eax
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 011h
    jae short L83c3c
    add esi, 04h
    or cl, 0e0h
L83c3c::
    and eax, 01ffffh
    mov dword ptr [L86578], esi
    mov dword ptr [L86580], ebp
    mov dword ptr [L8657c], ecx
    mov ebx, dword ptr [edx]
    mov esi, dword ptr [edx+04h]
L83c58::
    or dword ptr [L865a4], eax
    test al, al
    je near ptr L83e09
    test al, 01h
    je near ptr L83dcd
L83c6e::
    sub edi, 010000h
    cmp di, 0fb00h
    jae short L83c7f
    jmp short L83c85
    mov dword ptr [edi], ebx
L83c7f::
    mov dword ptr [edi+0500h], esi
L83c85::
    add edi, 010000h
    test al, 02h
    je near ptr L83dd5
L83c93::
    sub edi, 010000h
    cmp di, 0fffch
    jae short L83ca8
    cmp di, 0fafch
    jae short L83cab
    jmp short L83cb1
L83ca8::
    mov dword ptr [edi+04h], ebx
L83cab::
    mov dword ptr [edi+0504h], esi
L83cb1::
    add edi, 010000h
    test al, 010h
    je near ptr L83ddd
L83cbf::
    sub edi, 010000h
    cmp di, 0fff8h
    jae short L83cd4
    cmp di, 0faf8h
    jae short L83cd7
    jmp short L83cdd
L83cd4::
    mov dword ptr [edi+08h], ebx
L83cd7::
    mov dword ptr [edi+0508h], esi
L83cdd::
    add edi, 010000h
    test al, 020h
    je near ptr L83de5
L83ceb::
    sub edi, 010000h
    cmp di, 0fff4h
    jae short L83d00
    cmp di, 0faf4h
    jae short L83d03
    jmp short L83d09
L83d00::
    mov dword ptr [edi+0ch], ebx
L83d03::
    mov dword ptr [edi+050ch], esi
L83d09::
    add edi, 010000h
    test al, 04h
    je near ptr L83ded
L83d17::
    sub edi, 010000h
    cmp di, 0f600h
    jae short L83d2d
    cmp di, 0f100h
    jae short L83d33
    jmp short L83d39
L83d2d::
    mov dword ptr [edi+0a00h], ebx
L83d33::
    mov dword ptr [edi+0f00h], esi
L83d39::
    add edi, 010000h
    test al, 08h
    je near ptr L83df5
L83d47::
    sub edi, 010000h
    cmp di, 0f5fch
    jae short L83d5d
    cmp di, 0f0fch
    jae short L83d63
    jmp short L83d69
L83d5d::
    mov dword ptr [edi+0a04h], ebx
L83d63::
    mov dword ptr [edi+0f04h], esi
L83d69::
    add edi, 010000h
    test al, 040h
    je near ptr L83dfd
L83d77::
    sub edi, 010000h
    cmp di, 0f5f8h
    jae short L83d8d
    cmp di, 0f0f8h
    jae short L83d93
    jmp short L83d99
L83d8d::
    mov dword ptr [edi+0a08h], ebx
L83d93::
    mov dword ptr [edi+0f08h], esi
L83d99::
    add edi, 010000h
    test al, 080h
    je short L83e05
L83da3::
    sub edi, 010000h
    cmp di, 0f5f4h
    jae short L83db9
    cmp di, 0f0f4h
    jae short L83dbf
    jmp short L83dc5
L83db9::
    mov dword ptr [edi+0a0ch], ebx
L83dbf::
    mov dword ptr [edi+0f0ch], esi
L83dc5::
    add edi, 010000h
    jmp short L83e09
L83dcd::
    test al, 01h
    jne near ptr L83c6e
L83dd5::
    test al, 02h
    jne near ptr L83c93
L83ddd::
    test al, 010h
    jne near ptr L83cbf
L83de5::
    test al, 020h
    jne near ptr L83ceb
L83ded::
    test al, 04h
    jne near ptr L83d17
L83df5::
    test al, 08h
    jne near ptr L83d47
L83dfd::
    test al, 040h
    jne near ptr L83d77
L83e05::
    test al, 080h
    jne short L83da3
L83e09::
    test ah, ah
    je near ptr L83fdb
    test ah, 01h
    je near ptr L83f97
L83e1a::
    sub edi, 010000h
    cmp di, 0ec00h
    jae short L83e30
    cmp di, 0e700h
    jae short L83e36
    jmp short L83e3c
L83e30::
    mov dword ptr [edi+01400h], ebx
L83e36::
    mov dword ptr [edi+01900h], esi
L83e3c::
    add edi, 010000h
    test ah, 02h
    je near ptr L83fa0
L83e4b::
    sub edi, 010000h
    cmp di, 0ebfch
    jae short L83e61
    cmp di, 0e6fch
    jae short L83e67
    jmp short L83e6d
L83e61::
    mov dword ptr [edi+01404h], ebx
L83e67::
    mov dword ptr [edi+01904h], esi
L83e6d::
    add edi, 010000h
    test ah, 010h
    je near ptr L83fa9
L83e7c::
    sub edi, 010000h
    cmp di, 0ebf8h
    jae short L83e92
    cmp di, 0e6f8h
    jae short L83e98
    jmp short L83e9e
L83e92::
    mov dword ptr [edi+01408h], ebx
L83e98::
    mov dword ptr [edi+01908h], esi
L83e9e::
    add edi, 010000h
    test ah, 020h
    je near ptr L83fb2
L83ead::
    sub edi, 010000h
    cmp di, 0ebf4h
    jae short L83ec3
    cmp di, 0e6f4h
    jae short L83ec9
    jmp short L83ecf
L83ec3::
    mov dword ptr [edi+0140ch], ebx
L83ec9::
    mov dword ptr [edi+0190ch], esi
L83ecf::
    add edi, 010000h
    test ah, 04h
    je near ptr L83fbb
L83ede::
    sub edi, 010000h
    cmp di, 0e200h
    jae short L83ef4
    cmp di, 0dd00h
    jae short L83efa
    jmp short L83f00
L83ef4::
    mov dword ptr [edi+01e00h], ebx
L83efa::
    mov dword ptr [edi+02300h], esi
L83f00::
    add edi, 010000h
    test ah, 08h
    je near ptr L83fc4
L83f0f::
    sub edi, 010000h
    cmp di, 0e1fch
    jae short L83f25
    cmp di, 0dcfch
    jae short L83f2b
    jmp short L83f31
L83f25::
    mov dword ptr [edi+01e04h], ebx
L83f2b::
    mov dword ptr [edi+02304h], esi
L83f31::
    add edi, 010000h
    test ah, 040h
    je near ptr L83fcd
L83f40::
    sub edi, 010000h
    cmp di, 0e1f8h
    jae short L83f56
    cmp di, 0dcf8h
    jae short L83f5c
    jmp short L83f62
L83f56::
    mov dword ptr [edi+01e08h], ebx
L83f5c::
    mov dword ptr [edi+02308h], esi
L83f62::
    add edi, 010000h
    test ah, 080h
    je short L83fd6
L83f6d::
    sub edi, 010000h
    cmp di, 0e1f4h
    jae short L83f83
    cmp di, 0dcf4h
    jae short L83f89
    jmp short L83f8f
L83f83::
    mov dword ptr [edi+01e0ch], ebx
L83f89::
    mov dword ptr [edi+0230ch], esi
L83f8f::
    add edi, 010000h
    jmp short L83fdb
L83f97::
    test ah, 01h
    jne near ptr L83e1a
L83fa0::
    test ah, 02h
    jne near ptr L83e4b
L83fa9::
    test ah, 010h
    jne near ptr L83e7c
L83fb2::
    test ah, 020h
    jne near ptr L83ead
L83fbb::
    test ah, 04h
    jne near ptr L83ede
L83fc4::
    test ah, 08h
    jne near ptr L83f0f
L83fcd::
    test ah, 040h
    jne near ptr L83f40
L83fd6::
    test ah, 080h
    jne short L83f6d
L83fdb::
    mov esi, dword ptr [L86578]
    mov ecx, dword ptr [L8657c]
    mov ebp, dword ptr [L86580]
    and eax, 010000h
    je near ptr L83b47
L83ff8::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb near ptr L86028
L84005::
    test al, 01h
    jne near ptr L851c3
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 04h
    jb near ptr L86034
L8401e::
    and eax, 0fh
    jmp dword ptr [eax*4+L84028]
Func83a28_ endp
L84028 label byte
    dd offset Func84068_
    dd offset L84086
    dd offset L840a7
    dd offset L840cb
    dd offset L840eb
    dd offset L8410d
    dd offset L84134
    dd offset L84157
    dd offset L8417b
    dd offset L8419a
    dd offset L841be
    dd offset L841e4
    dd offset L84204
    dd offset L8421f
    dd offset L84240
    dd offset L8425e
Func84068_ proc near
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 010h
    jae short L8407b
    add esi, 04h
    or cl, 0e0h
L8407b::
    xor dword ptr [L865a4], eax
    jmp near ptr L84264
L84086::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 0ch
    jb near ptr L86040
L84097::
    shl eax, 04h
    or al, 0fh
    xor dword ptr [L865a4], eax
    jmp near ptr L84264
L840a7::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 0ch
    jb near ptr L8604c
L840b8::
    shl eax, 04h
    shr al, 04h
    or al, 0f0h
    xor dword ptr [L865a4], eax
    jmp near ptr L84264
L840cb::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 08h
    jb near ptr L86058
L840dc::
    mov ah, al
    mov al, 0ffh
    xor dword ptr [L865a4], eax
    jmp near ptr L84264
L840eb::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 0ch
    jb near ptr L86064
L840fc::
    shl ah, 04h
    or ah, 0fh
    xor dword ptr [L865a4], eax
    jmp near ptr L84264
L8410d::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 08h
    jb near ptr L86070
L8411e::
    shl eax, 04h
    shl ah, 04h
    or eax, 0f0fh
    xor dword ptr [L865a4], eax
    jmp near ptr L84264
L84134::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 08h
    jb near ptr L8607c
L84145::
    mov ah, al
    or eax, 0ff0h
    xor dword ptr [L865a4], eax
    jmp near ptr L84264
L84157::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 04h
    jb near ptr L86088
L84168::
    shl eax, 0ch
    or eax, 0fffh
    xor dword ptr [L865a4], eax
    jmp near ptr L84264
L8417b::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 0ch
    jb near ptr L86094
L8418c::
    or ah, 0f0h
    xor dword ptr [L865a4], eax
    jmp near ptr L84264
L8419a::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 08h
    jb near ptr L860a0
L841ab::
    shl eax, 04h
    or eax, 0f00fh
    xor dword ptr [L865a4], eax
    jmp near ptr L84264
L841be::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 08h
    jb near ptr L860ac
L841cf::
    mov ah, al
    ror ah, 04h
    or eax, 0f0f0h
    xor dword ptr [L865a4], eax
    jmp near ptr L84264
L841e4::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 04h
    jb near ptr L860b8
L841f5::
    mov ah, al
    or eax, 0f0ffh
    xor dword ptr [L865a4], eax
    jmp short L84264
L84204::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 08h
    jb near ptr L860c4
L84215::
    mov ah, 0ffh
    xor dword ptr [L865a4], eax
    jmp short L84264
L8421f::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 04h
    jb near ptr L860d0
L84230::
    or eax, 0fff0h
    rol al, 04h
    xor dword ptr [L865a4], eax
    jmp short L84264
L84240::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 04h
    jb near ptr L860dc
L84251::
    or eax, 0fff0h
    xor dword ptr [L865a4], eax
    jmp short L84264
L8425e::
    not dword ptr [L865a4]
L84264::
    test byte ptr [L865a4], 0ffh
    je near ptr L84a04
    test byte ptr [L865a4], 01h
    je near ptr L8499c
L8427e::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb near ptr L860e8
L8428b::
    and eax, 01h
    jne short L84297
    mov al, byte ptr [L86630]
    jmp short L842bb
L84297::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb near ptr L860f4
L842a4::
    and eax, 01h
    mov al, byte ptr [L86630]
    je short L842b0
    inc al
L842b0::
    sub al, 02h
    sbb al, 00h
    and al, 03h
    mov byte ptr [L86630], al
L842bb::
    or al, al
    je short L84307
    test al, 02h
    jne short L842e5
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L8666c]
    jb near ptr L86100
L842d7::
    and eax, dword ptr [L86668]
    mov edx, dword ptr [L8658c]
    jmp short L84327
L842e5::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L8666e]
    jb near ptr L8610c
L842f9::
    and eax, dword ptr [L86664]
    mov edx, dword ptr [L86594]
    jmp short L84327
L84307::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L8666d]
    jb near ptr L86118
L8431b::
    and eax, dword ptr [L86660]
    mov edx, dword ptr [L86640]
L84327::
    shl eax, 03h
    add edx, eax
    sub edi, 010000h
    cmp di, 0fb00h
    jae short L8433f
    jmp short L84348
    mov eax, dword ptr [edx]
    mov dword ptr [edi], eax
L8433f::
    mov eax, dword ptr [edx+04h]
    mov dword ptr [edi+0500h], eax
L84348::
    add edi, 010000h
    test byte ptr [L865a4], 02h
    je near ptr L849a9
L8435b::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb near ptr L86124
L84368::
    and eax, 01h
    jne short L84374
    mov al, byte ptr [L86630]
    jmp short L84398
L84374::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb near ptr L86130
L84381::
    and eax, 01h
    mov al, byte ptr [L86630]
    je short L8438d
    inc al
L8438d::
    sub al, 02h
    sbb al, 00h
    and al, 03h
    mov byte ptr [L86630], al
L84398::
    or al, al
    je short L843e4
    test al, 02h
    jne short L843c2
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L8666c]
    jb near ptr L8613c
L843b4::
    and eax, dword ptr [L86668]
    mov edx, dword ptr [L8658c]
    jmp short L84404
L843c2::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L8666e]
    jb near ptr L86148
L843d6::
    and eax, dword ptr [L86664]
    mov edx, dword ptr [L86594]
    jmp short L84404
L843e4::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L8666d]
    jb near ptr L86154
L843f8::
    and eax, dword ptr [L86660]
    mov edx, dword ptr [L86640]
L84404::
    shl eax, 03h
    add edx, eax
    sub edi, 010000h
    cmp di, 0fffch
    jae short L8441e
    cmp di, 0fafch
    jae short L84423
    jmp short L8442c
L8441e::
    mov eax, dword ptr [edx]
    mov dword ptr [edi+04h], eax
L84423::
    mov eax, dword ptr [edx+04h]
    mov dword ptr [edi+0504h], eax
L8442c::
    add edi, 010000h
    test byte ptr [L865a4], 010h
    je near ptr L849b6
L8443f::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb near ptr L86160
L8444c::
    and eax, 01h
    jne short L84458
    mov al, byte ptr [L86630]
    jmp short L8447c
L84458::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb near ptr L8616c
L84465::
    and eax, 01h
    mov al, byte ptr [L86630]
    je short L84471
    inc al
L84471::
    sub al, 02h
    sbb al, 00h
    and al, 03h
    mov byte ptr [L86630], al
L8447c::
    or al, al
    je short L844c8
    test al, 02h
    jne short L844a6
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L8666c]
    jb near ptr L86178
L84498::
    and eax, dword ptr [L86668]
    mov edx, dword ptr [L8658c]
    jmp short L844e8
L844a6::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L8666e]
    jb near ptr L86184
L844ba::
    and eax, dword ptr [L86664]
    mov edx, dword ptr [L86594]
    jmp short L844e8
L844c8::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L8666d]
    jb near ptr L86190
L844dc::
    and eax, dword ptr [L86660]
    mov edx, dword ptr [L86640]
L844e8::
    shl eax, 03h
    add edx, eax
    sub edi, 010000h
    cmp di, 0fff8h
    jae short L84502
    cmp di, 0faf8h
    jae short L84507
    jmp short L84510
L84502::
    mov eax, dword ptr [edx]
    mov dword ptr [edi+08h], eax
L84507::
    mov eax, dword ptr [edx+04h]
    mov dword ptr [edi+0508h], eax
L84510::
    add edi, 010000h
    test byte ptr [L865a4], 020h
    je near ptr L849c3
L84523::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb near ptr L8619c
L84530::
    and eax, 01h
    jne short L8453c
    mov al, byte ptr [L86630]
    jmp short L84560
L8453c::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb near ptr L861a8
L84549::
    and eax, 01h
    mov al, byte ptr [L86630]
    je short L84555
    inc al
L84555::
    sub al, 02h
    sbb al, 00h
    and al, 03h
    mov byte ptr [L86630], al
L84560::
    or al, al
    je short L845ac
    test al, 02h
    jne short L8458a
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L8666c]
    jb near ptr L861b4
L8457c::
    and eax, dword ptr [L86668]
    mov edx, dword ptr [L8658c]
    jmp short L845cc
L8458a::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L8666e]
    jb near ptr L861c0
L8459e::
    and eax, dword ptr [L86664]
    mov edx, dword ptr [L86594]
    jmp short L845cc
L845ac::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L8666d]
    jb near ptr L861cc
L845c0::
    and eax, dword ptr [L86660]
    mov edx, dword ptr [L86640]
L845cc::
    shl eax, 03h
    add edx, eax
    sub edi, 010000h
    cmp di, 0fff4h
    jae short L845e6
    cmp di, 0faf4h
    jae short L845eb
    jmp short L845f4
L845e6::
    mov eax, dword ptr [edx]
    mov dword ptr [edi+0ch], eax
L845eb::
    mov eax, dword ptr [edx+04h]
    mov dword ptr [edi+050ch], eax
L845f4::
    add edi, 010000h
    test byte ptr [L865a4], 04h
    je near ptr L849d0
L84607::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb near ptr L861d8
L84614::
    and eax, 01h
    jne short L84620
    mov al, byte ptr [L86630]
    jmp short L84644
L84620::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb near ptr L861e4
L8462d::
    and eax, 01h
    mov al, byte ptr [L86630]
    je short L84639
    inc al
L84639::
    sub al, 02h
    sbb al, 00h
    and al, 03h
    mov byte ptr [L86630], al
L84644::
    or al, al
    je short L84690
    test al, 02h
    jne short L8466e
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L8666c]
    jb near ptr L861f0
L84660::
    and eax, dword ptr [L86668]
    mov edx, dword ptr [L8658c]
    jmp short L846b0
L8466e::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L8666e]
    jb near ptr L861fc
L84682::
    and eax, dword ptr [L86664]
    mov edx, dword ptr [L86594]
    jmp short L846b0
L84690::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L8666d]
    jb near ptr L86208
L846a4::
    and eax, dword ptr [L86660]
    mov edx, dword ptr [L86640]
L846b0::
    shl eax, 03h
    add edx, eax
    sub edi, 010000h
    cmp di, 0f600h
    jae short L846cb
    cmp di, 0f100h
    jae short L846d3
    jmp short L846dc
L846cb::
    mov eax, dword ptr [edx]
    mov dword ptr [edi+0a00h], eax
L846d3::
    mov eax, dword ptr [edx+04h]
    mov dword ptr [edi+0f00h], eax
L846dc::
    add edi, 010000h
    test byte ptr [L865a4], 08h
    je near ptr L849dd
L846ef::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb near ptr L86214
L846fc::
    and eax, 01h
    jne short L84708
    mov al, byte ptr [L86630]
    jmp short L8472c
L84708::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb near ptr L86220
L84715::
    and eax, 01h
    mov al, byte ptr [L86630]
    je short L84721
    inc al
L84721::
    sub al, 02h
    sbb al, 00h
    and al, 03h
    mov byte ptr [L86630], al
L8472c::
    or al, al
    je short L84778
    test al, 02h
    jne short L84756
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L8666c]
    jb near ptr L8622c
L84748::
    and eax, dword ptr [L86668]
    mov edx, dword ptr [L8658c]
    jmp short L84798
L84756::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L8666e]
    jb near ptr L86238
L8476a::
    and eax, dword ptr [L86664]
    mov edx, dword ptr [L86594]
    jmp short L84798
L84778::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L8666d]
    jb near ptr L86244
L8478c::
    and eax, dword ptr [L86660]
    mov edx, dword ptr [L86640]
L84798::
    shl eax, 03h
    add edx, eax
    sub edi, 010000h
    cmp di, 0f5fch
    jae short L847b3
    cmp di, 0f0fch
    jae short L847bb
    jmp short L847c4
L847b3::
    mov eax, dword ptr [edx]
    mov dword ptr [edi+0a04h], eax
L847bb::
    mov eax, dword ptr [edx+04h]
    mov dword ptr [edi+0f04h], eax
L847c4::
    add edi, 010000h
    test byte ptr [L865a4], 040h
    je near ptr L849ea
L847d7::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb near ptr L86250
L847e4::
    and eax, 01h
    jne short L847f0
    mov al, byte ptr [L86630]
    jmp short L84814
L847f0::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb near ptr L8625c
L847fd::
    and eax, 01h
    mov al, byte ptr [L86630]
    je short L84809
    inc al
L84809::
    sub al, 02h
    sbb al, 00h
    and al, 03h
    mov byte ptr [L86630], al
L84814::
    or al, al
    je short L84860
    test al, 02h
    jne short L8483e
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L8666c]
    jb near ptr L86268
L84830::
    and eax, dword ptr [L86668]
    mov edx, dword ptr [L8658c]
    jmp short L84880
L8483e::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L8666e]
    jb near ptr L86274
L84852::
    and eax, dword ptr [L86664]
    mov edx, dword ptr [L86594]
    jmp short L84880
L84860::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L8666d]
    jb near ptr L86280
L84874::
    and eax, dword ptr [L86660]
    mov edx, dword ptr [L86640]
L84880::
    shl eax, 03h
    add edx, eax
    sub edi, 010000h
    cmp di, 0f5f8h
    jae short L8489b
    cmp di, 0f0f8h
    jae short L848a3
    jmp short L848ac
L8489b::
    mov eax, dword ptr [edx]
    mov dword ptr [edi+0a08h], eax
L848a3::
    mov eax, dword ptr [edx+04h]
    mov dword ptr [edi+0f08h], eax
L848ac::
    add edi, 010000h
    test byte ptr [L865a4], 080h
    je near ptr L849f7
L848bf::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb near ptr L8628c
L848cc::
    and eax, 01h
    jne short L848d8
    mov al, byte ptr [L86630]
    jmp short L848fc
L848d8::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb near ptr L86298
L848e5::
    and eax, 01h
    mov al, byte ptr [L86630]
    je short L848f1
    inc al
L848f1::
    sub al, 02h
    sbb al, 00h
    and al, 03h
    mov byte ptr [L86630], al
L848fc::
    or al, al
    je short L84948
    test al, 02h
    jne short L84926
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L8666c]
    jb near ptr L862a4
L84918::
    and eax, dword ptr [L86668]
    mov edx, dword ptr [L8658c]
    jmp short L84968
L84926::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L8666e]
    jb near ptr L862b0
L8493a::
    and eax, dword ptr [L86664]
    mov edx, dword ptr [L86594]
    jmp short L84968
L84948::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L8666d]
    jb near ptr L862bc
L8495c::
    and eax, dword ptr [L86660]
    mov edx, dword ptr [L86640]
L84968::
    shl eax, 03h
    add edx, eax
    sub edi, 010000h
    cmp di, 0f5f4h
    jae short L84983
    cmp di, 0f0f4h
    jae short L8498b
    jmp short L84994
L84983::
    mov eax, dword ptr [edx]
    mov dword ptr [edi+0a0ch], eax
L8498b::
    mov eax, dword ptr [edx+04h]
    mov dword ptr [edi+0f0ch], eax
L84994::
    add edi, 010000h
    jmp short L84a04
L8499c::
    test byte ptr [L865a4], 01h
    jne near ptr L8427e
L849a9::
    test byte ptr [L865a4], 02h
    jne near ptr L8435b
L849b6::
    test byte ptr [L865a4], 010h
    jne near ptr L8443f
L849c3::
    test byte ptr [L865a4], 020h
    jne near ptr L84523
L849d0::
    test byte ptr [L865a4], 04h
    jne near ptr L84607
L849dd::
    test byte ptr [L865a4], 08h
    jne near ptr L846ef
L849ea::
    test byte ptr [L865a4], 040h
    jne near ptr L847d7
L849f7::
    test byte ptr [L865a4], 080h
    jne near ptr L848bf
L84a04::
    test byte ptr [L865a5], 0ffh
    je near ptr L8530f
    test byte ptr [L865a5], 01h
    je near ptr L85156
L84a1e::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb near ptr L862c8
L84a2b::
    and eax, 01h
    jne short L84a37
    mov al, byte ptr [L86630]
    jmp short L84a5b
L84a37::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb near ptr L862d4
L84a44::
    and eax, 01h
    mov al, byte ptr [L86630]
    je short L84a50
    inc al
L84a50::
    sub al, 02h
    sbb al, 00h
    and al, 03h
    mov byte ptr [L86630], al
L84a5b::
    or al, al
    je short L84aa7
    test al, 02h
    jne short L84a85
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L8666c]
    jb near ptr L862e0
L84a77::
    and eax, dword ptr [L86668]
    mov edx, dword ptr [L8658c]
    jmp short L84ac7
L84a85::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L8666e]
    jb near ptr L862ec
L84a99::
    and eax, dword ptr [L86664]
    mov edx, dword ptr [L86594]
    jmp short L84ac7
L84aa7::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L8666d]
    jb near ptr L862f8
L84abb::
    and eax, dword ptr [L86660]
    mov edx, dword ptr [L86640]
L84ac7::
    shl eax, 03h
    add edx, eax
    sub edi, 010000h
    cmp di, 0ec00h
    jae short L84ae2
    cmp di, 0e700h
    jae short L84aea
    jmp short L84af3
L84ae2::
    mov eax, dword ptr [edx]
    mov dword ptr [edi+01400h], eax
L84aea::
    mov eax, dword ptr [edx+04h]
    mov dword ptr [edi+01900h], eax
L84af3::
    add edi, 010000h
    test byte ptr [L865a5], 02h
    je near ptr L85163
L84b06::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb near ptr L86304
L84b13::
    and eax, 01h
    jne short L84b1f
    mov al, byte ptr [L86630]
    jmp short L84b43
L84b1f::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb near ptr L86310
L84b2c::
    and eax, 01h
    mov al, byte ptr [L86630]
    je short L84b38
    inc al
L84b38::
    sub al, 02h
    sbb al, 00h
    and al, 03h
    mov byte ptr [L86630], al
L84b43::
    or al, al
    je short L84b8f
    test al, 02h
    jne short L84b6d
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L8666c]
    jb near ptr L8631c
L84b5f::
    and eax, dword ptr [L86668]
    mov edx, dword ptr [L8658c]
    jmp short L84baf
L84b6d::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L8666e]
    jb near ptr L86328
L84b81::
    and eax, dword ptr [L86664]
    mov edx, dword ptr [L86594]
    jmp short L84baf
L84b8f::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L8666d]
    jb near ptr L86334
L84ba3::
    and eax, dword ptr [L86660]
    mov edx, dword ptr [L86640]
L84baf::
    shl eax, 03h
    add edx, eax
    sub edi, 010000h
    cmp di, 0ebfch
    jae short L84bca
    cmp di, 0e6fch
    jae short L84bd2
    jmp short L84bdb
L84bca::
    mov eax, dword ptr [edx]
    mov dword ptr [edi+01404h], eax
L84bd2::
    mov eax, dword ptr [edx+04h]
    mov dword ptr [edi+01904h], eax
L84bdb::
    add edi, 010000h
    test byte ptr [L865a5], 010h
    je near ptr L85170
L84bee::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb near ptr L86340
L84bfb::
    and eax, 01h
    jne short L84c07
    mov al, byte ptr [L86630]
    jmp short L84c2b
L84c07::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb near ptr L8634c
L84c14::
    and eax, 01h
    mov al, byte ptr [L86630]
    je short L84c20
    inc al
L84c20::
    sub al, 02h
    sbb al, 00h
    and al, 03h
    mov byte ptr [L86630], al
L84c2b::
    or al, al
    je short L84c77
    test al, 02h
    jne short L84c55
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L8666c]
    jb near ptr L86358
L84c47::
    and eax, dword ptr [L86668]
    mov edx, dword ptr [L8658c]
    jmp short L84c97
L84c55::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L8666e]
    jb near ptr L86364
L84c69::
    and eax, dword ptr [L86664]
    mov edx, dword ptr [L86594]
    jmp short L84c97
L84c77::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L8666d]
    jb near ptr L86370
L84c8b::
    and eax, dword ptr [L86660]
    mov edx, dword ptr [L86640]
L84c97::
    shl eax, 03h
    add edx, eax
    sub edi, 010000h
    cmp di, 0ebf8h
    jae short L84cb2
    cmp di, 0e6f8h
    jae short L84cba
    jmp short L84cc3
L84cb2::
    mov eax, dword ptr [edx]
    mov dword ptr [edi+01408h], eax
L84cba::
    mov eax, dword ptr [edx+04h]
    mov dword ptr [edi+01908h], eax
L84cc3::
    add edi, 010000h
    test byte ptr [L865a5], 020h
    je near ptr L8517d
L84cd6::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb near ptr L8637c
L84ce3::
    and eax, 01h
    jne short L84cef
    mov al, byte ptr [L86630]
    jmp short L84d13
L84cef::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb near ptr L86388
L84cfc::
    and eax, 01h
    mov al, byte ptr [L86630]
    je short L84d08
    inc al
L84d08::
    sub al, 02h
    sbb al, 00h
    and al, 03h
    mov byte ptr [L86630], al
L84d13::
    or al, al
    je short L84d5f
    test al, 02h
    jne short L84d3d
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L8666c]
    jb near ptr L86394
L84d2f::
    and eax, dword ptr [L86668]
    mov edx, dword ptr [L8658c]
    jmp short L84d7f
L84d3d::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L8666e]
    jb near ptr L863a0
L84d51::
    and eax, dword ptr [L86664]
    mov edx, dword ptr [L86594]
    jmp short L84d7f
L84d5f::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L8666d]
    jb near ptr L863ac
L84d73::
    and eax, dword ptr [L86660]
    mov edx, dword ptr [L86640]
L84d7f::
    shl eax, 03h
    add edx, eax
    sub edi, 010000h
    cmp di, 0ebf4h
    jae short L84d9a
    cmp di, 0e6f4h
    jae short L84da2
    jmp short L84dab
L84d9a::
    mov eax, dword ptr [edx]
    mov dword ptr [edi+0140ch], eax
L84da2::
    mov eax, dword ptr [edx+04h]
    mov dword ptr [edi+0190ch], eax
L84dab::
    add edi, 010000h
    test byte ptr [L865a5], 04h
    je near ptr L8518a
L84dbe::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb near ptr L863b8
L84dcb::
    and eax, 01h
    jne short L84dd7
    mov al, byte ptr [L86630]
    jmp short L84dfb
L84dd7::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb near ptr L863c4
L84de4::
    and eax, 01h
    mov al, byte ptr [L86630]
    je short L84df0
    inc al
L84df0::
    sub al, 02h
    sbb al, 00h
    and al, 03h
    mov byte ptr [L86630], al
L84dfb::
    or al, al
    je short L84e47
    test al, 02h
    jne short L84e25
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L8666c]
    jb near ptr L863d0
L84e17::
    and eax, dword ptr [L86668]
    mov edx, dword ptr [L8658c]
    jmp short L84e67
L84e25::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L8666e]
    jb near ptr L863dc
L84e39::
    and eax, dword ptr [L86664]
    mov edx, dword ptr [L86594]
    jmp short L84e67
L84e47::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L8666d]
    jb near ptr L863e8
L84e5b::
    and eax, dword ptr [L86660]
    mov edx, dword ptr [L86640]
L84e67::
    shl eax, 03h
    add edx, eax
    sub edi, 010000h
    cmp di, 0e200h
    jae short L84e82
    cmp di, 0dd00h
    jae short L84e8a
    jmp short L84e93
L84e82::
    mov eax, dword ptr [edx]
    mov dword ptr [edi+01e00h], eax
L84e8a::
    mov eax, dword ptr [edx+04h]
    mov dword ptr [edi+02300h], eax
L84e93::
    add edi, 010000h
    test byte ptr [L865a5], 08h
    je near ptr L85197
L84ea6::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb near ptr L863f4
L84eb3::
    and eax, 01h
    jne short L84ebf
    mov al, byte ptr [L86630]
    jmp short L84ee3
L84ebf::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb near ptr L86400
L84ecc::
    and eax, 01h
    mov al, byte ptr [L86630]
    je short L84ed8
    inc al
L84ed8::
    sub al, 02h
    sbb al, 00h
    and al, 03h
    mov byte ptr [L86630], al
L84ee3::
    or al, al
    je short L84f2f
    test al, 02h
    jne short L84f0d
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L8666c]
    jb near ptr L8640c
L84eff::
    and eax, dword ptr [L86668]
    mov edx, dword ptr [L8658c]
    jmp short L84f4f
L84f0d::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L8666e]
    jb near ptr L86418
L84f21::
    and eax, dword ptr [L86664]
    mov edx, dword ptr [L86594]
    jmp short L84f4f
L84f2f::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L8666d]
    jb near ptr L86424
L84f43::
    and eax, dword ptr [L86660]
    mov edx, dword ptr [L86640]
L84f4f::
    shl eax, 03h
    add edx, eax
    sub edi, 010000h
    cmp di, 0e1fch
    jae short L84f6a
    cmp di, 0dcfch
    jae short L84f72
    jmp short L84f7b
L84f6a::
    mov eax, dword ptr [edx]
    mov dword ptr [edi+01e04h], eax
L84f72::
    mov eax, dword ptr [edx+04h]
    mov dword ptr [edi+02304h], eax
L84f7b::
    add edi, 010000h
    test byte ptr [L865a5], 040h
    je near ptr L851a4
L84f8e::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb near ptr L86430
L84f9b::
    and eax, 01h
    jne short L84fa7
    mov al, byte ptr [L86630]
    jmp short L84fcb
L84fa7::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb near ptr L8643c
L84fb4::
    and eax, 01h
    mov al, byte ptr [L86630]
    je short L84fc0
    inc al
L84fc0::
    sub al, 02h
    sbb al, 00h
    and al, 03h
    mov byte ptr [L86630], al
L84fcb::
    or al, al
    je short L85017
    test al, 02h
    jne short L84ff5
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L8666c]
    jb near ptr L86448
L84fe7::
    and eax, dword ptr [L86668]
    mov edx, dword ptr [L8658c]
    jmp short L85037
L84ff5::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L8666e]
    jb near ptr L86454
L85009::
    and eax, dword ptr [L86664]
    mov edx, dword ptr [L86594]
    jmp short L85037
L85017::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L8666d]
    jb near ptr L86460
L8502b::
    and eax, dword ptr [L86660]
    mov edx, dword ptr [L86640]
L85037::
    shl eax, 03h
    add edx, eax
    sub edi, 010000h
    cmp di, 0e1f8h
    jae short L85052
    cmp di, 0dcf8h
    jae short L8505a
    jmp short L85063
L85052::
    mov eax, dword ptr [edx]
    mov dword ptr [edi+01e08h], eax
L8505a::
    mov eax, dword ptr [edx+04h]
    mov dword ptr [edi+02308h], eax
L85063::
    add edi, 010000h
    test byte ptr [L865a5], 080h
    je near ptr L851b1
L85076::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb near ptr L8646c
L85083::
    and eax, 01h
    jne short L8508f
    mov al, byte ptr [L86630]
    jmp short L850b3
L8508f::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb near ptr L86478
L8509c::
    and eax, 01h
    mov al, byte ptr [L86630]
    je short L850a8
    inc al
L850a8::
    sub al, 02h
    sbb al, 00h
    and al, 03h
    mov byte ptr [L86630], al
L850b3::
    or al, al
    je short L850ff
    test al, 02h
    jne short L850dd
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L8666c]
    jb near ptr L86484
L850cf::
    and eax, dword ptr [L86668]
    mov edx, dword ptr [L8658c]
    jmp short L8511f
L850dd::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L8666e]
    jb near ptr L86490
L850f1::
    and eax, dword ptr [L86664]
    mov edx, dword ptr [L86594]
    jmp short L8511f
L850ff::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L8666d]
    jb near ptr L8649c
L85113::
    and eax, dword ptr [L86660]
    mov edx, dword ptr [L86640]
L8511f::
    shl eax, 03h
    add edx, eax
    sub edi, 010000h
    cmp di, 0e1f4h
    jae short L8513a
    cmp di, 0dcf4h
    jae short L85142
    jmp short L8514b
L8513a::
    mov eax, dword ptr [edx]
    mov dword ptr [edi+01e0ch], eax
L85142::
    mov eax, dword ptr [edx+04h]
    mov dword ptr [edi+0230ch], eax
L8514b::
    add edi, 010000h
    jmp near ptr L8530f
L85156::
    test byte ptr [L865a5], 01h
    jne near ptr L84a1e
L85163::
    test byte ptr [L865a5], 02h
    jne near ptr L84b06
L85170::
    test byte ptr [L865a5], 010h
    jne near ptr L84bee
L8517d::
    test byte ptr [L865a5], 020h
    jne near ptr L84cd6
L8518a::
    test byte ptr [L865a5], 04h
    jne near ptr L84dbe
L85197::
    test byte ptr [L865a5], 08h
    jne near ptr L84ea6
L851a4::
    test byte ptr [L865a5], 040h
    jne near ptr L84f8e
L851b1::
    test byte ptr [L865a5], 080h
    jne near ptr L85076
    jmp near ptr L8530f
L851c3::
    test dword ptr [L86634], 010000h
    jne near ptr L852fa
    jmp near ptr L8530f
L851d8::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb near ptr L864a8
L851e5::
    and eax, 01h
    jne short L851f1
    mov al, byte ptr [L86630]
    jmp short L85215
L851f1::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb near ptr L864b4
L851fe::
    and eax, 01h
    mov al, byte ptr [L86630]
    je short L8520a
    inc al
L8520a::
    sub al, 02h
    sbb al, 00h
    and al, 03h
    mov byte ptr [L86630], al
L85215::
    or al, al
    je short L85291
    test al, 02h
    jne short L8523f
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L8666c]
    jb near ptr L864c0
L85231::
    and eax, dword ptr [L86668]
    mov edx, dword ptr [L8658c]
    jmp short L8525f
L8523f::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L8666e]
    jb near ptr L864cc
L85253::
    and eax, dword ptr [L86664]
    mov edx, dword ptr [L86594]
L8525f::
    shl eax, 03h
    add edx, eax
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 04h
    jb near ptr L864d8
L85275::
    and eax, 0fh
    mov dword ptr [L86578], esi
    mov dword ptr [L86580], ebp
    mov dword ptr [L8657c], ecx
    mov ebx, dword ptr [edx]
    mov esi, dword ptr [edx+04h]
    jmp short L852e1
L85291::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L8666d]
    jb near ptr L864e4
L852a5::
    and eax, dword ptr [L86660]
    mov edx, dword ptr [L86640]
    shl eax, 03h
    add edx, eax
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 04h
    jb near ptr L864f0
L852c7::
    and eax, 0fh
    mov dword ptr [L86578], esi
    mov dword ptr [L86580], ebp
    mov dword ptr [L8657c], ecx
    mov ebx, dword ptr [edx]
    mov esi, dword ptr [edx+04h]
L852e1::
    call dword ptr [eax*4+L80b8d]
    mov esi, dword ptr [L86578]
    mov ecx, dword ptr [L8657c]
    mov ebp, dword ptr [L86580]
L852fa::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb near ptr L864fc
L85307::
    test al, 01h
    je near ptr L851d8
L8530f::
    mov edx, 01h
    mov edi, dword ptr [L86588]
    jmp near ptr L83a4f
L8531f::
    mov dword ptr [L86588], edi
    lea edi, [L86674]
    jmp near ptr L83b28
L85330::
    shld ebx, edi, 010h
    ret
    db 02eh, 08bh, 0c0h
    add byte ptr [eax], al
    mov eax, eax
L8533c::
    pusha
    mov ax, bx
    call Func854dc_
    popa
    mov word ptr [L8656c], bx
    jmp near ptr L82360
    mov eax, eax
    add byte ptr [eax], al
    mov eax, eax
L85358::
    pusha
    mov ax, bx
    call Func854dc_
    popa
    mov word ptr [L8656c], bx
    jmp near ptr L83b16
    pop edx
    pop ecx
    pop ebx
    pop eax
    pop edi
    pop esi
    leave
    ret
L85376::
    pop edx
    pop ecx
    pop ebx
    pop eax
    pop edi
    pop esi
    leave
    ret
Func84068_ endp
Func8537e_ proc near
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
    je short L85394
    mov ax, 01h
L85394::
    xor ax, 01h
    mov word ptr [L86574], ax
    mov eax, dword ptr [ebp+0ch]
    bsr ebx, eax
    sub ebx, 010h
    neg ebx
    mov byte ptr [L86874], bl
    pop edx
    pop ecx
    pop ebx
    pop eax
    pop edi
    pop esi
    leave
    ret
Func8537e_ endp
Func853b7_ proc near
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
    jne short L85404
    mov edx, 050h
L85404::
    add edx, dword ptr [ebp+018h]
    mov dword ptr [ebp+020h], edx
    mov edx, dword ptr [ebp+024h]
    or edx, edx
    jne short L85416
    mov edx, 03ch
L85416::
    add edx, dword ptr [ebp+01ch]
    mov dword ptr [ebp+024h], edx
    mov ax, word ptr [ebp+010h]
    mov si, word ptr [ebp+014h]
    mov ecx, 00h
L85429::
    mov edx, 00h
L8542e::
    mov word ptr [edi], dx
    mov word ptr [edi+02h], cx
    add word ptr [edi], ax
    add word ptr [edi+02h], si
    add edi, 04h
    inc edx
    cmp edx, dword ptr [ebp+08h]
    jne short L8542e
    inc ecx
    cmp ecx, dword ptr [ebp+0ch]
    jne short L85429
    mov edi, dword ptr [ebp+08h]
    mov edx, dword ptr [ebp+0ch]
    imul edi, edx
    dec edi
    shl edi, 02h
    add edi, dword ptr [ebp+02ch]
    mov edx, 0fffffffeh
L85460::
    movsx eax, word ptr [edi]
    cmp eax, 050h
    jae short L854c3
    movsx esi, word ptr [edi+02h]
    cmp esi, 03ch
    jae short L854c3
    test dword ptr [ebp+028h], 01h
    je short L85490
    cmp eax, dword ptr [ebp+018h]
    jl short L854c3
    cmp eax, dword ptr [ebp+020h]
    jge short L854c3
    cmp esi, dword ptr [ebp+01ch]
    jl short L854c3
    cmp esi, dword ptr [ebp+024h]
    jge short L854c3
    jmp short L854a4
L85490::
    cmp eax, dword ptr [ebp+018h]
    jl short L854a4
    cmp eax, dword ptr [ebp+020h]
    jge short L854a4
    cmp esi, dword ptr [ebp+01ch]
    jl short L854a4
    cmp esi, dword ptr [ebp+024h]
    jl short L854c3
L854a4::
    imul esi, esi, 02800h
    shl eax, 04h
    add eax, esi
    mov dword ptr [edi], eax
    mov dl, 0ffh
    sub edi, 04h
    cmp edi, dword ptr [ebp+02ch]
    jae short L85460
    pop edx
    pop ecx
    pop ebx
    pop eax
    pop edi
    pop esi
    leave
    ret
L854c3::
    mov dword ptr [edi], edx
    sub edi, 04h
    cmp edi, dword ptr [ebp+02ch]
    jae short L85460
    pop edx
    pop ecx
    pop ebx
    pop eax
    pop edi
    pop esi
    leave
    ret
Func853b7_ endp
    db 02eh, 08bh, 0c0h, 000h, 000h, 08bh, 0c0h
Func854dc_ proc near
    mov dword ptr [L86554], 04f05h
    mov cl, byte ptr [L86874]
    shl eax, cl
    mov dword ptr [L8654c], eax
    mov ax, word ptr [L86574]
    mov dword ptr [L86548], eax
    mov ax, ds
    mov es, ax
    mov ax, 0300h
    lea edi, [_Data86538]
    mov bx, 010h
    xor cx, cx
    int 031h
    ret
L85518::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L80c96
    nop
L85524::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L80cf5
    nop
L85530::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L80e4a
    nop
L8553c::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L80e63
    nop
L85548::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L80e7e
    nop
L85554::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L80e99
    nop
L85560::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L80f32
    nop
L8556c::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L80f47
    nop
L85578::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L80f60
    nop
L85584::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L80f93
    nop
L85590::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L80fb5
    nop
L8559c::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L8100b
    nop
L855a8::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L811de
    nop
L855b4::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L811f7
    nop
L855c0::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L81270
    nop
L855cc::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L81291
    nop
L855d8::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L812b5
    nop
L855e4::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L812d5
    nop
L855f0::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L812f7
    nop
L855fc::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L8131e
    nop
L85608::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L81341
    nop
L85614::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L81365
    nop
L85620::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L81384
    nop
L8562c::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L813a8
    nop
L85638::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L813ce
    nop
L85644::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L813ee
    nop
L85650::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L81409
    nop
L8565c::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L8142a
    nop
L85668::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L81464
    nop
L85674::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L8147d
    nop
L85680::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L814b0
    nop
L8568c::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L814d2
    nop
L85698::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L814f4
    nop
L856a4::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L8152c
    nop
L856b0::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L81545
    nop
L856bc::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L81578
    nop
L856c8::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L8159a
    nop
L856d4::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L815bc
    nop
L856e0::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L815f5
    nop
L856ec::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L8160e
    nop
L856f8::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L81641
    nop
L85704::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L81663
    nop
L85710::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L81685
    nop
L8571c::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L816be
    nop
L85728::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L816d7
    nop
L85734::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L8170a
    nop
L85740::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L8172c
    nop
L8574c::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L8174e
    nop
L85758::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L81787
    nop
L85764::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L817a0
    nop
L85770::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L817d3
    nop
L8577c::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L817f5
    nop
L85788::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L81817
    nop
L85794::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L81853
    nop
L857a0::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L8186c
    nop
L857ac::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L8189f
    nop
L857b8::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L818c1
    nop
L857c4::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L818e3
    nop
L857d0::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L8191f
    nop
L857dc::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L81938
    nop
L857e8::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L8196b
    nop
L857f4::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L8198d
    nop
L85800::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L819af
    nop
L8580c::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L819eb
    nop
L85818::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L81a04
    nop
L85824::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L81a37
    nop
L85830::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L81a59
    nop
L8583c::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L81a7b
    nop
L85848::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L81b2e
    nop
L85854::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L81b47
    nop
L85860::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L81b7a
    nop
L8586c::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L81b9c
    nop
L85878::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L81bbe
    nop
L85884::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L81bfa
    nop
L85890::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L81c13
    nop
L8589c::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L81c46
    nop
L858a8::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L81c68
    nop
L858b4::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L81c8a
    nop
L858c0::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L81cc6
    nop
L858cc::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L81cdf
    nop
L858d8::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L81d12
    nop
L858e4::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L81d34
    nop
L858f0::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L81d56
    nop
L858fc::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L81d92
    nop
L85908::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L81dab
    nop
L85914::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L81dde
    nop
L85920::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L81e00
    nop
L8592c::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L81e22
    nop
L85938::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L81e5e
    nop
L85944::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L81e77
    nop
L85950::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L81eaa
    nop
L8595c::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L81ecc
    nop
L85968::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L81eee
    nop
L85974::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L81f2a
    nop
L85980::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L81f43
    nop
L8598c::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L81f76
    nop
L85998::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L81f98
    nop
L859a4::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L81fba
    nop
L859b0::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L81ff6
    nop
L859bc::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L8200f
    nop
L859c8::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L82042
    nop
L859d4::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L82064
    nop
L859e0::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L82086
    nop
L859ec::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L820c2
    nop
L859f8::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L820db
    nop
L85a04::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L8210e
    nop
L85a10::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L82130
    nop
L85a1c::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L82152
    nop
L85a28::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L82208
    nop
L85a34::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L82221
    nop
L85a40::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L82254
    nop
L85a4c::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L82276
    nop
L85a58::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L82298
    nop
L85a64::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L822c8
    nop
L85a70::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L822ea
    nop
L85a7c::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L8232a
    nop
L85a88::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L823c4
    nop
L85a94::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L823d9
    nop
L85aa0::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L823f2
    nop
L85aac::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L82425
    nop
L85ab8::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L82447
    nop
L85ac4::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L8249d
    nop
L85ad0::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L8279a
    nop
L85adc::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L827b3
    nop
L85ae8::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L8282c
    nop
L85af4::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L8284d
    nop
L85b00::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L82871
    nop
L85b0c::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L82891
    nop
L85b18::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L828b3
    nop
L85b24::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L828da
    nop
L85b30::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L828fd
    nop
L85b3c::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L82921
    nop
L85b48::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L82940
    nop
L85b54::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L82964
    nop
L85b60::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L8298a
    nop
L85b6c::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L829aa
    nop
L85b78::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L829c5
    nop
L85b84::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L829e6
    nop
L85b90::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L82a20
    nop
L85b9c::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L82a39
    nop
L85ba8::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L82a6c
    nop
L85bb4::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L82a8e
    nop
L85bc0::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L82ab0
    nop
L85bcc::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L82aef
    nop
L85bd8::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L82b08
    nop
L85be4::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L82b3b
    nop
L85bf0::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L82b5d
    nop
L85bfc::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L82b7f
    nop
L85c08::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L82bc5
    nop
L85c14::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L82bde
    nop
L85c20::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L82c11
    nop
L85c2c::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L82c33
    nop
L85c38::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L82c55
    nop
L85c44::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L82c9b
    nop
L85c50::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L82cb4
    nop
L85c5c::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L82ce7
    nop
L85c68::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L82d09
    nop
L85c74::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L82d2b
    nop
L85c80::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L82d71
    nop
L85c8c::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L82d8a
    nop
L85c98::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L82dbd
    nop
L85ca4::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L82ddf
    nop
L85cb0::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L82e01
    nop
L85cbc::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L82e4b
    nop
L85cc8::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L82e64
    nop
L85cd4::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L82e97
    nop
L85ce0::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L82eb9
    nop
L85cec::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L82edb
    nop
L85cf8::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L82f25
    nop
L85d04::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L82f3e
    nop
L85d10::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L82f71
    nop
L85d1c::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L82f93
    nop
L85d28::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L82fb5
    nop
L85d34::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L82fff
    nop
L85d40::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L83018
    nop
L85d4c::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L8304b
    nop
L85d58::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L8306d
    nop
L85d64::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L8308f
    nop
L85d70::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L83150
    nop
L85d7c::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L83169
    nop
L85d88::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L8319c
    nop
L85d94::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L831be
    nop
L85da0::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L831e0
    nop
L85dac::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L8322a
    nop
L85db8::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L83243
    nop
L85dc4::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L83276
    nop
L85dd0::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L83298
    nop
L85ddc::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L832ba
    nop
L85de8::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L83304
    nop
L85df4::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L8331d
    nop
L85e00::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L83350
    nop
L85e0c::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L83372
    nop
L85e18::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L83394
    nop
L85e24::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L833de
    nop
L85e30::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L833f7
    nop
L85e3c::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L8342a
    nop
L85e48::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L8344c
    nop
L85e54::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L8346e
    nop
L85e60::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L834b8
    nop
L85e6c::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L834d1
    nop
L85e78::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L83504
    nop
L85e84::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L83526
    nop
L85e90::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L83548
    nop
L85e9c::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L83592
    nop
L85ea8::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L835ab
    nop
L85eb4::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L835de
    nop
L85ec0::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L83600
    nop
L85ecc::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L83622
    nop
L85ed8::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L8366c
    nop
L85ee4::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L83685
    nop
L85ef0::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L836b8
    nop
L85efc::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L836da
    nop
L85f08::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L836fc
    nop
L85f14::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L83746
    nop
L85f20::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L8375f
    nop
L85f2c::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L83792
    nop
L85f38::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L837b4
    nop
L85f44::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L837d6
    nop
L85f50::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L8389a
    nop
L85f5c::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L838b3
    nop
L85f68::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L838e6
    nop
L85f74::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L83908
    nop
L85f80::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L8392a
    nop
L85f8c::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L8395a
    nop
L85f98::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L8397c
    nop
L85fa4::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L839bc
    nop
L85fb0::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L83a5c
    nop
L85fbc::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L83a75
    nop
L85fc8::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L83a90
    nop
L85fd4::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L83aab
    nop
L85fe0::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L83b3f
    nop
L85fec::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L83b54
    nop
L85ff8::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L83b6d
    nop
L86004::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L83ba0
    nop
L86010::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L83bc2
    nop
L8601c::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L83c18
    nop
L86028::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L84005
    nop
L86034::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L8401e
    nop
L86040::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L84097
    nop
L8604c::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L840b8
    nop
L86058::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L840dc
    nop
L86064::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L840fc
    nop
L86070::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L8411e
    nop
L8607c::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L84145
    nop
L86088::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L84168
    nop
L86094::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L8418c
    nop
L860a0::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L841ab
    nop
L860ac::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L841cf
    nop
L860b8::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L841f5
    nop
L860c4::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L84215
    nop
L860d0::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L84230
    nop
L860dc::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L84251
    nop
L860e8::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L8428b
    nop
L860f4::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L842a4
    nop
L86100::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L842d7
    nop
L8610c::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L842f9
    nop
L86118::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L8431b
    nop
L86124::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L84368
    nop
L86130::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L84381
    nop
L8613c::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L843b4
    nop
L86148::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L843d6
    nop
L86154::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L843f8
    nop
L86160::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L8444c
    nop
L8616c::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L84465
    nop
L86178::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L84498
    nop
L86184::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L844ba
    nop
L86190::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L844dc
    nop
L8619c::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L84530
    nop
L861a8::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L84549
    nop
L861b4::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L8457c
    nop
L861c0::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L8459e
    nop
L861cc::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L845c0
    nop
L861d8::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L84614
    nop
L861e4::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L8462d
    nop
L861f0::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L84660
    nop
L861fc::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L84682
    nop
L86208::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L846a4
    nop
L86214::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L846fc
    nop
L86220::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L84715
    nop
L8622c::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L84748
    nop
L86238::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L8476a
    nop
L86244::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L8478c
    nop
L86250::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L847e4
    nop
L8625c::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L847fd
    nop
L86268::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L84830
    nop
L86274::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L84852
    nop
L86280::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L84874
    nop
L8628c::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L848cc
    nop
L86298::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L848e5
    nop
L862a4::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L84918
    nop
L862b0::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L8493a
    nop
L862bc::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L8495c
    nop
L862c8::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L84a2b
    nop
L862d4::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L84a44
    nop
L862e0::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L84a77
    nop
L862ec::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L84a99
    nop
L862f8::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L84abb
    nop
L86304::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L84b13
    nop
L86310::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L84b2c
    nop
L8631c::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L84b5f
    nop
L86328::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L84b81
    nop
L86334::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L84ba3
    nop
L86340::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L84bfb
    nop
L8634c::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L84c14
    nop
L86358::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L84c47
    nop
L86364::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L84c69
    nop
L86370::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L84c8b
    nop
L8637c::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L84ce3
    nop
L86388::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L84cfc
    nop
L86394::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L84d2f
    nop
L863a0::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L84d51
    nop
L863ac::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L84d73
    nop
L863b8::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L84dcb
    nop
L863c4::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L84de4
    nop
L863d0::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L84e17
    nop
L863dc::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L84e39
    nop
L863e8::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L84e5b
    nop
L863f4::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L84eb3
    nop
L86400::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L84ecc
    nop
L8640c::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L84eff
    nop
L86418::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L84f21
    nop
L86424::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L84f43
    nop
L86430::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L84f9b
    nop
L8643c::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L84fb4
    nop
L86448::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L84fe7
    nop
L86454::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L85009
    nop
L86460::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L8502b
    nop
L8646c::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L85083
    nop
L86478::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L8509c
    nop
L86484::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L850cf
    nop
L86490::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L850f1
    nop
L8649c::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L85113
    nop
L864a8::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L851e5
    nop
L864b4::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L851fe
    nop
L864c0::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L85231
    nop
L864cc::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L85253
    nop
L864d8::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L85275
    nop
L864e4::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L852a5
    nop
L864f0::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L852c7
    nop
L864fc::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L85307
    nop
L86508::
    add esi, 04h
    mov edx, dword ptr [esi+04h]
    or cl, 0e0h
    jmp near ptr L80cc3
    mov eax, eax
L86518::
    add esi, 04h
    mov edx, dword ptr [esi+04h]
    or cl, 0e0h
    jmp near ptr L80d28
    mov eax, eax
L86528::
    add esi, 04h
    mov edx, dword ptr [esi+04h]
    or cl, 0e0h
    jmp near ptr L80d95
Func854dc_ endp
    db 08bh, 0c0h
_Data86538 label byte
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
L86548 label byte
    db 000h, 000h, 000h, 000h
L8654c label byte
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
L86554 label byte
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 08bh, 0c0h
L8656c label byte
    db 000h, 000h, 08bh, 0c0h, 000h, 000h, 08bh, 0c0h
L86574 label byte
    db 000h, 000h, 08bh, 0c0h
L86578 label byte
    db 000h, 000h, 000h, 000h
L8657c label byte
    db 000h, 000h, 000h, 000h
L86580 label byte
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
L86588 label byte
    db 000h, 000h, 000h, 000h
L8658c label byte
    db 000h, 000h, 000h, 000h
L86590 label byte
    db 000h, 000h, 000h, 000h
L86594 label byte
    db 000h, 000h, 000h, 000h
L86598 label byte
    db 000h, 000h, 000h, 000h
L8659c label byte
    db 000h, 000h, 000h, 000h
L865a0 label byte
    db 000h, 000h, 000h, 000h
L865a4 label byte
    db 000h
L865a5 label byte
    db 000h, 000h, 000h
L865a8 label byte
    db 001h, 000h, 000h, 000h, 002h, 000h, 000h, 000h, 004h, 000h, 000h, 000h, 008h, 000h, 000h, 000h
    db 010h, 000h, 000h, 000h, 020h, 000h, 000h, 000h, 040h, 000h, 000h, 000h, 080h, 000h, 000h, 000h
    db 000h, 001h, 000h, 000h, 000h, 002h, 000h, 000h, 000h, 004h, 000h, 000h, 000h, 008h, 000h, 000h
    db 000h, 010h, 000h, 000h, 000h, 020h, 000h, 000h, 000h, 040h, 000h, 000h, 000h, 080h, 000h, 000h
    db 000h, 000h, 001h, 000h, 000h, 000h, 002h, 000h, 000h, 000h, 004h, 000h, 000h, 000h, 008h, 000h
    db 000h, 000h, 010h, 000h, 000h, 000h, 020h, 000h, 000h, 000h, 040h, 000h, 000h, 000h, 080h, 000h
    db 000h, 000h, 000h, 001h, 000h, 000h, 000h, 002h, 000h, 000h, 000h, 004h, 000h, 000h, 000h, 008h
    db 000h, 000h, 000h, 010h, 000h, 000h, 000h, 020h, 000h, 000h, 000h, 040h, 000h, 000h, 000h, 080h
L86628 label byte
    db 000h, 000h, 000h, 000h
L8662c label byte
    db 000h, 000h, 000h, 000h
L86630 label byte
    db 000h, 02eh, 08bh, 0c0h
L86634 label byte
    db 000h, 000h, 000h, 000h
L86638 label byte
    db 000h, 000h, 000h, 000h
L8663c label byte
    db 000h, 000h, 000h, 000h
L86640 label byte
    db 000h, 000h, 000h, 000h
L86644 label byte
    db 000h, 000h, 000h, 000h
L86648 label byte
    db 000h, 000h, 000h, 000h
L8664c label byte
    db 000h, 000h, 000h, 000h
L86650 label byte
    db 000h, 000h, 000h, 000h
L86654 label byte
    db 000h, 000h, 000h, 000h
L86658 label byte
    db 000h, 000h, 000h, 000h
L8665c label byte
    db 000h, 000h, 000h, 000h
L86660 label byte
    db 000h, 000h, 000h, 000h
L86664 label byte
    db 000h, 000h, 000h, 000h
L86668 label byte
    db 000h, 000h, 000h, 000h
L8666c label byte
    db 000h
L8666d label byte
    db 000h
L8666e label byte
    db 000h
L8666f label byte
    db 000h, 000h, 000h, 000h, 000h
L86674 label byte
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
L86874 label byte
    db 000h, 02eh, 08bh, 0c0h
_TEXT ends

_DATA segment
_Dataca790 label byte
    db "$Id: 124_110.ASM 1.1 1996/02/28 15:45:20 MDV Exp $"
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
_DATA ends

    end

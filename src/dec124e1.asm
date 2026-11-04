    .586p

_TEXT segment para public use32 'CODE'
_TEXT ends
_DATA segment dword public use32 'DATA'
_DATA ends

    assume cs:FLAT, ds:FLAT, es:FLAT, ss:FLAT

    public Func6f8b0_
    public Func70566_
    public Func70d17_
    public Func714c2_
    public Func72d84_
    public Func741bc_
    public Func748de_
    public Func75e12_
    public Func75e4b_
    public Func75f7c_
    public _Data77058
    public _Dataca6f0

_TEXT segment
Func6f8b0_ proc near
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
L6f8d0::
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
L6f901::
    add cl, 0fh
    jb near ptr L76fa8
L6f90a::
    mov eax, dword ptr [esi]
    shrd eax, edx, cl
    add cl, 0fh
    jb near ptr L76fb8
L6f918::
    and eax, 07fffh
    mov word ptr [edi], ax
    mov word ptr [edi+02h], ax
    add edi, 08h
    mov word ptr [edi-04h], ax
    mov word ptr [edi-02h], ax
    ret
L6f930::
    add cl, 0fh
    jb near ptr L76fc8
L6f939::
    mov eax, dword ptr [esi]
    shrd eax, edx, cl
    add cl, 0fh
    jb near ptr L76fd8
L6f947::
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
L6f96f::
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
L6f98f::
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
L6f9c0::
    mov eax, dword ptr [esi]
    shrd eax, edx, cl
    add cl, 01eh
    jae short L6f9d3
    add esi, 04h
    or cl, 0e0h
    mov edx, dword ptr [esi+04h]
L6f9d3::
    and eax, 03fffffffh
    add eax, eax
    shr ax, 1
    mov word ptr [edi+04h], ax
    mov word ptr [edi+06h], ax
    rol eax, 010h
    mov dword ptr [edi], eax
    add edi, 08h
    ret
L6f9ee::
    mov eax, dword ptr [esi]
    shrd eax, edx, cl
    add cl, 01eh
    jae short L6fa01
    add esi, 04h
    or cl, 0e0h
    mov edx, dword ptr [esi+04h]
L6fa01::
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
L6fa2d::
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
L6fa4d::
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
L6fa7e::
    mov eax, dword ptr [esi]
    shrd eax, edx, cl
    add cl, 01eh
    jae short L6fa91
    add esi, 04h
    or cl, 0e0h
    mov edx, dword ptr [esi+04h]
L6fa91::
    and eax, 03fffffffh
    add eax, eax
    shr ax, 1
    mov dword ptr [edi], eax
    add edi, 08h
    mov word ptr [edi-04h], ax
    mov word ptr [edi-02h], ax
    ret
L6faa9::
    mov eax, dword ptr [esi]
    shrd eax, edx, cl
    add cl, 01eh
    jae short L6fabc
    add esi, 04h
    or cl, 0e0h
    mov edx, dword ptr [esi+04h]
L6fabc::
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
L6fae5::
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
L6fb05::
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
L6fb36::
    mov eax, dword ptr [esi]
    shrd eax, edx, cl
    add cl, 01eh
    jae short L6fb49
    add esi, 04h
    or cl, 0e0h
    mov edx, dword ptr [esi+04h]
L6fb49::
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
L6fb69::
    mov eax, dword ptr [esi]
    shrd eax, edx, cl
    add cl, 01eh
    jae short L6fb7c
    add esi, 04h
    or cl, 0e0h
    mov edx, dword ptr [esi+04h]
L6fb7c::
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
L6fbad::
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
L6fbcd::
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
L6fbfe::
    mov eax, dword ptr [esi]
    shrd eax, edx, cl
    add cl, 01eh
    jae short L6fc11
    add esi, 04h
    or cl, 0e0h
    mov edx, dword ptr [esi+04h]
L6fc11::
    and eax, 03fffffffh
    add eax, eax
    shr ax, 1
    mov word ptr [edi], ax
    mov word ptr [edi+02h], ax
    rol eax, 010h
    add edi, 08h
    mov dword ptr [edi-04h], eax
    ret
L6fc2c::
    mov eax, dword ptr [esi]
    shrd eax, edx, cl
    add cl, 01eh
    jae short L6fc3f
    add esi, 04h
    or cl, 0e0h
    mov edx, dword ptr [esi+04h]
L6fc3f::
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
L6fc6b::
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
L6fc8b::
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
L6fcbc::
    mov eax, dword ptr [esi]
    shrd eax, edx, cl
    add cl, 01eh
    jae short L6fccf
    add esi, 04h
    or cl, 0e0h
    mov edx, dword ptr [esi+04h]
L6fccf::
    and eax, 03fffffffh
    add eax, eax
    shr ax, 1
    rol eax, 010h
    mov dword ptr [edi], eax
    add edi, 08h
    mov dword ptr [edi-04h], eax
    ret
L6fce5::
    mov eax, dword ptr [esi]
    shrd eax, edx, cl
    add cl, 01eh
    jae short L6fcf8
    add esi, 04h
    or cl, 0e0h
    mov edx, dword ptr [esi+04h]
L6fcf8::
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
L6fd1f::
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
L6fd3f::
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
L6fd70::
    mov eax, dword ptr [esi]
    shrd eax, edx, cl
    add cl, 01eh
    jae short L6fd83
    add esi, 04h
    or cl, 0e0h
    mov edx, dword ptr [esi+04h]
L6fd83::
    and eax, 03fffffffh
    add eax, eax
    shr ax, 1
    mov dword ptr [edi], eax
    rol eax, 010h
    add edi, 08h
    mov dword ptr [edi-04h], eax
    ret
L6fd99::
    mov eax, dword ptr [esi]
    shrd eax, edx, cl
    add cl, 01eh
    jae short L6fdac
    add esi, 04h
    or cl, 0e0h
    mov edx, dword ptr [esi+04h]
L6fdac::
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
L6fdd3::
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
L6fdf3::
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
L6fe24::
    mov eax, dword ptr [esi]
    shrd eax, edx, cl
    add cl, 01eh
    jae short L6fe37
    add esi, 04h
    or cl, 0e0h
    mov edx, dword ptr [esi+04h]
L6fe37::
    and eax, 03fffffffh
    add eax, eax
    shr ax, 1
    rol eax, 010h
    mov dword ptr [edi+04h], eax
    mov word ptr [edi], ax
    add edi, 08h
    mov word ptr [edi-06h], ax
    ret
L6fe52::
    mov eax, dword ptr [esi]
    shrd eax, edx, cl
    add cl, 01eh
    jae short L6fe65
    add esi, 04h
    or cl, 0e0h
    mov edx, dword ptr [esi+04h]
L6fe65::
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
L6fe91::
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
L6feb1::
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
L6fee2::
    mov eax, dword ptr [esi]
    shrd eax, edx, cl
    add cl, 01eh
    jae short L6fef5
    add esi, 04h
    or cl, 0e0h
    mov edx, dword ptr [esi+04h]
L6fef5::
    and eax, 03fffffffh
    add eax, eax
    shr ax, 1
    mov dword ptr [edi+04h], eax
    mov word ptr [edi], ax
    add edi, 08h
    mov word ptr [edi-06h], ax
    ret
L6ff0d::
    mov eax, dword ptr [esi]
    shrd eax, edx, cl
    add cl, 01eh
    jae short L6ff20
    add esi, 04h
    or cl, 0e0h
    mov edx, dword ptr [esi+04h]
L6ff20::
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
L6ff49::
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
L6ff69::
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
L6ff9a::
    mov eax, dword ptr [esi]
    shrd eax, edx, cl
    add cl, 01eh
    jae short L6ffad
    add esi, 04h
    or cl, 0e0h
    mov edx, dword ptr [esi+04h]
L6ffad::
    and eax, 03fffffffh
    add eax, eax
    shr ax, 1
    mov dword ptr [edi+04h], eax
    rol eax, 010h
    mov dword ptr [edi], eax
    add edi, 08h
    ret
L6ffc3::
    mov eax, dword ptr [esi]
    shrd eax, edx, cl
    add cl, 01eh
    jae short L6ffd6
    add esi, 04h
    or cl, 0e0h
    mov edx, dword ptr [esi+04h]
L6ffd6::
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
L6fffd::
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
L7001d::
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
L7004e::
    mov eax, dword ptr [esi]
    shrd eax, edx, cl
    add cl, 01eh
    jae short L70061
    add esi, 04h
    or cl, 0e0h
    mov edx, dword ptr [esi+04h]
L70061::
    and eax, 03fffffffh
    add eax, eax
    shr ax, 1
    mov dword ptr [edi], eax
    add edi, 08h
    mov dword ptr [edi-04h], eax
    ret
L70074::
    mov eax, dword ptr [esi]
    shrd eax, edx, cl
    add cl, 01eh
    jae short L70087
    add esi, 04h
    or cl, 0e0h
    mov edx, dword ptr [esi+04h]
L70087::
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
L700ab::
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
L700cb::
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
L700fc::
    mov eax, dword ptr [esi]
    shrd eax, edx, cl
    add cl, 01eh
    jae short L7010f
    add esi, 04h
    or cl, 0e0h
    mov edx, dword ptr [esi+04h]
L7010f::
    and eax, 03fffffffh
    add eax, eax
    shr ax, 1
    mov dword ptr [edi+04h], eax
    rol eax, 010h
    mov word ptr [edi+02h], ax
    mov word ptr [edi], ax
    add edi, 08h
    ret
L7012a::
    mov eax, dword ptr [esi]
    shrd eax, edx, cl
    add cl, 01eh
    jae short L7013d
    add esi, 04h
    or cl, 0e0h
    mov edx, dword ptr [esi+04h]
L7013d::
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
L70169::
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
L70189::
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
L701ba::
    mov eax, dword ptr [esi]
    shrd eax, edx, cl
    add cl, 01eh
    jae short L701cd
    add esi, 04h
    or cl, 0e0h
    mov edx, dword ptr [esi+04h]
L701cd::
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
L701ed::
    mov eax, dword ptr [esi]
    shrd eax, edx, cl
    add cl, 01eh
    jae short L70200
    add esi, 04h
    or cl, 0e0h
    mov edx, dword ptr [esi+04h]
L70200::
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
L70231::
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
L70251::
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
L70282::
    mov eax, dword ptr [esi]
    shrd eax, edx, cl
    add cl, 01eh
    jae short L70295
    add esi, 04h
    or cl, 0e0h
    mov edx, dword ptr [esi+04h]
L70295::
    and eax, 03fffffffh
    add eax, eax
    shr ax, 1
    rol eax, 010h
    mov dword ptr [edi], eax
    add edi, 08h
    mov word ptr [edi-04h], ax
    mov word ptr [edi-02h], ax
    ret
L702b0::
    mov eax, dword ptr [esi]
    shrd eax, edx, cl
    add cl, 01eh
    jae short L702c3
    add esi, 04h
    or cl, 0e0h
    mov edx, dword ptr [esi+04h]
L702c3::
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
L702ef::
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
L7030f::
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
L70340::
    mov eax, dword ptr [esi]
    shrd eax, edx, cl
    add cl, 01eh
    jae short L70353
    add esi, 04h
    or cl, 0e0h
    mov edx, dword ptr [esi+04h]
L70353::
    and eax, 03fffffffh
    add eax, eax
    shr ax, 1
    mov dword ptr [edi], eax
    rol eax, 010h
    add edi, 08h
    mov word ptr [edi-02h], ax
    mov word ptr [edi-04h], ax
    ret
L7036e::
    mov eax, dword ptr [esi]
    shrd eax, edx, cl
    add cl, 01eh
    jae short L70381
    add esi, 04h
    or cl, 0e0h
    mov edx, dword ptr [esi+04h]
L70381::
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
L703ad::
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
L703ca::
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
L703f8::
    mov eax, dword ptr [esi]
    shrd eax, edx, cl
    add cl, 0fh
    jb near ptr L76fe8
L70406::
    and eax, 07fffh
    add cl, 0fh
    jb near ptr L76ff8
L70414::
    mov word ptr [edi+04h], ax
    mov word ptr [edi+06h], ax
    mov word ptr [edi], ax
    add edi, 08h
    mov word ptr [edi-06h], ax
    ret
L70427::
    mov eax, dword ptr [esi]
    shrd eax, edx, cl
    add cl, 0fh
    jb near ptr L77008
L70435::
    and eax, 07fffh
    bswap ecx
    mov cl, al
    add ax, ax
    and al, 0c0h
    and cl, 01fh
    or al, cl
    bswap ecx
    add cl, 0fh
    jb near ptr L77018
L70453::
    mov word ptr [edi+04h], ax
    mov word ptr [edi+06h], ax
    mov word ptr [edi], ax
    add edi, 08h
    mov word ptr [edi-06h], ax
    ret
Func6f8b0_ endp
L70466 label byte
    dd offset L6f901
    dd offset L6f9c0
    dd offset L6fa7e
    dd offset L6fb36
    dd offset L6fbfe
    dd offset L6fcbc
    dd offset L6fd70
    dd offset L6fe24
    dd offset L6fee2
    dd offset L6ff9a
    dd offset L7004e
    dd offset L700fc
    dd offset L701ba
    dd offset L70282
    dd offset L70340
    dd offset L703f8
    dd offset L6f930
    dd offset L6f9ee
    dd offset L6faa9
    dd offset L6fb69
    dd offset L6fc2c
    dd offset L6fce5
    dd offset L6fd99
    dd offset L6fe52
    dd offset L6ff0d
    dd offset L6ffc3
    dd offset L70074
    dd offset L7012a
    dd offset L701ed
    dd offset L702b0
    dd offset L7036e
    dd offset L70427
    dd offset Func6f8b0_
    dd offset L6f96f
    dd offset L6fa2d
    dd offset L6fae5
    dd offset L6fbad
    dd offset L6fc6b
    dd offset L6fd1f
    dd offset L6fdd3
    dd offset L6fe91
    dd offset L6ff49
    dd offset L6fffd
    dd offset L700ab
    dd offset L70169
    dd offset L70231
    dd offset L702ef
    dd offset L703ad
    dd offset L6f8d0
    dd offset L6f98f
    dd offset L6fa4d
    dd offset L6fb05
    dd offset L6fbcd
    dd offset L6fc8b
    dd offset L6fd3f
    dd offset L6fdf3
    dd offset L6feb1
    dd offset L6ff69
    dd offset L7001d
    dd offset L700cb
    dd offset L70189
    dd offset L70251
    dd offset L7030f
    dd offset L703ca
Func70566_ proc near
    mov dword ptr [edi], ebx
    mov dword ptr [edi+04h], ecx
    mov dword ptr [edi+0a00h], esi
    mov dword ptr [edi+0a04h], ebp
    ret
L70578::
    mov dword ptr [edi+08h], ebx
    mov dword ptr [edi+0ch], ecx
    mov dword ptr [edi+0a08h], esi
    mov dword ptr [edi+0a0ch], ebp
    ret
L7058b::
    mov dword ptr [edi+010h], ebx
    mov dword ptr [edi+014h], ecx
    mov dword ptr [edi+0a10h], esi
    mov dword ptr [edi+0a14h], ebp
    ret
L7059e::
    mov dword ptr [edi+018h], ebx
    mov dword ptr [edi+01ch], ecx
    mov dword ptr [edi+0a18h], esi
    mov dword ptr [edi+0a1ch], ebp
    ret
L705b1::
    mov dword ptr [edi+01400h], ebx
    mov dword ptr [edi+01404h], ecx
    mov dword ptr [edi+01e00h], esi
    mov dword ptr [edi+01e04h], ebp
    ret
L705ca::
    mov dword ptr [edi+01408h], ebx
    mov dword ptr [edi+0140ch], ecx
    mov dword ptr [edi+01e08h], esi
    mov dword ptr [edi+01e0ch], ebp
    ret
L705e3::
    mov dword ptr [edi+01410h], ebx
    mov dword ptr [edi+01414h], ecx
    mov dword ptr [edi+01e10h], esi
    mov dword ptr [edi+01e14h], ebp
    ret
L705fc::
    mov dword ptr [edi+01418h], ebx
    mov dword ptr [edi+0141ch], ecx
    mov dword ptr [edi+01e18h], esi
    mov dword ptr [edi+01e1ch], ebp
    ret
L70615::
    mov dword ptr [edi+02800h], ebx
    mov dword ptr [edi+02804h], ecx
    mov dword ptr [edi+03200h], esi
    mov dword ptr [edi+03204h], ebp
    ret
L7062e::
    mov dword ptr [edi+02808h], ebx
    mov dword ptr [edi+0280ch], ecx
    mov dword ptr [edi+03208h], esi
    mov dword ptr [edi+0320ch], ebp
    ret
L70647::
    mov dword ptr [edi+02810h], ebx
    mov dword ptr [edi+02814h], ecx
    mov dword ptr [edi+03210h], esi
    mov dword ptr [edi+03214h], ebp
    ret
L70660::
    mov dword ptr [edi+02818h], ebx
    mov dword ptr [edi+0281ch], ecx
    mov dword ptr [edi+03218h], esi
    mov dword ptr [edi+0321ch], ebp
    ret
L70679::
    mov dword ptr [edi+03c00h], ebx
    mov dword ptr [edi+03c04h], ecx
    mov dword ptr [edi+04600h], esi
    mov dword ptr [edi+04604h], ebp
    ret
L70692::
    mov dword ptr [edi+03c08h], ebx
    mov dword ptr [edi+03c0ch], ecx
    mov dword ptr [edi+04608h], esi
    mov dword ptr [edi+0460ch], ebp
    ret
L706ab::
    mov dword ptr [edi+03c10h], ebx
    mov dword ptr [edi+03c14h], ecx
    mov dword ptr [edi+04610h], esi
    mov dword ptr [edi+04614h], ebp
    ret
L706c4::
    mov dword ptr [edi+03c18h], ebx
    mov dword ptr [edi+03c1ch], ecx
    mov dword ptr [edi+04618h], esi
    mov dword ptr [edi+0461ch], ebp
    ret
L706dd::
    mov dword ptr [edi], ebx
    mov dword ptr [edi+04h], ecx
    cmp di, 0f600h
    jae short L706f5
    mov dword ptr [edi+0a00h], esi
    mov dword ptr [edi+0a04h], ebp
L706f5::
    ret
L706f6::
    cmp di, 0fff8h
    jae short L70715
    mov dword ptr [edi+08h], ebx
    mov dword ptr [edi+0ch], ecx
    cmp di, 0f5f8h
    jae short L70715
    mov dword ptr [edi+0a08h], esi
    mov dword ptr [edi+0a0ch], ebp
L70715::
    ret
L70716::
    cmp di, 0fff0h
    jae short L70735
    mov dword ptr [edi+010h], ebx
    mov dword ptr [edi+014h], ecx
    cmp di, 0f5f0h
    jae short L70735
    mov dword ptr [edi+0a10h], esi
    mov dword ptr [edi+0a14h], ebp
L70735::
    ret
L70736::
    cmp di, 0ffe8h
    jae short L70755
    mov dword ptr [edi+018h], ebx
    mov dword ptr [edi+01ch], ecx
    cmp di, 0f5e8h
    jae short L70755
    mov dword ptr [edi+0a18h], esi
    mov dword ptr [edi+0a1ch], ebp
L70755::
    ret
L70756::
    cmp di, 0ec00h
    jae short L7077c
    mov dword ptr [edi+01400h], ebx
    mov dword ptr [edi+01404h], ecx
    cmp di, 0e200h
    jae short L7077c
    mov dword ptr [edi+01e00h], esi
    mov dword ptr [edi+01e04h], ebp
L7077c::
    ret
L7077d::
    cmp di, 0ebf8h
    jae short L707a3
    mov dword ptr [edi+01408h], ebx
    mov dword ptr [edi+0140ch], ecx
    cmp di, 0e1f8h
    jae short L707a3
    mov dword ptr [edi+01e08h], esi
    mov dword ptr [edi+01e0ch], ebp
L707a3::
    ret
L707a4::
    cmp di, 0ebf0h
    jae short L707ca
    mov dword ptr [edi+01410h], ebx
    mov dword ptr [edi+01414h], ecx
    cmp di, 0e1f0h
    jae short L707ca
    mov dword ptr [edi+01e10h], esi
    mov dword ptr [edi+01e14h], ebp
L707ca::
    ret
L707cb::
    cmp di, 0ebe8h
    jae short L707f1
    mov dword ptr [edi+01418h], ebx
    mov dword ptr [edi+0141ch], ecx
    cmp di, 0e1e8h
    jae short L707f1
    mov dword ptr [edi+01e18h], esi
    mov dword ptr [edi+01e1ch], ebp
L707f1::
    ret
L707f2::
    cmp di, 0d800h
    jae short L70818
    mov dword ptr [edi+02800h], ebx
    mov dword ptr [edi+02804h], ecx
    cmp di, 0ce00h
    jae short L70818
    mov dword ptr [edi+03200h], esi
    mov dword ptr [edi+03204h], ebp
L70818::
    ret
L70819::
    cmp di, 0d7f8h
    jae short L7083f
    mov dword ptr [edi+02808h], ebx
    mov dword ptr [edi+0280ch], ecx
    cmp di, 0cdf8h
    jae short L7083f
    mov dword ptr [edi+03208h], esi
    mov dword ptr [edi+0320ch], ebp
L7083f::
    ret
L70840::
    cmp di, 0d7f0h
    jae short L70866
    mov dword ptr [edi+02810h], ebx
    mov dword ptr [edi+02814h], ecx
    cmp di, 0cdf0h
    jae short L70866
    mov dword ptr [edi+03210h], esi
    mov dword ptr [edi+03214h], ebp
L70866::
    ret
L70867::
    cmp di, 0d7e8h
    jae short L7088d
    mov dword ptr [edi+02818h], ebx
    mov dword ptr [edi+0281ch], ecx
    cmp di, 0cde8h
    jae short L7088d
    mov dword ptr [edi+03218h], esi
    mov dword ptr [edi+0321ch], ebp
L7088d::
    ret
L7088e::
    cmp di, 0c400h
    jae short L708b4
    mov dword ptr [edi+03c00h], ebx
    mov dword ptr [edi+03c04h], ecx
    cmp di, 0ba00h
    jae short L708b4
    mov dword ptr [edi+04600h], esi
    mov dword ptr [edi+04604h], ebp
L708b4::
    ret
L708b5::
    cmp di, 0c3f8h
    jae short L708db
    mov dword ptr [edi+03c08h], ebx
    mov dword ptr [edi+03c0ch], ecx
    cmp di, 0b9f8h
    jae short L708db
    mov dword ptr [edi+04608h], esi
    mov dword ptr [edi+0460ch], ebp
L708db::
    ret
L708dc::
    cmp di, 0c3f0h
    jae short L70902
    mov dword ptr [edi+03c10h], ebx
    mov dword ptr [edi+03c14h], ecx
    cmp di, 0b9f0h
    jae short L70902
    mov dword ptr [edi+04610h], esi
    mov dword ptr [edi+04614h], ebp
L70902::
    ret
L70903::
    cmp di, 0c3e8h
    jae short L70929
    mov dword ptr [edi+03c18h], ebx
    mov dword ptr [edi+03c1ch], ecx
    cmp di, 0b9e8h
    jae short L70929
    mov dword ptr [edi+04618h], esi
    mov dword ptr [edi+0461ch], ebp
L70929::
    ret
L7092a::
    sub edi, 010000h
    cmp di, 0f600h
    jae short L7093e
    jmp short L7094a
    mov dword ptr [edi], ebx
    mov dword ptr [edi+04h], ecx
L7093e::
    mov dword ptr [edi+0a00h], esi
    mov dword ptr [edi+0a04h], ebp
L7094a::
    add edi, 010000h
    ret
L70951::
    sub edi, 010000h
    cmp di, 0fff8h
    jae short L70966
    cmp di, 0f5f8h
    jae short L7096c
    jmp short L70978
L70966::
    mov dword ptr [edi+08h], ebx
    mov dword ptr [edi+0ch], ecx
L7096c::
    mov dword ptr [edi+0a08h], esi
    mov dword ptr [edi+0a0ch], ebp
L70978::
    add edi, 010000h
    ret
L7097f::
    sub edi, 010000h
    cmp di, 0fff0h
    jae short L70994
    cmp di, 0f5f0h
    jae short L7099a
    jmp short L709a6
L70994::
    mov dword ptr [edi+010h], ebx
    mov dword ptr [edi+014h], ecx
L7099a::
    mov dword ptr [edi+0a10h], esi
    mov dword ptr [edi+0a14h], ebp
L709a6::
    add edi, 010000h
    ret
L709ad::
    sub edi, 010000h
    cmp di, 0ffe8h
    jae short L709c2
    cmp di, 0f5e8h
    jae short L709c8
    jmp short L709d4
L709c2::
    mov dword ptr [edi+018h], ebx
    mov dword ptr [edi+01ch], ecx
L709c8::
    mov dword ptr [edi+0a18h], esi
    mov dword ptr [edi+0a1ch], ebp
L709d4::
    add edi, 010000h
    ret
L709db::
    sub edi, 010000h
    cmp di, 0ec00h
    jae short L709f1
    cmp di, 0e200h
    jae short L709fd
    jmp short L70a09
L709f1::
    mov dword ptr [edi+01400h], ebx
    mov dword ptr [edi+01404h], ecx
L709fd::
    mov dword ptr [edi+01e00h], esi
    mov dword ptr [edi+01e04h], ebp
L70a09::
    add edi, 010000h
    ret
L70a10::
    sub edi, 010000h
    cmp di, 0ebf8h
    jae short L70a26
    cmp di, 0e1f8h
    jae short L70a32
    jmp short L70a3e
L70a26::
    mov dword ptr [edi+01408h], ebx
    mov dword ptr [edi+0140ch], ecx
L70a32::
    mov dword ptr [edi+01e08h], esi
    mov dword ptr [edi+01e0ch], ebp
L70a3e::
    add edi, 010000h
    ret
L70a45::
    sub edi, 010000h
    cmp di, 0ebf0h
    jae short L70a5b
    cmp di, 0e1f0h
    jae short L70a67
    jmp short L70a73
L70a5b::
    mov dword ptr [edi+01410h], ebx
    mov dword ptr [edi+01414h], ecx
L70a67::
    mov dword ptr [edi+01e10h], esi
    mov dword ptr [edi+01e14h], ebp
L70a73::
    add edi, 010000h
    ret
L70a7a::
    sub edi, 010000h
    cmp di, 0ebe8h
    jae short L70a90
    cmp di, 0e1e8h
    jae short L70a9c
    jmp short L70aa8
L70a90::
    mov dword ptr [edi+01418h], ebx
    mov dword ptr [edi+0141ch], ecx
L70a9c::
    mov dword ptr [edi+01e18h], esi
    mov dword ptr [edi+01e1ch], ebp
L70aa8::
    add edi, 010000h
    ret
L70aaf::
    sub edi, 010000h
    cmp di, 0d800h
    jae short L70ac5
    cmp di, 0ce00h
    jae short L70ad1
    jmp short L70add
L70ac5::
    mov dword ptr [edi+02800h], ebx
    mov dword ptr [edi+02804h], ecx
L70ad1::
    mov dword ptr [edi+03200h], esi
    mov dword ptr [edi+03204h], ebp
L70add::
    add edi, 010000h
    ret
L70ae4::
    sub edi, 010000h
    cmp di, 0d7f8h
    jae short L70afa
    cmp di, 0cdf8h
    jae short L70b06
    jmp short L70b12
L70afa::
    mov dword ptr [edi+02808h], ebx
    mov dword ptr [edi+0280ch], ecx
L70b06::
    mov dword ptr [edi+03208h], esi
    mov dword ptr [edi+0320ch], ebp
L70b12::
    add edi, 010000h
    ret
L70b19::
    sub edi, 010000h
    cmp di, 0d7f0h
    jae short L70b2f
    cmp di, 0cdf0h
    jae short L70b3b
    jmp short L70b47
L70b2f::
    mov dword ptr [edi+02810h], ebx
    mov dword ptr [edi+02814h], ecx
L70b3b::
    mov dword ptr [edi+03210h], esi
    mov dword ptr [edi+03214h], ebp
L70b47::
    add edi, 010000h
    ret
L70b4e::
    sub edi, 010000h
    cmp di, 0d7e8h
    jae short L70b64
    cmp di, 0cde8h
    jae short L70b70
    jmp short L70b7c
L70b64::
    mov dword ptr [edi+02818h], ebx
    mov dword ptr [edi+0281ch], ecx
L70b70::
    mov dword ptr [edi+03218h], esi
    mov dword ptr [edi+0321ch], ebp
L70b7c::
    add edi, 010000h
    ret
L70b83::
    sub edi, 010000h
    cmp di, 0c400h
    jae short L70b99
    cmp di, 0ba00h
    jae short L70ba5
    jmp short L70bb1
L70b99::
    mov dword ptr [edi+03c00h], ebx
    mov dword ptr [edi+03c04h], ecx
L70ba5::
    mov dword ptr [edi+04600h], esi
    mov dword ptr [edi+04604h], ebp
L70bb1::
    add edi, 010000h
    ret
L70bb8::
    sub edi, 010000h
    cmp di, 0c3f8h
    jae short L70bce
    cmp di, 0b9f8h
    jae short L70bda
    jmp short L70be6
L70bce::
    mov dword ptr [edi+03c08h], ebx
    mov dword ptr [edi+03c0ch], ecx
L70bda::
    mov dword ptr [edi+04608h], esi
    mov dword ptr [edi+0460ch], ebp
L70be6::
    add edi, 010000h
    ret
L70bed::
    sub edi, 010000h
    cmp di, 0c3f0h
    jae short L70c03
    cmp di, 0b9f0h
    jae short L70c0f
    jmp short L70c1b
L70c03::
    mov dword ptr [edi+03c10h], ebx
    mov dword ptr [edi+03c14h], ecx
L70c0f::
    mov dword ptr [edi+04610h], esi
    mov dword ptr [edi+04614h], ebp
L70c1b::
    add edi, 010000h
    ret
L70c22::
    sub edi, 010000h
    cmp di, 0c3e8h
    jae short L70c38
    cmp di, 0b9e8h
    jae short L70c44
    jmp short L70c50
L70c38::
    mov dword ptr [edi+03c18h], ebx
    mov dword ptr [edi+03c1ch], ecx
L70c44::
    mov dword ptr [edi+04618h], esi
    mov dword ptr [edi+0461ch], ebp
L70c50::
    add edi, 010000h
    ret
Func70566_ endp
L70c57 label byte
    dd offset Func70566_
    dd offset L70578
    dd offset L7058b
    dd offset L7059e
    dd offset L705b1
    dd offset L705ca
    dd offset L705e3
    dd offset L705fc
    dd offset L70615
    dd offset L7062e
    dd offset L70647
    dd offset L70660
    dd offset L70679
    dd offset L70692
    dd offset L706ab
    dd offset L706c4
L70c97 label byte
    dd offset L706dd
    dd offset L706f6
    dd offset L70716
    dd offset L70736
    dd offset L70756
    dd offset L7077d
    dd offset L707a4
    dd offset L707cb
    dd offset L707f2
    dd offset L70819
    dd offset L70840
    dd offset L70867
    dd offset L7088e
    dd offset L708b5
    dd offset L708dc
    dd offset L70903
L70cd7 label byte
    dd offset L7092a
    dd offset L70951
    dd offset L7097f
    dd offset L709ad
    dd offset L709db
    dd offset L70a10
    dd offset L70a45
    dd offset L70a7a
    dd offset L70aaf
    dd offset L70ae4
    dd offset L70b19
    dd offset L70b4e
    dd offset L70b83
    dd offset L70bb8
    dd offset L70bed
    dd offset L70c22
Func70d17_ proc near
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
    mov dword ptr [L77154], eax
    mov edi, dword ptr [ebp+014h]
    mov eax, dword ptr [edi]
    imul eax, dword ptr [edi+04h]
    add edi, 08h
    mov dword ptr [ebp+014h], edi
    mov dword ptr [L770bc], eax
    mov edi, dword ptr [ebp+010h]
    mov eax, dword ptr [edi]
    mov dword ptr [L770ac], eax
    mov eax, dword ptr [edi+04h]
    mov dword ptr [L770b0], eax
    mov eax, dword ptr [edi+08h]
    mov dword ptr [L770b4], eax
    mov al, byte ptr [edi+0ch]
    mov byte ptr [L77194], al
    mov al, byte ptr [edi+0dh]
    mov byte ptr [L77195], al
    mov al, byte ptr [edi+0eh]
    mov byte ptr [L77196], al
    mov edi, dword ptr [ebp+0ch]
    mov dword ptr [L770b8], edi
    mov byte ptr [L77150], 00h
    test dword ptr [L77154], 07800000h
    je near ptr L75e0a
    mov esi, dword ptr [ebp+08h]
    mov dword ptr [L77158], 00h
    mov dword ptr [L7714c], 00h
    mov dword ptr [L770c0], 00h
    mov dword ptr [L77148], 00h
    mov ecx, 0e0h
    mov edx, dword ptr [L77154]
    test edx, 020000h
    je short L70e29
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 04h
    jb near ptr L75fb8
L70de0::
    and eax, 0fh
    mov byte ptr [L77194], al
    mov eax, dword ptr [eax*4+L770c8]
    mov dword ptr [L770c0], eax
    cmp eax, 00h
    je short L70e23
    mov edi, dword ptr [L770ac]
    mov edx, dword ptr [esi+04h]
L70e02::
    mov eax, dword ptr [esi]
    shrd eax, edx, cl
    add cl, 04h
    jb near ptr L77028
L70e10::
    and eax, 0fh
    call dword ptr [eax*4+L70466]
    sub dword ptr [L770c0], 01h
    jne short L70e02
L70e23::
    mov edx, dword ptr [L77154]
L70e29::
    test edx, 040000h
    je short L70e91
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 04h
    jb near ptr L75fc4
L70e42::
    and eax, 0fh
    mov byte ptr [L77195], al
    mov eax, dword ptr [eax*4+L770c8]
    mul dword ptr [L770bc]
    mov dword ptr [L770c0], eax
    cmp eax, 00h
    je short L70e8b
    mov edi, dword ptr [L770b0]
    mov edx, dword ptr [esi+04h]
L70e6a::
    mov eax, dword ptr [esi]
    shrd eax, edx, cl
    add cl, 04h
    jb near ptr L77038
L70e78::
    and eax, 0fh
    call dword ptr [eax*4+L70466]
    sub dword ptr [L770c0], 01h
    jne short L70e6a
L70e8b::
    mov edx, dword ptr [L77154]
L70e91::
    test edx, 080000h
    je short L70efb
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 014h
    jae short L70eac
    add esi, 04h
    or cl, 0e0h
L70eac::
    and eax, 0fffffh
    mov dword ptr [L770c0], eax
    cmp eax, 00h
    je short L70efb
    bswap ecx
    mov cl, 00h
    sub eax, 01h
L70ec2::
    add cl, 01h
    shr eax, 1
    jne short L70ec2
    mov byte ptr [L77196], cl
    bswap ecx
    mov edi, dword ptr [L770b4]
    mov edx, dword ptr [esi+04h]
L70eda::
    mov eax, dword ptr [esi]
    shrd eax, edx, cl
    add cl, 04h
    jb near ptr L77048
L70ee8::
    and eax, 0fh
    call dword ptr [eax*4+L70466]
    sub dword ptr [L770c0], 01h
    jne short L70eda
L70efb::
    mov edx, dword ptr [L770b0]
    mov dword ptr [L77148], edx
    bswap ecx
    mov edx, dword ptr [ebp+010h]
    mov cl, byte ptr [L77194]
    mov byte ptr [edx+0ch], cl
    mov eax, 01h
    shl eax, cl
    dec eax
    mov dword ptr [L77190], eax
    mov cl, byte ptr [L77196]
    mov byte ptr [edx+0eh], cl
    mov eax, 01h
    shl eax, cl
    dec eax
    mov dword ptr [L7718c], eax
    mov cl, byte ptr [L77195]
    mov byte ptr [edx+0dh], cl
    mov eax, 01h
    shl eax, cl
    dec eax
    mov dword ptr [L77188], eax
    add cl, 03h
    mov byte ptr [L77197], cl
    bswap ecx
    xor edx, edx
    mov word ptr [L7708c], 0ffffh
L70f64::
    mov dword ptr [L77170], esi
    mov dword ptr [L77174], ecx
    mov dword ptr [L77178], edx
    mov al, byte ptr [L77150]
    mov byte ptr [L77184], al
    mov eax, dword ptr [L7714c]
    mov dword ptr [L77180], eax
    mov eax, dword ptr [L77148]
    mov dword ptr [L7717c], eax
L70f94::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb near ptr L75fd0
L70fa1::
    and eax, 01h
    je short L70ff7
    add edx, 01h
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 03h
    jb near ptr L75fdc
L70fba::
    and eax, 07h
    add edx, eax
    cmp eax, 07h
    jl short L70ff7
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 07h
    jb near ptr L75fe8
L70fd5::
    and eax, 07fh
    add edx, eax
    cmp eax, 07fh
    jl short L70ff7
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 0ch
    jb near ptr L75ff4
L70ff0::
    and eax, 0fffh
    add edx, eax
L70ff7::
    bswap ecx
    mov cl, byte ptr [L77197]
    mov ebx, edx
    shl ebx, cl
    add dword ptr [L77148], ebx
    bswap ecx
    add edx, dword ptr [L7714c]
    cmp edx, dword ptr [L770bc]
    jae near ptr L74169
    mov dword ptr [L7714c], edx
    shl edx, 02h
    add edx, dword ptr [ebp+014h]
    mov edi, dword ptr [edx]
    cmp edi, 0ffffffffh
    je near ptr L727d1
    cmp edi, 0fffffffeh
    je near ptr L74169
    shld ebx, edi, 010h
    cmp di, 0b4f2h
    ja near ptr L727e2
    cmp bx, word ptr [L7708c]
    jne near ptr L7418c
L71059::
    mov word ptr [L7708c], bx
    mov dword ptr [L770a8], edi
    and edi, 0ffffh
    or edi, dword ptr [L770b8]
L71072::
    mov dword ptr [L770c4], 00h
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb near ptr L76000
L71089::
    test al, 01h
    jne near ptr L71452
L71091::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb near ptr L7600c
L7109e::
    and eax, 01h
    jne short L710aa
    mov al, byte ptr [L77150]
    jmp short L710ce
L710aa::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb near ptr L76018
L710b7::
    and eax, 01h
    mov al, byte ptr [L77150]
    je short L710c3
    inc al
L710c3::
    sub al, 02h
    sbb al, 00h
    and al, 03h
    mov byte ptr [L77150], al
L710ce::
    or al, al
    je near ptr L71165
    test al, 02h
    jne short L710fc
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L77194]
    jb near ptr L76024
L710ee::
    and eax, dword ptr [L77190]
    mov edx, dword ptr [L770ac]
    jmp short L7111c
L710fc::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L77196]
    jb near ptr L76030
L71110::
    and eax, dword ptr [L7718c]
    mov edx, dword ptr [L770b4]
L7111c::
    shl eax, 03h
    add edx, eax
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 011h
    jae short L71134
    add esi, 04h
    or cl, 0e0h
L71134::
    and eax, 01ffffh
    mov ebx, dword ptr [edx-02h]
    mov dword ptr [L7709c], ecx
    mov ecx, dword ptr [edx]
    mov bx, cx
    mov dword ptr [L770a0], ebp
    mov dword ptr [L77098], esi
    mov esi, dword ptr [edx+02h]
    mov cx, si
    mov ebp, dword ptr [edx+04h]
    mov si, bp
    mov bp, word ptr [edx+06h]
    jmp short L711cc
L71165::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L77195]
    jb near ptr L7603c
L71179::
    and eax, dword ptr [L77188]
    mov edx, dword ptr [L77148]
    shl eax, 03h
    add edx, eax
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 011h
    jae short L7119d
    add esi, 04h
    or cl, 0e0h
L7119d::
    and eax, 01ffffh
    mov ebx, dword ptr [edx-02h]
    mov dword ptr [L7709c], ecx
    mov ecx, dword ptr [edx]
    mov bx, cx
    mov dword ptr [L770a0], ebp
    mov dword ptr [L77098], esi
    mov esi, dword ptr [edx+02h]
    mov cx, si
    mov ebp, dword ptr [edx+04h]
    mov si, bp
    mov bp, word ptr [edx+06h]
L711cc::
    or dword ptr [L770c4], eax
    test al, al
    je near ptr L712eb
    test al, 01h
    je near ptr L712b7
L711e2::
    mov dword ptr [edi], ebx
    mov dword ptr [edi+04h], ecx
    mov dword ptr [edi+0a00h], esi
    mov dword ptr [edi+0a04h], ebp
    test al, 02h
    je near ptr L712bf
L711fb::
    mov dword ptr [edi+08h], ebx
    mov dword ptr [edi+0ch], ecx
    mov dword ptr [edi+0a08h], esi
    mov dword ptr [edi+0a0ch], ebp
    test al, 010h
    je near ptr L712c7
L71215::
    mov dword ptr [edi+010h], ebx
    mov dword ptr [edi+014h], ecx
    mov dword ptr [edi+0a10h], esi
    mov dword ptr [edi+0a14h], ebp
    test al, 020h
    je near ptr L712cf
L7122f::
    mov dword ptr [edi+018h], ebx
    mov dword ptr [edi+01ch], ecx
    mov dword ptr [edi+0a18h], esi
    mov dword ptr [edi+0a1ch], ebp
    test al, 04h
    je near ptr L712d7
L71249::
    mov dword ptr [edi+01400h], ebx
    mov dword ptr [edi+01404h], ecx
    mov dword ptr [edi+01e00h], esi
    mov dword ptr [edi+01e04h], ebp
    test al, 08h
    je short L712df
L71265::
    mov dword ptr [edi+01408h], ebx
    mov dword ptr [edi+0140ch], ecx
    mov dword ptr [edi+01e08h], esi
    mov dword ptr [edi+01e0ch], ebp
    test al, 040h
    je short L712e3
L71281::
    mov dword ptr [edi+01410h], ebx
    mov dword ptr [edi+01414h], ecx
    mov dword ptr [edi+01e10h], esi
    mov dword ptr [edi+01e14h], ebp
    test al, 080h
    je short L712e7
L7129d::
    mov dword ptr [edi+01418h], ebx
    mov dword ptr [edi+0141ch], ecx
    mov dword ptr [edi+01e18h], esi
    mov dword ptr [edi+01e1ch], ebp
    jmp short L712eb
L712b7::
    test al, 01h
    jne near ptr L711e2
L712bf::
    test al, 02h
    jne near ptr L711fb
L712c7::
    test al, 010h
    jne near ptr L71215
L712cf::
    test al, 020h
    jne near ptr L7122f
L712d7::
    test al, 04h
    jne near ptr L71249
L712df::
    test al, 08h
    jne short L71265
L712e3::
    test al, 040h
    jne short L71281
L712e7::
    test al, 080h
    jne short L7129d
L712eb::
    test ah, ah
    je near ptr L71435
    test ah, 01h
    je near ptr L713f5
L712fc::
    mov dword ptr [edi+02800h], ebx
    mov dword ptr [edi+02804h], ecx
    mov dword ptr [edi+03200h], esi
    mov dword ptr [edi+03204h], ebp
    test ah, 02h
    je near ptr L713fe
L7131d::
    mov dword ptr [edi+02808h], ebx
    mov dword ptr [edi+0280ch], ecx
    mov dword ptr [edi+03208h], esi
    mov dword ptr [edi+0320ch], ebp
    test ah, 010h
    je near ptr L71407
L7133e::
    mov dword ptr [edi+02810h], ebx
    mov dword ptr [edi+02814h], ecx
    mov dword ptr [edi+03210h], esi
    mov dword ptr [edi+03214h], ebp
    test ah, 020h
    je near ptr L71410
L7135f::
    mov dword ptr [edi+02818h], ebx
    mov dword ptr [edi+0281ch], ecx
    mov dword ptr [edi+03218h], esi
    mov dword ptr [edi+0321ch], ebp
    test ah, 04h
    je near ptr L71419
L71380::
    mov dword ptr [edi+03c00h], ebx
    mov dword ptr [edi+03c04h], ecx
    mov dword ptr [edi+04600h], esi
    mov dword ptr [edi+04604h], ebp
    test ah, 08h
    je near ptr L71422
L713a1::
    mov dword ptr [edi+03c08h], ebx
    mov dword ptr [edi+03c0ch], ecx
    mov dword ptr [edi+04608h], esi
    mov dword ptr [edi+0460ch], ebp
    test ah, 040h
    je short L7142b
L713be::
    mov dword ptr [edi+03c10h], ebx
    mov dword ptr [edi+03c14h], ecx
    mov dword ptr [edi+04610h], esi
    mov dword ptr [edi+04614h], ebp
    test ah, 080h
    je short L71430
L713db::
    mov dword ptr [edi+03c18h], ebx
    mov dword ptr [edi+03c1ch], ecx
    mov dword ptr [edi+04618h], esi
    mov dword ptr [edi+0461ch], ebp
    jmp short L71435
L713f5::
    test ah, 01h
    jne near ptr L712fc
L713fe::
    test ah, 02h
    jne near ptr L7131d
L71407::
    test ah, 010h
    jne near ptr L7133e
L71410::
    test ah, 020h
    jne near ptr L7135f
L71419::
    test ah, 04h
    jne near ptr L71380
L71422::
    test ah, 08h
    jne near ptr L713a1
L7142b::
    test ah, 040h
    jne short L713be
L71430::
    test ah, 080h
    jne short L713db
L71435::
    mov esi, dword ptr [L77098]
    mov ecx, dword ptr [L7709c]
    mov ebp, dword ptr [L770a0]
    and eax, 010000h
    je near ptr L71091
L71452::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb near ptr L76048
L7145f::
    test al, 01h
    jne near ptr L7264b
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 04h
    jb near ptr L76054
L71478::
    and eax, 0fh
    jmp dword ptr [eax*4+L71482]
Func70d17_ endp
L71482 label byte
    dd offset Func714c2_
    dd offset L714e0
    dd offset L71501
    dd offset L71525
    dd offset L71545
    dd offset L71567
    dd offset L7158e
    dd offset L715b1
    dd offset L715d5
    dd offset L715f4
    dd offset L71618
    dd offset L7163e
    dd offset L7165e
    dd offset L71679
    dd offset L7169a
    dd offset L716b8
Func714c2_ proc near
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 010h
    jae short L714d5
    add esi, 04h
    or cl, 0e0h
L714d5::
    xor dword ptr [L770c4], eax
    jmp near ptr L716be
L714e0::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 0ch
    jb near ptr L76060
L714f1::
    shl eax, 04h
    or al, 0fh
    xor dword ptr [L770c4], eax
    jmp near ptr L716be
L71501::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 0ch
    jb near ptr L7606c
L71512::
    shl eax, 04h
    shr al, 04h
    or al, 0f0h
    xor dword ptr [L770c4], eax
    jmp near ptr L716be
L71525::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 08h
    jb near ptr L76078
L71536::
    mov ah, al
    mov al, 0ffh
    xor dword ptr [L770c4], eax
    jmp near ptr L716be
L71545::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 0ch
    jb near ptr L76084
L71556::
    shl ah, 04h
    or ah, 0fh
    xor dword ptr [L770c4], eax
    jmp near ptr L716be
L71567::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 08h
    jb near ptr L76090
L71578::
    shl eax, 04h
    shl ah, 04h
    or eax, 0f0fh
    xor dword ptr [L770c4], eax
    jmp near ptr L716be
L7158e::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 08h
    jb near ptr L7609c
L7159f::
    mov ah, al
    or eax, 0ff0h
    xor dword ptr [L770c4], eax
    jmp near ptr L716be
L715b1::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 04h
    jb near ptr L760a8
L715c2::
    shl eax, 0ch
    or eax, 0fffh
    xor dword ptr [L770c4], eax
    jmp near ptr L716be
L715d5::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 0ch
    jb near ptr L760b4
L715e6::
    or ah, 0f0h
    xor dword ptr [L770c4], eax
    jmp near ptr L716be
L715f4::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 08h
    jb near ptr L760c0
L71605::
    shl eax, 04h
    or eax, 0f00fh
    xor dword ptr [L770c4], eax
    jmp near ptr L716be
L71618::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 08h
    jb near ptr L760cc
L71629::
    mov ah, al
    ror ah, 04h
    or eax, 0f0f0h
    xor dword ptr [L770c4], eax
    jmp near ptr L716be
L7163e::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 04h
    jb near ptr L760d8
L7164f::
    mov ah, al
    or eax, 0f0ffh
    xor dword ptr [L770c4], eax
    jmp short L716be
L7165e::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 08h
    jb near ptr L760e4
L7166f::
    mov ah, 0ffh
    xor dword ptr [L770c4], eax
    jmp short L716be
L71679::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 04h
    jb near ptr L760f0
L7168a::
    or eax, 0fff0h
    rol al, 04h
    xor dword ptr [L770c4], eax
    jmp short L716be
L7169a::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 04h
    jb near ptr L760fc
L716ab::
    or eax, 0fff0h
    xor dword ptr [L770c4], eax
    jmp short L716be
L716b8::
    not dword ptr [L770c4]
L716be::
    test byte ptr [L770c4], 0ffh
    je near ptr L71e74
    test byte ptr [L770c4], 01h
    je near ptr L71e0c
L716d8::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb near ptr L76108
L716e5::
    and eax, 01h
    jne short L716f1
    mov al, byte ptr [L77150]
    jmp short L71715
L716f1::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb near ptr L76114
L716fe::
    and eax, 01h
    mov al, byte ptr [L77150]
    je short L7170a
    inc al
L7170a::
    sub al, 02h
    sbb al, 00h
    and al, 03h
    mov byte ptr [L77150], al
L71715::
    or al, al
    je short L71761
    test al, 02h
    jne short L7173f
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L77194]
    jb near ptr L76120
L71731::
    and eax, dword ptr [L77190]
    mov edx, dword ptr [L770ac]
    jmp short L71781
L7173f::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L77196]
    jb near ptr L7612c
L71753::
    and eax, dword ptr [L7718c]
    mov edx, dword ptr [L770b4]
    jmp short L71781
L71761::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L77195]
    jb near ptr L76138
L71775::
    and eax, dword ptr [L77188]
    mov edx, dword ptr [L77148]
L71781::
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
    test byte ptr [L770c4], 02h
    je near ptr L71e19
L717bc::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb near ptr L76144
L717c9::
    and eax, 01h
    jne short L717d5
    mov al, byte ptr [L77150]
    jmp short L717f9
L717d5::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb near ptr L76150
L717e2::
    and eax, 01h
    mov al, byte ptr [L77150]
    je short L717ee
    inc al
L717ee::
    sub al, 02h
    sbb al, 00h
    and al, 03h
    mov byte ptr [L77150], al
L717f9::
    or al, al
    je short L71845
    test al, 02h
    jne short L71823
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L77194]
    jb near ptr L7615c
L71815::
    and eax, dword ptr [L77190]
    mov edx, dword ptr [L770ac]
    jmp short L71865
L71823::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L77196]
    jb near ptr L76168
L71837::
    and eax, dword ptr [L7718c]
    mov edx, dword ptr [L770b4]
    jmp short L71865
L71845::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L77195]
    jb near ptr L76174
L71859::
    and eax, dword ptr [L77188]
    mov edx, dword ptr [L77148]
L71865::
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
    test byte ptr [L770c4], 010h
    je near ptr L71e26
L718a1::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb near ptr L76180
L718ae::
    and eax, 01h
    jne short L718ba
    mov al, byte ptr [L77150]
    jmp short L718de
L718ba::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb near ptr L7618c
L718c7::
    and eax, 01h
    mov al, byte ptr [L77150]
    je short L718d3
    inc al
L718d3::
    sub al, 02h
    sbb al, 00h
    and al, 03h
    mov byte ptr [L77150], al
L718de::
    or al, al
    je short L7192a
    test al, 02h
    jne short L71908
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L77194]
    jb near ptr L76198
L718fa::
    and eax, dword ptr [L77190]
    mov edx, dword ptr [L770ac]
    jmp short L7194a
L71908::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L77196]
    jb near ptr L761a4
L7191c::
    and eax, dword ptr [L7718c]
    mov edx, dword ptr [L770b4]
    jmp short L7194a
L7192a::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L77195]
    jb near ptr L761b0
L7193e::
    and eax, dword ptr [L77188]
    mov edx, dword ptr [L77148]
L7194a::
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
    test byte ptr [L770c4], 020h
    je near ptr L71e33
L71986::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb near ptr L761bc
L71993::
    and eax, 01h
    jne short L7199f
    mov al, byte ptr [L77150]
    jmp short L719c3
L7199f::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb near ptr L761c8
L719ac::
    and eax, 01h
    mov al, byte ptr [L77150]
    je short L719b8
    inc al
L719b8::
    sub al, 02h
    sbb al, 00h
    and al, 03h
    mov byte ptr [L77150], al
L719c3::
    or al, al
    je short L71a0f
    test al, 02h
    jne short L719ed
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L77194]
    jb near ptr L761d4
L719df::
    and eax, dword ptr [L77190]
    mov edx, dword ptr [L770ac]
    jmp short L71a2f
L719ed::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L77196]
    jb near ptr L761e0
L71a01::
    and eax, dword ptr [L7718c]
    mov edx, dword ptr [L770b4]
    jmp short L71a2f
L71a0f::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L77195]
    jb near ptr L761ec
L71a23::
    and eax, dword ptr [L77188]
    mov edx, dword ptr [L77148]
L71a2f::
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
    test byte ptr [L770c4], 04h
    je near ptr L71e40
L71a6b::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb near ptr L761f8
L71a78::
    and eax, 01h
    jne short L71a84
    mov al, byte ptr [L77150]
    jmp short L71aa8
L71a84::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb near ptr L76204
L71a91::
    and eax, 01h
    mov al, byte ptr [L77150]
    je short L71a9d
    inc al
L71a9d::
    sub al, 02h
    sbb al, 00h
    and al, 03h
    mov byte ptr [L77150], al
L71aa8::
    or al, al
    je short L71af4
    test al, 02h
    jne short L71ad2
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L77194]
    jb near ptr L76210
L71ac4::
    and eax, dword ptr [L77190]
    mov edx, dword ptr [L770ac]
    jmp short L71b14
L71ad2::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L77196]
    jb near ptr L7621c
L71ae6::
    and eax, dword ptr [L7718c]
    mov edx, dword ptr [L770b4]
    jmp short L71b14
L71af4::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L77195]
    jb near ptr L76228
L71b08::
    and eax, dword ptr [L77188]
    mov edx, dword ptr [L77148]
L71b14::
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
    test byte ptr [L770c4], 08h
    je near ptr L71e4d
L71b56::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb near ptr L76234
L71b63::
    and eax, 01h
    jne short L71b6f
    mov al, byte ptr [L77150]
    jmp short L71b93
L71b6f::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb near ptr L76240
L71b7c::
    and eax, 01h
    mov al, byte ptr [L77150]
    je short L71b88
    inc al
L71b88::
    sub al, 02h
    sbb al, 00h
    and al, 03h
    mov byte ptr [L77150], al
L71b93::
    or al, al
    je short L71bdf
    test al, 02h
    jne short L71bbd
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L77194]
    jb near ptr L7624c
L71baf::
    and eax, dword ptr [L77190]
    mov edx, dword ptr [L770ac]
    jmp short L71bff
L71bbd::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L77196]
    jb near ptr L76258
L71bd1::
    and eax, dword ptr [L7718c]
    mov edx, dword ptr [L770b4]
    jmp short L71bff
L71bdf::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L77195]
    jb near ptr L76264
L71bf3::
    and eax, dword ptr [L77188]
    mov edx, dword ptr [L77148]
L71bff::
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
    test byte ptr [L770c4], 040h
    je near ptr L71e5a
L71c41::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb near ptr L76270
L71c4e::
    and eax, 01h
    jne short L71c5a
    mov al, byte ptr [L77150]
    jmp short L71c7e
L71c5a::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb near ptr L7627c
L71c67::
    and eax, 01h
    mov al, byte ptr [L77150]
    je short L71c73
    inc al
L71c73::
    sub al, 02h
    sbb al, 00h
    and al, 03h
    mov byte ptr [L77150], al
L71c7e::
    or al, al
    je short L71cca
    test al, 02h
    jne short L71ca8
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L77194]
    jb near ptr L76288
L71c9a::
    and eax, dword ptr [L77190]
    mov edx, dword ptr [L770ac]
    jmp short L71cea
L71ca8::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L77196]
    jb near ptr L76294
L71cbc::
    and eax, dword ptr [L7718c]
    mov edx, dword ptr [L770b4]
    jmp short L71cea
L71cca::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L77195]
    jb near ptr L762a0
L71cde::
    and eax, dword ptr [L77188]
    mov edx, dword ptr [L77148]
L71cea::
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
    test byte ptr [L770c4], 080h
    je near ptr L71e67
L71d2c::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb near ptr L762ac
L71d39::
    and eax, 01h
    jne short L71d45
    mov al, byte ptr [L77150]
    jmp short L71d69
L71d45::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb near ptr L762b8
L71d52::
    and eax, 01h
    mov al, byte ptr [L77150]
    je short L71d5e
    inc al
L71d5e::
    sub al, 02h
    sbb al, 00h
    and al, 03h
    mov byte ptr [L77150], al
L71d69::
    or al, al
    je short L71db5
    test al, 02h
    jne short L71d93
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L77194]
    jb near ptr L762c4
L71d85::
    and eax, dword ptr [L77190]
    mov edx, dword ptr [L770ac]
    jmp short L71dd5
L71d93::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L77196]
    jb near ptr L762d0
L71da7::
    and eax, dword ptr [L7718c]
    mov edx, dword ptr [L770b4]
    jmp short L71dd5
L71db5::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L77195]
    jb near ptr L762dc
L71dc9::
    and eax, dword ptr [L77188]
    mov edx, dword ptr [L77148]
L71dd5::
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
    jmp short L71e74
L71e0c::
    test byte ptr [L770c4], 01h
    jne near ptr L716d8
L71e19::
    test byte ptr [L770c4], 02h
    jne near ptr L717bc
L71e26::
    test byte ptr [L770c4], 010h
    jne near ptr L718a1
L71e33::
    test byte ptr [L770c4], 020h
    jne near ptr L71986
L71e40::
    test byte ptr [L770c4], 04h
    jne near ptr L71a6b
L71e4d::
    test byte ptr [L770c4], 08h
    jne near ptr L71b56
L71e5a::
    test byte ptr [L770c4], 040h
    jne near ptr L71c41
L71e67::
    test byte ptr [L770c4], 080h
    jne near ptr L71d2c
L71e74::
    test byte ptr [L770c5], 0ffh
    je near ptr L727c1
    test byte ptr [L770c5], 01h
    je near ptr L725de
L71e8e::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb near ptr L762e8
L71e9b::
    and eax, 01h
    jne short L71ea7
    mov al, byte ptr [L77150]
    jmp short L71ecb
L71ea7::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb near ptr L762f4
L71eb4::
    and eax, 01h
    mov al, byte ptr [L77150]
    je short L71ec0
    inc al
L71ec0::
    sub al, 02h
    sbb al, 00h
    and al, 03h
    mov byte ptr [L77150], al
L71ecb::
    or al, al
    je short L71f17
    test al, 02h
    jne short L71ef5
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L77194]
    jb near ptr L76300
L71ee7::
    and eax, dword ptr [L77190]
    mov edx, dword ptr [L770ac]
    jmp short L71f37
L71ef5::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L77196]
    jb near ptr L7630c
L71f09::
    and eax, dword ptr [L7718c]
    mov edx, dword ptr [L770b4]
    jmp short L71f37
L71f17::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L77195]
    jb near ptr L76318
L71f2b::
    and eax, dword ptr [L77188]
    mov edx, dword ptr [L77148]
L71f37::
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
    test byte ptr [L770c5], 02h
    je near ptr L725eb
L71f79::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb near ptr L76324
L71f86::
    and eax, 01h
    jne short L71f92
    mov al, byte ptr [L77150]
    jmp short L71fb6
L71f92::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb near ptr L76330
L71f9f::
    and eax, 01h
    mov al, byte ptr [L77150]
    je short L71fab
    inc al
L71fab::
    sub al, 02h
    sbb al, 00h
    and al, 03h
    mov byte ptr [L77150], al
L71fb6::
    or al, al
    je short L72002
    test al, 02h
    jne short L71fe0
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L77194]
    jb near ptr L7633c
L71fd2::
    and eax, dword ptr [L77190]
    mov edx, dword ptr [L770ac]
    jmp short L72022
L71fe0::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L77196]
    jb near ptr L76348
L71ff4::
    and eax, dword ptr [L7718c]
    mov edx, dword ptr [L770b4]
    jmp short L72022
L72002::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L77195]
    jb near ptr L76354
L72016::
    and eax, dword ptr [L77188]
    mov edx, dword ptr [L77148]
L72022::
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
    test byte ptr [L770c5], 010h
    je near ptr L725f8
L72064::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb near ptr L76360
L72071::
    and eax, 01h
    jne short L7207d
    mov al, byte ptr [L77150]
    jmp short L720a1
L7207d::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb near ptr L7636c
L7208a::
    and eax, 01h
    mov al, byte ptr [L77150]
    je short L72096
    inc al
L72096::
    sub al, 02h
    sbb al, 00h
    and al, 03h
    mov byte ptr [L77150], al
L720a1::
    or al, al
    je short L720ed
    test al, 02h
    jne short L720cb
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L77194]
    jb near ptr L76378
L720bd::
    and eax, dword ptr [L77190]
    mov edx, dword ptr [L770ac]
    jmp short L7210d
L720cb::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L77196]
    jb near ptr L76384
L720df::
    and eax, dword ptr [L7718c]
    mov edx, dword ptr [L770b4]
    jmp short L7210d
L720ed::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L77195]
    jb near ptr L76390
L72101::
    and eax, dword ptr [L77188]
    mov edx, dword ptr [L77148]
L7210d::
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
    test byte ptr [L770c5], 020h
    je near ptr L72605
L7214f::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb near ptr L7639c
L7215c::
    and eax, 01h
    jne short L72168
    mov al, byte ptr [L77150]
    jmp short L7218c
L72168::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb near ptr L763a8
L72175::
    and eax, 01h
    mov al, byte ptr [L77150]
    je short L72181
    inc al
L72181::
    sub al, 02h
    sbb al, 00h
    and al, 03h
    mov byte ptr [L77150], al
L7218c::
    or al, al
    je short L721d8
    test al, 02h
    jne short L721b6
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L77194]
    jb near ptr L763b4
L721a8::
    and eax, dword ptr [L77190]
    mov edx, dword ptr [L770ac]
    jmp short L721f8
L721b6::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L77196]
    jb near ptr L763c0
L721ca::
    and eax, dword ptr [L7718c]
    mov edx, dword ptr [L770b4]
    jmp short L721f8
L721d8::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L77195]
    jb near ptr L763cc
L721ec::
    and eax, dword ptr [L77188]
    mov edx, dword ptr [L77148]
L721f8::
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
    test byte ptr [L770c5], 04h
    je near ptr L72612
L7223a::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb near ptr L763d8
L72247::
    and eax, 01h
    jne short L72253
    mov al, byte ptr [L77150]
    jmp short L72277
L72253::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb near ptr L763e4
L72260::
    and eax, 01h
    mov al, byte ptr [L77150]
    je short L7226c
    inc al
L7226c::
    sub al, 02h
    sbb al, 00h
    and al, 03h
    mov byte ptr [L77150], al
L72277::
    or al, al
    je short L722c3
    test al, 02h
    jne short L722a1
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L77194]
    jb near ptr L763f0
L72293::
    and eax, dword ptr [L77190]
    mov edx, dword ptr [L770ac]
    jmp short L722e3
L722a1::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L77196]
    jb near ptr L763fc
L722b5::
    and eax, dword ptr [L7718c]
    mov edx, dword ptr [L770b4]
    jmp short L722e3
L722c3::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L77195]
    jb near ptr L76408
L722d7::
    and eax, dword ptr [L77188]
    mov edx, dword ptr [L77148]
L722e3::
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
    test byte ptr [L770c5], 08h
    je near ptr L7261f
L72325::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb near ptr L76414
L72332::
    and eax, 01h
    jne short L7233e
    mov al, byte ptr [L77150]
    jmp short L72362
L7233e::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb near ptr L76420
L7234b::
    and eax, 01h
    mov al, byte ptr [L77150]
    je short L72357
    inc al
L72357::
    sub al, 02h
    sbb al, 00h
    and al, 03h
    mov byte ptr [L77150], al
L72362::
    or al, al
    je short L723ae
    test al, 02h
    jne short L7238c
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L77194]
    jb near ptr L7642c
L7237e::
    and eax, dword ptr [L77190]
    mov edx, dword ptr [L770ac]
    jmp short L723ce
L7238c::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L77196]
    jb near ptr L76438
L723a0::
    and eax, dword ptr [L7718c]
    mov edx, dword ptr [L770b4]
    jmp short L723ce
L723ae::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L77195]
    jb near ptr L76444
L723c2::
    and eax, dword ptr [L77188]
    mov edx, dword ptr [L77148]
L723ce::
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
    test byte ptr [L770c5], 040h
    je near ptr L7262c
L72410::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb near ptr L76450
L7241d::
    and eax, 01h
    jne short L72429
    mov al, byte ptr [L77150]
    jmp short L7244d
L72429::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb near ptr L7645c
L72436::
    and eax, 01h
    mov al, byte ptr [L77150]
    je short L72442
    inc al
L72442::
    sub al, 02h
    sbb al, 00h
    and al, 03h
    mov byte ptr [L77150], al
L7244d::
    or al, al
    je short L72499
    test al, 02h
    jne short L72477
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L77194]
    jb near ptr L76468
L72469::
    and eax, dword ptr [L77190]
    mov edx, dword ptr [L770ac]
    jmp short L724b9
L72477::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L77196]
    jb near ptr L76474
L7248b::
    and eax, dword ptr [L7718c]
    mov edx, dword ptr [L770b4]
    jmp short L724b9
L72499::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L77195]
    jb near ptr L76480
L724ad::
    and eax, dword ptr [L77188]
    mov edx, dword ptr [L77148]
L724b9::
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
    test byte ptr [L770c5], 080h
    je near ptr L72639
L724fb::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb near ptr L7648c
L72508::
    and eax, 01h
    jne short L72514
    mov al, byte ptr [L77150]
    jmp short L72538
L72514::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb near ptr L76498
L72521::
    and eax, 01h
    mov al, byte ptr [L77150]
    je short L7252d
    inc al
L7252d::
    sub al, 02h
    sbb al, 00h
    and al, 03h
    mov byte ptr [L77150], al
L72538::
    or al, al
    je short L72584
    test al, 02h
    jne short L72562
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L77194]
    jb near ptr L764a4
L72554::
    and eax, dword ptr [L77190]
    mov edx, dword ptr [L770ac]
    jmp short L725a4
L72562::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L77196]
    jb near ptr L764b0
L72576::
    and eax, dword ptr [L7718c]
    mov edx, dword ptr [L770b4]
    jmp short L725a4
L72584::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L77195]
    jb near ptr L764bc
L72598::
    and eax, dword ptr [L77188]
    mov edx, dword ptr [L77148]
L725a4::
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
    jmp near ptr L727c1
L725de::
    test byte ptr [L770c5], 01h
    jne near ptr L71e8e
L725eb::
    test byte ptr [L770c5], 02h
    jne near ptr L71f79
L725f8::
    test byte ptr [L770c5], 010h
    jne near ptr L72064
L72605::
    test byte ptr [L770c5], 020h
    jne near ptr L7214f
L72612::
    test byte ptr [L770c5], 04h
    jne near ptr L7223a
L7261f::
    test byte ptr [L770c5], 08h
    jne near ptr L72325
L7262c::
    test byte ptr [L770c5], 040h
    jne near ptr L72410
L72639::
    test byte ptr [L770c5], 080h
    jne near ptr L724fb
    jmp near ptr L727c1
L7264b::
    test dword ptr [L77154], 010000h
    jne near ptr L727ac
    jmp near ptr L727c1
L72660::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb near ptr L764c8
L7266d::
    and eax, 01h
    jne short L72679
    mov al, byte ptr [L77150]
    jmp short L7269d
L72679::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb near ptr L764d4
L72686::
    and eax, 01h
    mov al, byte ptr [L77150]
    je short L72692
    inc al
L72692::
    sub al, 02h
    sbb al, 00h
    and al, 03h
    mov byte ptr [L77150], al
L7269d::
    or al, al
    je near ptr L72730
    test al, 02h
    jne short L726cb
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L77194]
    jb near ptr L764e0
L726bd::
    and eax, dword ptr [L77190]
    mov edx, dword ptr [L770ac]
    jmp short L726eb
L726cb::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L77196]
    jb near ptr L764ec
L726df::
    and eax, dword ptr [L7718c]
    mov edx, dword ptr [L770b4]
L726eb::
    shl eax, 03h
    add edx, eax
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 04h
    jb near ptr L764f8
L72701::
    and eax, 0fh
    mov ebx, dword ptr [edx-02h]
    mov dword ptr [L7709c], ecx
    mov ecx, dword ptr [edx]
    mov bx, cx
    mov dword ptr [L770a0], ebp
    mov dword ptr [L77098], esi
    mov esi, dword ptr [edx+02h]
    mov cx, si
    mov ebp, dword ptr [edx+04h]
    mov si, bp
    mov bp, word ptr [edx+06h]
    jmp short L72793
L72730::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L77195]
    jb near ptr L76504
L72744::
    and eax, dword ptr [L77188]
    mov edx, dword ptr [L77148]
    shl eax, 03h
    add edx, eax
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 04h
    jb near ptr L76510
L72766::
    and eax, 0fh
    mov ebx, dword ptr [edx-02h]
    mov dword ptr [L7709c], ecx
    mov ecx, dword ptr [edx]
    mov bx, cx
    mov dword ptr [L770a0], ebp
    mov dword ptr [L77098], esi
    mov esi, dword ptr [edx+02h]
    mov cx, si
    mov ebp, dword ptr [edx+04h]
    mov si, bp
    mov bp, word ptr [edx+06h]
L72793::
    call dword ptr [eax*4+L70c57]
    mov esi, dword ptr [L77098]
    mov ecx, dword ptr [L7709c]
    mov ebp, dword ptr [L770a0]
L727ac::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb near ptr L7651c
L727b9::
    test al, 01h
    je near ptr L72660
L727c1::
    mov edx, 01h
    mov edi, dword ptr [L770a8]
    jmp near ptr L70f64
L727d1::
    mov dword ptr [L770a8], edi
    lea edi, [L77198]
    jmp near ptr L71072
L727e2::
    cmp bx, word ptr [L7708c]
    jne near ptr L75dd0
L727ef::
    cmp dword ptr [L77158], 00h
    jne short L72834
    mov eax, dword ptr [L77170]
    mov dword ptr [L77158], eax
    mov eax, dword ptr [L77174]
    mov dword ptr [L7715c], eax
    mov eax, dword ptr [L77178]
    mov dword ptr [L77160], eax
    mov al, byte ptr [L77184]
    mov byte ptr [L7716c], al
    mov eax, dword ptr [L77180]
    mov dword ptr [L77168], eax
    mov eax, dword ptr [L7717c]
    mov dword ptr [L77164], eax
L72834::
    mov dword ptr [L770a8], edi
    and edi, 0ffffh
    or edi, dword ptr [L770b8]
    mov dword ptr [L770c4], 00h
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb near ptr L76528
L7285d::
    test al, 01h
    jne near ptr L72d14
L72865::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb near ptr L76534
L72872::
    and eax, 01h
    jne short L7287e
    mov al, byte ptr [L77150]
    jmp short L728a2
L7287e::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb near ptr L76540
L7288b::
    and eax, 01h
    mov al, byte ptr [L77150]
    je short L72897
    inc al
L72897::
    sub al, 02h
    sbb al, 00h
    and al, 03h
    mov byte ptr [L77150], al
L728a2::
    or al, al
    je near ptr L72939
    test al, 02h
    jne short L728d0
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L77194]
    jb near ptr L7654c
L728c2::
    and eax, dword ptr [L77190]
    mov edx, dword ptr [L770ac]
    jmp short L728f0
L728d0::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L77196]
    jb near ptr L76558
L728e4::
    and eax, dword ptr [L7718c]
    mov edx, dword ptr [L770b4]
L728f0::
    shl eax, 03h
    add edx, eax
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 011h
    jae short L72908
    add esi, 04h
    or cl, 0e0h
L72908::
    and eax, 01ffffh
    mov ebx, dword ptr [edx-02h]
    mov dword ptr [L7709c], ecx
    mov ecx, dword ptr [edx]
    mov bx, cx
    mov dword ptr [L770a0], ebp
    mov dword ptr [L77098], esi
    mov esi, dword ptr [edx+02h]
    mov cx, si
    mov ebp, dword ptr [edx+04h]
    mov si, bp
    mov bp, word ptr [edx+06h]
    jmp short L729a0
L72939::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L77195]
    jb near ptr L76564
L7294d::
    and eax, dword ptr [L77188]
    mov edx, dword ptr [L77148]
    shl eax, 03h
    add edx, eax
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 011h
    jae short L72971
    add esi, 04h
    or cl, 0e0h
L72971::
    and eax, 01ffffh
    mov ebx, dword ptr [edx-02h]
    mov dword ptr [L7709c], ecx
    mov ecx, dword ptr [edx]
    mov bx, cx
    mov dword ptr [L770a0], ebp
    mov dword ptr [L77098], esi
    mov esi, dword ptr [edx+02h]
    mov cx, si
    mov ebp, dword ptr [edx+04h]
    mov si, bp
    mov bp, word ptr [edx+06h]
L729a0::
    or dword ptr [L770c4], eax
    test al, al
    je near ptr L72b35
    test al, 01h
    je near ptr L72af9
L729b6::
    mov dword ptr [edi], ebx
    mov dword ptr [edi+04h], ecx
    cmp di, 0f600h
    jae short L729ce
    mov dword ptr [edi+0a00h], esi
    mov dword ptr [edi+0a04h], ebp
L729ce::
    test al, 02h
    je near ptr L72b01
L729d6::
    cmp di, 0fff8h
    jae short L729f5
    mov dword ptr [edi+08h], ebx
    mov dword ptr [edi+0ch], ecx
    cmp di, 0f5f8h
    jae short L729f5
    mov dword ptr [edi+0a08h], esi
    mov dword ptr [edi+0a0ch], ebp
L729f5::
    test al, 010h
    je near ptr L72b09
L729fd::
    cmp di, 0fff0h
    jae short L72a1c
    mov dword ptr [edi+010h], ebx
    mov dword ptr [edi+014h], ecx
    cmp di, 0f5f0h
    jae short L72a1c
    mov dword ptr [edi+0a10h], esi
    mov dword ptr [edi+0a14h], ebp
L72a1c::
    test al, 020h
    je near ptr L72b11
L72a24::
    cmp di, 0ffe8h
    jae short L72a43
    mov dword ptr [edi+018h], ebx
    mov dword ptr [edi+01ch], ecx
    cmp di, 0f5e8h
    jae short L72a43
    mov dword ptr [edi+0a18h], esi
    mov dword ptr [edi+0a1ch], ebp
L72a43::
    test al, 04h
    je near ptr L72b19
L72a4b::
    cmp di, 0ec00h
    jae short L72a71
    mov dword ptr [edi+01400h], ebx
    mov dword ptr [edi+01404h], ecx
    cmp di, 0e200h
    jae short L72a71
    mov dword ptr [edi+01e00h], esi
    mov dword ptr [edi+01e04h], ebp
L72a71::
    test al, 08h
    je near ptr L72b21
L72a79::
    cmp di, 0ebf8h
    jae short L72a9f
    mov dword ptr [edi+01408h], ebx
    mov dword ptr [edi+0140ch], ecx
    cmp di, 0e1f8h
    jae short L72a9f
    mov dword ptr [edi+01e08h], esi
    mov dword ptr [edi+01e0ch], ebp
L72a9f::
    test al, 040h
    je near ptr L72b29
L72aa7::
    cmp di, 0ebf0h
    jae short L72acd
    mov dword ptr [edi+01410h], ebx
    mov dword ptr [edi+01414h], ecx
    cmp di, 0e1f0h
    jae short L72acd
    mov dword ptr [edi+01e10h], esi
    mov dword ptr [edi+01e14h], ebp
L72acd::
    test al, 080h
    je short L72b31
L72ad1::
    cmp di, 0ebe8h
    jae short L72af7
    mov dword ptr [edi+01418h], ebx
    mov dword ptr [edi+0141ch], ecx
    cmp di, 0e1e8h
    jae short L72af7
    mov dword ptr [edi+01e18h], esi
    mov dword ptr [edi+01e1ch], ebp
L72af7::
    jmp short L72b35
L72af9::
    test al, 01h
    jne near ptr L729b6
L72b01::
    test al, 02h
    jne near ptr L729d6
L72b09::
    test al, 010h
    jne near ptr L729fd
L72b11::
    test al, 020h
    jne near ptr L72a24
L72b19::
    test al, 04h
    jne near ptr L72a4b
L72b21::
    test al, 08h
    jne near ptr L72a79
L72b29::
    test al, 040h
    jne near ptr L72aa7
L72b31::
    test al, 080h
    jne short L72ad1
L72b35::
    test ah, ah
    je near ptr L72cf7
    test ah, 01h
    je near ptr L72cb3
L72b46::
    cmp di, 0d800h
    jae short L72b6c
    mov dword ptr [edi+02800h], ebx
    mov dword ptr [edi+02804h], ecx
    cmp di, 0ce00h
    jae short L72b6c
    mov dword ptr [edi+03200h], esi
    mov dword ptr [edi+03204h], ebp
L72b6c::
    test ah, 02h
    je near ptr L72cbc
L72b75::
    cmp di, 0d7f8h
    jae short L72b9b
    mov dword ptr [edi+02808h], ebx
    mov dword ptr [edi+0280ch], ecx
    cmp di, 0cdf8h
    jae short L72b9b
    mov dword ptr [edi+03208h], esi
    mov dword ptr [edi+0320ch], ebp
L72b9b::
    test ah, 010h
    je near ptr L72cc5
L72ba4::
    cmp di, 0d7f0h
    jae short L72bca
    mov dword ptr [edi+02810h], ebx
    mov dword ptr [edi+02814h], ecx
    cmp di, 0cdf0h
    jae short L72bca
    mov dword ptr [edi+03210h], esi
    mov dword ptr [edi+03214h], ebp
L72bca::
    test ah, 020h
    je near ptr L72cce
L72bd3::
    cmp di, 0d7e8h
    jae short L72bf9
    mov dword ptr [edi+02818h], ebx
    mov dword ptr [edi+0281ch], ecx
    cmp di, 0cde8h
    jae short L72bf9
    mov dword ptr [edi+03218h], esi
    mov dword ptr [edi+0321ch], ebp
L72bf9::
    test ah, 04h
    je near ptr L72cd7
L72c02::
    cmp di, 0c400h
    jae short L72c28
    mov dword ptr [edi+03c00h], ebx
    mov dword ptr [edi+03c04h], ecx
    cmp di, 0ba00h
    jae short L72c28
    mov dword ptr [edi+04600h], esi
    mov dword ptr [edi+04604h], ebp
L72c28::
    test ah, 08h
    je near ptr L72ce0
L72c31::
    cmp di, 0c3f8h
    jae short L72c57
    mov dword ptr [edi+03c08h], ebx
    mov dword ptr [edi+03c0ch], ecx
    cmp di, 0b9f8h
    jae short L72c57
    mov dword ptr [edi+04608h], esi
    mov dword ptr [edi+0460ch], ebp
L72c57::
    test ah, 040h
    je near ptr L72ce9
L72c60::
    cmp di, 0c3f0h
    jae short L72c86
    mov dword ptr [edi+03c10h], ebx
    mov dword ptr [edi+03c14h], ecx
    cmp di, 0b9f0h
    jae short L72c86
    mov dword ptr [edi+04610h], esi
    mov dword ptr [edi+04614h], ebp
L72c86::
    test ah, 080h
    je short L72cf2
L72c8b::
    cmp di, 0c3e8h
    jae short L72cb1
    mov dword ptr [edi+03c18h], ebx
    mov dword ptr [edi+03c1ch], ecx
    cmp di, 0b9e8h
    jae short L72cb1
    mov dword ptr [edi+04618h], esi
    mov dword ptr [edi+0461ch], ebp
L72cb1::
    jmp short L72cf7
L72cb3::
    test ah, 01h
    jne near ptr L72b46
L72cbc::
    test ah, 02h
    jne near ptr L72b75
L72cc5::
    test ah, 010h
    jne near ptr L72ba4
L72cce::
    test ah, 020h
    jne near ptr L72bd3
L72cd7::
    test ah, 04h
    jne near ptr L72c02
L72ce0::
    test ah, 08h
    jne near ptr L72c31
L72ce9::
    test ah, 040h
    jne near ptr L72c60
L72cf2::
    test ah, 080h
    jne short L72c8b
L72cf7::
    mov esi, dword ptr [L77098]
    mov ecx, dword ptr [L7709c]
    mov ebp, dword ptr [L770a0]
    and eax, 010000h
    je near ptr L72865
L72d14::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb near ptr L76570
L72d21::
    test al, 01h
    jne near ptr L73fe3
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 04h
    jb near ptr L7657c
L72d3a::
    and eax, 0fh
    jmp dword ptr [eax*4+L72d44]
Func714c2_ endp
L72d44 label byte
    dd offset Func72d84_
    dd offset L72da2
    dd offset L72dc3
    dd offset L72de7
    dd offset L72e07
    dd offset L72e29
    dd offset L72e50
    dd offset L72e73
    dd offset L72e97
    dd offset L72eb6
    dd offset L72eda
    dd offset L72f00
    dd offset L72f20
    dd offset L72f3b
    dd offset L72f5c
    dd offset L72f7a
Func72d84_ proc near
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 010h
    jae short L72d97
    add esi, 04h
    or cl, 0e0h
L72d97::
    xor dword ptr [L770c4], eax
    jmp near ptr L72f80
L72da2::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 0ch
    jb near ptr L76588
L72db3::
    shl eax, 04h
    or al, 0fh
    xor dword ptr [L770c4], eax
    jmp near ptr L72f80
L72dc3::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 0ch
    jb near ptr L76594
L72dd4::
    shl eax, 04h
    shr al, 04h
    or al, 0f0h
    xor dword ptr [L770c4], eax
    jmp near ptr L72f80
L72de7::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 08h
    jb near ptr L765a0
L72df8::
    mov ah, al
    mov al, 0ffh
    xor dword ptr [L770c4], eax
    jmp near ptr L72f80
L72e07::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 0ch
    jb near ptr L765ac
L72e18::
    shl ah, 04h
    or ah, 0fh
    xor dword ptr [L770c4], eax
    jmp near ptr L72f80
L72e29::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 08h
    jb near ptr L765b8
L72e3a::
    shl eax, 04h
    shl ah, 04h
    or eax, 0f0fh
    xor dword ptr [L770c4], eax
    jmp near ptr L72f80
L72e50::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 08h
    jb near ptr L765c4
L72e61::
    mov ah, al
    or eax, 0ff0h
    xor dword ptr [L770c4], eax
    jmp near ptr L72f80
L72e73::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 04h
    jb near ptr L765d0
L72e84::
    shl eax, 0ch
    or eax, 0fffh
    xor dword ptr [L770c4], eax
    jmp near ptr L72f80
L72e97::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 0ch
    jb near ptr L765dc
L72ea8::
    or ah, 0f0h
    xor dword ptr [L770c4], eax
    jmp near ptr L72f80
L72eb6::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 08h
    jb near ptr L765e8
L72ec7::
    shl eax, 04h
    or eax, 0f00fh
    xor dword ptr [L770c4], eax
    jmp near ptr L72f80
L72eda::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 08h
    jb near ptr L765f4
L72eeb::
    mov ah, al
    ror ah, 04h
    or eax, 0f0f0h
    xor dword ptr [L770c4], eax
    jmp near ptr L72f80
L72f00::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 04h
    jb near ptr L76600
L72f11::
    mov ah, al
    or eax, 0f0ffh
    xor dword ptr [L770c4], eax
    jmp short L72f80
L72f20::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 08h
    jb near ptr L7660c
L72f31::
    mov ah, 0ffh
    xor dword ptr [L770c4], eax
    jmp short L72f80
L72f3b::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 04h
    jb near ptr L76618
L72f4c::
    or eax, 0fff0h
    rol al, 04h
    xor dword ptr [L770c4], eax
    jmp short L72f80
L72f5c::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 04h
    jb near ptr L76624
L72f6d::
    or eax, 0fff0h
    xor dword ptr [L770c4], eax
    jmp short L72f80
L72f7a::
    not dword ptr [L770c4]
L72f80::
    test byte ptr [L770c4], 0ffh
    je near ptr L7379c
    test byte ptr [L770c4], 01h
    je near ptr L73734
L72f9a::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb near ptr L76630
L72fa7::
    and eax, 01h
    jne short L72fb3
    mov al, byte ptr [L77150]
    jmp short L72fd7
L72fb3::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb near ptr L7663c
L72fc0::
    and eax, 01h
    mov al, byte ptr [L77150]
    je short L72fcc
    inc al
L72fcc::
    sub al, 02h
    sbb al, 00h
    and al, 03h
    mov byte ptr [L77150], al
L72fd7::
    or al, al
    je short L73023
    test al, 02h
    jne short L73001
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L77194]
    jb near ptr L76648
L72ff3::
    and eax, dword ptr [L77190]
    mov edx, dword ptr [L770ac]
    jmp short L73043
L73001::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L77196]
    jb near ptr L76654
L73015::
    and eax, dword ptr [L7718c]
    mov edx, dword ptr [L770b4]
    jmp short L73043
L73023::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L77195]
    jb near ptr L76660
L73037::
    and eax, dword ptr [L77188]
    mov edx, dword ptr [L77148]
L73043::
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
    jae short L73078
    mov eax, dword ptr [edx+04h]
    mov bx, ax
    mov ax, word ptr [edx+06h]
    mov dword ptr [edi+0a00h], ebx
    mov dword ptr [edi+0a04h], eax
L73078::
    test byte ptr [L770c4], 02h
    je near ptr L73741
L73085::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb near ptr L7666c
L73092::
    and eax, 01h
    jne short L7309e
    mov al, byte ptr [L77150]
    jmp short L730c2
L7309e::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb near ptr L76678
L730ab::
    and eax, 01h
    mov al, byte ptr [L77150]
    je short L730b7
    inc al
L730b7::
    sub al, 02h
    sbb al, 00h
    and al, 03h
    mov byte ptr [L77150], al
L730c2::
    or al, al
    je short L7310e
    test al, 02h
    jne short L730ec
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L77194]
    jb near ptr L76684
L730de::
    and eax, dword ptr [L77190]
    mov edx, dword ptr [L770ac]
    jmp short L7312e
L730ec::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L77196]
    jb near ptr L76690
L73100::
    and eax, dword ptr [L7718c]
    mov edx, dword ptr [L770b4]
    jmp short L7312e
L7310e::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L77195]
    jb near ptr L7669c
L73122::
    and eax, dword ptr [L77188]
    mov edx, dword ptr [L77148]
L7312e::
    shl eax, 03h
    add edx, eax
    cmp di, 0fff8h
    jae short L7316a
    mov ebx, dword ptr [edx-02h]
    mov eax, dword ptr [edx]
    mov bx, ax
    mov dword ptr [edi+08h], ebx
    mov ebx, dword ptr [edx+02h]
    mov ax, bx
    cmp di, 0f5f8h
    mov dword ptr [edi+0ch], eax
    jae short L7316a
    mov eax, dword ptr [edx+04h]
    mov bx, ax
    mov ax, word ptr [edx+06h]
    mov dword ptr [edi+0a08h], ebx
    mov dword ptr [edi+0a0ch], eax
L7316a::
    test byte ptr [L770c4], 010h
    je near ptr L7374e
L73177::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb near ptr L766a8
L73184::
    and eax, 01h
    jne short L73190
    mov al, byte ptr [L77150]
    jmp short L731b4
L73190::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb near ptr L766b4
L7319d::
    and eax, 01h
    mov al, byte ptr [L77150]
    je short L731a9
    inc al
L731a9::
    sub al, 02h
    sbb al, 00h
    and al, 03h
    mov byte ptr [L77150], al
L731b4::
    or al, al
    je short L73200
    test al, 02h
    jne short L731de
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L77194]
    jb near ptr L766c0
L731d0::
    and eax, dword ptr [L77190]
    mov edx, dword ptr [L770ac]
    jmp short L73220
L731de::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L77196]
    jb near ptr L766cc
L731f2::
    and eax, dword ptr [L7718c]
    mov edx, dword ptr [L770b4]
    jmp short L73220
L73200::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L77195]
    jb near ptr L766d8
L73214::
    and eax, dword ptr [L77188]
    mov edx, dword ptr [L77148]
L73220::
    shl eax, 03h
    add edx, eax
    cmp di, 0fff0h
    jae short L7325c
    mov ebx, dword ptr [edx-02h]
    mov eax, dword ptr [edx]
    mov bx, ax
    mov dword ptr [edi+010h], ebx
    mov ebx, dword ptr [edx+02h]
    mov ax, bx
    cmp di, 0f5f0h
    mov dword ptr [edi+014h], eax
    jae short L7325c
    mov eax, dword ptr [edx+04h]
    mov bx, ax
    mov ax, word ptr [edx+06h]
    mov dword ptr [edi+0a10h], ebx
    mov dword ptr [edi+0a14h], eax
L7325c::
    test byte ptr [L770c4], 020h
    je near ptr L7375b
L73269::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb near ptr L766e4
L73276::
    and eax, 01h
    jne short L73282
    mov al, byte ptr [L77150]
    jmp short L732a6
L73282::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb near ptr L766f0
L7328f::
    and eax, 01h
    mov al, byte ptr [L77150]
    je short L7329b
    inc al
L7329b::
    sub al, 02h
    sbb al, 00h
    and al, 03h
    mov byte ptr [L77150], al
L732a6::
    or al, al
    je short L732f2
    test al, 02h
    jne short L732d0
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L77194]
    jb near ptr L766fc
L732c2::
    and eax, dword ptr [L77190]
    mov edx, dword ptr [L770ac]
    jmp short L73312
L732d0::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L77196]
    jb near ptr L76708
L732e4::
    and eax, dword ptr [L7718c]
    mov edx, dword ptr [L770b4]
    jmp short L73312
L732f2::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L77195]
    jb near ptr L76714
L73306::
    and eax, dword ptr [L77188]
    mov edx, dword ptr [L77148]
L73312::
    shl eax, 03h
    add edx, eax
    cmp di, 0ffe8h
    jae short L7334e
    mov ebx, dword ptr [edx-02h]
    mov eax, dword ptr [edx]
    mov bx, ax
    mov dword ptr [edi+018h], ebx
    mov ebx, dword ptr [edx+02h]
    mov ax, bx
    cmp di, 0f5e8h
    mov dword ptr [edi+01ch], eax
    jae short L7334e
    mov eax, dword ptr [edx+04h]
    mov bx, ax
    mov ax, word ptr [edx+06h]
    mov dword ptr [edi+0a18h], ebx
    mov dword ptr [edi+0a1ch], eax
L7334e::
    test byte ptr [L770c4], 04h
    je near ptr L73768
L7335b::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb near ptr L76720
L73368::
    and eax, 01h
    jne short L73374
    mov al, byte ptr [L77150]
    jmp short L73398
L73374::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb near ptr L7672c
L73381::
    and eax, 01h
    mov al, byte ptr [L77150]
    je short L7338d
    inc al
L7338d::
    sub al, 02h
    sbb al, 00h
    and al, 03h
    mov byte ptr [L77150], al
L73398::
    or al, al
    je short L733e4
    test al, 02h
    jne short L733c2
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L77194]
    jb near ptr L76738
L733b4::
    and eax, dword ptr [L77190]
    mov edx, dword ptr [L770ac]
    jmp short L73404
L733c2::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L77196]
    jb near ptr L76744
L733d6::
    and eax, dword ptr [L7718c]
    mov edx, dword ptr [L770b4]
    jmp short L73404
L733e4::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L77195]
    jb near ptr L76750
L733f8::
    and eax, dword ptr [L77188]
    mov edx, dword ptr [L77148]
L73404::
    shl eax, 03h
    add edx, eax
    cmp di, 0ec00h
    jae short L73447
    mov ebx, dword ptr [edx-02h]
    mov eax, dword ptr [edx]
    mov bx, ax
    mov dword ptr [edi+01400h], ebx
    mov ebx, dword ptr [edx+02h]
    mov ax, bx
    cmp di, 0e200h
    mov dword ptr [edi+01404h], eax
    jae short L73447
    mov eax, dword ptr [edx+04h]
    mov bx, ax
    mov ax, word ptr [edx+06h]
    mov dword ptr [edi+01e00h], ebx
    mov dword ptr [edi+01e04h], eax
L73447::
    test byte ptr [L770c4], 08h
    je near ptr L73775
L73454::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb near ptr L7675c
L73461::
    and eax, 01h
    jne short L7346d
    mov al, byte ptr [L77150]
    jmp short L73491
L7346d::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb near ptr L76768
L7347a::
    and eax, 01h
    mov al, byte ptr [L77150]
    je short L73486
    inc al
L73486::
    sub al, 02h
    sbb al, 00h
    and al, 03h
    mov byte ptr [L77150], al
L73491::
    or al, al
    je short L734dd
    test al, 02h
    jne short L734bb
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L77194]
    jb near ptr L76774
L734ad::
    and eax, dword ptr [L77190]
    mov edx, dword ptr [L770ac]
    jmp short L734fd
L734bb::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L77196]
    jb near ptr L76780
L734cf::
    and eax, dword ptr [L7718c]
    mov edx, dword ptr [L770b4]
    jmp short L734fd
L734dd::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L77195]
    jb near ptr L7678c
L734f1::
    and eax, dword ptr [L77188]
    mov edx, dword ptr [L77148]
L734fd::
    shl eax, 03h
    add edx, eax
    cmp di, 0ebf8h
    jae short L73540
    mov ebx, dword ptr [edx-02h]
    mov eax, dword ptr [edx]
    mov bx, ax
    mov dword ptr [edi+01408h], ebx
    mov ebx, dword ptr [edx+02h]
    mov ax, bx
    cmp di, 0e1f8h
    mov dword ptr [edi+0140ch], eax
    jae short L73540
    mov eax, dword ptr [edx+04h]
    mov bx, ax
    mov ax, word ptr [edx+06h]
    mov dword ptr [edi+01e08h], ebx
    mov dword ptr [edi+01e0ch], eax
L73540::
    test byte ptr [L770c4], 040h
    je near ptr L73782
L7354d::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb near ptr L76798
L7355a::
    and eax, 01h
    jne short L73566
    mov al, byte ptr [L77150]
    jmp short L7358a
L73566::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb near ptr L767a4
L73573::
    and eax, 01h
    mov al, byte ptr [L77150]
    je short L7357f
    inc al
L7357f::
    sub al, 02h
    sbb al, 00h
    and al, 03h
    mov byte ptr [L77150], al
L7358a::
    or al, al
    je short L735d6
    test al, 02h
    jne short L735b4
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L77194]
    jb near ptr L767b0
L735a6::
    and eax, dword ptr [L77190]
    mov edx, dword ptr [L770ac]
    jmp short L735f6
L735b4::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L77196]
    jb near ptr L767bc
L735c8::
    and eax, dword ptr [L7718c]
    mov edx, dword ptr [L770b4]
    jmp short L735f6
L735d6::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L77195]
    jb near ptr L767c8
L735ea::
    and eax, dword ptr [L77188]
    mov edx, dword ptr [L77148]
L735f6::
    shl eax, 03h
    add edx, eax
    cmp di, 0ebf0h
    jae short L73639
    mov ebx, dword ptr [edx-02h]
    mov eax, dword ptr [edx]
    mov bx, ax
    mov dword ptr [edi+01410h], ebx
    mov ebx, dword ptr [edx+02h]
    mov ax, bx
    cmp di, 0e1f0h
    mov dword ptr [edi+01414h], eax
    jae short L73639
    mov eax, dword ptr [edx+04h]
    mov bx, ax
    mov ax, word ptr [edx+06h]
    mov dword ptr [edi+01e10h], ebx
    mov dword ptr [edi+01e14h], eax
L73639::
    test byte ptr [L770c4], 080h
    je near ptr L7378f
L73646::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb near ptr L767d4
L73653::
    and eax, 01h
    jne short L7365f
    mov al, byte ptr [L77150]
    jmp short L73683
L7365f::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb near ptr L767e0
L7366c::
    and eax, 01h
    mov al, byte ptr [L77150]
    je short L73678
    inc al
L73678::
    sub al, 02h
    sbb al, 00h
    and al, 03h
    mov byte ptr [L77150], al
L73683::
    or al, al
    je short L736cf
    test al, 02h
    jne short L736ad
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L77194]
    jb near ptr L767ec
L7369f::
    and eax, dword ptr [L77190]
    mov edx, dword ptr [L770ac]
    jmp short L736ef
L736ad::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L77196]
    jb near ptr L767f8
L736c1::
    and eax, dword ptr [L7718c]
    mov edx, dword ptr [L770b4]
    jmp short L736ef
L736cf::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L77195]
    jb near ptr L76804
L736e3::
    and eax, dword ptr [L77188]
    mov edx, dword ptr [L77148]
L736ef::
    shl eax, 03h
    add edx, eax
    cmp di, 0ebe8h
    jae short L73732
    mov ebx, dword ptr [edx-02h]
    mov eax, dword ptr [edx]
    mov bx, ax
    mov dword ptr [edi+01418h], ebx
    mov ebx, dword ptr [edx+02h]
    mov ax, bx
    cmp di, 0e1e8h
    mov dword ptr [edi+0141ch], eax
    jae short L73732
    mov eax, dword ptr [edx+04h]
    mov bx, ax
    mov ax, word ptr [edx+06h]
    mov dword ptr [edi+01e18h], ebx
    mov dword ptr [edi+01e1ch], eax
L73732::
    jmp short L7379c
L73734::
    test byte ptr [L770c4], 01h
    jne near ptr L72f9a
L73741::
    test byte ptr [L770c4], 02h
    jne near ptr L73085
L7374e::
    test byte ptr [L770c4], 010h
    jne near ptr L73177
L7375b::
    test byte ptr [L770c4], 020h
    jne near ptr L73269
L73768::
    test byte ptr [L770c4], 04h
    jne near ptr L7335b
L73775::
    test byte ptr [L770c4], 08h
    jne near ptr L73454
L73782::
    test byte ptr [L770c4], 040h
    jne near ptr L7354d
L7378f::
    test byte ptr [L770c4], 080h
    jne near ptr L73646
L7379c::
    test byte ptr [L770c5], 0ffh
    je near ptr L74159
    test byte ptr [L770c5], 01h
    je near ptr L73f76
L737b6::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb near ptr L76810
L737c3::
    and eax, 01h
    jne short L737cf
    mov al, byte ptr [L77150]
    jmp short L737f3
L737cf::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb near ptr L7681c
L737dc::
    and eax, 01h
    mov al, byte ptr [L77150]
    je short L737e8
    inc al
L737e8::
    sub al, 02h
    sbb al, 00h
    and al, 03h
    mov byte ptr [L77150], al
L737f3::
    or al, al
    je short L7383f
    test al, 02h
    jne short L7381d
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L77194]
    jb near ptr L76828
L7380f::
    and eax, dword ptr [L77190]
    mov edx, dword ptr [L770ac]
    jmp short L7385f
L7381d::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L77196]
    jb near ptr L76834
L73831::
    and eax, dword ptr [L7718c]
    mov edx, dword ptr [L770b4]
    jmp short L7385f
L7383f::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L77195]
    jb near ptr L76840
L73853::
    and eax, dword ptr [L77188]
    mov edx, dword ptr [L77148]
L7385f::
    shl eax, 03h
    add edx, eax
    cmp di, 0d800h
    jae short L738a2
    mov ebx, dword ptr [edx-02h]
    mov eax, dword ptr [edx]
    mov bx, ax
    mov dword ptr [edi+02800h], ebx
    mov ebx, dword ptr [edx+02h]
    mov ax, bx
    cmp di, 0ce00h
    mov dword ptr [edi+02804h], eax
    jae short L738a2
    mov eax, dword ptr [edx+04h]
    mov bx, ax
    mov ax, word ptr [edx+06h]
    mov dword ptr [edi+03200h], ebx
    mov dword ptr [edi+03204h], eax
L738a2::
    test byte ptr [L770c5], 02h
    je near ptr L73f83
L738af::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb near ptr L7684c
L738bc::
    and eax, 01h
    jne short L738c8
    mov al, byte ptr [L77150]
    jmp short L738ec
L738c8::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb near ptr L76858
L738d5::
    and eax, 01h
    mov al, byte ptr [L77150]
    je short L738e1
    inc al
L738e1::
    sub al, 02h
    sbb al, 00h
    and al, 03h
    mov byte ptr [L77150], al
L738ec::
    or al, al
    je short L73938
    test al, 02h
    jne short L73916
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L77194]
    jb near ptr L76864
L73908::
    and eax, dword ptr [L77190]
    mov edx, dword ptr [L770ac]
    jmp short L73958
L73916::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L77196]
    jb near ptr L76870
L7392a::
    and eax, dword ptr [L7718c]
    mov edx, dword ptr [L770b4]
    jmp short L73958
L73938::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L77195]
    jb near ptr L7687c
L7394c::
    and eax, dword ptr [L77188]
    mov edx, dword ptr [L77148]
L73958::
    shl eax, 03h
    add edx, eax
    cmp di, 0d7f8h
    jae short L7399b
    mov ebx, dword ptr [edx-02h]
    mov eax, dword ptr [edx]
    mov bx, ax
    mov dword ptr [edi+02808h], ebx
    mov ebx, dword ptr [edx+02h]
    mov ax, bx
    cmp di, 0cdf8h
    mov dword ptr [edi+0280ch], eax
    jae short L7399b
    mov eax, dword ptr [edx+04h]
    mov bx, ax
    mov ax, word ptr [edx+06h]
    mov dword ptr [edi+03208h], ebx
    mov dword ptr [edi+0320ch], eax
L7399b::
    test byte ptr [L770c5], 010h
    je near ptr L73f90
L739a8::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb near ptr L76888
L739b5::
    and eax, 01h
    jne short L739c1
    mov al, byte ptr [L77150]
    jmp short L739e5
L739c1::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb near ptr L76894
L739ce::
    and eax, 01h
    mov al, byte ptr [L77150]
    je short L739da
    inc al
L739da::
    sub al, 02h
    sbb al, 00h
    and al, 03h
    mov byte ptr [L77150], al
L739e5::
    or al, al
    je short L73a31
    test al, 02h
    jne short L73a0f
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L77194]
    jb near ptr L768a0
L73a01::
    and eax, dword ptr [L77190]
    mov edx, dword ptr [L770ac]
    jmp short L73a51
L73a0f::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L77196]
    jb near ptr L768ac
L73a23::
    and eax, dword ptr [L7718c]
    mov edx, dword ptr [L770b4]
    jmp short L73a51
L73a31::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L77195]
    jb near ptr L768b8
L73a45::
    and eax, dword ptr [L77188]
    mov edx, dword ptr [L77148]
L73a51::
    shl eax, 03h
    add edx, eax
    cmp di, 0d7f0h
    jae short L73a94
    mov ebx, dword ptr [edx-02h]
    mov eax, dword ptr [edx]
    mov bx, ax
    mov dword ptr [edi+02810h], ebx
    mov ebx, dword ptr [edx+02h]
    mov ax, bx
    cmp di, 0cdf0h
    mov dword ptr [edi+02814h], eax
    jae short L73a94
    mov eax, dword ptr [edx+04h]
    mov bx, ax
    mov ax, word ptr [edx+06h]
    mov dword ptr [edi+03210h], ebx
    mov dword ptr [edi+03214h], eax
L73a94::
    test byte ptr [L770c5], 020h
    je near ptr L73f9d
L73aa1::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb near ptr L768c4
L73aae::
    and eax, 01h
    jne short L73aba
    mov al, byte ptr [L77150]
    jmp short L73ade
L73aba::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb near ptr L768d0
L73ac7::
    and eax, 01h
    mov al, byte ptr [L77150]
    je short L73ad3
    inc al
L73ad3::
    sub al, 02h
    sbb al, 00h
    and al, 03h
    mov byte ptr [L77150], al
L73ade::
    or al, al
    je short L73b2a
    test al, 02h
    jne short L73b08
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L77194]
    jb near ptr L768dc
L73afa::
    and eax, dword ptr [L77190]
    mov edx, dword ptr [L770ac]
    jmp short L73b4a
L73b08::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L77196]
    jb near ptr L768e8
L73b1c::
    and eax, dword ptr [L7718c]
    mov edx, dword ptr [L770b4]
    jmp short L73b4a
L73b2a::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L77195]
    jb near ptr L768f4
L73b3e::
    and eax, dword ptr [L77188]
    mov edx, dword ptr [L77148]
L73b4a::
    shl eax, 03h
    add edx, eax
    cmp di, 0d7e8h
    jae short L73b8d
    mov ebx, dword ptr [edx-02h]
    mov eax, dword ptr [edx]
    mov bx, ax
    mov dword ptr [edi+02818h], ebx
    mov ebx, dword ptr [edx+02h]
    mov ax, bx
    cmp di, 0cde8h
    mov dword ptr [edi+0281ch], eax
    jae short L73b8d
    mov eax, dword ptr [edx+04h]
    mov bx, ax
    mov ax, word ptr [edx+06h]
    mov dword ptr [edi+03218h], ebx
    mov dword ptr [edi+0321ch], eax
L73b8d::
    test byte ptr [L770c5], 04h
    je near ptr L73faa
L73b9a::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb near ptr L76900
L73ba7::
    and eax, 01h
    jne short L73bb3
    mov al, byte ptr [L77150]
    jmp short L73bd7
L73bb3::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb near ptr L7690c
L73bc0::
    and eax, 01h
    mov al, byte ptr [L77150]
    je short L73bcc
    inc al
L73bcc::
    sub al, 02h
    sbb al, 00h
    and al, 03h
    mov byte ptr [L77150], al
L73bd7::
    or al, al
    je short L73c23
    test al, 02h
    jne short L73c01
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L77194]
    jb near ptr L76918
L73bf3::
    and eax, dword ptr [L77190]
    mov edx, dword ptr [L770ac]
    jmp short L73c43
L73c01::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L77196]
    jb near ptr L76924
L73c15::
    and eax, dword ptr [L7718c]
    mov edx, dword ptr [L770b4]
    jmp short L73c43
L73c23::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L77195]
    jb near ptr L76930
L73c37::
    and eax, dword ptr [L77188]
    mov edx, dword ptr [L77148]
L73c43::
    shl eax, 03h
    add edx, eax
    cmp di, 0c400h
    jae short L73c86
    mov ebx, dword ptr [edx-02h]
    mov eax, dword ptr [edx]
    mov bx, ax
    mov dword ptr [edi+03c00h], ebx
    mov ebx, dword ptr [edx+02h]
    mov ax, bx
    cmp di, 0ba00h
    mov dword ptr [edi+03c04h], eax
    jae short L73c86
    mov eax, dword ptr [edx+04h]
    mov bx, ax
    mov ax, word ptr [edx+06h]
    mov dword ptr [edi+04600h], ebx
    mov dword ptr [edi+04604h], eax
L73c86::
    test byte ptr [L770c5], 08h
    je near ptr L73fb7
L73c93::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb near ptr L7693c
L73ca0::
    and eax, 01h
    jne short L73cac
    mov al, byte ptr [L77150]
    jmp short L73cd0
L73cac::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb near ptr L76948
L73cb9::
    and eax, 01h
    mov al, byte ptr [L77150]
    je short L73cc5
    inc al
L73cc5::
    sub al, 02h
    sbb al, 00h
    and al, 03h
    mov byte ptr [L77150], al
L73cd0::
    or al, al
    je short L73d1c
    test al, 02h
    jne short L73cfa
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L77194]
    jb near ptr L76954
L73cec::
    and eax, dword ptr [L77190]
    mov edx, dword ptr [L770ac]
    jmp short L73d3c
L73cfa::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L77196]
    jb near ptr L76960
L73d0e::
    and eax, dword ptr [L7718c]
    mov edx, dword ptr [L770b4]
    jmp short L73d3c
L73d1c::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L77195]
    jb near ptr L7696c
L73d30::
    and eax, dword ptr [L77188]
    mov edx, dword ptr [L77148]
L73d3c::
    shl eax, 03h
    add edx, eax
    cmp di, 0c3f8h
    jae short L73d7f
    mov ebx, dword ptr [edx-02h]
    mov eax, dword ptr [edx]
    mov bx, ax
    mov dword ptr [edi+03c08h], ebx
    mov ebx, dword ptr [edx+02h]
    mov ax, bx
    cmp di, 0b9f8h
    mov dword ptr [edi+03c0ch], eax
    jae short L73d7f
    mov eax, dword ptr [edx+04h]
    mov bx, ax
    mov ax, word ptr [edx+06h]
    mov dword ptr [edi+04608h], ebx
    mov dword ptr [edi+0460ch], eax
L73d7f::
    test byte ptr [L770c5], 040h
    je near ptr L73fc4
L73d8c::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb near ptr L76978
L73d99::
    and eax, 01h
    jne short L73da5
    mov al, byte ptr [L77150]
    jmp short L73dc9
L73da5::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb near ptr L76984
L73db2::
    and eax, 01h
    mov al, byte ptr [L77150]
    je short L73dbe
    inc al
L73dbe::
    sub al, 02h
    sbb al, 00h
    and al, 03h
    mov byte ptr [L77150], al
L73dc9::
    or al, al
    je short L73e15
    test al, 02h
    jne short L73df3
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L77194]
    jb near ptr L76990
L73de5::
    and eax, dword ptr [L77190]
    mov edx, dword ptr [L770ac]
    jmp short L73e35
L73df3::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L77196]
    jb near ptr L7699c
L73e07::
    and eax, dword ptr [L7718c]
    mov edx, dword ptr [L770b4]
    jmp short L73e35
L73e15::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L77195]
    jb near ptr L769a8
L73e29::
    and eax, dword ptr [L77188]
    mov edx, dword ptr [L77148]
L73e35::
    shl eax, 03h
    add edx, eax
    cmp di, 0c3f0h
    jae short L73e78
    mov ebx, dword ptr [edx-02h]
    mov eax, dword ptr [edx]
    mov bx, ax
    mov dword ptr [edi+03c10h], ebx
    mov ebx, dword ptr [edx+02h]
    mov ax, bx
    cmp di, 0b9f0h
    mov dword ptr [edi+03c14h], eax
    jae short L73e78
    mov eax, dword ptr [edx+04h]
    mov bx, ax
    mov ax, word ptr [edx+06h]
    mov dword ptr [edi+04610h], ebx
    mov dword ptr [edi+04614h], eax
L73e78::
    test byte ptr [L770c5], 080h
    je near ptr L73fd1
L73e85::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb near ptr L769b4
L73e92::
    and eax, 01h
    jne short L73e9e
    mov al, byte ptr [L77150]
    jmp short L73ec2
L73e9e::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb near ptr L769c0
L73eab::
    and eax, 01h
    mov al, byte ptr [L77150]
    je short L73eb7
    inc al
L73eb7::
    sub al, 02h
    sbb al, 00h
    and al, 03h
    mov byte ptr [L77150], al
L73ec2::
    or al, al
    je short L73f0e
    test al, 02h
    jne short L73eec
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L77194]
    jb near ptr L769cc
L73ede::
    and eax, dword ptr [L77190]
    mov edx, dword ptr [L770ac]
    jmp short L73f2e
L73eec::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L77196]
    jb near ptr L769d8
L73f00::
    and eax, dword ptr [L7718c]
    mov edx, dword ptr [L770b4]
    jmp short L73f2e
L73f0e::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L77195]
    jb near ptr L769e4
L73f22::
    and eax, dword ptr [L77188]
    mov edx, dword ptr [L77148]
L73f2e::
    shl eax, 03h
    add edx, eax
    cmp di, 0c3e8h
    jae short L73f71
    mov ebx, dword ptr [edx-02h]
    mov eax, dword ptr [edx]
    mov bx, ax
    mov dword ptr [edi+03c18h], ebx
    mov ebx, dword ptr [edx+02h]
    mov ax, bx
    cmp di, 0b9e8h
    mov dword ptr [edi+03c1ch], eax
    jae short L73f71
    mov eax, dword ptr [edx+04h]
    mov bx, ax
    mov ax, word ptr [edx+06h]
    mov dword ptr [edi+04618h], ebx
    mov dword ptr [edi+0461ch], eax
L73f71::
    jmp near ptr L74159
L73f76::
    test byte ptr [L770c5], 01h
    jne near ptr L737b6
L73f83::
    test byte ptr [L770c5], 02h
    jne near ptr L738af
L73f90::
    test byte ptr [L770c5], 010h
    jne near ptr L739a8
L73f9d::
    test byte ptr [L770c5], 020h
    jne near ptr L73aa1
L73faa::
    test byte ptr [L770c5], 04h
    jne near ptr L73b9a
L73fb7::
    test byte ptr [L770c5], 08h
    jne near ptr L73c93
L73fc4::
    test byte ptr [L770c5], 040h
    jne near ptr L73d8c
L73fd1::
    test byte ptr [L770c5], 080h
    jne near ptr L73e85
    jmp near ptr L74159
L73fe3::
    test dword ptr [L77154], 010000h
    jne near ptr L74144
    jmp near ptr L74159
L73ff8::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb near ptr L769f0
L74005::
    and eax, 01h
    jne short L74011
    mov al, byte ptr [L77150]
    jmp short L74035
L74011::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb near ptr L769fc
L7401e::
    and eax, 01h
    mov al, byte ptr [L77150]
    je short L7402a
    inc al
L7402a::
    sub al, 02h
    sbb al, 00h
    and al, 03h
    mov byte ptr [L77150], al
L74035::
    or al, al
    je near ptr L740c8
    test al, 02h
    jne short L74063
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L77194]
    jb near ptr L76a08
L74055::
    and eax, dword ptr [L77190]
    mov edx, dword ptr [L770ac]
    jmp short L74083
L74063::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L77196]
    jb near ptr L76a14
L74077::
    and eax, dword ptr [L7718c]
    mov edx, dword ptr [L770b4]
L74083::
    shl eax, 03h
    add edx, eax
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 04h
    jb near ptr L76a20
L74099::
    and eax, 0fh
    mov ebx, dword ptr [edx-02h]
    mov dword ptr [L7709c], ecx
    mov ecx, dword ptr [edx]
    mov bx, cx
    mov dword ptr [L770a0], ebp
    mov dword ptr [L77098], esi
    mov esi, dword ptr [edx+02h]
    mov cx, si
    mov ebp, dword ptr [edx+04h]
    mov si, bp
    mov bp, word ptr [edx+06h]
    jmp short L7412b
L740c8::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L77195]
    jb near ptr L76a2c
L740dc::
    and eax, dword ptr [L77188]
    mov edx, dword ptr [L77148]
    shl eax, 03h
    add edx, eax
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 04h
    jb near ptr L76a38
L740fe::
    and eax, 0fh
    mov ebx, dword ptr [edx-02h]
    mov dword ptr [L7709c], ecx
    mov ecx, dword ptr [edx]
    mov bx, cx
    mov dword ptr [L770a0], ebp
    mov dword ptr [L77098], esi
    mov esi, dword ptr [edx+02h]
    mov cx, si
    mov ebp, dword ptr [edx+04h]
    mov si, bp
    mov bp, word ptr [edx+06h]
L7412b::
    call dword ptr [eax*4+L70c97]
    mov esi, dword ptr [L77098]
    mov ecx, dword ptr [L7709c]
    mov ebp, dword ptr [L770a0]
L74144::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb near ptr L76a44
L74151::
    test al, 01h
    je near ptr L73ff8
L74159::
    mov edx, 01h
    mov edi, dword ptr [L770a8]
    jmp near ptr L70f94
L74169::
    cmp dword ptr [L77158], 00h
    jne short L7417a
    pop edx
    pop ecx
    pop ebx
    pop eax
    pop edi
    pop esi
    leave
    ret
L7417a::
    call Func741bc_
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
L7418c::
    cmp dword ptr [L77158], 00h
    je short L741a7
    call Func741bc_
    cmp bx, word ptr [L7708c]
    je near ptr L71059
L741a7::
    pusha
    mov ax, bx
    call Func75f7c_
    popa
    jmp near ptr L71059
Func72d84_ endp
    db 08bh, 0c0h, 000h, 000h, 08bh, 0c0h
Func741bc_ proc near
    mov al, byte ptr [L7716c]
    mov byte ptr [L77150], al
    mov esi, 00h
    xchg dword ptr [L77158], esi
    mov ecx, dword ptr [L7715c]
    mov edx, dword ptr [L77160]
    mov eax, dword ptr [L77168]
    mov dword ptr [L7714c], eax
L741e7::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb near ptr L76a50
L741f4::
    and eax, 01h
    je short L7424a
    add edx, 01h
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 03h
    jb near ptr L76a5c
L7420d::
    and eax, 07h
    add edx, eax
    cmp eax, 07h
    jl short L7424a
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 07h
    jb near ptr L76a68
L74228::
    and eax, 07fh
    add edx, eax
    cmp eax, 07fh
    jl short L7424a
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 0ch
    jb near ptr L76a74
L74243::
    and eax, 0fffh
    add edx, eax
L7424a::
    bswap ecx
    mov cl, byte ptr [L77197]
    mov ebx, edx
    shl ebx, cl
    add dword ptr [L77164], ebx
    bswap ecx
    add edx, dword ptr [L7714c]
    cmp edx, dword ptr [L770bc]
    jae near ptr L74169
    mov dword ptr [L7714c], edx
    shl edx, 02h
    add edx, dword ptr [ebp+014h]
    mov edi, dword ptr [edx]
    cmp edi, 0ffffffffh
    je near ptr L75db3
    cmp edi, 0fffffffeh
    je near ptr L74169
    shld ebx, edi, 010h
    cmp di, 0b4f2h
    jbe near ptr L75dc4
    inc bx
    cmp bx, word ptr [L7708c]
    jne near ptr L75dec
L742ae::
    mov dword ptr [L770a8], edi
    and edi, 0ffffh
    or edi, dword ptr [L770b8]
L742c0::
    mov dword ptr [L770c4], 00h
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb near ptr L76a80
L742d7::
    test al, 01h
    jne near ptr L7486e
L742df::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb near ptr L76a8c
L742ec::
    and eax, 01h
    jne short L742f8
    mov al, byte ptr [L77150]
    jmp short L7431c
L742f8::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb near ptr L76a98
L74305::
    and eax, 01h
    mov al, byte ptr [L77150]
    je short L74311
    inc al
L74311::
    sub al, 02h
    sbb al, 00h
    and al, 03h
    mov byte ptr [L77150], al
L7431c::
    or al, al
    je near ptr L743b3
    test al, 02h
    jne short L7434a
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L77194]
    jb near ptr L76aa4
L7433c::
    and eax, dword ptr [L77190]
    mov edx, dword ptr [L770ac]
    jmp short L7436a
L7434a::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L77196]
    jb near ptr L76ab0
L7435e::
    and eax, dword ptr [L7718c]
    mov edx, dword ptr [L770b4]
L7436a::
    shl eax, 03h
    add edx, eax
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 011h
    jae short L74382
    add esi, 04h
    or cl, 0e0h
L74382::
    and eax, 01ffffh
    mov ebx, dword ptr [edx-02h]
    mov dword ptr [L7709c], ecx
    mov ecx, dword ptr [edx]
    mov bx, cx
    mov dword ptr [L770a0], ebp
    mov dword ptr [L77098], esi
    mov esi, dword ptr [edx+02h]
    mov cx, si
    mov ebp, dword ptr [edx+04h]
    mov si, bp
    mov bp, word ptr [edx+06h]
    jmp short L7441a
L743b3::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L77195]
    jb near ptr L76abc
L743c7::
    and eax, dword ptr [L77188]
    mov edx, dword ptr [L77164]
    shl eax, 03h
    add edx, eax
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 011h
    jae short L743eb
    add esi, 04h
    or cl, 0e0h
L743eb::
    and eax, 01ffffh
    mov ebx, dword ptr [edx-02h]
    mov dword ptr [L7709c], ecx
    mov ecx, dword ptr [edx]
    mov bx, cx
    mov dword ptr [L770a0], ebp
    mov dword ptr [L77098], esi
    mov esi, dword ptr [edx+02h]
    mov cx, si
    mov ebp, dword ptr [edx+04h]
    mov si, bp
    mov bp, word ptr [edx+06h]
L7441a::
    or dword ptr [L770c4], eax
    test al, al
    je near ptr L7461f
    test al, 01h
    je near ptr L745e3
L74430::
    sub edi, 010000h
    cmp di, 0f600h
    jae short L74444
    jmp short L74450
    mov dword ptr [edi], ebx
    mov dword ptr [edi+04h], ecx
L74444::
    mov dword ptr [edi+0a00h], esi
    mov dword ptr [edi+0a04h], ebp
L74450::
    add edi, 010000h
    test al, 02h
    je near ptr L745eb
L7445e::
    sub edi, 010000h
    cmp di, 0fff8h
    jae short L74473
    cmp di, 0f5f8h
    jae short L74479
    jmp short L74485
L74473::
    mov dword ptr [edi+08h], ebx
    mov dword ptr [edi+0ch], ecx
L74479::
    mov dword ptr [edi+0a08h], esi
    mov dword ptr [edi+0a0ch], ebp
L74485::
    add edi, 010000h
    test al, 010h
    je near ptr L745f3
L74493::
    sub edi, 010000h
    cmp di, 0fff0h
    jae short L744a8
    cmp di, 0f5f0h
    jae short L744ae
    jmp short L744ba
L744a8::
    mov dword ptr [edi+010h], ebx
    mov dword ptr [edi+014h], ecx
L744ae::
    mov dword ptr [edi+0a10h], esi
    mov dword ptr [edi+0a14h], ebp
L744ba::
    add edi, 010000h
    test al, 020h
    je near ptr L745fb
L744c8::
    sub edi, 010000h
    cmp di, 0ffe8h
    jae short L744dd
    cmp di, 0f5e8h
    jae short L744e3
    jmp short L744ef
L744dd::
    mov dword ptr [edi+018h], ebx
    mov dword ptr [edi+01ch], ecx
L744e3::
    mov dword ptr [edi+0a18h], esi
    mov dword ptr [edi+0a1ch], ebp
L744ef::
    add edi, 010000h
    test al, 04h
    je near ptr L74603
L744fd::
    sub edi, 010000h
    cmp di, 0ec00h
    jae short L74513
    cmp di, 0e200h
    jae short L7451f
    jmp short L7452b
L74513::
    mov dword ptr [edi+01400h], ebx
    mov dword ptr [edi+01404h], ecx
L7451f::
    mov dword ptr [edi+01e00h], esi
    mov dword ptr [edi+01e04h], ebp
L7452b::
    add edi, 010000h
    test al, 08h
    je near ptr L7460b
L74539::
    sub edi, 010000h
    cmp di, 0ebf8h
    jae short L7454f
    cmp di, 0e1f8h
    jae short L7455b
    jmp short L74567
L7454f::
    mov dword ptr [edi+01408h], ebx
    mov dword ptr [edi+0140ch], ecx
L7455b::
    mov dword ptr [edi+01e08h], esi
    mov dword ptr [edi+01e0ch], ebp
L74567::
    add edi, 010000h
    test al, 040h
    je near ptr L74613
L74575::
    sub edi, 010000h
    cmp di, 0ebf0h
    jae short L7458b
    cmp di, 0e1f0h
    jae short L74597
    jmp short L745a3
L7458b::
    mov dword ptr [edi+01410h], ebx
    mov dword ptr [edi+01414h], ecx
L74597::
    mov dword ptr [edi+01e10h], esi
    mov dword ptr [edi+01e14h], ebp
L745a3::
    add edi, 010000h
    test al, 080h
    je short L7461b
L745ad::
    sub edi, 010000h
    cmp di, 0ebe8h
    jae short L745c3
    cmp di, 0e1e8h
    jae short L745cf
    jmp short L745db
L745c3::
    mov dword ptr [edi+01418h], ebx
    mov dword ptr [edi+0141ch], ecx
L745cf::
    mov dword ptr [edi+01e18h], esi
    mov dword ptr [edi+01e1ch], ebp
L745db::
    add edi, 010000h
    jmp short L7461f
L745e3::
    test al, 01h
    jne near ptr L74430
L745eb::
    test al, 02h
    jne near ptr L7445e
L745f3::
    test al, 010h
    jne near ptr L74493
L745fb::
    test al, 020h
    jne near ptr L744c8
L74603::
    test al, 04h
    jne near ptr L744fd
L7460b::
    test al, 08h
    jne near ptr L74539
L74613::
    test al, 040h
    jne near ptr L74575
L7461b::
    test al, 080h
    jne short L745ad
L7461f::
    test ah, ah
    je near ptr L74851
    test ah, 01h
    je near ptr L7480d
L74630::
    sub edi, 010000h
    cmp di, 0d800h
    jae short L74646
    cmp di, 0ce00h
    jae short L74652
    jmp short L7465e
L74646::
    mov dword ptr [edi+02800h], ebx
    mov dword ptr [edi+02804h], ecx
L74652::
    mov dword ptr [edi+03200h], esi
    mov dword ptr [edi+03204h], ebp
L7465e::
    add edi, 010000h
    test ah, 02h
    je near ptr L74816
L7466d::
    sub edi, 010000h
    cmp di, 0d7f8h
    jae short L74683
    cmp di, 0cdf8h
    jae short L7468f
    jmp short L7469b
L74683::
    mov dword ptr [edi+02808h], ebx
    mov dword ptr [edi+0280ch], ecx
L7468f::
    mov dword ptr [edi+03208h], esi
    mov dword ptr [edi+0320ch], ebp
L7469b::
    add edi, 010000h
    test ah, 010h
    je near ptr L7481f
L746aa::
    sub edi, 010000h
    cmp di, 0d7f0h
    jae short L746c0
    cmp di, 0cdf0h
    jae short L746cc
    jmp short L746d8
L746c0::
    mov dword ptr [edi+02810h], ebx
    mov dword ptr [edi+02814h], ecx
L746cc::
    mov dword ptr [edi+03210h], esi
    mov dword ptr [edi+03214h], ebp
L746d8::
    add edi, 010000h
    test ah, 020h
    je near ptr L74828
L746e7::
    sub edi, 010000h
    cmp di, 0d7e8h
    jae short L746fd
    cmp di, 0cde8h
    jae short L74709
    jmp short L74715
L746fd::
    mov dword ptr [edi+02818h], ebx
    mov dword ptr [edi+0281ch], ecx
L74709::
    mov dword ptr [edi+03218h], esi
    mov dword ptr [edi+0321ch], ebp
L74715::
    add edi, 010000h
    test ah, 04h
    je near ptr L74831
L74724::
    sub edi, 010000h
    cmp di, 0c400h
    jae short L7473a
    cmp di, 0ba00h
    jae short L74746
    jmp short L74752
L7473a::
    mov dword ptr [edi+03c00h], ebx
    mov dword ptr [edi+03c04h], ecx
L74746::
    mov dword ptr [edi+04600h], esi
    mov dword ptr [edi+04604h], ebp
L74752::
    add edi, 010000h
    test ah, 08h
    je near ptr L7483a
L74761::
    sub edi, 010000h
    cmp di, 0c3f8h
    jae short L74777
    cmp di, 0b9f8h
    jae short L74783
    jmp short L7478f
L74777::
    mov dword ptr [edi+03c08h], ebx
    mov dword ptr [edi+03c0ch], ecx
L74783::
    mov dword ptr [edi+04608h], esi
    mov dword ptr [edi+0460ch], ebp
L7478f::
    add edi, 010000h
    test ah, 040h
    je near ptr L74843
L7479e::
    sub edi, 010000h
    cmp di, 0c3f0h
    jae short L747b4
    cmp di, 0b9f0h
    jae short L747c0
    jmp short L747cc
L747b4::
    mov dword ptr [edi+03c10h], ebx
    mov dword ptr [edi+03c14h], ecx
L747c0::
    mov dword ptr [edi+04610h], esi
    mov dword ptr [edi+04614h], ebp
L747cc::
    add edi, 010000h
    test ah, 080h
    je short L7484c
L747d7::
    sub edi, 010000h
    cmp di, 0c3e8h
    jae short L747ed
    cmp di, 0b9e8h
    jae short L747f9
    jmp short L74805
L747ed::
    mov dword ptr [edi+03c18h], ebx
    mov dword ptr [edi+03c1ch], ecx
L747f9::
    mov dword ptr [edi+04618h], esi
    mov dword ptr [edi+0461ch], ebp
L74805::
    add edi, 010000h
    jmp short L74851
L7480d::
    test ah, 01h
    jne near ptr L74630
L74816::
    test ah, 02h
    jne near ptr L7466d
L7481f::
    test ah, 010h
    jne near ptr L746aa
L74828::
    test ah, 020h
    jne near ptr L746e7
L74831::
    test ah, 04h
    jne near ptr L74724
L7483a::
    test ah, 08h
    jne near ptr L74761
L74843::
    test ah, 040h
    jne near ptr L7479e
L7484c::
    test ah, 080h
    jne short L747d7
L74851::
    mov esi, dword ptr [L77098]
    mov ecx, dword ptr [L7709c]
    mov ebp, dword ptr [L770a0]
    and eax, 010000h
    je near ptr L742df
L7486e::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb near ptr L76ac8
L7487b::
    test al, 01h
    jne near ptr L75c2d
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 04h
    jb near ptr L76ad4
L74894::
    and eax, 0fh
    jmp dword ptr [eax*4+L7489e]
Func741bc_ endp
L7489e label byte
    dd offset Func748de_
    dd offset L748fc
    dd offset L7491d
    dd offset L74941
    dd offset L74961
    dd offset L74983
    dd offset L749aa
    dd offset L749cd
    dd offset L749f1
    dd offset L74a10
    dd offset L74a34
    dd offset L74a5a
    dd offset L74a7a
    dd offset L74a95
    dd offset L74ab6
    dd offset L74ad4
Func748de_ proc near
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 010h
    jae short L748f1
    add esi, 04h
    or cl, 0e0h
L748f1::
    xor dword ptr [L770c4], eax
    jmp near ptr L74ada
L748fc::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 0ch
    jb near ptr L76ae0
L7490d::
    shl eax, 04h
    or al, 0fh
    xor dword ptr [L770c4], eax
    jmp near ptr L74ada
L7491d::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 0ch
    jb near ptr L76aec
L7492e::
    shl eax, 04h
    shr al, 04h
    or al, 0f0h
    xor dword ptr [L770c4], eax
    jmp near ptr L74ada
L74941::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 08h
    jb near ptr L76af8
L74952::
    mov ah, al
    mov al, 0ffh
    xor dword ptr [L770c4], eax
    jmp near ptr L74ada
L74961::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 0ch
    jb near ptr L76b04
L74972::
    shl ah, 04h
    or ah, 0fh
    xor dword ptr [L770c4], eax
    jmp near ptr L74ada
L74983::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 08h
    jb near ptr L76b10
L74994::
    shl eax, 04h
    shl ah, 04h
    or eax, 0f0fh
    xor dword ptr [L770c4], eax
    jmp near ptr L74ada
L749aa::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 08h
    jb near ptr L76b1c
L749bb::
    mov ah, al
    or eax, 0ff0h
    xor dword ptr [L770c4], eax
    jmp near ptr L74ada
L749cd::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 04h
    jb near ptr L76b28
L749de::
    shl eax, 0ch
    or eax, 0fffh
    xor dword ptr [L770c4], eax
    jmp near ptr L74ada
L749f1::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 0ch
    jb near ptr L76b34
L74a02::
    or ah, 0f0h
    xor dword ptr [L770c4], eax
    jmp near ptr L74ada
L74a10::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 08h
    jb near ptr L76b40
L74a21::
    shl eax, 04h
    or eax, 0f00fh
    xor dword ptr [L770c4], eax
    jmp near ptr L74ada
L74a34::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 08h
    jb near ptr L76b4c
L74a45::
    mov ah, al
    ror ah, 04h
    or eax, 0f0f0h
    xor dword ptr [L770c4], eax
    jmp near ptr L74ada
L74a5a::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 04h
    jb near ptr L76b58
L74a6b::
    mov ah, al
    or eax, 0f0ffh
    xor dword ptr [L770c4], eax
    jmp short L74ada
L74a7a::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 08h
    jb near ptr L76b64
L74a8b::
    mov ah, 0ffh
    xor dword ptr [L770c4], eax
    jmp short L74ada
L74a95::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 04h
    jb near ptr L76b70
L74aa6::
    or eax, 0fff0h
    rol al, 04h
    xor dword ptr [L770c4], eax
    jmp short L74ada
L74ab6::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 04h
    jb near ptr L76b7c
L74ac7::
    or eax, 0fff0h
    xor dword ptr [L770c4], eax
    jmp short L74ada
L74ad4::
    not dword ptr [L770c4]
L74ada::
    test byte ptr [L770c4], 0ffh
    je near ptr L7536e
    test byte ptr [L770c4], 01h
    je near ptr L75306
L74af4::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb near ptr L76b88
L74b01::
    and eax, 01h
    jne short L74b0d
    mov al, byte ptr [L77150]
    jmp short L74b31
L74b0d::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb near ptr L76b94
L74b1a::
    and eax, 01h
    mov al, byte ptr [L77150]
    je short L74b26
    inc al
L74b26::
    sub al, 02h
    sbb al, 00h
    and al, 03h
    mov byte ptr [L77150], al
L74b31::
    or al, al
    je short L74b7d
    test al, 02h
    jne short L74b5b
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L77194]
    jb near ptr L76ba0
L74b4d::
    and eax, dword ptr [L77190]
    mov edx, dword ptr [L770ac]
    jmp short L74b9d
L74b5b::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L77196]
    jb near ptr L76bac
L74b6f::
    and eax, dword ptr [L7718c]
    mov edx, dword ptr [L770b4]
    jmp short L74b9d
L74b7d::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L77195]
    jb near ptr L76bb8
L74b91::
    and eax, dword ptr [L77188]
    mov edx, dword ptr [L77164]
L74b9d::
    shl eax, 03h
    add edx, eax
    sub edi, 010000h
    cmp di, 0f600h
    jae short L74bc2
    jmp short L74bdb
    mov ebx, dword ptr [edx-02h]
    mov eax, dword ptr [edx]
    mov bx, ax
    mov ax, word ptr [edx+02h]
    mov dword ptr [edi], ebx
    mov dword ptr [edi+04h], eax
L74bc2::
    mov ebx, dword ptr [edx+02h]
    mov eax, dword ptr [edx+04h]
    mov bx, ax
    mov ax, word ptr [edx+06h]
    mov dword ptr [edi+0a00h], ebx
    mov dword ptr [edi+0a04h], eax
L74bdb::
    add edi, 010000h
    test byte ptr [L770c4], 02h
    je near ptr L75313
L74bee::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb near ptr L76bc4
L74bfb::
    and eax, 01h
    jne short L74c07
    mov al, byte ptr [L77150]
    jmp short L74c2b
L74c07::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb near ptr L76bd0
L74c14::
    and eax, 01h
    mov al, byte ptr [L77150]
    je short L74c20
    inc al
L74c20::
    sub al, 02h
    sbb al, 00h
    and al, 03h
    mov byte ptr [L77150], al
L74c2b::
    or al, al
    je short L74c77
    test al, 02h
    jne short L74c55
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L77194]
    jb near ptr L76bdc
L74c47::
    and eax, dword ptr [L77190]
    mov edx, dword ptr [L770ac]
    jmp short L74c97
L74c55::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L77196]
    jb near ptr L76be8
L74c69::
    and eax, dword ptr [L7718c]
    mov edx, dword ptr [L770b4]
    jmp short L74c97
L74c77::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L77195]
    jb near ptr L76bf4
L74c8b::
    and eax, dword ptr [L77188]
    mov edx, dword ptr [L77164]
L74c97::
    shl eax, 03h
    add edx, eax
    sub edi, 010000h
    cmp di, 0fff8h
    jae short L74cb1
    cmp di, 0f5f8h
    jae short L74cc3
    jmp short L74cdc
L74cb1::
    mov ebx, dword ptr [edx-02h]
    mov eax, dword ptr [edx]
    mov bx, ax
    mov ax, word ptr [edx+02h]
    mov dword ptr [edi+08h], ebx
    mov dword ptr [edi+0ch], eax
L74cc3::
    mov ebx, dword ptr [edx+02h]
    mov eax, dword ptr [edx+04h]
    mov bx, ax
    mov ax, word ptr [edx+06h]
    mov dword ptr [edi+0a08h], ebx
    mov dword ptr [edi+0a0ch], eax
L74cdc::
    add edi, 010000h
    test byte ptr [L770c4], 010h
    je near ptr L75320
L74cef::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb near ptr L76c00
L74cfc::
    and eax, 01h
    jne short L74d08
    mov al, byte ptr [L77150]
    jmp short L74d2c
L74d08::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb near ptr L76c0c
L74d15::
    and eax, 01h
    mov al, byte ptr [L77150]
    je short L74d21
    inc al
L74d21::
    sub al, 02h
    sbb al, 00h
    and al, 03h
    mov byte ptr [L77150], al
L74d2c::
    or al, al
    je short L74d78
    test al, 02h
    jne short L74d56
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L77194]
    jb near ptr L76c18
L74d48::
    and eax, dword ptr [L77190]
    mov edx, dword ptr [L770ac]
    jmp short L74d98
L74d56::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L77196]
    jb near ptr L76c24
L74d6a::
    and eax, dword ptr [L7718c]
    mov edx, dword ptr [L770b4]
    jmp short L74d98
L74d78::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L77195]
    jb near ptr L76c30
L74d8c::
    and eax, dword ptr [L77188]
    mov edx, dword ptr [L77164]
L74d98::
    shl eax, 03h
    add edx, eax
    sub edi, 010000h
    cmp di, 0fff0h
    jae short L74db2
    cmp di, 0f5f0h
    jae short L74dc4
    jmp short L74ddd
L74db2::
    mov ebx, dword ptr [edx-02h]
    mov eax, dword ptr [edx]
    mov bx, ax
    mov ax, word ptr [edx+02h]
    mov dword ptr [edi+010h], ebx
    mov dword ptr [edi+014h], eax
L74dc4::
    mov ebx, dword ptr [edx+02h]
    mov eax, dword ptr [edx+04h]
    mov bx, ax
    mov ax, word ptr [edx+06h]
    mov dword ptr [edi+0a10h], ebx
    mov dword ptr [edi+0a14h], eax
L74ddd::
    add edi, 010000h
    test byte ptr [L770c4], 020h
    je near ptr L7532d
L74df0::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb near ptr L76c3c
L74dfd::
    and eax, 01h
    jne short L74e09
    mov al, byte ptr [L77150]
    jmp short L74e2d
L74e09::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb near ptr L76c48
L74e16::
    and eax, 01h
    mov al, byte ptr [L77150]
    je short L74e22
    inc al
L74e22::
    sub al, 02h
    sbb al, 00h
    and al, 03h
    mov byte ptr [L77150], al
L74e2d::
    or al, al
    je short L74e79
    test al, 02h
    jne short L74e57
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L77194]
    jb near ptr L76c54
L74e49::
    and eax, dword ptr [L77190]
    mov edx, dword ptr [L770ac]
    jmp short L74e99
L74e57::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L77196]
    jb near ptr L76c60
L74e6b::
    and eax, dword ptr [L7718c]
    mov edx, dword ptr [L770b4]
    jmp short L74e99
L74e79::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L77195]
    jb near ptr L76c6c
L74e8d::
    and eax, dword ptr [L77188]
    mov edx, dword ptr [L77164]
L74e99::
    shl eax, 03h
    add edx, eax
    sub edi, 010000h
    cmp di, 0ffe8h
    jae short L74eb3
    cmp di, 0f5e8h
    jae short L74ec5
    jmp short L74ede
L74eb3::
    mov ebx, dword ptr [edx-02h]
    mov eax, dword ptr [edx]
    mov bx, ax
    mov ax, word ptr [edx+02h]
    mov dword ptr [edi+018h], ebx
    mov dword ptr [edi+01ch], eax
L74ec5::
    mov ebx, dword ptr [edx+02h]
    mov eax, dword ptr [edx+04h]
    mov bx, ax
    mov ax, word ptr [edx+06h]
    mov dword ptr [edi+0a18h], ebx
    mov dword ptr [edi+0a1ch], eax
L74ede::
    add edi, 010000h
    test byte ptr [L770c4], 04h
    je near ptr L7533a
L74ef1::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb near ptr L76c78
L74efe::
    and eax, 01h
    jne short L74f0a
    mov al, byte ptr [L77150]
    jmp short L74f2e
L74f0a::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb near ptr L76c84
L74f17::
    and eax, 01h
    mov al, byte ptr [L77150]
    je short L74f23
    inc al
L74f23::
    sub al, 02h
    sbb al, 00h
    and al, 03h
    mov byte ptr [L77150], al
L74f2e::
    or al, al
    je short L74f7a
    test al, 02h
    jne short L74f58
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L77194]
    jb near ptr L76c90
L74f4a::
    and eax, dword ptr [L77190]
    mov edx, dword ptr [L770ac]
    jmp short L74f9a
L74f58::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L77196]
    jb near ptr L76c9c
L74f6c::
    and eax, dword ptr [L7718c]
    mov edx, dword ptr [L770b4]
    jmp short L74f9a
L74f7a::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L77195]
    jb near ptr L76ca8
L74f8e::
    and eax, dword ptr [L77188]
    mov edx, dword ptr [L77164]
L74f9a::
    shl eax, 03h
    add edx, eax
    sub edi, 010000h
    cmp di, 0ec00h
    jae short L74fb5
    cmp di, 0e200h
    jae short L74fcd
    jmp short L74fe6
L74fb5::
    mov ebx, dword ptr [edx-02h]
    mov eax, dword ptr [edx]
    mov bx, ax
    mov ax, word ptr [edx+02h]
    mov dword ptr [edi+01400h], ebx
    mov dword ptr [edi+01404h], eax
L74fcd::
    mov ebx, dword ptr [edx+02h]
    mov eax, dword ptr [edx+04h]
    mov bx, ax
    mov ax, word ptr [edx+06h]
    mov dword ptr [edi+01e00h], ebx
    mov dword ptr [edi+01e04h], eax
L74fe6::
    add edi, 010000h
    test byte ptr [L770c4], 08h
    je near ptr L75347
L74ff9::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb near ptr L76cb4
L75006::
    and eax, 01h
    jne short L75012
    mov al, byte ptr [L77150]
    jmp short L75036
L75012::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb near ptr L76cc0
L7501f::
    and eax, 01h
    mov al, byte ptr [L77150]
    je short L7502b
    inc al
L7502b::
    sub al, 02h
    sbb al, 00h
    and al, 03h
    mov byte ptr [L77150], al
L75036::
    or al, al
    je short L75082
    test al, 02h
    jne short L75060
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L77194]
    jb near ptr L76ccc
L75052::
    and eax, dword ptr [L77190]
    mov edx, dword ptr [L770ac]
    jmp short L750a2
L75060::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L77196]
    jb near ptr L76cd8
L75074::
    and eax, dword ptr [L7718c]
    mov edx, dword ptr [L770b4]
    jmp short L750a2
L75082::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L77195]
    jb near ptr L76ce4
L75096::
    and eax, dword ptr [L77188]
    mov edx, dword ptr [L77164]
L750a2::
    shl eax, 03h
    add edx, eax
    sub edi, 010000h
    cmp di, 0ebf8h
    jae short L750bd
    cmp di, 0e1f8h
    jae short L750d5
    jmp short L750ee
L750bd::
    mov ebx, dword ptr [edx-02h]
    mov eax, dword ptr [edx]
    mov bx, ax
    mov ax, word ptr [edx+02h]
    mov dword ptr [edi+01408h], ebx
    mov dword ptr [edi+0140ch], eax
L750d5::
    mov ebx, dword ptr [edx+02h]
    mov eax, dword ptr [edx+04h]
    mov bx, ax
    mov ax, word ptr [edx+06h]
    mov dword ptr [edi+01e08h], ebx
    mov dword ptr [edi+01e0ch], eax
L750ee::
    add edi, 010000h
    test byte ptr [L770c4], 040h
    je near ptr L75354
L75101::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb near ptr L76cf0
L7510e::
    and eax, 01h
    jne short L7511a
    mov al, byte ptr [L77150]
    jmp short L7513e
L7511a::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb near ptr L76cfc
L75127::
    and eax, 01h
    mov al, byte ptr [L77150]
    je short L75133
    inc al
L75133::
    sub al, 02h
    sbb al, 00h
    and al, 03h
    mov byte ptr [L77150], al
L7513e::
    or al, al
    je short L7518a
    test al, 02h
    jne short L75168
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L77194]
    jb near ptr L76d08
L7515a::
    and eax, dword ptr [L77190]
    mov edx, dword ptr [L770ac]
    jmp short L751aa
L75168::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L77196]
    jb near ptr L76d14
L7517c::
    and eax, dword ptr [L7718c]
    mov edx, dword ptr [L770b4]
    jmp short L751aa
L7518a::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L77195]
    jb near ptr L76d20
L7519e::
    and eax, dword ptr [L77188]
    mov edx, dword ptr [L77164]
L751aa::
    shl eax, 03h
    add edx, eax
    sub edi, 010000h
    cmp di, 0ebf0h
    jae short L751c5
    cmp di, 0e1f0h
    jae short L751dd
    jmp short L751f6
L751c5::
    mov ebx, dword ptr [edx-02h]
    mov eax, dword ptr [edx]
    mov bx, ax
    mov ax, word ptr [edx+02h]
    mov dword ptr [edi+01410h], ebx
    mov dword ptr [edi+01414h], eax
L751dd::
    mov ebx, dword ptr [edx+02h]
    mov eax, dword ptr [edx+04h]
    mov bx, ax
    mov ax, word ptr [edx+06h]
    mov dword ptr [edi+01e10h], ebx
    mov dword ptr [edi+01e14h], eax
L751f6::
    add edi, 010000h
    test byte ptr [L770c4], 080h
    je near ptr L75361
L75209::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb near ptr L76d2c
L75216::
    and eax, 01h
    jne short L75222
    mov al, byte ptr [L77150]
    jmp short L75246
L75222::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb near ptr L76d38
L7522f::
    and eax, 01h
    mov al, byte ptr [L77150]
    je short L7523b
    inc al
L7523b::
    sub al, 02h
    sbb al, 00h
    and al, 03h
    mov byte ptr [L77150], al
L75246::
    or al, al
    je short L75292
    test al, 02h
    jne short L75270
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L77194]
    jb near ptr L76d44
L75262::
    and eax, dword ptr [L77190]
    mov edx, dword ptr [L770ac]
    jmp short L752b2
L75270::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L77196]
    jb near ptr L76d50
L75284::
    and eax, dword ptr [L7718c]
    mov edx, dword ptr [L770b4]
    jmp short L752b2
L75292::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L77195]
    jb near ptr L76d5c
L752a6::
    and eax, dword ptr [L77188]
    mov edx, dword ptr [L77164]
L752b2::
    shl eax, 03h
    add edx, eax
    sub edi, 010000h
    cmp di, 0ebe8h
    jae short L752cd
    cmp di, 0e1e8h
    jae short L752e5
    jmp short L752fe
L752cd::
    mov ebx, dword ptr [edx-02h]
    mov eax, dword ptr [edx]
    mov bx, ax
    mov ax, word ptr [edx+02h]
    mov dword ptr [edi+01418h], ebx
    mov dword ptr [edi+0141ch], eax
L752e5::
    mov ebx, dword ptr [edx+02h]
    mov eax, dword ptr [edx+04h]
    mov bx, ax
    mov ax, word ptr [edx+06h]
    mov dword ptr [edi+01e18h], ebx
    mov dword ptr [edi+01e1ch], eax
L752fe::
    add edi, 010000h
    jmp short L7536e
L75306::
    test byte ptr [L770c4], 01h
    jne near ptr L74af4
L75313::
    test byte ptr [L770c4], 02h
    jne near ptr L74bee
L75320::
    test byte ptr [L770c4], 010h
    jne near ptr L74cef
L7532d::
    test byte ptr [L770c4], 020h
    jne near ptr L74df0
L7533a::
    test byte ptr [L770c4], 04h
    jne near ptr L74ef1
L75347::
    test byte ptr [L770c4], 08h
    jne near ptr L74ff9
L75354::
    test byte ptr [L770c4], 040h
    jne near ptr L75101
L75361::
    test byte ptr [L770c4], 080h
    jne near ptr L75209
L7536e::
    test byte ptr [L770c5], 0ffh
    je near ptr L75da3
    test byte ptr [L770c5], 01h
    je near ptr L75bc0
L75388::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb near ptr L76d68
L75395::
    and eax, 01h
    jne short L753a1
    mov al, byte ptr [L77150]
    jmp short L753c5
L753a1::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb near ptr L76d74
L753ae::
    and eax, 01h
    mov al, byte ptr [L77150]
    je short L753ba
    inc al
L753ba::
    sub al, 02h
    sbb al, 00h
    and al, 03h
    mov byte ptr [L77150], al
L753c5::
    or al, al
    je short L75411
    test al, 02h
    jne short L753ef
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L77194]
    jb near ptr L76d80
L753e1::
    and eax, dword ptr [L77190]
    mov edx, dword ptr [L770ac]
    jmp short L75431
L753ef::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L77196]
    jb near ptr L76d8c
L75403::
    and eax, dword ptr [L7718c]
    mov edx, dword ptr [L770b4]
    jmp short L75431
L75411::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L77195]
    jb near ptr L76d98
L75425::
    and eax, dword ptr [L77188]
    mov edx, dword ptr [L77164]
L75431::
    shl eax, 03h
    add edx, eax
    sub edi, 010000h
    cmp di, 0d800h
    jae short L7544c
    cmp di, 0ce00h
    jae short L75464
    jmp short L7547d
L7544c::
    mov ebx, dword ptr [edx-02h]
    mov eax, dword ptr [edx]
    mov bx, ax
    mov ax, word ptr [edx+02h]
    mov dword ptr [edi+02800h], ebx
    mov dword ptr [edi+02804h], eax
L75464::
    mov ebx, dword ptr [edx+02h]
    mov eax, dword ptr [edx+04h]
    mov bx, ax
    mov ax, word ptr [edx+06h]
    mov dword ptr [edi+03200h], ebx
    mov dword ptr [edi+03204h], eax
L7547d::
    add edi, 010000h
    test byte ptr [L770c5], 02h
    je near ptr L75bcd
L75490::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb near ptr L76da4
L7549d::
    and eax, 01h
    jne short L754a9
    mov al, byte ptr [L77150]
    jmp short L754cd
L754a9::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb near ptr L76db0
L754b6::
    and eax, 01h
    mov al, byte ptr [L77150]
    je short L754c2
    inc al
L754c2::
    sub al, 02h
    sbb al, 00h
    and al, 03h
    mov byte ptr [L77150], al
L754cd::
    or al, al
    je short L75519
    test al, 02h
    jne short L754f7
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L77194]
    jb near ptr L76dbc
L754e9::
    and eax, dword ptr [L77190]
    mov edx, dword ptr [L770ac]
    jmp short L75539
L754f7::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L77196]
    jb near ptr L76dc8
L7550b::
    and eax, dword ptr [L7718c]
    mov edx, dword ptr [L770b4]
    jmp short L75539
L75519::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L77195]
    jb near ptr L76dd4
L7552d::
    and eax, dword ptr [L77188]
    mov edx, dword ptr [L77164]
L75539::
    shl eax, 03h
    add edx, eax
    sub edi, 010000h
    cmp di, 0d7f8h
    jae short L75554
    cmp di, 0cdf8h
    jae short L7556c
    jmp short L75585
L75554::
    mov ebx, dword ptr [edx-02h]
    mov eax, dword ptr [edx]
    mov bx, ax
    mov ax, word ptr [edx+02h]
    mov dword ptr [edi+02808h], ebx
    mov dword ptr [edi+0280ch], eax
L7556c::
    mov ebx, dword ptr [edx+02h]
    mov eax, dword ptr [edx+04h]
    mov bx, ax
    mov ax, word ptr [edx+06h]
    mov dword ptr [edi+03208h], ebx
    mov dword ptr [edi+0320ch], eax
L75585::
    add edi, 010000h
    test byte ptr [L770c5], 010h
    je near ptr L75bda
L75598::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb near ptr L76de0
L755a5::
    and eax, 01h
    jne short L755b1
    mov al, byte ptr [L77150]
    jmp short L755d5
L755b1::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb near ptr L76dec
L755be::
    and eax, 01h
    mov al, byte ptr [L77150]
    je short L755ca
    inc al
L755ca::
    sub al, 02h
    sbb al, 00h
    and al, 03h
    mov byte ptr [L77150], al
L755d5::
    or al, al
    je short L75621
    test al, 02h
    jne short L755ff
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L77194]
    jb near ptr L76df8
L755f1::
    and eax, dword ptr [L77190]
    mov edx, dword ptr [L770ac]
    jmp short L75641
L755ff::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L77196]
    jb near ptr L76e04
L75613::
    and eax, dword ptr [L7718c]
    mov edx, dword ptr [L770b4]
    jmp short L75641
L75621::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L77195]
    jb near ptr L76e10
L75635::
    and eax, dword ptr [L77188]
    mov edx, dword ptr [L77164]
L75641::
    shl eax, 03h
    add edx, eax
    sub edi, 010000h
    cmp di, 0d7f0h
    jae short L7565c
    cmp di, 0cdf0h
    jae short L75674
    jmp short L7568d
L7565c::
    mov ebx, dword ptr [edx-02h]
    mov eax, dword ptr [edx]
    mov bx, ax
    mov ax, word ptr [edx+02h]
    mov dword ptr [edi+02810h], ebx
    mov dword ptr [edi+02814h], eax
L75674::
    mov ebx, dword ptr [edx+02h]
    mov eax, dword ptr [edx+04h]
    mov bx, ax
    mov ax, word ptr [edx+06h]
    mov dword ptr [edi+03210h], ebx
    mov dword ptr [edi+03214h], eax
L7568d::
    add edi, 010000h
    test byte ptr [L770c5], 020h
    je near ptr L75be7
L756a0::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb near ptr L76e1c
L756ad::
    and eax, 01h
    jne short L756b9
    mov al, byte ptr [L77150]
    jmp short L756dd
L756b9::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb near ptr L76e28
L756c6::
    and eax, 01h
    mov al, byte ptr [L77150]
    je short L756d2
    inc al
L756d2::
    sub al, 02h
    sbb al, 00h
    and al, 03h
    mov byte ptr [L77150], al
L756dd::
    or al, al
    je short L75729
    test al, 02h
    jne short L75707
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L77194]
    jb near ptr L76e34
L756f9::
    and eax, dword ptr [L77190]
    mov edx, dword ptr [L770ac]
    jmp short L75749
L75707::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L77196]
    jb near ptr L76e40
L7571b::
    and eax, dword ptr [L7718c]
    mov edx, dword ptr [L770b4]
    jmp short L75749
L75729::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L77195]
    jb near ptr L76e4c
L7573d::
    and eax, dword ptr [L77188]
    mov edx, dword ptr [L77164]
L75749::
    shl eax, 03h
    add edx, eax
    sub edi, 010000h
    cmp di, 0d7e8h
    jae short L75764
    cmp di, 0cde8h
    jae short L7577c
    jmp short L75795
L75764::
    mov ebx, dword ptr [edx-02h]
    mov eax, dword ptr [edx]
    mov bx, ax
    mov ax, word ptr [edx+02h]
    mov dword ptr [edi+02818h], ebx
    mov dword ptr [edi+0281ch], eax
L7577c::
    mov ebx, dword ptr [edx+02h]
    mov eax, dword ptr [edx+04h]
    mov bx, ax
    mov ax, word ptr [edx+06h]
    mov dword ptr [edi+03218h], ebx
    mov dword ptr [edi+0321ch], eax
L75795::
    add edi, 010000h
    test byte ptr [L770c5], 04h
    je near ptr L75bf4
L757a8::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb near ptr L76e58
L757b5::
    and eax, 01h
    jne short L757c1
    mov al, byte ptr [L77150]
    jmp short L757e5
L757c1::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb near ptr L76e64
L757ce::
    and eax, 01h
    mov al, byte ptr [L77150]
    je short L757da
    inc al
L757da::
    sub al, 02h
    sbb al, 00h
    and al, 03h
    mov byte ptr [L77150], al
L757e5::
    or al, al
    je short L75831
    test al, 02h
    jne short L7580f
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L77194]
    jb near ptr L76e70
L75801::
    and eax, dword ptr [L77190]
    mov edx, dword ptr [L770ac]
    jmp short L75851
L7580f::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L77196]
    jb near ptr L76e7c
L75823::
    and eax, dword ptr [L7718c]
    mov edx, dword ptr [L770b4]
    jmp short L75851
L75831::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L77195]
    jb near ptr L76e88
L75845::
    and eax, dword ptr [L77188]
    mov edx, dword ptr [L77164]
L75851::
    shl eax, 03h
    add edx, eax
    sub edi, 010000h
    cmp di, 0c400h
    jae short L7586c
    cmp di, 0ba00h
    jae short L75884
    jmp short L7589d
L7586c::
    mov ebx, dword ptr [edx-02h]
    mov eax, dword ptr [edx]
    mov bx, ax
    mov ax, word ptr [edx+02h]
    mov dword ptr [edi+03c00h], ebx
    mov dword ptr [edi+03c04h], eax
L75884::
    mov ebx, dword ptr [edx+02h]
    mov eax, dword ptr [edx+04h]
    mov bx, ax
    mov ax, word ptr [edx+06h]
    mov dword ptr [edi+04600h], ebx
    mov dword ptr [edi+04604h], eax
L7589d::
    add edi, 010000h
    test byte ptr [L770c5], 08h
    je near ptr L75c01
L758b0::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb near ptr L76e94
L758bd::
    and eax, 01h
    jne short L758c9
    mov al, byte ptr [L77150]
    jmp short L758ed
L758c9::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb near ptr L76ea0
L758d6::
    and eax, 01h
    mov al, byte ptr [L77150]
    je short L758e2
    inc al
L758e2::
    sub al, 02h
    sbb al, 00h
    and al, 03h
    mov byte ptr [L77150], al
L758ed::
    or al, al
    je short L75939
    test al, 02h
    jne short L75917
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L77194]
    jb near ptr L76eac
L75909::
    and eax, dword ptr [L77190]
    mov edx, dword ptr [L770ac]
    jmp short L75959
L75917::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L77196]
    jb near ptr L76eb8
L7592b::
    and eax, dword ptr [L7718c]
    mov edx, dword ptr [L770b4]
    jmp short L75959
L75939::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L77195]
    jb near ptr L76ec4
L7594d::
    and eax, dword ptr [L77188]
    mov edx, dword ptr [L77164]
L75959::
    shl eax, 03h
    add edx, eax
    sub edi, 010000h
    cmp di, 0c3f8h
    jae short L75974
    cmp di, 0b9f8h
    jae short L7598c
    jmp short L759a5
L75974::
    mov ebx, dword ptr [edx-02h]
    mov eax, dword ptr [edx]
    mov bx, ax
    mov ax, word ptr [edx+02h]
    mov dword ptr [edi+03c08h], ebx
    mov dword ptr [edi+03c0ch], eax
L7598c::
    mov ebx, dword ptr [edx+02h]
    mov eax, dword ptr [edx+04h]
    mov bx, ax
    mov ax, word ptr [edx+06h]
    mov dword ptr [edi+04608h], ebx
    mov dword ptr [edi+0460ch], eax
L759a5::
    add edi, 010000h
    test byte ptr [L770c5], 040h
    je near ptr L75c0e
L759b8::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb near ptr L76ed0
L759c5::
    and eax, 01h
    jne short L759d1
    mov al, byte ptr [L77150]
    jmp short L759f5
L759d1::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb near ptr L76edc
L759de::
    and eax, 01h
    mov al, byte ptr [L77150]
    je short L759ea
    inc al
L759ea::
    sub al, 02h
    sbb al, 00h
    and al, 03h
    mov byte ptr [L77150], al
L759f5::
    or al, al
    je short L75a41
    test al, 02h
    jne short L75a1f
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L77194]
    jb near ptr L76ee8
L75a11::
    and eax, dword ptr [L77190]
    mov edx, dword ptr [L770ac]
    jmp short L75a61
L75a1f::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L77196]
    jb near ptr L76ef4
L75a33::
    and eax, dword ptr [L7718c]
    mov edx, dword ptr [L770b4]
    jmp short L75a61
L75a41::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L77195]
    jb near ptr L76f00
L75a55::
    and eax, dword ptr [L77188]
    mov edx, dword ptr [L77164]
L75a61::
    shl eax, 03h
    add edx, eax
    sub edi, 010000h
    cmp di, 0c3f0h
    jae short L75a7c
    cmp di, 0b9f0h
    jae short L75a94
    jmp short L75aad
L75a7c::
    mov ebx, dword ptr [edx-02h]
    mov eax, dword ptr [edx]
    mov bx, ax
    mov ax, word ptr [edx+02h]
    mov dword ptr [edi+03c10h], ebx
    mov dword ptr [edi+03c14h], eax
L75a94::
    mov ebx, dword ptr [edx+02h]
    mov eax, dword ptr [edx+04h]
    mov bx, ax
    mov ax, word ptr [edx+06h]
    mov dword ptr [edi+04610h], ebx
    mov dword ptr [edi+04614h], eax
L75aad::
    add edi, 010000h
    test byte ptr [L770c5], 080h
    je near ptr L75c1b
L75ac0::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb near ptr L76f0c
L75acd::
    and eax, 01h
    jne short L75ad9
    mov al, byte ptr [L77150]
    jmp short L75afd
L75ad9::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb near ptr L76f18
L75ae6::
    and eax, 01h
    mov al, byte ptr [L77150]
    je short L75af2
    inc al
L75af2::
    sub al, 02h
    sbb al, 00h
    and al, 03h
    mov byte ptr [L77150], al
L75afd::
    or al, al
    je short L75b49
    test al, 02h
    jne short L75b27
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L77194]
    jb near ptr L76f24
L75b19::
    and eax, dword ptr [L77190]
    mov edx, dword ptr [L770ac]
    jmp short L75b69
L75b27::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L77196]
    jb near ptr L76f30
L75b3b::
    and eax, dword ptr [L7718c]
    mov edx, dword ptr [L770b4]
    jmp short L75b69
L75b49::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L77195]
    jb near ptr L76f3c
L75b5d::
    and eax, dword ptr [L77188]
    mov edx, dword ptr [L77164]
L75b69::
    shl eax, 03h
    add edx, eax
    sub edi, 010000h
    cmp di, 0c3e8h
    jae short L75b84
    cmp di, 0b9e8h
    jae short L75b9c
    jmp short L75bb5
L75b84::
    mov ebx, dword ptr [edx-02h]
    mov eax, dword ptr [edx]
    mov bx, ax
    mov ax, word ptr [edx+02h]
    mov dword ptr [edi+03c18h], ebx
    mov dword ptr [edi+03c1ch], eax
L75b9c::
    mov ebx, dword ptr [edx+02h]
    mov eax, dword ptr [edx+04h]
    mov bx, ax
    mov ax, word ptr [edx+06h]
    mov dword ptr [edi+04618h], ebx
    mov dword ptr [edi+0461ch], eax
L75bb5::
    add edi, 010000h
    jmp near ptr L75da3
L75bc0::
    test byte ptr [L770c5], 01h
    jne near ptr L75388
L75bcd::
    test byte ptr [L770c5], 02h
    jne near ptr L75490
L75bda::
    test byte ptr [L770c5], 010h
    jne near ptr L75598
L75be7::
    test byte ptr [L770c5], 020h
    jne near ptr L756a0
L75bf4::
    test byte ptr [L770c5], 04h
    jne near ptr L757a8
L75c01::
    test byte ptr [L770c5], 08h
    jne near ptr L758b0
L75c0e::
    test byte ptr [L770c5], 040h
    jne near ptr L759b8
L75c1b::
    test byte ptr [L770c5], 080h
    jne near ptr L75ac0
    jmp near ptr L75da3
L75c2d::
    test dword ptr [L77154], 010000h
    jne near ptr L75d8e
    jmp near ptr L75da3
L75c42::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb near ptr L76f48
L75c4f::
    and eax, 01h
    jne short L75c5b
    mov al, byte ptr [L77150]
    jmp short L75c7f
L75c5b::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb near ptr L76f54
L75c68::
    and eax, 01h
    mov al, byte ptr [L77150]
    je short L75c74
    inc al
L75c74::
    sub al, 02h
    sbb al, 00h
    and al, 03h
    mov byte ptr [L77150], al
L75c7f::
    or al, al
    je near ptr L75d12
    test al, 02h
    jne short L75cad
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L77194]
    jb near ptr L76f60
L75c9f::
    and eax, dword ptr [L77190]
    mov edx, dword ptr [L770ac]
    jmp short L75ccd
L75cad::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L77196]
    jb near ptr L76f6c
L75cc1::
    and eax, dword ptr [L7718c]
    mov edx, dword ptr [L770b4]
L75ccd::
    shl eax, 03h
    add edx, eax
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 04h
    jb near ptr L76f78
L75ce3::
    and eax, 0fh
    mov ebx, dword ptr [edx-02h]
    mov dword ptr [L7709c], ecx
    mov ecx, dword ptr [edx]
    mov bx, cx
    mov dword ptr [L770a0], ebp
    mov dword ptr [L77098], esi
    mov esi, dword ptr [edx+02h]
    mov cx, si
    mov ebp, dword ptr [edx+04h]
    mov si, bp
    mov bp, word ptr [edx+06h]
    jmp short L75d75
L75d12::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [L77195]
    jb near ptr L76f84
L75d26::
    and eax, dword ptr [L77188]
    mov edx, dword ptr [L77164]
    shl eax, 03h
    add edx, eax
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 04h
    jb near ptr L76f90
L75d48::
    and eax, 0fh
    mov ebx, dword ptr [edx-02h]
    mov dword ptr [L7709c], ecx
    mov ecx, dword ptr [edx]
    mov bx, cx
    mov dword ptr [L770a0], ebp
    mov dword ptr [L77098], esi
    mov esi, dword ptr [edx+02h]
    mov cx, si
    mov ebp, dword ptr [edx+04h]
    mov si, bp
    mov bp, word ptr [edx+06h]
L75d75::
    call dword ptr [eax*4+L70cd7]
    mov esi, dword ptr [L77098]
    mov ecx, dword ptr [L7709c]
    mov ebp, dword ptr [L770a0]
L75d8e::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb near ptr L76f9c
L75d9b::
    test al, 01h
    je near ptr L75c42
L75da3::
    mov edx, 01h
    mov edi, dword ptr [L770a8]
    jmp near ptr L741e7
L75db3::
    mov dword ptr [L770a8], edi
    lea edi, [L77198]
    jmp near ptr L742c0
L75dc4::
    shld ebx, edi, 010h
    ret
    db 02eh, 08bh, 0c0h
    add byte ptr [eax], al
    mov eax, eax
L75dd0::
    pusha
    mov ax, bx
    call Func75f7c_
    popa
    mov word ptr [L7708c], bx
    jmp near ptr L727ef
    mov eax, eax
    add byte ptr [eax], al
    mov eax, eax
L75dec::
    pusha
    mov ax, bx
    call Func75f7c_
    popa
    mov word ptr [L7708c], bx
    jmp near ptr L742ae
    pop edx
    pop ecx
    pop ebx
    pop eax
    pop edi
    pop esi
    leave
    ret
L75e0a::
    pop edx
    pop ecx
    pop ebx
    pop eax
    pop edi
    pop esi
    leave
    ret
Func748de_ endp
Func75e12_ proc near
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
    je short L75e28
    mov ax, 01h
L75e28::
    xor ax, 01h
    mov word ptr [L77094], ax
    mov eax, dword ptr [ebp+0ch]
    bsr ebx, eax
    sub ebx, 010h
    neg ebx
    mov byte ptr [L77998], bl
    pop edx
    pop ecx
    pop ebx
    pop eax
    pop edi
    pop esi
    leave
    ret
Func75e12_ endp
Func75e4b_ proc near
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
    jne short L75eab
    mov edx, 028h
L75eab::
    add edx, dword ptr [ebp+018h]
    mov dword ptr [ebp+020h], edx
    mov edx, dword ptr [ebp+024h]
    or edx, edx
    jne short L75ebd
    mov edx, 01eh
L75ebd::
    add edx, dword ptr [ebp+01ch]
    mov dword ptr [ebp+024h], edx
    mov ecx, 00h
L75ec8::
    mov edx, 00h
L75ecd::
    mov word ptr [edi], dx
    mov word ptr [edi+02h], cx
    add edi, 04h
    inc edx
    cmp edx, dword ptr [ebp+08h]
    jne short L75ecd
    inc ecx
    cmp ecx, dword ptr [ebp+0ch]
    jne short L75ec8
    mov edi, dword ptr [ebp+08h]
    mov edx, dword ptr [ebp+0ch]
    imul edi, edx
    dec edi
    shl edi, 02h
    add edi, dword ptr [ebp+02ch]
    mov edx, 0fffffffeh
L75ef8::
    movsx eax, word ptr [edi]
    add eax, eax
    add eax, dword ptr [ebp+010h]
    cmp eax, 050h
    jae short L75f65
    movsx esi, word ptr [edi+02h]
    add esi, esi
    add esi, dword ptr [ebp+014h]
    cmp esi, 03ch
    jae short L75f65
    test dword ptr [ebp+028h], 01h
    je short L75f32
    cmp eax, dword ptr [ebp+018h]
    jl short L75f65
    cmp eax, dword ptr [ebp+020h]
    jge short L75f65
    cmp esi, dword ptr [ebp+01ch]
    jl short L75f65
    cmp esi, dword ptr [ebp+024h]
    jge short L75f65
    jmp short L75f46
L75f32::
    cmp eax, dword ptr [ebp+018h]
    jl short L75f46
    cmp eax, dword ptr [ebp+020h]
    jge short L75f46
    cmp esi, dword ptr [ebp+01ch]
    jl short L75f46
    cmp esi, dword ptr [ebp+024h]
    jl short L75f65
L75f46::
    imul esi, esi, 02800h
    shl eax, 04h
    add eax, esi
    mov dword ptr [edi], eax
    mov dl, 0ffh
    sub edi, 04h
    cmp edi, dword ptr [ebp+02ch]
    jae short L75ef8
    pop edx
    pop ecx
    pop ebx
    pop eax
    pop edi
    pop esi
    leave
    ret
L75f65::
    mov dword ptr [edi], edx
    sub edi, 04h
    cmp edi, dword ptr [ebp+02ch]
    jae short L75ef8
    pop edx
    pop ecx
    pop ebx
    pop eax
    pop edi
    pop esi
    leave
    ret
Func75e4b_ endp
    db 090h, 000h, 000h, 08bh, 0c0h
Func75f7c_ proc near
    mov dword ptr [L77074], 04f05h
    mov cl, byte ptr [L77998]
    shl eax, cl
    mov dword ptr [L7706c], eax
    mov ax, word ptr [L77094]
    mov dword ptr [L77068], eax
    mov ax, ds
    mov es, ax
    mov ax, 0300h
    lea edi, [_Data77058]
    mov bx, 010h
    xor cx, cx
    int 031h
    ret
L75fb8::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L70de0
    nop
L75fc4::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L70e42
    nop
L75fd0::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L70fa1
    nop
L75fdc::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L70fba
    nop
L75fe8::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L70fd5
    nop
L75ff4::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L70ff0
    nop
L76000::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L71089
    nop
L7600c::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L7109e
    nop
L76018::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L710b7
    nop
L76024::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L710ee
    nop
L76030::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L71110
    nop
L7603c::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L71179
    nop
L76048::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L7145f
    nop
L76054::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L71478
    nop
L76060::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L714f1
    nop
L7606c::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L71512
    nop
L76078::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L71536
    nop
L76084::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L71556
    nop
L76090::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L71578
    nop
L7609c::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L7159f
    nop
L760a8::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L715c2
    nop
L760b4::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L715e6
    nop
L760c0::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L71605
    nop
L760cc::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L71629
    nop
L760d8::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L7164f
    nop
L760e4::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L7166f
    nop
L760f0::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L7168a
    nop
L760fc::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L716ab
    nop
L76108::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L716e5
    nop
L76114::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L716fe
    nop
L76120::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L71731
    nop
L7612c::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L71753
    nop
L76138::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L71775
    nop
L76144::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L717c9
    nop
L76150::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L717e2
    nop
L7615c::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L71815
    nop
L76168::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L71837
    nop
L76174::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L71859
    nop
L76180::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L718ae
    nop
L7618c::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L718c7
    nop
L76198::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L718fa
    nop
L761a4::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L7191c
    nop
L761b0::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L7193e
    nop
L761bc::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L71993
    nop
L761c8::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L719ac
    nop
L761d4::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L719df
    nop
L761e0::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L71a01
    nop
L761ec::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L71a23
    nop
L761f8::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L71a78
    nop
L76204::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L71a91
    nop
L76210::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L71ac4
    nop
L7621c::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L71ae6
    nop
L76228::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L71b08
    nop
L76234::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L71b63
    nop
L76240::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L71b7c
    nop
L7624c::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L71baf
    nop
L76258::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L71bd1
    nop
L76264::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L71bf3
    nop
L76270::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L71c4e
    nop
L7627c::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L71c67
    nop
L76288::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L71c9a
    nop
L76294::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L71cbc
    nop
L762a0::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L71cde
    nop
L762ac::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L71d39
    nop
L762b8::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L71d52
    nop
L762c4::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L71d85
    nop
L762d0::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L71da7
    nop
L762dc::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L71dc9
    nop
L762e8::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L71e9b
    nop
L762f4::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L71eb4
    nop
L76300::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L71ee7
    nop
L7630c::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L71f09
    nop
L76318::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L71f2b
    nop
L76324::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L71f86
    nop
L76330::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L71f9f
    nop
L7633c::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L71fd2
    nop
L76348::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L71ff4
    nop
L76354::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L72016
    nop
L76360::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L72071
    nop
L7636c::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L7208a
    nop
L76378::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L720bd
    nop
L76384::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L720df
    nop
L76390::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L72101
    nop
L7639c::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L7215c
    nop
L763a8::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L72175
    nop
L763b4::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L721a8
    nop
L763c0::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L721ca
    nop
L763cc::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L721ec
    nop
L763d8::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L72247
    nop
L763e4::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L72260
    nop
L763f0::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L72293
    nop
L763fc::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L722b5
    nop
L76408::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L722d7
    nop
L76414::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L72332
    nop
L76420::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L7234b
    nop
L7642c::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L7237e
    nop
L76438::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L723a0
    nop
L76444::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L723c2
    nop
L76450::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L7241d
    nop
L7645c::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L72436
    nop
L76468::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L72469
    nop
L76474::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L7248b
    nop
L76480::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L724ad
    nop
L7648c::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L72508
    nop
L76498::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L72521
    nop
L764a4::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L72554
    nop
L764b0::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L72576
    nop
L764bc::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L72598
    nop
L764c8::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L7266d
    nop
L764d4::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L72686
    nop
L764e0::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L726bd
    nop
L764ec::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L726df
    nop
L764f8::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L72701
    nop
L76504::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L72744
    nop
L76510::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L72766
    nop
L7651c::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L727b9
    nop
L76528::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L7285d
    nop
L76534::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L72872
    nop
L76540::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L7288b
    nop
L7654c::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L728c2
    nop
L76558::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L728e4
    nop
L76564::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L7294d
    nop
L76570::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L72d21
    nop
L7657c::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L72d3a
    nop
L76588::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L72db3
    nop
L76594::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L72dd4
    nop
L765a0::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L72df8
    nop
L765ac::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L72e18
    nop
L765b8::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L72e3a
    nop
L765c4::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L72e61
    nop
L765d0::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L72e84
    nop
L765dc::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L72ea8
    nop
L765e8::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L72ec7
    nop
L765f4::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L72eeb
    nop
L76600::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L72f11
    nop
L7660c::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L72f31
    nop
L76618::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L72f4c
    nop
L76624::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L72f6d
    nop
L76630::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L72fa7
    nop
L7663c::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L72fc0
    nop
L76648::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L72ff3
    nop
L76654::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L73015
    nop
L76660::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L73037
    nop
L7666c::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L73092
    nop
L76678::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L730ab
    nop
L76684::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L730de
    nop
L76690::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L73100
    nop
L7669c::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L73122
    nop
L766a8::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L73184
    nop
L766b4::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L7319d
    nop
L766c0::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L731d0
    nop
L766cc::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L731f2
    nop
L766d8::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L73214
    nop
L766e4::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L73276
    nop
L766f0::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L7328f
    nop
L766fc::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L732c2
    nop
L76708::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L732e4
    nop
L76714::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L73306
    nop
L76720::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L73368
    nop
L7672c::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L73381
    nop
L76738::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L733b4
    nop
L76744::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L733d6
    nop
L76750::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L733f8
    nop
L7675c::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L73461
    nop
L76768::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L7347a
    nop
L76774::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L734ad
    nop
L76780::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L734cf
    nop
L7678c::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L734f1
    nop
L76798::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L7355a
    nop
L767a4::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L73573
    nop
L767b0::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L735a6
    nop
L767bc::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L735c8
    nop
L767c8::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L735ea
    nop
L767d4::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L73653
    nop
L767e0::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L7366c
    nop
L767ec::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L7369f
    nop
L767f8::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L736c1
    nop
L76804::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L736e3
    nop
L76810::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L737c3
    nop
L7681c::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L737dc
    nop
L76828::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L7380f
    nop
L76834::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L73831
    nop
L76840::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L73853
    nop
L7684c::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L738bc
    nop
L76858::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L738d5
    nop
L76864::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L73908
    nop
L76870::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L7392a
    nop
L7687c::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L7394c
    nop
L76888::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L739b5
    nop
L76894::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L739ce
    nop
L768a0::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L73a01
    nop
L768ac::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L73a23
    nop
L768b8::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L73a45
    nop
L768c4::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L73aae
    nop
L768d0::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L73ac7
    nop
L768dc::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L73afa
    nop
L768e8::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L73b1c
    nop
L768f4::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L73b3e
    nop
L76900::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L73ba7
    nop
L7690c::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L73bc0
    nop
L76918::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L73bf3
    nop
L76924::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L73c15
    nop
L76930::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L73c37
    nop
L7693c::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L73ca0
    nop
L76948::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L73cb9
    nop
L76954::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L73cec
    nop
L76960::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L73d0e
    nop
L7696c::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L73d30
    nop
L76978::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L73d99
    nop
L76984::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L73db2
    nop
L76990::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L73de5
    nop
L7699c::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L73e07
    nop
L769a8::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L73e29
    nop
L769b4::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L73e92
    nop
L769c0::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L73eab
    nop
L769cc::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L73ede
    nop
L769d8::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L73f00
    nop
L769e4::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L73f22
    nop
L769f0::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L74005
    nop
L769fc::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L7401e
    nop
L76a08::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L74055
    nop
L76a14::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L74077
    nop
L76a20::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L74099
    nop
L76a2c::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L740dc
    nop
L76a38::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L740fe
    nop
L76a44::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L74151
    nop
L76a50::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L741f4
    nop
L76a5c::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L7420d
    nop
L76a68::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L74228
    nop
L76a74::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L74243
    nop
L76a80::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L742d7
    nop
L76a8c::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L742ec
    nop
L76a98::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L74305
    nop
L76aa4::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L7433c
    nop
L76ab0::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L7435e
    nop
L76abc::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L743c7
    nop
L76ac8::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L7487b
    nop
L76ad4::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L74894
    nop
L76ae0::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L7490d
    nop
L76aec::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L7492e
    nop
L76af8::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L74952
    nop
L76b04::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L74972
    nop
L76b10::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L74994
    nop
L76b1c::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L749bb
    nop
L76b28::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L749de
    nop
L76b34::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L74a02
    nop
L76b40::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L74a21
    nop
L76b4c::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L74a45
    nop
L76b58::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L74a6b
    nop
L76b64::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L74a8b
    nop
L76b70::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L74aa6
    nop
L76b7c::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L74ac7
    nop
L76b88::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L74b01
    nop
L76b94::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L74b1a
    nop
L76ba0::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L74b4d
    nop
L76bac::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L74b6f
    nop
L76bb8::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L74b91
    nop
L76bc4::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L74bfb
    nop
L76bd0::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L74c14
    nop
L76bdc::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L74c47
    nop
L76be8::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L74c69
    nop
L76bf4::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L74c8b
    nop
L76c00::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L74cfc
    nop
L76c0c::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L74d15
    nop
L76c18::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L74d48
    nop
L76c24::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L74d6a
    nop
L76c30::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L74d8c
    nop
L76c3c::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L74dfd
    nop
L76c48::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L74e16
    nop
L76c54::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L74e49
    nop
L76c60::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L74e6b
    nop
L76c6c::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L74e8d
    nop
L76c78::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L74efe
    nop
L76c84::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L74f17
    nop
L76c90::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L74f4a
    nop
L76c9c::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L74f6c
    nop
L76ca8::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L74f8e
    nop
L76cb4::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L75006
    nop
L76cc0::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L7501f
    nop
L76ccc::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L75052
    nop
L76cd8::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L75074
    nop
L76ce4::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L75096
    nop
L76cf0::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L7510e
    nop
L76cfc::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L75127
    nop
L76d08::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L7515a
    nop
L76d14::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L7517c
    nop
L76d20::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L7519e
    nop
L76d2c::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L75216
    nop
L76d38::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L7522f
    nop
L76d44::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L75262
    nop
L76d50::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L75284
    nop
L76d5c::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L752a6
    nop
L76d68::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L75395
    nop
L76d74::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L753ae
    nop
L76d80::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L753e1
    nop
L76d8c::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L75403
    nop
L76d98::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L75425
    nop
L76da4::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L7549d
    nop
L76db0::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L754b6
    nop
L76dbc::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L754e9
    nop
L76dc8::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L7550b
    nop
L76dd4::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L7552d
    nop
L76de0::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L755a5
    nop
L76dec::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L755be
    nop
L76df8::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L755f1
    nop
L76e04::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L75613
    nop
L76e10::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L75635
    nop
L76e1c::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L756ad
    nop
L76e28::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L756c6
    nop
L76e34::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L756f9
    nop
L76e40::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L7571b
    nop
L76e4c::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L7573d
    nop
L76e58::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L757b5
    nop
L76e64::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L757ce
    nop
L76e70::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L75801
    nop
L76e7c::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L75823
    nop
L76e88::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L75845
    nop
L76e94::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L758bd
    nop
L76ea0::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L758d6
    nop
L76eac::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L75909
    nop
L76eb8::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L7592b
    nop
L76ec4::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L7594d
    nop
L76ed0::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L759c5
    nop
L76edc::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L759de
    nop
L76ee8::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L75a11
    nop
L76ef4::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L75a33
    nop
L76f00::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L75a55
    nop
L76f0c::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L75acd
    nop
L76f18::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L75ae6
    nop
L76f24::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L75b19
    nop
L76f30::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L75b3b
    nop
L76f3c::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L75b5d
    nop
L76f48::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L75c4f
    nop
L76f54::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L75c68
    nop
L76f60::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L75c9f
    nop
L76f6c::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L75cc1
    nop
L76f78::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L75ce3
    nop
L76f84::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L75d26
    nop
L76f90::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L75d48
    nop
L76f9c::
    add esi, 04h
    or cl, 0e0h
    jmp near ptr L75d9b
    nop
L76fa8::
    add esi, 04h
    mov edx, dword ptr [esi+04h]
    or cl, 0e0h
    jmp near ptr L6f90a
    mov eax, eax
L76fb8::
    add esi, 04h
    mov edx, dword ptr [esi+04h]
    or cl, 0e0h
    jmp near ptr L6f918
    mov eax, eax
L76fc8::
    add esi, 04h
    mov edx, dword ptr [esi+04h]
    or cl, 0e0h
    jmp near ptr L6f939
    mov eax, eax
L76fd8::
    add esi, 04h
    mov edx, dword ptr [esi+04h]
    or cl, 0e0h
    jmp near ptr L6f947
    mov eax, eax
L76fe8::
    add esi, 04h
    mov edx, dword ptr [esi+04h]
    or cl, 0e0h
    jmp near ptr L70406
    mov eax, eax
L76ff8::
    add esi, 04h
    mov edx, dword ptr [esi+04h]
    or cl, 0e0h
    jmp near ptr L70414
    mov eax, eax
L77008::
    add esi, 04h
    mov edx, dword ptr [esi+04h]
    or cl, 0e0h
    jmp near ptr L70435
    mov eax, eax
L77018::
    add esi, 04h
    mov edx, dword ptr [esi+04h]
    or cl, 0e0h
    jmp near ptr L70453
    mov eax, eax
L77028::
    add esi, 04h
    mov edx, dword ptr [esi+04h]
    or cl, 0e0h
    jmp near ptr L70e10
    mov eax, eax
L77038::
    add esi, 04h
    mov edx, dword ptr [esi+04h]
    or cl, 0e0h
    jmp near ptr L70e78
    mov eax, eax
L77048::
    add esi, 04h
    mov edx, dword ptr [esi+04h]
    or cl, 0e0h
    jmp near ptr L70ee8
Func75f7c_ endp
    db 08bh, 0c0h
_Data77058 label byte
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
L77068 label byte
    db 000h, 000h, 000h, 000h
L7706c label byte
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
L77074 label byte
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 08bh, 0c0h
L7708c label byte
    db 000h, 000h, 08bh, 0c0h, 000h, 000h, 08bh, 0c0h
L77094 label byte
    db 000h, 000h, 08bh, 0c0h
L77098 label byte
    db 000h, 000h, 000h, 000h
L7709c label byte
    db 000h, 000h, 000h, 000h
L770a0 label byte
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
L770a8 label byte
    db 000h, 000h, 000h, 000h
L770ac label byte
    db 000h, 000h, 000h, 000h
L770b0 label byte
    db 000h, 000h, 000h, 000h
L770b4 label byte
    db 000h, 000h, 000h, 000h
L770b8 label byte
    db 000h, 000h, 000h, 000h
L770bc label byte
    db 000h, 000h, 000h, 000h
L770c0 label byte
    db 000h, 000h, 000h, 000h
L770c4 label byte
    db 000h
L770c5 label byte
    db 000h, 000h, 000h
L770c8 label byte
    db 001h, 000h, 000h, 000h, 002h, 000h, 000h, 000h, 004h, 000h, 000h, 000h, 008h, 000h, 000h, 000h
    db 010h, 000h, 000h, 000h, 020h, 000h, 000h, 000h, 040h, 000h, 000h, 000h, 080h, 000h, 000h, 000h
    db 000h, 001h, 000h, 000h, 000h, 002h, 000h, 000h, 000h, 004h, 000h, 000h, 000h, 008h, 000h, 000h
    db 000h, 010h, 000h, 000h, 000h, 020h, 000h, 000h, 000h, 040h, 000h, 000h, 000h, 080h, 000h, 000h
    db 000h, 000h, 001h, 000h, 000h, 000h, 002h, 000h, 000h, 000h, 004h, 000h, 000h, 000h, 008h, 000h
    db 000h, 000h, 010h, 000h, 000h, 000h, 020h, 000h, 000h, 000h, 040h, 000h, 000h, 000h, 080h, 000h
    db 000h, 000h, 000h, 001h, 000h, 000h, 000h, 002h, 000h, 000h, 000h, 004h, 000h, 000h, 000h, 008h
    db 000h, 000h, 000h, 010h, 000h, 000h, 000h, 020h, 000h, 000h, 000h, 040h, 000h, 000h, 000h, 080h
L77148 label byte
    db 000h, 000h, 000h, 000h
L7714c label byte
    db 000h, 000h, 000h, 000h
L77150 label byte
    db 000h, 02eh, 08bh, 0c0h
L77154 label byte
    db 000h, 000h, 000h, 000h
L77158 label byte
    db 000h, 000h, 000h, 000h
L7715c label byte
    db 000h, 000h, 000h, 000h
L77160 label byte
    db 000h, 000h, 000h, 000h
L77164 label byte
    db 000h, 000h, 000h, 000h
L77168 label byte
    db 000h, 000h, 000h, 000h
L7716c label byte
    db 000h, 02eh, 08bh, 0c0h
L77170 label byte
    db 000h, 000h, 000h, 000h
L77174 label byte
    db 000h, 000h, 000h, 000h
L77178 label byte
    db 000h, 000h, 000h, 000h
L7717c label byte
    db 000h, 000h, 000h, 000h
L77180 label byte
    db 000h, 000h, 000h, 000h
L77184 label byte
    db 000h, 02eh, 08bh, 0c0h
L77188 label byte
    db 000h, 000h, 000h, 000h
L7718c label byte
    db 000h, 000h, 000h, 000h
L77190 label byte
    db 000h, 000h, 000h, 000h
L77194 label byte
    db 000h
L77195 label byte
    db 000h
L77196 label byte
    db 000h
L77197 label byte
    db 000h
L77198 label byte
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
L77998 label byte
    db 000h, 02eh, 08bh, 0c0h
_TEXT ends

_DATA segment
_Dataca6f0 label byte
    db "$Id: 124D_E.ASM 1.13 1995/12/15 15:05:59 MDV Exp $"
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
_DATA ends

    end

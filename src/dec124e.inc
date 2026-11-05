_TEXT segment para public use32 'CODE'
_TEXT ends
_DATA segment dword public use32 'DATA'
_DATA ends

    assume cs:FLAT, ds:FLAT, es:FLAT, ss:FLAT

RMREGS struct
rm_edi      dword 0
rm_esi      dword 0
rm_ebp      dword 0
rm_reserved dword 0
rm_ebx      dword 0
rm_edx      dword 0
rm_ecx      dword 0
rm_eax      dword 0
rm_flags    word 0
rm_es       word 0
rm_ds       word 0
rm_fs       word 0
rm_gs       word 0
rm_ip       word 0
rm_cs       word 0
rm_sp       word 0
rm_ss       word 0
RMREGS ends

    public entry_0000
    public entry_0cb6
    public entry_1467
    public entry_1c12
    public entry_34d4
    public entry_490c
    public entry_502e
    public set_bank_mode
    public build_block_list
    public set_bank
    public bank_regs
    public id_string

_TEXT segment
entry_0000 proc near
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
L0020::
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
L0051::
    add cl, 0fh
    jb L76f8
L005a::
    mov eax, dword ptr [esi]
    shrd eax, edx, cl
    add cl, 0fh
    jb L7708
L0068::
    and eax, 07fffh
    mov word ptr [edi], ax
    mov word ptr [edi+02h], ax
    add edi, 08h
    mov word ptr [edi-04h], ax
    mov word ptr [edi-02h], ax
    ret
L0080::
    add cl, 0fh
    jb L7718
L0089::
    mov eax, dword ptr [esi]
    shrd eax, edx, cl
    add cl, 0fh
    jb L7728
L0097::
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
L00bf::
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
L00df::
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
L0110::
    mov eax, dword ptr [esi]
    shrd eax, edx, cl
    add cl, 01eh
    jae L0123
    add esi, 04h
    or cl, 0e0h
    mov edx, dword ptr [esi+04h]
L0123::
    and eax, 03fffffffh
    add eax, eax
    shr ax, 1
    mov word ptr [edi+04h], ax
    mov word ptr [edi+06h], ax
    rol eax, 010h
    mov dword ptr [edi], eax
    add edi, 08h
    ret
L013e::
    mov eax, dword ptr [esi]
    shrd eax, edx, cl
    add cl, 01eh
    jae L0151
    add esi, 04h
    or cl, 0e0h
    mov edx, dword ptr [esi+04h]
L0151::
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
L017d::
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
L019d::
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
L01ce::
    mov eax, dword ptr [esi]
    shrd eax, edx, cl
    add cl, 01eh
    jae L01e1
    add esi, 04h
    or cl, 0e0h
    mov edx, dword ptr [esi+04h]
L01e1::
    and eax, 03fffffffh
    add eax, eax
    shr ax, 1
    mov dword ptr [edi], eax
    add edi, 08h
    mov word ptr [edi-04h], ax
    mov word ptr [edi-02h], ax
    ret
L01f9::
    mov eax, dword ptr [esi]
    shrd eax, edx, cl
    add cl, 01eh
    jae L020c
    add esi, 04h
    or cl, 0e0h
    mov edx, dword ptr [esi+04h]
L020c::
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
L0235::
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
L0255::
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
L0286::
    mov eax, dword ptr [esi]
    shrd eax, edx, cl
    add cl, 01eh
    jae L0299
    add esi, 04h
    or cl, 0e0h
    mov edx, dword ptr [esi+04h]
L0299::
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
L02b9::
    mov eax, dword ptr [esi]
    shrd eax, edx, cl
    add cl, 01eh
    jae L02cc
    add esi, 04h
    or cl, 0e0h
    mov edx, dword ptr [esi+04h]
L02cc::
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
L02fd::
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
L031d::
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
L034e::
    mov eax, dword ptr [esi]
    shrd eax, edx, cl
    add cl, 01eh
    jae L0361
    add esi, 04h
    or cl, 0e0h
    mov edx, dword ptr [esi+04h]
L0361::
    and eax, 03fffffffh
    add eax, eax
    shr ax, 1
    mov word ptr [edi], ax
    mov word ptr [edi+02h], ax
    rol eax, 010h
    add edi, 08h
    mov dword ptr [edi-04h], eax
    ret
L037c::
    mov eax, dword ptr [esi]
    shrd eax, edx, cl
    add cl, 01eh
    jae L038f
    add esi, 04h
    or cl, 0e0h
    mov edx, dword ptr [esi+04h]
L038f::
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
L03bb::
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
L03db::
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
L040c::
    mov eax, dword ptr [esi]
    shrd eax, edx, cl
    add cl, 01eh
    jae L041f
    add esi, 04h
    or cl, 0e0h
    mov edx, dword ptr [esi+04h]
L041f::
    and eax, 03fffffffh
    add eax, eax
    shr ax, 1
    rol eax, 010h
    mov dword ptr [edi], eax
    add edi, 08h
    mov dword ptr [edi-04h], eax
    ret
L0435::
    mov eax, dword ptr [esi]
    shrd eax, edx, cl
    add cl, 01eh
    jae L0448
    add esi, 04h
    or cl, 0e0h
    mov edx, dword ptr [esi+04h]
L0448::
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
L046f::
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
L048f::
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
L04c0::
    mov eax, dword ptr [esi]
    shrd eax, edx, cl
    add cl, 01eh
    jae L04d3
    add esi, 04h
    or cl, 0e0h
    mov edx, dword ptr [esi+04h]
L04d3::
    and eax, 03fffffffh
    add eax, eax
    shr ax, 1
    mov dword ptr [edi], eax
    rol eax, 010h
    add edi, 08h
    mov dword ptr [edi-04h], eax
    ret
L04e9::
    mov eax, dword ptr [esi]
    shrd eax, edx, cl
    add cl, 01eh
    jae L04fc
    add esi, 04h
    or cl, 0e0h
    mov edx, dword ptr [esi+04h]
L04fc::
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
L0523::
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
L0543::
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
L0574::
    mov eax, dword ptr [esi]
    shrd eax, edx, cl
    add cl, 01eh
    jae L0587
    add esi, 04h
    or cl, 0e0h
    mov edx, dword ptr [esi+04h]
L0587::
    and eax, 03fffffffh
    add eax, eax
    shr ax, 1
    rol eax, 010h
    mov dword ptr [edi+04h], eax
    mov word ptr [edi], ax
    add edi, 08h
    mov word ptr [edi-06h], ax
    ret
L05a2::
    mov eax, dword ptr [esi]
    shrd eax, edx, cl
    add cl, 01eh
    jae L05b5
    add esi, 04h
    or cl, 0e0h
    mov edx, dword ptr [esi+04h]
L05b5::
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
L05e1::
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
L0601::
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
L0632::
    mov eax, dword ptr [esi]
    shrd eax, edx, cl
    add cl, 01eh
    jae L0645
    add esi, 04h
    or cl, 0e0h
    mov edx, dword ptr [esi+04h]
L0645::
    and eax, 03fffffffh
    add eax, eax
    shr ax, 1
    mov dword ptr [edi+04h], eax
    mov word ptr [edi], ax
    add edi, 08h
    mov word ptr [edi-06h], ax
    ret
L065d::
    mov eax, dword ptr [esi]
    shrd eax, edx, cl
    add cl, 01eh
    jae L0670
    add esi, 04h
    or cl, 0e0h
    mov edx, dword ptr [esi+04h]
L0670::
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
L0699::
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
L06b9::
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
L06ea::
    mov eax, dword ptr [esi]
    shrd eax, edx, cl
    add cl, 01eh
    jae L06fd
    add esi, 04h
    or cl, 0e0h
    mov edx, dword ptr [esi+04h]
L06fd::
    and eax, 03fffffffh
    add eax, eax
    shr ax, 1
    mov dword ptr [edi+04h], eax
    rol eax, 010h
    mov dword ptr [edi], eax
    add edi, 08h
    ret
L0713::
    mov eax, dword ptr [esi]
    shrd eax, edx, cl
    add cl, 01eh
    jae L0726
    add esi, 04h
    or cl, 0e0h
    mov edx, dword ptr [esi+04h]
L0726::
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
L074d::
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
L076d::
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
L079e::
    mov eax, dword ptr [esi]
    shrd eax, edx, cl
    add cl, 01eh
    jae L07b1
    add esi, 04h
    or cl, 0e0h
    mov edx, dword ptr [esi+04h]
L07b1::
    and eax, 03fffffffh
    add eax, eax
    shr ax, 1
    mov dword ptr [edi], eax
    add edi, 08h
    mov dword ptr [edi-04h], eax
    ret
L07c4::
    mov eax, dword ptr [esi]
    shrd eax, edx, cl
    add cl, 01eh
    jae L07d7
    add esi, 04h
    or cl, 0e0h
    mov edx, dword ptr [esi+04h]
L07d7::
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
L07fb::
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
L081b::
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
L084c::
    mov eax, dword ptr [esi]
    shrd eax, edx, cl
    add cl, 01eh
    jae L085f
    add esi, 04h
    or cl, 0e0h
    mov edx, dword ptr [esi+04h]
L085f::
    and eax, 03fffffffh
    add eax, eax
    shr ax, 1
    mov dword ptr [edi+04h], eax
    rol eax, 010h
    mov word ptr [edi+02h], ax
    mov word ptr [edi], ax
    add edi, 08h
    ret
L087a::
    mov eax, dword ptr [esi]
    shrd eax, edx, cl
    add cl, 01eh
    jae L088d
    add esi, 04h
    or cl, 0e0h
    mov edx, dword ptr [esi+04h]
L088d::
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
L08b9::
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
L08d9::
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
L090a::
    mov eax, dword ptr [esi]
    shrd eax, edx, cl
    add cl, 01eh
    jae L091d
    add esi, 04h
    or cl, 0e0h
    mov edx, dword ptr [esi+04h]
L091d::
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
L093d::
    mov eax, dword ptr [esi]
    shrd eax, edx, cl
    add cl, 01eh
    jae L0950
    add esi, 04h
    or cl, 0e0h
    mov edx, dword ptr [esi+04h]
L0950::
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
L0981::
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
L09a1::
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
L09d2::
    mov eax, dword ptr [esi]
    shrd eax, edx, cl
    add cl, 01eh
    jae L09e5
    add esi, 04h
    or cl, 0e0h
    mov edx, dword ptr [esi+04h]
L09e5::
    and eax, 03fffffffh
    add eax, eax
    shr ax, 1
    rol eax, 010h
    mov dword ptr [edi], eax
    add edi, 08h
    mov word ptr [edi-04h], ax
    mov word ptr [edi-02h], ax
    ret
L0a00::
    mov eax, dword ptr [esi]
    shrd eax, edx, cl
    add cl, 01eh
    jae L0a13
    add esi, 04h
    or cl, 0e0h
    mov edx, dword ptr [esi+04h]
L0a13::
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
L0a3f::
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
L0a5f::
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
L0a90::
    mov eax, dword ptr [esi]
    shrd eax, edx, cl
    add cl, 01eh
    jae L0aa3
    add esi, 04h
    or cl, 0e0h
    mov edx, dword ptr [esi+04h]
L0aa3::
    and eax, 03fffffffh
    add eax, eax
    shr ax, 1
    mov dword ptr [edi], eax
    rol eax, 010h
    add edi, 08h
    mov word ptr [edi-02h], ax
    mov word ptr [edi-04h], ax
    ret
L0abe::
    mov eax, dword ptr [esi]
    shrd eax, edx, cl
    add cl, 01eh
    jae L0ad1
    add esi, 04h
    or cl, 0e0h
    mov edx, dword ptr [esi+04h]
L0ad1::
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
L0afd::
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
L0b1a::
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
L0b48::
    mov eax, dword ptr [esi]
    shrd eax, edx, cl
    add cl, 0fh
    jb L7738
L0b56::
    and eax, 07fffh
    add cl, 0fh
    jb L7748
L0b64::
    mov word ptr [edi+04h], ax
    mov word ptr [edi+06h], ax
    mov word ptr [edi], ax
    add edi, 08h
    mov word ptr [edi-06h], ax
    ret
L0b77::
    mov eax, dword ptr [esi]
    shrd eax, edx, cl
    add cl, 0fh
    jb L7758
L0b85::
    and eax, 07fffh
    bswap ecx
    mov cl, al
    add ax, ax
    and al, 0c0h
    and cl, 01fh
    or al, cl
    bswap ecx
    add cl, 0fh
    jb L7768
L0ba3::
    mov word ptr [edi+04h], ax
    mov word ptr [edi+06h], ax
    mov word ptr [edi], ax
    add edi, 08h
    mov word ptr [edi-06h], ax
    ret
entry_0000 endp
block_writers dword offset L0051
    dword offset L0110
    dword offset L01ce
    dword offset L0286
    dword offset L034e
    dword offset L040c
    dword offset L04c0
    dword offset L0574
    dword offset L0632
    dword offset L06ea
    dword offset L079e
    dword offset L084c
    dword offset L090a
    dword offset L09d2
    dword offset L0a90
    dword offset L0b48
    dword offset L0080
    dword offset L013e
    dword offset L01f9
    dword offset L02b9
    dword offset L037c
    dword offset L0435
    dword offset L04e9
    dword offset L05a2
    dword offset L065d
    dword offset L0713
    dword offset L07c4
    dword offset L087a
    dword offset L093d
    dword offset L0a00
    dword offset L0abe
    dword offset L0b77
    dword offset entry_0000
    dword offset L00bf
    dword offset L017d
    dword offset L0235
    dword offset L02fd
    dword offset L03bb
    dword offset L046f
    dword offset L0523
    dword offset L05e1
    dword offset L0699
    dword offset L074d
    dword offset L07fb
    dword offset L08b9
    dword offset L0981
    dword offset L0a3f
    dword offset L0afd
    dword offset L0020
    dword offset L00df
    dword offset L019d
    dword offset L0255
    dword offset L031d
    dword offset L03db
    dword offset L048f
    dword offset L0543
    dword offset L0601
    dword offset L06b9
    dword offset L076d
    dword offset L081b
    dword offset L08d9
    dword offset L09a1
    dword offset L0a5f
    dword offset L0b1a
entry_0cb6 proc near
    mov dword ptr [edi], ebx
    mov dword ptr [edi+04h], ecx
    mov dword ptr [edi+0a00h], esi
    mov dword ptr [edi+0a04h], ebp
    ret
L0cc8::
    mov dword ptr [edi+08h], ebx
    mov dword ptr [edi+0ch], ecx
    mov dword ptr [edi+0a08h], esi
    mov dword ptr [edi+0a0ch], ebp
    ret
L0cdb::
    mov dword ptr [edi+010h], ebx
    mov dword ptr [edi+014h], ecx
    mov dword ptr [edi+0a10h], esi
    mov dword ptr [edi+0a14h], ebp
    ret
L0cee::
    mov dword ptr [edi+018h], ebx
    mov dword ptr [edi+01ch], ecx
    mov dword ptr [edi+0a18h], esi
    mov dword ptr [edi+0a1ch], ebp
    ret
L0d01::
    mov dword ptr [edi+01400h], ebx
    mov dword ptr [edi+01404h], ecx
    mov dword ptr [edi+01e00h], esi
    mov dword ptr [edi+01e04h], ebp
    ret
L0d1a::
    mov dword ptr [edi+01408h], ebx
    mov dword ptr [edi+0140ch], ecx
    mov dword ptr [edi+01e08h], esi
    mov dword ptr [edi+01e0ch], ebp
    ret
L0d33::
    mov dword ptr [edi+01410h], ebx
    mov dword ptr [edi+01414h], ecx
    mov dword ptr [edi+01e10h], esi
    mov dword ptr [edi+01e14h], ebp
    ret
L0d4c::
    mov dword ptr [edi+01418h], ebx
    mov dword ptr [edi+0141ch], ecx
    mov dword ptr [edi+01e18h], esi
    mov dword ptr [edi+01e1ch], ebp
    ret
L0d65::
    mov dword ptr [edi+02800h], ebx
    mov dword ptr [edi+02804h], ecx
    mov dword ptr [edi+03200h], esi
    mov dword ptr [edi+03204h], ebp
    ret
L0d7e::
    mov dword ptr [edi+02808h], ebx
    mov dword ptr [edi+0280ch], ecx
    mov dword ptr [edi+03208h], esi
    mov dword ptr [edi+0320ch], ebp
    ret
L0d97::
    mov dword ptr [edi+02810h], ebx
    mov dword ptr [edi+02814h], ecx
    mov dword ptr [edi+03210h], esi
    mov dword ptr [edi+03214h], ebp
    ret
L0db0::
    mov dword ptr [edi+02818h], ebx
    mov dword ptr [edi+0281ch], ecx
    mov dword ptr [edi+03218h], esi
    mov dword ptr [edi+0321ch], ebp
    ret
L0dc9::
    mov dword ptr [edi+03c00h], ebx
    mov dword ptr [edi+03c04h], ecx
    mov dword ptr [edi+04600h], esi
    mov dword ptr [edi+04604h], ebp
    ret
L0de2::
    mov dword ptr [edi+03c08h], ebx
    mov dword ptr [edi+03c0ch], ecx
    mov dword ptr [edi+04608h], esi
    mov dword ptr [edi+0460ch], ebp
    ret
L0dfb::
    mov dword ptr [edi+03c10h], ebx
    mov dword ptr [edi+03c14h], ecx
    mov dword ptr [edi+04610h], esi
    mov dword ptr [edi+04614h], ebp
    ret
L0e14::
    mov dword ptr [edi+03c18h], ebx
    mov dword ptr [edi+03c1ch], ecx
    mov dword ptr [edi+04618h], esi
    mov dword ptr [edi+0461ch], ebp
    ret
L0e2d::
    mov dword ptr [edi], ebx
    mov dword ptr [edi+04h], ecx
    cmp di, 0f600h
    jae L0e45
    mov dword ptr [edi+0a00h], esi
    mov dword ptr [edi+0a04h], ebp
L0e45::
    ret
L0e46::
    cmp di, 0fff8h
    jae L0e65
    mov dword ptr [edi+08h], ebx
    mov dword ptr [edi+0ch], ecx
    cmp di, 0f5f8h
    jae L0e65
    mov dword ptr [edi+0a08h], esi
    mov dword ptr [edi+0a0ch], ebp
L0e65::
    ret
L0e66::
    cmp di, 0fff0h
    jae L0e85
    mov dword ptr [edi+010h], ebx
    mov dword ptr [edi+014h], ecx
    cmp di, 0f5f0h
    jae L0e85
    mov dword ptr [edi+0a10h], esi
    mov dword ptr [edi+0a14h], ebp
L0e85::
    ret
L0e86::
    cmp di, 0ffe8h
    jae L0ea5
    mov dword ptr [edi+018h], ebx
    mov dword ptr [edi+01ch], ecx
    cmp di, 0f5e8h
    jae L0ea5
    mov dword ptr [edi+0a18h], esi
    mov dword ptr [edi+0a1ch], ebp
L0ea5::
    ret
L0ea6::
    cmp di, 0ec00h
    jae L0ecc
    mov dword ptr [edi+01400h], ebx
    mov dword ptr [edi+01404h], ecx
    cmp di, 0e200h
    jae L0ecc
    mov dword ptr [edi+01e00h], esi
    mov dword ptr [edi+01e04h], ebp
L0ecc::
    ret
L0ecd::
    cmp di, 0ebf8h
    jae L0ef3
    mov dword ptr [edi+01408h], ebx
    mov dword ptr [edi+0140ch], ecx
    cmp di, 0e1f8h
    jae L0ef3
    mov dword ptr [edi+01e08h], esi
    mov dword ptr [edi+01e0ch], ebp
L0ef3::
    ret
L0ef4::
    cmp di, 0ebf0h
    jae L0f1a
    mov dword ptr [edi+01410h], ebx
    mov dword ptr [edi+01414h], ecx
    cmp di, 0e1f0h
    jae L0f1a
    mov dword ptr [edi+01e10h], esi
    mov dword ptr [edi+01e14h], ebp
L0f1a::
    ret
L0f1b::
    cmp di, 0ebe8h
    jae L0f41
    mov dword ptr [edi+01418h], ebx
    mov dword ptr [edi+0141ch], ecx
    cmp di, 0e1e8h
    jae L0f41
    mov dword ptr [edi+01e18h], esi
    mov dword ptr [edi+01e1ch], ebp
L0f41::
    ret
L0f42::
    cmp di, 0d800h
    jae L0f68
    mov dword ptr [edi+02800h], ebx
    mov dword ptr [edi+02804h], ecx
    cmp di, 0ce00h
    jae L0f68
    mov dword ptr [edi+03200h], esi
    mov dword ptr [edi+03204h], ebp
L0f68::
    ret
L0f69::
    cmp di, 0d7f8h
    jae L0f8f
    mov dword ptr [edi+02808h], ebx
    mov dword ptr [edi+0280ch], ecx
    cmp di, 0cdf8h
    jae L0f8f
    mov dword ptr [edi+03208h], esi
    mov dword ptr [edi+0320ch], ebp
L0f8f::
    ret
L0f90::
    cmp di, 0d7f0h
    jae L0fb6
    mov dword ptr [edi+02810h], ebx
    mov dword ptr [edi+02814h], ecx
    cmp di, 0cdf0h
    jae L0fb6
    mov dword ptr [edi+03210h], esi
    mov dword ptr [edi+03214h], ebp
L0fb6::
    ret
L0fb7::
    cmp di, 0d7e8h
    jae L0fdd
    mov dword ptr [edi+02818h], ebx
    mov dword ptr [edi+0281ch], ecx
    cmp di, 0cde8h
    jae L0fdd
    mov dword ptr [edi+03218h], esi
    mov dword ptr [edi+0321ch], ebp
L0fdd::
    ret
L0fde::
    cmp di, 0c400h
    jae L1004
    mov dword ptr [edi+03c00h], ebx
    mov dword ptr [edi+03c04h], ecx
    cmp di, 0ba00h
    jae L1004
    mov dword ptr [edi+04600h], esi
    mov dword ptr [edi+04604h], ebp
L1004::
    ret
L1005::
    cmp di, 0c3f8h
    jae L102b
    mov dword ptr [edi+03c08h], ebx
    mov dword ptr [edi+03c0ch], ecx
    cmp di, 0b9f8h
    jae L102b
    mov dword ptr [edi+04608h], esi
    mov dword ptr [edi+0460ch], ebp
L102b::
    ret
L102c::
    cmp di, 0c3f0h
    jae L1052
    mov dword ptr [edi+03c10h], ebx
    mov dword ptr [edi+03c14h], ecx
    cmp di, 0b9f0h
    jae L1052
    mov dword ptr [edi+04610h], esi
    mov dword ptr [edi+04614h], ebp
L1052::
    ret
L1053::
    cmp di, 0c3e8h
    jae L1079
    mov dword ptr [edi+03c18h], ebx
    mov dword ptr [edi+03c1ch], ecx
    cmp di, 0b9e8h
    jae L1079
    mov dword ptr [edi+04618h], esi
    mov dword ptr [edi+0461ch], ebp
L1079::
    ret
L107a::
    sub edi, 010000h
    cmp di, 0f600h
    jae L108e
    jmp L109a
    mov dword ptr [edi], ebx
    mov dword ptr [edi+04h], ecx
L108e::
    mov dword ptr [edi+0a00h], esi
    mov dword ptr [edi+0a04h], ebp
L109a::
    add edi, 010000h
    ret
L10a1::
    sub edi, 010000h
    cmp di, 0fff8h
    jae L10b6
    cmp di, 0f5f8h
    jae L10bc
    jmp L10c8
L10b6::
    mov dword ptr [edi+08h], ebx
    mov dword ptr [edi+0ch], ecx
L10bc::
    mov dword ptr [edi+0a08h], esi
    mov dword ptr [edi+0a0ch], ebp
L10c8::
    add edi, 010000h
    ret
L10cf::
    sub edi, 010000h
    cmp di, 0fff0h
    jae L10e4
    cmp di, 0f5f0h
    jae L10ea
    jmp L10f6
L10e4::
    mov dword ptr [edi+010h], ebx
    mov dword ptr [edi+014h], ecx
L10ea::
    mov dword ptr [edi+0a10h], esi
    mov dword ptr [edi+0a14h], ebp
L10f6::
    add edi, 010000h
    ret
L10fd::
    sub edi, 010000h
    cmp di, 0ffe8h
    jae L1112
    cmp di, 0f5e8h
    jae L1118
    jmp L1124
L1112::
    mov dword ptr [edi+018h], ebx
    mov dword ptr [edi+01ch], ecx
L1118::
    mov dword ptr [edi+0a18h], esi
    mov dword ptr [edi+0a1ch], ebp
L1124::
    add edi, 010000h
    ret
L112b::
    sub edi, 010000h
    cmp di, 0ec00h
    jae L1141
    cmp di, 0e200h
    jae L114d
    jmp L1159
L1141::
    mov dword ptr [edi+01400h], ebx
    mov dword ptr [edi+01404h], ecx
L114d::
    mov dword ptr [edi+01e00h], esi
    mov dword ptr [edi+01e04h], ebp
L1159::
    add edi, 010000h
    ret
L1160::
    sub edi, 010000h
    cmp di, 0ebf8h
    jae L1176
    cmp di, 0e1f8h
    jae L1182
    jmp L118e
L1176::
    mov dword ptr [edi+01408h], ebx
    mov dword ptr [edi+0140ch], ecx
L1182::
    mov dword ptr [edi+01e08h], esi
    mov dword ptr [edi+01e0ch], ebp
L118e::
    add edi, 010000h
    ret
L1195::
    sub edi, 010000h
    cmp di, 0ebf0h
    jae L11ab
    cmp di, 0e1f0h
    jae L11b7
    jmp L11c3
L11ab::
    mov dword ptr [edi+01410h], ebx
    mov dword ptr [edi+01414h], ecx
L11b7::
    mov dword ptr [edi+01e10h], esi
    mov dword ptr [edi+01e14h], ebp
L11c3::
    add edi, 010000h
    ret
L11ca::
    sub edi, 010000h
    cmp di, 0ebe8h
    jae L11e0
    cmp di, 0e1e8h
    jae L11ec
    jmp L11f8
L11e0::
    mov dword ptr [edi+01418h], ebx
    mov dword ptr [edi+0141ch], ecx
L11ec::
    mov dword ptr [edi+01e18h], esi
    mov dword ptr [edi+01e1ch], ebp
L11f8::
    add edi, 010000h
    ret
L11ff::
    sub edi, 010000h
    cmp di, 0d800h
    jae L1215
    cmp di, 0ce00h
    jae L1221
    jmp L122d
L1215::
    mov dword ptr [edi+02800h], ebx
    mov dword ptr [edi+02804h], ecx
L1221::
    mov dword ptr [edi+03200h], esi
    mov dword ptr [edi+03204h], ebp
L122d::
    add edi, 010000h
    ret
L1234::
    sub edi, 010000h
    cmp di, 0d7f8h
    jae L124a
    cmp di, 0cdf8h
    jae L1256
    jmp L1262
L124a::
    mov dword ptr [edi+02808h], ebx
    mov dword ptr [edi+0280ch], ecx
L1256::
    mov dword ptr [edi+03208h], esi
    mov dword ptr [edi+0320ch], ebp
L1262::
    add edi, 010000h
    ret
L1269::
    sub edi, 010000h
    cmp di, 0d7f0h
    jae L127f
    cmp di, 0cdf0h
    jae L128b
    jmp L1297
L127f::
    mov dword ptr [edi+02810h], ebx
    mov dword ptr [edi+02814h], ecx
L128b::
    mov dword ptr [edi+03210h], esi
    mov dword ptr [edi+03214h], ebp
L1297::
    add edi, 010000h
    ret
L129e::
    sub edi, 010000h
    cmp di, 0d7e8h
    jae L12b4
    cmp di, 0cde8h
    jae L12c0
    jmp L12cc
L12b4::
    mov dword ptr [edi+02818h], ebx
    mov dword ptr [edi+0281ch], ecx
L12c0::
    mov dword ptr [edi+03218h], esi
    mov dword ptr [edi+0321ch], ebp
L12cc::
    add edi, 010000h
    ret
L12d3::
    sub edi, 010000h
    cmp di, 0c400h
    jae L12e9
    cmp di, 0ba00h
    jae L12f5
    jmp L1301
L12e9::
    mov dword ptr [edi+03c00h], ebx
    mov dword ptr [edi+03c04h], ecx
L12f5::
    mov dword ptr [edi+04600h], esi
    mov dword ptr [edi+04604h], ebp
L1301::
    add edi, 010000h
    ret
L1308::
    sub edi, 010000h
    cmp di, 0c3f8h
    jae L131e
    cmp di, 0b9f8h
    jae L132a
    jmp L1336
L131e::
    mov dword ptr [edi+03c08h], ebx
    mov dword ptr [edi+03c0ch], ecx
L132a::
    mov dword ptr [edi+04608h], esi
    mov dword ptr [edi+0460ch], ebp
L1336::
    add edi, 010000h
    ret
L133d::
    sub edi, 010000h
    cmp di, 0c3f0h
    jae L1353
    cmp di, 0b9f0h
    jae L135f
    jmp L136b
L1353::
    mov dword ptr [edi+03c10h], ebx
    mov dword ptr [edi+03c14h], ecx
L135f::
    mov dword ptr [edi+04610h], esi
    mov dword ptr [edi+04614h], ebp
L136b::
    add edi, 010000h
    ret
L1372::
    sub edi, 010000h
    cmp di, 0c3e8h
    jae L1388
    cmp di, 0b9e8h
    jae L1394
    jmp L13a0
L1388::
    mov dword ptr [edi+03c18h], ebx
    mov dword ptr [edi+03c1ch], ecx
L1394::
    mov dword ptr [edi+04618h], esi
    mov dword ptr [edi+0461ch], ebp
L13a0::
    add edi, 010000h
    ret
entry_0cb6 endp
D13a7 dword offset entry_0cb6
    dword offset L0cc8
    dword offset L0cdb
    dword offset L0cee
    dword offset L0d01
    dword offset L0d1a
    dword offset L0d33
    dword offset L0d4c
    dword offset L0d65
    dword offset L0d7e
    dword offset L0d97
    dword offset L0db0
    dword offset L0dc9
    dword offset L0de2
    dword offset L0dfb
    dword offset L0e14
D13e7 dword offset L0e2d
    dword offset L0e46
    dword offset L0e66
    dword offset L0e86
    dword offset L0ea6
    dword offset L0ecd
    dword offset L0ef4
    dword offset L0f1b
    dword offset L0f42
    dword offset L0f69
    dword offset L0f90
    dword offset L0fb7
    dword offset L0fde
    dword offset L1005
    dword offset L102c
    dword offset L1053
D1427 dword offset L107a
    dword offset L10a1
    dword offset L10cf
    dword offset L10fd
    dword offset L112b
    dword offset L1160
    dword offset L1195
    dword offset L11ca
    dword offset L11ff
    dword offset L1234
    dword offset L1269
    dword offset L129e
    dword offset L12d3
    dword offset L1308
    dword offset L133d
    dword offset L1372
entry_1467 proc near
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
    mov dword ptr [D78a4], eax
    mov edi, dword ptr [ebp+014h]
    mov eax, dword ptr [edi]
    imul eax, dword ptr [edi+04h]
    add edi, 08h
    mov dword ptr [ebp+014h], edi
    mov dword ptr [D780c], eax
    mov edi, dword ptr [ebp+010h]
    mov eax, dword ptr [edi]
    mov dword ptr [D77fc], eax
    mov eax, dword ptr [edi+04h]
    mov dword ptr [D7800], eax
    mov eax, dword ptr [edi+08h]
    mov dword ptr [D7804], eax
    mov al, byte ptr [edi+0ch]
    mov byte ptr [D78e4], al
    mov al, byte ptr [edi+0dh]
    mov byte ptr [D78e5], al
    mov al, byte ptr [edi+0eh]
    mov byte ptr [D78e6], al
    mov edi, dword ptr [ebp+0ch]
    mov dword ptr [D7808], edi
    mov byte ptr [D78a0], 00h
    test dword ptr [D78a4], 07800000h
    je L655a
    mov esi, dword ptr [ebp+08h]
    mov dword ptr [D78a8], 00h
    mov dword ptr [D789c], 00h
    mov dword ptr [D7810], 00h
    mov dword ptr [D7898], 00h
    mov ecx, 0e0h
    mov edx, dword ptr [D78a4]
    test edx, 020000h
    je L1579
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 04h
    jb L6708
L1530::
    and eax, 0fh
    mov byte ptr [D78e4], al
    mov eax, dword ptr [eax*4+bit_masks]
    mov dword ptr [D7810], eax
    cmp eax, 00h
    je L1573
    mov edi, dword ptr [D77fc]
    mov edx, dword ptr [esi+04h]
L1552::
    mov eax, dword ptr [esi]
    shrd eax, edx, cl
    add cl, 04h
    jb L7778
L1560::
    and eax, 0fh
    call dword ptr [eax*4+block_writers+WRITER_SET*64]
    sub dword ptr [D7810], 01h
    jne L1552
L1573::
    mov edx, dword ptr [D78a4]
L1579::
    test edx, 040000h
    je L15e1
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 04h
    jb L6714
L1592::
    and eax, 0fh
    mov byte ptr [D78e5], al
    mov eax, dword ptr [eax*4+bit_masks]
    mul dword ptr [D780c]
    mov dword ptr [D7810], eax
    cmp eax, 00h
    je L15db
    mov edi, dword ptr [D7800]
    mov edx, dword ptr [esi+04h]
L15ba::
    mov eax, dword ptr [esi]
    shrd eax, edx, cl
    add cl, 04h
    jb L7788
L15c8::
    and eax, 0fh
    call dword ptr [eax*4+block_writers+WRITER_SET*64]
    sub dword ptr [D7810], 01h
    jne L15ba
L15db::
    mov edx, dword ptr [D78a4]
L15e1::
    test edx, 080000h
    je L164b
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 014h
    jae L15fc
    add esi, 04h
    or cl, 0e0h
L15fc::
    and eax, 0fffffh
    mov dword ptr [D7810], eax
    cmp eax, 00h
    je L164b
    bswap ecx
    mov cl, 00h
    sub eax, 01h
L1612::
    add cl, 01h
    shr eax, 1
    jne L1612
    mov byte ptr [D78e6], cl
    bswap ecx
    mov edi, dword ptr [D7804]
    mov edx, dword ptr [esi+04h]
L162a::
    mov eax, dword ptr [esi]
    shrd eax, edx, cl
    add cl, 04h
    jb L7798
L1638::
    and eax, 0fh
    call dword ptr [eax*4+block_writers+WRITER_SET*64]
    sub dword ptr [D7810], 01h
    jne L162a
L164b::
    mov edx, dword ptr [D7800]
    mov dword ptr [D7898], edx
    bswap ecx
    mov edx, dword ptr [ebp+010h]
    mov cl, byte ptr [D78e4]
    mov byte ptr [edx+0ch], cl
    mov eax, 01h
    shl eax, cl
    dec eax
    mov dword ptr [D78e0], eax
    mov cl, byte ptr [D78e6]
    mov byte ptr [edx+0eh], cl
    mov eax, 01h
    shl eax, cl
    dec eax
    mov dword ptr [D78dc], eax
    mov cl, byte ptr [D78e5]
    mov byte ptr [edx+0dh], cl
    mov eax, 01h
    shl eax, cl
    dec eax
    mov dword ptr [D78d8], eax
    add cl, 03h
    mov byte ptr [D78e7], cl
    bswap ecx
    xor edx, edx
    mov word ptr [current_bank], 0ffffh
L16b4::
    mov dword ptr [D78c0], esi
    mov dword ptr [D78c4], ecx
    mov dword ptr [D78c8], edx
    mov al, byte ptr [D78a0]
    mov byte ptr [D78d4], al
    mov eax, dword ptr [D789c]
    mov dword ptr [D78d0], eax
    mov eax, dword ptr [D7898]
    mov dword ptr [D78cc], eax
L16e4::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb L6720
L16f1::
    and eax, 01h
    je L1747
    add edx, 01h
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 03h
    jb L672c
L170a::
    and eax, 07h
    add edx, eax
    cmp eax, 07h
    jl L1747
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 07h
    jb L6738
L1725::
    and eax, 07fh
    add edx, eax
    cmp eax, 07fh
    jl L1747
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 0ch
    jb L6744
L1740::
    and eax, 0fffh
    add edx, eax
L1747::
    bswap ecx
    mov cl, byte ptr [D78e7]
    mov ebx, edx
    shl ebx, cl
    add dword ptr [D7898], ebx
    bswap ecx
    add edx, dword ptr [D789c]
    cmp edx, dword ptr [D780c]
    jae L48b9
    mov dword ptr [D789c], edx
    shl edx, 02h
    add edx, dword ptr [ebp+014h]
    mov edi, dword ptr [edx]
    cmp edi, 0ffffffffh
    je L2f21
    cmp edi, 0fffffffeh
    je L48b9
    shld ebx, edi, 010h
    cmp di, 0b4f2h
    ja L2f32
    cmp bx, word ptr [current_bank]
    jne L48dc
L17a9::
    mov word ptr [current_bank], bx
    mov dword ptr [D77f8], edi
    and edi, 0ffffh
    or edi, dword ptr [D7808]
L17c2::
    mov dword ptr [D7814], 00h
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb L6750
L17d9::
    test al, 01h
    jne L1ba2
L17e1::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb L675c
L17ee::
    and eax, 01h
    jne L17fa
    mov al, byte ptr [D78a0]
    jmp L181e
L17fa::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb L6768
L1807::
    and eax, 01h
    mov al, byte ptr [D78a0]
    je L1813
    inc al
L1813::
    sub al, 02h
    sbb al, 00h
    and al, 03h
    mov byte ptr [D78a0], al
L181e::
    or al, al
    je L18b5
    test al, 02h
    jne L184c
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [D78e4]
    jb L6774
L183e::
    and eax, dword ptr [D78e0]
    mov edx, dword ptr [D77fc]
    jmp L186c
L184c::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [D78e6]
    jb L6780
L1860::
    and eax, dword ptr [D78dc]
    mov edx, dword ptr [D7804]
L186c::
    shl eax, 03h
    add edx, eax
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 011h
    jae L1884
    add esi, 04h
    or cl, 0e0h
L1884::
    and eax, 01ffffh
    mov ebx, dword ptr [edx-02h]
    mov dword ptr [D77ec], ecx
    mov ecx, dword ptr [edx]
    mov bx, cx
    mov dword ptr [D77f0], ebp
    mov dword ptr [D77e8], esi
    mov esi, dword ptr [edx+02h]
    mov cx, si
    mov ebp, dword ptr [edx+04h]
    mov si, bp
    mov bp, word ptr [edx+06h]
    jmp L191c
L18b5::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [D78e5]
    jb L678c
L18c9::
    and eax, dword ptr [D78d8]
    mov edx, dword ptr [D7898]
    shl eax, 03h
    add edx, eax
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 011h
    jae L18ed
    add esi, 04h
    or cl, 0e0h
L18ed::
    and eax, 01ffffh
    mov ebx, dword ptr [edx-02h]
    mov dword ptr [D77ec], ecx
    mov ecx, dword ptr [edx]
    mov bx, cx
    mov dword ptr [D77f0], ebp
    mov dword ptr [D77e8], esi
    mov esi, dword ptr [edx+02h]
    mov cx, si
    mov ebp, dword ptr [edx+04h]
    mov si, bp
    mov bp, word ptr [edx+06h]
L191c::
    or dword ptr [D7814], eax
    test al, al
    je L1a3b
    test al, 01h
    je L1a07
L1932::
    mov dword ptr [edi], ebx
    mov dword ptr [edi+04h], ecx
    mov dword ptr [edi+0a00h], esi
    mov dword ptr [edi+0a04h], ebp
    test al, 02h
    je L1a0f
L194b::
    mov dword ptr [edi+08h], ebx
    mov dword ptr [edi+0ch], ecx
    mov dword ptr [edi+0a08h], esi
    mov dword ptr [edi+0a0ch], ebp
    test al, 010h
    je L1a17
L1965::
    mov dword ptr [edi+010h], ebx
    mov dword ptr [edi+014h], ecx
    mov dword ptr [edi+0a10h], esi
    mov dword ptr [edi+0a14h], ebp
    test al, 020h
    je L1a1f
L197f::
    mov dword ptr [edi+018h], ebx
    mov dword ptr [edi+01ch], ecx
    mov dword ptr [edi+0a18h], esi
    mov dword ptr [edi+0a1ch], ebp
    test al, 04h
    je L1a27
L1999::
    mov dword ptr [edi+01400h], ebx
    mov dword ptr [edi+01404h], ecx
    mov dword ptr [edi+01e00h], esi
    mov dword ptr [edi+01e04h], ebp
    test al, 08h
    je L1a2f
L19b5::
    mov dword ptr [edi+01408h], ebx
    mov dword ptr [edi+0140ch], ecx
    mov dword ptr [edi+01e08h], esi
    mov dword ptr [edi+01e0ch], ebp
    test al, 040h
    je L1a33
L19d1::
    mov dword ptr [edi+01410h], ebx
    mov dword ptr [edi+01414h], ecx
    mov dword ptr [edi+01e10h], esi
    mov dword ptr [edi+01e14h], ebp
    test al, 080h
    je L1a37
L19ed::
    mov dword ptr [edi+01418h], ebx
    mov dword ptr [edi+0141ch], ecx
    mov dword ptr [edi+01e18h], esi
    mov dword ptr [edi+01e1ch], ebp
    jmp L1a3b
L1a07::
    test al, 01h
    jne L1932
L1a0f::
    test al, 02h
    jne L194b
L1a17::
    test al, 010h
    jne L1965
L1a1f::
    test al, 020h
    jne L197f
L1a27::
    test al, 04h
    jne L1999
L1a2f::
    test al, 08h
    jne L19b5
L1a33::
    test al, 040h
    jne L19d1
L1a37::
    test al, 080h
    jne L19ed
L1a3b::
    test ah, ah
    je L1b85
    test ah, 01h
    je L1b45
L1a4c::
    mov dword ptr [edi+02800h], ebx
    mov dword ptr [edi+02804h], ecx
    mov dword ptr [edi+03200h], esi
    mov dword ptr [edi+03204h], ebp
    test ah, 02h
    je L1b4e
L1a6d::
    mov dword ptr [edi+02808h], ebx
    mov dword ptr [edi+0280ch], ecx
    mov dword ptr [edi+03208h], esi
    mov dword ptr [edi+0320ch], ebp
    test ah, 010h
    je L1b57
L1a8e::
    mov dword ptr [edi+02810h], ebx
    mov dword ptr [edi+02814h], ecx
    mov dword ptr [edi+03210h], esi
    mov dword ptr [edi+03214h], ebp
    test ah, 020h
    je L1b60
L1aaf::
    mov dword ptr [edi+02818h], ebx
    mov dword ptr [edi+0281ch], ecx
    mov dword ptr [edi+03218h], esi
    mov dword ptr [edi+0321ch], ebp
    test ah, 04h
    je L1b69
L1ad0::
    mov dword ptr [edi+03c00h], ebx
    mov dword ptr [edi+03c04h], ecx
    mov dword ptr [edi+04600h], esi
    mov dword ptr [edi+04604h], ebp
    test ah, 08h
    je L1b72
L1af1::
    mov dword ptr [edi+03c08h], ebx
    mov dword ptr [edi+03c0ch], ecx
    mov dword ptr [edi+04608h], esi
    mov dword ptr [edi+0460ch], ebp
    test ah, 040h
    je L1b7b
L1b0e::
    mov dword ptr [edi+03c10h], ebx
    mov dword ptr [edi+03c14h], ecx
    mov dword ptr [edi+04610h], esi
    mov dword ptr [edi+04614h], ebp
    test ah, 080h
    je L1b80
L1b2b::
    mov dword ptr [edi+03c18h], ebx
    mov dword ptr [edi+03c1ch], ecx
    mov dword ptr [edi+04618h], esi
    mov dword ptr [edi+0461ch], ebp
    jmp L1b85
L1b45::
    test ah, 01h
    jne L1a4c
L1b4e::
    test ah, 02h
    jne L1a6d
L1b57::
    test ah, 010h
    jne L1a8e
L1b60::
    test ah, 020h
    jne L1aaf
L1b69::
    test ah, 04h
    jne L1ad0
L1b72::
    test ah, 08h
    jne L1af1
L1b7b::
    test ah, 040h
    jne L1b0e
L1b80::
    test ah, 080h
    jne L1b2b
L1b85::
    mov esi, dword ptr [D77e8]
    mov ecx, dword ptr [D77ec]
    mov ebp, dword ptr [D77f0]
    and eax, 010000h
    je L17e1
L1ba2::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb L6798
L1baf::
    test al, 01h
    jne L2d9b
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 04h
    jb L67a4
L1bc8::
    and eax, 0fh
    jmp dword ptr [eax*4+D1bd2]
entry_1467 endp
D1bd2 dword offset entry_1c12
    dword offset L1c30
    dword offset L1c51
    dword offset L1c75
    dword offset L1c95
    dword offset L1cb7
    dword offset L1cde
    dword offset L1d01
    dword offset L1d25
    dword offset L1d44
    dword offset L1d68
    dword offset L1d8e
    dword offset L1dae
    dword offset L1dc9
    dword offset L1dea
    dword offset L1e08
entry_1c12 proc near
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 010h
    jae L1c25
    add esi, 04h
    or cl, 0e0h
L1c25::
    xor dword ptr [D7814], eax
    jmp L1e0e
L1c30::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 0ch
    jb L67b0
L1c41::
    shl eax, 04h
    or al, 0fh
    xor dword ptr [D7814], eax
    jmp L1e0e
L1c51::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 0ch
    jb L67bc
L1c62::
    shl eax, 04h
    shr al, 04h
    or al, 0f0h
    xor dword ptr [D7814], eax
    jmp L1e0e
L1c75::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 08h
    jb L67c8
L1c86::
    mov ah, al
    mov al, 0ffh
    xor dword ptr [D7814], eax
    jmp L1e0e
L1c95::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 0ch
    jb L67d4
L1ca6::
    shl ah, 04h
    or ah, 0fh
    xor dword ptr [D7814], eax
    jmp L1e0e
L1cb7::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 08h
    jb L67e0
L1cc8::
    shl eax, 04h
    shl ah, 04h
    or eax, 0f0fh
    xor dword ptr [D7814], eax
    jmp L1e0e
L1cde::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 08h
    jb L67ec
L1cef::
    mov ah, al
    or eax, 0ff0h
    xor dword ptr [D7814], eax
    jmp L1e0e
L1d01::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 04h
    jb L67f8
L1d12::
    shl eax, 0ch
    or eax, 0fffh
    xor dword ptr [D7814], eax
    jmp L1e0e
L1d25::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 0ch
    jb L6804
L1d36::
    or ah, 0f0h
    xor dword ptr [D7814], eax
    jmp L1e0e
L1d44::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 08h
    jb L6810
L1d55::
    shl eax, 04h
    or eax, 0f00fh
    xor dword ptr [D7814], eax
    jmp L1e0e
L1d68::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 08h
    jb L681c
L1d79::
    mov ah, al
    ror ah, 04h
    or eax, 0f0f0h
    xor dword ptr [D7814], eax
    jmp L1e0e
L1d8e::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 04h
    jb L6828
L1d9f::
    mov ah, al
    or eax, 0f0ffh
    xor dword ptr [D7814], eax
    jmp L1e0e
L1dae::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 08h
    jb L6834
L1dbf::
    mov ah, 0ffh
    xor dword ptr [D7814], eax
    jmp L1e0e
L1dc9::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 04h
    jb L6840
L1dda::
    or eax, 0fff0h
    rol al, 04h
    xor dword ptr [D7814], eax
    jmp L1e0e
L1dea::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 04h
    jb L684c
L1dfb::
    or eax, 0fff0h
    xor dword ptr [D7814], eax
    jmp L1e0e
L1e08::
    not dword ptr [D7814]
L1e0e::
    test byte ptr [D7814], 0ffh
    je L25c4
    test byte ptr [D7814], 01h
    je L255c
L1e28::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb L6858
L1e35::
    and eax, 01h
    jne L1e41
    mov al, byte ptr [D78a0]
    jmp L1e65
L1e41::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb L6864
L1e4e::
    and eax, 01h
    mov al, byte ptr [D78a0]
    je L1e5a
    inc al
L1e5a::
    sub al, 02h
    sbb al, 00h
    and al, 03h
    mov byte ptr [D78a0], al
L1e65::
    or al, al
    je L1eb1
    test al, 02h
    jne L1e8f
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [D78e4]
    jb L6870
L1e81::
    and eax, dword ptr [D78e0]
    mov edx, dword ptr [D77fc]
    jmp L1ed1
L1e8f::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [D78e6]
    jb L687c
L1ea3::
    and eax, dword ptr [D78dc]
    mov edx, dword ptr [D7804]
    jmp L1ed1
L1eb1::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [D78e5]
    jb L6888
L1ec5::
    and eax, dword ptr [D78d8]
    mov edx, dword ptr [D7898]
L1ed1::
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
    test byte ptr [D7814], 02h
    je L2569
L1f0c::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb L6894
L1f19::
    and eax, 01h
    jne L1f25
    mov al, byte ptr [D78a0]
    jmp L1f49
L1f25::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb L68a0
L1f32::
    and eax, 01h
    mov al, byte ptr [D78a0]
    je L1f3e
    inc al
L1f3e::
    sub al, 02h
    sbb al, 00h
    and al, 03h
    mov byte ptr [D78a0], al
L1f49::
    or al, al
    je L1f95
    test al, 02h
    jne L1f73
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [D78e4]
    jb L68ac
L1f65::
    and eax, dword ptr [D78e0]
    mov edx, dword ptr [D77fc]
    jmp L1fb5
L1f73::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [D78e6]
    jb L68b8
L1f87::
    and eax, dword ptr [D78dc]
    mov edx, dword ptr [D7804]
    jmp L1fb5
L1f95::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [D78e5]
    jb L68c4
L1fa9::
    and eax, dword ptr [D78d8]
    mov edx, dword ptr [D7898]
L1fb5::
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
    test byte ptr [D7814], 010h
    je L2576
L1ff1::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb L68d0
L1ffe::
    and eax, 01h
    jne L200a
    mov al, byte ptr [D78a0]
    jmp L202e
L200a::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb L68dc
L2017::
    and eax, 01h
    mov al, byte ptr [D78a0]
    je L2023
    inc al
L2023::
    sub al, 02h
    sbb al, 00h
    and al, 03h
    mov byte ptr [D78a0], al
L202e::
    or al, al
    je L207a
    test al, 02h
    jne L2058
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [D78e4]
    jb L68e8
L204a::
    and eax, dword ptr [D78e0]
    mov edx, dword ptr [D77fc]
    jmp L209a
L2058::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [D78e6]
    jb L68f4
L206c::
    and eax, dword ptr [D78dc]
    mov edx, dword ptr [D7804]
    jmp L209a
L207a::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [D78e5]
    jb L6900
L208e::
    and eax, dword ptr [D78d8]
    mov edx, dword ptr [D7898]
L209a::
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
    test byte ptr [D7814], 020h
    je L2583
L20d6::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb L690c
L20e3::
    and eax, 01h
    jne L20ef
    mov al, byte ptr [D78a0]
    jmp L2113
L20ef::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb L6918
L20fc::
    and eax, 01h
    mov al, byte ptr [D78a0]
    je L2108
    inc al
L2108::
    sub al, 02h
    sbb al, 00h
    and al, 03h
    mov byte ptr [D78a0], al
L2113::
    or al, al
    je L215f
    test al, 02h
    jne L213d
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [D78e4]
    jb L6924
L212f::
    and eax, dword ptr [D78e0]
    mov edx, dword ptr [D77fc]
    jmp L217f
L213d::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [D78e6]
    jb L6930
L2151::
    and eax, dword ptr [D78dc]
    mov edx, dword ptr [D7804]
    jmp L217f
L215f::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [D78e5]
    jb L693c
L2173::
    and eax, dword ptr [D78d8]
    mov edx, dword ptr [D7898]
L217f::
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
    test byte ptr [D7814], 04h
    je L2590
L21bb::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb L6948
L21c8::
    and eax, 01h
    jne L21d4
    mov al, byte ptr [D78a0]
    jmp L21f8
L21d4::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb L6954
L21e1::
    and eax, 01h
    mov al, byte ptr [D78a0]
    je L21ed
    inc al
L21ed::
    sub al, 02h
    sbb al, 00h
    and al, 03h
    mov byte ptr [D78a0], al
L21f8::
    or al, al
    je L2244
    test al, 02h
    jne L2222
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [D78e4]
    jb L6960
L2214::
    and eax, dword ptr [D78e0]
    mov edx, dword ptr [D77fc]
    jmp L2264
L2222::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [D78e6]
    jb L696c
L2236::
    and eax, dword ptr [D78dc]
    mov edx, dword ptr [D7804]
    jmp L2264
L2244::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [D78e5]
    jb L6978
L2258::
    and eax, dword ptr [D78d8]
    mov edx, dword ptr [D7898]
L2264::
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
    test byte ptr [D7814], 08h
    je L259d
L22a6::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb L6984
L22b3::
    and eax, 01h
    jne L22bf
    mov al, byte ptr [D78a0]
    jmp L22e3
L22bf::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb L6990
L22cc::
    and eax, 01h
    mov al, byte ptr [D78a0]
    je L22d8
    inc al
L22d8::
    sub al, 02h
    sbb al, 00h
    and al, 03h
    mov byte ptr [D78a0], al
L22e3::
    or al, al
    je L232f
    test al, 02h
    jne L230d
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [D78e4]
    jb L699c
L22ff::
    and eax, dword ptr [D78e0]
    mov edx, dword ptr [D77fc]
    jmp L234f
L230d::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [D78e6]
    jb L69a8
L2321::
    and eax, dword ptr [D78dc]
    mov edx, dword ptr [D7804]
    jmp L234f
L232f::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [D78e5]
    jb L69b4
L2343::
    and eax, dword ptr [D78d8]
    mov edx, dword ptr [D7898]
L234f::
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
    test byte ptr [D7814], 040h
    je L25aa
L2391::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb L69c0
L239e::
    and eax, 01h
    jne L23aa
    mov al, byte ptr [D78a0]
    jmp L23ce
L23aa::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb L69cc
L23b7::
    and eax, 01h
    mov al, byte ptr [D78a0]
    je L23c3
    inc al
L23c3::
    sub al, 02h
    sbb al, 00h
    and al, 03h
    mov byte ptr [D78a0], al
L23ce::
    or al, al
    je L241a
    test al, 02h
    jne L23f8
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [D78e4]
    jb L69d8
L23ea::
    and eax, dword ptr [D78e0]
    mov edx, dword ptr [D77fc]
    jmp L243a
L23f8::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [D78e6]
    jb L69e4
L240c::
    and eax, dword ptr [D78dc]
    mov edx, dword ptr [D7804]
    jmp L243a
L241a::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [D78e5]
    jb L69f0
L242e::
    and eax, dword ptr [D78d8]
    mov edx, dword ptr [D7898]
L243a::
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
    test byte ptr [D7814], 080h
    je L25b7
L247c::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb L69fc
L2489::
    and eax, 01h
    jne L2495
    mov al, byte ptr [D78a0]
    jmp L24b9
L2495::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb L6a08
L24a2::
    and eax, 01h
    mov al, byte ptr [D78a0]
    je L24ae
    inc al
L24ae::
    sub al, 02h
    sbb al, 00h
    and al, 03h
    mov byte ptr [D78a0], al
L24b9::
    or al, al
    je L2505
    test al, 02h
    jne L24e3
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [D78e4]
    jb L6a14
L24d5::
    and eax, dword ptr [D78e0]
    mov edx, dword ptr [D77fc]
    jmp L2525
L24e3::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [D78e6]
    jb L6a20
L24f7::
    and eax, dword ptr [D78dc]
    mov edx, dword ptr [D7804]
    jmp L2525
L2505::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [D78e5]
    jb L6a2c
L2519::
    and eax, dword ptr [D78d8]
    mov edx, dword ptr [D7898]
L2525::
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
    jmp L25c4
L255c::
    test byte ptr [D7814], 01h
    jne L1e28
L2569::
    test byte ptr [D7814], 02h
    jne L1f0c
L2576::
    test byte ptr [D7814], 010h
    jne L1ff1
L2583::
    test byte ptr [D7814], 020h
    jne L20d6
L2590::
    test byte ptr [D7814], 04h
    jne L21bb
L259d::
    test byte ptr [D7814], 08h
    jne L22a6
L25aa::
    test byte ptr [D7814], 040h
    jne L2391
L25b7::
    test byte ptr [D7814], 080h
    jne L247c
L25c4::
    test byte ptr [D7815], 0ffh
    je L2f11
    test byte ptr [D7815], 01h
    je L2d2e
L25de::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb L6a38
L25eb::
    and eax, 01h
    jne L25f7
    mov al, byte ptr [D78a0]
    jmp L261b
L25f7::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb L6a44
L2604::
    and eax, 01h
    mov al, byte ptr [D78a0]
    je L2610
    inc al
L2610::
    sub al, 02h
    sbb al, 00h
    and al, 03h
    mov byte ptr [D78a0], al
L261b::
    or al, al
    je L2667
    test al, 02h
    jne L2645
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [D78e4]
    jb L6a50
L2637::
    and eax, dword ptr [D78e0]
    mov edx, dword ptr [D77fc]
    jmp L2687
L2645::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [D78e6]
    jb L6a5c
L2659::
    and eax, dword ptr [D78dc]
    mov edx, dword ptr [D7804]
    jmp L2687
L2667::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [D78e5]
    jb L6a68
L267b::
    and eax, dword ptr [D78d8]
    mov edx, dword ptr [D7898]
L2687::
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
    test byte ptr [D7815], 02h
    je L2d3b
L26c9::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb L6a74
L26d6::
    and eax, 01h
    jne L26e2
    mov al, byte ptr [D78a0]
    jmp L2706
L26e2::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb L6a80
L26ef::
    and eax, 01h
    mov al, byte ptr [D78a0]
    je L26fb
    inc al
L26fb::
    sub al, 02h
    sbb al, 00h
    and al, 03h
    mov byte ptr [D78a0], al
L2706::
    or al, al
    je L2752
    test al, 02h
    jne L2730
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [D78e4]
    jb L6a8c
L2722::
    and eax, dword ptr [D78e0]
    mov edx, dword ptr [D77fc]
    jmp L2772
L2730::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [D78e6]
    jb L6a98
L2744::
    and eax, dword ptr [D78dc]
    mov edx, dword ptr [D7804]
    jmp L2772
L2752::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [D78e5]
    jb L6aa4
L2766::
    and eax, dword ptr [D78d8]
    mov edx, dword ptr [D7898]
L2772::
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
    test byte ptr [D7815], 010h
    je L2d48
L27b4::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb L6ab0
L27c1::
    and eax, 01h
    jne L27cd
    mov al, byte ptr [D78a0]
    jmp L27f1
L27cd::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb L6abc
L27da::
    and eax, 01h
    mov al, byte ptr [D78a0]
    je L27e6
    inc al
L27e6::
    sub al, 02h
    sbb al, 00h
    and al, 03h
    mov byte ptr [D78a0], al
L27f1::
    or al, al
    je L283d
    test al, 02h
    jne L281b
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [D78e4]
    jb L6ac8
L280d::
    and eax, dword ptr [D78e0]
    mov edx, dword ptr [D77fc]
    jmp L285d
L281b::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [D78e6]
    jb L6ad4
L282f::
    and eax, dword ptr [D78dc]
    mov edx, dword ptr [D7804]
    jmp L285d
L283d::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [D78e5]
    jb L6ae0
L2851::
    and eax, dword ptr [D78d8]
    mov edx, dword ptr [D7898]
L285d::
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
    test byte ptr [D7815], 020h
    je L2d55
L289f::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb L6aec
L28ac::
    and eax, 01h
    jne L28b8
    mov al, byte ptr [D78a0]
    jmp L28dc
L28b8::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb L6af8
L28c5::
    and eax, 01h
    mov al, byte ptr [D78a0]
    je L28d1
    inc al
L28d1::
    sub al, 02h
    sbb al, 00h
    and al, 03h
    mov byte ptr [D78a0], al
L28dc::
    or al, al
    je L2928
    test al, 02h
    jne L2906
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [D78e4]
    jb L6b04
L28f8::
    and eax, dword ptr [D78e0]
    mov edx, dword ptr [D77fc]
    jmp L2948
L2906::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [D78e6]
    jb L6b10
L291a::
    and eax, dword ptr [D78dc]
    mov edx, dword ptr [D7804]
    jmp L2948
L2928::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [D78e5]
    jb L6b1c
L293c::
    and eax, dword ptr [D78d8]
    mov edx, dword ptr [D7898]
L2948::
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
    test byte ptr [D7815], 04h
    je L2d62
L298a::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb L6b28
L2997::
    and eax, 01h
    jne L29a3
    mov al, byte ptr [D78a0]
    jmp L29c7
L29a3::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb L6b34
L29b0::
    and eax, 01h
    mov al, byte ptr [D78a0]
    je L29bc
    inc al
L29bc::
    sub al, 02h
    sbb al, 00h
    and al, 03h
    mov byte ptr [D78a0], al
L29c7::
    or al, al
    je L2a13
    test al, 02h
    jne L29f1
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [D78e4]
    jb L6b40
L29e3::
    and eax, dword ptr [D78e0]
    mov edx, dword ptr [D77fc]
    jmp L2a33
L29f1::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [D78e6]
    jb L6b4c
L2a05::
    and eax, dword ptr [D78dc]
    mov edx, dword ptr [D7804]
    jmp L2a33
L2a13::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [D78e5]
    jb L6b58
L2a27::
    and eax, dword ptr [D78d8]
    mov edx, dword ptr [D7898]
L2a33::
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
    test byte ptr [D7815], 08h
    je L2d6f
L2a75::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb L6b64
L2a82::
    and eax, 01h
    jne L2a8e
    mov al, byte ptr [D78a0]
    jmp L2ab2
L2a8e::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb L6b70
L2a9b::
    and eax, 01h
    mov al, byte ptr [D78a0]
    je L2aa7
    inc al
L2aa7::
    sub al, 02h
    sbb al, 00h
    and al, 03h
    mov byte ptr [D78a0], al
L2ab2::
    or al, al
    je L2afe
    test al, 02h
    jne L2adc
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [D78e4]
    jb L6b7c
L2ace::
    and eax, dword ptr [D78e0]
    mov edx, dword ptr [D77fc]
    jmp L2b1e
L2adc::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [D78e6]
    jb L6b88
L2af0::
    and eax, dword ptr [D78dc]
    mov edx, dword ptr [D7804]
    jmp L2b1e
L2afe::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [D78e5]
    jb L6b94
L2b12::
    and eax, dword ptr [D78d8]
    mov edx, dword ptr [D7898]
L2b1e::
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
    test byte ptr [D7815], 040h
    je L2d7c
L2b60::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb L6ba0
L2b6d::
    and eax, 01h
    jne L2b79
    mov al, byte ptr [D78a0]
    jmp L2b9d
L2b79::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb L6bac
L2b86::
    and eax, 01h
    mov al, byte ptr [D78a0]
    je L2b92
    inc al
L2b92::
    sub al, 02h
    sbb al, 00h
    and al, 03h
    mov byte ptr [D78a0], al
L2b9d::
    or al, al
    je L2be9
    test al, 02h
    jne L2bc7
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [D78e4]
    jb L6bb8
L2bb9::
    and eax, dword ptr [D78e0]
    mov edx, dword ptr [D77fc]
    jmp L2c09
L2bc7::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [D78e6]
    jb L6bc4
L2bdb::
    and eax, dword ptr [D78dc]
    mov edx, dword ptr [D7804]
    jmp L2c09
L2be9::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [D78e5]
    jb L6bd0
L2bfd::
    and eax, dword ptr [D78d8]
    mov edx, dword ptr [D7898]
L2c09::
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
    test byte ptr [D7815], 080h
    je L2d89
L2c4b::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb L6bdc
L2c58::
    and eax, 01h
    jne L2c64
    mov al, byte ptr [D78a0]
    jmp L2c88
L2c64::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb L6be8
L2c71::
    and eax, 01h
    mov al, byte ptr [D78a0]
    je L2c7d
    inc al
L2c7d::
    sub al, 02h
    sbb al, 00h
    and al, 03h
    mov byte ptr [D78a0], al
L2c88::
    or al, al
    je L2cd4
    test al, 02h
    jne L2cb2
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [D78e4]
    jb L6bf4
L2ca4::
    and eax, dword ptr [D78e0]
    mov edx, dword ptr [D77fc]
    jmp L2cf4
L2cb2::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [D78e6]
    jb L6c00
L2cc6::
    and eax, dword ptr [D78dc]
    mov edx, dword ptr [D7804]
    jmp L2cf4
L2cd4::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [D78e5]
    jb L6c0c
L2ce8::
    and eax, dword ptr [D78d8]
    mov edx, dword ptr [D7898]
L2cf4::
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
    jmp L2f11
L2d2e::
    test byte ptr [D7815], 01h
    jne L25de
L2d3b::
    test byte ptr [D7815], 02h
    jne L26c9
L2d48::
    test byte ptr [D7815], 010h
    jne L27b4
L2d55::
    test byte ptr [D7815], 020h
    jne L289f
L2d62::
    test byte ptr [D7815], 04h
    jne L298a
L2d6f::
    test byte ptr [D7815], 08h
    jne L2a75
L2d7c::
    test byte ptr [D7815], 040h
    jne L2b60
L2d89::
    test byte ptr [D7815], 080h
    jne L2c4b
    jmp L2f11
L2d9b::
    test dword ptr [D78a4], 010000h
    jne L2efc
    jmp L2f11
L2db0::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb L6c18
L2dbd::
    and eax, 01h
    jne L2dc9
    mov al, byte ptr [D78a0]
    jmp L2ded
L2dc9::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb L6c24
L2dd6::
    and eax, 01h
    mov al, byte ptr [D78a0]
    je L2de2
    inc al
L2de2::
    sub al, 02h
    sbb al, 00h
    and al, 03h
    mov byte ptr [D78a0], al
L2ded::
    or al, al
    je L2e80
    test al, 02h
    jne L2e1b
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [D78e4]
    jb L6c30
L2e0d::
    and eax, dword ptr [D78e0]
    mov edx, dword ptr [D77fc]
    jmp L2e3b
L2e1b::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [D78e6]
    jb L6c3c
L2e2f::
    and eax, dword ptr [D78dc]
    mov edx, dword ptr [D7804]
L2e3b::
    shl eax, 03h
    add edx, eax
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 04h
    jb L6c48
L2e51::
    and eax, 0fh
    mov ebx, dword ptr [edx-02h]
    mov dword ptr [D77ec], ecx
    mov ecx, dword ptr [edx]
    mov bx, cx
    mov dword ptr [D77f0], ebp
    mov dword ptr [D77e8], esi
    mov esi, dword ptr [edx+02h]
    mov cx, si
    mov ebp, dword ptr [edx+04h]
    mov si, bp
    mov bp, word ptr [edx+06h]
    jmp L2ee3
L2e80::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [D78e5]
    jb L6c54
L2e94::
    and eax, dword ptr [D78d8]
    mov edx, dword ptr [D7898]
    shl eax, 03h
    add edx, eax
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 04h
    jb L6c60
L2eb6::
    and eax, 0fh
    mov ebx, dword ptr [edx-02h]
    mov dword ptr [D77ec], ecx
    mov ecx, dword ptr [edx]
    mov bx, cx
    mov dword ptr [D77f0], ebp
    mov dword ptr [D77e8], esi
    mov esi, dword ptr [edx+02h]
    mov cx, si
    mov ebp, dword ptr [edx+04h]
    mov si, bp
    mov bp, word ptr [edx+06h]
L2ee3::
    call dword ptr [eax*4+D13a7]
    mov esi, dword ptr [D77e8]
    mov ecx, dword ptr [D77ec]
    mov ebp, dword ptr [D77f0]
L2efc::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb L6c6c
L2f09::
    test al, 01h
    je L2db0
L2f11::
    mov edx, 01h
    mov edi, dword ptr [D77f8]
    jmp L16b4
L2f21::
    mov dword ptr [D77f8], edi
    lea edi, [D78e8]
    jmp L17c2
L2f32::
    cmp bx, word ptr [current_bank]
    jne L6520
L2f3f::
    cmp dword ptr [D78a8], 00h
    jne L2f84
    mov eax, dword ptr [D78c0]
    mov dword ptr [D78a8], eax
    mov eax, dword ptr [D78c4]
    mov dword ptr [D78ac], eax
    mov eax, dword ptr [D78c8]
    mov dword ptr [D78b0], eax
    mov al, byte ptr [D78d4]
    mov byte ptr [D78bc], al
    mov eax, dword ptr [D78d0]
    mov dword ptr [D78b8], eax
    mov eax, dword ptr [D78cc]
    mov dword ptr [D78b4], eax
L2f84::
    mov dword ptr [D77f8], edi
    and edi, 0ffffh
    or edi, dword ptr [D7808]
    mov dword ptr [D7814], 00h
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb L6c78
L2fad::
    test al, 01h
    jne L3464
L2fb5::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb L6c84
L2fc2::
    and eax, 01h
    jne L2fce
    mov al, byte ptr [D78a0]
    jmp L2ff2
L2fce::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb L6c90
L2fdb::
    and eax, 01h
    mov al, byte ptr [D78a0]
    je L2fe7
    inc al
L2fe7::
    sub al, 02h
    sbb al, 00h
    and al, 03h
    mov byte ptr [D78a0], al
L2ff2::
    or al, al
    je L3089
    test al, 02h
    jne L3020
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [D78e4]
    jb L6c9c
L3012::
    and eax, dword ptr [D78e0]
    mov edx, dword ptr [D77fc]
    jmp L3040
L3020::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [D78e6]
    jb L6ca8
L3034::
    and eax, dword ptr [D78dc]
    mov edx, dword ptr [D7804]
L3040::
    shl eax, 03h
    add edx, eax
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 011h
    jae L3058
    add esi, 04h
    or cl, 0e0h
L3058::
    and eax, 01ffffh
    mov ebx, dword ptr [edx-02h]
    mov dword ptr [D77ec], ecx
    mov ecx, dword ptr [edx]
    mov bx, cx
    mov dword ptr [D77f0], ebp
    mov dword ptr [D77e8], esi
    mov esi, dword ptr [edx+02h]
    mov cx, si
    mov ebp, dword ptr [edx+04h]
    mov si, bp
    mov bp, word ptr [edx+06h]
    jmp L30f0
L3089::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [D78e5]
    jb L6cb4
L309d::
    and eax, dword ptr [D78d8]
    mov edx, dword ptr [D7898]
    shl eax, 03h
    add edx, eax
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 011h
    jae L30c1
    add esi, 04h
    or cl, 0e0h
L30c1::
    and eax, 01ffffh
    mov ebx, dword ptr [edx-02h]
    mov dword ptr [D77ec], ecx
    mov ecx, dword ptr [edx]
    mov bx, cx
    mov dword ptr [D77f0], ebp
    mov dword ptr [D77e8], esi
    mov esi, dword ptr [edx+02h]
    mov cx, si
    mov ebp, dword ptr [edx+04h]
    mov si, bp
    mov bp, word ptr [edx+06h]
L30f0::
    or dword ptr [D7814], eax
    test al, al
    je L3285
    test al, 01h
    je L3249
L3106::
    mov dword ptr [edi], ebx
    mov dword ptr [edi+04h], ecx
    cmp di, 0f600h
    jae L311e
    mov dword ptr [edi+0a00h], esi
    mov dword ptr [edi+0a04h], ebp
L311e::
    test al, 02h
    je L3251
L3126::
    cmp di, 0fff8h
    jae L3145
    mov dword ptr [edi+08h], ebx
    mov dword ptr [edi+0ch], ecx
    cmp di, 0f5f8h
    jae L3145
    mov dword ptr [edi+0a08h], esi
    mov dword ptr [edi+0a0ch], ebp
L3145::
    test al, 010h
    je L3259
L314d::
    cmp di, 0fff0h
    jae L316c
    mov dword ptr [edi+010h], ebx
    mov dword ptr [edi+014h], ecx
    cmp di, 0f5f0h
    jae L316c
    mov dword ptr [edi+0a10h], esi
    mov dword ptr [edi+0a14h], ebp
L316c::
    test al, 020h
    je L3261
L3174::
    cmp di, 0ffe8h
    jae L3193
    mov dword ptr [edi+018h], ebx
    mov dword ptr [edi+01ch], ecx
    cmp di, 0f5e8h
    jae L3193
    mov dword ptr [edi+0a18h], esi
    mov dword ptr [edi+0a1ch], ebp
L3193::
    test al, 04h
    je L3269
L319b::
    cmp di, 0ec00h
    jae L31c1
    mov dword ptr [edi+01400h], ebx
    mov dword ptr [edi+01404h], ecx
    cmp di, 0e200h
    jae L31c1
    mov dword ptr [edi+01e00h], esi
    mov dword ptr [edi+01e04h], ebp
L31c1::
    test al, 08h
    je L3271
L31c9::
    cmp di, 0ebf8h
    jae L31ef
    mov dword ptr [edi+01408h], ebx
    mov dword ptr [edi+0140ch], ecx
    cmp di, 0e1f8h
    jae L31ef
    mov dword ptr [edi+01e08h], esi
    mov dword ptr [edi+01e0ch], ebp
L31ef::
    test al, 040h
    je L3279
L31f7::
    cmp di, 0ebf0h
    jae L321d
    mov dword ptr [edi+01410h], ebx
    mov dword ptr [edi+01414h], ecx
    cmp di, 0e1f0h
    jae L321d
    mov dword ptr [edi+01e10h], esi
    mov dword ptr [edi+01e14h], ebp
L321d::
    test al, 080h
    je L3281
L3221::
    cmp di, 0ebe8h
    jae L3247
    mov dword ptr [edi+01418h], ebx
    mov dword ptr [edi+0141ch], ecx
    cmp di, 0e1e8h
    jae L3247
    mov dword ptr [edi+01e18h], esi
    mov dword ptr [edi+01e1ch], ebp
L3247::
    jmp L3285
L3249::
    test al, 01h
    jne L3106
L3251::
    test al, 02h
    jne L3126
L3259::
    test al, 010h
    jne L314d
L3261::
    test al, 020h
    jne L3174
L3269::
    test al, 04h
    jne L319b
L3271::
    test al, 08h
    jne L31c9
L3279::
    test al, 040h
    jne L31f7
L3281::
    test al, 080h
    jne L3221
L3285::
    test ah, ah
    je L3447
    test ah, 01h
    je L3403
L3296::
    cmp di, 0d800h
    jae L32bc
    mov dword ptr [edi+02800h], ebx
    mov dword ptr [edi+02804h], ecx
    cmp di, 0ce00h
    jae L32bc
    mov dword ptr [edi+03200h], esi
    mov dword ptr [edi+03204h], ebp
L32bc::
    test ah, 02h
    je L340c
L32c5::
    cmp di, 0d7f8h
    jae L32eb
    mov dword ptr [edi+02808h], ebx
    mov dword ptr [edi+0280ch], ecx
    cmp di, 0cdf8h
    jae L32eb
    mov dword ptr [edi+03208h], esi
    mov dword ptr [edi+0320ch], ebp
L32eb::
    test ah, 010h
    je L3415
L32f4::
    cmp di, 0d7f0h
    jae L331a
    mov dword ptr [edi+02810h], ebx
    mov dword ptr [edi+02814h], ecx
    cmp di, 0cdf0h
    jae L331a
    mov dword ptr [edi+03210h], esi
    mov dword ptr [edi+03214h], ebp
L331a::
    test ah, 020h
    je L341e
L3323::
    cmp di, 0d7e8h
    jae L3349
    mov dword ptr [edi+02818h], ebx
    mov dword ptr [edi+0281ch], ecx
    cmp di, 0cde8h
    jae L3349
    mov dword ptr [edi+03218h], esi
    mov dword ptr [edi+0321ch], ebp
L3349::
    test ah, 04h
    je L3427
L3352::
    cmp di, 0c400h
    jae L3378
    mov dword ptr [edi+03c00h], ebx
    mov dword ptr [edi+03c04h], ecx
    cmp di, 0ba00h
    jae L3378
    mov dword ptr [edi+04600h], esi
    mov dword ptr [edi+04604h], ebp
L3378::
    test ah, 08h
    je L3430
L3381::
    cmp di, 0c3f8h
    jae L33a7
    mov dword ptr [edi+03c08h], ebx
    mov dword ptr [edi+03c0ch], ecx
    cmp di, 0b9f8h
    jae L33a7
    mov dword ptr [edi+04608h], esi
    mov dword ptr [edi+0460ch], ebp
L33a7::
    test ah, 040h
    je L3439
L33b0::
    cmp di, 0c3f0h
    jae L33d6
    mov dword ptr [edi+03c10h], ebx
    mov dword ptr [edi+03c14h], ecx
    cmp di, 0b9f0h
    jae L33d6
    mov dword ptr [edi+04610h], esi
    mov dword ptr [edi+04614h], ebp
L33d6::
    test ah, 080h
    je L3442
L33db::
    cmp di, 0c3e8h
    jae L3401
    mov dword ptr [edi+03c18h], ebx
    mov dword ptr [edi+03c1ch], ecx
    cmp di, 0b9e8h
    jae L3401
    mov dword ptr [edi+04618h], esi
    mov dword ptr [edi+0461ch], ebp
L3401::
    jmp L3447
L3403::
    test ah, 01h
    jne L3296
L340c::
    test ah, 02h
    jne L32c5
L3415::
    test ah, 010h
    jne L32f4
L341e::
    test ah, 020h
    jne L3323
L3427::
    test ah, 04h
    jne L3352
L3430::
    test ah, 08h
    jne L3381
L3439::
    test ah, 040h
    jne L33b0
L3442::
    test ah, 080h
    jne L33db
L3447::
    mov esi, dword ptr [D77e8]
    mov ecx, dword ptr [D77ec]
    mov ebp, dword ptr [D77f0]
    and eax, 010000h
    je L2fb5
L3464::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb L6cc0
L3471::
    test al, 01h
    jne L4733
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 04h
    jb L6ccc
L348a::
    and eax, 0fh
    jmp dword ptr [eax*4+D3494]
entry_1c12 endp
D3494 dword offset entry_34d4
    dword offset L34f2
    dword offset L3513
    dword offset L3537
    dword offset L3557
    dword offset L3579
    dword offset L35a0
    dword offset L35c3
    dword offset L35e7
    dword offset L3606
    dword offset L362a
    dword offset L3650
    dword offset L3670
    dword offset L368b
    dword offset L36ac
    dword offset L36ca
entry_34d4 proc near
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 010h
    jae L34e7
    add esi, 04h
    or cl, 0e0h
L34e7::
    xor dword ptr [D7814], eax
    jmp L36d0
L34f2::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 0ch
    jb L6cd8
L3503::
    shl eax, 04h
    or al, 0fh
    xor dword ptr [D7814], eax
    jmp L36d0
L3513::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 0ch
    jb L6ce4
L3524::
    shl eax, 04h
    shr al, 04h
    or al, 0f0h
    xor dword ptr [D7814], eax
    jmp L36d0
L3537::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 08h
    jb L6cf0
L3548::
    mov ah, al
    mov al, 0ffh
    xor dword ptr [D7814], eax
    jmp L36d0
L3557::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 0ch
    jb L6cfc
L3568::
    shl ah, 04h
    or ah, 0fh
    xor dword ptr [D7814], eax
    jmp L36d0
L3579::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 08h
    jb L6d08
L358a::
    shl eax, 04h
    shl ah, 04h
    or eax, 0f0fh
    xor dword ptr [D7814], eax
    jmp L36d0
L35a0::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 08h
    jb L6d14
L35b1::
    mov ah, al
    or eax, 0ff0h
    xor dword ptr [D7814], eax
    jmp L36d0
L35c3::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 04h
    jb L6d20
L35d4::
    shl eax, 0ch
    or eax, 0fffh
    xor dword ptr [D7814], eax
    jmp L36d0
L35e7::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 0ch
    jb L6d2c
L35f8::
    or ah, 0f0h
    xor dword ptr [D7814], eax
    jmp L36d0
L3606::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 08h
    jb L6d38
L3617::
    shl eax, 04h
    or eax, 0f00fh
    xor dword ptr [D7814], eax
    jmp L36d0
L362a::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 08h
    jb L6d44
L363b::
    mov ah, al
    ror ah, 04h
    or eax, 0f0f0h
    xor dword ptr [D7814], eax
    jmp L36d0
L3650::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 04h
    jb L6d50
L3661::
    mov ah, al
    or eax, 0f0ffh
    xor dword ptr [D7814], eax
    jmp L36d0
L3670::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 08h
    jb L6d5c
L3681::
    mov ah, 0ffh
    xor dword ptr [D7814], eax
    jmp L36d0
L368b::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 04h
    jb L6d68
L369c::
    or eax, 0fff0h
    rol al, 04h
    xor dword ptr [D7814], eax
    jmp L36d0
L36ac::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 04h
    jb L6d74
L36bd::
    or eax, 0fff0h
    xor dword ptr [D7814], eax
    jmp L36d0
L36ca::
    not dword ptr [D7814]
L36d0::
    test byte ptr [D7814], 0ffh
    je L3eec
    test byte ptr [D7814], 01h
    je L3e84
L36ea::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb L6d80
L36f7::
    and eax, 01h
    jne L3703
    mov al, byte ptr [D78a0]
    jmp L3727
L3703::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb L6d8c
L3710::
    and eax, 01h
    mov al, byte ptr [D78a0]
    je L371c
    inc al
L371c::
    sub al, 02h
    sbb al, 00h
    and al, 03h
    mov byte ptr [D78a0], al
L3727::
    or al, al
    je L3773
    test al, 02h
    jne L3751
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [D78e4]
    jb L6d98
L3743::
    and eax, dword ptr [D78e0]
    mov edx, dword ptr [D77fc]
    jmp L3793
L3751::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [D78e6]
    jb L6da4
L3765::
    and eax, dword ptr [D78dc]
    mov edx, dword ptr [D7804]
    jmp L3793
L3773::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [D78e5]
    jb L6db0
L3787::
    and eax, dword ptr [D78d8]
    mov edx, dword ptr [D7898]
L3793::
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
    jae L37c8
    mov eax, dword ptr [edx+04h]
    mov bx, ax
    mov ax, word ptr [edx+06h]
    mov dword ptr [edi+0a00h], ebx
    mov dword ptr [edi+0a04h], eax
L37c8::
    test byte ptr [D7814], 02h
    je L3e91
L37d5::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb L6dbc
L37e2::
    and eax, 01h
    jne L37ee
    mov al, byte ptr [D78a0]
    jmp L3812
L37ee::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb L6dc8
L37fb::
    and eax, 01h
    mov al, byte ptr [D78a0]
    je L3807
    inc al
L3807::
    sub al, 02h
    sbb al, 00h
    and al, 03h
    mov byte ptr [D78a0], al
L3812::
    or al, al
    je L385e
    test al, 02h
    jne L383c
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [D78e4]
    jb L6dd4
L382e::
    and eax, dword ptr [D78e0]
    mov edx, dword ptr [D77fc]
    jmp L387e
L383c::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [D78e6]
    jb L6de0
L3850::
    and eax, dword ptr [D78dc]
    mov edx, dword ptr [D7804]
    jmp L387e
L385e::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [D78e5]
    jb L6dec
L3872::
    and eax, dword ptr [D78d8]
    mov edx, dword ptr [D7898]
L387e::
    shl eax, 03h
    add edx, eax
    cmp di, 0fff8h
    jae L38ba
    mov ebx, dword ptr [edx-02h]
    mov eax, dword ptr [edx]
    mov bx, ax
    mov dword ptr [edi+08h], ebx
    mov ebx, dword ptr [edx+02h]
    mov ax, bx
    cmp di, 0f5f8h
    mov dword ptr [edi+0ch], eax
    jae L38ba
    mov eax, dword ptr [edx+04h]
    mov bx, ax
    mov ax, word ptr [edx+06h]
    mov dword ptr [edi+0a08h], ebx
    mov dword ptr [edi+0a0ch], eax
L38ba::
    test byte ptr [D7814], 010h
    je L3e9e
L38c7::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb L6df8
L38d4::
    and eax, 01h
    jne L38e0
    mov al, byte ptr [D78a0]
    jmp L3904
L38e0::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb L6e04
L38ed::
    and eax, 01h
    mov al, byte ptr [D78a0]
    je L38f9
    inc al
L38f9::
    sub al, 02h
    sbb al, 00h
    and al, 03h
    mov byte ptr [D78a0], al
L3904::
    or al, al
    je L3950
    test al, 02h
    jne L392e
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [D78e4]
    jb L6e10
L3920::
    and eax, dword ptr [D78e0]
    mov edx, dword ptr [D77fc]
    jmp L3970
L392e::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [D78e6]
    jb L6e1c
L3942::
    and eax, dword ptr [D78dc]
    mov edx, dword ptr [D7804]
    jmp L3970
L3950::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [D78e5]
    jb L6e28
L3964::
    and eax, dword ptr [D78d8]
    mov edx, dword ptr [D7898]
L3970::
    shl eax, 03h
    add edx, eax
    cmp di, 0fff0h
    jae L39ac
    mov ebx, dword ptr [edx-02h]
    mov eax, dword ptr [edx]
    mov bx, ax
    mov dword ptr [edi+010h], ebx
    mov ebx, dword ptr [edx+02h]
    mov ax, bx
    cmp di, 0f5f0h
    mov dword ptr [edi+014h], eax
    jae L39ac
    mov eax, dword ptr [edx+04h]
    mov bx, ax
    mov ax, word ptr [edx+06h]
    mov dword ptr [edi+0a10h], ebx
    mov dword ptr [edi+0a14h], eax
L39ac::
    test byte ptr [D7814], 020h
    je L3eab
L39b9::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb L6e34
L39c6::
    and eax, 01h
    jne L39d2
    mov al, byte ptr [D78a0]
    jmp L39f6
L39d2::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb L6e40
L39df::
    and eax, 01h
    mov al, byte ptr [D78a0]
    je L39eb
    inc al
L39eb::
    sub al, 02h
    sbb al, 00h
    and al, 03h
    mov byte ptr [D78a0], al
L39f6::
    or al, al
    je L3a42
    test al, 02h
    jne L3a20
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [D78e4]
    jb L6e4c
L3a12::
    and eax, dword ptr [D78e0]
    mov edx, dword ptr [D77fc]
    jmp L3a62
L3a20::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [D78e6]
    jb L6e58
L3a34::
    and eax, dword ptr [D78dc]
    mov edx, dword ptr [D7804]
    jmp L3a62
L3a42::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [D78e5]
    jb L6e64
L3a56::
    and eax, dword ptr [D78d8]
    mov edx, dword ptr [D7898]
L3a62::
    shl eax, 03h
    add edx, eax
    cmp di, 0ffe8h
    jae L3a9e
    mov ebx, dword ptr [edx-02h]
    mov eax, dword ptr [edx]
    mov bx, ax
    mov dword ptr [edi+018h], ebx
    mov ebx, dword ptr [edx+02h]
    mov ax, bx
    cmp di, 0f5e8h
    mov dword ptr [edi+01ch], eax
    jae L3a9e
    mov eax, dword ptr [edx+04h]
    mov bx, ax
    mov ax, word ptr [edx+06h]
    mov dword ptr [edi+0a18h], ebx
    mov dword ptr [edi+0a1ch], eax
L3a9e::
    test byte ptr [D7814], 04h
    je L3eb8
L3aab::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb L6e70
L3ab8::
    and eax, 01h
    jne L3ac4
    mov al, byte ptr [D78a0]
    jmp L3ae8
L3ac4::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb L6e7c
L3ad1::
    and eax, 01h
    mov al, byte ptr [D78a0]
    je L3add
    inc al
L3add::
    sub al, 02h
    sbb al, 00h
    and al, 03h
    mov byte ptr [D78a0], al
L3ae8::
    or al, al
    je L3b34
    test al, 02h
    jne L3b12
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [D78e4]
    jb L6e88
L3b04::
    and eax, dword ptr [D78e0]
    mov edx, dword ptr [D77fc]
    jmp L3b54
L3b12::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [D78e6]
    jb L6e94
L3b26::
    and eax, dword ptr [D78dc]
    mov edx, dword ptr [D7804]
    jmp L3b54
L3b34::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [D78e5]
    jb L6ea0
L3b48::
    and eax, dword ptr [D78d8]
    mov edx, dword ptr [D7898]
L3b54::
    shl eax, 03h
    add edx, eax
    cmp di, 0ec00h
    jae L3b97
    mov ebx, dword ptr [edx-02h]
    mov eax, dword ptr [edx]
    mov bx, ax
    mov dword ptr [edi+01400h], ebx
    mov ebx, dword ptr [edx+02h]
    mov ax, bx
    cmp di, 0e200h
    mov dword ptr [edi+01404h], eax
    jae L3b97
    mov eax, dword ptr [edx+04h]
    mov bx, ax
    mov ax, word ptr [edx+06h]
    mov dword ptr [edi+01e00h], ebx
    mov dword ptr [edi+01e04h], eax
L3b97::
    test byte ptr [D7814], 08h
    je L3ec5
L3ba4::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb L6eac
L3bb1::
    and eax, 01h
    jne L3bbd
    mov al, byte ptr [D78a0]
    jmp L3be1
L3bbd::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb L6eb8
L3bca::
    and eax, 01h
    mov al, byte ptr [D78a0]
    je L3bd6
    inc al
L3bd6::
    sub al, 02h
    sbb al, 00h
    and al, 03h
    mov byte ptr [D78a0], al
L3be1::
    or al, al
    je L3c2d
    test al, 02h
    jne L3c0b
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [D78e4]
    jb L6ec4
L3bfd::
    and eax, dword ptr [D78e0]
    mov edx, dword ptr [D77fc]
    jmp L3c4d
L3c0b::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [D78e6]
    jb L6ed0
L3c1f::
    and eax, dword ptr [D78dc]
    mov edx, dword ptr [D7804]
    jmp L3c4d
L3c2d::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [D78e5]
    jb L6edc
L3c41::
    and eax, dword ptr [D78d8]
    mov edx, dword ptr [D7898]
L3c4d::
    shl eax, 03h
    add edx, eax
    cmp di, 0ebf8h
    jae L3c90
    mov ebx, dword ptr [edx-02h]
    mov eax, dword ptr [edx]
    mov bx, ax
    mov dword ptr [edi+01408h], ebx
    mov ebx, dword ptr [edx+02h]
    mov ax, bx
    cmp di, 0e1f8h
    mov dword ptr [edi+0140ch], eax
    jae L3c90
    mov eax, dword ptr [edx+04h]
    mov bx, ax
    mov ax, word ptr [edx+06h]
    mov dword ptr [edi+01e08h], ebx
    mov dword ptr [edi+01e0ch], eax
L3c90::
    test byte ptr [D7814], 040h
    je L3ed2
L3c9d::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb L6ee8
L3caa::
    and eax, 01h
    jne L3cb6
    mov al, byte ptr [D78a0]
    jmp L3cda
L3cb6::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb L6ef4
L3cc3::
    and eax, 01h
    mov al, byte ptr [D78a0]
    je L3ccf
    inc al
L3ccf::
    sub al, 02h
    sbb al, 00h
    and al, 03h
    mov byte ptr [D78a0], al
L3cda::
    or al, al
    je L3d26
    test al, 02h
    jne L3d04
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [D78e4]
    jb L6f00
L3cf6::
    and eax, dword ptr [D78e0]
    mov edx, dword ptr [D77fc]
    jmp L3d46
L3d04::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [D78e6]
    jb L6f0c
L3d18::
    and eax, dword ptr [D78dc]
    mov edx, dword ptr [D7804]
    jmp L3d46
L3d26::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [D78e5]
    jb L6f18
L3d3a::
    and eax, dword ptr [D78d8]
    mov edx, dword ptr [D7898]
L3d46::
    shl eax, 03h
    add edx, eax
    cmp di, 0ebf0h
    jae L3d89
    mov ebx, dword ptr [edx-02h]
    mov eax, dword ptr [edx]
    mov bx, ax
    mov dword ptr [edi+01410h], ebx
    mov ebx, dword ptr [edx+02h]
    mov ax, bx
    cmp di, 0e1f0h
    mov dword ptr [edi+01414h], eax
    jae L3d89
    mov eax, dword ptr [edx+04h]
    mov bx, ax
    mov ax, word ptr [edx+06h]
    mov dword ptr [edi+01e10h], ebx
    mov dword ptr [edi+01e14h], eax
L3d89::
    test byte ptr [D7814], 080h
    je L3edf
L3d96::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb L6f24
L3da3::
    and eax, 01h
    jne L3daf
    mov al, byte ptr [D78a0]
    jmp L3dd3
L3daf::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb L6f30
L3dbc::
    and eax, 01h
    mov al, byte ptr [D78a0]
    je L3dc8
    inc al
L3dc8::
    sub al, 02h
    sbb al, 00h
    and al, 03h
    mov byte ptr [D78a0], al
L3dd3::
    or al, al
    je L3e1f
    test al, 02h
    jne L3dfd
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [D78e4]
    jb L6f3c
L3def::
    and eax, dword ptr [D78e0]
    mov edx, dword ptr [D77fc]
    jmp L3e3f
L3dfd::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [D78e6]
    jb L6f48
L3e11::
    and eax, dword ptr [D78dc]
    mov edx, dword ptr [D7804]
    jmp L3e3f
L3e1f::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [D78e5]
    jb L6f54
L3e33::
    and eax, dword ptr [D78d8]
    mov edx, dword ptr [D7898]
L3e3f::
    shl eax, 03h
    add edx, eax
    cmp di, 0ebe8h
    jae L3e82
    mov ebx, dword ptr [edx-02h]
    mov eax, dword ptr [edx]
    mov bx, ax
    mov dword ptr [edi+01418h], ebx
    mov ebx, dword ptr [edx+02h]
    mov ax, bx
    cmp di, 0e1e8h
    mov dword ptr [edi+0141ch], eax
    jae L3e82
    mov eax, dword ptr [edx+04h]
    mov bx, ax
    mov ax, word ptr [edx+06h]
    mov dword ptr [edi+01e18h], ebx
    mov dword ptr [edi+01e1ch], eax
L3e82::
    jmp L3eec
L3e84::
    test byte ptr [D7814], 01h
    jne L36ea
L3e91::
    test byte ptr [D7814], 02h
    jne L37d5
L3e9e::
    test byte ptr [D7814], 010h
    jne L38c7
L3eab::
    test byte ptr [D7814], 020h
    jne L39b9
L3eb8::
    test byte ptr [D7814], 04h
    jne L3aab
L3ec5::
    test byte ptr [D7814], 08h
    jne L3ba4
L3ed2::
    test byte ptr [D7814], 040h
    jne L3c9d
L3edf::
    test byte ptr [D7814], 080h
    jne L3d96
L3eec::
    test byte ptr [D7815], 0ffh
    je L48a9
    test byte ptr [D7815], 01h
    je L46c6
L3f06::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb L6f60
L3f13::
    and eax, 01h
    jne L3f1f
    mov al, byte ptr [D78a0]
    jmp L3f43
L3f1f::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb L6f6c
L3f2c::
    and eax, 01h
    mov al, byte ptr [D78a0]
    je L3f38
    inc al
L3f38::
    sub al, 02h
    sbb al, 00h
    and al, 03h
    mov byte ptr [D78a0], al
L3f43::
    or al, al
    je L3f8f
    test al, 02h
    jne L3f6d
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [D78e4]
    jb L6f78
L3f5f::
    and eax, dword ptr [D78e0]
    mov edx, dword ptr [D77fc]
    jmp L3faf
L3f6d::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [D78e6]
    jb L6f84
L3f81::
    and eax, dword ptr [D78dc]
    mov edx, dword ptr [D7804]
    jmp L3faf
L3f8f::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [D78e5]
    jb L6f90
L3fa3::
    and eax, dword ptr [D78d8]
    mov edx, dword ptr [D7898]
L3faf::
    shl eax, 03h
    add edx, eax
    cmp di, 0d800h
    jae L3ff2
    mov ebx, dword ptr [edx-02h]
    mov eax, dword ptr [edx]
    mov bx, ax
    mov dword ptr [edi+02800h], ebx
    mov ebx, dword ptr [edx+02h]
    mov ax, bx
    cmp di, 0ce00h
    mov dword ptr [edi+02804h], eax
    jae L3ff2
    mov eax, dword ptr [edx+04h]
    mov bx, ax
    mov ax, word ptr [edx+06h]
    mov dword ptr [edi+03200h], ebx
    mov dword ptr [edi+03204h], eax
L3ff2::
    test byte ptr [D7815], 02h
    je L46d3
L3fff::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb L6f9c
L400c::
    and eax, 01h
    jne L4018
    mov al, byte ptr [D78a0]
    jmp L403c
L4018::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb L6fa8
L4025::
    and eax, 01h
    mov al, byte ptr [D78a0]
    je L4031
    inc al
L4031::
    sub al, 02h
    sbb al, 00h
    and al, 03h
    mov byte ptr [D78a0], al
L403c::
    or al, al
    je L4088
    test al, 02h
    jne L4066
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [D78e4]
    jb L6fb4
L4058::
    and eax, dword ptr [D78e0]
    mov edx, dword ptr [D77fc]
    jmp L40a8
L4066::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [D78e6]
    jb L6fc0
L407a::
    and eax, dword ptr [D78dc]
    mov edx, dword ptr [D7804]
    jmp L40a8
L4088::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [D78e5]
    jb L6fcc
L409c::
    and eax, dword ptr [D78d8]
    mov edx, dword ptr [D7898]
L40a8::
    shl eax, 03h
    add edx, eax
    cmp di, 0d7f8h
    jae L40eb
    mov ebx, dword ptr [edx-02h]
    mov eax, dword ptr [edx]
    mov bx, ax
    mov dword ptr [edi+02808h], ebx
    mov ebx, dword ptr [edx+02h]
    mov ax, bx
    cmp di, 0cdf8h
    mov dword ptr [edi+0280ch], eax
    jae L40eb
    mov eax, dword ptr [edx+04h]
    mov bx, ax
    mov ax, word ptr [edx+06h]
    mov dword ptr [edi+03208h], ebx
    mov dword ptr [edi+0320ch], eax
L40eb::
    test byte ptr [D7815], 010h
    je L46e0
L40f8::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb L6fd8
L4105::
    and eax, 01h
    jne L4111
    mov al, byte ptr [D78a0]
    jmp L4135
L4111::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb L6fe4
L411e::
    and eax, 01h
    mov al, byte ptr [D78a0]
    je L412a
    inc al
L412a::
    sub al, 02h
    sbb al, 00h
    and al, 03h
    mov byte ptr [D78a0], al
L4135::
    or al, al
    je L4181
    test al, 02h
    jne L415f
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [D78e4]
    jb L6ff0
L4151::
    and eax, dword ptr [D78e0]
    mov edx, dword ptr [D77fc]
    jmp L41a1
L415f::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [D78e6]
    jb L6ffc
L4173::
    and eax, dword ptr [D78dc]
    mov edx, dword ptr [D7804]
    jmp L41a1
L4181::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [D78e5]
    jb L7008
L4195::
    and eax, dword ptr [D78d8]
    mov edx, dword ptr [D7898]
L41a1::
    shl eax, 03h
    add edx, eax
    cmp di, 0d7f0h
    jae L41e4
    mov ebx, dword ptr [edx-02h]
    mov eax, dword ptr [edx]
    mov bx, ax
    mov dword ptr [edi+02810h], ebx
    mov ebx, dword ptr [edx+02h]
    mov ax, bx
    cmp di, 0cdf0h
    mov dword ptr [edi+02814h], eax
    jae L41e4
    mov eax, dword ptr [edx+04h]
    mov bx, ax
    mov ax, word ptr [edx+06h]
    mov dword ptr [edi+03210h], ebx
    mov dword ptr [edi+03214h], eax
L41e4::
    test byte ptr [D7815], 020h
    je L46ed
L41f1::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb L7014
L41fe::
    and eax, 01h
    jne L420a
    mov al, byte ptr [D78a0]
    jmp L422e
L420a::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb L7020
L4217::
    and eax, 01h
    mov al, byte ptr [D78a0]
    je L4223
    inc al
L4223::
    sub al, 02h
    sbb al, 00h
    and al, 03h
    mov byte ptr [D78a0], al
L422e::
    or al, al
    je L427a
    test al, 02h
    jne L4258
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [D78e4]
    jb L702c
L424a::
    and eax, dword ptr [D78e0]
    mov edx, dword ptr [D77fc]
    jmp L429a
L4258::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [D78e6]
    jb L7038
L426c::
    and eax, dword ptr [D78dc]
    mov edx, dword ptr [D7804]
    jmp L429a
L427a::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [D78e5]
    jb L7044
L428e::
    and eax, dword ptr [D78d8]
    mov edx, dword ptr [D7898]
L429a::
    shl eax, 03h
    add edx, eax
    cmp di, 0d7e8h
    jae L42dd
    mov ebx, dword ptr [edx-02h]
    mov eax, dword ptr [edx]
    mov bx, ax
    mov dword ptr [edi+02818h], ebx
    mov ebx, dword ptr [edx+02h]
    mov ax, bx
    cmp di, 0cde8h
    mov dword ptr [edi+0281ch], eax
    jae L42dd
    mov eax, dword ptr [edx+04h]
    mov bx, ax
    mov ax, word ptr [edx+06h]
    mov dword ptr [edi+03218h], ebx
    mov dword ptr [edi+0321ch], eax
L42dd::
    test byte ptr [D7815], 04h
    je L46fa
L42ea::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb L7050
L42f7::
    and eax, 01h
    jne L4303
    mov al, byte ptr [D78a0]
    jmp L4327
L4303::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb L705c
L4310::
    and eax, 01h
    mov al, byte ptr [D78a0]
    je L431c
    inc al
L431c::
    sub al, 02h
    sbb al, 00h
    and al, 03h
    mov byte ptr [D78a0], al
L4327::
    or al, al
    je L4373
    test al, 02h
    jne L4351
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [D78e4]
    jb L7068
L4343::
    and eax, dword ptr [D78e0]
    mov edx, dword ptr [D77fc]
    jmp L4393
L4351::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [D78e6]
    jb L7074
L4365::
    and eax, dword ptr [D78dc]
    mov edx, dword ptr [D7804]
    jmp L4393
L4373::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [D78e5]
    jb L7080
L4387::
    and eax, dword ptr [D78d8]
    mov edx, dword ptr [D7898]
L4393::
    shl eax, 03h
    add edx, eax
    cmp di, 0c400h
    jae L43d6
    mov ebx, dword ptr [edx-02h]
    mov eax, dword ptr [edx]
    mov bx, ax
    mov dword ptr [edi+03c00h], ebx
    mov ebx, dword ptr [edx+02h]
    mov ax, bx
    cmp di, 0ba00h
    mov dword ptr [edi+03c04h], eax
    jae L43d6
    mov eax, dword ptr [edx+04h]
    mov bx, ax
    mov ax, word ptr [edx+06h]
    mov dword ptr [edi+04600h], ebx
    mov dword ptr [edi+04604h], eax
L43d6::
    test byte ptr [D7815], 08h
    je L4707
L43e3::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb L708c
L43f0::
    and eax, 01h
    jne L43fc
    mov al, byte ptr [D78a0]
    jmp L4420
L43fc::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb L7098
L4409::
    and eax, 01h
    mov al, byte ptr [D78a0]
    je L4415
    inc al
L4415::
    sub al, 02h
    sbb al, 00h
    and al, 03h
    mov byte ptr [D78a0], al
L4420::
    or al, al
    je L446c
    test al, 02h
    jne L444a
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [D78e4]
    jb L70a4
L443c::
    and eax, dword ptr [D78e0]
    mov edx, dword ptr [D77fc]
    jmp L448c
L444a::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [D78e6]
    jb L70b0
L445e::
    and eax, dword ptr [D78dc]
    mov edx, dword ptr [D7804]
    jmp L448c
L446c::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [D78e5]
    jb L70bc
L4480::
    and eax, dword ptr [D78d8]
    mov edx, dword ptr [D7898]
L448c::
    shl eax, 03h
    add edx, eax
    cmp di, 0c3f8h
    jae L44cf
    mov ebx, dword ptr [edx-02h]
    mov eax, dword ptr [edx]
    mov bx, ax
    mov dword ptr [edi+03c08h], ebx
    mov ebx, dword ptr [edx+02h]
    mov ax, bx
    cmp di, 0b9f8h
    mov dword ptr [edi+03c0ch], eax
    jae L44cf
    mov eax, dword ptr [edx+04h]
    mov bx, ax
    mov ax, word ptr [edx+06h]
    mov dword ptr [edi+04608h], ebx
    mov dword ptr [edi+0460ch], eax
L44cf::
    test byte ptr [D7815], 040h
    je L4714
L44dc::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb L70c8
L44e9::
    and eax, 01h
    jne L44f5
    mov al, byte ptr [D78a0]
    jmp L4519
L44f5::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb L70d4
L4502::
    and eax, 01h
    mov al, byte ptr [D78a0]
    je L450e
    inc al
L450e::
    sub al, 02h
    sbb al, 00h
    and al, 03h
    mov byte ptr [D78a0], al
L4519::
    or al, al
    je L4565
    test al, 02h
    jne L4543
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [D78e4]
    jb L70e0
L4535::
    and eax, dword ptr [D78e0]
    mov edx, dword ptr [D77fc]
    jmp L4585
L4543::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [D78e6]
    jb L70ec
L4557::
    and eax, dword ptr [D78dc]
    mov edx, dword ptr [D7804]
    jmp L4585
L4565::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [D78e5]
    jb L70f8
L4579::
    and eax, dword ptr [D78d8]
    mov edx, dword ptr [D7898]
L4585::
    shl eax, 03h
    add edx, eax
    cmp di, 0c3f0h
    jae L45c8
    mov ebx, dword ptr [edx-02h]
    mov eax, dword ptr [edx]
    mov bx, ax
    mov dword ptr [edi+03c10h], ebx
    mov ebx, dword ptr [edx+02h]
    mov ax, bx
    cmp di, 0b9f0h
    mov dword ptr [edi+03c14h], eax
    jae L45c8
    mov eax, dword ptr [edx+04h]
    mov bx, ax
    mov ax, word ptr [edx+06h]
    mov dword ptr [edi+04610h], ebx
    mov dword ptr [edi+04614h], eax
L45c8::
    test byte ptr [D7815], 080h
    je L4721
L45d5::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb L7104
L45e2::
    and eax, 01h
    jne L45ee
    mov al, byte ptr [D78a0]
    jmp L4612
L45ee::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb L7110
L45fb::
    and eax, 01h
    mov al, byte ptr [D78a0]
    je L4607
    inc al
L4607::
    sub al, 02h
    sbb al, 00h
    and al, 03h
    mov byte ptr [D78a0], al
L4612::
    or al, al
    je L465e
    test al, 02h
    jne L463c
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [D78e4]
    jb L711c
L462e::
    and eax, dword ptr [D78e0]
    mov edx, dword ptr [D77fc]
    jmp L467e
L463c::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [D78e6]
    jb L7128
L4650::
    and eax, dword ptr [D78dc]
    mov edx, dword ptr [D7804]
    jmp L467e
L465e::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [D78e5]
    jb L7134
L4672::
    and eax, dword ptr [D78d8]
    mov edx, dword ptr [D7898]
L467e::
    shl eax, 03h
    add edx, eax
    cmp di, 0c3e8h
    jae L46c1
    mov ebx, dword ptr [edx-02h]
    mov eax, dword ptr [edx]
    mov bx, ax
    mov dword ptr [edi+03c18h], ebx
    mov ebx, dword ptr [edx+02h]
    mov ax, bx
    cmp di, 0b9e8h
    mov dword ptr [edi+03c1ch], eax
    jae L46c1
    mov eax, dword ptr [edx+04h]
    mov bx, ax
    mov ax, word ptr [edx+06h]
    mov dword ptr [edi+04618h], ebx
    mov dword ptr [edi+0461ch], eax
L46c1::
    jmp L48a9
L46c6::
    test byte ptr [D7815], 01h
    jne L3f06
L46d3::
    test byte ptr [D7815], 02h
    jne L3fff
L46e0::
    test byte ptr [D7815], 010h
    jne L40f8
L46ed::
    test byte ptr [D7815], 020h
    jne L41f1
L46fa::
    test byte ptr [D7815], 04h
    jne L42ea
L4707::
    test byte ptr [D7815], 08h
    jne L43e3
L4714::
    test byte ptr [D7815], 040h
    jne L44dc
L4721::
    test byte ptr [D7815], 080h
    jne L45d5
    jmp L48a9
L4733::
    test dword ptr [D78a4], 010000h
    jne L4894
    jmp L48a9
L4748::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb L7140
L4755::
    and eax, 01h
    jne L4761
    mov al, byte ptr [D78a0]
    jmp L4785
L4761::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb L714c
L476e::
    and eax, 01h
    mov al, byte ptr [D78a0]
    je L477a
    inc al
L477a::
    sub al, 02h
    sbb al, 00h
    and al, 03h
    mov byte ptr [D78a0], al
L4785::
    or al, al
    je L4818
    test al, 02h
    jne L47b3
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [D78e4]
    jb L7158
L47a5::
    and eax, dword ptr [D78e0]
    mov edx, dword ptr [D77fc]
    jmp L47d3
L47b3::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [D78e6]
    jb L7164
L47c7::
    and eax, dword ptr [D78dc]
    mov edx, dword ptr [D7804]
L47d3::
    shl eax, 03h
    add edx, eax
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 04h
    jb L7170
L47e9::
    and eax, 0fh
    mov ebx, dword ptr [edx-02h]
    mov dword ptr [D77ec], ecx
    mov ecx, dword ptr [edx]
    mov bx, cx
    mov dword ptr [D77f0], ebp
    mov dword ptr [D77e8], esi
    mov esi, dword ptr [edx+02h]
    mov cx, si
    mov ebp, dword ptr [edx+04h]
    mov si, bp
    mov bp, word ptr [edx+06h]
    jmp L487b
L4818::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [D78e5]
    jb L717c
L482c::
    and eax, dword ptr [D78d8]
    mov edx, dword ptr [D7898]
    shl eax, 03h
    add edx, eax
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 04h
    jb L7188
L484e::
    and eax, 0fh
    mov ebx, dword ptr [edx-02h]
    mov dword ptr [D77ec], ecx
    mov ecx, dword ptr [edx]
    mov bx, cx
    mov dword ptr [D77f0], ebp
    mov dword ptr [D77e8], esi
    mov esi, dword ptr [edx+02h]
    mov cx, si
    mov ebp, dword ptr [edx+04h]
    mov si, bp
    mov bp, word ptr [edx+06h]
L487b::
    call dword ptr [eax*4+D13e7]
    mov esi, dword ptr [D77e8]
    mov ecx, dword ptr [D77ec]
    mov ebp, dword ptr [D77f0]
L4894::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb L7194
L48a1::
    test al, 01h
    je L4748
L48a9::
    mov edx, 01h
    mov edi, dword ptr [D77f8]
    jmp L16e4
L48b9::
    cmp dword ptr [D78a8], 00h
    jne L48ca
    pop edx
    pop ecx
    pop ebx
    pop eax
    pop edi
    pop esi
    leave
    ret
L48ca::
    call entry_490c
    pop edx
    pop ecx
    pop ebx
    pop eax
    pop edi
    pop esi
    leave
    ret
    align 4
    word 0
    align 4
L48dc::
    cmp dword ptr [D78a8], 00h
    je L48f7
    call entry_490c
    cmp bx, word ptr [current_bank]
    je L17a9
L48f7::
    pusha
    mov ax, bx
    call set_bank
    popa
    jmp L17a9
entry_34d4 endp
    align 4
    word 0
    align 4
entry_490c proc near
    mov al, byte ptr [D78bc]
    mov byte ptr [D78a0], al
    mov esi, 00h
    xchg dword ptr [D78a8], esi
    mov ecx, dword ptr [D78ac]
    mov edx, dword ptr [D78b0]
    mov eax, dword ptr [D78b8]
    mov dword ptr [D789c], eax
L4937::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb L71a0
L4944::
    and eax, 01h
    je L499a
    add edx, 01h
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 03h
    jb L71ac
L495d::
    and eax, 07h
    add edx, eax
    cmp eax, 07h
    jl L499a
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 07h
    jb L71b8
L4978::
    and eax, 07fh
    add edx, eax
    cmp eax, 07fh
    jl L499a
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 0ch
    jb L71c4
L4993::
    and eax, 0fffh
    add edx, eax
L499a::
    bswap ecx
    mov cl, byte ptr [D78e7]
    mov ebx, edx
    shl ebx, cl
    add dword ptr [D78b4], ebx
    bswap ecx
    add edx, dword ptr [D789c]
    cmp edx, dword ptr [D780c]
    jae L48b9
    mov dword ptr [D789c], edx
    shl edx, 02h
    add edx, dword ptr [ebp+014h]
    mov edi, dword ptr [edx]
    cmp edi, 0ffffffffh
    je L6503
    cmp edi, 0fffffffeh
    je L48b9
    shld ebx, edi, 010h
    cmp di, 0b4f2h
    jbe L6514
    inc bx
    cmp bx, word ptr [current_bank]
    jne L653c
L49fe::
    mov dword ptr [D77f8], edi
    and edi, 0ffffh
    or edi, dword ptr [D7808]
L4a10::
    mov dword ptr [D7814], 00h
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb L71d0
L4a27::
    test al, 01h
    jne L4fbe
L4a2f::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb L71dc
L4a3c::
    and eax, 01h
    jne L4a48
    mov al, byte ptr [D78a0]
    jmp L4a6c
L4a48::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb L71e8
L4a55::
    and eax, 01h
    mov al, byte ptr [D78a0]
    je L4a61
    inc al
L4a61::
    sub al, 02h
    sbb al, 00h
    and al, 03h
    mov byte ptr [D78a0], al
L4a6c::
    or al, al
    je L4b03
    test al, 02h
    jne L4a9a
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [D78e4]
    jb L71f4
L4a8c::
    and eax, dword ptr [D78e0]
    mov edx, dword ptr [D77fc]
    jmp L4aba
L4a9a::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [D78e6]
    jb L7200
L4aae::
    and eax, dword ptr [D78dc]
    mov edx, dword ptr [D7804]
L4aba::
    shl eax, 03h
    add edx, eax
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 011h
    jae L4ad2
    add esi, 04h
    or cl, 0e0h
L4ad2::
    and eax, 01ffffh
    mov ebx, dword ptr [edx-02h]
    mov dword ptr [D77ec], ecx
    mov ecx, dword ptr [edx]
    mov bx, cx
    mov dword ptr [D77f0], ebp
    mov dword ptr [D77e8], esi
    mov esi, dword ptr [edx+02h]
    mov cx, si
    mov ebp, dword ptr [edx+04h]
    mov si, bp
    mov bp, word ptr [edx+06h]
    jmp L4b6a
L4b03::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [D78e5]
    jb L720c
L4b17::
    and eax, dword ptr [D78d8]
    mov edx, dword ptr [D78b4]
    shl eax, 03h
    add edx, eax
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 011h
    jae L4b3b
    add esi, 04h
    or cl, 0e0h
L4b3b::
    and eax, 01ffffh
    mov ebx, dword ptr [edx-02h]
    mov dword ptr [D77ec], ecx
    mov ecx, dword ptr [edx]
    mov bx, cx
    mov dword ptr [D77f0], ebp
    mov dword ptr [D77e8], esi
    mov esi, dword ptr [edx+02h]
    mov cx, si
    mov ebp, dword ptr [edx+04h]
    mov si, bp
    mov bp, word ptr [edx+06h]
L4b6a::
    or dword ptr [D7814], eax
    test al, al
    je L4d6f
    test al, 01h
    je L4d33
L4b80::
    sub edi, 010000h
    cmp di, 0f600h
    jae L4b94
    jmp L4ba0
    mov dword ptr [edi], ebx
    mov dword ptr [edi+04h], ecx
L4b94::
    mov dword ptr [edi+0a00h], esi
    mov dword ptr [edi+0a04h], ebp
L4ba0::
    add edi, 010000h
    test al, 02h
    je L4d3b
L4bae::
    sub edi, 010000h
    cmp di, 0fff8h
    jae L4bc3
    cmp di, 0f5f8h
    jae L4bc9
    jmp L4bd5
L4bc3::
    mov dword ptr [edi+08h], ebx
    mov dword ptr [edi+0ch], ecx
L4bc9::
    mov dword ptr [edi+0a08h], esi
    mov dword ptr [edi+0a0ch], ebp
L4bd5::
    add edi, 010000h
    test al, 010h
    je L4d43
L4be3::
    sub edi, 010000h
    cmp di, 0fff0h
    jae L4bf8
    cmp di, 0f5f0h
    jae L4bfe
    jmp L4c0a
L4bf8::
    mov dword ptr [edi+010h], ebx
    mov dword ptr [edi+014h], ecx
L4bfe::
    mov dword ptr [edi+0a10h], esi
    mov dword ptr [edi+0a14h], ebp
L4c0a::
    add edi, 010000h
    test al, 020h
    je L4d4b
L4c18::
    sub edi, 010000h
    cmp di, 0ffe8h
    jae L4c2d
    cmp di, 0f5e8h
    jae L4c33
    jmp L4c3f
L4c2d::
    mov dword ptr [edi+018h], ebx
    mov dword ptr [edi+01ch], ecx
L4c33::
    mov dword ptr [edi+0a18h], esi
    mov dword ptr [edi+0a1ch], ebp
L4c3f::
    add edi, 010000h
    test al, 04h
    je L4d53
L4c4d::
    sub edi, 010000h
    cmp di, 0ec00h
    jae L4c63
    cmp di, 0e200h
    jae L4c6f
    jmp L4c7b
L4c63::
    mov dword ptr [edi+01400h], ebx
    mov dword ptr [edi+01404h], ecx
L4c6f::
    mov dword ptr [edi+01e00h], esi
    mov dword ptr [edi+01e04h], ebp
L4c7b::
    add edi, 010000h
    test al, 08h
    je L4d5b
L4c89::
    sub edi, 010000h
    cmp di, 0ebf8h
    jae L4c9f
    cmp di, 0e1f8h
    jae L4cab
    jmp L4cb7
L4c9f::
    mov dword ptr [edi+01408h], ebx
    mov dword ptr [edi+0140ch], ecx
L4cab::
    mov dword ptr [edi+01e08h], esi
    mov dword ptr [edi+01e0ch], ebp
L4cb7::
    add edi, 010000h
    test al, 040h
    je L4d63
L4cc5::
    sub edi, 010000h
    cmp di, 0ebf0h
    jae L4cdb
    cmp di, 0e1f0h
    jae L4ce7
    jmp L4cf3
L4cdb::
    mov dword ptr [edi+01410h], ebx
    mov dword ptr [edi+01414h], ecx
L4ce7::
    mov dword ptr [edi+01e10h], esi
    mov dword ptr [edi+01e14h], ebp
L4cf3::
    add edi, 010000h
    test al, 080h
    je L4d6b
L4cfd::
    sub edi, 010000h
    cmp di, 0ebe8h
    jae L4d13
    cmp di, 0e1e8h
    jae L4d1f
    jmp L4d2b
L4d13::
    mov dword ptr [edi+01418h], ebx
    mov dword ptr [edi+0141ch], ecx
L4d1f::
    mov dword ptr [edi+01e18h], esi
    mov dword ptr [edi+01e1ch], ebp
L4d2b::
    add edi, 010000h
    jmp L4d6f
L4d33::
    test al, 01h
    jne L4b80
L4d3b::
    test al, 02h
    jne L4bae
L4d43::
    test al, 010h
    jne L4be3
L4d4b::
    test al, 020h
    jne L4c18
L4d53::
    test al, 04h
    jne L4c4d
L4d5b::
    test al, 08h
    jne L4c89
L4d63::
    test al, 040h
    jne L4cc5
L4d6b::
    test al, 080h
    jne L4cfd
L4d6f::
    test ah, ah
    je L4fa1
    test ah, 01h
    je L4f5d
L4d80::
    sub edi, 010000h
    cmp di, 0d800h
    jae L4d96
    cmp di, 0ce00h
    jae L4da2
    jmp L4dae
L4d96::
    mov dword ptr [edi+02800h], ebx
    mov dword ptr [edi+02804h], ecx
L4da2::
    mov dword ptr [edi+03200h], esi
    mov dword ptr [edi+03204h], ebp
L4dae::
    add edi, 010000h
    test ah, 02h
    je L4f66
L4dbd::
    sub edi, 010000h
    cmp di, 0d7f8h
    jae L4dd3
    cmp di, 0cdf8h
    jae L4ddf
    jmp L4deb
L4dd3::
    mov dword ptr [edi+02808h], ebx
    mov dword ptr [edi+0280ch], ecx
L4ddf::
    mov dword ptr [edi+03208h], esi
    mov dword ptr [edi+0320ch], ebp
L4deb::
    add edi, 010000h
    test ah, 010h
    je L4f6f
L4dfa::
    sub edi, 010000h
    cmp di, 0d7f0h
    jae L4e10
    cmp di, 0cdf0h
    jae L4e1c
    jmp L4e28
L4e10::
    mov dword ptr [edi+02810h], ebx
    mov dword ptr [edi+02814h], ecx
L4e1c::
    mov dword ptr [edi+03210h], esi
    mov dword ptr [edi+03214h], ebp
L4e28::
    add edi, 010000h
    test ah, 020h
    je L4f78
L4e37::
    sub edi, 010000h
    cmp di, 0d7e8h
    jae L4e4d
    cmp di, 0cde8h
    jae L4e59
    jmp L4e65
L4e4d::
    mov dword ptr [edi+02818h], ebx
    mov dword ptr [edi+0281ch], ecx
L4e59::
    mov dword ptr [edi+03218h], esi
    mov dword ptr [edi+0321ch], ebp
L4e65::
    add edi, 010000h
    test ah, 04h
    je L4f81
L4e74::
    sub edi, 010000h
    cmp di, 0c400h
    jae L4e8a
    cmp di, 0ba00h
    jae L4e96
    jmp L4ea2
L4e8a::
    mov dword ptr [edi+03c00h], ebx
    mov dword ptr [edi+03c04h], ecx
L4e96::
    mov dword ptr [edi+04600h], esi
    mov dword ptr [edi+04604h], ebp
L4ea2::
    add edi, 010000h
    test ah, 08h
    je L4f8a
L4eb1::
    sub edi, 010000h
    cmp di, 0c3f8h
    jae L4ec7
    cmp di, 0b9f8h
    jae L4ed3
    jmp L4edf
L4ec7::
    mov dword ptr [edi+03c08h], ebx
    mov dword ptr [edi+03c0ch], ecx
L4ed3::
    mov dword ptr [edi+04608h], esi
    mov dword ptr [edi+0460ch], ebp
L4edf::
    add edi, 010000h
    test ah, 040h
    je L4f93
L4eee::
    sub edi, 010000h
    cmp di, 0c3f0h
    jae L4f04
    cmp di, 0b9f0h
    jae L4f10
    jmp L4f1c
L4f04::
    mov dword ptr [edi+03c10h], ebx
    mov dword ptr [edi+03c14h], ecx
L4f10::
    mov dword ptr [edi+04610h], esi
    mov dword ptr [edi+04614h], ebp
L4f1c::
    add edi, 010000h
    test ah, 080h
    je L4f9c
L4f27::
    sub edi, 010000h
    cmp di, 0c3e8h
    jae L4f3d
    cmp di, 0b9e8h
    jae L4f49
    jmp L4f55
L4f3d::
    mov dword ptr [edi+03c18h], ebx
    mov dword ptr [edi+03c1ch], ecx
L4f49::
    mov dword ptr [edi+04618h], esi
    mov dword ptr [edi+0461ch], ebp
L4f55::
    add edi, 010000h
    jmp L4fa1
L4f5d::
    test ah, 01h
    jne L4d80
L4f66::
    test ah, 02h
    jne L4dbd
L4f6f::
    test ah, 010h
    jne L4dfa
L4f78::
    test ah, 020h
    jne L4e37
L4f81::
    test ah, 04h
    jne L4e74
L4f8a::
    test ah, 08h
    jne L4eb1
L4f93::
    test ah, 040h
    jne L4eee
L4f9c::
    test ah, 080h
    jne L4f27
L4fa1::
    mov esi, dword ptr [D77e8]
    mov ecx, dword ptr [D77ec]
    mov ebp, dword ptr [D77f0]
    and eax, 010000h
    je L4a2f
L4fbe::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb L7218
L4fcb::
    test al, 01h
    jne L637d
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 04h
    jb L7224
L4fe4::
    and eax, 0fh
    jmp dword ptr [eax*4+D4fee]
entry_490c endp
D4fee dword offset entry_502e
    dword offset L504c
    dword offset L506d
    dword offset L5091
    dword offset L50b1
    dword offset L50d3
    dword offset L50fa
    dword offset L511d
    dword offset L5141
    dword offset L5160
    dword offset L5184
    dword offset L51aa
    dword offset L51ca
    dword offset L51e5
    dword offset L5206
    dword offset L5224
entry_502e proc near
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 010h
    jae L5041
    add esi, 04h
    or cl, 0e0h
L5041::
    xor dword ptr [D7814], eax
    jmp L522a
L504c::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 0ch
    jb L7230
L505d::
    shl eax, 04h
    or al, 0fh
    xor dword ptr [D7814], eax
    jmp L522a
L506d::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 0ch
    jb L723c
L507e::
    shl eax, 04h
    shr al, 04h
    or al, 0f0h
    xor dword ptr [D7814], eax
    jmp L522a
L5091::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 08h
    jb L7248
L50a2::
    mov ah, al
    mov al, 0ffh
    xor dword ptr [D7814], eax
    jmp L522a
L50b1::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 0ch
    jb L7254
L50c2::
    shl ah, 04h
    or ah, 0fh
    xor dword ptr [D7814], eax
    jmp L522a
L50d3::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 08h
    jb L7260
L50e4::
    shl eax, 04h
    shl ah, 04h
    or eax, 0f0fh
    xor dword ptr [D7814], eax
    jmp L522a
L50fa::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 08h
    jb L726c
L510b::
    mov ah, al
    or eax, 0ff0h
    xor dword ptr [D7814], eax
    jmp L522a
L511d::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 04h
    jb L7278
L512e::
    shl eax, 0ch
    or eax, 0fffh
    xor dword ptr [D7814], eax
    jmp L522a
L5141::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 0ch
    jb L7284
L5152::
    or ah, 0f0h
    xor dword ptr [D7814], eax
    jmp L522a
L5160::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 08h
    jb L7290
L5171::
    shl eax, 04h
    or eax, 0f00fh
    xor dword ptr [D7814], eax
    jmp L522a
L5184::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 08h
    jb L729c
L5195::
    mov ah, al
    ror ah, 04h
    or eax, 0f0f0h
    xor dword ptr [D7814], eax
    jmp L522a
L51aa::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 04h
    jb L72a8
L51bb::
    mov ah, al
    or eax, 0f0ffh
    xor dword ptr [D7814], eax
    jmp L522a
L51ca::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 08h
    jb L72b4
L51db::
    mov ah, 0ffh
    xor dword ptr [D7814], eax
    jmp L522a
L51e5::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 04h
    jb L72c0
L51f6::
    or eax, 0fff0h
    rol al, 04h
    xor dword ptr [D7814], eax
    jmp L522a
L5206::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 04h
    jb L72cc
L5217::
    or eax, 0fff0h
    xor dword ptr [D7814], eax
    jmp L522a
L5224::
    not dword ptr [D7814]
L522a::
    test byte ptr [D7814], 0ffh
    je L5abe
    test byte ptr [D7814], 01h
    je L5a56
L5244::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb L72d8
L5251::
    and eax, 01h
    jne L525d
    mov al, byte ptr [D78a0]
    jmp L5281
L525d::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb L72e4
L526a::
    and eax, 01h
    mov al, byte ptr [D78a0]
    je L5276
    inc al
L5276::
    sub al, 02h
    sbb al, 00h
    and al, 03h
    mov byte ptr [D78a0], al
L5281::
    or al, al
    je L52cd
    test al, 02h
    jne L52ab
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [D78e4]
    jb L72f0
L529d::
    and eax, dword ptr [D78e0]
    mov edx, dword ptr [D77fc]
    jmp L52ed
L52ab::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [D78e6]
    jb L72fc
L52bf::
    and eax, dword ptr [D78dc]
    mov edx, dword ptr [D7804]
    jmp L52ed
L52cd::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [D78e5]
    jb L7308
L52e1::
    and eax, dword ptr [D78d8]
    mov edx, dword ptr [D78b4]
L52ed::
    shl eax, 03h
    add edx, eax
    sub edi, 010000h
    cmp di, 0f600h
    jae L5312
    jmp L532b
    mov ebx, dword ptr [edx-02h]
    mov eax, dword ptr [edx]
    mov bx, ax
    mov ax, word ptr [edx+02h]
    mov dword ptr [edi], ebx
    mov dword ptr [edi+04h], eax
L5312::
    mov ebx, dword ptr [edx+02h]
    mov eax, dword ptr [edx+04h]
    mov bx, ax
    mov ax, word ptr [edx+06h]
    mov dword ptr [edi+0a00h], ebx
    mov dword ptr [edi+0a04h], eax
L532b::
    add edi, 010000h
    test byte ptr [D7814], 02h
    je L5a63
L533e::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb L7314
L534b::
    and eax, 01h
    jne L5357
    mov al, byte ptr [D78a0]
    jmp L537b
L5357::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb L7320
L5364::
    and eax, 01h
    mov al, byte ptr [D78a0]
    je L5370
    inc al
L5370::
    sub al, 02h
    sbb al, 00h
    and al, 03h
    mov byte ptr [D78a0], al
L537b::
    or al, al
    je L53c7
    test al, 02h
    jne L53a5
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [D78e4]
    jb L732c
L5397::
    and eax, dword ptr [D78e0]
    mov edx, dword ptr [D77fc]
    jmp L53e7
L53a5::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [D78e6]
    jb L7338
L53b9::
    and eax, dword ptr [D78dc]
    mov edx, dword ptr [D7804]
    jmp L53e7
L53c7::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [D78e5]
    jb L7344
L53db::
    and eax, dword ptr [D78d8]
    mov edx, dword ptr [D78b4]
L53e7::
    shl eax, 03h
    add edx, eax
    sub edi, 010000h
    cmp di, 0fff8h
    jae L5401
    cmp di, 0f5f8h
    jae L5413
    jmp L542c
L5401::
    mov ebx, dword ptr [edx-02h]
    mov eax, dword ptr [edx]
    mov bx, ax
    mov ax, word ptr [edx+02h]
    mov dword ptr [edi+08h], ebx
    mov dword ptr [edi+0ch], eax
L5413::
    mov ebx, dword ptr [edx+02h]
    mov eax, dword ptr [edx+04h]
    mov bx, ax
    mov ax, word ptr [edx+06h]
    mov dword ptr [edi+0a08h], ebx
    mov dword ptr [edi+0a0ch], eax
L542c::
    add edi, 010000h
    test byte ptr [D7814], 010h
    je L5a70
L543f::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb L7350
L544c::
    and eax, 01h
    jne L5458
    mov al, byte ptr [D78a0]
    jmp L547c
L5458::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb L735c
L5465::
    and eax, 01h
    mov al, byte ptr [D78a0]
    je L5471
    inc al
L5471::
    sub al, 02h
    sbb al, 00h
    and al, 03h
    mov byte ptr [D78a0], al
L547c::
    or al, al
    je L54c8
    test al, 02h
    jne L54a6
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [D78e4]
    jb L7368
L5498::
    and eax, dword ptr [D78e0]
    mov edx, dword ptr [D77fc]
    jmp L54e8
L54a6::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [D78e6]
    jb L7374
L54ba::
    and eax, dword ptr [D78dc]
    mov edx, dword ptr [D7804]
    jmp L54e8
L54c8::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [D78e5]
    jb L7380
L54dc::
    and eax, dword ptr [D78d8]
    mov edx, dword ptr [D78b4]
L54e8::
    shl eax, 03h
    add edx, eax
    sub edi, 010000h
    cmp di, 0fff0h
    jae L5502
    cmp di, 0f5f0h
    jae L5514
    jmp L552d
L5502::
    mov ebx, dword ptr [edx-02h]
    mov eax, dword ptr [edx]
    mov bx, ax
    mov ax, word ptr [edx+02h]
    mov dword ptr [edi+010h], ebx
    mov dword ptr [edi+014h], eax
L5514::
    mov ebx, dword ptr [edx+02h]
    mov eax, dword ptr [edx+04h]
    mov bx, ax
    mov ax, word ptr [edx+06h]
    mov dword ptr [edi+0a10h], ebx
    mov dword ptr [edi+0a14h], eax
L552d::
    add edi, 010000h
    test byte ptr [D7814], 020h
    je L5a7d
L5540::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb L738c
L554d::
    and eax, 01h
    jne L5559
    mov al, byte ptr [D78a0]
    jmp L557d
L5559::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb L7398
L5566::
    and eax, 01h
    mov al, byte ptr [D78a0]
    je L5572
    inc al
L5572::
    sub al, 02h
    sbb al, 00h
    and al, 03h
    mov byte ptr [D78a0], al
L557d::
    or al, al
    je L55c9
    test al, 02h
    jne L55a7
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [D78e4]
    jb L73a4
L5599::
    and eax, dword ptr [D78e0]
    mov edx, dword ptr [D77fc]
    jmp L55e9
L55a7::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [D78e6]
    jb L73b0
L55bb::
    and eax, dword ptr [D78dc]
    mov edx, dword ptr [D7804]
    jmp L55e9
L55c9::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [D78e5]
    jb L73bc
L55dd::
    and eax, dword ptr [D78d8]
    mov edx, dword ptr [D78b4]
L55e9::
    shl eax, 03h
    add edx, eax
    sub edi, 010000h
    cmp di, 0ffe8h
    jae L5603
    cmp di, 0f5e8h
    jae L5615
    jmp L562e
L5603::
    mov ebx, dword ptr [edx-02h]
    mov eax, dword ptr [edx]
    mov bx, ax
    mov ax, word ptr [edx+02h]
    mov dword ptr [edi+018h], ebx
    mov dword ptr [edi+01ch], eax
L5615::
    mov ebx, dword ptr [edx+02h]
    mov eax, dword ptr [edx+04h]
    mov bx, ax
    mov ax, word ptr [edx+06h]
    mov dword ptr [edi+0a18h], ebx
    mov dword ptr [edi+0a1ch], eax
L562e::
    add edi, 010000h
    test byte ptr [D7814], 04h
    je L5a8a
L5641::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb L73c8
L564e::
    and eax, 01h
    jne L565a
    mov al, byte ptr [D78a0]
    jmp L567e
L565a::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb L73d4
L5667::
    and eax, 01h
    mov al, byte ptr [D78a0]
    je L5673
    inc al
L5673::
    sub al, 02h
    sbb al, 00h
    and al, 03h
    mov byte ptr [D78a0], al
L567e::
    or al, al
    je L56ca
    test al, 02h
    jne L56a8
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [D78e4]
    jb L73e0
L569a::
    and eax, dword ptr [D78e0]
    mov edx, dword ptr [D77fc]
    jmp L56ea
L56a8::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [D78e6]
    jb L73ec
L56bc::
    and eax, dword ptr [D78dc]
    mov edx, dword ptr [D7804]
    jmp L56ea
L56ca::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [D78e5]
    jb L73f8
L56de::
    and eax, dword ptr [D78d8]
    mov edx, dword ptr [D78b4]
L56ea::
    shl eax, 03h
    add edx, eax
    sub edi, 010000h
    cmp di, 0ec00h
    jae L5705
    cmp di, 0e200h
    jae L571d
    jmp L5736
L5705::
    mov ebx, dword ptr [edx-02h]
    mov eax, dword ptr [edx]
    mov bx, ax
    mov ax, word ptr [edx+02h]
    mov dword ptr [edi+01400h], ebx
    mov dword ptr [edi+01404h], eax
L571d::
    mov ebx, dword ptr [edx+02h]
    mov eax, dword ptr [edx+04h]
    mov bx, ax
    mov ax, word ptr [edx+06h]
    mov dword ptr [edi+01e00h], ebx
    mov dword ptr [edi+01e04h], eax
L5736::
    add edi, 010000h
    test byte ptr [D7814], 08h
    je L5a97
L5749::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb L7404
L5756::
    and eax, 01h
    jne L5762
    mov al, byte ptr [D78a0]
    jmp L5786
L5762::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb L7410
L576f::
    and eax, 01h
    mov al, byte ptr [D78a0]
    je L577b
    inc al
L577b::
    sub al, 02h
    sbb al, 00h
    and al, 03h
    mov byte ptr [D78a0], al
L5786::
    or al, al
    je L57d2
    test al, 02h
    jne L57b0
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [D78e4]
    jb L741c
L57a2::
    and eax, dword ptr [D78e0]
    mov edx, dword ptr [D77fc]
    jmp L57f2
L57b0::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [D78e6]
    jb L7428
L57c4::
    and eax, dword ptr [D78dc]
    mov edx, dword ptr [D7804]
    jmp L57f2
L57d2::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [D78e5]
    jb L7434
L57e6::
    and eax, dword ptr [D78d8]
    mov edx, dword ptr [D78b4]
L57f2::
    shl eax, 03h
    add edx, eax
    sub edi, 010000h
    cmp di, 0ebf8h
    jae L580d
    cmp di, 0e1f8h
    jae L5825
    jmp L583e
L580d::
    mov ebx, dword ptr [edx-02h]
    mov eax, dword ptr [edx]
    mov bx, ax
    mov ax, word ptr [edx+02h]
    mov dword ptr [edi+01408h], ebx
    mov dword ptr [edi+0140ch], eax
L5825::
    mov ebx, dword ptr [edx+02h]
    mov eax, dword ptr [edx+04h]
    mov bx, ax
    mov ax, word ptr [edx+06h]
    mov dword ptr [edi+01e08h], ebx
    mov dword ptr [edi+01e0ch], eax
L583e::
    add edi, 010000h
    test byte ptr [D7814], 040h
    je L5aa4
L5851::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb L7440
L585e::
    and eax, 01h
    jne L586a
    mov al, byte ptr [D78a0]
    jmp L588e
L586a::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb L744c
L5877::
    and eax, 01h
    mov al, byte ptr [D78a0]
    je L5883
    inc al
L5883::
    sub al, 02h
    sbb al, 00h
    and al, 03h
    mov byte ptr [D78a0], al
L588e::
    or al, al
    je L58da
    test al, 02h
    jne L58b8
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [D78e4]
    jb L7458
L58aa::
    and eax, dword ptr [D78e0]
    mov edx, dword ptr [D77fc]
    jmp L58fa
L58b8::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [D78e6]
    jb L7464
L58cc::
    and eax, dword ptr [D78dc]
    mov edx, dword ptr [D7804]
    jmp L58fa
L58da::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [D78e5]
    jb L7470
L58ee::
    and eax, dword ptr [D78d8]
    mov edx, dword ptr [D78b4]
L58fa::
    shl eax, 03h
    add edx, eax
    sub edi, 010000h
    cmp di, 0ebf0h
    jae L5915
    cmp di, 0e1f0h
    jae L592d
    jmp L5946
L5915::
    mov ebx, dword ptr [edx-02h]
    mov eax, dword ptr [edx]
    mov bx, ax
    mov ax, word ptr [edx+02h]
    mov dword ptr [edi+01410h], ebx
    mov dword ptr [edi+01414h], eax
L592d::
    mov ebx, dword ptr [edx+02h]
    mov eax, dword ptr [edx+04h]
    mov bx, ax
    mov ax, word ptr [edx+06h]
    mov dword ptr [edi+01e10h], ebx
    mov dword ptr [edi+01e14h], eax
L5946::
    add edi, 010000h
    test byte ptr [D7814], 080h
    je L5ab1
L5959::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb L747c
L5966::
    and eax, 01h
    jne L5972
    mov al, byte ptr [D78a0]
    jmp L5996
L5972::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb L7488
L597f::
    and eax, 01h
    mov al, byte ptr [D78a0]
    je L598b
    inc al
L598b::
    sub al, 02h
    sbb al, 00h
    and al, 03h
    mov byte ptr [D78a0], al
L5996::
    or al, al
    je L59e2
    test al, 02h
    jne L59c0
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [D78e4]
    jb L7494
L59b2::
    and eax, dword ptr [D78e0]
    mov edx, dword ptr [D77fc]
    jmp L5a02
L59c0::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [D78e6]
    jb L74a0
L59d4::
    and eax, dword ptr [D78dc]
    mov edx, dword ptr [D7804]
    jmp L5a02
L59e2::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [D78e5]
    jb L74ac
L59f6::
    and eax, dword ptr [D78d8]
    mov edx, dword ptr [D78b4]
L5a02::
    shl eax, 03h
    add edx, eax
    sub edi, 010000h
    cmp di, 0ebe8h
    jae L5a1d
    cmp di, 0e1e8h
    jae L5a35
    jmp L5a4e
L5a1d::
    mov ebx, dword ptr [edx-02h]
    mov eax, dword ptr [edx]
    mov bx, ax
    mov ax, word ptr [edx+02h]
    mov dword ptr [edi+01418h], ebx
    mov dword ptr [edi+0141ch], eax
L5a35::
    mov ebx, dword ptr [edx+02h]
    mov eax, dword ptr [edx+04h]
    mov bx, ax
    mov ax, word ptr [edx+06h]
    mov dword ptr [edi+01e18h], ebx
    mov dword ptr [edi+01e1ch], eax
L5a4e::
    add edi, 010000h
    jmp L5abe
L5a56::
    test byte ptr [D7814], 01h
    jne L5244
L5a63::
    test byte ptr [D7814], 02h
    jne L533e
L5a70::
    test byte ptr [D7814], 010h
    jne L543f
L5a7d::
    test byte ptr [D7814], 020h
    jne L5540
L5a8a::
    test byte ptr [D7814], 04h
    jne L5641
L5a97::
    test byte ptr [D7814], 08h
    jne L5749
L5aa4::
    test byte ptr [D7814], 040h
    jne L5851
L5ab1::
    test byte ptr [D7814], 080h
    jne L5959
L5abe::
    test byte ptr [D7815], 0ffh
    je L64f3
    test byte ptr [D7815], 01h
    je L6310
L5ad8::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb L74b8
L5ae5::
    and eax, 01h
    jne L5af1
    mov al, byte ptr [D78a0]
    jmp L5b15
L5af1::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb L74c4
L5afe::
    and eax, 01h
    mov al, byte ptr [D78a0]
    je L5b0a
    inc al
L5b0a::
    sub al, 02h
    sbb al, 00h
    and al, 03h
    mov byte ptr [D78a0], al
L5b15::
    or al, al
    je L5b61
    test al, 02h
    jne L5b3f
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [D78e4]
    jb L74d0
L5b31::
    and eax, dword ptr [D78e0]
    mov edx, dword ptr [D77fc]
    jmp L5b81
L5b3f::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [D78e6]
    jb L74dc
L5b53::
    and eax, dword ptr [D78dc]
    mov edx, dword ptr [D7804]
    jmp L5b81
L5b61::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [D78e5]
    jb L74e8
L5b75::
    and eax, dword ptr [D78d8]
    mov edx, dword ptr [D78b4]
L5b81::
    shl eax, 03h
    add edx, eax
    sub edi, 010000h
    cmp di, 0d800h
    jae L5b9c
    cmp di, 0ce00h
    jae L5bb4
    jmp L5bcd
L5b9c::
    mov ebx, dword ptr [edx-02h]
    mov eax, dword ptr [edx]
    mov bx, ax
    mov ax, word ptr [edx+02h]
    mov dword ptr [edi+02800h], ebx
    mov dword ptr [edi+02804h], eax
L5bb4::
    mov ebx, dword ptr [edx+02h]
    mov eax, dword ptr [edx+04h]
    mov bx, ax
    mov ax, word ptr [edx+06h]
    mov dword ptr [edi+03200h], ebx
    mov dword ptr [edi+03204h], eax
L5bcd::
    add edi, 010000h
    test byte ptr [D7815], 02h
    je L631d
L5be0::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb L74f4
L5bed::
    and eax, 01h
    jne L5bf9
    mov al, byte ptr [D78a0]
    jmp L5c1d
L5bf9::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb L7500
L5c06::
    and eax, 01h
    mov al, byte ptr [D78a0]
    je L5c12
    inc al
L5c12::
    sub al, 02h
    sbb al, 00h
    and al, 03h
    mov byte ptr [D78a0], al
L5c1d::
    or al, al
    je L5c69
    test al, 02h
    jne L5c47
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [D78e4]
    jb L750c
L5c39::
    and eax, dword ptr [D78e0]
    mov edx, dword ptr [D77fc]
    jmp L5c89
L5c47::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [D78e6]
    jb L7518
L5c5b::
    and eax, dword ptr [D78dc]
    mov edx, dword ptr [D7804]
    jmp L5c89
L5c69::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [D78e5]
    jb L7524
L5c7d::
    and eax, dword ptr [D78d8]
    mov edx, dword ptr [D78b4]
L5c89::
    shl eax, 03h
    add edx, eax
    sub edi, 010000h
    cmp di, 0d7f8h
    jae L5ca4
    cmp di, 0cdf8h
    jae L5cbc
    jmp L5cd5
L5ca4::
    mov ebx, dword ptr [edx-02h]
    mov eax, dword ptr [edx]
    mov bx, ax
    mov ax, word ptr [edx+02h]
    mov dword ptr [edi+02808h], ebx
    mov dword ptr [edi+0280ch], eax
L5cbc::
    mov ebx, dword ptr [edx+02h]
    mov eax, dword ptr [edx+04h]
    mov bx, ax
    mov ax, word ptr [edx+06h]
    mov dword ptr [edi+03208h], ebx
    mov dword ptr [edi+0320ch], eax
L5cd5::
    add edi, 010000h
    test byte ptr [D7815], 010h
    je L632a
L5ce8::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb L7530
L5cf5::
    and eax, 01h
    jne L5d01
    mov al, byte ptr [D78a0]
    jmp L5d25
L5d01::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb L753c
L5d0e::
    and eax, 01h
    mov al, byte ptr [D78a0]
    je L5d1a
    inc al
L5d1a::
    sub al, 02h
    sbb al, 00h
    and al, 03h
    mov byte ptr [D78a0], al
L5d25::
    or al, al
    je L5d71
    test al, 02h
    jne L5d4f
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [D78e4]
    jb L7548
L5d41::
    and eax, dword ptr [D78e0]
    mov edx, dword ptr [D77fc]
    jmp L5d91
L5d4f::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [D78e6]
    jb L7554
L5d63::
    and eax, dword ptr [D78dc]
    mov edx, dword ptr [D7804]
    jmp L5d91
L5d71::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [D78e5]
    jb L7560
L5d85::
    and eax, dword ptr [D78d8]
    mov edx, dword ptr [D78b4]
L5d91::
    shl eax, 03h
    add edx, eax
    sub edi, 010000h
    cmp di, 0d7f0h
    jae L5dac
    cmp di, 0cdf0h
    jae L5dc4
    jmp L5ddd
L5dac::
    mov ebx, dword ptr [edx-02h]
    mov eax, dword ptr [edx]
    mov bx, ax
    mov ax, word ptr [edx+02h]
    mov dword ptr [edi+02810h], ebx
    mov dword ptr [edi+02814h], eax
L5dc4::
    mov ebx, dword ptr [edx+02h]
    mov eax, dword ptr [edx+04h]
    mov bx, ax
    mov ax, word ptr [edx+06h]
    mov dword ptr [edi+03210h], ebx
    mov dword ptr [edi+03214h], eax
L5ddd::
    add edi, 010000h
    test byte ptr [D7815], 020h
    je L6337
L5df0::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb L756c
L5dfd::
    and eax, 01h
    jne L5e09
    mov al, byte ptr [D78a0]
    jmp L5e2d
L5e09::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb L7578
L5e16::
    and eax, 01h
    mov al, byte ptr [D78a0]
    je L5e22
    inc al
L5e22::
    sub al, 02h
    sbb al, 00h
    and al, 03h
    mov byte ptr [D78a0], al
L5e2d::
    or al, al
    je L5e79
    test al, 02h
    jne L5e57
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [D78e4]
    jb L7584
L5e49::
    and eax, dword ptr [D78e0]
    mov edx, dword ptr [D77fc]
    jmp L5e99
L5e57::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [D78e6]
    jb L7590
L5e6b::
    and eax, dword ptr [D78dc]
    mov edx, dword ptr [D7804]
    jmp L5e99
L5e79::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [D78e5]
    jb L759c
L5e8d::
    and eax, dword ptr [D78d8]
    mov edx, dword ptr [D78b4]
L5e99::
    shl eax, 03h
    add edx, eax
    sub edi, 010000h
    cmp di, 0d7e8h
    jae L5eb4
    cmp di, 0cde8h
    jae L5ecc
    jmp L5ee5
L5eb4::
    mov ebx, dword ptr [edx-02h]
    mov eax, dword ptr [edx]
    mov bx, ax
    mov ax, word ptr [edx+02h]
    mov dword ptr [edi+02818h], ebx
    mov dword ptr [edi+0281ch], eax
L5ecc::
    mov ebx, dword ptr [edx+02h]
    mov eax, dword ptr [edx+04h]
    mov bx, ax
    mov ax, word ptr [edx+06h]
    mov dword ptr [edi+03218h], ebx
    mov dword ptr [edi+0321ch], eax
L5ee5::
    add edi, 010000h
    test byte ptr [D7815], 04h
    je L6344
L5ef8::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb L75a8
L5f05::
    and eax, 01h
    jne L5f11
    mov al, byte ptr [D78a0]
    jmp L5f35
L5f11::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb L75b4
L5f1e::
    and eax, 01h
    mov al, byte ptr [D78a0]
    je L5f2a
    inc al
L5f2a::
    sub al, 02h
    sbb al, 00h
    and al, 03h
    mov byte ptr [D78a0], al
L5f35::
    or al, al
    je L5f81
    test al, 02h
    jne L5f5f
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [D78e4]
    jb L75c0
L5f51::
    and eax, dword ptr [D78e0]
    mov edx, dword ptr [D77fc]
    jmp L5fa1
L5f5f::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [D78e6]
    jb L75cc
L5f73::
    and eax, dword ptr [D78dc]
    mov edx, dword ptr [D7804]
    jmp L5fa1
L5f81::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [D78e5]
    jb L75d8
L5f95::
    and eax, dword ptr [D78d8]
    mov edx, dword ptr [D78b4]
L5fa1::
    shl eax, 03h
    add edx, eax
    sub edi, 010000h
    cmp di, 0c400h
    jae L5fbc
    cmp di, 0ba00h
    jae L5fd4
    jmp L5fed
L5fbc::
    mov ebx, dword ptr [edx-02h]
    mov eax, dword ptr [edx]
    mov bx, ax
    mov ax, word ptr [edx+02h]
    mov dword ptr [edi+03c00h], ebx
    mov dword ptr [edi+03c04h], eax
L5fd4::
    mov ebx, dword ptr [edx+02h]
    mov eax, dword ptr [edx+04h]
    mov bx, ax
    mov ax, word ptr [edx+06h]
    mov dword ptr [edi+04600h], ebx
    mov dword ptr [edi+04604h], eax
L5fed::
    add edi, 010000h
    test byte ptr [D7815], 08h
    je L6351
L6000::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb L75e4
L600d::
    and eax, 01h
    jne L6019
    mov al, byte ptr [D78a0]
    jmp L603d
L6019::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb L75f0
L6026::
    and eax, 01h
    mov al, byte ptr [D78a0]
    je L6032
    inc al
L6032::
    sub al, 02h
    sbb al, 00h
    and al, 03h
    mov byte ptr [D78a0], al
L603d::
    or al, al
    je L6089
    test al, 02h
    jne L6067
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [D78e4]
    jb L75fc
L6059::
    and eax, dword ptr [D78e0]
    mov edx, dword ptr [D77fc]
    jmp L60a9
L6067::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [D78e6]
    jb L7608
L607b::
    and eax, dword ptr [D78dc]
    mov edx, dword ptr [D7804]
    jmp L60a9
L6089::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [D78e5]
    jb L7614
L609d::
    and eax, dword ptr [D78d8]
    mov edx, dword ptr [D78b4]
L60a9::
    shl eax, 03h
    add edx, eax
    sub edi, 010000h
    cmp di, 0c3f8h
    jae L60c4
    cmp di, 0b9f8h
    jae L60dc
    jmp L60f5
L60c4::
    mov ebx, dword ptr [edx-02h]
    mov eax, dword ptr [edx]
    mov bx, ax
    mov ax, word ptr [edx+02h]
    mov dword ptr [edi+03c08h], ebx
    mov dword ptr [edi+03c0ch], eax
L60dc::
    mov ebx, dword ptr [edx+02h]
    mov eax, dword ptr [edx+04h]
    mov bx, ax
    mov ax, word ptr [edx+06h]
    mov dword ptr [edi+04608h], ebx
    mov dword ptr [edi+0460ch], eax
L60f5::
    add edi, 010000h
    test byte ptr [D7815], 040h
    je L635e
L6108::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb L7620
L6115::
    and eax, 01h
    jne L6121
    mov al, byte ptr [D78a0]
    jmp L6145
L6121::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb L762c
L612e::
    and eax, 01h
    mov al, byte ptr [D78a0]
    je L613a
    inc al
L613a::
    sub al, 02h
    sbb al, 00h
    and al, 03h
    mov byte ptr [D78a0], al
L6145::
    or al, al
    je L6191
    test al, 02h
    jne L616f
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [D78e4]
    jb L7638
L6161::
    and eax, dword ptr [D78e0]
    mov edx, dword ptr [D77fc]
    jmp L61b1
L616f::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [D78e6]
    jb L7644
L6183::
    and eax, dword ptr [D78dc]
    mov edx, dword ptr [D7804]
    jmp L61b1
L6191::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [D78e5]
    jb L7650
L61a5::
    and eax, dword ptr [D78d8]
    mov edx, dword ptr [D78b4]
L61b1::
    shl eax, 03h
    add edx, eax
    sub edi, 010000h
    cmp di, 0c3f0h
    jae L61cc
    cmp di, 0b9f0h
    jae L61e4
    jmp L61fd
L61cc::
    mov ebx, dword ptr [edx-02h]
    mov eax, dword ptr [edx]
    mov bx, ax
    mov ax, word ptr [edx+02h]
    mov dword ptr [edi+03c10h], ebx
    mov dword ptr [edi+03c14h], eax
L61e4::
    mov ebx, dword ptr [edx+02h]
    mov eax, dword ptr [edx+04h]
    mov bx, ax
    mov ax, word ptr [edx+06h]
    mov dword ptr [edi+04610h], ebx
    mov dword ptr [edi+04614h], eax
L61fd::
    add edi, 010000h
    test byte ptr [D7815], 080h
    je L636b
L6210::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb L765c
L621d::
    and eax, 01h
    jne L6229
    mov al, byte ptr [D78a0]
    jmp L624d
L6229::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb L7668
L6236::
    and eax, 01h
    mov al, byte ptr [D78a0]
    je L6242
    inc al
L6242::
    sub al, 02h
    sbb al, 00h
    and al, 03h
    mov byte ptr [D78a0], al
L624d::
    or al, al
    je L6299
    test al, 02h
    jne L6277
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [D78e4]
    jb L7674
L6269::
    and eax, dword ptr [D78e0]
    mov edx, dword ptr [D77fc]
    jmp L62b9
L6277::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [D78e6]
    jb L7680
L628b::
    and eax, dword ptr [D78dc]
    mov edx, dword ptr [D7804]
    jmp L62b9
L6299::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [D78e5]
    jb L768c
L62ad::
    and eax, dword ptr [D78d8]
    mov edx, dword ptr [D78b4]
L62b9::
    shl eax, 03h
    add edx, eax
    sub edi, 010000h
    cmp di, 0c3e8h
    jae L62d4
    cmp di, 0b9e8h
    jae L62ec
    jmp L6305
L62d4::
    mov ebx, dword ptr [edx-02h]
    mov eax, dword ptr [edx]
    mov bx, ax
    mov ax, word ptr [edx+02h]
    mov dword ptr [edi+03c18h], ebx
    mov dword ptr [edi+03c1ch], eax
L62ec::
    mov ebx, dword ptr [edx+02h]
    mov eax, dword ptr [edx+04h]
    mov bx, ax
    mov ax, word ptr [edx+06h]
    mov dword ptr [edi+04618h], ebx
    mov dword ptr [edi+0461ch], eax
L6305::
    add edi, 010000h
    jmp L64f3
L6310::
    test byte ptr [D7815], 01h
    jne L5ad8
L631d::
    test byte ptr [D7815], 02h
    jne L5be0
L632a::
    test byte ptr [D7815], 010h
    jne L5ce8
L6337::
    test byte ptr [D7815], 020h
    jne L5df0
L6344::
    test byte ptr [D7815], 04h
    jne L5ef8
L6351::
    test byte ptr [D7815], 08h
    jne L6000
L635e::
    test byte ptr [D7815], 040h
    jne L6108
L636b::
    test byte ptr [D7815], 080h
    jne L6210
    jmp L64f3
L637d::
    test dword ptr [D78a4], 010000h
    jne L64de
    jmp L64f3
L6392::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb L7698
L639f::
    and eax, 01h
    jne L63ab
    mov al, byte ptr [D78a0]
    jmp L63cf
L63ab::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb L76a4
L63b8::
    and eax, 01h
    mov al, byte ptr [D78a0]
    je L63c4
    inc al
L63c4::
    sub al, 02h
    sbb al, 00h
    and al, 03h
    mov byte ptr [D78a0], al
L63cf::
    or al, al
    je L6462
    test al, 02h
    jne L63fd
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [D78e4]
    jb L76b0
L63ef::
    and eax, dword ptr [D78e0]
    mov edx, dword ptr [D77fc]
    jmp L641d
L63fd::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [D78e6]
    jb L76bc
L6411::
    and eax, dword ptr [D78dc]
    mov edx, dword ptr [D7804]
L641d::
    shl eax, 03h
    add edx, eax
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 04h
    jb L76c8
L6433::
    and eax, 0fh
    mov ebx, dword ptr [edx-02h]
    mov dword ptr [D77ec], ecx
    mov ecx, dword ptr [edx]
    mov bx, cx
    mov dword ptr [D77f0], ebp
    mov dword ptr [D77e8], esi
    mov esi, dword ptr [edx+02h]
    mov cx, si
    mov ebp, dword ptr [edx+04h]
    mov si, bp
    mov bp, word ptr [edx+06h]
    jmp L64c5
L6462::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [D78e5]
    jb L76d4
L6476::
    and eax, dword ptr [D78d8]
    mov edx, dword ptr [D78b4]
    shl eax, 03h
    add edx, eax
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 04h
    jb L76e0
L6498::
    and eax, 0fh
    mov ebx, dword ptr [edx-02h]
    mov dword ptr [D77ec], ecx
    mov ecx, dword ptr [edx]
    mov bx, cx
    mov dword ptr [D77f0], ebp
    mov dword ptr [D77e8], esi
    mov esi, dword ptr [edx+02h]
    mov cx, si
    mov ebp, dword ptr [edx+04h]
    mov si, bp
    mov bp, word ptr [edx+06h]
L64c5::
    call dword ptr [eax*4+D1427]
    mov esi, dword ptr [D77e8]
    mov ecx, dword ptr [D77ec]
    mov ebp, dword ptr [D77f0]
L64de::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb L76ec
L64eb::
    test al, 01h
    je L6392
L64f3::
    mov edx, 01h
    mov edi, dword ptr [D77f8]
    jmp L4937
L6503::
    mov dword ptr [D77f8], edi
    lea edi, [D78e8]
    jmp L4a10
L6514::
    shld ebx, edi, 010h
    ret
    align 4
    word 0
    align 4
L6520::
    pusha
    mov ax, bx
    call set_bank
    popa
    mov word ptr [current_bank], bx
    jmp L2f3f
    align 4
    word 0
    align 4
L653c::
    pusha
    mov ax, bx
    call set_bank
    popa
    mov word ptr [current_bank], bx
    jmp L49fe
    pop edx
    pop ecx
    pop ebx
    pop eax
    pop edi
    pop esi
    leave
    ret
L655a::
    pop edx
    pop ecx
    pop ebx
    pop eax
    pop edi
    pop esi
    leave
    ret
entry_502e endp
set_bank_mode proc near
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
    je L6578
    mov ax, 01h
L6578::
    xor ax, 01h
    mov word ptr [bank_window], ax
    mov eax, dword ptr [ebp+0ch]
    bsr ebx, eax
    sub ebx, 010h
    neg ebx
    mov byte ptr [bank_shift], bl
    pop edx
    pop ecx
    pop ebx
    pop eax
    pop edi
    pop esi
    leave
    ret
set_bank_mode endp
build_block_list proc near
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
    jne L65fb
    mov edx, 028h
L65fb::
    add edx, dword ptr [ebp+018h]
    mov dword ptr [ebp+020h], edx
    mov edx, dword ptr [ebp+024h]
    or edx, edx
    jne L660d
    mov edx, 01eh
L660d::
    add edx, dword ptr [ebp+01ch]
    mov dword ptr [ebp+024h], edx
    mov ecx, 00h
L6618::
    mov edx, 00h
L661d::
    mov word ptr [edi], dx
    mov word ptr [edi+02h], cx
    add edi, 04h
    inc edx
    cmp edx, dword ptr [ebp+08h]
    jne L661d
    inc ecx
    cmp ecx, dword ptr [ebp+0ch]
    jne L6618
    mov edi, dword ptr [ebp+08h]
    mov edx, dword ptr [ebp+0ch]
    imul edi, edx
    dec edi
    shl edi, 02h
    add edi, dword ptr [ebp+02ch]
    mov edx, 0fffffffeh
L6648::
    movsx eax, word ptr [edi]
    add eax, eax
    add eax, dword ptr [ebp+010h]
    cmp eax, 050h
    jae L66b5
    movsx esi, word ptr [edi+02h]
    add esi, esi
    add esi, dword ptr [ebp+014h]
    cmp esi, 03ch
    jae L66b5
    test dword ptr [ebp+028h], 01h
    je L6682
    cmp eax, dword ptr [ebp+018h]
    jl L66b5
    cmp eax, dword ptr [ebp+020h]
    jge L66b5
    cmp esi, dword ptr [ebp+01ch]
    jl L66b5
    cmp esi, dword ptr [ebp+024h]
    jge L66b5
    jmp L6696
L6682::
    cmp eax, dword ptr [ebp+018h]
    jl L6696
    cmp eax, dword ptr [ebp+020h]
    jge L6696
    cmp esi, dword ptr [ebp+01ch]
    jl L6696
    cmp esi, dword ptr [ebp+024h]
    jl L66b5
L6696::
    imul esi, esi, 02800h
    shl eax, 04h
    add eax, esi
    mov dword ptr [edi], eax
    mov dl, 0ffh
    sub edi, 04h
    cmp edi, dword ptr [ebp+02ch]
    jae L6648
    pop edx
    pop ecx
    pop ebx
    pop eax
    pop edi
    pop esi
    leave
    ret
L66b5::
    mov dword ptr [edi], edx
    sub edi, 04h
    cmp edi, dword ptr [ebp+02ch]
    jae L6648
    pop edx
    pop ecx
    pop ebx
    pop eax
    pop edi
    pop esi
    leave
    ret
build_block_list endp
    align 4
    word 0
    align 4
set_bank proc near
    mov dword ptr [bank_regs.rm_eax], 04f05h
    mov cl, byte ptr [bank_shift]
    shl eax, cl
    mov dword ptr [bank_regs.rm_edx], eax
    mov ax, word ptr [bank_window]
    mov dword ptr [bank_regs.rm_ebx], eax
    mov ax, ds
    mov es, ax
    mov ax, 0300h
    lea edi, [bank_regs]
    mov bx, 010h
    xor cx, cx
    int 031h
    ret
L6708::
    add esi, 04h
    or cl, 0e0h
    jmp L1530
    align 4
L6714::
    add esi, 04h
    or cl, 0e0h
    jmp L1592
    align 4
L6720::
    add esi, 04h
    or cl, 0e0h
    jmp L16f1
    align 4
L672c::
    add esi, 04h
    or cl, 0e0h
    jmp L170a
    align 4
L6738::
    add esi, 04h
    or cl, 0e0h
    jmp L1725
    align 4
L6744::
    add esi, 04h
    or cl, 0e0h
    jmp L1740
    align 4
L6750::
    add esi, 04h
    or cl, 0e0h
    jmp L17d9
    align 4
L675c::
    add esi, 04h
    or cl, 0e0h
    jmp L17ee
    align 4
L6768::
    add esi, 04h
    or cl, 0e0h
    jmp L1807
    align 4
L6774::
    add esi, 04h
    or cl, 0e0h
    jmp L183e
    align 4
L6780::
    add esi, 04h
    or cl, 0e0h
    jmp L1860
    align 4
L678c::
    add esi, 04h
    or cl, 0e0h
    jmp L18c9
    align 4
L6798::
    add esi, 04h
    or cl, 0e0h
    jmp L1baf
    align 4
L67a4::
    add esi, 04h
    or cl, 0e0h
    jmp L1bc8
    align 4
L67b0::
    add esi, 04h
    or cl, 0e0h
    jmp L1c41
    align 4
L67bc::
    add esi, 04h
    or cl, 0e0h
    jmp L1c62
    align 4
L67c8::
    add esi, 04h
    or cl, 0e0h
    jmp L1c86
    align 4
L67d4::
    add esi, 04h
    or cl, 0e0h
    jmp L1ca6
    align 4
L67e0::
    add esi, 04h
    or cl, 0e0h
    jmp L1cc8
    align 4
L67ec::
    add esi, 04h
    or cl, 0e0h
    jmp L1cef
    align 4
L67f8::
    add esi, 04h
    or cl, 0e0h
    jmp L1d12
    align 4
L6804::
    add esi, 04h
    or cl, 0e0h
    jmp L1d36
    align 4
L6810::
    add esi, 04h
    or cl, 0e0h
    jmp L1d55
    align 4
L681c::
    add esi, 04h
    or cl, 0e0h
    jmp L1d79
    align 4
L6828::
    add esi, 04h
    or cl, 0e0h
    jmp L1d9f
    align 4
L6834::
    add esi, 04h
    or cl, 0e0h
    jmp L1dbf
    align 4
L6840::
    add esi, 04h
    or cl, 0e0h
    jmp L1dda
    align 4
L684c::
    add esi, 04h
    or cl, 0e0h
    jmp L1dfb
    align 4
L6858::
    add esi, 04h
    or cl, 0e0h
    jmp L1e35
    align 4
L6864::
    add esi, 04h
    or cl, 0e0h
    jmp L1e4e
    align 4
L6870::
    add esi, 04h
    or cl, 0e0h
    jmp L1e81
    align 4
L687c::
    add esi, 04h
    or cl, 0e0h
    jmp L1ea3
    align 4
L6888::
    add esi, 04h
    or cl, 0e0h
    jmp L1ec5
    align 4
L6894::
    add esi, 04h
    or cl, 0e0h
    jmp L1f19
    align 4
L68a0::
    add esi, 04h
    or cl, 0e0h
    jmp L1f32
    align 4
L68ac::
    add esi, 04h
    or cl, 0e0h
    jmp L1f65
    align 4
L68b8::
    add esi, 04h
    or cl, 0e0h
    jmp L1f87
    align 4
L68c4::
    add esi, 04h
    or cl, 0e0h
    jmp L1fa9
    align 4
L68d0::
    add esi, 04h
    or cl, 0e0h
    jmp L1ffe
    align 4
L68dc::
    add esi, 04h
    or cl, 0e0h
    jmp L2017
    align 4
L68e8::
    add esi, 04h
    or cl, 0e0h
    jmp L204a
    align 4
L68f4::
    add esi, 04h
    or cl, 0e0h
    jmp L206c
    align 4
L6900::
    add esi, 04h
    or cl, 0e0h
    jmp L208e
    align 4
L690c::
    add esi, 04h
    or cl, 0e0h
    jmp L20e3
    align 4
L6918::
    add esi, 04h
    or cl, 0e0h
    jmp L20fc
    align 4
L6924::
    add esi, 04h
    or cl, 0e0h
    jmp L212f
    align 4
L6930::
    add esi, 04h
    or cl, 0e0h
    jmp L2151
    align 4
L693c::
    add esi, 04h
    or cl, 0e0h
    jmp L2173
    align 4
L6948::
    add esi, 04h
    or cl, 0e0h
    jmp L21c8
    align 4
L6954::
    add esi, 04h
    or cl, 0e0h
    jmp L21e1
    align 4
L6960::
    add esi, 04h
    or cl, 0e0h
    jmp L2214
    align 4
L696c::
    add esi, 04h
    or cl, 0e0h
    jmp L2236
    align 4
L6978::
    add esi, 04h
    or cl, 0e0h
    jmp L2258
    align 4
L6984::
    add esi, 04h
    or cl, 0e0h
    jmp L22b3
    align 4
L6990::
    add esi, 04h
    or cl, 0e0h
    jmp L22cc
    align 4
L699c::
    add esi, 04h
    or cl, 0e0h
    jmp L22ff
    align 4
L69a8::
    add esi, 04h
    or cl, 0e0h
    jmp L2321
    align 4
L69b4::
    add esi, 04h
    or cl, 0e0h
    jmp L2343
    align 4
L69c0::
    add esi, 04h
    or cl, 0e0h
    jmp L239e
    align 4
L69cc::
    add esi, 04h
    or cl, 0e0h
    jmp L23b7
    align 4
L69d8::
    add esi, 04h
    or cl, 0e0h
    jmp L23ea
    align 4
L69e4::
    add esi, 04h
    or cl, 0e0h
    jmp L240c
    align 4
L69f0::
    add esi, 04h
    or cl, 0e0h
    jmp L242e
    align 4
L69fc::
    add esi, 04h
    or cl, 0e0h
    jmp L2489
    align 4
L6a08::
    add esi, 04h
    or cl, 0e0h
    jmp L24a2
    align 4
L6a14::
    add esi, 04h
    or cl, 0e0h
    jmp L24d5
    align 4
L6a20::
    add esi, 04h
    or cl, 0e0h
    jmp L24f7
    align 4
L6a2c::
    add esi, 04h
    or cl, 0e0h
    jmp L2519
    align 4
L6a38::
    add esi, 04h
    or cl, 0e0h
    jmp L25eb
    align 4
L6a44::
    add esi, 04h
    or cl, 0e0h
    jmp L2604
    align 4
L6a50::
    add esi, 04h
    or cl, 0e0h
    jmp L2637
    align 4
L6a5c::
    add esi, 04h
    or cl, 0e0h
    jmp L2659
    align 4
L6a68::
    add esi, 04h
    or cl, 0e0h
    jmp L267b
    align 4
L6a74::
    add esi, 04h
    or cl, 0e0h
    jmp L26d6
    align 4
L6a80::
    add esi, 04h
    or cl, 0e0h
    jmp L26ef
    align 4
L6a8c::
    add esi, 04h
    or cl, 0e0h
    jmp L2722
    align 4
L6a98::
    add esi, 04h
    or cl, 0e0h
    jmp L2744
    align 4
L6aa4::
    add esi, 04h
    or cl, 0e0h
    jmp L2766
    align 4
L6ab0::
    add esi, 04h
    or cl, 0e0h
    jmp L27c1
    align 4
L6abc::
    add esi, 04h
    or cl, 0e0h
    jmp L27da
    align 4
L6ac8::
    add esi, 04h
    or cl, 0e0h
    jmp L280d
    align 4
L6ad4::
    add esi, 04h
    or cl, 0e0h
    jmp L282f
    align 4
L6ae0::
    add esi, 04h
    or cl, 0e0h
    jmp L2851
    align 4
L6aec::
    add esi, 04h
    or cl, 0e0h
    jmp L28ac
    align 4
L6af8::
    add esi, 04h
    or cl, 0e0h
    jmp L28c5
    align 4
L6b04::
    add esi, 04h
    or cl, 0e0h
    jmp L28f8
    align 4
L6b10::
    add esi, 04h
    or cl, 0e0h
    jmp L291a
    align 4
L6b1c::
    add esi, 04h
    or cl, 0e0h
    jmp L293c
    align 4
L6b28::
    add esi, 04h
    or cl, 0e0h
    jmp L2997
    align 4
L6b34::
    add esi, 04h
    or cl, 0e0h
    jmp L29b0
    align 4
L6b40::
    add esi, 04h
    or cl, 0e0h
    jmp L29e3
    align 4
L6b4c::
    add esi, 04h
    or cl, 0e0h
    jmp L2a05
    align 4
L6b58::
    add esi, 04h
    or cl, 0e0h
    jmp L2a27
    align 4
L6b64::
    add esi, 04h
    or cl, 0e0h
    jmp L2a82
    align 4
L6b70::
    add esi, 04h
    or cl, 0e0h
    jmp L2a9b
    align 4
L6b7c::
    add esi, 04h
    or cl, 0e0h
    jmp L2ace
    align 4
L6b88::
    add esi, 04h
    or cl, 0e0h
    jmp L2af0
    align 4
L6b94::
    add esi, 04h
    or cl, 0e0h
    jmp L2b12
    align 4
L6ba0::
    add esi, 04h
    or cl, 0e0h
    jmp L2b6d
    align 4
L6bac::
    add esi, 04h
    or cl, 0e0h
    jmp L2b86
    align 4
L6bb8::
    add esi, 04h
    or cl, 0e0h
    jmp L2bb9
    align 4
L6bc4::
    add esi, 04h
    or cl, 0e0h
    jmp L2bdb
    align 4
L6bd0::
    add esi, 04h
    or cl, 0e0h
    jmp L2bfd
    align 4
L6bdc::
    add esi, 04h
    or cl, 0e0h
    jmp L2c58
    align 4
L6be8::
    add esi, 04h
    or cl, 0e0h
    jmp L2c71
    align 4
L6bf4::
    add esi, 04h
    or cl, 0e0h
    jmp L2ca4
    align 4
L6c00::
    add esi, 04h
    or cl, 0e0h
    jmp L2cc6
    align 4
L6c0c::
    add esi, 04h
    or cl, 0e0h
    jmp L2ce8
    align 4
L6c18::
    add esi, 04h
    or cl, 0e0h
    jmp L2dbd
    align 4
L6c24::
    add esi, 04h
    or cl, 0e0h
    jmp L2dd6
    align 4
L6c30::
    add esi, 04h
    or cl, 0e0h
    jmp L2e0d
    align 4
L6c3c::
    add esi, 04h
    or cl, 0e0h
    jmp L2e2f
    align 4
L6c48::
    add esi, 04h
    or cl, 0e0h
    jmp L2e51
    align 4
L6c54::
    add esi, 04h
    or cl, 0e0h
    jmp L2e94
    align 4
L6c60::
    add esi, 04h
    or cl, 0e0h
    jmp L2eb6
    align 4
L6c6c::
    add esi, 04h
    or cl, 0e0h
    jmp L2f09
    align 4
L6c78::
    add esi, 04h
    or cl, 0e0h
    jmp L2fad
    align 4
L6c84::
    add esi, 04h
    or cl, 0e0h
    jmp L2fc2
    align 4
L6c90::
    add esi, 04h
    or cl, 0e0h
    jmp L2fdb
    align 4
L6c9c::
    add esi, 04h
    or cl, 0e0h
    jmp L3012
    align 4
L6ca8::
    add esi, 04h
    or cl, 0e0h
    jmp L3034
    align 4
L6cb4::
    add esi, 04h
    or cl, 0e0h
    jmp L309d
    align 4
L6cc0::
    add esi, 04h
    or cl, 0e0h
    jmp L3471
    align 4
L6ccc::
    add esi, 04h
    or cl, 0e0h
    jmp L348a
    align 4
L6cd8::
    add esi, 04h
    or cl, 0e0h
    jmp L3503
    align 4
L6ce4::
    add esi, 04h
    or cl, 0e0h
    jmp L3524
    align 4
L6cf0::
    add esi, 04h
    or cl, 0e0h
    jmp L3548
    align 4
L6cfc::
    add esi, 04h
    or cl, 0e0h
    jmp L3568
    align 4
L6d08::
    add esi, 04h
    or cl, 0e0h
    jmp L358a
    align 4
L6d14::
    add esi, 04h
    or cl, 0e0h
    jmp L35b1
    align 4
L6d20::
    add esi, 04h
    or cl, 0e0h
    jmp L35d4
    align 4
L6d2c::
    add esi, 04h
    or cl, 0e0h
    jmp L35f8
    align 4
L6d38::
    add esi, 04h
    or cl, 0e0h
    jmp L3617
    align 4
L6d44::
    add esi, 04h
    or cl, 0e0h
    jmp L363b
    align 4
L6d50::
    add esi, 04h
    or cl, 0e0h
    jmp L3661
    align 4
L6d5c::
    add esi, 04h
    or cl, 0e0h
    jmp L3681
    align 4
L6d68::
    add esi, 04h
    or cl, 0e0h
    jmp L369c
    align 4
L6d74::
    add esi, 04h
    or cl, 0e0h
    jmp L36bd
    align 4
L6d80::
    add esi, 04h
    or cl, 0e0h
    jmp L36f7
    align 4
L6d8c::
    add esi, 04h
    or cl, 0e0h
    jmp L3710
    align 4
L6d98::
    add esi, 04h
    or cl, 0e0h
    jmp L3743
    align 4
L6da4::
    add esi, 04h
    or cl, 0e0h
    jmp L3765
    align 4
L6db0::
    add esi, 04h
    or cl, 0e0h
    jmp L3787
    align 4
L6dbc::
    add esi, 04h
    or cl, 0e0h
    jmp L37e2
    align 4
L6dc8::
    add esi, 04h
    or cl, 0e0h
    jmp L37fb
    align 4
L6dd4::
    add esi, 04h
    or cl, 0e0h
    jmp L382e
    align 4
L6de0::
    add esi, 04h
    or cl, 0e0h
    jmp L3850
    align 4
L6dec::
    add esi, 04h
    or cl, 0e0h
    jmp L3872
    align 4
L6df8::
    add esi, 04h
    or cl, 0e0h
    jmp L38d4
    align 4
L6e04::
    add esi, 04h
    or cl, 0e0h
    jmp L38ed
    align 4
L6e10::
    add esi, 04h
    or cl, 0e0h
    jmp L3920
    align 4
L6e1c::
    add esi, 04h
    or cl, 0e0h
    jmp L3942
    align 4
L6e28::
    add esi, 04h
    or cl, 0e0h
    jmp L3964
    align 4
L6e34::
    add esi, 04h
    or cl, 0e0h
    jmp L39c6
    align 4
L6e40::
    add esi, 04h
    or cl, 0e0h
    jmp L39df
    align 4
L6e4c::
    add esi, 04h
    or cl, 0e0h
    jmp L3a12
    align 4
L6e58::
    add esi, 04h
    or cl, 0e0h
    jmp L3a34
    align 4
L6e64::
    add esi, 04h
    or cl, 0e0h
    jmp L3a56
    align 4
L6e70::
    add esi, 04h
    or cl, 0e0h
    jmp L3ab8
    align 4
L6e7c::
    add esi, 04h
    or cl, 0e0h
    jmp L3ad1
    align 4
L6e88::
    add esi, 04h
    or cl, 0e0h
    jmp L3b04
    align 4
L6e94::
    add esi, 04h
    or cl, 0e0h
    jmp L3b26
    align 4
L6ea0::
    add esi, 04h
    or cl, 0e0h
    jmp L3b48
    align 4
L6eac::
    add esi, 04h
    or cl, 0e0h
    jmp L3bb1
    align 4
L6eb8::
    add esi, 04h
    or cl, 0e0h
    jmp L3bca
    align 4
L6ec4::
    add esi, 04h
    or cl, 0e0h
    jmp L3bfd
    align 4
L6ed0::
    add esi, 04h
    or cl, 0e0h
    jmp L3c1f
    align 4
L6edc::
    add esi, 04h
    or cl, 0e0h
    jmp L3c41
    align 4
L6ee8::
    add esi, 04h
    or cl, 0e0h
    jmp L3caa
    align 4
L6ef4::
    add esi, 04h
    or cl, 0e0h
    jmp L3cc3
    align 4
L6f00::
    add esi, 04h
    or cl, 0e0h
    jmp L3cf6
    align 4
L6f0c::
    add esi, 04h
    or cl, 0e0h
    jmp L3d18
    align 4
L6f18::
    add esi, 04h
    or cl, 0e0h
    jmp L3d3a
    align 4
L6f24::
    add esi, 04h
    or cl, 0e0h
    jmp L3da3
    align 4
L6f30::
    add esi, 04h
    or cl, 0e0h
    jmp L3dbc
    align 4
L6f3c::
    add esi, 04h
    or cl, 0e0h
    jmp L3def
    align 4
L6f48::
    add esi, 04h
    or cl, 0e0h
    jmp L3e11
    align 4
L6f54::
    add esi, 04h
    or cl, 0e0h
    jmp L3e33
    align 4
L6f60::
    add esi, 04h
    or cl, 0e0h
    jmp L3f13
    align 4
L6f6c::
    add esi, 04h
    or cl, 0e0h
    jmp L3f2c
    align 4
L6f78::
    add esi, 04h
    or cl, 0e0h
    jmp L3f5f
    align 4
L6f84::
    add esi, 04h
    or cl, 0e0h
    jmp L3f81
    align 4
L6f90::
    add esi, 04h
    or cl, 0e0h
    jmp L3fa3
    align 4
L6f9c::
    add esi, 04h
    or cl, 0e0h
    jmp L400c
    align 4
L6fa8::
    add esi, 04h
    or cl, 0e0h
    jmp L4025
    align 4
L6fb4::
    add esi, 04h
    or cl, 0e0h
    jmp L4058
    align 4
L6fc0::
    add esi, 04h
    or cl, 0e0h
    jmp L407a
    align 4
L6fcc::
    add esi, 04h
    or cl, 0e0h
    jmp L409c
    align 4
L6fd8::
    add esi, 04h
    or cl, 0e0h
    jmp L4105
    align 4
L6fe4::
    add esi, 04h
    or cl, 0e0h
    jmp L411e
    align 4
L6ff0::
    add esi, 04h
    or cl, 0e0h
    jmp L4151
    align 4
L6ffc::
    add esi, 04h
    or cl, 0e0h
    jmp L4173
    align 4
L7008::
    add esi, 04h
    or cl, 0e0h
    jmp L4195
    align 4
L7014::
    add esi, 04h
    or cl, 0e0h
    jmp L41fe
    align 4
L7020::
    add esi, 04h
    or cl, 0e0h
    jmp L4217
    align 4
L702c::
    add esi, 04h
    or cl, 0e0h
    jmp L424a
    align 4
L7038::
    add esi, 04h
    or cl, 0e0h
    jmp L426c
    align 4
L7044::
    add esi, 04h
    or cl, 0e0h
    jmp L428e
    align 4
L7050::
    add esi, 04h
    or cl, 0e0h
    jmp L42f7
    align 4
L705c::
    add esi, 04h
    or cl, 0e0h
    jmp L4310
    align 4
L7068::
    add esi, 04h
    or cl, 0e0h
    jmp L4343
    align 4
L7074::
    add esi, 04h
    or cl, 0e0h
    jmp L4365
    align 4
L7080::
    add esi, 04h
    or cl, 0e0h
    jmp L4387
    align 4
L708c::
    add esi, 04h
    or cl, 0e0h
    jmp L43f0
    align 4
L7098::
    add esi, 04h
    or cl, 0e0h
    jmp L4409
    align 4
L70a4::
    add esi, 04h
    or cl, 0e0h
    jmp L443c
    align 4
L70b0::
    add esi, 04h
    or cl, 0e0h
    jmp L445e
    align 4
L70bc::
    add esi, 04h
    or cl, 0e0h
    jmp L4480
    align 4
L70c8::
    add esi, 04h
    or cl, 0e0h
    jmp L44e9
    align 4
L70d4::
    add esi, 04h
    or cl, 0e0h
    jmp L4502
    align 4
L70e0::
    add esi, 04h
    or cl, 0e0h
    jmp L4535
    align 4
L70ec::
    add esi, 04h
    or cl, 0e0h
    jmp L4557
    align 4
L70f8::
    add esi, 04h
    or cl, 0e0h
    jmp L4579
    align 4
L7104::
    add esi, 04h
    or cl, 0e0h
    jmp L45e2
    align 4
L7110::
    add esi, 04h
    or cl, 0e0h
    jmp L45fb
    align 4
L711c::
    add esi, 04h
    or cl, 0e0h
    jmp L462e
    align 4
L7128::
    add esi, 04h
    or cl, 0e0h
    jmp L4650
    align 4
L7134::
    add esi, 04h
    or cl, 0e0h
    jmp L4672
    align 4
L7140::
    add esi, 04h
    or cl, 0e0h
    jmp L4755
    align 4
L714c::
    add esi, 04h
    or cl, 0e0h
    jmp L476e
    align 4
L7158::
    add esi, 04h
    or cl, 0e0h
    jmp L47a5
    align 4
L7164::
    add esi, 04h
    or cl, 0e0h
    jmp L47c7
    align 4
L7170::
    add esi, 04h
    or cl, 0e0h
    jmp L47e9
    align 4
L717c::
    add esi, 04h
    or cl, 0e0h
    jmp L482c
    align 4
L7188::
    add esi, 04h
    or cl, 0e0h
    jmp L484e
    align 4
L7194::
    add esi, 04h
    or cl, 0e0h
    jmp L48a1
    align 4
L71a0::
    add esi, 04h
    or cl, 0e0h
    jmp L4944
    align 4
L71ac::
    add esi, 04h
    or cl, 0e0h
    jmp L495d
    align 4
L71b8::
    add esi, 04h
    or cl, 0e0h
    jmp L4978
    align 4
L71c4::
    add esi, 04h
    or cl, 0e0h
    jmp L4993
    align 4
L71d0::
    add esi, 04h
    or cl, 0e0h
    jmp L4a27
    align 4
L71dc::
    add esi, 04h
    or cl, 0e0h
    jmp L4a3c
    align 4
L71e8::
    add esi, 04h
    or cl, 0e0h
    jmp L4a55
    align 4
L71f4::
    add esi, 04h
    or cl, 0e0h
    jmp L4a8c
    align 4
L7200::
    add esi, 04h
    or cl, 0e0h
    jmp L4aae
    align 4
L720c::
    add esi, 04h
    or cl, 0e0h
    jmp L4b17
    align 4
L7218::
    add esi, 04h
    or cl, 0e0h
    jmp L4fcb
    align 4
L7224::
    add esi, 04h
    or cl, 0e0h
    jmp L4fe4
    align 4
L7230::
    add esi, 04h
    or cl, 0e0h
    jmp L505d
    align 4
L723c::
    add esi, 04h
    or cl, 0e0h
    jmp L507e
    align 4
L7248::
    add esi, 04h
    or cl, 0e0h
    jmp L50a2
    align 4
L7254::
    add esi, 04h
    or cl, 0e0h
    jmp L50c2
    align 4
L7260::
    add esi, 04h
    or cl, 0e0h
    jmp L50e4
    align 4
L726c::
    add esi, 04h
    or cl, 0e0h
    jmp L510b
    align 4
L7278::
    add esi, 04h
    or cl, 0e0h
    jmp L512e
    align 4
L7284::
    add esi, 04h
    or cl, 0e0h
    jmp L5152
    align 4
L7290::
    add esi, 04h
    or cl, 0e0h
    jmp L5171
    align 4
L729c::
    add esi, 04h
    or cl, 0e0h
    jmp L5195
    align 4
L72a8::
    add esi, 04h
    or cl, 0e0h
    jmp L51bb
    align 4
L72b4::
    add esi, 04h
    or cl, 0e0h
    jmp L51db
    align 4
L72c0::
    add esi, 04h
    or cl, 0e0h
    jmp L51f6
    align 4
L72cc::
    add esi, 04h
    or cl, 0e0h
    jmp L5217
    align 4
L72d8::
    add esi, 04h
    or cl, 0e0h
    jmp L5251
    align 4
L72e4::
    add esi, 04h
    or cl, 0e0h
    jmp L526a
    align 4
L72f0::
    add esi, 04h
    or cl, 0e0h
    jmp L529d
    align 4
L72fc::
    add esi, 04h
    or cl, 0e0h
    jmp L52bf
    align 4
L7308::
    add esi, 04h
    or cl, 0e0h
    jmp L52e1
    align 4
L7314::
    add esi, 04h
    or cl, 0e0h
    jmp L534b
    align 4
L7320::
    add esi, 04h
    or cl, 0e0h
    jmp L5364
    align 4
L732c::
    add esi, 04h
    or cl, 0e0h
    jmp L5397
    align 4
L7338::
    add esi, 04h
    or cl, 0e0h
    jmp L53b9
    align 4
L7344::
    add esi, 04h
    or cl, 0e0h
    jmp L53db
    align 4
L7350::
    add esi, 04h
    or cl, 0e0h
    jmp L544c
    align 4
L735c::
    add esi, 04h
    or cl, 0e0h
    jmp L5465
    align 4
L7368::
    add esi, 04h
    or cl, 0e0h
    jmp L5498
    align 4
L7374::
    add esi, 04h
    or cl, 0e0h
    jmp L54ba
    align 4
L7380::
    add esi, 04h
    or cl, 0e0h
    jmp L54dc
    align 4
L738c::
    add esi, 04h
    or cl, 0e0h
    jmp L554d
    align 4
L7398::
    add esi, 04h
    or cl, 0e0h
    jmp L5566
    align 4
L73a4::
    add esi, 04h
    or cl, 0e0h
    jmp L5599
    align 4
L73b0::
    add esi, 04h
    or cl, 0e0h
    jmp L55bb
    align 4
L73bc::
    add esi, 04h
    or cl, 0e0h
    jmp L55dd
    align 4
L73c8::
    add esi, 04h
    or cl, 0e0h
    jmp L564e
    align 4
L73d4::
    add esi, 04h
    or cl, 0e0h
    jmp L5667
    align 4
L73e0::
    add esi, 04h
    or cl, 0e0h
    jmp L569a
    align 4
L73ec::
    add esi, 04h
    or cl, 0e0h
    jmp L56bc
    align 4
L73f8::
    add esi, 04h
    or cl, 0e0h
    jmp L56de
    align 4
L7404::
    add esi, 04h
    or cl, 0e0h
    jmp L5756
    align 4
L7410::
    add esi, 04h
    or cl, 0e0h
    jmp L576f
    align 4
L741c::
    add esi, 04h
    or cl, 0e0h
    jmp L57a2
    align 4
L7428::
    add esi, 04h
    or cl, 0e0h
    jmp L57c4
    align 4
L7434::
    add esi, 04h
    or cl, 0e0h
    jmp L57e6
    align 4
L7440::
    add esi, 04h
    or cl, 0e0h
    jmp L585e
    align 4
L744c::
    add esi, 04h
    or cl, 0e0h
    jmp L5877
    align 4
L7458::
    add esi, 04h
    or cl, 0e0h
    jmp L58aa
    align 4
L7464::
    add esi, 04h
    or cl, 0e0h
    jmp L58cc
    align 4
L7470::
    add esi, 04h
    or cl, 0e0h
    jmp L58ee
    align 4
L747c::
    add esi, 04h
    or cl, 0e0h
    jmp L5966
    align 4
L7488::
    add esi, 04h
    or cl, 0e0h
    jmp L597f
    align 4
L7494::
    add esi, 04h
    or cl, 0e0h
    jmp L59b2
    align 4
L74a0::
    add esi, 04h
    or cl, 0e0h
    jmp L59d4
    align 4
L74ac::
    add esi, 04h
    or cl, 0e0h
    jmp L59f6
    align 4
L74b8::
    add esi, 04h
    or cl, 0e0h
    jmp L5ae5
    align 4
L74c4::
    add esi, 04h
    or cl, 0e0h
    jmp L5afe
    align 4
L74d0::
    add esi, 04h
    or cl, 0e0h
    jmp L5b31
    align 4
L74dc::
    add esi, 04h
    or cl, 0e0h
    jmp L5b53
    align 4
L74e8::
    add esi, 04h
    or cl, 0e0h
    jmp L5b75
    align 4
L74f4::
    add esi, 04h
    or cl, 0e0h
    jmp L5bed
    align 4
L7500::
    add esi, 04h
    or cl, 0e0h
    jmp L5c06
    align 4
L750c::
    add esi, 04h
    or cl, 0e0h
    jmp L5c39
    align 4
L7518::
    add esi, 04h
    or cl, 0e0h
    jmp L5c5b
    align 4
L7524::
    add esi, 04h
    or cl, 0e0h
    jmp L5c7d
    align 4
L7530::
    add esi, 04h
    or cl, 0e0h
    jmp L5cf5
    align 4
L753c::
    add esi, 04h
    or cl, 0e0h
    jmp L5d0e
    align 4
L7548::
    add esi, 04h
    or cl, 0e0h
    jmp L5d41
    align 4
L7554::
    add esi, 04h
    or cl, 0e0h
    jmp L5d63
    align 4
L7560::
    add esi, 04h
    or cl, 0e0h
    jmp L5d85
    align 4
L756c::
    add esi, 04h
    or cl, 0e0h
    jmp L5dfd
    align 4
L7578::
    add esi, 04h
    or cl, 0e0h
    jmp L5e16
    align 4
L7584::
    add esi, 04h
    or cl, 0e0h
    jmp L5e49
    align 4
L7590::
    add esi, 04h
    or cl, 0e0h
    jmp L5e6b
    align 4
L759c::
    add esi, 04h
    or cl, 0e0h
    jmp L5e8d
    align 4
L75a8::
    add esi, 04h
    or cl, 0e0h
    jmp L5f05
    align 4
L75b4::
    add esi, 04h
    or cl, 0e0h
    jmp L5f1e
    align 4
L75c0::
    add esi, 04h
    or cl, 0e0h
    jmp L5f51
    align 4
L75cc::
    add esi, 04h
    or cl, 0e0h
    jmp L5f73
    align 4
L75d8::
    add esi, 04h
    or cl, 0e0h
    jmp L5f95
    align 4
L75e4::
    add esi, 04h
    or cl, 0e0h
    jmp L600d
    align 4
L75f0::
    add esi, 04h
    or cl, 0e0h
    jmp L6026
    align 4
L75fc::
    add esi, 04h
    or cl, 0e0h
    jmp L6059
    align 4
L7608::
    add esi, 04h
    or cl, 0e0h
    jmp L607b
    align 4
L7614::
    add esi, 04h
    or cl, 0e0h
    jmp L609d
    align 4
L7620::
    add esi, 04h
    or cl, 0e0h
    jmp L6115
    align 4
L762c::
    add esi, 04h
    or cl, 0e0h
    jmp L612e
    align 4
L7638::
    add esi, 04h
    or cl, 0e0h
    jmp L6161
    align 4
L7644::
    add esi, 04h
    or cl, 0e0h
    jmp L6183
    align 4
L7650::
    add esi, 04h
    or cl, 0e0h
    jmp L61a5
    align 4
L765c::
    add esi, 04h
    or cl, 0e0h
    jmp L621d
    align 4
L7668::
    add esi, 04h
    or cl, 0e0h
    jmp L6236
    align 4
L7674::
    add esi, 04h
    or cl, 0e0h
    jmp L6269
    align 4
L7680::
    add esi, 04h
    or cl, 0e0h
    jmp L628b
    align 4
L768c::
    add esi, 04h
    or cl, 0e0h
    jmp L62ad
    align 4
L7698::
    add esi, 04h
    or cl, 0e0h
    jmp L639f
    align 4
L76a4::
    add esi, 04h
    or cl, 0e0h
    jmp L63b8
    align 4
L76b0::
    add esi, 04h
    or cl, 0e0h
    jmp L63ef
    align 4
L76bc::
    add esi, 04h
    or cl, 0e0h
    jmp L6411
    align 4
L76c8::
    add esi, 04h
    or cl, 0e0h
    jmp L6433
    align 4
L76d4::
    add esi, 04h
    or cl, 0e0h
    jmp L6476
    align 4
L76e0::
    add esi, 04h
    or cl, 0e0h
    jmp L6498
    align 4
L76ec::
    add esi, 04h
    or cl, 0e0h
    jmp L64eb
    align 4
L76f8::
    add esi, 04h
    mov edx, dword ptr [esi+04h]
    or cl, 0e0h
    jmp L005a
    align 4
L7708::
    add esi, 04h
    mov edx, dword ptr [esi+04h]
    or cl, 0e0h
    jmp L0068
    align 4
L7718::
    add esi, 04h
    mov edx, dword ptr [esi+04h]
    or cl, 0e0h
    jmp L0089
    align 4
L7728::
    add esi, 04h
    mov edx, dword ptr [esi+04h]
    or cl, 0e0h
    jmp L0097
    align 4
L7738::
    add esi, 04h
    mov edx, dword ptr [esi+04h]
    or cl, 0e0h
    jmp L0b56
    align 4
L7748::
    add esi, 04h
    mov edx, dword ptr [esi+04h]
    or cl, 0e0h
    jmp L0b64
    align 4
L7758::
    add esi, 04h
    mov edx, dword ptr [esi+04h]
    or cl, 0e0h
    jmp L0b85
    align 4
L7768::
    add esi, 04h
    mov edx, dword ptr [esi+04h]
    or cl, 0e0h
    jmp L0ba3
    align 4
L7778::
    add esi, 04h
    mov edx, dword ptr [esi+04h]
    or cl, 0e0h
    jmp L1560
    align 4
L7788::
    add esi, 04h
    mov edx, dword ptr [esi+04h]
    or cl, 0e0h
    jmp L15c8
    align 4
L7798::
    add esi, 04h
    mov edx, dword ptr [esi+04h]
    or cl, 0e0h
    jmp L1638
set_bank endp
    align 4
bank_regs RMREGS <>
    align 4
current_bank word 0
    align 4
    word 0
    align 4
bank_window word 0
    align 4
D77e8 dword 0
D77ec dword 0
D77f0 dword 2 dup(0)
D77f8 dword 0
D77fc dword 0
D7800 dword 0
D7804 dword 0
D7808 dword 0
D780c dword 0
D7810 dword 0
D7814 byte 0
D7815 byte 3 dup(0)
bit_masks dword 01h, 02h, 04h, 08h, 010h, 020h, 040h, 080h
    dword 0100h, 0200h, 0400h, 0800h, 01000h, 02000h, 04000h, 08000h
    dword 010000h, 020000h, 040000h, 080000h, 0100000h, 0200000h, 0400000h, 0800000h
    dword 01000000h, 02000000h, 04000000h, 08000000h, 010000000h, 020000000h, 040000000h, 080000000h
D7898 dword 0
D789c dword 0
D78a0 byte 0
    align 4
D78a4 dword 0
D78a8 dword 0
D78ac dword 0
D78b0 dword 0
D78b4 dword 0
D78b8 dword 0
D78bc byte 0
    align 4
D78c0 dword 0
D78c4 dword 0
D78c8 dword 0
D78cc dword 0
D78d0 dword 0
D78d4 byte 0
    align 4
D78d8 dword 0
D78dc dword 0
D78e0 dword 0
D78e4 byte 0
D78e5 byte 0
D78e6 byte 0
D78e7 byte 0
D78e8 dword 512 dup(0)
bank_shift byte 0
    align 4
_TEXT ends

_DATA segment
id_string label byte
    db "$Id: 124D_E.ASM 1.13 1995/12/15 15:05:59 MDV Exp $"
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
_DATA ends

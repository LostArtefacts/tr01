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

    public expand_color
    public pass1_write
    public decode_frame
    public pass1_decode
    public pass2_decode
    public pass3_start
    public pass3_decode
    public set_bank_mode
    public build_block_list
    public set_bank
    public bank_regs
    public id_string

_TEXT segment
expand_color proc near
    add eax, eax
    shr ax, 1
    mov dx, ax
    ror eax, 010h
    mov esi, eax
    mov ebx, eax
    mov si, dx
    mov bx, dx
    ret
L0016::
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
L003d::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 01eh
    jae L0050
    add esi, 04h
    or cl, 0e0h
L0050::
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
L0075::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 01eh
    jae L0088
    add esi, 04h
    or cl, 0e0h
L0088::
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
L00be::
    add eax, eax
    shr ax, 1
    mov ebx, eax
    mov dx, ax
    ror ebx, 010h
    mov esi, ebx
    mov si, dx
    ret
L00d1::
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
L00f5::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 01eh
    jae L0108
    add esi, 04h
    or cl, 0e0h
L0108::
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
L012a::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 01eh
    jae L013d
    add esi, 04h
    or cl, 0e0h
L013d::
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
L0170::
    add eax, eax
    shr ax, 1
    mov ebx, eax
    mov dx, ax
    ror eax, 010h
    mov esi, eax
    mov si, dx
    ret
L0183::
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
L01a7::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 01eh
    jae L01ba
    add esi, 04h
    or cl, 0e0h
L01ba::
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
L01dc::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 01eh
    jae L01ef
    add esi, 04h
    or cl, 0e0h
L01ef::
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
L0222::
    add eax, eax
    shr ax, 1
    mov ebx, eax
    mov dx, ax
    ror eax, 010h
    mov bx, ax
    mov esi, eax
    mov si, dx
    ret
L0238::
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
L025f::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 01eh
    jae L0272
    add esi, 04h
    or cl, 0e0h
L0272::
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
L0297::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 01eh
    jae L02aa
    add esi, 04h
    or cl, 0e0h
L02aa::
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
L02e0::
    add eax, eax
    shr ax, 1
    mov esi, eax
    mov dx, ax
    ror esi, 010h
    mov ebx, esi
    mov bx, dx
    ret
L02f3::
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
L0317::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 01eh
    jae L032a
    add esi, 04h
    or cl, 0e0h
L032a::
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
L034c::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 01eh
    jae L035f
    add esi, 04h
    or cl, 0e0h
L035f::
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
L0392::
    add eax, eax
    shr ax, 1
    ror eax, 010h
    mov esi, eax
    mov ebx, eax
    ret
L039f::
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
L03bd::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 01eh
    jae L03d0
    add esi, 04h
    or cl, 0e0h
L03d0::
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
L03ec::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 01eh
    jae L03ff
    add esi, 04h
    or cl, 0e0h
L03ff::
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
L042c::
    add eax, eax
    shr ax, 1
    mov ebx, eax
    ror eax, 010h
    mov esi, eax
    ret
L0439::
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
L0457::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 01eh
    jae L046a
    add esi, 04h
    or cl, 0e0h
L046a::
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
L0486::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 01eh
    jae L0499
    add esi, 04h
    or cl, 0e0h
L0499::
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
L04c6::
    add eax, eax
    shr ax, 1
    mov ebx, eax
    ror eax, 010h
    mov bx, ax
    mov esi, eax
    ret
L04d6::
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
L04f7::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 01eh
    jae L050a
    add esi, 04h
    or cl, 0e0h
L050a::
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
L0529::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 01eh
    jae L053c
    add esi, 04h
    or cl, 0e0h
L053c::
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
L056c::
    add eax, eax
    shr ax, 1
    mov esi, eax
    mov dx, ax
    ror eax, 010h
    mov ebx, eax
    mov bx, dx
    ret
L057f::
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
L05a3::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 01eh
    jae L05b6
    add esi, 04h
    or cl, 0e0h
L05b6::
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
L05d8::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 01eh
    jae L05eb
    add esi, 04h
    or cl, 0e0h
L05eb::
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
L061e::
    add eax, eax
    shr ax, 1
    mov esi, eax
    ror eax, 010h
    mov ebx, eax
    ret
L062b::
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
L0649::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 01eh
    jae L065c
    add esi, 04h
    or cl, 0e0h
L065c::
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
L0678::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 01eh
    jae L068b
    add esi, 04h
    or cl, 0e0h
L068b::
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
L06b8::
    add eax, eax
    shr ax, 1
    mov esi, eax
    mov ebx, eax
    ret
L06c2::
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
L06dd::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 01eh
    jae L06f0
    add esi, 04h
    or cl, 0e0h
L06f0::
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
L0709::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 01eh
    jae L071c
    add esi, 04h
    or cl, 0e0h
L071c::
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
L0746::
    add eax, eax
    shr ax, 1
    mov esi, eax
    mov ebx, eax
    ror eax, 010h
    mov bx, ax
    ret
L0756::
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
L0777::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 01eh
    jae L078a
    add esi, 04h
    or cl, 0e0h
L078a::
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
L07a9::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 01eh
    jae L07bc
    add esi, 04h
    or cl, 0e0h
L07bc::
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
L07ec::
    add eax, eax
    shr ax, 1
    mov esi, eax
    mov dx, ax
    ror eax, 010h
    mov si, ax
    mov ebx, eax
    mov bx, dx
    ret
L0802::
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
L0829::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 01eh
    jae L083c
    add esi, 04h
    or cl, 0e0h
L083c::
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
L0861::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 01eh
    jae L0874
    add esi, 04h
    or cl, 0e0h
L0874::
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
L08aa::
    add eax, eax
    shr ax, 1
    mov esi, eax
    ror eax, 010h
    mov si, ax
    mov ebx, eax
    ret
L08ba::
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
L08db::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 01eh
    jae L08ee
    add esi, 04h
    or cl, 0e0h
L08ee::
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
L090d::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 01eh
    jae L0920
    add esi, 04h
    or cl, 0e0h
L0920::
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
L0950::
    add eax, eax
    shr ax, 1
    mov esi, eax
    mov ebx, eax
    ror eax, 010h
    mov si, ax
    ret
L0960::
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
L0981::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 01eh
    jae L0994
    add esi, 04h
    or cl, 0e0h
L0994::
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
L09b3::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 01eh
    jae L09c6
    add esi, 04h
    or cl, 0e0h
L09c6::
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
L09f6::
    add eax, eax
    shr ax, 1
    mov esi, eax
    mov ebx, eax
    ror eax, 010h
    mov si, ax
    mov bx, ax
    ret
L0a09::
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
L0a2d::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 01eh
    jae L0a40
    add esi, 04h
    or cl, 0e0h
L0a40::
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
L0a62::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 01eh
    jae L0a75
    add esi, 04h
    or cl, 0e0h
L0a75::
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
expand_color endp
block_writers dword offset L003d
    dword offset L00f5
    dword offset L01a7
    dword offset L025f
    dword offset L0317
    dword offset L03bd
    dword offset L0457
    dword offset L04f7
    dword offset L05a3
    dword offset L0649
    dword offset L06dd
    dword offset L0777
    dword offset L0829
    dword offset L08db
    dword offset L0981
    dword offset L0a2d
    dword offset L0075
    dword offset L012a
    dword offset L01dc
    dword offset L0297
    dword offset L034c
    dword offset L03ec
    dword offset L0486
    dword offset L0529
    dword offset L05d8
    dword offset L0678
    dword offset L0709
    dword offset L07a9
    dword offset L0861
    dword offset L090d
    dword offset L09b3
    dword offset L0a62
    dword offset expand_color
    dword offset L00be
    dword offset L0170
    dword offset L0222
    dword offset L02e0
    dword offset L0392
    dword offset L042c
    dword offset L04c6
    dword offset L056c
    dword offset L061e
    dword offset L06b8
    dword offset L0746
    dword offset L07ec
    dword offset L08aa
    dword offset L0950
    dword offset L09f6
    dword offset L0016
    dword offset L00d1
    dword offset L0183
    dword offset L0238
    dword offset L02f3
    dword offset L039f
    dword offset L0439
    dword offset L04d6
    dword offset L057f
    dword offset L062b
    dword offset L06c2
    dword offset L0756
    dword offset L0802
    dword offset L08ba
    dword offset L0960
    dword offset L0a09
pass1_write proc near
    mov dword ptr [edi], ebx
    mov dword ptr [edi+0500h], esi
    ret
L0bb1::
    mov dword ptr [edi+04h], ebx
    mov dword ptr [edi+0504h], esi
    ret
L0bbb::
    mov dword ptr [edi+08h], ebx
    mov dword ptr [edi+0508h], esi
    ret
L0bc5::
    mov dword ptr [edi+0ch], ebx
    mov dword ptr [edi+050ch], esi
    ret
L0bcf::
    mov dword ptr [edi+0a00h], ebx
    mov dword ptr [edi+0f00h], esi
    ret
L0bdc::
    mov dword ptr [edi+0a04h], ebx
    mov dword ptr [edi+0f04h], esi
    ret
L0be9::
    mov dword ptr [edi+0a08h], ebx
    mov dword ptr [edi+0f08h], esi
    ret
L0bf6::
    mov dword ptr [edi+0a0ch], ebx
    mov dword ptr [edi+0f0ch], esi
    ret
L0c03::
    mov dword ptr [edi+01400h], ebx
    mov dword ptr [edi+01900h], esi
    ret
L0c10::
    mov dword ptr [edi+01404h], ebx
    mov dword ptr [edi+01904h], esi
    ret
L0c1d::
    mov dword ptr [edi+01408h], ebx
    mov dword ptr [edi+01908h], esi
    ret
L0c2a::
    mov dword ptr [edi+0140ch], ebx
    mov dword ptr [edi+0190ch], esi
    ret
L0c37::
    mov dword ptr [edi+01e00h], ebx
    mov dword ptr [edi+02300h], esi
    ret
L0c44::
    mov dword ptr [edi+01e04h], ebx
    mov dword ptr [edi+02304h], esi
    ret
L0c51::
    mov dword ptr [edi+01e08h], ebx
    mov dword ptr [edi+02308h], esi
    ret
L0c5e::
    mov dword ptr [edi+01e0ch], ebx
    mov dword ptr [edi+0230ch], esi
    ret
L0c6b::
    mov dword ptr [edi], ebx
    cmp di, 0fb00h
    jae L0c7a
    mov dword ptr [edi+0500h], esi
L0c7a::
    ret
L0c7b::
    cmp di, 0fffch
    jae L0c91
    mov dword ptr [edi+04h], ebx
    cmp di, 0fafch
    jae L0c91
    mov dword ptr [edi+0504h], esi
L0c91::
    ret
L0c92::
    cmp di, 0fff8h
    jae L0ca8
    mov dword ptr [edi+08h], ebx
    cmp di, 0faf8h
    jae L0ca8
    mov dword ptr [edi+0508h], esi
L0ca8::
    ret
L0ca9::
    cmp di, 0fff4h
    jae L0cbf
    mov dword ptr [edi+0ch], ebx
    cmp di, 0faf4h
    jae L0cbf
    mov dword ptr [edi+050ch], esi
L0cbf::
    ret
L0cc0::
    cmp di, 0f600h
    jae L0cda
    mov dword ptr [edi+0a00h], ebx
    cmp di, 0f100h
    jae L0cda
    mov dword ptr [edi+0f00h], esi
L0cda::
    ret
L0cdb::
    cmp di, 0f5fch
    jae L0cf5
    mov dword ptr [edi+0a04h], ebx
    cmp di, 0f0fch
    jae L0cf5
    mov dword ptr [edi+0f04h], esi
L0cf5::
    ret
L0cf6::
    cmp di, 0f5f8h
    jae L0d10
    mov dword ptr [edi+0a08h], ebx
    cmp di, 0f0f8h
    jae L0d10
    mov dword ptr [edi+0f08h], esi
L0d10::
    ret
L0d11::
    cmp di, 0f5f4h
    jae L0d2b
    mov dword ptr [edi+0a0ch], ebx
    cmp di, 0f0f4h
    jae L0d2b
    mov dword ptr [edi+0f0ch], esi
L0d2b::
    ret
L0d2c::
    cmp di, 0ec00h
    jae L0d46
    mov dword ptr [edi+01400h], ebx
    cmp di, 0e700h
    jae L0d46
    mov dword ptr [edi+01900h], esi
L0d46::
    ret
L0d47::
    cmp di, 0ebfch
    jae L0d61
    mov dword ptr [edi+01404h], ebx
    cmp di, 0e6fch
    jae L0d61
    mov dword ptr [edi+01904h], esi
L0d61::
    ret
L0d62::
    cmp di, 0ebf8h
    jae L0d7c
    mov dword ptr [edi+01408h], ebx
    cmp di, 0e6f8h
    jae L0d7c
    mov dword ptr [edi+01908h], esi
L0d7c::
    ret
L0d7d::
    cmp di, 0ebf4h
    jae L0d97
    mov dword ptr [edi+0140ch], ebx
    cmp di, 0e6f4h
    jae L0d97
    mov dword ptr [edi+0190ch], esi
L0d97::
    ret
L0d98::
    cmp di, 0e200h
    jae L0db2
    mov dword ptr [edi+01e00h], ebx
    cmp di, 0dd00h
    jae L0db2
    mov dword ptr [edi+02300h], esi
L0db2::
    ret
L0db3::
    cmp di, 0e1fch
    jae L0dcd
    mov dword ptr [edi+01e04h], ebx
    cmp di, 0dcfch
    jae L0dcd
    mov dword ptr [edi+02304h], esi
L0dcd::
    ret
L0dce::
    cmp di, 0e1f8h
    jae L0de8
    mov dword ptr [edi+01e08h], ebx
    cmp di, 0dcf8h
    jae L0de8
    mov dword ptr [edi+02308h], esi
L0de8::
    ret
L0de9::
    cmp di, 0e1f4h
    jae L0e03
    mov dword ptr [edi+01e0ch], ebx
    cmp di, 0dcf4h
    jae L0e03
    mov dword ptr [edi+0230ch], esi
L0e03::
    ret
L0e04::
    sub edi, 010000h
    cmp di, 0fb00h
    jae L0e15
    jmp L0e1b
    mov dword ptr [edi], ebx
L0e15::
    mov dword ptr [edi+0500h], esi
L0e1b::
    add edi, 010000h
    ret
L0e22::
    sub edi, 010000h
    cmp di, 0fffch
    jae L0e37
    cmp di, 0fafch
    jae L0e3a
    jmp L0e40
L0e37::
    mov dword ptr [edi+04h], ebx
L0e3a::
    mov dword ptr [edi+0504h], esi
L0e40::
    add edi, 010000h
    ret
L0e47::
    sub edi, 010000h
    cmp di, 0fff8h
    jae L0e5c
    cmp di, 0faf8h
    jae L0e5f
    jmp L0e65
L0e5c::
    mov dword ptr [edi+08h], ebx
L0e5f::
    mov dword ptr [edi+0508h], esi
L0e65::
    add edi, 010000h
    ret
L0e6c::
    sub edi, 010000h
    cmp di, 0fff4h
    jae L0e81
    cmp di, 0faf4h
    jae L0e84
    jmp L0e8a
L0e81::
    mov dword ptr [edi+0ch], ebx
L0e84::
    mov dword ptr [edi+050ch], esi
L0e8a::
    add edi, 010000h
    ret
L0e91::
    sub edi, 010000h
    cmp di, 0f600h
    jae L0ea7
    cmp di, 0f100h
    jae L0ead
    jmp L0eb3
L0ea7::
    mov dword ptr [edi+0a00h], ebx
L0ead::
    mov dword ptr [edi+0f00h], esi
L0eb3::
    add edi, 010000h
    ret
L0eba::
    sub edi, 010000h
    cmp di, 0f5fch
    jae L0ed0
    cmp di, 0f0fch
    jae L0ed6
    jmp L0edc
L0ed0::
    mov dword ptr [edi+0a04h], ebx
L0ed6::
    mov dword ptr [edi+0f04h], esi
L0edc::
    add edi, 010000h
    ret
L0ee3::
    sub edi, 010000h
    cmp di, 0f5f8h
    jae L0ef9
    cmp di, 0f0f8h
    jae L0eff
    jmp L0f05
L0ef9::
    mov dword ptr [edi+0a08h], ebx
L0eff::
    mov dword ptr [edi+0f08h], esi
L0f05::
    add edi, 010000h
    ret
L0f0c::
    sub edi, 010000h
    cmp di, 0f5f4h
    jae L0f22
    cmp di, 0f0f4h
    jae L0f28
    jmp L0f2e
L0f22::
    mov dword ptr [edi+0a0ch], ebx
L0f28::
    mov dword ptr [edi+0f0ch], esi
L0f2e::
    add edi, 010000h
    ret
L0f35::
    sub edi, 010000h
    cmp di, 0ec00h
    jae L0f4b
    cmp di, 0e700h
    jae L0f51
    jmp L0f57
L0f4b::
    mov dword ptr [edi+01400h], ebx
L0f51::
    mov dword ptr [edi+01900h], esi
L0f57::
    add edi, 010000h
    ret
L0f5e::
    sub edi, 010000h
    cmp di, 0ebfch
    jae L0f74
    cmp di, 0e6fch
    jae L0f7a
    jmp L0f80
L0f74::
    mov dword ptr [edi+01404h], ebx
L0f7a::
    mov dword ptr [edi+01904h], esi
L0f80::
    add edi, 010000h
    ret
L0f87::
    sub edi, 010000h
    cmp di, 0ebf8h
    jae L0f9d
    cmp di, 0e6f8h
    jae L0fa3
    jmp L0fa9
L0f9d::
    mov dword ptr [edi+01408h], ebx
L0fa3::
    mov dword ptr [edi+01908h], esi
L0fa9::
    add edi, 010000h
    ret
L0fb0::
    sub edi, 010000h
    cmp di, 0ebf4h
    jae L0fc6
    cmp di, 0e6f4h
    jae L0fcc
    jmp L0fd2
L0fc6::
    mov dword ptr [edi+0140ch], ebx
L0fcc::
    mov dword ptr [edi+0190ch], esi
L0fd2::
    add edi, 010000h
    ret
L0fd9::
    sub edi, 010000h
    cmp di, 0e200h
    jae L0fef
    cmp di, 0dd00h
    jae L0ff5
    jmp L0ffb
L0fef::
    mov dword ptr [edi+01e00h], ebx
L0ff5::
    mov dword ptr [edi+02300h], esi
L0ffb::
    add edi, 010000h
    ret
L1002::
    sub edi, 010000h
    cmp di, 0e1fch
    jae L1018
    cmp di, 0dcfch
    jae L101e
    jmp L1024
L1018::
    mov dword ptr [edi+01e04h], ebx
L101e::
    mov dword ptr [edi+02304h], esi
L1024::
    add edi, 010000h
    ret
L102b::
    sub edi, 010000h
    cmp di, 0e1f8h
    jae L1041
    cmp di, 0dcf8h
    jae L1047
    jmp L104d
L1041::
    mov dword ptr [edi+01e08h], ebx
L1047::
    mov dword ptr [edi+02308h], esi
L104d::
    add edi, 010000h
    ret
L1054::
    sub edi, 010000h
    cmp di, 0e1f4h
    jae L106a
    cmp di, 0dcf4h
    jae L1070
    jmp L1076
L106a::
    mov dword ptr [edi+01e0ch], ebx
L1070::
    mov dword ptr [edi+0230ch], esi
L1076::
    add edi, 010000h
    ret
pass1_write endp
pass1_writers dword offset pass1_write
    dword offset L0bb1
    dword offset L0bbb
    dword offset L0bc5
    dword offset L0bcf
    dword offset L0bdc
    dword offset L0be9
    dword offset L0bf6
    dword offset L0c03
    dword offset L0c10
    dword offset L0c1d
    dword offset L0c2a
    dword offset L0c37
    dword offset L0c44
    dword offset L0c51
    dword offset L0c5e
pass2_writers dword offset L0c6b
    dword offset L0c7b
    dword offset L0c92
    dword offset L0ca9
    dword offset L0cc0
    dword offset L0cdb
    dword offset L0cf6
    dword offset L0d11
    dword offset L0d2c
    dword offset L0d47
    dword offset L0d62
    dword offset L0d7d
    dword offset L0d98
    dword offset L0db3
    dword offset L0dce
    dword offset L0de9
pass3_writers dword offset L0e04
    dword offset L0e22
    dword offset L0e47
    dword offset L0e6c
    dword offset L0e91
    dword offset L0eba
    dword offset L0ee3
    dword offset L0f0c
    dword offset L0f35
    dword offset L0f5e
    dword offset L0f87
    dword offset L0fb0
    dword offset L0fd9
    dword offset L1002
    dword offset L102b
    dword offset L1054
decode_frame proc near
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
    mov dword ptr [frame_flags], eax
    mov edi, dword ptr [ebp+014h]
    mov eax, dword ptr [edi]
    imul eax, dword ptr [edi+04h]
    add edi, 08h
    mov dword ptr [ebp+014h], edi
    mov dword ptr [block_count], eax
    mov edi, dword ptr [ebp+010h]
    mov eax, dword ptr [edi]
    mov dword ptr [D6afc], eax
    mov eax, dword ptr [edi+04h]
    mov dword ptr [D6b00], eax
    mov eax, dword ptr [edi+08h]
    mov dword ptr [D6b04], eax
    mov al, byte ptr [edi+0ch]
    mov byte ptr [D6bdc], al
    mov al, byte ptr [edi+0dh]
    mov byte ptr [D6bdd], al
    mov al, byte ptr [edi+0eh]
    mov byte ptr [D6bde], al
    mov edi, dword ptr [ebp+0ch]
    mov dword ptr [frame_buffer], edi
    mov byte ptr [D6ba0], 00h
    test dword ptr [frame_flags], 07800000h
    je L58e6
    mov esi, dword ptr [ebp+08h]
    mov dword ptr [D6ba8], 00h
    mov dword ptr [D6b9c], 00h
    mov dword ptr [D6b10], 00h
    mov dword ptr [D6b98], 00h
    mov ecx, 0e0h
    mov edx, dword ptr [frame_flags]
    test edx, 020000h
    je L124c
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 04h
    jb L5a88
L1206::
    and eax, 0fh
    mov byte ptr [D6bdc], al
    mov eax, dword ptr [eax*4+bit_masks]
    mov dword ptr [D6b10], eax
    cmp eax, 00h
    je L1246
    mov edi, dword ptr [D6afc]
L1225::
    mov eax, dword ptr [esi]
    shrd eax, edx, cl
    add cl, 04h
    jb L6a78
L1233::
    and eax, 0fh
    call dword ptr [eax*4+block_writers+WRITER_SET*64]
    sub dword ptr [D6b10], 01h
    jne L1225
L1246::
    mov edx, dword ptr [frame_flags]
L124c::
    test edx, 040000h
    je L12b1
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 04h
    jb L5a94
L1265::
    and eax, 0fh
    mov byte ptr [D6bdd], al
    mov eax, dword ptr [eax*4+bit_masks]
    mul dword ptr [block_count]
    mov dword ptr [D6b10], eax
    cmp eax, 00h
    je L12ab
    mov edi, dword ptr [D6b00]
L128a::
    mov eax, dword ptr [esi]
    shrd eax, edx, cl
    add cl, 04h
    jb L6a88
L1298::
    and eax, 0fh
    call dword ptr [eax*4+block_writers+WRITER_SET*64]
    sub dword ptr [D6b10], 01h
    jne L128a
L12ab::
    mov edx, dword ptr [frame_flags]
L12b1::
    test edx, 080000h
    je L1318
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 014h
    jae L12cc
    add esi, 04h
    or cl, 0e0h
L12cc::
    and eax, 0fffffh
    mov dword ptr [D6b10], eax
    cmp eax, 00h
    je L1318
    bswap ecx
    mov cl, 00h
    sub eax, 01h
L12e2::
    add cl, 01h
    shr eax, 1
    jne L12e2
    mov byte ptr [D6bde], cl
    bswap ecx
    mov edi, dword ptr [D6b04]
L12f7::
    mov eax, dword ptr [esi]
    shrd eax, edx, cl
    add cl, 04h
    jb L6a98
L1305::
    and eax, 0fh
    call dword ptr [eax*4+block_writers+WRITER_SET*64]
    sub dword ptr [D6b10], 01h
    jne L12f7
L1318::
    mov edx, dword ptr [D6b00]
    mov dword ptr [D6b98], edx
    bswap ecx
    mov edx, dword ptr [ebp+010h]
    mov cl, byte ptr [D6bdc]
    mov byte ptr [edx+0ch], cl
    mov eax, 01h
    shl eax, cl
    dec eax
    mov dword ptr [D6bd8], eax
    mov cl, byte ptr [D6bde]
    mov byte ptr [edx+0eh], cl
    mov eax, 01h
    shl eax, cl
    dec eax
    mov dword ptr [D6bd4], eax
    mov cl, byte ptr [D6bdd]
    mov byte ptr [edx+0dh], cl
    mov eax, 01h
    shl eax, cl
    dec eax
    mov dword ptr [D6bd0], eax
    add cl, 03h
    mov byte ptr [D6bdf], cl
    bswap ecx
    xor edx, edx
    mov word ptr [current_bank], 0ffffh
L1381::
    mov dword ptr [D6bbc], esi
    mov dword ptr [D6bc0], edx
    mov ch, byte ptr [D6ba0]
    mov dword ptr [D6bcc], ecx
    mov eax, dword ptr [D6b9c]
    mov dword ptr [D6bc8], eax
    mov eax, dword ptr [D6b98]
    mov dword ptr [D6bc4], eax
L13ad::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb L5aa0
L13ba::
    and eax, 01h
    je L1410
    add edx, 01h
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 03h
    jb L5aac
L13d3::
    and eax, 07h
    add edx, eax
    cmp eax, 07h
    jl L1410
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 07h
    jb L5ab8
L13ee::
    and eax, 07fh
    add edx, eax
    cmp eax, 07fh
    jl L1410
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 0ch
    jb L5ac4
L1409::
    and eax, 0fffh
    add edx, eax
L1410::
    bswap ecx
    mov cl, byte ptr [D6bdf]
    mov ebx, edx
    shl ebx, cl
    add dword ptr [D6b98], ebx
    bswap ecx
    add edx, dword ptr [D6b9c]
    cmp edx, dword ptr [block_count]
    jae L3f44
    mov dword ptr [D6b9c], edx
    shl edx, 02h
    add edx, dword ptr [ebp+014h]
    mov edi, dword ptr [edx]
    cmp edi, 0ffffffffh
    je L28b2
    cmp edi, 0fffffffeh
    je L3f44
    shld ebx, edi, 010h
    cmp di, 0dcfah
    ja L28c3
    cmp bx, word ptr [current_bank]
    jne L3f68
L1472::
    mov word ptr [current_bank], bx
    mov dword ptr [D6af8], edi
    and edi, 0ffffh
    or edi, dword ptr [frame_buffer]
L148b::
    mov dword ptr [D6b14], 00h
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb L5ad0
L14a2::
    test al, 01h
    jne L1741
L14aa::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb L5adc
L14b7::
    and eax, 01h
    jne L14c3
    mov al, byte ptr [D6ba0]
    jmp L14e7
L14c3::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb L5ae8
L14d0::
    and eax, 01h
    mov al, byte ptr [D6ba0]
    je L14dc
    inc al
L14dc::
    sub al, 02h
    sbb al, 00h
    and al, 03h
    mov byte ptr [D6ba0], al
L14e7::
    or al, al
    je L1567
    test al, 02h
    jne L1511
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [D6bdc]
    jb L5af4
L1503::
    and eax, dword ptr [D6bd8]
    mov edx, dword ptr [D6afc]
    jmp L1531
L1511::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [D6bde]
    jb L5b00
L1525::
    and eax, dword ptr [D6bd4]
    mov edx, dword ptr [D6b04]
L1531::
    shl eax, 03h
    add edx, eax
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 011h
    jae L1549
    add esi, 04h
    or cl, 0e0h
L1549::
    and eax, 01ffffh
    mov dword ptr [D6ae8], esi
    mov dword ptr [D6af0], ebp
    mov dword ptr [D6aec], ecx
    mov ebx, dword ptr [edx]
    mov esi, dword ptr [edx+04h]
    jmp L15bb
L1567::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [D6bdd]
    jb L5b0c
L157b::
    and eax, dword ptr [D6bd0]
    mov edx, dword ptr [D6b98]
    shl eax, 03h
    add edx, eax
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 011h
    jae L159f
    add esi, 04h
    or cl, 0e0h
L159f::
    and eax, 01ffffh
    mov dword ptr [D6ae8], esi
    mov dword ptr [D6af0], ebp
    mov dword ptr [D6aec], ecx
    mov ebx, dword ptr [edx]
    mov esi, dword ptr [edx+04h]
L15bb::
    or dword ptr [D6b14], eax
    test al, al
    je L165e
    test al, 01h
    je L163e
L15cd::
    mov dword ptr [edi], ebx
    mov dword ptr [edi+0500h], esi
    test al, 02h
    je L1642
L15d9::
    mov dword ptr [edi+04h], ebx
    mov dword ptr [edi+0504h], esi
    test al, 010h
    je L1646
L15e6::
    mov dword ptr [edi+08h], ebx
    mov dword ptr [edi+0508h], esi
    test al, 020h
    je L164a
L15f3::
    mov dword ptr [edi+0ch], ebx
    mov dword ptr [edi+050ch], esi
    test al, 04h
    je L164e
L1600::
    mov dword ptr [edi+0a00h], ebx
    mov dword ptr [edi+0f00h], esi
    test al, 08h
    je L1652
L1610::
    mov dword ptr [edi+0a04h], ebx
    mov dword ptr [edi+0f04h], esi
    test al, 040h
    je L1656
L1620::
    mov dword ptr [edi+0a08h], ebx
    mov dword ptr [edi+0f08h], esi
    test al, 080h
    je L165a
L1630::
    mov dword ptr [edi+0a0ch], ebx
    mov dword ptr [edi+0f0ch], esi
    jmp L165e
L163e::
    test al, 01h
    jne L15cd
L1642::
    test al, 02h
    jne L15d9
L1646::
    test al, 010h
    jne L15e6
L164a::
    test al, 020h
    jne L15f3
L164e::
    test al, 04h
    jne L1600
L1652::
    test al, 08h
    jne L1610
L1656::
    test al, 040h
    jne L1620
L165a::
    test al, 080h
    jne L1630
L165e::
    test ah, ah
    je L1724
    test ah, 01h
    je L16f4
L166f::
    mov dword ptr [edi+01400h], ebx
    mov dword ptr [edi+01900h], esi
    test ah, 02h
    je L16fd
L1680::
    mov dword ptr [edi+01404h], ebx
    mov dword ptr [edi+01904h], esi
    test ah, 010h
    je L1706
L1691::
    mov dword ptr [edi+01408h], ebx
    mov dword ptr [edi+01908h], esi
    test ah, 020h
    je L170b
L16a2::
    mov dword ptr [edi+0140ch], ebx
    mov dword ptr [edi+0190ch], esi
    test ah, 04h
    je L1710
L16b3::
    mov dword ptr [edi+01e00h], ebx
    mov dword ptr [edi+02300h], esi
    test ah, 08h
    je L1715
L16c4::
    mov dword ptr [edi+01e04h], ebx
    mov dword ptr [edi+02304h], esi
    test ah, 040h
    je L171a
L16d5::
    mov dword ptr [edi+01e08h], ebx
    mov dword ptr [edi+02308h], esi
    test ah, 080h
    je L171f
L16e6::
    mov dword ptr [edi+01e0ch], ebx
    mov dword ptr [edi+0230ch], esi
    jmp L1724
L16f4::
    test ah, 01h
    jne L166f
L16fd::
    test ah, 02h
    jne L1680
L1706::
    test ah, 010h
    jne L1691
L170b::
    test ah, 020h
    jne L16a2
L1710::
    test ah, 04h
    jne L16b3
L1715::
    test ah, 08h
    jne L16c4
L171a::
    test ah, 040h
    jne L16d5
L171f::
    test ah, 080h
    jne L16e6
L1724::
    mov esi, dword ptr [D6ae8]
    mov ecx, dword ptr [D6aec]
    mov ebp, dword ptr [D6af0]
    and eax, 010000h
    je L14aa
L1741::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb L5b18
L174e::
    test al, 01h
    jne L2756
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 04h
    jb L5b24
L1767::
    and eax, 0fh
    jmp dword ptr [eax*4+pass1_codes]
decode_frame endp
pass1_codes dword offset pass1_decode
    dword offset L17cf
    dword offset L17f0
    dword offset L1814
    dword offset L1834
    dword offset L1856
    dword offset L187d
    dword offset L18a0
    dword offset L18c4
    dword offset L18e3
    dword offset L1907
    dword offset L192d
    dword offset L194d
    dword offset L1968
    dword offset L1989
    dword offset L19a7
pass1_decode proc near
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 010h
    jae L17c4
    add esi, 04h
    or cl, 0e0h
L17c4::
    xor dword ptr [D6b14], eax
    jmp L19ad
L17cf::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 0ch
    jb L5b30
L17e0::
    shl eax, 04h
    or al, 0fh
    xor dword ptr [D6b14], eax
    jmp L19ad
L17f0::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 0ch
    jb L5b3c
L1801::
    shl eax, 04h
    shr al, 04h
    or al, 0f0h
    xor dword ptr [D6b14], eax
    jmp L19ad
L1814::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 08h
    jb L5b48
L1825::
    mov ah, al
    mov al, 0ffh
    xor dword ptr [D6b14], eax
    jmp L19ad
L1834::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 0ch
    jb L5b54
L1845::
    shl ah, 04h
    or ah, 0fh
    xor dword ptr [D6b14], eax
    jmp L19ad
L1856::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 08h
    jb L5b60
L1867::
    shl eax, 04h
    shl ah, 04h
    or eax, 0f0fh
    xor dword ptr [D6b14], eax
    jmp L19ad
L187d::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 08h
    jb L5b6c
L188e::
    mov ah, al
    or eax, 0ff0h
    xor dword ptr [D6b14], eax
    jmp L19ad
L18a0::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 04h
    jb L5b78
L18b1::
    shl eax, 0ch
    or eax, 0fffh
    xor dword ptr [D6b14], eax
    jmp L19ad
L18c4::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 0ch
    jb L5b84
L18d5::
    or ah, 0f0h
    xor dword ptr [D6b14], eax
    jmp L19ad
L18e3::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 08h
    jb L5b90
L18f4::
    shl eax, 04h
    or eax, 0f00fh
    xor dword ptr [D6b14], eax
    jmp L19ad
L1907::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 08h
    jb L5b9c
L1918::
    mov ah, al
    ror ah, 04h
    or eax, 0f0f0h
    xor dword ptr [D6b14], eax
    jmp L19ad
L192d::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 04h
    jb L5ba8
L193e::
    mov ah, al
    or eax, 0f0ffh
    xor dword ptr [D6b14], eax
    jmp L19ad
L194d::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 08h
    jb L5bb4
L195e::
    mov ah, 0ffh
    xor dword ptr [D6b14], eax
    jmp L19ad
L1968::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 04h
    jb L5bc0
L1979::
    or eax, 0fff0h
    rol al, 04h
    xor dword ptr [D6b14], eax
    jmp L19ad
L1989::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 04h
    jb L5bcc
L199a::
    or eax, 0fff0h
    xor dword ptr [D6b14], eax
    jmp L19ad
L19a7::
    not dword ptr [D6b14]
L19ad::
    test byte ptr [D6b14], 0ffh
    je L2077
    test byte ptr [D6b14], 01h
    je L200f
L19c7::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb L5bd8
L19d4::
    and eax, 01h
    jne L19e0
    mov al, byte ptr [D6ba0]
    jmp L1a04
L19e0::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb L5be4
L19ed::
    and eax, 01h
    mov al, byte ptr [D6ba0]
    je L19f9
    inc al
L19f9::
    sub al, 02h
    sbb al, 00h
    and al, 03h
    mov byte ptr [D6ba0], al
L1a04::
    or al, al
    je L1a50
    test al, 02h
    jne L1a2e
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [D6bdc]
    jb L5bf0
L1a20::
    and eax, dword ptr [D6bd8]
    mov edx, dword ptr [D6afc]
    jmp L1a70
L1a2e::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [D6bde]
    jb L5bfc
L1a42::
    and eax, dword ptr [D6bd4]
    mov edx, dword ptr [D6b04]
    jmp L1a70
L1a50::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [D6bdd]
    jb L5c08
L1a64::
    and eax, dword ptr [D6bd0]
    mov edx, dword ptr [D6b98]
L1a70::
    shl eax, 03h
    add edx, eax
    mov eax, dword ptr [edx]
    mov dword ptr [edi], eax
    mov eax, dword ptr [edx+04h]
    mov dword ptr [edi+0500h], eax
    test byte ptr [D6b14], 02h
    je L201c
L1a8f::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb L5c14
L1a9c::
    and eax, 01h
    jne L1aa8
    mov al, byte ptr [D6ba0]
    jmp L1acc
L1aa8::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb L5c20
L1ab5::
    and eax, 01h
    mov al, byte ptr [D6ba0]
    je L1ac1
    inc al
L1ac1::
    sub al, 02h
    sbb al, 00h
    and al, 03h
    mov byte ptr [D6ba0], al
L1acc::
    or al, al
    je L1b18
    test al, 02h
    jne L1af6
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [D6bdc]
    jb L5c2c
L1ae8::
    and eax, dword ptr [D6bd8]
    mov edx, dword ptr [D6afc]
    jmp L1b38
L1af6::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [D6bde]
    jb L5c38
L1b0a::
    and eax, dword ptr [D6bd4]
    mov edx, dword ptr [D6b04]
    jmp L1b38
L1b18::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [D6bdd]
    jb L5c44
L1b2c::
    and eax, dword ptr [D6bd0]
    mov edx, dword ptr [D6b98]
L1b38::
    shl eax, 03h
    add edx, eax
    mov eax, dword ptr [edx]
    mov dword ptr [edi+04h], eax
    mov eax, dword ptr [edx+04h]
    mov dword ptr [edi+0504h], eax
    test byte ptr [D6b14], 010h
    je L2029
L1b58::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb L5c50
L1b65::
    and eax, 01h
    jne L1b71
    mov al, byte ptr [D6ba0]
    jmp L1b95
L1b71::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb L5c5c
L1b7e::
    and eax, 01h
    mov al, byte ptr [D6ba0]
    je L1b8a
    inc al
L1b8a::
    sub al, 02h
    sbb al, 00h
    and al, 03h
    mov byte ptr [D6ba0], al
L1b95::
    or al, al
    je L1be1
    test al, 02h
    jne L1bbf
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [D6bdc]
    jb L5c68
L1bb1::
    and eax, dword ptr [D6bd8]
    mov edx, dword ptr [D6afc]
    jmp L1c01
L1bbf::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [D6bde]
    jb L5c74
L1bd3::
    and eax, dword ptr [D6bd4]
    mov edx, dword ptr [D6b04]
    jmp L1c01
L1be1::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [D6bdd]
    jb L5c80
L1bf5::
    and eax, dword ptr [D6bd0]
    mov edx, dword ptr [D6b98]
L1c01::
    shl eax, 03h
    add edx, eax
    mov eax, dword ptr [edx]
    mov dword ptr [edi+08h], eax
    mov eax, dword ptr [edx+04h]
    mov dword ptr [edi+0508h], eax
    test byte ptr [D6b14], 020h
    je L2036
L1c21::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb L5c8c
L1c2e::
    and eax, 01h
    jne L1c3a
    mov al, byte ptr [D6ba0]
    jmp L1c5e
L1c3a::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb L5c98
L1c47::
    and eax, 01h
    mov al, byte ptr [D6ba0]
    je L1c53
    inc al
L1c53::
    sub al, 02h
    sbb al, 00h
    and al, 03h
    mov byte ptr [D6ba0], al
L1c5e::
    or al, al
    je L1caa
    test al, 02h
    jne L1c88
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [D6bdc]
    jb L5ca4
L1c7a::
    and eax, dword ptr [D6bd8]
    mov edx, dword ptr [D6afc]
    jmp L1cca
L1c88::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [D6bde]
    jb L5cb0
L1c9c::
    and eax, dword ptr [D6bd4]
    mov edx, dword ptr [D6b04]
    jmp L1cca
L1caa::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [D6bdd]
    jb L5cbc
L1cbe::
    and eax, dword ptr [D6bd0]
    mov edx, dword ptr [D6b98]
L1cca::
    shl eax, 03h
    add edx, eax
    mov eax, dword ptr [edx]
    mov dword ptr [edi+0ch], eax
    mov eax, dword ptr [edx+04h]
    mov dword ptr [edi+050ch], eax
    test byte ptr [D6b14], 04h
    je L2043
L1cea::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb L5cc8
L1cf7::
    and eax, 01h
    jne L1d03
    mov al, byte ptr [D6ba0]
    jmp L1d27
L1d03::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb L5cd4
L1d10::
    and eax, 01h
    mov al, byte ptr [D6ba0]
    je L1d1c
    inc al
L1d1c::
    sub al, 02h
    sbb al, 00h
    and al, 03h
    mov byte ptr [D6ba0], al
L1d27::
    or al, al
    je L1d73
    test al, 02h
    jne L1d51
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [D6bdc]
    jb L5ce0
L1d43::
    and eax, dword ptr [D6bd8]
    mov edx, dword ptr [D6afc]
    jmp L1d93
L1d51::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [D6bde]
    jb L5cec
L1d65::
    and eax, dword ptr [D6bd4]
    mov edx, dword ptr [D6b04]
    jmp L1d93
L1d73::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [D6bdd]
    jb L5cf8
L1d87::
    and eax, dword ptr [D6bd0]
    mov edx, dword ptr [D6b98]
L1d93::
    shl eax, 03h
    add edx, eax
    mov eax, dword ptr [edx]
    mov dword ptr [edi+0a00h], eax
    mov eax, dword ptr [edx+04h]
    mov dword ptr [edi+0f00h], eax
    test byte ptr [D6b14], 08h
    je L2050
L1db6::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb L5d04
L1dc3::
    and eax, 01h
    jne L1dcf
    mov al, byte ptr [D6ba0]
    jmp L1df3
L1dcf::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb L5d10
L1ddc::
    and eax, 01h
    mov al, byte ptr [D6ba0]
    je L1de8
    inc al
L1de8::
    sub al, 02h
    sbb al, 00h
    and al, 03h
    mov byte ptr [D6ba0], al
L1df3::
    or al, al
    je L1e3f
    test al, 02h
    jne L1e1d
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [D6bdc]
    jb L5d1c
L1e0f::
    and eax, dword ptr [D6bd8]
    mov edx, dword ptr [D6afc]
    jmp L1e5f
L1e1d::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [D6bde]
    jb L5d28
L1e31::
    and eax, dword ptr [D6bd4]
    mov edx, dword ptr [D6b04]
    jmp L1e5f
L1e3f::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [D6bdd]
    jb L5d34
L1e53::
    and eax, dword ptr [D6bd0]
    mov edx, dword ptr [D6b98]
L1e5f::
    shl eax, 03h
    add edx, eax
    mov eax, dword ptr [edx]
    mov dword ptr [edi+0a04h], eax
    mov eax, dword ptr [edx+04h]
    mov dword ptr [edi+0f04h], eax
    test byte ptr [D6b14], 040h
    je L205d
L1e82::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb L5d40
L1e8f::
    and eax, 01h
    jne L1e9b
    mov al, byte ptr [D6ba0]
    jmp L1ebf
L1e9b::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb L5d4c
L1ea8::
    and eax, 01h
    mov al, byte ptr [D6ba0]
    je L1eb4
    inc al
L1eb4::
    sub al, 02h
    sbb al, 00h
    and al, 03h
    mov byte ptr [D6ba0], al
L1ebf::
    or al, al
    je L1f0b
    test al, 02h
    jne L1ee9
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [D6bdc]
    jb L5d58
L1edb::
    and eax, dword ptr [D6bd8]
    mov edx, dword ptr [D6afc]
    jmp L1f2b
L1ee9::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [D6bde]
    jb L5d64
L1efd::
    and eax, dword ptr [D6bd4]
    mov edx, dword ptr [D6b04]
    jmp L1f2b
L1f0b::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [D6bdd]
    jb L5d70
L1f1f::
    and eax, dword ptr [D6bd0]
    mov edx, dword ptr [D6b98]
L1f2b::
    shl eax, 03h
    add edx, eax
    mov eax, dword ptr [edx]
    mov dword ptr [edi+0a08h], eax
    mov eax, dword ptr [edx+04h]
    mov dword ptr [edi+0f08h], eax
    test byte ptr [D6b14], 080h
    je L206a
L1f4e::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb L5d7c
L1f5b::
    and eax, 01h
    jne L1f67
    mov al, byte ptr [D6ba0]
    jmp L1f8b
L1f67::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb L5d88
L1f74::
    and eax, 01h
    mov al, byte ptr [D6ba0]
    je L1f80
    inc al
L1f80::
    sub al, 02h
    sbb al, 00h
    and al, 03h
    mov byte ptr [D6ba0], al
L1f8b::
    or al, al
    je L1fd7
    test al, 02h
    jne L1fb5
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [D6bdc]
    jb L5d94
L1fa7::
    and eax, dword ptr [D6bd8]
    mov edx, dword ptr [D6afc]
    jmp L1ff7
L1fb5::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [D6bde]
    jb L5da0
L1fc9::
    and eax, dword ptr [D6bd4]
    mov edx, dword ptr [D6b04]
    jmp L1ff7
L1fd7::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [D6bdd]
    jb L5dac
L1feb::
    and eax, dword ptr [D6bd0]
    mov edx, dword ptr [D6b98]
L1ff7::
    shl eax, 03h
    add edx, eax
    mov eax, dword ptr [edx]
    mov dword ptr [edi+0a0ch], eax
    mov eax, dword ptr [edx+04h]
    mov dword ptr [edi+0f0ch], eax
    jmp L2077
L200f::
    test byte ptr [D6b14], 01h
    jne L19c7
L201c::
    test byte ptr [D6b14], 02h
    jne L1a8f
L2029::
    test byte ptr [D6b14], 010h
    jne L1b58
L2036::
    test byte ptr [D6b14], 020h
    jne L1c21
L2043::
    test byte ptr [D6b14], 04h
    jne L1cea
L2050::
    test byte ptr [D6b14], 08h
    jne L1db6
L205d::
    test byte ptr [D6b14], 040h
    jne L1e82
L206a::
    test byte ptr [D6b14], 080h
    jne L1f4e
L2077::
    test byte ptr [D6b15], 0ffh
    je L28a2
    test byte ptr [D6b15], 01h
    je L26e9
L2091::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb L5db8
L209e::
    and eax, 01h
    jne L20aa
    mov al, byte ptr [D6ba0]
    jmp L20ce
L20aa::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb L5dc4
L20b7::
    and eax, 01h
    mov al, byte ptr [D6ba0]
    je L20c3
    inc al
L20c3::
    sub al, 02h
    sbb al, 00h
    and al, 03h
    mov byte ptr [D6ba0], al
L20ce::
    or al, al
    je L211a
    test al, 02h
    jne L20f8
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [D6bdc]
    jb L5dd0
L20ea::
    and eax, dword ptr [D6bd8]
    mov edx, dword ptr [D6afc]
    jmp L213a
L20f8::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [D6bde]
    jb L5ddc
L210c::
    and eax, dword ptr [D6bd4]
    mov edx, dword ptr [D6b04]
    jmp L213a
L211a::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [D6bdd]
    jb L5de8
L212e::
    and eax, dword ptr [D6bd0]
    mov edx, dword ptr [D6b98]
L213a::
    shl eax, 03h
    add edx, eax
    mov eax, dword ptr [edx]
    mov dword ptr [edi+01400h], eax
    mov eax, dword ptr [edx+04h]
    mov dword ptr [edi+01900h], eax
    test byte ptr [D6b15], 02h
    je L26f6
L215d::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb L5df4
L216a::
    and eax, 01h
    jne L2176
    mov al, byte ptr [D6ba0]
    jmp L219a
L2176::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb L5e00
L2183::
    and eax, 01h
    mov al, byte ptr [D6ba0]
    je L218f
    inc al
L218f::
    sub al, 02h
    sbb al, 00h
    and al, 03h
    mov byte ptr [D6ba0], al
L219a::
    or al, al
    je L21e6
    test al, 02h
    jne L21c4
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [D6bdc]
    jb L5e0c
L21b6::
    and eax, dword ptr [D6bd8]
    mov edx, dword ptr [D6afc]
    jmp L2206
L21c4::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [D6bde]
    jb L5e18
L21d8::
    and eax, dword ptr [D6bd4]
    mov edx, dword ptr [D6b04]
    jmp L2206
L21e6::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [D6bdd]
    jb L5e24
L21fa::
    and eax, dword ptr [D6bd0]
    mov edx, dword ptr [D6b98]
L2206::
    shl eax, 03h
    add edx, eax
    mov eax, dword ptr [edx]
    mov dword ptr [edi+01404h], eax
    mov eax, dword ptr [edx+04h]
    mov dword ptr [edi+01904h], eax
    test byte ptr [D6b15], 010h
    je L2703
L2229::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb L5e30
L2236::
    and eax, 01h
    jne L2242
    mov al, byte ptr [D6ba0]
    jmp L2266
L2242::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb L5e3c
L224f::
    and eax, 01h
    mov al, byte ptr [D6ba0]
    je L225b
    inc al
L225b::
    sub al, 02h
    sbb al, 00h
    and al, 03h
    mov byte ptr [D6ba0], al
L2266::
    or al, al
    je L22b2
    test al, 02h
    jne L2290
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [D6bdc]
    jb L5e48
L2282::
    and eax, dword ptr [D6bd8]
    mov edx, dword ptr [D6afc]
    jmp L22d2
L2290::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [D6bde]
    jb L5e54
L22a4::
    and eax, dword ptr [D6bd4]
    mov edx, dword ptr [D6b04]
    jmp L22d2
L22b2::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [D6bdd]
    jb L5e60
L22c6::
    and eax, dword ptr [D6bd0]
    mov edx, dword ptr [D6b98]
L22d2::
    shl eax, 03h
    add edx, eax
    mov eax, dword ptr [edx]
    mov dword ptr [edi+01408h], eax
    mov eax, dword ptr [edx+04h]
    mov dword ptr [edi+01908h], eax
    test byte ptr [D6b15], 020h
    je L2710
L22f5::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb L5e6c
L2302::
    and eax, 01h
    jne L230e
    mov al, byte ptr [D6ba0]
    jmp L2332
L230e::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb L5e78
L231b::
    and eax, 01h
    mov al, byte ptr [D6ba0]
    je L2327
    inc al
L2327::
    sub al, 02h
    sbb al, 00h
    and al, 03h
    mov byte ptr [D6ba0], al
L2332::
    or al, al
    je L237e
    test al, 02h
    jne L235c
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [D6bdc]
    jb L5e84
L234e::
    and eax, dword ptr [D6bd8]
    mov edx, dword ptr [D6afc]
    jmp L239e
L235c::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [D6bde]
    jb L5e90
L2370::
    and eax, dword ptr [D6bd4]
    mov edx, dword ptr [D6b04]
    jmp L239e
L237e::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [D6bdd]
    jb L5e9c
L2392::
    and eax, dword ptr [D6bd0]
    mov edx, dword ptr [D6b98]
L239e::
    shl eax, 03h
    add edx, eax
    mov eax, dword ptr [edx]
    mov dword ptr [edi+0140ch], eax
    mov eax, dword ptr [edx+04h]
    mov dword ptr [edi+0190ch], eax
    test byte ptr [D6b15], 04h
    je L271d
L23c1::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb L5ea8
L23ce::
    and eax, 01h
    jne L23da
    mov al, byte ptr [D6ba0]
    jmp L23fe
L23da::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb L5eb4
L23e7::
    and eax, 01h
    mov al, byte ptr [D6ba0]
    je L23f3
    inc al
L23f3::
    sub al, 02h
    sbb al, 00h
    and al, 03h
    mov byte ptr [D6ba0], al
L23fe::
    or al, al
    je L244a
    test al, 02h
    jne L2428
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [D6bdc]
    jb L5ec0
L241a::
    and eax, dword ptr [D6bd8]
    mov edx, dword ptr [D6afc]
    jmp L246a
L2428::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [D6bde]
    jb L5ecc
L243c::
    and eax, dword ptr [D6bd4]
    mov edx, dword ptr [D6b04]
    jmp L246a
L244a::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [D6bdd]
    jb L5ed8
L245e::
    and eax, dword ptr [D6bd0]
    mov edx, dword ptr [D6b98]
L246a::
    shl eax, 03h
    add edx, eax
    mov eax, dword ptr [edx]
    mov dword ptr [edi+01e00h], eax
    mov eax, dword ptr [edx+04h]
    mov dword ptr [edi+02300h], eax
    test byte ptr [D6b15], 08h
    je L272a
L248d::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb L5ee4
L249a::
    and eax, 01h
    jne L24a6
    mov al, byte ptr [D6ba0]
    jmp L24ca
L24a6::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb L5ef0
L24b3::
    and eax, 01h
    mov al, byte ptr [D6ba0]
    je L24bf
    inc al
L24bf::
    sub al, 02h
    sbb al, 00h
    and al, 03h
    mov byte ptr [D6ba0], al
L24ca::
    or al, al
    je L2516
    test al, 02h
    jne L24f4
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [D6bdc]
    jb L5efc
L24e6::
    and eax, dword ptr [D6bd8]
    mov edx, dword ptr [D6afc]
    jmp L2536
L24f4::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [D6bde]
    jb L5f08
L2508::
    and eax, dword ptr [D6bd4]
    mov edx, dword ptr [D6b04]
    jmp L2536
L2516::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [D6bdd]
    jb L5f14
L252a::
    and eax, dword ptr [D6bd0]
    mov edx, dword ptr [D6b98]
L2536::
    shl eax, 03h
    add edx, eax
    mov eax, dword ptr [edx]
    mov dword ptr [edi+01e04h], eax
    mov eax, dword ptr [edx+04h]
    mov dword ptr [edi+02304h], eax
    test byte ptr [D6b15], 040h
    je L2737
L2559::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb L5f20
L2566::
    and eax, 01h
    jne L2572
    mov al, byte ptr [D6ba0]
    jmp L2596
L2572::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb L5f2c
L257f::
    and eax, 01h
    mov al, byte ptr [D6ba0]
    je L258b
    inc al
L258b::
    sub al, 02h
    sbb al, 00h
    and al, 03h
    mov byte ptr [D6ba0], al
L2596::
    or al, al
    je L25e2
    test al, 02h
    jne L25c0
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [D6bdc]
    jb L5f38
L25b2::
    and eax, dword ptr [D6bd8]
    mov edx, dword ptr [D6afc]
    jmp L2602
L25c0::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [D6bde]
    jb L5f44
L25d4::
    and eax, dword ptr [D6bd4]
    mov edx, dword ptr [D6b04]
    jmp L2602
L25e2::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [D6bdd]
    jb L5f50
L25f6::
    and eax, dword ptr [D6bd0]
    mov edx, dword ptr [D6b98]
L2602::
    shl eax, 03h
    add edx, eax
    mov eax, dword ptr [edx]
    mov dword ptr [edi+01e08h], eax
    mov eax, dword ptr [edx+04h]
    mov dword ptr [edi+02308h], eax
    test byte ptr [D6b15], 080h
    je L2744
L2625::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb L5f5c
L2632::
    and eax, 01h
    jne L263e
    mov al, byte ptr [D6ba0]
    jmp L2662
L263e::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb L5f68
L264b::
    and eax, 01h
    mov al, byte ptr [D6ba0]
    je L2657
    inc al
L2657::
    sub al, 02h
    sbb al, 00h
    and al, 03h
    mov byte ptr [D6ba0], al
L2662::
    or al, al
    je L26ae
    test al, 02h
    jne L268c
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [D6bdc]
    jb L5f74
L267e::
    and eax, dword ptr [D6bd8]
    mov edx, dword ptr [D6afc]
    jmp L26ce
L268c::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [D6bde]
    jb L5f80
L26a0::
    and eax, dword ptr [D6bd4]
    mov edx, dword ptr [D6b04]
    jmp L26ce
L26ae::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [D6bdd]
    jb L5f8c
L26c2::
    and eax, dword ptr [D6bd0]
    mov edx, dword ptr [D6b98]
L26ce::
    shl eax, 03h
    add edx, eax
    mov eax, dword ptr [edx]
    mov dword ptr [edi+01e0ch], eax
    mov eax, dword ptr [edx+04h]
    mov dword ptr [edi+0230ch], eax
    jmp L28a2
L26e9::
    test byte ptr [D6b15], 01h
    jne L2091
L26f6::
    test byte ptr [D6b15], 02h
    jne L215d
L2703::
    test byte ptr [D6b15], 010h
    jne L2229
L2710::
    test byte ptr [D6b15], 020h
    jne L22f5
L271d::
    test byte ptr [D6b15], 04h
    jne L23c1
L272a::
    test byte ptr [D6b15], 08h
    jne L248d
L2737::
    test byte ptr [D6b15], 040h
    jne L2559
L2744::
    test byte ptr [D6b15], 080h
    jne L2625
    jmp L28a2
L2756::
    test dword ptr [frame_flags], 010000h
    jne L288d
    jmp L28a2
L276b::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb L5f98
L2778::
    and eax, 01h
    jne L2784
    mov al, byte ptr [D6ba0]
    jmp L27a8
L2784::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb L5fa4
L2791::
    and eax, 01h
    mov al, byte ptr [D6ba0]
    je L279d
    inc al
L279d::
    sub al, 02h
    sbb al, 00h
    and al, 03h
    mov byte ptr [D6ba0], al
L27a8::
    or al, al
    je L2824
    test al, 02h
    jne L27d2
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [D6bdc]
    jb L5fb0
L27c4::
    and eax, dword ptr [D6bd8]
    mov edx, dword ptr [D6afc]
    jmp L27f2
L27d2::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [D6bde]
    jb L5fbc
L27e6::
    and eax, dword ptr [D6bd4]
    mov edx, dword ptr [D6b04]
L27f2::
    shl eax, 03h
    add edx, eax
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 04h
    jb L5fc8
L2808::
    and eax, 0fh
    mov dword ptr [D6ae8], esi
    mov dword ptr [D6af0], ebp
    mov dword ptr [D6aec], ecx
    mov ebx, dword ptr [edx]
    mov esi, dword ptr [edx+04h]
    jmp L2874
L2824::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [D6bdd]
    jb L5fd4
L2838::
    and eax, dword ptr [D6bd0]
    mov edx, dword ptr [D6b98]
    shl eax, 03h
    add edx, eax
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 04h
    jb L5fe0
L285a::
    and eax, 0fh
    mov dword ptr [D6ae8], esi
    mov dword ptr [D6af0], ebp
    mov dword ptr [D6aec], ecx
    mov ebx, dword ptr [edx]
    mov esi, dword ptr [edx+04h]
L2874::
    call dword ptr [eax*4+pass1_writers]
    mov esi, dword ptr [D6ae8]
    mov ecx, dword ptr [D6aec]
    mov ebp, dword ptr [D6af0]
L288d::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb L5fec
L289a::
    test al, 01h
    je L276b
L28a2::
    mov edx, 01h
    mov edi, dword ptr [D6af8]
    jmp L1381
L28b2::
    mov dword ptr [D6af8], edi
    lea edi, [D6be4]
    jmp L148b
L28c3::
    cmp bx, word ptr [current_bank]
    jne L58ac
L28d0::
    cmp dword ptr [D6ba8], 00h
    jne L290b
    mov eax, dword ptr [D6bbc]
    mov dword ptr [D6ba8], eax
    mov eax, dword ptr [D6bcc]
    mov dword ptr [D6bb8], eax
    mov eax, dword ptr [D6bc0]
    mov dword ptr [D6bac], eax
    mov eax, dword ptr [D6bc8]
    mov dword ptr [D6bb4], eax
    mov eax, dword ptr [D6bc4]
    mov dword ptr [D6bb0], eax
L290b::
    mov dword ptr [D6af8], edi
    and edi, 0ffffh
    or edi, dword ptr [frame_buffer]
    mov dword ptr [D6b14], 00h
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb L5ff8
L2934::
    test al, 01h
    jne L2cfd
L293c::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb L6004
L2949::
    and eax, 01h
    jne L2955
    mov al, byte ptr [D6ba0]
    jmp L2979
L2955::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb L6010
L2962::
    and eax, 01h
    mov al, byte ptr [D6ba0]
    je L296e
    inc al
L296e::
    sub al, 02h
    sbb al, 00h
    and al, 03h
    mov byte ptr [D6ba0], al
L2979::
    or al, al
    je L29f9
    test al, 02h
    jne L29a3
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [D6bdc]
    jb L601c
L2995::
    and eax, dword ptr [D6bd8]
    mov edx, dword ptr [D6afc]
    jmp L29c3
L29a3::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [D6bde]
    jb L6028
L29b7::
    and eax, dword ptr [D6bd4]
    mov edx, dword ptr [D6b04]
L29c3::
    shl eax, 03h
    add edx, eax
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 011h
    jae L29db
    add esi, 04h
    or cl, 0e0h
L29db::
    and eax, 01ffffh
    mov dword ptr [D6ae8], esi
    mov dword ptr [D6af0], ebp
    mov dword ptr [D6aec], ecx
    mov ebx, dword ptr [edx]
    mov esi, dword ptr [edx+04h]
    jmp L2a4d
L29f9::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [D6bdd]
    jb L6034
L2a0d::
    and eax, dword ptr [D6bd0]
    mov edx, dword ptr [D6b98]
    shl eax, 03h
    add edx, eax
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 011h
    jae L2a31
    add esi, 04h
    or cl, 0e0h
L2a31::
    and eax, 01ffffh
    mov dword ptr [D6ae8], esi
    mov dword ptr [D6af0], ebp
    mov dword ptr [D6aec], ecx
    mov ebx, dword ptr [edx]
    mov esi, dword ptr [edx+04h]
L2a4d::
    or dword ptr [D6b14], eax
    test al, al
    je L2b86
    test al, 01h
    je L2b4e
L2a63::
    mov dword ptr [edi], ebx
    cmp di, 0fb00h
    jae L2a72
    mov dword ptr [edi+0500h], esi
L2a72::
    test al, 02h
    je L2b56
L2a7a::
    cmp di, 0fffch
    jae L2a90
    mov dword ptr [edi+04h], ebx
    cmp di, 0fafch
    jae L2a90
    mov dword ptr [edi+0504h], esi
L2a90::
    test al, 010h
    je L2b5e
L2a98::
    cmp di, 0fff8h
    jae L2aae
    mov dword ptr [edi+08h], ebx
    cmp di, 0faf8h
    jae L2aae
    mov dword ptr [edi+0508h], esi
L2aae::
    test al, 020h
    je L2b66
L2ab6::
    cmp di, 0fff4h
    jae L2acc
    mov dword ptr [edi+0ch], ebx
    cmp di, 0faf4h
    jae L2acc
    mov dword ptr [edi+050ch], esi
L2acc::
    test al, 04h
    je L2b6e
L2ad4::
    cmp di, 0f600h
    jae L2aee
    mov dword ptr [edi+0a00h], ebx
    cmp di, 0f100h
    jae L2aee
    mov dword ptr [edi+0f00h], esi
L2aee::
    test al, 08h
    je L2b76
L2af6::
    cmp di, 0f5fch
    jae L2b10
    mov dword ptr [edi+0a04h], ebx
    cmp di, 0f0fch
    jae L2b10
    mov dword ptr [edi+0f04h], esi
L2b10::
    test al, 040h
    je L2b7e
L2b14::
    cmp di, 0f5f8h
    jae L2b2e
    mov dword ptr [edi+0a08h], ebx
    cmp di, 0f0f8h
    jae L2b2e
    mov dword ptr [edi+0f08h], esi
L2b2e::
    test al, 080h
    je L2b82
L2b32::
    cmp di, 0f5f4h
    jae L2b4c
    mov dword ptr [edi+0a0ch], ebx
    cmp di, 0f0f4h
    jae L2b4c
    mov dword ptr [edi+0f0ch], esi
L2b4c::
    jmp L2b86
L2b4e::
    test al, 01h
    jne L2a63
L2b56::
    test al, 02h
    jne L2a7a
L2b5e::
    test al, 010h
    jne L2a98
L2b66::
    test al, 020h
    jne L2ab6
L2b6e::
    test al, 04h
    jne L2ad4
L2b76::
    test al, 08h
    jne L2af6
L2b7e::
    test al, 040h
    jne L2b14
L2b82::
    test al, 080h
    jne L2b32
L2b86::
    test ah, ah
    je L2ce0
    test ah, 01h
    je L2ca0
L2b97::
    cmp di, 0ec00h
    jae L2bb1
    mov dword ptr [edi+01400h], ebx
    cmp di, 0e700h
    jae L2bb1
    mov dword ptr [edi+01900h], esi
L2bb1::
    test ah, 02h
    je L2ca9
L2bba::
    cmp di, 0ebfch
    jae L2bd4
    mov dword ptr [edi+01404h], ebx
    cmp di, 0e6fch
    jae L2bd4
    mov dword ptr [edi+01904h], esi
L2bd4::
    test ah, 010h
    je L2cb2
L2bdd::
    cmp di, 0ebf8h
    jae L2bf7
    mov dword ptr [edi+01408h], ebx
    cmp di, 0e6f8h
    jae L2bf7
    mov dword ptr [edi+01908h], esi
L2bf7::
    test ah, 020h
    je L2cbb
L2c00::
    cmp di, 0ebf4h
    jae L2c1a
    mov dword ptr [edi+0140ch], ebx
    cmp di, 0e6f4h
    jae L2c1a
    mov dword ptr [edi+0190ch], esi
L2c1a::
    test ah, 04h
    je L2cc4
L2c23::
    cmp di, 0e200h
    jae L2c3d
    mov dword ptr [edi+01e00h], ebx
    cmp di, 0dd00h
    jae L2c3d
    mov dword ptr [edi+02300h], esi
L2c3d::
    test ah, 08h
    je L2ccd
L2c46::
    cmp di, 0e1fch
    jae L2c60
    mov dword ptr [edi+01e04h], ebx
    cmp di, 0dcfch
    jae L2c60
    mov dword ptr [edi+02304h], esi
L2c60::
    test ah, 040h
    je L2cd6
L2c65::
    cmp di, 0e1f8h
    jae L2c7f
    mov dword ptr [edi+01e08h], ebx
    cmp di, 0dcf8h
    jae L2c7f
    mov dword ptr [edi+02308h], esi
L2c7f::
    test ah, 080h
    je L2cdb
L2c84::
    cmp di, 0e1f4h
    jae L2c9e
    mov dword ptr [edi+01e0ch], ebx
    cmp di, 0dcf4h
    jae L2c9e
    mov dword ptr [edi+0230ch], esi
L2c9e::
    jmp L2ce0
L2ca0::
    test ah, 01h
    jne L2b97
L2ca9::
    test ah, 02h
    jne L2bba
L2cb2::
    test ah, 010h
    jne L2bdd
L2cbb::
    test ah, 020h
    jne L2c00
L2cc4::
    test ah, 04h
    jne L2c23
L2ccd::
    test ah, 08h
    jne L2c46
L2cd6::
    test ah, 040h
    jne L2c65
L2cdb::
    test ah, 080h
    jne L2c84
L2ce0::
    mov esi, dword ptr [D6ae8]
    mov ecx, dword ptr [D6aec]
    mov ebp, dword ptr [D6af0]
    and eax, 010000h
    je L293c
L2cfd::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb L6040
L2d0a::
    test al, 01h
    jne L3de8
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 04h
    jb L604c
L2d23::
    and eax, 0fh
    jmp dword ptr [eax*4+pass2_codes]
pass1_decode endp
pass2_codes dword offset pass2_decode
    dword offset L2d8b
    dword offset L2dac
    dword offset L2dd0
    dword offset L2df0
    dword offset L2e12
    dword offset L2e39
    dword offset L2e5c
    dword offset L2e80
    dword offset L2e9f
    dword offset L2ec3
    dword offset L2ee9
    dword offset L2f09
    dword offset L2f24
    dword offset L2f45
    dword offset L2f63
pass2_decode proc near
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 010h
    jae L2d80
    add esi, 04h
    or cl, 0e0h
L2d80::
    xor dword ptr [D6b14], eax
    jmp L2f69
L2d8b::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 0ch
    jb L6058
L2d9c::
    shl eax, 04h
    or al, 0fh
    xor dword ptr [D6b14], eax
    jmp L2f69
L2dac::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 0ch
    jb L6064
L2dbd::
    shl eax, 04h
    shr al, 04h
    or al, 0f0h
    xor dword ptr [D6b14], eax
    jmp L2f69
L2dd0::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 08h
    jb L6070
L2de1::
    mov ah, al
    mov al, 0ffh
    xor dword ptr [D6b14], eax
    jmp L2f69
L2df0::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 0ch
    jb L607c
L2e01::
    shl ah, 04h
    or ah, 0fh
    xor dword ptr [D6b14], eax
    jmp L2f69
L2e12::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 08h
    jb L6088
L2e23::
    shl eax, 04h
    shl ah, 04h
    or eax, 0f0fh
    xor dword ptr [D6b14], eax
    jmp L2f69
L2e39::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 08h
    jb L6094
L2e4a::
    mov ah, al
    or eax, 0ff0h
    xor dword ptr [D6b14], eax
    jmp L2f69
L2e5c::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 04h
    jb L60a0
L2e6d::
    shl eax, 0ch
    or eax, 0fffh
    xor dword ptr [D6b14], eax
    jmp L2f69
L2e80::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 0ch
    jb L60ac
L2e91::
    or ah, 0f0h
    xor dword ptr [D6b14], eax
    jmp L2f69
L2e9f::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 08h
    jb L60b8
L2eb0::
    shl eax, 04h
    or eax, 0f00fh
    xor dword ptr [D6b14], eax
    jmp L2f69
L2ec3::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 08h
    jb L60c4
L2ed4::
    mov ah, al
    ror ah, 04h
    or eax, 0f0f0h
    xor dword ptr [D6b14], eax
    jmp L2f69
L2ee9::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 04h
    jb L60d0
L2efa::
    mov ah, al
    or eax, 0f0ffh
    xor dword ptr [D6b14], eax
    jmp L2f69
L2f09::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 08h
    jb L60dc
L2f1a::
    mov ah, 0ffh
    xor dword ptr [D6b14], eax
    jmp L2f69
L2f24::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 04h
    jb L60e8
L2f35::
    or eax, 0fff0h
    rol al, 04h
    xor dword ptr [D6b14], eax
    jmp L2f69
L2f45::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 04h
    jb L60f4
L2f56::
    or eax, 0fff0h
    xor dword ptr [D6b14], eax
    jmp L2f69
L2f63::
    not dword ptr [D6b14]
L2f69::
    test byte ptr [D6b14], 0ffh
    je L3699
    test byte ptr [D6b14], 01h
    je L3631
L2f83::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb L6100
L2f90::
    and eax, 01h
    jne L2f9c
    mov al, byte ptr [D6ba0]
    jmp L2fc0
L2f9c::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb L610c
L2fa9::
    and eax, 01h
    mov al, byte ptr [D6ba0]
    je L2fb5
    inc al
L2fb5::
    sub al, 02h
    sbb al, 00h
    and al, 03h
    mov byte ptr [D6ba0], al
L2fc0::
    or al, al
    je L300c
    test al, 02h
    jne L2fea
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [D6bdc]
    jb L6118
L2fdc::
    and eax, dword ptr [D6bd8]
    mov edx, dword ptr [D6afc]
    jmp L302c
L2fea::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [D6bde]
    jb L6124
L2ffe::
    and eax, dword ptr [D6bd4]
    mov edx, dword ptr [D6b04]
    jmp L302c
L300c::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [D6bdd]
    jb L6130
L3020::
    and eax, dword ptr [D6bd0]
    mov edx, dword ptr [D6b98]
L302c::
    shl eax, 03h
    add edx, eax
    mov eax, dword ptr [edx]
    mov dword ptr [edi], eax
    cmp di, 0fb00h
    jae L3045
    mov eax, dword ptr [edx+04h]
    mov dword ptr [edi+0500h], eax
L3045::
    test byte ptr [D6b14], 02h
    je L363e
L3052::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb L613c
L305f::
    and eax, 01h
    jne L306b
    mov al, byte ptr [D6ba0]
    jmp L308f
L306b::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb L6148
L3078::
    and eax, 01h
    mov al, byte ptr [D6ba0]
    je L3084
    inc al
L3084::
    sub al, 02h
    sbb al, 00h
    and al, 03h
    mov byte ptr [D6ba0], al
L308f::
    or al, al
    je L30db
    test al, 02h
    jne L30b9
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [D6bdc]
    jb L6154
L30ab::
    and eax, dword ptr [D6bd8]
    mov edx, dword ptr [D6afc]
    jmp L30fb
L30b9::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [D6bde]
    jb L6160
L30cd::
    and eax, dword ptr [D6bd4]
    mov edx, dword ptr [D6b04]
    jmp L30fb
L30db::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [D6bdd]
    jb L616c
L30ef::
    and eax, dword ptr [D6bd0]
    mov edx, dword ptr [D6b98]
L30fb::
    shl eax, 03h
    add edx, eax
    cmp di, 0fffch
    jae L311b
    mov eax, dword ptr [edx]
    mov dword ptr [edi+04h], eax
    cmp di, 0fafch
    jae L311b
    mov eax, dword ptr [edx+04h]
    mov dword ptr [edi+0504h], eax
L311b::
    test byte ptr [D6b14], 010h
    je L364b
L3128::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb L6178
L3135::
    and eax, 01h
    jne L3141
    mov al, byte ptr [D6ba0]
    jmp L3165
L3141::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb L6184
L314e::
    and eax, 01h
    mov al, byte ptr [D6ba0]
    je L315a
    inc al
L315a::
    sub al, 02h
    sbb al, 00h
    and al, 03h
    mov byte ptr [D6ba0], al
L3165::
    or al, al
    je L31b1
    test al, 02h
    jne L318f
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [D6bdc]
    jb L6190
L3181::
    and eax, dword ptr [D6bd8]
    mov edx, dword ptr [D6afc]
    jmp L31d1
L318f::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [D6bde]
    jb L619c
L31a3::
    and eax, dword ptr [D6bd4]
    mov edx, dword ptr [D6b04]
    jmp L31d1
L31b1::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [D6bdd]
    jb L61a8
L31c5::
    and eax, dword ptr [D6bd0]
    mov edx, dword ptr [D6b98]
L31d1::
    shl eax, 03h
    add edx, eax
    cmp di, 0fff8h
    jae L31f1
    mov eax, dword ptr [edx]
    mov dword ptr [edi+08h], eax
    cmp di, 0faf8h
    jae L31f1
    mov eax, dword ptr [edx+04h]
    mov dword ptr [edi+0508h], eax
L31f1::
    test byte ptr [D6b14], 020h
    je L3658
L31fe::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb L61b4
L320b::
    and eax, 01h
    jne L3217
    mov al, byte ptr [D6ba0]
    jmp L323b
L3217::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb L61c0
L3224::
    and eax, 01h
    mov al, byte ptr [D6ba0]
    je L3230
    inc al
L3230::
    sub al, 02h
    sbb al, 00h
    and al, 03h
    mov byte ptr [D6ba0], al
L323b::
    or al, al
    je L3287
    test al, 02h
    jne L3265
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [D6bdc]
    jb L61cc
L3257::
    and eax, dword ptr [D6bd8]
    mov edx, dword ptr [D6afc]
    jmp L32a7
L3265::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [D6bde]
    jb L61d8
L3279::
    and eax, dword ptr [D6bd4]
    mov edx, dword ptr [D6b04]
    jmp L32a7
L3287::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [D6bdd]
    jb L61e4
L329b::
    and eax, dword ptr [D6bd0]
    mov edx, dword ptr [D6b98]
L32a7::
    shl eax, 03h
    add edx, eax
    cmp di, 0fff4h
    jae L32c7
    mov eax, dword ptr [edx]
    mov dword ptr [edi+0ch], eax
    cmp di, 0faf4h
    jae L32c7
    mov eax, dword ptr [edx+04h]
    mov dword ptr [edi+050ch], eax
L32c7::
    test byte ptr [D6b14], 04h
    je L3665
L32d4::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb L61f0
L32e1::
    and eax, 01h
    jne L32ed
    mov al, byte ptr [D6ba0]
    jmp L3311
L32ed::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb L61fc
L32fa::
    and eax, 01h
    mov al, byte ptr [D6ba0]
    je L3306
    inc al
L3306::
    sub al, 02h
    sbb al, 00h
    and al, 03h
    mov byte ptr [D6ba0], al
L3311::
    or al, al
    je L335d
    test al, 02h
    jne L333b
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [D6bdc]
    jb L6208
L332d::
    and eax, dword ptr [D6bd8]
    mov edx, dword ptr [D6afc]
    jmp L337d
L333b::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [D6bde]
    jb L6214
L334f::
    and eax, dword ptr [D6bd4]
    mov edx, dword ptr [D6b04]
    jmp L337d
L335d::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [D6bdd]
    jb L6220
L3371::
    and eax, dword ptr [D6bd0]
    mov edx, dword ptr [D6b98]
L337d::
    shl eax, 03h
    add edx, eax
    cmp di, 0f600h
    jae L33a1
    mov eax, dword ptr [edx]
    mov dword ptr [edi+0a00h], eax
    cmp di, 0f100h
    jae L33a1
    mov eax, dword ptr [edx+04h]
    mov dword ptr [edi+0f00h], eax
L33a1::
    test byte ptr [D6b14], 08h
    je L3672
L33ae::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb L622c
L33bb::
    and eax, 01h
    jne L33c7
    mov al, byte ptr [D6ba0]
    jmp L33eb
L33c7::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb L6238
L33d4::
    and eax, 01h
    mov al, byte ptr [D6ba0]
    je L33e0
    inc al
L33e0::
    sub al, 02h
    sbb al, 00h
    and al, 03h
    mov byte ptr [D6ba0], al
L33eb::
    or al, al
    je L3437
    test al, 02h
    jne L3415
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [D6bdc]
    jb L6244
L3407::
    and eax, dword ptr [D6bd8]
    mov edx, dword ptr [D6afc]
    jmp L3457
L3415::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [D6bde]
    jb L6250
L3429::
    and eax, dword ptr [D6bd4]
    mov edx, dword ptr [D6b04]
    jmp L3457
L3437::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [D6bdd]
    jb L625c
L344b::
    and eax, dword ptr [D6bd0]
    mov edx, dword ptr [D6b98]
L3457::
    shl eax, 03h
    add edx, eax
    cmp di, 0f5fch
    jae L347b
    mov eax, dword ptr [edx]
    mov dword ptr [edi+0a04h], eax
    cmp di, 0f0fch
    jae L347b
    mov eax, dword ptr [edx+04h]
    mov dword ptr [edi+0f04h], eax
L347b::
    test byte ptr [D6b14], 040h
    je L367f
L3488::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb L6268
L3495::
    and eax, 01h
    jne L34a1
    mov al, byte ptr [D6ba0]
    jmp L34c5
L34a1::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb L6274
L34ae::
    and eax, 01h
    mov al, byte ptr [D6ba0]
    je L34ba
    inc al
L34ba::
    sub al, 02h
    sbb al, 00h
    and al, 03h
    mov byte ptr [D6ba0], al
L34c5::
    or al, al
    je L3511
    test al, 02h
    jne L34ef
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [D6bdc]
    jb L6280
L34e1::
    and eax, dword ptr [D6bd8]
    mov edx, dword ptr [D6afc]
    jmp L3531
L34ef::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [D6bde]
    jb L628c
L3503::
    and eax, dword ptr [D6bd4]
    mov edx, dword ptr [D6b04]
    jmp L3531
L3511::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [D6bdd]
    jb L6298
L3525::
    and eax, dword ptr [D6bd0]
    mov edx, dword ptr [D6b98]
L3531::
    shl eax, 03h
    add edx, eax
    cmp di, 0f5f8h
    jae L3555
    mov eax, dword ptr [edx]
    mov dword ptr [edi+0a08h], eax
    cmp di, 0f0f8h
    jae L3555
    mov eax, dword ptr [edx+04h]
    mov dword ptr [edi+0f08h], eax
L3555::
    test byte ptr [D6b14], 080h
    je L368c
L3562::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb L62a4
L356f::
    and eax, 01h
    jne L357b
    mov al, byte ptr [D6ba0]
    jmp L359f
L357b::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb L62b0
L3588::
    and eax, 01h
    mov al, byte ptr [D6ba0]
    je L3594
    inc al
L3594::
    sub al, 02h
    sbb al, 00h
    and al, 03h
    mov byte ptr [D6ba0], al
L359f::
    or al, al
    je L35eb
    test al, 02h
    jne L35c9
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [D6bdc]
    jb L62bc
L35bb::
    and eax, dword ptr [D6bd8]
    mov edx, dword ptr [D6afc]
    jmp L360b
L35c9::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [D6bde]
    jb L62c8
L35dd::
    and eax, dword ptr [D6bd4]
    mov edx, dword ptr [D6b04]
    jmp L360b
L35eb::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [D6bdd]
    jb L62d4
L35ff::
    and eax, dword ptr [D6bd0]
    mov edx, dword ptr [D6b98]
L360b::
    shl eax, 03h
    add edx, eax
    cmp di, 0f5f4h
    jae L362f
    mov eax, dword ptr [edx]
    mov dword ptr [edi+0a0ch], eax
    cmp di, 0f0f4h
    jae L362f
    mov eax, dword ptr [edx+04h]
    mov dword ptr [edi+0f0ch], eax
L362f::
    jmp L3699
L3631::
    test byte ptr [D6b14], 01h
    jne L2f83
L363e::
    test byte ptr [D6b14], 02h
    jne L3052
L364b::
    test byte ptr [D6b14], 010h
    jne L3128
L3658::
    test byte ptr [D6b14], 020h
    jne L31fe
L3665::
    test byte ptr [D6b14], 04h
    jne L32d4
L3672::
    test byte ptr [D6b14], 08h
    jne L33ae
L367f::
    test byte ptr [D6b14], 040h
    jne L3488
L368c::
    test byte ptr [D6b14], 080h
    jne L3562
L3699::
    test byte ptr [D6b15], 0ffh
    je L3f34
    test byte ptr [D6b15], 01h
    je L3d7b
L36b3::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb L62e0
L36c0::
    and eax, 01h
    jne L36cc
    mov al, byte ptr [D6ba0]
    jmp L36f0
L36cc::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb L62ec
L36d9::
    and eax, 01h
    mov al, byte ptr [D6ba0]
    je L36e5
    inc al
L36e5::
    sub al, 02h
    sbb al, 00h
    and al, 03h
    mov byte ptr [D6ba0], al
L36f0::
    or al, al
    je L373c
    test al, 02h
    jne L371a
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [D6bdc]
    jb L62f8
L370c::
    and eax, dword ptr [D6bd8]
    mov edx, dword ptr [D6afc]
    jmp L375c
L371a::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [D6bde]
    jb L6304
L372e::
    and eax, dword ptr [D6bd4]
    mov edx, dword ptr [D6b04]
    jmp L375c
L373c::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [D6bdd]
    jb L6310
L3750::
    and eax, dword ptr [D6bd0]
    mov edx, dword ptr [D6b98]
L375c::
    shl eax, 03h
    add edx, eax
    cmp di, 0ec00h
    jae L3780
    mov eax, dword ptr [edx]
    mov dword ptr [edi+01400h], eax
    cmp di, 0e700h
    jae L3780
    mov eax, dword ptr [edx+04h]
    mov dword ptr [edi+01900h], eax
L3780::
    test byte ptr [D6b15], 02h
    je L3d88
L378d::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb L631c
L379a::
    and eax, 01h
    jne L37a6
    mov al, byte ptr [D6ba0]
    jmp L37ca
L37a6::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb L6328
L37b3::
    and eax, 01h
    mov al, byte ptr [D6ba0]
    je L37bf
    inc al
L37bf::
    sub al, 02h
    sbb al, 00h
    and al, 03h
    mov byte ptr [D6ba0], al
L37ca::
    or al, al
    je L3816
    test al, 02h
    jne L37f4
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [D6bdc]
    jb L6334
L37e6::
    and eax, dword ptr [D6bd8]
    mov edx, dword ptr [D6afc]
    jmp L3836
L37f4::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [D6bde]
    jb L6340
L3808::
    and eax, dword ptr [D6bd4]
    mov edx, dword ptr [D6b04]
    jmp L3836
L3816::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [D6bdd]
    jb L634c
L382a::
    and eax, dword ptr [D6bd0]
    mov edx, dword ptr [D6b98]
L3836::
    shl eax, 03h
    add edx, eax
    cmp di, 0ebfch
    jae L385a
    mov eax, dword ptr [edx]
    mov dword ptr [edi+01404h], eax
    cmp di, 0e6fch
    jae L385a
    mov eax, dword ptr [edx+04h]
    mov dword ptr [edi+01904h], eax
L385a::
    test byte ptr [D6b15], 010h
    je L3d95
L3867::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb L6358
L3874::
    and eax, 01h
    jne L3880
    mov al, byte ptr [D6ba0]
    jmp L38a4
L3880::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb L6364
L388d::
    and eax, 01h
    mov al, byte ptr [D6ba0]
    je L3899
    inc al
L3899::
    sub al, 02h
    sbb al, 00h
    and al, 03h
    mov byte ptr [D6ba0], al
L38a4::
    or al, al
    je L38f0
    test al, 02h
    jne L38ce
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [D6bdc]
    jb L6370
L38c0::
    and eax, dword ptr [D6bd8]
    mov edx, dword ptr [D6afc]
    jmp L3910
L38ce::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [D6bde]
    jb L637c
L38e2::
    and eax, dword ptr [D6bd4]
    mov edx, dword ptr [D6b04]
    jmp L3910
L38f0::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [D6bdd]
    jb L6388
L3904::
    and eax, dword ptr [D6bd0]
    mov edx, dword ptr [D6b98]
L3910::
    shl eax, 03h
    add edx, eax
    cmp di, 0ebf8h
    jae L3934
    mov eax, dword ptr [edx]
    mov dword ptr [edi+01408h], eax
    cmp di, 0e6f8h
    jae L3934
    mov eax, dword ptr [edx+04h]
    mov dword ptr [edi+01908h], eax
L3934::
    test byte ptr [D6b15], 020h
    je L3da2
L3941::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb L6394
L394e::
    and eax, 01h
    jne L395a
    mov al, byte ptr [D6ba0]
    jmp L397e
L395a::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb L63a0
L3967::
    and eax, 01h
    mov al, byte ptr [D6ba0]
    je L3973
    inc al
L3973::
    sub al, 02h
    sbb al, 00h
    and al, 03h
    mov byte ptr [D6ba0], al
L397e::
    or al, al
    je L39ca
    test al, 02h
    jne L39a8
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [D6bdc]
    jb L63ac
L399a::
    and eax, dword ptr [D6bd8]
    mov edx, dword ptr [D6afc]
    jmp L39ea
L39a8::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [D6bde]
    jb L63b8
L39bc::
    and eax, dword ptr [D6bd4]
    mov edx, dword ptr [D6b04]
    jmp L39ea
L39ca::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [D6bdd]
    jb L63c4
L39de::
    and eax, dword ptr [D6bd0]
    mov edx, dword ptr [D6b98]
L39ea::
    shl eax, 03h
    add edx, eax
    cmp di, 0ebf4h
    jae L3a0e
    mov eax, dword ptr [edx]
    mov dword ptr [edi+0140ch], eax
    cmp di, 0e6f4h
    jae L3a0e
    mov eax, dword ptr [edx+04h]
    mov dword ptr [edi+0190ch], eax
L3a0e::
    test byte ptr [D6b15], 04h
    je L3daf
L3a1b::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb L63d0
L3a28::
    and eax, 01h
    jne L3a34
    mov al, byte ptr [D6ba0]
    jmp L3a58
L3a34::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb L63dc
L3a41::
    and eax, 01h
    mov al, byte ptr [D6ba0]
    je L3a4d
    inc al
L3a4d::
    sub al, 02h
    sbb al, 00h
    and al, 03h
    mov byte ptr [D6ba0], al
L3a58::
    or al, al
    je L3aa4
    test al, 02h
    jne L3a82
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [D6bdc]
    jb L63e8
L3a74::
    and eax, dword ptr [D6bd8]
    mov edx, dword ptr [D6afc]
    jmp L3ac4
L3a82::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [D6bde]
    jb L63f4
L3a96::
    and eax, dword ptr [D6bd4]
    mov edx, dword ptr [D6b04]
    jmp L3ac4
L3aa4::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [D6bdd]
    jb L6400
L3ab8::
    and eax, dword ptr [D6bd0]
    mov edx, dword ptr [D6b98]
L3ac4::
    shl eax, 03h
    add edx, eax
    cmp di, 0e200h
    jae L3ae8
    mov eax, dword ptr [edx]
    mov dword ptr [edi+01e00h], eax
    cmp di, 0dd00h
    jae L3ae8
    mov eax, dword ptr [edx+04h]
    mov dword ptr [edi+02300h], eax
L3ae8::
    test byte ptr [D6b15], 08h
    je L3dbc
L3af5::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb L640c
L3b02::
    and eax, 01h
    jne L3b0e
    mov al, byte ptr [D6ba0]
    jmp L3b32
L3b0e::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb L6418
L3b1b::
    and eax, 01h
    mov al, byte ptr [D6ba0]
    je L3b27
    inc al
L3b27::
    sub al, 02h
    sbb al, 00h
    and al, 03h
    mov byte ptr [D6ba0], al
L3b32::
    or al, al
    je L3b7e
    test al, 02h
    jne L3b5c
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [D6bdc]
    jb L6424
L3b4e::
    and eax, dword ptr [D6bd8]
    mov edx, dword ptr [D6afc]
    jmp L3b9e
L3b5c::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [D6bde]
    jb L6430
L3b70::
    and eax, dword ptr [D6bd4]
    mov edx, dword ptr [D6b04]
    jmp L3b9e
L3b7e::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [D6bdd]
    jb L643c
L3b92::
    and eax, dword ptr [D6bd0]
    mov edx, dword ptr [D6b98]
L3b9e::
    shl eax, 03h
    add edx, eax
    cmp di, 0e1fch
    jae L3bc2
    mov eax, dword ptr [edx]
    mov dword ptr [edi+01e04h], eax
    cmp di, 0dcfch
    jae L3bc2
    mov eax, dword ptr [edx+04h]
    mov dword ptr [edi+02304h], eax
L3bc2::
    test byte ptr [D6b15], 040h
    je L3dc9
L3bcf::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb L6448
L3bdc::
    and eax, 01h
    jne L3be8
    mov al, byte ptr [D6ba0]
    jmp L3c0c
L3be8::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb L6454
L3bf5::
    and eax, 01h
    mov al, byte ptr [D6ba0]
    je L3c01
    inc al
L3c01::
    sub al, 02h
    sbb al, 00h
    and al, 03h
    mov byte ptr [D6ba0], al
L3c0c::
    or al, al
    je L3c58
    test al, 02h
    jne L3c36
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [D6bdc]
    jb L6460
L3c28::
    and eax, dword ptr [D6bd8]
    mov edx, dword ptr [D6afc]
    jmp L3c78
L3c36::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [D6bde]
    jb L646c
L3c4a::
    and eax, dword ptr [D6bd4]
    mov edx, dword ptr [D6b04]
    jmp L3c78
L3c58::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [D6bdd]
    jb L6478
L3c6c::
    and eax, dword ptr [D6bd0]
    mov edx, dword ptr [D6b98]
L3c78::
    shl eax, 03h
    add edx, eax
    cmp di, 0e1f8h
    jae L3c9c
    mov eax, dword ptr [edx]
    mov dword ptr [edi+01e08h], eax
    cmp di, 0dcf8h
    jae L3c9c
    mov eax, dword ptr [edx+04h]
    mov dword ptr [edi+02308h], eax
L3c9c::
    test byte ptr [D6b15], 080h
    je L3dd6
L3ca9::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb L6484
L3cb6::
    and eax, 01h
    jne L3cc2
    mov al, byte ptr [D6ba0]
    jmp L3ce6
L3cc2::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb L6490
L3ccf::
    and eax, 01h
    mov al, byte ptr [D6ba0]
    je L3cdb
    inc al
L3cdb::
    sub al, 02h
    sbb al, 00h
    and al, 03h
    mov byte ptr [D6ba0], al
L3ce6::
    or al, al
    je L3d32
    test al, 02h
    jne L3d10
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [D6bdc]
    jb L649c
L3d02::
    and eax, dword ptr [D6bd8]
    mov edx, dword ptr [D6afc]
    jmp L3d52
L3d10::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [D6bde]
    jb L64a8
L3d24::
    and eax, dword ptr [D6bd4]
    mov edx, dword ptr [D6b04]
    jmp L3d52
L3d32::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [D6bdd]
    jb L64b4
L3d46::
    and eax, dword ptr [D6bd0]
    mov edx, dword ptr [D6b98]
L3d52::
    shl eax, 03h
    add edx, eax
    cmp di, 0e1f4h
    jae L3d76
    mov eax, dword ptr [edx]
    mov dword ptr [edi+01e0ch], eax
    cmp di, 0dcf4h
    jae L3d76
    mov eax, dword ptr [edx+04h]
    mov dword ptr [edi+0230ch], eax
L3d76::
    jmp L3f34
L3d7b::
    test byte ptr [D6b15], 01h
    jne L36b3
L3d88::
    test byte ptr [D6b15], 02h
    jne L378d
L3d95::
    test byte ptr [D6b15], 010h
    jne L3867
L3da2::
    test byte ptr [D6b15], 020h
    jne L3941
L3daf::
    test byte ptr [D6b15], 04h
    jne L3a1b
L3dbc::
    test byte ptr [D6b15], 08h
    jne L3af5
L3dc9::
    test byte ptr [D6b15], 040h
    jne L3bcf
L3dd6::
    test byte ptr [D6b15], 080h
    jne L3ca9
    jmp L3f34
L3de8::
    test dword ptr [frame_flags], 010000h
    jne L3f1f
    jmp L3f34
L3dfd::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb L64c0
L3e0a::
    and eax, 01h
    jne L3e16
    mov al, byte ptr [D6ba0]
    jmp L3e3a
L3e16::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb L64cc
L3e23::
    and eax, 01h
    mov al, byte ptr [D6ba0]
    je L3e2f
    inc al
L3e2f::
    sub al, 02h
    sbb al, 00h
    and al, 03h
    mov byte ptr [D6ba0], al
L3e3a::
    or al, al
    je L3eb6
    test al, 02h
    jne L3e64
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [D6bdc]
    jb L64d8
L3e56::
    and eax, dword ptr [D6bd8]
    mov edx, dword ptr [D6afc]
    jmp L3e84
L3e64::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [D6bde]
    jb L64e4
L3e78::
    and eax, dword ptr [D6bd4]
    mov edx, dword ptr [D6b04]
L3e84::
    shl eax, 03h
    add edx, eax
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 04h
    jb L64f0
L3e9a::
    and eax, 0fh
    mov dword ptr [D6ae8], esi
    mov dword ptr [D6af0], ebp
    mov dword ptr [D6aec], ecx
    mov ebx, dword ptr [edx]
    mov esi, dword ptr [edx+04h]
    jmp L3f06
L3eb6::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [D6bdd]
    jb L64fc
L3eca::
    and eax, dword ptr [D6bd0]
    mov edx, dword ptr [D6b98]
    shl eax, 03h
    add edx, eax
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 04h
    jb L6508
L3eec::
    and eax, 0fh
    mov dword ptr [D6ae8], esi
    mov dword ptr [D6af0], ebp
    mov dword ptr [D6aec], ecx
    mov ebx, dword ptr [edx]
    mov esi, dword ptr [edx+04h]
L3f06::
    call dword ptr [eax*4+pass2_writers]
    mov esi, dword ptr [D6ae8]
    mov ecx, dword ptr [D6aec]
    mov ebp, dword ptr [D6af0]
L3f1f::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb L6514
L3f2c::
    test al, 01h
    je L3dfd
L3f34::
    mov edx, 01h
    mov edi, dword ptr [D6af8]
    jmp L13ad
L3f44::
    cmp dword ptr [D6ba8], 00h
    jne L3f55
    pop edx
    pop ecx
    pop ebx
    pop eax
    pop edi
    pop esi
    leave
    ret
L3f55::
    call pass3_start
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
L3f68::
    cmp dword ptr [D6ba8], 00h
    je L3f83
    call pass3_start
    cmp bx, word ptr [current_bank]
    je L1472
L3f83::
    pusha
    mov ax, bx
    call set_bank
    popa
    jmp L1472
pass2_decode endp
    align 4
    word 0
    align 4
pass3_start proc near
    mov esi, 00h
    xchg dword ptr [D6ba8], esi
    mov ecx, dword ptr [D6bb8]
    mov byte ptr [D6ba0], ch
    mov edx, dword ptr [D6bac]
    mov eax, dword ptr [D6bb4]
    mov dword ptr [D6b9c], eax
L3fbf::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb L6520
L3fcc::
    and eax, 01h
    je L4022
    add edx, 01h
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 03h
    jb L652c
L3fe5::
    and eax, 07h
    add edx, eax
    cmp eax, 07h
    jl L4022
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 07h
    jb L6538
L4000::
    and eax, 07fh
    add edx, eax
    cmp eax, 07fh
    jl L4022
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 0ch
    jb L6544
L401b::
    and eax, 0fffh
    add edx, eax
L4022::
    bswap ecx
    mov cl, byte ptr [D6bdf]
    mov ebx, edx
    shl ebx, cl
    add dword ptr [D6bb0], ebx
    bswap ecx
    add edx, dword ptr [D6b9c]
    cmp edx, dword ptr [block_count]
    jae L3f44
    mov dword ptr [D6b9c], edx
    shl edx, 02h
    add edx, dword ptr [ebp+014h]
    mov edi, dword ptr [edx]
    cmp edi, 0ffffffffh
    je L588f
    cmp edi, 0fffffffeh
    je L3f44
    shld ebx, edi, 010h
    cmp di, 0dcfah
    jbe L58a0
    inc bx
    cmp bx, word ptr [current_bank]
    jne L58c8
L4086::
    mov dword ptr [D6af8], edi
    and edi, 0ffffh
    or edi, dword ptr [frame_buffer]
L4098::
    mov dword ptr [D6b14], 00h
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb L6550
L40af::
    test al, 01h
    jne L4568
L40b7::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb L655c
L40c4::
    and eax, 01h
    jne L40d0
    mov al, byte ptr [D6ba0]
    jmp L40f4
L40d0::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb L6568
L40dd::
    and eax, 01h
    mov al, byte ptr [D6ba0]
    je L40e9
    inc al
L40e9::
    sub al, 02h
    sbb al, 00h
    and al, 03h
    mov byte ptr [D6ba0], al
L40f4::
    or al, al
    je L4174
    test al, 02h
    jne L411e
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [D6bdc]
    jb L6574
L4110::
    and eax, dword ptr [D6bd8]
    mov edx, dword ptr [D6afc]
    jmp L413e
L411e::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [D6bde]
    jb L6580
L4132::
    and eax, dword ptr [D6bd4]
    mov edx, dword ptr [D6b04]
L413e::
    shl eax, 03h
    add edx, eax
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 011h
    jae L4156
    add esi, 04h
    or cl, 0e0h
L4156::
    and eax, 01ffffh
    mov dword ptr [D6ae8], esi
    mov dword ptr [D6af0], ebp
    mov dword ptr [D6aec], ecx
    mov ebx, dword ptr [edx]
    mov esi, dword ptr [edx+04h]
    jmp L41c8
L4174::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [D6bdd]
    jb L658c
L4188::
    and eax, dword ptr [D6bd0]
    mov edx, dword ptr [D6bb0]
    shl eax, 03h
    add edx, eax
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 011h
    jae L41ac
    add esi, 04h
    or cl, 0e0h
L41ac::
    and eax, 01ffffh
    mov dword ptr [D6ae8], esi
    mov dword ptr [D6af0], ebp
    mov dword ptr [D6aec], ecx
    mov ebx, dword ptr [edx]
    mov esi, dword ptr [edx+04h]
L41c8::
    or dword ptr [D6b14], eax
    test al, al
    je L4379
    test al, 01h
    je L433d
L41de::
    sub edi, 010000h
    cmp di, 0fb00h
    jae L41ef
    jmp L41f5
    mov dword ptr [edi], ebx
L41ef::
    mov dword ptr [edi+0500h], esi
L41f5::
    add edi, 010000h
    test al, 02h
    je L4345
L4203::
    sub edi, 010000h
    cmp di, 0fffch
    jae L4218
    cmp di, 0fafch
    jae L421b
    jmp L4221
L4218::
    mov dword ptr [edi+04h], ebx
L421b::
    mov dword ptr [edi+0504h], esi
L4221::
    add edi, 010000h
    test al, 010h
    je L434d
L422f::
    sub edi, 010000h
    cmp di, 0fff8h
    jae L4244
    cmp di, 0faf8h
    jae L4247
    jmp L424d
L4244::
    mov dword ptr [edi+08h], ebx
L4247::
    mov dword ptr [edi+0508h], esi
L424d::
    add edi, 010000h
    test al, 020h
    je L4355
L425b::
    sub edi, 010000h
    cmp di, 0fff4h
    jae L4270
    cmp di, 0faf4h
    jae L4273
    jmp L4279
L4270::
    mov dword ptr [edi+0ch], ebx
L4273::
    mov dword ptr [edi+050ch], esi
L4279::
    add edi, 010000h
    test al, 04h
    je L435d
L4287::
    sub edi, 010000h
    cmp di, 0f600h
    jae L429d
    cmp di, 0f100h
    jae L42a3
    jmp L42a9
L429d::
    mov dword ptr [edi+0a00h], ebx
L42a3::
    mov dword ptr [edi+0f00h], esi
L42a9::
    add edi, 010000h
    test al, 08h
    je L4365
L42b7::
    sub edi, 010000h
    cmp di, 0f5fch
    jae L42cd
    cmp di, 0f0fch
    jae L42d3
    jmp L42d9
L42cd::
    mov dword ptr [edi+0a04h], ebx
L42d3::
    mov dword ptr [edi+0f04h], esi
L42d9::
    add edi, 010000h
    test al, 040h
    je L436d
L42e7::
    sub edi, 010000h
    cmp di, 0f5f8h
    jae L42fd
    cmp di, 0f0f8h
    jae L4303
    jmp L4309
L42fd::
    mov dword ptr [edi+0a08h], ebx
L4303::
    mov dword ptr [edi+0f08h], esi
L4309::
    add edi, 010000h
    test al, 080h
    je L4375
L4313::
    sub edi, 010000h
    cmp di, 0f5f4h
    jae L4329
    cmp di, 0f0f4h
    jae L432f
    jmp L4335
L4329::
    mov dword ptr [edi+0a0ch], ebx
L432f::
    mov dword ptr [edi+0f0ch], esi
L4335::
    add edi, 010000h
    jmp L4379
L433d::
    test al, 01h
    jne L41de
L4345::
    test al, 02h
    jne L4203
L434d::
    test al, 010h
    jne L422f
L4355::
    test al, 020h
    jne L425b
L435d::
    test al, 04h
    jne L4287
L4365::
    test al, 08h
    jne L42b7
L436d::
    test al, 040h
    jne L42e7
L4375::
    test al, 080h
    jne L4313
L4379::
    test ah, ah
    je L454b
    test ah, 01h
    je L4507
L438a::
    sub edi, 010000h
    cmp di, 0ec00h
    jae L43a0
    cmp di, 0e700h
    jae L43a6
    jmp L43ac
L43a0::
    mov dword ptr [edi+01400h], ebx
L43a6::
    mov dword ptr [edi+01900h], esi
L43ac::
    add edi, 010000h
    test ah, 02h
    je L4510
L43bb::
    sub edi, 010000h
    cmp di, 0ebfch
    jae L43d1
    cmp di, 0e6fch
    jae L43d7
    jmp L43dd
L43d1::
    mov dword ptr [edi+01404h], ebx
L43d7::
    mov dword ptr [edi+01904h], esi
L43dd::
    add edi, 010000h
    test ah, 010h
    je L4519
L43ec::
    sub edi, 010000h
    cmp di, 0ebf8h
    jae L4402
    cmp di, 0e6f8h
    jae L4408
    jmp L440e
L4402::
    mov dword ptr [edi+01408h], ebx
L4408::
    mov dword ptr [edi+01908h], esi
L440e::
    add edi, 010000h
    test ah, 020h
    je L4522
L441d::
    sub edi, 010000h
    cmp di, 0ebf4h
    jae L4433
    cmp di, 0e6f4h
    jae L4439
    jmp L443f
L4433::
    mov dword ptr [edi+0140ch], ebx
L4439::
    mov dword ptr [edi+0190ch], esi
L443f::
    add edi, 010000h
    test ah, 04h
    je L452b
L444e::
    sub edi, 010000h
    cmp di, 0e200h
    jae L4464
    cmp di, 0dd00h
    jae L446a
    jmp L4470
L4464::
    mov dword ptr [edi+01e00h], ebx
L446a::
    mov dword ptr [edi+02300h], esi
L4470::
    add edi, 010000h
    test ah, 08h
    je L4534
L447f::
    sub edi, 010000h
    cmp di, 0e1fch
    jae L4495
    cmp di, 0dcfch
    jae L449b
    jmp L44a1
L4495::
    mov dword ptr [edi+01e04h], ebx
L449b::
    mov dword ptr [edi+02304h], esi
L44a1::
    add edi, 010000h
    test ah, 040h
    je L453d
L44b0::
    sub edi, 010000h
    cmp di, 0e1f8h
    jae L44c6
    cmp di, 0dcf8h
    jae L44cc
    jmp L44d2
L44c6::
    mov dword ptr [edi+01e08h], ebx
L44cc::
    mov dword ptr [edi+02308h], esi
L44d2::
    add edi, 010000h
    test ah, 080h
    je L4546
L44dd::
    sub edi, 010000h
    cmp di, 0e1f4h
    jae L44f3
    cmp di, 0dcf4h
    jae L44f9
    jmp L44ff
L44f3::
    mov dword ptr [edi+01e0ch], ebx
L44f9::
    mov dword ptr [edi+0230ch], esi
L44ff::
    add edi, 010000h
    jmp L454b
L4507::
    test ah, 01h
    jne L438a
L4510::
    test ah, 02h
    jne L43bb
L4519::
    test ah, 010h
    jne L43ec
L4522::
    test ah, 020h
    jne L441d
L452b::
    test ah, 04h
    jne L444e
L4534::
    test ah, 08h
    jne L447f
L453d::
    test ah, 040h
    jne L44b0
L4546::
    test ah, 080h
    jne L44dd
L454b::
    mov esi, dword ptr [D6ae8]
    mov ecx, dword ptr [D6aec]
    mov ebp, dword ptr [D6af0]
    and eax, 010000h
    je L40b7
L4568::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb L6598
L4575::
    test al, 01h
    jne L5733
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 04h
    jb L65a4
L458e::
    and eax, 0fh
    jmp dword ptr [eax*4+pass3_codes]
pass3_start endp
pass3_codes dword offset pass3_decode
    dword offset L45f6
    dword offset L4617
    dword offset L463b
    dword offset L465b
    dword offset L467d
    dword offset L46a4
    dword offset L46c7
    dword offset L46eb
    dword offset L470a
    dword offset L472e
    dword offset L4754
    dword offset L4774
    dword offset L478f
    dword offset L47b0
    dword offset L47ce
pass3_decode proc near
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 010h
    jae L45eb
    add esi, 04h
    or cl, 0e0h
L45eb::
    xor dword ptr [D6b14], eax
    jmp L47d4
L45f6::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 0ch
    jb L65b0
L4607::
    shl eax, 04h
    or al, 0fh
    xor dword ptr [D6b14], eax
    jmp L47d4
L4617::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 0ch
    jb L65bc
L4628::
    shl eax, 04h
    shr al, 04h
    or al, 0f0h
    xor dword ptr [D6b14], eax
    jmp L47d4
L463b::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 08h
    jb L65c8
L464c::
    mov ah, al
    mov al, 0ffh
    xor dword ptr [D6b14], eax
    jmp L47d4
L465b::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 0ch
    jb L65d4
L466c::
    shl ah, 04h
    or ah, 0fh
    xor dword ptr [D6b14], eax
    jmp L47d4
L467d::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 08h
    jb L65e0
L468e::
    shl eax, 04h
    shl ah, 04h
    or eax, 0f0fh
    xor dword ptr [D6b14], eax
    jmp L47d4
L46a4::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 08h
    jb L65ec
L46b5::
    mov ah, al
    or eax, 0ff0h
    xor dword ptr [D6b14], eax
    jmp L47d4
L46c7::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 04h
    jb L65f8
L46d8::
    shl eax, 0ch
    or eax, 0fffh
    xor dword ptr [D6b14], eax
    jmp L47d4
L46eb::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 0ch
    jb L6604
L46fc::
    or ah, 0f0h
    xor dword ptr [D6b14], eax
    jmp L47d4
L470a::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 08h
    jb L6610
L471b::
    shl eax, 04h
    or eax, 0f00fh
    xor dword ptr [D6b14], eax
    jmp L47d4
L472e::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 08h
    jb L661c
L473f::
    mov ah, al
    ror ah, 04h
    or eax, 0f0f0h
    xor dword ptr [D6b14], eax
    jmp L47d4
L4754::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 04h
    jb L6628
L4765::
    mov ah, al
    or eax, 0f0ffh
    xor dword ptr [D6b14], eax
    jmp L47d4
L4774::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 08h
    jb L6634
L4785::
    mov ah, 0ffh
    xor dword ptr [D6b14], eax
    jmp L47d4
L478f::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 04h
    jb L6640
L47a0::
    or eax, 0fff0h
    rol al, 04h
    xor dword ptr [D6b14], eax
    jmp L47d4
L47b0::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 04h
    jb L664c
L47c1::
    or eax, 0fff0h
    xor dword ptr [D6b14], eax
    jmp L47d4
L47ce::
    not dword ptr [D6b14]
L47d4::
    test byte ptr [D6b14], 0ffh
    je L4f74
    test byte ptr [D6b14], 01h
    je L4f0c
L47ee::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb L6658
L47fb::
    and eax, 01h
    jne L4807
    mov al, byte ptr [D6ba0]
    jmp L482b
L4807::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb L6664
L4814::
    and eax, 01h
    mov al, byte ptr [D6ba0]
    je L4820
    inc al
L4820::
    sub al, 02h
    sbb al, 00h
    and al, 03h
    mov byte ptr [D6ba0], al
L482b::
    or al, al
    je L4877
    test al, 02h
    jne L4855
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [D6bdc]
    jb L6670
L4847::
    and eax, dword ptr [D6bd8]
    mov edx, dword ptr [D6afc]
    jmp L4897
L4855::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [D6bde]
    jb L667c
L4869::
    and eax, dword ptr [D6bd4]
    mov edx, dword ptr [D6b04]
    jmp L4897
L4877::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [D6bdd]
    jb L6688
L488b::
    and eax, dword ptr [D6bd0]
    mov edx, dword ptr [D6bb0]
L4897::
    shl eax, 03h
    add edx, eax
    sub edi, 010000h
    cmp di, 0fb00h
    jae L48af
    jmp L48b8
    mov eax, dword ptr [edx]
    mov dword ptr [edi], eax
L48af::
    mov eax, dword ptr [edx+04h]
    mov dword ptr [edi+0500h], eax
L48b8::
    add edi, 010000h
    test byte ptr [D6b14], 02h
    je L4f19
L48cb::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb L6694
L48d8::
    and eax, 01h
    jne L48e4
    mov al, byte ptr [D6ba0]
    jmp L4908
L48e4::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb L66a0
L48f1::
    and eax, 01h
    mov al, byte ptr [D6ba0]
    je L48fd
    inc al
L48fd::
    sub al, 02h
    sbb al, 00h
    and al, 03h
    mov byte ptr [D6ba0], al
L4908::
    or al, al
    je L4954
    test al, 02h
    jne L4932
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [D6bdc]
    jb L66ac
L4924::
    and eax, dword ptr [D6bd8]
    mov edx, dword ptr [D6afc]
    jmp L4974
L4932::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [D6bde]
    jb L66b8
L4946::
    and eax, dword ptr [D6bd4]
    mov edx, dword ptr [D6b04]
    jmp L4974
L4954::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [D6bdd]
    jb L66c4
L4968::
    and eax, dword ptr [D6bd0]
    mov edx, dword ptr [D6bb0]
L4974::
    shl eax, 03h
    add edx, eax
    sub edi, 010000h
    cmp di, 0fffch
    jae L498e
    cmp di, 0fafch
    jae L4993
    jmp L499c
L498e::
    mov eax, dword ptr [edx]
    mov dword ptr [edi+04h], eax
L4993::
    mov eax, dword ptr [edx+04h]
    mov dword ptr [edi+0504h], eax
L499c::
    add edi, 010000h
    test byte ptr [D6b14], 010h
    je L4f26
L49af::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb L66d0
L49bc::
    and eax, 01h
    jne L49c8
    mov al, byte ptr [D6ba0]
    jmp L49ec
L49c8::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb L66dc
L49d5::
    and eax, 01h
    mov al, byte ptr [D6ba0]
    je L49e1
    inc al
L49e1::
    sub al, 02h
    sbb al, 00h
    and al, 03h
    mov byte ptr [D6ba0], al
L49ec::
    or al, al
    je L4a38
    test al, 02h
    jne L4a16
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [D6bdc]
    jb L66e8
L4a08::
    and eax, dword ptr [D6bd8]
    mov edx, dword ptr [D6afc]
    jmp L4a58
L4a16::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [D6bde]
    jb L66f4
L4a2a::
    and eax, dword ptr [D6bd4]
    mov edx, dword ptr [D6b04]
    jmp L4a58
L4a38::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [D6bdd]
    jb L6700
L4a4c::
    and eax, dword ptr [D6bd0]
    mov edx, dword ptr [D6bb0]
L4a58::
    shl eax, 03h
    add edx, eax
    sub edi, 010000h
    cmp di, 0fff8h
    jae L4a72
    cmp di, 0faf8h
    jae L4a77
    jmp L4a80
L4a72::
    mov eax, dword ptr [edx]
    mov dword ptr [edi+08h], eax
L4a77::
    mov eax, dword ptr [edx+04h]
    mov dword ptr [edi+0508h], eax
L4a80::
    add edi, 010000h
    test byte ptr [D6b14], 020h
    je L4f33
L4a93::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb L670c
L4aa0::
    and eax, 01h
    jne L4aac
    mov al, byte ptr [D6ba0]
    jmp L4ad0
L4aac::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb L6718
L4ab9::
    and eax, 01h
    mov al, byte ptr [D6ba0]
    je L4ac5
    inc al
L4ac5::
    sub al, 02h
    sbb al, 00h
    and al, 03h
    mov byte ptr [D6ba0], al
L4ad0::
    or al, al
    je L4b1c
    test al, 02h
    jne L4afa
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [D6bdc]
    jb L6724
L4aec::
    and eax, dword ptr [D6bd8]
    mov edx, dword ptr [D6afc]
    jmp L4b3c
L4afa::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [D6bde]
    jb L6730
L4b0e::
    and eax, dword ptr [D6bd4]
    mov edx, dword ptr [D6b04]
    jmp L4b3c
L4b1c::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [D6bdd]
    jb L673c
L4b30::
    and eax, dword ptr [D6bd0]
    mov edx, dword ptr [D6bb0]
L4b3c::
    shl eax, 03h
    add edx, eax
    sub edi, 010000h
    cmp di, 0fff4h
    jae L4b56
    cmp di, 0faf4h
    jae L4b5b
    jmp L4b64
L4b56::
    mov eax, dword ptr [edx]
    mov dword ptr [edi+0ch], eax
L4b5b::
    mov eax, dword ptr [edx+04h]
    mov dword ptr [edi+050ch], eax
L4b64::
    add edi, 010000h
    test byte ptr [D6b14], 04h
    je L4f40
L4b77::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb L6748
L4b84::
    and eax, 01h
    jne L4b90
    mov al, byte ptr [D6ba0]
    jmp L4bb4
L4b90::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb L6754
L4b9d::
    and eax, 01h
    mov al, byte ptr [D6ba0]
    je L4ba9
    inc al
L4ba9::
    sub al, 02h
    sbb al, 00h
    and al, 03h
    mov byte ptr [D6ba0], al
L4bb4::
    or al, al
    je L4c00
    test al, 02h
    jne L4bde
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [D6bdc]
    jb L6760
L4bd0::
    and eax, dword ptr [D6bd8]
    mov edx, dword ptr [D6afc]
    jmp L4c20
L4bde::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [D6bde]
    jb L676c
L4bf2::
    and eax, dword ptr [D6bd4]
    mov edx, dword ptr [D6b04]
    jmp L4c20
L4c00::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [D6bdd]
    jb L6778
L4c14::
    and eax, dword ptr [D6bd0]
    mov edx, dword ptr [D6bb0]
L4c20::
    shl eax, 03h
    add edx, eax
    sub edi, 010000h
    cmp di, 0f600h
    jae L4c3b
    cmp di, 0f100h
    jae L4c43
    jmp L4c4c
L4c3b::
    mov eax, dword ptr [edx]
    mov dword ptr [edi+0a00h], eax
L4c43::
    mov eax, dword ptr [edx+04h]
    mov dword ptr [edi+0f00h], eax
L4c4c::
    add edi, 010000h
    test byte ptr [D6b14], 08h
    je L4f4d
L4c5f::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb L6784
L4c6c::
    and eax, 01h
    jne L4c78
    mov al, byte ptr [D6ba0]
    jmp L4c9c
L4c78::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb L6790
L4c85::
    and eax, 01h
    mov al, byte ptr [D6ba0]
    je L4c91
    inc al
L4c91::
    sub al, 02h
    sbb al, 00h
    and al, 03h
    mov byte ptr [D6ba0], al
L4c9c::
    or al, al
    je L4ce8
    test al, 02h
    jne L4cc6
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [D6bdc]
    jb L679c
L4cb8::
    and eax, dword ptr [D6bd8]
    mov edx, dword ptr [D6afc]
    jmp L4d08
L4cc6::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [D6bde]
    jb L67a8
L4cda::
    and eax, dword ptr [D6bd4]
    mov edx, dword ptr [D6b04]
    jmp L4d08
L4ce8::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [D6bdd]
    jb L67b4
L4cfc::
    and eax, dword ptr [D6bd0]
    mov edx, dword ptr [D6bb0]
L4d08::
    shl eax, 03h
    add edx, eax
    sub edi, 010000h
    cmp di, 0f5fch
    jae L4d23
    cmp di, 0f0fch
    jae L4d2b
    jmp L4d34
L4d23::
    mov eax, dword ptr [edx]
    mov dword ptr [edi+0a04h], eax
L4d2b::
    mov eax, dword ptr [edx+04h]
    mov dword ptr [edi+0f04h], eax
L4d34::
    add edi, 010000h
    test byte ptr [D6b14], 040h
    je L4f5a
L4d47::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb L67c0
L4d54::
    and eax, 01h
    jne L4d60
    mov al, byte ptr [D6ba0]
    jmp L4d84
L4d60::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb L67cc
L4d6d::
    and eax, 01h
    mov al, byte ptr [D6ba0]
    je L4d79
    inc al
L4d79::
    sub al, 02h
    sbb al, 00h
    and al, 03h
    mov byte ptr [D6ba0], al
L4d84::
    or al, al
    je L4dd0
    test al, 02h
    jne L4dae
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [D6bdc]
    jb L67d8
L4da0::
    and eax, dword ptr [D6bd8]
    mov edx, dword ptr [D6afc]
    jmp L4df0
L4dae::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [D6bde]
    jb L67e4
L4dc2::
    and eax, dword ptr [D6bd4]
    mov edx, dword ptr [D6b04]
    jmp L4df0
L4dd0::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [D6bdd]
    jb L67f0
L4de4::
    and eax, dword ptr [D6bd0]
    mov edx, dword ptr [D6bb0]
L4df0::
    shl eax, 03h
    add edx, eax
    sub edi, 010000h
    cmp di, 0f5f8h
    jae L4e0b
    cmp di, 0f0f8h
    jae L4e13
    jmp L4e1c
L4e0b::
    mov eax, dword ptr [edx]
    mov dword ptr [edi+0a08h], eax
L4e13::
    mov eax, dword ptr [edx+04h]
    mov dword ptr [edi+0f08h], eax
L4e1c::
    add edi, 010000h
    test byte ptr [D6b14], 080h
    je L4f67
L4e2f::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb L67fc
L4e3c::
    and eax, 01h
    jne L4e48
    mov al, byte ptr [D6ba0]
    jmp L4e6c
L4e48::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb L6808
L4e55::
    and eax, 01h
    mov al, byte ptr [D6ba0]
    je L4e61
    inc al
L4e61::
    sub al, 02h
    sbb al, 00h
    and al, 03h
    mov byte ptr [D6ba0], al
L4e6c::
    or al, al
    je L4eb8
    test al, 02h
    jne L4e96
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [D6bdc]
    jb L6814
L4e88::
    and eax, dword ptr [D6bd8]
    mov edx, dword ptr [D6afc]
    jmp L4ed8
L4e96::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [D6bde]
    jb L6820
L4eaa::
    and eax, dword ptr [D6bd4]
    mov edx, dword ptr [D6b04]
    jmp L4ed8
L4eb8::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [D6bdd]
    jb L682c
L4ecc::
    and eax, dword ptr [D6bd0]
    mov edx, dword ptr [D6bb0]
L4ed8::
    shl eax, 03h
    add edx, eax
    sub edi, 010000h
    cmp di, 0f5f4h
    jae L4ef3
    cmp di, 0f0f4h
    jae L4efb
    jmp L4f04
L4ef3::
    mov eax, dword ptr [edx]
    mov dword ptr [edi+0a0ch], eax
L4efb::
    mov eax, dword ptr [edx+04h]
    mov dword ptr [edi+0f0ch], eax
L4f04::
    add edi, 010000h
    jmp L4f74
L4f0c::
    test byte ptr [D6b14], 01h
    jne L47ee
L4f19::
    test byte ptr [D6b14], 02h
    jne L48cb
L4f26::
    test byte ptr [D6b14], 010h
    jne L49af
L4f33::
    test byte ptr [D6b14], 020h
    jne L4a93
L4f40::
    test byte ptr [D6b14], 04h
    jne L4b77
L4f4d::
    test byte ptr [D6b14], 08h
    jne L4c5f
L4f5a::
    test byte ptr [D6b14], 040h
    jne L4d47
L4f67::
    test byte ptr [D6b14], 080h
    jne L4e2f
L4f74::
    test byte ptr [D6b15], 0ffh
    je L587f
    test byte ptr [D6b15], 01h
    je L56c6
L4f8e::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb L6838
L4f9b::
    and eax, 01h
    jne L4fa7
    mov al, byte ptr [D6ba0]
    jmp L4fcb
L4fa7::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb L6844
L4fb4::
    and eax, 01h
    mov al, byte ptr [D6ba0]
    je L4fc0
    inc al
L4fc0::
    sub al, 02h
    sbb al, 00h
    and al, 03h
    mov byte ptr [D6ba0], al
L4fcb::
    or al, al
    je L5017
    test al, 02h
    jne L4ff5
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [D6bdc]
    jb L6850
L4fe7::
    and eax, dword ptr [D6bd8]
    mov edx, dword ptr [D6afc]
    jmp L5037
L4ff5::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [D6bde]
    jb L685c
L5009::
    and eax, dword ptr [D6bd4]
    mov edx, dword ptr [D6b04]
    jmp L5037
L5017::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [D6bdd]
    jb L6868
L502b::
    and eax, dword ptr [D6bd0]
    mov edx, dword ptr [D6bb0]
L5037::
    shl eax, 03h
    add edx, eax
    sub edi, 010000h
    cmp di, 0ec00h
    jae L5052
    cmp di, 0e700h
    jae L505a
    jmp L5063
L5052::
    mov eax, dword ptr [edx]
    mov dword ptr [edi+01400h], eax
L505a::
    mov eax, dword ptr [edx+04h]
    mov dword ptr [edi+01900h], eax
L5063::
    add edi, 010000h
    test byte ptr [D6b15], 02h
    je L56d3
L5076::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb L6874
L5083::
    and eax, 01h
    jne L508f
    mov al, byte ptr [D6ba0]
    jmp L50b3
L508f::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb L6880
L509c::
    and eax, 01h
    mov al, byte ptr [D6ba0]
    je L50a8
    inc al
L50a8::
    sub al, 02h
    sbb al, 00h
    and al, 03h
    mov byte ptr [D6ba0], al
L50b3::
    or al, al
    je L50ff
    test al, 02h
    jne L50dd
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [D6bdc]
    jb L688c
L50cf::
    and eax, dword ptr [D6bd8]
    mov edx, dword ptr [D6afc]
    jmp L511f
L50dd::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [D6bde]
    jb L6898
L50f1::
    and eax, dword ptr [D6bd4]
    mov edx, dword ptr [D6b04]
    jmp L511f
L50ff::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [D6bdd]
    jb L68a4
L5113::
    and eax, dword ptr [D6bd0]
    mov edx, dword ptr [D6bb0]
L511f::
    shl eax, 03h
    add edx, eax
    sub edi, 010000h
    cmp di, 0ebfch
    jae L513a
    cmp di, 0e6fch
    jae L5142
    jmp L514b
L513a::
    mov eax, dword ptr [edx]
    mov dword ptr [edi+01404h], eax
L5142::
    mov eax, dword ptr [edx+04h]
    mov dword ptr [edi+01904h], eax
L514b::
    add edi, 010000h
    test byte ptr [D6b15], 010h
    je L56e0
L515e::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb L68b0
L516b::
    and eax, 01h
    jne L5177
    mov al, byte ptr [D6ba0]
    jmp L519b
L5177::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb L68bc
L5184::
    and eax, 01h
    mov al, byte ptr [D6ba0]
    je L5190
    inc al
L5190::
    sub al, 02h
    sbb al, 00h
    and al, 03h
    mov byte ptr [D6ba0], al
L519b::
    or al, al
    je L51e7
    test al, 02h
    jne L51c5
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [D6bdc]
    jb L68c8
L51b7::
    and eax, dword ptr [D6bd8]
    mov edx, dword ptr [D6afc]
    jmp L5207
L51c5::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [D6bde]
    jb L68d4
L51d9::
    and eax, dword ptr [D6bd4]
    mov edx, dword ptr [D6b04]
    jmp L5207
L51e7::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [D6bdd]
    jb L68e0
L51fb::
    and eax, dword ptr [D6bd0]
    mov edx, dword ptr [D6bb0]
L5207::
    shl eax, 03h
    add edx, eax
    sub edi, 010000h
    cmp di, 0ebf8h
    jae L5222
    cmp di, 0e6f8h
    jae L522a
    jmp L5233
L5222::
    mov eax, dword ptr [edx]
    mov dword ptr [edi+01408h], eax
L522a::
    mov eax, dword ptr [edx+04h]
    mov dword ptr [edi+01908h], eax
L5233::
    add edi, 010000h
    test byte ptr [D6b15], 020h
    je L56ed
L5246::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb L68ec
L5253::
    and eax, 01h
    jne L525f
    mov al, byte ptr [D6ba0]
    jmp L5283
L525f::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb L68f8
L526c::
    and eax, 01h
    mov al, byte ptr [D6ba0]
    je L5278
    inc al
L5278::
    sub al, 02h
    sbb al, 00h
    and al, 03h
    mov byte ptr [D6ba0], al
L5283::
    or al, al
    je L52cf
    test al, 02h
    jne L52ad
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [D6bdc]
    jb L6904
L529f::
    and eax, dword ptr [D6bd8]
    mov edx, dword ptr [D6afc]
    jmp L52ef
L52ad::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [D6bde]
    jb L6910
L52c1::
    and eax, dword ptr [D6bd4]
    mov edx, dword ptr [D6b04]
    jmp L52ef
L52cf::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [D6bdd]
    jb L691c
L52e3::
    and eax, dword ptr [D6bd0]
    mov edx, dword ptr [D6bb0]
L52ef::
    shl eax, 03h
    add edx, eax
    sub edi, 010000h
    cmp di, 0ebf4h
    jae L530a
    cmp di, 0e6f4h
    jae L5312
    jmp L531b
L530a::
    mov eax, dword ptr [edx]
    mov dword ptr [edi+0140ch], eax
L5312::
    mov eax, dword ptr [edx+04h]
    mov dword ptr [edi+0190ch], eax
L531b::
    add edi, 010000h
    test byte ptr [D6b15], 04h
    je L56fa
L532e::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb L6928
L533b::
    and eax, 01h
    jne L5347
    mov al, byte ptr [D6ba0]
    jmp L536b
L5347::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb L6934
L5354::
    and eax, 01h
    mov al, byte ptr [D6ba0]
    je L5360
    inc al
L5360::
    sub al, 02h
    sbb al, 00h
    and al, 03h
    mov byte ptr [D6ba0], al
L536b::
    or al, al
    je L53b7
    test al, 02h
    jne L5395
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [D6bdc]
    jb L6940
L5387::
    and eax, dword ptr [D6bd8]
    mov edx, dword ptr [D6afc]
    jmp L53d7
L5395::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [D6bde]
    jb L694c
L53a9::
    and eax, dword ptr [D6bd4]
    mov edx, dword ptr [D6b04]
    jmp L53d7
L53b7::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [D6bdd]
    jb L6958
L53cb::
    and eax, dword ptr [D6bd0]
    mov edx, dword ptr [D6bb0]
L53d7::
    shl eax, 03h
    add edx, eax
    sub edi, 010000h
    cmp di, 0e200h
    jae L53f2
    cmp di, 0dd00h
    jae L53fa
    jmp L5403
L53f2::
    mov eax, dword ptr [edx]
    mov dword ptr [edi+01e00h], eax
L53fa::
    mov eax, dword ptr [edx+04h]
    mov dword ptr [edi+02300h], eax
L5403::
    add edi, 010000h
    test byte ptr [D6b15], 08h
    je L5707
L5416::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb L6964
L5423::
    and eax, 01h
    jne L542f
    mov al, byte ptr [D6ba0]
    jmp L5453
L542f::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb L6970
L543c::
    and eax, 01h
    mov al, byte ptr [D6ba0]
    je L5448
    inc al
L5448::
    sub al, 02h
    sbb al, 00h
    and al, 03h
    mov byte ptr [D6ba0], al
L5453::
    or al, al
    je L549f
    test al, 02h
    jne L547d
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [D6bdc]
    jb L697c
L546f::
    and eax, dword ptr [D6bd8]
    mov edx, dword ptr [D6afc]
    jmp L54bf
L547d::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [D6bde]
    jb L6988
L5491::
    and eax, dword ptr [D6bd4]
    mov edx, dword ptr [D6b04]
    jmp L54bf
L549f::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [D6bdd]
    jb L6994
L54b3::
    and eax, dword ptr [D6bd0]
    mov edx, dword ptr [D6bb0]
L54bf::
    shl eax, 03h
    add edx, eax
    sub edi, 010000h
    cmp di, 0e1fch
    jae L54da
    cmp di, 0dcfch
    jae L54e2
    jmp L54eb
L54da::
    mov eax, dword ptr [edx]
    mov dword ptr [edi+01e04h], eax
L54e2::
    mov eax, dword ptr [edx+04h]
    mov dword ptr [edi+02304h], eax
L54eb::
    add edi, 010000h
    test byte ptr [D6b15], 040h
    je L5714
L54fe::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb L69a0
L550b::
    and eax, 01h
    jne L5517
    mov al, byte ptr [D6ba0]
    jmp L553b
L5517::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb L69ac
L5524::
    and eax, 01h
    mov al, byte ptr [D6ba0]
    je L5530
    inc al
L5530::
    sub al, 02h
    sbb al, 00h
    and al, 03h
    mov byte ptr [D6ba0], al
L553b::
    or al, al
    je L5587
    test al, 02h
    jne L5565
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [D6bdc]
    jb L69b8
L5557::
    and eax, dword ptr [D6bd8]
    mov edx, dword ptr [D6afc]
    jmp L55a7
L5565::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [D6bde]
    jb L69c4
L5579::
    and eax, dword ptr [D6bd4]
    mov edx, dword ptr [D6b04]
    jmp L55a7
L5587::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [D6bdd]
    jb L69d0
L559b::
    and eax, dword ptr [D6bd0]
    mov edx, dword ptr [D6bb0]
L55a7::
    shl eax, 03h
    add edx, eax
    sub edi, 010000h
    cmp di, 0e1f8h
    jae L55c2
    cmp di, 0dcf8h
    jae L55ca
    jmp L55d3
L55c2::
    mov eax, dword ptr [edx]
    mov dword ptr [edi+01e08h], eax
L55ca::
    mov eax, dword ptr [edx+04h]
    mov dword ptr [edi+02308h], eax
L55d3::
    add edi, 010000h
    test byte ptr [D6b15], 080h
    je L5721
L55e6::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb L69dc
L55f3::
    and eax, 01h
    jne L55ff
    mov al, byte ptr [D6ba0]
    jmp L5623
L55ff::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb L69e8
L560c::
    and eax, 01h
    mov al, byte ptr [D6ba0]
    je L5618
    inc al
L5618::
    sub al, 02h
    sbb al, 00h
    and al, 03h
    mov byte ptr [D6ba0], al
L5623::
    or al, al
    je L566f
    test al, 02h
    jne L564d
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [D6bdc]
    jb L69f4
L563f::
    and eax, dword ptr [D6bd8]
    mov edx, dword ptr [D6afc]
    jmp L568f
L564d::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [D6bde]
    jb L6a00
L5661::
    and eax, dword ptr [D6bd4]
    mov edx, dword ptr [D6b04]
    jmp L568f
L566f::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [D6bdd]
    jb L6a0c
L5683::
    and eax, dword ptr [D6bd0]
    mov edx, dword ptr [D6bb0]
L568f::
    shl eax, 03h
    add edx, eax
    sub edi, 010000h
    cmp di, 0e1f4h
    jae L56aa
    cmp di, 0dcf4h
    jae L56b2
    jmp L56bb
L56aa::
    mov eax, dword ptr [edx]
    mov dword ptr [edi+01e0ch], eax
L56b2::
    mov eax, dword ptr [edx+04h]
    mov dword ptr [edi+0230ch], eax
L56bb::
    add edi, 010000h
    jmp L587f
L56c6::
    test byte ptr [D6b15], 01h
    jne L4f8e
L56d3::
    test byte ptr [D6b15], 02h
    jne L5076
L56e0::
    test byte ptr [D6b15], 010h
    jne L515e
L56ed::
    test byte ptr [D6b15], 020h
    jne L5246
L56fa::
    test byte ptr [D6b15], 04h
    jne L532e
L5707::
    test byte ptr [D6b15], 08h
    jne L5416
L5714::
    test byte ptr [D6b15], 040h
    jne L54fe
L5721::
    test byte ptr [D6b15], 080h
    jne L55e6
    jmp L587f
L5733::
    test dword ptr [frame_flags], 010000h
    jne L586a
    jmp L587f
L5748::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb L6a18
L5755::
    and eax, 01h
    jne L5761
    mov al, byte ptr [D6ba0]
    jmp L5785
L5761::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb L6a24
L576e::
    and eax, 01h
    mov al, byte ptr [D6ba0]
    je L577a
    inc al
L577a::
    sub al, 02h
    sbb al, 00h
    and al, 03h
    mov byte ptr [D6ba0], al
L5785::
    or al, al
    je L5801
    test al, 02h
    jne L57af
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [D6bdc]
    jb L6a30
L57a1::
    and eax, dword ptr [D6bd8]
    mov edx, dword ptr [D6afc]
    jmp L57cf
L57af::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [D6bde]
    jb L6a3c
L57c3::
    and eax, dword ptr [D6bd4]
    mov edx, dword ptr [D6b04]
L57cf::
    shl eax, 03h
    add edx, eax
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 04h
    jb L6a48
L57e5::
    and eax, 0fh
    mov dword ptr [D6ae8], esi
    mov dword ptr [D6af0], ebp
    mov dword ptr [D6aec], ecx
    mov ebx, dword ptr [edx]
    mov esi, dword ptr [edx+04h]
    jmp L5851
L5801::
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, byte ptr [D6bdd]
    jb L6a54
L5815::
    and eax, dword ptr [D6bd0]
    mov edx, dword ptr [D6bb0]
    shl eax, 03h
    add edx, eax
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [esi+04h]
    shrd eax, ebx, cl
    add cl, 04h
    jb L6a60
L5837::
    and eax, 0fh
    mov dword ptr [D6ae8], esi
    mov dword ptr [D6af0], ebp
    mov dword ptr [D6aec], ecx
    mov ebx, dword ptr [edx]
    mov esi, dword ptr [edx+04h]
L5851::
    call dword ptr [eax*4+pass3_writers]
    mov esi, dword ptr [D6ae8]
    mov ecx, dword ptr [D6aec]
    mov ebp, dword ptr [D6af0]
L586a::
    mov eax, dword ptr [esi]
    shr eax, cl
    add cl, 01h
    jb L6a6c
L5877::
    test al, 01h
    je L5748
L587f::
    mov edx, 01h
    mov edi, dword ptr [D6af8]
    jmp L3fbf
L588f::
    mov dword ptr [D6af8], edi
    lea edi, [D6be4]
    jmp L4098
L58a0::
    shld ebx, edi, 010h
    ret
    align 4
    word 0
    align 4
L58ac::
    pusha
    mov ax, bx
    call set_bank
    popa
    mov word ptr [current_bank], bx
    jmp L28d0
    align 4
    word 0
    align 4
L58c8::
    pusha
    mov ax, bx
    call set_bank
    popa
    mov word ptr [current_bank], bx
    jmp L4086
    pop edx
    pop ecx
    pop ebx
    pop eax
    pop edi
    pop esi
    leave
    ret
L58e6::
    pop edx
    pop ecx
    pop ebx
    pop eax
    pop edi
    pop esi
    leave
    ret
pass3_decode endp
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
    je L5904
    mov ax, 01h
L5904::
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
    jne L5974
    mov edx, 050h
L5974::
    add edx, dword ptr [ebp+018h]
    mov dword ptr [ebp+020h], edx
    mov edx, dword ptr [ebp+024h]
    or edx, edx
    jne L5986
    mov edx, 03ch
L5986::
    add edx, dword ptr [ebp+01ch]
    mov dword ptr [ebp+024h], edx
    mov ax, word ptr [ebp+010h]
    mov si, word ptr [ebp+014h]
    mov ecx, 00h
L5999::
    mov edx, 00h
L599e::
    mov word ptr [edi], dx
    mov word ptr [edi+02h], cx
    add word ptr [edi], ax
    add word ptr [edi+02h], si
    add edi, 04h
    inc edx
    cmp edx, dword ptr [ebp+08h]
    jne L599e
    inc ecx
    cmp ecx, dword ptr [ebp+0ch]
    jne L5999
    mov edi, dword ptr [ebp+08h]
    mov edx, dword ptr [ebp+0ch]
    imul edi, edx
    dec edi
    shl edi, 02h
    add edi, dword ptr [ebp+02ch]
    mov edx, 0fffffffeh
L59d0::
    movsx eax, word ptr [edi]
    cmp eax, 050h
    jae L5a33
    movsx esi, word ptr [edi+02h]
    cmp esi, 03ch
    jae L5a33
    test dword ptr [ebp+028h], 01h
    je L5a00
    cmp eax, dword ptr [ebp+018h]
    jl L5a33
    cmp eax, dword ptr [ebp+020h]
    jge L5a33
    cmp esi, dword ptr [ebp+01ch]
    jl L5a33
    cmp esi, dword ptr [ebp+024h]
    jge L5a33
    jmp L5a14
L5a00::
    cmp eax, dword ptr [ebp+018h]
    jl L5a14
    cmp eax, dword ptr [ebp+020h]
    jge L5a14
    cmp esi, dword ptr [ebp+01ch]
    jl L5a14
    cmp esi, dword ptr [ebp+024h]
    jl L5a33
L5a14::
    imul esi, esi, 02800h
    shl eax, 04h
    add eax, esi
    mov dword ptr [edi], eax
    mov dl, 0ffh
    sub edi, 04h
    cmp edi, dword ptr [ebp+02ch]
    jae L59d0
    pop edx
    pop ecx
    pop ebx
    pop eax
    pop edi
    pop esi
    leave
    ret
L5a33::
    mov dword ptr [edi], edx
    sub edi, 04h
    cmp edi, dword ptr [ebp+02ch]
    jae L59d0
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
L5a88::
    add esi, 04h
    or cl, 0e0h
    jmp L1206
    align 4
L5a94::
    add esi, 04h
    or cl, 0e0h
    jmp L1265
    align 4
L5aa0::
    add esi, 04h
    or cl, 0e0h
    jmp L13ba
    align 4
L5aac::
    add esi, 04h
    or cl, 0e0h
    jmp L13d3
    align 4
L5ab8::
    add esi, 04h
    or cl, 0e0h
    jmp L13ee
    align 4
L5ac4::
    add esi, 04h
    or cl, 0e0h
    jmp L1409
    align 4
L5ad0::
    add esi, 04h
    or cl, 0e0h
    jmp L14a2
    align 4
L5adc::
    add esi, 04h
    or cl, 0e0h
    jmp L14b7
    align 4
L5ae8::
    add esi, 04h
    or cl, 0e0h
    jmp L14d0
    align 4
L5af4::
    add esi, 04h
    or cl, 0e0h
    jmp L1503
    align 4
L5b00::
    add esi, 04h
    or cl, 0e0h
    jmp L1525
    align 4
L5b0c::
    add esi, 04h
    or cl, 0e0h
    jmp L157b
    align 4
L5b18::
    add esi, 04h
    or cl, 0e0h
    jmp L174e
    align 4
L5b24::
    add esi, 04h
    or cl, 0e0h
    jmp L1767
    align 4
L5b30::
    add esi, 04h
    or cl, 0e0h
    jmp L17e0
    align 4
L5b3c::
    add esi, 04h
    or cl, 0e0h
    jmp L1801
    align 4
L5b48::
    add esi, 04h
    or cl, 0e0h
    jmp L1825
    align 4
L5b54::
    add esi, 04h
    or cl, 0e0h
    jmp L1845
    align 4
L5b60::
    add esi, 04h
    or cl, 0e0h
    jmp L1867
    align 4
L5b6c::
    add esi, 04h
    or cl, 0e0h
    jmp L188e
    align 4
L5b78::
    add esi, 04h
    or cl, 0e0h
    jmp L18b1
    align 4
L5b84::
    add esi, 04h
    or cl, 0e0h
    jmp L18d5
    align 4
L5b90::
    add esi, 04h
    or cl, 0e0h
    jmp L18f4
    align 4
L5b9c::
    add esi, 04h
    or cl, 0e0h
    jmp L1918
    align 4
L5ba8::
    add esi, 04h
    or cl, 0e0h
    jmp L193e
    align 4
L5bb4::
    add esi, 04h
    or cl, 0e0h
    jmp L195e
    align 4
L5bc0::
    add esi, 04h
    or cl, 0e0h
    jmp L1979
    align 4
L5bcc::
    add esi, 04h
    or cl, 0e0h
    jmp L199a
    align 4
L5bd8::
    add esi, 04h
    or cl, 0e0h
    jmp L19d4
    align 4
L5be4::
    add esi, 04h
    or cl, 0e0h
    jmp L19ed
    align 4
L5bf0::
    add esi, 04h
    or cl, 0e0h
    jmp L1a20
    align 4
L5bfc::
    add esi, 04h
    or cl, 0e0h
    jmp L1a42
    align 4
L5c08::
    add esi, 04h
    or cl, 0e0h
    jmp L1a64
    align 4
L5c14::
    add esi, 04h
    or cl, 0e0h
    jmp L1a9c
    align 4
L5c20::
    add esi, 04h
    or cl, 0e0h
    jmp L1ab5
    align 4
L5c2c::
    add esi, 04h
    or cl, 0e0h
    jmp L1ae8
    align 4
L5c38::
    add esi, 04h
    or cl, 0e0h
    jmp L1b0a
    align 4
L5c44::
    add esi, 04h
    or cl, 0e0h
    jmp L1b2c
    align 4
L5c50::
    add esi, 04h
    or cl, 0e0h
    jmp L1b65
    align 4
L5c5c::
    add esi, 04h
    or cl, 0e0h
    jmp L1b7e
    align 4
L5c68::
    add esi, 04h
    or cl, 0e0h
    jmp L1bb1
    align 4
L5c74::
    add esi, 04h
    or cl, 0e0h
    jmp L1bd3
    align 4
L5c80::
    add esi, 04h
    or cl, 0e0h
    jmp L1bf5
    align 4
L5c8c::
    add esi, 04h
    or cl, 0e0h
    jmp L1c2e
    align 4
L5c98::
    add esi, 04h
    or cl, 0e0h
    jmp L1c47
    align 4
L5ca4::
    add esi, 04h
    or cl, 0e0h
    jmp L1c7a
    align 4
L5cb0::
    add esi, 04h
    or cl, 0e0h
    jmp L1c9c
    align 4
L5cbc::
    add esi, 04h
    or cl, 0e0h
    jmp L1cbe
    align 4
L5cc8::
    add esi, 04h
    or cl, 0e0h
    jmp L1cf7
    align 4
L5cd4::
    add esi, 04h
    or cl, 0e0h
    jmp L1d10
    align 4
L5ce0::
    add esi, 04h
    or cl, 0e0h
    jmp L1d43
    align 4
L5cec::
    add esi, 04h
    or cl, 0e0h
    jmp L1d65
    align 4
L5cf8::
    add esi, 04h
    or cl, 0e0h
    jmp L1d87
    align 4
L5d04::
    add esi, 04h
    or cl, 0e0h
    jmp L1dc3
    align 4
L5d10::
    add esi, 04h
    or cl, 0e0h
    jmp L1ddc
    align 4
L5d1c::
    add esi, 04h
    or cl, 0e0h
    jmp L1e0f
    align 4
L5d28::
    add esi, 04h
    or cl, 0e0h
    jmp L1e31
    align 4
L5d34::
    add esi, 04h
    or cl, 0e0h
    jmp L1e53
    align 4
L5d40::
    add esi, 04h
    or cl, 0e0h
    jmp L1e8f
    align 4
L5d4c::
    add esi, 04h
    or cl, 0e0h
    jmp L1ea8
    align 4
L5d58::
    add esi, 04h
    or cl, 0e0h
    jmp L1edb
    align 4
L5d64::
    add esi, 04h
    or cl, 0e0h
    jmp L1efd
    align 4
L5d70::
    add esi, 04h
    or cl, 0e0h
    jmp L1f1f
    align 4
L5d7c::
    add esi, 04h
    or cl, 0e0h
    jmp L1f5b
    align 4
L5d88::
    add esi, 04h
    or cl, 0e0h
    jmp L1f74
    align 4
L5d94::
    add esi, 04h
    or cl, 0e0h
    jmp L1fa7
    align 4
L5da0::
    add esi, 04h
    or cl, 0e0h
    jmp L1fc9
    align 4
L5dac::
    add esi, 04h
    or cl, 0e0h
    jmp L1feb
    align 4
L5db8::
    add esi, 04h
    or cl, 0e0h
    jmp L209e
    align 4
L5dc4::
    add esi, 04h
    or cl, 0e0h
    jmp L20b7
    align 4
L5dd0::
    add esi, 04h
    or cl, 0e0h
    jmp L20ea
    align 4
L5ddc::
    add esi, 04h
    or cl, 0e0h
    jmp L210c
    align 4
L5de8::
    add esi, 04h
    or cl, 0e0h
    jmp L212e
    align 4
L5df4::
    add esi, 04h
    or cl, 0e0h
    jmp L216a
    align 4
L5e00::
    add esi, 04h
    or cl, 0e0h
    jmp L2183
    align 4
L5e0c::
    add esi, 04h
    or cl, 0e0h
    jmp L21b6
    align 4
L5e18::
    add esi, 04h
    or cl, 0e0h
    jmp L21d8
    align 4
L5e24::
    add esi, 04h
    or cl, 0e0h
    jmp L21fa
    align 4
L5e30::
    add esi, 04h
    or cl, 0e0h
    jmp L2236
    align 4
L5e3c::
    add esi, 04h
    or cl, 0e0h
    jmp L224f
    align 4
L5e48::
    add esi, 04h
    or cl, 0e0h
    jmp L2282
    align 4
L5e54::
    add esi, 04h
    or cl, 0e0h
    jmp L22a4
    align 4
L5e60::
    add esi, 04h
    or cl, 0e0h
    jmp L22c6
    align 4
L5e6c::
    add esi, 04h
    or cl, 0e0h
    jmp L2302
    align 4
L5e78::
    add esi, 04h
    or cl, 0e0h
    jmp L231b
    align 4
L5e84::
    add esi, 04h
    or cl, 0e0h
    jmp L234e
    align 4
L5e90::
    add esi, 04h
    or cl, 0e0h
    jmp L2370
    align 4
L5e9c::
    add esi, 04h
    or cl, 0e0h
    jmp L2392
    align 4
L5ea8::
    add esi, 04h
    or cl, 0e0h
    jmp L23ce
    align 4
L5eb4::
    add esi, 04h
    or cl, 0e0h
    jmp L23e7
    align 4
L5ec0::
    add esi, 04h
    or cl, 0e0h
    jmp L241a
    align 4
L5ecc::
    add esi, 04h
    or cl, 0e0h
    jmp L243c
    align 4
L5ed8::
    add esi, 04h
    or cl, 0e0h
    jmp L245e
    align 4
L5ee4::
    add esi, 04h
    or cl, 0e0h
    jmp L249a
    align 4
L5ef0::
    add esi, 04h
    or cl, 0e0h
    jmp L24b3
    align 4
L5efc::
    add esi, 04h
    or cl, 0e0h
    jmp L24e6
    align 4
L5f08::
    add esi, 04h
    or cl, 0e0h
    jmp L2508
    align 4
L5f14::
    add esi, 04h
    or cl, 0e0h
    jmp L252a
    align 4
L5f20::
    add esi, 04h
    or cl, 0e0h
    jmp L2566
    align 4
L5f2c::
    add esi, 04h
    or cl, 0e0h
    jmp L257f
    align 4
L5f38::
    add esi, 04h
    or cl, 0e0h
    jmp L25b2
    align 4
L5f44::
    add esi, 04h
    or cl, 0e0h
    jmp L25d4
    align 4
L5f50::
    add esi, 04h
    or cl, 0e0h
    jmp L25f6
    align 4
L5f5c::
    add esi, 04h
    or cl, 0e0h
    jmp L2632
    align 4
L5f68::
    add esi, 04h
    or cl, 0e0h
    jmp L264b
    align 4
L5f74::
    add esi, 04h
    or cl, 0e0h
    jmp L267e
    align 4
L5f80::
    add esi, 04h
    or cl, 0e0h
    jmp L26a0
    align 4
L5f8c::
    add esi, 04h
    or cl, 0e0h
    jmp L26c2
    align 4
L5f98::
    add esi, 04h
    or cl, 0e0h
    jmp L2778
    align 4
L5fa4::
    add esi, 04h
    or cl, 0e0h
    jmp L2791
    align 4
L5fb0::
    add esi, 04h
    or cl, 0e0h
    jmp L27c4
    align 4
L5fbc::
    add esi, 04h
    or cl, 0e0h
    jmp L27e6
    align 4
L5fc8::
    add esi, 04h
    or cl, 0e0h
    jmp L2808
    align 4
L5fd4::
    add esi, 04h
    or cl, 0e0h
    jmp L2838
    align 4
L5fe0::
    add esi, 04h
    or cl, 0e0h
    jmp L285a
    align 4
L5fec::
    add esi, 04h
    or cl, 0e0h
    jmp L289a
    align 4
L5ff8::
    add esi, 04h
    or cl, 0e0h
    jmp L2934
    align 4
L6004::
    add esi, 04h
    or cl, 0e0h
    jmp L2949
    align 4
L6010::
    add esi, 04h
    or cl, 0e0h
    jmp L2962
    align 4
L601c::
    add esi, 04h
    or cl, 0e0h
    jmp L2995
    align 4
L6028::
    add esi, 04h
    or cl, 0e0h
    jmp L29b7
    align 4
L6034::
    add esi, 04h
    or cl, 0e0h
    jmp L2a0d
    align 4
L6040::
    add esi, 04h
    or cl, 0e0h
    jmp L2d0a
    align 4
L604c::
    add esi, 04h
    or cl, 0e0h
    jmp L2d23
    align 4
L6058::
    add esi, 04h
    or cl, 0e0h
    jmp L2d9c
    align 4
L6064::
    add esi, 04h
    or cl, 0e0h
    jmp L2dbd
    align 4
L6070::
    add esi, 04h
    or cl, 0e0h
    jmp L2de1
    align 4
L607c::
    add esi, 04h
    or cl, 0e0h
    jmp L2e01
    align 4
L6088::
    add esi, 04h
    or cl, 0e0h
    jmp L2e23
    align 4
L6094::
    add esi, 04h
    or cl, 0e0h
    jmp L2e4a
    align 4
L60a0::
    add esi, 04h
    or cl, 0e0h
    jmp L2e6d
    align 4
L60ac::
    add esi, 04h
    or cl, 0e0h
    jmp L2e91
    align 4
L60b8::
    add esi, 04h
    or cl, 0e0h
    jmp L2eb0
    align 4
L60c4::
    add esi, 04h
    or cl, 0e0h
    jmp L2ed4
    align 4
L60d0::
    add esi, 04h
    or cl, 0e0h
    jmp L2efa
    align 4
L60dc::
    add esi, 04h
    or cl, 0e0h
    jmp L2f1a
    align 4
L60e8::
    add esi, 04h
    or cl, 0e0h
    jmp L2f35
    align 4
L60f4::
    add esi, 04h
    or cl, 0e0h
    jmp L2f56
    align 4
L6100::
    add esi, 04h
    or cl, 0e0h
    jmp L2f90
    align 4
L610c::
    add esi, 04h
    or cl, 0e0h
    jmp L2fa9
    align 4
L6118::
    add esi, 04h
    or cl, 0e0h
    jmp L2fdc
    align 4
L6124::
    add esi, 04h
    or cl, 0e0h
    jmp L2ffe
    align 4
L6130::
    add esi, 04h
    or cl, 0e0h
    jmp L3020
    align 4
L613c::
    add esi, 04h
    or cl, 0e0h
    jmp L305f
    align 4
L6148::
    add esi, 04h
    or cl, 0e0h
    jmp L3078
    align 4
L6154::
    add esi, 04h
    or cl, 0e0h
    jmp L30ab
    align 4
L6160::
    add esi, 04h
    or cl, 0e0h
    jmp L30cd
    align 4
L616c::
    add esi, 04h
    or cl, 0e0h
    jmp L30ef
    align 4
L6178::
    add esi, 04h
    or cl, 0e0h
    jmp L3135
    align 4
L6184::
    add esi, 04h
    or cl, 0e0h
    jmp L314e
    align 4
L6190::
    add esi, 04h
    or cl, 0e0h
    jmp L3181
    align 4
L619c::
    add esi, 04h
    or cl, 0e0h
    jmp L31a3
    align 4
L61a8::
    add esi, 04h
    or cl, 0e0h
    jmp L31c5
    align 4
L61b4::
    add esi, 04h
    or cl, 0e0h
    jmp L320b
    align 4
L61c0::
    add esi, 04h
    or cl, 0e0h
    jmp L3224
    align 4
L61cc::
    add esi, 04h
    or cl, 0e0h
    jmp L3257
    align 4
L61d8::
    add esi, 04h
    or cl, 0e0h
    jmp L3279
    align 4
L61e4::
    add esi, 04h
    or cl, 0e0h
    jmp L329b
    align 4
L61f0::
    add esi, 04h
    or cl, 0e0h
    jmp L32e1
    align 4
L61fc::
    add esi, 04h
    or cl, 0e0h
    jmp L32fa
    align 4
L6208::
    add esi, 04h
    or cl, 0e0h
    jmp L332d
    align 4
L6214::
    add esi, 04h
    or cl, 0e0h
    jmp L334f
    align 4
L6220::
    add esi, 04h
    or cl, 0e0h
    jmp L3371
    align 4
L622c::
    add esi, 04h
    or cl, 0e0h
    jmp L33bb
    align 4
L6238::
    add esi, 04h
    or cl, 0e0h
    jmp L33d4
    align 4
L6244::
    add esi, 04h
    or cl, 0e0h
    jmp L3407
    align 4
L6250::
    add esi, 04h
    or cl, 0e0h
    jmp L3429
    align 4
L625c::
    add esi, 04h
    or cl, 0e0h
    jmp L344b
    align 4
L6268::
    add esi, 04h
    or cl, 0e0h
    jmp L3495
    align 4
L6274::
    add esi, 04h
    or cl, 0e0h
    jmp L34ae
    align 4
L6280::
    add esi, 04h
    or cl, 0e0h
    jmp L34e1
    align 4
L628c::
    add esi, 04h
    or cl, 0e0h
    jmp L3503
    align 4
L6298::
    add esi, 04h
    or cl, 0e0h
    jmp L3525
    align 4
L62a4::
    add esi, 04h
    or cl, 0e0h
    jmp L356f
    align 4
L62b0::
    add esi, 04h
    or cl, 0e0h
    jmp L3588
    align 4
L62bc::
    add esi, 04h
    or cl, 0e0h
    jmp L35bb
    align 4
L62c8::
    add esi, 04h
    or cl, 0e0h
    jmp L35dd
    align 4
L62d4::
    add esi, 04h
    or cl, 0e0h
    jmp L35ff
    align 4
L62e0::
    add esi, 04h
    or cl, 0e0h
    jmp L36c0
    align 4
L62ec::
    add esi, 04h
    or cl, 0e0h
    jmp L36d9
    align 4
L62f8::
    add esi, 04h
    or cl, 0e0h
    jmp L370c
    align 4
L6304::
    add esi, 04h
    or cl, 0e0h
    jmp L372e
    align 4
L6310::
    add esi, 04h
    or cl, 0e0h
    jmp L3750
    align 4
L631c::
    add esi, 04h
    or cl, 0e0h
    jmp L379a
    align 4
L6328::
    add esi, 04h
    or cl, 0e0h
    jmp L37b3
    align 4
L6334::
    add esi, 04h
    or cl, 0e0h
    jmp L37e6
    align 4
L6340::
    add esi, 04h
    or cl, 0e0h
    jmp L3808
    align 4
L634c::
    add esi, 04h
    or cl, 0e0h
    jmp L382a
    align 4
L6358::
    add esi, 04h
    or cl, 0e0h
    jmp L3874
    align 4
L6364::
    add esi, 04h
    or cl, 0e0h
    jmp L388d
    align 4
L6370::
    add esi, 04h
    or cl, 0e0h
    jmp L38c0
    align 4
L637c::
    add esi, 04h
    or cl, 0e0h
    jmp L38e2
    align 4
L6388::
    add esi, 04h
    or cl, 0e0h
    jmp L3904
    align 4
L6394::
    add esi, 04h
    or cl, 0e0h
    jmp L394e
    align 4
L63a0::
    add esi, 04h
    or cl, 0e0h
    jmp L3967
    align 4
L63ac::
    add esi, 04h
    or cl, 0e0h
    jmp L399a
    align 4
L63b8::
    add esi, 04h
    or cl, 0e0h
    jmp L39bc
    align 4
L63c4::
    add esi, 04h
    or cl, 0e0h
    jmp L39de
    align 4
L63d0::
    add esi, 04h
    or cl, 0e0h
    jmp L3a28
    align 4
L63dc::
    add esi, 04h
    or cl, 0e0h
    jmp L3a41
    align 4
L63e8::
    add esi, 04h
    or cl, 0e0h
    jmp L3a74
    align 4
L63f4::
    add esi, 04h
    or cl, 0e0h
    jmp L3a96
    align 4
L6400::
    add esi, 04h
    or cl, 0e0h
    jmp L3ab8
    align 4
L640c::
    add esi, 04h
    or cl, 0e0h
    jmp L3b02
    align 4
L6418::
    add esi, 04h
    or cl, 0e0h
    jmp L3b1b
    align 4
L6424::
    add esi, 04h
    or cl, 0e0h
    jmp L3b4e
    align 4
L6430::
    add esi, 04h
    or cl, 0e0h
    jmp L3b70
    align 4
L643c::
    add esi, 04h
    or cl, 0e0h
    jmp L3b92
    align 4
L6448::
    add esi, 04h
    or cl, 0e0h
    jmp L3bdc
    align 4
L6454::
    add esi, 04h
    or cl, 0e0h
    jmp L3bf5
    align 4
L6460::
    add esi, 04h
    or cl, 0e0h
    jmp L3c28
    align 4
L646c::
    add esi, 04h
    or cl, 0e0h
    jmp L3c4a
    align 4
L6478::
    add esi, 04h
    or cl, 0e0h
    jmp L3c6c
    align 4
L6484::
    add esi, 04h
    or cl, 0e0h
    jmp L3cb6
    align 4
L6490::
    add esi, 04h
    or cl, 0e0h
    jmp L3ccf
    align 4
L649c::
    add esi, 04h
    or cl, 0e0h
    jmp L3d02
    align 4
L64a8::
    add esi, 04h
    or cl, 0e0h
    jmp L3d24
    align 4
L64b4::
    add esi, 04h
    or cl, 0e0h
    jmp L3d46
    align 4
L64c0::
    add esi, 04h
    or cl, 0e0h
    jmp L3e0a
    align 4
L64cc::
    add esi, 04h
    or cl, 0e0h
    jmp L3e23
    align 4
L64d8::
    add esi, 04h
    or cl, 0e0h
    jmp L3e56
    align 4
L64e4::
    add esi, 04h
    or cl, 0e0h
    jmp L3e78
    align 4
L64f0::
    add esi, 04h
    or cl, 0e0h
    jmp L3e9a
    align 4
L64fc::
    add esi, 04h
    or cl, 0e0h
    jmp L3eca
    align 4
L6508::
    add esi, 04h
    or cl, 0e0h
    jmp L3eec
    align 4
L6514::
    add esi, 04h
    or cl, 0e0h
    jmp L3f2c
    align 4
L6520::
    add esi, 04h
    or cl, 0e0h
    jmp L3fcc
    align 4
L652c::
    add esi, 04h
    or cl, 0e0h
    jmp L3fe5
    align 4
L6538::
    add esi, 04h
    or cl, 0e0h
    jmp L4000
    align 4
L6544::
    add esi, 04h
    or cl, 0e0h
    jmp L401b
    align 4
L6550::
    add esi, 04h
    or cl, 0e0h
    jmp L40af
    align 4
L655c::
    add esi, 04h
    or cl, 0e0h
    jmp L40c4
    align 4
L6568::
    add esi, 04h
    or cl, 0e0h
    jmp L40dd
    align 4
L6574::
    add esi, 04h
    or cl, 0e0h
    jmp L4110
    align 4
L6580::
    add esi, 04h
    or cl, 0e0h
    jmp L4132
    align 4
L658c::
    add esi, 04h
    or cl, 0e0h
    jmp L4188
    align 4
L6598::
    add esi, 04h
    or cl, 0e0h
    jmp L4575
    align 4
L65a4::
    add esi, 04h
    or cl, 0e0h
    jmp L458e
    align 4
L65b0::
    add esi, 04h
    or cl, 0e0h
    jmp L4607
    align 4
L65bc::
    add esi, 04h
    or cl, 0e0h
    jmp L4628
    align 4
L65c8::
    add esi, 04h
    or cl, 0e0h
    jmp L464c
    align 4
L65d4::
    add esi, 04h
    or cl, 0e0h
    jmp L466c
    align 4
L65e0::
    add esi, 04h
    or cl, 0e0h
    jmp L468e
    align 4
L65ec::
    add esi, 04h
    or cl, 0e0h
    jmp L46b5
    align 4
L65f8::
    add esi, 04h
    or cl, 0e0h
    jmp L46d8
    align 4
L6604::
    add esi, 04h
    or cl, 0e0h
    jmp L46fc
    align 4
L6610::
    add esi, 04h
    or cl, 0e0h
    jmp L471b
    align 4
L661c::
    add esi, 04h
    or cl, 0e0h
    jmp L473f
    align 4
L6628::
    add esi, 04h
    or cl, 0e0h
    jmp L4765
    align 4
L6634::
    add esi, 04h
    or cl, 0e0h
    jmp L4785
    align 4
L6640::
    add esi, 04h
    or cl, 0e0h
    jmp L47a0
    align 4
L664c::
    add esi, 04h
    or cl, 0e0h
    jmp L47c1
    align 4
L6658::
    add esi, 04h
    or cl, 0e0h
    jmp L47fb
    align 4
L6664::
    add esi, 04h
    or cl, 0e0h
    jmp L4814
    align 4
L6670::
    add esi, 04h
    or cl, 0e0h
    jmp L4847
    align 4
L667c::
    add esi, 04h
    or cl, 0e0h
    jmp L4869
    align 4
L6688::
    add esi, 04h
    or cl, 0e0h
    jmp L488b
    align 4
L6694::
    add esi, 04h
    or cl, 0e0h
    jmp L48d8
    align 4
L66a0::
    add esi, 04h
    or cl, 0e0h
    jmp L48f1
    align 4
L66ac::
    add esi, 04h
    or cl, 0e0h
    jmp L4924
    align 4
L66b8::
    add esi, 04h
    or cl, 0e0h
    jmp L4946
    align 4
L66c4::
    add esi, 04h
    or cl, 0e0h
    jmp L4968
    align 4
L66d0::
    add esi, 04h
    or cl, 0e0h
    jmp L49bc
    align 4
L66dc::
    add esi, 04h
    or cl, 0e0h
    jmp L49d5
    align 4
L66e8::
    add esi, 04h
    or cl, 0e0h
    jmp L4a08
    align 4
L66f4::
    add esi, 04h
    or cl, 0e0h
    jmp L4a2a
    align 4
L6700::
    add esi, 04h
    or cl, 0e0h
    jmp L4a4c
    align 4
L670c::
    add esi, 04h
    or cl, 0e0h
    jmp L4aa0
    align 4
L6718::
    add esi, 04h
    or cl, 0e0h
    jmp L4ab9
    align 4
L6724::
    add esi, 04h
    or cl, 0e0h
    jmp L4aec
    align 4
L6730::
    add esi, 04h
    or cl, 0e0h
    jmp L4b0e
    align 4
L673c::
    add esi, 04h
    or cl, 0e0h
    jmp L4b30
    align 4
L6748::
    add esi, 04h
    or cl, 0e0h
    jmp L4b84
    align 4
L6754::
    add esi, 04h
    or cl, 0e0h
    jmp L4b9d
    align 4
L6760::
    add esi, 04h
    or cl, 0e0h
    jmp L4bd0
    align 4
L676c::
    add esi, 04h
    or cl, 0e0h
    jmp L4bf2
    align 4
L6778::
    add esi, 04h
    or cl, 0e0h
    jmp L4c14
    align 4
L6784::
    add esi, 04h
    or cl, 0e0h
    jmp L4c6c
    align 4
L6790::
    add esi, 04h
    or cl, 0e0h
    jmp L4c85
    align 4
L679c::
    add esi, 04h
    or cl, 0e0h
    jmp L4cb8
    align 4
L67a8::
    add esi, 04h
    or cl, 0e0h
    jmp L4cda
    align 4
L67b4::
    add esi, 04h
    or cl, 0e0h
    jmp L4cfc
    align 4
L67c0::
    add esi, 04h
    or cl, 0e0h
    jmp L4d54
    align 4
L67cc::
    add esi, 04h
    or cl, 0e0h
    jmp L4d6d
    align 4
L67d8::
    add esi, 04h
    or cl, 0e0h
    jmp L4da0
    align 4
L67e4::
    add esi, 04h
    or cl, 0e0h
    jmp L4dc2
    align 4
L67f0::
    add esi, 04h
    or cl, 0e0h
    jmp L4de4
    align 4
L67fc::
    add esi, 04h
    or cl, 0e0h
    jmp L4e3c
    align 4
L6808::
    add esi, 04h
    or cl, 0e0h
    jmp L4e55
    align 4
L6814::
    add esi, 04h
    or cl, 0e0h
    jmp L4e88
    align 4
L6820::
    add esi, 04h
    or cl, 0e0h
    jmp L4eaa
    align 4
L682c::
    add esi, 04h
    or cl, 0e0h
    jmp L4ecc
    align 4
L6838::
    add esi, 04h
    or cl, 0e0h
    jmp L4f9b
    align 4
L6844::
    add esi, 04h
    or cl, 0e0h
    jmp L4fb4
    align 4
L6850::
    add esi, 04h
    or cl, 0e0h
    jmp L4fe7
    align 4
L685c::
    add esi, 04h
    or cl, 0e0h
    jmp L5009
    align 4
L6868::
    add esi, 04h
    or cl, 0e0h
    jmp L502b
    align 4
L6874::
    add esi, 04h
    or cl, 0e0h
    jmp L5083
    align 4
L6880::
    add esi, 04h
    or cl, 0e0h
    jmp L509c
    align 4
L688c::
    add esi, 04h
    or cl, 0e0h
    jmp L50cf
    align 4
L6898::
    add esi, 04h
    or cl, 0e0h
    jmp L50f1
    align 4
L68a4::
    add esi, 04h
    or cl, 0e0h
    jmp L5113
    align 4
L68b0::
    add esi, 04h
    or cl, 0e0h
    jmp L516b
    align 4
L68bc::
    add esi, 04h
    or cl, 0e0h
    jmp L5184
    align 4
L68c8::
    add esi, 04h
    or cl, 0e0h
    jmp L51b7
    align 4
L68d4::
    add esi, 04h
    or cl, 0e0h
    jmp L51d9
    align 4
L68e0::
    add esi, 04h
    or cl, 0e0h
    jmp L51fb
    align 4
L68ec::
    add esi, 04h
    or cl, 0e0h
    jmp L5253
    align 4
L68f8::
    add esi, 04h
    or cl, 0e0h
    jmp L526c
    align 4
L6904::
    add esi, 04h
    or cl, 0e0h
    jmp L529f
    align 4
L6910::
    add esi, 04h
    or cl, 0e0h
    jmp L52c1
    align 4
L691c::
    add esi, 04h
    or cl, 0e0h
    jmp L52e3
    align 4
L6928::
    add esi, 04h
    or cl, 0e0h
    jmp L533b
    align 4
L6934::
    add esi, 04h
    or cl, 0e0h
    jmp L5354
    align 4
L6940::
    add esi, 04h
    or cl, 0e0h
    jmp L5387
    align 4
L694c::
    add esi, 04h
    or cl, 0e0h
    jmp L53a9
    align 4
L6958::
    add esi, 04h
    or cl, 0e0h
    jmp L53cb
    align 4
L6964::
    add esi, 04h
    or cl, 0e0h
    jmp L5423
    align 4
L6970::
    add esi, 04h
    or cl, 0e0h
    jmp L543c
    align 4
L697c::
    add esi, 04h
    or cl, 0e0h
    jmp L546f
    align 4
L6988::
    add esi, 04h
    or cl, 0e0h
    jmp L5491
    align 4
L6994::
    add esi, 04h
    or cl, 0e0h
    jmp L54b3
    align 4
L69a0::
    add esi, 04h
    or cl, 0e0h
    jmp L550b
    align 4
L69ac::
    add esi, 04h
    or cl, 0e0h
    jmp L5524
    align 4
L69b8::
    add esi, 04h
    or cl, 0e0h
    jmp L5557
    align 4
L69c4::
    add esi, 04h
    or cl, 0e0h
    jmp L5579
    align 4
L69d0::
    add esi, 04h
    or cl, 0e0h
    jmp L559b
    align 4
L69dc::
    add esi, 04h
    or cl, 0e0h
    jmp L55f3
    align 4
L69e8::
    add esi, 04h
    or cl, 0e0h
    jmp L560c
    align 4
L69f4::
    add esi, 04h
    or cl, 0e0h
    jmp L563f
    align 4
L6a00::
    add esi, 04h
    or cl, 0e0h
    jmp L5661
    align 4
L6a0c::
    add esi, 04h
    or cl, 0e0h
    jmp L5683
    align 4
L6a18::
    add esi, 04h
    or cl, 0e0h
    jmp L5755
    align 4
L6a24::
    add esi, 04h
    or cl, 0e0h
    jmp L576e
    align 4
L6a30::
    add esi, 04h
    or cl, 0e0h
    jmp L57a1
    align 4
L6a3c::
    add esi, 04h
    or cl, 0e0h
    jmp L57c3
    align 4
L6a48::
    add esi, 04h
    or cl, 0e0h
    jmp L57e5
    align 4
L6a54::
    add esi, 04h
    or cl, 0e0h
    jmp L5815
    align 4
L6a60::
    add esi, 04h
    or cl, 0e0h
    jmp L5837
    align 4
L6a6c::
    add esi, 04h
    or cl, 0e0h
    jmp L5877
    align 4
L6a78::
    add esi, 04h
    mov edx, dword ptr [esi+04h]
    or cl, 0e0h
    jmp L1233
    align 4
L6a88::
    add esi, 04h
    mov edx, dword ptr [esi+04h]
    or cl, 0e0h
    jmp L1298
    align 4
L6a98::
    add esi, 04h
    mov edx, dword ptr [esi+04h]
    or cl, 0e0h
    jmp L1305
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
D6ae8 dword 0
D6aec dword 0
D6af0 dword 2 dup(0)
D6af8 dword 0
D6afc dword 0
D6b00 dword 0
D6b04 dword 0
frame_buffer dword 0
block_count dword 0
D6b10 dword 0
D6b14 byte 0
D6b15 byte 3 dup(0)
bit_masks dword 01h, 02h, 04h, 08h, 010h, 020h, 040h, 080h
    dword 0100h, 0200h, 0400h, 0800h, 01000h, 02000h, 04000h, 08000h
    dword 010000h, 020000h, 040000h, 080000h, 0100000h, 0200000h, 0400000h, 0800000h
    dword 01000000h, 02000000h, 04000000h, 08000000h, 010000000h, 020000000h, 040000000h, 080000000h
D6b98 dword 0
D6b9c dword 0
D6ba0 byte 0
    align 4
frame_flags dword 0
D6ba8 dword 0
D6bac dword 0
D6bb0 dword 0
D6bb4 dword 0
D6bb8 dword 0
D6bbc dword 0
D6bc0 dword 0
D6bc4 dword 0
D6bc8 dword 0
D6bcc dword 0
D6bd0 dword 0
D6bd4 dword 0
D6bd8 dword 0
D6bdc byte 0
D6bdd byte 0
D6bde byte 0
D6bdf byte 5 dup(0)
D6be4 dword 128 dup(0)
bank_shift byte 0
    align 4
_TEXT ends


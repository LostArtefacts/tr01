    .386p
    .model flat

    .code

    public phd_FixedDivide_
phd_FixedDivide_ proc near
    push    edx
    push    ebx
    mov     ebx,edx
    mov     edx,eax
    shl     eax,18h
    sar     edx,8
    idiv    ebx
    pop     ebx
    pop     edx
    ret
phd_FixedDivide_ endp

    end

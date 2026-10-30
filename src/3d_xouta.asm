    .486p
    .model flat

    extrn _phd_scrwidth:dword
    extrn _phd_winptr:dword
    extrn _xbuffer:word

    .code

    public flatA_
flatA_ proc near
    pusha
    sub     edx,eax
    jle     l4
    mov     esi,eax
    shl     esi,3
    add     esi,offset _xbuffer+2
    imul    eax,dword ptr _phd_scrwidth
    add     eax,dword ptr _phd_winptr
    mov     ebp,eax
    cld
    mov     bh,bl
    mov     ax,bx
    bswap   eax
    mov     ax,bx
l1:
    movsx   ecx,word ptr [esi]
    movsx   ebx,word ptr [esi+4]
    sub     ebx,ecx
    jle     l3
    lea     edi,[ecx+ebp*1]
    neg     ecx
    and     ecx,3
    cmp     ecx,ebx
    jge     l2
    sub     ebx,ecx
    rep stosb
    mov     ecx,ebx
    sar     ecx,2
    rep stosd
    and     ebx,3
l2:
    mov     ecx,ebx
    rep stosb
l3:
    add     esi,8
    add     ebp,dword ptr _phd_scrwidth
    dec     edx
    jne     l1
l4:
    popa
    ret
flatA_ endp

    end

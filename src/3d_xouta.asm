    .486p
    .model flat

    extrn _depthq_table:byte
    extrn _gouraud_table:byte
    extrn _phd_scrwidth:dword
    extrn _phd_winptr:dword
    extrn _phd_winwidth:dword
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

    public transA_
transA_ proc near
    pusha
    sub     esp,8
    sub     edx,eax
    jle     l8
    mov     dword ptr [esp+4],edx
    lea     esi,_depthq_table
    and     ebx,1fh
    shl     ebx,8
    add     esi,ebx
    mov     ebp,eax
    shl     ebp,3
    add     ebp,offset _xbuffer+2
    imul    eax,dword ptr _phd_scrwidth
    add     eax,dword ptr _phd_winptr
    mov     dword ptr [esp],eax
    xor     eax,eax
l1:
    movsx   edi,word ptr [ebp+0]
    test    edi,edi
    jns     l2
    xor     edi,edi
l2:
    movsx   ecx,word ptr [ebp+4]
    cmp     ecx,dword ptr _phd_winwidth
    jle     l3
    mov     ecx,dword ptr _phd_winwidth
l3:
    sub     ecx,edi
    jle     l7
    add     edi,dword ptr [esp]
    test    edi,1
    je      l4
    mov     al,byte ptr [edi]
    mov     dl,byte ptr [eax+esi*1]
    mov     byte ptr [edi],dl
    dec     ecx
    inc     edi
l4:
    sub     ecx,10h
    js      l5
    mov     ebx,dword ptr [edi]
    mov     al,bl
    mov     dl,byte ptr [eax+esi*1]
    mov     al,bh
    mov     dh,byte ptr [eax+esi*1]
    bswap   ebx
    mov     word ptr [edi],dx
    mov     al,bh
    mov     dl,byte ptr [eax+esi*1]
    mov     al,bl
    mov     dh,byte ptr [eax+esi*1]
    mov     word ptr [edi+2],dx
    add     edi,4
    mov     ebx,dword ptr [edi]
    mov     al,bl
    mov     dl,byte ptr [eax+esi*1]
    mov     al,bh
    mov     dh,byte ptr [eax+esi*1]
    bswap   ebx
    mov     word ptr [edi],dx
    mov     al,bh
    mov     dl,byte ptr [eax+esi*1]
    mov     al,bl
    mov     dh,byte ptr [eax+esi*1]
    mov     word ptr [edi+2],dx
    add     edi,4
    mov     ebx,dword ptr [edi]
    mov     al,bl
    mov     dl,byte ptr [eax+esi*1]
    mov     al,bh
    mov     dh,byte ptr [eax+esi*1]
    bswap   ebx
    mov     word ptr [edi],dx
    mov     al,bh
    mov     dl,byte ptr [eax+esi*1]
    mov     al,bl
    mov     dh,byte ptr [eax+esi*1]
    mov     word ptr [edi+2],dx
    add     edi,4
    mov     ebx,dword ptr [edi]
    mov     al,bl
    mov     dl,byte ptr [eax+esi*1]
    mov     al,bh
    mov     dh,byte ptr [eax+esi*1]
    bswap   ebx
    mov     word ptr [edi],dx
    mov     al,bh
    mov     dl,byte ptr [eax+esi*1]
    mov     al,bl
    mov     dh,byte ptr [eax+esi*1]
    mov     word ptr [edi+2],dx
    add     edi,4
    jmp     l4
l5:
    add     ecx,10h
    jle     l7
l6:
    mov     al,byte ptr [edi]
    mov     dl,byte ptr [eax+esi*1]
    mov     byte ptr [edi],dl
    inc     edi
    dec     ecx
    jne     l6
l7:
    mov     ebx,dword ptr _phd_scrwidth
    add     ebp,8
    add     dword ptr [esp],ebx
    dec     dword ptr [esp+4]
    jne     l1
l8:
    add     esp,8
    popa
    ret
transA_ endp

    public gourA_
gourA_ proc near
    push    ecx
    push    esi
    push    edi
    push    ebp
    sub     esp,10h
    sub     edx,eax
    jle     l8
    mov     dword ptr [esp+4],edx
    mov     ecx,eax
    shl     ecx,4
    add     ecx,offset _xbuffer
    mov     dword ptr [esp+8],ecx
    imul    eax,dword ptr _phd_scrwidth
    add     eax,dword ptr _phd_winptr
    mov     dword ptr [esp+0ch],eax
    movzx   ebx,bx
    shl     ebx,5
    add     ebx,offset _gouraud_table
    mov     dword ptr [esp],ebx
l1:
    mov     eax,dword ptr [esp+8]
    movsx   ebx,word ptr [eax+0ah]
    movsx   edi,word ptr [eax+2]
    test    ebx,ebx
    jle     l7
    cmp     edi,ebx
    jge     l7
    cmp     edi,dword ptr _phd_winwidth
    jge     l7
    mov     ecx,dword ptr [eax+4]
    mov     ebp,ebx
    mov     edx,dword ptr [eax+0ch]
    sub     edx,ecx
    sub     ebx,edi
    mov     eax,edx
    sar     edx,1fh
    idiv    ebx
    test    edi,edi
    jns     l2
    imul    edi,eax
    sub     ecx,edi
    xor     edi,edi
l2:
    mov     edx,dword ptr _phd_winwidth
    cmp     edx,ebp
    jge     l3
    mov     ebp,edx
l3:
    sub     ebp,edi
    add     edi,dword ptr [esp+0ch]
    mov     edx,eax
    mov     esi,ecx
    sar     eax,10h
    sar     ecx,10h
    shl     edx,10h
    shl     esi,10h
    add     ecx,dword ptr [esp]
    test    edi,1
    je      l4
    mov     bl,byte ptr [ecx]
    add     esi,edx
    mov     byte ptr [edi],bl
    adc     ecx,eax
    dec     ebp
    inc     edi
l4:
    sub     ebp,10h
    js      l5
    mov     bl,byte ptr [ecx]
    add     esi,edx
    adc     ecx,eax
    mov     bh,byte ptr [ecx]
    add     esi,edx
    mov     word ptr [edi],bx
    adc     ecx,eax
    mov     bl,byte ptr [ecx]
    add     esi,edx
    adc     ecx,eax
    mov     bh,byte ptr [ecx]
    add     esi,edx
    mov     word ptr [edi+2],bx
    adc     ecx,eax
    mov     bl,byte ptr [ecx]
    add     esi,edx
    adc     ecx,eax
    mov     bh,byte ptr [ecx]
    add     esi,edx
    mov     word ptr [edi+4],bx
    adc     ecx,eax
    mov     bl,byte ptr [ecx]
    add     esi,edx
    adc     ecx,eax
    mov     bh,byte ptr [ecx]
    add     esi,edx
    mov     word ptr [edi+6],bx
    adc     ecx,eax
    mov     bl,byte ptr [ecx]
    add     esi,edx
    adc     ecx,eax
    mov     bh,byte ptr [ecx]
    add     esi,edx
    mov     word ptr [edi+8],bx
    adc     ecx,eax
    mov     bl,byte ptr [ecx]
    add     esi,edx
    adc     ecx,eax
    mov     bh,byte ptr [ecx]
    add     esi,edx
    mov     word ptr [edi+0ah],bx
    adc     ecx,eax
    mov     bl,byte ptr [ecx]
    add     esi,edx
    adc     ecx,eax
    mov     bh,byte ptr [ecx]
    add     esi,edx
    mov     word ptr [edi+0ch],bx
    adc     ecx,eax
    mov     bl,byte ptr [ecx]
    add     esi,edx
    adc     ecx,eax
    mov     bh,byte ptr [ecx]
    add     esi,edx
    mov     word ptr [edi+0eh],bx
    adc     ecx,eax
    add     edi,10h
    jmp     l4
l5:
    add     ebp,10h
    jle     l7
l6:
    mov     bl,byte ptr [ecx]
    add     esi,edx
    mov     byte ptr [edi],bl
    adc     ecx,eax
    inc     edi
    dec     ebp
    jne     l6
l7:
    mov     eax,_phd_scrwidth
    add     dword ptr [esp+8],10h
    add     dword ptr [esp+0ch],eax
    dec     dword ptr [esp+4]
    jne     l1
l8:
    add     esp,10h
    pop     ebp
    pop     edi
    pop     esi
    pop     ecx
    ret
gourA_ endp

    end

    .486p
    .model flat

    extrn _depthq_table:byte
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

    end

    .486p
    .model flat

    extrn _depthq_table:byte
    extrn _gouraud_table:byte
    extrn _phd_scrwidth:dword
    extrn _phd_winheight:dword
    extrn _phd_winptr:dword
    extrn _phd_winwidth:dword
    extrn _phdsprinfo:dword
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

    public gtmapA_
gtmapA_ proc near
    pusha
    sub     esp,2ch
    sub     edx,eax
    jle     l6
    mov     dword ptr [esp+20h],edx
    mov     ecx,eax
    shl     ecx,5
    add     ecx,offset _xbuffer
    mov     dword ptr [esp+1ch],ecx
    imul    eax,dword ptr _phd_scrwidth
    add     eax,dword ptr _phd_winptr
    mov     dword ptr [esp+28h],eax
    mov     dword ptr [esp+24h],ebx
l1:
    mov     esi,dword ptr [esp+1ch]
    mov     edi,dword ptr [esi]
    mov     ebp,dword ptr [esi+10h]
    sar     edi,10h
    sar     ebp,10h
    cmp     ebp,edi
    jle     l5
    mov     ebx,ebp
    sub     ebx,edi
    mov     ecx,dword ptr [esi+4]
    mov     eax,dword ptr [esi+14h]
    sub     eax,ecx
    cdq
    idiv    ebx
    mov     dword ptr [esp+14h],ecx
    mov     dword ptr [esp+8],eax
    mov     ecx,dword ptr [esi+8]
    mov     eax,dword ptr [esi+18h]
    sub     eax,ecx
    cdq
    idiv    ebx
    mov     dword ptr [esp+0ch],ecx
    mov     dword ptr [esp],eax
    mov     ecx,dword ptr [esi+0ch]
    mov     eax,dword ptr [esi+1ch]
    sub     eax,ecx
    cdq
    idiv    ebx
    mov     dword ptr [esp+10h],ecx
    mov     dword ptr [esp+4],eax
    sub     ebp,edi
    add     edi,dword ptr [esp+28h]
    mov     esi,dword ptr [esp+24h]
    mov     dword ptr [esp+18h],ebp
    xor     eax,eax
    xor     ebx,ebx
    mov     ecx,dword ptr [esp+0ch]
    mov     edx,dword ptr [esp+10h]
    mov     ebp,dword ptr [esp+14h]
    shl     ecx,10h
    shl     edx,10h
    shl     ebp,10h
    mov     cl,byte ptr [esp+2]
    mov     ch,byte ptr [esp+6]
    mov     dh,byte ptr [esp+0ah]
    shl     dword ptr [esp],10h
    shl     dword ptr [esp+4],10h
    shl     dword ptr [esp+8],10h
    mov     al,byte ptr [esp+0eh]
    mov     ah,byte ptr [esp+12h]
    mov     bh,byte ptr [esp+16h]
l2:
    sub     dword ptr [esp+18h],10h
    js      l3
    mov     bl,byte ptr [eax+esi*1]
    mov     dl,byte ptr _depthq_table[ebx]
    add     ecx,dword ptr [esp]
    mov     byte ptr [edi],dl
    adc     al,cl
    add     edx,dword ptr [esp+4]
    adc     ah,ch
    add     ebp,dword ptr [esp+8]
    adc     bh,dh
    mov     bl,byte ptr [eax+esi*1]
    mov     dl,byte ptr _depthq_table[ebx]
    add     ecx,dword ptr [esp]
    mov     byte ptr [edi+1],dl
    adc     al,cl
    add     edx,dword ptr [esp+4]
    adc     ah,ch
    add     ebp,dword ptr [esp+8]
    adc     bh,dh
    mov     bl,byte ptr [eax+esi*1]
    mov     dl,byte ptr _depthq_table[ebx]
    add     ecx,dword ptr [esp]
    mov     byte ptr [edi+2],dl
    adc     al,cl
    add     edx,dword ptr [esp+4]
    adc     ah,ch
    add     ebp,dword ptr [esp+8]
    adc     bh,dh
    mov     bl,byte ptr [eax+esi*1]
    mov     dl,byte ptr _depthq_table[ebx]
    add     ecx,dword ptr [esp]
    mov     byte ptr [edi+3],dl
    adc     al,cl
    add     edx,dword ptr [esp+4]
    adc     ah,ch
    add     ebp,dword ptr [esp+8]
    adc     bh,dh
    mov     bl,byte ptr [eax+esi*1]
    mov     dl,byte ptr _depthq_table[ebx]
    add     ecx,dword ptr [esp]
    mov     byte ptr [edi+4],dl
    adc     al,cl
    add     edx,dword ptr [esp+4]
    adc     ah,ch
    add     ebp,dword ptr [esp+8]
    adc     bh,dh
    mov     bl,byte ptr [eax+esi*1]
    mov     dl,byte ptr _depthq_table[ebx]
    add     ecx,dword ptr [esp]
    mov     byte ptr [edi+5],dl
    adc     al,cl
    add     edx,dword ptr [esp+4]
    adc     ah,ch
    add     ebp,dword ptr [esp+8]
    adc     bh,dh
    mov     bl,byte ptr [eax+esi*1]
    mov     dl,byte ptr _depthq_table[ebx]
    add     ecx,dword ptr [esp]
    mov     byte ptr [edi+6],dl
    adc     al,cl
    add     edx,dword ptr [esp+4]
    adc     ah,ch
    add     ebp,dword ptr [esp+8]
    adc     bh,dh
    mov     bl,byte ptr [eax+esi*1]
    mov     dl,byte ptr _depthq_table[ebx]
    add     ecx,dword ptr [esp]
    mov     byte ptr [edi+7],dl
    adc     al,cl
    add     edx,dword ptr [esp+4]
    adc     ah,ch
    add     ebp,dword ptr [esp+8]
    adc     bh,dh
    mov     bl,byte ptr [eax+esi*1]
    mov     dl,byte ptr _depthq_table[ebx]
    add     ecx,dword ptr [esp]
    mov     byte ptr [edi+8],dl
    adc     al,cl
    add     edx,dword ptr [esp+4]
    adc     ah,ch
    add     ebp,dword ptr [esp+8]
    adc     bh,dh
    mov     bl,byte ptr [eax+esi*1]
    mov     dl,byte ptr _depthq_table[ebx]
    add     ecx,dword ptr [esp]
    mov     byte ptr [edi+9],dl
    adc     al,cl
    add     edx,dword ptr [esp+4]
    adc     ah,ch
    add     ebp,dword ptr [esp+8]
    adc     bh,dh
    mov     bl,byte ptr [eax+esi*1]
    mov     dl,byte ptr _depthq_table[ebx]
    add     ecx,dword ptr [esp]
    mov     byte ptr [edi+0ah],dl
    adc     al,cl
    add     edx,dword ptr [esp+4]
    adc     ah,ch
    add     ebp,dword ptr [esp+8]
    adc     bh,dh
    mov     bl,byte ptr [eax+esi*1]
    mov     dl,byte ptr _depthq_table[ebx]
    add     ecx,dword ptr [esp]
    mov     byte ptr [edi+0bh],dl
    adc     al,cl
    add     edx,dword ptr [esp+4]
    adc     ah,ch
    add     ebp,dword ptr [esp+8]
    adc     bh,dh
    mov     bl,byte ptr [eax+esi*1]
    mov     dl,byte ptr _depthq_table[ebx]
    add     ecx,dword ptr [esp]
    mov     byte ptr [edi+0ch],dl
    adc     al,cl
    add     edx,dword ptr [esp+4]
    adc     ah,ch
    add     ebp,dword ptr [esp+8]
    adc     bh,dh
    mov     bl,byte ptr [eax+esi*1]
    mov     dl,byte ptr _depthq_table[ebx]
    add     ecx,dword ptr [esp]
    mov     byte ptr [edi+0dh],dl
    adc     al,cl
    add     edx,dword ptr [esp+4]
    adc     ah,ch
    add     ebp,dword ptr [esp+8]
    adc     bh,dh
    mov     bl,byte ptr [eax+esi*1]
    mov     dl,byte ptr _depthq_table[ebx]
    add     ecx,dword ptr [esp]
    mov     byte ptr [edi+0eh],dl
    adc     al,cl
    add     edx,dword ptr [esp+4]
    adc     ah,ch
    add     ebp,dword ptr [esp+8]
    adc     bh,dh
    mov     bl,byte ptr [eax+esi*1]
    mov     dl,byte ptr _depthq_table[ebx]
    add     ecx,dword ptr [esp]
    mov     byte ptr [edi+0fh],dl
    adc     al,cl
    add     edx,dword ptr [esp+4]
    adc     ah,ch
    add     ebp,dword ptr [esp+8]
    adc     bh,dh
    add     edi,10h
    jmp     l2
l3:
    add     dword ptr [esp+18h],10h
    jle     l5
l4:
    mov     bl,byte ptr [eax+esi*1]
    mov     dl,byte ptr _depthq_table[ebx]
    add     ecx,dword ptr [esp]
    mov     byte ptr [edi],dl
    adc     al,cl
    add     edx,dword ptr [esp+4]
    adc     ah,ch
    add     ebp,dword ptr [esp+8]
    adc     bh,dh
    inc     edi
    dec     dword ptr [esp+18h]
    jne     l4
l5:
    mov     eax,_phd_scrwidth
    add     dword ptr [esp+1ch],20h
    add     dword ptr [esp+28h],eax
    dec     dword ptr [esp+20h]
    jne     l1
l6:
    add     esp,2ch
    popa
    ret
gtmapA_ endp

    public wgtmapA_
wgtmapA_ proc near
    pusha
    sub     esp,2ch
    sub     edx,eax
    jle     l23
    mov     dword ptr [esp+20h],edx
    mov     ecx,eax
    shl     ecx,5
    add     ecx,offset _xbuffer
    mov     dword ptr [esp+1ch],ecx
    imul    eax,dword ptr _phd_scrwidth
    add     eax,dword ptr _phd_winptr
    mov     dword ptr [esp+28h],eax
    mov     dword ptr [esp+24h],ebx
l1:
    mov     esi,dword ptr [esp+1ch]
    mov     edi,dword ptr [esi]
    mov     ebp,dword ptr [esi+10h]
    sar     edi,10h
    sar     ebp,10h
    cmp     ebp,edi
    jle     l22
    mov     ebx,ebp
    sub     ebx,edi
    mov     ecx,dword ptr [esi+4]
    mov     eax,dword ptr [esi+14h]
    sub     eax,ecx
    cdq
    idiv    ebx
    mov     dword ptr [esp+14h],ecx
    mov     dword ptr [esp+8],eax
    mov     ecx,dword ptr [esi+8]
    mov     eax,dword ptr [esi+18h]
    sub     eax,ecx
    cdq
    idiv    ebx
    mov     dword ptr [esp+0ch],ecx
    mov     dword ptr [esp],eax
    mov     ecx,dword ptr [esi+0ch]
    mov     eax,dword ptr [esi+1ch]
    sub     eax,ecx
    cdq
    idiv    ebx
    mov     dword ptr [esp+10h],ecx
    mov     dword ptr [esp+4],eax
    sub     ebp,edi
    add     edi,dword ptr [esp+28h]
    mov     esi,dword ptr [esp+24h]
    mov     dword ptr [esp+18h],ebp
    xor     eax,eax
    xor     ebx,ebx
    mov     ecx,dword ptr [esp+0ch]
    mov     edx,dword ptr [esp+10h]
    mov     ebp,dword ptr [esp+14h]
    shl     ecx,10h
    shl     edx,10h
    shl     ebp,10h
    mov     cl,byte ptr [esp+2]
    mov     ch,byte ptr [esp+6]
    mov     dh,byte ptr [esp+0ah]
    shl     dword ptr [esp],10h
    shl     dword ptr [esp+4],10h
    shl     dword ptr [esp+8],10h
    mov     al,byte ptr [esp+0eh]
    mov     ah,byte ptr [esp+12h]
    mov     bh,byte ptr [esp+16h]
l2:
    sub     dword ptr [esp+18h],10h
    js      l19
    mov     bl,byte ptr [eax+esi*1]
    or      bl,bl
    je      l3
    mov     dl,byte ptr _depthq_table[ebx]
    mov     byte ptr [edi],dl
l3:
    add     ecx,dword ptr [esp]
    adc     al,cl
    add     edx,dword ptr [esp+4]
    adc     ah,ch
    add     ebp,dword ptr [esp+8]
    adc     bh,dh
    mov     bl,byte ptr [eax+esi*1]
    or      bl,bl
    je      l4
    mov     dl,byte ptr _depthq_table[ebx]
    mov     byte ptr [edi+1],dl
l4:
    add     ecx,dword ptr [esp]
    adc     al,cl
    add     edx,dword ptr [esp+4]
    adc     ah,ch
    add     ebp,dword ptr [esp+8]
    adc     bh,dh
    mov     bl,byte ptr [eax+esi*1]
    or      bl,bl
    je      l5
    mov     dl,byte ptr _depthq_table[ebx]
    mov     byte ptr [edi+2],dl
l5:
    add     ecx,dword ptr [esp]
    adc     al,cl
    add     edx,dword ptr [esp+4]
    adc     ah,ch
    add     ebp,dword ptr [esp+8]
    adc     bh,dh
    mov     bl,byte ptr [eax+esi*1]
    or      bl,bl
    je      l6
    mov     dl,byte ptr _depthq_table[ebx]
    mov     byte ptr [edi+3],dl
l6:
    add     ecx,dword ptr [esp]
    adc     al,cl
    add     edx,dword ptr [esp+4]
    adc     ah,ch
    add     ebp,dword ptr [esp+8]
    adc     bh,dh
    mov     bl,byte ptr [eax+esi*1]
    or      bl,bl
    je      l7
    mov     dl,byte ptr _depthq_table[ebx]
    mov     byte ptr [edi+4],dl
l7:
    add     ecx,dword ptr [esp]
    adc     al,cl
    add     edx,dword ptr [esp+4]
    adc     ah,ch
    add     ebp,dword ptr [esp+8]
    adc     bh,dh
    mov     bl,byte ptr [eax+esi*1]
    or      bl,bl
    je      l8
    mov     dl,byte ptr _depthq_table[ebx]
    mov     byte ptr [edi+5],dl
l8:
    add     ecx,dword ptr [esp]
    adc     al,cl
    add     edx,dword ptr [esp+4]
    adc     ah,ch
    add     ebp,dword ptr [esp+8]
    adc     bh,dh
    mov     bl,byte ptr [eax+esi*1]
    or      bl,bl
    je      l9
    mov     dl,byte ptr _depthq_table[ebx]
    mov     byte ptr [edi+6],dl
l9:
    add     ecx,dword ptr [esp]
    adc     al,cl
    add     edx,dword ptr [esp+4]
    adc     ah,ch
    add     ebp,dword ptr [esp+8]
    adc     bh,dh
    mov     bl,byte ptr [eax+esi*1]
    or      bl,bl
    je      l10
    mov     dl,byte ptr _depthq_table[ebx]
    mov     byte ptr [edi+7],dl
l10:
    add     ecx,dword ptr [esp]
    adc     al,cl
    add     edx,dword ptr [esp+4]
    adc     ah,ch
    add     ebp,dword ptr [esp+8]
    adc     bh,dh
    mov     bl,byte ptr [eax+esi*1]
    or      bl,bl
    je      l11
    mov     dl,byte ptr _depthq_table[ebx]
    mov     byte ptr [edi+8],dl
l11:
    add     ecx,dword ptr [esp]
    adc     al,cl
    add     edx,dword ptr [esp+4]
    adc     ah,ch
    add     ebp,dword ptr [esp+8]
    adc     bh,dh
    mov     bl,byte ptr [eax+esi*1]
    or      bl,bl
    je      l12
    mov     dl,byte ptr _depthq_table[ebx]
    mov     byte ptr [edi+9],dl
l12:
    add     ecx,dword ptr [esp]
    adc     al,cl
    add     edx,dword ptr [esp+4]
    adc     ah,ch
    add     ebp,dword ptr [esp+8]
    adc     bh,dh
    mov     bl,byte ptr [eax+esi*1]
    or      bl,bl
    je      l13
    mov     dl,byte ptr _depthq_table[ebx]
    mov     byte ptr [edi+0ah],dl
l13:
    add     ecx,dword ptr [esp]
    adc     al,cl
    add     edx,dword ptr [esp+4]
    adc     ah,ch
    add     ebp,dword ptr [esp+8]
    adc     bh,dh
    mov     bl,byte ptr [eax+esi*1]
    or      bl,bl
    je      l14
    mov     dl,byte ptr _depthq_table[ebx]
    mov     byte ptr [edi+0bh],dl
l14:
    add     ecx,dword ptr [esp]
    adc     al,cl
    add     edx,dword ptr [esp+4]
    adc     ah,ch
    add     ebp,dword ptr [esp+8]
    adc     bh,dh
    mov     bl,byte ptr [eax+esi*1]
    or      bl,bl
    je      l15
    mov     dl,byte ptr _depthq_table[ebx]
    mov     byte ptr [edi+0ch],dl
l15:
    add     ecx,dword ptr [esp]
    adc     al,cl
    add     edx,dword ptr [esp+4]
    adc     ah,ch
    add     ebp,dword ptr [esp+8]
    adc     bh,dh
    mov     bl,byte ptr [eax+esi*1]
    or      bl,bl
    je      l16
    mov     dl,byte ptr _depthq_table[ebx]
    mov     byte ptr [edi+0dh],dl
l16:
    add     ecx,dword ptr [esp]
    adc     al,cl
    add     edx,dword ptr [esp+4]
    adc     ah,ch
    add     ebp,dword ptr [esp+8]
    adc     bh,dh
    mov     bl,byte ptr [eax+esi*1]
    or      bl,bl
    je      l17
    mov     dl,byte ptr _depthq_table[ebx]
    mov     byte ptr [edi+0eh],dl
l17:
    add     ecx,dword ptr [esp]
    adc     al,cl
    add     edx,dword ptr [esp+4]
    adc     ah,ch
    add     ebp,dword ptr [esp+8]
    adc     bh,dh
    mov     bl,byte ptr [eax+esi*1]
    or      bl,bl
    je      l18
    mov     dl,byte ptr _depthq_table[ebx]
    mov     byte ptr [edi+0fh],dl
l18:
    add     ecx,dword ptr [esp]
    adc     al,cl
    add     edx,dword ptr [esp+4]
    adc     ah,ch
    add     ebp,dword ptr [esp+8]
    adc     bh,dh
    add     edi,10h
    jmp     l2
l19:
    add     dword ptr [esp+18h],10h
    jle     l22
l20:
    mov     bl,byte ptr [eax+esi*1]
    or      bl,bl
    je      l21
    mov     dl,byte ptr _depthq_table[ebx]
    mov     byte ptr [edi],dl
l21:
    add     ecx,dword ptr [esp]
    adc     al,cl
    add     edx,dword ptr [esp+4]
    adc     ah,ch
    add     ebp,dword ptr [esp+8]
    adc     bh,dh
    inc     edi
    dec     dword ptr [esp+18h]
    jne     l20
l22:
    mov     eax,_phd_scrwidth
    add     dword ptr [esp+1ch],20h
    add     dword ptr [esp+28h],eax
    dec     dword ptr [esp+20h]
    jne     l1
l23:
    add     esp,2ch
    popa
    ret
wgtmapA_ endp

    public draw_scaled_spriteA_
draw_scaled_spriteA_ proc near
    pusha
    sub     esp,34h
    mov     esi,eax
    movsx   eax,word ptr [eax]
    movsx   edx,word ptr [esi+2]
    movsx   ecx,word ptr [esi+4]
    movsx   ebx,word ptr [esi+6]
    cmp     eax,ecx
    jge     l1
    cmp     edx,ebx
    jge     l1
    test    ecx,ecx
    jle     l1
    test    ebx,ebx
    jle     l1
    cmp     eax,dword ptr _phd_winwidth
    jge     l1
    cmp     edx,dword ptr _phd_winheight
    jl      l2
l1:
    jmp     l26
l2:
    mov     dword ptr [esp+20h],eax
    mov     dword ptr [esp+24h],edx
    mov     dword ptr [esp+28h],ecx
    mov     dword ptr [esp+2ch],ebx
    movzx   ebp,word ptr [esi+8]
    shl     ebp,4
    add     ebp,offset _phdsprinfo
    sub     ecx,eax
    sub     ebx,edx
    movzx   eax,word ptr [ebp+4]
    shl     eax,8
    cdq
    idiv    ecx
    mov     dword ptr [esp+14h],eax
    movzx   eax,word ptr [ebp+6]
    shl     eax,8
    cdq
    idiv    ebx
    mov     dword ptr [esp+18h],eax
    xor     eax,eax
    mov     dword ptr [esp+0ch],eax
    mov     dword ptr [esp+10h],eax
    mov     eax,dword ptr [esp+20h]
    test    eax,eax
    jge     l3
    imul    eax,dword ptr [esp+14h]
    sub     dword ptr [esp+0ch],eax
    xor     eax,eax
l3:
    mov     ebx,dword ptr [esp+24h]
    test    ebx,ebx
    jge     l4
    imul    ebx,dword ptr [esp+18h]
    sub     dword ptr [esp+10h],ebx
    xor     ebx,ebx
l4:
    mov     ecx,dword ptr [esp+28h]
    cmp     ecx,dword ptr _phd_winwidth
    jle     l5
    mov     ecx,dword ptr _phd_winwidth
l5:
    mov     edx,dword ptr [esp+2ch]
    cmp     edx,dword ptr _phd_winheight
    jle     l6
    mov     edx,dword ptr _phd_winheight
l6:
    sub     ecx,eax
    sub     edx,ebx
    mov     edi,eax
    add     edi,dword ptr _phd_winptr
    mov     eax,_phd_scrwidth
    imul    ebx,eax
    add     edi,ebx
    sub     eax,ecx
    mov     dword ptr [esp+30h],eax
    mov     eax,ecx
    neg     eax
    and     eax,0fh
    shl     eax,4
    mov     dword ptr l27+1,eax
    dec     ecx
    sar     ecx,4
    mov     dword ptr [esp+8],ecx
    mov     dword ptr [esp+4],edx
    mov     eax,dword ptr [esp+0ch]
    sar     eax,10h
    add     eax,dword ptr [ebp+0]
    shl     dword ptr [esp+0ch],10h
    mov     dword ptr [esp+1ch],eax
    mov     edx,dword ptr [esp+14h]
    mov     ebp,edx
    shl     edx,10h
    sar     ebp,10h
    movsx   ebx,byte ptr [esi+0bh]
    shl     ebx,8
    add     ebx,offset _depthq_table
    xor     eax,eax
l7:
    mov     esi,dword ptr [esp+8]
    mov     dword ptr [esp],esi
    mov     esi,dword ptr [esp+10h]
    sar     esi,10h
    mov     ecx,dword ptr [esp+0ch]
    shl     esi,8
    add     esi,dword ptr [esp+1ch]
l27:
    jmp     l24
l8:
    mov     al,byte ptr [esi]
    or      al,al
    je      l9
    mov     al,byte ptr [eax+ebx*1]
    mov     byte ptr [edi],al
l9:
    add     ecx,edx
    adc     esi,ebp
    inc     edi
    mov     al,byte ptr [esi]
    or      al,al
    je      l10
    mov     al,byte ptr [eax+ebx*1]
    mov     byte ptr [edi],al
l10:
    add     ecx,edx
    adc     esi,ebp
    inc     edi
    mov     al,byte ptr [esi]
    or      al,al
    je      l11
    mov     al,byte ptr [eax+ebx*1]
    mov     byte ptr [edi],al
l11:
    add     ecx,edx
    adc     esi,ebp
    inc     edi
    mov     al,byte ptr [esi]
    or      al,al
    je      l12
    mov     al,byte ptr [eax+ebx*1]
    mov     byte ptr [edi],al
l12:
    add     ecx,edx
    adc     esi,ebp
    inc     edi
    mov     al,byte ptr [esi]
    or      al,al
    je      l13
    mov     al,byte ptr [eax+ebx*1]
    mov     byte ptr [edi],al
l13:
    add     ecx,edx
    adc     esi,ebp
    inc     edi
    mov     al,byte ptr [esi]
    or      al,al
    je      l14
    mov     al,byte ptr [eax+ebx*1]
    mov     byte ptr [edi],al
l14:
    add     ecx,edx
    adc     esi,ebp
    inc     edi
    mov     al,byte ptr [esi]
    or      al,al
    je      l15
    mov     al,byte ptr [eax+ebx*1]
    mov     byte ptr [edi],al
l15:
    add     ecx,edx
    adc     esi,ebp
    inc     edi
    mov     al,byte ptr [esi]
    or      al,al
    je      l16
    mov     al,byte ptr [eax+ebx*1]
    mov     byte ptr [edi],al
l16:
    add     ecx,edx
    adc     esi,ebp
    inc     edi
    mov     al,byte ptr [esi]
    or      al,al
    je      l17
    mov     al,byte ptr [eax+ebx*1]
    mov     byte ptr [edi],al
l17:
    add     ecx,edx
    adc     esi,ebp
    inc     edi
    mov     al,byte ptr [esi]
    or      al,al
    je      l18
    mov     al,byte ptr [eax+ebx*1]
    mov     byte ptr [edi],al
l18:
    add     ecx,edx
    adc     esi,ebp
    inc     edi
    mov     al,byte ptr [esi]
    or      al,al
    je      l19
    mov     al,byte ptr [eax+ebx*1]
    mov     byte ptr [edi],al
l19:
    add     ecx,edx
    adc     esi,ebp
    inc     edi
    mov     al,byte ptr [esi]
    or      al,al
    je      l20
    mov     al,byte ptr [eax+ebx*1]
    mov     byte ptr [edi],al
l20:
    add     ecx,edx
    adc     esi,ebp
    inc     edi
    mov     al,byte ptr [esi]
    or      al,al
    je      l21
    mov     al,byte ptr [eax+ebx*1]
    mov     byte ptr [edi],al
l21:
    add     ecx,edx
    adc     esi,ebp
    inc     edi
    mov     al,byte ptr [esi]
    or      al,al
    je      l22
    mov     al,byte ptr [eax+ebx*1]
    mov     byte ptr [edi],al
l22:
    add     ecx,edx
    adc     esi,ebp
    inc     edi
    mov     al,byte ptr [esi]
    or      al,al
    je      l23
    mov     al,byte ptr [eax+ebx*1]
    mov     byte ptr [edi],al
l23:
    add     ecx,edx
    adc     esi,ebp
    inc     edi
l24:
    mov     al,byte ptr [esi]
    or      al,al
    je      l25
    mov     al,byte ptr [eax+ebx*1]
    mov     byte ptr [edi],al
l25:
    add     ecx,edx
    adc     esi,ebp
    inc     edi
    dec     dword ptr [esp]
    jns     l8
    add     edi,dword ptr [esp+30h]
    mov     ecx,dword ptr [esp+18h]
    add     dword ptr [esp+10h],ecx
    dec     dword ptr [esp+4]
    jne     l7
l26:
    add     esp,34h
    popa
    ret
draw_scaled_spriteA_ endp

    end

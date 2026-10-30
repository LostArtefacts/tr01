    .386p
    .model flat

    extrn _phd_bottom:dword
    extrn _phd_centerx:dword
    extrn _phd_centery:dword
    extrn _phd_left:dword
    extrn _phd_mxptr:dword
    extrn _phd_persp:dword
    extrn _phd_right:dword
    extrn _phd_top:dword
    extrn _phd_winxmax:dword
    extrn _phd_winymax:dword
    extrn _phd_znear:dword
    extrn _vbuf:byte

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

    public calc_object_verticesA_noclip_
calc_object_verticesA_noclip_ proc near
    push    ebx
    push    ecx
    push    edx
    push    esi
    push    edi
    push    ebp
    mov     esi,eax
    sub     esp,4
    add     esi,2
    mov     edi,offset _vbuf
    mov     ebx,dword ptr _phd_mxptr
    movsx   eax,word ptr [esi]
    add     esi,2
    mov     dword ptr [esp],eax
    test    eax,eax
    jle     l2
l1:
    mov     ebp,dword ptr [esi]
    movsx   ecx,word ptr [esi]
    sar     ebp,10h
    imul    ecx,dword ptr [ebx+20h]
    imul    ebp,dword ptr [ebx+24h]
    add     ecx,ebp
    movsx   ebp,word ptr [esi+4]
    add     ecx,dword ptr [ebx+2ch]
    imul    ebp,dword ptr [ebx+28h]
    add     ecx,ebp
    mov     edx,dword ptr _phd_persp
    mov     dword ptr [edi],ecx
    xor     eax,eax
    idiv    ecx
    mov     ebp,dword ptr [esi]
    movsx   edx,word ptr [esi]
    sar     ebp,10h
    imul    edx,dword ptr [ebx]
    imul    ebp,dword ptr [ebx+4]
    add     ebp,edx
    movsx   edx,word ptr [esi+4]
    add     ebp,dword ptr [ebx+0ch]
    imul    edx,dword ptr [ebx+8]
    add     ebp,edx
    mov     ecx,eax
    imul    ebp
    add     edx,dword ptr _phd_centerx
    mov     eax,ecx
    mov     dword ptr [edi+4],edx
    mov     ebp,dword ptr [esi]
    movsx   ecx,word ptr [esi]
    sar     ebp,10h
    imul    ecx,dword ptr [ebx+10h]
    imul    ebp,dword ptr [ebx+14h]
    add     ebp,ecx
    movsx   ecx,word ptr [esi+4]
    add     ebp,dword ptr [ebx+1ch]
    imul    ecx,dword ptr [ebx+18h]
    add     ecx,ebp
    imul    ecx
    add     edx,dword ptr _phd_centery
    mov     word ptr [edi+6],dx
    add     esi,6
    add     edi,10h
    dec     dword ptr [esp]
    jne     l1
l2:
    mov     eax,esi
    add     esp,4
    pop     ebp
    pop     edi
    pop     esi
    pop     edx
    pop     ecx
    pop     ebx
    ret
calc_object_verticesA_noclip_ endp

    public calc_object_verticesA_win_
calc_object_verticesA_win_ proc near
    push    ebx
    push    ecx
    push    edx
    push    esi
    push    edi
    push    ebp
    mov     esi,eax
    sub     esp,0ch
    add     esi,2
    mov     edi,offset _vbuf
    mov     ebx,dword ptr _phd_mxptr
    mov     dword ptr [esp+4],0ffffffffh
    movsx   eax,word ptr [esi]
    add     esi,2
    mov     dword ptr [esp+8],eax
    test    eax,eax
    jle     l8
l1:
    mov     ebp,dword ptr [esi]
    movsx   ecx,word ptr [esi]
    sar     ebp,10h
    imul    ecx,dword ptr [ebx+20h]
    imul    ebp,dword ptr [ebx+24h]
    add     ecx,ebp
    movsx   ebp,word ptr [esi+4]
    add     ecx,dword ptr [ebx+2ch]
    imul    ebp,dword ptr [ebx+28h]
    add     ecx,ebp
    mov     dword ptr [edi],ecx
    cmp     ecx,dword ptr _phd_znear
    jge     l2
    mov     dword ptr [esp],8000h
    jmp     l7
l2:
    mov     edx,dword ptr _phd_persp
    xor     eax,eax
    mov     dword ptr [esp],eax
    idiv    ecx
    mov     ebp,dword ptr [esi]
    movsx   edx,word ptr [esi]
    sar     ebp,10h
    imul    edx,dword ptr [ebx]
    imul    ebp,dword ptr [ebx+4]
    add     ebp,edx
    movsx   edx,word ptr [esi+4]
    add     ebp,dword ptr [ebx+0ch]
    imul    edx,dword ptr [ebx+8]
    add     ebp,edx
    mov     ecx,eax
    imul    ebp
    add     edx,dword ptr _phd_centerx
    jns     l3
    inc     dword ptr [esp]
    cmp     edx,0ffff8008h
    jge     l4
    mov     edx,0ffff8008h
    jmp     l4
l3:
    cmp     edx,dword ptr _phd_winxmax
    jle     l4
    add     dword ptr [esp],2
    cmp     edx,7ff8h
    jle     l4
    mov     edx,7ff8h
l4:
    mov     dword ptr [edi+4],edx
    mov     eax,ecx
    mov     ebp,dword ptr [esi]
    movsx   ecx,word ptr [esi]
    sar     ebp,10h
    imul    ecx,dword ptr [ebx+10h]
    imul    ebp,dword ptr [ebx+14h]
    add     ebp,ecx
    movsx   ecx,word ptr [esi+4]
    add     ebp,dword ptr [ebx+1ch]
    imul    ecx,dword ptr [ebx+18h]
    xor     edx,edx
    add     ecx,ebp
    imul    ecx
    add     edx,dword ptr _phd_centery
    jns     l5
    add     dword ptr [esp],4
    cmp     edx,0ffff8008h
    jge     l6
    mov     edx,0ffff8008h
    jmp     l6
l5:
    cmp     edx,dword ptr _phd_winymax
    jle     l6
    add     dword ptr [esp],8
    cmp     edx,7ff8h
    jle     l6
    mov     edx,7ff8h
l6:
    mov     word ptr [edi+6],dx
l7:
    mov     ecx,dword ptr [esp]
    mov     dword ptr [edi+8],ecx
    and     dword ptr [esp+4],ecx
    add     esi,6
    add     edi,10h
    dec     dword ptr [esp+8]
    jne     l1
l8:
    xor     eax,eax
    cmp     eax,dword ptr [esp+4]
    jne     l9
    mov     eax,esi
l9:
    add     esp,0ch
    pop     ebp
    pop     edi
    pop     esi
    pop     edx
    pop     ecx
    pop     ebx
    ret
calc_object_verticesA_win_ endp

    public calc_object_verticesA_
calc_object_verticesA_ proc near
    push    ebx
    push    ecx
    push    edx
    push    esi
    push    edi
    push    ebp
    mov     esi,eax
    sub     esp,4
    mov     edi,offset _vbuf
    mov     ebx,dword ptr _phd_mxptr
    movsx   eax,word ptr [esi]
    add     esi,2
    mov     dword ptr [esp],eax
    test    eax,eax
    jle     l8
l1:
    mov     ebp,dword ptr [esi]
    movsx   edx,word ptr [esi]
    sar     ebp,10h
    imul    edx,dword ptr [ebx]
    imul    ebp,dword ptr [ebx+4]
    add     ebp,edx
    movsx   edx,word ptr [esi+4]
    add     ebp,dword ptr [ebx+0ch]
    imul    edx,dword ptr [ebx+8]
    add     ebp,edx
    mov     dword ptr [edi],ebp
    mov     ebp,dword ptr [esi]
    movsx   edx,word ptr [esi]
    sar     ebp,10h
    imul    edx,dword ptr [ebx+10h]
    imul    ebp,dword ptr [ebx+14h]
    add     ebp,edx
    movsx   edx,word ptr [esi+4]
    add     ebp,dword ptr [ebx+1ch]
    imul    edx,dword ptr [ebx+18h]
    add     ebp,edx
    mov     dword ptr [edi+4],ebp
    mov     ebp,dword ptr [esi]
    movsx   ecx,word ptr [esi]
    sar     ebp,10h
    imul    ecx,dword ptr [ebx+20h]
    imul    ebp,dword ptr [ebx+24h]
    add     ecx,ebp
    movsx   ebp,word ptr [esi+4]
    add     ecx,dword ptr [ebx+2ch]
    imul    ebp,dword ptr [ebx+28h]
    add     ecx,ebp
    mov     dword ptr [edi+8],ecx
    cmp     ecx,dword ptr _phd_znear
    jge     l2
    mov     ecx,8000h
    jmp     l7
l2:
    mov     edx,dword ptr _phd_persp
    xor     eax,eax
    idiv    ecx
    xor     ecx,ecx
    mov     ebp,eax
    imul    dword ptr [edi]
    add     edx,dword ptr _phd_centerx
    cmp     edx,dword ptr _phd_left
    jge     l3
    inc     ecx
    cmp     edx,0ffff8008h
    jge     l4
    mov     edx,0ffff8008h
    jmp     l4
l3:
    cmp     edx,dword ptr _phd_right
    jle     l4
    add     ecx,2
    cmp     edx,7ff8h
    jle     l4
    mov     edx,7ff8h
l4:
    mov     dword ptr [edi+0ch],edx
    mov     eax,ebp
    imul    dword ptr [edi+4]
    add     edx,dword ptr _phd_centery
    cmp     edx,dword ptr _phd_top
    jge     l5
    add     ecx,4
    cmp     edx,0ffff8008h
    jge     l6
    mov     edx,0ffff8008h
    jmp     l6
l5:
    cmp     edx,dword ptr _phd_bottom
    jle     l6
    add     ecx,8
    cmp     edx,7ff8h
    jle     l6
    mov     edx,7ff8h
l6:
    mov     word ptr [edi+0eh],dx
l7:
    shl     ecx,10h
    mov     cx,word ptr [esi+6]
    mov     dword ptr [edi+10h],ecx
    add     esi,8
    add     edi,14h
    dec     dword ptr [esp]
    jne     l1
l8:
    mov     eax,esi
    add     esp,4
    pop     ebp
    pop     edi
    pop     esi
    pop     edx
    pop     ecx
    pop     ebx
    ret
calc_object_verticesA_ endp

    end

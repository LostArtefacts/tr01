    .386p
    .model flat

    extrn _phd_centerx:dword
    extrn _phd_centery:dword
    extrn _phd_mxptr:dword
    extrn _phd_persp:dword
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

    end

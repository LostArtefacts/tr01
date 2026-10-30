    .386p
    .model flat

    extrn _dos_buffer:dword
    extrn _gamedata:dword
    extrn _toddata:dword

    .data

    public _bank_cnt
    public _video_depth
_bank_cnt dw 0
_video_depth dd 1
dump_funcs label dword
    dd      offset ScreenDumpVga_, offset ScreenDumpVesa_, offset ScreenDumpVesa_
    dd      offset ScreenDumpVesa_, offset ScreenDumpVesa_
part_dump_funcs label dword
    dd      offset ScreenPartialDumpVga_, offset ScreenPartialDumpVesa_
    dd      offset ScreenPartialDumpVesa_, offset ScreenPartialDumpVesa_
    dd      offset ScreenPartialDumpVesa_

    .data?

rm_regs db 50 dup(?)

    .code

    public VgaGetMode_
VgaGetMode_ proc near
    pusha
    mov     ah,0fh
    int     10h
    mov     byte ptr [esp+1ch],al
    popa
    ret
VgaGetMode_ endp

    public VgaSetMode_
VgaSetMode_ proc near
    pusha
    mov     ah,0
    int     10h
    popa
    ret
VgaSetMode_ endp

    public VgaGetRows_
VgaGetRows_ proc near
    push    es
    pusha
    mov     ax,1130h
    mov     bh,6
    int     10h
    mov     byte ptr [esp+1ch],dl
    popa
    pop     es
    ret
VgaGetRows_ endp

    public VgaSetRows_
VgaSetRows_ proc near
    pusha
    cmp     al,18h
    mov     bl,30h
    jne     l2
l1:
    mov     ax,1202h
    int     10h
    mov     ax,3
    int     10h
    mov     ax,1114h
    jmp     l4
l2:
    cmp     al,2ah
    jne     l3
    mov     ax,1201h
    int     10h
    mov     ax,3
    int     10h
    mov     ax,1112h
    jmp     l4
l3:
    cmp     al,31h
    jne     l1
    mov     ax,1202h
    int     10h
    mov     ax,3
    int     10h
    mov     ax,1112h
l4:
    int     10h
    popa
    ret
VgaSetRows_ endp

    public ScreenClear_
ScreenClear_ proc near
    pusha
    cld
    mov     edi,dword ptr _gamedata
    xor     eax,eax
    xor     ecx,ecx
    mov     cx,word ptr [edi]
    mov     ax,word ptr [edi+2]
    imul    ecx
    imul    dword ptr _video_depth
    mov     ecx,eax
    shr     ecx,2
    mov     edi,dword ptr [edi+0ah]
    xor     eax,eax
    rep stosd
    popa
    ret
ScreenClear_ endp

    public ScreenPartialClear_
ScreenPartialClear_ proc near
    pusha
    cld
    mov     esi,dword ptr _gamedata
    movzx   ecx,word ptr [esi]
    movzx   eax,word ptr [esi+12h]
    mul     ecx
    mov     cx,word ptr [edi+10h]
    and     cl,0fch
    add     eax,ecx
    mov     edi,eax
    movzx   ebx,word ptr [esi]
    movzx   ebp,word ptr [esi+14h]
    add     ebp,3
    and     bp,0fffch
    sub     ebx,ebp
    js      l2
    je      l3
    movsx   edx,word ptr [esi+16h]
    test    edx,edx
    jle     l2
    add     edi,dword ptr [esi+0ah]
    shr     ebp,2
    xor     eax,eax
l1:
    mov     ecx,ebp
    rep stosd
    add     edi,ebx
    dec     edx
    jne     l1
l2:
    popa
    ret
l3:
    movzx   ecx,word ptr [esi]
    movzx   eax,word ptr [esi+16h]
    test    eax,eax
    jle     l2
    mul     ecx
    add     edi,dword ptr [esi+0ah]
    mov     ecx,eax
    shr     ecx,2
    xor     eax,eax
    rep stosd
    popa
    ret
ScreenPartialClear_ endp

    public ScreenDump_
ScreenDump_ proc near
    push    eax
    push    edi
    mov     edi,dword ptr _gamedata
    xor     eax,eax
    mov     ax,word ptr [edi+0eh]
    call    dword ptr dump_funcs[eax*4]
    pop     edi
    pop     eax
    ret
ScreenDump_ endp

    public ScreenPartialDump_
ScreenPartialDump_ proc near
    push    eax
    push    edi
    mov     edi,dword ptr _gamedata
    xor     eax,eax
    mov     ax,word ptr [edi+0eh]
    call    dword ptr part_dump_funcs[eax*4]
    pop     edi
    pop     eax
    ret
ScreenPartialDump_ endp

    public ScreenDumpVga_
ScreenDumpVga_ proc near
    pusha
    mov     edi,dword ptr _gamedata
    xor     eax,eax
    xor     ecx,ecx
    mov     cx,word ptr [edi]
    mov     ax,word ptr [edi+2]
    mul     ecx
    mov     ecx,eax
    sar     ecx,2
    cld
    mov     esi,dword ptr [edi+0ah]
    mov     edi,0a0000h
    rep movsd
    popa
    ret
ScreenDumpVga_ endp

    public ScreenPartialDumpVga_
ScreenPartialDumpVga_ proc near
    push    ebp
    mov     ebp,esp
    add     esp,0fffffffch
    pusha
    mov     edi,dword ptr _gamedata
    xor     eax,eax
    xor     ecx,ecx
    mov     cx,word ptr [edi]
    mov     ax,word ptr [edi+12h]
    mul     ecx
    mov     cx,word ptr [edi+10h]
    and     ecx,0fffch
    add     eax,ecx
    mov     dword ptr [ebp-4],eax
    xor     ebx,ebx
    mov     bx,word ptr [edi]
    mov     ax,word ptr [edi+14h]
    add     ax,3
    and     eax,0fffch
    sub     ebx,eax
    jl      l2
    je      l3
    mov     dx,word ptr [edi+16h]
    test    dx,dx
    jle     l2
    mov     ecx,dword ptr [ebp-4]
    mov     esi,dword ptr [edi+0ah]
    add     esi,ecx
    mov     edi,0a0000h
    add     edi,ecx
    cld
    sar     eax,2
l1:
    mov     ecx,eax
    rep movsd
    add     esi,ebx
    add     edi,ebx
    dec     dx
    jne     l1
l2:
    popa
    leave
    ret
l3:
    mov     cx,word ptr [edi]
    mov     ax,word ptr [edi+16h]
    test    ax,ax
    jle     l2
    mul     ecx
    mov     ecx,eax
    sar     ecx,2
    mov     eax,dword ptr [ebp-4]
    mov     esi,dword ptr [edi+0ah]
    add     esi,eax
    mov     edi,0a0000h
    add     edi,eax
    cld
    rep movsd
    popa
    leave
    ret
ScreenPartialDumpVga_ endp

    public ScreenDumpAndClear_
ScreenDumpAndClear_ proc near
    pusha
    mov     edi,dword ptr _gamedata
    xor     eax,eax
    xor     ecx,ecx
    mov     cx,word ptr [edi]
    mov     ax,word ptr [edi+2]
    mul     ecx
    mov     ecx,eax
    sar     ecx,2
    mov     esi,dword ptr [edi+0ah]
    mov     edi,0a0000h
    mov     edx,4
    xor     ebx,ebx
l1:
    mov     eax,dword ptr [esi]
    mov     dword ptr [esi],ebx
    mov     dword ptr [edi],eax
    add     edi,edx
    add     esi,edx
    dec     ecx
    jne     l1
    popa
    ret
ScreenDumpAndClear_ endp

    public VesaBiosCall_
VesaBiosCall_ proc near
    push    ds
    push    es
    push    fs
    push    gs
    pusha
    mov     edx,eax
    mov     esi,ecx
    mov     edi,offset rm_regs
    mov     ecx,0ch
    xor     eax,eax
    rep stosd
    mov     word ptr [edi],ax
    mov     word ptr rm_regs+1ch,dx
    mov     word ptr rm_regs+18h,si
    mov     eax,dword ptr _dos_buffer
    mov     word ptr rm_regs,ax
    shr     eax,4
    and     eax,0f000h
    mov     word ptr rm_regs+22h,ax
    sub     edi,30h
    mov     ax,300h
    mov     bx,10h
    int     31h
    popa
    pop     gs
    pop     fs
    pop     es
    pop     ds
    mov     eax,dword ptr rm_regs+1ch
    and     eax,0ffffh
    ret
VesaBiosCall_ endp

    public VesaBiosGetInfo_
VesaBiosGetInfo_ proc near
    push    ecx
    push    esi
    mov     ax,4f00h
    call    VesaBiosCall_
    mov     ecx,10h
    mov     esi,dword ptr _dos_buffer
    rep movsd
    pop     esi
    pop     ecx
    ret
VesaBiosGetInfo_ endp

    public VesaBiosGetModeInfo_
VesaBiosGetModeInfo_ proc near
    push    esi
    mov     ax,4f01h
    call    VesaBiosCall_
    mov     ecx,10h
    mov     esi,dword ptr _dos_buffer
    rep movsd
    pop     esi
    ret
VesaBiosGetModeInfo_ endp

    public VesaBiosSetMode_
VesaBiosSetMode_ proc near
    push    ds
    push    es
    push    fs
    push    gs
    pusha
    mov     bx,ax
    mov     ax,4f02h
    int     10h
    cmp     ax,4fh
    jne     l1
    mov     ax,4f03h
    int     10h
    mov     cx,word ptr [esp+1ch]
    and     cx,7fffh
    cmp     cx,bx
    je      l2
l1:
    xor     eax,eax
l2:
    mov     dword ptr [esp+1ch],eax
    popa
    pop     gs
    pop     fs
    pop     es
    pop     ds
    ret
VesaBiosSetMode_ endp

    public VesaSetBank_
VesaSetBank_ proc near
    push    ds
    push    es
    push    fs
    push    gs
    pusha
    mov     dx,ax
    mov     ax,4f05h
    mov     bx,0
    int     10h
    popa
    pop     gs
    pop     fs
    pop     es
    pop     ds
    ret
VesaSetBank_ endp

    public ScreenDumpVesa_
ScreenDumpVesa_ proc near
    pusha
    cld
    mov     edi,dword ptr _gamedata
    xor     eax,eax
    xor     ecx,ecx
    mov     cx,word ptr [edi]
    mov     ax,word ptr [edi+2]
    mul     ecx
    mul     dword ptr _video_depth
    mov     ebx,eax
    rol     ebx,10h
    mov     esi,dword ptr [edi+0ah]
    xor     eax,eax
    call    VesaSetBank_
l1:
    mov     edi,0a0000h
    mov     ecx,4000h
    rep movsd
    add     ax,_bank_cnt
    call    VesaSetBank_
    dec     bx
    jne     l1
    rol     ebx,10h
    sar     ebx,2
    mov     ecx,ebx
    mov     edi,0a0000h
    rep movsd
    popa
    ret
ScreenDumpVesa_ endp

    public ScreenPartialDumpVesa_
ScreenPartialDumpVesa_ proc near
    push    ebp
    mov     ebp,esp
    add     esp,0ffffffe8h
    pusha
    xor     eax,eax
    xor     ecx,ecx
    mov     edi,dword ptr _gamedata
    mov     cx,word ptr [edi]
    mov     ax,word ptr [edi+12h]
    mul     ecx
    mov     cx,word ptr [edi+10h]
    and     ecx,0fffch
    add     eax,ecx
    mov     dword ptr [ebp-4],eax
    sar     eax,10h
    xor     ecx,ecx
    mov     cx,_bank_cnt
    mul     ecx
    mov     word ptr [ebp-6],ax
    call    VesaSetBank_
    mov     eax,dword ptr [edi+0ah]
    mov     dword ptr [ebp-10h],eax
    cld
    xor     ebx,ebx
    mov     bx,word ptr [edi]
    mov     ax,word ptr [edi+14h]
    add     ax,3
    and     eax,0fffch
    mov     dword ptr [ebp-18h],eax
    sub     ebx,eax
    jl      l5
    je      l6
    mov     dword ptr [ebp-14h],ebx
    mov     dx,word ptr [edi+16h]
    test    dx,dx
    je      l5
    mov     esi,dword ptr [ebp-10h]
    mov     eax,dword ptr [ebp-4]
    add     esi,eax
    and     eax,0ffffh
    mov     edi,0a0000h
    add     edi,eax
l1:
    mov     ecx,edi
    mov     eax,dword ptr [ebp-18h]
    add     ecx,eax
    sub     ecx,0a0000h
    cmp     ecx,0ffffh
    jg      l2
    mov     ecx,eax
    sar     ecx,2
    rep movsd
    jmp     l3
l2:
    mov     ebx,10000h
    sub     ebx,ecx
    neg     ebx
    mov     ecx,dword ptr [ebp-18h]
    sub     ecx,ebx
    push    ecx
    sar     ecx,2
    rep movsd
    mov     bx,_bank_cnt
    add     word ptr [ebp-6],bx
    mov     ax,word ptr [ebp-6]
    call    VesaSetBank_
    pop     ebx
    mov     edi,0a0000h
    mov     ecx,dword ptr [ebp-18h]
    sub     ecx,ebx
    sar     ecx,2
    rep movsd
    mov     eax,dword ptr [ebp-14h]
    add     esi,eax
    add     edi,eax
    jmp     l4
l3:
    mov     eax,dword ptr [ebp-14h]
    add     esi,eax
    add     edi,eax
    mov     ecx,edi
    sub     ecx,0a0000h
    cmp     ecx,0ffffh
    jl      l4
    and     ecx,0ffffh
    add     ecx,0a0000h
    mov     edi,ecx
    mov     bx,_bank_cnt
    add     word ptr [ebp-6],bx
    mov     ax,word ptr [ebp-6]
    call    VesaSetBank_
l4:
    dec     dx
    jne     l1
l5:
    popa
    leave
    ret
l6:
    mov     cx,word ptr [edi]
    mov     ax,word ptr [edi+16h]
    test    ax,ax
    jle     l5
    mul     ecx
    mov     dword ptr [ebp-0ch],eax
    mov     eax,10000h
    sub     eax,dword ptr [ebp-4]
    and     eax,0ffffh
    test    eax,eax
    jne     l7
    mov     eax,10000h
l7:
    mov     ecx,eax
    sar     ecx,2
    sub     dword ptr [ebp-0ch],eax
    mov     esi,dword ptr [ebp-10h]
    mov     eax,dword ptr [ebp-4]
    add     esi,eax
    and     eax,0ffffh
    mov     edi,0a0000h
    add     edi,eax
    rep movsd
    mov     bx,_bank_cnt
    add     word ptr [ebp-6],bx
    mov     ax,word ptr [ebp-6]
    call    VesaSetBank_
    mov     edx,dword ptr [ebp-0ch]
    sar     edx,10h
    test    dx,dx
    jle     l9
    mov     ebx,10000h
l8:
    mov     edi,0a0000h
    mov     ecx,4000h
    rep movsd
    mov     bx,_bank_cnt
    add     word ptr [ebp-6],bx
    mov     ax,word ptr [ebp-6]
    call    VesaSetBank_
    sub     dword ptr [ebp-0ch],ebx
    dec     dx
    jne     l8
l9:
    mov     ecx,dword ptr [ebp-0ch]
    test    ecx,ecx
    jle     l5
    sar     ecx,2
    inc     ecx
    mov     edi,0a0000h
    rep movsd
    popa
    leave
    ret
ScreenPartialDumpVesa_ endp

    public ScreenWaitVbl_
ScreenWaitVbl_ proc near
    push    eax
    push    edx
    mov     dx,3dah
l1:
    in      al,dx
    test    al,8
    jne     l1
l2:
    in      al,dx
    test    al,8
    je      l2
    pop     edx
    pop     eax
    ret
ScreenWaitVbl_ endp

    public PalSetBorder_
PalSetBorder_ proc near
    push    edx
    rol     eax,8
    mov     dx,3c8h
    xor     al,al
    out     dx,al
    inc     edx
    rol     eax,8
    out     dx,al
    rol     eax,8
    out     dx,al
    rol     eax,8
    out     dx,al
    pop     edx
    ret
PalSetBorder_ endp

    public PalInsertColours_
PalInsertColours_ proc near
    call    ScreenWaitVbl_
    mov     dx,3c8h
    out     dx,al
    inc     edx
    lea     ecx,[ecx+ecx*2]
l1:
    mov     al,byte ptr [esi]
    out     dx,al
    inc     esi
    dec     ecx
    jne     l1
    ret
PalInsertColours_ endp

    public FadeTick_
FadeTick_ proc near
    pusha
    test    byte ptr _toddata+1566,1
    je      l4
    mov     eax,_toddata+1558
    sub     eax,dword ptr _toddata+1562
    mov     _toddata+1558,eax
    test    eax,eax
    jns     l2
    mov     esi,dword ptr _toddata+1554
    mov     edi,offset _toddata+18
    mov     ecx,0c0h
    mov     edx,4
l1:
    mov     eax,dword ptr [esi]
    mov     dword ptr [edi],eax
    mov     dword ptr [edi+300h],eax
    add     esi,edx
    add     edi,edx
    dec     ecx
    jne     l1
    mov     byte ptr _toddata+1566,0
    mov     byte ptr _toddata+1567,1
l2:
    lea     esi,_toddata+786
    xor     eax,eax
    mov     ecx,100h
    call    PalInsertColours_
    test    byte ptr _toddata+1566,1
    je      l4
    mov     esi,dword ptr _toddata+1554
    mov     ebx,3f00h
    sub     ebx,dword ptr _toddata+1558
    test    bh,bh
    je      l4
    shr     bx,6
    mov     byte ptr _toddata+1567,0
    mov     edi,offset _toddata+18
    mov     ecx,300h
l3:
    xor     eax,eax
    xor     edx,edx
    mov     al,byte ptr [esi]
    mov     dl,byte ptr [edi]
    sub     eax,edx
    imul    bx
    add     ah,byte ptr [edi]
    mov     byte ptr [edi+300h],ah
    inc     esi
    inc     edi
    dec     ecx
    jne     l3
l4:
    popa
    ret
FadeTick_ endp

    public VgaGetFont_
VgaGetFont_ proc near
    pusha
    mov     dx,3c4h
    mov     al,4
    out     dx,al
    inc     dl
    mov     al,6
    out     dx,al
    mov     dl,0ceh
    mov     al,4
    out     dx,al
    inc     dl
    mov     al,2
    out     dx,al
    dec     dl
    mov     al,5
    out     dx,al
    inc     dl
    xor     al,al
    out     dx,al
    dec     dl
    mov     al,6
    out     dx,al
    inc     dl
    dec     al
    out     dx,al
    mov     esi,0a0000h
    xor     ecx,ecx
l1:
    mov     eax,dword ptr [esi]
    mov     ebx,dword ptr [esi+4]
    mov     edx,dword ptr [esi+8]
    mov     ebp,dword ptr [esi+0ch]
    mov     dword ptr [edi],eax
    mov     dword ptr [edi+4],ebx
    mov     dword ptr [edi+8],edx
    mov     dword ptr [edi+0ch],ebp
    inc     cl
    lea     esi,[esi+20h]
    lea     edi,[edi+10h]
    jne     l1
    mov     dx,3c4h
    mov     al,4
    out     dx,al
    inc     dl
    mov     al,3
    out     dx,al
    mov     dl,0ceh
    mov     al,4
    out     dx,al
    xor     al,al
    inc     dl
    out     dx,al
    dec     dl
    mov     al,5
    out     dx,al
    inc     dl
    mov     al,10h
    out     dx,al
    dec     dl
    mov     al,6
    out     dx,al
    inc     dl
    test    byte ptr ds:[487h],2
    mov     al,0ah
    jne     l2
    mov     al,0eh
l2:
    out     dx,al
    popa
    ret
VgaGetFont_ endp

    end

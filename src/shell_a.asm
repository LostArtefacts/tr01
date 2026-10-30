    .386p
    .model flat

    extrn _gamedata:dword

    .data

    public _video_depth
_video_depth dd 1

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

    end

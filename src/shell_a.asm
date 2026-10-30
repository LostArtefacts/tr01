    .386p
    .model flat





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

    end

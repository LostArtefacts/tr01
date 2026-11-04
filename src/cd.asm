    .586p

_TEXT segment para public use32 'CODE'
_TEXT ends
_DATA segment dword public use32 'DATA'
_DATA ends
_BSS segment dword public use32 'BSS'
_BSS ends

    assume cs:FLAT, ds:FLAT, es:FLAT, ss:FLAT

    extrn delay_:near
    extrn int386x_:near
    extrn memset_:near

    public CDMscdexCall_
    public CDInit_
    public CDRequest_
    public CDFree_
    public CDStatus_
    public CDTrackInfo_
    public CDRedAddr_
    public CDVolume_
    public CDPlay_
    public CDPlayPart_
    public CDStop_
    public CDResume_
    public CDSeek_
    public CDLoop_
    public CDPosition_

_TEXT segment
CDMscdexCall_ proc near
    push ebx
    push ecx
    push edx
    mov edx, 0300h
    mov ebx, 02fh
    mov eax, offset B12f9f0
    db 031h, 0c9h
    mov word ptr [B12f694], dx
    mov word ptr [B12f698], bx
    mov word ptr [B12f69c], cx
    mov ecx, offset B12f844
    mov edx, ds
    mov ebx, offset B12f694
    mov word ptr [B12f844], dx
    mov edx, offset B12f9f0
    mov eax, dword ptr [Dc6690]
    mov dword ptr [B12f6a8], edx
    db 089h, 0dah
    call int386x_
    pop edx
    pop ecx
    pop ebx
    ret
CDMscdexCall_ endp
    db 090h
CDInit_ proc near
    push ebx
    push ecx
    push edx
    push esi
    push edi
    push ebp
    mov ebx, 0ch
    mov eax, offset B12f844
    db 031h, 0d2h
    mov ecx, offset B12f844
    call memset_
    mov edx, 0100h
    mov ebx, 010h
    mov eax, dword ptr [Dc6690]
    mov word ptr [B12f698], bx
    mov ebx, offset B12f694
    mov word ptr [B12f694], dx
    db 089h, 0dah
    call int386x_
    mov ax, word ptr [B12f694]
    mov ebx, 032h
    mov word ptr [Dc668e], ax
    mov ax, word ptr [B12f6a0]
    db 031h, 0d2h
    mov word ptr [Dc668c], ax
    mov eax, offset B12f9f0
    call memset_
    mov edx, 01500h
    db 031h, 0dbh
    mov dword ptr [B12fa0c], edx
    mov dword ptr [B12fa00], ebx
    call CDMscdexCall_
    cmp dword ptr [B12fa00], 00h
    jne short L46f71
    mov eax, 01h
    jmp near ptr L4715b
L46f71:
    mov dl, 03h
    mov ecx, 05h
    mov bl, 06h
    mov esi, 0bh
    mov eax, dword ptr [B12fa08]
    mov edi, 07h
    mov dword ptr [B12f9e4], eax
    mov byte ptr [Dc65f6], dl
    mov word ptr [Dc6606], cx
    mov byte ptr [Dc660e], bl
    mov word ptr [Dc6642], si
    mov word ptr [Dc6572], di
    mov word ptr [Dc6596], di
    mov dh, 01ah
    mov ch, 0ch
    mov bl, 0bh
    mov eax, dword ptr [Dc668c]
    db 031h, 0f6h
    sar eax, 010h
    mov byte ptr [Dc65f4], dh
    mov byte ptr [Dc6632], dl
    mov byte ptr [Dc6630], dh
    mov byte ptr [Dc664a], ch
    mov byte ptr [Dc6562], dl
    mov byte ptr [Dc6560], dh
    mov byte ptr [Dc657a], bl
    mov byte ptr [Dc6586], dl
    mov byte ptr [Dc6584], dh
    mov byte ptr [Dc6616], dl
    mov byte ptr [Dc6614], dh
    mov byte ptr [Dc6672], dl
    mov ch, 0ah
    mov ebx, 02h
    shl eax, 010h
    mov dl, 084h
    add eax, 01ah
    mov byte ptr [Dc659e], ch
    mov word ptr [Dc6626], bx
    mov byte ptr [Dc65c2], dl
    mov bl, 09h
    mov cl, 01ch
    mov dh, 016h
    mov dword ptr [Dc6602], eax
    mov dword ptr [Dc663e], eax
    mov dword ptr [Dc656e], eax
    mov dword ptr [Dc6592], eax
    mov dword ptr [Dc6622], eax
    mov dword ptr [Dc6666], eax
    mov al, 083h
    mov byte ptr [Dc662e], bl
    mov byte ptr [Dc6658], cl
    mov byte ptr [Dc65c0], dh
    mov bh, 0ch
    mov ecx, 09h
    mov edx, 0dh
    mov byte ptr [Dc65aa], al
    mov ah, 018h
    mov byte ptr [Dc665a], bh
    mov word ptr [Dc666a], cx
    mov bl, 085h
    mov cl, 088h
    mov byte ptr [Dc65a8], ah
    mov al, 01h
    mov byte ptr [Dc65d8], bl
    mov byte ptr [Dc65e6], cl
    mov bh, 0dh
    mov byte ptr [B12fa22], al
    mov eax, offset Dc65d6
    mov byte ptr [Dc65d6], bh
    mov byte ptr [Dc65e4], bh
    call CDRequest_
    mov dword ptr [Dc667c], eax
    mov word ptr [Dc6688], si
    db 031h, 0dbh
L470cb:
    mov edx, 01ch
    mov eax, offset Dc6614
    call CDRequest_
    mov dword ptr [Dc667c], eax
    cmp eax, 0100h
    je short L470f6
    mov eax, 03e8h
    inc ebx
    call delay_
    cmp ebx, 05h
    jle short L470cb
L470f6:
    mov esi, dword ptr [Dc667c]
    cmp esi, 0100h
    je short L47120
    mov ebp, 01h
    db 030h, 0d2h
    db 031h, 0c0h
    mov dword ptr [Dc6684], ebp
    mov byte ptr [B12fa22], dl
    pop ebp
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
L47120:
    db 031h, 0ffh
    mov ah, byte ptr [B12fa22]
    mov dword ptr [Dc6680], edi
    test ah, ah
    je short L47154
    mov edx, 01fh
    mov eax, offset Dc65f4
    call CDRequest_
    mov dword ptr [Dc667c], eax
    db 039h, 0f0h
    jne short L47154
    mov eax, dword ptr [Dc660f]
    mov dword ptr [Dc6680], eax
L47154:
    call CDTrackInfo_
    db 031h, 0c0h
L4715b:
    pop ebp
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
CDInit_ endp
    db 08bh, 0c0h
CDRequest_ proc near
    push ebx
    push ecx
    push esi
    push edi
    push ebp
    sub esp, 04h
    db 089h, 0c5h
    mov dword ptr [esp], edx
    mov ebx, 032h
    mov edi, dword ptr [Dc668c]
    db 089h, 0d1h
    db 089h, 0c6h
    sar edi, 010h
    mov word ptr [eax+03h], 00h
    shl edi, 04h
    db 031h, 0d2h
    push edi
    db 089h, 0c8h
    shr ecx, 02h
    db 0f2h, 0a5h
    mov cl, al
    and cl, 03h
    db 0f2h, 0a4h
    pop edi
    mov eax, offset B12f9f0
    call memset_
    mov edx, 01510h
    mov ax, word ptr [Dc668e]
    db 031h, 0dbh
    mov dword ptr [B12fa0c], edx
    mov word ptr [B12fa12], ax
    mov eax, dword ptr [B12f9e4]
    mov dword ptr [B12fa00], ebx
    mov dword ptr [B12fa08], eax
    call CDMscdexCall_
    mov esi, dword ptr [Dc668c]
    mov ecx, dword ptr [esp]
    sar esi, 010h
    db 089h, 0efh
    shl esi, 04h
    push edi
    db 089h, 0c8h
    shr ecx, 02h
    db 0f2h, 0a5h
    mov cl, al
    and cl, 03h
    db 0f2h, 0a4h
    pop edi
    db 031h, 0c0h
    mov ax, word ptr [ebp+03h]
    add esp, 04h
    pop ebp
    pop edi
    pop esi
    pop ecx
    pop ebx
    ret
CDRequest_ endp
    db 08bh, 0c0h
CDFree_ proc near
    push ebx
    push ecx
    push edx
    push esi
    mov ah, byte ptr [B12fa22]
    test ah, ah
    je near ptr L4729a
    je short L47239
    mov edx, 0dh
    mov eax, offset Dc65d6
    call CDRequest_
    db 031h, 0d2h
    mov dword ptr [Dc667c], eax
    mov word ptr [Dc6688], dx
L47239:
    cmp word ptr [Dc668e], 00h
    je short L47292
    mov ebx, 0ch
    mov eax, offset B12f844
    db 031h, 0d2h
    mov ecx, 0101h
    call memset_
    mov ebx, offset B12f694
    mov ax, word ptr [Dc668c]
    mov word ptr [B12f694], cx
    mov ecx, offset B12f844
    mov word ptr [B12f6a0], ax
    db 089h, 0dah
    mov eax, dword ptr [Dc6690]
    db 031h, 0f6h
    call int386x_
    mov word ptr [Dc668e], si
    mov word ptr [Dc668c], si
L47292:
    db 030h, 0f6h
    mov byte ptr [B12fa22], dh
L4729a:
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
CDFree_ endp
    db 090h
CDStatus_ proc near
    push edx
    db 031h, 0d2h
    mov ah, byte ptr [B12fa22]
    mov dword ptr [Dc6680], edx
    test ah, ah
    je short L472dc
    mov edx, 01fh
    mov eax, offset Dc65f4
    call CDRequest_
    mov dword ptr [Dc667c], eax
    cmp eax, 0100h
    je short L472d2
    db 031h, 0c0h
    pop edx
    ret
L472d2:
    mov eax, dword ptr [Dc660f]
    mov dword ptr [Dc6680], eax
L472dc:
    mov eax, dword ptr [Dc6680]
    pop edx
    ret
CDStatus_ endp
    db 090h
CDTrackInfo_ proc near
    push ebx
    push ecx
    push edx
    mov edx, 021h
    mov eax, offset Dc6584
    call CDRequest_
    mov dword ptr [Dc667c], eax
    cmp eax, 0100h
    je short L4730b
    mov eax, 01h
    pop edx
    pop ecx
    pop ebx
    ret
L4730b:
    mov ebx, 0194h
    mov eax, offset B12f6b0
    db 031h, 0d2h
    call memset_
    mov ebx, 0194h
    mov eax, offset B12f850
    db 031h, 0d2h
    call memset_
    db 031h, 0dbh
    mov bl, byte ptr [Dc659f]
    lea ecx, [ebx*4+00h]
    jmp short L4737c
L4733e:
    mov edx, 021h
    mov eax, offset Dc6560
    mov byte ptr [Dc657b], bl
    call CDRequest_
    mov dword ptr [Dc667c], eax
    cmp eax, 0100h
    je short L47368
    mov eax, 01h
    pop edx
    pop ecx
    pop ebx
    ret
L47368:
    mov eax, dword ptr [Dc657c]
    add ecx, 04h
    call CDRedAddr_
    inc ebx
    mov dword ptr [ecx+B12f6ac], eax
L4737c:
    db 031h, 0c0h
    mov al, byte ptr [Dc65a0]
    inc eax
    db 039h, 0c3h
    jl short L4733e
    mov eax, dword ptr [Dc65a1]
    db 031h, 0dbh
    call CDRedAddr_
    mov bl, byte ptr [Dc659f]
    mov dword ptr [ecx+B12f6b0], eax
    lea eax, [ebx*4+00h]
    jmp short L473c1
L473a9:
    mov edx, dword ptr [eax+B12f6b4]
    mov ecx, dword ptr [eax+B12f6b0]
    add eax, 04h
    db 029h, 0cah
    inc ebx
    mov dword ptr [eax+B12f84c], edx
L473c1:
    db 031h, 0d2h
    mov dl, byte ptr [Dc65a0]
    lea ecx, [edx+01h]
    db 039h, 0cbh
    jl short L473a9
    db 031h, 0dbh
    mov dword ptr [B12f9e8], edx
    mov dword ptr [eax+B12f6b0], ebx
    db 031h, 0c0h
    pop edx
    pop ecx
    pop ebx
    ret
CDTrackInfo_ endp
CDRedAddr_ proc near
    push ebx
    push ecx
    push edx
    push esi
    db 089h, 0c2h
    db 089h, 0d6h
    db 089h, 0d1h
    db 089h, 0d3h
    db 031h, 0c0h
    and esi, 0ffh
    and ecx, 0ff00h
    and ebx, 0ff0000h
    shr ecx, 08h
    shr ebx, 010h
    test edx, edx
    je short L47445
    db 089h, 0d8h
    shl eax, 05h
    db 029h, 0d8h
    shl eax, 02h
    db 001h, 0d8h
    shl eax, 02h
    lea ebx, [eax*8+00h]
    db 001h, 0c3h
    lea eax, [ecx*4+00h]
    db 001h, 0c8h
    db 089h, 0c2h
    shl eax, 04h
    db 029h, 0d0h
    db 001h, 0d8h
    db 001h, 0f0h
    sub eax, 096h
    test eax, eax
    jge short L47445
    db 031h, 0c0h
L47445:
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
CDRedAddr_ endp
    db 08bh, 0c0h
CDVolume_ proc near
    push ebx
    push edx
    mov dl, 01h
    db 030h, 0e4h
    mov bl, 03h
    mov byte ptr [Dc6673], ah
    mov byte ptr [Dc6674], al
    mov byte ptr [Dc6675], dl
    mov byte ptr [Dc6676], al
    mov byte ptr [Dc6678], al
    mov byte ptr [Dc667a], al
    mov dh, 02h
    mov eax, offset Dc6658
    mov byte ptr [Dc6677], dh
    mov edx, 023h
    mov byte ptr [Dc6679], bl
    call CDRequest_
    mov dword ptr [Dc667c], eax
    mov eax, 01h
    pop edx
    pop ebx
    ret
CDVolume_ endp
    db 08bh, 0c0h
CDPlay_ proc near
    push ebx
    push ecx
    push edx
    push esi
    db 089h, 0c3h
    mov ah, byte ptr [B12fa22]
    test ah, ah
    je near ptr L475a8
    je short L474d3
    mov edx, 0dh
    mov eax, offset Dc65d6
    call CDRequest_
    db 031h, 0d2h
    mov dword ptr [Dc667c], eax
    mov word ptr [Dc6688], dx
L474d3:
    cmp dword ptr [Dc6684], 00h
    je short L47509
    mov edx, 01ch
    mov eax, offset Dc6614
    call CDRequest_
    mov dword ptr [Dc667c], eax
    call CDTrackInfo_
    cmp dword ptr [Dc667c], 0100h
    jne short L47509
    db 031h, 0f6h
    mov dword ptr [Dc6684], esi
L47509:
    db 031h, 0c0h
    mov al, byte ptr [Dc659f]
    db 039h, 0c3h
    jb short L4751f
    db 031h, 0c0h
    mov al, byte ptr [Dc65a0]
    db 039h, 0c3h
    jbe short L47529
L4751f:
    mov eax, 01h
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
L47529:
    lea ecx, [ebx*4+00h]
    mov eax, dword ptr [ecx+B12f6b0]
    mov edx, 018h
    mov dword ptr [Dc65bc], eax
    mov eax, offset Dc65a8
    call CDRequest_
    mov dword ptr [Dc667c], eax
    cmp eax, 0100h
    je short L47560
    mov eax, 01h
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
L47560:
    mov eax, dword ptr [ecx+B12f6b0]
    mov dword ptr [Dc65ce], eax
    mov eax, dword ptr [ecx+B12f850]
    mov edx, 016h
    mov dword ptr [Dc65d2], eax
    mov eax, offset Dc65c0
    call CDRequest_
    mov dword ptr [Dc667c], eax
    test ah, 02h
    jne short L47599
    mov eax, 01h
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
L47599:
    mov dword ptr [B12f9ec], ebx
    mov word ptr [Dc6688], 01h
L475a8:
    db 031h, 0c0h
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
CDPlay_ endp
    db 090h
CDPlayPart_ proc near
    push ecx
    push esi
    push edi
    push ebp
    db 089h, 0c1h
    db 089h, 0d6h
    db 089h, 0dfh
    mov ah, byte ptr [B12fa22]
    test ah, ah
    je near ptr L476f9
    je short L475e7
    mov edx, 0dh
    mov eax, offset Dc65d6
    call CDRequest_
    db 031h, 0d2h
    mov dword ptr [Dc667c], eax
    mov word ptr [Dc6688], dx
L475e7:
    cmp dword ptr [Dc6684], 00h
    je short L4761d
    mov edx, 01ch
    mov eax, offset Dc6614
    call CDRequest_
    mov dword ptr [Dc667c], eax
    call CDTrackInfo_
    cmp dword ptr [Dc667c], 0100h
    jne short L4761d
    db 031h, 0edh
    mov dword ptr [Dc6684], ebp
L4761d:
    db 031h, 0c0h
    mov al, byte ptr [Dc659f]
    db 039h, 0c1h
    jb short L47633
    db 031h, 0c0h
    mov al, byte ptr [Dc65a0]
    db 039h, 0c1h
    jbe short L4763d
L47633:
    mov eax, 01h
    pop ebp
    pop edi
    pop esi
    pop ecx
    ret
L4763d:
    lea ebx, [ecx*4+00h]
    mov eax, dword ptr [ebx+B12f6b0]
    db 001h, 0f0h
    mov edx, 018h
    mov dword ptr [Dc65bc], eax
    mov eax, offset Dc65a8
    call CDRequest_
    mov dword ptr [Dc667c], eax
    cmp eax, 0100h
    je short L47676
    mov eax, 01h
    pop ebp
    pop edi
    pop esi
    pop ecx
    ret
L47676:
    mov edx, 021h
    mov eax, offset Dc6560
    mov byte ptr [Dc657b], cl
    call CDRequest_
    mov dword ptr [Dc667c], eax
    cmp eax, 0100h
    je short L476a1
    mov eax, 01h
    pop ebp
    pop edi
    pop esi
    pop ecx
    ret
L476a1:
    test byte ptr [Dc6580], 040h
    je short L476b4
    mov eax, 01h
    pop ebp
    pop edi
    pop esi
    pop ecx
    ret
L476b4:
    mov eax, dword ptr [ebx+B12f6b0]
    db 001h, 0f0h
    mov edx, 016h
    mov dword ptr [Dc65ce], eax
    mov eax, offset Dc65c0
    mov dword ptr [Dc65d2], edi
    call CDRequest_
    mov dword ptr [Dc667c], eax
    test ah, 02h
    jne short L476ea
    mov eax, 01h
    pop ebp
    pop edi
    pop esi
    pop ecx
    ret
L476ea:
    db 031h, 0dbh
    mov dword ptr [B12f9ec], ecx
    mov word ptr [Dc6688], bx
L476f9:
    db 031h, 0c0h
    pop ebp
    pop edi
    pop esi
    pop ecx
    ret
CDPlayPart_ endp
CDStop_ proc near
    push edx
    cmp byte ptr [B12fa22], 00h
    je short L47727
    mov edx, 0dh
    mov eax, offset Dc65d6
    call CDRequest_
    db 031h, 0d2h
    mov dword ptr [Dc667c], eax
    mov word ptr [Dc6688], dx
L47727:
    pop edx
    ret
CDStop_ endp
    db 08dh, 040h, 000h
CDResume_ proc near
    push edx
    cmp byte ptr [B12fa22], 00h
    je short L47756
    mov edx, 0dh
    mov eax, offset Dc65e4
    call CDRequest_
    mov edx, 01h
    mov dword ptr [Dc667c], eax
    mov word ptr [Dc6688], dx
L47756:
    pop edx
    ret
CDResume_ endp
CDSeek_ proc near
    push ebx
    push edx
    push esi
    db 089h, 0c3h
    cmp byte ptr [B12fa22], 00h
    je near ptr L47801
    cmp dword ptr [Dc6684], 00h
    je short L477a0
    mov edx, 01ch
    mov eax, offset Dc6614
    call CDRequest_
    mov dword ptr [Dc667c], eax
    call CDTrackInfo_
    cmp dword ptr [Dc667c], 0100h
    jne short L477a0
    db 031h, 0f6h
    mov dword ptr [Dc6684], esi
L477a0:
    db 031h, 0c0h
    mov al, byte ptr [Dc659f]
    db 039h, 0c3h
    jb short L477b6
    db 031h, 0c0h
    mov al, byte ptr [Dc65a0]
    db 039h, 0c3h
    jbe short L477bf
L477b6:
    mov eax, 01h
    pop esi
    pop edx
    pop ebx
    ret
L477bf:
    mov eax, dword ptr [ebx*4+B12f6b0]
    mov edx, 018h
    mov dword ptr [Dc65bc], eax
    mov eax, offset Dc65a8
    call CDRequest_
    mov dword ptr [Dc667c], eax
    cmp eax, 0100h
    je short L477ef
    mov eax, 01h
    pop esi
    pop edx
    pop ebx
    ret
L477ef:
    mov edx, 01h
    mov dword ptr [B12f9ec], ebx
    mov word ptr [Dc6688], dx
L47801:
    db 031h, 0c0h
    pop esi
    pop edx
    pop ebx
    ret
CDSeek_ endp
    db 090h
CDLoop_ proc near
    push ecx
    push edx
    push esi
    mov ah, byte ptr [B12fa22]
    test ah, ah
    je near ptr L47940
    mov dx, word ptr [Dc668a]
    inc edx
    mov word ptr [Dc668a], dx
    cmp dx, 078h
    jl near ptr L47940
    db 031h, 0c9h
    mov si, word ptr [Dc6688]
    mov word ptr [Dc668a], cx
    cmp si, 02h
    jne short L4788a
    mov eax, dword ptr [B12f9ec]
    mov edx, dword ptr [eax*4+B12f6b0]
    mov dword ptr [Dc65ce], edx
    mov eax, dword ptr [eax*4+B12f850]
    mov edx, 016h
    mov dword ptr [Dc65d2], eax
    mov eax, offset Dc65c0
    call CDRequest_
    mov edx, 01h
    mov dword ptr [Dc667c], eax
    mov word ptr [Dc6688], dx
    pop esi
    pop edx
    pop ecx
    ret
L4788a:
    db 031h, 0d2h
    mov dword ptr [Dc6680], edx
    test ah, ah
    je short L478bb
    mov edx, 01fh
    mov eax, offset Dc65f4
    call CDRequest_
    mov dword ptr [Dc667c], eax
    cmp eax, 0100h
    jne short L478bb
    mov eax, dword ptr [Dc660f]
    mov dword ptr [Dc6680], eax
L478bb:
    test byte ptr [Dc6680], 01h
    je short L478d2
    mov dword ptr [Dc6684], 01h
    pop esi
    pop edx
    pop ecx
    ret
L478d2:
    cmp dword ptr [Dc6684], 00h
    je short L4790a
    mov edx, 01ch
    mov eax, offset Dc6614
    call CDRequest_
    db 031h, 0c9h
    mov dword ptr [Dc667c], eax
    call CDTrackInfo_
    mov eax, dword ptr [B12f9ec]
    mov dword ptr [Dc6684], ecx
    call CDPlay_
    pop esi
    pop edx
    pop ecx
    ret
L4790a:
    mov edx, 025h
    mov eax, offset Dc6630
    call CDRequest_
    mov dword ptr [Dc667c], eax
    test ah, 02h
    jne short L47940
    cmp word ptr [Dc6688], 00h
    je short L47940
    mov eax, dword ptr [B12f9ec]
    call CDSeek_
    mov word ptr [Dc6688], 02h
L47940:
    pop esi
    pop edx
    pop ecx
    ret
CDLoop_ endp
CDPosition_ proc near
    push ebx
    push edx
    cmp byte ptr [B12fa22], 00h
    je short L479b8
    mov edx, 025h
    mov eax, offset Dc6630
    call CDRequest_
    mov dword ptr [Dc667c], eax
    test ah, 02h
    jne short L47970
    mov eax, 0ffffffffh
    pop edx
    pop ebx
    ret
L47970:
    db 031h, 0d2h
    mov dl, byte ptr [Dc664e]
    db 089h, 0d0h
    shl eax, 05h
    db 029h, 0d0h
    shl eax, 02h
    db 001h, 0d0h
    shl eax, 02h
    db 089h, 0c2h
    lea ebx, [eax*8+00h]
    db 031h, 0c2h
    mov dl, byte ptr [Dc664f]
    db 001h, 0c3h
    lea eax, [edx*4+00h]
    db 001h, 0d0h
    db 089h, 0c2h
    shl eax, 04h
    db 029h, 0d0h
    db 001h, 0c3h
    db 031h, 0c0h
    mov al, byte ptr [Dc6650]
    db 001h, 0d8h
    pop edx
    pop ebx
    ret
L479b8:
    db 031h, 0c0h
    pop edx
    pop ebx
    ret
CDPosition_ endp
_TEXT ends

_DATA segment
Dc6560 label byte
    db 000h, 000h
Dc6562 label byte
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
Dc656e label byte
    db 000h, 000h, 000h, 000h
Dc6572 label byte
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
Dc657a label byte
    db 000h
Dc657b label byte
    db 000h
Dc657c label byte
    db 000h, 000h, 000h, 000h
Dc6580 label byte
    db 000h, 000h, 000h, 000h
Dc6584 label byte
    db 000h, 000h
Dc6586 label byte
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
Dc6592 label byte
    db 000h, 000h, 000h, 000h
Dc6596 label byte
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
Dc659e label byte
    db 000h
Dc659f label byte
    db 000h
Dc65a0 label byte
    db 000h
Dc65a1 label byte
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h
Dc65a8 label byte
    db 000h, 000h
Dc65aa label byte
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h
Dc65bc label byte
    db 000h, 000h, 000h, 000h
Dc65c0 label byte
    db 000h, 000h
Dc65c2 label byte
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
Dc65ce label byte
    db 000h, 000h, 000h, 000h
Dc65d2 label byte
    db 000h, 000h, 000h, 000h
Dc65d6 label byte
    db 000h, 000h
Dc65d8 label byte
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
Dc65e4 label byte
    db 000h, 000h
Dc65e6 label byte
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
Dc65f4 label byte
    db 000h, 000h
Dc65f6 label byte
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
Dc6602 label byte
    db 000h, 000h, 000h, 000h
Dc6606 label byte
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
Dc660e label byte
    db 000h
Dc660f label byte
    db 000h, 000h, 000h, 000h, 000h
Dc6614 label byte
    db 000h, 000h
Dc6616 label byte
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
Dc6622 label byte
    db 000h, 000h, 000h, 000h
Dc6626 label byte
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
Dc662e label byte
    db 000h, 000h
Dc6630 label byte
    db 000h, 000h
Dc6632 label byte
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
Dc663e label byte
    db 000h, 000h, 000h, 000h
Dc6642 label byte
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
Dc664a label byte
    db 000h, 000h, 000h, 000h
Dc664e label byte
    db 000h
Dc664f label byte
    db 000h
Dc6650 label byte
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
Dc6658 label byte
    db 000h, 000h
Dc665a label byte
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
Dc6666 label byte
    db 000h, 000h, 000h, 000h
Dc666a label byte
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
Dc6672 label byte
    db 000h
Dc6673 label byte
    db 000h
Dc6674 label byte
    db 000h
Dc6675 label byte
    db 000h
Dc6676 label byte
    db 000h
Dc6677 label byte
    db 000h
Dc6678 label byte
    db 000h
Dc6679 label byte
    db 000h
Dc667a label byte
    db 000h, 000h
Dc667c label byte
    db 000h, 000h, 000h, 000h
Dc6680 label byte
    db 000h, 000h, 000h, 000h
Dc6684 label byte
    db 000h, 000h, 000h, 000h
Dc6688 label byte
    db 000h, 000h
Dc668a label byte
    db 000h, 000h
Dc668c label byte
    db 000h, 000h
Dc668e label byte
    db 000h, 000h
Dc6690 label byte
    db 031h, 000h, 000h, 000h
_DATA ends

_BSS segment
B12f694 label byte
    db 4 dup(?)
B12f698 label byte
    db 4 dup(?)
B12f69c label byte
    db 4 dup(?)
B12f6a0 label byte
    db 8 dup(?)
B12f6a8 label byte
    db 4 dup(?)
B12f6ac label byte
    db 4 dup(?)
B12f6b0 label byte
    db 4 dup(?)
B12f6b4 label byte
    db 400 dup(?)
B12f844 label byte
    db 8 dup(?)
B12f84c label byte
    db 4 dup(?)
B12f850 label byte
    db 404 dup(?)
B12f9e4 label byte
    db 4 dup(?)
B12f9e8 label byte
    db 4 dup(?)
B12f9ec label byte
    db 4 dup(?)
B12f9f0 label byte
    db 16 dup(?)
B12fa00 label byte
    db 8 dup(?)
B12fa08 label byte
    db 4 dup(?)
B12fa0c label byte
    db 6 dup(?)
B12fa12 label byte
    db 16 dup(?)
B12fa22 label byte
    db 2 dup(?)
_BSS ends

    end

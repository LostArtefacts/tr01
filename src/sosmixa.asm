    .586p

_TEXT segment dword public use32 'CODE'
_TEXT ends

    assume cs:FLAT, ds:FLAT, es:FLAT, ss:FLAT

    extrn _Datac85c4:byte
    extrn _Datac85d4:byte
    extrn _Datac85d8:byte
    extrn _Datac85dc:byte
    extrn _Datac85f0:byte
    extrn _Datac85f4:byte

    public Func5a834_
    public _Data5a835
    public Func5c71b_
    public Func5c775_

_TEXT segment
Func5a834_ proc near
    ret
Func5a834_ endp
_Data5a835 label byte
    dd offset L5ac35
    dd offset L5ac53
    dd offset L5ac76
    dd offset L5ac95
    dd offset L5acb9
    dd offset L5acda
    dd offset L5ad00
    dd offset L5ad22
    dd offset L5ad49
    dd offset L5ad6a
    dd offset L5ad96
    dd offset L5adb9
    dd offset L5ade7
    dd offset L5ae0e
    dd offset L5ae40
    dd offset L5ae69
    dd offset L5ae9d
    dd offset L5aec4
    dd offset L5aef0
    dd offset L5af1d
    dd offset L5af4f
    dd offset L5af79
    dd offset L5afa8
    dd offset L5afd8
    dd offset L5b00d
    dd offset L5b03c
    dd offset L5b076
    dd offset L5b0a7
    dd offset L5b0e3
    dd offset L5b118
    dd offset L5b158
    dd offset L5b18f
    dd offset L5b1d1
    dd offset L5b1fb
    dd offset L5b22a
    dd offset L5b255
    dd offset L5b285
    dd offset L5b2c3
    dd offset L5b306
    dd offset L5b345
    dd offset L5b389
    dd offset L5b3b6
    dd offset L5b3ee
    dd offset L5b41d
    dd offset L5b457
    dd offset L5b496
    dd offset L5b4e0
    dd offset L5b521
    dd offset L5b56d
    dd offset L5b5a0
    dd offset L5b5d8
    dd offset L5b611
    dd offset L5b64f
    dd offset L5b696
    dd offset L5b6e2
    dd offset L5b72f
    dd offset L5b781
    dd offset L5b7bc
    dd offset L5b802
    dd offset L5b83f
    dd offset L5b887
    dd offset L5b8d4
    dd offset L5b92c
    dd offset L5b97b
    dd offset L5b9d5
    dd offset L5b9f3
    dd offset L5ba16
    dd offset L5ba35
    dd offset L5ba59
    dd offset L5ba7a
    dd offset L5baa0
    dd offset L5bac2
    dd offset L5bae9
    dd offset L5bb0a
    dd offset L5bb36
    dd offset L5bb59
    dd offset L5bb87
    dd offset L5bbae
    dd offset L5bbe0
    dd offset L5bc09
    dd offset L5bc3d
    dd offset L5bc64
    dd offset L5bc90
    dd offset L5bcbd
    dd offset L5bcef
    dd offset L5bd19
    dd offset L5bd48
    dd offset L5bd78
    dd offset L5bdad
    dd offset L5bddc
    dd offset L5be16
    dd offset L5be47
    dd offset L5be83
    dd offset L5beb8
    dd offset L5bef8
    dd offset L5bf2f
    dd offset L5bf71
    dd offset L5bf9b
    dd offset L5bfca
    dd offset L5bff5
    dd offset L5c025
    dd offset L5c063
    dd offset L5c0a6
    dd offset L5c0e5
    dd offset L5c129
    dd offset L5c156
    dd offset L5c18e
    dd offset L5c1bd
    dd offset L5c1f7
    dd offset L5c236
    dd offset L5c280
    dd offset L5c2c1
    dd offset L5c30d
    dd offset L5c340
    dd offset L5c378
    dd offset L5c3b1
    dd offset L5c3ef
    dd offset L5c436
    dd offset L5c482
    dd offset L5c4cf
    dd offset L5c521
    dd offset L5c55c
    dd offset L5c5a2
    dd offset L5c5df
    dd offset L5c627
    dd offset L5c674
    dd offset L5c6cc
    dd offset Func5c71b_
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
L5ac35 label byte
    db 03bh, 035h
    dd offset _Datac85d4
    db 073h, 015h, 08ah, 026h, 00fh, 0bfh, 0c0h, 001h, 007h, 083h, 0c7h, 004h, 083h, 0c6h, 001h, 03bh
    db 03dh
    dd offset _Datac85c4
    db 076h, 0e3h, 0c3h
L5ac53 label byte
    db 03bh, 035h
    dd offset _Datac85d4
    db 073h, 01ah, 08ah, 026h, 035h, 000h, 080h, 000h, 000h, 00fh, 0bfh, 0c0h, 001h, 007h, 083h, 0c7h
    db 004h, 083h, 0c6h, 001h, 03bh, 03dh
    dd offset _Datac85c4
    db 076h, 0deh, 0c3h
L5ac76 label byte
    db 03bh, 035h
    dd offset _Datac85d4
    db 073h, 016h, 066h, 08bh, 006h, 00fh, 0bfh, 0c0h, 001h, 007h, 083h, 0c7h, 004h, 083h, 0c6h, 002h
    db 03bh, 03dh
    dd offset _Datac85c4
    db 076h, 0e2h, 0c3h
L5ac95 label byte
    db 03bh, 035h
    dd offset _Datac85d4
    db 073h, 01bh, 066h, 08bh, 006h, 035h, 000h, 080h, 000h, 000h, 00fh, 0bfh, 0c0h, 001h, 007h, 083h
    db 0c7h, 004h, 083h, 0c6h, 002h, 03bh, 03dh
    dd offset _Datac85c4
    db 076h, 0ddh, 0c3h
L5acb9 label byte
    db 03bh, 035h
    dd offset _Datac85d4
    db 073h, 018h, 08ah, 026h, 00fh, 0bfh, 0c0h, 001h, 007h, 001h, 047h, 004h, 083h, 0c7h, 008h, 083h
    db 0c6h, 001h, 03bh, 03dh
    dd offset _Datac85c4
    db 076h, 0e0h, 0c3h
L5acda label byte
    db 03bh, 035h
    dd offset _Datac85d4
    db 073h, 01dh, 08ah, 026h, 035h, 000h, 080h, 000h, 000h, 00fh, 0bfh, 0c0h, 001h, 007h, 001h, 047h
    db 004h, 083h, 0c7h, 008h, 083h, 0c6h, 001h, 03bh, 03dh
    dd offset _Datac85c4
    db 076h, 0dbh, 0c3h
L5ad00 label byte
    db 03bh, 035h
    dd offset _Datac85d4
    db 073h, 019h, 066h, 08bh, 006h, 00fh, 0bfh, 0c0h, 001h, 007h, 001h, 047h, 004h, 083h, 0c7h, 008h
    db 083h, 0c6h, 002h, 03bh, 03dh
    dd offset _Datac85c4
    db 076h, 0dfh, 0c3h
L5ad22 label byte
    db 03bh, 035h
    dd offset _Datac85d4
    db 073h, 01eh, 066h, 08bh, 006h, 035h, 000h, 080h, 000h, 000h, 00fh, 0bfh, 0c0h, 001h, 007h, 001h
    db 047h, 004h, 083h, 0c7h, 008h, 083h, 0c6h, 002h, 03bh, 03dh
    dd offset _Datac85c4
    db 076h, 0dah, 0c3h
L5ad49 label byte
    db 03bh, 035h
    dd offset _Datac85d4
    db 073h, 018h, 08ah, 026h, 08ah, 07eh, 001h, 00fh, 0bfh, 0c0h, 001h, 007h, 083h, 0c7h, 004h, 083h
    db 0c6h, 002h, 03bh, 03dh
    dd offset _Datac85c4
    db 076h, 0e0h, 0c3h
L5ad6a label byte
    db 03bh, 035h
    dd offset _Datac85d4
    db 073h, 023h, 08ah, 026h, 08ah, 07eh, 001h, 035h, 000h, 080h, 000h, 000h, 081h, 0f3h, 000h, 080h
    db 000h, 000h, 00fh, 0bfh, 0c0h, 001h, 007h, 083h, 0c7h, 004h, 083h, 0c6h, 002h, 03bh, 03dh
    dd offset _Datac85c4
    db 076h, 0d5h, 0c3h
L5ad96 label byte
    db 03bh, 035h
    dd offset _Datac85d4
    db 073h, 01ah, 066h, 08bh, 006h, 066h, 08bh, 05eh, 002h, 00fh, 0bfh, 0c0h, 001h, 007h, 083h, 0c7h
    db 004h, 083h, 0c6h, 004h, 03bh, 03dh
    dd offset _Datac85c4
    db 076h, 0deh, 0c3h
L5adb9 label byte
    db 03bh, 035h
    dd offset _Datac85d4
    db "s%f"
    db 08bh, 006h, 066h, 08bh, 05eh, 002h, 035h, 000h, 080h, 000h, 000h, 081h, 0f3h, 000h, 080h, 000h
    db 000h, 00fh, 0bfh, 0c0h, 001h, 007h, 083h, 0c7h, 004h, 083h, 0c6h, 004h, 03bh, 03dh
    dd offset _Datac85c4
    db 076h, 0d3h, 0c3h
L5ade7 label byte
    db 03bh, 035h
    dd offset _Datac85d4
    db 073h, 01eh, 08ah, 026h, 08ah, 07eh, 001h, 00fh, 0bfh, 0c0h, 001h, 007h, 00fh, 0bfh, 0dbh, 001h
    db 05fh, 004h, 083h, 0c7h, 008h, 083h, 0c6h, 002h, 03bh, 03dh
    dd offset _Datac85c4
    db 076h, 0dah, 0c3h
L5ae0e label byte
    db 03bh, 035h
    dd offset _Datac85d4
    db 073h, 029h, 08ah, 026h, 08ah, 07eh, 001h, 035h, 000h, 080h, 000h, 000h, 081h, 0f3h, 000h, 080h
    db 000h, 000h, 00fh, 0bfh, 0c0h, 001h, 007h, 00fh, 0bfh, 0dbh, 001h, 05fh, 004h, 083h, 0c7h, 008h
    db 083h, 0c6h, 002h, 03bh, 03dh
    dd offset _Datac85c4
    db 076h, 0cfh, 0c3h
L5ae40 label byte
    db 03bh, 035h
    dd offset _Datac85d4
    db "s f"
    db 08bh, 006h, 066h, 08bh, 05eh, 002h, 00fh, 0bfh, 0c0h, 001h, 007h, 00fh, 0bfh, 0dbh, 001h, 05fh
    db 004h, 083h, 0c7h, 008h, 083h, 0c6h, 004h, 03bh, 03dh
    dd offset _Datac85c4
    db 076h, 0d8h, 0c3h
L5ae69 label byte
    db 03bh, 035h
    dd offset _Datac85d4
    db "s+f"
    db 08bh, 006h, 066h, 08bh, 05eh, 002h, 035h, 000h, 080h, 000h, 000h, 081h, 0f3h, 000h, 080h, 000h
    db 000h, 00fh, 0bfh, 0c0h, 001h, 007h, 00fh, 0bfh, 0dbh, 001h, 05fh, 004h, 083h, 0c7h, 008h, 083h
    db 0c6h, 004h, 03bh, 03dh
    dd offset _Datac85c4
    db 076h, 0cdh, 0c3h
L5ae9d label byte
    db 03bh, 035h
    dd offset _Datac85d4
    db 073h, 01eh, 08ah, 026h, 00fh, 0bfh, 0c0h, 001h, 007h, 083h, 0c7h, 004h, 003h, 00dh
    dd offset _Datac85d8
    db 013h, 035h
    dd offset _Datac85dc
    db 03bh, 03dh
    dd offset _Datac85c4
    db 076h, 0dah, 0c3h
L5aec4 label byte
    db 03bh, 035h
    dd offset _Datac85d4
    db 073h, 023h, 08ah, 026h, 035h, 000h, 080h, 000h, 000h, 00fh, 0bfh, 0c0h, 001h, 007h, 083h, 0c7h
    db 004h, 003h, 00dh
    dd offset _Datac85d8
    db 013h, 035h
    dd offset _Datac85dc
    db 03bh, 03dh
    dd offset _Datac85c4
    db 076h, 0d5h, 0c3h
L5aef0 label byte
    db 03bh, 035h
    dd offset _Datac85d4
    db "s$f"
    db 08bh, 006h, 00fh, 0bfh, 0c0h, 001h, 007h, 083h, 0c7h, 004h, 033h, 0edh, 003h, 00dh
    dd offset _Datac85d8
    db 013h, 0edh, 003h, 034h, 0adh
    dd offset _Datac85dc
    db 03bh, 03dh
    dd offset _Datac85c4
    db 076h, 0d4h, 0c3h
L5af1d label byte
    db 03bh, 035h
    dd offset _Datac85d4
    db "s)f"
    db 08bh, 006h, 035h, 000h, 080h, 000h, 000h, 00fh, 0bfh, 0c0h, 001h, 007h, 083h, 0c7h, 004h, 033h
    db 0edh, 003h, 00dh
    dd offset _Datac85d8
    db 013h, 0edh, 003h, 034h, 0adh
    dd offset _Datac85dc
    db 03bh, 03dh
    dd offset _Datac85c4
    db 076h, 0cfh, 0c3h
L5af4f label byte
    db 03bh, 035h
    dd offset _Datac85d4
    db 073h, 021h, 08ah, 026h, 00fh, 0bfh, 0c0h, 001h, 007h, 001h, 047h, 004h, 083h, 0c7h, 008h, 003h
    db 00dh
    dd offset _Datac85d8
    db 013h, 035h
    dd offset _Datac85dc
    db 03bh, 03dh
    dd offset _Datac85c4
    db 076h, 0d7h, 0c3h
L5af79 label byte
    db 03bh, 035h
    dd offset _Datac85d4
    db 073h, 026h, 08ah, 026h, 035h, 000h, 080h, 000h, 000h, 00fh, 0bfh, 0c0h, 001h, 007h, 001h, 047h
    db 004h, 083h, 0c7h, 008h, 003h, 00dh
    dd offset _Datac85d8
    db 013h, 035h
    dd offset _Datac85dc
    db 03bh, 03dh
    dd offset _Datac85c4
    db 076h, 0d2h, 0c3h
L5afa8 label byte
    db 03bh, 035h
    dd offset _Datac85d4
    db "s'f"
    db 08bh, 006h, 00fh, 0bfh, 0c0h, 001h, 007h, 001h, 047h, 004h, 083h, 0c7h, 008h, 033h, 0edh, 003h
    db 00dh
    dd offset _Datac85d8
    db 013h, 0edh, 003h, 034h, 0adh
    dd offset _Datac85dc
    db 03bh, 03dh
    dd offset _Datac85c4
    db 076h, 0d1h, 0c3h
L5afd8 label byte
    db 03bh, 035h
    dd offset _Datac85d4
    db "s,f"
    db 08bh, 006h, 035h, 000h, 080h, 000h, 000h, 00fh, 0bfh, 0c0h, 001h, 007h, 001h, 047h, 004h, 083h
    db 0c7h, 008h, 033h, 0edh, 003h, 00dh
    dd offset _Datac85d8
    db 013h, 0edh, 003h, 034h, 0adh
    dd offset _Datac85dc
    db 03bh, 03dh
    dd offset _Datac85c4
    db 076h, 0cch, 0c3h
L5b00d label byte
    db 03bh, 035h
    dd offset _Datac85d4
    db 073h, 026h, 08ah, 026h, 08ah, 07eh, 001h, 00fh, 0bfh, 0c0h, 001h, 007h, 083h, 0c7h, 004h, 033h
    db 0edh, 003h, 00dh
    dd offset _Datac85d8
    db 013h, 0edh, 003h, 034h, 0adh
    dd offset _Datac85dc
    db 03bh, 03dh
    dd offset _Datac85c4
    db 076h, 0d2h, 0c3h
L5b03c label byte
    db 03bh, 035h
    dd offset _Datac85d4
    db 073h, 031h, 08ah, 026h, 08ah, 07eh, 001h, 035h, 000h, 080h, 000h, 000h, 081h, 0f3h, 000h, 080h
    db 000h, 000h, 00fh, 0bfh, 0c0h, 001h, 007h, 083h, 0c7h, 004h, 033h, 0edh, 003h, 00dh
    dd offset _Datac85d8
    db 013h, 0edh, 003h, 034h, 0adh
    dd offset _Datac85dc
    db 03bh, 03dh
    dd offset _Datac85c4
    db 076h, 0c7h, 0c3h
L5b076 label byte
    db 03bh, 035h
    dd offset _Datac85d4
    db "s(f"
    db 08bh, 006h, 066h, 08bh, 05eh, 002h, 00fh, 0bfh, 0c0h, 001h, 007h, 083h, 0c7h, 004h, 033h, 0edh
    db 003h, 00dh
    dd offset _Datac85d8
    db 013h, 0edh, 003h, 034h, 0adh
    dd offset _Datac85dc
    db 03bh, 03dh
    dd offset _Datac85c4
    db 076h, 0d0h, 0c3h
L5b0a7 label byte
    db 03bh, 035h
    dd offset _Datac85d4
    db "s3f"
    db 08bh, 006h, 066h, 08bh, 05eh, 002h, 035h, 000h, 080h, 000h, 000h, 081h, 0f3h, 000h, 080h, 000h
    db 000h, 00fh, 0bfh, 0c0h, 001h, 007h, 083h, 0c7h, 004h, 033h, 0edh, 003h, 00dh
    dd offset _Datac85d8
    db 013h, 0edh, 003h, 034h, 0adh
    dd offset _Datac85dc
    db 03bh, 03dh
    dd offset _Datac85c4
    db 076h, 0c5h, 0c3h
L5b0e3 label byte
    db 03bh, 035h
    dd offset _Datac85d4
    db 073h, 02ch, 08ah, 026h, 08ah, 07eh, 001h, 00fh, 0bfh, 0c0h, 001h, 007h, 00fh, 0bfh, 0dbh, 001h
    db 05fh, 004h, 083h, 0c7h, 008h, 033h, 0edh, 003h, 00dh
    dd offset _Datac85d8
    db 013h, 0edh, 003h, 034h, 0adh
    dd offset _Datac85dc
    db 03bh, 03dh
    dd offset _Datac85c4
    db 076h, 0cch, 0c3h
L5b118 label byte
    db 03bh, 035h
    dd offset _Datac85d4
    db 073h, 037h, 08ah, 026h, 08ah, 07eh, 001h, 035h, 000h, 080h, 000h, 000h, 081h, 0f3h, 000h, 080h
    db 000h, 000h, 00fh, 0bfh, 0c0h, 001h, 007h, 00fh, 0bfh, 0dbh, 001h, 05fh, 004h, 083h, 0c7h, 008h
    db 033h, 0edh, 003h, 00dh
    dd offset _Datac85d8
    db 013h, 0edh, 003h, 034h, 0adh
    dd offset _Datac85dc
    db 03bh, 03dh
    dd offset _Datac85c4
    db 076h, 0c1h, 0c3h
L5b158 label byte
    db 03bh, 035h
    dd offset _Datac85d4
    db "s.f"
    db 08bh, 006h, 066h, 08bh, 05eh, 002h, 00fh, 0bfh, 0c0h, 001h, 007h, 00fh, 0bfh, 0dbh, 001h, 05fh
    db 004h, 083h, 0c7h, 008h, 033h, 0edh, 003h, 00dh
    dd offset _Datac85d8
    db 013h, 0edh, 003h, 034h, 0adh
    dd offset _Datac85dc
    db 03bh, 03dh
    dd offset _Datac85c4
    db 076h, 0cah, 0c3h
L5b18f label byte
    db 03bh, 035h
    dd offset _Datac85d4
    db "s9f"
    db 08bh, 006h, 066h, 08bh, 05eh, 002h, 035h, 000h, 080h, 000h, 000h, 081h, 0f3h, 000h, 080h, 000h
    db 000h, 00fh, 0bfh, 0c0h, 001h, 007h, 00fh, 0bfh, 0dbh, 001h, 05fh, 004h, 083h, 0c7h, 008h, 033h
    db 0edh, 003h, 00dh
    dd offset _Datac85d8
    db 013h, 0edh, 003h, 034h, 0adh
    dd offset _Datac85dc
    db 03bh, 03dh
    dd offset _Datac85c4
    db 076h, 0bfh, 0c3h
L5b1d1 label byte
    db 03bh, 035h
    dd offset _Datac85d4
    db 073h, 021h, 08ah, 026h, 00fh, 0b7h, 0c0h, 066h, 0f7h, 02dh
    dd offset _Datac85f0
    db 003h, 0d2h, 00fh, 0bfh, 0d2h, 001h, 017h, 083h, 0c7h, 004h, 083h, 0c6h, 001h, 03bh, 03dh
    dd offset _Datac85c4
    db 076h, 0d7h, 0c3h
L5b1fb label byte
    db 03bh, 035h
    dd offset _Datac85d4
    db 073h, 026h, 08ah, 026h, 035h, 000h, 080h, 000h, 000h, 00fh, 0b7h, 0c0h, 066h, 0f7h, 02dh
    dd offset _Datac85f0
    db 003h, 0d2h, 00fh, 0bfh, 0d2h, 001h, 017h, 083h, 0c7h, 004h, 083h, 0c6h, 001h, 03bh, 03dh
    dd offset _Datac85c4
    db 076h, 0d2h, 0c3h
L5b22a label byte
    db 03bh, 035h
    dd offset _Datac85d4
    db 073h, 022h, 066h, 08bh, 006h, 00fh, 0b7h, 0c0h, 066h, 0f7h, 02dh
    dd offset _Datac85f0
    db 003h, 0d2h, 00fh, 0bfh, 0d2h, 001h, 017h, 083h, 0c7h, 004h, 083h, 0c6h, 002h, 03bh, 03dh
    dd offset _Datac85c4
    db 076h, 0d6h, 0c3h
L5b255 label byte
    db 03bh, 035h
    dd offset _Datac85d4
    db "s'f"
    db 08bh, 006h, 035h, 000h, 080h, 000h, 000h, 00fh, 0b7h, 0c0h, 066h, 0f7h, 02dh
    dd offset _Datac85f0
    db 003h, 0d2h, 00fh, 0bfh, 0d2h, 001h, 017h, 083h, 0c7h, 004h, 083h, 0c6h, 002h, 03bh, 03dh
    dd offset _Datac85c4
    db 076h, 0d1h, 0c3h
L5b285 label byte
    db 03bh, 035h
    dd offset _Datac85d4
    db 073h, 035h, 08ah, 026h, 08bh, 0d8h, 00fh, 0b7h, 0c0h, 066h, 0f7h, 02dh
    dd offset _Datac85f0
    db 003h, 0d2h, 00fh, 0bfh, 0d2h, 001h, 017h, 00fh, 0b7h, 0c3h, 066h, 0f7h, 02dh
    dd offset _Datac85f4
    db 003h, 0d2h, 00fh, 0bfh, 0d2h, 001h, 057h, 004h, 083h, 0c7h, 008h, 083h, 0c6h, 001h, 03bh, 03dh
    dd offset _Datac85c4
    db 076h, 0c3h, 0c3h
L5b2c3 label byte
    db 03bh, 035h
    dd offset _Datac85d4
    db 073h, 03ah, 08ah, 026h, 035h, 000h, 080h, 000h, 000h, 08bh, 0d8h, 00fh, 0b7h, 0c0h, 066h, 0f7h
    db 02dh
    dd offset _Datac85f0
    db 003h, 0d2h, 00fh, 0bfh, 0d2h, 001h, 017h, 00fh, 0b7h, 0c3h, 066h, 0f7h, 02dh
    dd offset _Datac85f4
    db 003h, 0d2h, 00fh, 0bfh, 0d2h, 001h, 057h, 004h, 083h, 0c7h, 008h, 083h, 0c6h, 001h, 03bh, 03dh
    dd offset _Datac85c4
    db 076h, 0beh, 0c3h
L5b306 label byte
    db 03bh, 035h
    dd offset _Datac85d4
    db "s6f"
    db 08bh, 006h, 08bh, 0d8h, 00fh, 0b7h, 0c0h, 066h, 0f7h, 02dh
    dd offset _Datac85f0
    db 003h, 0d2h, 00fh, 0bfh, 0d2h, 001h, 017h, 00fh, 0b7h, 0c3h, 066h, 0f7h, 02dh
    dd offset _Datac85f4
    db 003h, 0d2h, 00fh, 0bfh, 0d2h, 001h, 057h, 004h, 083h, 0c7h, 008h, 083h, 0c6h, 002h, 03bh, 03dh
    dd offset _Datac85c4
    db 076h, 0c2h, 0c3h
L5b345 label byte
    db 03bh, 035h
    dd offset _Datac85d4
    db "s;f"
    db 08bh, 006h, 035h, 000h, 080h, 000h, 000h, 08bh, 0d8h, 00fh, 0b7h, 0c0h, 066h, 0f7h, 02dh
    dd offset _Datac85f0
    db 003h, 0d2h, 00fh, 0bfh, 0d2h, 001h, 017h, 00fh, 0b7h, 0c3h, 066h, 0f7h, 02dh
    dd offset _Datac85f4
    db 003h, 0d2h, 00fh, 0bfh, 0d2h, 001h, 057h, 004h, 083h, 0c7h, 008h, 083h, 0c6h, 002h, 03bh, 03dh
    dd offset _Datac85c4
    db 076h, 0bdh, 0c3h
L5b389 label byte
    db 03bh, 035h
    dd offset _Datac85d4
    db 073h, 024h, 08ah, 026h, 08ah, 07eh, 001h, 00fh, 0b7h, 0c0h, 066h, 0f7h, 02dh
    dd offset _Datac85f0
    db 003h, 0d2h, 00fh, 0bfh, 0d2h, 001h, 017h, 083h, 0c7h, 004h, 083h, 0c6h, 002h, 03bh, 03dh
    dd offset _Datac85c4
    db 076h, 0d4h, 0c3h
L5b3b6 label byte
    db 03bh, 035h
    dd offset _Datac85d4
    db 073h, 02fh, 08ah, 026h, 08ah, 07eh, 001h, 035h, 000h, 080h, 000h, 000h, 081h, 0f3h, 000h, 080h
    db 000h, 000h, 00fh, 0b7h, 0c0h, 066h, 0f7h, 02dh
    dd offset _Datac85f0
    db 003h, 0d2h, 00fh, 0bfh, 0d2h, 001h, 017h, 083h, 0c7h, 004h, 083h, 0c6h, 002h, 03bh, 03dh
    dd offset _Datac85c4
    db 076h, 0c9h, 0c3h
L5b3ee label byte
    db 03bh, 035h
    dd offset _Datac85d4
    db "s&f"
    db 08bh, 006h, 066h, 08bh, 05eh, 002h, 00fh, 0b7h, 0c0h, 066h, 0f7h, 02dh
    dd offset _Datac85f0
    db 003h, 0d2h, 00fh, 0bfh, 0d2h, 001h, 017h, 083h, 0c7h, 004h, 083h, 0c6h, 004h, 03bh, 03dh
    dd offset _Datac85c4
    db 076h, 0d2h, 0c3h
L5b41d label byte
    db 03bh, 035h
    dd offset _Datac85d4
    db "s1f"
    db 08bh, 006h, 066h, 08bh, 05eh, 002h, 035h, 000h, 080h, 000h, 000h, 081h, 0f3h, 000h, 080h, 000h
    db 000h, 00fh, 0b7h, 0c0h, 066h, 0f7h, 02dh
    dd offset _Datac85f0
    db 003h, 0d2h, 00fh, 0bfh, 0d2h, 001h, 017h, 083h, 0c7h, 004h, 083h, 0c6h, 004h, 03bh, 03dh
    dd offset _Datac85c4
    db 076h, 0c7h, 0c3h
L5b457 label byte
    db 03bh, 035h
    dd offset _Datac85d4
    db 073h, 036h, 08ah, 026h, 08ah, 07eh, 001h, 00fh, 0b7h, 0c0h, 066h, 0f7h, 02dh
    dd offset _Datac85f0
    db 003h, 0d2h, 00fh, 0bfh, 0d2h, 001h, 017h, 00fh, 0b7h, 0c3h, 066h, 0f7h, 02dh
    dd offset _Datac85f4
    db 003h, 0d2h, 00fh, 0bfh, 0d2h, 001h, 057h, 004h, 083h, 0c7h, 008h, 083h, 0c6h, 002h, 03bh, 03dh
    dd offset _Datac85c4
    db 076h, 0c2h, 0c3h
L5b496 label byte
    db 03bh, 035h
    dd offset _Datac85d4
    db 073h, 041h, 08ah, 026h, 08ah, 07eh, 001h, 035h, 000h, 080h, 000h, 000h, 081h, 0f3h, 000h, 080h
    db 000h, 000h, 00fh, 0b7h, 0c0h, 066h, 0f7h, 02dh
    dd offset _Datac85f0
    db 003h, 0d2h, 00fh, 0bfh, 0d2h, 001h, 017h, 00fh, 0b7h, 0c3h, 066h, 0f7h, 02dh
    dd offset _Datac85f4
    db 003h, 0d2h, 00fh, 0bfh, 0d2h, 001h, 057h, 004h, 083h, 0c7h, 008h, 083h, 0c6h, 002h, 03bh, 03dh
    dd offset _Datac85c4
    db 076h, 0b7h, 0c3h
L5b4e0 label byte
    db 03bh, 035h
    dd offset _Datac85d4
    db "s8f"
    db 08bh, 006h, 066h, 08bh, 05eh, 002h, 00fh, 0b7h, 0c0h, 066h, 0f7h, 02dh
    dd offset _Datac85f0
    db 003h, 0d2h, 00fh, 0bfh, 0d2h, 001h, 017h, 00fh, 0b7h, 0c3h, 066h, 0f7h, 02dh
    dd offset _Datac85f4
    db 003h, 0d2h, 00fh, 0bfh, 0d2h, 001h, 057h, 004h, 083h, 0c7h, 008h, 083h, 0c6h, 004h, 03bh, 03dh
    dd offset _Datac85c4
    db 076h, 0c0h, 0c3h
L5b521 label byte
    db 03bh, 035h
    dd offset _Datac85d4
    db "sCf"
    db 08bh, 006h, 066h, 08bh, 05eh, 002h, 035h, 000h, 080h, 000h, 000h, 081h, 0f3h, 000h, 080h, 000h
    db 000h, 00fh, 0b7h, 0c0h, 066h, 0f7h, 02dh
    dd offset _Datac85f0
    db 003h, 0d2h, 00fh, 0bfh, 0d2h, 001h, 017h, 00fh, 0b7h, 0c3h, 066h, 0f7h, 02dh
    dd offset _Datac85f4
    db 003h, 0d2h, 00fh, 0bfh, 0d2h, 001h, 057h, 004h, 083h, 0c7h, 008h, 083h, 0c6h, 004h, 03bh, 03dh
    dd offset _Datac85c4
    db 076h, 0b5h, 0c3h
L5b56d label byte
    db 03bh, 035h
    dd offset _Datac85d4
    db 073h, 02ah, 08ah, 026h, 00fh, 0b7h, 0c0h, 066h, 0f7h, 02dh
    dd offset _Datac85f0
    db 003h, 0d2h, 00fh, 0bfh, 0d2h, 001h, 017h, 083h, 0c7h, 004h, 003h, 00dh
    dd offset _Datac85d8
    db 013h, 035h
    dd offset _Datac85dc
    db 03bh, 03dh
    dd offset _Datac85c4
    db 076h, 0ceh, 0c3h
L5b5a0 label byte
    db 03bh, 035h
    dd offset _Datac85d4
    db 073h, 02fh, 08ah, 026h, 035h, 000h, 080h, 000h, 000h, 00fh, 0b7h, 0c0h, 066h, 0f7h, 02dh
    dd offset _Datac85f0
    db 003h, 0d2h, 00fh, 0bfh, 0d2h, 001h, 017h, 083h, 0c7h, 004h, 003h, 00dh
    dd offset _Datac85d8
    db 013h, 035h
    dd offset _Datac85dc
    db 03bh, 03dh
    dd offset _Datac85c4
    db 076h, 0c9h, 0c3h
L5b5d8 label byte
    db 03bh, 035h
    dd offset _Datac85d4
    db "s0f"
    db 08bh, 006h, 00fh, 0b7h, 0c0h, 066h, 0f7h, 02dh
    dd offset _Datac85f0
    db 003h, 0d2h, 00fh, 0bfh, 0d2h, 001h, 017h, 083h, 0c7h, 004h, 033h, 0edh, 003h, 00dh
    dd offset _Datac85d8
    db 013h, 0edh, 003h, 034h, 0adh
    dd offset _Datac85dc
    db 03bh, 03dh
    dd offset _Datac85c4
    db 076h, 0c8h, 0c3h
L5b611 label byte
    db 03bh, 035h
    dd offset _Datac85d4
    db "s5f"
    db 08bh, 006h, 035h, 000h, 080h, 000h, 000h, 00fh, 0b7h, 0c0h, 066h, 0f7h, 02dh
    dd offset _Datac85f0
    db 003h, 0d2h, 00fh, 0bfh, 0d2h, 001h, 017h, 083h, 0c7h, 004h, 033h, 0edh, 003h, 00dh
    dd offset _Datac85d8
    db 013h, 0edh, 003h, 034h, 0adh
    dd offset _Datac85dc
    db 03bh, 03dh
    dd offset _Datac85c4
    db 076h, 0c3h, 0c3h
L5b64f label byte
    db 03bh, 035h
    dd offset _Datac85d4
    db 073h, 03eh, 08ah, 026h, 08bh, 0d8h, 00fh, 0b7h, 0c0h, 066h, 0f7h, 02dh
    dd offset _Datac85f0
    db 003h, 0d2h, 00fh, 0bfh, 0d2h, 001h, 017h, 00fh, 0b7h, 0c3h, 066h, 0f7h, 02dh
    dd offset _Datac85f4
    db 003h, 0d2h, 00fh, 0bfh, 0d2h, 001h, 057h, 004h, 083h, 0c7h, 008h, 003h, 00dh
    dd offset _Datac85d8
    db 013h, 035h
    dd offset _Datac85dc
    db 03bh, 03dh
    dd offset _Datac85c4
    db 076h, 0bah, 0c3h
L5b696 label byte
    db 03bh, 035h
    dd offset _Datac85d4
    db 073h, 043h, 08ah, 026h, 035h, 000h, 080h, 000h, 000h, 08bh, 0d8h, 00fh, 0b7h, 0c0h, 066h, 0f7h
    db 02dh
    dd offset _Datac85f0
    db 003h, 0d2h, 00fh, 0bfh, 0d2h, 001h, 017h, 00fh, 0b7h, 0c3h, 066h, 0f7h, 02dh
    dd offset _Datac85f4
    db 003h, 0d2h, 00fh, 0bfh, 0d2h, 001h, 057h, 004h, 083h, 0c7h, 008h, 003h, 00dh
    dd offset _Datac85d8
    db 013h, 035h
    dd offset _Datac85dc
    db 03bh, 03dh
    dd offset _Datac85c4
    db 076h, 0b5h, 0c3h
L5b6e2 label byte
    db 03bh, 035h
    dd offset _Datac85d4
    db "sDf"
    db 08bh, 006h, 08bh, 0d8h, 00fh, 0b7h, 0c0h, 066h, 0f7h, 02dh
    dd offset _Datac85f0
    db 003h, 0d2h, 00fh, 0bfh, 0d2h, 001h, 017h, 00fh, 0b7h, 0c3h, 066h, 0f7h, 02dh
    dd offset _Datac85f4
    db 003h, 0d2h, 00fh, 0bfh, 0d2h, 001h, 057h, 004h, 083h, 0c7h, 008h, 033h, 0edh, 003h, 00dh
    dd offset _Datac85d8
    db 013h, 0edh, 003h, 034h, 0adh
    dd offset _Datac85dc
    db 03bh, 03dh
    dd offset _Datac85c4
    db 076h, 0b4h, 0c3h
L5b72f label byte
    db 03bh, 035h
    dd offset _Datac85d4
    db "sIf"
    db 08bh, 006h, 035h, 000h, 080h, 000h, 000h, 08bh, 0d8h, 00fh, 0b7h, 0c0h, 066h, 0f7h, 02dh
    dd offset _Datac85f0
    db 003h, 0d2h, 00fh, 0bfh, 0d2h, 001h, 017h, 00fh, 0b7h, 0c3h, 066h, 0f7h, 02dh
    dd offset _Datac85f4
    db 003h, 0d2h, 00fh, 0bfh, 0d2h, 001h, 057h, 004h, 083h, 0c7h, 008h, 033h, 0edh, 003h, 00dh
    dd offset _Datac85d8
    db 013h, 0edh, 003h, 034h, 0adh
    dd offset _Datac85dc
    db 03bh, 03dh
    dd offset _Datac85c4
    db 076h, 0afh, 0c3h
L5b781 label byte
    db 03bh, 035h
    dd offset _Datac85d4
    db 073h, 032h, 08ah, 026h, 08ah, 07eh, 001h, 00fh, 0b7h, 0c0h, 066h, 0f7h, 02dh
    dd offset _Datac85f0
    db 003h, 0d2h, 00fh, 0bfh, 0d2h, 001h, 017h, 083h, 0c7h, 004h, 033h, 0edh, 003h, 00dh
    dd offset _Datac85d8
    db 013h, 0edh, 003h, 034h, 0adh
    dd offset _Datac85dc
    db 03bh, 03dh
    dd offset _Datac85c4
    db 076h, 0c6h, 0c3h
L5b7bc label byte
    db 03bh, 035h
    dd offset _Datac85d4
    db 073h, 03dh, 08ah, 026h, 08ah, 07eh, 001h, 035h, 000h, 080h, 000h, 000h, 081h, 0f3h, 000h, 080h
    db 000h, 000h, 00fh, 0b7h, 0c0h, 066h, 0f7h, 02dh
    dd offset _Datac85f0
    db 003h, 0d2h, 00fh, 0bfh, 0d2h, 001h, 017h, 083h, 0c7h, 004h, 033h, 0edh, 003h, 00dh
    dd offset _Datac85d8
    db 013h, 0edh, 003h, 034h, 0adh
    dd offset _Datac85dc
    db 03bh, 03dh
    dd offset _Datac85c4
    db 076h, 0bbh, 0c3h
L5b802 label byte
    db 03bh, 035h
    dd offset _Datac85d4
    db "s4f"
    db 08bh, 006h, 066h, 08bh, 05eh, 002h, 00fh, 0b7h, 0c0h, 066h, 0f7h, 02dh
    dd offset _Datac85f0
    db 003h, 0d2h, 00fh, 0bfh, 0d2h, 001h, 017h, 083h, 0c7h, 004h, 033h, 0edh, 003h, 00dh
    dd offset _Datac85d8
    db 013h, 0edh, 003h, 034h, 0adh
    dd offset _Datac85dc
    db 03bh, 03dh
    dd offset _Datac85c4
    db 076h, 0c4h, 0c3h
L5b83f label byte
    db 03bh, 035h
    dd offset _Datac85d4
    db "s?f"
    db 08bh, 006h, 066h, 08bh, 05eh, 002h, 035h, 000h, 080h, 000h, 000h, 081h, 0f3h, 000h, 080h, 000h
    db 000h, 00fh, 0b7h, 0c0h, 066h, 0f7h, 02dh
    dd offset _Datac85f0
    db 003h, 0d2h, 00fh, 0bfh, 0d2h, 001h, 017h, 083h, 0c7h, 004h, 033h, 0edh, 003h, 00dh
    dd offset _Datac85d8
    db 013h, 0edh, 003h, 034h, 0adh
    dd offset _Datac85dc
    db 03bh, 03dh
    dd offset _Datac85c4
    db 076h, 0b9h, 0c3h
L5b887 label byte
    db 03bh, 035h
    dd offset _Datac85d4
    db 073h, 044h, 08ah, 026h, 08ah, 07eh, 001h, 00fh, 0b7h, 0c0h, 066h, 0f7h, 02dh
    dd offset _Datac85f0
    db 003h, 0d2h, 00fh, 0bfh, 0d2h, 001h, 017h, 00fh, 0b7h, 0c3h, 066h, 0f7h, 02dh
    dd offset _Datac85f4
    db 003h, 0d2h, 00fh, 0bfh, 0d2h, 001h, 057h, 004h, 083h, 0c7h, 008h, 033h, 0edh, 003h, 00dh
    dd offset _Datac85d8
    db 013h, 0edh, 003h, 034h, 0adh
    dd offset _Datac85dc
    db 03bh, 03dh
    dd offset _Datac85c4
    db 076h, 0b4h, 0c3h
L5b8d4 label byte
    db 03bh, 035h
    dd offset _Datac85d4
    db 073h, 04fh, 08ah, 026h, 08ah, 07eh, 001h, 035h, 000h, 080h, 000h, 000h, 081h, 0f3h, 000h, 080h
    db 000h, 000h, 00fh, 0b7h, 0c0h, 066h, 0f7h, 02dh
    dd offset _Datac85f0
    db 003h, 0d2h, 00fh, 0bfh, 0d2h, 001h, 017h, 00fh, 0b7h, 0c3h, 066h, 0f7h, 02dh
    dd offset _Datac85f4
    db 003h, 0d2h, 00fh, 0bfh, 0d2h, 001h, 057h, 004h, 083h, 0c7h, 008h, 033h, 0edh, 003h, 00dh
    dd offset _Datac85d8
    db 013h, 0edh, 003h, 034h, 0adh
    dd offset _Datac85dc
    db 03bh, 03dh
    dd offset _Datac85c4
    db 076h, 0a9h, 0c3h
L5b92c label byte
    db 03bh, 035h
    dd offset _Datac85d4
    db "sFf"
    db 08bh, 006h, 066h, 08bh, 05eh, 002h, 00fh, 0b7h, 0c0h, 066h, 0f7h, 02dh
    dd offset _Datac85f0
    db 003h, 0d2h, 00fh, 0bfh, 0d2h, 001h, 017h, 00fh, 0b7h, 0c3h, 066h, 0f7h, 02dh
    dd offset _Datac85f4
    db 003h, 0d2h, 00fh, 0bfh, 0d2h, 001h, 057h, 004h, 083h, 0c7h, 008h, 033h, 0edh, 003h, 00dh
    dd offset _Datac85d8
    db 013h, 0edh, 003h, 034h, 0adh
    dd offset _Datac85dc
    db 03bh, 03dh
    dd offset _Datac85c4
    db 076h, 0b2h, 0c3h
L5b97b label byte
    db 03bh, 035h
    dd offset _Datac85d4
    db "sQf"
    db 08bh, 006h, 066h, 08bh, 05eh, 002h, 035h, 000h, 080h, 000h, 000h, 081h, 0f3h, 000h, 080h, 000h
    db 000h, 00fh, 0b7h, 0c0h, 066h, 0f7h, 02dh
    dd offset _Datac85f0
    db 003h, 0d2h, 00fh, 0bfh, 0d2h, 001h, 017h, 00fh, 0b7h, 0c3h, 066h, 0f7h, 02dh
    dd offset _Datac85f4
    db 003h, 0d2h, 00fh, 0bfh, 0d2h, 001h, 057h, 004h, 083h, 0c7h, 008h, 033h, 0edh, 003h, 00dh
    dd offset _Datac85d8
    db 013h, 0edh, 003h, 034h, 0adh
    dd offset _Datac85dc
    db 03bh, 03dh
    dd offset _Datac85c4
    db 076h, 0a7h, 0c3h
L5b9d5 label byte
    db 03bh, 035h
    dd offset _Datac85d4
    db 073h, 015h, 08ah, 026h, 00fh, 0bfh, 0c0h, 001h, 007h, 083h, 0c7h, 004h, 083h, 0c6h, 001h, 03bh
    db 03dh
    dd offset _Datac85c4
    db 076h, 0e3h, 0c3h
L5b9f3 label byte
    db 03bh, 035h
    dd offset _Datac85d4
    db 073h, 01ah, 08ah, 026h, 035h, 000h, 080h, 000h, 000h, 00fh, 0bfh, 0c0h, 001h, 007h, 083h, 0c7h
    db 004h, 083h, 0c6h, 001h, 03bh, 03dh
    dd offset _Datac85c4
    db 076h, 0deh, 0c3h
L5ba16 label byte
    db 03bh, 035h
    dd offset _Datac85d4
    db 073h, 016h, 066h, 08bh, 006h, 00fh, 0bfh, 0c0h, 001h, 007h, 083h, 0c7h, 004h, 083h, 0c6h, 002h
    db 03bh, 03dh
    dd offset _Datac85c4
    db 076h, 0e2h, 0c3h
L5ba35 label byte
    db 03bh, 035h
    dd offset _Datac85d4
    db 073h, 01bh, 066h, 08bh, 006h, 035h, 000h, 080h, 000h, 000h, 00fh, 0bfh, 0c0h, 001h, 007h, 083h
    db 0c7h, 004h, 083h, 0c6h, 002h, 03bh, 03dh
    dd offset _Datac85c4
    db 076h, 0ddh, 0c3h
L5ba59 label byte
    db 03bh, 035h
    dd offset _Datac85d4
    db 073h, 018h, 08ah, 026h, 00fh, 0bfh, 0c0h, 001h, 007h, 001h, 047h, 004h, 083h, 0c7h, 008h, 083h
    db 0c6h, 001h, 03bh, 03dh
    dd offset _Datac85c4
    db 076h, 0e0h, 0c3h
L5ba7a label byte
    db 03bh, 035h
    dd offset _Datac85d4
    db 073h, 01dh, 08ah, 026h, 035h, 000h, 080h, 000h, 000h, 00fh, 0bfh, 0c0h, 001h, 007h, 001h, 047h
    db 004h, 083h, 0c7h, 008h, 083h, 0c6h, 001h, 03bh, 03dh
    dd offset _Datac85c4
    db 076h, 0dbh, 0c3h
L5baa0 label byte
    db 03bh, 035h
    dd offset _Datac85d4
    db 073h, 019h, 066h, 08bh, 006h, 00fh, 0bfh, 0c0h, 001h, 007h, 001h, 047h, 004h, 083h, 0c7h, 008h
    db 083h, 0c6h, 002h, 03bh, 03dh
    dd offset _Datac85c4
    db 076h, 0dfh, 0c3h
L5bac2 label byte
    db 03bh, 035h
    dd offset _Datac85d4
    db 073h, 01eh, 066h, 08bh, 006h, 035h, 000h, 080h, 000h, 000h, 00fh, 0bfh, 0c0h, 001h, 007h, 001h
    db 047h, 004h, 083h, 0c7h, 008h, 083h, 0c6h, 002h, 03bh, 03dh
    dd offset _Datac85c4
    db 076h, 0dah, 0c3h
L5bae9 label byte
    db 03bh, 035h
    dd offset _Datac85d4
    db 073h, 018h, 08ah, 03eh, 08ah, 066h, 001h, 00fh, 0bfh, 0c0h, 001h, 007h, 083h, 0c7h, 004h, 083h
    db 0c6h, 002h, 03bh, 03dh
    dd offset _Datac85c4
    db 076h, 0e0h, 0c3h
L5bb0a label byte
    db 03bh, 035h
    dd offset _Datac85d4
    db 073h, 023h, 08ah, 03eh, 08ah, 066h, 001h, 035h, 000h, 080h, 000h, 000h, 081h, 0f3h, 000h, 080h
    db 000h, 000h, 00fh, 0bfh, 0c0h, 001h, 007h, 083h, 0c7h, 004h, 083h, 0c6h, 002h, 03bh, 03dh
    dd offset _Datac85c4
    db 076h, 0d5h, 0c3h
L5bb36 label byte
    db 03bh, 035h
    dd offset _Datac85d4
    db 073h, 01ah, 066h, 08bh, 01eh, 066h, 08bh, 046h, 002h, 00fh, 0bfh, 0c0h, 001h, 007h, 083h, 0c7h
    db 004h, 083h, 0c6h, 004h, 03bh, 03dh
    dd offset _Datac85c4
    db 076h, 0deh, 0c3h
L5bb59 label byte
    db 03bh, 035h
    dd offset _Datac85d4
    db "s%f"
    db 08bh, 01eh, 066h, 08bh, 046h, 002h, 035h, 000h, 080h, 000h, 000h, 081h, 0f3h, 000h, 080h, 000h
    db 000h, 00fh, 0bfh, 0c0h, 001h, 007h, 083h, 0c7h, 004h, 083h, 0c6h, 004h, 03bh, 03dh
    dd offset _Datac85c4
    db 076h, 0d3h, 0c3h
L5bb87 label byte
    db 03bh, 035h
    dd offset _Datac85d4
    db 073h, 01eh, 08ah, 03eh, 08ah, 066h, 001h, 00fh, 0bfh, 0c0h, 001h, 007h, 00fh, 0bfh, 0dbh, 001h
    db 05fh, 004h, 083h, 0c7h, 008h, 083h, 0c6h, 002h, 03bh, 03dh
    dd offset _Datac85c4
    db 076h, 0dah, 0c3h
L5bbae label byte
    db 03bh, 035h
    dd offset _Datac85d4
    db 073h, 029h, 08ah, 03eh, 08ah, 066h, 001h, 035h, 000h, 080h, 000h, 000h, 081h, 0f3h, 000h, 080h
    db 000h, 000h, 00fh, 0bfh, 0c0h, 001h, 007h, 00fh, 0bfh, 0dbh, 001h, 05fh, 004h, 083h, 0c7h, 008h
    db 083h, 0c6h, 002h, 03bh, 03dh
    dd offset _Datac85c4
    db 076h, 0cfh, 0c3h
L5bbe0 label byte
    db 03bh, 035h
    dd offset _Datac85d4
    db "s f"
    db 08bh, 01eh, 066h, 08bh, 046h, 002h, 00fh, 0bfh, 0c0h, 001h, 007h, 00fh, 0bfh, 0dbh, 001h, 05fh
    db 004h, 083h, 0c7h, 008h, 083h, 0c6h, 004h, 03bh, 03dh
    dd offset _Datac85c4
    db 076h, 0d8h, 0c3h
L5bc09 label byte
    db 03bh, 035h
    dd offset _Datac85d4
    db "s+f"
    db 08bh, 01eh, 066h, 08bh, 046h, 002h, 035h, 000h, 080h, 000h, 000h, 081h, 0f3h, 000h, 080h, 000h
    db 000h, 00fh, 0bfh, 0c0h, 001h, 007h, 00fh, 0bfh, 0dbh, 001h, 05fh, 004h, 083h, 0c7h, 008h, 083h
    db 0c6h, 004h, 03bh, 03dh
    dd offset _Datac85c4
    db 076h, 0cdh, 0c3h
L5bc3d label byte
    db 03bh, 035h
    dd offset _Datac85d4
    db 073h, 01eh, 08ah, 026h, 00fh, 0bfh, 0c0h, 001h, 007h, 083h, 0c7h, 004h, 003h, 00dh
    dd offset _Datac85d8
    db 013h, 035h
    dd offset _Datac85dc
    db 03bh, 03dh
    dd offset _Datac85c4
    db 076h, 0dah, 0c3h
L5bc64 label byte
    db 03bh, 035h
    dd offset _Datac85d4
    db 073h, 023h, 08ah, 026h, 035h, 000h, 080h, 000h, 000h, 00fh, 0bfh, 0c0h, 001h, 007h, 083h, 0c7h
    db 004h, 003h, 00dh
    dd offset _Datac85d8
    db 013h, 035h
    dd offset _Datac85dc
    db 03bh, 03dh
    dd offset _Datac85c4
    db 076h, 0d5h, 0c3h
L5bc90 label byte
    db 03bh, 035h
    dd offset _Datac85d4
    db "s$f"
    db 08bh, 006h, 00fh, 0bfh, 0c0h, 001h, 007h, 083h, 0c7h, 004h, 033h, 0edh, 003h, 00dh
    dd offset _Datac85d8
    db 013h, 0edh, 003h, 034h, 0adh
    dd offset _Datac85dc
    db 03bh, 03dh
    dd offset _Datac85c4
    db 076h, 0d4h, 0c3h
L5bcbd label byte
    db 03bh, 035h
    dd offset _Datac85d4
    db "s)f"
    db 08bh, 006h, 035h, 000h, 080h, 000h, 000h, 00fh, 0bfh, 0c0h, 001h, 007h, 083h, 0c7h, 004h, 033h
    db 0edh, 003h, 00dh
    dd offset _Datac85d8
    db 013h, 0edh, 003h, 034h, 0adh
    dd offset _Datac85dc
    db 03bh, 03dh
    dd offset _Datac85c4
    db 076h, 0cfh, 0c3h
L5bcef label byte
    db 03bh, 035h
    dd offset _Datac85d4
    db 073h, 021h, 08ah, 026h, 00fh, 0bfh, 0c0h, 001h, 007h, 001h, 047h, 004h, 083h, 0c7h, 008h, 003h
    db 00dh
    dd offset _Datac85d8
    db 013h, 035h
    dd offset _Datac85dc
    db 03bh, 03dh
    dd offset _Datac85c4
    db 076h, 0d7h, 0c3h
L5bd19 label byte
    db 03bh, 035h
    dd offset _Datac85d4
    db 073h, 026h, 08ah, 026h, 035h, 000h, 080h, 000h, 000h, 00fh, 0bfh, 0c0h, 001h, 007h, 001h, 047h
    db 004h, 083h, 0c7h, 008h, 003h, 00dh
    dd offset _Datac85d8
    db 013h, 035h
    dd offset _Datac85dc
    db 03bh, 03dh
    dd offset _Datac85c4
    db 076h, 0d2h, 0c3h
L5bd48 label byte
    db 03bh, 035h
    dd offset _Datac85d4
    db "s'f"
    db 08bh, 006h, 00fh, 0bfh, 0c0h, 001h, 007h, 001h, 047h, 004h, 083h, 0c7h, 008h, 033h, 0edh, 003h
    db 00dh
    dd offset _Datac85d8
    db 013h, 0edh, 003h, 034h, 0adh
    dd offset _Datac85dc
    db 03bh, 03dh
    dd offset _Datac85c4
    db 076h, 0d1h, 0c3h
L5bd78 label byte
    db 03bh, 035h
    dd offset _Datac85d4
    db "s,f"
    db 08bh, 006h, 035h, 000h, 080h, 000h, 000h, 00fh, 0bfh, 0c0h, 001h, 007h, 001h, 047h, 004h, 083h
    db 0c7h, 008h, 033h, 0edh, 003h, 00dh
    dd offset _Datac85d8
    db 013h, 0edh, 003h, 034h, 0adh
    dd offset _Datac85dc
    db 03bh, 03dh
    dd offset _Datac85c4
    db 076h, 0cch, 0c3h
L5bdad label byte
    db 03bh, 035h
    dd offset _Datac85d4
    db 073h, 026h, 08ah, 03eh, 08ah, 066h, 001h, 00fh, 0bfh, 0c0h, 001h, 007h, 083h, 0c7h, 004h, 033h
    db 0edh, 003h, 00dh
    dd offset _Datac85d8
    db 013h, 0edh, 003h, 034h, 0adh
    dd offset _Datac85dc
    db 03bh, 03dh
    dd offset _Datac85c4
    db 076h, 0d2h, 0c3h
L5bddc label byte
    db 03bh, 035h
    dd offset _Datac85d4
    db 073h, 031h, 08ah, 03eh, 08ah, 066h, 001h, 035h, 000h, 080h, 000h, 000h, 081h, 0f3h, 000h, 080h
    db 000h, 000h, 00fh, 0bfh, 0c0h, 001h, 007h, 083h, 0c7h, 004h, 033h, 0edh, 003h, 00dh
    dd offset _Datac85d8
    db 013h, 0edh, 003h, 034h, 0adh
    dd offset _Datac85dc
    db 03bh, 03dh
    dd offset _Datac85c4
    db 076h, 0c7h, 0c3h
L5be16 label byte
    db 03bh, 035h
    dd offset _Datac85d4
    db "s(f"
    db 08bh, 01eh, 066h, 08bh, 046h, 002h, 00fh, 0bfh, 0c0h, 001h, 007h, 083h, 0c7h, 004h, 033h, 0edh
    db 003h, 00dh
    dd offset _Datac85d8
    db 013h, 0edh, 003h, 034h, 0adh
    dd offset _Datac85dc
    db 03bh, 03dh
    dd offset _Datac85c4
    db 076h, 0d0h, 0c3h
L5be47 label byte
    db 03bh, 035h
    dd offset _Datac85d4
    db "s3f"
    db 08bh, 01eh, 066h, 08bh, 046h, 002h, 035h, 000h, 080h, 000h, 000h, 081h, 0f3h, 000h, 080h, 000h
    db 000h, 00fh, 0bfh, 0c0h, 001h, 007h, 083h, 0c7h, 004h, 033h, 0edh, 003h, 00dh
    dd offset _Datac85d8
    db 013h, 0edh, 003h, 034h, 0adh
    dd offset _Datac85dc
    db 03bh, 03dh
    dd offset _Datac85c4
    db 076h, 0c5h, 0c3h
L5be83 label byte
    db 03bh, 035h
    dd offset _Datac85d4
    db 073h, 02ch, 08ah, 03eh, 08ah, 066h, 001h, 00fh, 0bfh, 0c0h, 001h, 007h, 00fh, 0bfh, 0dbh, 001h
    db 05fh, 004h, 083h, 0c7h, 008h, 033h, 0edh, 003h, 00dh
    dd offset _Datac85d8
    db 013h, 0edh, 003h, 034h, 0adh
    dd offset _Datac85dc
    db 03bh, 03dh
    dd offset _Datac85c4
    db 076h, 0cch, 0c3h
L5beb8 label byte
    db 03bh, 035h
    dd offset _Datac85d4
    db 073h, 037h, 08ah, 03eh, 08ah, 066h, 001h, 035h, 000h, 080h, 000h, 000h, 081h, 0f3h, 000h, 080h
    db 000h, 000h, 00fh, 0bfh, 0c0h, 001h, 007h, 00fh, 0bfh, 0dbh, 001h, 05fh, 004h, 083h, 0c7h, 008h
    db 033h, 0edh, 003h, 00dh
    dd offset _Datac85d8
    db 013h, 0edh, 003h, 034h, 0adh
    dd offset _Datac85dc
    db 03bh, 03dh
    dd offset _Datac85c4
    db 076h, 0c1h, 0c3h
L5bef8 label byte
    db 03bh, 035h
    dd offset _Datac85d4
    db "s.f"
    db 08bh, 01eh, 066h, 08bh, 046h, 002h, 00fh, 0bfh, 0c0h, 001h, 007h, 00fh, 0bfh, 0dbh, 001h, 05fh
    db 004h, 083h, 0c7h, 008h, 033h, 0edh, 003h, 00dh
    dd offset _Datac85d8
    db 013h, 0edh, 003h, 034h, 0adh
    dd offset _Datac85dc
    db 03bh, 03dh
    dd offset _Datac85c4
    db 076h, 0cah, 0c3h
L5bf2f label byte
    db 03bh, 035h
    dd offset _Datac85d4
    db "s9f"
    db 08bh, 01eh, 066h, 08bh, 046h, 002h, 035h, 000h, 080h, 000h, 000h, 081h, 0f3h, 000h, 080h, 000h
    db 000h, 00fh, 0bfh, 0c0h, 001h, 007h, 00fh, 0bfh, 0dbh, 001h, 05fh, 004h, 083h, 0c7h, 008h, 033h
    db 0edh, 003h, 00dh
    dd offset _Datac85d8
    db 013h, 0edh, 003h, 034h, 0adh
    dd offset _Datac85dc
    db 03bh, 03dh
    dd offset _Datac85c4
    db 076h, 0bfh, 0c3h
L5bf71 label byte
    db 03bh, 035h
    dd offset _Datac85d4
    db 073h, 021h, 08ah, 026h, 00fh, 0b7h, 0c0h, 066h, 0f7h, 02dh
    dd offset _Datac85f0
    db 003h, 0d2h, 00fh, 0bfh, 0d2h, 001h, 017h, 083h, 0c7h, 004h, 083h, 0c6h, 001h, 03bh, 03dh
    dd offset _Datac85c4
    db 076h, 0d7h, 0c3h
L5bf9b label byte
    db 03bh, 035h
    dd offset _Datac85d4
    db 073h, 026h, 08ah, 026h, 035h, 000h, 080h, 000h, 000h, 00fh, 0b7h, 0c0h, 066h, 0f7h, 02dh
    dd offset _Datac85f0
    db 003h, 0d2h, 00fh, 0bfh, 0d2h, 001h, 017h, 083h, 0c7h, 004h, 083h, 0c6h, 001h, 03bh, 03dh
    dd offset _Datac85c4
    db 076h, 0d2h, 0c3h
L5bfca label byte
    db 03bh, 035h
    dd offset _Datac85d4
    db 073h, 022h, 066h, 08bh, 006h, 00fh, 0b7h, 0c0h, 066h, 0f7h, 02dh
    dd offset _Datac85f0
    db 003h, 0d2h, 00fh, 0bfh, 0d2h, 001h, 017h, 083h, 0c7h, 004h, 083h, 0c6h, 002h, 03bh, 03dh
    dd offset _Datac85c4
    db 076h, 0d6h, 0c3h
L5bff5 label byte
    db 03bh, 035h
    dd offset _Datac85d4
    db "s'f"
    db 08bh, 006h, 035h, 000h, 080h, 000h, 000h, 00fh, 0b7h, 0c0h, 066h, 0f7h, 02dh
    dd offset _Datac85f0
    db 003h, 0d2h, 00fh, 0bfh, 0d2h, 001h, 017h, 083h, 0c7h, 004h, 083h, 0c6h, 002h, 03bh, 03dh
    dd offset _Datac85c4
    db 076h, 0d1h, 0c3h
L5c025 label byte
    db 03bh, 035h
    dd offset _Datac85d4
    db 073h, 035h, 08ah, 026h, 08bh, 0d8h, 00fh, 0b7h, 0c0h, 066h, 0f7h, 02dh
    dd offset _Datac85f0
    db 003h, 0d2h, 00fh, 0bfh, 0d2h, 001h, 017h, 00fh, 0b7h, 0c3h, 066h, 0f7h, 02dh
    dd offset _Datac85f4
    db 003h, 0d2h, 00fh, 0bfh, 0d2h, 001h, 057h, 004h, 083h, 0c7h, 008h, 083h, 0c6h, 001h, 03bh, 03dh
    dd offset _Datac85c4
    db 076h, 0c3h, 0c3h
L5c063 label byte
    db 03bh, 035h
    dd offset _Datac85d4
    db 073h, 03ah, 08ah, 026h, 035h, 000h, 080h, 000h, 000h, 08bh, 0d8h, 00fh, 0b7h, 0c0h, 066h, 0f7h
    db 02dh
    dd offset _Datac85f0
    db 003h, 0d2h, 00fh, 0bfh, 0d2h, 001h, 017h, 00fh, 0b7h, 0c3h, 066h, 0f7h, 02dh
    dd offset _Datac85f4
    db 003h, 0d2h, 00fh, 0bfh, 0d2h, 001h, 057h, 004h, 083h, 0c7h, 008h, 083h, 0c6h, 001h, 03bh, 03dh
    dd offset _Datac85c4
    db 076h, 0beh, 0c3h
L5c0a6 label byte
    db 03bh, 035h
    dd offset _Datac85d4
    db "s6f"
    db 08bh, 006h, 08bh, 0d8h, 00fh, 0b7h, 0c0h, 066h, 0f7h, 02dh
    dd offset _Datac85f0
    db 003h, 0d2h, 00fh, 0bfh, 0d2h, 001h, 017h, 00fh, 0b7h, 0c3h, 066h, 0f7h, 02dh
    dd offset _Datac85f4
    db 003h, 0d2h, 00fh, 0bfh, 0d2h, 001h, 057h, 004h, 083h, 0c7h, 008h, 083h, 0c6h, 002h, 03bh, 03dh
    dd offset _Datac85c4
    db 076h, 0c2h, 0c3h
L5c0e5 label byte
    db 03bh, 035h
    dd offset _Datac85d4
    db "s;f"
    db 08bh, 006h, 035h, 000h, 080h, 000h, 000h, 08bh, 0d8h, 00fh, 0b7h, 0c0h, 066h, 0f7h, 02dh
    dd offset _Datac85f0
    db 003h, 0d2h, 00fh, 0bfh, 0d2h, 001h, 017h, 00fh, 0b7h, 0c3h, 066h, 0f7h, 02dh
    dd offset _Datac85f4
    db 003h, 0d2h, 00fh, 0bfh, 0d2h, 001h, 057h, 004h, 083h, 0c7h, 008h, 083h, 0c6h, 002h, 03bh, 03dh
    dd offset _Datac85c4
    db 076h, 0bdh, 0c3h
L5c129 label byte
    db 03bh, 035h
    dd offset _Datac85d4
    db 073h, 024h, 08ah, 03eh, 08ah, 066h, 001h, 00fh, 0b7h, 0c0h, 066h, 0f7h, 02dh
    dd offset _Datac85f0
    db 003h, 0d2h, 00fh, 0bfh, 0d2h, 001h, 017h, 083h, 0c7h, 004h, 083h, 0c6h, 002h, 03bh, 03dh
    dd offset _Datac85c4
    db 076h, 0d4h, 0c3h
L5c156 label byte
    db 03bh, 035h
    dd offset _Datac85d4
    db 073h, 02fh, 08ah, 03eh, 08ah, 066h, 001h, 035h, 000h, 080h, 000h, 000h, 081h, 0f3h, 000h, 080h
    db 000h, 000h, 00fh, 0b7h, 0c0h, 066h, 0f7h, 02dh
    dd offset _Datac85f0
    db 003h, 0d2h, 00fh, 0bfh, 0d2h, 001h, 017h, 083h, 0c7h, 004h, 083h, 0c6h, 002h, 03bh, 03dh
    dd offset _Datac85c4
    db 076h, 0c9h, 0c3h
L5c18e label byte
    db 03bh, 035h
    dd offset _Datac85d4
    db "s&f"
    db 08bh, 01eh, 066h, 08bh, 046h, 002h, 00fh, 0b7h, 0c0h, 066h, 0f7h, 02dh
    dd offset _Datac85f0
    db 003h, 0d2h, 00fh, 0bfh, 0d2h, 001h, 017h, 083h, 0c7h, 004h, 083h, 0c6h, 004h, 03bh, 03dh
    dd offset _Datac85c4
    db 076h, 0d2h, 0c3h
L5c1bd label byte
    db 03bh, 035h
    dd offset _Datac85d4
    db "s1f"
    db 08bh, 01eh, 066h, 08bh, 046h, 002h, 035h, 000h, 080h, 000h, 000h, 081h, 0f3h, 000h, 080h, 000h
    db 000h, 00fh, 0b7h, 0c0h, 066h, 0f7h, 02dh
    dd offset _Datac85f0
    db 003h, 0d2h, 00fh, 0bfh, 0d2h, 001h, 017h, 083h, 0c7h, 004h, 083h, 0c6h, 004h, 03bh, 03dh
    dd offset _Datac85c4
    db 076h, 0c7h, 0c3h
L5c1f7 label byte
    db 03bh, 035h
    dd offset _Datac85d4
    db 073h, 036h, 08ah, 03eh, 08ah, 066h, 001h, 00fh, 0b7h, 0c0h, 066h, 0f7h, 02dh
    dd offset _Datac85f0
    db 003h, 0d2h, 00fh, 0bfh, 0d2h, 001h, 017h, 00fh, 0b7h, 0c3h, 066h, 0f7h, 02dh
    dd offset _Datac85f4
    db 003h, 0d2h, 00fh, 0bfh, 0d2h, 001h, 057h, 004h, 083h, 0c7h, 008h, 083h, 0c6h, 002h, 03bh, 03dh
    dd offset _Datac85c4
    db 076h, 0c2h, 0c3h
L5c236 label byte
    db 03bh, 035h
    dd offset _Datac85d4
    db 073h, 041h, 08ah, 03eh, 08ah, 066h, 001h, 035h, 000h, 080h, 000h, 000h, 081h, 0f3h, 000h, 080h
    db 000h, 000h, 00fh, 0b7h, 0c0h, 066h, 0f7h, 02dh
    dd offset _Datac85f0
    db 003h, 0d2h, 00fh, 0bfh, 0d2h, 001h, 017h, 00fh, 0b7h, 0c3h, 066h, 0f7h, 02dh
    dd offset _Datac85f4
    db 003h, 0d2h, 00fh, 0bfh, 0d2h, 001h, 057h, 004h, 083h, 0c7h, 008h, 083h, 0c6h, 002h, 03bh, 03dh
    dd offset _Datac85c4
    db 076h, 0b7h, 0c3h
L5c280 label byte
    db 03bh, 035h
    dd offset _Datac85d4
    db "s8f"
    db 08bh, 01eh, 066h, 08bh, 046h, 002h, 00fh, 0b7h, 0c0h, 066h, 0f7h, 02dh
    dd offset _Datac85f0
    db 003h, 0d2h, 00fh, 0bfh, 0d2h, 001h, 017h, 00fh, 0b7h, 0c3h, 066h, 0f7h, 02dh
    dd offset _Datac85f4
    db 003h, 0d2h, 00fh, 0bfh, 0d2h, 001h, 057h, 004h, 083h, 0c7h, 008h, 083h, 0c6h, 004h, 03bh, 03dh
    dd offset _Datac85c4
    db 076h, 0c0h, 0c3h
L5c2c1 label byte
    db 03bh, 035h
    dd offset _Datac85d4
    db "sCf"
    db 08bh, 01eh, 066h, 08bh, 046h, 002h, 035h, 000h, 080h, 000h, 000h, 081h, 0f3h, 000h, 080h, 000h
    db 000h, 00fh, 0b7h, 0c0h, 066h, 0f7h, 02dh
    dd offset _Datac85f0
    db 003h, 0d2h, 00fh, 0bfh, 0d2h, 001h, 017h, 00fh, 0b7h, 0c3h, 066h, 0f7h, 02dh
    dd offset _Datac85f4
    db 003h, 0d2h, 00fh, 0bfh, 0d2h, 001h, 057h, 004h, 083h, 0c7h, 008h, 083h, 0c6h, 004h, 03bh, 03dh
    dd offset _Datac85c4
    db 076h, 0b5h, 0c3h
L5c30d label byte
    db 03bh, 035h
    dd offset _Datac85d4
    db 073h, 02ah, 08ah, 026h, 00fh, 0b7h, 0c0h, 066h, 0f7h, 02dh
    dd offset _Datac85f0
    db 003h, 0d2h, 00fh, 0bfh, 0d2h, 001h, 017h, 083h, 0c7h, 004h, 003h, 00dh
    dd offset _Datac85d8
    db 013h, 035h
    dd offset _Datac85dc
    db 03bh, 03dh
    dd offset _Datac85c4
    db 076h, 0ceh, 0c3h
L5c340 label byte
    db 03bh, 035h
    dd offset _Datac85d4
    db 073h, 02fh, 08ah, 026h, 035h, 000h, 080h, 000h, 000h, 00fh, 0b7h, 0c0h, 066h, 0f7h, 02dh
    dd offset _Datac85f0
    db 003h, 0d2h, 00fh, 0bfh, 0d2h, 001h, 017h, 083h, 0c7h, 004h, 003h, 00dh
    dd offset _Datac85d8
    db 013h, 035h
    dd offset _Datac85dc
    db 03bh, 03dh
    dd offset _Datac85c4
    db 076h, 0c9h, 0c3h
L5c378 label byte
    db 03bh, 035h
    dd offset _Datac85d4
    db "s0f"
    db 08bh, 006h, 00fh, 0b7h, 0c0h, 066h, 0f7h, 02dh
    dd offset _Datac85f0
    db 003h, 0d2h, 00fh, 0bfh, 0d2h, 001h, 017h, 083h, 0c7h, 004h, 033h, 0edh, 003h, 00dh
    dd offset _Datac85d8
    db 013h, 0edh, 003h, 034h, 0adh
    dd offset _Datac85dc
    db 03bh, 03dh
    dd offset _Datac85c4
    db 076h, 0c8h, 0c3h
L5c3b1 label byte
    db 03bh, 035h
    dd offset _Datac85d4
    db "s5f"
    db 08bh, 006h, 035h, 000h, 080h, 000h, 000h, 00fh, 0b7h, 0c0h, 066h, 0f7h, 02dh
    dd offset _Datac85f0
    db 003h, 0d2h, 00fh, 0bfh, 0d2h, 001h, 017h, 083h, 0c7h, 004h, 033h, 0edh, 003h, 00dh
    dd offset _Datac85d8
    db 013h, 0edh, 003h, 034h, 0adh
    dd offset _Datac85dc
    db 03bh, 03dh
    dd offset _Datac85c4
    db 076h, 0c3h, 0c3h
L5c3ef label byte
    db 03bh, 035h
    dd offset _Datac85d4
    db 073h, 03eh, 08ah, 026h, 08bh, 0d8h, 00fh, 0b7h, 0c0h, 066h, 0f7h, 02dh
    dd offset _Datac85f0
    db 003h, 0d2h, 00fh, 0bfh, 0d2h, 001h, 017h, 00fh, 0b7h, 0c3h, 066h, 0f7h, 02dh
    dd offset _Datac85f4
    db 003h, 0d2h, 00fh, 0bfh, 0d2h, 001h, 057h, 004h, 083h, 0c7h, 008h, 003h, 00dh
    dd offset _Datac85d8
    db 013h, 035h
    dd offset _Datac85dc
    db 03bh, 03dh
    dd offset _Datac85c4
    db 076h, 0bah, 0c3h
L5c436 label byte
    db 03bh, 035h
    dd offset _Datac85d4
    db 073h, 043h, 08ah, 026h, 035h, 000h, 080h, 000h, 000h, 08bh, 0d8h, 00fh, 0b7h, 0c0h, 066h, 0f7h
    db 02dh
    dd offset _Datac85f0
    db 003h, 0d2h, 00fh, 0bfh, 0d2h, 001h, 017h, 00fh, 0b7h, 0c3h, 066h, 0f7h, 02dh
    dd offset _Datac85f4
    db 003h, 0d2h, 00fh, 0bfh, 0d2h, 001h, 057h, 004h, 083h, 0c7h, 008h, 003h, 00dh
    dd offset _Datac85d8
    db 013h, 035h
    dd offset _Datac85dc
    db 03bh, 03dh
    dd offset _Datac85c4
    db 076h, 0b5h, 0c3h
L5c482 label byte
    db 03bh, 035h
    dd offset _Datac85d4
    db "sDf"
    db 08bh, 006h, 08bh, 0d8h, 00fh, 0b7h, 0c0h, 066h, 0f7h, 02dh
    dd offset _Datac85f0
    db 003h, 0d2h, 00fh, 0bfh, 0d2h, 001h, 017h, 00fh, 0b7h, 0c3h, 066h, 0f7h, 02dh
    dd offset _Datac85f4
    db 003h, 0d2h, 00fh, 0bfh, 0d2h, 001h, 057h, 004h, 083h, 0c7h, 008h, 033h, 0edh, 003h, 00dh
    dd offset _Datac85d8
    db 013h, 0edh, 003h, 034h, 0adh
    dd offset _Datac85dc
    db 03bh, 03dh
    dd offset _Datac85c4
    db 076h, 0b4h, 0c3h
L5c4cf label byte
    db 03bh, 035h
    dd offset _Datac85d4
    db "sIf"
    db 08bh, 006h, 035h, 000h, 080h, 000h, 000h, 08bh, 0d8h, 00fh, 0b7h, 0c0h, 066h, 0f7h, 02dh
    dd offset _Datac85f0
    db 003h, 0d2h, 00fh, 0bfh, 0d2h, 001h, 017h, 00fh, 0b7h, 0c3h, 066h, 0f7h, 02dh
    dd offset _Datac85f4
    db 003h, 0d2h, 00fh, 0bfh, 0d2h, 001h, 057h, 004h, 083h, 0c7h, 008h, 033h, 0edh, 003h, 00dh
    dd offset _Datac85d8
    db 013h, 0edh, 003h, 034h, 0adh
    dd offset _Datac85dc
    db 03bh, 03dh
    dd offset _Datac85c4
    db 076h, 0afh, 0c3h
L5c521 label byte
    db 03bh, 035h
    dd offset _Datac85d4
    db 073h, 032h, 08ah, 03eh, 08ah, 066h, 001h, 00fh, 0b7h, 0c0h, 066h, 0f7h, 02dh
    dd offset _Datac85f0
    db 003h, 0d2h, 00fh, 0bfh, 0d2h, 001h, 017h, 083h, 0c7h, 004h, 033h, 0edh, 003h, 00dh
    dd offset _Datac85d8
    db 013h, 0edh, 003h, 034h, 0adh
    dd offset _Datac85dc
    db 03bh, 03dh
    dd offset _Datac85c4
    db 076h, 0c6h, 0c3h
L5c55c label byte
    db 03bh, 035h
    dd offset _Datac85d4
    db 073h, 03dh, 08ah, 03eh, 08ah, 066h, 001h, 035h, 000h, 080h, 000h, 000h, 081h, 0f3h, 000h, 080h
    db 000h, 000h, 00fh, 0b7h, 0c0h, 066h, 0f7h, 02dh
    dd offset _Datac85f0
    db 003h, 0d2h, 00fh, 0bfh, 0d2h, 001h, 017h, 083h, 0c7h, 004h, 033h, 0edh, 003h, 00dh
    dd offset _Datac85d8
    db 013h, 0edh, 003h, 034h, 0adh
    dd offset _Datac85dc
    db 03bh, 03dh
    dd offset _Datac85c4
    db 076h, 0bbh, 0c3h
L5c5a2 label byte
    db 03bh, 035h
    dd offset _Datac85d4
    db "s4f"
    db 08bh, 01eh, 066h, 08bh, 046h, 002h, 00fh, 0b7h, 0c0h, 066h, 0f7h, 02dh
    dd offset _Datac85f0
    db 003h, 0d2h, 00fh, 0bfh, 0d2h, 001h, 017h, 083h, 0c7h, 004h, 033h, 0edh, 003h, 00dh
    dd offset _Datac85d8
    db 013h, 0edh, 003h, 034h, 0adh
    dd offset _Datac85dc
    db 03bh, 03dh
    dd offset _Datac85c4
    db 076h, 0c4h, 0c3h
L5c5df label byte
    db 03bh, 035h
    dd offset _Datac85d4
    db "s?f"
    db 08bh, 01eh, 066h, 08bh, 046h, 002h, 035h, 000h, 080h, 000h, 000h, 081h, 0f3h, 000h, 080h, 000h
    db 000h, 00fh, 0b7h, 0c0h, 066h, 0f7h, 02dh
    dd offset _Datac85f0
    db 003h, 0d2h, 00fh, 0bfh, 0d2h, 001h, 017h, 083h, 0c7h, 004h, 033h, 0edh, 003h, 00dh
    dd offset _Datac85d8
    db 013h, 0edh, 003h, 034h, 0adh
    dd offset _Datac85dc
    db 03bh, 03dh
    dd offset _Datac85c4
    db 076h, 0b9h, 0c3h
L5c627 label byte
    db 03bh, 035h
    dd offset _Datac85d4
    db 073h, 044h, 08ah, 03eh, 08ah, 066h, 001h, 00fh, 0b7h, 0c0h, 066h, 0f7h, 02dh
    dd offset _Datac85f0
    db 003h, 0d2h, 00fh, 0bfh, 0d2h, 001h, 017h, 00fh, 0b7h, 0c3h, 066h, 0f7h, 02dh
    dd offset _Datac85f4
    db 003h, 0d2h, 00fh, 0bfh, 0d2h, 001h, 057h, 004h, 083h, 0c7h, 008h, 033h, 0edh, 003h, 00dh
    dd offset _Datac85d8
    db 013h, 0edh, 003h, 034h, 0adh
    dd offset _Datac85dc
    db 03bh, 03dh
    dd offset _Datac85c4
    db 076h, 0b4h, 0c3h
L5c674 label byte
    db 03bh, 035h
    dd offset _Datac85d4
    db 073h, 04fh, 08ah, 03eh, 08ah, 066h, 001h, 035h, 000h, 080h, 000h, 000h, 081h, 0f3h, 000h, 080h
    db 000h, 000h, 00fh, 0b7h, 0c0h, 066h, 0f7h, 02dh
    dd offset _Datac85f0
    db 003h, 0d2h, 00fh, 0bfh, 0d2h, 001h, 017h, 00fh, 0b7h, 0c3h, 066h, 0f7h, 02dh
    dd offset _Datac85f4
    db 003h, 0d2h, 00fh, 0bfh, 0d2h, 001h, 057h, 004h, 083h, 0c7h, 008h, 033h, 0edh, 003h, 00dh
    dd offset _Datac85d8
    db 013h, 0edh, 003h, 034h, 0adh
    dd offset _Datac85dc
    db 03bh, 03dh
    dd offset _Datac85c4
    db 076h, 0a9h, 0c3h
L5c6cc label byte
    db 03bh, 035h
    dd offset _Datac85d4
    db "sFf"
    db 08bh, 01eh, 066h, 08bh, 046h, 002h, 00fh, 0b7h, 0c0h, 066h, 0f7h, 02dh
    dd offset _Datac85f0
    db 003h, 0d2h, 00fh, 0bfh, 0d2h, 001h, 017h, 00fh, 0b7h, 0c3h, 066h, 0f7h, 02dh
    dd offset _Datac85f4
    db 003h, 0d2h, 00fh, 0bfh, 0d2h, 001h, 057h, 004h, 083h, 0c7h, 008h, 033h, 0edh, 003h, 00dh
    dd offset _Datac85d8
    db 013h, 0edh, 003h, 034h, 0adh
    dd offset _Datac85dc
    db 03bh, 03dh
    dd offset _Datac85c4
    db 076h, 0b2h, 0c3h
Func5c71b_ proc near
    cmp esi, dword ptr [_Datac85d4]
    jae short L5c774
    mov bx, word ptr [esi]
    mov ax, word ptr [esi+02h]
    xor eax, 08000h
    xor ebx, 08000h
    movzx eax, ax
    imul word ptr [_Datac85f0]
    add edx, edx
    movsx edx, dx
    add dword ptr [edi], edx
    movzx eax, bx
    imul word ptr [_Datac85f4]
    add edx, edx
    movsx edx, dx
    add dword ptr [edi+04h], edx
    add edi, 08h
    xor ebp, ebp
    add ecx, dword ptr [_Datac85d8]
    adc ebp, ebp
    add esi, dword ptr [ebp*4+_Datac85dc]
    cmp edi, dword ptr [_Datac85c4]
    jbe short Func5c71b_
L5c774::
    ret
Func5c71b_ endp
Func5c775_ proc near
    ret
Func5c775_ endp
_TEXT ends

    end

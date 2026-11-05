    .486p

expand_color     textequ <Func7fa90_>
pass1_write      textequ <Func80638_>
decode_frame     textequ <Func80bcd_>
pass1_decode     textequ <Func81241_>
pass2_decode     textequ <Func827fd_>
pass3_start      textequ <Func83a28_>
pass3_decode     textequ <Func84068_>
set_bank_mode    textequ <Func8537e_>
build_block_list textequ <Func853b7_>
set_bank         textequ <Func854dc_>
bank_regs        textequ <_Data86538>
id_string        textequ <_Dataca790>
WRITER_SET       equ 0

    include dec12411.inc

_DATA segment
id_string label byte
    db "$Id: 124_110.ASM 1.1 1996/02/28 15:45:20 MDV Exp $"
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
_DATA ends

    end

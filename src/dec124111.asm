    .486p

expand_color     textequ <Func86880_>
pass1_write      textequ <Func87428_>
decode_frame     textequ <Func879bd_>
pass1_decode     textequ <Func88031_>
pass2_decode     textequ <Func895ed_>
pass3_start      textequ <Func8a818_>
pass3_decode     textequ <Func8ae58_>
set_bank_mode    textequ <Func8c16e_>
build_block_list textequ <Func8c1a7_>
set_bank         textequ <Func8c2cc_>
bank_regs        textequ <_Data8d328>
id_string        textequ <_Dataca7e0>
WRITER_SET       equ 1

    include dec12411.inc

_DATA segment
id_string label byte
    db "$Id: 124_111.ASM 1.1 1996/02/28 15:45:38 MDV Exp $"
    db 000h, 000h
_DATA ends

    end

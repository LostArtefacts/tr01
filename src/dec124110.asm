    .486p

expand_color     textequ <RPL124RGB555_ExpandColour_>
pass1_write      textequ <RPL124RGB555_Pass1Write_>
decode_frame     textequ <RPL124RGB555_DecodeFrame_>
pass1_decode     textequ <RPL124RGB555_Pass1Decode_>
pass2_decode     textequ <RPL124RGB555_Pass2Decode_>
pass3_start      textequ <RPL124RGB555_Pass3Start_>
pass3_decode     textequ <RPL124RGB555_Pass3Decode_>
set_bank_mode    textequ <RPL124RGB555_SetBankMode_>
build_block_list textequ <RPL124RGB555_BuildBlockList_>
set_bank         textequ <RPL124RGB555_SetBank_>
bank_regs        textequ <_rpl124rgb555_bank_registers>
id_string        textequ <_rpl124rgb555_rcsid>
WRITER_SET       equ 0

    include dec12411.inc

_DATA segment
id_string label byte
    db "$Id: 124_110.ASM 1.1 1996/02/28 15:45:20 MDV Exp $"
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
_DATA ends

    end

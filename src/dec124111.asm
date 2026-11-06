    .486p

expand_color     textequ <RPL124RGB565_ExpandColour_>
pass1_write      textequ <RPL124RGB565_Pass1Write_>
decode_frame     textequ <RPL124RGB565_DecodeFrame_>
pass1_decode     textequ <RPL124RGB565_Pass1Decode_>
pass2_decode     textequ <RPL124RGB565_Pass2Decode_>
pass3_start      textequ <RPL124RGB565_Pass3Start_>
pass3_decode     textequ <RPL124RGB565_Pass3Decode_>
set_bank_mode    textequ <RPL124RGB565_SetBankMode_>
build_block_list textequ <RPL124RGB565_BuildBlockList_>
set_bank         textequ <RPL124RGB565_SetBank_>
bank_regs        textequ <_rpl124rgb565_bank_registers>
id_string        textequ <_rpl124rgb565_rcsid>
WRITER_SET       equ 1

    include dec12411.inc

_DATA segment
id_string label byte
    db "$Id: 124_111.ASM 1.1 1996/02/28 15:45:38 MDV Exp $"
    db 000h, 000h
_DATA ends

    end

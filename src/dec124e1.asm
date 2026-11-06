    .486p

entry_0000       textequ <RPL124D555_ExpandColour_>
entry_0cb6       textequ <RPL124D555_Pass1Write_>
entry_1467       textequ <RPL124D555_DecodeFrame_>
entry_1c12       textequ <RPL124D555_Pass1Decode_>
entry_34d4       textequ <RPL124D555_Pass2Decode_>
entry_490c       textequ <RPL124D555_Pass3Start_>
entry_502e       textequ <RPL124D555_Pass3Decode_>
set_bank_mode    textequ <RPL124D555_SetBankMode_>
build_block_list textequ <RPL124D555_BuildBlockList_>
set_bank         textequ <RPL124D555_SetBank_>
bank_regs        textequ <_rpl124d555_bank_registers>
id_string        textequ <_rpl124d555_rcsid>
WRITER_SET       equ 0

    include dec124e.inc

    end

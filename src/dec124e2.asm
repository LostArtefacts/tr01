    .486p

entry_0000       textequ <RPL124D565_ExpandColour_>
entry_0cb6       textequ <RPL124D565_Pass1Write_>
entry_1467       textequ <RPL124D565_DecodeFrame_>
entry_1c12       textequ <RPL124D565_Pass1Decode_>
entry_34d4       textequ <RPL124D565_Pass2Decode_>
entry_490c       textequ <RPL124D565_Pass3Start_>
entry_502e       textequ <RPL124D565_Pass3Decode_>
set_bank_mode    textequ <RPL124D565_SetBankMode_>
build_block_list textequ <RPL124D565_BuildBlockList_>
set_bank         textequ <RPL124D565_SetBank_>
bank_regs        textequ <_rpl124d565_bank_registers>
id_string        textequ <_rpl124d565_rcsid>
WRITER_SET       equ 1

    include dec124e.inc

    end

int __cdecl RPL124RGB555_DecodeFrame(void *compressed_data, const void *destination, int codebooks, int block_list);
int __cdecl RPL124RGB565_DecodeFrame(void *compressed_data, const void *destination, int codebooks, int block_list);
int __cdecl RPL124RGB555_SetBankMode(int bank_a, int granularity);
int __cdecl RPL124RGB565_SetBankMode(int bank_a, int granularity);
int __cdecl RPL124RGB555_BuildBlockList(void *width, const void *height, int x_offset, int y_offset, int clip_x, int clip_y, int clip_width, int clip_height, int flags, int block_list);
int __cdecl RPL124RGB565_BuildBlockList(void *width, const void *height, int x_offset, int y_offset, int clip_x, int clip_y, int clip_width, int clip_height, int flags, int block_list);

#pragma aux (__cdecl) RPL124RGB555_DecodeFrame "RPL124RGB555_DecodeFrame_";
#pragma aux (__cdecl) RPL124RGB565_DecodeFrame "RPL124RGB565_DecodeFrame_";
#pragma aux (__cdecl) RPL124RGB555_SetBankMode "RPL124RGB555_SetBankMode_";
#pragma aux (__cdecl) RPL124RGB565_SetBankMode "RPL124RGB565_SetBankMode_";
#pragma aux (__cdecl) RPL124RGB555_BuildBlockList "RPL124RGB555_BuildBlockList_";
#pragma aux (__cdecl) RPL124RGB565_BuildBlockList "RPL124RGB565_BuildBlockList_";

int RPL124_DecodeRGB555(void *compressed_data, const void *destination, int codebooks, int block_list)
{
    return RPL124RGB555_DecodeFrame(compressed_data, destination, codebooks, block_list);
}

int RPL124_DecodeRGB565(void *compressed_data, const void *destination, int codebooks, int block_list)
{
    return RPL124RGB565_DecodeFrame(compressed_data, destination, codebooks, block_list);
}

int RPL124_SetBankModeRGB555(int bank_a, int granularity)
{
    return RPL124RGB555_SetBankMode(bank_a, granularity);
}

int RPL124_SetBankModeRGB565(int bank_a, int granularity)
{
    return RPL124RGB565_SetBankMode(bank_a, granularity);
}

int RPL124_BuildRGB555BlockList(void *width, const void *height, int x_offset, int y_offset, int clip_x, int clip_y, int clip_width, int clip_height, int flags, int block_list)
{
    return RPL124RGB555_BuildBlockList(width, height, x_offset, y_offset, clip_x, clip_y, clip_width, clip_height, flags, block_list);
}

int RPL124_BuildRGB565BlockList(void *width, const void *height, int x_offset, int y_offset, int clip_x, int clip_y, int clip_width, int clip_height, int flags, int block_list)
{
    return RPL124RGB565_BuildBlockList(width, height, x_offset, y_offset, clip_x, clip_y, clip_width, clip_height, flags, block_list);
}

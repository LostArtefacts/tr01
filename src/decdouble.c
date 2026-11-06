#include "rplfile_internal.h"

int RPL124_DecodeRGB555Doubled(int compressed_data, int destination, int codebooks, int block_list)
{
    return RPL124D555_DecodeFrame(compressed_data, destination, codebooks, block_list);
}

int RPL124_DecodeRGB565Doubled(int compressed_data, int destination, int codebooks, int block_list)
{
    return RPL124D565_DecodeFrame(compressed_data, destination, codebooks, block_list);
}

int RPL124_SetBankModeRGB555Doubled(int bank_window, int granularity, int unused)
{
    return RPL124D555_SetBankMode(bank_window, granularity);
}

int RPL124_SetBankModeRGB565Doubled(int bank_window, int granularity, int unused)
{
    return RPL124D565_SetBankMode(bank_window, granularity);
}

int RPL124_BuildRGB555DoubledBlockList(int width, int height, int x_offset, int y_offset, int clip_x, int clip_y, int clip_width, int clip_height, int flags, int block_list)
{
    return RPL124D555_BuildBlockList(width, height, x_offset, y_offset, clip_x, clip_y, clip_width, clip_height, flags, block_list);
}

int RPL124_BuildRGB565DoubledBlockList(int width, int height, int x_offset, int y_offset, int clip_x, int clip_y, int clip_width, int clip_height, int flags, int block_list)
{
    return RPL124D565_BuildBlockList(width, height, x_offset, y_offset, clip_x, clip_y, clip_width, clip_height, flags, block_list);
}

#include "rplfile_internal.h"

int RPLDecode_GetFrameBufferSize(int width, int height, int width_out, int height_out)
{
    return RPL124_FrameBufferSize(width, height, width_out, height_out);
}

int RPLDecode_SetBackground(int decode_state, int background_blocks, int destination, int x_offset, int y_offset, int width, int height, int background_frame)
{
    return RPL124_SetBackground(decode_state, background_blocks, destination, x_offset, y_offset, width, height, background_frame);
}

int RPLDecode_ClearBackground(int decode_state, int background_blocks, int destination)
{
    return RPL124_ClearBackground(decode_state, background_blocks, destination);
}

int RPLDecode_GetDecodeInfoSize(int width, int height, int width_out, int height_out)
{
    return RPL124_DecodeInfoSize(width, height, width_out, height_out);
}

int RPLDecode_DrawFrame(int width, int height, int x_offset, int y_offset, int clip_x, int clip_y, int clip_width, int clip_height, int flags, int decode_state, int frame_width, int frame_height, int destination, int pixel_format, int colour_mode, int unused0, int unused1)
{
    return RPL124_DrawFrame(width, height, x_offset, y_offset, clip_x, clip_y, clip_width, clip_height, flags, decode_state, frame_width, frame_height, destination, pixel_format, colour_mode, unused0, unused1);
}

int RPLDecode_DecodeFrame(int compressed_data, int destination, int codebooks, int decode_state, int reference_blocks, int reference_frame, int blend_mode, int unused)
{
    return RPL124_DecodeFrame(compressed_data, destination, codebooks, decode_state, reference_blocks, reference_frame, blend_mode, unused);
}

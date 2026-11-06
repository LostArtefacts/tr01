#include "rplfile_internal.h"

int RPLFile_LoadMetadata(RPLFILE *rpl, char *name)
{
    FILE *fp;

    fp = fopen(name, "rb");
    if (!fp) {
        return 19;
    }
    if (!RPLFile_ReadMetadata(fp, rpl)) {
        fclose(fp);
    } else {
        fclose(fp);
        if (rpl->format == 124) {
            return 0;
        }
        RPLFile_FreeMetadata(rpl);
    }
    return 20;
}

int RPLFile_ReadAudioData(RPLFILE *rpl)
{
    if (read(*(int *)rpl->author, rpl->buffer, rpl->audio_size) != rpl->audio_size) {
        rpl->callback(rpl->context);
    } else {
        rpl->callback(rpl->context);
    }
    return 0;
}

int RPLFile_ReadChunkData(RPLFILE *rpl)
{
    if (read(*(int *)rpl->author, rpl->buffer, rpl->read_size) != rpl->read_size) {
        rpl->callback(rpl->context);
    } else {
        rpl->callback(rpl->context);
    }
    return 0;
}

int RPLFile_ReadSectorTail(int handle, long offset, char **buffer)
{
    int size;
    int got;

    if (lseek(handle, offset, SEEK_SET) == -1) {
        return 23;
    }
    size = 0x800 - offset % 0x800;
    got = read(handle, *buffer, size);
    if (got != size) {
        return 25;
    }
    *buffer += size;
    return got ^ size;
}

long RPLFile_Tell(int handle)
{
    return tell(handle);
}

long RPLFile_Seek(int handle, long offset)
{
    return lseek(handle, offset, SEEK_SET);
}

int RPLFile_ReadMetadata(FILE *fp, RPLFILE *rpl)
{
    int error;

    error = 0;
    if (!rpl || !fp) {
        return 0;
    }
    RPLFile_InitMetadata(rpl);
    if (!RPLFile_ReadHeader(fp, rpl)) {
        error = 1;
    }
    if (!error && !RPLFile_ReadIndex(fp, rpl)) {
        error = 1;
    }
    if (!error) {
        rpl->chunk_samples = (long)(rpl->sample_rate / rpl->frame_rate) & ~3;
    }
    if (error) {
        RPLFile_FreeMetadata(rpl);
        return 0;
    }
    return 1;
}

void RPLFile_InitMetadata(RPLFILE *rpl)
{
    if (rpl) {
        rpl->magic = 0x9f82c384;
        rpl->title = 0;
        rpl->author = 0;
        rpl->copyright = 0;
        rpl->sound = 0;
        rpl->index = 0;
        rpl->last_chunk_index = 0;
    }
}

void RPLFile_FreeMetadata(RPLFILE *rpl)
{
    if (rpl && rpl->magic == 0x9f82c384) {
        if (rpl->title) {
            free(rpl->title);
            rpl->title = 0;
        }
        if (rpl->author) {
            free(rpl->author);
            rpl->author = 0;
        }
        if (rpl->copyright) {
            free(rpl->copyright);
            rpl->copyright = 0;
        }
        if (rpl->sound) {
            free(rpl->sound);
            rpl->sound = 0;
        }
        if (rpl->index) {
            free(rpl->index);
            rpl->index = 0;
        }
    }
}

int RPLFile_ReadHeader(FILE *fp, RPLFILE *rpl)
{
    char text[256];

    if (fseek(fp, 0, SEEK_SET)) {
        return 0;
    }
    if (!fgets(text, sizeof(text), fp)) {
        return 0;
    }
    if (strncmp(text, "ARMovie", 7)) {
        return 0;
    }
    if (!fgets(text, sizeof(text), fp)) {
        return 0;
    }
    rpl->title = strdup(text);
    if (!rpl->title) {
        return 0;
    }
    if (!fgets(text, sizeof(text), fp)) {
        return 0;
    }
    rpl->author = strdup(text);
    if (!rpl->author) {
        return 0;
    }
    if (!fgets(text, sizeof(text), fp)) {
        return 0;
    }
    rpl->copyright = strdup(text);
    if (!rpl->copyright) {
        return 0;
    }
    if (!fgets(text, sizeof(text), fp)) {
        return 0;
    }
    rpl->format = atol(text);
    if (!fgets(text, sizeof(text), fp)) {
        return 0;
    }
    rpl->width = atol(text);
    if (!fgets(text, sizeof(text), fp)) {
        return 0;
    }
    rpl->height = atol(text);
    if (!fgets(text, sizeof(text), fp)) {
        return 0;
    }
    rpl->depth = atol(text);
    if (!fgets(text, sizeof(text), fp)) {
        return 0;
    }
    rpl->frame_rate = strtod(text, 0);
    if (!fgets(text, sizeof(text), fp)) {
        return 0;
    }
    rpl->sound = strdup(text);
    if (!rpl->sound) {
        return 0;
    }
    if (!fgets(text, sizeof(text), fp)) {
        return 0;
    }
    rpl->sample_rate = atol(text);
    if (!fgets(text, sizeof(text), fp)) {
        return 0;
    }
    rpl->channels = atol(text);
    if (!fgets(text, sizeof(text), fp)) {
        return 0;
    }
    rpl->sample_bits = atol(text);
    if (!fgets(text, sizeof(text), fp)) {
        return 0;
    }
    rpl->frames_per_chunk = atol(text);
    if (!fgets(text, sizeof(text), fp)) {
        return 0;
    }
    rpl->last_chunk_index = atol(text);
    if (!fgets(text, sizeof(text), fp)) {
        return 0;
    }
    rpl->even_chunk_size = atol(text);
    if (!fgets(text, sizeof(text), fp)) {
        return 0;
    }
    rpl->odd_chunk_size = atol(text);
    if (!fgets(text, sizeof(text), fp)) {
        return 0;
    }
    rpl->index_offset = atol(text);
    if (!fgets(text, sizeof(text), fp)) {
        return 0;
    }
    rpl->sprite_offset = atol(text);
    if (!fgets(text, sizeof(text), fp)) {
        return 0;
    }
    rpl->sprite_size = atol(text);
    if (!fgets(text, sizeof(text), fp)) {
        return 0;
    }
    rpl->keyframe_list_offset = atol(text);
    return 1;
}

int RPLFile_ReadIndex(FILE *fp, RPLFILE *rpl)
{
    char text[256];
    char *p;
    int i;

    if (rpl->last_chunk_index < 0 || rpl->index_offset < 0) {
        return 0;
    }
    if (fseek(fp, rpl->index_offset, SEEK_SET)) {
        return 0;
    }
    rpl->index = malloc((rpl->last_chunk_index + 1) * sizeof(CHUNK));
    if (!rpl->index) {
        return 0;
    }
    for (i = 0; i <= rpl->last_chunk_index; i++) {
        if (!fgets(text, sizeof(text), fp)) {
            return 0;
        }
        rpl->index[i].offset = atol(text);
        p = strchr(text, ',');
        if (!p) {
            return 0;
        }
        rpl->index[i].video = atol(p + 1);
        p = strchr(p, ';');
        if (!p) {
            return 0;
        }
        rpl->index[i].audio = atol(p + 1);
    }
    return 1;
}

int RPLFile_AllocateBuffer(unsigned int size, void **buffer)
{
    *buffer = calloc(size, 1);
    if (!*buffer) {
        return 14;
    }
    return 0;
}

int RPLFile_Open(int *handle, char *name)
{
    *handle = open(name, O_BINARY);
    if (*handle == -1) {
        return 17;
    }
    return 0;
}

int RPLFile_Close(int handle)
{
    return close(handle);
}

int RPLFile_AppendNode(RPLFILE *rpl, NODE **head)
{
    NODE *tail;
    NODE *node;

    if (*head) {
        tail = *head;
        while (tail->next) {
            tail = tail->next;
        }
    }
    node = malloc(9);
    if (!node) {
        return 17;
    }
    if (!*head) {
        *head = node;
    } else {
        tail->next = node;
    }
    node->next = 0;
    node->data = rpl->context;
    rpl->node = node;
    return 0;
}

int RPLFile_RemoveNode(RPLFILE *rpl, NODE **head)
{
    NODE *p;

    for (p = *head; p->next != rpl->node && p->next; p = p->next) {
    }
    p->next = rpl->node->next;
    if (rpl->node == *head) {
        *head = 0;
    }
    free(rpl->node);
    return 0;
}

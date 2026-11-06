typedef unsigned char byte;
typedef unsigned short word;
typedef unsigned long dword;
typedef void (*TIMEREVENT)(void);

#pragma pack(1)
typedef struct
{
    byte reserved[32];
    dword count;
    byte reserved2[8];
} SOSFILEHEADER;

typedef struct
{
    byte reserved[36];
    dword size;
    dword id;
    word flags;
    word reserved2;
} SOSFILEENTRY;
#pragma pack()

typedef union
{
    dword value;
    struct
    {
        word fraction;
        word whole;
    } parts;
} TIMERPHASE;

typedef union
{
    dword value;
    byte channel;
} TIMERCHANNEL;

void sosDIGIMixDriver0(void);
void sosDIGIMixDriver1(void);
void sosDIGIMixDriver2(void);
void sosDIGIMixDriver3(void);
void sosDIGIMixDriver4(void);

extern dword sos_timer_dispatch_esp;

dword sos_timer_irq_state_begin = 0;
dword sos_timer_previous_offset = 0;
dword sos_timer_previous_selector[2] = {0};
dword sos_timer_irq_callback = 0;
word sos_timer_callback_selector = 0;
dword *sos_timer_private_stack_pointer = &sos_timer_dispatch_esp;
dword sos_timer_private_stack_selector = 0;
dword sos_timer_saved_esp = 0;
byte sos_timer_saved_ss_and_stack[4100] = {0};
dword sos_timer_dispatch_esp = 0;
dword sos_timer_chain_eax = 0;
word sos_timer_irq_busy = 0;
dword sos_timer_irq_enabled = 0;
dword sos_timer_use_dpmi_vector = 0;
dword sos_timer_irq_state_end = 0;
dword sos_system_state_begin = 0;
dword sos_digi_flags = 0;
char sos_driver_directory[128] = {0};
char sos_driver_filename[128] = {0};
void *sos_drivers[5] = {0};
dword sos_vds_buffer_descriptor[3] = {0xffffffff, 0xffffffff, 0xffffffff};
dword sos_vds_buffer_physical_address = 0xffffffff;
SOSFILEHEADER sos_driver_file_header = {0};
SOSFILEENTRY sos_driver_file_entry = {0};
void *(*sos_allocate_callback)(unsigned int size) = 0;
void (*sos_free_callback)(void *buffer) = 0;
dword sos_timer_flags = 0;
dword sos_timer_divisor = 0xffffffff;
TIMEREVENT sos_timer_events[15] = {0};
TIMEREVENT sos_timer_chain_callback = 0;
dword sos_timer_event_rates[15] = {
    0xffffffff, 0xffffffff, 0xffffffff, 0xffffffff,
    0xffffffff, 0xffffffff, 0xffffffff, 0xffffffff,
    0xffffffff, 0xffffffff, 0xffffffff, 0xffffffff,
    0xffffffff, 0xffffffff, 0xffffffff
};
dword sos_timer_base_rate = 0xffffffff;
dword sos_timer_event_steps[15] = {
    0xffffffff, 0xffffffff, 0xffffffff, 0xffffffff,
    0xffffffff, 0xffffffff, 0xffffffff, 0xffffffff,
    0xffffffff, 0xffffffff, 0xffffffff, 0xffffffff,
    0xffffffff, 0xffffffff, 0xffffffff
};
dword sos_timer_chain_step = 0xffffffff;
TIMERPHASE sos_timer_event_phases[16] = {
    0xffffffff, 0xffffffff, 0xffffffff, 0xffffffff,
    0xffffffff, 0xffffffff, 0xffffffff, 0xffffffff,
    0xffffffff, 0xffffffff, 0xffffffff, 0xffffffff,
    0xffffffff, 0xffffffff, 0xffffffff, 0xffffffff
};
TIMERCHANNEL sos_timer_event_channels[16] = {
    0xffffffff, 0xffffffff, 0xffffffff, 0xffffffff,
    0xffffffff, 0xffffffff, 0xffffffff, 0xffffffff,
    0xffffffff, 0xffffffff, 0xffffffff, 0xffffffff,
    0xffffffff, 0xffffffff, 0xffffffff, 0xffffffff
};
dword sos_timer_current_channel = 0xffffffff;
dword sos_detect_flags = 0;
char sos_detect_reserved_buffer[128] = {0};
char sos_detect_filename[128] = {0};
SOSFILEHEADER sos_detect_file_header = {0};
SOSFILEENTRY sos_detect_file_entry = {0};
byte sos_detect_driver_info[0x6c] = {0};
byte *sos_detect_current_info = 0;
dword sos_detect_image_offset = 0;
dword sos_detect_image_selector = 0;
dword sos_detect_data_offset = 0;
dword sos_detect_data_selector = 0;
int sos_detect_file_handle = 0;
dword sos_detect_driver_file_offset = 0;
dword sos_detect_entry_index = 0;
dword sos_detect_memory_handle = 0;
dword sos_detect_linear_base = 0;
char *sos_error_messages[] = {
    "Error Code Does Not Indicate An Error",
    "Specified Driver Is Not Loaded",
    "Specified Pointer Is NULL",
    "Detection System Is Already Initialized",
    "File Open Failure",
    "Memory Allocation Failure",
    "Invalid Driver ID",
    "Driver Not Found",
    "Detection System Failed To Find Hardware",
    "Driver Already Loaded Using Specified Handle",
    "Invalid Handle",
    "No Handles Available",
    "Hardware Already Paused",
    "Hardware Not Paused",
    "Data Is Not Valid",
    "HMI*.386 File Open Failure",
    "Incorrect Port",
    "Incorrect IRQ",
    "Incorrect DMA",
    "Incorrect DMA/IRQ",
    "Stream Already Playing",
    "Stream Empty",
    "Stream Already Paused",
    "Stream Not Paused"
};
dword sos_dma_count_ports[8] = {0x01, 0x03, 0x05, 0x07, 0xc2, 0xc6, 0xca, 0xce};
void (*sos_driver_mix_callbacks[])(void) = {
    sosDIGIMixDriver0, sosDIGIMixDriver1, sosDIGIMixDriver2, sosDIGIMixDriver3, sosDIGIMixDriver4
};
dword sos_system_state_end = 0;

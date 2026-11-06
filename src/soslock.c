typedef unsigned long dword;
typedef unsigned char byte;

void sosTIMERCodeStart(void);
void sosTIMERCodeEnd(void);
void sosDIGISystemCodeStart(void);
void sosDIGISystemCodeEnd(void);
void sosDIGIDriverCodeStart(void);
void sosDIGIDriverCodeEnd(void);
void sosDIGISampleCodeStart(void);
void sosDIGISampleCodeEnd(void);
void sosDIGIQueryCodeStart(void);
void sosDIGIQueryCodeEnd(void);
void sosTIMERInterruptCodeStart(void);
void sosTIMERInterruptCodeEnd(void);
void sosLOCKCodeStart(void);
void sosLOCKCodeEnd(void);
void sosLOADCodeStart(void);
void sosLOADCodeEnd(void);
void sosALLOCCodeStart(void);
void sosALLOCCodeEnd(void);
void sosDriverConfigCodeStart(void);
void sosDriverConfigCodeEnd(void);
void sosDPMICodeStart(void);
void sosDPMICodeEnd(void);
void sosMIXCodeStart(void);
void sosMIXCodeEnd(void);
void sosDETECTCodeStart(void);
void sosDETECTCodeEnd(void);
void sosERRORCodeStart(void);
void sosERRORCodeEnd(void);
void sosMIXRoutinesStart(void);
void sosMIXRoutinesEnd(void);
void sosMIXConvertCodeStart(void);
void sosMIXConvertCodeEnd(void);
extern byte sos_timer_irq_state_begin[];
extern byte sos_timer_irq_state_end[];
extern byte sos_system_state_begin[];
extern byte sos_system_state_end[];
extern byte sos_dpmi_state_begin[];
extern byte sos_dpmi_state_end[];
extern byte sos_mix_state_begin[];
extern byte sos_mix_state_end[];

int __cdecl sosDPMILockMemory(void *begin, dword size);
int __cdecl sosDPMIUnlockMemory(void *begin, dword size);
#pragma aux (__cdecl) sosDPMILockMemory "sosDPMILockMemory_";
#pragma aux (__cdecl) sosDPMIUnlockMemory "sosDPMIUnlockMemory_";

void sosLOCKCodeStart(void)
{
}

int sosLockSystem(void)
{
    if (sosDPMILockMemory((void *)sosALLOCCodeStart, (dword)sosALLOCCodeEnd - (dword)sosALLOCCodeStart)) {
        return 5;
    }
    if (sosDPMILockMemory((void *)sosDriverConfigCodeStart, (dword)sosDriverConfigCodeEnd - (dword)sosDriverConfigCodeStart)) {
        return 5;
    }
    if (sosDPMILockMemory((void *)sosDIGIQueryCodeStart, (dword)sosDIGIQueryCodeEnd - (dword)sosDIGIQueryCodeStart)) {
        return 5;
    }
    if (sosDPMILockMemory((void *)sosDETECTCodeStart, (dword)sosDETECTCodeEnd - (dword)sosDETECTCodeStart)) {
        return 5;
    }
    if (sosDPMILockMemory((void *)sosERRORCodeStart, (dword)sosERRORCodeEnd - (dword)sosERRORCodeStart)) {
        return 5;
    }
    if (sosDPMILockMemory((void *)sosDIGIDriverCodeStart, (dword)sosDIGIDriverCodeEnd - (dword)sosDIGIDriverCodeStart)) {
        return 5;
    }
    if (sosDPMILockMemory((void *)sosLOADCodeStart, (dword)sosLOADCodeEnd - (dword)sosLOADCodeStart)) {
        return 5;
    }
    if (sosDPMILockMemory((void *)sosLOCKCodeStart, (dword)sosLOCKCodeEnd - (dword)sosLOCKCodeStart)) {
        return 5;
    }
    if (sosDPMILockMemory((void *)sosDIGISampleCodeStart, (dword)sosDIGISampleCodeEnd - (dword)sosDIGISampleCodeStart)) {
        return 5;
    }
    if (sosDPMILockMemory((void *)sosDIGISystemCodeStart, (dword)sosDIGISystemCodeEnd - (dword)sosDIGISystemCodeStart)) {
        return 5;
    }
    if (sosDPMILockMemory((void *)sosTIMERCodeStart, (dword)sosTIMERCodeEnd - (dword)sosTIMERCodeStart)) {
        return 5;
    }
    if (sosDPMILockMemory((void *)sosDPMICodeStart, (dword)sosDPMICodeEnd - (dword)sosDPMICodeStart)) {
        return 5;
    }
    if (sosDPMILockMemory((void *)sosTIMERInterruptCodeStart, (dword)sosTIMERInterruptCodeEnd - (dword)sosTIMERInterruptCodeStart)) {
        return 5;
    }
    if (sosDPMILockMemory((void *)sosMIXCodeStart, (dword)sosMIXCodeEnd - (dword)sosMIXCodeStart)) {
        return 5;
    }
    if (sosDPMILockMemory((void *)sosMIXRoutinesStart, (dword)sosMIXRoutinesEnd - (dword)sosMIXRoutinesStart)) {
        return 5;
    }
    if (sosDPMILockMemory((void *)sosMIXConvertCodeStart, (dword)sosMIXConvertCodeEnd - (dword)sosMIXConvertCodeStart)) {
        return 5;
    }
    if (sosDPMILockMemory((void *)sos_system_state_begin, (dword)sos_system_state_end - (dword)sos_system_state_begin)) {
        return 5;
    }
    if (sosDPMILockMemory((void *)sos_dpmi_state_begin, (dword)sos_dpmi_state_end - (dword)sos_dpmi_state_begin)) {
        return 5;
    }
    if (sosDPMILockMemory((void *)sos_timer_irq_state_begin, (dword)sos_timer_irq_state_end - (dword)sos_timer_irq_state_begin)) {
        return 5;
    }
    if (sosDPMILockMemory((void *)sos_mix_state_begin, (dword)sos_mix_state_end - (dword)sos_mix_state_begin)) {
        return 5;
    }
    return 0;
}

int sosUnlockSystem(void)
{
    if (sosDPMIUnlockMemory((void *)sosALLOCCodeStart, (dword)sosALLOCCodeEnd - (dword)sosALLOCCodeStart)) {
        return 5;
    }
    if (sosDPMIUnlockMemory((void *)sosDriverConfigCodeStart, (dword)sosDriverConfigCodeEnd - (dword)sosDriverConfigCodeStart)) {
        return 5;
    }
    if (sosDPMIUnlockMemory((void *)sosDIGIQueryCodeStart, (dword)sosDIGIQueryCodeEnd - (dword)sosDIGIQueryCodeStart)) {
        return 5;
    }
    if (sosDPMIUnlockMemory((void *)sosDETECTCodeStart, (dword)sosDETECTCodeEnd - (dword)sosDETECTCodeStart)) {
        return 5;
    }
    if (sosDPMIUnlockMemory((void *)sosERRORCodeStart, (dword)sosERRORCodeEnd - (dword)sosERRORCodeStart)) {
        return 5;
    }
    if (sosDPMIUnlockMemory((void *)sosDIGIDriverCodeStart, (dword)sosDIGIDriverCodeEnd - (dword)sosDIGIDriverCodeStart)) {
        return 5;
    }
    if (sosDPMIUnlockMemory((void *)sosLOADCodeStart, (dword)sosLOADCodeEnd - (dword)sosLOADCodeStart)) {
        return 5;
    }
    if (sosDPMIUnlockMemory((void *)sosLOCKCodeStart, (dword)sosLOCKCodeEnd - (dword)sosLOCKCodeStart)) {
        return 5;
    }
    if (sosDPMIUnlockMemory((void *)sosDIGISampleCodeStart, (dword)sosDIGISampleCodeEnd - (dword)sosDIGISampleCodeStart)) {
        return 5;
    }
    if (sosDPMIUnlockMemory((void *)sosDIGISystemCodeStart, (dword)sosDIGISystemCodeEnd - (dword)sosDIGISystemCodeStart)) {
        return 5;
    }
    if (sosDPMIUnlockMemory((void *)sosTIMERCodeStart, (dword)sosTIMERCodeEnd - (dword)sosTIMERCodeStart)) {
        return 5;
    }
    if (sosDPMIUnlockMemory((void *)sosDPMICodeStart, (dword)sosDPMICodeEnd - (dword)sosDPMICodeStart)) {
        return 5;
    }
    if (sosDPMIUnlockMemory((void *)sosTIMERInterruptCodeStart, (dword)sosTIMERInterruptCodeEnd - (dword)sosTIMERInterruptCodeStart)) {
        return 5;
    }
    if (sosDPMIUnlockMemory((void *)sosMIXCodeStart, (dword)sosMIXCodeEnd - (dword)sosMIXCodeStart)) {
        return 5;
    }
    if (sosDPMIUnlockMemory((void *)sosMIXRoutinesStart, (dword)sosMIXRoutinesEnd - (dword)sosMIXRoutinesStart)) {
        return 5;
    }
    if (sosDPMIUnlockMemory((void *)sosMIXConvertCodeStart, (dword)sosMIXConvertCodeEnd - (dword)sosMIXConvertCodeStart)) {
        return 5;
    }
    if (sosDPMIUnlockMemory((void *)sos_system_state_begin, (dword)sos_system_state_end - (dword)sos_system_state_begin)) {
        return 5;
    }
    if (sosDPMIUnlockMemory((void *)sos_dpmi_state_begin, (dword)sos_dpmi_state_end - (dword)sos_dpmi_state_begin)) {
        return 5;
    }
    if (sosDPMIUnlockMemory((void *)sos_timer_irq_state_begin, (dword)sos_timer_irq_state_end - (dword)sos_timer_irq_state_begin)) {
        return 5;
    }
    if (sosDPMIUnlockMemory((void *)sos_mix_state_begin, (dword)sos_mix_state_end - (dword)sos_mix_state_begin)) {
        return 5;
    }
    return 0;
}

void sosLOCKCodeEnd(void)
{
}

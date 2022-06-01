.global _start
.section .text

# https://www.youtube.com/watch?v=FV6P5eRmMh8
# https://chromium.googlesource.com/chromiumos/docs/+/master/constants/syscalls.md#arm-32_bit_EABI

_start:
    mov r7, #0x1
    mov r0, #0x17
    swi 0

.section .data

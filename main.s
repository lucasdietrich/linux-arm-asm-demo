.global _start
.section .text

_start:
	mov r7, #0x4
	mov r0, #0x1
	ldr r1, =mystring
	mov r2, #14
	
	swi 0

	mov r7, #0x1
	mov r0, #0

	swi 0

.section .data
	mystring:
		.ascii "Hello world !\n"
.global _start
.section .text

_start:
	bl hello_world
	bl hello_world
	bl exit

hello_world:
	push {r7, lr}
	mov fp, sp

	/* allocate stack */
	sub sp, sp, #0x40
	ldr r1, =#0x1234
	str r1, [fp, #-0x10]

	/* hello world */
	mov r7, #0x4
	mov r0, #0x1
	ldr r1, =mystring
	mov r2, #14
	swi 0

	mov sp, fp
	pop {r7, pc}

exit:
	push {r7, fp, lr}
	mov r7, #0x1
	mov r0, #0
	swi 0
	pop {r7, fp, pc}

.section .data
	mystring:
		.ascii "Hello world !\n"

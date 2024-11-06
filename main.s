.global _start

.equ GPIO_BASE, 0x3f200000
.equ GPIO_FSEL2, 0x08
.equ FSEL_21_OUTPUT, 0b001000
.equ GPIO_SET0, 0x1c
.equ GPIO_CLR0, 0x28

# 1 << 21
.equ GPIO_21, 0x200000

_start:
	ldr r0, =GPIO_BASE

	ldr r1, =FSEL_21_OUTPUT	
	str r1, [r0, #GPIO_FSEL2]

	ldr r1, =GPIO_21

	mov r2, #0x800000

loop:
	str r1, [r0, #GPIO_SET0]

	bl delay

	str r1, [r0, #GPIO_CLR0]

	bl delay

	b loop


delay:
	mov r10, #0
delay_loop:
	add r10, r10, #1
	cmp r10, r2
	bne delay_loop
	bx lr

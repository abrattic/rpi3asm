.global _start

.equ GPIO_BASE, 0x3f200000
.equ GPIO_FSEL2, 0x08
.equ FSEL_21_OUTPUT, 0b001000
.equ GPIO_SET0, 0x1c
.equ GPIO_CLR0, 0x28

# 1 << 21
.equ GPIO_21, 0x200000

_start:
	ldr x0, =GPIO_BASE

	ldr w1, =FSEL_21_OUTPUT	
	str w1, [x0, #GPIO_FSEL2]

	ldr w1, =GPIO_21

loop:
	str w1, [x0, #GPIO_SET0]

	bl delay

	str w1, [x0, #GPIO_CLR0]

	bl delay

	b loop


delay:
	mov x10, #0x800000
delay_loop:
	subs x10, x10, #1
	bne delay_loop
	ret

.global _start

.equ GPIO_BASE, 0x3f200000
.equ GPIO_FSEL2, 0x08
.equ FSEL_21_OUTPUT, 0b001000
.equ GPIO_SET0, 0x1c
.equ GPIO_CLR0, 0x28

# 1 << 21
.equ GPIO_21, 0x200000

.equ TIMER_BASE, 0x3f003000
.equ TIMER_CLO, 0x04
.equ TIMER_C0, 0xc

_start:
	ldr x0, =GPIO_BASE

	ldr w1, =FSEL_21_OUTPUT
	str w1, [x0, #GPIO_FSEL2]

	ldr w1, =GPIO_21

	ldr x2, =TIMER_BASE
	mov w3, #0xf424
	lsl w3, w3, #4

loop:
	str w1, [x0, #GPIO_SET0]

	bl delay

	str w1, [x0, #GPIO_CLR0]

	bl delay

	b loop


delay:
	mov w4, #0x0
	str w4, [x2]

	ldr w4, [x2, #TIMER_CLO]
	add w4, w4, w3
	str w4, [x2, #TIMER_C0]

wait_loop:
	ldr w4, [x2]
	tst w4, #0x1
	beq wait_loop
	ret


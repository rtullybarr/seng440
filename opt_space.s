	.arch armv4t
	.fpu softvfp
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 2
	.eabi_attribute 30, 4
	.eabi_attribute 18, 4
	.file	"test_ccm_log.c"
	.global	__aeabi_i2f
	.global	__aeabi_fmul
	.global	__aeabi_f2d
	.text
	.align	2
	.global	main
	.type	main, %function
main:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r0, r1, r2, r4, r5, lr}
	ldr	r3, .L7
	mov	r0, #0
	mov	r2, r0
.L5:
	add	r2, r2, #1
	add	r1, r3, r3, lsr r2
	cmp	r1, #1073741824
	ldrls	r3, .L7+4
	ldrls	r3, [r3, r2, asl #2]
	movhi	r1, r3
	rsbls	r0, r3, r0
	cmp	r2, #30
	mov	r3, r1
	bne	.L5
	bl	__aeabi_i2f
	mov	r1, #813694976
	bl	__aeabi_fmul
	bl	__aeabi_f2d
	ldr	r4, .L7+8
	ldr	r5, .L7+12
	mov	r2, r0
	mov	r3, r1
	ldr	r0, .L7+16
	stmia	sp, {r4-r5}
	bl	printf
	mov	r0, #0
	ldmfd	sp!, {r1, r2, r3, r4, r5, lr}
	bx	lr
.L8:
	.align	2
.L7:
	.word	644245120
	.word	.LANCHOR0
	.word	-1075836637
	.word	-1075342024
	.word	.LC0
	.size	main, .-main
	.global	lookup_table
	.section	.rodata.str1.1,"aMS",%progbits,1
.LC0:
	.ascii	"ccm= %.10f, log2= %.10f\012\000"
	.data
	.align	2
.LANCHOR0 = . + 0
	.type	lookup_table, %object
	.size	lookup_table, 124
lookup_table:
	.word	1073741824
	.word	628098688
	.word	345667648
	.word	182455584
	.word	93912512
	.word	47667824
	.word	24017256
	.word	12055174
	.word	6039313
	.word	3022600
	.word	1512037
	.word	756203
	.word	378147
	.word	189085
	.word	94545
	.word	47273
	.word	23636
	.word	11818
	.word	5909
	.word	2954
	.word	1477
	.word	738
	.word	369
	.word	184
	.word	92
	.word	46
	.word	23
	.word	11
	.word	5
	.word	2
	.word	0
	.ident	"GCC: (Sourcery G++ Lite 2008q3-72) 4.3.2"
	.section	.note.GNU-stack,"",%progbits
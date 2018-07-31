	.arch armv4t
	.fpu softvfp
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 2
	.eabi_attribute 30, 1
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
	str	lr, [sp, #-4]!
	sub	sp, sp, #12
	ldr	r3, .L6+8
	ldr	r3, [r3, #0]
	rsb	ip, r3, #0
	mov	r1, #0
	mov	r3, #1275068416
	add	r3, r3, #13369344
	add	r2, r3, #52480
	mov	r0, r1
	mov	r3, #641728512
	add	r3, r3, #2506752
	add	r3, r3, #9856
	ldr	lr, .L6+8
.L4:
	add	r1, r1, #1
	cmp	r2, #1073741824
	movls	r3, r2
	cmp	r2, #1073741824
	movls	r0, ip
	ldr	ip, [lr, r1, asl #2]
	cmp	r1, #31
	addne	r2, r3, r3, lsr r1
	rsbne	ip, ip, r0
	bne	.L4
.L3:
	bl	__aeabi_i2f
	mov	r1, #813694976
	bl	__aeabi_fmul
	bl	__aeabi_f2d
	mov	r2, r0
	mov	r3, r1
	adr	r1, .L6
	ldmia	r1, {r0-r1}
	stmia	sp, {r0-r1}
	ldr	r0, .L6+12
	bl	printf
	mov	r0, #0
	add	sp, sp, #12
	ldr	lr, [sp], #4
	bx	lr
.L7:
	.align	3
.L6:
	.word	-1075836637
	.word	-1075342024
	.word	.LANCHOR0
	.word	.LC0
	.size	main, .-main
	.global	lookup_table
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
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	.ascii	"ccm=%f, log2=%f\012\000"
	.ident	"GCC: (Sourcery G++ Lite 2008q3-72) 4.3.2"
	.section	.note.GNU-stack,"",%progbits

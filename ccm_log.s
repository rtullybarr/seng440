	.arch armv4t
	.fpu softvfp
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 2
	.eabi_attribute 30, 2
	.eabi_attribute 18, 4
	.file	"test_ccm_log.c"
	.global	__aeabi_fmul
	.global	__aeabi_f2uiz
	.global	__aeabi_f2d
	.global	__aeabi_i2f
	.global	__aeabi_dadd
	.global	__aeabi_d2f
	.global	__aeabi_fcmple
	.text
	.align	2
	.global	main
	.type	main, %function
main:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, sl, lr}
	ldr	sl, .L10+8
	sub	sp, sp, #12
	mov	r4, #1056964608
.L5:
	mov	r1, #1308622848
	add	r1, r1, #8388608
	mov	r0, r4
	bl	__aeabi_fmul
	bl	__aeabi_f2uiz
	mov	r2, #0
	mov	r3, r0, asl #1
	mov	r8, r2
	mov	r1, r2
	b	.L4
.L9:
	add	r3, r0, r0, lsr r2
.L4:
	cmp	r3, #1073741824
	add	r2, r2, #1
	movls	r0, r3
	ldr	r3, [sl, r2, asl #2]
	movls	r8, r1
	cmp	r2, #31
	rsb	r1, r3, r8
	bne	.L9
	mov	r0, r4
	bl	__aeabi_f2d
	mov	r6, r0
	mov	r7, r1
	bl	log2
	mov	r4, r0
	mov	r0, r8
	mov	r5, r1
	bl	__aeabi_i2f
	mov	r1, #813694976
	bl	__aeabi_fmul
	bl	__aeabi_f2d
	mov	r2, r0
	mov	r3, r1
	ldr	r0, .L10+12
	stmia	sp, {r4-r5}
	bl	printf
	adr	r3, .L10
	ldmia	r3, {r2-r3}
	mov	r0, r6
	mov	r1, r7
	bl	__aeabi_dadd
	bl	__aeabi_d2f
	mov	r1, #1065353216
	mov	r4, r0
	bl	__aeabi_fcmple
	cmp	r0, #0
	bne	.L5
	add	sp, sp, #12
	ldmfd	sp!, {r4, r5, r6, r7, r8, sl, lr}
	bx	lr
.L11:
	.align	3
.L10:
	.word	-1698910392
	.word	1048238066
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
	.ascii	"ccm= %.10f, log2= %.10f\012\000"
	.ident	"GCC: (Sourcery G++ Lite 2008q3-72) 4.3.2"
	.section	.note.GNU-stack,"",%progbits

	.arch armv4t
	.fpu softvfp
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 2
	.eabi_attribute 30, 6
	.eabi_attribute 18, 4
	.file	"test_ccm_log.c"
	.global	lookup_table
	.data
	.align	2
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
	.global	__aeabi_fmul
	.global	__aeabi_f2uiz
	.global	__aeabi_i2f
	.global	__aeabi_fdiv
	.global	__aeabi_f2d
	.section	.rodata
	.align	2
.LC0:
	.ascii	"ccm=%f, log2=%f\012\000"
	.text
	.align	2
	.global	main
	.type	main, %function
main:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, fp, lr}
	add	fp, sp, #16
	sub	sp, sp, #28
	ldr	r3, .L3	@ float
	str	r3, [fp, #-36]	@ float
	ldr	r3, [fp, #-36]	@ float
	ldr	r2, .L3+4	@ float
	mov	r0, r3
	mov	r1, r2
	bl	__aeabi_fmul
	mov	r3, r0
	mov	r0, r3
	bl	__aeabi_f2uiz
	mov	r3, r0
	str	r3, [fp, #-32]
	ldr	r0, [fp, #-32]
	bl	ccm_log
	mov	r3, r0
	str	r3, [fp, #-28]
	ldr	r0, [fp, #-28]
	bl	__aeabi_i2f
	mov	r3, r0
	ldr	r2, .L3+4	@ float
	mov	r0, r3
	mov	r1, r2
	bl	__aeabi_fdiv
	mov	r3, r0
	str	r3, [fp, #-24]	@ float
	ldr	r0, [fp, #-24]	@ float
	bl	__aeabi_f2d
	mov	r5, r0
	mov	r6, r1
	ldr	r0, [fp, #-36]	@ float
	bl	__aeabi_f2d
	mov	r3, r0
	mov	r4, r1
	mov	r0, r3
	mov	r1, r4
	bl	log2
	mov	r3, r0
	mov	r4, r1
	stmia	sp, {r3-r4}
	ldr	r0, .L3+8
	mov	r2, r5
	mov	r3, r6
	bl	printf
	mov	r3, #0
	mov	r0, r3
	sub	sp, fp, #16
	ldmfd	sp!, {r4, r5, r6, fp, lr}
	bx	lr
.L4:
	.align	2
.L3:
	.word	1058642330
	.word	1317011456
	.word	.LC0
	.size	main, .-main
	.align	2
	.type	ccm_log, %function
ccm_log:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 32
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	sub	sp, sp, #36
	str	r0, [fp, #-32]
	mov	r3, #0
	str	r3, [fp, #-24]
	mov	r3, #31
	str	r3, [fp, #-20]
	mov	r3, #0
	str	r3, [fp, #-16]
	ldr	r2, [fp, #-32]
	ldr	r3, [fp, #-16]
	mov	r2, r2, lsr r3
	ldr	r3, [fp, #-32]
	add	r3, r2, r3
	str	r3, [fp, #-12]
	ldr	r2, [fp, #-16]
	ldr	r3, .L10
	ldr	r2, [r3, r2, asl #2]
	ldr	r3, [fp, #-24]
	rsb	r3, r2, r3
	str	r3, [fp, #-8]
	b	.L6
.L8:
	ldr	r3, [fp, #-16]
	add	r3, r3, #1
	str	r3, [fp, #-16]
	ldr	r3, [fp, #-12]
	cmp	r3, #1073741824
	bhi	.L7
	ldr	r3, [fp, #-12]
	str	r3, [fp, #-32]
	ldr	r3, [fp, #-8]
	str	r3, [fp, #-24]
.L7:
	ldr	r2, [fp, #-32]
	ldr	r3, [fp, #-16]
	mov	r2, r2, lsr r3
	ldr	r3, [fp, #-32]
	add	r3, r2, r3
	str	r3, [fp, #-12]
	ldr	r2, [fp, #-16]
	ldr	r3, .L10
	ldr	r2, [r3, r2, asl #2]
	ldr	r3, [fp, #-24]
	rsb	r3, r2, r3
	str	r3, [fp, #-8]
	ldr	r3, [fp, #-20]
	sub	r3, r3, #1
	str	r3, [fp, #-20]
.L6:
	ldr	r3, [fp, #-20]
	cmp	r3, #0
	bne	.L8
	ldr	r3, [fp, #-24]
	mov	r0, r3
	add	sp, fp, #0
	ldmfd	sp!, {fp}
	bx	lr
.L11:
	.align	2
.L10:
	.word	lookup_table
	.size	ccm_log, .-ccm_log
	.ident	"GCC: (Sourcery G++ Lite 2008q3-72) 4.3.2"
	.section	.note.GNU-stack,"",%progbits

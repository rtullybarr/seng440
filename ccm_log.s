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
	.file	"perf_test_ccm_log.c"
	.global	__aeabi_i2d
	.global	__aeabi_dadd
	.global	__aeabi_d2f
	.global	__aeabi_fmul
	.global	__aeabi_f2iz
	.global	__aeabi_i2f
	.global	__aeabi_f2d
	.text
	.align	2
	.global	main
	.type	main, %function
main:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, lr}
	mov	r4, #0
	ldr	r66 .L10+8
	sub	sp, sp, #8
	mov	r5, r4
.L2:
	mov	r0, r4
	bl	__aeabi_i2d
	mov	r2, r0
	mov	r3, r1
	mov	r0, #0
	mov	r1, #1073741824
	bl	pow
	mov	r3, #1069547520
	mov	r2, #0
	add	r3, r3, #3145728
	bl	__aeabi_dadd
	bl	log2
	bl	__aeabi_d2f
	mov	r1, #1308622848
	add	r1, r1, #8388608
	bl	__aeabi_fmul
	bl	__aeabi_f2iz
	sub	r4, r4, #1
	cmn	r4, #30
	str	r0, [r6, r5]
	add	r5, r5, #4
	bne	.L2
	mov	r3, #1275068416
	mov	r1, #641728512
	mov	r2, #0
	add	r3, r3, #13369344
	add	r1, r1, #2506752
	add	r3, r3, #52480
	add	r1, r1, #9856
	mov	r0, r2
	mov	ip, r2
	b	.L5
.L9:
	add	r3, r1, r1, lsr r2
.L5:
	cmp	r3, #1073741824
	add	r2, r2, #1
	movls	r1, r3
	ldr	r3, [r6, r2, asl #2]
	movls	r0, ip
	cmp	r2, #31
	rsb	ip, r3, r0
	bne	.L9
	bl	__aeabi_i2f
	mov	r1, #813694976
	bl	__aeabi_fmul
	bl	__aeabi_f2d
	adr	r5, .L10
	ldmia	r5, {r4-r5}
	mov	r2, r0
	mov	r3, r1
	ldr	r0, .L10+12
	stmia	sp, {r4-r5}
	bl	printf
	mov	r0, #0
	add	sp, sp, #8
	ldmfd	sp!, {r4, r5, r6, lr}
	bx	lr
.L11:
	.align	3
.L10:
	.word	-1075836637
	.word	-1075342024
	.word	lookup_table
	.word	.LC0
	.size	main, .-main
	.comm	lookup_table,124,4
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	.ascii	"ccm= %.10f, log2= %.10f\012\000"
	.ident	"GCC: (Sourcery G++ Lite 2008q3-72) 4.3.2"
	.section	.note.GNU-stack,"",%progbits

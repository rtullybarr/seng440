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
	.file	"ccm_log.c"
	.global	__aeabi_i2d
	.global	__aeabi_dadd
	.global	__aeabi_d2f
	.text
	.align	2
	.global	populate_lookup_table
	.type	populate_lookup_table, %function
populate_lookup_table:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, fp, lr}
	add	fp, sp, #20
	sub	sp, sp, #8
	mov	r3, #0
	str	r3, [fp, #-24]
	b	.L2
.L3:
	ldr	r7, [fp, #-24]
	ldr	r3, [fp, #-24]
	rsb	r3, r3, #0
	mov	r0, r3
	bl	__aeabi_i2d
	mov	r3, r0
	mov	r4, r1
	mov	r0, #0
	mov	r1, #1073741824
	mov	r2, r3
	mov	r3, r4
	bl	pow
	mov	r3, r0
	mov	r4, r1
	mov	r5, #0
	mov	r6, #1069547520
	add	r6, r6, #3145728
	mov	r0, r3
	mov	r1, r4
	mov	r2, r5
	mov	r3, r6
	bl	__aeabi_dadd
	mov	r3, r0
	mov	r4, r1
	mov	r0, r3
	mov	r1, r4
	bl	log2
	mov	r3, r0
	mov	r4, r1
	mov	r0, r3
	mov	r1, r4
	bl	__aeabi_d2f
	mov	r2, r0
	ldr	r3, .L5
	str	r2, [r3, r7, asl #2]	@ float
	ldr	r3, [fp, #-24]
	add	r3, r3, #1
	str	r3, [fp, #-24]
.L2:
	ldr	r3, [fp, #-24]
	cmp	r3, #31
	ble	.L3
	sub	sp, fp, #20
	ldmfd	sp!, {r4, r5, r6, r7, fp, lr}
	bx	lr
.L6:
	.align	2
.L5:
	.word	lookup_table
	.size	populate_lookup_table, .-populate_lookup_table
	.global	__aeabi_fsub
	.align	2
	.global	ccm_log
	.type	ccm_log, %function
ccm_log:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 1, uses_anonymous_args = 0
	stmfd	sp!, {fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #24
	str	r0, [fp, #-24]
	ldr	r3, .L12	@ float
	str	r3, [fp, #-20]	@ float
	mov	r3, #0
	str	r3, [fp, #-16]
	ldr	r3, .L12	@ float
	str	r3, [fp, #-12]	@ float
	mov	r3, #0
	str	r3, [fp, #-8]
	b	.L8
.L10:
	ldr	r2, [fp, #-24]
	ldr	r3, [fp, #-8]
	mov	r2, r2, lsr r3
	ldr	r3, [fp, #-24]
	add	r3, r2, r3
	str	r3, [fp, #-16]
	ldr	r2, [fp, #-8]
	ldr	r3, .L12+4
	ldr	r2, [r3, r2, asl #2]	@ float
	ldr	r3, [fp, #-20]	@ float
	mov	r0, r3
	mov	r1, r2
	bl	__aeabi_fsub
	mov	r3, r0
	str	r3, [fp, #-12]	@ float
	ldr	r3, [fp, #-16]
	cmp	r3, #1073741824
	bhi	.L9
	ldr	r3, [fp, #-16]
	str	r3, [fp, #-24]
	ldr	r3, [fp, #-12]	@ float
	str	r3, [fp, #-20]	@ float
.L9:
	ldr	r3, [fp, #-8]
	add	r3, r3, #1
	str	r3, [fp, #-8]
.L8:
	ldr	r3, [fp, #-8]
	cmp	r3, #31
	ble	.L10
	ldr	r3, [fp, #-20]	@ float
	mov	r0, r3
	sub	sp, fp, #4
	ldmfd	sp!, {fp, lr}
	bx	lr
.L13:
	.align	2
.L12:
	.word	0
	.word	lookup_table
	.size	ccm_log, .-ccm_log
	.comm	lookup_table,128,4
	.ident	"GCC: (Sourcery G++ Lite 2008q3-72) 4.3.2"
	.section	.note.GNU-stack,"",%progbits

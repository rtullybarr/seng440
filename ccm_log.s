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
	.file	"ccm_log.c"
	.text
	.align	2
	.global	ccm_log
	.type	ccm_log, %function
ccm_log:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	str	r4, [sp, #-4]!
	ldr	r4, .L8
	ldr	r3, [r4, #0]
	mov	ip, #0
	rsb	r3, r3, #0
	mov	r1, r0, asl #1
	mov	r2, ip
	b	.L4
.L7:
	add	r1, r0, r0, lsr r2
.L4:
	cmp	r1, #1073741824
	add	r2, r2, #1
	movls	ip, r3
	ldr	r3, [r4, r2, asl #2]
	movls	r0, r1
	cmp	r2, #31
	rsb	r3, r3, ip
	bne	.L7
	mov	r0, ip
	ldmfd	sp!, {r4}
	bx	lr
.L9:
	.align	2
.L8:
	.word	lookup_table
	.size	ccm_log, .-ccm_log
	.global	__aeabi_i2d
	.global	__aeabi_dadd
	.global	__aeabi_d2f
	.global	__aeabi_fmul
	.global	__aeabi_f2iz
	.align	2
	.global	populate_lookup_table
	.type	populate_lookup_table, %function
populate_lookup_table:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, lr}
	mov	r4, #0
	ldr	r6, .L14
	mov	r5, r4
.L11:
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
	bne	.L11
	ldmfd	sp!, {r4, r5, r6, lr}
	bx	lr
.L15:
	.align	2
.L14:
	.word	lookup_table
	.size	populate_lookup_table, .-populate_lookup_table
	.comm	lookup_table,124,4
	.ident	"GCC: (Sourcery G++ Lite 2008q3-72) 4.3.2"
	.section	.note.GNU-stack,"",%progbits

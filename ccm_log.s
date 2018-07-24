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
	str	r4, [sp, #-4]!  @ preserve r4
	ldr	r4, .L8			@ location of LUT
	ldr	r3, [r4, #0]    @ first element of LUT to r3 (r3 = theta)
	mov	ip, #0			@ move 0 to scratch register (f = 0)
	rsb	r3, r3, #0		@ r3 = -r3 					(theta = f(==0) - LUT[0])
	mov	r1, r0, asl #1  @ r1 = r0 << 1 				(u = M + M -> line24)
	mov	r2, ip			@ r2 = 0 					(i = 0)
	b	.L4				@ branch to L4              (go to for loop)
.L7:
	add	r1, r0, r0, lsr r2 @ r1 = r0 + (r0 >> r2) 	(u = M + (M >> i))
.L4:
	cmp	r1, #1073741824 @ u <= SCALE_FACTOR?
	add	r2, r2, #1		@ increase counter  		(i = i+1)
	movls	ip, r3		@ ip = r3 if r1 <= SF       (f = theta if u <=SCALE_FACTOR)
	ldr	r3, [r4, r2, asl #2] @ r3 = next LUT elem   (theta = LUT[i])
	movls	r0, r1      @ r0 = r1 if r1 <= SF       (M = u if u <= SCALE_FACTOR)
	cmp	r2, #31			@ i == 32?
	rsb	r3, r3, ip		@ r3 = ip - r3				(theta = f - LUT[i])
	bne	.L7				@ if i != 31, update r1     (update u, repeat loop)   
	mov	r0, ip			@ r0 = ip					(return f)
	ldmfd	sp!, {r4}   @ load r4, return
	bx	lr				@ PC = link register
.L9:
	.align	2
.L8:					@ find location of LUT, populate
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
	stmfd	sp!, {r4, r5, r6, lr} 	@ stack all registers and return addr
	mov	r4, #0						@ r4 = 0 (&LUT = 0)
	ldr	r6, .L14					@ r6 = LUT properties??
	mov	r5, r4						@ r5 = 0
.L11:
	mov	r0, r4						@ r0 = 0
	bl	__aeabi_i2d					@ convert r0 uint32 -> 64 bit float
	mov	r2, r0						@ r2 = float(0)
	mov	r3, r1						@ r3 = r1 (r1 = ??)
	mov	r0, #0						@ 
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

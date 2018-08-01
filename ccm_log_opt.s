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
	ldr	r6, .L10+8
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
	bne	.L2					@ *** CCM_LOG BEGINS ***
	ldr	r3, .L10+8     		@ r3 = &LUT
	mov	ip, #644245120 		@ ip = 644 245 120 ~= M
	ldr	r2, [r3, #0]   		@ r2 = LUT[0] --> theta = LUT[0]
	mov	r1, #0				@ r1 = 0 --> r1 = i
	rsb	r2, r2, #0			@ r2 = -LUT[0] --> theta = f(=0) - LUT[0]
	mov	r0, #0				@ r0 = 0 --> r0 = f

.L5:
    add	r3, ip, ip, lsr r1		@ u = M + (M >> i)
	cmp	r3, #1073741824 		@ SET FLAG: u < SCALE?
	add	r1, r1, #1				@ i++
	movls	ip, r3				@ M = u if u <= SCALE
	ldr	r3, [r6, r1, asl #2]	@ r3 = LUT[i]
	movls	r0, r2				@ f = theta if u <= SCALE
	cmp	r1, #31					@ SET FLAG: i == 31?
	rsb	r2, r3, r0              @ theta = f - LUT[i]
	bne	.L5						@ continue loop if i < 31
	bl	__aeabi_i2f             @ *** CCM_LOG ENDS ***
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
	.ascii	"ccm=%f, log2=%f\012\000"
	.ident	"GCC: (Sourcery G++ Lite 2008q3-72) 4.3.2"
	.section	.note.GNU-stack,"",%progbits

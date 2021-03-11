	.cpu arm7tdmi
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 1
	.eabi_attribute 30, 2
	.eabi_attribute 34, 0
	.eabi_attribute 18, 4
	.file	"myLib.c"
	.text
	.align	2
	.global	setPixel
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	setPixel, %function
setPixel:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L3
	rsb	r1, r1, r1, lsl #4
	ldr	r3, [r3]
	add	r0, r0, r1, lsl #4
	lsl	r0, r0, #1
	strh	r2, [r3, r0]	@ movhi
	bx	lr
.L4:
	.align	2
.L3:
	.word	.LANCHOR0
	.size	setPixel, .-setPixel
	.align	2
	.global	drawRect
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawRect, %function
drawRect:
	@ Function supports interworking.
	@ args = 4, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	subs	lr, r3, #0
	ldrh	ip, [sp, #8]
	ble	.L5
	ldr	r3, .L13
	rsb	r1, r1, r1, lsl #4
	add	r0, r0, r1, lsl #4
	ldr	r1, [r3]
	add	r3, r0, r2
	mov	r0, #0
	rsb	r4, r2, r2, lsl #31
	add	r1, r1, r3, lsl #1
	lsl	r4, r4, #1
.L7:
	cmp	r2, #0
	addgt	r3, r1, r4
	ble	.L10
.L8:
	strh	ip, [r3], #2	@ movhi
	cmp	r3, r1
	bne	.L8
.L10:
	add	r0, r0, #1
	cmp	lr, r0
	add	r1, r1, #480
	bne	.L7
.L5:
	pop	{r4, lr}
	bx	lr
.L14:
	.align	2
.L13:
	.word	.LANCHOR0
	.size	drawRect, .-drawRect
	.align	2
	.global	drawArrowUp
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawArrowUp, %function
drawArrowUp:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	cmp	r2, #0
	bxeq	lr
	push	{r4, r5, r6, r7, lr}
	ldr	lr, .L34
	rsb	ip, r1, r1, lsl #4
	ldr	r5, [lr]
	add	ip, r0, ip, lsl #4
	add	ip, r5, ip, lsl #1
	mov	lr, ip
	sub	r4, r2, #1
	and	r4, r4, #255
	add	r4, r4, r1
	rsb	r4, r4, r4, lsl #4
	add	r4, r0, r4, lsl #4
	add	r6, r5, #480
	add	r4, r6, r4, lsl #1
	lsl	r7, r1, #4
.L17:
	strh	r3, [lr]	@ movhi
	add	lr, lr, #480
	cmp	lr, r4
	bne	.L17
	lsrs	lr, r2, #1
	beq	.L15
	mov	r2, ip
	sub	lr, lr, #1
	and	lr, lr, #255
	sub	r4, r7, r1
	rsb	r1, lr, lr, lsl #4
	add	r0, r0, r4, lsl #4
	add	r1, lr, r1, lsl #4
	add	r1, r1, r0
	add	r4, r6, #2
	add	r4, r4, r1, lsl #1
	lsl	r1, lr, #4
.L18:
	strh	r3, [r2]	@ movhi
	add	r2, r2, #480
	add	r2, r2, #2
	cmp	r4, r2
	bne	.L18
	sub	r2, r1, lr
	rsb	lr, lr, r2, lsl #4
	add	r5, r5, #476
	add	r0, lr, r0
	add	r5, r5, #2
	add	r5, r5, r0, lsl #1
.L19:
	strh	r3, [ip]	@ movhi
	add	ip, ip, #476
	add	ip, ip, #2
	cmp	r5, ip
	bne	.L19
.L15:
	pop	{r4, r5, r6, r7, lr}
	bx	lr
.L35:
	.align	2
.L34:
	.word	.LANCHOR0
	.size	drawArrowUp, .-drawArrowUp
	.align	2
	.global	drawArrowDown
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawArrowDown, %function
drawArrowDown:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, lr}
	subs	r5, r2, #0
	beq	.L36
	ldr	r2, .L52
	sub	r4, r5, #1
	and	r4, r4, #255
	ldr	ip, [r2]
	add	r4, r4, r1
	rsb	r4, r4, r4, lsl #4
	rsb	lr, r1, r1, lsl #4
	add	r4, r0, r4, lsl #4
	add	r2, ip, #480
	add	lr, r0, lr, lsl #4
	add	r4, r2, r4, lsl #1
	add	lr, ip, lr, lsl #1
	lsl	r6, r1, #4
.L38:
	strh	r3, [lr]	@ movhi
	add	lr, lr, #480
	cmp	lr, r4
	bne	.L38
	lsrs	lr, r5, #1
	beq	.L36
	sub	lr, lr, #1
	and	lr, lr, #255
	sub	r6, r6, r1
	add	r5, ip, #4288
	add	r2, r1, #10
	rsb	r4, lr, lr, lsl #4
	add	r5, r5, #34
	add	r6, r0, r6, lsl #4
	rsb	r2, r2, r2, lsl #4
	rsb	r7, lr, r4, lsl #4
	add	r2, r0, r2, lsl #4
	add	r4, r5, r6, lsl #1
	sub	r4, r4, r7, lsl #1
	add	r2, ip, r2, lsl #1
	lsl	r5, lr, #4
.L39:
	strh	r3, [r2]	@ movhi
	sub	r2, r2, #476
	sub	r2, r2, #2
	cmp	r2, r4
	bne	.L39
	sub	r2, r5, lr
	add	r1, r1, #5
	add	lr, lr, r2, lsl #4
	rsb	r1, r1, r1, lsl #4
	sub	r0, r0, #5
	add	r4, ip, #2864
	add	lr, lr, r6
	add	r1, r0, r1, lsl #4
	add	r4, r4, #8
	add	r2, ip, r1, lsl #1
	add	lr, r4, lr, lsl #1
.L40:
	strh	r3, [r2]	@ movhi
	add	r2, r2, #480
	add	r2, r2, #2
	cmp	lr, r2
	bne	.L40
.L36:
	pop	{r4, r5, r6, r7, lr}
	bx	lr
.L53:
	.align	2
.L52:
	.word	.LANCHOR0
	.size	drawArrowDown, .-drawArrowDown
	.align	2
	.global	drawArrowRight
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawArrowRight, %function
drawArrowRight:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, lr}
	subs	r5, r2, #0
	beq	.L54
	ldr	r2, .L70
	rsb	ip, r1, r1, lsl #4
	ldr	r2, [r2]
	sub	r7, r5, #1
	add	lr, r0, ip, lsl #4
	and	r7, r7, #255
	add	r7, lr, r7
	add	r4, r2, #2
	lsl	r6, ip, #4
	add	r4, r4, r7, lsl #1
	add	lr, r2, lr, lsl #1
	lsl	ip, r1, #4
.L56:
	strh	r3, [lr], #2	@ movhi
	cmp	lr, r4
	bne	.L56
	lsrs	lr, r5, #1
	beq	.L54
	sub	lr, lr, #1
	and	lr, lr, #255
	sub	r5, ip, r1
	rsb	r7, lr, lr, lsl #4
	add	r5, r0, r5, lsl #4
	rsb	r7, lr, r7, lsl #4
	add	r4, r2, #496
	add	ip, r0, #10
	add	ip, ip, r6
	add	r7, r7, r5
	add	r4, r4, #2
	add	r4, r4, r7, lsl #1
	lsl	r6, lr, #4
	add	ip, r2, ip, lsl #1
.L57:
	strh	r3, [ip]	@ movhi
	add	ip, ip, #476
	add	ip, ip, #2
	cmp	ip, r4
	bne	.L57
	sub	r1, r1, #5
	sub	r4, r6, lr
	rsb	ip, r1, r1, lsl #4
	add	lr, lr, r4, lsl #4
	sub	r1, r2, #1904
	add	r0, r0, #5
	add	lr, lr, r5
	add	ip, r0, ip, lsl #4
	sub	r1, r1, #4
	add	r2, r2, ip, lsl #1
	add	lr, r1, lr, lsl #1
.L58:
	strh	r3, [r2]	@ movhi
	add	r2, r2, #480
	add	r2, r2, #2
	cmp	lr, r2
	bne	.L58
.L54:
	pop	{r4, r5, r6, r7, lr}
	bx	lr
.L71:
	.align	2
.L70:
	.word	.LANCHOR0
	.size	drawArrowRight, .-drawArrowRight
	.align	2
	.global	drawArrowLeft
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawArrowLeft, %function
drawArrowLeft:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	subs	r5, r2, #0
	beq	.L72
	ldr	r2, .L88
	rsb	r4, r1, r1, lsl #4
	ldr	r2, [r2]
	add	r4, r0, r4, lsl #4
	add	ip, r2, r4, lsl #1
	mov	lr, ip
	sub	r6, r5, #1
	and	r6, r6, #255
	add	r6, r4, r6
	add	r4, r2, #2
	add	r4, r4, r6, lsl #1
	lsl	r6, r1, #4
.L74:
	strh	r3, [lr], #2	@ movhi
	cmp	lr, r4
	bne	.L74
	lsrs	lr, r5, #1
	beq	.L72
	sub	lr, lr, #1
	and	lr, lr, #255
	sub	r5, r6, r1
	rsb	r6, lr, lr, lsl #4
	add	r5, r0, r5, lsl #4
	add	r6, lr, r6, lsl #4
	add	r4, r2, #480
	add	r6, r6, r5
	add	r4, r4, #2
	add	r4, r4, r6, lsl #1
	lsl	r6, lr, #4
.L75:
	strh	r3, [ip]	@ movhi
	add	ip, ip, #480
	add	ip, ip, #2
	cmp	ip, r4
	bne	.L75
	sub	r1, r1, #5
	sub	r4, r6, lr
	rsb	ip, r1, r1, lsl #4
	rsb	lr, lr, r4, lsl #4
	sub	r1, r2, #1904
	add	r0, r0, #5
	add	lr, lr, r5
	add	ip, r0, ip, lsl #4
	sub	r1, r1, #8
	add	r2, r2, ip, lsl #1
	add	lr, r1, lr, lsl #1
.L76:
	strh	r3, [r2]	@ movhi
	add	r2, r2, #476
	add	r2, r2, #2
	cmp	lr, r2
	bne	.L76
.L72:
	pop	{r4, r5, r6, lr}
	bx	lr
.L89:
	.align	2
.L88:
	.word	.LANCHOR0
	.size	drawArrowLeft, .-drawArrowLeft
	.align	2
	.global	fillScreen
	.syntax unified
	.arm
	.fpu softvfp
	.type	fillScreen, %function
fillScreen:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L94
	ldr	r3, [r3]
	add	r2, r3, #76800
.L91:
	strh	r0, [r3], #2	@ movhi
	cmp	r3, r2
	bne	.L91
	bx	lr
.L95:
	.align	2
.L94:
	.word	.LANCHOR0
	.size	fillScreen, .-fillScreen
	.align	2
	.global	waitForVBlank
	.syntax unified
	.arm
	.fpu softvfp
	.type	waitForVBlank, %function
waitForVBlank:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r2, #67108864
.L97:
	ldrh	r3, [r2, #6]
	cmp	r3, #160
	bhi	.L97
	mov	r2, #67108864
.L98:
	ldrh	r3, [r2, #6]
	cmp	r3, #159
	bls	.L98
	bx	lr
	.size	waitForVBlank, .-waitForVBlank
	.align	2
	.global	collision
	.syntax unified
	.arm
	.fpu softvfp
	.type	collision, %function
collision:
	@ Function supports interworking.
	@ args = 16, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	ip, [sp, #4]
	add	r3, r1, r3
	cmp	r3, ip
	blt	.L106
	ldr	r3, [sp, #12]
	add	ip, ip, r3
	cmp	ip, r1
	blt	.L106
	ldr	r3, [sp]
	add	r2, r0, r2
	cmp	r2, r3
	blt	.L106
	ldr	r2, [sp, #8]
	add	r3, r3, r2
	cmp	r3, r0
	movlt	r0, #0
	movge	r0, #1
	bx	lr
.L106:
	mov	r0, #0
	bx	lr
	.size	collision, .-collision
	.global	videoBuffer
	.data
	.align	2
	.set	.LANCHOR0,. + 0
	.type	videoBuffer, %object
	.size	videoBuffer, 4
videoBuffer:
	.word	100663296
	.ident	"GCC: (devkitARM release 53) 9.1.0"

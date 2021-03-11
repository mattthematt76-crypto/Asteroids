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
	.file	"game.c"
	.text
	.align	2
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateBullet.part.0, %function
updateBullet.part.0:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r2, [r0, #4]
	cmp	r2, #0
	ldr	r3, [r0, #40]
	ble	.L2
	cmp	r3, #1
	beq	.L19
.L3:
	ldr	r1, [r0]
	cmp	r3, #3
	movne	ip, #0
	moveq	ip, #1
	cmp	r1, #0
	movle	ip, #0
	cmp	ip, #0
	bne	.L20
	cmp	r3, #3
	beq	.L6
	cmp	r2, #239
	cmple	r3, #2
	beq	.L21
	cmp	r3, #2
	beq	.L6
	cmp	r1, #159
	cmple	r3, #4
	beq	.L22
	cmp	r3, #4
	bxne	lr
.L6:
	mov	r3, #0
	str	r3, [r0, #32]
	bx	lr
.L19:
	sub	r2, r2, #1
	str	r2, [r0, #4]
	bx	lr
.L2:
	cmp	r3, #1
	beq	.L6
	b	.L3
.L20:
	sub	r1, r1, #1
	str	r1, [r0]
	bx	lr
.L21:
	add	r2, r2, #1
	str	r2, [r0, #4]
	bx	lr
.L22:
	add	r1, r1, #1
	str	r1, [r0]
	bx	lr
	.size	updateBullet.part.0, .-updateBullet.part.0
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateBall.part.0, %function
updateBall.part.0:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	ip, [r0]
	cmp	ip, #0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	ldr	r2, [r0, #16]
	ble	.L24
	ldr	r3, [r0, #24]
	add	r3, ip, r3
	cmp	r3, #159
	bgt	.L24
.L25:
	ldr	r3, [r0, #4]
	cmp	r3, #0
	ldr	r1, [r0, #20]
	ble	.L26
	ldr	lr, [r0, #28]
	add	lr, r3, lr
	cmp	lr, #239
	bgt	.L26
.L27:
	mov	lr, #0
	mov	r6, #1
	mov	r5, lr
	ldr	r4, .L47
	add	r2, ip, r2
	add	r1, r3, r1
	ldr	r3, .L47+4
	str	r2, [r0]
	str	r1, [r0, #4]
	ldr	r7, [r4]
	add	ip, r3, #220
.L34:
	ldr	r1, [r3, #32]
	cmp	r1, #1
	beq	.L44
.L28:
	add	r3, r3, #44
	cmp	r3, ip
	bne	.L34
	ldr	r1, .L47+8
	cmp	lr, #0
	ldr	ip, [r1, #32]
	ldr	lr, [r1]
	add	r3, lr, ip
	sub	r3, r3, #1
	strne	r7, [r4]
	cmp	r3, r2
	ble	.L23
	ldr	r3, [r0, #24]
	add	r2, r2, r3
	sub	r2, r2, #1
	cmp	lr, r2
	bge	.L23
	ldr	r2, [r1, #4]
	ldr	r3, [r0, #4]
	add	ip, ip, r2
	sub	ip, ip, #1
	cmp	ip, r3
	ble	.L23
	ldr	r1, [r0, #28]
	add	r3, r3, r1
	sub	r3, r3, #1
	cmp	r2, r3
	movlt	r2, #0
	ldrlt	r3, .L47+12
	strlt	r2, [r3]
.L23:
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L26:
	rsb	r1, r1, #0
	str	r1, [r0, #20]
	b	.L27
.L24:
	rsb	r2, r2, #0
	str	r2, [r0, #16]
	b	.L25
.L44:
	ldr	r8, [r3]
	ldr	r1, [r3, #20]
	add	r1, r8, r1
	sub	r1, r1, #1
	cmp	r1, r2
	ble	.L28
	ldr	r1, [r0, #24]
	add	r1, r2, r1
	sub	r1, r1, #1
	cmp	r8, r1
	bge	.L28
	ldr	r9, [r3, #4]
	ldr	r1, [r3, #24]
	ldr	r8, [r0, #4]
	add	r1, r9, r1
	sub	r1, r1, #1
	cmp	r1, r8
	ble	.L28
	ldr	r1, [r0, #28]
	add	r8, r8, r1
	sub	r8, r8, #1
	cmp	r9, r8
	bge	.L28
	ldr	r1, .L47+16
	str	r5, [r3, #32]
	mov	r2, #0
	mov	r8, r1
	mov	lr, r1
	str	r5, [r0, #36]
	b	.L31
.L29:
	add	r2, r2, #1
	cmp	r2, #20
	add	lr, lr, #48
	beq	.L45
.L31:
	ldr	r9, [lr, #36]
	cmp	r9, #0
	bne	.L29
	add	r2, r2, r2, lsl #1
	add	lr, r8, r2, lsl #4
	ldr	r10, [r0, #12]
	ldr	fp, [r0, #8]
	ldr	r9, [lr, #44]
	add	r10, r10, #10
	add	fp, fp, #6
	add	r9, r9, #1
	str	fp, [r8, r2, lsl #4]
	str	r10, [lr, #4]
	str	r6, [lr, #36]
	str	r9, [lr, #44]
.L30:
	mov	r2, #0
	b	.L33
.L32:
	add	r2, r2, #1
	cmp	r2, #20
	add	r1, r1, #48
	beq	.L46
.L33:
	ldr	lr, [r1, #36]
	cmp	lr, #0
	bne	.L32
	ldr	lr, [r0, #8]
	ldr	r1, [r0, #12]
	add	r2, r2, r2, lsl #1
	sub	lr, lr, #4
	str	lr, [r8, r2, lsl #4]
	sub	r1, r1, #10
	add	r2, r8, r2, lsl #4
	str	r6, [r2, #36]
	str	r1, [r2, #4]
	mov	lr, #1
	ldr	r2, [r0]
	add	r7, r7, #1
	b	.L28
.L45:
	sub	r7, r7, #1
	b	.L30
.L46:
	mov	lr, #1
	ldr	r2, [r0]
	b	.L28
.L48:
	.align	2
.L47:
	.word	ballsRemaining
	.word	bullets
	.word	player
	.word	playerRemaining
	.word	tinyBalls
	.size	updateBall.part.0, .-updateBall.part.0
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateTinyBall.part.0, %function
updateTinyBall.part.0:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, lr}
	mov	r5, r0
	ldr	r0, [r0]
	cmp	r0, #0
	ldr	r1, [r5, #16]
	sub	sp, sp, #12
	ble	.L50
	ldr	r3, [r5, #24]
	add	r3, r0, r3
	cmp	r3, #159
	bgt	.L50
.L51:
	ldr	r3, [r5, #4]
	cmp	r3, #0
	ldr	r2, [r5, #20]
	ble	.L52
	ldr	ip, [r5, #28]
	add	ip, r3, ip
	cmp	ip, #239
	bgt	.L52
.L53:
	mov	r7, #0
	ldr	ip, [r5, #44]
	tst	ip, #1
	addeq	r1, r0, r1
	addeq	r3, r3, r2
	subne	r1, r0, r1
	subne	r3, r3, r2
	ldr	r4, .L62
	stm	r5, {r1, r3}
	ldr	r9, .L62+4
	ldr	r8, .L62+8
	add	r6, r4, #220
.L57:
	ldr	r3, [r4, #32]
	cmp	r3, #1
	beq	.L61
.L56:
	add	r4, r4, #44
	cmp	r6, r4
	bne	.L57
	ldr	r2, .L62+12
	ldr	ip, [r2]
	ldr	r0, [r2, #32]
	add	r3, ip, r0
	sub	r3, r3, #1
	cmp	r3, r1
	ble	.L49
	ldr	r3, [r5, #24]
	add	r1, r1, r3
	sub	r1, r1, #1
	cmp	ip, r1
	bge	.L49
	ldr	r2, [r2, #4]
	ldr	r3, [r5, #4]
	add	r0, r0, r2
	sub	r0, r0, #1
	cmp	r0, r3
	ble	.L49
	ldr	r1, [r5, #28]
	add	r3, r3, r1
	sub	r3, r3, #1
	cmp	r2, r3
	movlt	r2, #0
	ldrlt	r3, .L62+16
	strlt	r2, [r3]
.L49:
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, lr}
	bx	lr
.L52:
	rsb	r2, r2, #0
	str	r2, [r5, #20]
	b	.L53
.L50:
	rsb	r1, r1, #0
	str	r1, [r5, #16]
	b	.L51
.L61:
	ldr	r2, [r4]
	ldr	r3, [r4, #20]
	add	r3, r2, r3
	sub	r3, r3, #1
	cmp	r3, r1
	ble	.L56
	ldr	r3, [r5, #24]
	add	r0, r3, r1
	sub	r0, r0, #1
	cmp	r2, r0
	bge	.L56
	ldr	ip, [r4, #4]
	ldr	r2, [r4, #24]
	ldr	r0, [r5, #4]
	add	r2, ip, r2
	sub	r2, r2, #1
	cmp	r2, r0
	ble	.L56
	ldr	r2, [r5, #28]
	add	r0, r0, r2
	sub	r0, r0, #1
	cmp	ip, r0
	bge	.L56
	str	r7, [sp]
	ldr	r1, [r5, #8]
	ldr	r0, [r5, #12]
	mov	lr, pc
	bx	r9
	ldr	r3, [r8]
	str	r7, [r4, #32]
	sub	r3, r3, #1
	str	r7, [r5, #36]
	str	r3, [r8]
	ldr	r1, [r5]
	b	.L56
.L63:
	.align	2
.L62:
	.word	bullets
	.word	drawRect
	.word	ballsRemaining
	.word	player
	.word	playerRemaining
	.size	updateTinyBall.part.0, .-updateTinyBall.part.0
	.align	2
	.global	initPlayer
	.syntax unified
	.arm
	.fpu softvfp
	.type	initPlayer, %function
initPlayer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, lr}
	mov	ip, #140
	mov	r5, #5
	mvn	r4, #49664
	mov	lr, #20
	mov	r0, #118
	mov	r1, #1
	mov	r2, #10
	ldr	r3, .L66
	str	r5, [r3, #28]
	strh	r4, [r3, #36]	@ movhi
	str	lr, [r3, #40]
	str	ip, [r3]
	str	ip, [r3, #8]
	str	r0, [r3, #4]
	str	r0, [r3, #12]
	str	r1, [r3, #16]
	str	r1, [r3, #20]
	str	r2, [r3, #24]
	str	r2, [r3, #32]
	pop	{r4, r5, lr}
	bx	lr
.L67:
	.align	2
.L66:
	.word	player
	.size	initPlayer, .-initPlayer
	.align	2
	.global	drawPlayer
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawPlayer, %function
drawPlayer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	ldr	r5, .L87
	ldr	r2, [r5]
	cmp	r2, #1
	ldr	r4, .L87+4
	beq	.L80
	cmp	r2, #2
	beq	.L81
	cmp	r2, #0
	cmpne	r2, #3
	moveq	r3, #1
	movne	r3, #0
	beq	.L82
	cmp	r2, #4
	beq	.L78
.L70:
	ldr	r3, [r5, #4]
	cmp	r3, #1
	ldr	r0, [r4, #4]
	ldr	r1, [r4]
	beq	.L83
	cmp	r3, #2
	beq	.L84
	cmp	r3, #0
	cmpne	r3, #3
	beq	.L85
	cmp	r3, #4
	beq	.L86
.L74:
	str	r3, [r5]
	str	r1, [r4, #8]
	str	r0, [r4, #12]
	pop	{r4, r5, r6, lr}
	bx	lr
.L82:
	mov	r3, #0
	mov	r2, #10
	ldr	r1, [r4, #8]
	ldr	r0, [r4, #12]
	ldr	r6, .L87+8
	mov	lr, pc
	bx	r6
	b	.L70
.L85:
	ldrh	r3, [r4, #36]
	mov	r2, #10
	ldr	r6, .L87+8
	mov	lr, pc
	bx	r6
	ldr	r3, [r5, #4]
	ldr	r1, [r4]
	ldr	r0, [r4, #4]
	b	.L74
.L83:
	ldrh	r3, [r4, #36]
	mov	r2, #10
	ldr	r6, .L87+12
	mov	lr, pc
	bx	r6
	ldr	r3, [r5, #4]
	ldr	r1, [r4]
	ldr	r0, [r4, #4]
	b	.L74
.L80:
	mov	r3, #0
	mov	r2, #10
	ldr	r1, [r4, #8]
	ldr	r0, [r4, #12]
	ldr	r6, .L87+12
	mov	lr, pc
	bx	r6
	b	.L70
.L84:
	ldrh	r3, [r4, #36]
	mov	r2, #10
	ldr	r6, .L87+16
	mov	lr, pc
	bx	r6
	ldr	r3, [r5, #4]
	ldr	r1, [r4]
	ldr	r0, [r4, #4]
	b	.L74
.L81:
	mov	r3, #0
	mov	r2, #10
	ldr	r1, [r4, #8]
	ldr	r0, [r4, #12]
	ldr	r6, .L87+16
	mov	lr, pc
	bx	r6
	b	.L70
.L78:
	mov	r2, #10
	ldr	r1, [r4, #8]
	ldr	r0, [r4, #12]
	ldr	r6, .L87+20
	mov	lr, pc
	bx	r6
	b	.L70
.L86:
	ldrh	r3, [r4, #36]
	mov	r2, #10
	ldr	r6, .L87+20
	mov	lr, pc
	bx	r6
	ldr	r3, [r5, #4]
	ldr	r1, [r4]
	ldr	r0, [r4, #4]
	b	.L74
.L88:
	.align	2
.L87:
	.word	.LANCHOR0
	.word	player
	.word	drawArrowUp
	.word	drawArrowLeft
	.word	drawArrowRight
	.word	drawArrowDown
	.size	drawPlayer, .-drawPlayer
	.align	2
	.global	initBullets
	.syntax unified
	.arm
	.fpu softvfp
	.type	initBullets, %function
initBullets:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r0, .L93
	push	{r4, r5, r6, r7, r8, lr}
	mov	r3, r0
	mov	r8, #2
	mov	r7, #1
	mov	r1, #0
	mvn	r6, #1
	mvn	r5, #32768
	ldr	r2, .L93+4
	add	r4, r2, #8
	ldm	r4, {r4, lr}
	add	ip, r0, #220
.L90:
	str	r8, [r3, #20]
	str	r7, [r3, #24]
	ldr	r2, [r0, #20]
	rsb	r2, r2, #0
	str	r2, [r3]
	str	r6, [r3, #16]
	strh	r5, [r3, #28]	@ movhi
	str	r1, [r3, #32]
	str	r1, [r3, #40]
	stmib	r3, {r1, r4, lr}
	add	r3, r3, #44
	cmp	r3, ip
	bne	.L90
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L94:
	.align	2
.L93:
	.word	bullets
	.word	player
	.size	initBullets, .-initBullets
	.align	2
	.global	fireBullet
	.syntax unified
	.arm
	.fpu softvfp
	.type	fireBullet, %function
fireBullet:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L108
	ldr	r1, [r3, #4]
	cmp	r1, #0
	cmpne	r1, #3
	push	{r4, r5, lr}
	ldr	lr, .L108+4
	moveq	ip, #1
	mov	r2, lr
	movne	ip, #0
	mov	r3, #0
.L101:
	ldr	r0, [r2, #32]
	cmp	r0, #0
	bne	.L96
	cmp	ip, #0
	bne	.L104
	cmp	r1, #1
	beq	.L105
	cmp	r1, #2
	beq	.L106
	cmp	r1, #4
	beq	.L107
.L96:
	add	r3, r3, #1
	cmp	r3, #5
	add	r2, r2, #44
	bne	.L101
.L95:
	pop	{r4, r5, lr}
	bx	lr
.L104:
	mov	r4, #1
	mov	ip, #3
	ldr	r1, .L108+8
	add	r2, r3, r3, lsl #2
	ldr	r5, [r1]
	add	r3, r3, r2, lsl r4
	ldr	r2, [r1, #4]
	str	r5, [lr, r3, lsl #2]
	add	lr, lr, r3, lsl #2
	str	r0, [lr, #36]
	str	r2, [lr, #4]
	str	r4, [lr, #32]
	str	ip, [lr, #40]
	b	.L95
.L105:
	ldr	r0, .L108+8
	add	r2, r3, r3, lsl #2
	ldr	r4, [r0]
	add	r2, r3, r2, lsl #1
	ldr	r0, [r0, #4]
	add	r3, lr, r2, lsl #2
	str	r4, [lr, r2, lsl #2]
	str	r1, [r3, #32]
	str	ip, [r3, #36]
	str	r1, [r3, #40]
	str	r0, [r3, #4]
	b	.L95
.L106:
	mov	r4, #1
	ldr	r0, .L108+8
	add	r2, r3, r3, lsl #2
	ldr	r5, [r0]
	add	r3, r3, r2, lsl r4
	ldr	r2, [r0, #4]
	str	r5, [lr, r3, lsl #2]
	add	lr, lr, r3, lsl #2
	str	ip, [lr, #36]
	str	r1, [lr, #40]
	str	r2, [lr, #4]
	str	r4, [lr, #32]
	b	.L95
.L107:
	mov	r0, #1
	ldr	r2, .L108+8
	add	r4, r3, r3, lsl #2
	add	r3, r3, r4, lsl r0
	ldr	r4, [r2]
	ldr	r2, [r2, #4]
	str	r4, [lr, r3, lsl #2]
	add	r3, lr, r3, lsl #2
	str	ip, [r3, #36]
	str	r1, [r3, #40]
	str	r2, [r3, #4]
	str	r0, [r3, #32]
	b	.L95
.L109:
	.align	2
.L108:
	.word	.LANCHOR0
	.word	bullets
	.word	player
	.size	fireBullet, .-fireBullet
	.align	2
	.global	updatePlayer
	.syntax unified
	.arm
	.fpu softvfp
	.type	updatePlayer, %function
updatePlayer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L124
	ldrh	r3, [r3, #48]
	tst	r3, #32
	push	{r4, lr}
	ldr	r4, .L124+4
	bne	.L111
	ldr	r3, [r4, #4]
	cmp	r3, #9
	bgt	.L123
.L111:
	ldr	r3, .L124
	ldrh	r3, [r3, #48]
	tst	r3, #16
	bne	.L112
	ldr	r3, [r4, #16]
	ldr	r2, [r4, #4]
	rsb	r1, r3, #230
	cmp	r1, r2
	movgt	r0, #2
	ldrgt	r1, .L124+8
	addgt	r3, r3, r2
	strgt	r3, [r4, #4]
	strgt	r0, [r1, #4]
.L112:
	ldr	r3, .L124
	ldrh	r3, [r3, #48]
	tst	r3, #64
	bne	.L113
	ldr	r2, [r4]
	ldr	r3, [r4, #32]
	ldr	r1, [r4, #20]
	sub	r3, r2, r3
	cmp	r3, r1
	movge	r0, #3
	ldrge	r3, .L124+8
	subge	r2, r2, r1
	strge	r2, [r4]
	strge	r0, [r3, #4]
.L113:
	ldr	r3, .L124
	ldrh	r3, [r3, #48]
	tst	r3, #128
	bne	.L114
	ldr	r2, [r4]
	ldr	r1, [r4, #20]
	ldr	r3, [r4, #32]
	rsb	r0, r1, #160
	add	r3, r2, r3
	cmp	r3, r0
	movlt	r0, #4
	ldrlt	r3, .L124+8
	addlt	r2, r2, r1
	strlt	r2, [r4]
	strlt	r0, [r3, #4]
.L114:
	ldr	r3, .L124+12
	ldrh	r3, [r3]
	tst	r3, #2
	ldr	r3, [r4, #40]
	beq	.L122
	ldr	r2, .L124+16
	ldrh	r2, [r2]
	tst	r2, #2
	beq	.L117
.L122:
	add	r3, r3, #1
.L116:
	str	r3, [r4, #40]
	pop	{r4, lr}
	bx	lr
.L117:
	cmp	r3, #19
	ble	.L122
	bl	fireBullet
	mov	r3, #1
	b	.L116
.L123:
	mov	r1, #1
	ldr	r0, [r4, #16]
	ldr	r2, .L124+8
	sub	r3, r3, r0
	str	r3, [r4, #4]
	str	r1, [r2, #4]
	b	.L111
.L125:
	.align	2
.L124:
	.word	67109120
	.word	player
	.word	.LANCHOR0
	.word	oldButtons
	.word	buttons
	.size	updatePlayer, .-updatePlayer
	.align	2
	.global	updateGame
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateGame, %function
updateGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	bl	updatePlayer
	ldr	r0, .L143
	add	r4, r0, #220
.L128:
	ldr	r3, [r0, #32]
	cmp	r3, #1
	bleq	updateBullet.part.0
.L127:
	add	r0, r0, #44
	cmp	r0, r4
	bne	.L128
	ldr	r0, .L143+4
	add	r4, r0, #240
.L130:
	ldr	r3, [r0, #36]
	cmp	r3, #0
	blne	updateBall.part.0
.L129:
	add	r0, r0, #48
	cmp	r4, r0
	bne	.L130
	ldr	r4, .L143+8
	add	r5, r4, #960
.L132:
	ldr	r3, [r4, #36]
	cmp	r3, #0
	movne	r0, r4
	blne	updateTinyBall.part.0
.L131:
	add	r4, r4, #48
	cmp	r5, r4
	bne	.L132
	pop	{r4, r5, r6, lr}
	bx	lr
.L144:
	.align	2
.L143:
	.word	bullets
	.word	balls
	.word	tinyBalls
	.size	updateGame, .-updateGame
	.align	2
	.global	updateBullet
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateBullet, %function
updateBullet:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, [r0, #32]
	cmp	r3, #1
	bxne	lr
	b	updateBullet.part.0
	.size	updateBullet, .-updateBullet
	.align	2
	.global	drawBullet
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawBullet, %function
drawBullet:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, lr}
	ldr	r3, [r0, #32]
	cmp	r3, #0
	mov	r4, r0
	sub	sp, sp, #12
	bne	.L151
	ldr	r3, [r0, #36]
	cmp	r3, #0
	beq	.L152
.L149:
	ldm	r4, {r2, r3}
	str	r2, [r4, #8]
	str	r3, [r4, #12]
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, lr}
	bx	lr
.L152:
	str	r3, [sp]
	ldr	r5, .L153
	ldr	r3, [r0, #20]
	ldr	r2, [r0, #24]
	ldr	r1, [r0, #8]
	ldr	r0, [r0, #12]
	mov	lr, pc
	bx	r5
	mov	r3, #1
	str	r3, [r4, #36]
	b	.L149
.L151:
	mov	r2, #0
	ldr	r3, [r0, #20]
	str	r2, [sp]
	ldr	r5, .L153
	ldr	r2, [r0, #24]
	ldr	r1, [r0, #8]
	ldr	r0, [r0, #12]
	mov	lr, pc
	bx	r5
	ldrh	r2, [r4, #28]
	ldr	r3, [r4, #20]
	str	r2, [sp]
	ldr	r2, [r4, #24]
	ldr	r1, [r4]
	ldr	r0, [r4, #4]
	mov	lr, pc
	bx	r5
	b	.L149
.L154:
	.align	2
.L153:
	.word	drawRect
	.size	drawBullet, .-drawBullet
	.align	2
	.global	initBalls
	.syntax unified
	.arm
	.fpu softvfp
	.type	initBalls, %function
initBalls:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, lr}
	mov	r9, #10
	ldr	r4, .L159
	ldr	r5, .L159+4
	ldr	r8, .L159+8
	ldr	r7, .L159+12
	add	r6, r4, #240
.L156:
	str	r9, [r4, #24]
	str	r9, [r4, #28]
	mov	lr, pc
	bx	r5
	smull	r3, r2, r8, r0
	asr	r3, r0, #31
	rsb	r3, r3, r2, asr #2
	rsb	r2, r3, r3, lsl #3
	rsb	r3, r3, r2, lsl #3
	sub	r0, r0, r3, lsl #1
	str	r0, [r4]
	mov	lr, pc
	bx	r5
	mov	r2, #1
	mov	r1, #0
	mov	ip, #31744
	smull	r3, lr, r7, r0
	asr	r3, r0, #31
	rsb	r3, r3, lr, asr #6
	add	r3, r3, r3, lsl #6
	sub	r0, r0, r3, lsl r2
	ldr	r3, [r4]
	add	r0, r0, #10
	str	r0, [r4, #4]
	str	r0, [r4, #12]
	str	r2, [r4, #16]
	str	r2, [r4, #20]
	str	r2, [r4, #36]
	strh	ip, [r4, #32]	@ movhi
	str	r1, [r4, #40]
	str	r1, [r4, #44]
	str	r3, [r4, #8]
	add	r4, r4, #48
	cmp	r4, r6
	bne	.L156
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	bx	lr
.L160:
	.align	2
.L159:
	.word	balls
	.word	rand
	.word	156180629
	.word	2114445439
	.size	initBalls, .-initBalls
	.align	2
	.global	initTinyBalls
	.syntax unified
	.arm
	.fpu softvfp
	.type	initTinyBalls, %function
initTinyBalls:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, lr}
	mov	r9, #5
	ldr	r4, .L165
	ldr	r5, .L165+4
	ldr	r8, .L165+8
	ldr	r7, .L165+12
	add	r6, r4, #960
.L162:
	str	r9, [r4, #24]
	str	r9, [r4, #28]
	mov	lr, pc
	bx	r5
	smull	r3, r2, r8, r0
	asr	r3, r0, #31
	rsb	r3, r3, r2, asr #2
	rsb	r2, r3, r3, lsl #3
	rsb	r3, r3, r2, lsl #3
	sub	r0, r0, r3, lsl #1
	str	r0, [r4]
	mov	lr, pc
	bx	r5
	mov	ip, #31
	mov	r1, #1
	mov	r2, #0
	smull	r3, lr, r7, r0
	asr	r3, r0, ip
	rsb	r3, r3, lr, asr #6
	add	r3, r3, r3, lsl #6
	sub	r0, r0, r3, lsl r1
	ldr	r3, [r4]
	add	r0, r0, #10
	str	r0, [r4, #4]
	str	r0, [r4, #12]
	str	r1, [r4, #16]
	str	r1, [r4, #20]
	strh	ip, [r4, #32]	@ movhi
	str	r2, [r4, #36]
	str	r2, [r4, #40]
	str	r2, [r4, #44]
	str	r3, [r4, #8]
	add	r4, r4, #48
	cmp	r4, r6
	bne	.L162
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	bx	lr
.L166:
	.align	2
.L165:
	.word	tinyBalls
	.word	rand
	.word	156180629
	.word	2114445439
	.size	initTinyBalls, .-initTinyBalls
	.align	2
	.global	initGame
	.syntax unified
	.arm
	.fpu softvfp
	.type	initGame, %function
initGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	mov	r2, #10
	mov	r0, #140
	mvn	lr, #49664
	mov	r1, #118
	mov	ip, #20
	mov	r4, #1
	mov	r5, #5
	ldr	r3, .L169
	strh	lr, [r3, #36]	@ movhi
	str	r4, [r3, #16]
	str	r4, [r3, #20]
	str	r2, [r3, #24]
	str	r2, [r3, #32]
	str	r5, [r3, #28]
	str	r0, [r3]
	str	r0, [r3, #8]
	str	ip, [r3, #40]
	str	r1, [r3, #4]
	str	r1, [r3, #12]
	bl	initBullets
	bl	initBalls
	bl	initTinyBalls
	ldr	r2, .L169+4
	ldr	r3, .L169+8
	str	r4, [r2]
	str	r5, [r3]
	pop	{r4, r5, r6, lr}
	bx	lr
.L170:
	.align	2
.L169:
	.word	player
	.word	playerRemaining
	.word	ballsRemaining
	.size	initGame, .-initGame
	.align	2
	.global	updateBall
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateBall, %function
updateBall:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, [r0, #36]
	cmp	r3, #0
	bxeq	lr
	b	updateBall.part.0
	.size	updateBall, .-updateBall
	.align	2
	.global	updateTinyBall
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateTinyBall, %function
updateTinyBall:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, [r0, #36]
	cmp	r3, #0
	bxeq	lr
	b	updateTinyBall.part.0
	.size	updateTinyBall, .-updateTinyBall
	.align	2
	.global	drawBall
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawBall, %function
drawBall:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, lr}
	ldr	r3, [r0, #36]
	cmp	r3, #0
	mov	r4, r0
	sub	sp, sp, #12
	bne	.L179
	ldr	r3, [r0, #40]
	cmp	r3, #0
	beq	.L180
.L177:
	ldm	r4, {r2, r3}
	str	r2, [r4, #8]
	str	r3, [r4, #12]
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, lr}
	bx	lr
.L180:
	str	r3, [sp]
	ldr	r5, .L181
	ldr	r3, [r0, #24]
	ldr	r2, [r0, #28]
	ldr	r1, [r0, #8]
	ldr	r0, [r0, #12]
	mov	lr, pc
	bx	r5
	mov	r3, #1
	str	r3, [r4, #40]
	b	.L177
.L179:
	mov	r2, #0
	ldr	r3, [r0, #24]
	str	r2, [sp]
	ldr	r5, .L181
	ldr	r2, [r0, #28]
	ldr	r1, [r0, #8]
	ldr	r0, [r0, #12]
	mov	lr, pc
	bx	r5
	ldrh	r2, [r4, #32]
	ldr	r3, [r4, #24]
	str	r2, [sp]
	ldr	r2, [r4, #28]
	ldr	r1, [r4]
	ldr	r0, [r4, #4]
	mov	lr, pc
	bx	r5
	b	.L177
.L182:
	.align	2
.L181:
	.word	drawRect
	.size	drawBall, .-drawBall
	.align	2
	.global	drawGame
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawGame, %function
drawGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	bl	drawPlayer
	ldr	r0, .L187
	bl	drawBullet
	ldr	r0, .L187+4
	bl	drawBullet
	ldr	r0, .L187+8
	bl	drawBullet
	ldr	r0, .L187+12
	bl	drawBullet
	ldr	r0, .L187+16
	bl	drawBullet
	ldr	r0, .L187+20
	bl	drawBall
	ldr	r0, .L187+24
	bl	drawBall
	ldr	r0, .L187+28
	bl	drawBall
	ldr	r0, .L187+32
	bl	drawBall
	ldr	r0, .L187+36
	bl	drawBall
	ldr	r4, .L187+40
	add	r5, r4, #960
.L184:
	mov	r0, r4
	add	r4, r4, #48
	bl	drawBall
	cmp	r4, r5
	bne	.L184
	pop	{r4, r5, r6, lr}
	bx	lr
.L188:
	.align	2
.L187:
	.word	bullets
	.word	bullets+44
	.word	bullets+88
	.word	bullets+132
	.word	bullets+176
	.word	balls
	.word	balls+48
	.word	balls+96
	.word	balls+144
	.word	balls+192
	.word	tinyBalls
	.size	drawGame, .-drawGame
	.comm	playerRemaining,4,4
	.global	prevdirection
	.global	direction
	.comm	ballsRemaining,4,4
	.comm	tinyBalls,960,4
	.comm	balls,240,4
	.comm	bullets,220,4
	.comm	player,44,4
	.bss
	.align	2
	.set	.LANCHOR0,. + 0
	.type	prevdirection, %object
	.size	prevdirection, 4
prevdirection:
	.space	4
	.type	direction, %object
	.size	direction, 4
direction:
	.space	4
	.ident	"GCC: (devkitARM release 53) 9.1.0"

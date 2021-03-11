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
	.file	"main.c"
	.text
	.align	2
	.global	initialize
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	initialize, %function
initialize:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r2, #67108864
	mov	r3, #0
	push	{r4, lr}
	ldr	r0, .L4
	ldr	ip, .L4+4
	ldr	r1, .L4+8
	strh	r0, [r2]	@ movhi
	ldr	r0, .L4+12
	ldr	r2, .L4+16
	str	r3, [ip]
	str	r3, [r1]
	mov	lr, pc
	bx	r2
	pop	{r4, lr}
	bx	lr
.L5:
	.align	2
.L4:
	.word	1027
	.word	seed
	.word	state
	.word	24319
	.word	fillScreen
	.size	initialize, .-initialize
	.align	2
	.global	goToStart
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToStart, %function
goToStart:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r3, #0
	push	{r4, lr}
	ldr	ip, .L8
	ldr	r1, .L8+4
	ldr	r0, .L8+8
	ldr	r2, .L8+12
	str	r3, [ip]
	str	r3, [r1]
	mov	lr, pc
	bx	r2
	pop	{r4, lr}
	bx	lr
.L9:
	.align	2
.L8:
	.word	seed
	.word	state
	.word	24319
	.word	fillScreen
	.size	goToStart, .-goToStart
	.align	2
	.global	goToPause
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToPause, %function
goToPause:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r1, #2
	push	{r4, lr}
	ldr	r2, .L12
	ldr	r0, .L12+4
	ldr	r3, .L12+8
	str	r1, [r2]
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	bx	lr
.L13:
	.align	2
.L12:
	.word	state
	.word	18367
	.word	fillScreen
	.size	goToPause, .-goToPause
	.align	2
	.global	goToWin
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToWin, %function
goToWin:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r1, #3
	push	{r4, lr}
	ldr	r2, .L16
	mov	r0, #992
	ldr	r3, .L16+4
	str	r1, [r2]
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	bx	lr
.L17:
	.align	2
.L16:
	.word	state
	.word	fillScreen
	.size	goToWin, .-goToWin
	.align	2
	.global	goToLose
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToLose, %function
goToLose:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r1, #4
	push	{r4, lr}
	ldr	r2, .L20
	mov	r0, #31
	ldr	r3, .L20+4
	str	r1, [r2]
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	bx	lr
.L21:
	.align	2
.L20:
	.word	state
	.word	fillScreen
	.size	goToLose, .-goToLose
	.align	2
	.global	goToGame
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToGame, %function
goToGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r1, #1
	push	{r4, lr}
	ldr	r2, .L24
	mov	r0, #0
	ldr	r3, .L24+4
	str	r1, [r2]
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	bx	lr
.L25:
	.align	2
.L24:
	.word	state
	.word	fillScreen
	.size	goToGame, .-goToGame
	.align	2
	.global	Start
	.syntax unified
	.arm
	.fpu softvfp
	.type	Start, %function
Start:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L38
	ldr	r2, .L38+4
	ldr	r0, [r3]
	ldrh	r2, [r2]
	add	r0, r0, #1
	tst	r2, #8
	push	{r4, lr}
	str	r0, [r3]
	beq	.L27
	ldr	r3, .L38+8
	ldrh	r3, [r3]
	ands	r4, r3, #8
	beq	.L36
.L27:
	tst	r2, #4
	beq	.L26
	ldr	r3, .L38+8
	ldrh	r3, [r3]
	tst	r3, #4
	beq	.L37
.L26:
	pop	{r4, lr}
	bx	lr
.L36:
	ldr	r3, .L38+12
	mov	lr, pc
	bx	r3
	ldr	r3, .L38+16
	mov	lr, pc
	bx	r3
	mov	r1, #1
	ldr	r2, .L38+20
	mov	r0, r4
	ldr	r3, .L38+24
	str	r1, [r2]
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	bx	lr
.L37:
	mov	r1, #2
	ldr	r2, .L38+20
	ldr	r0, .L38+28
	ldr	r3, .L38+24
	str	r1, [r2]
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	bx	lr
.L39:
	.align	2
.L38:
	.word	seed
	.word	oldButtons
	.word	buttons
	.word	srand
	.word	initGame
	.word	state
	.word	fillScreen
	.word	18367
	.size	Start, .-Start
	.align	2
	.global	Pause
	.syntax unified
	.arm
	.fpu softvfp
	.type	Pause, %function
Pause:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L52
	ldrh	r3, [r3]
	tst	r3, #4
	push	{r4, lr}
	beq	.L41
	ldr	r2, .L52+4
	ldrh	r2, [r2]
	ands	r2, r2, #4
	beq	.L50
.L41:
	tst	r3, #8
	beq	.L40
	ldr	r3, .L52+4
	ldrh	r0, [r3]
	ands	r0, r0, #8
	beq	.L51
.L40:
	pop	{r4, lr}
	bx	lr
.L50:
	ldr	ip, .L52+8
	ldr	r1, .L52+12
	ldr	r0, .L52+16
	ldr	r3, .L52+20
	str	r2, [ip]
	str	r2, [r1]
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	bx	lr
.L51:
	mov	r1, #1
	ldr	r2, .L52+12
	ldr	r3, .L52+20
	str	r1, [r2]
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	bx	lr
.L53:
	.align	2
.L52:
	.word	oldButtons
	.word	buttons
	.word	seed
	.word	state
	.word	24319
	.word	fillScreen
	.size	Pause, .-Pause
	.align	2
	.global	Game
	.syntax unified
	.arm
	.fpu softvfp
	.type	Game, %function
Game:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r3, .L65
	mov	lr, pc
	bx	r3
	ldr	r3, .L65+4
	mov	lr, pc
	bx	r3
	ldr	r3, .L65+8
	mov	lr, pc
	bx	r3
	ldr	r3, .L65+12
	ldr	r3, [r3]
	cmp	r3, #0
	beq	.L62
.L55:
	ldr	r3, .L65+16
	ldr	r3, [r3]
	cmp	r3, #0
	beq	.L63
.L56:
	ldr	r3, .L65+20
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L54
	ldr	r3, .L65+24
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L64
.L54:
	pop	{r4, lr}
	bx	lr
.L63:
	mov	r1, #3
	ldr	r2, .L65+28
	mov	r0, #992
	ldr	r3, .L65+32
	str	r1, [r2]
	mov	lr, pc
	bx	r3
	b	.L56
.L62:
	mov	r1, #4
	ldr	r2, .L65+28
	mov	r0, #31
	ldr	r3, .L65+32
	str	r1, [r2]
	mov	lr, pc
	bx	r3
	b	.L55
.L64:
	mov	r1, #2
	ldr	r2, .L65+28
	ldr	r0, .L65+36
	ldr	r3, .L65+32
	str	r1, [r2]
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	bx	lr
.L66:
	.align	2
.L65:
	.word	updateGame
	.word	drawGame
	.word	waitForVBlank
	.word	playerRemaining
	.word	ballsRemaining
	.word	oldButtons
	.word	buttons
	.word	state
	.word	fillScreen
	.word	18367
	.size	Game, .-Game
	.align	2
	.global	Lose
	.syntax unified
	.arm
	.fpu softvfp
	.type	Lose, %function
Lose:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L76
	ldrh	r3, [r3]
	tst	r3, #8
	bxeq	lr
	ldr	r3, .L76+4
	ldrh	r3, [r3]
	ands	r3, r3, #8
	bxne	lr
	push	{r4, lr}
	ldr	ip, .L76+8
	ldr	r1, .L76+12
	ldr	r0, .L76+16
	ldr	r2, .L76+20
	str	r3, [ip]
	str	r3, [r1]
	mov	lr, pc
	bx	r2
	pop	{r4, lr}
	bx	lr
.L77:
	.align	2
.L76:
	.word	oldButtons
	.word	buttons
	.word	seed
	.word	state
	.word	24319
	.word	fillScreen
	.size	Lose, .-Lose
	.section	.text.startup,"ax",%progbits
	.align	2
	.global	main
	.syntax unified
	.arm
	.fpu softvfp
	.type	main, %function
main:
	@ Function supports interworking.
	@ Volatile: function does not return.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r2, #67108864
	mov	r3, #0
	ldr	r0, .L89
	push	{r4, r7, fp, lr}
	ldr	r1, .L89+4
	ldr	r4, .L89+8
	strh	r0, [r2]	@ movhi
	ldr	r0, .L89+12
	ldr	r2, .L89+16
	str	r3, [r1]
	str	r3, [r4]
	mov	lr, pc
	bx	r2
	ldr	fp, .L89+20
	ldr	r6, .L89+24
	ldr	r10, .L89+28
	ldr	r9, .L89+32
	ldr	r7, .L89+36
	ldr	r8, .L89+40
	ldr	r5, .L89+44
.L79:
	ldr	r2, [r4]
	ldrh	r3, [fp]
.L80:
	strh	r3, [r6]	@ movhi
	ldrh	r3, [r5, #48]
	strh	r3, [fp]	@ movhi
	cmp	r2, #4
	ldrls	pc, [pc, r2, asl #2]
	b	.L80
.L82:
	.word	.L85
	.word	.L84
	.word	.L83
	.word	.L81
	.word	.L81
.L81:
	mov	lr, pc
	bx	r7
	b	.L79
.L83:
	mov	lr, pc
	bx	r9
	b	.L79
.L84:
	mov	lr, pc
	bx	r8
	b	.L79
.L85:
	mov	lr, pc
	bx	r10
	b	.L79
.L90:
	.align	2
.L89:
	.word	1027
	.word	seed
	.word	state
	.word	24319
	.word	fillScreen
	.word	buttons
	.word	oldButtons
	.word	Start
	.word	Pause
	.word	Lose
	.word	Game
	.word	67109120
	.size	main, .-main
	.text
	.align	2
	.global	Win
	.syntax unified
	.arm
	.fpu softvfp
	.type	Win, %function
Win:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	b	Lose
	.size	Win, .-Win
	.comm	seed,4,4
	.comm	state,4,4
	.comm	oldButtons,2,2
	.comm	buttons,2,2
	.ident	"GCC: (devkitARM release 53) 9.1.0"

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
	.file	"shrudenController.c"
	.text
	.align	2
	.global	goTosGameState
	.syntax unified
	.arm
	.fpu softvfp
	.type	goTosGameState, %function
goTosGameState:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r3, .L4
	mov	lr, pc
	bx	r3
	ldr	r3, .L4+4
	mov	lr, pc
	bx	r3
	mov	r2, #1
	ldr	r3, .L4+8
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L5:
	.align	2
.L4:
	.word	waitForVBlank
	.word	drawShruden
	.word	sstate
	.size	goTosGameState, .-goTosGameState
	.align	2
	.global	drawChar
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawChar, %function
drawChar:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, r4, r5, r6, r7, r8, r9, r10, fp, lr}
	mov	r6, r1
	mov	r9, r0
	mov	r8, r3
	ldr	ip, .L17
	add	r2, r2, r2, lsl #1
	sub	ip, ip, r1
	ldr	r7, .L17+4
	add	fp, r1, #6
	add	r10, ip, r2, lsl #4
.L7:
	add	r5, r10, r6
	mov	r4, #0
	b	.L9
.L8:
	add	r4, r4, #1
	cmp	r4, #8
	add	r5, r5, #6
	beq	.L16
.L9:
	ldrb	r3, [r5]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L8
	add	r0, r9, r4
	mov	r2, r8
	mov	r1, r6
	add	r4, r4, #1
	mov	lr, pc
	bx	r7
	cmp	r4, #8
	add	r5, r5, #6
	bne	.L9
.L16:
	add	r6, r6, #1
	cmp	r6, fp
	bne	.L7
	pop	{r3, r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L18:
	.align	2
.L17:
	.word	fontdata_6x8
	.word	setPixel
	.size	drawChar, .-drawChar
	.align	2
	.global	drawString
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawString, %function
drawString:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, lr}
	mov	r5, r2
	ldrb	r2, [r2]	@ zero_extendqisi2
	cmp	r2, #0
	beq	.L19
	mov	r6, r3
	mov	r7, r0
	mov	r4, r1
.L21:
	mov	r1, r4
	mov	r3, r6
	mov	r0, r7
	bl	drawChar
	ldrb	r2, [r5, #1]!	@ zero_extendqisi2
	cmp	r2, #0
	add	r4, r4, #6
	bne	.L21
.L19:
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
	.size	drawString, .-drawString
	.align	2
	.global	goTosStartState
	.syntax unified
	.arm
	.fpu softvfp
	.type	goTosStartState, %function
goTosStartState:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r1, #0
	push	{r4, r5, r6, r7, lr}
	ldr	r2, .L29
	ldr	r6, .L29+4
	sub	sp, sp, #12
	ldr	r4, .L29+8
	ldr	r3, .L29+12
	str	r1, [r2]
	ldr	r5, .L29+16
	mov	lr, pc
	bx	r3
	mov	r0, r6
	ldr	r3, .L29+20
	mov	lr, pc
	bx	r3
	ldr	r7, .L29+24
	str	r4, [sp]
	mov	r3, #62
	mov	r2, #16
	mov	r1, #90
	mov	r0, #54
	mov	lr, pc
	bx	r7
	mov	r2, r5
	ldr	r3, .L29+28
	mov	r1, #100
	mov	r0, #58
	bl	drawString
	mov	r3, r6
	mov	r2, r5
	mov	r1, #99
	mov	r0, #57
	bl	drawString
	mov	r3, r4
	ldr	r2, .L29+32
	mov	r1, #66
	mov	r0, #130
	bl	drawString
	mov	r3, r4
	mov	r1, #36
	mov	r0, #142
	ldr	r2, .L29+36
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, r6, r7, lr}
	b	drawString
.L30:
	.align	2
.L29:
	.word	sstate
	.word	21647
	.word	32767
	.word	waitForVBlank
	.word	.LC0
	.word	fillScreen
	.word	drawRect
	.word	32736
	.word	.LC1
	.word	.LC2
	.size	goTosStartState, .-goTosStartState
	.align	2
	.global	spauseState
	.syntax unified
	.arm
	.fpu softvfp
	.type	spauseState, %function
spauseState:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	ldr	r4, .L43
	ldrh	r3, [r4]
	tst	r3, #8
	beq	.L32
	ldr	r2, .L43+4
	ldrh	r2, [r2]
	tst	r2, #8
	beq	.L41
.L32:
	tst	r3, #4
	beq	.L31
	ldr	r3, .L43+4
	ldrh	r3, [r3]
	tst	r3, #4
	beq	.L42
.L31:
	pop	{r4, r5, r6, lr}
	bx	lr
.L42:
	pop	{r4, r5, r6, lr}
	b	goTosStartState
.L41:
	ldr	r5, .L43+8
	mov	lr, pc
	bx	r5
	ldr	r3, .L43+12
	mov	lr, pc
	bx	r3
	mov	lr, pc
	bx	r5
	ldr	r3, .L43+16
	mov	lr, pc
	bx	r3
	mov	r1, #1
	ldr	r2, .L43+20
	ldrh	r3, [r4]
	str	r1, [r2]
	b	.L32
.L44:
	.align	2
.L43:
	.word	oldButtons
	.word	buttons
	.word	waitForVBlank
	.word	drawInit
	.word	drawShruden
	.word	sstate
	.size	spauseState, .-spauseState
	.align	2
	.global	swinState
	.syntax unified
	.arm
	.fpu softvfp
	.type	swinState, %function
swinState:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r3, .L52
	mov	lr, pc
	bx	r3
	ldr	r3, .L52+4
	mov	lr, pc
	bx	r3
	ldr	r3, .L52+8
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L45
	ldr	r3, .L52+12
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L51
.L45:
	pop	{r4, lr}
	bx	lr
.L51:
	pop	{r4, lr}
	b	goTosStartState
.L53:
	.align	2
.L52:
	.word	waitForVBlank
	.word	drawWin
	.word	oldButtons
	.word	buttons
	.size	swinState, .-swinState
	.align	2
	.global	shrudenInitialize
	.syntax unified
	.arm
	.fpu softvfp
	.type	shrudenInitialize, %function
shrudenInitialize:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	b	goTosStartState
	.size	shrudenInitialize, .-shrudenInitialize
	.align	2
	.global	sloseState
	.syntax unified
	.arm
	.fpu softvfp
	.type	sloseState, %function
sloseState:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r3, .L62
	mov	lr, pc
	bx	r3
	ldr	r3, .L62+4
	mov	lr, pc
	bx	r3
	ldr	r3, .L62+8
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L55
	ldr	r3, .L62+12
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L61
.L55:
	pop	{r4, lr}
	bx	lr
.L61:
	pop	{r4, lr}
	b	goTosStartState
.L63:
	.align	2
.L62:
	.word	waitForVBlank
	.word	drawLose
	.word	oldButtons
	.word	buttons
	.size	sloseState, .-sloseState
	.align	2
	.global	goTosPauseState
	.syntax unified
	.arm
	.fpu softvfp
	.type	goTosPauseState, %function
goTosPauseState:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r1, #2
	push	{r4, r5, r6, lr}
	ldr	r2, .L66
	ldr	r4, .L66+4
	sub	sp, sp, #8
	ldr	r5, .L66+8
	ldr	r3, .L66+12
	str	r1, [r2]
	mov	lr, pc
	bx	r3
	mov	r0, r4
	ldr	r3, .L66+16
	mov	lr, pc
	bx	r3
	ldr	r6, .L66+20
	str	r5, [sp]
	mov	r3, #228
	mov	r2, #94
	mov	r1, #6
	mov	r0, #16
	mov	lr, pc
	bx	r6
	mov	r3, r4
	ldr	r2, .L66+24
	mov	r1, #9
	mov	r0, #24
	bl	drawString
	mov	r1, #60
	mov	r3, r4
	mov	r0, r1
	ldr	r2, .L66+28
	bl	drawString
	mov	r3, r4
	ldr	r2, .L66+32
	mov	r1, #42
	mov	r0, #96
	bl	drawString
	mov	r3, r5
	ldr	r2, .L66+36
	mov	r1, #54
	mov	r0, #130
	bl	drawString
	mov	r3, r5
	mov	r1, #66
	mov	r0, #142
	ldr	r2, .L66+40
	add	sp, sp, #8
	@ sp needed
	pop	{r4, r5, r6, lr}
	b	drawString
.L67:
	.align	2
.L66:
	.word	sstate
	.word	32767
	.word	21647
	.word	waitForVBlank
	.word	fillScreen
	.word	drawRect
	.word	.LC3
	.word	.LC4
	.word	.LC5
	.word	.LC6
	.word	.LC7
	.size	goTosPauseState, .-goTosPauseState
	.align	2
	.global	sstartState
	.syntax unified
	.arm
	.fpu softvfp
	.type	sstartState, %function
sstartState:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r4, .L80
	ldr	r3, .L80+4
	mov	lr, pc
	bx	r3
	ldrh	r3, [r4]
	tst	r3, #8
	beq	.L69
	ldr	r2, .L80+8
	ldrh	r2, [r2]
	tst	r2, #8
	beq	.L78
.L69:
	tst	r3, #4
	beq	.L68
	ldr	r3, .L80+8
	ldrh	r3, [r3]
	tst	r3, #4
	beq	.L79
.L68:
	pop	{r4, lr}
	bx	lr
.L79:
	pop	{r4, lr}
	b	goTosPauseState
.L78:
	ldr	r3, .L80+12
	mov	lr, pc
	bx	r3
	ldr	r3, .L80+16
	mov	lr, pc
	bx	r3
	ldr	r3, .L80+20
	mov	lr, pc
	bx	r3
	mov	r1, #1
	ldr	r2, .L80+24
	ldrh	r3, [r4]
	str	r1, [r2]
	b	.L69
.L81:
	.align	2
.L80:
	.word	oldButtons
	.word	initShruden
	.word	buttons
	.word	drawInit
	.word	waitForVBlank
	.word	drawShruden
	.word	sstate
	.size	sstartState, .-sstartState
	.align	2
	.global	goTosWinState
	.syntax unified
	.arm
	.fpu softvfp
	.type	goTosWinState, %function
goTosWinState:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r1, #3
	push	{r4, lr}
	ldr	r2, .L84
	ldr	r3, .L84+4
	str	r1, [r2]
	mov	lr, pc
	bx	r3
	ldr	r3, .L84+8
	mov	r0, #992
	mov	lr, pc
	bx	r3
	ldr	r3, .L84+12
	ldr	r2, .L84+16
	mov	r1, #88
	mov	r0, #110
	pop	{r4, lr}
	b	drawString
.L85:
	.align	2
.L84:
	.word	sstate
	.word	waitForVBlank
	.word	fillScreen
	.word	32767
	.word	.LC8
	.size	goTosWinState, .-goTosWinState
	.align	2
	.global	goTosLoseState
	.syntax unified
	.arm
	.fpu softvfp
	.type	goTosLoseState, %function
goTosLoseState:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r1, #4
	push	{r4, lr}
	ldr	r2, .L88
	ldr	r3, .L88+4
	str	r1, [r2]
	mov	lr, pc
	bx	r3
	ldr	r3, .L88+8
	mov	r0, #0
	mov	lr, pc
	bx	r3
	ldr	r3, .L88+12
	ldr	r2, .L88+16
	mov	r1, #88
	mov	r0, #110
	pop	{r4, lr}
	b	drawString
.L89:
	.align	2
.L88:
	.word	sstate
	.word	waitForVBlank
	.word	fillScreen
	.word	32767
	.word	.LC8
	.size	goTosLoseState, .-goTosLoseState
	.align	2
	.global	sgameState
	.syntax unified
	.arm
	.fpu softvfp
	.type	sgameState, %function
sgameState:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r3, .L101
	mov	lr, pc
	bx	r3
	ldr	r3, .L101+4
	mov	lr, pc
	bx	r3
	ldr	r3, .L101+8
	mov	lr, pc
	bx	r3
	ldr	r3, .L101+12
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L91
	ldr	r3, .L101+16
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L98
.L91:
	ldr	r4, .L101+20
	ldr	r3, [r4]
	cmp	r3, #0
	beq	.L99
	cmn	r3, #1
	beq	.L100
.L90:
	pop	{r4, lr}
	bx	lr
.L99:
	bl	goTosWinState
	ldr	r3, [r4]
	cmn	r3, #1
	bne	.L90
.L100:
	pop	{r4, lr}
	b	goTosLoseState
.L98:
	bl	goTosPauseState
	b	.L91
.L102:
	.align	2
.L101:
	.word	updateShruden
	.word	waitForVBlank
	.word	drawShruden
	.word	oldButtons
	.word	buttons
	.word	coinsRemaining
	.size	sgameState, .-sgameState
	.align	2
	.global	shrudenController
	.syntax unified
	.arm
	.fpu softvfp
	.type	shrudenController, %function
shrudenController:
	@ Function supports interworking.
	@ Volatile: function does not return.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r3, #67108864
	ldr	r2, .L115
	push	{r7, lr}
	strh	r2, [r3]	@ movhi
	bl	goTosStartState
	ldr	r7, .L115+4
	ldr	r4, .L115+8
	ldr	r6, .L115+12
	ldr	r5, .L115+16
.L104:
	ldr	r2, [r7]
	ldrh	r3, [r4]
.L105:
	strh	r3, [r6]	@ movhi
	ldrh	r3, [r5, #48]
	strh	r3, [r4]	@ movhi
	cmp	r2, #4
	ldrls	pc, [pc, r2, asl #2]
	b	.L105
.L107:
	.word	.L106
	.word	.L108
	.word	.L109
	.word	.L110
	.word	.L111
.L111:
	bl	sloseState
	b	.L104
.L110:
	bl	swinState
	b	.L104
.L109:
	bl	spauseState
	b	.L104
.L108:
	bl	sgameState
	b	.L104
.L106:
	bl	sstartState
	b	.L104
.L116:
	.align	2
.L115:
	.word	1027
	.word	sstate
	.word	sButtons
	.word	sOldButtons
	.word	67109120
	.size	shrudenController, .-shrudenController
	.comm	sButtons,2,2
	.comm	sOldButtons,2,2
	.comm	sstate,4,4
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	.ascii	"SHRUDEN\000"
.LC1:
	.ascii	"Press START to Play\000"
.LC2:
	.ascii	"Press SELECT for Instructions\000"
	.space	2
.LC3:
	.ascii	"Use UP, DOWN, LEFT, and RIGHT to move\000"
	.space	2
.LC4:
	.ascii	"Collect COINS to win\000"
	.space	3
.LC5:
	.ascii	"Don't let ENEMIES touch you\000"
.LC6:
	.ascii	"Press START to Continue\000"
.LC7:
	.ascii	"Press SELECT to End\000"
.LC8:
	.ascii	"Press START\000"
	.ident	"GCC: (devkitARM release 47) 7.1.0"

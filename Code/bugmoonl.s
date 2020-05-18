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
	.file	"bugmoonl.c"
	.text
	.align	2
	.global	goToBugMoon
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToBugMoon, %function
goToBugMoon:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r2, #67108864
	mov	r1, #7936
	mov	r0, #4864
	ldr	r3, .L4
	push	{r4, lr}
	ldr	r4, .L4+4
	strh	r3, [r2, #8]	@ movhi
	strh	r0, [r2]	@ movhi
	strh	r1, [r2, #10]	@ movhi
	mov	r3, #256
	mov	r2, #83886080
	ldr	r1, .L4+8
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #32
	ldr	r2, .L4+12
	ldr	r1, .L4+16
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	ldr	r2, .L4+20
	ldr	r1, .L4+24
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #384
	mov	r2, #100663296
	ldr	r1, .L4+28
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	ldr	r2, .L4+32
	ldr	r1, .L4+36
	mov	r0, #3
	mov	lr, pc
	bx	r4
	ldr	r4, .L4+40
	mov	r3, #1
	ldr	r2, .L4+44
	ldr	r1, .L4+48
	ldr	r0, .L4+52
	mov	lr, pc
	bx	r4
	pop	{r4, lr}
	bx	lr
.L5:
	.align	2
.L4:
	.word	7684
	.word	DMANow
	.word	bugMoonStarsFarPal
	.word	100679680
	.word	bugMoonStarsNearTiles
	.word	100724736
	.word	bugMoonStarsNearMap
	.word	bugMoonStarsFarTiles
	.word	100726784
	.word	bugMoonStarsFarMap
	.word	playSoundA
	.word	11025
	.word	654624
	.word	VangIsSomewhatIntenseAtTimes
	.size	goToBugMoon, .-goToBugMoon
	.align	2
	.global	initMussel
	.syntax unified
	.arm
	.fpu softvfp
	.type	initMussel, %function
initMussel:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r2, #0
	push	{r4, lr}
	mov	r0, #1
	mov	r4, #32
	mov	lr, #88
	mov	r1, #64
	mov	ip, #8
	ldr	r3, .L8
	str	r2, [r3, #8]
	str	r2, [r3, #12]
	str	r2, [r3, #32]
	str	r2, [r3, #44]
	str	r2, [r3, #48]
	str	r2, [r3, #36]
	ldr	r2, .L8+4
	str	r4, [r3, #28]
	str	lr, [r3, #4]
	str	r0, [r3, #16]
	str	r0, [r3, #20]
	str	r1, [r3, #24]
	str	r1, [r3]
	str	ip, [r2]
	pop	{r4, lr}
	bx	lr
.L9:
	.align	2
.L8:
	.word	mussel
	.word	playerHealth
	.size	initMussel, .-initMussel
	.align	2
	.global	animateMussel
	.syntax unified
	.arm
	.fpu softvfp
	.type	animateMussel, %function
animateMussel:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L26
	ldr	r1, [r3, #36]
	cmp	r1, #0
	beq	.L19
	ldr	r0, [r3, #32]
	ldr	r2, .L26+4
	push	{r4, r5}
	smull	r4, r5, r0, r2
	asr	r2, r0, #31
	rsb	r2, r2, r5, asr #1
	add	r2, r2, r2, lsl #1
	cmp	r0, r2, lsl #2
	ldr	r2, .L26+8
	ldrh	r2, [r2]
	subeq	r1, r1, #1
	streq	r1, [r3, #36]
	tst	r2, #1
	beq	.L14
	ldr	r2, .L26+12
	ldrh	r2, [r2]
	tst	r2, #1
	bne	.L14
	mov	r1, #3
	mov	r2, #1
	str	r1, [r3, #36]
	str	r2, [r3, #32]
	pop	{r4, r5}
	bx	lr
.L19:
	ldr	r2, .L26+8
	ldrh	r2, [r2]
	tst	r2, #1
	beq	.L21
	ldr	r2, .L26+12
	ldrh	r2, [r2]
	tst	r2, #1
	bne	.L21
	mov	r1, #3
	mov	r2, #1
	str	r1, [r3, #36]
	str	r2, [r3, #32]
	bx	lr
.L14:
	ldr	r2, [r3, #32]
	add	r2, r2, #1
	str	r2, [r3, #32]
	pop	{r4, r5}
	bx	lr
.L21:
	ldr	r2, [r3, #32]
	add	r2, r2, #1
	str	r2, [r3, #32]
	bx	lr
.L27:
	.align	2
.L26:
	.word	mussel
	.word	715827883
	.word	oldButtons
	.word	buttons
	.size	animateMussel, .-animateMussel
	.align	2
	.global	drawMussel
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawMussel, %function
drawMussel:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r1, .L29
	ldr	r3, [r1, #4]
	lsl	r3, r3, #23
	lsr	r3, r3, #23
	mvn	r3, r3, lsl #18
	mvn	r3, r3, lsr #18
	ldr	ip, [r1, #44]
	ldr	r2, [r1, #36]
	add	ip, ip, #8
	ldrb	r0, [r1]	@ zero_extendqisi2
	add	r2, r2, ip, lsl #2
	ldr	r1, .L29+4
	lsl	r2, r2, #3
	orr	r0, r0, #16384
	orr	r2, r2, #4096
	strh	r3, [r1, #2]	@ movhi
	strh	r0, [r1]	@ movhi
	strh	r2, [r1, #4]	@ movhi
	bx	lr
.L30:
	.align	2
.L29:
	.word	mussel
	.word	shadowOAM
	.size	drawMussel, .-drawMussel
	.align	2
	.global	drawBugMoon
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawBugMoon, %function
drawBugMoon:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, lr}
	bl	drawMussel
	ldr	r1, .L42
	mov	r6, r1
	mov	r0, r1
	ldr	r3, .L42+4
	ldr	r5, .L42+8
	add	lr, r3, #896
.L33:
	ldr	r2, [r3, #52]
	cmp	r2, #0
	bne	.L32
	ldr	ip, [r3, #44]
	ldr	r2, [r3, #36]
	add	r2, r2, ip, lsl #5
	add	r2, r2, #384
	ldr	ip, [r3, #4]
	add	r2, r2, #2
	ldrb	r4, [r3]	@ zero_extendqisi2
	orr	r2, r2, #16384
	and	ip, ip, r5
	strh	r2, [r0, #12]	@ movhi
	strh	ip, [r0, #10]	@ movhi
	strh	r4, [r0, #8]	@ movhi
.L32:
	add	r3, r3, #56
	cmp	r3, lr
	add	r0, r0, #8
	bne	.L33
	mov	r0, #0
	ldr	r3, .L42+12
	ldr	r4, .L42+16
	ldr	r5, .L42+8
.L35:
	ldr	r2, [r3, #52]
	cmp	r2, #0
	bne	.L34
	ldr	ip, [r3, #44]
	ldr	r2, [r3, #36]
	ldr	lr, [r3, #4]
	add	r2, r2, ip, lsl #4
	add	r2, r2, #195
	ldrb	r7, [r3]	@ zero_extendqisi2
	lsl	r2, r2, #1
	and	lr, lr, r5
	add	ip, r6, r0
	orr	r2, r2, #20480
	orr	r7, r7, r4
	orr	lr, lr, r4
	strh	r2, [ip, #140]	@ movhi
	strh	r7, [ip, #136]	@ movhi
	strh	lr, [ip, #138]	@ movhi
.L34:
	add	r0, r0, #8
	cmp	r0, #24
	add	r3, r3, #56
	bne	.L35
	ldr	r3, .L42+20
	ldr	r4, .L42+8
	add	ip, r3, #3584
.L37:
	ldr	r2, [r3, #52]
	cmp	r2, #0
	bne	.L36
	ldr	r2, [r3, #36]
	ldr	lr, [r3, #44]
	ldr	r0, [r3, #4]
	add	r2, r2, #416
	add	r2, r2, lr, lsl #6
	and	r0, r4, r0, asr #2
	ldrb	lr, [r3]	@ zero_extendqisi2
	orr	r2, r2, #20480
	orr	r0, r0, #16384
	strh	r2, [r1, #164]	@ movhi
	strh	r0, [r1, #162]	@ movhi
	strh	lr, [r1, #160]	@ movhi
.L36:
	add	r3, r3, #56
	cmp	r3, ip
	add	r1, r1, #8
	bne	.L37
	ldr	r3, .L42+24
	mov	lr, pc
	bx	r3
	ldr	r4, .L42+28
	mov	r3, #512
	mov	r2, #117440512
	ldr	r1, .L42
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r0, #67108864
	ldr	r3, .L42+32
	ldr	r2, [r3]
	asr	r3, r2, #2
	lsl	r3, r3, #16
	lsr	r3, r3, #16
	strh	r3, [r0, #16]	@ movhi
	ldr	r3, .L42+36
	ldr	r3, [r3]
	asr	r2, r2, #3
	asr	r1, r3, #1
	asr	r3, r3, #3
	lsl	r2, r2, #16
	lsl	r1, r1, #16
	lsl	r3, r3, #16
	lsr	r2, r2, #16
	lsr	r1, r1, #16
	lsr	r3, r3, #16
	strh	r1, [r0, #18]	@ movhi
	pop	{r4, r5, r6, r7, r8, lr}
	strh	r2, [r0, #20]	@ movhi
	strh	r3, [r0, #22]	@ movhi
	bx	lr
.L43:
	.align	2
.L42:
	.word	shadowOAM
	.word	lasers
	.word	511
	.word	ships
	.word	-32768
	.word	asteroids
	.word	waitForVBlank
	.word	DMANow
	.word	bugHOff
	.word	bugVOff
	.size	drawBugMoon, .-drawBugMoon
	.align	2
	.global	initLasers
	.syntax unified
	.arm
	.fpu softvfp
	.type	initLasers, %function
initLasers:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	str	lr, [sp, #-4]!
	mov	r2, #0
	mvn	lr, #3
	mov	r1, #8
	mov	ip, #1
	ldr	r3, .L48
	add	r0, r3, #896
.L45:
	str	r2, [r3, #8]
	str	r2, [r3, #12]
	str	r2, [r3, #16]
	str	lr, [r3, #20]
	str	r1, [r3, #24]
	str	r1, [r3, #28]
	str	r2, [r3, #32]
	str	r2, [r3, #44]
	str	r2, [r3, #48]
	str	r2, [r3, #36]
	str	ip, [r3, #52]
	add	r3, r3, #56
	cmp	r3, r0
	bne	.L45
	ldr	lr, [sp], #4
	bx	lr
.L49:
	.align	2
.L48:
	.word	lasers
	.size	initLasers, .-initLasers
	.align	2
	.global	initLaser
	.syntax unified
	.arm
	.fpu softvfp
	.type	initLaser, %function
initLaser:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mvn	r3, #3
	cmp	r2, #59
	push	{r4, lr}
	str	r3, [r0, #20]
	movgt	r3, #0
	mov	r4, r0
	stm	r0, {r1, r2}
	strgt	r3, [r0, #36]
	ble	.L54
.L52:
	mov	r3, #0
	ldr	r2, .L55
	str	r3, [r4, #52]
	ldr	r1, .L55+4
	ldr	r4, .L55+8
	ldr	r0, .L55+12
	mov	lr, pc
	bx	r4
	pop	{r4, lr}
	bx	lr
.L54:
	mov	r2, #4
	ldr	r3, .L55+16
	str	r2, [r0, #20]
	mov	lr, pc
	bx	r3
	ldr	r1, .L55+20
	smull	r2, r3, r0, r1
	sub	r3, r3, r0, asr #31
	add	r3, r3, r3, lsl #1
	sub	r0, r0, r3
	add	r0, r0, #1
	str	r0, [r4, #36]
	b	.L52
.L56:
	.align	2
.L55:
	.word	11025
	.word	13406
	.word	playSoundB
	.word	Blaster
	.word	rand
	.word	1431655766
	.size	initLaser, .-initLaser
	.align	2
	.global	updateMussel
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateMussel, %function
updateMussel:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L75
	ldrh	r3, [r3, #48]
	tst	r3, #64
	ldreq	r2, .L75+4
	ldreq	r3, [r2]
	subeq	r3, r3, #1
	streq	r3, [r2]
	ldr	r3, .L75
	ldrh	r3, [r3, #48]
	tst	r3, #128
	ldreq	r2, .L75+4
	ldreq	r3, [r2]
	addeq	r3, r3, #1
	streq	r3, [r2]
	ldr	r3, .L75+8
	ldrh	r3, [r3]
	tst	r3, #1
	beq	.L71
	ldr	r3, .L75+12
	ldrh	r3, [r3]
	tst	r3, #1
	bne	.L71
	push	{r4, r5, r6, lr}
	ldr	r4, .L75+16
	ldr	r6, .L75+20
	add	r5, r4, #896
	b	.L62
.L61:
	add	r4, r4, #56
	cmp	r4, r5
	beq	.L74
.L62:
	ldr	r3, [r4, #52]
	cmp	r3, #0
	beq	.L61
	ldm	r6, {r1, r2}
	mov	r0, r4
	add	r2, r2, #8
	add	r1, r1, #16
	add	r4, r4, #56
	bl	initLaser
	cmp	r4, r5
	bne	.L62
.L74:
	pop	{r4, r5, r6, lr}
	b	animateMussel
.L71:
	b	animateMussel
.L76:
	.align	2
.L75:
	.word	67109120
	.word	bugVOff
	.word	oldButtons
	.word	buttons
	.word	lasers
	.word	mussel
	.size	updateMussel, .-updateMussel
	.align	2
	.global	updateLaser
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateLaser, %function
updateLaser:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L96
	ldrh	r3, [r3, #48]
	tst	r3, #64
	ldreq	r3, [r0]
	addeq	r3, r3, #1
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	streq	r3, [r0]
	ldr	r3, .L96
	ldrh	r3, [r3, #48]
	tst	r3, #128
	ldreq	r3, [r0]
	mov	r6, r1
	subeq	r3, r3, #1
	ldr	r1, [r0, #4]
	ldr	r2, [r0, #24]
	streq	r3, [r0]
	ldr	r3, [r0, #20]
	add	r2, r1, r2
	add	r2, r2, r3
	cmp	r2, #0
	sub	sp, sp, #28
	mov	r5, r0
	ble	.L80
	add	r1, r1, r3
	cmp	r1, #239
	ble	.L93
.L80:
	mov	ip, #1
	ldr	r0, .L96+4
	lsl	r1, r6, #3
	ldrh	r2, [r0, r1]
	orr	r2, r2, #512
	strh	r2, [r0, r1]	@ movhi
	str	ip, [r5, #52]
.L82:
	mov	r4, #0
	ldr	r9, .L96+4
	add	r2, r9, r6, lsl #3
	str	r2, [sp, #20]
	ldr	r8, .L96+8
	ldr	r10, .L96+12
	ldr	fp, .L96+16
.L81:
	cmp	r3, #0
	blt	.L94
.L83:
	add	r4, r4, #8
	cmp	r4, #24
	bne	.L81
	cmp	r3, #0
	ble	.L77
	ldr	r2, .L96+20
	ldr	r1, [r2, #24]
	ldr	r0, [r2, #28]
	ldm	r2, {ip, lr}
	ldr	r3, [r5, #24]
	ldr	r2, [r5, #28]
	str	r1, [sp, #12]
	ldr	r1, [r5, #4]
	str	r0, [sp, #8]
	ldr	r4, .L96+12
	ldr	r0, [r5]
	stm	sp, {ip, lr}
	mov	lr, pc
	bx	r4
	cmp	r0, #0
	beq	.L77
	mov	ip, #1
	ldr	r0, .L96+4
	ldr	r1, .L96+24
	lsl	r6, r6, #3
	ldrh	r2, [r0, r6]
	ldr	r3, [r1]
	orr	r2, r2, #512
	sub	r3, r3, #1
	strh	r2, [r0, r6]	@ movhi
	str	r3, [r1]
	str	ip, [r5, #52]
.L77:
	add	sp, sp, #28
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L94:
	rsb	r2, r4, r4, lsl #3
	add	r7, r2, r8
	ldr	r1, [r7, #52]
	cmp	r1, #0
	bne	.L83
	ldr	lr, [r2, r8]
	ldr	ip, [r7, #24]
	ldr	r3, [r5, #24]
	ldr	r2, [r5, #28]
	ldm	r5, {r0, r1}
	str	lr, [sp]
	ldr	lr, [r7, #28]
	str	ip, [sp, #12]
	ldr	ip, [r7, #4]
	stmib	sp, {ip, lr}
	mov	lr, pc
	bx	r10
	cmp	r0, #0
	beq	.L95
	mov	r0, #1
	ldr	r2, [sp, #20]
	ldrh	r3, [r2]
	orr	r3, r3, #512
	strh	r3, [r2]	@ movhi
	add	r1, r4, r9
	ldrh	r3, [r1, #136]
	ldr	r2, [fp]
	str	r0, [r5, #52]
	str	r0, [r7, #52]
	orr	r3, r3, #512
	sub	r2, r2, #1
	strh	r3, [r1, #136]	@ movhi
	str	r2, [fp]
	ldr	r3, [r5, #20]
	b	.L83
.L93:
	str	r1, [r0, #4]
	b	.L82
.L95:
	ldr	r3, [r5, #20]
	b	.L83
.L97:
	.align	2
.L96:
	.word	67109120
	.word	shadowOAM
	.word	ships
	.word	collision
	.word	shipsRemaining
	.word	mussel
	.word	playerHealth
	.size	updateLaser, .-updateLaser
	.align	2
	.global	hideLaser
	.syntax unified
	.arm
	.fpu softvfp
	.type	hideLaser, %function
hideLaser:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	ip, #1
	ldr	r2, .L99
	lsl	r1, r1, #3
	ldrh	r3, [r2, r1]
	orr	r3, r3, #512
	strh	r3, [r2, r1]	@ movhi
	str	ip, [r0, #52]
	bx	lr
.L100:
	.align	2
.L99:
	.word	shadowOAM
	.size	hideLaser, .-hideLaser
	.align	2
	.global	drawLaser
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawLaser, %function
drawLaser:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r2, [r0, #44]
	ldr	r3, [r0, #36]
	add	r3, r3, r2, lsl #5
	ldr	r2, [r0, #4]
	ldr	ip, .L103
	add	r3, r3, #384
	str	lr, [sp, #-4]!
	lsl	r1, r1, #3
	ldrb	lr, [r0]	@ zero_extendqisi2
	lsl	r2, r2, #23
	add	r3, r3, #2
	add	r0, ip, r1
	lsr	r2, r2, #23
	orr	r3, r3, #16384
	strh	lr, [ip, r1]	@ movhi
	strh	r2, [r0, #2]	@ movhi
	strh	r3, [r0, #4]	@ movhi
	ldr	lr, [sp], #4
	bx	lr
.L104:
	.align	2
.L103:
	.word	shadowOAM
	.size	drawLaser, .-drawLaser
	.align	2
	.global	initShips
	.syntax unified
	.arm
	.fpu softvfp
	.type	initShips, %function
initShips:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r2, #0
	push	{r4, r5, lr}
	mov	r1, #20
	mov	ip, r2
	mvn	r5, #35
	mov	r0, #1
	mov	r4, #16
	mov	lr, #32
	ldr	r3, .L109
.L106:
	str	r2, [r3, #36]
	add	r2, r2, #1
	cmp	r2, #3
	stm	r3, {r1, r5}
	str	r0, [r3, #16]
	str	r0, [r3, #20]
	str	r4, [r3, #24]
	str	lr, [r3, #28]
	str	ip, [r3, #44]
	str	ip, [r3, #52]
	add	r1, r1, #42
	add	r3, r3, #56
	bne	.L106
	ldr	r3, .L109+4
	pop	{r4, r5, lr}
	str	r2, [r3]
	bx	lr
.L110:
	.align	2
.L109:
	.word	ships
	.word	shipsRemaining
	.size	initShips, .-initShips
	.global	__aeabi_idivmod
	.align	2
	.global	updateShips
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateShips, %function
updateShips:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, lr}
	ldr	r4, .L155
	mov	r5, r4
	ldr	r8, .L155+4
	ldr	r7, .L155+8
	ldr	r6, .L155+12
	ldr	r9, .L155+16
	sub	sp, sp, #16
	add	r10, r4, #168
.L117:
	ldr	r3, [r5, #4]
	cmp	r3, #0
	ldrlt	r2, [r5, #20]
	addlt	r3, r2, r3
	strlt	r3, [r5, #4]
	ldr	r3, [r5, #52]
	cmp	r3, #0
	beq	.L152
.L115:
	add	r5, r5, #56
	cmp	r5, r10
	bne	.L117
	ldr	r3, [r4, #52]
	cmp	r3, #0
	beq	.L153
.L119:
	ldr	r3, [r4, #164]
	cmp	r3, #0
	beq	.L154
.L125:
	ldr	r3, [r4, #108]
	cmp	r3, #0
	beq	.L111
	ldr	r3, .L155+20
	ldrh	r3, [r3, #48]
	tst	r3, #64
	ldr	r0, [r4]
	ldr	ip, [r4, #112]
	ldr	lr, [r4, #140]
	bne	.L132
	add	r3, ip, lr
	cmp	r3, #159
	ldr	r2, [r4, #16]
	ldrle	r3, [r4, #128]
	add	r0, r0, r2
	addle	ip, ip, r3
	str	r0, [r4]
	strle	ip, [r4, #112]
.L132:
	ldr	r3, .L155+20
	ldrh	r3, [r3, #48]
	tst	r3, #128
	bne	.L133
	cmp	r0, #0
	ldrgt	r3, [r4, #16]
	subgt	r0, r0, r3
	ldr	r3, [r4, #128]
	sub	ip, ip, r3
	strgt	r0, [r4]
	str	ip, [r4, #112]
.L133:
	ldr	r3, [r4, #52]
	cmp	r3, #0
	beq	.L135
	ldr	r3, .L155+24
	ldr	r1, [r3, #28]
	ldr	r2, [r3]
	add	r3, lr, lr, lsr #31
	asr	r3, r3, #1
	add	r1, r1, r1, lsr #31
	add	r2, r2, r1, asr #1
	add	r1, r3, ip
	cmp	r1, r2
	ldrgt	r1, [r4, #128]
	subgt	ip, ip, r1
	addgt	r1, r3, ip
	strgt	ip, [r4, #112]
	cmp	r2, r1
	ldrgt	r3, [r4, #128]
	addgt	ip, ip, r3
	strgt	ip, [r4, #112]
.L135:
	ldr	r3, [r4, #164]
	cmp	r3, #0
	ldr	r2, [r4, #28]
	beq	.L137
	ldr	r1, .L155+24
	ldr	r3, [r1, #28]
	ldr	r1, [r1]
	add	r5, r3, r3, lsr #31
	add	r3, r2, r2, lsr #31
	add	r3, r0, r3, asr #1
	add	r1, r1, r5, asr #1
	cmp	r3, r1
	ldrlt	r3, [r4, #16]
	addlt	r0, r0, r3
	add	r3, lr, lr, lsr #31
	add	r3, r0, r3, asr #1
	strlt	r0, [r4]
	cmp	r1, r3
	ldrlt	r3, [r4, #16]
	sublt	r0, r0, r3
	strlt	r0, [r4]
.L137:
	sub	ip, ip, #32
	ldr	r5, [r4, #136]
	str	ip, [sp]
	ldr	ip, [r4, #116]
	str	r5, [sp, #12]
	ldr	r3, [r4, #24]
	ldr	r1, [r4, #4]
	str	lr, [sp, #8]
	str	ip, [sp, #4]
	ldr	r5, .L155+28
	mov	lr, pc
	bx	r5
	cmp	r0, #0
	bne	.L111
	ldr	r2, [r4]
	ldr	r3, [r4, #112]
	ldr	r0, [r4, #16]
	ldr	r1, [r4, #128]
	add	r2, r2, r0
	sub	r3, r3, r1
	str	r2, [r4]
	str	r3, [r4, #112]
.L111:
	add	sp, sp, #16
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	bx	lr
.L152:
	mov	lr, pc
	bx	r8
	ldr	r1, [r7]
	add	r1, r1, #1
	lsl	r1, r1, #7
	mov	lr, pc
	bx	r6
	cmp	r1, #0
	bne	.L115
	ldr	r3, .L155+16
	b	.L116
.L114:
	add	r1, r1, #1
	cmp	r1, #13
	add	r3, r3, #56
	beq	.L115
.L116:
	ldr	r2, [r3, #52]
	cmp	r2, #0
	beq	.L114
	ldr	r3, [r5, #28]
	ldr	r2, [r5]
	rsb	r1, r1, r1, lsl #3
	add	r3, r3, r3, lsr #31
	add	r0, r9, r1, lsl #3
	add	r1, r2, r3, asr #1
	ldr	r2, [r5, #4]
	bl	initLaser
	b	.L115
.L154:
	ldr	lr, [r4, #80]
	ldr	ip, [r4, #84]
	add	r0, r4, #112
	ldm	r0, {r0, r1}
	str	lr, [sp, #12]
	str	ip, [sp, #8]
	ldr	lr, [r4, #60]
	ldr	ip, [r4, #56]
	ldr	r3, [r4, #136]
	ldr	r2, [r4, #140]
	stm	sp, {ip, lr}
	ldr	r5, .L155+28
	mov	lr, pc
	bx	r5
	cmp	r0, #0
	bne	.L125
	ldr	r3, .L155+20
	ldrh	r3, [r3, #48]
	tst	r3, #64
	ldr	r2, [r4, #56]
	ldreq	r3, [r4, #72]
	ldr	r0, .L155+24
	addeq	r2, r2, r3, lsl #1
	ldr	r1, [r0, #28]
	ldr	r3, [r4, #84]
	ldr	r0, [r0]
	add	ip, r3, r3, lsr #31
	add	r1, r1, r1, lsr #31
	add	r1, r0, r1, asr #1
	add	r0, r2, ip, asr #1
	streq	r2, [r4, #56]
	cmp	r0, r1
	ldrlt	r1, [r4, #72]
	addlt	r2, r2, r1
	ldr	r1, [r4, #112]
	strlt	r2, [r4, #56]
	add	r3, r3, r2
	sub	r2, r1, #15
	cmp	r2, r3
	bgt	.L129
	ldr	r2, [r4, #140]
	add	r2, r1, r2
	cmp	r2, #159
	ldrle	r2, [r4, #128]
	addle	r1, r1, r2
	strle	r1, [r4, #112]
.L129:
	sub	r2, r1, #16
	cmp	r3, r2
	ldrlt	r3, [r4, #128]
	sublt	r1, r1, r3
	strlt	r1, [r4, #112]
	b	.L125
.L153:
	ldr	lr, [r4, #80]
	ldr	ip, [r4, #84]
	str	lr, [sp, #12]
	str	ip, [sp, #8]
	ldr	lr, [r4, #60]
	ldr	ip, [r4, #56]
	ldr	r3, [r4, #24]
	ldr	r2, [r4, #28]
	ldm	r4, {r0, r1}
	stm	sp, {ip, lr}
	ldr	r5, .L155+28
	mov	lr, pc
	bx	r5
	cmp	r0, #0
	bne	.L119
	ldr	r3, .L155+20
	ldrh	r3, [r3, #48]
	tst	r3, #128
	ldr	r2, [r4, #56]
	ldreq	r3, [r4, #72]
	ldr	r0, .L155+24
	subeq	r2, r2, r3, lsl #1
	ldr	r1, [r0, #28]
	ldr	r3, [r4, #84]
	ldr	r0, [r0]
	add	r1, r1, r1, lsr #31
	add	r3, r3, r3, lsr #31
	add	r3, r2, r3, asr #1
	add	r1, r0, r1, asr #1
	streq	r2, [r4, #56]
	cmp	r3, r1
	ldrgt	r3, [r4, #72]
	ldr	r1, [r4]
	ldr	r0, [r4, #28]
	subgt	r2, r2, r3
	add	r3, r1, r0
	add	ip, r3, #15
	strgt	r2, [r4, #56]
	cmp	ip, r2
	cmpge	r1, #0
	ldrgt	r3, [r4, #16]
	subgt	r1, r1, r3
	addgt	r3, r0, r1
	add	r3, r3, #16
	strgt	r1, [r4]
	cmp	r3, r2
	ldrlt	r3, [r4, #16]
	addlt	r1, r3, r1
	strlt	r1, [r4]
	b	.L119
.L156:
	.align	2
.L155:
	.word	ships
	.word	rand
	.word	shipsRemaining
	.word	__aeabi_idivmod
	.word	lasers
	.word	67109120
	.word	mussel
	.word	collision
	.size	updateShips, .-updateShips
	.align	2
	.global	hideShip
	.syntax unified
	.arm
	.fpu softvfp
	.type	hideShip, %function
hideShip:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	ip, #1
	ldr	r2, .L158
	lsl	r1, r1, #3
	ldrh	r3, [r2, r1]
	orr	r3, r3, #512
	str	ip, [r0, #52]
	strh	r3, [r2, r1]	@ movhi
	bx	lr
.L159:
	.align	2
.L158:
	.word	shadowOAM
	.size	hideShip, .-hideShip
	.align	2
	.global	drawShip
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawShip, %function
drawShip:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r2, [r0, #44]
	ldr	r3, [r0, #36]
	add	r3, r3, r2, lsl #4
	ldr	r2, [r0, #4]
	str	lr, [sp, #-4]!
	ldrb	r0, [r0]	@ zero_extendqisi2
	ldr	ip, .L162
	ldr	lr, .L162+4
	lsl	r2, r2, #23
	add	r3, r3, #195
	lsl	r1, r1, #3
	lsr	r2, r2, #23
	lsl	r3, r3, #1
	orr	r0, r0, ip
	orr	r2, r2, ip
	orr	r3, r3, #20480
	add	ip, lr, r1
	strh	r0, [lr, r1]	@ movhi
	strh	r2, [ip, #2]	@ movhi
	strh	r3, [ip, #4]	@ movhi
	ldr	lr, [sp], #4
	bx	lr
.L163:
	.align	2
.L162:
	.word	-32768
	.word	shadowOAM
	.size	drawShip, .-drawShip
	.align	2
	.global	initAsteroids
	.syntax unified
	.arm
	.fpu softvfp
	.type	initAsteroids, %function
initAsteroids:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, r4, r5, r6, r7, r8, r9, r10, fp, lr}
	mov	r9, #960
	ldr	r4, .L168
	ldr	r5, .L168+4
	ldr	r8, .L168+8
	ldr	r7, .L168+12
	add	r6, r4, #3584
.L165:
	mov	lr, pc
	bx	r5
	mov	r10, #1
	smull	fp, ip, r0, r8
	asr	r2, r0, #31
	add	r3, r0, ip
	rsb	r3, r2, r3, asr #7
	add	r3, r3, r3, lsl #2
	rsb	r3, r3, r3, lsl #3
	sub	r3, r0, r3, lsl #2
	add	r3, r3, #10
	stm	r4, {r3, r9}
	str	r10, [r4, #16]
	mov	lr, pc
	bx	r5
	smull	r2, r3, r0, r7
	sub	r3, r3, r0, asr #31
	add	r3, r3, r3, lsl r10
	sub	r0, r0, r3
	lsl	r0, r0, r10
	eor	r0, r0, r10
	mov	r2, #16
	mov	r3, #0
	mvn	r0, r0
	mov	r1, #4
	str	r10, [r4, #52]
	str	r0, [r4, #20]
	str	r2, [r4, #24]
	str	r2, [r4, #28]
	str	r3, [r4, #32]
	str	r3, [r4, #44]
	str	r1, [r4, #48]
	add	r4, r4, #56
	cmp	r4, r6
	bne	.L165
	pop	{r3, r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L169:
	.align	2
.L168:
	.word	asteroids
	.word	rand
	.word	-368140053
	.word	1431655766
	.size	initAsteroids, .-initAsteroids
	.align	2
	.global	initBugMoon
	.syntax unified
	.arm
	.fpu softvfp
	.type	initBugMoon, %function
initBugMoon:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, lr}
	mov	r4, #1
	mov	r5, #8
	mov	r0, #0
	mov	r6, #64
	mov	r8, #32
	mov	r7, #88
	mov	lr, r4
	mov	r1, r5
	mvn	ip, #3
	ldr	r3, .L176
	mov	r2, r0
	str	r0, [r3, #8]
	str	r0, [r3, #12]
	str	r0, [r3, #32]
	str	r0, [r3, #44]
	str	r0, [r3, #48]
	str	r0, [r3, #36]
	str	r8, [r3, #28]
	ldr	r0, .L176+4
	str	r7, [r3, #4]
	str	r4, [r3, #16]
	str	r4, [r3, #20]
	str	r6, [r3, #24]
	str	r6, [r3]
	ldr	r3, .L176+8
	str	r5, [r0]
	add	r0, r3, #896
.L171:
	str	r2, [r3, #8]
	str	r2, [r3, #12]
	str	r2, [r3, #16]
	str	ip, [r3, #20]
	str	r1, [r3, #24]
	str	r1, [r3, #28]
	str	r2, [r3, #32]
	str	r2, [r3, #44]
	str	r2, [r3, #48]
	str	r2, [r3, #36]
	str	lr, [r3, #52]
	add	r3, r3, #56
	cmp	r3, r0
	bne	.L171
	mov	r2, #0
	mov	r1, #20
	mov	r4, r2
	mvn	lr, #35
	mov	r5, #1
	mov	ip, #16
	mov	r0, #32
	ldr	r3, .L176+12
.L172:
	str	r2, [r3, #36]
	add	r2, r2, #1
	cmp	r2, #3
	stm	r3, {r1, lr}
	str	r5, [r3, #16]
	str	r5, [r3, #20]
	str	ip, [r3, #24]
	str	r0, [r3, #28]
	str	r4, [r3, #44]
	str	r4, [r3, #52]
	add	r1, r1, #42
	add	r3, r3, #56
	bne	.L172
	ldr	r3, .L176+16
	str	r2, [r3]
	bl	initAsteroids
	ldr	r0, .L176+20
	ldr	r1, .L176+24
	ldr	r2, .L176+28
	ldr	r3, .L176+32
	str	r4, [r0]
	str	r4, [r1]
	str	r5, [r2]
	str	r4, [r3]
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L177:
	.align	2
.L176:
	.word	mussel
	.word	playerHealth
	.word	lasers
	.word	ships
	.word	shipsRemaining
	.word	bugHOff
	.word	bugVOff
	.word	stage
	.word	bugMoonWon
	.size	initBugMoon, .-initBugMoon
	.align	2
	.global	initAsteroid
	.syntax unified
	.arm
	.fpu softvfp
	.type	initAsteroid, %function
initAsteroid:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r2, #960
	push	{r4, r6, r7, lr}
	ldr	r3, .L180
	str	r2, [r0, #4]
	mov	r4, r0
	mov	lr, pc
	bx	r3
	mov	r2, #0
	ldr	r3, .L180+4
	smull	r6, r7, r0, r3
	sub	r3, r7, r0, asr #31
	add	r3, r3, r3, lsl #1
	sub	r0, r0, r3
	lsl	r0, r0, #1
	str	r0, [r4, #36]
	str	r2, [r4, #52]
	pop	{r4, r6, r7, lr}
	bx	lr
.L181:
	.align	2
.L180:
	.word	rand
	.word	1431655766
	.size	initAsteroid, .-initAsteroid
	.global	__aeabi_idiv
	.align	2
	.global	updateAsteroid
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateAsteroid, %function
updateAsteroid:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	ldr	r3, .L199
	ldr	ip, [r0, #4]
	ldrh	r3, [r3, #48]
	ldr	r2, [r0, #20]
	tst	r3, #64
	add	ip, r2, ip
	sub	sp, sp, #16
	str	ip, [r0, #4]
	bne	.L184
	ldr	r3, [r0]
	ldr	lr, [r0, #16]
	add	r3, r3, lr
	cmp	r3, #160
	str	r3, [r0]
	ldrgt	r3, [r0, #28]
	rsbgt	r3, r3, #0
	strgt	r3, [r0]
.L184:
	ldr	r3, .L199
	ldrh	r3, [r3, #48]
	tst	r3, #128
	bne	.L187
	ldr	r3, [r0]
	ldr	lr, [r0, #16]
	sub	r3, r3, lr
	cmn	r3, #8
	movlt	r3, #160
	str	r3, [r0]
.L187:
	ldr	r3, [r0, #24]
	add	lr, ip, r3
	cmn	lr, r2
	bmi	.L196
	mov	r5, r0
	ldr	r0, .L199+4
	ldr	lr, [r0, #24]
	ldr	r6, [r0, #28]
	ldr	r2, [r5, #28]
	str	lr, [sp, #12]
	mov	r4, r1
	asr	r1, ip, #2
	ldm	r0, {ip, lr}
	str	r6, [sp, #8]
	ldr	r6, .L199+8
	ldr	r0, [r5]
	stm	sp, {ip, lr}
	mov	lr, pc
	bx	r6
	cmp	r0, #0
	bne	.L197
	ldr	r3, .L199+12
	ldr	r1, [r5, #20]
	mov	r0, #36
	mov	lr, pc
	bx	r3
	ldr	r4, [r5, #32]
	mov	r1, r0
	ldr	r6, .L199+16
	mov	r0, r4
	mov	lr, pc
	bx	r6
	cmp	r1, #0
	beq	.L198
.L193:
	add	r4, r4, #1
	str	r4, [r5, #32]
	add	sp, sp, #16
	@ sp needed
	pop	{r4, r5, r6, lr}
	bx	lr
.L196:
	mov	ip, #1
	ldr	r2, .L199+20
	lsl	r1, r1, #3
	ldrh	r3, [r2, r1]
	orr	r3, r3, #512
	strh	r3, [r2, r1]	@ movhi
	str	ip, [r0, #52]
	add	sp, sp, #16
	@ sp needed
	pop	{r4, r5, r6, lr}
	bx	lr
.L198:
	add	r0, r5, #44
	ldm	r0, {r0, r1}
	add	r0, r0, #1
	mov	lr, pc
	bx	r6
	str	r1, [r5, #44]
	b	.L193
.L197:
	ldr	lr, .L199+24
	ldr	ip, [lr]
	mov	r3, #0
	sub	ip, ip, #1
	ldr	r2, .L199+28
	ldr	r1, .L199+32
	ldr	r0, .L199+36
	ldr	r6, .L199+40
	str	ip, [lr]
	mov	lr, pc
	bx	r6
	mov	r0, #1
	ldr	r2, .L199+20
	lsl	r1, r4, #3
	ldrh	r3, [r2, r1]
	orr	r3, r3, #512
	strh	r3, [r2, r1]	@ movhi
	str	r0, [r5, #52]
	add	sp, sp, #16
	@ sp needed
	pop	{r4, r5, r6, lr}
	bx	lr
.L200:
	.align	2
.L199:
	.word	67109120
	.word	mussel
	.word	collision
	.word	__aeabi_idiv
	.word	__aeabi_idivmod
	.word	shadowOAM
	.word	playerHealth
	.word	11025
	.word	10231
	.word	CollisionBody
	.word	playSoundB
	.size	updateAsteroid, .-updateAsteroid
	.align	2
	.global	updateBugMoon
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateBugMoon, %function
updateBugMoon:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, r4, r5, r6, r7, r8, r9, r10, fp, lr}
	ldr	r10, .L253
	bl	updateMussel
	ldr	r3, [r10]
	cmp	r3, #2
	beq	.L203
	cmp	r3, #3
	beq	.L204
	cmp	r3, #1
	beq	.L247
.L202:
	ldr	r4, .L253+4
	mov	r6, #0
	mov	r5, r4
	b	.L223
.L222:
	cmp	r6, #16
	add	r5, r5, #56
	beq	.L248
.L223:
	ldr	r3, [r5, #52]
	cmp	r3, #0
	add	r6, r6, #1
	bne	.L222
	mov	r0, r5
	mov	r1, r6
	bl	updateLaser
	cmp	r6, #16
	add	r5, r5, #56
	bne	.L223
.L248:
	ldr	r6, .L253+8
	ldr	r5, [r6]
	cmp	r5, #0
	beq	.L243
	ldr	r6, .L253+12
.L224:
	ldr	r3, .L253+16
	ldrh	r3, [r3]
	tst	r3, #512
	beq	.L228
	ldr	r3, .L253+20
	ldrh	r3, [r3]
	tst	r3, #512
	ldreq	r3, .L253+24
	ldreq	r2, .L253+28
	streq	r2, [r3, #12]
.L228:
	ldr	r3, [r6]
	add	r3, r3, #1
	str	r3, [r6]
	pop	{r3, r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L243:
	mov	r0, #1
	ldr	r3, .L253+32
	ldr	r1, .L253+36
	add	ip, r3, #512
.L225:
	ldrh	r2, [r3, #160]
	orr	r2, r2, #512
	strh	r2, [r3, #160]	@ movhi
	add	r3, r3, #8
	cmp	r3, ip
	str	r0, [r1, #52]
	add	r1, r1, #56
	bne	.L225
	mov	r7, #0
	mov	r9, #8
	mov	r8, #64
	mov	fp, #32
	mov	r10, #88
	mov	r3, r7
	mov	r2, r9
	mvn	lr, #3
	mov	ip, #1
	ldr	r1, .L253+24
	str	r9, [r6]
	str	r7, [r1, #8]
	str	r7, [r1, #12]
	str	r0, [r1, #16]
	str	r0, [r1, #20]
	str	r7, [r1, #32]
	str	r7, [r1, #44]
	str	r7, [r1, #48]
	str	r7, [r1, #36]
	str	fp, [r1, #28]
	str	r10, [r1, #4]
	str	r8, [r1, #24]
	str	r8, [r1]
	ldr	r1, .L253+40
.L226:
	str	r3, [r4, #8]
	str	r3, [r4, #12]
	str	r3, [r4, #16]
	str	lr, [r4, #20]
	str	r2, [r4, #24]
	str	r2, [r4, #28]
	str	r3, [r4, #32]
	str	r3, [r4, #44]
	str	r3, [r4, #48]
	str	r3, [r4, #36]
	str	ip, [r4, #52]
	add	r4, r4, #56
	cmp	r4, r1
	bne	.L226
	mov	r2, #20
	mvn	lr, #35
	mov	r1, #1
	mov	ip, #16
	mov	r0, #32
	mov	r4, #0
	ldr	r3, .L253+44
.L227:
	str	r5, [r3, #36]
	add	r5, r5, #1
	cmp	r5, #3
	stm	r3, {r2, lr}
	str	r1, [r3, #16]
	str	r1, [r3, #20]
	str	ip, [r3, #24]
	str	r0, [r3, #28]
	str	r4, [r3, #44]
	str	r4, [r3, #52]
	add	r2, r2, #42
	add	r3, r3, #56
	bne	.L227
	ldr	r3, .L253+48
	ldr	r6, .L253+12
	str	r5, [r3]
	bl	initAsteroids
	ldr	ip, .L253+52
	str	r4, [r6]
	str	r4, [ip]
	mov	r3, #0
	ldr	r2, .L253+56
	ldr	r1, .L253+60
	ldr	r0, .L253+64
	ldr	r4, .L253+68
	mov	lr, pc
	bx	r4
	b	.L224
.L247:
	bl	updateShips
	ldr	r3, .L253+48
	ldr	r3, [r3]
	cmp	r3, #0
	moveq	r3, #2
	streq	r3, [r10]
	b	.L202
.L204:
	ldr	r4, .L253+36
	mov	r10, #20
	ldr	r6, .L253+72
	ldr	r9, .L253+24
	ldr	r8, .L253+76
	ldr	r7, .L253+80
	add	r5, r4, #3584
	b	.L221
.L219:
	mov	lr, pc
	bx	r6
	ldr	r1, [r9, #12]
	sub	r1, r8, r1
	mov	lr, pc
	bx	r7
	subs	fp, r1, #0
	beq	.L249
.L220:
	add	r4, r4, #56
	cmp	r4, r5
	add	r10, r10, #1
	beq	.L250
.L221:
	ldr	r2, [r4, #52]
	cmp	r2, #0
	bne	.L219
	mov	r1, r10
	mov	r0, r4
	bl	updateAsteroid
	ldr	r2, [r4, #52]
	cmp	r2, #0
	bne	.L219
	add	r4, r4, #56
	cmp	r4, r5
	add	r10, r10, #1
	bne	.L221
.L250:
	bl	updateShips
	ldr	r3, .L253+48
	ldr	r3, [r3]
	cmp	r3, #0
	moveq	r2, #1
	ldreq	r3, .L253+84
	streq	r2, [r3]
	b	.L202
.L249:
	mov	r3, #960
	str	r3, [r4, #4]
	mov	lr, pc
	bx	r6
	ldr	r1, .L253+88
	smull	r2, r3, r0, r1
	sub	r2, r3, r0, asr #31
	add	r2, r2, r2, lsl #1
	sub	r0, r0, r2
	lsl	r0, r0, #1
	str	fp, [r4, #52]
	str	r0, [r4, #36]
	b	.L220
.L203:
	ldr	r4, .L253+36
	mov	r5, #20
	ldr	r8, .L253+24
	ldr	r7, .L253+72
	ldr	r9, .L253+80
	add	r6, r4, #3584
	b	.L212
.L210:
	mov	lr, pc
	bx	r7
	ldr	r1, [r8, #12]
	rsb	r1, r1, #6464
	add	r1, r1, #28
	mov	lr, pc
	bx	r9
	subs	fp, r1, #0
	beq	.L251
.L211:
	add	r4, r4, #56
	cmp	r4, r6
	add	r5, r5, #1
	beq	.L252
.L212:
	ldr	r3, [r4, #52]
	cmp	r3, #0
	bne	.L210
	mov	r1, r5
	mov	r0, r4
	bl	updateAsteroid
	ldr	r3, [r4, #52]
	cmp	r3, #0
	bne	.L210
	add	r4, r4, #56
	cmp	r4, r6
	add	r5, r5, #1
	bne	.L212
.L252:
	ldr	r3, [r8, #12]
	ldr	r2, .L253+92
	add	r3, r3, #1
	cmp	r3, r2
	str	r3, [r8, #12]
	bne	.L202
	mov	r0, #3
	mov	r2, #0
	mvn	lr, #3
	mov	r1, #8
	mov	ip, #1
	ldr	r3, .L253+4
	str	r0, [r10]
	add	r0, r3, #896
.L214:
	str	r2, [r3, #8]
	str	r2, [r3, #12]
	str	r2, [r3, #16]
	str	lr, [r3, #20]
	str	r1, [r3, #24]
	str	r1, [r3, #28]
	str	r2, [r3, #32]
	str	r2, [r3, #44]
	str	r2, [r3, #48]
	str	r2, [r3, #36]
	str	ip, [r3, #52]
	add	r3, r3, #56
	cmp	r3, r0
	bne	.L214
	mov	r2, #0
	mov	r1, #20
	mov	ip, r2
	mvn	r5, #35
	mov	r0, #1
	mov	r4, #16
	mov	lr, #32
	ldr	r3, .L253+44
.L215:
	str	r2, [r3, #36]
	add	r2, r2, #1
	cmp	r2, #3
	stm	r3, {r1, r5}
	str	r0, [r3, #16]
	str	r0, [r3, #20]
	str	r4, [r3, #24]
	str	lr, [r3, #28]
	str	ip, [r3, #44]
	str	ip, [r3, #52]
	add	r1, r1, #42
	add	r3, r3, #56
	bne	.L215
	ldr	r3, .L253+48
	str	r2, [r3]
	b	.L202
.L251:
	mov	r3, #960
	str	r3, [r4, #4]
	mov	lr, pc
	bx	r7
	ldr	r1, .L253+88
	smull	r2, r3, r0, r1
	sub	r3, r3, r0, asr #31
	add	r3, r3, r3, lsl #1
	sub	r0, r0, r3
	lsl	r0, r0, #1
	str	fp, [r4, #52]
	str	r0, [r4, #36]
	b	.L211
.L254:
	.align	2
.L253:
	.word	stage
	.word	lasers
	.word	playerHealth
	.word	bugHOff
	.word	oldButtons
	.word	buttons
	.word	mussel
	.word	4995
	.word	shadowOAM
	.word	asteroids
	.word	lasers+896
	.word	ships
	.word	shipsRemaining
	.word	bugVOff
	.word	11025
	.word	23755
	.word	MusselReset
	.word	playSoundB
	.word	rand
	.word	6492
	.word	__aeabi_idivmod
	.word	bugMoonWon
	.word	1431655766
	.word	5000
	.size	updateBugMoon, .-updateBugMoon
	.align	2
	.global	animateAsteroid
	.syntax unified
	.arm
	.fpu softvfp
	.type	animateAsteroid, %function
animateAsteroid:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	mov	r4, r0
	ldr	r1, [r0, #20]
	ldr	r3, .L258
	mov	r0, #36
	mov	lr, pc
	bx	r3
	ldr	r5, [r4, #32]
	mov	r1, r0
	ldr	r6, .L258+4
	mov	r0, r5
	mov	lr, pc
	bx	r6
	cmp	r1, #0
	bne	.L256
	add	r0, r4, #44
	ldm	r0, {r0, r1}
	add	r0, r0, #1
	mov	lr, pc
	bx	r6
	str	r1, [r4, #44]
.L256:
	add	r5, r5, #1
	str	r5, [r4, #32]
	pop	{r4, r5, r6, lr}
	bx	lr
.L259:
	.align	2
.L258:
	.word	__aeabi_idiv
	.word	__aeabi_idivmod
	.size	animateAsteroid, .-animateAsteroid
	.align	2
	.global	hideAsteroid
	.syntax unified
	.arm
	.fpu softvfp
	.type	hideAsteroid, %function
hideAsteroid:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	b	hideLaser
	.size	hideAsteroid, .-hideAsteroid
	.align	2
	.global	drawAsteroid
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawAsteroid, %function
drawAsteroid:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r3, [r0, #36]
	ldr	r4, [r0, #4]
	ldrb	lr, [r0]	@ zero_extendqisi2
	ldr	r2, .L263
	ldr	r0, [r0, #44]
	ldr	ip, .L263+4
	add	r3, r3, #416
	lsl	r1, r1, #3
	and	r2, r2, r4, asr #2
	add	r3, r3, r0, lsl #6
	orr	r2, r2, #16384
	add	r0, ip, r1
	orr	r3, r3, #20480
	strh	lr, [ip, r1]	@ movhi
	strh	r2, [r0, #2]	@ movhi
	strh	r3, [r0, #4]	@ movhi
	pop	{r4, lr}
	bx	lr
.L264:
	.align	2
.L263:
	.word	511
	.word	shadowOAM
	.size	drawAsteroid, .-drawAsteroid
	.comm	asteroids,3584,4
	.comm	ships,168,4
	.comm	lasers,896,4
	.comm	mussel,56,4
	.comm	soundB,32,4
	.comm	soundA,32,4
	.comm	bugMoonWon,4,4
	.comm	stage,4,4
	.comm	bugVOff,4,4
	.comm	bugHOff,4,4
	.comm	playerHealth,4,4
	.comm	shipsRemaining,4,4
	.ident	"GCC: (devkitARM release 47) 7.1.0"

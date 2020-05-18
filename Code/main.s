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
	.global	goToStart
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToStart, %function
goToStart:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	ldr	r3, .L4
	mov	lr, pc
	bx	r3
	mov	r5, #67108864
	mov	r0, #8064
	mov	r1, #5888
	ldr	r3, .L4+4
	ldr	r2, .L4+8
	ldr	r4, .L4+12
	strh	r0, [r5, #8]	@ movhi
	strh	r1, [r5]	@ movhi
	strh	r3, [r5, #10]	@ movhi
	ldr	r1, .L4+16
	strh	r2, [r5, #12]	@ movhi
	mov	r3, #256
	mov	r2, #83886080
	mov	r0, #3
	mov	lr, pc
	bx	r4
	ldr	r3, .L4+20
	mov	r2, #100663296
	ldr	r1, .L4+24
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	ldr	r2, .L4+28
	ldr	r1, .L4+32
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #32
	ldr	r2, .L4+36
	ldr	r1, .L4+40
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	ldr	r2, .L4+44
	ldr	r1, .L4+48
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #384
	ldr	r2, .L4+52
	ldr	r1, .L4+56
	mov	r0, #3
	mov	lr, pc
	bx	r4
	ldr	r2, .L4+60
	ldr	r1, .L4+64
	mov	r0, #3
	mov	r3, #1024
	mov	lr, pc
	bx	r4
	ldr	r3, .L4+68
	mov	lr, pc
	bx	r3
	mov	r3, #0
	mov	r1, #8
	mov	r0, #10
	ldr	lr, .L4+72
	ldr	ip, .L4+76
	ldr	r2, .L4+80
	str	r3, [lr]
	str	r2, [ip]
	ldr	lr, .L4+84
	strh	r1, [r5, #16]	@ movhi
	ldr	ip, .L4+88
	ldr	r1, .L4+92
	strh	r2, [r5, #18]	@ movhi
	str	r3, [lr]
	str	r3, [ip]
	str	r0, [r1]
	pop	{r4, r5, r6, lr}
	bx	lr
.L5:
	.align	2
.L4:
	.word	hideSprites
	.word	7688
	.word	7436
	.word	DMANow
	.word	startPal
	.word	5792
	.word	startTiles
	.word	100726784
	.word	startMap
	.word	100696064
	.word	bugMoonStarsNearTiles
	.word	100724736
	.word	bugMoonStarsNearMap
	.word	100712448
	.word	bugMoonStarsFarTiles
	.word	100722688
	.word	bugMoonStarsFarMap
	.word	stopSound
	.word	titleHasPlayed
	.word	titleVOff
	.word	-360
	.word	hOff
	.word	state
	.word	vOff
	.size	goToStart, .-goToStart
	.align	2
	.global	initialize
	.syntax unified
	.arm
	.fpu softvfp
	.type	initialize, %function
initialize:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r3, .L8
	mov	lr, pc
	bx	r3
	ldr	r3, .L8+4
	mov	lr, pc
	bx	r3
	ldr	r4, .L8+8
	mov	r3, #16384
	ldr	r2, .L8+12
	ldr	r1, .L8+16
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #256
	ldr	r2, .L8+20
	ldr	r1, .L8+24
	mov	r0, #3
	mov	lr, pc
	bx	r4
	ldr	r2, .L8+28
	ldr	r3, .L8+32
	ldrh	r2, [r2, #48]
	pop	{r4, lr}
	strh	r2, [r3]	@ movhi
	b	goToStart
.L9:
	.align	2
.L8:
	.word	setupSounds
	.word	setupInterrupts
	.word	DMANow
	.word	100728832
	.word	spritesheetTiles
	.word	83886592
	.word	spritesheetPal
	.word	67109120
	.word	buttons
	.size	initialize, .-initialize
	.align	2
	.global	goToMenu
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToMenu, %function
goToMenu:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	mov	r2, #4864
	mov	r4, #67108864
	ldr	r3, .L12
	strh	r2, [r4]	@ movhi
	mov	lr, pc
	bx	r3
	mov	r3, #7936
	ldr	r2, .L12+4
	strh	r3, [r4, #8]	@ movhi
	ldr	r1, .L12+8
	strh	r2, [r4, #10]	@ movhi
	mov	r3, #256
	ldr	r4, .L12+12
	mov	r2, #83886080
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #1744
	mov	r2, #100663296
	ldr	r1, .L12+16
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	ldr	r2, .L12+20
	ldr	r1, .L12+24
	mov	r0, #3
	mov	lr, pc
	bx	r4
	ldr	r3, .L12+28
	ldr	r2, .L12+32
	ldr	r1, .L12+36
	mov	r0, #3
	mov	lr, pc
	bx	r4
	ldr	r2, .L12+40
	ldr	r1, .L12+44
	mov	r0, #3
	mov	r3, #1024
	mov	lr, pc
	bx	r4
	ldr	r3, .L12+48
	mov	lr, pc
	bx	r3
	ldr	r4, .L12+52
	mov	r3, #1
	ldr	r2, .L12+56
	ldr	r1, .L12+60
	ldr	r0, .L12+64
	mov	lr, pc
	bx	r4
	mov	r2, #0
	mov	r0, #4
	mov	r1, #24
	mov	r5, #54
	mov	r4, #86
	mov	lr, #118
	mov	ip, #1
	ldr	r3, .L12+68
	str	r2, [r3]
	ldr	r3, .L12+72
	str	r2, [r3, #32]
	str	r2, [r3, #44]
	str	r2, [r3, #88]
	str	r2, [r3, #100]
	str	r2, [r3, #144]
	str	r2, [r3, #156]
	ldr	r2, .L12+76
	str	r5, [r3]
	str	r4, [r3, #56]
	str	lr, [r3, #112]
	str	r0, [r3, #48]
	str	r0, [r3, #104]
	str	r0, [r3, #160]
	str	r1, [r3, #4]
	str	r1, [r3, #60]
	str	r1, [r3, #116]
	str	ip, [r2]
	pop	{r4, r5, r6, lr}
	bx	lr
.L13:
	.align	2
.L12:
	.word	hideSprites
	.word	7684
	.word	menuPal
	.word	DMANow
	.word	menuTiles
	.word	100726784
	.word	menuMap
	.word	10896
	.word	100679680
	.word	eclipseTiles
	.word	100724736
	.word	eclipseMap
	.word	stopSound
	.word	playSoundA
	.word	11025
	.word	917856
	.word	CloudlandRegion
	.word	level
	.word	levelSprites
	.word	state
	.size	goToMenu, .-goToMenu
	.align	2
	.global	start
	.syntax unified
	.arm
	.fpu softvfp
	.type	start, %function
start:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	ldr	r5, .L24
	ldr	r3, .L24+4
	mov	lr, pc
	bx	r3
	ldr	r3, [r5]
	cmp	r3, #159
	addle	r3, r3, #1
	strle	r3, [r5]
	ble	.L16
	ldr	r3, .L24+8
	ldr	r3, [r3, #12]
	cmp	r3, #0
	beq	.L22
.L16:
	ldr	r4, .L24+12
	ldr	r2, .L24+16
	ldr	r3, [r4]
	ldrh	r2, [r2]
	sub	r3, r3, #1
	tst	r2, #8
	str	r3, [r4]
	beq	.L17
	ldr	r2, .L24+20
	ldrh	r2, [r2]
	tst	r2, #8
	beq	.L23
.L17:
	mov	r1, #67108864
	ldr	r2, [r5]
	asr	r2, r2, #2
	lsl	r2, r2, #16
	lsr	r2, r2, #16
	strh	r2, [r1, #18]	@ movhi
	ldr	r2, .L24+24
	ldr	r2, [r2]
	asr	r0, r3, #4
	asr	ip, r2, #2
	asr	r3, r3, #5
	asr	r2, r2, #3
	lsl	ip, ip, #16
	lsl	r2, r2, #16
	lsl	r0, r0, #16
	lsl	r3, r3, #16
	lsr	ip, ip, #16
	lsr	r2, r2, #16
	lsr	r0, r0, #16
	lsr	r3, r3, #16
	strh	ip, [r1, #20]	@ movhi
	pop	{r4, r5, r6, lr}
	strh	r2, [r1, #24]	@ movhi
	strh	r0, [r1, #22]	@ movhi
	strh	r3, [r1, #26]	@ movhi
	bx	lr
.L22:
	ldr	r4, .L24+28
	ldr	r3, [r4]
	cmp	r3, #0
	bne	.L16
	ldr	r2, .L24+32
	ldr	r1, .L24+36
	ldr	r0, .L24+40
	ldr	r6, .L24+44
	mov	lr, pc
	bx	r6
	mov	r3, #1
	str	r3, [r4]
	b	.L16
.L23:
	bl	goToMenu
	ldr	r3, [r4]
	b	.L17
.L25:
	.align	2
.L24:
	.word	titleVOff
	.word	waitForVBlank
	.word	soundA
	.word	vOff
	.word	oldButtons
	.word	buttons
	.word	hOff
	.word	titleHasPlayed
	.word	11025
	.word	392544
	.word	MotherMainTheme
	.word	playSoundA
	.size	start, .-start
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
	push	{r4, lr}
	ldr	r3, .L34
	ldr	r4, .L34+4
	mov	lr, pc
	bx	r3
	ldr	r3, .L34+8
	mov	lr, pc
	bx	r3
	ldr	r3, [r4]
	cmp	r3, #1
	beq	.L31
.L27:
	cmp	r3, #0
	beq	.L32
	cmp	r3, #2
	beq	.L33
.L29:
	mov	r2, #2
	ldr	r3, .L34+12
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L32:
	ldr	r3, .L34+16
	mov	lr, pc
	bx	r3
	ldr	r3, [r4]
	cmp	r3, #2
	bne	.L29
.L33:
	ldr	r3, .L34+20
	mov	lr, pc
	bx	r3
	b	.L29
.L31:
	ldr	r3, .L34+24
	mov	lr, pc
	bx	r3
	ldr	r3, [r4]
	b	.L27
.L35:
	.align	2
.L34:
	.word	hideSprites
	.word	level
	.word	stopSound
	.word	state
	.word	goToHacking
	.word	goToPortelythLevel
	.word	goToBugMoon
	.size	goToGame, .-goToGame
	.global	__aeabi_idivmod
	.align	2
	.global	menu
	.syntax unified
	.arm
	.fpu softvfp
	.type	menu, %function
menu:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r3, #67108864
	mvn	r0, #1
	mov	r1, #16
	mov	ip, #12
	mov	r2, #26
	push	{r4, r5, r6, r7, r8, r9, r10, lr}
	ldr	r6, .L54
	ldr	r8, [r6]
	ldr	r4, .L54+4
	lsl	r7, r8, #3
	sub	r9, r7, r8
	add	r9, r4, r9, lsl #3
	strh	ip, [r3, #16]	@ movhi
	ldr	r5, [r9, #32]
	strh	r0, [r3, #18]	@ movhi
	strh	r1, [r3, #20]	@ movhi
	strh	r2, [r3, #22]	@ movhi
	ldr	r3, .L54+8
	smull	r0, r1, r5, r3
	asr	r3, r5, #31
	rsb	r3, r3, r1, asr #1
	add	r3, r3, r3, lsl #1
	cmp	r5, r3, lsl #2
	bne	.L37
	ldr	r0, [r9, #44]
	ldr	r3, .L54+12
	add	r0, r0, #1
	ldr	r1, [r9, #48]
	mov	lr, pc
	bx	r3
	str	r1, [r9, #44]
.L37:
	ldr	r2, [r4, #44]
	sub	r1, r7, r8
	add	r1, r4, r1, lsl #3
	add	r5, r5, #1
	lsl	r2, r2, #6
	ldr	r0, [r4, #100]
	ldr	r3, [r4, #156]
	ldr	ip, [r4, #4]
	str	r5, [r1, #32]
	add	r2, r2, #16
	ldr	r5, .L54+16
	ldr	lr, [r4]
	orr	r2, r2, #8192
	ldr	r1, [r4, #60]
	orr	ip, ip, #16384
	strh	r2, [r5, #4]	@ movhi
	lsl	r0, r0, #6
	ldr	r2, [r4, #116]
	lsl	r3, r3, #6
	strh	ip, [r5, #2]	@ movhi
	strh	lr, [r5]	@ movhi
	ldr	ip, [r4, #112]
	ldr	lr, [r4, #56]
	add	r0, r0, #8
	add	r3, r3, #24
	orr	r0, r0, #4096
	orr	r3, r3, #12288
	orr	r2, r2, #16384
	orr	r1, r1, #16384
	strh	lr, [r5, #8]	@ movhi
	strh	r1, [r5, #10]	@ movhi
	strh	r0, [r5, #12]	@ movhi
	ldr	r1, .L54+20
	strh	ip, [r5, #16]	@ movhi
	strh	r2, [r5, #18]	@ movhi
	strh	r3, [r5, #20]	@ movhi
	mov	lr, pc
	bx	r1
	ldr	r4, .L54+24
	mov	r3, #512
	mov	r1, r5
	mov	r2, #117440512
	mov	r0, #3
	mov	lr, pc
	bx	r4
	ldr	r3, .L54+28
	ldrh	r3, [r3]
	tst	r3, #64
	beq	.L38
	ldr	r2, .L54+32
	ldrh	r2, [r2]
	tst	r2, #64
	beq	.L51
.L38:
	tst	r3, #128
	beq	.L39
	ldr	r2, .L54+32
	ldrh	r2, [r2]
	tst	r2, #128
	beq	.L52
.L39:
	tst	r3, #8
	beq	.L36
	ldr	r3, .L54+32
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L53
.L36:
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	bx	lr
.L52:
	ldr	r2, [r6]
	cmp	r2, #1
	addle	r2, r2, #1
	strle	r2, [r6]
	b	.L39
.L51:
	ldr	r2, [r6]
	cmp	r2, #0
	subgt	r2, r2, #1
	strgt	r2, [r6]
	b	.L38
.L53:
	ldr	r3, .L54+36
	mov	lr, pc
	bx	r3
	ldr	r3, .L54+40
	mov	lr, pc
	bx	r3
	ldr	r3, .L54+44
	mov	lr, pc
	bx	r3
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	b	goToGame
.L55:
	.align	2
.L54:
	.word	level
	.word	levelSprites
	.word	715827883
	.word	__aeabi_idivmod
	.word	shadowOAM
	.word	waitForVBlank
	.word	DMANow
	.word	oldButtons
	.word	buttons
	.word	initBugMoon
	.word	initHacking
	.word	initPortelyth
	.size	menu, .-menu
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
	push	{r4, r5, r6, r7, r8, lr}
	ldr	r3, .L66
	mov	lr, pc
	bx	r3
	mov	r3, #67108864
	mov	r1, #4352
	mov	r2, #7936
	ldr	r4, .L66+4
	strh	r1, [r3]	@ movhi
	strh	r2, [r3, #8]	@ movhi
	ldr	r3, [r4]
	cmp	r3, #1
	beq	.L62
	ldr	r6, .L66+8
	ldr	r5, .L66+12
.L57:
	cmp	r3, #0
	beq	.L64
	cmp	r3, #2
	beq	.L59
.L65:
	ldrh	r1, [r6]
	ldrh	r2, [r5]
.L60:
	mov	r3, #67108864
	mov	ip, #3
	ldr	r0, .L66+16
	strh	r1, [r3, #16]	@ movhi
	strh	r2, [r3, #18]	@ movhi
	ldr	r1, .L66+20
	str	ip, [r0]
	mov	lr, pc
	bx	r1
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L64:
	ldr	r3, .L66+24
	mov	r2, #100663296
	ldr	r1, .L66+28
	mov	r0, #3
	ldr	r7, .L66+32
	mov	lr, pc
	bx	r7
	mov	r3, #1024
	ldr	r2, .L66+36
	ldr	r1, .L66+40
	mov	r0, #3
	mov	lr, pc
	bx	r7
	mov	r1, #7
	mov	r2, #6
	ldr	r3, [r4]
	cmp	r3, #2
	str	r1, [r6]
	str	r2, [r5]
	bne	.L65
.L59:
	ldr	r3, .L66+44
	mov	r2, #100663296
	ldr	r1, .L66+48
	mov	r0, #3
	ldr	r4, .L66+32
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	ldr	r2, .L66+36
	ldr	r1, .L66+52
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #6
	mov	r2, r3
	mov	r1, r3
	str	r3, [r6]
	str	r3, [r5]
	b	.L60
.L62:
	ldr	r5, .L66+32
	mov	r3, #3952
	mov	r2, #100663296
	ldr	r1, .L66+56
	mov	r0, #3
	mov	lr, pc
	bx	r5
	mov	r3, #1024
	ldr	r2, .L66+36
	ldr	r1, .L66+60
	mov	r0, #3
	mov	lr, pc
	bx	r5
	mov	r3, #6
	mov	r2, #0
	ldr	r6, .L66+8
	ldr	r5, .L66+12
	str	r2, [r6]
	str	r3, [r5]
	ldr	r3, [r4]
	b	.L57
.L67:
	.align	2
.L66:
	.word	hideSprites
	.word	level
	.word	hOff
	.word	vOff
	.word	state
	.word	pauseSound
	.word	5408
	.word	hackingPauseTiles
	.word	DMANow
	.word	100726784
	.word	hackingPauseMap
	.word	6224
	.word	portelythPauseTiles
	.word	portelythPauseMap
	.word	bugMoonPauseTiles
	.word	bugMoonPauseMap
	.size	goToPause, .-goToPause
	.align	2
	.global	pause
	.syntax unified
	.arm
	.fpu softvfp
	.type	pause, %function
pause:
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
	ldr	r4, .L80+12
	mov	r3, #16384
	ldr	r2, .L80+16
	ldr	r1, .L80+20
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #256
	ldr	r2, .L80+24
	ldr	r1, .L80+28
	mov	r0, #3
	mov	lr, pc
	bx	r4
	pop	{r4, lr}
	b	goToMenu
.L78:
	ldr	r3, .L80+32
	mov	lr, pc
	bx	r3
	bl	goToGame
	ldrh	r3, [r4]
	b	.L69
.L81:
	.align	2
.L80:
	.word	oldButtons
	.word	waitForVBlank
	.word	buttons
	.word	DMANow
	.word	100728832
	.word	spritesheetTiles
	.word	83886592
	.word	spritesheetPal
	.word	unpauseSound
	.size	pause, .-pause
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
	push	{r4, r5, r6, lr}
	ldr	r3, .L84
	mov	lr, pc
	bx	r3
	mov	r4, #67108864
	mov	r1, #7936
	mov	r2, #4864
	ldr	r3, .L84+4
	ldr	r5, .L84+8
	strh	r1, [r4, #8]	@ movhi
	strh	r2, [r4]	@ movhi
	strh	r3, [r4, #10]	@ movhi
	mov	r2, #83886080
	mov	r3, #256
	ldr	r1, .L84+12
	mov	r0, #3
	mov	lr, pc
	bx	r5
	mov	r3, #1008
	mov	r2, #100663296
	ldr	r1, .L84+16
	mov	r0, #3
	mov	lr, pc
	bx	r5
	mov	r3, #1024
	ldr	r2, .L84+20
	ldr	r1, .L84+24
	mov	r0, #3
	mov	lr, pc
	bx	r5
	ldr	r3, .L84+28
	ldr	r2, .L84+32
	ldr	r1, .L84+36
	mov	r0, #3
	mov	lr, pc
	bx	r5
	mov	r3, #1024
	ldr	r2, .L84+40
	ldr	r1, .L84+44
	mov	r0, #3
	mov	lr, pc
	bx	r5
	mov	r5, #0
	mov	r3, #6
	mov	r0, #4
	ldr	ip, .L84+48
	ldr	r2, .L84+52
	ldr	r1, .L84+56
	str	r3, [ip]
	str	r5, [r2]
	strh	r3, [r4, #16]	@ movhi
	ldr	r2, .L84+60
	strh	r5, [r4, #18]	@ movhi
	strh	r5, [r4, #20]	@ movhi
	strh	r5, [r4, #22]	@ movhi
	str	r0, [r1]
	ldr	r4, .L84+64
	mov	lr, pc
	bx	r2
	mov	r3, r5
	ldr	r2, .L84+68
	ldr	r1, .L84+72
	ldr	r0, .L84+76
	mov	lr, pc
	bx	r4
	pop	{r4, r5, r6, lr}
	bx	lr
.L85:
	.align	2
.L84:
	.word	hideSprites
	.word	7688
	.word	DMANow
	.word	winPal
	.word	winTiles
	.word	100726784
	.word	winMap
	.word	8016
	.word	100696064
	.word	sonataTiles
	.word	100724736
	.word	sonataMap
	.word	hOff
	.word	vOff
	.word	state
	.word	stopSound
	.word	playSoundA
	.word	11025
	.word	10937
	.word	WinSound
	.size	goToWin, .-goToWin
	.align	2
	.global	game
	.syntax unified
	.arm
	.fpu softvfp
	.type	game, %function
game:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r4, .L108
	ldr	r3, [r4]
	cmp	r3, #1
	beq	.L104
.L87:
	cmp	r3, #0
	beq	.L105
	cmp	r3, #2
	beq	.L106
.L92:
	ldr	r3, .L108+4
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L86
	ldr	r3, .L108+8
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L107
.L86:
	pop	{r4, lr}
	bx	lr
.L105:
	ldr	r3, .L108+12
	mov	lr, pc
	bx	r3
	ldr	r3, .L108+16
	mov	lr, pc
	bx	r3
	ldr	r3, .L108+20
	ldr	r3, [r3]
	cmp	r3, #0
	beq	.L90
.L103:
	ldr	r3, [r4]
	cmp	r3, #2
	bne	.L92
.L106:
	ldr	r3, .L108+24
	mov	lr, pc
	bx	r3
	ldr	r3, .L108+28
	mov	lr, pc
	bx	r3
	ldr	r3, .L108+32
	ldr	r3, [r3]
	cmp	r3, #0
	beq	.L92
	bl	goToWin
	b	.L92
.L104:
	ldr	r3, .L108+36
	mov	lr, pc
	bx	r3
	ldr	r3, .L108+40
	mov	lr, pc
	bx	r3
	ldr	r3, .L108+44
	ldr	r3, [r3]
	cmp	r3, #0
	bne	.L88
.L102:
	ldr	r3, [r4]
	b	.L87
.L107:
	pop	{r4, lr}
	b	goToPause
.L88:
	bl	goToWin
	b	.L102
.L90:
	bl	goToWin
	b	.L103
.L109:
	.align	2
.L108:
	.word	level
	.word	oldButtons
	.word	buttons
	.word	updateHacking
	.word	drawHacking
	.word	enemyLife
	.word	updatePortelyth
	.word	drawPortelyth
	.word	portelythWon
	.word	updateBugMoon
	.word	drawBugMoon
	.word	bugMoonWon
	.size	game, .-game
	.align	2
	.global	win
	.syntax unified
	.arm
	.fpu softvfp
	.type	win, %function
win:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L117
	push	{r4, lr}
	mov	lr, pc
	bx	r3
	ldr	r3, .L117+4
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L110
	ldr	r3, .L117+8
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L116
.L110:
	pop	{r4, lr}
	bx	lr
.L116:
	pop	{r4, lr}
	b	goToStart
.L118:
	.align	2
.L117:
	.word	waitForVBlank
	.word	oldButtons
	.word	buttons
	.size	win, .-win
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
	push	{r4, r7, fp, lr}
	ldr	r3, .L131
	mov	lr, pc
	bx	r3
	ldr	r6, .L131+4
	ldr	r7, .L131+8
	ldr	r5, .L131+12
	ldr	fp, .L131+16
	ldr	r10, .L131+20
	ldr	r9, .L131+24
	ldr	r8, .L131+28
	ldr	r4, .L131+32
.L120:
	ldr	r2, [r6]
	ldrh	r3, [r7]
.L121:
	strh	r3, [r5]	@ movhi
	ldrh	r3, [r4, #48]
	strh	r3, [r7]	@ movhi
	cmp	r2, #4
	ldrls	pc, [pc, r2, asl #2]
	b	.L121
.L123:
	.word	.L122
	.word	.L124
	.word	.L125
	.word	.L126
	.word	.L127
.L127:
	ldr	r3, .L131+36
	mov	lr, pc
	bx	r3
	b	.L120
.L126:
	mov	lr, pc
	bx	r8
	b	.L120
.L125:
	mov	lr, pc
	bx	r9
	b	.L120
.L124:
	mov	lr, pc
	bx	r10
	b	.L120
.L122:
	mov	lr, pc
	bx	fp
	b	.L120
.L132:
	.align	2
.L131:
	.word	initialize
	.word	state
	.word	buttons
	.word	oldButtons
	.word	start
	.word	menu
	.word	game
	.word	pause
	.word	67109120
	.word	win
	.size	main, .-main
	.comm	buffer,41,4
	.comm	levelSprites,168,4
	.comm	level,4,4
	.comm	titleHasPlayed,4,4
	.comm	titleVOff,4,4
	.comm	vOff,4,4
	.comm	hOff,4,4
	.comm	shadowOAM,1024,4
	.comm	oldButtons,2,2
	.comm	buttons,2,2
	.comm	state,4,4
	.comm	portelythSprite,56,4
	.comm	bugSprite,56,4
	.comm	hackingSprite,56,4
	.comm	pCheckVOff,4,4
	.comm	pChecKHOff,4,4
	.comm	pCheckCol,4,4
	.comm	pCheckRow,4,4
	.comm	portelythfarVOff,4,4
	.comm	portelythfarHOff,4,4
	.comm	portelythVOff,4,4
	.comm	portelythHOff,4,4
	.comm	meufordSWidth,4,4
	.comm	meufordSOff,4,4
	.comm	meufordFWidth,4,4
	.comm	meufordFOff,4,4
	.comm	isClimbing,4,4
	.comm	orient,4,4
	.comm	curArcade,4,4
	.comm	portelythWon,4,4
	.comm	gamesCompleted,4,4
	.comm	gameStage,4,4
	.comm	hCheckVOff,4,4
	.comm	hCheckHOff,4,4
	.comm	hCheckCol,4,4
	.comm	hCheckRow,4,4
	.comm	hackingVOff,4,4
	.comm	hackingHOff,4,4
	.comm	enemyLife,4,4
	.comm	avaraOrient,4,4
	.comm	vangSWidth,4,4
	.comm	vangSOff,4,4
	.comm	vangFWidth,4,4
	.comm	vangFOff,4,4
	.comm	vangHOff,4,4
	.comm	isJumping,4,4
	.comm	vangOrient,4,4
	.comm	invincible,4,4
	.comm	bugMoonWon,4,4
	.comm	stage,4,4
	.comm	bugVOff,4,4
	.comm	bugHOff,4,4
	.comm	playerHealth,4,4
	.comm	shipsRemaining,4,4
	.comm	soundB,32,4
	.comm	soundA,32,4
	.ident	"GCC: (devkitARM release 47) 7.1.0"

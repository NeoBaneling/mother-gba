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
	.file	"hackingl.c"
	.text
	.align	2
	.global	goToHacking
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToHacking, %function
goToHacking:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r2, #67108864
	mov	r1, #24064
	push	{r4, lr}
	mov	r3, #256
	ldr	r4, .L4
	strh	r1, [r2, #8]	@ movhi
	mov	r0, #3
	mov	r2, #83886080
	ldr	r1, .L4+4
	mov	lr, pc
	bx	r4
	mov	r3, #2592
	mov	r2, #100663296
	ldr	r1, .L4+8
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #2048
	ldr	r2, .L4+12
	ldr	r1, .L4+16
	mov	r0, #3
	mov	lr, pc
	bx	r4
	ldr	r4, .L4+20
	mov	r3, #1
	ldr	r2, .L4+24
	ldr	r1, .L4+28
	ldr	r0, .L4+32
	mov	lr, pc
	bx	r4
	pop	{r4, lr}
	bx	lr
.L5:
	.align	2
.L4:
	.word	DMANow
	.word	hackingbgPal
	.word	hackingbgTiles
	.word	100724736
	.word	hackingbgMap
	.word	playSoundA
	.word	11025
	.word	3140928
	.word	Scifi
	.size	goToHacking, .-goToHacking
	.align	2
	.global	initVang
	.syntax unified
	.arm
	.fpu softvfp
	.type	initVang, %function
initVang:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, lr}
	mov	r5, #8
	mov	r2, #0
	mov	r0, #16
	mov	r8, #1
	mov	r7, #4
	mov	r4, #2
	mov	r1, #5
	mov	lr, #3
	mov	ip, #10
	ldr	r6, .L8
	ldr	r3, .L8+4
	ldr	r6, [r6]
	str	r5, [r3, #36]
	str	r6, [r3, #8]
	ldr	r5, .L8+8
	ldr	r6, .L8+12
	str	r2, [r5]
	ldr	r6, [r6]
	ldr	r5, .L8+16
	str	r8, [r3, #20]
	str	r7, [r3, #48]
	str	r6, [r3, #12]
	str	r2, [r3, #16]
	str	r2, [r3, #32]
	str	r2, [r3, #44]
	str	r0, [r3, #24]
	str	r2, [r5]
	str	r0, [r3, #28]
	ldr	r2, .L8+20
	ldr	r3, .L8+24
	str	r4, [r2]
	str	r1, [r3]
	ldr	r0, .L8+28
	ldr	r2, .L8+32
	ldr	r3, .L8+36
	str	lr, [r2]
	str	r1, [r0]
	str	ip, [r3]
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L9:
	.align	2
.L8:
	.word	hCheckRow
	.word	vang
	.word	vangOrient
	.word	hCheckCol
	.word	isJumping
	.word	vangHOff
	.word	vangFOff
	.word	vangFWidth
	.word	vangSOff
	.word	vangSWidth
	.size	initVang, .-initVang
	.align	2
	.global	initHacking
	.syntax unified
	.arm
	.fpu softvfp
	.type	initHacking, %function
initHacking:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r0, #10752
	mov	r2, #32
	push	{r4, r5, r6, r7, r8, r9, r10, lr}
	mov	r4, #1
	mov	r6, #4
	mov	r5, #8
	ldr	r1, .L14
	ldr	r3, .L14+4
	str	r0, [r1]
	str	r2, [r3]
	mov	r7, #16
	bl	initVang
	mov	r9, #232
	mov	r0, #0
	mov	r8, #408
	mov	lr, r4
	mov	ip, r6
	mov	r1, r5
	ldr	r3, .L14+8
	str	r0, [r3, #32]
	str	r0, [r3, #44]
	str	r0, [r3, #36]
	str	r4, [r3, #16]
	str	r4, [r3, #20]
	str	r9, [r3, #8]
	str	r8, [r3, #12]
	str	r7, [r3, #24]
	str	r7, [r3, #28]
	str	r6, [r3, #48]
	ldr	r3, .L14+12
	mov	r2, r0
	str	r0, [r3]
	ldr	r0, .L14+16
	ldr	r3, .L14+20
	str	r5, [r0]
	add	r0, r3, #448
.L11:
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
	bne	.L11
	ldr	lr, .L14+24
	ldr	ip, .L14+28
	ldr	r0, .L14+32
	ldr	r1, .L14+36
	ldr	r3, .L14+40
	str	r2, [lr]
	str	r2, [ip]
	str	r2, [r0]
	str	r2, [r1]
	str	r2, [r3]
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	bx	lr
.L15:
	.align	2
.L14:
	.word	hCheckRow
	.word	hCheckCol
	.word	avara
	.word	avaraOrient
	.word	enemyLife
	.word	playerBullets
	.word	hCheckHOff
	.word	hCheckVOff
	.word	hackingHOff
	.word	hackingVOff
	.word	invincible
	.size	initHacking, .-initHacking
	.global	__aeabi_idivmod
	.align	2
	.global	animateVang
	.syntax unified
	.arm
	.fpu softvfp
	.type	animateVang, %function
animateVang:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r2, #8
	push	{r4, r5, r6, lr}
	ldr	r4, .L38
	ldr	r3, .L38+4
	ldr	r5, [r4, #32]
	smull	r0, r1, r5, r3
	ldr	r6, [r4, #36]
	asr	r3, r5, #31
	rsb	r3, r3, r1, asr #1
	cmp	r6, #8
	add	r3, r3, r3, lsl #1
	ldreq	r6, [r4, #40]
	strne	r6, [r4, #40]
	cmp	r5, r3, lsl #2
	str	r2, [r4, #36]
	bne	.L19
	ldr	r0, [r4, #44]
	ldr	r3, .L38+8
	add	r0, r0, #1
	ldr	r1, [r4, #48]
	mov	lr, pc
	bx	r3
	str	r1, [r4, #44]
.L19:
	ldr	r3, .L38+12
	ldrh	r3, [r3, #48]
	ands	r3, r3, #16
	moveq	r1, #9
	ldreq	r2, .L38+16
	streq	r3, [r2]
	ldr	r3, .L38+12
	ldrh	r3, [r3, #48]
	streq	r1, [r4, #36]
	tst	r3, #32
	moveq	r2, #4096
	moveq	r1, #9
	ldreq	r3, .L38+16
	streq	r2, [r3]
	ldr	r3, .L38+20
	ldr	r3, [r3]
	streq	r1, [r4, #36]
	cmp	r3, #0
	movne	r3, #10
	strne	r3, [r4, #36]
	ldr	r3, .L38+24
	ldrh	r3, [r3]
	tst	r3, #2
	beq	.L23
	ldr	r3, .L38+28
	ldrh	r3, [r3]
	ands	r3, r3, #2
	bne	.L23
	mov	r2, #11
	cmp	r6, r2
	str	r3, [r4, #44]
	str	r2, [r4, #36]
	beq	.L24
.L25:
	add	r5, r5, #1
	str	r5, [r4, #32]
	pop	{r4, r5, r6, lr}
	bx	lr
.L23:
	cmp	r6, #11
	bne	.L25
	ldr	r3, [r4, #44]
	cmp	r3, #3
	beq	.L37
.L24:
	mov	r3, #11
	add	r5, r5, #1
	str	r3, [r4, #36]
	str	r5, [r4, #32]
	pop	{r4, r5, r6, lr}
	bx	lr
.L37:
	mov	r3, #8
	add	r5, r5, #1
	str	r3, [r4, #36]
	str	r3, [r4, #40]
	str	r5, [r4, #32]
	pop	{r4, r5, r6, lr}
	bx	lr
.L39:
	.align	2
.L38:
	.word	vang
	.word	715827883
	.word	__aeabi_idivmod
	.word	67109120
	.word	vangOrient
	.word	isJumping
	.word	oldButtons
	.word	buttons
	.size	animateVang, .-animateVang
	.align	2
	.global	updateVang
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateVang, %function
updateVang:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	ldr	r3, .L128
	ldrh	ip, [r3]
	tst	ip, #1
	sub	sp, sp, #12
	beq	.L41
	ldr	r3, .L128+4
	ldrh	r3, [r3]
	tst	r3, #1
	bne	.L41
	mov	r2, #5
	ldr	r4, .L128+8
.L42:
	mov	r3, #200
	add	fp, r4, #8
	tst	ip, #64
	str	r2, [r4, #20]
	str	r3, [r4, #16]
	ldm	fp, {fp, lr}
	bne	.L113
	ldr	r5, .L128+12
.L46:
	ldr	r3, [r4, #28]
	ldr	r7, .L128+16
	asr	r2, fp, #8
	add	r3, r2, r3
	ldr	r1, [r7]
	sub	r3, r3, #1
	lsl	r3, r3, #9
	add	r1, lr, r1
	add	r0, r1, r3
	lsl	r0, r0, #1
	ldrh	r0, [r5, r0]
	cmp	r0, #0
	beq	.L77
	ldr	ip, .L128+20
	str	ip, [sp]
	ldr	ip, .L128+24
	mov	r6, #0
	ldr	r8, .L128+28
	str	ip, [sp, #4]
	ldr	r10, .L128+32
	ldr	r9, .L128+36
	b	.L54
.L56:
	ldr	r3, .L128+40
	ldr	r3, [r3]
	cmp	r3, #0
	bne	.L121
.L58:
	mov	ip, #1
	ldr	r0, .L128+44
	str	ip, [r4, #20]
	ldr	r0, [r0]
	ldr	ip, .L128+48
	ldr	lr, [sp]
	ldr	ip, [ip]
	str	r0, [r4, #8]
	ldr	r0, [r10]
	str	ip, [r4, #12]
	str	r0, [lr]
	ldr	ip, [r9]
	ldr	lr, [sp, #4]
	ldr	r0, .L128+52
	str	r3, [r4, #16]
	str	ip, [lr]
	mov	lr, pc
	bx	fp
.L57:
	ldr	r3, [r4, #16]
	ldr	fp, [r4, #8]
	add	ip, r6, #1
	add	r2, ip, fp
	cmp	r3, ip
	asr	r2, r2, #8
	ldr	lr, [r4, #12]
	ble	.L122
	ldr	r3, [r4, #28]
	ldr	r1, [r7]
	add	r3, r2, r3
	sub	r3, r3, #1
	lsl	r3, r3, #9
	add	r1, lr, r1
	add	r0, r3, r1
	lsl	r0, r0, #1
	ldrh	r0, [r5, r0]
	cmp	r0, #0
	beq	.L123
	mov	r6, ip
.L54:
	ldr	lr, [r8]
	lsl	r2, r2, #9
	add	ip, r2, r1
	add	r1, r1, lr
	sub	r1, r1, #1
	add	r2, r1, r2
	add	r1, r1, r3
	lsl	r1, r1, #1
	ldrh	r3, [r5, r1]
	cmp	r3, #0
	lsl	lr, r2, #1
	lsl	ip, ip, #1
	ldr	r2, .L128+56
	ldr	r1, .L128+60
	ldr	fp, .L128+64
	beq	.L124
	ldrh	ip, [r5, ip]
	cmp	r0, #31
	cmpne	ip, #31
	beq	.L56
	ldrh	r0, [r5, lr]
	cmp	r3, #31
	cmpne	r0, #31
	bne	.L57
	ldr	r3, .L128+40
	ldr	r3, [r3]
	cmp	r3, #0
	beq	.L58
.L121:
	mov	r1, #0
	ldr	r2, .L128+68
	ldr	r0, .L128
	sub	r3, r6, #1
	add	fp, r4, #8
	str	r3, [r4, #16]
	ldrh	ip, [r0]
	str	r1, [r2]
	ldm	fp, {fp, lr}
	b	.L51
.L41:
	ldr	r4, .L128+8
	ldr	r3, [r4, #20]
	cmp	r3, #1
	subgt	r2, r3, #1
	bgt	.L42
	ldr	r2, [r4, #16]
	add	fp, r4, #8
	add	r3, r2, #200
	tst	ip, #64
	str	r3, [r4, #16]
	ldm	fp, {fp, lr}
	bne	.L44
.L120:
	ldr	r5, .L128+12
.L45:
	cmp	r3, #0
	bgt	.L46
	ldr	r2, .L128+20
	str	r2, [sp]
	ldr	r2, .L128+24
	str	r2, [sp, #4]
	b	.L51
.L113:
	mov	r2, #0
.L44:
	ldr	r1, .L128+4
	ldrh	r1, [r1]
	tst	r1, #64
	bne	.L120
	ldr	r10, .L128+68
	ldr	r1, [r10]
	cmp	r1, #0
	bne	.L120
	sub	r3, r2, #1488
	sub	r3, r3, #12
	cmp	r3, #0
	str	r3, [r4, #16]
	ldrge	r5, .L128+12
	bge	.L47
	ldr	r2, .L128+72
	ldr	r0, .L128+16
	ldr	r7, [r4, #28]
	ldr	r9, [r2]
	ldr	r6, [r0]
	rsb	r2, r7, fp, asr #8
	add	r2, r2, r9
	lsl	r2, r2, #9
	add	r6, lr, r6
	add	r0, r2, r6
	ldr	r5, .L128+12
	lsl	r0, r0, #1
	ldrh	r0, [r5, r0]
	cmp	r0, #0
	beq	.L48
	ldr	r8, .L128+28
	ldr	r8, [r8]
	add	r8, r6, r8
	sub	r8, r8, #1
	b	.L49
.L50:
	sub	r1, r1, #1
	add	r2, fp, r1
	rsb	r2, r7, r2, asr #8
	add	r2, r2, r9
	lsl	r2, r2, #9
	add	r0, r2, r6
	cmp	r1, r3
	lsl	r0, r0, #1
	beq	.L47
	ldrh	r0, [r5, r0]
	cmp	r0, #0
	beq	.L48
.L49:
	add	r2, r8, r2
	lsl	r2, r2, #1
	ldrh	r2, [r5, r2]
	cmp	r2, #0
	bne	.L50
.L48:
	mov	r2, #1
	mvn	r3, #199
	str	r2, [r10]
	ldr	r2, .L128+20
	str	r2, [sp]
	ldr	r2, .L128+24
	sub	r1, r1, r7, lsl #8
	add	fp, fp, r1
	str	r3, [r4, #16]
	str	r2, [sp, #4]
	b	.L51
.L124:
	ldr	r2, .L128
	add	fp, r4, #8
	ldrh	ip, [r2]
	ldm	fp, {fp, lr}
	sub	r3, r6, #1
.L53:
	mov	r1, #0
	ldr	r2, .L128+68
	str	r3, [r4, #16]
	str	r1, [r2]
.L51:
	ldr	r2, .L128+76
	ldrh	r1, [r2, #48]
	add	fp, fp, r3
	asr	r2, fp, #8
	tst	r1, #32
	str	fp, [r4, #8]
	lsl	r0, r2, #9
	bne	.L60
	ldr	r3, [r4, #20]
	sub	r6, lr, r3
	cmp	r6, #0
	ble	.L60
	ldr	r1, .L128+80
	ldr	r1, [r1]
	add	r1, lr, r1
	sub	r3, r1, r3
	add	r1, r3, r0
	lsl	r1, r1, #1
	ldrh	r1, [r5, r1]
	cmp	r1, #0
	bne	.L125
.L60:
	ldr	r3, .L128+76
	ldrh	r3, [r3, #48]
	tst	r3, #16
	bne	.L61
	ldr	r7, [r4, #20]
	ldr	r1, [r4, #24]
	add	r6, r7, lr
	rsb	r1, r1, #512
	cmp	r6, r1
	bge	.L61
	ldr	r3, .L128+80
	ldr	r1, .L128+84
	ldr	r3, [r3]
	ldr	r1, [r1]
	add	r3, lr, r3
	add	r3, r3, r1
	sub	r3, r3, #1
	add	r3, r3, r7
	add	r1, r3, r0
	lsl	r1, r1, #1
	ldrh	r1, [r5, r1]
	cmp	r1, #0
	bne	.L126
.L61:
	add	r1, lr, r0
	lsl	r1, r1, #1
	ldrh	r1, [r5, r1]
	ldr	r3, .L128+88
	cmp	r1, r3
	beq	.L62
	ldr	r1, [r4, #28]
	add	r1, r2, r1
	sub	r1, r1, #1
	lsl	r1, r1, #9
	add	r6, r1, lr
	lsl	r6, r6, #1
	ldrh	r6, [r5, r6]
	cmp	r6, r3
	beq	.L62
	ldr	r6, [r4, #24]
	add	r6, lr, r6
	sub	r6, r6, #1
	add	r0, r6, r0
	lsl	r0, r0, #1
	ldrh	r0, [r5, r0]
	cmp	r0, r3
	beq	.L62
	add	r1, r1, r6
	lsl	r1, r1, #1
	ldrh	r1, [r5, r1]
	cmp	r1, r3
	beq	.L62
.L63:
	tst	ip, #2
	beq	.L64
	ldr	r3, .L128+4
	ldrh	r3, [r3]
	ands	r3, r3, #2
	bne	.L64
	ldr	ip, .L128+92
	mov	r1, ip
.L68:
	ldr	r0, [r1, #52]
	cmp	r0, #0
	bne	.L127
	add	r3, r3, #1
	cmp	r3, #8
	add	r1, r1, #56
	bne	.L68
.L64:
	ldr	ip, [sp, #4]
	ldr	r3, [sp]
	ldr	r1, [ip]
	ldr	r3, [r3]
	sub	r2, r2, r1
	sub	lr, lr, r3
	cmp	r1, #0
	stm	r4, {r2, lr}
	ble	.L69
	ldr	r0, [r4, #28]
	add	r0, r0, r0, lsr #31
	add	r0, r2, r0, asr #1
	cmp	r0, #80
	suble	r1, r1, #1
	strle	r1, [ip]
	cmp	r1, #95
	ble	.L69
.L71:
	cmp	r3, #0
	ble	.L73
	ldr	r2, [r4, #24]
	add	r2, r2, r2, lsr #31
	add	r2, lr, r2, asr #1
	cmp	r2, #120
	ldrle	r2, [sp]
	suble	r3, r3, #1
	strle	r3, [r2]
	cmp	r3, #272
	blt	.L73
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	b	animateVang
.L62:
	ldr	r1, .L128+44
	ldr	r0, [sp]
	str	fp, [r1]
	ldr	r0, [r0]
	ldr	r1, .L128+32
	ldr	r3, .L128+48
	str	r0, [r1]
	ldr	r1, [sp, #4]
	str	lr, [r3]
	ldr	r1, [r1]
	ldr	r3, .L128+36
	str	r1, [r3]
	b	.L63
.L73:
	ldr	r2, [r4, #24]
	add	r2, r2, r2, lsr #31
	add	lr, lr, r2, asr #1
	cmp	lr, #119
	ldrgt	r2, [sp]
	addgt	r3, r3, #1
	strgt	r3, [r2]
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	b	animateVang
.L69:
	ldr	r0, [r4, #28]
	add	r0, r0, r0, lsr #31
	add	r2, r2, r0, asr #1
	cmp	r2, #79
	ble	.L71
	ldr	r2, [r4, #16]
	cmp	r2, #0
	ble	.L71
	add	r1, r1, r2, asr #8
	cmp	r1, #96
	movgt	r2, #96
	ldr	r0, [sp, #4]
	str	r1, [r0]
	strgt	r2, [r0]
	b	.L71
.L122:
	ldr	r2, .L128
	ldrh	ip, [r2]
	b	.L51
.L123:
	ldr	r3, .L128
	ldrh	ip, [r3]
	mov	r3, r6
	b	.L53
.L125:
	ldr	r1, [r4, #28]
	add	r1, r2, r1
	sub	r1, r1, #1
	add	r3, r3, r1, lsl #9
	lsl	r3, r3, #1
	ldrh	r3, [r5, r3]
	cmp	r3, #0
	movne	lr, r6
	strne	r6, [r4, #12]
	b	.L60
.L126:
	ldr	r1, [r4, #28]
	add	r1, r2, r1
	sub	r1, r1, #1
	add	r3, r3, r1, lsl #9
	lsl	r3, r3, #1
	ldrh	r3, [r5, r3]
	cmp	r3, #0
	movne	lr, r6
	strne	r6, [r4, #12]
	b	.L61
.L127:
	ldr	r1, .L128+96
	lsl	r0, r3, #3
	ldr	r5, [r1]
	sub	r1, r0, r3
	add	r2, r2, #6
	add	r1, ip, r1, lsl #3
	cmp	r5, #0
	str	r2, [r1, #8]
	str	lr, [r1, #12]
	moveq	r2, #4
	mov	lr, #0
	mvnne	r2, #3
	sub	r3, r0, r3
	add	ip, ip, r3, lsl #3
	str	r2, [r1, #20]
	mov	r3, lr
	ldr	r2, .L128+56
	str	lr, [ip, #52]
	ldr	r1, .L128+100
	ldr	r0, .L128+104
	ldr	r5, .L128+64
	mov	lr, pc
	bx	r5
	add	r2, r4, #8
	ldm	r2, {r2, lr}
	asr	r2, r2, #8
	b	.L64
.L47:
	mov	r2, #1
	str	r2, [r10]
	b	.L45
.L77:
	ldr	r2, .L128+20
	str	r2, [sp]
	ldr	r2, .L128+24
	mvn	r3, #0
	str	r2, [sp, #4]
	b	.L53
.L129:
	.align	2
.L128:
	.word	oldButtons
	.word	buttons
	.word	vang
	.word	hackingcmBitmap
	.word	vangFOff
	.word	hackingHOff
	.word	hackingVOff
	.word	vangFWidth
	.word	hCheckHOff
	.word	hCheckVOff
	.word	invincible
	.word	hCheckRow
	.word	hCheckCol
	.word	VangReset
	.word	11025
	.word	11231
	.word	playSoundB
	.word	isJumping
	.word	vangHOff
	.word	67109120
	.word	vangSOff
	.word	vangSWidth
	.word	32736
	.word	playerBullets
	.word	vangOrient
	.word	13406
	.word	Blaster
	.size	updateVang, .-updateVang
	.align	2
	.global	drawVang
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawVang, %function
drawVang:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r1, .L131
	ldr	ip, .L131+4
	ldr	r0, [r1, #44]
	ldr	r2, [r1, #4]
	ldr	r3, [r1, #36]
	ldr	ip, [ip]
	add	r3, r3, r0, lsl #5
	lsl	r2, r2, #23
	ldr	r0, .L131+8
	ldrb	r1, [r1]	@ zero_extendqisi2
	lsr	r2, r2, #23
	orr	ip, ip, #16384
	lsl	r3, r3, #1
	orr	r2, r2, ip
	orr	r3, r3, #8192
	strh	r2, [r0, #2]	@ movhi
	strh	r1, [r0]	@ movhi
	strh	r3, [r0, #4]	@ movhi
	bx	lr
.L132:
	.align	2
.L131:
	.word	vang
	.word	vangOrient
	.word	shadowOAM
	.size	drawVang, .-drawVang
	.align	2
	.global	drawHacking
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawHacking, %function
drawHacking:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	bl	drawVang
	ldr	r3, .L139
	ldr	r1, .L139+4
	ldr	lr, [r3, #4]
	ldr	r0, .L139+8
	ldr	r6, [r3, #44]
	and	lr, lr, r1
	mov	r4, r1
	ldr	r1, [r3, #36]
	ldr	r0, [r0]
	ldr	ip, .L139+12
	add	r1, r1, r6, lsl #5
	ldrb	r5, [r3]	@ zero_extendqisi2
	lsl	r1, r1, #1
	orr	r0, r0, #16384
	ldr	r3, .L139+16
	orr	r0, r0, lr
	strh	r1, [ip, #12]	@ movhi
	ldr	lr, .L139+20
	ldr	r1, .L139+24
	mov	r2, ip
	strh	r0, [ip, #10]	@ movhi
	strh	r5, [ip, #8]	@ movhi
	add	ip, r3, #448
.L136:
	ldr	r0, [r3, #52]
	cmp	r0, #0
	bne	.L134
	ldr	r0, [r3, #4]
	ldrb	r5, [r3]	@ zero_extendqisi2
	and	r0, r0, r4
	strh	lr, [r2, #20]	@ movhi
	strh	r0, [r2, #18]	@ movhi
	strh	r5, [r2, #16]	@ movhi
.L134:
	ldr	r0, [r1, #52]
	cmp	r0, #0
	add	r3, r3, #56
	bne	.L135
	ldr	r0, [r1, #4]
	ldrb	r5, [r1]	@ zero_extendqisi2
	and	r0, r0, r4
	strh	lr, [r2, #84]	@ movhi
	strh	r0, [r2, #82]	@ movhi
	strh	r5, [r2, #80]	@ movhi
.L135:
	cmp	r3, ip
	add	r1, r1, #56
	add	r2, r2, #8
	bne	.L136
	ldr	r3, .L139+28
	mov	lr, pc
	bx	r3
	ldr	r4, .L139+32
	mov	r3, #512
	mov	r2, #117440512
	ldr	r1, .L139+12
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #67108864
	ldr	r2, .L139+36
	ldrh	r1, [r2]
	ldr	r2, .L139+40
	ldrh	r2, [r2]
	strh	r1, [r3, #16]	@ movhi
	pop	{r4, r5, r6, lr}
	strh	r2, [r3, #18]	@ movhi
	bx	lr
.L140:
	.align	2
.L139:
	.word	avara
	.word	511
	.word	avaraOrient
	.word	shadowOAM
	.word	playerBullets
	.word	16768
	.word	enemyBullets
	.word	waitForVBlank
	.word	DMANow
	.word	hackingHOff
	.word	hackingVOff
	.size	drawHacking, .-drawHacking
	.align	2
	.global	initAvara
	.syntax unified
	.arm
	.fpu softvfp
	.type	initAvara, %function
initAvara:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, lr}
	mov	r0, #1
	mov	lr, #4
	mov	r2, #0
	mov	r5, #232
	mov	r4, #408
	mov	r1, #16
	mov	ip, #8
	ldr	r3, .L143
	str	lr, [r3, #48]
	str	r0, [r3, #16]
	ldr	lr, .L143+4
	str	r0, [r3, #20]
	ldr	r0, .L143+8
	str	r5, [r3, #8]
	str	r4, [r3, #12]
	str	r2, [lr]
	str	r1, [r3, #24]
	str	r1, [r3, #28]
	str	r2, [r3, #32]
	str	r2, [r3, #44]
	str	r2, [r3, #36]
	str	ip, [r0]
	pop	{r4, r5, lr}
	bx	lr
.L144:
	.align	2
.L143:
	.word	avara
	.word	avaraOrient
	.word	enemyLife
	.size	initAvara, .-initAvara
	.align	2
	.global	updateAvara
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateAvara, %function
updateAvara:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r1, #0
	push	{r4, r5, r6, r7, r8, r9, r10, lr}
	ldr	r4, .L180
	ldr	r3, [r4, #36]
	cmp	r3, #0
	ldr	r2, [r4, #32]
	strne	r3, [r4, #40]
	ldr	r3, .L180+4
	smull	r6, r7, r2, r3
	asr	r3, r2, #31
	rsb	r3, r3, r7, asr #1
	add	r3, r3, r3, lsl #1
	cmp	r2, r3, lsl #2
	sub	sp, sp, #16
	str	r1, [r4, #36]
	bne	.L147
	ldr	r0, [r4, #44]
	ldr	r3, .L180+8
	add	r0, r0, #1
	ldr	r1, [r4, #48]
	mov	lr, pc
	bx	r3
	str	r1, [r4, #44]
.L147:
	ldr	r6, .L180+12
	ldr	ip, [r6, #12]
	ldr	lr, [r6, #24]
	ldr	r1, [r4, #12]
	add	r3, ip, lr
	add	r3, r3, #20
	cmp	r1, r3
	ldr	r0, [r4, #8]
	ldr	r2, [r4, #28]
	ble	.L148
	ldr	r3, [r4, #20]
	sub	r3, r1, r3
	add	r5, r3, r0, lsl #9
	ldr	r7, .L180+16
	lsl	r5, r5, #1
	ldrh	r5, [r7, r5]
	cmp	r5, #0
	bne	.L178
.L148:
	ldr	r3, [r4, #24]
	add	r5, r3, r1
	add	r7, r5, #20
	cmp	ip, r7
	ble	.L149
	ldr	r7, [r4, #20]
	sub	r5, r5, #1
	add	r5, r5, r7
	add	r8, r5, r0, lsl #9
	ldr	r9, .L180+16
	lsl	r8, r8, #1
	ldrh	r8, [r9, r8]
	cmp	r8, #0
	bne	.L179
.L149:
	ldr	r5, [r6, #8]
	ldr	r6, [r6, #28]
	add	lr, lr, #16
	sub	ip, ip, #16
	asr	r5, r5, #8
	str	r5, [sp]
	str	lr, [sp, #12]
	str	ip, [sp, #4]
	add	r3, r3, #48
	sub	r1, r1, #48
	sub	r0, r0, #8
	str	r6, [sp, #8]
	ldr	r5, .L180+20
	mov	lr, pc
	bx	r5
	cmp	r0, #0
	beq	.L150
	ldr	r5, .L180+24
	ldr	r3, [r4, #8]
	ldr	r2, [r4, #12]
	ldr	r9, .L180+28
	ldr	r8, .L180+32
	ldr	r7, .L180+36
	add	r6, r5, #448
.L154:
	ldr	r1, [r5, #52]
	cmp	r1, #0
	add	r1, r3, #6
	beq	.L151
	ldr	r3, [r9]
	cmp	r3, #0
	moveq	r3, #4
	mvnne	r3, #3
	mov	r10, #0
	str	r1, [r5, #8]
	str	r2, [r5, #12]
	str	r3, [r5, #20]
	ldr	r2, .L180+40
	mov	r3, r10
	ldr	r1, .L180+44
	mov	r0, r8
	str	r10, [r5, #52]
	mov	lr, pc
	bx	r7
	mov	r3, #3
	str	r10, [r4, #44]
	str	r3, [r4, #36]
	ldr	r2, [r4, #12]
	ldr	r3, [r4, #8]
.L151:
	add	r5, r5, #56
	cmp	r6, r5
	bne	.L154
.L155:
	ldr	r1, [r4, #40]
	cmp	r1, #3
	bne	.L156
	ldr	r0, [r4, #44]
	cmp	r0, #3
	moveq	r1, #0
	strne	r1, [r4, #36]
	streq	r1, [r4, #36]
	streq	r1, [r4, #40]
.L156:
	ldr	r0, .L180+48
	ldr	r1, .L180+52
	ldr	ip, [r0]
	ldr	r0, [r1]
	ldr	r1, [r4, #32]
	sub	r3, r3, ip
	sub	r2, r2, r0
	add	r1, r1, #1
	str	r3, [r4]
	str	r2, [r4, #4]
	str	r1, [r4, #32]
	add	sp, sp, #16
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	bx	lr
.L150:
	ldr	r3, [r4, #8]
	ldr	r2, [r4, #12]
	b	.L155
.L179:
	add	r8, r0, r2
	sub	r8, r8, #1
	add	r5, r5, r8, lsl #9
	lsl	r5, r5, #1
	ldrh	r5, [r9, r5]
	cmp	r5, #0
	beq	.L149
	mov	r8, #0
	mov	r5, #1
	add	r1, r1, r7
	ldr	r7, .L180+28
	str	r1, [r4, #12]
	str	r8, [r7]
	str	r5, [r4, #36]
	b	.L149
.L178:
	add	r5, r0, r2
	sub	r5, r5, #1
	add	r5, r3, r5, lsl #9
	lsl	r5, r5, #1
	ldrh	r5, [r7, r5]
	cmp	r5, #0
	beq	.L148
	mov	r5, #4096
	mov	r7, #1
	mov	r1, r3
	str	r3, [r4, #12]
	ldr	r3, .L180+28
	str	r7, [r4, #36]
	str	r5, [r3]
	b	.L148
.L181:
	.align	2
.L180:
	.word	avara
	.word	715827883
	.word	__aeabi_idivmod
	.word	vang
	.word	hackingcmBitmap
	.word	collision
	.word	enemyBullets
	.word	avaraOrient
	.word	Blaster
	.word	playSoundB
	.word	11025
	.word	13406
	.word	hackingVOff
	.word	hackingHOff
	.size	updateAvara, .-updateAvara
	.align	2
	.global	drawAvara
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawAvara, %function
drawAvara:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r1, .L184
	ldr	r2, .L184+4
	ldr	r3, [r1, #4]
	str	lr, [sp, #-4]!
	ldr	r0, [r2]
	ldr	lr, [r1, #44]
	ldr	r2, [r1, #36]
	lsl	r3, r3, #23
	ldrb	ip, [r1]	@ zero_extendqisi2
	add	r2, r2, lr, lsl #5
	ldr	r1, .L184+8
	lsr	r3, r3, #23
	orr	r0, r0, #16384
	orr	r3, r3, r0
	lsl	r2, r2, #1
	strh	r3, [r1, #10]	@ movhi
	strh	ip, [r1, #8]	@ movhi
	strh	r2, [r1, #12]	@ movhi
	ldr	lr, [sp], #4
	bx	lr
.L185:
	.align	2
.L184:
	.word	avara
	.word	avaraOrient
	.word	shadowOAM
	.size	drawAvara, .-drawAvara
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
	str	lr, [sp, #-4]!
	mov	r2, #0
	mov	lr, #4
	mov	r1, #8
	mov	ip, #1
	ldr	r3, .L190
	add	r0, r3, #448
.L187:
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
	bne	.L187
	ldr	lr, [sp], #4
	bx	lr
.L191:
	.align	2
.L190:
	.word	playerBullets
	.size	initBullets, .-initBullets
	.align	2
	.global	initBullet
	.syntax unified
	.arm
	.fpu softvfp
	.type	initBullet, %function
initBullet:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	cmp	r3, #0
	moveq	r3, #4
	mvnne	r3, #3
	push	{r4, lr}
	str	r3, [r0, #20]
	mov	r3, #0
	add	r1, r1, #6
	str	r2, [r0, #12]
	str	r1, [r0, #8]
	str	r3, [r0, #52]
	ldr	r4, .L196
	ldr	r2, .L196+4
	ldr	r1, .L196+8
	ldr	r0, .L196+12
	mov	lr, pc
	bx	r4
	pop	{r4, lr}
	bx	lr
.L197:
	.align	2
.L196:
	.word	playSoundB
	.word	11025
	.word	13406
	.word	Blaster
	.size	initBullet, .-initBullet
	.align	2
	.global	updatePlayerBullet
	.syntax unified
	.arm
	.fpu softvfp
	.type	updatePlayerBullet, %function
updatePlayerBullet:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, lr}
	mov	r4, r0
	add	r2, r4, #24
	ldm	r2, {r2, r6}
	ldr	r0, .L219
	sub	sp, sp, #20
	add	ip, r4, #8
	ldr	r3, [r0, #24]
	ldm	ip, {ip, lr}
	str	r2, [sp, #12]
	ldr	r2, [r0, #28]
	str	r6, [sp, #8]
	add	r0, r0, #8
	mov	r5, r1
	ldr	r6, .L219+4
	ldm	r0, {r0, r1}
	stm	sp, {ip, lr}
	mov	lr, pc
	bx	r6
	cmp	r0, #0
	beq	.L199
	mov	ip, #1
	ldr	r0, .L219+8
	lsl	r1, r5, #3
	ldrh	r3, [r0, r1]
	ldr	r2, .L219+12
	orr	r3, r3, #512
	strh	r3, [r0, r1]	@ movhi
	ldr	r3, [r2]
	sub	r3, r3, #1
	str	r3, [r2]
	str	ip, [r4, #52]
.L199:
	ldr	r3, [r4, #12]
	ldr	r1, [r4, #20]
	add	ip, r3, r1
	cmp	ip, #0
	ldr	r2, [r4, #8]
	ble	.L200
	ldr	r0, [r4, #24]
	add	r0, r3, r0
	add	r0, r0, r1
	cmp	r0, #512
	blt	.L218
.L200:
	mov	lr, #1
	ldr	ip, .L219+8
	lsl	r1, r5, #3
	ldrh	r0, [ip, r1]
	orr	r0, r0, #512
	strh	r0, [ip, r1]	@ movhi
	str	lr, [r4, #52]
.L201:
	ldr	r0, .L219+16
	ldr	r1, .L219+20
	ldr	r0, [r0]
	ldr	r1, [r1]
	sub	r2, r2, r0
	sub	r3, r3, r1
	stm	r4, {r2, r3}
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, r6, r7, lr}
	bx	lr
.L218:
	sub	r1, r3, r1
	lsl	r6, r2, #9
	add	lr, r6, r1
	ldr	r7, .L219+24
	lsl	lr, lr, #1
	ldrh	lr, [r7, lr]
	cmp	lr, #0
	beq	.L200
	ldr	lr, [r4, #28]
	add	lr, r2, lr
	sub	lr, lr, #1
	lsl	lr, lr, #9
	add	r1, r1, lr
	lsl	r1, r1, #1
	ldrh	r1, [r7, r1]
	cmp	r1, #0
	beq	.L200
	sub	r0, r0, #1
	add	r6, r6, r0
	lsl	r6, r6, #1
	ldrh	r1, [r7, r6]
	cmp	r1, #0
	beq	.L200
	add	r0, lr, r0
	lsl	r0, r0, #1
	ldrh	r1, [r7, r0]
	cmp	r1, #0
	strne	ip, [r4, #12]
	movne	r3, ip
	beq	.L200
	b	.L201
.L220:
	.align	2
.L219:
	.word	avara
	.word	collision
	.word	shadowOAM
	.word	enemyLife
	.word	hackingVOff
	.word	hackingHOff
	.word	hackingcmBitmap
	.size	updatePlayerBullet, .-updatePlayerBullet
	.align	2
	.global	updateEnemyBullet
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateEnemyBullet, %function
updateEnemyBullet:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, lr}
	mov	r4, r0
	ldr	r7, [r0, #24]
	ldr	r5, .L242
	sub	sp, sp, #20
	add	ip, r4, #8
	ldr	r0, [r0, #28]
	ldm	ip, {ip, lr}
	ldr	r3, [r5, #24]
	ldr	r2, [r5, #28]
	str	r7, [sp, #12]
	mov	r6, r1
	ldr	r1, [r5, #12]
	str	r0, [sp, #8]
	ldr	r0, [r5, #8]
	ldr	r7, .L242+4
	stm	sp, {ip, lr}
	asr	r0, r0, #8
	mov	lr, pc
	bx	r7
	cmp	r0, #0
	bne	.L239
	ldr	lr, .L242+8
	ldr	r5, .L242+12
.L222:
	ldr	r3, [r4, #12]
	ldr	r1, [r4, #20]
	add	ip, r3, r1
	cmp	ip, #0
	ldr	r2, [r4, #8]
	ble	.L223
	ldr	r0, [r4, #24]
	add	r0, r3, r0
	add	r0, r0, r1
	cmp	r0, #512
	blt	.L241
.L223:
	mov	r7, #1
	ldr	ip, .L242+16
	lsl	r1, r6, #3
	ldrh	r0, [ip, r1]
	orr	r0, r0, #512
	strh	r0, [ip, r1]	@ movhi
	str	r7, [r4, #52]
.L224:
	ldr	r0, [r5]
	ldr	r1, [lr]
	sub	r2, r2, r0
	sub	r3, r3, r1
	stm	r4, {r2, r3}
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, lr}
	bx	lr
.L239:
	mov	r0, #1
	ldr	r1, .L242+16
	lsl	r2, r6, #3
	ldr	ip, .L242+20
	ldrh	r3, [r1, r2]
	ldr	lr, [ip]
	ldr	ip, .L242+24
	orr	r3, r3, #512
	ldr	ip, [ip]
	strh	r3, [r1, r2]	@ movhi
	ldr	r2, .L242+28
	ldr	r3, .L242+32
	str	lr, [r5, #8]
	ldr	r2, [r2]
	ldr	r3, [r3]
	str	ip, [r5, #12]
	ldr	lr, .L242+8
	ldr	r5, .L242+12
	str	r2, [lr]
	str	r3, [r5]
	str	r0, [r4, #52]
	b	.L222
.L241:
	sub	r1, r3, r1
	lsl	r8, r2, #9
	add	r7, r8, r1
	ldr	r9, .L242+36
	lsl	r7, r7, #1
	ldrh	r7, [r9, r7]
	cmp	r7, #0
	beq	.L223
	ldr	r7, [r4, #28]
	add	r7, r2, r7
	sub	r7, r7, #1
	lsl	r7, r7, #9
	add	r1, r1, r7
	lsl	r1, r1, #1
	ldrh	r1, [r9, r1]
	cmp	r1, #0
	beq	.L223
	sub	r0, r0, #1
	add	r8, r8, r0
	lsl	r8, r8, #1
	ldrh	r1, [r9, r8]
	cmp	r1, #0
	beq	.L223
	add	r0, r7, r0
	lsl	r0, r0, #1
	ldrh	r1, [r9, r0]
	cmp	r1, #0
	strne	ip, [r4, #12]
	movne	r3, ip
	beq	.L223
	b	.L224
.L243:
	.align	2
.L242:
	.word	vang
	.word	collision
	.word	hackingHOff
	.word	hackingVOff
	.word	shadowOAM
	.word	hCheckRow
	.word	hCheckCol
	.word	hCheckHOff
	.word	hCheckVOff
	.word	hackingcmBitmap
	.size	updateEnemyBullet, .-updateEnemyBullet
	.align	2
	.global	updateHacking
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateHacking, %function
updateHacking:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	bl	updateVang
	mov	r4, #10
	bl	updateAvara
	ldr	r6, .L256
	ldr	r5, .L256+4
	b	.L247
.L245:
	ldr	r3, [r5, #52]
	cmp	r3, #0
	beq	.L254
.L246:
	add	r4, r4, #1
	cmp	r4, #18
	add	r5, r5, #56
	add	r6, r6, #56
	beq	.L255
.L247:
	ldr	r3, [r6, #52]
	cmp	r3, #0
	bne	.L245
	sub	r1, r4, #8
	mov	r0, r6
	bl	updatePlayerBullet
	ldr	r3, [r5, #52]
	cmp	r3, #0
	bne	.L246
.L254:
	mov	r1, r4
	mov	r0, r5
	bl	updateEnemyBullet
	b	.L246
.L255:
	ldr	r3, .L256+8
	ldrh	r3, [r3]
	tst	r3, #512
	beq	.L244
	ldr	r3, .L256+12
	ldrh	r3, [r3]
	tst	r3, #512
	ldreq	r2, .L256+16
	ldreq	r3, [r2]
	addeq	r3, r3, #1
	andeq	r3, r3, #1
	streq	r3, [r2]
.L244:
	pop	{r4, r5, r6, lr}
	bx	lr
.L257:
	.align	2
.L256:
	.word	playerBullets
	.word	enemyBullets
	.word	oldButtons
	.word	buttons
	.word	invincible
	.size	updateHacking, .-updateHacking
	.align	2
	.global	hideBullet
	.syntax unified
	.arm
	.fpu softvfp
	.type	hideBullet, %function
hideBullet:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	ip, #1
	ldr	r2, .L259
	lsl	r1, r1, #3
	ldrh	r3, [r2, r1]
	orr	r3, r3, #512
	strh	r3, [r2, r1]	@ movhi
	str	ip, [r0, #52]
	bx	lr
.L260:
	.align	2
.L259:
	.word	shadowOAM
	.size	hideBullet, .-hideBullet
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
	ldr	r3, [r0, #4]
	ldr	ip, .L263
	str	lr, [sp, #-4]!
	lsl	r1, r1, #3
	ldrb	lr, [r0]	@ zero_extendqisi2
	lsl	r3, r3, #23
	ldr	r0, .L263+4
	add	r2, ip, r1
	lsr	r3, r3, #23
	strh	lr, [ip, r1]	@ movhi
	strh	r3, [r2, #2]	@ movhi
	strh	r0, [r2, #4]	@ movhi
	ldr	lr, [sp], #4
	bx	lr
.L264:
	.align	2
.L263:
	.word	shadowOAM
	.word	16768
	.size	drawBullet, .-drawBullet
	.comm	enemyBullets,448,4
	.comm	playerBullets,448,4
	.comm	avara,56,4
	.comm	vang,56,4
	.comm	soundB,32,4
	.comm	soundA,32,4
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
	.ident	"GCC: (devkitARM release 47) 7.1.0"

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
	.file	"portelythl.c"
	.text
	.align	2
	.global	goToPortelyth
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToPortelyth, %function
goToPortelyth:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r3, #67108864
	mov	r0, #56320
	mov	r1, #4864
	ldr	r2, .L4
	push	{r4, lr}
	ldr	r4, .L4+4
	strh	r0, [r3, #8]	@ movhi
	strh	r1, [r3]	@ movhi
	strh	r2, [r3, #10]	@ movhi
	ldr	r1, .L4+8
	mov	r3, #656
	mov	r2, #100663296
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #4096
	ldr	r2, .L4+12
	ldr	r1, .L4+16
	mov	r0, #3
	mov	lr, pc
	bx	r4
	ldr	r3, .L4+20
	ldr	r2, .L4+24
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
	.word	6916
	.word	DMANow
	.word	portelythbgTiles
	.word	100720640
	.word	portelythbgMap
	.word	14176
	.word	100679680
	.word	portelythFarTiles
	.word	100718592
	.word	portelythFarMap
	.word	playSoundA
	.word	11025
	.word	491904
	.word	Scare
	.size	goToPortelyth, .-goToPortelyth
	.align	2
	.global	goToPortelythLevel
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToPortelythLevel, %function
goToPortelythLevel:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r3, .L13
	mov	lr, pc
	bx	r3
	ldr	r4, .L13+4
	mov	r3, #256
	mov	r2, #83886080
	ldr	r1, .L13+8
	mov	r0, #3
	mov	lr, pc
	bx	r4
	ldr	r3, .L13+12
	ldr	r3, [r3]
	cmp	r3, #1
	beq	.L8
	cmp	r3, #2
	beq	.L9
	cmp	r3, #0
	beq	.L12
	pop	{r4, lr}
	bx	lr
.L12:
	mov	r3, #16384
	ldr	r2, .L13+16
	ldr	r1, .L13+20
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #256
	ldr	r2, .L13+24
	ldr	r1, .L13+28
	mov	r0, #3
	mov	lr, pc
	bx	r4
	pop	{r4, lr}
	b	goToPortelyth
.L9:
	ldr	r3, .L13+32
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	bx	lr
.L8:
	ldr	r3, .L13+36
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	bx	lr
.L14:
	.align	2
.L13:
	.word	hideSprites
	.word	DMANow
	.word	portelythbgPal
	.word	gameStage
	.word	100728832
	.word	spritesheetTiles
	.word	83886592
	.word	spritesheetPal
	.word	goToShruden
	.word	goToSpaceInvaders
	.size	goToPortelythLevel, .-goToPortelythLevel
	.align	2
	.global	initMeuford
	.syntax unified
	.arm
	.fpu softvfp
	.type	initMeuford, %function
initMeuford:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, lr}
	mov	r4, #12
	mov	r2, #0
	mov	r0, #16
	mvn	r8, #79
	mov	r6, #1
	mov	r5, #4
	mov	r1, #5
	mov	lr, #3
	mov	ip, #10
	ldr	r3, .L17
	ldr	r7, .L17+4
	str	r4, [r3, #36]
	ldr	r4, .L17+8
	ldr	r7, [r7]
	str	r2, [r4]
	ldr	r4, .L17+12
	str	r8, [r3, #8]
	str	r2, [r4]
	str	r7, [r3, #12]
	str	r6, [r3, #20]
	str	r5, [r3, #48]
	str	r2, [r3, #16]
	str	r2, [r3, #32]
	str	r2, [r3, #44]
	str	r0, [r3, #24]
	ldr	r4, .L17+16
	str	r0, [r3, #28]
	ldr	r3, .L17+20
	str	r2, [r4]
	str	r1, [r3]
	ldr	r0, .L17+24
	ldr	r2, .L17+28
	ldr	r3, .L17+32
	str	lr, [r2]
	str	r1, [r0]
	str	ip, [r3]
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L18:
	.align	2
.L17:
	.word	meuford
	.word	pCheckCol
	.word	isClimbing
	.word	isJumping
	.word	orient
	.word	meufordFOff
	.word	meufordFWidth
	.word	meufordSOff
	.word	meufordSWidth
	.size	initMeuford, .-initMeuford
	.global	__aeabi_idivmod
	.align	2
	.global	animateMeuford
	.syntax unified
	.arm
	.fpu softvfp
	.type	animateMeuford, %function
animateMeuford:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r2, #12
	push	{r4, r5, r6, lr}
	ldr	r4, .L36
	ldr	r3, [r4, #36]
	cmp	r3, #12
	ldr	r5, [r4, #32]
	strne	r3, [r4, #40]
	ldr	r3, .L36+4
	smull	r0, r1, r5, r3
	asr	r3, r5, #31
	rsb	r3, r3, r1, asr #1
	add	r3, r3, r3, lsl #1
	cmp	r5, r3, lsl #2
	str	r2, [r4, #36]
	bne	.L21
	ldr	r0, [r4, #44]
	ldr	r3, .L36+8
	add	r0, r0, #1
	ldr	r1, [r4, #48]
	mov	lr, pc
	bx	r3
	str	r1, [r4, #44]
.L21:
	ldr	r3, .L36+12
	ldrh	r3, [r3, #48]
	ands	r3, r3, #16
	moveq	r1, #13
	ldreq	r2, .L36+16
	streq	r3, [r2]
	ldr	r3, .L36+12
	ldrh	r3, [r3, #48]
	streq	r1, [r4, #36]
	tst	r3, #32
	moveq	r2, #4096
	moveq	r1, #13
	ldreq	r3, .L36+16
	streq	r2, [r3]
	ldr	r3, .L36+20
	ldr	r3, [r3]
	streq	r1, [r4, #36]
	cmp	r3, #0
	movne	r3, #14
	strne	r3, [r4, #36]
	ldr	r3, .L36+24
	ldr	r3, [r3]
	cmp	r3, #0
	movne	r3, #15
	add	r5, r5, #1
	strne	r3, [r4, #36]
	str	r5, [r4, #32]
	pop	{r4, r5, r6, lr}
	bx	lr
.L37:
	.align	2
.L36:
	.word	meuford
	.word	715827883
	.word	__aeabi_idivmod
	.word	67109120
	.word	orient
	.word	isJumping
	.word	isClimbing
	.size	animateMeuford, .-animateMeuford
	.align	2
	.global	updateMeuford
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateMeuford, %function
updateMeuford:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	ldr	r3, .L157
	ldr	r4, .L157+4
	ldrh	r3, [r3]
	tst	r3, #1
	ldr	r3, [r4, #8]
	sub	sp, sp, #36
	str	r3, [sp, #16]
	ldr	r10, [r4, #12]
	beq	.L147
	ldr	r3, .L157+8
	ldrh	r3, [r3]
	tst	r3, #1
	beq	.L140
.L147:
	ldr	ip, .L157+12
.L39:
	ldr	r3, .L157+16
	ldrh	r3, [r3, #48]
	tst	r3, #2
	bne	.L53
	ldr	r3, .L157+20
	ldr	r2, [sp, #16]
	ldr	r3, [r3]
	ldr	r5, [r4, #20]
	asr	r0, r2, #8
	add	r3, r10, r3
	sub	r2, r3, r5
	lsl	lr, r0, #9
	add	r6, lr, r2
	ldr	r1, .L157+24
	lsl	r6, r6, #1
	ldrh	r6, [r1, r6]
	cmp	r6, #0
	bne	.L150
.L54:
	mov	r5, #0
	mov	r2, #1
	mov	r0, #256
	ldr	lr, .L157+28
	str	r5, [lr]
	ldr	lr, .L157+16
	ldrh	lr, [lr, #48]
	tst	lr, #64
	str	r2, [r4, #20]
	str	r2, [ip]
	str	r0, [r4, #16]
	bne	.L55
	ldr	r2, [sp, #16]
	sub	ip, r2, #256
	asr	r2, ip, #8
	sub	r2, r2, #1
	lsl	r2, r2, #9
	add	r0, r3, r2
	lsl	r0, r0, #1
	ldrh	r0, [r1, r0]
	cmp	r0, r5
	bne	.L151
.L55:
	ldr	r2, .L157+16
	ldrh	r2, [r2, #48]
	tst	r2, #128
	bne	.L149
	ldr	lr, [sp, #16]
	ldr	r2, [r4, #28]
	add	r0, lr, #256
	asr	ip, r0, #8
	add	r2, ip, r2
	sub	r2, r2, #1
	lsl	r2, r2, #9
	str	ip, [sp, #20]
	add	ip, r3, r2
	lsl	ip, ip, #1
	ldrh	ip, [r1, ip]
	cmp	ip, #0
	beq	.L152
	ldr	ip, .L157+32
	ldr	ip, [ip]
	add	r3, r3, ip
	add	r3, r3, r2
	add	r1, r1, r3, lsl #1
	ldrh	r3, [r1, #-2]
	cmp	r3, #0
	beq	.L149
	str	r0, [r4, #8]
	ldr	r5, .L157+36
	ldr	r6, .L157+40
.L57:
	ldr	r2, [r6]
	ldr	r1, [r5]
	ldr	r3, [sp, #20]
	sub	r10, r10, r1
	sub	r3, r3, r2
	cmp	r2, #0
	stm	r4, {r3, r10}
	ble	.L68
	ldr	r0, [r4, #28]
	add	r0, r0, r0, lsr #31
	add	r0, r3, r0, asr #1
	cmp	r0, #80
	suble	r2, r2, #1
	strle	r2, [r6]
	cmp	r2, #352
	blt	.L68
.L70:
	cmp	r1, #0
	ble	.L72
	ldr	r3, [r4, #24]
	add	r3, r3, r3, lsr #31
	add	r3, r10, r3, asr #1
	cmp	r3, #120
	bgt	.L73
	ldr	r2, .L157+44
	ldr	r3, [r2]
	sub	r1, r1, #1
	sub	r3, r3, #1
	str	r1, [r5]
	str	r3, [r2]
.L73:
	cmp	r1, #272
	blt	.L72
.L74:
	add	sp, sp, #36
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	b	animateMeuford
.L150:
	ldr	r6, [r4, #28]
	add	r0, r0, r6
	sub	r0, r0, #1
	lsl	r0, r0, #9
	add	r2, r2, r0
	lsl	r2, r2, #1
	ldrh	r2, [r1, r2]
	cmp	r2, #0
	beq	.L54
	ldr	r2, .L157+32
	ldr	r2, [r2]
	add	r2, r3, r2
	sub	r2, r2, #1
	add	r5, r2, r5
	add	lr, lr, r5
	lsl	lr, lr, #1
	ldrh	r2, [r1, lr]
	cmp	r2, #0
	beq	.L54
	add	r5, r0, r5
	lsl	r5, r5, #1
	ldrh	r2, [r1, r5]
	cmp	r2, #0
	beq	.L54
.L53:
	mov	r1, #0
	ldr	r3, [r4, #16]
	ldr	r0, [sp, #16]
	add	r2, r3, #160
	add	r0, r2, r0
	cmp	r2, r1
	str	r2, [r4, #16]
	asr	r2, r0, #8
	str	r0, [sp, #24]
	str	r2, [sp, #20]
	str	r1, [ip]
	ble	.L148
	ldr	r2, .L157+48
	ldr	fp, [r4, #28]
	ldr	r0, [sp, #20]
	ldr	r8, [r2]
	add	r5, fp, r0
	sub	r5, r5, #1
	lsl	r5, r5, #9
	add	r8, r10, r8
	add	r2, r5, r8
	ldr	r1, .L157+24
	lsl	r2, r2, #1
	ldrh	r7, [r1, r2]
	cmp	r7, #0
	beq	.L61
	ldr	r2, .L157+52
	ldr	r9, [r2]
	ldr	r2, [sp, #24]
	sub	r3, r2, r3
	sub	ip, r3, #160
	add	r9, r8, r9
	str	r10, [sp, #28]
	sub	r9, r9, #1
	sub	r6, r2, #1
	mov	r3, r0
	mov	r10, ip
	b	.L62
.L154:
	ldrh	ip, [r1, lr]
	cmp	r2, #31
	cmpne	ip, #31
	beq	.L64
	cmp	r10, r6
	beq	.L153
	ldrh	r7, [r1, r0]
	cmp	r7, #0
	sub	r6, r6, #1
	beq	.L145
.L62:
	lsl	r3, r3, #9
	add	ip, r3, r8
	add	r3, r9, r3
	add	r2, r9, r5
	lsl	lr, r3, #1
	asr	r3, r6, #8
	add	r0, r3, fp
	lsl	r2, r2, #1
	sub	r0, r0, #1
	ldrh	r2, [r1, r2]
	lsl	r5, r0, #9
	add	r0, r5, r8
	cmp	r2, #0
	lsl	ip, ip, #1
	lsl	r0, r0, #1
	beq	.L145
	ldrh	ip, [r1, ip]
	cmp	r7, #31
	cmpne	ip, #31
	bne	.L154
.L64:
	mov	ip, #0
	mov	lr, #1
	ldr	r3, .L157+56
	ldr	r2, .L157+60
	ldr	r1, .L157+64
	ldr	r0, .L157+68
	ldr	r3, [r3]
	ldr	r2, [r2]
	ldr	r1, [r1]
	ldr	r0, [r0]
	ldr	r5, .L157+36
	ldr	r6, .L157+40
	str	r3, [r4, #8]
	str	r2, [r4, #12]
	mov	r3, ip
	ldr	r2, .L157+72
	str	r1, [r5]
	str	r0, [r6]
	ldr	r1, .L157+76
	ldr	r0, .L157+80
	ldr	r7, .L157+84
	str	ip, [r4, #16]
	str	lr, [r4, #20]
	mov	lr, pc
	bx	r7
	ldr	r2, [r4, #8]
	ldr	r3, [r4, #16]
	add	r3, r2, r3
	str	r3, [sp, #24]
	asr	r3, r3, #8
	str	r3, [sp, #20]
	ldr	r10, [r4, #12]
.L60:
	ldr	r3, .L157+16
	ldrh	r3, [r3, #48]
	tst	r3, #32
	ldr	r3, [sp, #24]
	str	r3, [r4, #8]
	bne	.L67
	ldr	r2, [r4, #20]
	sub	r1, r10, r2
	cmp	r1, #0
	ble	.L67
	ldr	r3, .L157+20
	ldr	r3, [r3]
	ldr	ip, [sp, #20]
	add	r3, r10, r3
	sub	r3, r3, r2
	add	r2, r3, ip, lsl #9
	ldr	r0, .L157+24
	lsl	r2, r2, #1
	ldrh	r2, [r0, r2]
	cmp	r2, #0
	beq	.L67
	ldr	r2, [r4, #28]
	add	r2, ip, r2
	sub	r2, r2, #1
	add	r3, r3, r2, lsl #9
	lsl	r3, r3, #1
	ldrh	r3, [r0, r3]
	cmp	r3, #0
	movne	r10, r1
	strne	r1, [r4, #12]
.L67:
	ldr	r3, .L157+16
	ldrh	r3, [r3, #48]
	tst	r3, #16
	bne	.L57
	ldr	r3, [r4, #20]
	ldr	r2, [r4, #24]
	add	r3, r10, r3
	rsb	r2, r2, #512
	cmp	r3, r2
	bge	.L57
	ldr	r2, .L157+20
	ldr	r1, .L157+32
	ldr	r2, [r2]
	ldr	r1, [r1]
	add	r2, r10, r2
	ldr	ip, [sp, #20]
	add	r2, r2, r1
	add	r1, r2, ip, lsl #9
	ldr	r0, .L157+24
	lsl	r1, r1, #1
	ldrh	r1, [r0, r1]
	cmp	r1, #0
	beq	.L57
	ldr	r1, [r4, #28]
	add	r1, ip, r1
	sub	r1, r1, #1
	add	r2, r2, r1, lsl #9
	lsl	r2, r2, #1
	ldrh	r2, [r0, r2]
	cmp	r2, #0
	movne	r10, r3
	strne	r3, [r4, #12]
	b	.L57
.L140:
	ldr	r2, [sp, #16]
	ldr	r3, .L157+88
	asr	r7, r2, #8
	lsl	r0, r7, #9
	ldr	r2, [r3]
	ldr	r1, .L157+24
	add	r3, r0, r10
	lsl	r3, r3, #1
	cmp	r2, #5
	ldrh	r2, [r1, r3]
	beq	.L155
.L40:
	ldr	ip, .L157+92
	cmp	r2, ip
	beq	.L42
	ldr	lr, [r4, #28]
	add	r3, lr, r7
	sub	r3, r3, #1
	lsl	r3, r3, #9
	add	r2, r3, r10
	lsl	r2, r2, #1
	ldrh	r2, [r1, r2]
	cmp	r2, ip
	beq	.L42
	ldr	r2, [r4, #24]
	add	r2, r10, r2
	sub	r2, r2, #1
	add	r0, r2, r0
	lsl	r0, r0, #1
	ldrh	r0, [r1, r0]
	cmp	r0, ip
	beq	.L42
	add	r3, r3, r2
	lsl	r3, r3, #1
	ldrh	r3, [r1, r3]
	cmp	r3, ip
	beq	.L42
	ldr	r6, .L157+28
	ldr	r0, [r6]
	cmp	r0, #0
	ldr	ip, .L157+12
	bne	.L39
	ldr	r3, [ip]
	cmp	r3, #0
	movne	r3, #3
	ldr	r5, [r4, #16]
	sub	r5, r5, #1696
	sub	r5, r5, #4
	strne	r0, [ip]
	strne	r3, [r4, #20]
	cmp	r5, #0
	str	r5, [r4, #16]
	bge	.L48
	sub	r3, r7, lr
	lsl	r3, r3, #9
	add	r7, r3, r10
	lsl	r7, r7, #1
	ldrh	r7, [r1, r7]
	cmp	r7, #0
	beq	.L49
	add	r3, r2, r3
	lsl	r3, r3, #1
	ldrh	r3, [r1, r3]
	cmp	r3, #0
	ldrne	r7, [sp, #16]
	bne	.L51
	b	.L49
.L52:
	ldrh	r8, [r1, r8]
	cmp	r8, #0
	beq	.L49
	ldrh	r3, [r1, r3]
	cmp	r3, #0
	beq	.L49
.L51:
	sub	r0, r0, #1
	add	r3, r7, r0
	rsb	r3, lr, r3, asr #8
	lsl	r3, r3, #9
	add	r8, r3, r10
	cmp	r0, r5
	add	r3, r2, r3
	lsl	r8, r8, #1
	lsl	r3, r3, #1
	bne	.L52
.L48:
	mov	r3, #1
	str	r3, [r6]
	b	.L39
.L72:
	ldr	r3, [r4, #24]
	add	r3, r3, r3, lsr #31
	add	r10, r10, r3, asr #1
	cmp	r10, #119
	ble	.L74
	ldr	r2, .L157+44
	ldr	r3, [r2]
	add	r1, r1, #1
	add	r3, r3, #1
	str	r1, [r5]
	str	r3, [r2]
	add	sp, sp, #36
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	b	animateMeuford
.L68:
	ldr	r0, [r4, #28]
	add	r0, r0, r0, lsr #31
	add	r3, r3, r0, asr #1
	cmp	r3, #79
	ble	.L70
	ldr	r3, [r4, #16]
	add	r2, r2, r3, asr #8
	cmp	r2, #352
	movgt	r3, #352
	str	r2, [r6]
	strgt	r3, [r6]
	b	.L70
.L149:
	ldr	r3, [sp, #16]
	asr	r3, r3, #8
	str	r3, [sp, #20]
	ldr	r5, .L157+36
	ldr	r6, .L157+40
	b	.L57
.L151:
	ldr	r0, .L157+32
	ldr	r0, [r0]
	add	r0, r3, r0
	add	r2, r0, r2
	add	r2, r1, r2, lsl #1
	ldrh	r2, [r2, #-2]
	cmp	r2, r5
	strne	ip, [sp, #16]
	strne	ip, [r4, #8]
	b	.L55
.L152:
	asr	r3, lr, #8
	str	r3, [sp, #20]
	ldr	r5, .L157+36
	ldr	r6, .L157+40
	b	.L57
.L155:
	cmp	r2, #992
	beq	.L41
	ldr	r3, [r4, #28]
	add	r3, r7, r3
	sub	r3, r3, #1
	lsl	r3, r3, #9
	add	ip, r3, r10
	lsl	ip, ip, #1
	ldrh	ip, [r1, ip]
	cmp	ip, #992
	beq	.L41
	ldr	ip, [r4, #24]
	add	ip, r10, ip
	sub	ip, ip, #1
	add	lr, ip, r0
	lsl	lr, lr, #1
	ldrh	lr, [r1, lr]
	cmp	lr, #992
	beq	.L41
	add	r3, r3, ip
	lsl	r3, r3, #1
	ldrh	r3, [r1, r3]
	cmp	r3, #992
	bne	.L40
.L41:
	mov	r2, #1
	ldr	r3, .L157+96
	ldr	ip, .L157+12
	str	r2, [r3]
	b	.L39
.L42:
	mov	r6, #0
	ldr	r5, .L157+100
	ldr	r7, .L157+104
	ldr	ip, [sp, #16]
.L46:
	ldr	r3, [r5, #16]
	cmp	r3, #0
	bne	.L156
.L44:
	add	r6, r6, #1
	cmp	r6, #5
	add	r5, r5, #20
	bne	.L46
	str	ip, [sp, #16]
	ldr	ip, .L157+12
	b	.L39
.L156:
	asr	ip, ip, #8
	ldm	r5, {r0, r1, r2, r3}
	ldr	lr, [r4, #24]
	str	ip, [sp]
	ldr	ip, [r4, #28]
	str	r10, [sp, #4]
	str	lr, [sp, #12]
	str	ip, [sp, #8]
	mov	lr, pc
	bx	r7
	cmp	r0, #0
	bne	.L45
	ldr	ip, [r4, #8]
	ldr	r10, [r4, #12]
	b	.L44
.L145:
	ldr	r10, [sp, #28]
.L61:
	mov	r3, #0
	mov	r2, #1
	ldr	r1, .L157+28
	str	r3, [r4, #16]
	str	r3, [r1]
	ldr	r3, [sp, #16]
	str	r2, [r4, #20]
	asr	r2, r3, #8
	str	r2, [sp, #20]
	str	r3, [sp, #24]
	ldr	r5, .L157+36
	ldr	r6, .L157+40
	b	.L60
.L153:
	ldr	r10, [sp, #28]
.L148:
	ldr	r5, .L157+36
	ldr	r6, .L157+40
	b	.L60
.L45:
	ldr	r2, .L157+108
	ldr	r3, .L157+112
	str	r6, [r2]
	mov	lr, pc
	bx	r3
	subs	r3, r0, #0
	and	r3, r3, #1
	rsblt	r3, r3, #0
	ldr	r2, .L157+116
	add	r3, r3, #1
	str	r3, [r2]
	bl	goToPortelythLevel
	ldr	r3, [r4, #8]
	ldr	r10, [r4, #12]
	str	r3, [sp, #16]
	b	.L147
.L49:
	mov	r3, #0
	ldr	r2, [sp, #16]
	sub	r0, r0, lr, lsl #8
	add	r2, r2, r0
	str	r2, [sp, #16]
	str	r2, [r4, #8]
	str	r3, [r4, #16]
	b	.L48
.L158:
	.align	2
.L157:
	.word	oldButtons
	.word	meuford
	.word	buttons
	.word	isClimbing
	.word	67109120
	.word	meufordSOff
	.word	portelythcmBitmap
	.word	isJumping
	.word	meufordSWidth
	.word	portelythHOff
	.word	portelythVOff
	.word	portelythfarHOff
	.word	meufordFOff
	.word	meufordFWidth
	.word	pCheckRow
	.word	pCheckCol
	.word	pCheckHOff
	.word	pCheckVOff
	.word	11025
	.word	18698
	.word	MeufordReset
	.word	playSoundB
	.word	gamesCompleted
	.word	32736
	.word	portelythWon
	.word	arcades
	.word	collision
	.word	curArcade
	.word	rand
	.word	gameStage
	.size	updateMeuford, .-updateMeuford
	.align	2
	.global	updatePortelyth
	.syntax unified
	.arm
	.fpu softvfp
	.type	updatePortelyth, %function
updatePortelyth:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	ldr	r4, .L175
	ldr	r3, [r4]
	cmp	r3, #1
	beq	.L161
	cmp	r3, #2
	beq	.L162
	cmp	r3, #0
	beq	.L172
.L159:
	pop	{r4, r5, r6, lr}
	bx	lr
.L172:
	bl	updateMeuford
	ldr	ip, .L175+4
	mov	r3, ip
	ldr	r1, .L175+8
	ldr	r2, .L175+12
	ldr	r4, [r1]
	ldr	lr, [r2]
	add	r0, ip, #280
.L165:
	ldr	r2, [r3, #52]
	cmp	r2, #0
	addeq	r1, r3, #8
	ldmeq	r1, {r1, r2}
	subeq	r1, r1, r4
	subeq	r2, r2, lr
	stmeq	r3, {r1, r2}
	add	r3, r3, #56
	cmp	r0, r3
	bne	.L165
	ldr	r3, .L175+16
	ldrh	r3, [r3]
	tst	r3, #512
	beq	.L159
	ldr	r3, .L175+20
	ldrh	r3, [r3]
	ands	r3, r3, #512
	bne	.L159
	ldr	r1, .L175+24
	ldr	r2, [r1]
	add	r2, r2, #4
	str	r3, [ip, #52]
	str	r3, [ip, #108]
	str	r3, [ip, #164]
	str	r3, [ip, #220]
	str	r2, [r1]
	b	.L159
.L162:
	ldr	r5, .L175+28
	ldr	r3, .L175+32
	mov	lr, pc
	bx	r3
	ldr	r3, [r5]
	cmp	r3, #0
	beq	.L173
.L169:
	cmn	r3, #1
	bne	.L159
	ldr	r3, .L175+36
	mov	lr, pc
	bx	r3
	ldr	r3, .L175+40
	mov	lr, pc
	bx	r3
	b	.L159
.L161:
	ldr	r3, .L175+44
	mov	lr, pc
	bx	r3
	ldr	r3, .L175+48
	ldr	r3, [r3]
	cmp	r3, #0
	beq	.L174
.L168:
	ldr	r3, .L175+52
	ldr	r3, [r3]
	cmp	r3, #0
	bne	.L159
	ldr	r3, .L175+56
	mov	lr, pc
	bx	r3
	b	.L159
.L174:
	ldr	lr, .L175+24
	ldr	r1, .L175+60
	ldr	r2, [lr]
	ldr	r1, [r1]
	ldr	ip, .L175+4
	ldr	r0, .L175+64
	str	r3, [r4]
	add	r1, r1, r1, lsl #2
	add	r4, r2, #1
	rsb	r2, r2, r2, lsl #3
	add	r1, r0, r1, lsl #2
	add	r2, ip, r2, lsl #3
	ldr	r0, .L175+56
	str	r3, [r2, #52]
	str	r3, [r1, #16]
	str	r4, [lr]
	mov	lr, pc
	bx	r0
	bl	goToPortelythLevel
	b	.L168
.L173:
	ldr	ip, .L175+24
	ldr	r1, .L175+60
	ldr	r2, [ip]
	ldr	r0, .L175+4
	add	lr, r2, #1
	ldr	r1, [r1]
	rsb	r2, r2, r2, lsl #3
	add	r2, r0, r2, lsl #3
	ldr	r0, .L175+64
	add	r1, r1, r1, lsl #2
	add	r1, r0, r1, lsl #2
	str	r3, [r2, #52]
	str	r3, [r1, #16]
	ldr	r0, .L175+40
	str	r3, [r4]
	str	lr, [ip]
	mov	lr, pc
	bx	r0
	bl	goToPortelythLevel
	ldr	r3, [r5]
	b	.L169
.L176:
	.align	2
.L175:
	.word	gameStage
	.word	lights
	.word	portelythVOff
	.word	portelythHOff
	.word	oldButtons
	.word	buttons
	.word	gamesCompleted
	.word	coinsRemaining
	.word	updateShruden
	.word	drawInit
	.word	initShruden
	.word	updateSpaceInvaders
	.word	enemiesRemaining
	.word	lives
	.word	initSpaceInvaders
	.word	curArcade
	.word	arcades
	.size	updatePortelyth, .-updatePortelyth
	.align	2
	.global	drawMeuford
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawMeuford, %function
drawMeuford:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r1, .L178
	ldr	ip, .L178+4
	ldr	r0, [r1, #44]
	ldr	r2, [r1, #4]
	ldr	r3, [r1, #36]
	ldr	ip, [ip]
	add	r3, r3, r0, lsl #5
	lsl	r2, r2, #23
	ldr	r0, .L178+8
	ldrb	r1, [r1]	@ zero_extendqisi2
	lsr	r2, r2, #23
	orr	ip, ip, #16384
	lsl	r3, r3, #1
	orr	r2, r2, ip
	orr	r3, r3, #12288
	strh	r2, [r0, #2]	@ movhi
	strh	r1, [r0]	@ movhi
	strh	r3, [r0, #4]	@ movhi
	bx	lr
.L179:
	.align	2
.L178:
	.word	meuford
	.word	orient
	.word	shadowOAM
	.size	drawMeuford, .-drawMeuford
	.align	2
	.global	initLights
	.syntax unified
	.arm
	.fpu softvfp
	.type	initLights, %function
initLights:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, lr}
	mov	r1, #3
	mov	r2, #1
	mov	r0, #224
	mov	lr, #280
	mov	r5, #192
	mov	r4, #252
	mov	ip, #208
	ldr	r3, .L182
	str	r5, [r3, #232]
	str	r4, [r3, #236]
	str	lr, [r3, #68]
	str	lr, [r3, #180]
	str	r1, [r3, #36]
	str	r1, [r3, #92]
	str	r1, [r3, #148]
	str	r1, [r3, #204]
	str	r1, [r3, #260]
	str	r2, [r3, #52]
	str	r2, [r3, #108]
	str	r2, [r3, #164]
	str	r2, [r3, #220]
	str	r2, [r3, #276]
	str	r0, [r3, #8]
	str	r0, [r3, #12]
	str	r0, [r3, #64]
	str	r0, [r3, #124]
	str	ip, [r3, #120]
	str	ip, [r3, #176]
	pop	{r4, r5, lr}
	bx	lr
.L183:
	.align	2
.L182:
	.word	lights
	.size	initLights, .-initLights
	.align	2
	.global	initLight
	.syntax unified
	.arm
	.fpu softvfp
	.type	initLight, %function
initLight:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r3, #0
	str	r3, [r0, #52]
	bx	lr
	.size	initLight, .-initLight
	.align	2
	.global	updateLight
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateLight, %function
updateLight:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L186
	ldr	r1, .L186+4
	ldr	ip, [r3]
	ldr	r1, [r1]
	ldr	r2, [r0, #8]
	ldr	r3, [r0, #12]
	sub	r2, r2, ip
	sub	r3, r3, r1
	stm	r0, {r2, r3}
	bx	lr
.L187:
	.align	2
.L186:
	.word	portelythVOff
	.word	portelythHOff
	.size	updateLight, .-updateLight
	.align	2
	.global	drawLight
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawLight, %function
drawLight:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	ip, [r0]
	cmp	ip, #160
	movle	r3, #0
	movgt	r3, #1
	ldr	r2, [r0, #28]
	rsb	r2, r2, #0
	cmp	ip, r2
	orrlt	r3, r3, #1
	cmp	r3, #0
	push	{r4, lr}
	ldr	r3, [r0, #4]
	movne	lr, #512
	beq	.L193
.L189:
	ldr	r2, [r0, #36]
	ldr	r4, .L194
	lsl	r1, r1, #3
	add	r2, r2, #384
	and	ip, ip, #255
	lsl	r3, r3, #23
	add	r0, r4, r1
	orr	ip, lr, ip
	orr	r2, r2, #16384
	lsr	r3, r3, #23
	strh	ip, [r4, r1]	@ movhi
	strh	r2, [r0, #4]	@ movhi
	strh	r3, [r0, #2]	@ movhi
	pop	{r4, lr}
	bx	lr
.L193:
	ldr	r2, [r0, #24]
	rsb	r2, r2, #0
	cmp	r3, #240
	cmple	r2, r3
	movle	lr, #0
	movgt	lr, #512
	b	.L189
.L195:
	.align	2
.L194:
	.word	shadowOAM
	.size	drawLight, .-drawLight
	.align	2
	.global	drawPortelyth
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawPortelyth, %function
drawPortelyth:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L207
	push	{r4, r5, r6, lr}
	ldr	r4, [r3]
	cmp	r4, #1
	beq	.L198
	cmp	r4, #2
	beq	.L199
	cmp	r4, #0
	beq	.L205
.L197:
	ldr	r3, .L207+4
	mov	lr, pc
	bx	r3
	ldr	r4, .L207+8
	mov	r3, #512
	mov	r2, #117440512
	ldr	r1, .L207+12
	mov	r0, #3
	mov	lr, pc
	bx	r4
	pop	{r4, r5, r6, lr}
	bx	lr
.L205:
	bl	drawMeuford
	ldr	r5, .L207+16
.L202:
	ldr	r3, [r5, #52]
	cmp	r3, #0
	add	r4, r4, #1
	beq	.L206
.L201:
	cmp	r4, #5
	add	r5, r5, #56
	bne	.L202
	mov	r2, #67108864
	ldr	r3, .L207+20
	ldrh	r1, [r3]
	ldr	r3, .L207+24
	strh	r1, [r2, #16]	@ movhi
	ldrh	r1, [r3]
	ldr	r3, .L207+28
	ldr	r3, [r3]
	asr	r3, r3, #3
	lsl	r3, r3, #16
	lsr	r3, r3, #16
	strh	r1, [r2, #18]	@ movhi
	strh	r3, [r2, #20]	@ movhi
	ldr	r3, .L207+32
	ldr	r3, [r3]
	asr	r3, r3, #2
	lsl	r3, r3, #16
	lsr	r3, r3, #16
	strh	r3, [r2, #22]	@ movhi
	b	.L197
.L206:
	mov	r1, r4
	mov	r0, r5
	bl	drawLight
	b	.L201
.L199:
	ldr	r3, .L207+36
	mov	lr, pc
	bx	r3
	b	.L197
.L198:
	ldr	r3, .L207+40
	mov	lr, pc
	bx	r3
	b	.L197
.L208:
	.align	2
.L207:
	.word	gameStage
	.word	waitForVBlank
	.word	DMANow
	.word	shadowOAM
	.word	lights
	.word	portelythHOff
	.word	portelythVOff
	.word	portelythfarHOff
	.word	portelythfarVOff
	.word	drawShruden
	.word	drawSpaceInvaders
	.size	drawPortelyth, .-drawPortelyth
	.align	2
	.global	initArcades
	.syntax unified
	.arm
	.fpu softvfp
	.type	initArcades, %function
initArcades:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	mov	r4, #168
	ldr	r2, .L213
	mov	fp, #72
	mov	r10, #169
	mov	r9, #376
	mov	r8, #9
	mov	r7, #488
	mov	r6, #249
	mov	r5, #24
	mov	r3, r2
	mov	lr, #0
	mov	ip, #15
	mov	r0, #10
	mov	r1, #1
	str	r4, [r2, #60]
	ldr	r4, .L213+4
	str	r4, [r2, #64]
	sub	r4, r4, #120
	str	fp, [r2]
	str	r10, [r2, #4]
	str	r9, [r2, #20]
	str	r8, [r2, #24]
	str	r7, [r2, #40]
	str	r6, [r2, #44]
	str	r5, [r2, #80]
	str	r4, [r2, #84]
	ldr	r2, .L213+8
	str	lr, [r2]
	add	r2, r3, #100
.L210:
	str	ip, [r3, #8]
	str	r0, [r3, #12]
	str	r1, [r3, #16]
	add	r3, r3, #20
	cmp	r3, r2
	bne	.L210
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L214:
	.align	2
.L213:
	.word	arcades
	.word	457
	.word	curArcade
	.size	initArcades, .-initArcades
	.align	2
	.global	initPortelyth
	.syntax unified
	.arm
	.fpu softvfp
	.type	initPortelyth, %function
initPortelyth:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r0, #57344
	mov	r2, #256
	ldr	r1, .L217
	ldr	r3, .L217+4
	push	{r4, r5, r6, lr}
	str	r0, [r1]
	str	r2, [r3]
	mov	r4, #192
	bl	initMeuford
	mov	r5, #252
	mov	r1, #3
	mov	r0, #224
	mov	r2, #1
	mov	lr, #280
	mov	ip, #208
	ldr	r3, .L217+8
	str	r1, [r3, #36]
	str	r1, [r3, #92]
	str	r1, [r3, #148]
	str	r1, [r3, #204]
	str	r1, [r3, #260]
	str	r0, [r3, #8]
	str	r0, [r3, #12]
	str	r0, [r3, #64]
	str	r0, [r3, #124]
	str	lr, [r3, #68]
	str	lr, [r3, #180]
	str	ip, [r3, #120]
	str	ip, [r3, #176]
	str	r5, [r3, #236]
	str	r2, [r3, #52]
	str	r2, [r3, #108]
	str	r2, [r3, #164]
	str	r2, [r3, #220]
	str	r2, [r3, #276]
	str	r4, [r3, #232]
	ldr	r2, .L217+12
	mov	lr, pc
	bx	r2
	ldr	r3, .L217+16
	mov	lr, pc
	bx	r3
	bl	initArcades
	mov	r2, #136
	mov	r3, #0
	mov	ip, #64
	mov	r1, #176
	ldr	r0, .L217+20
	ldr	lr, .L217+24
	str	r4, [r0]
	ldr	r0, .L217+28
	str	r2, [lr]
	str	r2, [r0]
	ldr	lr, .L217+32
	ldr	r0, .L217+36
	ldr	r2, .L217+40
	str	r3, [lr]
	str	r3, [r0]
	ldr	lr, .L217+44
	str	r3, [r2]
	ldr	r0, .L217+48
	ldr	r2, .L217+52
	str	r3, [lr]
	str	ip, [r0]
	str	r1, [r2]
	pop	{r4, r5, r6, lr}
	bx	lr
.L218:
	.align	2
.L217:
	.word	pCheckRow
	.word	pCheckCol
	.word	lights
	.word	initSpaceInvaders
	.word	initShruden
	.word	portelythfarVOff
	.word	portelythHOff
	.word	pCheckHOff
	.word	portelythVOff
	.word	gameStage
	.word	gamesCompleted
	.word	portelythWon
	.word	portelythfarHOff
	.word	pCheckVOff
	.size	initPortelyth, .-initPortelyth
	.comm	pCheckHOff,4,4
	.comm	arcades,100,4
	.comm	lights,280,4
	.comm	meuford,56,4
	.comm	soundB,32,4
	.comm	soundA,32,4
	.comm	spVOff,4,4
	.comm	spHOff,4,4
	.comm	lives,4,4
	.comm	enemyMvt,4,4
	.comm	enemiesRemaining,4,4
	.comm	playerProjectiles,4,4
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
	.comm	isJumping,4,4
	.comm	isClimbing,4,4
	.comm	orient,4,4
	.comm	curArcade,4,4
	.comm	portelythWon,4,4
	.comm	gamesCompleted,4,4
	.comm	gameStage,4,4
	.ident	"GCC: (devkitARM release 47) 7.1.0"

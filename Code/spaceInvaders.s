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
	.file	"spaceInvaders.c"
	.text
	.align	2
	.global	goToSpaceInvaders
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToSpaceInvaders, %function
goToSpaceInvaders:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	mov	r2, #7936
	mov	r5, #67108864
	ldr	r4, .L4
	strh	r2, [r5, #8]	@ movhi
	mov	r3, #16
	ldr	r2, .L4+4
	ldr	r1, .L4+8
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #8192
	ldr	r2, .L4+12
	ldr	r1, .L4+16
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #544
	mov	r2, #100663296
	ldr	r1, .L4+20
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	ldr	r2, .L4+24
	ldr	r1, .L4+28
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r1, #8
	ldr	r2, .L4+32
	ldr	r4, .L4+36
	str	r1, [r2]
	mov	r3, #1
	strh	r1, [r5, #16]	@ movhi
	ldr	r2, .L4+40
	ldr	r1, .L4+44
	ldr	r0, .L4+48
	mov	lr, pc
	bx	r4
	pop	{r4, r5, r6, lr}
	bx	lr
.L5:
	.align	2
.L4:
	.word	DMANow
	.word	83886592
	.word	spritesPal
	.word	100728832
	.word	spritesTiles
	.word	gamebgTiles
	.word	100726784
	.word	gamebgMap
	.word	spHOff
	.word	playSoundA
	.word	11025
	.word	2056032
	.word	Levels
	.size	goToSpaceInvaders, .-goToSpaceInvaders
	.align	2
	.global	drawSpaceInvaders
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawSpaceInvaders, %function
drawSpaceInvaders:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L26
	ldr	r0, [r3, #16]
	ldr	r1, [r3, #8]
	ldr	r2, [r3, #12]
	push	{r4, r5, r6, r7, lr}
	add	r1, r1, r0
	ldr	r4, .L26+4
	ldr	ip, [r3]
	ldr	r0, [r3, #4]
	asr	r2, r2, #3
	add	r2, r2, r1, lsl #5
	ldr	r3, .L26+8
	strh	r2, [r4, #4]	@ movhi
	strh	ip, [r4]	@ movhi
	strh	r0, [r4, #2]	@ movhi
	add	r5, r3, #2160
.L8:
	ldr	r2, [r3, #32]
	cmp	r2, #0
	beq	.L7
	add	r2, r3, #12
	ldm	r2, {r2, r7, lr}
	ldr	r1, [r3, #28]
	ldr	ip, [r3, #8]
	ldr	r0, [r3, #4]
	lsl	r1, r1, #3
	add	r2, r2, lr, asr #3
	ldr	r6, [r3]
	add	ip, ip, r7
	add	lr, r4, r1
	asr	r0, r0, #3
	add	r2, r2, ip, lsl #5
	strh	r6, [r4, r1]	@ movhi
	strh	r0, [lr, #2]	@ movhi
	strh	r2, [lr, #4]	@ movhi
.L7:
	add	r3, r3, #36
	cmp	r3, r5
	bne	.L8
	ldr	r3, .L26+12
	add	ip, r3, #224
.L10:
	ldr	r2, [r3, #20]
	cmp	r2, #0
	beq	.L9
	ldr	r2, [r3, #16]
	ldr	r6, [r3, #8]
	ldr	r1, [r3, #12]
	lsl	r2, r2, #3
	ldm	r3, {r5, lr}
	add	r0, r4, r2
	add	r1, r1, r6, lsl #5
	strh	r5, [r4, r2]	@ movhi
	strh	lr, [r0, #2]	@ movhi
	strh	r1, [r0, #4]	@ movhi
.L9:
	add	r3, r3, #28
	cmp	r3, ip
	bne	.L10
	ldr	r3, .L26+16
	add	r1, r3, #72
.L12:
	ldr	r2, [r3, #20]
	cmp	r2, #0
	beq	.L11
	ldr	r2, [r3, #16]
	ldr	lr, [r3]
	lsl	r2, r2, #3
	ldr	ip, [r3, #4]
	add	r0, r4, r2
	strh	lr, [r4, r2]	@ movhi
	strh	ip, [r0, #2]	@ movhi
.L11:
	add	r3, r3, #24
	cmp	r1, r3
	bne	.L12
	pop	{r4, r5, r6, r7, lr}
	bx	lr
.L27:
	.align	2
.L26:
	.word	player
	.word	shadowOAM
	.word	enemies
	.word	projectiles
	.word	lifeIcons
	.size	drawSpaceInvaders, .-drawSpaceInvaders
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
	@ link register save eliminated.
	mov	r2, #0
	mov	ip, #132
	mov	r0, #116
	ldr	r3, .L29
	ldr	r1, .L29+4
	str	ip, [r3]
	strh	ip, [r1]	@ movhi
	str	r0, [r3, #4]
	strh	r0, [r1, #2]	@ movhi
	strh	r2, [r1, #4]	@ movhi
	str	r2, [r3, #8]
	str	r2, [r3, #12]
	str	r2, [r3, #16]
	str	r2, [r3, #20]
	bx	lr
.L30:
	.align	2
.L29:
	.word	player
	.word	shadowOAM
	.size	initPlayer, .-initPlayer
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
	@ link register save eliminated.
	ldr	r1, .L52
	ldrh	r3, [r1, #48]
	tst	r3, #32
	ldr	r3, .L52+4
	bne	.L32
	ldr	r2, [r3, #4]
	cmp	r2, #16
	beq	.L33
	sub	r2, r2, #1
	str	r2, [r3, #4]
.L32:
	ldr	r2, .L52
	ldrh	r2, [r2, #48]
	tst	r2, #16
	bne	.L35
	ldr	r2, [r3, #4]
	cmp	r2, #216
	beq	.L35
.L42:
	add	r2, r2, #1
	str	r2, [r3, #4]
.L35:
	ldr	r2, [r3, #12]
	add	r2, r2, #1
	cmp	r2, #31
	movgt	r2, #0
	str	r2, [r3, #12]
	ldr	r2, [r3, #20]
	cmp	r2, #0
	bxlt	lr
	sub	r2, r2, #1
	cmp	r2, #0
	str	r2, [r3, #20]
	streq	r2, [r3, #16]
	bx	lr
.L33:
	ldrh	r1, [r1, #48]
	tst	r1, #16
	beq	.L42
	b	.L35
.L53:
	.align	2
.L52:
	.word	67109120
	.word	player
	.size	updatePlayer, .-updatePlayer
	.align	2
	.global	playerFire
	.syntax unified
	.arm
	.fpu softvfp
	.type	playerFire, %function
playerFire:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r0, .L61
	mov	r3, #0
	mov	r2, r0
	push	{r4, r5, lr}
.L57:
	ldr	r1, [r2, #20]
	cmp	r1, #0
	beq	.L60
	add	r3, r3, #1
	cmp	r3, #8
	add	r2, r2, #28
	bne	.L57
	ldr	r2, .L61+4
.L56:
	mov	lr, #1
	mov	ip, #0
	mov	r0, #32
	ldr	r1, .L61+8
	ldr	r3, [r1]
	add	r3, r3, lr
	str	lr, [r2, #16]
	str	r3, [r1]
	str	ip, [r2, #12]
	str	r0, [r2, #20]
	pop	{r4, r5, lr}
	bx	lr
.L60:
	mov	r4, #1
	ldr	r2, .L61+4
	rsb	r3, r3, r3, lsl #3
	lsl	r3, r3, #2
	ldr	lr, [r2]
	add	r1, r0, r3
	sub	lr, lr, #4
	ldr	ip, [r1, #16]
	str	lr, [r0, r3]
	ldr	r3, .L61+12
	lsl	ip, ip, #3
	ldr	r5, [r1, #8]
	ldr	r0, [r1, #12]
	strh	lr, [r3, ip]	@ movhi
	add	r3, r3, ip
	ldr	ip, [r2, #4]
	add	r0, r0, r5, lsl #5
	strh	r0, [r3, #4]	@ movhi
	strh	ip, [r3, #2]	@ movhi
	str	ip, [r1, #4]
	str	r4, [r1, #24]
	str	r4, [r1, #20]
	b	.L56
.L62:
	.align	2
.L61:
	.word	projectiles
	.word	player
	.word	playerProjectiles
	.word	shadowOAM
	.size	playerFire, .-playerFire
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
	@ link register save eliminated.
	ldr	r2, .L64
	ldr	r1, [r2, #16]
	ldr	r0, [r2, #8]
	ldr	r3, [r2, #12]
	add	r0, r0, r1
	ldr	ip, [r2]
	ldr	r1, .L64+4
	asr	r3, r3, #3
	ldr	r2, [r2, #4]
	add	r3, r3, r0, lsl #5
	strh	r3, [r1, #4]	@ movhi
	strh	ip, [r1]	@ movhi
	strh	r2, [r1, #2]	@ movhi
	bx	lr
.L65:
	.align	2
.L64:
	.word	player
	.word	shadowOAM
	.size	drawPlayer, .-drawPlayer
	.align	2
	.global	initEnemies
	.syntax unified
	.arm
	.fpu softvfp
	.type	initEnemies, %function
initEnemies:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r1, #0
	push	{r4, r5, r6, r7, r8, lr}
	mov	ip, r1
	mov	r7, #1
	ldr	r2, .L70
	ldr	r0, .L70+4
	ldr	r6, .L70+8
	ldr	lr, .L70+12
.L67:
	smull	r4, r5, r1, lr
	asr	r3, r1, #31
	rsb	r3, r3, r5, asr #1
	umull	r4, r5, r1, r6
	add	r3, r3, r3, lsl #1
	lsr	r4, r5, #3
	sub	r3, r1, r3, lsl #2
	and	r5, r4, #3
	add	r8, r1, #1
	lsl	r3, r3, #7
	add	r5, r5, #1
	add	r4, r4, #1
	add	r3, r3, #160
	lsl	r5, r5, #2
	lsl	r4, r4, #4
	cmp	r8, #60
	str	ip, [r2, #8]
	str	ip, [r2, #16]
	str	ip, [r2, #20]
	str	ip, [r2, #24]
	str	r7, [r2, #32]
	str	r3, [r2, #4]
	strh	r3, [r0, #10]	@ movhi
	str	r8, [r2, #28]
	str	r5, [r2, #12]
	strh	r5, [r0, #12]	@ movhi
	str	r4, [r2]
	strh	r4, [r0, #8]	@ movhi
	mov	r1, r8
	add	r2, r2, #36
	add	r0, r0, #8
	bne	.L67
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L71:
	.align	2
.L70:
	.word	enemies
	.word	shadowOAM
	.word	-1431655765
	.word	715827883
	.size	initEnemies, .-initEnemies
	.align	2
	.global	initSpaceInvaders
	.syntax unified
	.arm
	.fpu softvfp
	.type	initSpaceInvaders, %function
initSpaceInvaders:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, lr}
	mov	r5, #0
	mov	r1, #132
	mov	r2, #116
	mov	lr, #60
	mov	ip, #3
	mov	r0, #1
	ldr	r3, .L76
	str	r5, [r3]
	ldr	r3, .L76+4
	ldr	r4, .L76+8
	stm	r3, {r1, r2}
	str	r5, [r3, #8]
	str	r5, [r3, #12]
	str	r5, [r3, #16]
	str	r5, [r3, #20]
	ldr	r3, .L76+12
	strh	r2, [r4, #2]	@ movhi
	str	lr, [r3]
	ldr	r2, .L76+16
	ldr	r3, .L76+20
	strh	r1, [r4]	@ movhi
	strh	r5, [r4, #4]	@ movhi
	str	ip, [r2]
	str	r0, [r3]
	bl	initEnemies
	mov	r2, r5
	mov	lr, #61
	mov	r0, #20
	mov	ip, #512
	ldr	r3, .L76+24
	add	r1, r4, #488
.L73:
	str	lr, [r3, #16]
	add	lr, lr, #1
	cmp	lr, #69
	str	r2, [r3]
	str	r2, [r3, #4]
	str	r2, [r3, #8]
	str	r0, [r3, #12]
	str	r2, [r3, #20]
	str	r2, [r3, #24]
	strh	ip, [r1]	@ movhi
	strh	r2, [r1, #2]	@ movhi
	strh	r0, [r1, #4]	@ movhi
	add	r3, r3, #28
	add	r1, r1, #8
	bne	.L73
	ldr	r1, .L76+28
	mov	ip, #148
	mov	r3, r1
	mov	r6, #26
	mov	r0, #24
	mov	r5, #18
	mov	r4, #1
	mov	r7, #70
	strh	ip, [r3, #8]!	@ movhi
	strh	r6, [r3, #2]	@ movhi
	ldr	r3, .L76+32
	strh	r5, [r1, #2]	@ movhi
	str	r6, [r3, #28]
	str	lr, [r3, #16]
	str	r7, [r3, #40]
	str	r5, [r3, #4]
	str	r4, [r3, #20]
	str	r4, [r3, #44]
	strh	ip, [r1]	@ movhi
	str	ip, [r3]
	str	r2, [r3, #8]
	str	ip, [r3, #24]
	str	r2, [r3, #32]
	str	r0, [r3, #12]
	strh	r0, [r1, #4]	@ movhi
	str	r0, [r3, #36]
	strh	r0, [r1, #12]	@ movhi
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L77:
	.align	2
.L76:
	.word	playerProjectiles
	.word	player
	.word	shadowOAM
	.word	enemiesRemaining
	.word	lives
	.word	enemyMvt
	.word	projectiles
	.word	shadowOAM+552
	.word	lifeIcons
	.size	initSpaceInvaders, .-initSpaceInvaders
	.align	2
	.global	updateEnemy
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateEnemy, %function
updateEnemy:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, [r0, #20]
	add	r3, r3, #1
	cmp	r3, #31
	movgt	r3, #0
	ldr	r2, .L86
	ldr	ip, [r0]
	str	lr, [sp, #-4]!
	str	r3, [r0, #20]
	ldr	lr, [r2]
	ldr	r3, [r0, #24]
	ldr	r2, [r0, #4]
	add	r1, ip, r1
	add	r2, r2, lr
	cmp	r3, #0
	stm	r0, {r1, r2}
	blt	.L78
	sub	r3, r3, #1
	cmp	r3, #0
	str	r3, [r0, #24]
	streq	r3, [r0, #16]
.L78:
	ldr	lr, [sp], #4
	bx	lr
.L87:
	.align	2
.L86:
	.word	enemyMvt
	.size	updateEnemy, .-updateEnemy
	.align	2
	.global	enemyFire
	.syntax unified
	.arm
	.fpu softvfp
	.type	enemyFire, %function
enemyFire:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	ip, .L95
	mov	r3, #0
	mov	r2, ip
	push	{r4, r5, r6, lr}
.L91:
	ldr	r1, [r2, #20]
	cmp	r1, #0
	beq	.L94
	add	r3, r3, #1
	cmp	r3, #5
	add	r2, r2, #28
	bne	.L91
.L90:
	mov	r1, #1
	mov	r2, #0
	mov	r3, #32
	str	r1, [r0, #16]
	str	r2, [r0, #20]
	str	r3, [r0, #24]
	pop	{r4, r5, r6, lr}
	bx	lr
.L94:
	mvn	r5, #0
	mov	r6, #1
	rsb	r3, r3, r3, lsl #3
	ldr	r4, [r0]
	lsl	r3, r3, #2
	add	r2, ip, r3
	ldr	r1, [r0, #4]
	ldr	lr, [r2, #16]
	add	r4, r4, #4
	str	r4, [ip, r3]
	str	r5, [r2, #24]
	ldr	ip, .L95+4
	ldr	r5, [r2, #8]
	ldr	r3, [r2, #12]
	lsl	lr, lr, #3
	asr	r1, r1, #3
	str	r1, [r2, #4]
	str	r6, [r2, #20]
	add	r3, r3, r5, lsl #5
	add	r2, ip, lr
	strh	r4, [ip, lr]	@ movhi
	strh	r1, [r2, #2]	@ movhi
	strh	r3, [r2, #4]	@ movhi
	b	.L90
.L96:
	.align	2
.L95:
	.word	projectiles
	.word	shadowOAM
	.size	enemyFire, .-enemyFire
	.global	__aeabi_idivmod
	.align	2
	.global	updateEnemies
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateEnemies, %function
updateEnemies:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r2, .L111
	ldr	r3, [r2, #4]
	asr	r3, r3, #3
	cmp	r3, #16
	push	{r4, r5, r6, r7, r8, r9, r10, lr}
	beq	.L98
	ldr	r3, [r2, #400]
	asr	r3, r3, #3
	cmp	r3, #216
	movne	r6, #0
	beq	.L98
.L99:
	ldr	r4, .L111
	ldr	r9, .L111+4
	ldr	r8, .L111+8
	ldr	r7, .L111+12
	add	r5, r4, #2160
	b	.L103
.L101:
	add	r4, r4, #36
	cmp	r4, r5
	beq	.L110
.L103:
	mov	r1, r6
	mov	r0, r4
	bl	updateEnemy
	ldr	r3, [r4, #32]
	cmp	r3, #0
	beq	.L101
	mov	lr, pc
	bx	r9
	ldr	r1, [r8]
	add	r1, r1, r1, lsl #2
	lsl	r1, r1, #5
	mov	lr, pc
	bx	r7
	cmp	r1, #0
	bne	.L101
	mov	r0, r4
	add	r4, r4, #36
	bl	enemyFire
	cmp	r4, r5
	bne	.L103
.L110:
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	bx	lr
.L98:
	ldr	r2, .L111+16
	ldr	r3, [r2]
	rsb	r3, r3, #0
	str	r3, [r2]
	mov	r6, #1
	b	.L99
.L112:
	.align	2
.L111:
	.word	enemies
	.word	rand
	.word	enemiesRemaining
	.word	__aeabi_idivmod
	.word	enemyMvt
	.size	updateEnemies, .-updateEnemies
	.align	2
	.global	hideEnemy
	.syntax unified
	.arm
	.fpu softvfp
	.type	hideEnemy, %function
hideEnemy:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	ip, #0
	ldr	r3, [r0, #28]
	ldr	r1, .L114
	lsl	r3, r3, #3
	ldrh	r2, [r1, r3]
	orr	r2, r2, #512
	str	ip, [r0, #32]
	strh	r2, [r1, r3]	@ movhi
	bx	lr
.L115:
	.align	2
.L114:
	.word	shadowOAM
	.size	hideEnemy, .-hideEnemy
	.align	2
	.global	drawEnemy
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawEnemy, %function
drawEnemy:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, [r0, #16]
	ldr	ip, [r0, #8]
	push	{r4, r5, lr}
	ldr	r2, [r0, #28]
	ldr	r5, [r0, #20]
	add	ip, ip, r3
	ldr	r3, [r0, #12]
	ldr	r1, [r0, #4]
	ldr	lr, .L118
	ldr	r4, [r0]
	lsl	r2, r2, #3
	add	r3, r3, r5, asr #3
	add	r0, lr, r2
	asr	r1, r1, #3
	add	r3, r3, ip, lsl #5
	strh	r4, [lr, r2]	@ movhi
	strh	r1, [r0, #2]	@ movhi
	strh	r3, [r0, #4]	@ movhi
	pop	{r4, r5, lr}
	bx	lr
.L119:
	.align	2
.L118:
	.word	shadowOAM
	.size	drawEnemy, .-drawEnemy
	.align	2
	.global	initProjectiles
	.syntax unified
	.arm
	.fpu softvfp
	.type	initProjectiles, %function
initProjectiles:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	str	lr, [sp, #-4]!
	mov	r0, #61
	mov	r2, #0
	mov	ip, #20
	mov	lr, #512
	ldr	r3, .L124
	ldr	r1, .L124+4
.L121:
	str	r0, [r3, #16]
	add	r0, r0, #1
	cmp	r0, #69
	str	r2, [r3]
	str	r2, [r3, #4]
	str	r2, [r3, #8]
	str	ip, [r3, #12]
	str	r2, [r3, #20]
	str	r2, [r3, #24]
	strh	lr, [r1]	@ movhi
	strh	r2, [r1, #2]	@ movhi
	strh	ip, [r1, #4]	@ movhi
	add	r3, r3, #28
	add	r1, r1, #8
	bne	.L121
	ldr	lr, [sp], #4
	bx	lr
.L125:
	.align	2
.L124:
	.word	projectiles
	.word	shadowOAM+488
	.size	initProjectiles, .-initProjectiles
	.align	2
	.global	initProjectile
	.syntax unified
	.arm
	.fpu softvfp
	.type	initProjectile, %function
initProjectile:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, lr}
	mov	r5, #1
	ldr	ip, [r0, #16]
	ldr	r4, [r0, #8]
	ldr	lr, .L128
	sub	r1, r1, r3, lsl #2
	str	r3, [r0, #24]
	ldr	r3, [r0, #12]
	lsl	ip, ip, #3
	str	r1, [r0]
	str	r2, [r0, #4]
	str	r5, [r0, #20]
	add	r3, r3, r4, lsl #5
	add	r0, lr, ip
	strh	r1, [lr, ip]	@ movhi
	strh	r2, [r0, #2]	@ movhi
	strh	r3, [r0, #4]	@ movhi
	pop	{r4, r5, lr}
	bx	lr
.L129:
	.align	2
.L128:
	.word	shadowOAM
	.size	initProjectile, .-initProjectile
	.align	2
	.global	updateProjectile
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateProjectile, %function
updateProjectile:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, [r0]
	ldr	r2, [r0, #24]
	sub	r3, r3, r2, lsl #1
	add	r1, r3, #1
	cmp	r1, #154
	str	r3, [r0]
	bxls	lr
	mov	r3, #0
	str	lr, [sp, #-4]!
	mov	ip, #20
	mov	lr, #0
	cmp	r2, #1
	ldreq	r2, .L137
	str	r3, [r0, #20]
	ldreq	r3, [r2]
	subeq	r3, r3, #1
	streq	r3, [r2]
	ldr	r3, [r0, #16]
	ldr	r1, .L137+4
	lsl	r3, r3, #3
	ldrh	r2, [r1, r3]
	orr	r2, r2, #512
	str	lr, [r0, #24]
	str	ip, [r0, #12]
	ldr	lr, [sp], #4
	strh	r2, [r1, r3]	@ movhi
	bx	lr
.L138:
	.align	2
.L137:
	.word	playerProjectiles
	.word	shadowOAM
	.size	updateProjectile, .-updateProjectile
	.align	2
	.global	hideProjectile
	.syntax unified
	.arm
	.fpu softvfp
	.type	hideProjectile, %function
hideProjectile:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r3, #0
	str	lr, [sp, #-4]!
	mov	ip, #20
	mov	lr, #0
	ldr	r2, [r0, #24]
	cmp	r2, #1
	ldreq	r2, .L142
	str	r3, [r0, #20]
	ldreq	r3, [r2]
	subeq	r3, r3, #1
	streq	r3, [r2]
	ldr	r3, [r0, #16]
	ldr	r1, .L142+4
	lsl	r3, r3, #3
	ldrh	r2, [r1, r3]
	orr	r2, r2, #512
	str	lr, [r0, #24]
	str	ip, [r0, #12]
	ldr	lr, [sp], #4
	strh	r2, [r1, r3]	@ movhi
	bx	lr
.L143:
	.align	2
.L142:
	.word	playerProjectiles
	.word	shadowOAM
	.size	hideProjectile, .-hideProjectile
	.align	2
	.global	drawProjectile
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawProjectile, %function
drawProjectile:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, [r0, #16]
	add	r1, r0, #8
	ldm	r1, {r1, r2}
	ldr	ip, .L146
	str	lr, [sp, #-4]!
	lsl	r3, r3, #3
	ldr	lr, [r0]
	ldr	r0, [r0, #4]
	add	r2, r2, r1, lsl #5
	add	r1, ip, r3
	strh	lr, [ip, r3]	@ movhi
	strh	r0, [r1, #2]	@ movhi
	strh	r2, [r1, #4]	@ movhi
	ldr	lr, [sp], #4
	bx	lr
.L147:
	.align	2
.L146:
	.word	shadowOAM
	.size	drawProjectile, .-drawProjectile
	.align	2
	.global	initLives
	.syntax unified
	.arm
	.fpu softvfp
	.type	initLives, %function
initLives:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, lr}
	mov	r0, #148
	mov	r5, #18
	mov	r1, #24
	mov	r4, #26
	mov	lr, #0
	mov	r7, #69
	mov	r6, #70
	mov	ip, #1
	ldr	r2, .L150
	add	r3, r2, #552
	strh	r0, [r3]	@ movhi
	strh	r5, [r3, #2]	@ movhi
	ldr	r3, .L150+4
	stm	r3, {r0, r5}
	add	r5, r2, #560
	strh	r0, [r5]	@ movhi
	str	r0, [r3, #24]
	add	r0, r2, #556
	add	r2, r2, #564
	str	r7, [r3, #16]
	str	r6, [r3, #40]
	strh	r4, [r5, #2]	@ movhi
	str	r4, [r3, #28]
	str	lr, [r3, #8]
	str	lr, [r3, #32]
	strh	r1, [r0]	@ movhi
	strh	r1, [r2]	@ movhi
	str	r1, [r3, #12]
	str	r1, [r3, #36]
	str	ip, [r3, #20]
	str	ip, [r3, #44]
	pop	{r4, r5, r6, r7, lr}
	bx	lr
.L151:
	.align	2
.L150:
	.word	shadowOAM
	.word	lifeIcons
	.size	initLives, .-initLives
	.align	2
	.global	hideLife
	.syntax unified
	.arm
	.fpu softvfp
	.type	hideLife, %function
hideLife:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	ip, #0
	ldr	r3, [r0, #16]
	ldr	r1, .L153
	lsl	r3, r3, #3
	ldrh	r2, [r1, r3]
	orr	r2, r2, #512
	str	ip, [r0, #20]
	strh	r2, [r1, r3]	@ movhi
	bx	lr
.L154:
	.align	2
.L153:
	.word	shadowOAM
	.size	hideLife, .-hideLife
	.align	2
	.global	drawLife
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawLife, %function
drawLife:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, [r0, #16]
	ldr	r2, .L156
	ldr	ip, [r0]
	lsl	r3, r3, #3
	ldr	r0, [r0, #4]
	add	r1, r2, r3
	strh	ip, [r2, r3]	@ movhi
	strh	r0, [r1, #2]	@ movhi
	bx	lr
.L157:
	.align	2
.L156:
	.word	shadowOAM
	.size	drawLife, .-drawLife
	.align	2
	.global	checkPlayerEnemyCollision
	.syntax unified
	.arm
	.fpu softvfp
	.type	checkPlayerEnemyCollision, %function
checkPlayerEnemyCollision:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, lr}
	ldr	r4, .L169
	sub	sp, sp, #16
	ldr	r7, .L169+4
	ldr	r6, .L169+8
	ldr	r8, .L169+12
	add	r5, r4, #2160
	b	.L162
.L160:
	add	r4, r4, #36
	cmp	r4, r5
	beq	.L168
.L162:
	ldr	r3, [r4, #32]
	cmp	r3, #0
	beq	.L160
	mov	r3, #224
	mov	r2, #8
	mov	r1, #16
	ldr	ip, [r4]
	stmib	sp, {r1, r2, r3}
	ldr	r0, [r7]
	str	ip, [sp]
	mov	lr, pc
	bx	r6
	cmp	r0, #0
	mvnne	r3, #0
	add	r4, r4, #36
	strne	r3, [r8]
	cmp	r4, r5
	bne	.L162
.L168:
	add	sp, sp, #16
	@ sp needed
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L170:
	.align	2
.L169:
	.word	enemies
	.word	player
	.word	collision
	.word	enemiesRemaining
	.size	checkPlayerEnemyCollision, .-checkPlayerEnemyCollision
	.align	2
	.global	checkProjectilePlayerCollision
	.syntax unified
	.arm
	.fpu softvfp
	.type	checkProjectilePlayerCollision, %function
checkProjectilePlayerCollision:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	ldr	r4, .L183
	ldr	r7, .L183+4
	ldr	r9, .L183+8
	ldr	r8, .L183+12
	ldr	r6, .L183+16
	ldr	r10, .L183+20
	ldr	fp, .L183+24
	sub	sp, sp, #20
	add	r5, r4, #224
.L176:
	ldr	r3, [r4, #20]
	cmp	r3, #0
	beq	.L173
	ldr	r3, [r4, #24]
	cmn	r3, #1
	beq	.L182
.L173:
	add	r4, r4, #28
	cmp	r4, r5
	bne	.L176
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L182:
	mov	r3, #8
	ldm	r7, {ip, lr}
	ldm	r4, {r0, r1}
	str	r3, [sp, #12]
	str	r3, [sp, #8]
	mov	r2, r3
	stm	sp, {ip, lr}
	mov	lr, pc
	bx	r9
	cmp	r0, #0
	beq	.L173
	mov	r0, #0
	mov	r1, #20
	mov	r2, r0
	ldr	r3, [r8]
	ldr	lr, [r4, #24]
	sub	ip, r3, #1
	str	ip, [r8]
	ldr	ip, [r4, #16]
	cmp	lr, #1
	str	r0, [r4, #20]
	lsl	ip, ip, #3
	ldreq	r0, [fp]
	sub	r3, r3, #2
	ldrh	lr, [r6, ip]
	add	r3, r3, r3, lsl #1
	subeq	r0, r0, #1
	add	r3, r10, r3, lsl #3
	streq	r0, [fp]
	orr	lr, lr, #512
	ldr	r0, [r3, #16]
	strh	lr, [r6, ip]	@ movhi
	lsl	r0, r0, #3
	ldrh	ip, [r6, r0]
	orr	ip, ip, #512
	str	r2, [r3, #20]
	str	r2, [r4, #24]
	str	r1, [r4, #12]
	strh	ip, [r6, r0]	@ movhi
	b	.L173
.L184:
	.align	2
.L183:
	.word	projectiles
	.word	player
	.word	collision
	.word	lives
	.word	shadowOAM
	.word	lifeIcons
	.word	playerProjectiles
	.size	checkProjectilePlayerCollision, .-checkProjectilePlayerCollision
	.align	2
	.global	checkProjectileEnemyCollision
	.syntax unified
	.arm
	.fpu softvfp
	.type	checkProjectileEnemyCollision, %function
checkProjectileEnemyCollision:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	ldr	r5, .L202
	ldr	r6, .L202+4
	ldr	r10, .L202+8
	ldr	r8, .L202+12
	ldr	fp, .L202+16
	sub	sp, sp, #20
.L186:
	ldr	r4, .L202+20
	mov	r7, #8
	mov	r9, #0
	b	.L191
.L188:
	add	r4, r4, #36
	cmp	r4, r6
	beq	.L201
.L191:
	ldr	r3, [r5, #20]
	cmp	r3, #0
	beq	.L188
	ldr	r3, [r4, #32]
	cmp	r3, #0
	beq	.L188
	ldr	r3, [r5, #24]
	cmp	r3, #1
	bne	.L188
	mov	r3, #8
	ldr	r2, [r4, #4]
	ldr	ip, [r4]
	asr	r2, r2, #3
	stmib	sp, {r2, r7}
	ldm	r5, {r0, r1}
	str	r7, [sp, #12]
	mov	r2, r3
	str	ip, [sp]
	mov	lr, pc
	bx	r10
	cmp	r0, #0
	beq	.L188
	mov	r1, #20
	ldr	r3, [r4, #28]
	lsl	r3, r3, #3
	ldrh	r2, [r8, r3]
	ldr	r0, [r5, #24]
	orr	r2, r2, #512
	cmp	r0, #1
	strh	r2, [r8, r3]	@ movhi
	ldreq	r2, .L202+24
	ldreq	r3, [r2]
	subeq	r3, r3, #1
	streq	r3, [r2]
	ldr	r3, [r5, #16]
	lsl	r3, r3, #3
	ldrh	r2, [r8, r3]
	orr	r2, r2, #512
	strh	r2, [r8, r3]	@ movhi
	ldr	r3, [fp]
	str	r9, [r4, #32]
	add	r4, r4, #36
	sub	r3, r3, #1
	cmp	r4, r6
	str	r9, [r5, #20]
	str	r9, [r5, #24]
	str	r1, [r5, #12]
	str	r3, [fp]
	bne	.L191
.L201:
	ldr	r3, .L202+28
	add	r5, r5, #28
	cmp	r5, r3
	bne	.L186
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L203:
	.align	2
.L202:
	.word	projectiles
	.word	enemies+2160
	.word	collision
	.word	shadowOAM
	.word	enemiesRemaining
	.word	enemies
	.word	playerProjectiles
	.word	projectiles+224
	.size	checkProjectileEnemyCollision, .-checkProjectileEnemyCollision
	.align	2
	.global	updateSpaceInvaders
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateSpaceInvaders, %function
updateSpaceInvaders:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	ldr	r4, .L218
	bl	updatePlayer
	add	r5, r4, #224
	bl	updateEnemies
	b	.L206
.L205:
	add	r4, r4, #28
	cmp	r4, r5
	beq	.L216
.L206:
	ldr	r3, [r4, #20]
	cmp	r3, #0
	beq	.L205
	mov	r0, r4
	add	r4, r4, #28
	bl	updateProjectile
	cmp	r4, r5
	bne	.L206
.L216:
	ldr	r3, .L218+4
	ldrh	r3, [r3]
	tst	r3, #1
	beq	.L207
	ldr	r3, .L218+8
	ldrh	r3, [r3]
	tst	r3, #1
	bne	.L207
	ldr	r3, .L218+12
	ldr	r3, [r3]
	cmp	r3, #2
	ble	.L217
.L207:
	bl	checkPlayerEnemyCollision
	bl	checkProjectilePlayerCollision
	bl	checkProjectileEnemyCollision
	mov	r0, #67108864
	ldr	r1, .L218+16
	ldr	r2, [r1]
	add	r2, r2, #1
	asr	r3, r2, #3
	lsl	r3, r3, #16
	lsr	r3, r3, #16
	str	r2, [r1]
	pop	{r4, r5, r6, lr}
	strh	r3, [r0, #18]	@ movhi
	bx	lr
.L217:
	bl	playerFire
	b	.L207
.L219:
	.align	2
.L218:
	.word	projectiles
	.word	oldButtons
	.word	buttons
	.word	playerProjectiles
	.word	spVOff
	.size	updateSpaceInvaders, .-updateSpaceInvaders
	.comm	shadowOAM,1024,4
	.comm	lifeIcons,48,4
	.comm	projectiles,224,4
	.comm	enemies,2160,4
	.comm	player,24,4
	.comm	soundB,32,4
	.comm	soundA,32,4
	.comm	spVOff,4,4
	.comm	spHOff,4,4
	.comm	lives,4,4
	.comm	enemyMvt,4,4
	.comm	enemiesRemaining,4,4
	.comm	playerProjectiles,4,4
	.ident	"GCC: (devkitARM release 47) 7.1.0"

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
	.file	"shruden.c"
	.text
	.align	2
	.global	drawInit
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawInit, %function
drawInit:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, lr}
	ldr	r3, .L4
	sub	sp, sp, #12
	ldr	r0, .L4+4
	mov	lr, pc
	bx	r3
	mov	r1, #0
	ldr	r5, .L4+8
	ldr	r4, .L4+12
	mov	r0, r1
	str	r5, [sp]
	mov	r3, #2
	mov	r2, #160
	mov	lr, pc
	bx	r4
	str	r5, [sp]
	mov	r3, #2
	mov	r2, #160
	mov	r1, #238
	mov	r0, #0
	mov	lr, pc
	bx	r4
	mov	r1, #0
	str	r5, [sp]
	mov	r0, r1
	mov	r3, #240
	mov	r2, #2
	mov	lr, pc
	bx	r4
	str	r5, [sp]
	mov	r3, #240
	mov	r2, #2
	mov	r1, #0
	mov	r0, #158
	mov	lr, pc
	bx	r4
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, lr}
	bx	lr
.L5:
	.align	2
.L4:
	.word	fillScreen
	.word	32767
	.word	21647
	.word	drawRect
	.size	drawInit, .-drawInit
	.align	2
	.global	goToShruden
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToShruden, %function
goToShruden:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r2, #67108864
	push	{r4, lr}
	ldr	r1, .L8
	ldr	r4, .L8+4
	strh	r1, [r2]	@ movhi
	mov	r3, #1
	ldr	r2, .L8+8
	ldr	r1, .L8+12
	ldr	r0, .L8+16
	mov	lr, pc
	bx	r4
	pop	{r4, lr}
	b	drawInit
.L9:
	.align	2
.L8:
	.word	1027
	.word	playSoundA
	.word	11025
	.word	1087776
	.word	Tagirijus
	.size	goToShruden, .-goToShruden
	.align	2
	.global	initBlip
	.syntax unified
	.arm
	.fpu softvfp
	.type	initBlip, %function
initBlip:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r1, #76
	mov	r2, #2
	mov	ip, #8
	ldr	r3, .L11
	ldr	r0, .L11+4
	str	r1, [r3]
	stmib	r3, {r1, ip}
	str	r0, [r3, #20]
	str	r2, [r3, #12]
	str	r2, [r3, #16]
	bx	lr
.L12:
	.align	2
.L11:
	.word	blip
	.word	2080407520
	.size	initBlip, .-initBlip
	.align	2
	.global	updateBlip
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateBlip, %function
updateBlip:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L18
	ldrh	r3, [r3, #48]
	tst	r3, #64
	ldreq	r2, .L18+4
	ldreq	r3, [r2]
	subeq	r3, r3, #2
	streq	r3, [r2]
	ldr	r3, .L18
	ldrh	r3, [r3, #48]
	tst	r3, #32
	ldreq	r2, .L18+4
	ldreq	r3, [r2, #4]
	subeq	r3, r3, #2
	streq	r3, [r2, #4]
	ldr	r3, .L18
	ldrh	r3, [r3, #48]
	tst	r3, #16
	ldreq	r2, .L18+4
	ldreq	r3, [r2, #4]
	addeq	r3, r3, #2
	streq	r3, [r2, #4]
	ldr	r3, .L18
	ldrh	r3, [r3, #48]
	tst	r3, #128
	ldreq	r2, .L18+4
	ldreq	r3, [r2]
	addeq	r3, r3, #2
	streq	r3, [r2]
	bx	lr
.L19:
	.align	2
.L18:
	.word	67109120
	.word	blip
	.size	updateBlip, .-updateBlip
	.align	2
	.global	drawBlip
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawBlip, %function
drawBlip:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	ldr	r5, .L22
	ldr	r9, .L22+4
	ldr	r10, [r5, #8]
	ldrh	r3, [r5, #20]
	sub	sp, sp, #20
	add	r0, r5, #12
	ldr	r6, [r5, #4]
	ldr	r4, .L22+8
	ldr	r7, [r5]
	ldrh	r8, [r5, #22]
	ldm	r0, {r0, r1}
	str	r3, [sp, #12]
	mov	r2, r10
	mov	r3, r10
	str	r9, [sp]
	mov	lr, pc
	bx	r4
	ldr	r3, [sp, #12]
	add	ip, r6, #1
	str	r3, [sp]
	mov	r2, r10
	mov	r3, r10
	mov	r10, ip
	add	fp, r7, #1
	mov	r1, r6
	mov	r0, r7
	mov	lr, pc
	bx	r4
	str	r8, [sp]
	str	r10, [sp, #12]
	mov	r1, r10
	mov	r0, fp
	add	r10, r6, #5
	mov	r3, #2
	mov	r2, #1
	mov	lr, pc
	bx	r4
	str	r8, [sp]
	mov	r1, r10
	mov	r0, fp
	mov	r3, #2
	mov	r2, #1
	mov	lr, pc
	bx	r4
	mov	r3, #2
	add	fp, r7, r3
	ldr	r1, [sp, #12]
	mov	r2, r3
	str	r9, [sp]
	mov	r0, fp
	mov	lr, pc
	bx	r4
	mov	r3, #2
	mov	r1, r10
	mov	r2, r3
	mov	r0, fp
	str	r9, [sp]
	mov	lr, pc
	bx	r4
	mov	r3, #1
	str	r8, [sp]
	mov	r1, r10
	mov	r2, r3
	add	r0, r7, #6
	mov	lr, pc
	bx	r4
	ldr	r2, [r5, #12]
	add	r3, r7, #3
	cmp	r2, r7
	movle	r7, r3
	subgt	r7, r3, #1
	mov	r8, #0
	mov	r3, #1
	ldr	r5, [r5, #16]
	add	r1, r6, #2
	cmp	r5, r6
	subgt	r1, r1, #1
	mov	r2, r3
	mov	r0, r7
	str	r8, [sp]
	mov	lr, pc
	bx	r4
	mov	r3, #1
	mov	r0, r7
	cmp	r5, r6
	movge	r1, r10
	addlt	r1, r10, #1
	str	r8, [sp]
	mov	r2, r3
	mov	lr, pc
	bx	r4
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L23:
	.align	2
.L22:
	.word	blip
	.word	32767
	.word	drawRect
	.size	drawBlip, .-drawBlip
	.align	2
	.global	initCoins
	.syntax unified
	.arm
	.fpu softvfp
	.type	initCoins, %function
initCoins:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r2, #8
	push	{r3, r4, r5, r6, r7, r8, r9, r10, fp, lr}
	mov	r8, #992
	ldr	r3, .L28
	ldr	r9, .L28+4
	str	r2, [r3]
	ldr	r4, .L28+8
	ldr	r7, .L28+12
	ldr	r6, .L28+16
	add	r5, r9, #128
.L25:
	mov	lr, pc
	bx	r4
	smull	r10, fp, r0, r7
	asr	r3, r0, #31
	add	r2, r0, fp
	rsb	r3, r3, r2, asr #7
	add	r3, r3, r3, lsl #2
	rsb	r3, r3, r3, lsl #3
	sub	r3, r0, r3, lsl #2
	add	r3, r3, #10
	str	r3, [r9]
	mov	lr, pc
	bx	r4
	mov	r2, #1
	smull	r10, fp, r0, r6
	asr	r3, r0, #31
	rsb	r3, r3, fp, asr #6
	add	r3, r3, r3, lsl #2
	add	r3, r3, r3, lsl #2
	sub	r3, r0, r3, lsl #3
	add	r3, r3, #20
	strh	r8, [r9, #8]	@ movhi
	str	r3, [r9, #4]
	str	r2, [r9, #12]
	add	r9, r9, #16
	cmp	r9, r5
	bne	.L25
	pop	{r3, r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L29:
	.align	2
.L28:
	.word	coinsRemaining
	.word	coins
	.word	rand
	.word	-368140053
	.word	1374389535
	.size	initCoins, .-initCoins
	.align	2
	.global	initShruden
	.syntax unified
	.arm
	.fpu softvfp
	.type	initShruden, %function
initShruden:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	mov	r2, #76
	mov	r4, #2
	mov	r0, #8
	ldr	r3, .L32
	ldr	r1, .L32+4
	str	r2, [r3]
	str	r2, [r3, #4]
	str	r0, [r3, #8]
	str	r1, [r3, #20]
	str	r4, [r3, #12]
	str	r4, [r3, #16]
	bl	initCoins
	mov	r1, #16
	mov	r6, #60
	mov	r5, #180
	mov	lr, #100
	mov	r2, #1
	mov	ip, #120
	mov	r0, #12
	ldr	r3, .L32+8
	str	r1, [r3, #8]
	ldr	r1, .L32+12
	str	r1, [r3, #20]
	add	r1, r1, #1409286144
	str	r4, [r3, #12]
	str	r4, [r3, #16]
	str	r6, [r3]
	str	r5, [r3, #4]
	add	r1, r1, #8781824
	ldr	r3, .L32+16
	add	r1, r1, #31744
	str	r4, [r3, #24]
	str	r1, [r3, #28]
	str	r4, [r3, #20]
	str	lr, [r3]
	str	ip, [r3, #4]
	str	r0, [r3, #16]
	str	r2, [r3, #8]
	str	r2, [r3, #12]
	pop	{r4, r5, r6, lr}
	bx	lr
.L33:
	.align	2
.L32:
	.word	blip
	.word	2080407520
	.word	blop
	.word	589855
	.word	boop
	.size	initShruden, .-initShruden
	.align	2
	.global	updateCoin
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateCoin, %function
updateCoin:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r3, r0
	mov	ip, #0
	push	{r4, lr}
	ldr	r2, .L36
	sub	sp, sp, #8
	ldm	r0, {r0, r1}
	ldr	r4, .L36+4
	str	ip, [r3, #12]
	str	r2, [sp]
	mov	r3, #3
	mov	r2, #6
	mov	lr, pc
	bx	r4
	add	sp, sp, #8
	@ sp needed
	pop	{r4, lr}
	bx	lr
.L37:
	.align	2
.L36:
	.word	32767
	.word	drawRect
	.size	updateCoin, .-updateCoin
	.align	2
	.global	drawCoin
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawCoin, %function
drawCoin:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r3, r0
	push	{r4, lr}
	ldrh	r3, [r3, #8]
	sub	sp, sp, #8
	ldm	r0, {r0, r1}
	mov	r2, #6
	str	r3, [sp]
	ldr	r4, .L40
	mov	r3, #3
	mov	lr, pc
	bx	r4
	add	sp, sp, #8
	@ sp needed
	pop	{r4, lr}
	bx	lr
.L41:
	.align	2
.L40:
	.word	drawRect
	.size	drawCoin, .-drawCoin
	.align	2
	.global	initBlop
	.syntax unified
	.arm
	.fpu softvfp
	.type	initBlop, %function
initBlop:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r2, #2
	str	lr, [sp, #-4]!
	mov	ip, #180
	mov	lr, #60
	mov	r0, #16
	ldr	r3, .L44
	ldr	r1, .L44+4
	str	r2, [r3, #16]
	str	r1, [r3, #20]
	str	lr, [r3]
	str	ip, [r3, #4]
	str	r0, [r3, #8]
	str	r2, [r3, #12]
	ldr	lr, [sp], #4
	bx	lr
.L45:
	.align	2
.L44:
	.word	blop
	.word	589855
	.size	initBlop, .-initBlop
	.align	2
	.global	updateBlop
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateBlop, %function
updateBlop:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	ip, .L51
	ldr	r3, [ip, #8]
	ldr	r1, .L51+4
	add	r3, r3, r3, lsr #31
	asr	r3, r3, #1
	ldr	r0, [ip]
	ldr	r2, [r1]
	rsb	r3, r3, #0
	add	r0, r3, r0
	cmp	r0, r2
	sublt	r2, r2, #1
	strlt	r2, [r1]
	cmp	r0, r2
	addgt	r2, r2, #1
	ldr	r0, [ip, #4]
	strgt	r2, [r1]
	ldr	r2, [r1, #4]
	add	r3, r3, r0
	cmp	r3, r2
	sublt	r2, r2, #1
	strlt	r2, [r1, #4]
	cmp	r3, r2
	addgt	r2, r2, #1
	strgt	r2, [r1, #4]
	bx	lr
.L52:
	.align	2
.L51:
	.word	blip
	.word	blop
	.size	updateBlop, .-updateBlop
	.align	2
	.global	drawBlop
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawBlop, %function
drawBlop:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	ldr	r7, .L60
	ldr	ip, .L60+4
	sub	sp, sp, #20
	ldr	r9, [r7, #8]
	add	r0, r7, #12
	ldr	r5, [r7, #4]
	ldr	r6, [r7]
	ldrh	r10, [r7, #20]
	ldm	r0, {r0, r1}
	str	ip, [sp]
	ldr	r4, .L60+8
	mov	r3, r9
	mov	r2, r9
	ldrh	r8, [r7, #22]
	mov	lr, pc
	bx	r4
	mov	r3, r9
	mov	r2, r9
	str	r10, [sp]
	mov	r1, r5
	mov	r0, r6
	mov	lr, pc
	bx	r4
	add	lr, r6, #3
	mov	r3, #1
	mov	r9, lr
	add	r10, r6, #2
	add	r1, r5, r3
	mov	r2, r3
	add	fp, r5, #2
	mov	r0, r10
	str	r8, [sp]
	mov	lr, pc
	bx	r4
	mov	r0, r9
	mov	r1, fp
	mov	r3, #4
	mov	r2, #1
	str	r8, [sp]
	str	r9, [sp, #12]
	mov	lr, pc
	bx	r4
	mov	r3, #1
	add	r9, r6, #4
	mov	r2, r3
	mov	r0, r9
	add	r1, r5, #6
	str	r8, [sp]
	mov	lr, pc
	bx	r4
	mov	r3, #1
	mov	r0, r10
	mov	r2, r3
	add	r1, r5, #14
	add	r10, r5, #10
	str	r8, [sp]
	mov	lr, pc
	bx	r4
	mov	r1, r10
	mov	r3, #4
	mov	r2, #1
	ldr	r0, [sp, #12]
	str	r8, [sp]
	mov	lr, pc
	bx	r4
	mov	r3, #1
	mov	r0, r9
	mov	r2, r3
	add	r1, r5, #9
	str	r8, [sp]
	mov	lr, pc
	bx	r4
	mov	r3, #4
	ldr	ip, .L60+4
	mov	r2, r3
	str	ip, [sp]
	mov	r1, fp
	mov	r0, r9
	mov	lr, pc
	bx	r4
	mov	r3, #4
	ldr	ip, .L60+4
	mov	r2, r3
	str	ip, [sp]
	mov	r0, r9
	mov	r1, r10
	mov	lr, pc
	bx	r4
	mov	r3, #1
	add	r9, r6, #13
	mov	r2, r3
	mov	r1, fp
	str	r8, [sp]
	mov	r0, r9
	mov	lr, pc
	bx	r4
	mov	r3, #1
	add	r1, r5, #13
	mov	r2, r3
	mov	r0, r9
	str	r8, [sp]
	mov	lr, pc
	bx	r4
	add	r1, r5, #3
	mov	r3, #10
	mov	r2, #1
	str	r8, [sp]
	add	r0, r6, #12
	mov	lr, pc
	bx	r4
	add	r2, r7, #12
	ldm	r2, {r2, r3}
	cmp	r2, r6
	movle	r2, #0
	mvngt	r2, #1
	cmp	r3, r5
	mvngt	r1, #1
	bgt	.L55
	mov	r1, #0
	addlt	r10, r5, #12
.L55:
	mov	r7, #0
	mov	r3, #2
	add	r6, r6, #6
	add	r6, r6, r2
	add	r5, r5, #4
	add	r1, r5, r1
	mov	r2, r3
	mov	r0, r6
	str	r7, [sp]
	mov	lr, pc
	bx	r4
	mov	r3, #2
	mov	r0, r6
	str	r7, [sp]
	mov	r1, r10
	mov	r2, r3
	mov	lr, pc
	bx	r4
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L61:
	.align	2
.L60:
	.word	blop
	.word	32767
	.word	drawRect
	.size	drawBlop, .-drawBlop
	.align	2
	.global	initBoop
	.syntax unified
	.arm
	.fpu softvfp
	.type	initBoop, %function
initBoop:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r0, #100
	mov	r2, #2
	str	lr, [sp, #-4]!
	mov	r1, #1
	mov	lr, #120
	mov	ip, #12
	ldr	r3, .L64
	str	r0, [r3]
	ldr	r0, .L64+4
	str	r2, [r3, #24]
	str	r0, [r3, #28]
	str	lr, [r3, #4]
	str	ip, [r3, #16]
	str	r1, [r3, #8]
	str	r1, [r3, #12]
	str	r2, [r3, #20]
	ldr	lr, [sp], #4
	bx	lr
.L65:
	.align	2
.L64:
	.word	boop
	.word	1418689567
	.size	initBoop, .-initBoop
	.align	2
	.global	updateBoop
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateBoop, %function
updateBoop:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L67
	ldm	r3, {r1, r2, ip}
	ldr	r0, [r3, #12]
	add	r1, r1, ip
	add	r2, r2, r0
	stm	r3, {r1, r2}
	bx	lr
.L68:
	.align	2
.L67:
	.word	boop
	.size	updateBoop, .-updateBoop
	.align	2
	.global	drawBoop
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawBoop, %function
drawBoop:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	ldr	r5, .L71
	ldr	r9, .L71+4
	ldr	r10, [r5, #16]
	ldrh	r3, [r5, #28]
	sub	sp, sp, #20
	add	r0, r5, #20
	ldr	r6, [r5, #4]
	ldr	r4, .L71+8
	ldr	r7, [r5]
	ldrh	r8, [r5, #30]
	ldm	r0, {r0, r1}
	str	r3, [sp, #12]
	mov	r2, r10
	mov	r3, r10
	str	r9, [sp]
	mov	lr, pc
	bx	r4
	ldr	r3, [sp, #12]
	add	ip, r6, #2
	str	r3, [sp]
	mov	r2, r10
	mov	r3, r10
	mov	r10, ip
	add	fp, r7, #2
	mov	r1, r6
	mov	r0, r7
	mov	lr, pc
	bx	r4
	str	r8, [sp]
	str	r10, [sp, #12]
	mov	r1, r10
	mov	r0, fp
	add	r10, r6, #7
	mov	r3, #3
	mov	r2, #1
	mov	lr, pc
	bx	r4
	str	r8, [sp]
	mov	r1, r10
	mov	r0, fp
	mov	r3, #3
	mov	r2, #1
	mov	lr, pc
	bx	r4
	mov	r3, #3
	add	fp, r7, r3
	ldr	r1, [sp, #12]
	mov	r2, r3
	str	r9, [sp]
	mov	r0, fp
	mov	lr, pc
	bx	r4
	mov	r3, #3
	mov	r1, r10
	mov	r2, r3
	mov	r0, fp
	str	r9, [sp]
	mov	lr, pc
	bx	r4
	mov	r3, #1
	str	r8, [sp]
	add	r1, r6, #8
	mov	r2, r3
	add	r0, r7, #9
	mov	lr, pc
	bx	r4
	ldr	r2, [r5, #20]
	add	r3, r7, #4
	cmp	r2, r7
	movle	r7, r3
	subgt	r7, r3, #1
	mov	r8, #0
	mov	r3, #2
	ldr	r5, [r5, #24]
	add	r1, r6, #3
	cmp	r5, r6
	subgt	r1, r1, #1
	mov	r2, r3
	mov	r0, r7
	str	r8, [sp]
	mov	lr, pc
	bx	r4
	mov	r3, #2
	mov	r0, r7
	cmp	r5, r6
	movge	r1, r10
	addlt	r1, r10, #1
	str	r8, [sp]
	mov	r2, r3
	mov	lr, pc
	bx	r4
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L72:
	.align	2
.L71:
	.word	boop
	.word	32767
	.word	drawRect
	.size	drawBoop, .-drawBoop
	.align	2
	.global	drawShruden
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawShruden, %function
drawShruden:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	ldr	r4, .L82
	sub	sp, sp, #8
	ldr	r6, .L82+4
	add	r5, r4, #128
	b	.L75
.L74:
	add	r4, r4, #16
	cmp	r4, r5
	beq	.L81
.L75:
	ldr	r3, [r4, #12]
	cmp	r3, #0
	beq	.L74
	ldrh	r3, [r4, #8]
	ldm	r4, {r0, r1}
	str	r3, [sp]
	mov	r2, #6
	mov	r3, #3
	add	r4, r4, #16
	mov	lr, pc
	bx	r6
	cmp	r4, r5
	bne	.L75
.L81:
	bl	drawBlip
	bl	drawBoop
	bl	drawBlop
	ldr	r1, .L82+8
	ldr	r2, .L82+12
	ldr	r3, .L82+16
	ldr	ip, [r1]
	ldr	r0, [r1, #4]
	str	ip, [r1, #12]
	ldr	lr, [r2]
	ldr	ip, [r2, #4]
	str	r0, [r1, #16]
	ldm	r3, {r0, r1}
	str	lr, [r2, #12]
	str	ip, [r2, #16]
	str	r0, [r3, #20]
	str	r1, [r3, #24]
	add	sp, sp, #8
	@ sp needed
	pop	{r4, r5, r6, lr}
	bx	lr
.L83:
	.align	2
.L82:
	.word	coins
	.word	drawRect
	.word	blip
	.word	blop
	.word	boop
	.size	drawShruden, .-drawShruden
	.align	2
	.global	drawWin
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawWin, %function
drawWin:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, lr}
	ldr	r3, .L86
	ldr	ip, .L86+4
	ldm	r3, {r4, r7}
	ldr	r3, [r3, #8]
	sub	sp, sp, #12
	str	ip, [sp]
	ldr	r5, .L86+8
	mov	r2, r3
	mov	r1, r7
	mov	r0, r4
	mov	lr, pc
	bx	r5
	mov	r6, #992
	mov	r3, #1
	add	r9, r4, #2
	add	r8, r7, #2
	mov	r1, r8
	mov	r2, r3
	mov	r0, r9
	str	r6, [sp]
	mov	lr, pc
	bx	r5
	mov	r3, #1
	add	r1, r7, #5
	mov	r2, r3
	mov	r0, r9
	str	r6, [sp]
	mov	lr, pc
	bx	r5
	mov	r3, #2
	add	r4, r4, #5
	add	r1, r7, #3
	mov	r2, r3
	str	r6, [sp]
	mov	r0, r4
	mov	lr, pc
	bx	r5
	mov	r1, r8
	mov	r0, r4
	str	r6, [sp]
	mov	r3, #4
	mov	r2, #1
	mov	lr, pc
	bx	r5
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, lr}
	bx	lr
.L87:
	.align	2
.L86:
	.word	blip
	.word	32767
	.word	drawRect
	.size	drawWin, .-drawWin
	.align	2
	.global	drawLose
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawLose, %function
drawLose:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, lr}
	ldr	r3, .L90
	ldr	ip, .L90+4
	ldm	r3, {r6, r7}
	ldr	r3, [r3, #8]
	sub	sp, sp, #12
	str	ip, [sp]
	ldr	r4, .L90+8
	mov	r2, r3
	mov	r1, r7
	mov	r0, r6
	mov	lr, pc
	bx	r4
	mov	r5, #0
	mov	r3, #1
	add	r9, r6, #2
	add	r8, r7, #2
	mov	r1, r8
	mov	r2, r3
	mov	r0, r9
	str	r5, [sp]
	mov	lr, pc
	bx	r4
	mov	r3, #1
	add	r1, r7, #5
	mov	r2, r3
	mov	r0, r9
	str	r5, [sp]
	mov	lr, pc
	bx	r4
	mov	r3, #2
	add	r1, r7, #3
	mov	r2, r3
	str	r5, [sp]
	add	r0, r6, #5
	mov	lr, pc
	bx	r4
	mov	r1, r8
	add	r0, r6, #6
	str	r5, [sp]
	mov	r3, #4
	mov	r2, #1
	mov	lr, pc
	bx	r4
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, lr}
	bx	lr
.L91:
	.align	2
.L90:
	.word	blip
	.word	32767
	.word	drawRect
	.size	drawLose, .-drawLose
	.align	2
	.global	checkBlipWallCollision
	.syntax unified
	.arm
	.fpu softvfp
	.type	checkBlipWallCollision, %function
checkBlipWallCollision:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, lr}
	mov	ip, #0
	mov	lr, #160
	mov	r6, #3
	ldr	r4, .L110
	ldm	r4, {r7, r8}
	ldr	r5, [r4, #8]
	sub	sp, sp, #16
	mov	r3, r5
	stmib	sp, {ip, lr}
	str	ip, [sp]
	mov	r1, r8
	mov	r2, r5
	str	r6, [sp, #12]
	mov	r0, r7
	ldr	r6, .L110+4
	mov	lr, pc
	bx	r6
	cmp	r0, #0
	ldrne	r3, [r4, #4]
	addne	r3, r3, #2
	strne	r3, [r4, #4]
	mov	r0, #0
	mov	r1, #237
	mov	r2, #160
	mov	r3, #3
	stm	sp, {r0, r1, r2, r3}
	mov	r3, r5
	mov	r2, r5
	mov	r1, r8
	mov	r0, r7
	mov	lr, pc
	bx	r6
	cmp	r0, #0
	ldrne	r3, [r4, #4]
	subne	r3, r3, #2
	strne	r3, [r4, #4]
	mov	r1, #240
	mov	r3, #0
	mov	r2, #3
	str	r1, [sp, #12]
	str	r2, [sp, #8]
	str	r3, [sp, #4]
	str	r3, [sp]
	mov	r2, r5
	mov	r3, r5
	mov	r1, r8
	mov	r0, r7
	mov	lr, pc
	bx	r6
	cmp	r0, #0
	ldrne	r3, [r4]
	addne	r3, r3, #2
	strne	r3, [r4]
	mov	lr, #240
	mov	ip, #3
	mov	r2, #0
	mov	r3, #157
	stmib	sp, {r2, ip, lr}
	str	r3, [sp]
	mov	r1, r8
	mov	r3, r5
	mov	r0, r7
	mov	r2, r5
	mov	lr, pc
	bx	r6
	cmp	r0, #0
	ldrne	r3, [r4]
	subne	r3, r3, #2
	strne	r3, [r4]
	add	sp, sp, #16
	@ sp needed
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L111:
	.align	2
.L110:
	.word	blip
	.word	collision
	.size	checkBlipWallCollision, .-checkBlipWallCollision
	.align	2
	.global	checkBlopWallCollision
	.syntax unified
	.arm
	.fpu softvfp
	.type	checkBlopWallCollision, %function
checkBlopWallCollision:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, lr}
	mov	ip, #0
	mov	lr, #160
	mov	r6, #3
	ldr	r4, .L130
	ldm	r4, {r7, r8}
	ldr	r5, [r4, #8]
	sub	sp, sp, #16
	mov	r3, r5
	stmib	sp, {ip, lr}
	str	ip, [sp]
	mov	r1, r8
	mov	r2, r5
	str	r6, [sp, #12]
	mov	r0, r7
	ldr	r6, .L130+4
	mov	lr, pc
	bx	r6
	cmp	r0, #0
	ldrne	r3, [r4, #4]
	addne	r3, r3, #2
	strne	r3, [r4, #4]
	mov	r0, #0
	mov	r1, #237
	mov	r2, #160
	mov	r3, #3
	stm	sp, {r0, r1, r2, r3}
	mov	r3, r5
	mov	r2, r5
	mov	r1, r8
	mov	r0, r7
	mov	lr, pc
	bx	r6
	cmp	r0, #0
	ldrne	r3, [r4, #4]
	subne	r3, r3, #2
	strne	r3, [r4, #4]
	mov	r1, #240
	mov	r3, #0
	mov	r2, #3
	str	r1, [sp, #12]
	str	r2, [sp, #8]
	str	r3, [sp, #4]
	str	r3, [sp]
	mov	r2, r5
	mov	r3, r5
	mov	r1, r8
	mov	r0, r7
	mov	lr, pc
	bx	r6
	cmp	r0, #0
	ldrne	r3, [r4]
	addne	r3, r3, #2
	strne	r3, [r4]
	mov	lr, #240
	mov	ip, #3
	mov	r2, #0
	mov	r3, #157
	stmib	sp, {r2, ip, lr}
	str	r3, [sp]
	mov	r1, r8
	mov	r3, r5
	mov	r0, r7
	mov	r2, r5
	mov	lr, pc
	bx	r6
	cmp	r0, #0
	ldrne	r3, [r4]
	subne	r3, r3, #2
	strne	r3, [r4]
	add	sp, sp, #16
	@ sp needed
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L131:
	.align	2
.L130:
	.word	blop
	.word	collision
	.size	checkBlopWallCollision, .-checkBlopWallCollision
	.align	2
	.global	checkBoopCollision
	.syntax unified
	.arm
	.fpu softvfp
	.type	checkBoopCollision, %function
checkBoopCollision:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	mov	lr, #0
	mov	r9, #3
	mov	r6, #160
	ldr	r4, .L166
	ldm	r4, {r7, r8}
	ldr	r5, [r4, #16]
	sub	sp, sp, #20
	ldr	ip, .L166+4
	str	r9, [sp, #12]
	str	r6, [sp, #8]
	mov	r0, r7
	mov	r1, r8
	mov	r3, r5
	mov	r2, r5
	str	lr, [sp, #4]
	str	lr, [sp]
	ldr	r6, .L166+8
	ldm	ip, {r10, fp}
	ldr	r9, [ip, #8]
	mov	lr, pc
	bx	r6
	cmp	r0, #0
	beq	.L133
	ldr	r2, [r4, #4]
	ldr	r3, [r4, #12]
	add	r2, r2, #3
	rsb	r3, r3, #0
	str	r2, [r4, #4]
	str	r3, [r4, #12]
.L133:
	mov	r0, #0
	mov	r1, #237
	mov	r2, #160
	mov	r3, #3
	stm	sp, {r0, r1, r2, r3}
	mov	r3, r5
	mov	r2, r5
	mov	r1, r8
	mov	r0, r7
	mov	lr, pc
	bx	r6
	cmp	r0, #0
	beq	.L134
	ldr	r2, [r4, #4]
	ldr	r3, [r4, #12]
	sub	r2, r2, #3
	rsb	r3, r3, #0
	str	r2, [r4, #4]
	str	r3, [r4, #12]
.L134:
	mov	r3, #0
	mov	r1, #240
	mov	r2, #3
	str	r1, [sp, #12]
	str	r2, [sp, #8]
	str	r3, [sp, #4]
	str	r3, [sp]
	mov	r2, r5
	mov	r3, r5
	mov	r1, r8
	mov	r0, r7
	mov	lr, pc
	bx	r6
	cmp	r0, #0
	beq	.L135
	ldr	r2, [r4]
	ldr	r3, [r4, #8]
	add	r2, r2, #3
	rsb	r3, r3, #0
	str	r2, [r4]
	str	r3, [r4, #8]
.L135:
	mov	r0, #157
	mov	r1, #0
	mov	r2, #3
	mov	r3, #240
	stm	sp, {r0, r1, r2, r3}
	mov	r3, r5
	mov	r2, r5
	mov	r1, r8
	mov	r0, r7
	mov	lr, pc
	bx	r6
	cmp	r0, #0
	beq	.L136
	ldr	r2, [r4]
	ldr	r3, [r4, #8]
	sub	r2, r2, #3
	rsb	r3, r3, #0
	str	r2, [r4]
	str	r3, [r4, #8]
.L136:
	mov	r2, #1
	add	r3, fp, r9
	str	r2, [sp, #12]
	str	r3, [sp, #4]
	str	r9, [sp, #8]
	str	r10, [sp]
	mov	r3, r5
	mov	r2, r5
	mov	r1, r8
	mov	r0, r7
	mov	lr, pc
	bx	r6
	cmp	r0, #0
	beq	.L137
	ldr	r2, [r4, #4]
	ldr	r3, [r4, #12]
	add	r2, r2, #3
	rsb	r3, r3, #0
	str	r2, [r4, #4]
	str	r3, [r4, #12]
.L137:
	mov	r3, #1
	str	r9, [sp, #8]
	str	r3, [sp, #12]
	stm	sp, {r10, fp}
	mov	r3, r5
	mov	r2, r5
	mov	r1, r8
	mov	r0, r7
	mov	lr, pc
	bx	r6
	cmp	r0, #0
	beq	.L138
	ldr	r2, [r4, #4]
	ldr	r3, [r4, #12]
	sub	r2, r2, #3
	rsb	r3, r3, #0
	str	r2, [r4, #4]
	str	r3, [r4, #12]
.L138:
	mov	r2, #1
	add	r3, r10, r9
	str	r2, [sp, #8]
	str	r3, [sp]
	str	r9, [sp, #12]
	str	fp, [sp, #4]
	mov	r3, r5
	mov	r2, r5
	mov	r1, r8
	mov	r0, r7
	mov	lr, pc
	bx	r6
	cmp	r0, #0
	beq	.L139
	ldr	r2, [r4]
	ldr	r3, [r4, #8]
	add	r2, r2, #3
	rsb	r3, r3, #0
	str	r2, [r4]
	str	r3, [r4, #8]
.L139:
	mov	r3, #1
	str	r9, [sp, #12]
	str	r3, [sp, #8]
	stm	sp, {r10, fp}
	mov	r1, r8
	mov	r0, r7
	mov	r3, r5
	mov	r2, r5
	mov	lr, pc
	bx	r6
	cmp	r0, #0
	beq	.L132
	ldr	r2, [r4]
	ldr	r3, [r4, #8]
	sub	r2, r2, #3
	rsb	r3, r3, #0
	str	r2, [r4]
	str	r3, [r4, #8]
.L132:
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L167:
	.align	2
.L166:
	.word	boop
	.word	blop
	.word	collision
	.size	checkBoopCollision, .-checkBoopCollision
	.align	2
	.global	checkBlipCoinCollision
	.syntax unified
	.arm
	.fpu softvfp
	.type	checkBlipCoinCollision, %function
checkBlipCoinCollision:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	ldr	r4, .L181
	sub	sp, sp, #20
	ldr	r6, .L181+4
	ldr	r9, .L181+8
	ldr	r10, .L181+12
	ldr	fp, .L181+16
	add	r5, r4, #128
	b	.L173
.L170:
	add	r4, r4, #16
	cmp	r4, r5
	beq	.L179
.L173:
	ldr	r3, [r4, #12]
	cmp	r3, #0
	beq	.L170
	mov	r8, #3
	mov	r7, #6
	ldm	r6, {r0, r1, r3}
	ldm	r4, {ip, lr}
	str	r8, [sp, #12]
	str	r7, [sp, #8]
	mov	r2, r3
	stm	sp, {ip, lr}
	mov	lr, pc
	bx	r9
	cmp	r0, #0
	beq	.L170
	mov	lr, #0
	ldr	ip, [r10]
	ldr	r3, .L181+20
	sub	ip, ip, #1
	str	r3, [sp]
	str	ip, [r10]
	mov	r3, r8
	ldm	r4, {r0, r1}
	mov	r2, r7
	str	lr, [r4, #12]
	ldr	ip, .L181+24
	mov	lr, pc
	bx	ip
	ldr	r3, [r10]
	cmp	r3, #4
	beq	.L180
	cmp	r3, #2
	bne	.L170
	add	r2, fp, #8
	ldm	r2, {r2, r3}
	add	r2, r2, r2, lsr #31
	add	r3, r3, r3, lsr #31
	asr	r2, r2, #1
	asr	r3, r3, #1
	add	r4, r4, #16
	add	r2, r2, r2, lsl #1
	add	r3, r3, r3, lsl #1
	cmp	r4, r5
	str	r2, [fp, #8]
	str	r3, [fp, #12]
	bne	.L173
.L179:
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L180:
	add	r2, fp, #8
	ldm	r2, {r2, r3}
	lsl	r2, r2, #1
	lsl	r3, r3, #1
	str	r2, [fp, #8]
	str	r3, [fp, #12]
	b	.L170
.L182:
	.align	2
.L181:
	.word	coins
	.word	blip
	.word	collision
	.word	coinsRemaining
	.word	boop
	.word	32767
	.word	drawRect
	.size	checkBlipCoinCollision, .-checkBlipCoinCollision
	.align	2
	.global	checkBlipBlopCollision
	.syntax unified
	.arm
	.fpu softvfp
	.type	checkBlipBlopCollision, %function
checkBlipBlopCollision:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, lr}
	ldr	r2, .L193
	ldr	r4, .L193+4
	ldmib	r2, {r5, ip}
	ldm	r4, {r0, r1, r3}
	ldr	lr, [r2]
	sub	sp, sp, #20
	mov	r2, r3
	stmib	sp, {r5, ip}
	str	ip, [sp, #12]
	str	lr, [sp]
	ldr	r5, .L193+8
	mov	lr, pc
	bx	r5
	cmp	r0, #0
	mvnne	r2, #0
	ldrne	r3, .L193+12
	strne	r2, [r3]
	ldr	r2, .L193+16
	ldr	r3, [r4, #8]
	ldr	r1, [r2, #16]
	ldm	r2, {r2, ip}
	str	r1, [sp, #12]
	str	r1, [sp, #8]
	stm	sp, {r2, ip}
	ldm	r4, {r0, r1}
	mov	r2, r3
	mov	lr, pc
	bx	r5
	cmp	r0, #0
	mvnne	r2, #0
	ldrne	r3, .L193+12
	strne	r2, [r3]
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, lr}
	bx	lr
.L194:
	.align	2
.L193:
	.word	blop
	.word	blip
	.word	collision
	.word	coinsRemaining
	.word	boop
	.size	checkBlipBlopCollision, .-checkBlipBlopCollision
	.align	2
	.global	updateShruden
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateShruden, %function
updateShruden:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	bl	updateBlip
	bl	updateBlop
	ldr	r3, .L197
	ldm	r3, {r1, r2, ip}
	ldr	r0, [r3, #12]
	add	r1, r1, ip
	add	r2, r2, r0
	stm	r3, {r1, r2}
	bl	checkBlipWallCollision
	bl	checkBlopWallCollision
	bl	checkBoopCollision
	bl	checkBlipCoinCollision
	pop	{r4, lr}
	b	checkBlipBlopCollision
.L198:
	.align	2
.L197:
	.word	boop
	.size	updateShruden, .-updateShruden
	.comm	coinsRemaining,4,4
	.comm	coins,128,4
	.comm	boop,32,4
	.comm	blop,24,4
	.comm	blip,24,4
	.comm	soundB,32,4
	.comm	soundA,32,4
	.ident	"GCC: (devkitARM release 47) 7.1.0"

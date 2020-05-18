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
	.global	delay
	.syntax unified
	.arm
	.fpu softvfp
	.type	delay, %function
delay:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r2, #0
	rsb	r3, r0, r0, lsl #5
	add	r0, r0, r3, lsl #2
	lsl	r0, r0, #3
	sub	sp, sp, #8
	cmp	r0, r2
	str	r2, [sp, #4]
	ble	.L1
.L3:
	ldr	r3, [sp, #4]
	add	r2, r2, #1
	add	r3, r3, #1
	cmp	r2, r0
	str	r3, [sp, #4]
	bne	.L3
.L1:
	add	sp, sp, #8
	@ sp needed
	bx	lr
	.size	delay, .-delay
	.align	2
	.global	hideSprites
	.syntax unified
	.arm
	.fpu softvfp
	.type	hideSprites, %function
hideSprites:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r0, .L10
	mov	r1, #512
	mov	r3, r0
	add	r2, r0, #1024
.L8:
	strh	r1, [r3], #8	@ movhi
	cmp	r3, r2
	bne	.L8
	mov	ip, #0
	mov	r1, #117440512
	ldr	r3, .L10+4
	ldr	r2, .L10+8
	ldr	r3, [r3]
	str	ip, [r3, #44]
	str	r0, [r3, #36]
	str	r1, [r3, #40]
	str	r2, [r3, #44]
	bx	lr
.L11:
	.align	2
.L10:
	.word	shadowOAM
	.word	.LANCHOR0
	.word	-2147483136
	.size	hideSprites, .-hideSprites
	.align	2
	.global	setPixel
	.syntax unified
	.arm
	.fpu softvfp
	.type	setPixel, %function
setPixel:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L13
	rsb	r0, r0, r0, lsl #4
	add	r1, r1, r0, lsl #4
	ldr	r3, [r3, #4]
	lsl	r1, r1, #1
	strh	r2, [r3, r1]	@ movhi
	bx	lr
.L14:
	.align	2
.L13:
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
	@ args = 4, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, lr}
	cmp	r2, #0
	sub	sp, sp, #12
	ldrh	lr, [sp, #24]
	ble	.L15
	mov	r4, #0
	ldr	r5, .L20
	add	r2, r0, r2
	rsb	ip, r2, r2, lsl #4
	rsb	r0, r0, r0, lsl #4
	ldr	r2, [r5, #4]
	add	ip, r1, ip, lsl #4
	add	r1, r1, r0, lsl #4
	ldr	r0, [r5]
	add	ip, r2, ip, lsl #1
	add	r1, r2, r1, lsl #1
	orr	r3, r3, #-2130706432
	add	r2, sp, #6
.L17:
	strh	lr, [sp, #6]	@ movhi
	str	r4, [r0, #44]
	str	r2, [r0, #36]
	str	r1, [r0, #40]
	add	r1, r1, #480
	cmp	r1, ip
	str	r3, [r0, #44]
	bne	.L17
.L15:
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, lr}
	bx	lr
.L21:
	.align	2
.L20:
	.word	.LANCHOR0
	.size	drawRect, .-drawRect
	.align	2
	.global	fillScreen
	.syntax unified
	.arm
	.fpu softvfp
	.type	fillScreen, %function
fillScreen:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	ip, #0
	sub	sp, sp, #8
	ldr	r1, .L24
	add	r2, sp, #8
	strh	r0, [r2, #-2]!	@ movhi
	ldr	r3, [r1]
	ldr	r0, [r1, #4]
	ldr	r1, .L24+4
	str	ip, [r3, #44]
	str	r2, [r3, #36]
	str	r0, [r3, #40]
	str	r1, [r3, #44]
	add	sp, sp, #8
	@ sp needed
	bx	lr
.L25:
	.align	2
.L24:
	.word	.LANCHOR0
	.word	-2130668032
	.size	fillScreen, .-fillScreen
	.align	2
	.global	drawImage
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawImage, %function
drawImage:
	@ Function supports interworking.
	@ args = 4, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, lr}
	cmp	r2, #0
	ldr	r6, [sp, #24]
	ble	.L26
	mov	ip, #0
	mov	r8, ip
	ldr	lr, .L31
	add	r4, r0, r2
	add	r5, r3, r3, lsr #31
	rsb	r4, r4, r4, lsl #4
	rsb	r0, r0, r0, lsl #4
	asr	r5, r5, #1
	ldr	r7, [lr, #4]
	ldr	lr, [lr]
	add	r4, r1, r4, lsl #4
	orr	r5, r5, #-2147483648
	add	r1, r1, r0, lsl #4
.L28:
	add	r0, ip, ip, lsr #31
	add	r2, r1, r1, lsr #31
	bic	r0, r0, #1
	bic	r2, r2, #1
	add	r1, r1, #240
	add	r0, r6, r0
	add	r2, r7, r2
	cmp	r4, r1
	str	r8, [lr, #44]
	add	ip, ip, r3
	str	r0, [lr, #36]
	str	r2, [lr, #40]
	str	r5, [lr, #44]
	bne	.L28
.L26:
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L32:
	.align	2
.L31:
	.word	.LANCHOR0
	.size	drawImage, .-drawImage
	.align	2
	.global	drawFullscreenImage
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawFullscreenImage, %function
drawFullscreenImage:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	ip, #0
	ldr	r2, .L34
	ldr	r1, .L34+4
	ldr	r3, [r2]
	ldr	r2, [r2, #4]
	str	ip, [r3, #44]
	str	r0, [r3, #36]
	str	r2, [r3, #40]
	str	r1, [r3, #44]
	bx	lr
.L35:
	.align	2
.L34:
	.word	.LANCHOR0
	.word	-2147464448
	.size	drawFullscreenImage, .-drawFullscreenImage
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
.L37:
	ldrh	r3, [r2, #6]
	cmp	r3, #160
	bhi	.L37
	mov	r2, #67108864
.L38:
	ldrh	r3, [r2, #6]
	cmp	r3, #159
	bls	.L38
	bx	lr
	.size	waitForVBlank, .-waitForVBlank
	.align	2
	.global	flipPage
	.syntax unified
	.arm
	.fpu softvfp
	.type	flipPage, %function
flipPage:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r3, #67108864
	ldrh	r3, [r3]
	tst	r3, #16
	moveq	r1, #100663296
	ldrne	r2, .L45
	ldreq	r2, .L45
	ldrne	r1, .L45+4
	str	r1, [r2, #4]
	mov	r2, #67108864
	eor	r3, r3, #16
	strh	r3, [r2]	@ movhi
	bx	lr
.L46:
	.align	2
.L45:
	.word	.LANCHOR0
	.word	100704256
	.size	flipPage, .-flipPage
	.align	2
	.global	DMANow
	.syntax unified
	.arm
	.fpu softvfp
	.type	DMANow, %function
DMANow:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	mov	r4, #0
	ldr	ip, .L49
	add	r0, r0, r0, lsl #1
	ldr	lr, [ip]
	lsl	r0, r0, #2
	add	ip, lr, r0
	orr	r3, r3, #-2147483648
	str	r4, [ip, #8]
	str	r1, [lr, r0]
	str	r2, [ip, #4]
	pop	{r4, lr}
	str	r3, [ip, #8]
	bx	lr
.L50:
	.align	2
.L49:
	.word	.LANCHOR0
	.size	DMANow, .-DMANow
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
	str	lr, [sp, #-4]!
	ldr	lr, [sp, #4]
	ldr	ip, [sp, #12]
	add	ip, lr, ip
	sub	ip, ip, #1
	cmp	ip, r0
	ble	.L55
	add	r0, r0, r2
	sub	r0, r0, #1
	cmp	r0, lr
	bgt	.L57
.L55:
	mov	r0, #0
	ldr	lr, [sp], #4
	bx	lr
.L57:
	ldr	r2, [sp, #8]
	ldr	r0, [sp, #16]
	add	r2, r2, r0
	sub	r2, r2, #1
	cmp	r2, r1
	ble	.L55
	add	r0, r1, r3
	ldr	r3, [sp, #8]
	sub	r0, r0, #1
	cmp	r0, r3
	movle	r0, #0
	movgt	r0, #1
	ldr	lr, [sp], #4
	bx	lr
	.size	collision, .-collision
	.global	dma
	.global	videoBuffer
	.data
	.align	2
	.set	.LANCHOR0,. + 0
	.type	dma, %object
	.size	dma, 4
dma:
	.word	67109040
	.type	videoBuffer, %object
	.size	videoBuffer, 4
videoBuffer:
	.word	100663296
	.ident	"GCC: (devkitARM release 47) 7.1.0"

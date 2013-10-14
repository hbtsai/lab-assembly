	.text				@ Executable code follows

_start: .global _start			@ "_start" is required by the linker
	.global main			@ "main" is our main program

	b	main			@ Start running the main program

main:					@ Entry to the function "main"

	@ r0=multiplicand, r1=multiplier, r2=product

	mov r10, #2
	mul r3, r10   , r0		@ m1 = 2*multiplicand;
	mov r10, #4
	mul r4, r10   , r0		@ m2 = 4*multiplicand;
	mov r10, #8
	mul r5, r10 , r0		@ m3 = 8*multiplicand;
	mov r10, #16
	mul r6, r10 , r0		@ m4 = 16*multiplicand;
	mov r10, #32
	mul r7, r10 , r0		@ m5 = 32*multiplicand;
	mov r10, #64
	mul r8, r10 , r0		@ m6 = 64*multiplicand;
	mov r10, #128
	mul r9, r10 , r0		@ m7 = 128*multiplicand;

	cmp r1, #255
	bgt .L1
	cmp r1, #0
	blt .L1
	mov r2, #0


mul_loop:
	cmp r1, #128
	bge .L2

	cmp r1, #64
	bge .L3

	cmp r1, #32
	bge .L4

	cmp r1, #16
	bge .L5

	cmp r1, #8
	bge .L6

	cmp r1, #4
	bge .L7

	cmp r1, #2
	bge .L8

	cmp r1, #1
	bge .L9

	cmp r1, #0
	ble end

	b mul_loop

.L1:
	mov r2, #-1
	b end

.L2:						@ multiplier >= 128
	add r2, r2, r9
	sub r1, r1, #128
	b mul_loop

.L3:						@ multiplier >=64
	add r2, r2, r8
	sub r1, r1, #64
	b mul_loop

.L4:						@ multiplier >=32
	add r2, r2, r7
	sub r1, r1, #32
	b mul_loop

.L5:						@ multiplier >=16
	add r2, r2, r6
	sub r1, r1, #16
	b mul_loop

.L6:						@ multiplier >=8
	add r2, r2, r5
	sub r1, r1, #8
	b mul_loop
.L7:					@ multiplier >=4
	add r2, r2, r4
	sub r1, r1, #4
	b mul_loop

.L8:					@ multiplier >=2
	add r2, r2, r3
	sub r1, r1, #2
	b mul_loop

.L9:
	add r2, r2, r0
	sub r1, r1, #1
	b mul_loop

	mov pc, lr

	.end

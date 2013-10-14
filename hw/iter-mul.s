	.text				@ Executable code follows

_start: .global _start			@ "_start" is required by the linker
	.global main			@ "main" is our main program

	b	main			@ Start running the main program

main:					@ Entry to the function "main"

	@ r0=multiplicand, r1=multiplier, r2=product

	cmp r1, #255	@ if (multiplier > 255)
	bgt .L1
	cmp r1, #0		@ if (multiplier < 0)
	blt .L1
	mov r2, #0		@ product = 0

add_loop:
	add r2, r2, r0	@ product = product + multiplicand;
	sub r1, r1, #1	@ multiplier = multiplier - 1;
	cmp r1, #0		
	bgt add_loop	@ while( multiplier > 0 )
	b end

.L1:
	mov r2, #-1		@ product = -1;
	b end

	mov pc, lr

	.end

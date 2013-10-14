	.text				@ Executable code follows

_start: .global _start			@ "_start" is required by the linker
	.global main			@ "main" is our main program

	b	main			@ Start running the main program

main:					@ Entry to the function "main"

gcd_loop:
	cmp r0, r1
	beq end
	bgt .L1
	sub r1, r1, r0
	b gcd_loop

.L1:
	sub r0, r0, r1
	b gcd_loop

	mov pc, lr

	.end

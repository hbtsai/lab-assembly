@ ***********************************************************************
@ *									*
@ *	 Add Two Numbers (Version 4 of the Assembly Language Code)	*
@ *									*
@ ***********************************************************************

@ Authors:  Saeid Nooshabadi and John Zaitseff
@ Date:	    20th June, 2003
@ Version:  1.5

@ This simple program adds two integers together.  It first reads the
@ values from memory into registers, adds the registers together, then
@ stores the result back in memory.  This version uses the LDR = pseudo-
@ instruction.


@ -----------------------------------------------------------------------
@ Assembly-language preamble for the main module

	.text				@ Executable code follows

_start: .global _start			@ "_start" is required by the linker
	.global main			@ "main" is our main program

	b	main			@ Start running the main program


@ -----------------------------------------------------------------------
@ Start of the main program

@ This function performs the main work of the program, adding two integers
@ originally stored in memory (in the variables "a" and "b") and storing
@ the result back to memory (to the variable "c").

main:					@ Entry to the function "main"

	ldr	r3, =a			@ R3 = Address of "a"
	ldr	r1, [r3]		@ R1 = 10 (from "a")

	ldr	r3, =b			@ R3 = Address of "b"
	ldr	r2, [r3]		@ R2 = 11 (from "b")

	add	r0, r1, r2		@ R0 = a + b = 21

	ldr	r3, =c			@ R3 = Address of "c"
	str	r0, [r3]		@ Store the result to "c"

	mov	pc, lr			@ Stop the program (return to the OS)

a:	.word	10			@ Variable "a"
b:	.word	11			@ Variable "b"
c:	.word	0			@ Variable "c"

	.end

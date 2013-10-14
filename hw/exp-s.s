@ ***********************************************************************
@ *									*
@ *   Computer 2^31 Using Multiplication (Assembly Language Version)	*
@ *									*
@ ***********************************************************************

@ Authors:  Saeid Nooshabadi and John Zaitseff
@ Date:	    20th June, 2003
@ Version:  1.5

@ This program calculates the value of 2^31 (two to the power of 31) using
@ shift instructions.  It is essentially a hand-compiled (but not
@ necessarilly optimised) version of exp-c.c.


@ -----------------------------------------------------------------------
@ Assembly-language preamble for the main module

	.text				@ Executable code follows

_start: .global _start			@ "_start" is required by the linker
	.global main			@ "main" is our main program

	b	main			@ Start running the main program


@ -----------------------------------------------------------------------
@ Start of the main program

@ This program calculates 2^31 and returns this result in register R0.  It
@ uses R2 as the temporary counter "k".


main:					@ Entry to the function "main"

	mov	r0, #1			@ Initial value of exp (R0)
	mov	r2, #0			@ Initial value of k (R2)

exp_loop:
	mov	r0, r0, lsl #1		@ exp = exp * 2 (shifting left by 1 bit
					@ is the same as multiplying by 2)
	add	r2, r2, #1		@ Increment k
	cmp	r2, #31			@ and compare with 31
	bne	exp_loop		@ Repeat the loop if k is less than 31

	mov	pc, lr			@ Stop the program (return to the OS)

	.end

@ ***********************************************************************
@ *									*
@ *	 Add Two Numbers (Version 1 of the Assembly Language Code)	*
@ *									*
@ ***********************************************************************

@ Authors:  Saeid Nooshabadi and John Zaitseff
@ Date:	    20th June, 2003
@ Version:  1.4

@ This simple program adds two integers in registers R1 and R2 together.
@ It is meant to show how to translate a simple C program into into ARM
@ assembly language.  It is, essentially, the equivalent of add-c.c.

@ -----------------------------------------------------------------------
@ Assembly-language preamble for the main module

	.text				@ Executable code follows

_start: .global _start			@ "_start" is required by the linker
	.global main			@ "main" is our main program

	b	main			@ Start running the main program


@ -----------------------------------------------------------------------
@ Start of the main program

@ This function performs the main work of the program, adding two integers
@ in registers R1 and R2 and return in the value in the third integer R0.

main:					@ Entry to the function "main"

	mov	r1, #10			@ 0x0A in hexadecimal
	mov	r2, #11			@ 0x0B in hexadecimal
	add	r0, r1, r2		@ Add the two numbers together

	mov	pc, lr			@ Stop the program and return to the
					@ Operating System (OS).

	.end

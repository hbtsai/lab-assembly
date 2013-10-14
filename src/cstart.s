@ ***********************************************************************
@ *									*
@ *       C Start-up Routines for the DSLMU Microcontroller Board       *
@ *									*
@ ***********************************************************************

@ Author:   John Zaitseff <J.Zaitseff@unsw.edu.au>
@ Date:     26th March, 2003
@ Version:  1.3

@ This file contains the necessary "glue logic" to allow simple C programs
@ to be run on the DSLMU Microcontroller Board.  Such C programs must NOT
@ use the C Library or the C Math Library, as these start-up routines do
@ not support that.


@ -----------------------------------------------------------------------
@ Assembly-language preamble for the main module

	.text

	.global	_start		@ "_start" is the initial entry point
	.extern	_main		@ "_main" is _main() in the C program
	.global	__stack_top	@ Defines the top of stack

_start:
	ldr	sp,=__stack_top	@ Initialise the stack pointer SP
	bl	_main		@ Start running the main program

exit:	b	exit		@ The DSLMU Microcontroller Board does
				@ not have an operating system, so just
				@ loop forever.


@ -----------------------------------------------------------------------
@ Uninitialised stack space

	.bss

@ Technically, the stack should appear in its own stack segment called
@ ".stack".  Doing this way (using the ".bss" segment), however, is
@ easier.  See /usr/local/arm-elf/ldscripts/armelf.x for more information.

	.skip	8192		@ Allow 8KB for the stack
__stack_top:
	.skip	4


@ -----------------------------------------------------------------------

	.end

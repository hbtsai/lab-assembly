@ ***********************************************************************
@ *									*
@ *	 SWI print msg (Version 1 of the Assembly Language Code)	*
@ *									*
@ ***********************************************************************

@ Authors:  Saeid Nooshabadi and John Zaitseff
@ Date:	    20th June, 2003
@ Version:  1.4

@ print msg on screen by swi.
@ -----------------------------------------------------------------------
@ Assembly-language preamble for the main module

	.text				@ Executable code follows

.comm stack, 0x10000 
_start: .global _start			@ "_start" is required by the linker
	ldr sp, =stack+0x10000
	.global main			@ "main" is our main program

	b	main			@ Start running the main program


@ -----------------------------------------------------------------------
#define	SYS_WRITEC      3               @ Write the single char whose
                                        @ ascii code is pointed to by r1.
#define	SYS_WRITE0      4               @ Write the null-terminated string
                                        @ pointed to by r1.
#define	SYS_READC       7               @ Read a char from the debugger's stdin
                                        @ and return it in r0.

@ -----------------------------------------------------------------------
@ Start of the main program

@ This function performs the main work of the program, adding two integers
@ in registers R1 and R2 and return in the value in the third integer R0.

main:
                adr     r4, hello       @ TUT: adr: address in register

loop:           @ TUT: "loop" is a label and designates this address 
                @ symbolically.

                @ TUT: call the putchar routine to display each character
                @ to illustrate how a loop works.

                ldrb    r0, [r4], #1    @ Get next character.
                                        @ TUT: r0 := mem8[r4]; r4 := r4 + 1
                cmp     r0, #0          @ Stop when we hit a null.
                beq     print           @ TUT: "branch if equal" = if EQ goto

                bl      putchar         @ TUT: "branch+link" = subroutine call
                b       loop            @ TUT: "branch" =  goto

print:
                @ Alternatively, use the library routine 'putstring' 
                @ to write out the whole string a second time, but
                @ all in one go
                adr     r0, hello       @ point at the string with r0
                bl      putstring       @ TUT: "branch+link" = subroutine call

finish:
                @ Standard exit code: SWI 0x123456, calling routine 0x18
                @ with argument 0x20026
                mov     r0, #0x18
                mov     r1, #0x20000    @ build the "difficult" number...
                add     r1, r1, #0x26   @ ...in two steps
                SWI     0x123456        @ TUT: "software interrupt" = sys call

printhex:                                
                @ Print number in r0 as 8 hex digits.
                @ Conforms to APCS.

                stmfd   sp!, {r4, lr}   @ TUT: "store multiple full descending"
                                        @ sp := sp - 4
                                        @ mem32[sp] := r4
                                        @ sp := sp - 4
                                        @ mem32[sp] := lr
                                        @ and when you got here (via bl), the
                                        @ return address was placed in the lr

                adr     r2, hexDigits   @ Point at a constant table of digits
                adr     r3, storage     @ Point at the output buffer

                @ r4 is the bit position of the 4-bit-wide portion of r0
                @ that we print as a hex digit in each round of the loop.
                @ for r4 := 28 to 0 step -4
                mov     r4, #28         
printLoop:
                mov     r1, r0, lsr r4  @ TUT: r1 := r0 shifted right by r4
                and     r1, r1, #0x0f   @ mask off lower nibble
                ldrb    r1, [r2, r1]    @ r1 now contains a hex number; turn
                                        @ it into an ASCII code by looking
                                        @ it up in the table.
                                        @ TUT: r1 := mem8[r2 + r1]
                strb    r1, [r3], #1    @ Append character to output buffer
                                        @ TUT: mem8[r3] := r1; r3 := r3 + 1
                subs    r4, r4, #4      @ TUT: r4 := r4 - 4; and set flags
                bpl     printLoop       @ TUT: "branch if positive or equal"

                adr     r0, storage     @ point at the 8-char-wide buffer
                bl      putstring       @ and print it

putchar:
                @ Print the single character whose ASCII code is in r0.
                @ Conforms to APCS.


                stmfd   sp!, {r4-r12, lr} 
                                        @ push the registers that 
                                        @ you want to save

                @ Call SYS_WRITEC, with r1 containing a POINTER TO a character.
                adr     r1, char
                strb    r0, [r1]
                mov     r0, #3 		@SYS_WRITEC = 3
putswi:         swi     0x123456

                ldmfd   sp!, {r4-r12, pc} 
                                        @ and pop them once you're back
putstring:
                @ Print the null-terminated string pointed to by r0.
                @ Conforms to APCS.

                stmfd   sp!, {r4-r12, lr}

                mov     r1, r0
                mov     r0, #3		@SYS_WRITEC = 3
                swi     0x123456

                ldmfd   sp!, {r4-r12, pc}


                ldmfd   sp!, {r4, pc}   @ TUT: idiom for returning from routine
                                        @ "load multiple full descending"
                                        @ r4 := mem32[sp]
                                        @ sp := sp + 4
                                        @ pc := mem32[sp]
                                        @ sp := sp + 4


hello:
.ascii          "Hello World\n"
hexDigits:
.ascii		"0123456789ABCDEF"
storage:
.ascii		"123456789"		@ storage for 8 digit hex string, 
                                        @ null terminated
char:
.ascii		"0"


	.end

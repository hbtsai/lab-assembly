	.text				@ Executable code follows
_start: .global _start			@ "_start" is required by the linker
	.global main			@ "main" is our main program
	b	main			@ Start running the main program

main:					@ Entry to the function "main"

	mov r12, #2
	mov r1, r12
	mul r1, r0, r1
	mov r11, r1, lsl #1
	mul r2, r0, r11
	mov r11, r11, lsl #1
	mul r3, r0, r11
	mov r11, r11, lsl #1
	mul r4, r0, r11
	mov r11, r11, lsl #1
	mul r5, r0, r11
	mov r11, r11, lsl #1
	mul r6, r0, r11
	mov r11, r11, lsl #1
	mul r7, r0, r11

	mov	pc, lr			@ Stop the program (return to the OS)

	.end

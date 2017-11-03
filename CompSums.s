.global getInteger		//int getInteger(): returns in r0 integer bigger than 1

.section .text

.align 4
getInteger:
	push {lr}		//Saves Original lr
	mov fp, sp		//Moves sp to fp
	sub sp, #4		//sp = sp - 4
	ldr r0, =prompt		//r0 Contains Pointer to prompt
	bl printf		//Calls to printf
	ldr r0, =pattern	//r0 Contains Pointer to pattern
	mov r1, sp		//Moves sp to r1
	bl scanf		//Calls to scanf
	ldr r0, [sp]		//r0 Contains Dereferenced Pointer to sp
	add sp, #4		//sp = sp + 4
	pop {pc}

/*Into Prompt*/
prompt: .asciz "Enter an integer value: "

/*Pattern for scanf*/
pattern: .asciz "%d"

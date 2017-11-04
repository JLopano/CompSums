.global clr_kb			//void clr_kb(): Clears keyboard buffer
.global getInteger		//int getInteger(): returns in r0 Integer Bigger Than 1
.global sumNums			//int sumNums(int): returns in r1 Sum of Numbers from getInteger
.global main
.section .text

.align 4
main:
	push {lr}		//Saves Original lr
	bl getInteger		//Branch to getInteger
	mov r1, r0		//Moves r0 to r1
	ldr r0, =output		//r0 Contains Pointer to Output
	bl printf		//Calls to printf
	pop {pc}

output: .asciz "The value you entered was: %d\n"

.align 4
getInteger:
	push {r4, lr}		//Saves Original r4 and lr
	mov r4, #1		//Moves #1 to r4
	mov r4, r0		//Moves r0 to r4
	sub sp, #4		//sp = sp - 4
getIntDo:
	ldr r0, =prompt		//r0 Contains Pointer to prompt
	mov r1, r4		//Moves r4 to r1
	bl printf		//Calls to printf
	ldr r0, =pattern	//r0 Contains Pointer to pattern
	mov r1, sp		//Moves sp to r1
	bl scanf		//Calls to scanf
	ldr r0, [sp]		//r0 Contains Dereferenced Pointer to sp
	cmp r0 ,r4		//Compares r4 to r0
	ble getErr		//Branch less than equal to getErr
	bl getDone		//Branch to getDone
getErr:
	ldr r0, =error		//r0 Contains Pointer to error
	bl printf		//Calls to printf
	bl clr_kb		//Calls clr_kb function
	bal getIntDo		//Branch Back to getIntDo
getDone:
	add sp, #4		//sp = sp + 4
	pop {r4, pc}

/*Intro Prompt*/
prompt: .asciz "Enter an integer bigger than %d: "

/*Pattern for scanf*/
pattern: .asciz "%d"

/*Error Prompt*/
error: .asciz "Error! Invalid Entry!\n"

.align 4
clr_kb:
	push {lr}		//Saves Original lr
clr_kb_loop:
	bl getchar		//Calls to getchar
	cmp r0, #10		//Compares r0 to #10
	bne clr_kb_loop		//Branch Back to Loop
	pop {pc}

.align 4
sumNums:

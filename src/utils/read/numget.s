# Function to read a number from stdin and store it in EAX; in EBX 0 if the read was successful, 1 otherwise
# Keep in ESI the address of the string from which the number is read

.section .bss
    str:    # Length is needed to prevent buffer overflow
        .asciz

.section .data
    
.section .text
	.global numget

.type numget, @function

numget:
    pushl %ecx
    pushl %edx

    movl $3, %eax               # Syscall number
    movl $1, %ebx               # Stdin
    leal str, %ecx              # Address of string
    movl $255, %edx             # Length of buffer
    # incl %edx                 
    int $0x80                   # Call kernel

	movl %ecx, %esi             # Store address of string in ESI

    movl $0, 4(%esi)

    call atoi                   # Convert string to integer

exit_numget:
    popl %edx
    popl %ecx

    ret
    
# Function to print a string whose address is stored in ESI and whose length is stored in EDX

.section .text
	.global strprint

.type strprint, @function

strprint:
    pushl %eax                  # Save registers
    pushl %ebx
    pushl %ecx
    pushl %edx

    movl $4, %eax				# Syscall WRITE
	movl $1, %ebx				# Stdout

    call strlen
    movl %ecx, %edx             # Length of string
    movl %esi, %ecx             # Address of string

	int $0x80					# Call kernel

    popl %edx                   # Restore registers
    popl %ecx
    popl %ebx
    popl %eax

    ret

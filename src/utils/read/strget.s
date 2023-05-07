# Function to read a string from the console and store the address in ESI

.section .bss
    str:    # Length is needed to prevent buffer overflow
        .asciz

.section .data
    #str_len:
        #.long . - str


.section .text
	.global strget

.type strget, @function

strget:
	pushl %eax                  # Save registers
	pushl %ebx                  
    pushl %ecx
    pushl %edx

    movl $3, %eax               # Syscall number
    movl $1, %ebx               # Stdin
    leal str, %ecx              # Address of string
    movl $255, %edx             # Length of buffer
    incl %edx                   # Add 1 for null terminator
    int $0x80                   # Call kernel

	movl %ecx, %esi             # Store address of string in ESI

    cmpb $10, (%esi)            # Check if first char is newline
    jne strget_add_null_terminator     # If not, add null terminator after 4 chars

    movb $0, 1(%esi)
    jmp exit_strget

strget_add_null_terminator:
    movb $0, 4(%esi)            # Null terminator

exit_strget:
	popl %edx                   # Restore registers
	popl %ecx
	popl %ebx
	popl %eax

	ret                         # Return

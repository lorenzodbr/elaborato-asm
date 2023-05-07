# Function to read a number from stdin and store it in EAX; in EBX 0 if the read was successful, 1 otherwise
# Keep in ESI the address of the string from which the number is read

.section .bss
    num_str:    # Length is needed to prevent buffer overflow
        .asciz

.section .text
	.global numget

.type numget, @function

numget:
    pushl %ecx
    pushl %edx

    movl $3, %eax               # Syscall number
    movl $1, %ebx               # Stdin
    leal num_str, %ecx          # Address of string
    movl $10, %edx              # Length of buffer (2^32-1 = 10 digits)         
    int $0x80                   # Call kernel

	movl %ecx, %esi             # Store address of string in ESI

    cmpb $10, (%esi)            # Check if the first character is a newline
    jne numget_add_null_terminator # If not, add a null terminator after 10 characters

    movb $0, 1(%esi)            # Otherwise, add a null terminator after the first character
numget_add_null_terminator:
    movl $0, 10(%esi)           # Add a null terminator at the end of the string

    call atoi                   # Convert string to integer

exit_numget:
    popl %edx
    popl %ecx

    ret
    
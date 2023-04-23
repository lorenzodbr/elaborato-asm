# Function to read a string from the console and store the address in ESI

.section .data
    str:
        .ascii "0000"

    str_len:
        .long . - num_str

.section .text
	.global strget

.type strget, @function

strget:
	pushl %eax
	pushl %ebx
    pushl %ecx
    pushl %edx
    pushl %esi

    movl $3, %eax
    movl $1, %ebx
    leal str, %ecx
    movl str_len, %edx
    incl %edx
    int $0x80

	movl %ecx, %esi

	popl %esi
	popl %edx
	popl %ecx
	popl %ebx
	popl %eax

	ret

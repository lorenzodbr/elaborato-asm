# Function to convert a string to an integer. Uses ESI as a pointer to the string, and EAX as the result.
# EBX is set to 0 if the conversion was successful, and 1 if it failed.
#
# Registers:
# EAX = result
# EBX = error flag

.section .data
    scala: .byte 10

.section .text
	.global atoi

.type atoi, @function

atoi:
    pushl %ecx
    pushl %edx

    xorl %eax, %eax			 # Zero out registers
    xorl %ebx, %ebx           
    xorl %ecx, %ecx           
    xorl %edx, %edx
  
    movb (%ecx, %esi), %bl

    cmpb $45, %bl            # check if the character is a '-'
    jne repeat_atoi

    incl %ecx                # move to the next character; ignore the '-' for now

repeat_atoi:
    movb (%ecx, %esi), %bl

    cmp $10, %bl             # check if the character is a '\n'
    je conversion_success
  
    cmpb $48, %bl            # check if the character is a digit > 0
    jl illegal_char

    cmpb $57, %bl            # check if the character is a digit < 9
    jg illegal_char

    subb $48, %bl            # convert the character to a digit
    movl $10, %edx
    mull %edx                # EBX = EBX * 10
    addl %ebx, %eax
  
    inc %ecx
    jmp repeat_atoi

illegal_char:
    xorl %eax, %eax         # set the return value to 0
    movl $1, %ebx           # set the flag to indicate an error
    jmp end_atoi            # end the conversion

conversion_success:
    movb (%esi), %bl
    cmpb $45, %bl           # check if the number is negative
    jne set_return_value

    negl %eax               # if the number is negative, negate it

set_return_value:
    xorl %ebx, %ebx         # set the flag to indicate a successful conversion
    jmp end_atoi            # end the conversion

end_atoi:
    popl %edx               # restore registers
    popl %ecx

    ret

# Function that compares two strings and returns -1, 0 or 1 depending on the input strings.
# IN (esi, edi) OUT (ecx={-1,0,1}) MOD (edx)

.section .text
	.global strcmp

.type strcmp, @function

strcmp:
    pushl %edx                  # Save EDX
    
    xorl %ecx, %ecx             # Clear ECX

strcmp_loop:
    mov (%esi, %ecx), %dl       # Load s1
    mov (%edi, %ecx), %dh
    inc %ecx
    test %dl, %dl
    jz strcmp_end_s1
    cmp %dl, %dh
    je strcmp_loop
    jb strcmp_below

strcmp_above:                   # s1 bigger than s2
    xor %ecx, %ecx              # Clear ECX
    inc %ecx                    # ECX = 1
    
    jmp exit_strcmp                        
    
strcmp_below:                   # s1 smaller than s2
    xor %ecx, %ecx              # Clear ECX
    dec %ecx                    # ECX = -1  
    
    jmp exit_strcmp

strcmp_end_s1:                  # s1 shorter than s2
    test %dh, %dh                 
    jnz strcmp_below            
    xor %ecx, %ecx              # s1 same as s2

exit_strcmp:
    popl %edx                   # Restore EDX

    ret                         # ECX = 0

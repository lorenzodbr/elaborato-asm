# Function to read a number from stdin and store it in EAX; in EBX 0 if the read was successful, 1 otherwise

.section .data
    num_str:                    # String to store the number in
        .ascii "000000000000"

    num_str_len:
        .long . - num_str

.section .text
	.global numget

.type numget, @function

numget:
    pushl %ebx
    pushl %ecx
    pushl %edx
    pushl %esi

    movl $3, %eax
    movl $1, %ebx
    leal num_str, %ecx
    movl num_str_len, %edx
    incl %edx
    int $0x80

atoi_numget:
    leal num_str, %esi 		# metto indirizzo della stringa in esi 
  
    xorl %eax,%eax			# Azzero registri General Purpose
    xorl %ebx,%ebx           
    xorl %ecx,%ecx           
    xorl %edx,%edx
  
repeat_numget:
    movb (%ecx,%esi,1), %bl
  
    cmp $10, %bl             # vedo se e' stato letto il carattere '\n'
    je atoi_end_numget
  
    subb $48, %bl            # converte il codice ASCII della cifra nel numero corrisp.
    movl $10, %edx
    mulb %dl                 # EBX = EBX * 10
    addl %ebx, %eax
  
    inc %ecx
    jmp repeat_numget

atoi_end_numget:
    
    popl %esi
    popl %edx
    popl %ecx
    popl %ebx

    ret
    
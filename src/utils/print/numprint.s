# Function to print a number stored in EAX, converting it to a string

.section .data
    numstr: .ascii "000000000000"     # string output
	numtmp: .ascii "000000000000"     # temporary string

.section .text
	.global numprint

.type numprint, @function

numprint:
    pushl %eax                  # Save registers
    pushl %ebx
    pushl %ecx
    pushl %edx
    pushl %esi
    pushl %edi

movl $10, %ebx                 # carica 10 in EBX (usato per le divisioni)
	movl $0, %ecx              # azzera il contatore ECX

	leal numtmp, %esi          # carica l'indirizzo di 'numtmp' in ESI

keep_dividing:
	movl $0, %edx              # azzera il contenuto di EDX
	divl %ebx                  # divide per 10 il numero ottenuto

	addb $48, %dl              # aggiunge 48 al resto della divisione
	movb %dl, (%ecx,%esi,1)    # sposta il contenuto di DL in numtmp

	inc %ecx                   # incrementa il contatore ECX

	cmp $0, %eax               # controlla se il contenuto di EAX è 0

	jne keep_dividing

	movl $0, %ebx              # azzera un secondo contatore in EBX

	leal numstr, %edi          # carica l'indirizzo di 'numstr' in EDI

reverse:
	movb -1(%ecx, %esi, 1), %al # carica in AL il contenuto dell'ultimo byte di 'numtmp'
	movb %al, (%ebx, %edi, 1)   # carica nel primo byte di 'numstr' il contenuto di AL

	inc %ebx                    # incrementa il contatore EBX

	loop reverse

print:
    movl %edi, %esi             # Move string address to esi for printing
    call strprint               # Call the string print function

    popl %edi                   # Restore registers
    popl %esi
    popl %edx
    popl %ecx
    popl %ebx
    popl %eax

    ret

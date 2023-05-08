# Function to convert an integer to a string. Uses EAX to read the integer, and ESI as a pointer to the string.

.section .data
    numstr: .asciz "000000000000"     # string output
	numtmp: .asciz "000000000000"     # temporary string

.section .text
    .global itoa

.type itoa, @function
itoa:
    pushl %eax                 # Save registers
    pushl %ebx
    pushl %ecx
    pushl %edx
    pushl %edi

	movl $10, %ebx             # carica 10 in EBX (usato per le divisioni)
	xorl %ecx, %ecx            # azzera il contatore ECX

	leal numtmp, %edi          # carica l'indirizzo di 'numtmp' in ESI

keep_dividing:
	movl $0, %edx              # azzera il contenuto di EDX
	divl %ebx                  # divide per 10 il numero ottenuto

	addb $48, %dl              # aggiunge 48 al resto della divisione
	movb %dl, (%ecx,%edi,1)    # sposta il contenuto di DL in numtmp

	inc %ecx                   # incrementa il contatore ECX

	cmp $0, %eax               # controlla se il contenuto di EAX è 0

	jne keep_dividing

	movl $0, %ebx              # azzera un secondo contatore in EBX

	leal numstr, %esi          # carica l'indirizzo di 'numstr' in EDI

reverse:
	movb -1(%ecx, %edi, 1), %al # carica in AL il contenuto dell'ultimo byte di 'numtmp'
	movb %al, (%ebx, %esi, 1)   # carica nel primo byte di 'numstr' il contenuto di AL

	inc %ebx                    # incrementa il contatore EBX

	loop reverse

    movb $0, (%ebx, %esi, 1)    # carica il carattere di terminazione in 'numstr'

    popl %edi                   # Restore registers
    popl %edx
    popl %ecx
    popl %ebx
    popl %eax

    ret

# Function that returns the length of a string
# IN (esi) OUT (ecx=0+)

.section .text
	.global strlen

.type strlen, @function

strlen:
    pushl %eax
    xorl %ecx, %ecx
    
strlen_loop:
	movb (%esi, %ecx), %al 			# mette il carattere della stringa in eax
	testb %al, %al 					# se il carattere è 0 (\0) la stringa è finita
	jz end_count					# quindi esce dal ciclo

	incl %ecx						# altrimenti incrementa il contatore
	
	jmp strlen_loop					# e ripete

end_count:
    popl %eax
	ret

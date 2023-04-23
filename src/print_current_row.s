#Print the current row using the index stored in EAX

.section .text
	.global print_current_row

.type print_current_row, @function

print_current_row:
    pushl %esi

    leal row_0, %esi
print_row:
    call strprint

    popl %esi
    ret

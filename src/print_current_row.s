#Print the current row using the index stored in EAX

.section .text
	.global print_current_row

.type print_current_row, @function

print_current_row:
    pushl %esi

    cmpl $0, %edx           #Switch-case assembly implementation
    je print_row_0

    cmpl $1, %edx
    je print_row_1

    cmpl $2, %edx
    je print_row_2
    
    cmpl $3, %edx
    je print_row_3

    cmpl $4, %edx
    je print_row_4

    cmpl $5, %edx
    je print_row_5

    cmpl $6, %edx
    je print_row_6

    cmpl $7, %edx
    je print_row_7

    leal command_invalid_str, %esi  #If the index is invalid, print the error message
    jmp print_row

print_row_0:
    leal row_0_str, %esi
    jmp print_row

print_row_1:
    leal row_1_str, %esi
    jmp print_row

print_row_2:
    leal row_2_str, %esi
    jmp print_row

print_row_3:
    leal row_3_str, %esi
    jmp print_row

print_row_4:
    leal row_4_str, %esi
    jmp print_row

print_row_5:
    leal row_5_str, %esi
    jmp print_row

print_row_6:
    leal row_6_str, %esi
    jmp print_row

print_row_7:
    leal row_7_str, %esi
    jmp print_row
    
print_row:
    call strprint

    popl %esi

    ret

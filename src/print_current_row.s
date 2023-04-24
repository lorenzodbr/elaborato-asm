# Print the current row using the index stored in EDX
#
# Registers:
# EAX = Working register
# ESI = Pointer to the string to print
# EDX = Index of the row to print

.section .text
	.global print_current_row

.type print_current_row, @function

print_current_row:
    pushl %esi
    pushl %eax

    cmpl $0, %edx           # Switch-case assembly implementation
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
    cmpl $8, %eax
    je print_row_0_supervisor

print_row_0_user:
    leal row_0_str, %esi
    jmp print_row

print_row_0_supervisor:
    leal row_0_supervisor_str, %esi
    jmp print_row

print_row_1:
    leal row_1_str, %esi
    jmp print_row

print_row_2:
    leal row_2_str, %esi
    jmp print_row

print_row_3:
    leal row_3_str, %esi
    call strprint

    movl door_lock, %eax
    cmpl $0, %eax
    je print_row_3_off

    leal on_str, %esi
    jmp print_row

print_row_3_off:
    leal off_str, %esi
    jmp print_row

print_row_4:
    leal row_4_str, %esi
    call strprint

    movl back_home, %eax
    cmpl $0, %eax
    je print_row_4_off

    leal on_str, %esi
    jmp print_row

print_row_4_off:
    leal off_str, %esi
    jmp print_row

print_row_5:
    leal row_5_str, %esi
    jmp print_row

print_row_6:
    leal row_6_str, %esi
    call strprint

    movl frecce_direzione, %eax
    call numprint

    leal enter_str, %esi
    call strprint

    jmp exit_print_row

print_row_7:
    leal row_7_str, %esi
    jmp print_row
    
print_row:
    call strprint

exit_print_row:
    popl %eax
    popl %esi

    ret

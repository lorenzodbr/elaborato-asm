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
    pushl %esi              # Save registers

print_banner:
    leal initial_str_1, %esi            # Print initial string
    call strprint

    leal version_str, %esi
    call strprint

    leal initial_str_2, %esi
    call strprint

    cmpl $8, %eax           # Check if the user is the supervisor
    jne print_user_message

    leal supervisor_mode_str, %esi           # Print supervisor message
    call strprint

    jmp save_register

print_user_message:
    leal user_mode_str, %esi         # Print user message
    call strprint

save_register:
    pushl %eax

check_row:
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
    cmpl $8, %eax               # If the user is the supervisor, print the supervisor row 
    je print_row_0_supervisor

print_row_0_user:
    leal row_0_str, %esi        # Print the normal row
    jmp print_row

print_row_0_supervisor:
    leal row_0_supervisor_str, %esi    # Print the supervisor row
    jmp print_row

print_row_1:
    leal row_1_str, %esi        # Print the first row
    jmp print_row

print_row_2:
    leal row_2_str, %esi        # Print the second row
    jmp print_row

print_row_3:
    leal row_3_str, %esi        # Print the third row
    call strprint

    movl door_lock, %eax        # Check if the auto door lock is on
    cmpl $0, %eax
    je print_row_3_off

    leal on_str, %esi           # Print the auto door lock on message
    jmp print_row

print_row_3_off:
    leal off_str, %esi          # Print the auto door lock off message
    jmp print_row

print_row_4:
    leal row_4_str, %esi        # Print the fourth row
    call strprint

    movl back_home, %eax        # Check if the back home is on
    cmpl $0, %eax
    je print_row_4_off

    leal on_str, %esi           # Print the back home on message
    jmp print_row

print_row_4_off:
    leal off_str, %esi          # Print the back home off message
    jmp print_row

print_row_5:
    leal row_5_str, %esi        # Print the fifth row
    jmp print_row

print_row_6:
    leal row_6_str, %esi        # Print the sixth row
    call strprint

    movl turn_signals, %eax # Special print: a number
    call numprint

    leal newline_str, %esi        # New line
    jmp print_row

print_row_7:
    leal row_7_str, %esi        # Print the seventh row
    jmp print_row
    
print_row:
    call strprint               # Execute the print

exit_print_row:                 # Restore registers and return
    popl %eax
    popl %esi

    ret

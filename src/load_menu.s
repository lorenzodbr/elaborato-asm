# Load Menu
#
# Registers:
# EDX = menu index
# ECX = counter/return value
# EAX = menu length

.section .text
	.global load_menu

.type load_menu, @function

load_menu:
    call print_current_row      # print current row
    
    leal input_char, %esi       # print ">>"
    call strprint               
    
    call strget                 # wait for user input

    leal up_arrow_str, %edi     # compare input to up arrow
    call strcmp
    cmp $0, %eax                # if strcmp returns 0, jump to decrement_index
    je decrement_index

    leal down_arrow_str, %edi   # compare input to down arrow
    call strcmp
    cmp $0, %eax                # if strcmp returns 0, jump to increment_index
    je increment_index

    leal right_arrow_str, %edi  # compare input to right arrow
    call strcmp
    cmp $0, %eax                # if strcmp returns 0, jump to enter_submenu_call
    je enter_submenu_call

    leal command_invalid_str, %esi  # otherwise, print invalid command
    call strprint

    jmp load_menu                   # loop back to the beginning

increment_index:
    incl %edx                   # increment index
    
    cmpl %edx, %eax             # compare index to menu length
    jle load_menu               # if index is less than menu length, loop back to the beginning

    xorl %edx, %edx             # otherwise, reset index to 0 (cycle back the index)

    jmp load_menu               # loop back to the beginning

decrement_index:
    decl %edx                   # decrement index

    cmpl $-1, %edx              # compare index to -1
    jge load_menu               # if index is greater than -1, loop back to the beginning

    movl %eax, %edx             # otherwise, set index to menu length - 1 (cycle back the index)
    decl %edx

    jmp load_menu               # loop back to the beginning

enter_submenu_call:
    call enter_submenu          # enter submenu
    jmp load_menu               # after exiting, loop back to the beginning

exit_load_menu:
    ret

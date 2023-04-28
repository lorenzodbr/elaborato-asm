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
    call print_current_row       # print current row
    
    leal input_char, %esi        # print ">>"
    call strprint               
    
    call strget                  # wait for user input

    leal up_arrow_str, %edi      # compare input to up arrow
    call strcmp
    cmpl $0, %ecx                # if strcmp returns 0, jump to decrement_index
    je decrement_index

    leal down_arrow_str, %edi    # compare input to down arrow
    call strcmp
    cmpl $0, %ecx                # if strcmp returns 0, jump to increment_index
    je increment_index

    leal right_arrow_str, %edi   # compare input to right arrow
    call strcmp
    cmpl $0, %ecx                # if strcmp returns 0, jump to enter_submenu_call
    je enter_submenu_call

    leal left_arrow_str, %edi       # compare input to enter
    call strcmp
    cmpl $0, %ecx                # if strcmp returns 0, exit load_menu
    je exit_load_menu

    leal command_invalid_str, %esi  # otherwise, print invalid command
    call strprint

    jmp load_menu               # loop back to the beginning

increment_index:
    incl %edx                   # go to the next index
    
    cmpl %edx, %eax             # compare index to menu length
    jne load_menu               # if index is less than menu length, loop back to the beginning

    xorl %edx, %edx             # otherwise, reset index to 0 (cycle back the index)

    jmp load_menu               # loop back to the beginning

decrement_index:
    decl %edx                   # go to the previous index

    cmpl $-1, %edx              # compare index to -1
    jne load_menu               # if index is greater than -1, loop back to the beginning

    movl %eax, %edx             # otherwise, set index to menu length - 1 (cycle back the index)
    decl %edx

    jmp load_menu               # loop back to the beginning

enter_submenu_call:
    call enter_submenu          # enter submenu
    jmp load_menu               # after exiting, loop back to the beginning

exit_load_menu:
    ret

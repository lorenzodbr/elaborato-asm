.section .data
    def_message:
        .ascii "Entrato nel sottomenu\0"

    success_message:
        .ascii "Comando eseguito con successo\0"

.section .text
	.global enter_submenu

.type enter_submenu, @function

enter_submenu:
    leal def_message, %esi          # print default message
    call strprint

wait_for_input_submenu:
    leal input_char, %esi
    call strprint                   # print ">>"

    call strget                     # get input from user

    leal up_arrow_str, %edi         # check if up arrow was pressed
    call strcmp
    cmpl $0, %ecx
    je update

    leal down_arrow_str, %edi       # check if down arrow was pressed
    call strcmp
    cmpl $0, %ecx
    je update

    leal enter_str, %edi            # check if enter was pressed
    call strcmp
    cmpl $0, %ecx
    
    jne print_error                 # if not, print error message and wait for input again

    ret                             # if yes, return to main menu

update:
    leal success_message, %esi      # print success message
    call strprint
    
    jmp wait_for_input_submenu

print_error:
    leal command_invalid_str, %esi  # print error message
    call strprint

    jmp wait_for_input_submenu

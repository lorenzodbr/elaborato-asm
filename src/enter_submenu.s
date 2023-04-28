# Function used to perform the actions of the submenu, based on the index stored in EDX

.section .data
.section .text
	.global enter_submenu

.type enter_submenu, @function

enter_submenu:
    pushl %edi              # Save registers
    pushl %esi
    pushl %ecx
    pushl %eax

enter_submenu_switch:
    cmpl $0, %edx           # Switch-case implementation using jumps
    je submenu_0

    cmpl $1, %edx
    je submenu_1

    cmpl $2, %edx
    je submenu_2

    cmpl $3, %edx
    je submenu_3

    cmpl $4, %edx
    je submenu_4

    cmpl $5, %edx
    je submenu_5

    cmpl $6, %edx
    je submenu_6

    cmpl $7, %edx
    je submenu_7

exit_submenu:
    popl %eax                       # restore registers
    popl %ecx
    popl %esi
    popl %edi

    ret                             # return to main menu

.type print_error, @function
print_error:
    leal command_invalid_str, %esi  # print error message
    call strprint
    
    ret

submenu_0:                          # menu title
submenu_5:                          # oil check
    leal function_not_implemented_str, %esi
    call strprint

    jmp wait_to_exit

submenu_1:                          # date
    leal date_str, %esi
    call strprint

    jmp wait_to_exit

submenu_2:                          # time
    leal time_str, %esi
    call strprint
    
wait_to_exit:                       # Wait for any input, and exit on "back" command
    leal left_to_go_back_str, %esi
    call strprint
    
    leal input_char, %esi           # Print ">>"
    call strprint

    call strget                     # Get input from user

    leal left_arrow_str, %edi       # Check if left arrow was pressed
    call strcmp
    cmpl $0, %ecx
    je exit_submenu                 # If yes, exit submenu

    call print_error                # Print error message otherwise

    jmp enter_submenu_switch        # Loop back

submenu_3:                          # auto door lock
    leal current_value_str, %esi
    call strprint

    movl door_lock, %eax            # print current value
    call status_print               # print ON/OFF depending on EAX value

submenu_3_wait_for_input:
    leal up_down_to_change_str, %esi    # Print instructions
    call strprint
    
    leal left_to_go_back_str, %esi      # Print instructions string "Freccia sinistra per tornare indietro"
    call strprint


    leal input_char, %esi           # Print ">>"
    call strprint

    call strget                     # Get input from user

    leal up_arrow_str, %edi         # Check if up arrow was pressed
    call strcmp
    cmpl $0, %ecx
    je update_door_lock             # If yes, update value

    leal down_arrow_str, %edi       # Check if down arrow was pressed
    call strcmp
    cmpl $0, %ecx
    je update_door_lock             # If yes, update value

    leal left_arrow_str, %edi          # Check if left arrow was pressed
    call strcmp
    cmpl $0, %ecx
    je exit_submenu                 # If yes, exit submenu

    leal command_invalid_str, %esi  # Print error message otherwise
    call strprint

    leal current_value_str, %esi
    call strprint
    
    call status_print

    jmp submenu_3_wait_for_input

update_door_lock:
    movl door_lock, %eax

    xorl $1, %eax

    movl %eax, door_lock

    leal new_value_str, %esi
    call strprint

    call status_print

    jmp submenu_3_wait_for_input

door_lock_off:
    leal off_str, %esi
    call strprint

    jmp submenu_3_wait_for_input

submenu_4:                          # back home
    leal current_value_str, %esi
    call strprint

    movl back_home, %eax            # print current value
    
    call status_print

submenu_4_wait_for_input:
    leal up_down_to_change_str, %esi    # print instructions
    call strprint
    
    leal left_to_go_back_str, %esi      # print instructions string "Freccia sinistra per tornare indietro"
    call strprint


    leal input_char, %esi           # print ">>"
    call strprint

    call strget                     # get input from user

    leal up_arrow_str, %edi         # check if up arrow was pressed
    call strcmp
    cmpl $0, %ecx
    je update_back_home             # if yes, update value

    leal down_arrow_str, %edi       # check if down arrow was pressed
    call strcmp
    cmpl $0, %ecx
    je update_back_home             # if yes, update value

    leal left_arrow_str, %edi          # check if left arrow was pressed
    call strcmp
    cmpl $0, %ecx
    je exit_submenu                 # if yes, exit submenu

    leal command_invalid_str, %esi  # print error message otherwise
    call strprint
    
    leal current_value_str, %esi
    call strprint
    
    call status_print

    jmp submenu_4_wait_for_input

update_back_home:
    movl back_home, %eax

    xorl $1, %eax

    movl %eax, back_home

    leal new_value_str, %esi
    call strprint

    call status_print

    jmp submenu_4_wait_for_input

submenu_6:                          # lights indicators set
lights_indicators_print_current_value:
    leal current_value_str, %esi            # print current value string "Valore corrente: "
    call strprint

    movl frecce_direzione, %eax             # print current value
    call numprint

submenu_6_wait_for_input:
    leal input_frecce_direzione_str, %esi       # print instructions string "Inserisci il nuovo valore: "
    call strprint

    leal left_to_go_back_str, %esi              # print instructions string "Freccia sinistra per tornare indietro"
    call strprint

    leal input_char, %esi
    call strprint
    
    call numget
    call atoi

    cmpl $0, %ebx
    jne lights_indicators_non_numeric_input

    cmpl frecce_direzione_max, %eax
    jg lights_indicators_too_big

    cmpl frecce_direzione_min, %eax
    jl lights_indicators_too_small

    movl %eax, frecce_direzione

    jmp lights_indicators_print_new_value

lights_indicators_non_numeric_input:
    leal left_arrow_str, %edi
    call strcmp
    cmpl $0, %ecx
    je exit_submenu

    leal invalid_input_str, %esi
    call strprint

    jmp lights_indicators_print_current_value

lights_indicators_too_big:
    leal invalid_input_str, %esi
    call strprint

    movl frecce_direzione_max, %eax
    movl %eax, frecce_direzione

    jmp lights_indicators_print_new_value

lights_indicators_too_small:
    leal invalid_input_str, %esi
    call strprint

    movl frecce_direzione_min, %eax
    movl %eax, frecce_direzione

    jmp lights_indicators_print_new_value

lights_indicators_print_new_value:
    leal new_value_str, %esi
    call strprint

    call numprint               # new value is already in EAX

    jmp submenu_6_wait_for_input

submenu_7:
    leal tire_pressure_resetted_str, %esi
    call strprint

    jmp exit_submenu

.type status_print, @function
status_print:
    pushl %esi

    cmpl $0, %eax
    je status_off

    leal on_str, %esi
    call strprint

    jmp exit_status_print

status_off:
    leal off_str, %esi
    call strprint

exit_status_print:
    popl %esi

    ret

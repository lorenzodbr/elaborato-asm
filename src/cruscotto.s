# Main file

.section .data
    eax_value: .long 0                  # Initial values of registers
    ebx_value: .long 0
    ecx_value: .long 0
    edx_value: .long 0
    esi_value: .long 0
    edi_value: .long 0

.section .text
    .global _start

_start:

save_registers:
    movl %eax, eax_value                # Save initial values
    movl %ebx, ebx_value            
    movl %ecx, ecx_value            
    movl %edx, edx_value            
    movl %esi, esi_value            
    movl %edi, edi_value            
    
    xorl %eax, %eax                     # Zero out registers
    xorl %ebx, %ebx
    xorl %ecx, %ecx
    xorl %edx, %edx
    xorl %esi, %esi
    xorl %edi, %edi

print_initial_message:
    leal initial_str_1, %esi            # Print initial string
    call strprint

    leal version_str, %esi
    call strprint

    leal initial_str_2, %esi
    call strprint

get_param:
    popl %eax                           # Get param length

    cmpl $2, %eax                       # Check if param length is 1
    jne enable_user

    popl %esi                           # Ignore filename
    popl %esi                           # Get actual param

    leal pin_str, %edi                  # Check if param is 2244
    call strcmp

    cmpl $0, %ecx                    
    je enable_supervisor                # If param is 2244, enable supervisor mode

enable_user:
    movl $6, %eax                       # Set user mode menu length
    leal user_mode_str, %esi            # Print user mode string
    call strprint
    jmp handle_choice

enable_supervisor:
    movl $8, %eax                       # Set supervisor mode menu length
    leal supervisor_mode_str, %esi      # Print supervisor mode string
    call strprint
    
handle_choice:
    xorl %edx, %edx                     # Zero out edx (index of menu)
    call load_menu                      # Load menu

exit:
    leal exit_str, %esi                 # Print exit string
    call strprint

    movl eax_value, %eax                # Restore initial values
    movl ebx_value, %ebx                
    movl ecx_value, %ecx                
    movl edx_value, %edx                

    movl $1, %eax                       # Exit
    movl $0, %ebx
    int $0x80

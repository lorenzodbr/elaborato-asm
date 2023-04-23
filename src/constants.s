.section .data
    .global version_str
    .global initial_str_1
    .global initial_str_2
    .global no_param_str
    .global supervisor_mode_str
    .global pin_str
    .global pin_correct_str
    .global pin_incorrect_str
    .global enter_str
    .global up_arrow_str
    .global down_arrow_str
    .global left_arrow_str
    .global right_arrow_str
    .global input_char
    .global command_invalid_str

    version_str:
        .asciz "1.1"

    initial_str_1:
        .asciz "Avvio programma...\n\n\t--------------------------------------------\n\t|         Cruscotto Assembly v"

    initial_str_2:
        .asciz "          |\n\t| di Lorenzo Di Berardino e Filippo Milani |\n\t--------------------------------------------\n"

    no_param_str:
        .asciz "Nessun parametro\n"

    supervisor_mode_str:
        .asciz "\n[!] Modalità supervisore attiva\n"

    pin_str:
        .asciz "2244"

    pin_correct_str:
        .asciz "PIN corretto\n"

    pin_incorrect_str:
        .asciz "PIN errato\n"

    enter_str:
        .asciz "\n"

    up_arrow_str: 
        .asciz "33[A"

    down_arrow_str: 
        .asciz "33[B"

    left_arrow_str: 
        .asciz "33[D"

    right_arrow_str: 
        .asciz "33[C"

    input_char: 
        .asciz "\n>> "

    command_invalid_str:
        .asciz "\nComando non valido\n"

    row_0: 
        .asciz "\n1. Setting automobile:\n"

    row_1: 
        .asciz "\n2. Data: 15/06/2014\n"

    row_2: 
        .asciz "\n3. Ora: 15:32\n"

    row_3: 
        .asciz "\n4. Blocco automatico porte\n"

    row_4: 
        .asciz "\n5. Back-home\n"

    row_5: 
        .asciz "\n6. Check olio\n"

    row_6: 
        .asciz "\n7. Frecce direzione\n"

    row_7: 
        .asciz "\n8. Reset pressione gomme\n"

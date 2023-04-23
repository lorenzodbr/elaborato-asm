.section .data
    .global version_str
    version_str:
        .asciz "1.2"

    .global initial_str_1
    initial_str_1:
        .asciz "Avvio programma...\n\n\t--------------------------------------------\n\t|         Cruscotto Assembly v"

    .global initial_str_2
    initial_str_2:
        .asciz "          |\n\t| di Lorenzo Di Berardino e Filippo Milani |\n\t--------------------------------------------\n"

    .global exit_str 
    exit_str:
        .asciz "\nUscita dal programma...\n"

    .global no_param_str
    no_param_str:
        .asciz "Nessun parametro\n"

    .global supervisor_mode_str
    supervisor_mode_str:
        .asciz "\n\t      [!] Modalità supervisore attiva\n"

    .global pin_str
    pin_str:
        .asciz "2244"

    .global pin_correct_str
    pin_correct_str:
        .asciz "PIN corretto\n"

    .global pin_incorrect_str
    pin_incorrect_str:
        .asciz "PIN errato\n"

    .global enter_str
    enter_str:
        .asciz "\n"

    .global up_arrow_str
    up_arrow_str: 
        .asciz "\033[A\n"

    .global down_arrow_str
    down_arrow_str: 
        .asciz "\033[B\n"

    .global left_arrow_str
    left_arrow_str: 
        .asciz "\033[D\n"

    .global right_arrow_str
    right_arrow_str: 
        .asciz "\033[C\n"

    .global input_char
    input_char: 
        .asciz "\n>> "

    .global command_invalid_str
    command_invalid_str:
        .asciz "\n[!] Comando non valido\n"

    .global row_0_str
    row_0_str: 
        .asciz "\n1. Setting automobile\n"

    .global row_1_str
    row_1_str: 
        .asciz "\n2. Data\n"

    .global date_str
    date_str: 
        .asciz "\nOggi è il 15/06/2014\n"

    .global row_2_str
    row_2_str: 
        .asciz "\n3. Ora\n"

    .global time_str
    time_str: 
        .asciz "\nSono le 15:32\n"

    .global row_3_str
    row_3_str: 
        .asciz "\n4. Blocco automatico porte\n"

    .global row_4_str
    row_4_str: 
        .asciz "\n5. Back-home\n"

    .global row_5_str
    row_5_str: 
        .asciz "\n6. Check olio\n"

    .global row_6_str
    row_6_str: 
        .asciz "\n7. Frecce direzione\n"

    .global row_7_str
    row_7_str: 
        .asciz "\n8. Reset pressione gomme\n"

    .global function_not_implemented_str
    function_not_implemented_str: 
        .asciz "\n[!] Funzione non implementata\n"

    .global tire_pressure_reset_str
    tire_pressure_reset_str: 
        .asciz "\n[!] Pressione gomme resettata\n"

    .global input_frecce_direzione_str
    input_frecce_direzione_str: 
        .asciz "\n[!] Inserire un numero (2-5)\n"

    .global current_value_str
    current_value_str: 
        .asciz "\n[!] Valore attuale: "

    .global new_value_str
    new_value_str: 
        .asciz "\n[!] Nuovo valore: "

    .global up_down_to_change_str
    up_down_to_change_str: 
        .asciz "\n[!] Freccia su o giù, poi invio per modificare\n"

    .global on_str
    on_str: 
        .asciz "ON"

    .global off_str
    off_str: 
        .asciz "OFF"

    .global frecce_direzione
    frecce_direzione:
        .long 3

    .global frecce_direzione_max
    frecce_direzione_max:
        .long 5

    .global frecce_direzione_min
    frecce_direzione_min:
        .long 2

    .global door_lock
    door_lock:
        .long 1

    .global back_home
    back_home:
        .long 1

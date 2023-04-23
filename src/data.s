.section .data
    .global version_str
    version_str:
        .asciz "1.3"

    .global initial_str_1
    initial_str_1:
        .asciz "\n\t[!] Avvio del cruscotto...\n\n  --------------------------------------------\n  |         Cruscotto Assembly v"

    .global initial_str_2
    initial_str_2:
        .asciz "          |\n  | di Lorenzo Di Berardino e Filippo Milani |\n  --------------------------------------------\n"

    .global exit_str 
    exit_str:
        .asciz "\n\t[!] Esco dal cruscotto...\n"

    .global no_param_str
    no_param_str:
        .asciz "Nessun parametro\n"

    .global supervisor_mode_str
    supervisor_mode_str:
        .asciz "\n\t[!] Modalità supervisore attiva\n"

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
        .asciz "\n\t[!] Comando non valido\n"

    .global row_0_str
    row_0_str: 
        .asciz "\n1. Setting automobile\n"

    .global row_1_str
    row_1_str: 
        .asciz "\n2. Data\n"

    .global date_str
    date_str: 
        .asciz "\n\tData corrente: 15/06/2014\n"

    .global row_2_str
    row_2_str: 
        .asciz "\n3. Ora\n"

    .global time_str
    time_str: 
        .asciz "\n\tOra corrente: 15:32\n"

    .global row_3_str
    row_3_str: 
        .asciz "\n4. Blocco automatico porte: "

    .global row_4_str
    row_4_str: 
        .asciz "\n5. Back-home: "

    .global row_5_str
    row_5_str: 
        .asciz "\n6. Check olio\n"

    .global row_6_str
    row_6_str: 
        .asciz "\n7. Frecce direzione: "

    .global row_7_str
    row_7_str: 
        .asciz "\n8. Reset pressione gomme\n"

    .global function_not_implemented_str
    function_not_implemented_str: 
        .asciz "\n\t[!] Funzione non implementata\n"

    .global invalid_input_str
    invalid_input_str: 
        .asciz "\n\t[!] Input non valido"

    .global tire_pressure_reset_str
    tire_pressure_reset_str: 
        .asciz "\n\t[!] Pressione gomme resettata\n"

    .global input_frecce_direzione_str
    input_frecce_direzione_str: 
        .asciz "\n\t[!] Inserire un numero intero (2-5)\n"

    .global lights_indicators_too_big_str
    lights_indicators_too_big_str: 
        .asciz "\n\t[!] Valore troppo grande. Imposto il massimo"

    .global lights_indicators_too_small_str
    lights_indicators_too_small_str: 
        .asciz "\n\t[!] Valore troppo piccolo. Imposto il minimo"

    .global current_value_str
    current_value_str: 
        .asciz "\n\t[!] Valore attuale: "

    .global new_value_str
    new_value_str: 
        .asciz "\n\t[!] Nuovo valore: "

    .global up_down_to_change_str
    up_down_to_change_str: 
        .asciz "\t[!] Freccia su o giù, poi invio per modificare\n"

    .global on_str
    on_str: 
        .asciz "ON\n"

    .global off_str
    off_str: 
        .asciz "OFF\n"

    .global frecce_direzione
    frecce_direzione:
        .int 3

    .global frecce_direzione_max
    frecce_direzione_max:
        .int 5

    .global frecce_direzione_min
    frecce_direzione_min:
        .int 2

    .global door_lock
    door_lock:
        .int 1

    .global back_home
    back_home:
        .int 1

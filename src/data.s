# Variables and constants of the program

.section .rodata
    .global version_str
    version_str:
        .asciz "1.5"

    .global initial_str_1
    initial_str_1:
        .asciz "\n  --------------------------------------------\n  |         Cruscotto Assembly v"

    .global initial_str_2
    initial_str_2:
        .asciz "          |\n  | di Lorenzo Di Berardino e Filippo Milani |\n  --------------------------------------------\n"

    .global exit_str 
    exit_str:
        .asciz "\n\t[!] Esco dal cruscotto...\n"

    .global clear_str
    clear_str:
        .asciz "\033[2J\033[1;1H"

    .global no_param_str
    no_param_str:
        .asciz "Nessun parametro\n"

    .global supervisor_mode_str
    supervisor_mode_str:
        .asciz "\n\t[!] Modalità supervisore attiva\n"

    .global user_mode_str
    user_mode_str:
        .asciz "\n\t[!] Modalità utente attiva\n"

    .global pin_str
    pin_str:
        .asciz "2244"

    .global pin_correct_str
    pin_correct_str:
        .asciz "PIN corretto\n"

    .global pin_incorrect_str
    pin_incorrect_str:
        .asciz "PIN errato\n"

    .global newline_str
    newline_str:
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

    .global enter_str
    enter_str: 
        .asciz "\n"

    .global command_invalid_str
    command_invalid_str:
        .asciz "\n\t[!] Comando non valido\n"

    .global row_0_str
    row_0_str: 
        .asciz "\n    1. Setting automobile\n"
    
    .global row_0_supervisor_str
    row_0_supervisor_str: 
        .asciz "\n    1. Setting automobile (supervisore)\n"

    .global row_1_str
    row_1_str: 
        .asciz "\n    2. Data\n"

    .global date_str
    date_str: 
        .asciz "\n\t[!] Data corrente: 15/06/2014\n"

    .global row_2_str
    row_2_str: 
        .asciz "\n    3. Ora\n"

    .global time_str
    time_str: 
        .asciz "\n\t[!] Ora corrente: 15:32\n"

    .global row_3_str
    row_3_str: 
        .asciz "\n    4. Blocco automatico porte: "

    .global row_4_str
    row_4_str: 
        .asciz "\n    5. Back-home: "

    .global row_5_str
    row_5_str: 
        .asciz "\n    6. Check olio\n"

    .global row_6_str
    row_6_str: 
        .asciz "\n    7. Frecce direzione: "

    .global row_7_str
    row_7_str: 
        .asciz "\n    8. Reset pressione gomme\n"

    .global function_not_implemented_str
    function_not_implemented_str: 
        .asciz "\n\t[!] Funzione non implementata\n"

    .global invalid_input_str
    invalid_input_str: 
        .asciz "\n\t[!] Input non valido"

    .global error_str
    error_str: 
        .asciz "\n\t Si è verificato un errore"

    .global tire_pressure_resetted_str
    tire_pressure_resetted_str: 
        .asciz "\n\t[!] Pressione gomme resettata\n"

    .global input_turn_signals_str
    input_turn_signals_str: 
        .asciz "\n\t[!] Inserire un numero intero (2-5)\n"

    .global turn_signals_too_big_str
    turn_signals_too_big_str: 
        .asciz "\n\t[!] Input troppo alto, impostato al massimo"

    .global turn_signals_too_small_str
    turn_signals_too_small_str: 
        .asciz "\n\t[!] Input troppo basso, impostato al minimo"

    .global current_value_str
    current_value_str: 
        .asciz "\n\t[!] Valore attuale: "

    .global new_value_str
    new_value_str: 
        .asciz "\n\t[!] Nuovo valore: "

    .global up_down_to_change_str
    up_down_to_change_str: 
        .asciz "\t[!] Freccia su o giù, poi invio per salvare\n"
    
    .global enter_to_go_back_str
    enter_to_go_back_str: 
        .asciz "\t[!] Invio per tornare indietro\n"

    .global on_str
    on_str: 
        .asciz "ON\n"

    .global off_str
    off_str: 
        .asciz "OFF\n"

    .global turn_signals_max
    turn_signals_max:
        .int 5

    .global turn_signals_min
    turn_signals_min:
        .int 2

.section .data
    .global turn_signals
    turn_signals:
        .int 3

    .global door_lock
    door_lock:
        .int 1

    .global back_home
    back_home:
        .int 1

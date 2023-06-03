#include <stdio.h>
#include <string.h>
#include <stdlib.h>

#define PIN "2244"

#define UP_ARROW "\x1B[A\n"
#define DOWN_ARROW "\x1B[B\n"
#define LEFT_ARROW "\x1B[D\n"
#define RIGHT_ARROW "\x1B[C\n"
#define ENTER "\n"
#define INITIAL_MESSAGE_1 "\n  --------------------------------------------\n  |         Cruscotto Assembly v"
#define EXIT_MESSAGE "\n\t[!] Esco dal cruscotto...\n"
#define VERSION "1.5"
#define INITIAL_MESSAGE_2 "          |\n  | di Lorenzo Di Berardino e Filippo Milani |\n  --------------------------------------------\n"
#define SUPERVISOR_MODE "\n\t[!] Modalità supervisore attiva\n"
#define USER_MODE "\n\t[!] Modalità utente attiva\n"
#define INPUT_CHAR "\n>> "
#define CLEAR "\033[H\033[J"

#define ROW_0 "    1. Setting automobile\n"
#define ROW_0_SUPERVISOR "    1. Setting automobile (supervisore)\n"
#define ROW_1 "    2. Data: 15/06/2023\n"
#define ROW_2 "    3. Ora: 15:32\n"
#define ROW_3 "    4. Blocco automatico porte: "
#define ROW_4 "    5. Back-home: "
#define ROW_5 "    6. Check olio\n"
#define ROW_6 "    7. Frecce direzione: "
#define ROW_7 "    8. Reset pressione gomme\n"

#define COMMAND_INVALID "\n\t[!] Comando non valido\n"
#define FUNCTION_NOT_IMPLEMENTED "\n\t[!] Funzione non implementata\n"
#define INVALID_INPUT "\n\t[!] Input non valido"
#define INPUT_TOO_SMALL "\n\t[!] Input troppo basso, impostato al minimo"
#define INPUT_TOO_BIG "\n\t[!] Input troppo alto, impostato al massimo"
#define TIRE_PRESSURE_RESETTED "\n\t[!] Pressione gomme resettata\n"
#define INPUT_LIGHT_INDICATORS "\n\t[!] Inserire un numero intero (2-5)\n"
#define CURRENT_VALUE "\n\t[!] Valore attuale: "
#define NEW_VALUE "\n\t[!] Nuovo valore: "
#define UP_DOWN_TO_CHANGE "\t[!] Freccia su o giù, poi invio per salvare\n"
#define ENTER_TO_GO_BACK "\t[!] Invio per tornare indietro\n"
#define ON "ON\n"
#define OFF "OFF\n"

#define SETTING_AUTOMOBILE 0
#define DATA 1
#define ORA 2
#define BLOCCO_AUTOMATICO 3
#define BACK_HOME 4
#define CHECK_OLIO 5
#define FRECCE_DIREZIONE 6
#define RESET_PRESSIONE_GOMME 7

#define FRECCE_DIREZIONE_DEF 3
#define FRECCE_DIREZIONE_MIN 2
#define FRECCE_DIREZIONE_MAX 5
#define STR_CHOICE_LENGTH 255

#define USER_CHOICES_COUNT 6
#define SUPERVISOR_CHOICES_COUNT 8

#define TRUE 1
#define FALSE 0

int choice = SETTING_AUTOMOBILE;
int door_lock = TRUE;
int back_home = TRUE;
int light_indicators = FRECCE_DIREZIONE_DEF;
int max_choice = USER_CHOICES_COUNT;

void handle_choice();
void get_row();
void perform_action();

int main(int argc, char *argv[]){    
    if(argc == 2 && !strcmp(argv[1], PIN)){         //controllo che il pin sia corretto
        max_choice = SUPERVISOR_CHOICES_COUNT;      //se è corretto, attivo la modalità supervisore
    }

    printf("%s%s%s", INITIAL_MESSAGE_1, VERSION, INITIAL_MESSAGE_2);    //stampo il messaggio iniziale

    if(max_choice == SUPERVISOR_CHOICES_COUNT){                         //se sono in modalità supervisore
        printf(SUPERVISOR_MODE);                                        //stampo il messaggio di modalità supervisore
    } else {
        printf(USER_MODE);                                              //altrimenti stampo il messaggio di modalità utente
    }

    handle_choice();                                //gestisco la scelta dell'utente

    printf(EXIT_MESSAGE);                           //esco dal cruscotto

    return 0;
}

void handle_choice(){
    do {       
        get_row();                                                          //stampo la riga corrispondente alla scelta attuale

        char str_choice[STR_CHOICE_LENGTH];

        printf(INPUT_CHAR);
        fgets(str_choice, STR_CHOICE_LENGTH, stdin);                        //prendo l'input dell'utente

        if(!strcmp(str_choice, UP_ARROW)){                                  //se l'utente ha premuto la freccia su
            choice = (choice - 1) % max_choice;                             //diminuisco la scelta attuale
        }
        else if(!strcmp(str_choice, DOWN_ARROW)){                           //se l'utente ha premuto la freccia giù
            choice = (choice + 1) % max_choice;                             //aumento la scelta attuale
        }
        else if(!strcmp(str_choice, RIGHT_ARROW)){                          //se l'utente ha premuto la freccia destra
            perform_action();                                               //entro nel sottomenu
        }
        else if(!strcmp(str_choice, ENTER)){                                //se l'utente ha premuto invio
            return;                                                         //esco dal cruscotto
        }
        else {
            printf(COMMAND_INVALID);                                        //altrimenti stampo un messaggio di comando non valido
        }

        if(choice < 0){                                                     //se la scelta è minore di 0
            choice = max_choice - 1;                                        //la imposto al massimo
        }
    } while(TRUE);
}

void get_row(){
    printf(ENTER);

    switch (choice){                                            //stampo la riga corrispondente alla scelta attuale                                
        case SETTING_AUTOMOBILE:
            if(max_choice == SUPERVISOR_CHOICES_COUNT){
                printf(ROW_0_SUPERVISOR);
            } else {
                printf(ROW_0);
            }

            break;
        case DATA:
            printf(ROW_1);
            break;
        case ORA:
            printf(ROW_2);
            break;
        case BLOCCO_AUTOMATICO:
            printf("%s%s", ROW_3, door_lock ? ON : OFF);
            break;  
        case BACK_HOME:
            printf("%s%s", ROW_4, back_home ? ON : OFF);
            break;
        case CHECK_OLIO:
            printf(ROW_5);
            break;
        case FRECCE_DIREZIONE:
            printf("%s%d%s", ROW_6, light_indicators, ENTER);
            break;
        case RESET_PRESSIONE_GOMME:
            printf(ROW_7);
            break;
    }
}

void perform_action(){
    char str_choice[STR_CHOICE_LENGTH];

    if(choice == BLOCCO_AUTOMATICO || choice == BACK_HOME){         //se la scelta è blocco automatico o back-home
        printf("%s%s", CURRENT_VALUE, choice == BLOCCO_AUTOMATICO ? (door_lock ? ON : OFF) : (back_home ? ON : OFF));
        printf(UP_DOWN_TO_CHANGE);
        printf(ENTER_TO_GO_BACK);
        printf(INPUT_CHAR);
        fgets(str_choice, STR_CHOICE_LENGTH, stdin);                //prendo l'input freccia su o giù dell'utente

        while(strcmp(str_choice, ENTER)){                           //finchè l'utente non preme invio per uscire
            if(!strcmp(str_choice, UP_ARROW) || !strcmp(str_choice, DOWN_ARROW)){
                if(choice == BLOCCO_AUTOMATICO){                    //se la scelta è blocco automatico
                    door_lock = !door_lock;                         //cambio il valore di blocco automatico
                }
                else {
                    back_home = !back_home;                         //altrimenti cambio il valore di back-home
                }
            }
            else if(strcmp(str_choice, ENTER)){
                printf(COMMAND_INVALID);                            //se l'utente ha premuto un tasto diverso da invio, stampo un messaggio di comando non valido
            }

            printf("%s%s", CURRENT_VALUE, choice == BLOCCO_AUTOMATICO ? (door_lock ? ON : OFF) : (back_home ? ON : OFF));
            printf(UP_DOWN_TO_CHANGE);
            printf(ENTER_TO_GO_BACK);
            printf(INPUT_CHAR);
            fgets(str_choice, STR_CHOICE_LENGTH, stdin);            //prendo nuovamente l'input freccia su o giù dell'utente
        }
    }
    else if(choice == RESET_PRESSIONE_GOMME){
        printf(TIRE_PRESSURE_RESETTED);
    }
    else if(choice == FRECCE_DIREZIONE){
        printf("%s%d", CURRENT_VALUE, light_indicators);
        printf(INPUT_LIGHT_INDICATORS);
        printf(ENTER_TO_GO_BACK);
        printf(INPUT_CHAR);
        fgets(str_choice, STR_CHOICE_LENGTH, stdin);                    //prendo l'input numerico dell'utente
        
        while(strcmp(str_choice, ENTER)){
            int new_light_indicators = atoi(str_choice);                //converto l'input in un intero

            if(new_light_indicators == 0 && str_choice[0] != '0'){      //se l'input non è un numero
                printf(INVALID_INPUT);                                  //stampo un messaggio di input non valido
                printf(CURRENT_VALUE);
            }
            else {
                if(new_light_indicators < FRECCE_DIREZIONE_MIN){        //se l'input è minore del minimo
                    new_light_indicators = FRECCE_DIREZIONE_MIN;        //imposto il valore al minimo
                    printf(INPUT_TOO_SMALL);
                }
                else if(new_light_indicators > FRECCE_DIREZIONE_MAX){
                    new_light_indicators = FRECCE_DIREZIONE_MAX;        //altrimenti se l'input è maggiore del massimo
                    printf(INPUT_TOO_BIG);
                }

                light_indicators = new_light_indicators;                //imposto il valore delle frecce direzione
                printf("%s", NEW_VALUE);
            }

            printf("%d", light_indicators);
            printf(INPUT_LIGHT_INDICATORS);
            printf(ENTER_TO_GO_BACK);
            printf(INPUT_CHAR);
            fgets(str_choice, STR_CHOICE_LENGTH, stdin);                //prendo nuovamente l'input numerico dell'utente
        }
    }
    else {
        printf(FUNCTION_NOT_IMPLEMENTED);                               //stampo un messaggio di funzione non implementata per le rimanenti
        printf(ENTER_TO_GO_BACK);

        printf(INPUT_CHAR);
        fgets(str_choice, STR_CHOICE_LENGTH, stdin);                    //prendo l'input dell'utente

        while(strcmp(str_choice, ENTER)){                               //finchè l'utente non preme invio per uscire
            printf(COMMAND_INVALID);                                    //stampo un messaggio di comando non valido
            printf(FUNCTION_NOT_IMPLEMENTED);
            printf(ENTER_TO_GO_BACK);

            printf(INPUT_CHAR);
            fgets(str_choice, STR_CHOICE_LENGTH, stdin);                //prendo nuovamente l'input dell'utente
        }
    }
}
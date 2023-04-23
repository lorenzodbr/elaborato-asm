#include <stdio.h>
#include <string.h>
#include <stdlib.h>

#define PIN "2244"

#define UP_ARROW "\x1B[A"
#define DOWN_ARROW "\x1B[B"
#define LEFT_ARROW "\x1B[D"
#define RIGHT_ARROW "\x1B[C"
#define ENTER "\n"

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
int direction_arrow = FRECCE_DIREZIONE_DEF;
int max_choice = USER_CHOICES_COUNT;

void handle_choice();
void get_row();
void perform_action();

int main(int argc, char *argv[]){
    printf("Avvio programma...\n");
    
    if(argc == 2 && !strcmp(argv[1], PIN)){
        printf("\n[!] Modalità supervisore\n");
        max_choice = SUPERVISOR_CHOICES_COUNT;
    }
    else {
        printf("\n[!] Modalità utente\n");
    }

    while(TRUE){
        handle_choice();
    }

    return 0;
}

void handle_choice(){
    get_row();

    char str_choice[STR_CHOICE_LENGTH];

    printf(">> ");
    scanf("%s%*c", str_choice);

    if(!strcmp(str_choice, UP_ARROW)){
        choice = (choice - 1) % max_choice;
    }
    else if(!strcmp(str_choice, DOWN_ARROW)){
        choice = (choice + 1) % max_choice;
    }
    else if(!strcmp(str_choice, RIGHT_ARROW)){
        perform_action();
    }
    else {
        printf("\n! Comando non riconosciuto\n");
    }

    if(choice < 0){
        choice = max_choice - 1;
    }
}

void get_row(){
    printf("\n");

    switch (choice){
        case SETTING_AUTOMOBILE:
            printf("1. Setting automobile:\n");
            break;
        case DATA:
            printf("2. Data: 15/06/2014\n");
            break;
        case ORA:
            printf("3. Ora: 15:32\n");
            break;
        case BLOCCO_AUTOMATICO:
            printf("4. Blocco automatico porte: %s\n", door_lock ? "ON" : "OFF");
            break;  
        case BACK_HOME:
            printf("5. Back-home: %s\n", back_home ? "ON" : "OFF");
            break;
        case CHECK_OLIO:
            printf("6. Check olio\n");
            break;
        case FRECCE_DIREZIONE:
            printf("7. Frecce direzione: %d\n", direction_arrow);
            break;
        case RESET_PRESSIONE_GOMME:
            printf("8. Reset pressione gomme\n");
            break;
    }
}

void perform_action(){
    char str_choice[STR_CHOICE_LENGTH];

    if(choice == BLOCCO_AUTOMATICO || choice == BACK_HOME){
        printf("\nStato attuale: %s (freccia su o giù e invio per modificare)\n", choice == BLOCCO_AUTOMATICO ? (door_lock ? "ON" : "OFF") : (back_home ? "ON" : "OFF"));
        printf(">> ");
        scanf("%s", str_choice);

        while(strcmp(str_choice, LEFT_ARROW)){
            if(!strcmp(str_choice, UP_ARROW) || !strcmp(str_choice, DOWN_ARROW)){
                if(choice == BLOCCO_AUTOMATICO){
                    door_lock = !door_lock;
                }
                else {
                    back_home = !back_home;
                }
            }
            else if(strcmp(str_choice, LEFT_ARROW)){
                printf("\n[!] Comando non riconosciuto\n");
            }

            printf("\nStato attuale: %s (freccia su o giù e invio per modificare)\n", choice == BLOCCO_AUTOMATICO ? (door_lock ? "ON" : "OFF") : (back_home ? "ON" : "OFF"));
            printf(">> ");
            scanf("%s", str_choice);
        }
    }
    else if(choice == RESET_PRESSIONE_GOMME){
        printf("\nPressione gomme resettata\n");
    }
    else if(choice == FRECCE_DIREZIONE){
        printf("\nStato attuale: %d (inserire un valore da %d a %d)\n", direction_arrow, FRECCE_DIREZIONE_MIN, FRECCE_DIREZIONE_MAX);
        printf(">> ");
        scanf("%s", str_choice);
        
        while(strcmp(str_choice, LEFT_ARROW)){
            int new_direction_arrow = atoi(str_choice);

            if(new_direction_arrow < FRECCE_DIREZIONE_MIN){
                new_direction_arrow = FRECCE_DIREZIONE_MIN;
            }
            else if(new_direction_arrow > FRECCE_DIREZIONE_MAX){
                new_direction_arrow = FRECCE_DIREZIONE_MAX;
            }
            else {
                direction_arrow = new_direction_arrow;
            }

            printf("\nStato attuale: %d (inserire un valore da %d a %d)\n", direction_arrow, FRECCE_DIREZIONE_MIN, FRECCE_DIREZIONE_MAX);
            printf(">> ");
            scanf("%s", str_choice);
        }
    }
    else {
        printf("\nFunzione non disponibile\n");
    }
}

#include <stdbool.h>
#include <stdio.h>

bool pedir_booleano(char name) {
    int a;
    printf("Ingrese un un valor para a : \n");
    scanf("%d",&a);

    return a!=0;
}

void imprimir_booleano(char name,bool x) {
    printf("valor de '%c' es: ",name);

    if (x) {
        printf("Verdadero\n");
    } else {
        printf("Falso\n");
    }
    
    
}

int main(void) {

    bool b;
    b = pedir_booleano('b');
    imprimir_booleano('b',b);

    return 0;

}
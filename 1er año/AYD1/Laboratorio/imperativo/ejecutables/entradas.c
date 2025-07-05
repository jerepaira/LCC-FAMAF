#include <stdbool.h>
#include <stdio.h>

int pedir_entero(char name) {
    int x;
    printf("ingrese un valor para  name: %c ",name);
    scanf("%d",&x);
    return x;
}

void imprimir_entero(char name ,int y) {
    printf("el nombre es %c y  el entero  es: %d\n",name,y);
}


int main() {
    int n;
    
    n = pedir_entero('n');
    imprimir_entero('n',n);
 
    return 0;
}
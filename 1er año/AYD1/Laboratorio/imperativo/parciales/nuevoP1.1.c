#include <inttypes.h>
#include <stdbool.h>
#include <stddef.h>
#include <stdio.h>
#include <assert.h>


// funcion auxiliar 

bool es_primo(int x) {
    int i =2;
    if (x<2)
    {
        return false;
    }
    while (i<x)
    {
        if (x%i==0)
        {
            return false;
        }
        i++;
    }
    return true;
}

// Ejercicio 2

int cuantos_primos(int a[], int tam, int pos1, int pos2) {

    int i = 0;
    int resultado = 0;

    while (i<tam) {
        
        if (es_primo(a[i])) {
            resultado = resultado + a[i];
        }
        
    }

}





int main(void) {
    
    // Ejercicio 1
    bool x,y,xaux,yaux;
    printf("ingrese los valoes de x e y: \n");
    scanf("%d",&xaux);
    scanf("%d",&yaux);

    x = xaux;
    y = yaux;

    assert(x == xaux && y == yaux);
    x = yaux;
    y = xaux;
    assert(x == yaux && y == xaux);

    printf("el nuevo valor de x es: %d\n", x);
    printf("el nuevo valor de y es: %d\n", y);

    
    




    return 0;
}



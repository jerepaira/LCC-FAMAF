#include <stdio.h>
#include <stdbool.h>
#include <assert.h>
#include <limits.h>


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

int nesimo_primo(int N) {
    int contador = 0;
    int numero = 2;
    while (contador<=N)
    {
        if (es_primo(numero))
        {
            if (contador==N)
            {
                return numero;
            }
            contador++;
        }
        numero++;
    }
    
}



int main () {

    int n,resultado;
    printf("Ingrese un valor para n no negativo: \n");
    scanf("%d",&n);

    while (n<0) {
        printf("Numero invalido\n");
        scanf("%d",&n);
    }
    
    resultado = nesimo_primo(n-1);
    printf("el n-primo %d es: %d\n",n,resultado);
    

    return 0;
}
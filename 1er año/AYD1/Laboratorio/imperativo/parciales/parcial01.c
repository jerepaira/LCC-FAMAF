#include <stdio.h>
#include <stdbool.h>
#include <assert.h>
#include <limits.h>
#define N 5


int prod_menores(int tam, int a[], int n) {
    
    assert (n>0);
    int i = 0;
    int resultado = 1;
    while (i<tam)
    {
        if (a[i]<= n)
        {
            resultado *= a[i];
        }
        i++;
    }
    return resultado;
}

int main(void) {
    
    int a[N],n;
    int i = 0;

    printf("Ingrese los valores del arreglo \n");
    while (i<N)
    {
        printf("Ingrese el elemento en la posicion %d: \n", i);
        scanf("%d", &a[i]);
        i++;
    }
    printf("Ingrese el valor de n>0: %d \n", n);
    scanf("%d", &n);

    int resultado  = prod_menores(N,a,n);
    printf("El resultado es: %d ",resultado);
    

    return 0;
}
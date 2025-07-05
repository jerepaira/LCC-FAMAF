#include <stdio.h>
#include <stdbool.h>
#include <assert.h>
#include <limits.h>
#include "arreglos.h"



void pedir_arreglo(int n_max, int a[]) {
    int i=0;

    while (i<n_max)
    {
        printf("Elemento %d: ",i);
        scanf("%d",&a[i]);
        i++;
    }
    
}

int sumatoria(int tam, int a[]) {
    int i=0;
    int resultado = 0;
    while (i<tam)
    {
        resultado += a[i];   w
        i++;
    }
    return resultado;
}

int main(void) { 
    int num_max;
    printf("ingrese un valor maximo para el arreglo: \n");
    scanf("%d",&num_max);
    int arreglo[num_max];
    pedir_arreglo(num_max,arreglo);
    int suma = sumatoria(num_max,arreglo);
    printf("la suma total de los elementos es:  %d\n",suma);
    
    return 0;

}

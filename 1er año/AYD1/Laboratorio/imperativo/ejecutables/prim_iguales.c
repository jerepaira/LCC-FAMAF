#include <stdio.h>
#include <stdbool.h>
#include <assert.h>
#include <limits.h>
#include "arreglos.h"

void pedir_arreglo(int n_max, int a[]) {
    int i=0;
    while (i<n_max) {
        printf("Elemento %d: ",i);
        scanf("%d",&a[i]);
        i++;
    }
}

int prim_iguales(int tam, int a[]) {
    int i = 0;
    int longitud = 0;
    while (i<tam && a[i]==a[0]) {
            i++;
            longitud += 1;
        }
    return longitud;
}




int main(void) { 
    int num_max;
    int i =0;
    printf("ingrese un valor maximo para el arreglo: \n");
    scanf("%d",&num_max);
    int arreglo[num_max];
    pedir_arreglo(num_max,arreglo);
    int longitud_arr = prim_iguales(num_max,arreglo);
    printf("la longitud del array donde hay iguales consecutivos es: %d\n ", longitud_arr);
    while (i<longitud_arr)
    {
        printf("[ %d ]\n",arreglo[i]);
        i++;
    };
    
    
    
    
    return 0;

}

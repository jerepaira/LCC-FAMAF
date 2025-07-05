#include <stdio.h>
#include <stdbool.h>
#include <assert.h>
#include <limits.h>


void pedir_arreglo(int n_max, int a[]) {
    int i=0;

    while (i<n_max)
    {
        printf("Elemento %d: ",i);
        scanf("%d",&a[i]);
        i++;
    }
    
}


void imprimir_arreglo(int n_max, int a[]){
    int i = 0;
    while (i<n_max)
    {
        printf("el valor en la posicion %d es: %d\n",i,a[i]);
        i++;
    }
    
}


int main(void) { 
    int num_max;
    printf("ingrese un valor maximo para el arreglo: \n");
    scanf("%d",&num_max);
    int arreglo[num_max];
    pedir_arreglo(num_max,arreglo);
    imprimir_arreglo(num_max,arreglo);

    
    return 0;

}


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


void intercambiar(int tam, int a[], int i, int j) {
    
    if (i>=0 && i< tam && j>=0 && j<tam)
    {
        int aux = a[i];
        a[i]= a[j];
        a[j]=aux;
    }else {
        printf("fuera de rango pa");
    } 

}

int main (void) {

    int num_max,i,j;
    printf("ingrese un valor maximo para el arreglo: \n");
    scanf("%d",&num_max);
    int arreglo[num_max];
    pedir_arreglo(num_max,arreglo);
    printf("ingrese un valor para las posiciones de j e i : \n");
    scanf("%d %d",&i,&j);
    intercambiar(num_max,arreglo,i,j);
    printf("el nuevo valor de las posiciones j e i es j: %d e i: %d ",i,j);
    imprimir_arreglo(num_max,arreglo);

    return 0;    
}
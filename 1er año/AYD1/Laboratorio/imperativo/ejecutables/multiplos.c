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

bool todos_pares(int tam, int a[]){

    int i=0;
    while (i<tam)
    {
        if (a[i] % 2 != 0) {
            return false;
        }
        i++;
    }
    return true;
}


bool existe_multiplo(int m, int tam, int a[]) {
    int i = 0;
    while (i<tam) {
        if (a[i] % m == 0)
        {
            return true; 
        }
        i++;
    }
    return false;
}


int minimo_pares(int tam, int a[],int  *posicion){
    *posicion;
    int i = 0;
    int minimo = INT_MAX;
    while (i<tam) {
        if (a[i] % 2 == 0 && a[i]< minimo) {
            minimo = a[i];
            *posicion = i;
        }
        i++;
    }
    return minimo;
    
}

int minimo_impares(int tam, int a[],int  *posicion) {
    *posicion;
    int i = 0;
    int minimo = INT_MAX;
    while (i<tam) {
        if (a[i] % 2 == 1 && a[i]< minimo) {
            minimo = a[i];
            *posicion = i;
            
        }
        i++;
    }
    return minimo;
    

};




int main(void) { 
    int num_max,m;
    printf("Ingrese un valor para m: \n");
    scanf("%d",&m);
    printf("ingrese un valor maximo para el arreglo: \n");
    scanf("%d",&num_max);
    int arreglo[num_max];
    pedir_arreglo(num_max,arreglo);
    int multiplo = existe_multiplo(m,num_max,arreglo);
    printf("existe multiplo de m?:  %d\n",multiplo);
    
    return 0;

}

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
    
    int num_max;
    printf("ingrese un valor maximo para el arreglo: \n");
    scanf("%d",&num_max);
    int arreglo[num_max];
    int pos_impar,pos_par;
    pedir_arreglo(num_max,arreglo);
    int valor1 = minimo_impares(num_max,arreglo,&pos_impar);
    int valor2 = minimo_pares(num_max,arreglo,&pos_par);

    if (valor1 != INT_MAX) {
        printf("El elemento impar mas pequeno del arreglo es: %d  en la posicion %d\n",valor1,pos_impar);
    }else {
        printf("No hay impares\n");
    }
    if (valor2 != INT_MAX)
    {
        printf("El elemento par mas pequeno del arreglo es: %d  en la posicion %d\n",valor2,pos_par);
    }else
    {
        printf("No hay elementos pares.");
    }
    
    

    
    return 0;

}


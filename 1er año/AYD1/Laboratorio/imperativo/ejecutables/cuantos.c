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

struct comp_t {
int menores;
int iguales;
int mayores;
};

struct comp_t cuantos(int tam, int a[], int elem) {

    struct comp_t resultado = {0,0,0};
    {
        int i = 0;
        while (i<tam) {
            if (a[i]<elem)
            {
                resultado.menores++;
            }else if (a[i]==elem)
            {
                resultado.iguales++;
            }else
            {
                resultado.mayores++;
            }
            i++;
        }
        return resultado;
    };
    
}


int main (void) {

    int num_max,m;
    printf("ingrese un valor maximo para el arreglo: \n");
    scanf("%d",&num_max);
    int arreglo[num_max];
    pedir_arreglo(num_max,arreglo);
    printf("ingrese un valor para m: \n");
    scanf("%d",&m);
    
    struct comp_t resultado = cuantos(num_max,arreglo,m);
    {
        printf("Menores a %d: %d\n", m, resultado.menores);
        printf("Iguales a %d: %d\n", m, resultado.iguales);
        printf("Mayores a %d: %d\n", m, resultado.mayores);
    };
    



    return 0;
}
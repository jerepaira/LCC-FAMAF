#include <stdio.h>
#include <stdbool.h>
#include <assert.h>
#include <limits.h>


typedef char clave_t;
typedef int valor_t;
struct asoc {
clave_t clave;
valor_t valor;
};

void pedir_arreglo(int n_max, struct asoc a[]) {
    
    int i=0;

    while (i<n_max)
    {
        printf("Clave: %d: \n",i);
        scanf(" %c",&a[i].clave);
        printf("Valor: %d: \n",i);
        scanf("%d",&a[i].valor);
        i++;
    }
    
}




bool asoc_existe(int tam, struct asoc a[], clave_t c){
    int i = 0;
    while (i<tam)
    {
        if (a[i].clave==c)
        {
            return true;
        }
        i++; 
    }
    return false;

    
}


int main(void) { 
    int num_max;
    printf("ingrese un valor maximo para el arreglo: \n");
    scanf("%d",&num_max);
    struct asoc arreglo[num_max];
    pedir_arreglo(num_max,arreglo);
    clave_t buscar_clave;
    printf("Ingrese una clave a buscar ");
    scanf(" %c",&buscar_clave);

    if (asoc_existe(num_max,arreglo,buscar_clave))
    {
        printf("la clave %c Si existe\n",buscar_clave);
    }else
    {
        printf("la clave %c No existe\n",buscar_clave);

    }
 
    return 0;

}


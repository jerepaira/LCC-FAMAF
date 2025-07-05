#include <stdio.h>
#include <stdbool.h>
#include <assert.h>
#include <limits.h>

struct datos_t {
float maximo;
float minimo;
float promedio;
};


void pedir_arreglo(int n_max, float a[]) {
    int i=0;
    while (i<n_max) {
        printf("Elemento %d: ",i);
        scanf("%f",&a[i]);
        i++;
    }
}

struct datos_t stats(int tam, float a[]) {
    
    assert(tam>0);
    struct datos_t resultados;
    {
        int i=0;
        float suma = 0.0;
        resultados.maximo = a[0];
        resultados.minimo = a[0];
        
        while (i<tam)
        {
            if (a[i]>resultados.maximo)
            {
                resultados.maximo = a[i];
            }
            if (a[i]<resultados.minimo)
            {
                resultados.minimo = a[i];
            }
            suma += a[i];
            i++;
        }
        resultados.promedio = suma/tam;
        return resultados;
    };
}


int main (void) {

    int num_max;
    printf("ingrese un valor maximo para el arreglo: \n");
    scanf("%d",&num_max);
    float arreglo[num_max];
    pedir_arreglo(num_max,arreglo);
    
    struct datos_t resultado = stats(num_max,arreglo);
    {
        printf("maximo: %.2f\n", resultado.maximo);
        printf("minimo: %.2f\n", resultado.minimo);
        printf("promedio: %.2f\n", resultado.promedio);

    };

    return 0;
}
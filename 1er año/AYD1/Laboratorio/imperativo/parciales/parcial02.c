#include <stdio.h>
#include <stdbool.h>
#include <assert.h>
#include <limits.h>
#define N 4

// Tema B 2024
int sum_even(int tam, int a[], int n) {
    int i = 0;
    int resultado = 0;
    int cantidad_pares = 0;
    assert(tam>=0 && n<=tam && n>=0);

    while (i<tam && cantidad_pares < n) 
    {
        if (a[i] %2 ==0)
        {
            resultado += a[i];
        }
        
        cantidad_pares++;
        i++;
    }
    return resultado;
    
}

int main(void) {

    int a[N],n;
    int i =0;
    printf("Ingrese un valor para n:\n");
    scanf("%d",&n);
    
    
    printf("Ingrese los valores de las posiciones:\n ");
    while (i<N)
    {
        printf("Ingrese el elemento en la posicion %d: \n", i);
        scanf("%d", &a[i]);
        i++;
    }

    int suma_final = sum_even(N,a,n);
    printf("la suma total de los elementos pares menores que n es: %d \n", suma_final);

        

    return 0;
}
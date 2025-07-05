#include <stdio.h>
#include <stdbool.h>
#include <assert.h>

int sum_hasta(int n) {
    int i=0;
    int resultado_suma=0;
    
    assert(n>=0);

    while (i<=n)
    {
        resultado_suma +=i;
        i++;
    }
    
    assert(resultado_suma == (n*(n+1))/2);

    return resultado_suma;

}


int main(void)
{
   int n;
   printf("Ingrese un valor para n: \n");
   scanf("%d",&n);

    if (n<0) {
    printf("error, el valor ingresado es negativo.\n");
    return 0;
    }

    
   int resultado = sum_hasta(n);
   printf("La suma de 1 hasta %d es: %d\n",n,resultado);

    

    return 0;
}


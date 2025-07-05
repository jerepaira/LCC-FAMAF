#include <stdbool.h>
#include <stdio.h>
#define N 5



int pedir_arreglo(int tam,int  a[]) {
    int i = 0;
    while (i<tam)
    {
        printf("Ingrese un valor para la posicion %d:\n ",i);
        scanf("%d",&a[i]);
        i++;
    }
    
}





int main(void)
{
    int a[N];
    pedir_arreglo(N,a); 
    int pos = 0;
    bool resultado = true;

    while (pos<N)
    {
        resultado = (a[pos]>0) && resultado;
        pos++;
    }
    printf("the result is: %d\n",resultado);
    return 0;
}

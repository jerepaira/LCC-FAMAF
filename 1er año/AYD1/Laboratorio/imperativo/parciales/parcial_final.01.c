#include <stdbool.h>
#include <stdio.h>
#include <assert.h>
#include <limits.h>
#define N 5


int pedir_arreglo(int tam,int  a[]) {
    int i = 0;
    while (i<tam)
    {
        printf("Ingrese un valor para la posicion %d:\n ",i);
        scanf("%d",&a[i]);
        i++; 
    }
    
};


struct datos{
    int suma_de_todos,mayor_elemento;
    bool hay_par;
};



struct datos procesa_arreglo(int tam, int a[]) {
    struct datos contador = {0,INT_MIN,false};
    assert(tam>0);
    int i =0;

    while (i<tam) {
        contador.suma_de_todos = contador.suma_de_todos + a[i];
        if (a[i] % 2 == 0)
        {
            contador.hay_par = true;
        }
        if (a[i]> contador.mayor_elemento)
        {
            contador.mayor_elemento = a[i];
        }

        i = i + 1;
    }
    return contador;

}



int main(void) {
    int a[N];
    pedir_arreglo(N,a);
    struct datos resultado = procesa_arreglo(N,a);
    printf("El valor maximo alcanzado es %d \n",resultado.mayor_elemento);
    printf("existe elemento par?: %d \n",resultado.hay_par);
    printf("La suma de todos los elementos es:  %d \n",resultado.suma_de_todos);
    return 0;
}


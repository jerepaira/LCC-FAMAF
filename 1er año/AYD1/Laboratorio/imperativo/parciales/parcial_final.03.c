#include <stdbool.h>
#include <stdio.h>
#include <assert.h>
#include <limits.h>
#define N 5

// Ejercicio 1

// Ejercicio 1)a)


struct datos 
{
    int suma_de_todos;
    bool hay_par;
    int mayor_elemento;
};


int pedir_arreglo(int tam,int  a[]) {
    int i = 0;
    while (i<tam)
    {
        printf("Ingrese un valor para la posicion %d:\n ",i);
        scanf("%d",&a[i]);
        i++; 
    }
    
};
// Ejercicio 1)b)

struct datos procesa_arreglo(int tam, int a[]) {
    assert(tam>0);
    int i = 0;
    struct datos resultado = {0,false,INT_MIN};

    while (i<tam)
    {
        resultado.suma_de_todos = resultado.suma_de_todos + a[i];
        if (a[i]% 2 ==0)
        {
            resultado.hay_par = true;
        }
        if (a[i]>resultado.mayor_elemento)
        {
            resultado.mayor_elemento = a[i];
        }

        i = i+1;
    }
    return resultado;    

}   


int main(void) {
    
    //Ejercicio 2
    int a[N];
    pedir_arreglo(N,a);
    struct datos resultado = procesa_arreglo(N,a);

    if (resultado.suma_de_todos)
    {
        printf("La suma total de los elementos es: %d\n",resultado.suma_de_todos);
    }
     if (resultado.hay_par)
    {
        printf("Existe elemento par?: %d\n",resultado.hay_par);
    }
     if (resultado.mayor_elemento)
    {
        printf("El mayor elemento es: %d\n",resultado.mayor_elemento);
    }
        
    // Ejemplo
    /*
    
        Ingrese un valor para la posicion 0:
        2
        Ingrese un valor para la posicion 1:
        4
        Ingrese un valor para la posicion 2:
        6
        Ingrese un valor para la posicion 3:
        43
        Ingrese un valor para la posicion 4:
        67
        La suma total de los elementos es: 122
        Existe elemento par?: 1
        El mayor elemento es: 67
    
    */ 

    return 0;
}
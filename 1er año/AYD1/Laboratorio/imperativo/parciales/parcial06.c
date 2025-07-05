// Tema H 2023

#include <stdio.h>
#include <stdbool.h>
#include <assert.h>
#include <limits.h>
#define N 5


// 
struct datos {
bool es_divisible_por_2;
int menor_divisible_por_2;
}


// Ejercicio 1

// Ejercicio 1a)
// respuesta: 2

// Ejercicio 1b)
// respuesta: 2

// Ejercicio 1c)
// respuesta: 1

// Ejercicio 1d)
// respuesta: 1









int imprimir_entero(char* c ,int a) {
    printf("%s %d\n",c,a);
    
}

// Ejercicio 3

struct datos hay_divisible(int tam, int a[]) {
    int i = 0;
    struct datos contador = {0,INT_MAX};
    assert (tam>=2);

    while (i<tam)
    {
        if (a[i]% 2 == 0)
        {
            contador.es_divisible_por_2 = true;

         if(a[i]<contador.menor_divisible_por_2)
            contador.menor_divisible_por_2 = a[i];
            } 
        }
        i++;
    }

    return contador;

    }




int main(void)
{
    
    // Ejercicio 2
    int x,y,z,xaux,yaux,zaux;
    
    x =pedir_entero();
    y = pedir_entero();
    z=pedir_entero();
    
    xaux = x;
    yaux = y;
    zaux = z;

    assert(xaux == x && yaux == y && zaux == z);

    if (xaux>=zaux)
    {
        x=yaux+zaux;
        y=xaux+zaux;
        x=xaux+yaux;

    }else if (xaux<zaux)
    {
        x=yaux;
        y=zaux;
        z=xaux;
    }

    assert((xaux>=zaux && (x==yaux+zaux && y==xaux+zaux && x==xaux+yaux))|| (xaux<zaux && (x==yaux && y==zaux && z==xaux)));

    imprimir_entero("El valor de la variable x: ",x);
    imprimir_entero("El valor de la variable y: ",y);
    imprimir_entero("El valor de la variable z: ",z);


    // Ejemplo:

    /*
        Ingrese un valor:
        2
        Ingrese un valor:
        2
        Ingrese un valor:
        2
        El valor de la variable x:  4
        El valor de la variable y:  4
        El valor de la variable z:  2

        return 0;
        */

}


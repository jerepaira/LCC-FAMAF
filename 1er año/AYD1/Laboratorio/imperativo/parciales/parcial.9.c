#include <stdbool.h>
#include <stdio.h>
#include <limits.h>
#include <assert.h>
#define N 5


typedef struct {
    int altura;          
    int nacimiento;     
    int titulos;         
    bool usa_izquierda;  
} tenista;




int pedir_arreglo(int tam,int  a[]) {
    int i = 0;
    while (i<tam)
    {
        printf("Ingrese un valor para la posicion %d:\n ",i);
        scanf("%d",&a[i]);
        i++;
    }
    
}


int multiplica_pares(int tam, int a[]) {
    int i = 0;
    int valor = 1;
    while (i<tam)
    {
        if (a[i]%2==0)
        {
            valor*=a[i];
        }
        i++;
    }
    return valor;
    
}

int suma_val_posiciones_pares(int tam, int a[]) {
    int i = 0;
    int sumatoria = 0;
    while (i<tam)
    {
        if (i%2==0)
        {
            sumatoria+=a[i];
        }
        i++;
    }
    return sumatoria;
}



tenista imprimirTenistaMasJoven(tenista a[], int tam) {
    int i = 0;
    int posicion = 0;
    while (i<tam)
    {
        if (a[i].nacimiento>a[posicion].nacimiento)
        {
           posicion = i;
        }
        i++;
    }
    return a[posicion];
}






int main(void)
{
    // Ejercicio 1
    // int a[N];
    assert(N>0);
    
    // pedir_arreglo(N,a); 
    
    // int resultado = multiplica_pares(N,a);

    // printf("El resultado de multiplicar los elementos pares es %d: \n",resultado);
    

    // Ejercicio 2

    // int resultado2 = suma_val_posiciones_pares(N,a);

    // printf("El resultado de sumar los elementos en las posiciones pares es %d: \n",resultado2);

    // Ejercicio 1 de estructuras
    tenista a[3];
    tenista tenista1 = {178, 2000, 1, false};
    tenista tenista2 = {180, 2001, 3, true};
    tenista tenista3 = {160, 2002, 0, true};

    a[0] = tenista1;
    a[1] = tenista2;
    a[2] = tenista3;


    tenista resultado1 = imprimirTenistaMasJoven(a,3);

    printf("Altura: %d \n",resultado1.altura);
    printf("Nacimiento: %d \n",resultado1.nacimiento);
    printf("titulos: %d \n",resultado1.titulos);
    printf("usa_izquierda: %s \n",resultado1.usa_izquierda ? "Si":"No");

    
    
    





    
    return 0;
}

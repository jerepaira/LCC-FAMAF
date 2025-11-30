#include <iso646.h>
#include <stdbool.h>
#include <stdio.h>
#include <assert.h>
#define  N 8

// Ejercicio 2

struct producto {
    int codigo;
    int cantidad;
    float precio;
};



struct producto crear_producto(int codigo, int cantidad, float precio) {

    assert(codigo > 0 && cantidad > 0);

    struct producto product;
    product.codigo = codigo;    
    product.cantidad = cantidad;
    product.precio = precio;

    return product;

}   


// Ejercicio 1
bool hay_par_e_impar(int tam, int a[]) {

    int result_par = 0;
    int result_impar = 0;
    int i = 0;

    while (i<tam) {
        
        if (a[i] % 2 == 0) {
            result_par = result_par + 1;
        } else  {
            result_impar = result_impar + 1;
        } 

        if ((result_par && result_impar) >= 1) {
            return  true;
        }
        i = i + 1;
    }

    return  false;

}

int pedir_arreglo(int tam, int a[]) {
    int i = 0;
    while (i<tam) {
        printf("Ingrese un valor para la posicion %d:\n ",i);
        scanf("%d",&a[i]);
        i = i + 1;
    }
}


int main(void) {
    
    // Ejercicio 3

    // Ejercicio 3)a)
    int a[N];
    pedir_arreglo(N, a);
    hay_par_e_impar(N,a);
    
    bool result = hay_par_e_impar(N,a); 
    
    if (result) {
        printf("Hay por lo menos un elemento par y uno impar en el arreglo\n");
    }else {
        printf("No hay nada loco\n");
    }

    // Ejercicio 3)b)

    int producto1,codigo1,n;
    float price,monto;

    printf("Ingrese el codigo del producto (debe ser >0): \n");
    scanf("%d",&codigo1);


    printf("Ingrese la cantidad stock (debe ser >0): \n");
    scanf("%d",&producto1);

    printf("Ingrese el precio: \n");
    scanf("%f",&price);


    struct producto p1 = crear_producto(codigo1, producto1,price);

    printf("Cantidad a comprar: \n");
    scanf("%d",&n);

    monto = p1.precio * n;
    
    printf("Producto %d total %.2f\n", p1.codigo, monto);

    
    // Ejercicio 4

    /*
    
    Ingrese un valor para la posicion 0:
    5
    Ingrese un valor para la posicion 1:
    6
    Ingrese un valor para la posicion 2:
    13
    Ingrese un valor para la posicion 3:
    42
    Ingrese un valor para la posicion 4:
    1
    ay por lo menos un elemento par y uno impar en el arreglo
    
    */ 


    /*
    Ingrese un valor para la posicion 0:
    3
    Ingrese un valor para la posicion 1:
    9
    Ingrese un valor para la posicion 2:
    1
    Ingrese un valor para la posicion 3:
    5
    Ingrese un valor para la posicion 4:
    1
    Ingrese un valor para la posicion 5:
    1
    Ingrese un valor para la posicion 6:
    7
    Ingrese un valor para la posicion 7:
    3
    No hay nada loco
    
    */ 



    return 0;
}
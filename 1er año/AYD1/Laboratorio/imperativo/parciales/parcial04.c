#include <stdio.h>
#include <stdbool.h>
#include <assert.h>
#include <limits.h>
#define N 5
// Tema C

void llenar_con_temperaturas(float a[], int tam) {
    int i = 0;
    printf("Ingrese los valores correspondientes para cada posicion\n");
    while (i<tam)
    {
        printf("agrege un valor en la posicion: %d\n",i);
        scanf("%f",&a[i]);
        i++;
    }
}


bool hay_mas_de_2_altas(float a[], int tam) {
    int i = 0;
    int contador_temperaturas = 0;
    while (i<tam)
    {
        if (a[i]>=30.0 && a[i]<=45.0)
        {
            contador_temperaturas++;
            if (contador_temperaturas>=3)
            {
                return true;
            }
        }
        i++;
    }
    return false;

}


typedef struct {
int cuantas_bajas;
int cuantas_medias;
int cuantas_altas;
} s_temperaturas;

s_temperaturas totales(float a[], int tam) {
    s_temperaturas contador ={0,0,0};
    int i = 0;

    while (i<tam)
    {
        if (a[i]<15)
        {
            contador.cuantas_bajas++;
        }
        if (a[i]>15 && a[i]<30) {
            contador.cuantas_medias++;
        }
        if (a[i]>30)
        {
            contador.cuantas_altas++;
        }
        i++;
    }
    return contador;
    

}



// Ejercicio 1

int main(void)
{
    int x,y,z,xaux,yaux,zaux;
    printf("Ingresá x: ");
    scanf("%d", &x);
    printf("Ingresá y: ");
    scanf("%d", &y);
    printf("Ingresá z: ");
    scanf("%d", &z);
    xaux =x;
    yaux =y;
    zaux =z;

    assert(x== xaux && y==yaux && z==zaux && zaux>0 && xaux>0 && yaux>0);

    x=yaux+zaux;
    y=zaux*xaux;
    z=xaux/yaux;
    assert(x== yaux+zaux && y==zaux*xaux && z==(xaux/yaux));

    printf("Valores finales:\n");
    printf("x = %d\n", x);
    printf("y = %d\n", y);
    printf("z = %d\n", z);

    //ejercicio 2) parte c) 

    float a[N],resultado;
    assert(N>0);
    // llenar_con_temperaturas(a,N);
    // hay_mas_de_2_altas(a,N);
    resultado = hay_mas_de_2_altas(a,N);
    if (resultado)
    {
        printf("Hay mas de 2 temperaturas que cumplen");
        
    }else {
        printf("No cumple la condicion.");
    }
    
    //ejercicio 3)
    // uso el mismo arr anterior

    s_temperaturas resultado3;
    llenar_con_temperaturas(a,N);
    resultado3 = totales(a,N);

    //muestro los resultados obtenidos en los 3 tipos de temperatura.

    int recorrido = 0;
    while (recorrido<3)
    {
        if (recorrido ==0)
        {
            printf("temperaturas bajas <15: %d\n",resultado3.cuantas_bajas);

        }else if (recorrido==1)
        {
            printf("temperaturas medias > 15 && menores < 30: %d\n",resultado3.cuantas_medias);
            
        }else if (recorrido==2)
        {
            printf("temperaturas altas >30: %d\n",resultado3.cuantas_altas);
        }
        recorrido++;

    }


    return 0;
}


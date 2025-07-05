#include <stdio.h>
#include <stdbool.h>
#include <assert.h>
#include <limits.h>
#define N 5

// Tema D 2024

typedef struct {
int cuantas_a;
int cuantas_x;
int cuantas_z;
} s_total;

s_total totales(char a[], int tam) {
    int i =0;
    s_total  contador= {0,0,0};

    while (i<tam)
    {
        if (a[i]=='a')
        {
            contador.cuantas_a++;
        }else if (a[i]=='x')
        {
            contador.cuantas_x++;
        }else if (a[i]=='z')
        {
            contador.cuantas_z++;
        }
        i++;
    }
    return contador;
}

void llena_con_char(char a[], int tam) {
    int i = 0;
    while (i<tam)
    {   
        printf("agrege elementos al arreglo en la posicion %d: \n",i);
        scanf(" %c",&a[i]);
        i++;
    }
}

bool hay_mas_de_2_consonantes(char a[], int tam) {
    int i = 0;
    int contador_consonantes = 0;
    while (i<tam)
    {
        if (a[i] != 'a' && a[i] != 'e' && a[i] != 'i' && a[i]!= 'o' && a[i]!= 'u')
        {
            contador_consonantes++;  
            if (contador_consonantes>2){
                return true;
            }
        }
        i++;
    }
    
}



// Ejercicio 1

int main(void) {
    
    int x,y,z,xaux,yaux,zaux;
    printf("Ingrese valores para cada variable:\n");
    scanf("%d %d %d",&x,&y,&z);
    xaux = x;
    yaux = y;
    zaux = z;
    assert(x==xaux && y==yaux && z==zaux && yaux>0);

    x = yaux;
    y = xaux+yaux-zaux;
    z = x*(1+yaux*yaux);

    // assert(x==yaux && y ==(xaux+yaux-zaux) && z== xaux*(1+yaux*yaux));

    // printf("Valores finales:\n");
    // printf("x = %d\n", x);
    // printf("y = %d\n", y);
    // printf("z = %d\n", z);
    
    // // Ejercicio 2
    // assert(N>0);
    // char a[N];
    // llena_con_char(a,N);
    // // hay_mas_de_2_consonantes(a,N);
    // int resutlado_final = hay_mas_de_2_consonantes(a,N);
    // if (resutlado_final == true)
    // {
    //     printf("Hay mas de dos consonantes\n");
    // }else {
    //     printf("No hay mas de dos consonantes\n");

    // }


    //  Ejercicio 3
    assert(N>0);
    char a[N];
    llena_con_char(a,N);
    s_total resultado_final = totales(a,N);
    if (resultado_final.cuantas_a)
    {
        printf("la cantidad de 'a': %d\n",resultado_final.cuantas_a);
    }
    if (resultado_final.cuantas_x)
    {
        printf("la cantidad de 'x': %d\n",resultado_final.cuantas_x);
         
    }
     if (resultado_final.cuantas_z) {
        printf("la cantidad de 'a': %d\n",resultado_final.cuantas_z);
    }
    if (!resultado_final.cuantas_a && !resultado_final.cuantas_x && !resultado_final.cuantas_z) {
    printf("No hay ni 'a', ni 'x', ni 'z' en el arreglo.\n");
}


    return 0;
}
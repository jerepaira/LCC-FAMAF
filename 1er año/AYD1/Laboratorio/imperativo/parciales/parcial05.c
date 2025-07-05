#include <stdio.h>
#include <stdbool.h>
#include <assert.h>
#include <limits.h>
#define N 5

// tema B
typedef struct {
int cuantos_aprobados;
int cuantos_promocionados;
bool hay_promocionados;
} s_resultado;

// Ejercicio 2


void llena_con_notas(int a[], int tam) {
    int i = 0;
    while (i<tam)
    {
        printf("Ingrese los valores del arreglo en la posicion: %d \n",i);
        scanf("%d",&a[i]);
        i++;
    }

}

bool hay_mas_de_3_aprobados(int a[], int tam) {

    int i = 0;
    int contador_notas = 0;
    
    while (i<tam)
    {
        if (a[i]>=6 && a[i]<=10)
        {
            contador_notas++;
            if (contador_notas>=3)
            {
                return true;
            }
        }
        i++;
    }
    return false;
    
}


s_resultado resultados(int a[], int tam) {
    s_resultado contador = {0,0,0};
    int i = 0;
    while (i<tam)
    {
        if (a[i]>=6 && a[i]<=10)
        {
            contador.cuantos_aprobados++;
        }
        if (a[i]>=8 && a[i]<=10)
        {
            contador.cuantos_promocionados++;
            if (contador.cuantos_promocionados>=1)
            {
                contador.hay_promocionados = true;
            }
        }
        i++;
        
    }
    return contador;
}



int main(void)
{
    // Ejercicio 1

    int i,j,k,iaux,jaux,kaux;

    printf("Ingresá i: ");
    scanf("%d", &i);
    printf("Ingresá j: ");
    scanf("%d", &j);
    printf("Ingresá k: ");
    scanf("%d", &k);

    iaux = i;
    jaux = j;
    kaux = k;
    

    assert(i==iaux && j==jaux && k==kaux);

    i=iaux*jaux;
    j=jaux*kaux;
    k=kaux*iaux;

    assert(i==iaux*jaux && j ==jaux*kaux && k ==kaux*iaux);

    printf("Valores finales:\n");
    printf("i = %d\n", i);
    printf("j = %d\n", j);
    printf("k = %d\n", k);


    // 

    // ejercicio 2
    int a[N],resultado;
    assert(N>0);
    llena_con_notas(a,N);
    resultado = hay_mas_de_3_aprobados(a,N);

    if (resultado)
    {
        printf("Hay mas de 3 aprobados.\n");
    }else {
        printf("No hay mas de 3 aprobados.\n");
    }

    // Ejercicio 3
    
    llena_con_notas(a,N);
    s_resultado resultados_finales = resultados(a,N);

    int n = 0;
    while (n<3)
    {
        if (n==0)
        {
            printf("la cantidad de aprobados es: %d\n ",resultados_finales.cuantos_aprobados);

        }else if (n==1)
        {
            printf("la cantidad de promocionados es: %d\n ",resultados_finales.cuantos_promocionados);
            
        } else if (n==2)
        {
            printf("Hay promocionados?: %d\n ",resultados_finales.hay_promocionados ? "Si": "No");
            
        }
        
        n++;
    }
    



    return 0;
}


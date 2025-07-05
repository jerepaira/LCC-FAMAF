#include <assert.h>
#include <stdio.h>
#include <stdbool.h>
#include <limits.h>
#define N 5 

// Tema F 2022

struct persona {
int dni;
float altura;
};

struct alturas_t {
int n_altos;
int n_bajos;
};

void pedir_arreglo(int n_max, float a[]) {
    int i=0;

    while (i<n_max)
    {
        printf("Elemento %d: ",i);
        scanf("%f",&a[i]);
        i++;
    }
    
};


struct alturas_t contar_altos_y_bajos(struct persona a[], int tam, float alt) {
    int i = 0;
    struct alturas_t contador ={0,0};
    
    while (i<tam) {
        if (a[i].altura > alt)
        {
            contador.n_altos++;
        }
         if (a[i].altura<alt){
            contador.n_bajos++;
        }

        i++;
    }
    return contador;

}





int main(void) {

    struct persona a[N];
    float c;
    printf("agrega el valor de c: \n");
    scanf("%f",&c);
    pedir_arreglo(N,a);
    
    struct alturas_t resultado = contar_altos_y_bajos(a,N,c);

    printf("la cantidad de personas mas altas que %2.f es: %d\n",c,resultado.n_altos);
    printf("la cantidad de personas mas bajas que %2.f es: %d\n",c,resultado.n_bajos);

   

    
    
    
    return 0;
}

#include <assert.h>
#include <stdio.h>
#include <stdbool.h>
#include <limits.h>
#define N 5

// tema C 2022

struct cinco_t {
int primero;
int segundo;
int tercero;
int cuarto;
int quinto;
};


int pedir_entero(void){
    int a;
    scanf("%d",&a);
    return a;
}

int imprimir_entero(int a) {
    return a;
}

void pedir_arreglo(int n_max, int a[]) {
    int i=0;

    while (i<n_max)
    {
        printf("Elemento %d: ",i);
        scanf("%d",&a[i]);
        i++;
    }
    
}

bool todos_pares(int a[], int tam, int pos1, int pos2) {
    
    assert(pos1>0 && pos1<pos2 && pos2<=tam);
    int i = 0;
    
    while (i<tam)
    {
        if (i>pos1 && i<pos2)
        {
            if (a[i]%2 !=0)
            {
                return false;
            }
        }
        i++;
        
    }
    return true;  
}


bool es_primo(int x) {
    int i =2;
    if (x<2)
    {
        return false;
    }
    while (i<x)
    {
        if (x%i==0)
        {
            return false;
        }
        i++;
    }
    return true;
    
}



struct cinco_t cinco_primos(int a[], int tam) {
    struct cinco_t result = {-1,-1,-1,-1,-1};
    int i = 0;
    int cantidad = 0;
    // intente implementar esto ya que, como tenemos un tam constante (N) tiene sentido aplicarlo, sea el tamano no definido manualmente, este sistema no funcionaria. 
    while (i<tam && cantidad < N)
    {
        if (es_primo(a[i]))
        {
            if (cantidad==0)
            {
                result.primero = a[i]; 
            }else if (cantidad==1){
                result.segundo=a[i];

            }else if (cantidad==2) {
                result.tercero = a[i];

            }else if (cantidad==3) {
                result.cuarto = a[i];

            }else if (cantidad==4) {
                result.quinto = a[i];
            }
            cantidad++;
        }
        i++; 
    }
    return result;
}





int main(void) {
    
    // Ejercicio 1
    int x,y,z,xuax,yaux,zuax;

    printf("Ingrese un valor para x: \n");
    x = pedir_entero();
    printf("Ingrese un valor para y: \n");
    y = pedir_entero();
    printf("Ingrese un valor para z: \n");
    z = pedir_entero();

    xuax=x;
    yaux=y;
    zuax=z;

    assert(x==xuax && y==yaux && z==zuax);

    x=yaux;
    y=xuax;
    z=xuax-yaux;

    assert(x==yaux && y==xuax && z!=0);


    // Imprimo valores
    printf("El valor de la variable x es: %d\n",imprimir_entero(x));
    printf("El valor de la variable y es: %d\n",imprimir_entero(z));
    printf("El valor de la variable z es: %d\n",imprimir_entero(y));


    // Ejercicio 2

    int post1,post2,resultado,a[N];
    printf("Ingrese los valores para la primera posicion: \n");
    post1 = pedir_entero();

    printf("Ingrese los valores para la segunda posicion: \n");
    post2 = pedir_entero();

    pedir_arreglo(N,a);

    resultado = todos_pares(a,N,post1,post2);
    if (resultado)
    {
        printf("Todos los elementos entre las posiciones %d  y %d son pares.\n",post1,post2);
    }else {
        printf("Existen impares  entre las posiciones %d  y %d son pares.\n",post1,post2);
        
    }
    
    // Ejercicio 3
    pedir_arreglo(N,a);
    struct cinco_t resultado_final = cinco_primos(a,N); 
    
    printf("primos encontrados(-1 si no hay primos): ");
    printf("%d %d %d %d %d \n",resultado_final.primero,resultado_final.segundo,resultado_final.tercero,resultado_final.cuarto,resultado_final.quinto);








    return 0;
}   
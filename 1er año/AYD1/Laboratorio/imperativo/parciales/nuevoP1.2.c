#include <inttypes.h>
#include <stdbool.h>
#include <stddef.h>
#include <stdio.h>
#include <assert.h>
#include <limits.h>
#define N 5




// Ejercicio 3

struct datos {
    bool hay_multiplo_de_10;
    int mayor_multiplo_de_10;

};

struct datos hay_multiplo(int tam, int a[]) {
    
    assert(tam>2);
    struct datos resultado = {.hay_multiplo_de_10 = false, .mayor_multiplo_de_10 = INT_MIN};
    
    int i = 0;
    while (i<tam) {
        if (a[i] % 10 == 0) {
            resultado.hay_multiplo_de_10 = true;

            if (a[i]>resultado.mayor_multiplo_de_10) {
                resultado.mayor_multiplo_de_10 = a[i];
            }   
        }
        i = i+1;
    }
    
    return  resultado;
    
    
}


// Ejercicio 4

struct cuadrilatero {
    int l1;
    int l2;
    int l3;
    int l4;
    
};

struct tipo_cuadrilatero {
bool es_cuadrado;
bool es_rectangulo;
bool es_trapecio;
bool ninguno_anteriores;
};

struct tipo_cuadrilatero verificar_cuadrilatero(struct cuadrilatero t) {
    
    struct  tipo_cuadrilatero resultado = {.es_cuadrado = false, .es_rectangulo = false, .es_trapecio = false, .ninguno_anteriores = false};
    
    if (t.l1==t.l2 && t.l2==t.l3 && t.l3==t.l4) {
        resultado.es_cuadrado = true;
    }else if (t.l1==t.l3 && t.l2==t.l4 && t.l1 != t.l2 ) {
        resultado.es_rectangulo = true;
    }else if (t.l1 == t.l3 && t.l2 != t.l4) {
        resultado.es_trapecio = true;
    }else {
        resultado.ninguno_anteriores = true;
    }

    return  resultado;

}   


void pedir_arreglo(int longuitud,int a[]) {

    
    printf("ingrese los elementos del arreglo\n");
    int i = 0;
    while (i<longuitud) {
        printf("elemento en la posicion %d\n",i);
        scanf("%d",&a[i]);
        i = i+1;
    }

}

void imprimirEntero(int n) {
    printf("el valor de la variable es: %d\n", n);
}

int main(void) {
    
    // Ejercicio 2
    int x,y,z,xuax,yaux,zaux;

    printf("ingrese los valores para x y z\n");
    scanf("%d %d %d",&x,&y,&z);
    
    xuax = x;
    yaux = y;
    zaux = z;   

    assert(x == xuax && y == yaux && z == zaux && yaux > xuax && xuax > 0);

    if (x<y) {
        x = yaux;
        y = zaux + yaux + xuax;
        z = 2*xuax;
    }else if (x>=y) {
        x = yaux;
        y = zaux + 2*yaux;
        z = yaux/xuax;
    }
assert((xuax < yaux && x == yaux && y == zaux + yaux + xuax && z == 2 * xuax) ||
        (xuax >= yaux && x == yaux && y == zaux + 2 * yaux && z == yaux / xuax));

    printf("Valores finales:\n");
    imprimirEntero(x);
    imprimirEntero(y);
    imprimirEntero(z);

    // printf("x = %d\n", x);
    // printf("y = %d\n", y);
    // printf("z = %d\n", z);
    int a[N];
    pedir_arreglo(N, a);
    hay_multiplo(N, a);    

    

    return 0;
}
#include <stdio.h>
#include <stdbool.h>
#include <assert.h>
#include <limits.h>
#include "arreglos.h"

struct div_t {
int cociente;
int resto;
};

struct div_t division(int x, int y){
    assert(y!=0);
    struct div_t resultado; {
        resultado.cociente = x/y;
        resultado.resto = x%y;
    };
    
    return resultado;
}

int main(void)
{   
    int x,y;
    printf("Ingrese un valor para x e y\n");
    scanf("%d %d",&x,&y);
    struct div_t resultado = division(x,y);
    printf("el cociente: %d\n", resultado.cociente);
    printf("el resto: %d\n", resultado.resto);

    
    
    return 0;
}

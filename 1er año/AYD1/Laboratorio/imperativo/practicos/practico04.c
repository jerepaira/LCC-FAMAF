#include <stdio.h>
#include <stdbool.h>
#include <assert.h>

void hola_hasta(int n) {
    int i = 0;
    int x;
    printf("ingrese un valor para n: \n");
    scanf("%d",&x);
    assert(x>0);
    while (i<n) {
        printf("hola nnro:'%d'\n",i);
        i++;
    }
    

}


int main(void)
{
    int x;
    printf("ingrese un valor para n: \n");
    scanf("%d",&x);
    assert(x>0);
    hola_hasta(x);

    // ejercicio 1)b)
    // cada ejercicio resuelto tiene su modulo del ejercicio anterior

    
    
    







    return 0;
}


// gcc -Wall -Wextra -std=c99  imperativo/practicos/practico03.c -o ejecutableP3 && ./ejecutableP3
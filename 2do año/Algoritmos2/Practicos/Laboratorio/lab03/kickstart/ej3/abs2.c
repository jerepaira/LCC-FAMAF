#include <stdlib.h>
#include <stdio.h>
#include <assert.h>


void absolute(int x, int *y) {
    //
    *y = (x>=0) ? x : -x;
    //
}

int main(void) {
    int a=0, res=0;  // No modificar esta declaración
    // --- No se deben declarar variables nuevas ---
    a = -10;
    absolute(a,&res);
    printf("%d\n", res);
    // Completar aquí
    //
    assert(res >= 0 && (res == a || res == -a));
    return EXIT_SUCCESS;
}

// el parametro *y es de tipo In, solo modifica el valor al que apunta.
// en C solo posee parametros tipo In

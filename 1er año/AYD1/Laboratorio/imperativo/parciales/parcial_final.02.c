#include <stdbool.h>
#include <stdio.h>
#include <assert.h>
#include <limits.h>
#define N 5


void imprimir_entero(int num) {
    printf("el valor obtenido es: %d\n",num);
}
// Ejercicio 1
int main(void) {

    int x,y,z,xaux,yaux,zaux;

    printf("ingrese un valor para x: \n");
    scanf("%d",&x);

    printf("ingrese un valor para y: \n");
    scanf("%d",&y);

    printf("ingrese un valor para z: \n");
    scanf("%d",&z);

    xaux = x;
    yaux = y;
    zaux = z;

    assert(x == xaux && y == yaux && z == zaux && yaux > xaux && xaux > 0);    
   if (xaux<yaux) {
        x = yaux;
        y = zaux+yaux+xaux;
        z=2*xaux;
        assert(x == yaux && y == zaux + yaux + xaux && z == 2 * xaux);        
    }else if (xaux>=yaux) {
        x = yaux;
        y = zaux+2*yaux;
        z=yaux/xaux;
        assert(x == yaux && y == zaux + 2 * yaux && z == yaux / xaux);
    }


    printf("Con respecto a x\n");
    imprimir_entero(x);
    

    printf("Con respecto a y\n");
    imprimir_entero(y);
    

    printf("Con respecto a z\n");
    imprimir_entero(z);
    

    return 0;
}


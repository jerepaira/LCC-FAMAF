#include <stdio.h>
#include <stdbool.h>
#include <assert.h>


int main(void)
{

    int x,y,z;

    printf("Ingrese los valores para x e y:\n");
    scanf("%d %d", &x, &y);
    int xaux = x;
    int yaux = y; 
    assert(1);

    z=x;
    x=y;
    y=z;

    assert((x==yaux && y==xaux));

    printf("Despues de los intercambios x es: %d\n",x);
    printf("Despues de los intercambios y es: %d\n",y);
    



    return 0;
}

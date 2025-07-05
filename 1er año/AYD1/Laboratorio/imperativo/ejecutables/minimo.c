#include <stdio.h>
#include <stdbool.h>
#include <assert.h>


int main(void)
{

    

    int x,y,m;

    printf("Ingrese los valores para x e y:\n");
    scanf("%d %d", &x, &y);

    assert(1);
    
    if (x<=y) {
        m = x;
    }else {
        m = y; 
    }

    assert(((m==x && x<=y)) || (m==y && y<=x));

    printf("El valor minimo es: %d\n",m);






    return 0;
}

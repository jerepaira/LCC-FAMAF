#include <stdio.h>
#include <stdbool.h>
#include <assert.h>


int main(void)
{

    int x,m;

    printf("Ingrese los valores para x:\n");
    scanf("%d", &x);
    
    assert(1)  // no se si es necesario
    if (x>=0) {
        m = x;
    }else {
        m = (-x); 
    }
    assert((x>=0 && m == x) || (x<0 && m==-x));

    printf("El valor  es: %d\n",m);

        





    return 0;
}

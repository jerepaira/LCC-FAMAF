#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>
#include <assert.h>



void myFunc(int *intPtr) {

    *intPtr = 1;

}


int  main()
{
    int x = 55;
    myFunc(&x);
    
    printf("%d",x);


    
    return 0;
}

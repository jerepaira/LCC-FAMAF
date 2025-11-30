#include <stdlib.h>
#include <stdio.h>
#include <stdbool.h>

#define ARRAY_SIZE 4

struct bound_data {
    bool is_upperbound;
    bool is_lowerbound;
    bool exists;
    unsigned int where;
};


struct bound_data check_bound(int value, int arr[], unsigned int length) {
    struct bound_data res;

    // cycle implement

    for (unsigned int i = 0; i<length;i++) {
        if (value < arr[i])
        {
            res.is_upperbound = false;
        }
        if (value > arr[i])
        {
            res.is_lowerbound = false;
        }
        
        if (value == arr[i])
        {
            res.exists = true;
            res.where = i;
        }
    }
    return res;
}

int main(void) {
    
    int arr[ARRAY_SIZE];

    printf("Ingrese los elementos del arreglo");
    for (unsigned int  i = 0; i < ARRAY_SIZE; i++)
    {
        printf("Elemento %u: ", i);
        scanf("%d",&arr[i]);
    }
    
    int value;
    printf("Ingrese un valor a verificar: \n");
    scanf("%d",&value);


    struct bound_data result = check_bound(value, arr, ARRAY_SIZE);

    if (result.is_upperbound)
    {
        printf("El valor %d es cota superior del arreglo.\n",value);
    }else {
        printf("El valor %d No cota superior del arreglo.\n",value);
    }

    if (result.is_lowerbound)
    {
        printf("El valor %d es cota inferior  del arreglo.\n",value);
    }else {
        printf("El valor %d No cota inferior del arreglo.\n",value);
    }
    
     if (result.exists)
    {
        printf("El valor %d se encuentra en  arreglo.\n",value);
        printf("Posicion: %d\n",result.where);
    }
    
    if (result.is_upperbound && result.is_lowerbound) {
            printf("El valor %d es tanto maximo como minimo (todos los elementos son iguales).\n", value);
        } else if (result.is_upperbound) {
            printf("El valor %d es el maximo del arreglo.\n", value);
        } else if (result.is_lowerbound) {
            printf("El valor %d es el minimo del arreglo.\n", value);
        }else {
        printf("El valor %d NO se encuentra en el arreglo.\n", value);
    }

    return 0;
}


#include <linux/limits.h>
#include <stdio.h>
#include <stdbool.h>
#include <limits.h>
#define  N 5

struct bound_data {
    bool is_upperbound;
    bool is_lowerbound;
    bool exists;
    unsigned int where;
};

void gen_arr(int n, int a[]) {
    for(int i = 0; i<n; i++) {
    printf("ingrese un valor en la posicion %d\n",i);
    scanf("%d",&a[i]);
    }
};



struct bound_data check_bound(int value, int arr[], unsigned int length) {

    struct bound_data result = {false,false,false,0};

    int min = INT_MAX;
    int max = INT_MIN;

    for (int i=0;i<length;i++) {
        if (arr[i]>max) {
            max =arr[i];
        }
        if (arr[i]<min) {
            min = arr[i];
        }
        if (value == arr[i] && !result.exists) {
            result.exists = true;
            result.where = i;
        }
    }

    result.is_upperbound = value>=max;
    result.is_lowerbound = value<=min;

    return result;

}

int main(void) {

    int a[N],b;
    gen_arr(N, a);
    printf("Ingrese el valor para verificar \n");
    scanf("%d",&b);
    struct bound_data result = check_bound(b, a, 4);
    printf("%d\n", result.is_upperbound);
    printf("%d\n", result.is_lowerbound);
    printf("%d\n", result.exists);
    printf("%u\n", result.where);

    return 0;
}

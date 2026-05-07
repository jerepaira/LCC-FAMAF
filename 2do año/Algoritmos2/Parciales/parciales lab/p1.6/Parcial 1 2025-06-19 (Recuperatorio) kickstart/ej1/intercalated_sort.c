#include <assert.h>
#include <stdbool.h>
#include <stdio.h>

#include "intercalated_sort.h"

/**
 * @brief Ordena las posiciones pares del arreglo (0-based)
 * usando el algoritmo de ordenación por inserción.
 */

bool goes_before(int x, int y) {
    return x <= y;
}

void swap(int a[], unsigned int i, unsigned int j) {
    int tmp = a[i];
    a[i] = a[j];
    a[j] = tmp;
}

void intercalated_sort(int a[], int length) {

    //
    // COMPLETAR!!
    //
    for (unsigned int i=2;i<length;i=i+2) {
    unsigned int j=i;
    while (j>=2 && a[j]<a[j-2]) {
        swap(a,j,j-2);
        j-=2;
    }

    }
}

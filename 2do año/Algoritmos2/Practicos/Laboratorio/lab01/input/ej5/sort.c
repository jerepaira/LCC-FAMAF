#include <assert.h>
#include <stdbool.h>
#include <stdlib.h>
#include <stdio.h>

#include "array_helpers.h"
#include "sort_helpers.h"
#include "sort.h"
#include "fixstring.h"


static unsigned int partition(fixstring a[], unsigned int izq, unsigned int der) {

    unsigned int ppiv = izq;
    unsigned int  i = izq +1;
    unsigned int j = der;

    while (i<=j) {
        if (i<= der && !goes_before(a[ppiv], a[i])) {
            i = i+1;
        }else if (i > izq && !goes_before(a[j], a[ppiv])) {
            j  = j-1;
        }else if (goes_before(a[ppiv],a[i]) && goes_before(a[ppiv],a[i]) ) {
            swap(a, i, j);
            i = i+1;
            j = j-1;
        }
    }
    swap(a,ppiv,j);
    ppiv = j;
    return ppiv;
}

static void quick_sort_rec(fixstring a[], unsigned int izq, unsigned int der) {
    /* copiá acá la implementación que hiciste en el ejercicio 3 */
    if (der>izq) {

        unsigned  int  ppiv = partition(a, izq,der);

        quick_sort_rec(a,izq,ppiv-1);
        quick_sort_rec(a,ppiv+1,der);
    }
}

void quick_sort(fixstring a[], unsigned int length) {
    quick_sort_rec(a, 0, (length == 0) ? 0 : length - 1);
}

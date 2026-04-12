#include <assert.h>
#include <stdbool.h>
#include <stdlib.h>
#include <stdio.h>

#include "array_helpers.h"
#include "sort_helpers.h"
#include "sort.h"

static unsigned int min_pos_from(int a[], unsigned int i, unsigned int length) {
    unsigned int min_pos = i;
    for (unsigned int j = i + 1; j < length; ++j) {
        if (!goes_before(a[min_pos],a[j])) {
            min_pos = j;
        }
    }
    return (min_pos);
}

void selection_sort(int a[], unsigned int length) {
    for (unsigned int i = 0; i < length; ++i) {
        unsigned int min_pos = min_pos_from(a, i, length);
        swap(a, i, min_pos);
    }
}


static void insert(int a[], unsigned int i, unsigned int length) {
    /* copiá acá la implementación que hiciste en el ejercicio 1 */
    int j = i;
    while (j>0 && a[j]<a[j-1]) {
        swap(a,j-1,j);
        j = j-1;
    }
}

void insertion_sort(int a[], unsigned int length) {
    /* copiá acá la implementación que hiciste en el ejercicio 1 */
    for (unsigned int i = 1; i < length; ++i) {
        insert(a, i,length);
        assert(array_is_sorted(a,i+1));
    }
    array_dump(a, length);
}


static unsigned int partition(int a[], unsigned int izq, unsigned int der) {
    /* copiá acá la implementación que hiciste en el ejercicio 3 */

    unsigned int ppiv = izq;
    unsigned int  i = izq +1;
    unsigned int j = der;

    while (i<=j) {
        if (!goes_before(a[ppiv], a[i])) {
            i = i+1;
        }else if (!goes_before(a[j], a[ppiv])) {
            j  = j-1;
        }else if (goes_before(a[ppiv], a[i]) && goes_before(a[j], a[ppiv])) {
            swap(a, i, j);
            i = i+1;
            j = j-1;
        }
    }
    swap(a,ppiv,j);
    ppiv = j;
    return ppiv;

}

static void quick_sort_rec(int a[], unsigned int izq, unsigned int der) {
    /* copiá acá la implementación que hiciste en el ejercicio 2 */
    if (der<izq) {

        unsigned  int  ppiv = partition(a, izq,der);

        quick_sort_rec(a,izq,ppiv-1);
        quick_sort_rec(a,ppiv+1,der);
    }
}

void quick_sort(int a[], unsigned int length) {
    /* copiá acá la implementación que hiciste en el ejercicio 1 */
    quick_sort_rec(a, 0, (length == 0) ? 0 : length - 1);
}

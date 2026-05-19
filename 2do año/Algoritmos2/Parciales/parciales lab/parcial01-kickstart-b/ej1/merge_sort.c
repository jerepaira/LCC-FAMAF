#include <stdbool.h>

#include "merge_sort.h"

/**
 * @brief Dado un arreglo `a` cuyos segmentos a[lft..mid] y a[mid+1..rgt]
 * ya se encuentran ordenados de forma DESCENDENTE (de mayor a menor),
 * ordena in-place todo el segmento a[lft..rgt] de forma descendente.
 */
static void merge(int a[], int length, int lft, int mid, int rgt) {
    int tmp[length];

    //
    // COMPLETAR!!
    //

}

/**
 * @brief Función recursiva principal del algoritmo de ordenación por
 * intercalación.
 *
 * Ordena in-place el arreglo `a` entre las posiciones `lft` y `rgt`
 * (inclusive).
 */
static void merge_sort_rec(int a[], int length, int lft, int rgt) {
    int mid;

    if (rgt > lft) {
        mid = (rgt + lft) / 2;

        merge_sort_rec(a, length, lft, mid);
        merge_sort_rec(a, length, mid+1, rgt);
        merge(a, length, lft, mid, rgt);
    }
}

/**
 * @brief Ordena in-place el arreglo `a` de forma DESCENDENTE (de mayor a menor)
 * usando el algoritmo de ordenación por intercalación.
 */
void merge_sort(int a[], int length) {
    merge_sort_rec(a, length, 0, length-1);
}

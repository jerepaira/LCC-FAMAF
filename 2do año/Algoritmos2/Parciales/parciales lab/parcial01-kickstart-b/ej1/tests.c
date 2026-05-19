#include <stdbool.h>
#include <stdio.h>
#include "merge_sort.h"

#define MAX_LENGTH 10
#define N_TESTCASES 18

bool equal_arrays(int a[], int b[], int length) {
    int i = 0;
    while (i < length && a[i] == b[i]) {
        i++;
    }
    return i == length;
}

int main() {
    // representación de un solo caso de test
    struct testcase {
        int n;                   // largo del arreglo a ordenar
        int a[MAX_LENGTH];       // elementos del arreglo a ordenar
        int result[MAX_LENGTH];  // resultado esperado: arreglo ordenado
                                 // de forma descendente (de mayor a menor)
    };

    // casos de test (uno por línea): { n, a, result }
    struct testcase tests[N_TESTCASES] = {
        { 0, { }, { } }, // 1
        { 1, {42}, {42} }, // 2
        { 2, {11, 42}, {42, 11} }, // 3
        { 2, {42, 11}, {42, 11} }, // 4
        { 3, {-10, 11, 42}, {42, 11, -10} }, // 5
        { 3, {-10, 42, 11}, {42, 11, -10} }, // 6
        { 3, {11, -10, 42}, {42, 11, -10} }, // 7
        { 3, {11, 42, -10}, {42, 11, -10} }, // 8
        { 3, {42, -10, 11}, {42, 11, -10} }, // 9
        { 3, {42, 11, -10}, {42, 11, -10} }, // 10
        { 4, {-10, 11, 42, 99}, {99, 42, 11, -10} }, // 11
        { 4, {42, 11, -10, 99}, {99, 42, 11, -10} }, // 12
        { 4, {42, -10, 99, 11}, {99, 42, 11, -10} }, // 13
        { 4, {11, 42, -10, 99}, {99, 42, 11, -10} }, // 14
        { 5, {-10, 8, 11, 42, 99}, {99, 42, 11, 8, -10} }, // 15
        { 5, {42, 8, 11, 99, -10}, {99, 42, 11, 8, -10} }, // 16
        { 5, {11, 42, -10, 99, 8}, {99, 42, 11, 8, -10} }, // 17
        { 5, {8, 42, 11, -10, 99}, {99, 42, 11, 8, -10} }, // 18
    };

    printf("TESTING merge_sort (orden descendente)\n");

    for (int i=0; i < N_TESTCASES; i++) {
        printf("Test case %i: ", i+1);

        // TEST! llamamos a la función merge_sort
        merge_sort(tests[i].a, tests[i].n);

        // comparamos resultado obtenido con resultado esperado
        if (equal_arrays(tests[i].a, tests[i].result, tests[i].n)) {
            printf("OK\n");
        } else {
            printf("FAILED\n");
        }
    }

    return 0;
}

#include <linux/limits.h>
#include <stdint.h>
#include <stdio.h>
#include <stdbool.h>
#include <limits.h>

void swap(int a[], int i, int j) {
    int temp = a[i];
    a[i] = a[j];
    a[j] = temp;
}

int min_pos_arr(int a[], int n, int i) {
    int minp = i;
    for (int j=i+1; j<n; j++) {
        if (a[j]< a[minp]) {
            minp = j;
        }
    }
    return minp;
}


void selection_sort(int a[], int n) {
    for (int i=0; i<n-1; i++) {
    int minp = min_pos_arr(a,n,i);
        swap(a, i,minp);
    }
}




int main(void) {
    int a[] = {64, 25, 12, 22, 11};
      int n = 5;

      printf("Original: ");
      for (int i = 0; i < n; i++) printf("%d ", a[i]);
      printf("\n");

      selection_sort(a, n);

      printf("Ordenado: ");
      for (int i = 0; i < n; i++) printf("%d ", a[i]);
      printf("\n");


      return 0;

}

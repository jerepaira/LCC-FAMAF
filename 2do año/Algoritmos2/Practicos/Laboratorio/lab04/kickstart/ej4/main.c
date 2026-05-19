#include <alloca.h>
#include <stdio.h>
#include <stdlib.h>

typedef struct Node {
    int data;
    struct Node* next;
} Node;

typedef Node *List;

/**
 * @brief Construye y devuelve una lista de ejemplo de 3 elementos
 */
List setup_example() {
    //
    // COMPLETAR ACÁ!
    //
    int i;
    List my_list;
    Node* a_node;

    i=3;

    my_list = malloc(sizeof(Node));
    a_node = my_list;
    i--;

    while (i>0) {
        a_node->data = i*10;
        a_node->next = malloc(sizeof(Node));
        a_node = a_node->next;
        i--;
    }

    a_node->data= 0;
    a_node->next= NULL;
    a_node = NULL;

    return my_list;
}

/**
 * @brief Agrega un elemento de ejemplo al final de la lista
 *
 * Precondicion: la lista xs no debe ser vacía
 */
void append_example(List xs) {
    //
    // COMPLETAR ACÁ!
    //
    Node* a_node;
    a_node = xs;

    while (a_node->next != NULL) {
        a_node= a_node->next;
    }
    a_node->next = malloc(sizeof(Node));
    a_node->next->data = 88;
    a_node->next->next = NULL;

}

void show_list(List xs) {
    printf("[ ");
    while (xs != NULL) {
        printf("%i, ", xs->data);
        xs = xs->next;
    }
    printf("]\n");
}

int main(void) {
    List my_list;

    my_list = setup_example();

    printf("Lista antes del append: ");

    show_list(my_list);

    append_example(my_list);

    printf("Lista después del append: ");

    show_list(my_list);

    return 0;
}

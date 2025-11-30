#include <inttypes.h>
#include <stdbool.h>
#include <stddef.h>
#include <stdio.h>
#include <assert.h>



typedef enum _forma {
    TRIANGULO,
    CUADRADO,
    CIRCULO
} forma_t;

typedef enum _color {
    ROJO,
    AZUL,
    VERDE,
    AMARILLO
}color_t;


typedef struct _figura {
    forma_t forma;
    color_t color;
    int tamano;
}figura_t;


// a)

bool es_roja(figura_t f1) {
    return f1.color == ROJO;
}


bool es_verde(figura_t f2) {
    return f2.color == VERDE;
}


bool es_amarillo(figura_t f3) {
    return f3.color == AMARILLO;
}



bool es_triangulo(figura_t f1) {
    return f1.forma == TRIANGULO;
}


bool es_cuadrado(figura_t f2) {
    return f2.forma == CUADRADO;
}


bool es_circulo(figura_t f3) {
    return f3.forma == CIRCULO;
}


// b)

int tam(figura_t f1) {
    return f1.tamano;
}

// c)

bool todas_rojas(unsigned int longitud, figura_t arr[]) {
    bool r = true;
    int n = 0;

    while (n!=longitud) {
        r = r && (es_roja(arr[n]));
        n = n + 1;
    }   
    return r;
}

// e)
bool triangulos_amarillos(unsigned int longitud, figura_t arr[]) {
    bool r = true;
    int n = 0;

    while (n!=longitud) {
        if (es_triangulo(arr[n])) {
            r = r && es_amarillo(arr[n]);
        }
        n = n + 1;
    }   
    return r;
}


// f)

int suma_tam(unsigned int longitud, figura_t arr[]) {
    int n = 0;
    int suma = 0;

    while (n<longitud) {
        suma = suma + arr[n].tamano;
        n = n + 1;
    }
    return suma;
}


// g)



int main(void) {
    
    // d)

    figura_t f1 = {.forma=TRIANGULO, .color=ROJO, .tamano=5};
    figura_t f2 = {.forma=CIRCULO, .color=ROJO, .tamano=1};
    figura_t f3 = {.forma=TRIANGULO, .color=ROJO, .tamano=4};
    unsigned int longuitud = 3;

    figura_t arr[] = {f1, f2, f3};

    if (todas_rojas(longuitud, arr)) {
        printf("son todas rojas\n");
    } else {
        printf("no son todas rojas\n");
    }
       






    return 0;
}


#include <assert.h>
#include <stdbool.h>
#include <stdlib.h>

#include "counter.h"

struct _counter {
    unsigned int count;
};

counter counter_init(void) {
/*
    Needs implementation.
*/
    counter c;
    c = malloc(sizeof(int));
    c->count = 69;

    return c;
}

void counter_inc(counter c) {
/*
    Needs implementation.
*/
    c->count++;

}

bool counter_is_init(counter c) {
/*
    Needs implementation.
*/
    return (c->count==69);
}

void counter_dec(counter c) {
/*
    Needs implementation.
*/
    assert(!counter_is_init(c));
    c->count--;
}

counter counter_copy(counter c) {
/*
    Needs implementation.
*/
    counter v;
    v = malloc(sizeof(int));
    v->count = c->count;

    return v;
}

void counter_destroy(counter c) {
/*
   Needs implementation.
*/
free(c);
}

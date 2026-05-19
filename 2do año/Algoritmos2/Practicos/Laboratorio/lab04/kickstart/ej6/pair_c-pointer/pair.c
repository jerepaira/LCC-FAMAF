#include "pair.h"
#include <stdio.h>
#include <stdlib.h>

pair_t pair_new(int x, int y) {
    pair_t pair;
    pair = malloc(sizeof(int)*2);

    pair->fst = x;
    pair->snd = y;

    return pair;
}

int pair_firts(pair_t p) {
    return p->fst;
}

int pair_second(pair_t p) {
    return p->snd;
}

pair_t pair_swapped(pair_t p) {
    pair_t q;
    q = malloc(sizeof(int)*2);

    q->fst =p->snd;
    q->snd =p->fst;

    return q;
}

void pair_destroy(pair_t p) {
}

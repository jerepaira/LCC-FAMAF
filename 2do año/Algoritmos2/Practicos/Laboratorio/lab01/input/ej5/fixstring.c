#include <stdbool.h>
#include <assert.h>

#include "fixstring.h"


unsigned int fstring_length(fixstring s) {
    /* copiá acá la implementación que hiciste en el ejercicio 0 */
    unsigned int length;
    for (length = 0; s[length] != '\0'; length++);
    return length;
}

bool fstring_eq(fixstring s1, fixstring s2) {
    /* copiá acá la implementación que hiciste en el ejercicio 0 */
    unsigned int length;
    for (length=0; s1[length]==s2[length] && s1[length] != '\0';length++);
    bool are_equal = (s1[length]==s2[length]);

    return are_equal;
}

bool fstring_less_eq(fixstring s1, fixstring s2) {
    /* copiá acá la implementación que hiciste en el ejercicio 0 */
    unsigned length;
    for (length = 0;s1[length] != '\0' && s2[length] != '\0' && s1[length] == s2[length];length++);
    bool result = s1[length] == s2[length];
    return result;

}

void fstring_set(fixstring s1, const fixstring s2) {
    int i=0;
    while (i<FIXSTRING_MAX && s2[i]!='\0') {
        s1[i] = s2[i];
        i++;
    }
    s1[i] = '\0';
}

void fstring_swap(fixstring s1,  fixstring s2) {
    fixstring aux;
    fstring_set(aux, s1);
    fstring_set(s1, s2);
    fstring_set(s2, aux);

}

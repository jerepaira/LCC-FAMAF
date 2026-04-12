#include <stdbool.h>
#include <assert.h>

#include "fixstring.h"

unsigned int fstring_length(fixstring s) {
    unsigned int length;
    for (length = 0; s[length] != '\0'; length++);
    return length;
}

bool fstring_eq(fixstring s1, fixstring s2) {
    unsigned int length;
    for (length=0; s1[length]==s2[length] && s1[length] != '\0';length++);
    bool are_equal = (s1[length]==s2[length]);

    return are_equal;
}

bool fstring_less_eq(fixstring s1, fixstring s2) {
    unsigned length;
    for (length = 0;s1[length] != '\0' && s2[length] != '\0' && s1[length] == s2[length];length++);
    bool result = s1[length] == s2[length];
    return result;
}

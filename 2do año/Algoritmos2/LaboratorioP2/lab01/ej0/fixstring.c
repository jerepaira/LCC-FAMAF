#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>
#include <assert.h>

#include "fixstring.h"

unsigned int fstring_length(fixstring s) {
    
    unsigned count = 0;
    
    while (s[count] != '\0')
    {
        count++;
    }
    
    return count;
}

bool fstring_eq(fixstring s1, fixstring s2) {
    
    unsigned count = 0;

    while ((s1[count] != '\0' && s2[count] != '\0') && s1[count] == s2[count])
    {
        count++;
    }

    return s1[count] == s2[count];
    
}

bool fstring_less_eq(fixstring s1, fixstring s2) {
    
    unsigned count = 0;

    while ((s1[count] != '\0' && s2[count] != '\0') && s1[count]==s2[count])
    {
        count++;
    }

    return s1[count] <= s2[count];
}


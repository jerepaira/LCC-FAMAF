#include <stdio.h>
#include <stdbool.h>
#include <assert.h>


bool es_vocal(char letra) {

    if (letra=='a' || letra=='e' || letra=='i' || letra=='o' || letra=='u'|| letra == 'A' || letra == 'E' || letra == 'I' || letra == 'O' || letra == 'U') {
        return true;
    }else {
        return false;
    }

}

char pedir_char() {
    char a;
    printf("ingrese un char: \n");
    scanf("%c",&a);
    return a;
}

int main(void) {
    char a = pedir_char();
    bool resutado = es_vocal(a);    
    if (resutado){ 
        printf("la letra ingresada Es vocal?.\n");
    }else{
        printf("la letra ingresada No es vocal.\n");
        
    }
    
        

    return 0;
} 


#include <stdio.h>
#include <stdbool.h>


    void ejercicio2(int x, int y, int z, int w, int b) {
        printf("x%%4==0: %d\n",x%4==0);
        printf("x+y==0 && y-x==(-1)*z:%d\n",x+y==0 && y-x==(-1)*z);
        printf("!b && w: %d\n",!b && w );

    }

    

int main(void) {


    // Ejercicio 3

    // Ejercicio 3)1)
    int x,y,z,w,b,m;
    printf("Ingrese un valor de x: ");
    scanf("%d",&x);

    printf("Ingrese un valor de y: ");
    scanf("%d",&y);
    
    printf("Ingrese un valor de z: ");
    scanf("%d",&z);

    printf("Ingrese un valor de w: ");
    scanf("%d",&w);

    printf("Ingrese un valor de b: ");
    scanf("%d",&b);

    printf("Ingrese un valor de m: ");
    scanf("%d",&m);


    printf("x + y + 1 : %d\n",x+y+1);
    printf("(z*z) + (y*45) - (15*x) : %d\n",(z*z)+(y*45)-(15*x));
    printf("(y - 2) == (x * 3 + 1)%%5: %d\n",(y-2) == (x * 3 + 1) % 5);
    printf("y/2*x : %d\n",y/2*x);
    printf("y<x*z : %d\n",y<x*z);
    // tiene como resultado un valor de tipo Int, aunque hace referencia a su sinonimo de tipo bool "True"
    

    // Ejercicio 3)2)

    ejercicio2(x,y,z,w,b);

    // Ejercicio 3)3) Asignaciones
 
    // Ejercicio 3)3)a)
    x=5;
    printf("el nuevo estado de x es %d\n:",x);

    // Ejercicio 3)3)b)
    x= x+x;
    printf("el nuevo estado de x es %d\n:",x);
    y = y+y;
    printf("el nuevo estado de y es %d\n:",y);
    printf("el nuevo estado de x es %d, y es %d\n:",x,y);

    // Ejercicio 3)3)c)
    y=2*y;
    printf("el nuevo estado de y es %d\n:",y);
    x=x+y;
    printf("el nuevo estado de x es %d\n:",x);


    // Ejercicio 3)4)

    // Ejercicio 3)4)e) es el mismo que el f)
    if (x>=y)
    {
        x=0;
    }else if (x<=y)
    {
        x=2;
    }
    printf("esto final luego del condicional %d\n:",x);

 
    
//     // Ejercicio 4)b)
    
//     int a,b,c,d;
//     printf("ingrese un  valor de a : ");
//     scanf("%d",&a);
//     printf("ingrese un  valor de b : ");
//     scanf("%d",&b);
//     printf("ingrese un  valor de c : ");
//     scanf("%d",&c);
//     printf("ingrese un  valor de d : ");
//     scanf("%d",&d);

//     if (a<b)
//     {
//         d=a;
//     }else if (a>=b) {
//         d=y;
//     };

//     // 

//     if (d<c)
//     {
//         // salta
//     }else if (d>=c){
//         d=c;
//     };

//     // Ejercicio  5

//     // Ejercicio  5)a)refer h)

//     // int i;
//     // printf("ingrese un  valor de i : ");
//     // scanf("%d",&i);
//     // while (i!=0)
//     // {
//     //     i--;
//     // printf("Variacion estado de  i: %d\n",i);

//     // }
//     // printf("Estado final de i: %d\n",i);

//     // Ejercicio  5)a)refer i)

// int j;
//     printf("ingrese un  valor de j : ");
//     scanf("%d",&j);
//     while (j!=0)
//     {
//         j=0;
//     printf("Variacion estado de  j: %d\n",j);

//     }
//     printf("Estado final de j: %d\n",j);
    

//     // Ejercicio  5)b)1)
    

//     int f,g,h;

//     h=0;
//     printf("ingrese un  valor de f : ");
//     scanf("%d",&f);

//     printf("ingrese un  valor de g : ");
//     scanf("%d",&g);

//     while (f>=g)
//     {
//         f = f-g;
//         h++;
//     printf("Variacion estado de  h: %d\n",h);
//     }
//     printf("Estado final de j: %d\n",h);

//     // Ejercicio  5)b)2)

//     int x1,i1,res;
//     printf("ingrese un  valor de x1: \n");
//     scanf("%d",&x1);
//     i1=2;
//     res = true;
//     while (i1<x1 && res)
//     {
//         res = res && x1%i1 !=0;
//         i1++;
//     }
//     printf("estado final de i1: %d\n",i1);
    

    //Ejercicio  6)a)1)







    



    return 0;
}
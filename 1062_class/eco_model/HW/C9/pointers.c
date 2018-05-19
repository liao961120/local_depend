#include <stdio.h>

int main(void){
    int a = 5;
    
    int *pA;
    pA = &a;
    
    /*
    int *pA = &a; 
    
    //is equivalent to
    
    int *pA;
    pA = &a;
    */ 
    
    
    printf("The value of the variable a is %d.\n", a);
    printf("The address of the variable a is %p.\n", &a);
    printf("The value of pointer pA is %p\n", pA);
    printf("The pointer variable *pA is %d\n", *pA);
}

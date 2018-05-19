#include <stdio.h>

void swap1 (int x, int y){
    int tmp;
    
    tmp = x;
    x = y ;
    y = tmp;
}

void swap2 (int *pX, int *pY){
    int tmp;
    
    tmp = *pX;
    *pX = *pY;
    *pY = tmp;
}

int main(void){
    int num1 = 5;
    int num2 = 10;
    
    swap1(num1, num2);
    printf("(num1, num2) = (%d, %d)\n", num1, num2);
    
    swap2(&num1, &num2);
    printf("(num1, num2) = (%d, %d)\n", num1, num2);
}

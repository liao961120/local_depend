#include<stdio.h>

int main (void) {
    int num;
    int sum=0;
    int j;
    
    printf("This program calculates the sum from 1 to input number.\n");
    scanf("%d", &num);
    
    for(j=1; j<=num; j++){
        sum = sum + j;
    }//end_for
    
    printf("The sum from 1 to %d is %d.\n", num, sum);
    return 0;
}

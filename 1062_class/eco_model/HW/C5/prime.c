#include<stdio.h>

int main (void) {
    int input;
    int i;
    
    printf("Please input an integer number (> 1).\n"); 
    scanf("%d", &input);
    
    for (i=2; i<=input; i++){
        if (input % i == 0 && input != i) {
            printf("%d is not a prime number.\n", input);
            break;
        }//end if
    }//end for
    
    if (i == input+1){
        printf("%d is a prime number.\n", input);
    }//end if
    return 0;
}
        

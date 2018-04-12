#include<stdio.h>

int main (void) {
    int input;
    int i;
    
    printf("Please input an integer.\n");
    scanf("%d", &input);
    
    if (input % 2 == 0) {
        printf("%d is an even number\n", input);
    } else {
        printf("%d is an odd number\n", input);
    }

    return 0;
}

#include <stdio.h>

int main(void){
    int test[5] = {10, 20, 30, 40, 50};
    
    printf("\nint test[5] = {10, 20, 30, 40, 50}\n\n");
    
    printf("test[0] = %d\n", test[0]);
    printf("Address of test[0] is %p\n", &test[0]);
    printf("Address of test[1] is %p\n", &test[1]);
    printf("Address of test is %p\n", &test);
    printf("The value of test = %p\n", test);
    printf("The value of *test = %d\n", *test);
    printf("The value of *(test+1) = %d\n", *(test+1));
    
    return 0;
}

/*
For an array int test[num]
&test[0] == &test == test == Address of test[0]
 */


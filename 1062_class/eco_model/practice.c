#include<stdio.h>

int main (void) {
    int d1 = 3;
    int d2 = 4;
    int d2_d1;
    double div1, div2;
    
    div1 = d1/d2;
    div2 = (double) d1/(double) d2;
    d2_d1 = d1/d2;
    
    printf("div1 = %lf & div2 = %lf & d2/d1 = %d\n", div1, div2, d2_d1);
    
    return 0;
}

#include <stdio.h>
#include <math.h>

#define STEP 0.2
int main(void){
    int j;
    double x;
    
    for (j=0; j<=100; j++){
        x = j*STEP;
        printf("%lf\t%lf\n", x, sin(x));
    } //end for
    
    return 0;    
}//end main

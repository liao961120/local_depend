#include <stdio.h>
#include <math.h>

int main (void) {
    
    //i_max determines the length of interval of r
    int i, i_max=175; 
    
    //j_max determines the number of iterations under each r
    int j, j_max=1000;
    
    double r = 1; // population growth potential
    double N_int=0.1, N = N_int; // population size
    
    printf("N\tr\n");
    for (i=0; i<=i_max; i++){
        for (j=0; j<=j_max; j++){ //under specific r
            N = N * exp(r*(1 - N)); 
            if (j > j_max/1.5) { // print values only at final phase
                printf("%lf\t%lf\n", N, r);
            } 
        } // end for loop under a specific r
        N = N_int; // set N to initial value to prepare for a new loop with the next r
        r = r + 3.5/i_max; // calculate the next r
    }
    return 0;
}

#include <stdio.h>
#include <math.h>
#include <stdlib.h>
#include <time.h>
#include <complex.h>
#define PAI_A 3.14159265358979 
int main(void){
	
	double complex x, y, z;
	
	x = 3.0 + I*4.0;
	
	y = I*PAI_A;
	z = cexp(y);
	
	printf("real=%lf\timg=%lf\tabsolute value = %lf\n", creal(x), cimag(x), cabs(x));

	printf("real=%lf\timg=%lf\n", creal(z), cimag(z));
	
	return 0;	
}
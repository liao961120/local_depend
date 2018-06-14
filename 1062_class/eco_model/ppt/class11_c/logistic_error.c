//this is a function for checking numerical error for logistic map
#include <stdio.h>
#include <math.h>
#include <stdlib.h>
#include "/Users/miki/Dropbox/new_util/nrutil_new.h"
#include "/Users/miki/Dropbox/new_util/nrutil_new.c"


int main(void){
	
	int j = 0;
	float x = 0.1;
	double y = 0.1;
	double lammda = 3.8;
	
	printf("%d\t%.15lf\t%.15lf\t%.15lf\n", j , x, y, fabs(x-y));
	for(j = 1; j <= 100; j++) {
		x = lammda*x*(1.0 - x);
		y = lammda*y*(1.0 - y);
	
		printf("%d\t%.15lf\t%.15lf\t%.15lf\n", j , x, y, fabs(x-y));
	}
	
	return 0.0;
	
	
}


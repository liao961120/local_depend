#include <stdio.h>
#include <stdlib.h>
#include <math.h>    // Gauss operator
#include <time.h>

// Functions
double floor(double x); // Gauss operator
double r2() {
	return (double)rand() / (double)RAND_MAX ;
}


int main (void)
{
	// Initialize parameters
	int i,T=20;  // add gen
	double random, t= 0.0,gen=0.0;
	
	// Creating log file
	FILE *out;
	out= fopen("test.txt","w");
	
	srand(time(NULL));
	
	for (i=1;i<=T;i++){//create for loop
		if(gen-floor(t)<=0) {
			gen=gen+1.0;
		}
		else {
			gen=gen;
		}
		random=r2();
		fprintf(out, "%lf\t%lf\t%lf\n", t, gen, random);
		t=t+0.1;
	}
}
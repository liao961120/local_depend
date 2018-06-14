//this is a function for cubic equation
#include <stdio.h>
#include <math.h>
#include <stdlib.h>
#include <time.h>
#include <complex.h>
//#include "/Users/miki/Dropbox/new_util/nrutil_new.h"
//#include "/Users/miki/Dropbox/new_util/nrutil_new.c"

#define EPS 1.0e-15	//constant for minimum value
void quadratic_solver(double a2, double a1, double a0, double complex root[]);
void quadratic_bad_solver(double a2, double a1, double a0, double complex root[]);

int main(void){
	
	double complex root_test[2];
	double complex root_test2[2];
	double aa2, aa1, aa0;
	int j;
			
	
	//solution should be 1, 5;	
	aa2 = 1.0;
	aa1 = - (1.0 + 5.0);
	aa0 = 5.0;

	//solution should be 1, 1.001;	
	aa2 = 1.0;
	aa1 = - (1.0 + 1.001);
	aa0 = 1.001;
	
	//for complex solution
	/*aa2 = 1.0;
	aa1 = 1.0;
	aa0 = 1.0;*/
		

	
	//for showing the loss of sigfinicant digits
	aa2 = 1.0;
	aa1 = -(1.2345678912345e-10 + 1.0e+6);
	aa0 = 1.2345678912345e-4;
	
	quadratic_solver(aa2, aa1, aa0, root_test);
	quadratic_bad_solver(aa2, aa1, aa0, root_test2);

	for(j = 0; j < 2; j++) printf("root[%d] = %.25e\t + i x %.25e\n", j, creal(root_test[j]), cimag(root_test[j]));	
	for(j = 0; j < 2; j++) printf("root[%d] = %.25e\t + i x %.25epwd \n", j, creal(root_test2[j]), cimag(root_test2[j]));
	//for(j = 0; j < 4; j++) printf("difference in root[%d] = %.25lf\t + i x %.25lf\n", j, creal(root_test[j] - root_test2[j]), cimag(root_test[j] - root_test2[j]));
	
	return 0;	
}

void quadratic_solver(double a2, double a1, double a0, double complex root[])
{
	double Dd;
	double complex Q_k;
	Dd = a1*a1- 4.0*a2*a0;
	if (Dd > EPS) {				//in case of real solution
		if(a1 >= 0.0) Q_k = -(0.5)*(a1 + sqrt(Dd));
		else Q_k = -(0.5)*(a1 - sqrt(Dd));
		root[0] = Q_k/a2;
		root[1] = a0/Q_k;	
	}
	else if (Dd < -EPS)	{		//in case of complex solution
		Q_k = -(0.5)*(a1 + I*sqrt(-Dd));
		root[0] = Q_k/a2;
		root[1] = creal(root[0]) - I*cimag(root[0]);	//for preventing the error }
	}
	else {	//regarding as double root
		root[0] = -0.5*a1/a2;
		root[1] = -0.5*a1/a2;
	}
	
	return;
	
}

void quadratic_bad_solver(double a2, double a1, double a0, double complex root[])
{

	root[0] = 0.5*(-a1 - csqrt(a1*a1 - 4.0*a2*a0))/a2;
	root[1] = 0.5*(-a1 + csqrt(a1*a1 - 4.0*a2*a0))/a2;
	
	return;
	
}



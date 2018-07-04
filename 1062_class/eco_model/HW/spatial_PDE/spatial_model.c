#include <stdio.h>
#include <stdlib.h>
#include <math.h>

double floor(double x);

//Fc declaration

	//Memory allocation
void message_error(char error_text[]);
double *d_vector(long size); //for generating double vector[1]...vector[size]
void free_d_vector(double *x);

	//Solving ODE
void differential (double time, double in[], double out[]);
double dn_dt(int j_idx, double time, double n[]);
void rk4(double N_in[], double k1[], int n, double t, double h, double N_out[], void (*diff)(double, double [], double []) );


// Global variables
double r=0.09, D=1.0, delta_x=0.1; //model parameter
double t=0.0;                     //time
double deltat=0.001;              //time step for rk4
double *N;                        //initialize array for population size
double *dfdt;
int j_idx;


// Main function
int main(void){
	
	dfdt = d_vector(100); //set vector for 'differential' output
	N = d_vector(100);
	for (j_idx=1;j_idx<=100;j_idx++) N[j_idx] = 0.0; //set initial condition
	N[50] = 100.0; //set initial condition

	int i; //for loop index
	double T=200.2; // T: time of simulation

	for (i=0; i < T/deltat; i++){
		
		if (i % (int)floor(0.1/deltat) == 0 || i == 0){
			printf("%lf\t", t);
			for (j_idx=1;j_idx<=99;j_idx++) printf("%lf\t", N[j_idx]);
			printf("%lf\n", N[100]);
		}
		differential(t, N, dfdt);
		rk4(N, dfdt, 100, t, deltat, N, differential); //first N is input, second N is output
		t += deltat;
	}; //end for: end solving DE

	free_d_vector(N);
	free_d_vector(dfdt);
	return 0;
};



/* ODE Solver Functions */

double dn_dt(int j_idx, double time, double n[]){
	if (j_idx == 1 || j_idx == 100) return 0;
	else {
		return r*n[j_idx] + (D/(delta_x*delta_x)) * (n[j_idx+1] - 2*n[j_idx] + n[j_idx-1]);
	}
};

void differential (double time, double in[], double out[]){
	for (j_idx=1;j_idx<=100;j_idx++) out[j_idx] = dn_dt(j_idx, time, in);
};


/* 
void (*diff)(double, double [], double []) is a function pointer.
In order to use functions as inputs, it is included in the parameter of the function 'rk4'.
In this case, the function 'differential' is taken as input to the function 'rk4'.
*/

void rk4(double N_in[], double k1[], int n, double t, double h, double N_out[], void (*diff)(double, double [], double []) )
{
	int i;
	double *k2, *k3, *k4, *D;
	// n: dimension of the ode
	// N_in: input population size ni. For 2-dim case n1=(pop. size of x); n2=(pop. size of y)
	// k1: parameter of rk4;  k1 = f(D,t); i.e. the output from differential is input of rk4
	k2 = d_vector(n); // rk4 k2
	k3 = d_vector(n); // rk4 k3
	k4 = d_vector(n); // rk4 k4
	D = d_vector(n); // Dummy variable for calculating coefficients of k_i in rk4 

	for (i=1;i<=n;i++) D[i] = N_in[i] + (h/2.0)*k1[i];
	(*diff)(t+h/2.0, D, k2);
	for (i=1;i<=n;i++) D[i] = N_in[i] + (h/2.0)*k2[i];
	(*diff)(t+h/2.0, D, k3);
	for (i=1;i<=n;i++) D[i] = N_in[i] + h*k3[i];
	(*diff)(t+h, D, k4);

	for (i=1;i<=n;i++) N_out[i] = N_in[i] + (h/6.0)*(k1[i] + 2.0*k2[i] + 2.0*k3[i] + k4[i]);

	free_d_vector(D);
	free_d_vector(k2);
	free_d_vector(k3);
	free_d_vector(k4);

};


/* Memory Allocation Functions */

void message_error(char error_text[])
/*Standard error handler*/
{
    printf("There are some errors...\n");
    printf("%s\n", error_text);
    printf("...now existing to system...\n");
    exit(1);
};

double *d_vector(long size){ //for generating double vector[1]...vector[size]
    double *x; //pointer
    
    x = malloc((size + 1)*sizeof(double));
    //allocation of memory space to stock (size + 1) double variables & malloc returns the address of the top of the allocated memory space to x
    //the reason to prepare (size + 1) is just to use from x[1] to x[size]
    
    if(x == NULL) message_error("allocation failure in d_vector()"); //if memory allocation was failed, malloc returns NULL and x becomes NULL
    return x; //return the address of the top of the allocated memory space to x
};

void free_d_vector(double *x)
{
    free(x);
};

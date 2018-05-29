/* 
void (*diff)(double, double [], double []) is a function pointer.
In order to use functions as inputs, it is included in the parameter of the function 'rk4'.
In this case, the function 'differential' is taken as input to the function 'rk4'.
*/

void rk4(double N_in[], double k1[], int n, double t, double h, double N_out[], void (*diff)(double, double [], double []) )
{
	int i;
	double *k2, *k3, *k4, *D;

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

}

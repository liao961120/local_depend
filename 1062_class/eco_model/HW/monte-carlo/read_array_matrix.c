#include <stdio.h>
#include <stdlib.h>
#define NUM_R 5
#define NUM_C 3

int main(int argc, char *argv[])
{
	FILE *fp1, *fp2;
	double *vector_test;
	double **matrix_test;
	int i, j, k;
	vector_test = d_vector(SIZE_V); //allocation of memory
	matrix_test = d_matrix(NUM_R, NUM_C); //allocation of memory
	
	if(argc != 3) message_error("Number of parameter is incompatible.");
	fp1 = fopen(argv[1], "r");
	fp2 = fopen(argv[2], "r");

	if (fp1 == NULL) message_error("File cannot be opened.");
	if (fp2 == NULL) message_error("File cannot be opened.");
	
	#ifdef VECTOR
	for(i = 1; i <= SIZE_V; i++) 
	{
		fscanf(fp1, "%lf,", &vector_test[i]); //for file with comma separation
	}
	for(i = 1; i <= SIZE_V; i++) 
	{
		printf("%lf\n", vector_test[i]);
	}
	#endif
//end if of VECTOR

	#ifdef MATRIX
	for(i = 1; i <= NUM_R; i++) {
		for(j = 1; j <= NUM_C; j++) {
			fscanf(fp2, "%lf;", &matrix_test[i][j]);
		}
	}
	for(i = 1; i <= NUM_R; i++) {
		for(j = 1; j <= NUM_C; j++) {
			printf("%lf\t", matrix_test[i][j]);
		}
		printf("\n");
	}
	#endif
	//end if of MATRIX

	close(fp1);
	close(fp2);
	return 0;
}




#include <stdio.h>
#include <stdlib.h>

/* Function Definition */

void message_error(char error_text[])
/*Standard error handler*/
{
    printf("There are some errors...\n");
    printf("%s\n", error_text);
    printf("...now existing to system...\n");
    exit(1);
}

double *d_vector(long size){ //for generating double vector[1]...vector[size]
    double *x; //pointer
    
    x = malloc((size + 1)*sizeof(double));
    //allocation of memory space to stock (size + 1) double variables & malloc returns the address of the top of the allocated memory space to x
    //the reason to prepare (size + 1) is just to use from x[1] to x[size]
    
    if(x == NULL) message_error("allocation failure in d_vector()"); //if memory allocation was failed, malloc returns NULL and x becomes NULL
    return x; //return the address of the top of the allocated memory space to x
}

void free_d_vector(double *x)
{
    free(x);
}


void free_d_matrix(double **x){
    free(x[0]);
    free(x);
}


double **d_matrix(long size_row, long size_column){
    double **x;
    long i;
    long size_row_P = size_row + 1; 
    long size_column_P = size_column + 1; 
    
    x = (double **) malloc((size_t) (size_row_P*sizeof(double *)));
    
    if(x == NULL) message_error("allocation failure in d_vector()");
    
    x[0] = (double *) malloc((size_t) (size_row_P*size_column_P*sizeof(double)));
    
    if(x[0] == NULL) message_error("allocation failure in d_vector()");
    
    for(i = 1; i < size_row_P; i++) x[i] = x[0] + i*size_column_P;
    
    return x;
}

#include <stdio.h>
#include <stdlib.h>

/* Function Declaration */
double **d_matrix(long size_row, long size_column);
void free_d_matrix(double **x);
void message_error(char error_text[]);


/* Main Function */
int main(void){
    int i, j;
    double **matrix;
    double determinant;
    int nrow=2, ncol=2;
    matrix = d_matrix(nrow, ncol);
    
    for (i=1; i<=nrow; i++){
        for (j=1; j<=ncol; j++){
            printf("Please enter the entry of row %d and column %d of the matrix.\n", i, j);
            scanf("%lf", &matrix[i][j]);
        }
    }
    
    determinant = matrix[1][1]*matrix[2][2] - matrix[2][1]*matrix[1][2];
    
    if (determinant <= 0.000001 && determinant >= -0.000001){
        printf("The determinant of the matrix is 0.\nThe inverse of the matrix doesn't exist.\n");
    }else{
        printf("The determinant of the matrix is %lf.\n", determinant);
        printf("%lf\t%lf\n%lf\t%lf\n", matrix[2][2]/determinant, -matrix[1][2]/determinant, -matrix[2][1]/determinant, matrix[1][1]/determinant);
    }
    free_d_matrix(matrix);
    
    return 0;
}



/* Function Definition */

void message_error(char error_text[])
/*Standard error handler*/
{
    printf("There are some errors...\n");
    printf("%s\n", error_text);
    printf("...now existing to system...\n");
    exit(1);
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

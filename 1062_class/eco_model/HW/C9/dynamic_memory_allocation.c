#include <stdio.h>
#include <stdlib.h> //need to be included


void message_error(char error_text[]);
double *d_vector(long size); //for generating double vector[1]...vector[size]
void free_d_vector(double *x);
    
    
int main(void){
    double *v1;
    v1 = d_vector(4);
    
    *(v1+1) = 3;
    v1[4] = 40;
    
    printf("v1[1] = %lf\n", v1[1]); 
    printf("*(v1+1) = %lf\n", *(v1+1));
    printf("v1[4] = %lf\n", v1[4]); 
    printf("*(v1+4) = %lf\n", *(v1+4));
    
    free_d_vector(v1);
}





/* Functions*/

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

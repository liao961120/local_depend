#include <stdio.h>

double bmi(double height, double weight);

int main(void){
    double h, w;
    
    printf("Please enter your weight (kg)\n");
    scanf("%lf", &w);
    printf("Please enter your height (cm)\n");
    scanf("%lf", &h);
    
    printf("Your BMI is %lf\n", bmi(h, w));
    
    return 0;
}


double bmi(double height, double weight){
    double BMI;
    BMI = weight / ((height/100)*(height/100));
    
    return BMI;
}

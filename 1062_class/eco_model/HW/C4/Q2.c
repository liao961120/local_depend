#include<stdio.h>

int main (void) {
    double height, weight, BMI;
    double height_meter, std_weight;
    
    printf("Please input your height (cm) and weight (kg).\n");
    scanf("%lf", &height);
    scanf("%lf", &weight);
    
    height_meter = height / 100.0;
    
    BMI = (weight) / (height_meter * height_meter);
    std_weight = 24.0 * (height_meter * height_meter);
    
    printf("Your BMI is %.2lf.\n", BMI);
    printf("The standard BMI is assumed to be 24.0.\n");
    printf("The difference with a standard weight is %.2lf kg. \n", weight - std_weight);
    
    return 0;
}

#include<stdio.h>

int main (void) {
    double height, weight, BMI;
    double height_meter;
    
    printf("Please input your height (cm) and weight (kg).\n");
    scanf("%lf", &height);
    scanf("%lf", &weight);
    
    height_meter = height / 100.0;
    
    BMI = (weight) / (height_meter * height_meter);
    
    printf("Your BMI is %.2lf.\n", BMI);
    printf("The standard BMI is assumed to be 24.0.\n");
    
    if (BMI > 24.0) {
        printf("I’m afraid you are overweight.\n");
    } else {
        printf("I’m afraid you are underweight.\n");
    }
    
    return 0;
}

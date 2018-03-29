#include <stdio.h>

int main (void) {
    int age;
    double height;

    printf("Please enter your age and height(cm).\n");
    scanf("%d", &age);
    scanf("%lf", &height);

    printf("Your age is %d and your height is %.1lf cm.\n", age, height);

    return 0;
}

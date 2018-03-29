#include<stdio.h>

int main (void) {
    int bot_len, height;
    double area;
    
    printf("Please input the bottom length of a triangle (integer).\n");
    scanf("%d", &bot_len);
    
    printf("Please input the height of the triangle (integer).\n");
    scanf("%d", &height);
    
    area = (double) bot_len * (double) height / 2.0;
    printf("The area of the traingle is %.2lf.\n", area);
    
    return 0;
}

#include <stdio.h>
#include <math.h>

int main (void) {
    
    double h = 0.001; // interval between each calculation
    double x = 0.1, y = 0.1; //set initial population size of prey, predator
    double k1_x, k2_x, k3_x, k4_x;
    double k1_y, k2_y, k3_y, k4_y;
    double r = 1.0, a = 1.0, b = 0.5, Ht = 1.0, m = 0.1;
    double K = 1.2; // 1.0, 1.2, 2.0
    int i, t=300000; //determine the length of time, time = t*h
    double time = 0;
    
    for (i = 0; i <= t; i++) {
        printf("%lf\t%lf\t%lf\n", time, x, y);
        
        k1_x = r*x*(1 - x/K) - a*(x*y) / (1 + Ht*a*x);
        k1_y = b*(x*y)/(1 + Ht*a*x) - m*y;
        
        k2_x = r*(x + (h/2)*k1_x)*(1 - (x + (h/2)*k1_x)/K) - a*((x + (h/2)*k1_x)*y) / (1 + Ht*a*(x + (h/2)*k1_x));
        k2_y = b*(x*(y + h/2*k1_y))/(1 + Ht*a*x) - m*(y + h/2*k1_y);
        
        k3_x = r*(x + (h/2)*k2_x)*(1 - (x + (h/2)*k2_x)/K) - a*((x + (h/2)*k2_x)*y) / (1 + Ht*a*(x + (h/2)*k2_x));
        k3_y = b*(x*(y + h/2*k2_y))/(1 + Ht*a*x) - m*(y + h/2*k2_y);
        
        k4_x = r*(x + h*k3_x)*(1 - (x + h*k3_x)/K) - a*((x + h*k3_x)*y) / (1 + Ht*a*(x + h*k3_x));
        k4_y = b*(x*(y + h*k3_y))/(1 + Ht*a*x) - m*(y + h*k3_y);
        
        time = time + h;
        x = x + h * 1/6 * (k1_x + 2*k2_x + 2*k3_x + k4_x);
        y = y + h * 1/6 * (k1_y + 2*k2_y + 2*k3_y + k4_y);
    }
    
    return 0;
}

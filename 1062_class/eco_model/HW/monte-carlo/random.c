#include <stdio.h>
#include <stdlib.h>
#include "./dSFMT-src-2.1/dSFMT.c"

int main (void) {

	int i, seed;
	double x1, x2;
	dsfmt_t dsfmt;
	seed = 1;
	
	dsfmt_init_gen_rand(&dsfmt, seed);
	x1 = dsfmt_genrand_close_open(&dsfmt);
	x2 = dsfmt_genrand_open_open(&dsfmt);

	printf("%lf\t%lf\n",x1, x2);
}

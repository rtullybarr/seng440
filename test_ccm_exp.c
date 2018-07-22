#include "ccm_exp.h"
#include <stdio.h>
#include <math.h>

int main (void) {
    // Calculate 2^M, where 0.0 <= M < 1.0
    // M is a positive and pure fractional number

    populate_lookup_table();

    for (float m = 0.0; m <= 1.0; m += 0.1) {
        // convert to fixed-point
        unsigned int M = (unsigned int)(m * SCALE_FACTOR);

        int exp_M = ccm_exp(M);

        // convert from fixed-point
        float exp_m = (exp_M) / (float)SCALE_FACTOR;

        printf("ccm= %.10f, exp2= %.10f\n", exp_m, pow(2.0, m));
    }
}


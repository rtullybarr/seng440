#include "ccm_exp.h"
#include <stdio.h>
#include <math.h>

// Note: extra spot in lookup table to accommodate software pipelining.
int lookup_table[PRECISION + 1];

void populate_lookup_table() {
    int i;
    for (i = 0; i < PRECISION; i++) {
        float num = (log2(1.0 + (pow(2.0, -1*i))));
        lookup_table[i] = (int)(num * SCALE_FACTOR);
    }
}

// CCM - convergence computing method
// Calculates the base-2 exponential of M,
// A fixed point number.
int ccm_exp(unsigned int M) {
    // Precision: K bits
    int f = 0;
    int i = PRECISION + 1;
    int j = 0;
    unsigned int u = M - lookup_table[j];
    int theta = f + (f >> j);

    for (; i; --i) {
        ++j;
        if (u <= SCALE_FACTOR) {
            M = u;
            f = theta;
        }

        u = M - lookup_table[j];
        theta = f + (f >> j);
    }

    return f;
}

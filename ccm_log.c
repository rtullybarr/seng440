#include "ccm_log.h"
#include <stdio.h>
#include <math.h>

float lookup_table[PRECISION];

void populate_lookup_table() {
    int i;
    for (i = 0; i < PRECISION; i++) {
        lookup_table[i] = log2(1.0 + (pow(2.0, -1*i)));
    }
}

// CCM - convergence computing method
// Calculates the base-2 logarithm of M,
// A 16-bit fixed point number.
float ccm_log(unsigned int M) {
    // Precision: K bits (16 bits)
    float f = 0;
    unsigned int u = 0;
    float theta = 0;
    int i;

    for (i = 0; i < PRECISION; i++) {
        u = M + (M >> i);
        theta = f - lookup_table[i];

        if (u <= (1 << 30)) {
            M = u;
            f = theta;
        }
    }

    return f;
}

#include "ccm_log.h"
#include <stdio.h>
#include <math.h>

int lookup_table[PRECISION];

void populate_lookup_table() {
    int i;
    for (i = 0; i < PRECISION; i++) {
        float num = (log2(1.0 + (pow(2.0, -1*i))));
        lookup_table[i] = (int)(num * (1 << 30));
    }
}

// CCM - convergence computing method
// Calculates the base-2 logarithm of M,
// A fixed point number.
int ccm_log(unsigned int M) {
    // Precision: K bits
    int f = 0;
    unsigned int u = 0;
    int theta = 0;
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

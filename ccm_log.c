#include "ccm_log.h"
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
// Calculates the base-2 logarithm of M,
// A fixed point number.
inline int ccm_log(unsigned int M) {
    // Precision: K bits
    int f = 0;
    int i = PRECISION + 1;
    int j = 0;
    unsigned int u = M + (M >> j);
    int theta = f - lookup_table[j];

    for (; i; --i) {
        ++j;
        if (u <= SCALE_FACTOR) {
            M = u;
            f = theta;
        }

        u = M + (M >> j);
        theta = f - lookup_table[j];
    }

    return f;
}

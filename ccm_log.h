#ifndef CCM_LOG_H
#define CCM_LOG_H

#include <math.h>

#define PRECISION 30
// (1 << 30)
#define SCALE_FACTOR 1073741824

// Note: extra spot in lookup table to accommodate software pipelining.
int lookup_table[PRECISION + 1];

static inline void populate_lookup_table() {
    int i;
    for (i = 0; i < PRECISION; i++) {
        float num = (log2(1.0 + (pow(2.0, -1*i))));
        lookup_table[i] = (int)(num * SCALE_FACTOR);
    }
}

// CCM - convergence computing method
// Calculates the base-2 logarithm of M,
// A fixed point number.
static inline int ccm_log(unsigned int M) {
    // Precision: K bits
    int f = 0;
    int i = PRECISION + 1;
    int j = 0;
    unsigned int u = M + (M >> j);

    for (; i; --i) {
        if (u <= SCALE_FACTOR) {
            M = u;
            f -= lookup_table[j];
        }

        j++;

        u = M + (M >> j);
    }

    return f;
}

#endif

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
// (puts result in F)
#define CCM_LOG(M, F) \
    int ___f = 0; \
    int ___i = PRECISION + 1; \
    int ___j = 0; \
    unsigned int ___u = (M) + ((M) >> ___j); \
    int ___theta = ___f - lookup_table[___j]; \
    for (; ___i; --___i) { \
        ++___j; \
        if (___u <= SCALE_FACTOR) { \
            (M) = ___u; \
            ___f = ___theta; \
        } \
        ___u = (M) + ((M) >> ___j); \
        ___theta = ___f - lookup_table[___j]; \
    } \
    F = ___f; \

#endif

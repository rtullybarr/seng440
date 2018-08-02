#ifndef CCM_EXP
#define CCM_EXP

#define PRECISION 30
#define SCALE_FACTOR (1 << 30)

void populate_lookup_table();
int ccm_exp(unsigned int M);

// CCM - convergence computing method
// Calculates the base-2 exponential of M,
// A fixed point number.
static inline int ccm_exp(unsigned int M) {
    // Precision: K bits
    int f = SCALE_FACTOR;
    int i = PRECISION + 1;
    int j = 0;
    int u = M - lookup_table[j];
    int theta = f + (f >> j);

    for (; i; --i) {

        ++j;
        if (u >= 0) {
            M = u;
            f = theta;
        }

        u = M - lookup_table[j];
        theta = f + (f >> j);
    }

    return f;
}
#endif

#ifndef CCM_EXP
#define CCM_EXP

#define PRECISION 30
#define SCALE_FACTOR (1 << 30)

// Note: extra spot in lookup table to accommodate software pipelining.
int lookup_table[PRECISION + 1] = {
    1073741824,
    628098688,
    345667648,
    182455584,
    93912512,
    47667824,
    24017256,
    12055174,
    6039313,
    3022600,
    1512037,
    756203,
    378147,
    189085,
    94545,
    47273,
    23636,
    11818,
    5909,
    2954,
    1477,
    738,
    369,
    184,
    92,
    46,
    23,
    11,
    5,
    2,
    0 // Unused
};


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

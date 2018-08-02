#ifndef CCM_LOG_H
#define CCM_LOG_H

#include <math.h>
#include <stdio.h>

#define PRECISION 30
// (1 << 30)
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
// Calculates the base-2 logarithm of M,
// A fixed point number.
static inline int ccm_log(unsigned int M) {
    // Precision: K bits
    int f = 0;
    int i = PRECISION + 1;
    int j = 0;
    unsigned int u = M + (M >> j);
    int theta = 0;

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

#endif

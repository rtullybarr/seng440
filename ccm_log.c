#include <stdio.h>
#include <math.h>
#define PRECISION 16

float lookup_table[PRECISION];

void populate_lookup_table() {
    int i;
    for (i = 0; i < PRECISION; i++) {
        lookup_table[i] = log2(1.0 + (pow(2.0, -1*i)));
    }
}

float ccm_log(unsigned int M) {
    // Precision: K bits (16 bits)
    float f = 0;
    unsigned int u = 0;
    float theta = 0;
    int i;

    for (i = 0; i < PRECISION; i++) {
        u = M + (M >> i);
        theta = f - lookup_table[i];

        if (u <= (1 << 16)) {
            M = u;
            f = theta;
        }
    }

    return f;
}

int main (void) {
    // Calculate log M, where 0.5 <= M < 1.0
    // M is a normalized fixed-point number
    populate_lookup_table();

    float m = 0.7;
    // convert to fixed-point
    // 0.5 = 0, 1.0 = 2^0 = 2^16
    unsigned int M = (unsigned int)(m * (1 << 16));

    float log_M = ccm_log(M);

    printf("%f\n", log_M);
}

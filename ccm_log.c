#include <math.h>
#define PRECISION 16

uint32_t lookup_table[PRECISION];

void populate_lookup_table() {
    for (int i = 0; i < PRECISION; i++) {
        lookup_table[i] = (log2(1.0 + (pow(2.0, -1*i)))*(1 << 16));
    }
}

uint32_t ccm_log(uint32_t M) {
    // Precision: K bits (16 bits)
    uint32_t f = 0;
    uint32_t u = 0;
    uint32_t theta = 0;

    for (int i = 0; i < PRECISION; i++) {
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

    log_M = ccm_log(M);
}

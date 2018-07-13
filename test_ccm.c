#include "ccm_log.h"
#include <stdio.h>
#include <math.h>

int main (void) {
    // Calculate log M, where 0.5 <= M < 1.0
    // M is a normalized fixed-point number

    populate_lookup_table();

    for (float m = 0.5; m <= 1.0; m += 0.1) {
        // convert to fixed-point
        unsigned int M = (unsigned int)(m * (1 << 30));

        int log_M = ccm_log(M);

        // convert from fixed-point
        float log_m = (log_M) / (float)(1 << 30);

        printf("ccm= %.10f, log2= %.10f\n", log_m, log2(m));
    }
}

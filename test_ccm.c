#include "ccm_log.h"
#include <stdio.h>
#include <math.h>

int main (void) {
    // Calculate log M, where 0.5 <= M < 1.0
    // M is a normalized fixed-point number

    populate_lookup_table();

    for (float m = 0.5; m <= 1.0; m += 0.05) {
        // convert to fixed-point
        // 0 = 0, 1.0 = 2^0 = 2^24
        unsigned int M = (unsigned int)(m * (1 << 30));

        float log_M = ccm_log(M);

        printf("ccm= %f, log2= %f\n", log_M, log2(m));
    }
}

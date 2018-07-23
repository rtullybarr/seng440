#include "ccm_log.h"
#include <stdio.h>
#include <math.h>

int main (void) {
    // Calculate log M, where 0.5 <= M < 1.0
    // M is a normalized fixed-point number

    populate_lookup_table();
    float m;

    for (int i = 0; i < 100; i++) {
        for (m = 0.5; m <= 1.0; m += 0.0000001) {
            // convert to fixed-point
            unsigned int M = (unsigned int)(m * SCALE_FACTOR);

            int log_M;
            CCM_LOG(M, log_M)

            // convert from fixed-point
            float log_m = (log_M) / (float)SCALE_FACTOR;

            //printf("ccm= %.10f, log2= %.10f\n", log_m, log2(m));
        }
    }
}

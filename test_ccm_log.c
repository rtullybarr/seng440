#include "ccm_log.h"
#include <stdio.h>
#include <math.h>

int main (void) {
    // Calculate log M, where 0.5 <= M < 1.0
    // M is a normalized fixed-point number

    // For profiling: doing conversions from floating point
    // outside loop.
    unsigned int start = (unsigned int)(0.5 * SCALE_FACTOR);
    unsigned int end = SCALE_FACTOR;
    int log_M;

    for (unsigned int M = start; M < end; M += 100) {
            // convert to fixed-point
            //unsigned int M = (unsigned int)(m * SCALE_FACTOR);

            int log_M = ccm_log(M);

            if (log_M > 0) {
                printf("ERROR\n");
            }

            // convert from fixed-point
            //float log_m = (log_M) / (float)SCALE_FACTOR;

            //printf("ccm=%f, log2=%f\n", log_m, log2(m));
    }
}

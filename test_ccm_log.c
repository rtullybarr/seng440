#include "ccm_log.h"
#include <stdio.h>
#include <math.h>

int main (void) {
    // Calculate log M, where 0.5 <= M < 1.0
    // M is a normalized fixed-point number

    float m = 0.6;

    //for (m = 0.5; m <= 1.0; m += 0.0000001) {
        // convert to fixed-point
        unsigned int M = (unsigned int)(m * SCALE_FACTOR);

        int log_M = ccm_log(M);

        // convert from fixed-point
        float log_m = (log_M) / (float)SCALE_FACTOR;

        printf("ccm=%f, log2=%f\n", log_m, log2(m));
    //}
}

#include "ccm_log.h"
#include <stdio.h>
#include <math.h>

int main (void) {
    // Calculate log M, where 0.5 <= M < 1.0
    // M is a normalized fixed-point number

    float m;

    for (m = 0.5; m <= 1.0; m += 0.0000001) {
        // convert to fixed-point
        unsigned int M = (unsigned int)(m * SCALE_FACTOR);

        int log_M = ccm_log(M);
        //int log_M;
        //__asm__("ccm_log %0, %1" : "=r" (log_M) : "r" (M));
        
        // convert from fixed-point
        float log_m = (log_M) / (float)SCALE_FACTOR;

        printf("ccm= %.10f, log2= %.10f\n", log_m, log2(m));
    }
}

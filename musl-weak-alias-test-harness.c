#include "musl-weak-alias-test.h"
#include "musl-weak-alias-test2.h"

#include <inttypes.h>
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>

int main(void) {
    printf("padding_var: 0x%016" PRIxPTR "\n", (uintptr_t)&padding_var);
    printf("__progname: 0x%016" PRIxPTR "\n", (uintptr_t)&__progname);
    printf("program_invocation_short_name: 0x%016" PRIxPTR "\n", (uintptr_t)&program_invocation_short_name);
    printf("padding_var2: 0x%016" PRIxPTR "\n", (uintptr_t)&__progname);
    printf("__progname_extern: 0x%016" PRIxPTR "\n", (uintptr_t)&__progname_extern);

    return 0;
}

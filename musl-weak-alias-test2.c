#include "musl-weak-alias-test2.h"
#include "alias.h"
#include "musl-weak-alias-test.h"

#include <inttypes.h>
#include <stdint.h>
#include <stdio.h>

char *padding_var2 = 0;

// weak_alias(padding_var2, __progname_extern);
// alias(padding_var2, __progname_extern);
// weak_alias(__progname, __progname_extern);
alias(__progname, __progname_extern);

void test2(void) {
    printf("test2 &padding_var2: 0x%016" PRIxPTR "\n", (uintptr_t)&padding_var2);
    printf("test2 &__progname_extern: 0x%016" PRIxPTR "\n", (uintptr_t)&__progname_extern);
}

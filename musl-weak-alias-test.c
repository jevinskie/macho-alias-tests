#include "musl-weak-alias-test.h"
#include "alias.h"

#include <inttypes.h>
#include <stdint.h>
#include <stdio.h>

char *padding_var = 0;
char *__progname  = 0;

// weak_alias(__progname, program_invocation_short_name);
alias(__progname, program_invocation_short_name);

void test(void) {
    printf("test  &padding_var: 0x%016" PRIxPTR "\n", (uintptr_t)&padding_var);
    printf("test  &__progname: 0x%016" PRIxPTR "\n", (uintptr_t)&__progname);
    printf("test  &program_invocation_short_name: 0x%016" PRIxPTR "\n", (uintptr_t)&program_invocation_short_name);
}

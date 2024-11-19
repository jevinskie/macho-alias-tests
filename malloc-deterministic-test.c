#include <inttypes.h>
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>

int main(void) {
    void *malloc_ptr = malloc(32);
    printf("malloc_ptr: 0x%016" PRIxPTR "\n", (uintptr_t)malloc_ptr);
    return 0;
}

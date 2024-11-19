#include "musl-weak-alias-test.h"
#include "alias.h"

char *padding_var = 0;
char *__progname  = 0;

weak_alias(__progname, program_invocation_short_name);

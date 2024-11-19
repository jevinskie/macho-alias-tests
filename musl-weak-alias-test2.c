#include "musl-weak-alias-test2.h"
#include "alias.h"
#include "musl-weak-alias-test.h"

char *padding_var2 = 0;

weak_alias(padding_var2, __progname_extern);

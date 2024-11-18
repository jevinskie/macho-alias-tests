#define weak                 __attribute__((__weak__))
#define hidden               __attribute__((__visibility__("hidden")))
#define weak_alias(old, new) extern __typeof(old) new __attribute__((__weak__, __alias__(#old)))

char *__progname = 0;

weak_alias(__progname, program_invocation_short_name);

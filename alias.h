#pragma once

#define weak                 __attribute__((__weak__))
#define hidden               __attribute__((__visibility__("hidden")))
#define alias(old, new)      extern __typeof(old) new __attribute__((__alias__(#old)))
#define weak_alias(old, new) extern __typeof(old) new __attribute__((__weak__, __alias__(#old)))

#ifdef __APPLE__
#define WEAK_IMPORT __attribute__((weak_import))
#else
#define WEAK_IMPORT
#endif

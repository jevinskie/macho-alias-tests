TARGETS := musl-weak-alias-test.dylib musl-weak-alias-test.so musl-weak-alias-test.elf.s musl-weak-alias-test.macho.s musl-weak-alias-test.elf.o musl-weak-alias-test.macho.o musl-weak-alias-test2.dylib musl-weak-alias-test2.so musl-weak-alias-test2.elf.s musl-weak-alias-test2.macho.s musl-weak-alias-test2.elf.o musl-weak-alias-test2.macho.o musl-weak-alias-test-harness.macho.s musl-weak-alias-test-harness.elf.s musl-weak-alias-test-harness.macho.o musl-weak-alias-test-harness.elf.o musl-weak-alias-test-harness.macho musl-weak-alias-test-harness.elf malloc-deterministic-test

C_CXX_FLAGS := -Wall -Wextra -Wpedantic
C_FLAGS := $(C_CXX_FLAGS) -std=gnu17

all: $(TARGETS)

.PHONY: clean

clean:
	rm -rf *.dSYM/
	rm -f $(TARGETS)

%.macho.s: %.c
	clang -o $@ $^ $(C_FLAGS) -S

%.macho.o: %.c
	clang -o $@ $^ $(C_FLAGS) -c

%.dylib: %.macho.o
	clang -o $@ $^ $(C_FLAGS) -shared

musl-weak-alias-test-harness.macho: musl-weak-alias-test-harness.macho.o musl-weak-alias-test.macho.o musl-weak-alias-test2.macho.o
	clang -fuse-ld=lld -o $@ $^ $(C_FLAGS)

%.macho: %.macho.o
	clang -o $@ $^ $(C_FLAGS)

%.elf.s: %.c
	x86_64-unknown-linux-gnu-gcc -o $@ $^ $(C_FLAGS) -S

%.elf.o: %.c
	x86_64-unknown-linux-gnu-gcc -o $@ $^ $(C_FLAGS) -c

%.so: %.elf.o
	x86_64-unknown-linux-gnu-gcc -o $@ $^ $(C_FLAGS) -shared

musl-weak-alias-test-harness.elf: musl-weak-alias-test-harness.elf.o musl-weak-alias-test.so musl-weak-alias-test2.so
	x86_64-unknown-linux-gnu-gcc -o $@ $^ $(C_FLAGS)

malloc-deterministic-test: malloc-deterministic-test.c
	clang -o $@ $^ $(C_FLAGS)

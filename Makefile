TARGETS := musl-weak-alias-test.dylib musl-weak-alias-test.so musl-weak-alias-test.elf.s musl-weak-alias-test.macho.s musl-weak-alias-test.elf.o musl-weak-alias-test.macho.o

C_CXX_FLAGS := -Wall -Wextra -Wpedantic
C_FLAGS := $(C_CXX_FLAGS) -std=gnu17

all: $(TARGETS)

.PHONY: clean

clean:
	rm -rf *.dSYM/
	rm -f $(TARGETS)

musl-weak-alias-test.macho.s: musl-weak-alias-test.c
	clang -o $@ $^ $(C_FLAGS) -S

musl-weak-alias-test.macho.o: musl-weak-alias-test.c
	clang -o $@ $^ $(C_FLAGS) -c

musl-weak-alias-test.dylib: musl-weak-alias-test.macho.o
	clang -o $@ $^ $(C_FLAGS) -shared

musl-weak-alias-test.elf.s: musl-weak-alias-test.c
	x86_64-unknown-linux-gnu-gcc -o $@ $^ $(C_FLAGS) -S

musl-weak-alias-test.elf.o: musl-weak-alias-test.c
	x86_64-unknown-linux-gnu-gcc -o $@ $^ $(C_FLAGS) -c
musl-weak-alias-test.so: musl-weak-alias-test.elf.o
	x86_64-unknown-linux-gnu-gcc -o $@ $^ $(C_FLAGS) -shared

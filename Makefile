# NyxOS-D - a freestanding D (-betterC) Multiboot kernel.
KERNEL := nyxos-d.elf
LDC    := $(shell ls -d $(HOME)/dlang/ldc-*/bin/ldc2 2>/dev/null | head -1)

$(KERNEL): boot.o kernel.o linker.ld
	ld -m elf_i386 -T linker.ld -o $@ boot.o kernel.o
	@grub-file --is-x86-multiboot $@ && echo "multiboot: OK"

boot.o: boot.asm
	nasm -f elf32 $< -o $@

kernel.o: kernel.d
	$(LDC) -betterC -mtriple=i686-unknown-none-elf -mattr=-sse,-sse2,-mmx \
	       --relocation-model=static -O2 -c kernel.d -of=kernel.o

run: $(KERNEL)
	qemu-system-x86_64 -kernel $(KERNEL)

clean:
	rm -f *.o $(KERNEL)

.PHONY: run clean

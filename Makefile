CROSS=i686-elf-
AS=nasm
CC=$(CROSS)gcc
LD=$(CROSS)ld
CFLAGS=-ffreestanding -m32 -O2 -Wall -Wextra

all: os-image.bin

boot.bin: boot/boot.asm
	$(AS) -f bin $< -o $@

kernel.o: kernel/kernel.c
	$(CC) $(CFLAGS) -c $< -o $@

kernel.bin: kernel.o
	$(LD) -T kernel/linker.ld -o $@ kernel.o

os-image.bin: boot.bin kernel.bin
	cat boot.bin kernel.bin > os-image.bin

run: os-image.bin
	qemu-system-i386 -drive format=raw,file=os-image.bin

clean:
	rm -f *.bin *.o *.iso

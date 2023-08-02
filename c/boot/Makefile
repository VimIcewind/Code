ALL :
	gcc -c -fno-builtin -ffreestanding -nostdlib -m32 miniboot.c -o miniboot.o
	ld -e start_entry -m elf_i386 -Ttext-seg=0x100000 miniboot.o -o miniboot.elf
clean:
	rm -rf miniboot.o miniboot.elf

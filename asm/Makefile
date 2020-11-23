all : hi hello

win : hello.exe

hi : hi.o
	ld -o hi hi.o
hi.o : hi.asm
	nasm -f elf64 hi.asm

hello : hello.o
	ld -o hello hello.o
hello.o : hello.s
	as -o hello.o hello.s

hello.exe : hello.obj
	gcc -o hello.exe hello.obj
hello.obj : hello.asm
	nasm -f win64 hello.asm

clean :
	rm -rf hi hello hi.exe hello.exe *.o *.obj

CFLAG=-g

all : prog mstore.s mstore.asm mstore.o

prog : main.c mstore.c
	gcc -Og -o prog main.c mstore.c
mstore.s : mstore.c
	gcc -Og -S mstore.c
mstore.asm : mstore.c
	gcc -Og -S -masm=intel mstore.c -o mstore.asm
mstore.o : mstore.c
	gcc -Og -c mstore.c
clean :
	rm -rf prog mstore.s mstore.asm *.o

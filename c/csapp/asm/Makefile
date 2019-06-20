CFLAGS=-g -Og
CC=gcc

all : prog mstore.s mstore.asm mstore.o exchange.o

prog : main.c mstore.c
	$(CC) $(CFLAGS) -o prog main.c mstore.c
mstore.s : mstore.c
	$(CC) $(CFLAGS) -S mstore.c
mstore.asm : mstore.c
	$(CC) $(CFLAGS) -S -masm=intel mstore.c -o mstore.asm
mstore.o : mstore.c
	$(CC) $(CFLAGS) -c mstore.c
exchange.o : exchange.c
	$(CC) $(CFLAGS) -c exchange.c
clean :
	rm -rf prog mstore.s mstore.asm *.o

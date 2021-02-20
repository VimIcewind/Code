CC=gcc
CFLAGS=-g -Og -Wall

OBJECTS=main

all : $(OBJECTS)

main : main.c shape.c shape.h
	$(CC) $(CFLAGS) -o main main.c shape.c shape.h
.c.o:
	$(CC) $(CFLAGS) -c $*.c
clean :
	rm -rf $(OBJECTS)

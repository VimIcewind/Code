CC=gcc
CFLAGS=-g3 -gdwarf-2 -Wall
OBJECTS=main.o getop.o stack.o getch.o

calc : $(OBJECTS)
	$(CC) $(CFLAGS) -o calc $(OBJECTS)
.c.o:
	$(CC) $(CFLAGS) -c $*.c
clean :
	rm -rf calc $(OBJECTS)

CC=gcc
CFLAGS=-g
OBJECT=main.o getop.o stack.o getch.o

calc : $(OBJECT)
	$(CC) $(CFLAGS) -o calc $(OBJECT)
.c.o:
	$(CC) $(CFLAGS) -c $*.c
clean :
	rm -rf calc $(OBJECT)

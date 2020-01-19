CC=gcc
CFLAGS=-g

ALL : dieloop alarm printsigset

dieloop : dieloop.c
	gcc -o dieloop dieloop.c

alarm : alarm.c
	gcc -o alarm alarm.c

printsigset : printsigset.c
	gcc -o printsigset printsigset.c

clean :
	rm -rf dieloop alarm printsigset core core.* *.o

CC=gcc
CFLAGS=-g

ALL : dieloop alarm printsigset mysleep

dieloop : dieloop.c
	gcc -o dieloop dieloop.c

alarm : alarm.c
	gcc -o alarm alarm.c

printsigset : printsigset.c
	gcc -o printsigset printsigset.c

mysleep : mysleep.c
	gcc -o mysleep mysleep.c

clean :
	rm -rf dieloop alarm printsigset mysleep core core.* *.o

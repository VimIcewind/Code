CC=gcc
CFLAGS=-g

DST=dieloop alarm printsigset mysleep globalvar sig_atomic_t sig_atomic_t_volatile sigset signal sigaction

ALL : $(DST)

dieloop : dieloop.c
	gcc -o dieloop dieloop.c

alarm : alarm.c
	gcc -o alarm alarm.c

printsigset : printsigset.c
	gcc -o printsigset printsigset.c

mysleep : mysleep.c
	gcc -o mysleep mysleep.c

globalvar : globalvar.c
	gcc -o globalvar globalvar.c

sigset : sigset.c
	gcc -o sigset sigset.c

signal : signal.c
	gcc -o signal signal.c

sigaction : sigaction.c
	gcc -o sigaction sigaction.c

clean :
	rm -rf $(DST) core core.* *.o

all : mthread hithread

mthread : mthread.o
	gcc -o mthread -lpthread mthread.o
mthread.o : mthread.c
	gcc -c mthread.c
hithread : hithread.o
	gcc -o hithread -lpthread hithread.o
hithread.o : hithread.c
	gcc -c hithread.c
clean :
	rm -rf mthread mthread.o hithread hithread.o

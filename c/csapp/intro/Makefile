CFLAG=-g
OBJECT=hello.i hello.s hello.o hello

hello : hello.o
	gcc -o hello hello.o
hello.o : hello.s
	gcc -c hello.s
hello.s : hello.i
	gcc -S hello.i
hello.i : hello.c
	gcc -o hello.i -E hello.c
clean :
	rm -rf hello hello.o hello.s hello.i

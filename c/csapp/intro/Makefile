CFLAG=-g
OBJECT=main.o code.o exchange.o

prog : main.o code.o
	gcc -o prog main.o code.o
exchange : exchange.o
	gcc -o exchange exchange.o
clean :
	rm -rf prog exchange *.o

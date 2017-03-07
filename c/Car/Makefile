main : main.o Car.o
	gcc -o main main.o Car.o
main.o : main.c Car.c
	gcc -c main.c Car.c
Car.o : Car.c
	gcc -c Car.c
clean :
	rm -rf main *.o

main : main.o Car.o
	g++ -o main main.o Car.o
main.o : main.cpp Car.cpp
	g++ -c main.cpp Car.cpp
Car.o : Car.cpp
	g++ -c Car.cpp
clean :
	rm -rf main *.o

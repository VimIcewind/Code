all : libtiger.so test.so main demo

libtiger.so : sub.c add.c
	gcc -fpic -shared add.c sub.c -o libtiger.so
test.so : test.c
	gcc -fPIC -shared -o test.so test.c
main : main.c tiger.h
	gcc -o main main.c -L ./ -ltiger
demo : demo.c
	gcc demo.c -o demo -ldl -g
clean :
	rm -rf main demo *.o *.so

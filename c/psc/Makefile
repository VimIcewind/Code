all : hello various_storage SimpleSection SpecialSymbol ManualNameMangling single-thread-pt multi-thread-pt ab TinyHelloWorld TinyHelloWorld_lds target

hello : hello.c
	gcc -o hello hello.c
various_storage : various_storage.c
	gcc -o various_storage various_storage.c
SimpleSection : SimpleSection.o
	gcc -o SimpleSection SimpleSection.o
SimpleSection.o : SimpleSection.c
	gcc -c SimpleSection.c
SpecialSymbol : SpecialSymbol.c
	gcc -o SpecialSymbol SpecialSymbol.c
ManualNameMangling : ManualNameMangling.cpp
	g++ -o ManualNameMangling ManualNameMangling.cpp
single-thread-pt : pthread.c
	gcc -o single-thread-pt pthread.c
multi-thread-pt : pthread.c
	gcc -o multi-thread-pt pthread.c -lpthread
ab : a.o b.o
	gcc -o ab a.o b.o
a.o : a.c
	gcc -c a.c
b.o : b.c
	gcc -c b.c
TinyHelloWorld : TinyHelloWorld.o
	ld -static -e nomain -o TinyHelloWorld TinyHelloWorld.o
TinyHelloWorld.o : TinyHelloWorld.c
	gcc -c -fno-builtin TinyHelloWorld.c
TinyHelloWorld_lds : TinyHelloWorld.o
	ld -static -T TinyHelloWorld.lds -o TinyHelloWorld_lds TinyHelloWorld.o
target : target.c
	gcc -o target target.c -lbfd

clean :
	rm -rf *.o hello various_storage SimpleSection SpecialSymbol ManualNameMangling single-thread-pt multi-thread-pt ab TinyHelloWorld TinyHelloWorld_lds target

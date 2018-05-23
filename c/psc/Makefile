all : hello various_storage SimpleSection SpecialSymbol ManualNameMangling single-thread-pt multi-thread-pt ab TinyHelloWorld TinyHelloWorld_lds target \
	SectionMapping SectionMapping.elf malloc_maximum minibash Lib.so Program1 Program2 pic.so stack_init_info


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
SectionMapping : SectionMapping.c
	gcc -o SectionMapping SectionMapping.c
SectionMapping.elf : SectionMapping.c
	gcc -static -o SectionMapping.elf SectionMapping.c
malloc_maximum : malloc_maximum.c
	gcc -o malloc_maximum malloc_maximum.c
minibash : minibash.c
	gcc -o minibash minibash.c
Lib.so : Lib.c
	gcc -fPIC -shared -o Lib.so Lib.c
Program1 : Program1.c
	gcc -o Program1 Program1.c ./Lib.so
Program2 : Program2.c
	gcc -o Program2 Program2.c ./Lib.so
pic.so : pic.c
	gcc -fPIC -shared -o pic.so pic.c
stack_init_info : stack_init_info.c
	gcc -o stack_init_info stack_init_info.c

clean :
	rm -rf *.o hello various_storage SimpleSection SpecialSymbol ManualNameMangling single-thread-pt multi-thread-pt ab TinyHelloWorld TinyHelloWorld_lds target \
		SectionMapping SectionMapping.elf malloc_maximum minibash \
		Lib.so Program1 Program2 pic.so stack_init_info

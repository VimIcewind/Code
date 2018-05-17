all : hello various_storage SimpleSection SpecialSymbol ManualNameMangling

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

clean :
	rm -rf *.o hello various_storage SimpleSection SpecialSymbol ManualNameMangling

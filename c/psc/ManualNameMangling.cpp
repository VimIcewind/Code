// ManualNameMangling.cpp
// g++ ManualNameMangling.cpp -o ManualNameMangling

#include <stdio.h>

namespace myname {
	int var = 42;
}

extern "C" double _ZN6myname3varE;

int main(int argc, const char *argv[])
{
	printf("%f\n", _ZN6myname3varE);
	return 0;
}

#include <stdio.h>
#include <stdlib.h>

void foo(void)
{
	printf("bye!\n");
}

int main(int argc, const char *argv[])
{
	atexit(&foo);
	printf("endof main\n");
	return 0;
}

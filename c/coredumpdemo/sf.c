#include <stdio.h>

void foo()
{
	char *str = "Hello, world!";
	puts(str);
	str = NULL;
	puts(str);
}

int main(void)
{
	foo();
	return 0;
}

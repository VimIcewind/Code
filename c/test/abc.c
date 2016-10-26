#include <stdio.h>

void f(void)
{
	static int a = 3;
	static int b;
	int c;
	++a;
	++b;
	++c;
	printf("a=%d\n", a);
	printf("b=%d\n", b);
	printf("c=%d\n", c);
}

int main(void)
{
	f();
	f();
	f();
}

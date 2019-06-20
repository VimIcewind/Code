#include <stdio.h>

int main(int argc, const char *argv[])
{
	long a = 4;
	long b = exchange(&a, 3);
	printf("a = %ld, b = %ld\n", a, b);
	return 0;
}

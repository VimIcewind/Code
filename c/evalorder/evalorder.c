/* Applicative-order evaluation or normal-order evaluation ? */
#include <stdio.h>

int new_plus(int x)
{
	printf("x is %d\n", x);
	return (x + x);
}

int generate_x(int i)
{
	printf("generating x, i is %d\n", i);
	return i*10;
}

int main(int argc, const char *argv[])
{
	new_plus(generate_x(5));
	return 0;
}

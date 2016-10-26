#include <stdio.h>

int exchange(int *xp, int y)
{
	int x = *xp;

	*xp = y;
	return x;
}

int main()
{
	int a = 4;
	int b = exchange(&a, 3);
	printf("a = %d, b = %d\n", a, b);
	return 0;
}

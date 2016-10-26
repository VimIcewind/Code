#include <stdio.h>
int b(void)
{
	printf("3");
	return 3;
}

int c(void)
{
	printf("4");
	return 4;
}

int main(void)
{
	int a = b() + c();
	printf("%d\n", a);
}

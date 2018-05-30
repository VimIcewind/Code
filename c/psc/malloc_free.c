#include <stdio.h>
#include <stdlib.h>

int a = 3;

int main(int argc, const char *argv[])
{
	int *p = (int *)malloc(sizeof(int));
	scanf("%d", p);
	printf("%d", a + *p);
	free(p);
	return 0;
}

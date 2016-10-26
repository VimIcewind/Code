#include <stdio.h>
int main(void)
{
	int a[5];
	printf("%x\n", a);
	printf("%x\n", a + 1);
	printf("%x\n", &a);
	printf("%x\n", &a + 1);
}

#include<stdio.h>

int main(void)
{
	typedef char *pStr;
	char string[4] = "abc";
	const char *p1 = string;
	const pStr p2 = string;
	p1++;
	p2[2] = 'e';
	printf("%s\n", p1);
	printf("%s", p2);
	return 0;
}

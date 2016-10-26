#include <stdio.h>
#include <ctype.h>

int main()
{
	int var1 = '3';
	int var2 = 'm';
	int var3 = ' ';

	if (isgraph(var1)) {
		printf("var1 = |%c| 是可打印的\n", var1);
	} else {
		printf("var1 = |%c| 是不可打印的\n", var1);
	}

	if (isgraph(var2)) {
		printf("var2 = |%c| 是可打印的\n", var2);
	} else {
		printf("var2 = |%c| 是不可打印的\n", var2);
	}

	if (isgraph(var3)) {
		printf("var3 = |%c| 是可打印的\n", var3);
	} else {
		printf("var3 = |%c| 是不可打印的\n", var3);
	}

	return (0);
}

#include <stdio.h>
#include <ctype.h>

int main()
{
	char var1 = 't';
	char var2 = '0';

	if (isxdigit(var1)) {
		printf("var1 = |%c| 是十六进制数字\n", var1);
	} else {
		printf("var1 = |%c| 不是十六进制数字\n", var1);
	}

	if (isxdigit(var2)) {
		printf("var2 = |%c| 是十六进制数字\n", var2);
	} else {
		printf("var2 = |%c| 不是十六进制数字\n", var2);
	}

	return (0);
}

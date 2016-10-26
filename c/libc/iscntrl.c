#include <stdio.h>
#include <ctype.h>

int main()
{
	int i = 0, j = 0;
	char str1[] = "all \a about \t programming";
	char str2[] = "w3cschool \n tutorials";

	/* 输出字符串直到控制字符 \a */
	while (!iscntrl(str1[i])) {
		putchar(str1[i]);
		i++;
	}

	/* 输出字符串直到控制字符 \n */
	while (!iscntrl(str2[j])) {
		putchar(str2[j]);
		j++;
	}

	return (0);
}

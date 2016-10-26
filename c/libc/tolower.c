#include <stdio.h>
#include <ctype.h>

int main()
{
	int i = 0;
	char str[] = "W3CSCHOOL TUTORIALS";

	while (str[i]) {
		putchar(tolower(str[i]));
		i++;
	}

	return (0);
}

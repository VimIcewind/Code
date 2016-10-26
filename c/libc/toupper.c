#include <stdio.h>
#include <ctype.h>

int main()
{
	int i = 0;
	char str[] = "W3Cschool Tutorials";

	while (str[i]) {
		putchar(toupper(str[i]));
		i++;
	}

	return (0);
}

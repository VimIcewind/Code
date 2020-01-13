#include <stdio.h>

int main(int argc, const char *argv[])
{
	extern char **environ;
	int i;

	for (i = 0; environ[i] != NULL; i++) {
		printf("%s\n", environ[i]);
	}
	return 0;
}

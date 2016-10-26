#include <stdio.h>
#include <stdlib.h>
#include <ctype.h>
int main(int argc, char **argv)
{
	int (*convcase[2]) (int) = {toupper, tolower};
	int func;
	int result = EXIT_SUCCESS;
	int ch;

	if (argc > 0) {
		if (toupper((unsigned char)argv[0][2]) == 'U') {
			func = 0;
		} else {
			func = 1;
		}
		while ((ch = getchar()) != EOF) {
			ch = (*convcase[func]) ((unsigned char)ch);
			putchar(ch);
		}
	} else {
		fprintf(stderr, "Unknown name. Can't decide what to do./n");
		result = EXIT_FAILURE;
	}

	return result;
}


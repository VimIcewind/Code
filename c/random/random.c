#include <stdio.h>
#include <stdlib.h>
#include <time.h>

int main(int argc, const char *argv[])
{
	srand((unsigned int)time(NULL));

	for (int i = 0; i < 10; i++) {
		int value = rand();
		printf("%d\n", value);
	}
	return 0;
}


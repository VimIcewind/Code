#include <stdio.h>
#include <stdlib.h>

int main(int argc, const char *argv[])
{
	int i, *intptr = NULL;

	intptr = (int*)malloc(sizeof(int) * 16);
	if (NULL == intptr) {
		printf("malloc() error!\n");
		return 0;
	}

	printf("intptr address: 0x%p\n", intptr);
	for (i = 0; i < 16; i++) {
		printf("i=%d %d\n", i, intptr[i]);
	}

	intptr = (int*)realloc(intptr, sizeof(int)*32);
	if (NULL == intptr) {
		printf("realloc() erro!\n");
		return 0;
	}

	printf("intptr address: 0x%p\n", intptr);
	for (i = 0; i < 32; i++) {
		printf("i=%d %d\n", i, intptr[i]);
	}

	free(intptr);

	return 0;
}

#include <stdio.h>

void *say(void *arg)
{
	printf("%s\n", (char *)arg);
	return NULL;
}

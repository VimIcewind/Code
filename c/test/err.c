#include <stdio.h>
#include <string.h>
#include <stdlib.h>

#define ERRO_NUM  132

int main(int argc, char* argv[])
{
	int i;
	for (i = 0; i < ERRO_NUM; i++)
		printf("%d:%s\n", i, strerror(i));
	
	return 0;
}

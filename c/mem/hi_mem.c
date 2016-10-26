#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int main(int argc, const char *argv[])
{
	char *p_str1, *p_str2;

	p_str1 = (char*)malloc(sizeof(char)*32);
	if (NULL == p_str1) {
		printf("p_str1 malloc() error!\n");
		return -1;
	}

	p_str2 = (char*)calloc(32, sizeof(char));
	if (NULL == p_str2) {
		printf("p_str2 calloc() error!\n");
		free(p_str1);
		return -1;
	}

	printf("p_str1 by malloc:\n");
	printf("p_str1: %p\n", p_str1);
	printf("p_str1: %s\n", p_str1);
	printf("p_str1 by calloc:\n");
	printf("p_str2: %p\n", p_str2);
	printf("p_str2: %s\n", p_str2);
	printf("\n");

	strcpy(p_str1,  "This is a simple sentence.");
	strcpy(p_str2, p_str1);

	p_str1 = (char*)realloc(p_str1, sizeof(char)*16);
	if (NULL == p_str1) {
		printf("p_str1 realloc() error!\n");
		free(p_str2);
		return -1;
	}

	p_str2 = (char*)realloc(p_str2, sizeof(char)*128);
	if (NULL == p_str2) {
		printf("p_str2 realloc() error!\n");
		free(p_str1);
		return -1;
	}

	printf("p_str1 after realloced\n");
	printf("p_str1: %p\n", p_str1);
	printf("p_str1: %s\n", p_str1);
	printf("p_str2 after realloced:\n");
	printf("p_str2: %p\n", p_str2);
	printf("p_str2: %s\n", p_str2);
	printf("\n");

	strcat(p_str2, " The second sentence in extra memory after realloced!");

	printf("p_str1: %s\n", p_str1);
	printf("p_str2: %s\n", p_str2);

	free(p_str1);
	free(p_str2);
	return 0;
}

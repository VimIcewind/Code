#include <stdio.h>
#include <errno.h>
#include <string.h>

int main(int argc, char *argv[])
{
	FILE *fp;

	fp = fopen("file.txt", "r");
	if (fp == NULL) {
		fprintf(stderr, "Value of errno: %d\n", errno);
		fprintf(stderr, "Error opening file: %s\n", strerror(errno));
	} else {
		fclose(fp);
	}

	return 0;
}

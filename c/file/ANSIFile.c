#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int main(int argc, const char *argv[])
{
	FILE *fp = NULL;
	char buff[128];
	int readnum = 0, writenum = 0;

	fp = fopen("test.txt", "r+");
	if (NULL == fp) {
		printf("open file fail!\n");
		return -1;
	}

	fseek(fp, -128, SEEK_END);
	readnum = fread(buff, 1, 127, fp);
	printf("read %d bytes!\n", readnum);
	buff[readnum] = '\0';
	printf("%s\n\n", buff);

	fseek(fp, 0, SEEK_SET);
	strcpy(buff, "a string write by ANSIFile!\n");
	writenum = fwrite(buff, 1, strlen(buff), fp);
	printf("%d byte write!\n", writenum);

	fclose(fp);
	return 0;
}

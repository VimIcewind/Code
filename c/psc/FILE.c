#include <stdio.h>

int main(int argc, const char *argv[])
{
	FILE *f = fopen("test.dat", "wb");
	if (f == NULL)
		return -1;
	fwrite("123", 3, 1, f);
	fclose(f);
	return 0;
}

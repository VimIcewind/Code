#include <stdio.h>
#include <stdlib.h>

void dump_crash()
{
	char *pstr = "coredump demo";
	free(pstr);
}

int main(int argc, const char *argv[])
{
	dump_crash();

	return 0;
}

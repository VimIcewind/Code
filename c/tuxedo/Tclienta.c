#include <stdio.h>
#include <string.h>
#include "atmi.h"

int main(void)
{
	char *buf;
	long len;
	int cd;

	if (tpinit((TPINIT *) NULL) == -1) {
		exit(1);
	}
	if ((buf = tpalloc("STRING", NULL, 80)) == NULL) {
		tpterm();
		exit(2);
	}
	strcpy(buf, "Hello world");
	if (cd = tpacall("TOUPPER", buf, len, 0) == -1) {
		fprintf(stderr, "service requst tpacall fail\n");
		tpfree(buf);
		tpterm();
		exit(3);
	}
	if (tpgetrply(&cd, &buf, &len, 0) == -1) {
		fprintf(stderr, "service requst tpgetrply fail\n");
		tpfree(buf);
		tpterm();
		exit(3);
	}
	printf("return string is: %s\n", buf);
	tpfree(buf);
	tpterm();
	exit(0);
}

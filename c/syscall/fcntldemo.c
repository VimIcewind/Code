#include <stdio.h>
#include <stdlib.h>
#include <fcntl.h>
#include <sys/types.h>

int main(int argc, const char *argv[])
{
	int val;

	if (argc != 2) {
		fprintf(stderr, "usage: %s <descriptor#>\n", argv[0]);
		exit(1);
	}
	if ((val = fcntl(atoi(argv[1]), F_GETFL)) < 0) {
		printf("fcntl error for fd %d\n", atoi(argv[1]));
		exit(1);
	}
	switch (val & O_ACCMODE) {
	case O_RDONLY:
		printf("read only");
		break;
	case O_WRONLY:
		printf("write only");
		break;
	case O_RDWR:
		printf("read write");
		break;
	default:
		fputs("invalid access mode\n", stderr);
		exit(1);
	}
	if (val & O_APPEND)
		printf(", append");
	if (val & O_NONBLOCK)
		printf(", noblocking");
	putchar('\n');

	return 0;
}

#include <stdio.h>
#include <string.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <sys/fcntl.h>
#include <unistd.h>

int main(int argc, const char *argv[])
{
	int fd, readnum, writenum;
	char buff[128];

	fd = open("test.txt", O_RDWR);
	if (-1 == fd) {
		printf("open file error!\n");
		return -1;
	}

	lseek(fd, -128, SEEK_END);
	readnum = read(fd, buff, 127);
	printf("%d bytes read!\n", readnum);
	buff[readnum] = '\0';
	printf("%s\n\n", buff);

	lseek(fd, 0, SEEK_SET);
	strcpy(buff, "a string write by POSIXFile!\n");
	writenum = write(fd, buff, strlen(buff));
	printf("%d bytes write!\n", writenum);

	close(fd);
	return 0;
}

#include <unistd.h>

#define BUFSIZE 100

int main(int argc, char *argv[])
{
	char buf[BUFSIZE];
	int n;

	while ((n = read(0, buf, BUFSIZE)) > 0)
		write(1, buf, n);
	return 0;
}

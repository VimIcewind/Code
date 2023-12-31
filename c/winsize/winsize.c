#include <stdio.h>
#include <sys/types.h>
#include <sys/ioctl.h>
#include <unistd.h>
#include <termios.h>

int main(int argc, const char *argv[])
{
	struct winsize size;

	ioctl(STDIN_FILENO, TIOCGWINSZ, &size);
	printf("%d\n", size.ws_row);
	printf("%d\n", size.ws_col);

	return 0;
}

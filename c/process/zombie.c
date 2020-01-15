#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>

int main(int argc, const char *argv[])
{
	pid_t pid = fork();

	if (pid < 0) {
		perror("fork");
		exit(1);
	}
	if (pid > 0) { /* parent */
		while(1);
	}
	/* child */
	return 0;
}

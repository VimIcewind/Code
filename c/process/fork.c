#include <stdio.h>
#include <stdlib.h>
#include <sys/types.h>
#include <unistd.h>

int main(int argc, char *argv[])
{
	pid_t pid;
	char *message;
	int n;
	pid = fork();

	if (pid < 0) {
		perror("fork failed");
	}
	if (pid == 0) {
		message = "This is the child\n";
		n = 6;
	} else {
		message = "This is the parent\n";
		n = 3;
	}

	for (; n > 0; n--) {
		printf("%s",message);
		sleep(1);
	}
	return 0;
}

#include <stdio.h>
#include <signal.h>

int main(int argc, const char *argv[])
{
	struct sigaction sa;
	sa.sa_handler = SIG_IGN;
	sigemptyset(&sa.sa_mask);
	sa.sa_flags = 0;

	sigaction(SIGTTIN, &sa, NULL);
	sigaction(SIGTTOU, &sa, NULL);
	sigaction(SIGHUP, &sa, NULL);


	return 0;
}


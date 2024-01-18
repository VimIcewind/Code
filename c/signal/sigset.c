#include <signal.h>

int main(int argc, const char *argv[])
{
	sigset(SIGTTIN, SIG_IGN);
	sigset(SIGTTOU, SIG_IGN);
	sigset(SIGHUP, SIG_IGN);

	return 0;
}

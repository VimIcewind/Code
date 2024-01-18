#include <signal.h>

int main(int argc, const char *argv[])
{
	signal(SIGTTIN, SIG_IGN);
	signal(SIGTTOU, SIG_IGN);
	signal(SIGHUP, SIG_IGN);

	return 0;
}


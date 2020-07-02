#include <signal.h>

volatile sig_atomic_t a = 0;

int main(int argc, const char *argv[])
{
	/* register a sighandler */
	while (!a); /* wait unitl a changes in sighandler */
	/* do something after signal arrives */
	return 0;
}

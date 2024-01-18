#include <stdio.h>
#include <unistd.h>
#include <pwd.h>

int main(int argc, const char *argv[])
{
	printf("UID: %d\n", getuid());
	printf("%s\n", getpwuid(getuid())->pw_name);
	return 0;
}

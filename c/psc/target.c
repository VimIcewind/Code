/* target.c */
#include <stdio.h>
#include "bfd.h"

int main(int argc, const char *argv[])
{
	const char **t = bfd_target_list();
	while (*t) {
		printf("%s\n", *t);
		t++;
	}
	return 0;
}

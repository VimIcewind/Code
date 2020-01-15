#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>

int main(int argc, const char *argv[])
{
	execlp("ps", "ps", "-o", "pid,ppid,pgrp,session,tpgid,comm", NULL);
	perror("exec ps");
	exit(1);
}

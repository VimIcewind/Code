#include <stdio.h>
#include <setjmp.h>

jmp_buf b;

void f()
{
	longjmp(b, 1);
}

int main(int argc, const char *argv[])
{
	if (setjmp(b)) {
		printf("World!\n");
	}
	else {
		printf("Hello ");
		f();
	}
	return 0;
}

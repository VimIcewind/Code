#include <stdio.h>
#include <limits.h>

int main(int argc, const char *argv[])
{
	int i;
	int flag;

	i = INT_MIN;
	if (-i == ~i + 1) {
		flag = 1;
	} else {
		flag = 0;
	}
	printf("%d\n", flag);

	i = INT_MIN + 1;
	if (-i == ~i + 1) {
		flag = 1;
	} else {
		flag = 0;
	}
	printf("%d\n", flag);

	i = 0;
	if (-i == ~i + 1) {
		flag = 1;
	} else {
		flag = 0;
	}
	printf("%d\n", flag);


	i = INT_MAX;
	if (-i == ~i + 1) {
		flag = 1;
	} else {
		flag = 0;
	}
	printf("%d\n", flag);

	i = INT_MAX - 1;
	if (-i == ~i + 1) {
		flag = 1;
	} else {
		flag = 0;
	}
	printf("%d\n", flag);

	return 0;
}

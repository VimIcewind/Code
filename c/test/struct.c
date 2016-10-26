#include <stdio.h>

struct man {
	char *name;
	unsigned short age;
};

int main(int argc, const char *argv[])
{
	struct man hwd = {
		.name = "HuWeidong",
		.age = 26
	};

	printf("Nmae: %s\nAge: %d", hwd.name, hwd.age);
	
	return 0;
}
